<?php

    class PluginMaps extends Plugin
    {
        protected $aInherits = array(
            'action' => array(
                'ActionContent',
            ),
            'entity' => array(
                'ModuleTopic_EntityField',
            ),
        );
        protected $aDelegates=array(
            'template' => array(
                'forms/form_field_map.tpl',
                'forms/view_field_map.tpl'
            ),
        );
        public function Init()
        {
            $this->Topic_AddFieldType('map');

            return true;
        }

        public function Activate()
        {
            return true;
        }

        public function Deactivate()
        {
            return true;
        }
    }
