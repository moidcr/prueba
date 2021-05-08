<?php

/**
 * \file       htdocs/core/modules/commande/mod_commande_saphir.php
 * \ingroup    commande
 * \brief      Fichier contenant la classe du modele de numerotation de reference de commande Saphir
 */

require_once DOL_DOCUMENT_ROOT .'/core/modules/commande/modules_commande.php';


/**
 *	Class to manage customer order numbering rules Saphir
 */
class mod_commande_numberseries extends ModeleNumRefCommandes
{
	public $version='dolibarr';		// 'development', 'experimental', 'dolibarr'
	public $error = '';
	public $nom = 'Numberseries';


    /**
     *  Renvoi la description du modele de numerotation
     *
     *  @return     string      Texte descripif
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
	 * 	Return next free value
	 *
	 *  @param	Societe		$objsoc     Object thirdparty
	 *  @param  Object		$object		Object we need next value for
	 *  @return string      			Value if KO, <0 if KO
	 */
    public function getNextValue($objsoc,$object)
    {
		global $db,$conf, $langs;

		require_once DOL_DOCUMENT_ROOT .'/core/lib/functions2.lib.php';
		dol_include_once("/numberseries/class/numberseries.class.php");

   		// Get Mask value
        $mask = '';
        $serie = new Numberseries($db);
        $serie_id = $object->array_options['options_serie'];
        if(empty($serie_id)){
        	$serie_id = $serie->getDefault(3);
        }
        
        $serie->fetch($serie_id);
        $serie->fetch_lines();
        
        $mask=$serie->lines[0]->mask_1;

		if (! $mask)
		{
			$this->error='NotConfigured';
			return 0;
		}

		$numFinal=get_next_value($db,$mask,'commande','ref','',$objsoc,$object->date);
        if($numFinal === 'ErrorBadMask') $numFinal = $langs->trans($numFinal);

		return  $numFinal;
	}


	/**
	 *  Return next free value
	 *
	 *  @param	Societe		$objsoc     Object third party
	 * 	@param	string		$objforref	Object for number to search
	 *  @return string      			Next free value
     */
    public function commande_get_num($objsoc,$objforref)
    {
        return $this->getNextValue($objsoc,$objforref);
    }

}

