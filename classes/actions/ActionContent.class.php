<?php

    class PluginMaps_ActionContent extends PluginMaps_Inherits_ActionContent
    {
        protected function EventEdit()
        {
            $this->Hook_AddExecFunction('topic_edit_show', array($this, '_topicEditShow'));

            return parent::EventEdit();
        }

        public function _topicEditShow($aParams) {

            if (!isset($aParams['oTopic'])) {
                return parent::EventNotFound();
            }

            if (isset($aParams['oTopic']) && ($oTopic = $aParams['oTopic']) && !isset($_REQUEST['submit_topic_publish']) && !isset($_REQUEST['submit_topic_save'])) {

                foreach ($this->oContentType->getFields() as $oField) {
                    if ($oTopic->getField($oField->getFieldId())) {
                        if ($oField->getFieldType() == 'map') {
                            $sValue = $oTopic->getField($oField->getFieldId())->getValueSource();
                            $sValue = unserialize($sValue);
                            $_REQUEST['coord'][$oField->getFieldId()] = $sValue;
                        }
                    }
                }
            }
        }
    }
