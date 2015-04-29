{if $oField}
    {$maptype=$oConfig->GetValue('plugin.maps.map_type')}
    {include file="`$aTemplatePathPlugin.maps`tpls/fields/customs/maps/`$maptype`/show.tpl" oField=$oField}
{/if}
