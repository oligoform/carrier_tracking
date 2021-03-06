[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
<!--
window.onload = function ()
{
    [{ if $updatelist == 1}]
        top.oxid.admin.updateList('[{ $oxid }]');
    [{ /if}]
    var oField = top.oxid.admin.getLockTarget();
    oField.onchange = oField.onkeyup = oField.onmouseout = top.oxid.admin.unlockSave;
}

function DeletePic( sField )
{
    var oForm = document.getElementById("myedit");
    oForm.fnc.value="deletePicture";
    oForm.masterPicField.value=sField;
    oForm.submit();
}

//-->
</script>

<form name="transfer" id="transfer" action="[{$oViewConf->getSelfLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="oxid" value="[{$oxid}]">
    <input type="hidden" name="cl" value="carrier_main">
    <input type="hidden" name="language" value="[{$actlang}]">
</form>

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<form name="myedit" id="myedit" enctype="multipart/form-data" action="[{$oViewConf->getSelfLink()}]" method="post">
<input type="hidden" name="MAX_FILE_SIZE" value="[{$iMaxUploadFileSize}]">
[{$oViewConf->getHiddenSid()}]
<input type="hidden" name="cl" value="carrier_main">
<input type="hidden" name="fnc" value="">
<input type="hidden" name="oxid" value="[{$oxid}]">
<input type="hidden" name="editval[oxcarriers__oxid]" value="[{$oxid}]">
<input type="hidden" name="language" value="[{$actlang}]">
<input type="hidden" name="masterPicField" value="">

[{if $oViewConf->isAltImageServerConfigured() }]
    <div class="warning">[{oxmultilang ident="ALTERNATIVE_IMAGE_SERVER_NOTE"}] [{oxinputhelp ident="HELP_ALTERNATIVE_IMAGE_SERVER_NOTE"}]</div>
[{/if}]

<table border="0" width="98%">
<tr>
    <td valign="top" class="edittext">

        <table cellspacing="0" cellpadding="0" border="0">
        [{block name="admin_carrier_main_form"}]
        <tr>
            <td class="edittext" width="120">
            [{oxmultilang ident="GENERAL_ACTIVE"}]
            </td>
            <td class="edittext" colspan="2">
            <input class="edittext" type="checkbox" name="editval[oxcarriers__oxactive]" value='1' [{if $edit->oxcarriers__oxactive->value == 1}]checked[{/if}] [{$readonly}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            [{oxmultilang ident="GENERAL_TITLE"}]
            </td>
            <td class="edittext" colspan="2">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxcarriers__oxtitle->fldmax_length}]" id="oLockTarget" name="editval[oxcarriers__oxtitle]" value="[{$edit->oxcarriers__oxtitle->value}]" [{$readonly}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            [{oxmultilang ident="GENERAL_SHORTDESC"}]
            </td>
            <td class="edittext" colspan="2">
            <input type="text" class="editinput" size="40" maxlength="[{$edit->oxcarriers__oxshortdesc->fldmax_length}]" name="editval[oxcarriers__oxshortdesc]" value="[{$edit->oxcarriers__oxshortdesc->value}]" [{$readonly}]>
            </td>
        </tr>
		 <tr>
            <td class="edittext">
            [{oxmultilang ident="GENERAL_URL"}]
            </td>
            <td class="edittext" colspan="2">
            <input type="text" class="editinput" size="70" maxlength="[{$edit->oxcarriers__oxcarrierurl->fldmax_length}]" name="editval[oxcarriers__oxcarrierurl]" value="[{$edit->oxcarriers__oxcarrierurl->value}]" [{$readonly}]>
            </td>
        </tr>
        <tr>
            <td class="edittext">
            [{oxmultilang ident="GENERAL_SORT"}]
            </td>
            <td class="edittext" colspan="2">
            <input type="text" class="editinput" size="5" maxlength="[{$edit->oxcarriers__oxsort->fldmax_length}]" name="editval[oxcarriers__oxsort]" value="[{$edit->oxcarriers__oxsort->value}]" [{$readonly}]>
            </td>
        </tr>

        <tr>
            <td class="edittext">
                [{ oxmultilang ident="GENERAL_ICON" }]
            </td>
            <td class="edittext">
                <input type="text" class="editinput" size="40" maxlength="[{$edit->oxcarriers__oxicon->fldmax_length}]" name="editval[oxcarriers__oxicon]" value="[{$edit->oxcarriers__oxicon->value}]" [{ $readonly }]>
                [{ oxinputhelp ident="HELP_GENERAL_ICON" }]
            </td>
            <td class="edittext">
                [{ if (!($edit->oxcarriers__oxicon->value=="nopic.jpg" || $edit->oxcarriers__oxicon->value=="" || $edit->oxcarriers__oxicon->value=="nopic_ico.jpg")) }]
                    <a href="Javascript:DeletePic('oxicon');" class="delete left" [{include file="help.tpl" helpid=item_delete}]></a>
                [{/if}]
            </td>
        </tr>

        <tr>
            <td class="edittext">
                [{ oxmultilang ident="MANUFACTURER_MAIN_ICONUPLOAD" }] ([{ oxmultilang ident="GENERAL_MAX_FILE_UPLOAD"}] [{$sMaxFormattedFileSize}], [{ oxmultilang ident="GENERAL_MAX_PICTURE_DIMENSIONS"}]):<br>
            </td>
            <td class="edittext" colspan="2">
                <input class="editinput" size="40" name="myfile[CARICO@oxcarriers__oxicon]" type="file" [{ $readonly }]>
                [{ oxinputhelp ident="HELP_MANUFACTURER_MAIN_ICONUPLOAD" }]
            </td>
        </tr>

        [{/block}]

        [{if $oxid != "-1"}]
        <tr>
            <td class="edittext">
            </td>
            <td class="edittext" colspan="2"><br>
                [{include file="language.tpl"}]
            </td>
        </tr>
        [{/if}]
        <tr>
            <td class="edittext"><br><br>
            </td>
            <td class="edittext" colspan="2"><br><br>
                <input type="submit" class="edittext" id="oLockButton" name="saveCarrier" value="[{oxmultilang ident="GENERAL_SAVE"}]" onClick="Javascript:document.myedit.fnc.value='save'" [{$readonly}] [{if !$edit->oxcarriers__oxtitle->value && !$oxparentid}]disabled[{/if}]><br>
            </td>
        </tr>

        </table>
    </td>
  </tr>
</table>

</form>

[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]
