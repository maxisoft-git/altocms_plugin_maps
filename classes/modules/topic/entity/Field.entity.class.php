<?php

    class PluginMaps_ModuleTopic_EntityField extends PluginMaps_Inherit_ModuleTopic_EntityField
    {
        public function getCoord($obj, $index)
        {
            $value = unserialize($obj->getValue());
            if (isset($value[$index])) {
                return $value[$index];
            }

            return null;
        }
    }
