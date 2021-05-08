<?php

/**
 * 	\file		admin/numberseries.php
 * 	\ingroup	numberseries
 * 	\brief		This file is an example module setup page
 * 				Put some comments here
 */
// Dolibarr environment
$res=@include("../../main.inc.php");                                // For root directory
if (! $res) $res=@include("../../../main.inc.php");                // For "custom" directory

global $langs, $user;

// Libraries
require_once DOL_DOCUMENT_ROOT . "/core/lib/admin.lib.php";
dol_include_once("/numberseries/lib/numberseries.lib.php");
dol_include_once("/numberseries/class/numberseries.class.php");
dol_include_once("/numberseries/core/modules/facture/mod_facture_numberseries.php");
dol_include_once("/numberseries/core/modules/supplier_invoice/mod_facture_fournisseur_numberseries.php");
dol_include_once("/numberseries/core/modules/commande/mod_commande_numberseries.php");
dol_include_once("/numberseries/core/modules/supplier_order/mod_commande_fournisseur_numberseries.php");
dol_include_once("/numberseries/core/modules/propale/mod_propale_numberseries.php");
require_once DOL_DOCUMENT_ROOT.'/core/class/html.formother.class.php';
// Translations
$langs->load("numberseries@numberseries");
$langs->load("main");
$langs->load("bills");
$langs->load('admin');
$langs->load('errors');

// Access control
if (! $user->admin) 
{
	accessforbidden();
}

// Parameters
$action = GETPOST('action', 'alpha');
$id = GETPOST("id","int");
$cancel = GETPOST("cancel","alpha");

$form = new Form($db);
$object = new Numberseries($db);
/*
 * Actions
 */
if($action == "addserie" && !$cancel){
	
	$ref = GETPOST("ref","alpha");
	$label = GETPOST("label","alpha");
	$typedoc = GETPOST("typedoc","int");
	$error = 0;
	
	if(empty($ref)){
		setEventMessage($langs->trans("ErrorFieldRequired",$langs->trans("Ref")),"errors");
		$error++;
	}
	if(empty($label)){
		setEventMessage($langs->trans("ErrorFieldRequired",$langs->trans("Label")),"errors");
		$error++;
	}
	if($typedoc < 0){
		setEventMessage($langs->trans("ErrorFieldRequired",$langs->trans("TypeDoc")),"errors");
		$error++;
	}
		
	if(empty($error)){
		$object->ref = $ref;
		$object->label = $label;
		$object->typedoc = $typedoc;
		$object->defaultserie = 0;
		
		$res = $object->create($user);
		
		if ($res < 0)
	    {
	    	setEventMessage($object->error,"errors");
	    	$action = "add";
	    }
	    else{
	    	setEventMessage($langs->trans("NumberseriesCreated"));
	    	$action = "editline";
	    	$id = $res;
	    }
	}
	else{
		$action = "add";
	}
	
}
if($action == "editserie" && !$cancel){
	$object->fetch($id);
	$object->fetch_lines();
	
	$label = GETPOST("label","alpha");
	$mask1 = GETPOST("mask1","alpha");
	$mask2 = GETPOST("mask2","alpha");
	$mask3 = GETPOST("mask3","alpha");
	$mask4 = GETPOST("mask4","alpha");
	$error = 0;
	
	if(empty($label)){
		setEventMessage($langs->trans("ErrorFieldRequired",$langs->trans("Label")),"errors");
		$error++;
	}
	if(empty($mask1)){
		setEventMessage($langs->trans("ErrorFieldRequired",$langs->trans("Mask")),"errors");
		$error++;
	}
	if($object->typedoc == 1 && (empty($mask2) || empty($mask3) || empty($mask4))){
		setEventMessage($langs->trans("ErrorFieldRequired",$langs->trans("Mask")),"errors");
		$error++;
	}
	if(empty($error)){
		$object->label = $label;
		$object->update($user);
		
		$line = $object->lines[0];
		
		$line->mask_1 = GETPOST("mask1","alpha");
		
		if($object->typedoc == 1){
			$line->mask_1 = GETPOST("mask1","alpha");
			$line->mask_2 = GETPOST("mask2","alpha");
			$line->mask_3 = GETPOST("mask3","alpha");
			$line->mask_4 = GETPOST("mask4","alpha");
		}
				
		$res = $line->update($user);

		if ($res < 0)
	    {
	    	setEventMessage($object->error,"errors");
	    	$action = "editline";
	    }
	    else{
	    	setEventMessage($langs->trans("NumberseriesUpdated"));
	    	$action = "";
	    }
	}
	else{
		$action = "editline";
	}
}
if ($action == 'confirm_delete' && GETPOST("confirm") == 'yes')
{
	$object->fetch($id);

	$result=$object->delete($user);

	if ($result >= 0)
	{
		setEventMessage("DeleteOK");
	}
	else
	{
		setEventMessage($object->error,'errors');
	}
	$action = "";
}
if($action == "setdefault"){
	
	$object->fetch($id);
	$object->SetAsDefault();
	$action = "";
}
if($cancel){
	$action="";
}

/*
 * View
 */
llxHeader('',$langs->trans('NumberseriesSetup'));

$now=dol_now();
$linkback='<a href="'.DOL_URL_ROOT.'/admin/modules.php">'.$langs->trans("BackToModuleList").'</a>';

$head = numberseriesAdminPrepareHead();

dol_fiche_head($head, 'settings', $langs->trans("Numberseries"), 0, 'bill');

if ($action == 'delete')
	{
		print $form->formconfirm("admin.php?id=".$id,$langs->trans("DeleteNumberseries"),$langs->trans("ConfirmDeleteNumberseries"),"confirm_delete",'','',1);
	}

if($action == "add"){
	print_fiche_titre($langs->trans("Add"),$linkback);
	print '<form action="'.$_SERVER["PHP_SELF"].'" method="post">';
	print '<input type="hidden" name="token" value="'.$_SESSION['newtoken'].'">';
	print '<input type="hidden" name="action" value="addserie">';

	print '<table class="border" width="100%">';
	print '<tr>';
	print '<td>';
	print $langs->trans("Ref");
	print '</td>';
	print '<td>';
	print '<input class="flat" type="text" size="30" name="ref" value=""> ';
	print '</td>';
	print '</tr>';
		
	print '<tr>';
	print '<td>';
	print $langs->trans("Label");
	print '</td>';
	print '<td>';
	print '<input class="flat" type="text" size="30" name="label" value=""> ';
	print '</td>';
	print '</tr>';
		
	print '<tr>';
	print '<td>';
	print $langs->trans("TypeDoc");
	print '</td>';
	print '<td>';
	select_typedoc("typedoc","",2);
	print '</td>';
	print '</tr>';
		
	/*print '<tr>';
	print '<td>';
	print $langs->trans("DefaultSerie");
	print '</td>';
	print '<td>';
	print $form->selectyesno('defaultserie',GETPOST("defaultserie"),1);
	print '</td>';
	print '</tr>';*/
		
	print '</table>';
    	
	print '<br>';
	print '<input type="submit" class="button" value="'.$langs->trans("Add").'">';
	print ' &nbsp; &nbsp; ';
	print '<input type="submit" class="button" name="cancel" value="'.$langs->trans("Cancel").'">';
	print '</form>';
}
else if($action == "editline"){
	$object = new Numberseries($db);
	$object->fetch($id);
	$object->fetch_lines();
	
	
	$mask1 = $object->lines[0]->mask_1;
	$mask2 = $object->lines[0]->mask_2;
	$mask3 = $object->lines[0]->mask_3;
	$mask4 = $object->lines[0]->mask_4;


    print load_fiche_titre($langs->trans("Edit"),$linkback);
	print '<form action="'.$_SERVER["PHP_SELF"].'" method="post">';
	print '<input type="hidden" name="token" value="'.$_SESSION['newtoken'].'">';
	print '<input type="hidden" name="action" value="editserie">';
	print '<input type="hidden" name="id" value="'.$id.'">';

	print '<table class="border" width="100%">';
	print '<tr>';
	print '<td>';
	print $langs->trans("Ref");
	print '</td>';
	print '<td>';
	print $object->ref;
	print '</td>';
	print '</tr>';
		
	print '<tr>';
	print '<td>';
	print $langs->trans("Label");
	print '</td>';
	print '<td>';
	print '<input class="flat" type="text" size="30" name="label" value="'.(GETPOST('label',"alpha")?GETPOST('label',"alpha"):$object->label).'"> ';
	print '</td>';
	print '</tr>';
		
	print '<tr>';
	print '<td>';
	print $langs->trans("TypeDoc");
	print '</td>';
	print '<td>';
	print $object->ShowTypeDoc();
	print '</td>';
	print '</tr>';
		
	print '<tr>';
	print '<td>';
	print $langs->trans("Default");
	print '</td>';
	print '<td>';
	print yn(GETPOST('defaultserie',"int")?GETPOST('defaultserie',"int"):$object->defaultserie);
	print '</td>';
	print '</tr>';
		
	print '</table>';
	
	$tooltip=$langs->trans("GenericMaskCodes",$langs->transnoentities("Invoice"),$langs->transnoentities("Invoice"));
    $tooltip.=$langs->trans("GenericMaskCodes2");
    $tooltip.=$langs->trans("GenericMaskCodes3");
    $tooltip.=$langs->trans("GenericMaskCodes4a",$langs->transnoentities("Invoice"),$langs->transnoentities("Invoice"));
    $tooltip.=$langs->trans("GenericMaskCodes5");
	
    print '<br><br>';
	print '<table class="border" width="100%">';
	print '<tr><td>';
	
	print $langs->trans("Mask").' ('.$langs->trans("NumberseriesDoc".$object->typedoc).'):';
	
	
	print '</td><td >'.$form->textwithpicto('<input type="text" class="flat" size="24" name="mask1" value="'.$mask1.'">',$tooltip,1,1).'</td>';
	print '</tr>';

	if($object->typedoc == 1){
		print '<tr><td>';
		print $langs->trans("Mask").' ('.$langs->trans("InvoiceAvoir").'):';
		print '</td><td>'.$form->textwithpicto('<input type="text" class="flat" size="24" name="mask2" value="'.$mask2.'">',$tooltip,1,1).'</td>';
		print '</tr>';
		print '<tr><td>';
		print $langs->trans("Mask").' ('.$langs->trans("InvoiceReplacement").'):';
		print '</td><td >'.$form->textwithpicto('<input type="text" class="flat" size="24" name="mask3" value="'.$mask3.'">',$tooltip,1,1).'</td>';
		print '</tr>';
		print '<tr><td>';
		print $langs->trans("Mask").' ('.$langs->trans("InvoiceDeposit").'):';
		print '</td><td >'.$form->textwithpicto('<input type="text" class="flat" size="24" name="mask4" value="'.$mask4.'">',$tooltip,1,1).'</td>';
		print '</tr>';
	}
	print '</table>';
    	
	print '<br>';
	print '<input type="submit" class="button" value="'.$langs->trans("Add").'">';
	print ' &nbsp; &nbsp; ';
	print '<input type="submit" class="button" name="cancel" value="'.$langs->trans("Cancel").'">';
	print '</form>';
}	

else if($action != "add"){
	$sortfield = GETPOST("sortfield",'alpha');
	$sortorder = GETPOST("sortorder",'alpha');
	$page = GETPOST("page",'int');
	if ($page == -1) { $page = 0; }
	$offset = $conf->liste_limit * $page;
	$pageprev = $page - 1;
	$pagenext = $page + 1;
	
	if (! $sortfield) $sortfield='n.ref';
	if (! $sortorder) $sortorder='ASC';
	$limit = $conf->liste_limit;

	$sql = 'SELECT n.rowid, n.ref, n.label, n.typedoc, n.defaultserie';
	$sql.= ' FROM '.MAIN_DB_PREFIX.'numberseries as n';
	
	// We'll need this table joined to the select in order to filter by sale
	$sql.= ' WHERE n.entity = '.$conf->entity;
	
	$sql.= ' ORDER BY '.$sortfield.' '.$sortorder;
	
	$nbtotalofrecords = 0;
	if (empty($conf->global->MAIN_DISABLE_FULL_SCANLIST))
	{
		$result = $db->query($sql);
		$nbtotalofrecords = $db->num_rows($result);
	}
	
	
	$sql.= $db->plimit($limit + 1,$offset);
	$result=$db->query($sql);
	
	if ($result)
	{
		$objectstatic=new Numberseries($db);
		$userstatic=new User($db);
		$num = $db->num_rows($result);

        print load_fiche_titre($langs->trans("ListOfNumberSeries"),$linkback);
	 	print_barre_liste("", $page, $_SERVER["PHP_SELF"],$param,$sortfield,$sortorder,'',$num,$nbtotalofrecords);
	
		$i = 0;
		print '<table class="liste" width="100%">';
	
		$moreforfilter='';
	
	 	print '<tr class="liste_titre">';
		print_liste_field_titre($langs->trans('Ref'),$_SERVER["PHP_SELF"],'n.ref','',$param,'',$sortfield,$sortorder);
		print_liste_field_titre($langs->trans('Label'),$_SERVER["PHP_SELF"],'n.label','',$param,'',$sortfield,$sortorder);
		print_liste_field_titre($langs->trans('TypeDoc'),$_SERVER["PHP_SELF"],'n.typedoc','',$param,'',$sortfield,$sortorder);
		print_liste_field_titre($langs->trans('DefaultSerie'),$_SERVER["PHP_SELF"],'n.defaultserie','',$param,'',$sortfield,$sortorder);
		print_liste_field_titre($langs->trans('NextValue'));
		print_liste_field_titre('');
		print "</tr>\n";
	
		$var=true;
		$total=0;
		$subtotal=0;
	
		while ($i < min($num,$limit))
		{
			$objp = $db->fetch_object($result);
			$now = dol_now();
			$var=!$var;
			print '<tr '.$bc[$var?1:0   ].'>';
			print '<td class="nowrap">';
	
			$objectstatic->id = $objp->rowid;
			
			//Ref
			print $objp->ref;
			print '</td>';
	
			//Label
			print '<td class="nobordernopadding nowrap">';
			print $objp->label;
			print '</td>';
	
			// TypeDoc
			print '<td class="nobordernopadding nowrap">';
			print $objectstatic->ShowTypeDoc();
			print "</td>\n";
	
			// Default Serie
			print '<td class="nobordernopadding nowrap">';
	        if ($objp->defaultserie == 1)
	        {
	        	print img_picto($langs->trans("Default"),'on');
	         }
	         else
	         {
				print '<a href="'.$_SERVER["PHP_SELF"].'?action=setdefault&id='.$objp->rowid.'" alt="'.$langs->trans("Default").'">'.img_picto($langs->trans("Disabled"),'off').'</a>';
			}
	        print '</td>';
			
			//Next Value
			if($objp->typedoc == 1){
				$modnumber = new mod_facture_numberseries($db);
			}
			if($objp->typedoc == 2){
				$modnumber = new mod_facture_fournisseur_numberseries($db);
			}
			if($objp->typedoc == 3){
				$modnumber = new mod_commande_numberseries($db);
			}
			if($objp->typedoc == 4){
				$modnumber = new mod_commande_fournisseur_numberseries($db);
			}
			if($objp->typedoc == 5){
				$modnumber = new mod_propale_numberseries($db);
			}
			print '<td class="nobordernopadding nowrap">';
			print $modnumber->getExample($objp->rowid);
			print '</td>';
			
			// Actions
			if ($action != 'editline')
			{
				print '<td align="right">';
				print '<a href="'.$_SERVER["PHP_SELF"].'?action=editline&amp;id='.$objp->rowid.'">';
				print img_edit();
				print '</a>';
				//print '</td>';
			}
				
			if ($action != 'editline')
				{
				//print '<td align="right">';
				print '<a href="'.$_SERVER["PHP_SELF"].'?action=delete&amp;id='.$objp->rowid.'">';
				print img_delete();
				print '</a>';
				print '</td>';
			}
	
			print "</tr>\n";
	
			$i++;
		}
	
		print '</table>';
	
		$db->free($result);
		
		if(empty($action)){
			print "<div class=\"tabsAction\">";
			print '<a class="butAction" href="admin.php?action=add">'.$langs->trans("AddNumberseries").'</a>';
			print "</div>";
		}
	}
	else
	{
		dol_print_error($db);
	}
}

// End of page
llxFooter();
$db->close();
