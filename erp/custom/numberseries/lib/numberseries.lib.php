<?php

/**
 *	\file		lib/mymodule.lib.php
 *	\ingroup	mymodule
 *	\brief		This file is an example module library
 *				Put some comments here
 */

function numberseriesAdminPrepareHead()
{
	global $langs, $conf;

	$langs->load("numberseries@numberseries");

	$h = 0;
	$head = array();

	$head[$h][0] = dol_buildpath("/numberseries/admin/admin.php", 1);
	$head[$h][1] = $langs->trans("Settings");
	$head[$h][2] = 'settings';
	$h++;

	// Show more tabs from modules
	// Entries must be declared in modules descriptor with line
	//$this->tabs = array(
	//	'entity:+tabname:Title:@mymodule:/mymodule/mypage.php?id=__ID__'
	//); // to add new tab
	//$this->tabs = array(
	//	'entity:-tabname:Title:@mymodule:/mymodule/mypage.php?id=__ID__'
	//); // to remove a tab
    $object = null;
	complete_head_from_modules($conf, $langs, $object, $head, $h, 'numberseries');

	return $head;
}

/**
 *  Return a HTML select list of bank accounts
 *
 *  @param  string	$htmlname          	Name of select zone
 *  @param	string	$dictionarytable	Dictionary table
 *  @param	string	$keyfield			Field for key
 *  @param	string	$labelfield			Label field
 *  @param	string	$selected			Selected value
 *  @param  int		$useempty          	1=Add an empty value in list, 2=Add an empty value in list only if there is more than 2 entries.
 *  @param  string  $moreattrib         More attributes on HTML select tag
 * 	@return	void
 */
function select_typedoc($htmlname,$selected='',$useempty=0,$moreattrib='')
{
	global $langs, $conf, $db;

	$langs->load("admin");
	$langs->load("bills");
	
	$i = 1;
	$num = 5;
	print '<select id="select'.$htmlname.'" class="flat selectdictionary" name="'.$htmlname.'"'.($moreattrib?' '.$moreattrib:'').'>';
	if ($useempty == 1 || ($useempty == 2 && $num > 1))
	{
		print '<option value="-1">&nbsp;</option>';
	}

	while ($i <= $num)
	{
		if ($selected == $i)
		{
			print '<option value="'.$i.'" selected="selected">';
		}
		else
		{
			print '<option value="'.$i.'">';
		}
		print $langs->trans("NumberseriesDoc".$i);
		print '</option>';
		$i++;
	}
	print "</select>";
	
}
