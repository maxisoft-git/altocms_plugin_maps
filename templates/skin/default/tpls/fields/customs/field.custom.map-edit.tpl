{if $oField}
    {$field_id=$oField->getFieldId()}
    {$maptype=$oConfig->GetValue('plugin.maps.map_type')}
    {include file="`$aTemplatePathPlugin.maps`tpls/fields/customs/maps/`$maptype`/edit.tpl" oField=$oField}
{/if}
