<?php

/**
 * \file       htdocs/core/modules/propale/mod_propale_saphir.php
 * \ingroup    propale
 * \brief      File that contains the numbering module rules Saphir
 */

require_once DOL_DOCUMENT_ROOT .'/core/modules/propale/modules_propale.php';


/**
 * Class of file that contains the numbering module rules Saphir
 */
class mod_propale_numberseries extends ModeleNumRefPropales
{
	public $version='dolibarr';		// 'development', 'experimental', 'dolibarr'
    public $error = '';
    public $nom = 'Numberseries';


    /**
     *  Return description of module
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
    public function getExample()
    {
     	global $conf,$langs,$mysoc;

    	$old_code_client=$mysoc->code_client;
    	$old_code_type=$mysoc->typent_code;
    	$mysoc->code_client='CCCCCCCCCC';
    	$mysoc->typent_code='TTTTTTTTTT';
     	$numExample = $this->getNextValue($mysoc,'');
        $object = null;
     	$object->array_options['options_serie'] = (empty($serie)?"":$serie);
		$mysoc->code_client=$old_code_client;
		$mysoc->typent_code=$old_code_type;

		if (! $numExample)
		{
			$numExample = 'NotConfigured';
		}
		return $numExample;
    }

	/**
	 *  Return next value
	 *
	 *  @param	Societe		$objsoc     Object third party
	 * 	@param	Propal		$propal		Object commercial proposal
	 *  @return string      			Value if OK, 0 if KO
	 */
    public function getNextValue($objsoc,$propal)
	{
		global $db,$conf,$langs;

		require_once DOL_DOCUMENT_ROOT .'/core/lib/functions2.lib.php';
		dol_include_once("/numberseries/class/numberseries.class.php");

		// Get Mask value
        $mask = '';
        $serie = new Numberseries($db);
        $serie_id = $propal->array_options['options_serie'];
        if(empty($serie_id)){
        	$serie_id = $serie->getDefault(5);
        }
        
        $serie->fetch($serie_id);
        $serie->fetch_lines();
        
        $mask=$serie->lines[0]->mask_1;

		if (! $mask)
		{
			$this->error='NotConfigured';
			return 0;
		}

		$date=$propal->date;
		$customercode=$objsoc->code_client;
		$numFinal=get_next_value($db,$mask,'propal','ref','',$objsoc,$date);
        if($numFinal === 'ErrorBadMask') $numFinal = $langs->trans($numFinal);

		return  $numFinal;
	}

}
