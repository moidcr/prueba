<?php

/**
 *	\file       /numberseries/core/modules/facture/mod_facture_numberseries.php
 *	\ingroup    facture
 *	\brief      File containing class for numbering module Numberseries
 */
require_once DOL_DOCUMENT_ROOT .'/core/modules/facture/modules_facture.php';

/**
 *	\class      mod_facture_mercure
 *	\brief      Classe du modele de numerotation de reference de facture Mercure
 */
class mod_facture_numberseries extends ModeleNumRefFactures
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
     *  Return an example of number value
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
        $facture = null;
        $facture->array_options['options_serie'] = (empty($serie)?"":$serie);
        $numExample = $this->getNextValue($mysoc,$facture);
        $mysoc->code_client=$old_code_client;
        $mysoc->typent_code=$old_code_type;

        if (! $numExample)
        {
            $numExample = 'NotConfigured';
        }
        return $numExample;
    }

    /**
     * Return next value
     *
     * @param	Societe		$objsoc     Object third party
     * @param   Facture		$facture	Object invoice
     * @param   string		$mode       'next' for next value or 'last' for last value
     * @return  string      			Value if OK, 0 if KO
     */
    public function getNextValue($objsoc,$facture,$mode='next')
    {
        global $db,$conf, $langs;

        require_once DOL_DOCUMENT_ROOT .'/core/lib/functions2.lib.php';
        dol_include_once("/numberseries/class/numberseries.class.php");

        // Get Mask value
        $mask = '';
        $serie = new Numberseries($db);
        $serie_id = $facture->array_options['options_serie'];
        if(empty($serie_id)){
        	$serie_id = $serie->getDefault(1);
        }
        
        $serie->fetch($serie_id);
        $serie->fetch_lines();
        
        if (is_object($facture) && $facture->type == 1) 
        {
        	$mask=$serie->lines[0]->mask_3;
        	if (! $mask)
        	{
        		$mask=$serie->lines[0]->mask_1;
        	}
        }
        else if (is_object($facture) && $facture->type == 2) $mask=$serie->lines[0]->mask_2;
		else if (is_object($facture) && $facture->type == 3) $mask=$serie->lines[0]->mask_4;
        else $mask=$serie->lines[0]->mask_1;
        if (! $mask)
        {
            $this->error='NotConfigured';
            return 0;
        }

        $where='';
        //if ($facture->type == 2) $where.= " AND type = 2";
        //else $where.=" AND type != 2";

        $refDoli9or10 = null;
        if(version_compare(DOL_VERSION, 10.0) >= 0){
            $refDoli9or10 = 'ref';
        } else {
            $refDoli9or10 = 'facnumber';
        }

        $numFinal=get_next_value($db,$mask,'facture',$refDoli9or10,$where,$objsoc,$facture->date,$mode);
        if($numFinal === 'ErrorBadMask') $numFinal = $langs->trans($numFinal);
        if (! preg_match('/([0-9])+/',$numFinal)) $this->error = $numFinal;

        return  $numFinal;
    }


    /**
     * Return next free value
     *
     * @param	Societe		$objsoc     	Object third party
     * @param	string		$objforref		Object for number to search
     * @param   string		$mode       	'next' for next value or 'last' for last value
     * @return  string      				Next free value
     */
    public function getNumRef($objsoc,$objforref,$mode='next')
    {
        return $this->getNextValue($objsoc,$objforref,$mode);
    }

}
