prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the owner (parsing schema)
-- of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>295804475869754587
,p_default_application_id=>2100
,p_default_id_offset=>0
,p_default_owner=>'CEOS_INTRADM_APEX'
);
end;
/
 
prompt APPLICATION 2100 - CL_DRMAX_INTRANET_ADMIN
--
-- Application Export:
--   Application:     2100
--   Name:            CL_DRMAX_INTRANET_ADMIN
--   Date and Time:   21:20 Tuesday April 18, 2023
--   Exported By:     LSAROCKY
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 9
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00009
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>9);
end;
/
prompt --application/pages/page_00009
begin
wwv_flow_imp_page.create_page(
 p_id=>9
,p_name=>unistr('P\0159idat  Status')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('P\0159idat  Status')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20201123111723'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919457183917130087)
,p_plug_name=>unistr('Prida\0165  Status')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341709960609225853)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919457864651130086)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341714399961225872)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919458288677130086)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(919457864651130086)
,p_button_name=>'CANCEL'
,p_button_static_id=>'btn_cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Zp\011Bt')
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919457776754130086)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(919457864651130086)
,p_button_name=>'DELETE'
,p_button_static_id=>'btn_delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>'Smazat'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P9_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919457684719130086)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(919457864651130086)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(2341738989140226293)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition_type=>'NEVER'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919457550268130086)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(919457864651130086)
,p_button_name=>'CREATE'
,p_button_static_id=>'btn_create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit')
,p_button_position=>'NEXT'
,p_button_condition=>'P9_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919460623744130085)
,p_name=>'P9_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(919457183917130087)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919461026911130084)
,p_name=>'P9_STATUS_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(919457183917130087)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>120
,p_read_only_when=>'P9_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919461445804130084)
,p_name=>'P9_STATUS_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(919457183917130087)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Typ'
,p_source=>'STATUS_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Projektov\00FD status (P);P')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Status projektu dodavatele'
,p_cHeight=>1
,p_read_only_when=>'P9_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919458306141130086)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(919458288677130086)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919459172939130085)
,p_event_id=>wwv_flow_imp.id(919458306141130086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919462287586130084)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PEV_T_LOV_PROJECT_STATUS_API'
,p_attribute_01=>'CEOS_INTRADM'
,p_attribute_02=>'PEV_T_LOV_PROJECT_STATUS_API'
,p_attribute_03=>'P9_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919486923847897712)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'delete_status'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'pev_k_main.del_project_status(p_id => :P9_ID );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919457776754130086)
,p_process_success_message=>unistr('Status Smazan\00FD')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919462632492130084)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PEV_T_LOV_PROJECT_STATUS_API'
,p_attribute_01=>'CEOS_INTRADM'
,p_attribute_02=>'PEV_T_LOV_PROJECT_STATUS_API'
,p_attribute_03=>'P9_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919457550268130086)
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919463088963130084)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919457776754130086)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919463469667130083)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
