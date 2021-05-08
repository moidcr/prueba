<?php

/**
 *	\file       htdocs/core/modules/supplier_order/mod_commande_fournisseur_orchidee.php
 *	\ingroup    commande
 *	\brief      Fichier contenant la classe du modele de numerotation de reference de commande fournisseur Orchidee
 */

require_once DOL_DOCUMENT_ROOT .'/core/modules/supplier_order/modules_commandefournisseur.php';


/**
 *	Classe du modele de numerotation de reference de commande fournisseur Orchidee
 */
class mod_commande_fournisseur_numberseries extends ModeleNumRefSuppliersOrders
{
	public $version='dolibarr';		// 'development', 'experimental', 'dolibarr'
    public $error = '';
    public $nom = 'Numberseries';


    /**
     *  Renvoi la description du modele de numerotation
     *
     * 	@return     string      Texte descripif
     */
	public function info()
    {
    	global $conf,$langs;

        $langs->load("bills");
        $langs->load("numberseries@numberseries");

        $urlMod = dol_buildpath("/numberseries/admin/admin.php",1);
        $texte = $langs->trans("GoToNumberseriesConf",$urlMod);
        
        return $texte;
    }

    /**
     *  Renvoi un exemple de numerotation
     *
     *  @return     string      Example
     */
    public function getExample($serie="")
    {
    	global $conf,$langs,$mysoc;

    	$old_code_client=$mysoc->code_client;
    	$old_code_type=$mysoc->typent_code;
    	$mysoc->code_client='CCCCCCCCCC';
    	$mysoc->typent_code='TTTTTTTTTT';
        $object = null;
    	$object->array_options['options_serie'] = (empty($serie)?"":$serie);
    	$numExample = $this->getNextValue($mysoc,'');
		$mysoc->code_client=$old_code_client;
		$mysoc->typent_code=$old_code_type;

		if (! $numExample)
		{
			$numExample = $langs->trans('NotConfigured');
		}
		return $numExample;
    }

	/**
	 *  Return next value
	 *
	 *  @param	Societe		$objsoc     Object third party
	 *  @param  Object	    $object		Object
     *  @return string      			Value if OK, 0 if KO
	*/
    public function getNextValue($objsoc=0,$object='')
    {
		global $db,$conf ,$langs;

		require_once DOL_DOCUMENT_ROOT .'/core/lib/functions2.lib.php';
		dol_include_once("/numberseries/class/numberseries.class.php");

    	// Get Mask value
        $mask = '';
        $serie = new Numberseries($db);
        $serie_id = $object->array_options['options_serie'];
        if(empty($serie_id)){
        	$serie_id = $serie->getDefault(4);
        }
        
        $serie->fetch($serie_id);
        $serie->fetch_lines();
        
        $mask=$serie->lines[0]->mask_1;

		if (! $mask)
		{
			$this->error='NotConfigured';
			return 0;
		}

		$numFinal=get_next_value($db,$mask,'commande_fournisseur','ref','',$objsoc,$object->date_commande);
        if($numFinal === 'ErrorBadMask') $numFinal = $langs->trans($numFinal);

		return  $numFinal;
	}


    /**
     *  Renvoie la reference de commande suivante non utilisee
     *
	 *  @param	Societe		$objsoc     Object third party
	 *  @param  Object	    $object		Object
     *  @return string      			Texte descripif
     */
    public function commande_get_num($objsoc=0,$object='')
    {
        return $this->getNextValue($objsoc,$object);
    }
}

