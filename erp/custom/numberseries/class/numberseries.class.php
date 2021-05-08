<?php

/**
 * 	\file		class/numberseries.class.php
 * 	\ingroup	numberseries
 * 	\brief		This file is an example CRUD class file (Create/Read/Update/Delete)
 * 				Put some comments here
 */
// Put here all includes required by your class file
//require_once DOL_DOCUMENT_ROOT."/core/class/commonobject.class.php";
//require_once DOL_DOCUMENT_ROOT."/societe/class/societe.class.php";
//require_once DOL_DOCUMENT_ROOT."/product/class/product.class.php";

/**
 * Put your class' description here
 */
class Numberseries extends CommonObject
{

	var $db; //!< To store db handler
	var $error; //!< To return error code (or message)
	var $errors = array(); //!< To return several error codes (or messages)
	var $element='numberseries';	//!< Id that identify managed objects
	var $table_element='numberseries';	//!< Name of table without prefix where object is stored
	var $table_element_line = 'numberseries_det';
	var $id;
	var $ref;
	var $label;
	var $typedoc; // 1=Customer Invoice, 2=Supplier Invoice, 3=Order, 4=Supplier Order, 5=Proposal
	var $defaultserie;
	
	/**
	 * Constructor
	 *
	 * 	@param	DoliDb		$db		Database handler
	 */
	public function Numberseries($db)
	{
		$this->db = $db;

		return 1;
	}

	/**
	 * Create object into database
	 *
	 * 	@param		User	$user		User that create
	 * 	@return		int					<0 if KO, Id of created object if OK
	 */
	public function create($user)
	{
		global $conf, $langs;
		$error = 0;

		// Clean parameters
		if (isset($this->ref))
		{
			$this->ref = trim($this->ref);
		}
		if (isset($this->label))
		{
			$this->label = trim($this->label);
		}

		// Check parameters
		if (! empty($this->ref))	// We check that ref is not already used
		{
			$result=self::isExistingObject($this->element, 0, $this->ref);	// Check ref is not yet used
			if ($result > 0)
			{
				$this->error='ErrorRefAlreadyExists';
				dol_syslog(__METHOD__ .$this->error,LOG_WARNING);
				$this->db->rollback();
				return -1;
			}
		}
		
	 	// Insert request
		$sql = "INSERT INTO " . MAIN_DB_PREFIX . $this->table_element."(";
		
		$sql.= " ref,";
		$sql.= " entity,";
		$sql.= " label,";
		$sql.= " typedoc,";
		$sql.= " defaultserie";

		$sql.= ") VALUES (";
		$sql.= " '" . $this->ref . "',";
		$sql.= $conf->entity.",";
		$sql.= " '" . $this->label . "',";
		$sql.= " " . $this->typedoc . ",";
		$sql.= " " . $this->defaultserie;

		$sql.= ")";

		$this->db->begin();

		dol_syslog(__METHOD__ . " sql=" . $sql, LOG_DEBUG);
		$resql = $this->db->query($sql);
		if (! $resql)
		{
			$error ++;
			$this->errors[] = "Error " . $this->db->lasterror();
		}

		if (! $error)
		{
			$this->id = $this->db->last_insert_id(MAIN_DB_PREFIX . $this->table_element);
		}

		// Commit or rollback
		if ($error)
		{
			foreach ($this->errors as $errmsg)
			{
				dol_syslog(__METHOD__ . " " . $errmsg, LOG_ERR);
				$this->error.=($this->error ? ', ' . $errmsg : $errmsg);
			}
			$this->db->rollback();

			return -1 * $error;
		}
		else
		{
			$this->db->commit();
			
			$sql = "SELECT count(rowid) as nb";
			$sql.= " FROM ".MAIN_DB_PREFIX . $this->table_element;
			$sql.= " WHERE typedoc = " .$this->typedoc;
			$sql.= " AND entity =".$conf->entity;
       
			$resql=$this->db->query($sql);
			if ($resql)
			{
				$obj = $this->db->fetch_object($resql);
				if($obj->nb==1)
				{
					$this->SetAsDefault();
				}
			}
			$this->db->free($resql);

			$line = new NumberseriesDet($this->db);
			$line->fk_serie = $this->id;
			$line->insert();

			return $this->id;
		}
	}

	/**
	 * Load object in memory from database
	 *
	 * 	@param		int		$id	Id object
	 * 	@return		int			<0 if KO, >0 if OK
	 */
	public function fetch($id)
	{
		global $langs;
		$sql = "SELECT";
		$sql.= " t.rowid,";
		$sql.= " t.ref,";
		$sql.= " t.label,";
		$sql.= " t.typedoc,";
		$sql.= " t.defaultserie";
		$sql.= " FROM " . MAIN_DB_PREFIX . $this->table_element." as t";
		$sql.= " WHERE t.rowid = " . $id;

		dol_syslog(__METHOD__ . " sql=" . $sql, LOG_DEBUG);
		$resql = $this->db->query($sql);
		if ($resql)
		{
			if ($this->db->num_rows($resql))
			{
				$obj = $this->db->fetch_object($resql);

				$this->id = $obj->rowid;
				$this->ref = $obj->ref;
				$this->label = $obj->label;
				$this->typedoc = $obj->typedoc;
				$this->defaultserie = $obj->defaultserie;
				
			}
			$this->db->free($resql);

			return 1;
		}
		else
		{
			$this->error = "Error " . $this->db->lasterror();
			dol_syslog(__METHOD__ . " " . $this->error, LOG_ERR);

			return -1;
		}
	}
	
   /**
     *	Load array lines
     *
     *	@return		int						<0 if KO, >0 if OK
     */
    public function fetch_lines()
    {
        $this->lines=array();

        $sql = "SELECT"; 
        $sql.= " rowid,";
        $sql.= " mask_1,";
		$sql.= " mask_2,";
		$sql.= " mask_3,";
		$sql.= " mask_4";
		$sql.= ' FROM '.MAIN_DB_PREFIX.$this->table_element_line;
        $sql.= ' WHERE fk_serie = '.$this->id;
       

        dol_syslog(__METHOD__." sql=".$sql,LOG_DEBUG);
        $result = $this->db->query($sql);
        if ($result)
        {
            $num = $this->db->num_rows($result);

            $i = 0;
            while ($i < $num)
            {
                $objp = $this->db->fetch_object($result);

                $line = new NumberseriesDet($this->db);

                $line->id               	= $objp->rowid;
                $line->mask_1 				= $objp->mask_1;
				$line->mask_2				= $objp->mask_2;
				$line->mask_3 				= $objp->mask_3;
				$line->mask_4				= $objp->mask_4;
				                
                $this->lines[$i] = $line;

                $i++;
            }
            $this->db->free($result);

            return 1;
        }
        else
        {
            $this->error=$this->db->error();
            dol_syslog('NumberSeries::fetch_lines: Error '.$this->error, LOG_ERR);
            return -3;
        }
    }

	/**
	 * Update object into database
	 *
	 * 	@param		User	$user		User that modify
	 * 	@return		int					<0 if KO, >0 if OK
	 */
	public function update($user = 0)
	{
		global $conf, $langs;
		$error = 0;

		// Clean parameters
		if (isset($this->label))
		{
			$this->label = trim($this->label);
		}
		if (isset($this->ref))
		{
			$this->ref = trim($this->ref);
		}
		
		// Update request
		$sql = "UPDATE " . MAIN_DB_PREFIX . $this->table_element." SET";
		$sql.= " ref=" . (isset($this->ref) ? "'" . $this->db->escape($this->ref) . "'" : "''") . ",";
		$sql.= " label=" . (isset($this->label) ? "'" . $this->db->escape($this->label) . "'" : "''") . ",";
        $sql.= " typedoc=" . (isset($this->typedoc) ? "'" . $this->db->escape($this->typedoc) . "'" : "''") . ",";
		$sql.= " defaultserie=" . (isset($this->defaultserie) ? "'" . $this->db->escape($this->defaultserie) . "'" : "''");
				
		$sql.= " WHERE rowid=" . $this->id;

		$this->db->begin();

		dol_syslog(__METHOD__ . " sql=" . $sql, LOG_DEBUG);
		$resql = $this->db->query($sql);
		if (! $resql)
		{
			$error ++;
			$this->errors[] = "Error " . $this->db->lasterror();
		}

		// Commit or rollback
		if ($error)
		{
			foreach ($this->errors as $errmsg)
			{
				dol_syslog(__METHOD__ . " " . $errmsg, LOG_ERR);
				$this->error.=($this->error ? ', ' . $errmsg : $errmsg);
			}
			$this->db->rollback();

			return -1 * $error;
		}
		else
		{
			$this->db->commit();

			return 1;
		}
	}

	/**
	 * Delete object in database
	 *
	 * 	@param		User	$user		User that delete
	 * 	@param		int		$notrigger	0=launch triggers after, 1=disable triggers
	 * 	@return		int					<0 if KO, >0 if OK
	 */
	public function delete($user)
	{
		global $conf, $langs;
		$error = 0;

		$this->db->begin();
		
		$sql = "DELETE FROM ".MAIN_DB_PREFIX.$this->table_element_line." WHERE fk_serie = ".$this->id;
        dol_syslog(__METHOD__ . " sql=".$sql);
        
        if (! $this->db->query($sql) )
        
        {
        	dol_syslog(__METHOD__ . "::delete error", LOG_ERR);
        	$this->errors[] = "Error " . $this->db->lasterror();
        	$error++;
        }
		
		
		$sql = "DELETE FROM " . MAIN_DB_PREFIX  . $this->table_element;
		$sql.= " WHERE rowid=" . $this->id;

		dol_syslog(__METHOD__ . " sql=" . $sql);
		$resql = $this->db->query($sql);
		if (! $resql)
		{
			$error ++;
			$this->errors[] = "Error " . $this->db->lasterror();
		}
		
		// Commit or rollback
		if ($error)
		{
			foreach ($this->errors as $errmsg)
			{
				dol_syslog(__METHOD__ . " " . $errmsg, LOG_ERR);
				$this->error.=($this->error ? ', ' . $errmsg : $errmsg);
			}
			$this->db->rollback();

			return -1 * $error;
		}
		else
		{
			$this->db->commit();

			return 1;
		}
	}

	/**
	 * Set a numbering as default
	 *
	 * 	@return		void
	 */
	public function SetAsDefault()
	{
		global $conf;
		
		$this->db->begin();
		$sql = "UPDATE " . MAIN_DB_PREFIX  . $this->table_element;
		$sql.= " SET defaultserie=0";
		$sql.= " WHERE typedoc=".$this->typedoc;
		$sql.= " AND entity=".$conf->entity;

		dol_syslog(__METHOD__ . " sql=" . $sql);
		$resql = $this->db->query($sql);
		if (! $resql)
		{
			$this->errors[] = "Error " . $this->db->lasterror();
			$this->db->rollback();
			return -1;
		}
		else
		{
			$sql = "UPDATE " . MAIN_DB_PREFIX  . $this->table_element;
			$sql.= " SET defaultserie=1";
			$sql.= " WHERE rowid=".$this->id;
			
			dol_syslog(__METHOD__ . " sql=" . $sql);
			$resql = $this->db->query($sql);
			if (! $resql)
			{
				$this->errors[] = "Error " . $this->db->lasterror();
				$this->db->rollback();
				return -1;
			}
			else
			{
				$this->db->commit();
				return 1;
			}
			
		}

	}
	
	/**
	 * Show TypeDoc of serie
	 *
	 * 	@return		void
	 */
	public function ShowTypeDoc()
	{
		global $langs;
		$this->db->begin();
		$sql = "SELECT";
		$sql.= " t.typedoc";
		$sql.= " FROM " . MAIN_DB_PREFIX . $this->table_element." as t";
		$sql.= " WHERE t.rowid = " . $this->id;

		dol_syslog(__METHOD__ . " sql=" . $sql);
		$resql = $this->db->query($sql);
		if (! $resql)
		{
			$this->errors[] = "Error " . $this->db->lasterror();
			$this->db->rollback();
			return -1;
		}
		else
		{
			$obj = $this->db->fetch_object($resql);
			
			$type = $langs->trans("NumberseriesDoc".$obj->typedoc);
			
			return $type;
		}

	}
	
/**
	 * Get Default serie of typedoc
	 *
	 * 	@return		void
	 */
	public function getDefault($type)
	{
		global $conf;
		$this->db->begin();
		$sql = "SELECT";
		$sql.= " t.rowid";
		$sql.= " FROM " . MAIN_DB_PREFIX . $this->table_element." as t";
		$sql.= " WHERE t.typedoc = " . $type ." AND t.defaultserie = 1";
		$sql.= " AND entity = ".$conf->entity;

		dol_syslog(__METHOD__ . " sql=" . $sql);
		$resql = $this->db->query($sql);
		if (! $resql)
		{
			$this->errors[] = "Error " . $this->db->lasterror();
			$this->db->rollback();
			return -1;
		}
		else
		{
			$obj = $this->db->fetch_object($resql);
			$this->db->commit();
			$id = $obj->rowid;
			return $id;
		}

	}
}

class NumberseriesDet
{
	var $db;
	var $error;

	public $element='numberseries_det';
	public $table_element='numberseries_det';
	
	public $id;
	public $fk_serie;
	public $mask_1;
	public $mask_2;
	public $mask_3;
	public $mask_4;
	
	public function __construct($db)
    {
        $this->db= $db;
    }
    
	public function fetch($rowid)
    {
		$sql = "SELECT rowid, fk_serie, ";
		$sql.= "mask_1, mask_2, mask_3, mask_4,"; 
		   
        $sql.= " FROM ".MAIN_DB_PREFIX.$this->table_element;
        $sql.= " WHERE rowid = ".$rowid;
        
        $result = $this->db->query($sql);
        if ($result)
        {
            $objp = $this->db->fetch_object($result);
            $this->rowid            		= $objp->rowid;
            $this->fk_serie  				= $objp->fk_serie;
            $this->mask_1   				= $objp->mask_1;
            $this->mask_2        			= $objp->mask_2;
            $this->mask_3       		   	= $objp->mask_3;
            $this->mask_4		         	= $objp->mask_4;
                     
            $this->db->free($result);
        }
        else
        {
            dol_print_error($this->db);
        }
    }
    
    /**
     * 	Delete line in database
     *
     *	@return	 int  <0 si ko, >0 si ok
     */
    public function delete()
    {
        global $conf, $user, $langs;

		$error=0;

	    $this->db->begin();

        $sql = "DELETE FROM ".MAIN_DB_PREFIX.$this->table_element." WHERE rowid='".$this->rowid."';";

        dol_syslog(__METHOD__." sql=".$sql);
        $resql=$this->db->query($sql);
        if ($resql)
        {
			$this->db->commit();
			return 1;
		}
        else
        {
            $this->error=$this->db->lasterror();
            dol_syslog(__METHOD__ ." Error: ".$this->error, LOG_ERR);
            return -1;
        }
    }
    
   /**
     *	Insert line into database
     *
     *	@return		int						<0 if KO, >0 if OK
     */
    public function insert()
    {
        global $langs, $conf, $user;

		$error=0;

        $this->db->begin();

        // Insertion dans base de la ligne
		$sql = "INSERT INTO ".MAIN_DB_PREFIX.$this->table_element. "("; 
		$sql.= " fk_serie,";
		$sql.= " mask_1,";
		$sql.= " mask_2,";
		$sql.= " mask_3,";
		$sql.= " mask_4";
				
	    
        $sql.= ") VALUES (";

        $sql.= " '".$this->fk_serie."',";
    	$sql.= " '".$this->mask_1."',"; 
   		$sql.= " '".$this->mask_2."',"; 
    	$sql.= " '".$this->mask_3."',";
		$sql.= " '".$this->mask_4."'";
        $sql.= ')';

        dol_syslog(__METHOD__ ." sql=".$sql, LOG_DEBUG);
        $resql=$this->db->query($sql);
        if ($resql)
        {
			$this->rowid=$this->db->last_insert_id(MAIN_DB_PREFIX.$this->table_element);
			$this->db->commit();
			return 1;
		}

        else
        {
            $this->error=$this->db->error();
            dol_syslog(get_class($this)."::insert Error ".$this->error, LOG_ERR);
            $this->db->rollback();
            return -2;
        }
    }
    
    
   /**
     *  Update object into database
     *
     *  @param	User	$user        User that modifies
     *  @param  int		$notrigger	 0=launch triggers after, 1=disable triggers
     *  @return int     		   	 <0 if KO, >0 if OK
     */
    public function update($user=0, $notrigger=0)
    {
    	global $conf, $langs;
		$error=0;

        // Update request
		$sql = "UPDATE ".MAIN_DB_PREFIX.$this->table_element." SET";
		$sql.= " mask_1=".(isset($this->mask_1)?"'".$this->db->escape($this->mask_1)."'":"''").",";
		$sql.= " mask_2=".(isset($this->mask_2)?"'".$this->db->escape($this->mask_2)."'":"''").",";
		$sql.= " mask_3=".(isset($this->mask_3)?"'".$this->db->escape($this->mask_3)."'":"''").",";		
		$sql.= " mask_4=".(isset($this->mask_4)?"'".$this->db->escape($this->mask_4)."'":"''");		
        $sql.= " WHERE rowid=".$this->id;

		$this->db->begin();

		dol_syslog(__METHOD__." sql=".$sql, LOG_DEBUG);
        $resql = $this->db->query($sql);
    	
    	if (! $resql)
    	{
    		$error++; 
    		$this->errors[]="Error ".$this->db->lasterror();
    		$this->db->rollback();
    		return -1;
    	}
		else
		{
			$this->db->commit();
			return 1;
		}
    }
}