<?php

    class PluginMaps_HookMain extends Hook
    {
        public function RegisterHook()
        {
            $this->AddHook('content_field_proccess', 'processFieldMap');
            $this->AddHook('template_admin_content_add_field_list', 'addFieldMap', __CLASS__);
        }

        public function addFieldMap()
        {
            $sTemplate = Plugin::GetTemplateDir(__CLASS__) . 'tpls/fields/field.admin_content_add.tpl';
            return $this->Viewer_Fetch($sTemplate);
        }

        public function processFieldMap($aVars)
        {
            if ($aVars['oField']->getFieldType() == 'map') {
                if (isset($_REQUEST['fields'][$aVars['oField']->getFieldId()][0]) && isset($_REQUEST['fields'][$aVars['oField']->getFieldId()][1])) {
                    $lat            = htmlspecialchars(strip_tags($_REQUEST['fields'][$aVars['oField']->getFieldId()][0]));
                    $lng            = htmlspecialchars(strip_tags($_REQUEST['fields'][$aVars['oField']->getFieldId()][1]));
                    $aVars['sData'] = serialize(array($lat, $lng));
                    if ($aVars['oTopic']->_Validate()) {
                        $_REQUEST['fields'][$aVars['oField']->getFieldId()] = serialize(array($lat, $lng));
                    }
                }
            }
        }
    }

