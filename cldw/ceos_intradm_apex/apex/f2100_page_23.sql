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
--     PAGE: 23
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00023
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>23);
end;
/
prompt --application/pages/page_00023
begin
wwv_flow_imp_page.create_page(
 p_id=>23
,p_name=>'Projekt - Developer editace'
,p_page_mode=>'MODAL'
,p_step_title=>'Projekt - Developer editace'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20210107064751'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(920085406325240903)
,p_plug_name=>'Projekt - Developer editace'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341709960609225853)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(920086125933240902)
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
 p_id=>wwv_flow_imp.id(920086513322240902)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(920086125933240902)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Zp\011Bt')
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(920086065590240902)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(920086125933240902)
,p_button_name=>'DELETE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(2341738989140226293)
,p_button_image_alt=>'Smazat'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P23_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(920085928535240902)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(920086125933240902)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit zm\011Bny')
,p_button_position=>'NEXT'
,p_button_condition=>'P23_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(920085869476240902)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(920086125933240902)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit')
,p_button_position=>'NEXT'
,p_button_condition=>'P23_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(470503381512308222)
,p_name=>'P23_BUDGET_VALUE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(470503907803308228)
,p_name=>'P23_PROJECT_BUDGET'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_source=>'select budget from pev_t_projects where :P23_PROJECT_ID = id'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920088917736240892)
,p_name=>'P23_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Projekt:'
,p_source=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select NAME, ID from PEV_T_PROJECTS'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920089249039240886)
,p_name=>'P23_DEVELOPER_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Developer:'
,p_source=>'DEVELOPER_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'SELECT nazev, partner_id FROM ucetni_partneri'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920089609740240840)
,p_name=>'P23_PEOPLE_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Stakeholder'
,p_source=>'PEOPLE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name || '' '' || surname,id from PEV_T_PEOPLES ',
'            where DEVELOPER= :P23_DEVELOPER_ID and IS_DELETED != 1 order by surname'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920089999277240835)
,p_name=>'P23_START_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Re\00E1ln\00E9 datum zah\00E1jen\00ED')
,p_source=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920090434742240835)
,p_name=>'P23_END_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Re\00E1ln\00E9 datum ukon\010Den\00ED')
,p_source=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920090849574240835)
,p_name=>'P23_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME, ID from PEV_T_LOV_PROJECT_STATUS',
'where (status_type != ''P'' or status_type is null)',
'and is_deleted !=1 order by status_name asc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920091197315240835)
,p_name=>'P23_BUDGET'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Budget'
,p_source=>'select budget from pev_t_project_developer where :P23_PROJECT_ID =project_id  and  :P23_developer_order = developer_order'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920091649503240835)
,p_name=>'P23_FORECAST'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Forecast'
,p_source=>'FORECAST'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_read_only_when=>'Select FORECAST_APPROVE from PEV_T_PROJECTS where id = :P23_PROJECT_ID'
,p_read_only_when_type=>'NOT_EXISTS'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920092051280240834)
,p_name=>'P23_UAT_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Datum UAT'
,p_source=>'UAT_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920092397474240834)
,p_name=>'P23_RESOLVED_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Datum Resolved'
,p_source=>'RESOLVED_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920092851663240833)
,p_name=>'P23_DEVELOPER_ORDER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_source=>'select developer_order from pev_t_project_developer where :P23_PROJECT_ID = project_Id and :P23_DEVELOPER_ID = developer_ID;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920093245156240833)
,p_name=>'P23_CREATED_DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920093634703240833)
,p_name=>'P23_CREATED_BY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920094063542240833)
,p_name=>'P23_UPDATED_DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920094456679240833)
,p_name=>'P23_UPDATED_BY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(920085406325240903)
,p_use_cache_before_default=>'NO'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(470504678079308235)
,p_validation_name=>'budget_validation'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--:P23_BUDGET_VALUE   <= :P23_PROJECT_BUDGET',
':P23_BUDGET_VALUE + :P23_BUDGET   <= :P23_PROJECT_BUDGET'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('P\0159ekro\010Den\00FD limit budgetu')
,p_when_button_pressed=>wwv_flow_imp.id(920085928535240902)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920086615286240902)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(920086513322240902)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920087409060240899)
,p_event_id=>wwv_flow_imp.id(920086615286240902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920108361686088516)
,p_name=>'opravdu_smazat'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(920086065590240902)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920108454692088517)
,p_event_id=>wwv_flow_imp.id(920108361686088516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('Opravdu smazat? - Nevratn\00E1 akce!')
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920110801481088541)
,p_name=>'SKOVAT_SMAZAT'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920110985428088542)
,p_event_id=>wwv_flow_imp.id(920110801481088541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(920086065590240902)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461062861452021103)
,p_name=>'CHANGE_STATUS'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461064133616021116)
,p_event_id=>wwv_flow_imp.id(461062861452021103)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461063476167021109)
,p_name=>'Disable_UAT_Resolved'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select STATUS from PEV_T_PROJECT_DEVELOPER where project_id = :P23_PROJECT_ID and :P23_DEVELOPER_ID = developer_id and ',
' status in (9,10,11)'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461063580982021110)
,p_event_id=>wwv_flow_imp.id(461063476167021109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_UAT_DATE,P23_RESOLVED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461180772715131902)
,p_name=>'Disable_Forecast'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>'Select id from PEV_T_PROJECTS where id = :P23_PROJECT_ID and FORECAST_APPROVE is null'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461180823535131903)
,p_event_id=>wwv_flow_imp.id(461180772715131902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_FORECAST'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461064566054021120)
,p_name=>'Disable_UAT_Resolved_change_servercond'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461064699649021121)
,p_event_id=>wwv_flow_imp.id(461064566054021120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_UAT_DATE,P23_RESOLVED_DATE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461064773589021122)
,p_event_id=>wwv_flow_imp.id(461064566054021120)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461063624023021111)
,p_name=>'Enable_UAT_Resolved_change'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_STATUS'
,p_condition_element=>'P23_STATUS'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'9,10,11'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461063772921021112)
,p_event_id=>wwv_flow_imp.id(461063624023021111)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_UAT_DATE,P23_RESOLVED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461064271114021117)
,p_name=>'Enable_UAT_Resolved_Before_submit'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexbeforepagesubmit'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461064316054021118)
,p_event_id=>wwv_flow_imp.id(461064271114021117)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461064445859021119)
,p_event_id=>wwv_flow_imp.id(461064271114021117)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23_UAT_DATE,P23_RESOLVED_DATE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461182857887131923)
,p_name=>'New'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461182994544131924)
,p_event_id=>wwv_flow_imp.id(461182857887131923)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_PROJECT_ID,P23_DEVELOPER_ID,P23_PEOPLE_ID,P23_START_DATE,P23_END_DATE,P23_STATUS,P23_BUDGET,P23_FORECAST,P23_UAT_DATE,P23_RESOLVED_DATE,P23_DEVELOPER_ORDER'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(470504061503308229)
,p_name=>'prepocet_budgetu'
,p_event_sequence=>130
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470648750464975606)
,p_event_id=>wwv_flow_imp.id(470504061503308229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select developer_order into :P23_DEVELOPER_ORDER from pev_t_project_developer where :P23_PROJECT_ID = project_Id and :P23_DEVELOPER_ID = developer_ID;',
''))
,p_attribute_03=>'P23_DEVELOPER_ORDER'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470504196518308230)
,p_event_id=>wwv_flow_imp.id(470504061503308229)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'select budget into :P23_PROJECT_BUDGET  from pev_t_projects where :P23_PROJECT_ID = id;'
,p_attribute_03=>'P23_PROJECT_BUDGET,P23_BUDGET_VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470503876031308227)
,p_event_id=>wwv_flow_imp.id(470504061503308229)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'budget_value  NUMBER DEFAULT 0;',
'budget_all  NUMBER DEFAULT 0;',
'cnt NUMBER;',
'vypocet NUMBER DEFAULT 0;',
'BEGIN',
'FOR i in 1..7',
'loop',
'    SELECT COUNT(*)',
'    INTO cnt',
'    FROM PEV_T_PROJECT_DEVELOPER  where :P23_PROJECT_ID = project_id and i = DEVELOPER_ORDER;',
'   ',
'    ',
'    IF( cnt > 0) ',
'    THEN ',
'    ',
'    select budget into budget_value from pev_t_project_developer where :P23_PROJECT_ID = project_id and i = DEVELOPER_ORDER;',
'    ',
'    IF budget_value is null THEN   budget_value := 0; END IF;',
'    ',
'    budget_all := budget_all + budget_value;',
'        ',
'    ELSE null;',
'    END IF;',
'end loop;',
'',
'',
'select budget into vypocet from pev_t_project_developer where :P23_PROJECT_ID = project_id and :P23_DEVELOPER_ORDER = DEVELOPER_ORDER;',
'',
'IF vypocet is null THEN   vypocet := 0; END IF;',
'',
':P23_BUDGET_VALUE := budget_all - vypocet ;',
'',
'END;'))
,p_attribute_03=>'P23_BUDGET_VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(470648837107975607)
,p_name=>'New_2'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_BUDGET'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470649151861975610)
,p_event_id=>wwv_flow_imp.id(470648837107975607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'budget_value  NUMBER DEFAULT 0;',
'budget_all  NUMBER DEFAULT 0;',
'cnt NUMBER;',
'vypocet NUMBER DEFAULT 0;',
'BEGIN',
'/*FOR i in 1..6',
'loop',
'    SELECT COUNT(*)',
'    INTO cnt',
'    FROM PEV_T_PROJECT_DEVELOPER  where :P23_PROJECT_ID = project_id and i = DEVELOPER_ORDER;',
'   ',
'    ',
'    IF( cnt > 0) ',
'    THEN ',
'    ',
'    select budget into budget_value from pev_t_project_developer where :P23_PROJECT_ID = project_id and i = DEVELOPER_ORDER;',
'    ',
'    IF budget_value is null THEN   budget_value := 0; END IF;',
'    ',
'    budget_all := budget_all + budget_value;',
'        ',
'    ELSE null;',
'    END IF;',
'end loop;*/',
'',
'',
'  --  select budget into vypocet from pev_t_project_developer where :P23_PROJECT_ID = project_id and :P23_DEVELOPER_ID = DEVELOPER_ORDER;',
'   -- IF vypocet is null THEN   vypocet := 0; END IF;',
':P23_BUDGET_VALUE := :P23_BUDGET_VALUE - vypocet;',
'',
'END;'))
,p_attribute_02=>'P23_BUDGET_VALUE'
,p_attribute_03=>'P23_BUDGET_VALUE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920095510028240828)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PEV_T_PROJECT_DEVELOPER_API'
,p_attribute_01=>'CEOS_INTRADM'
,p_attribute_02=>'PEV_T_PROJECT_DEVELOPER_API'
,p_attribute_03=>'P23_PROJECT_ID'
,p_attribute_04=>'PROJECT_ID'
,p_attribute_05=>'P23_DEVELOPER_ID'
,p_attribute_06=>'DEVELOPER_ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(470649801493975617)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'BUDGET_VALIDATION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'budget_value  NUMBER DEFAULT 0;',
'budget_all  NUMBER DEFAULT 0;',
'cnt NUMBER;',
'vypocet NUMBER DEFAULT 0;',
'BEGIN',
'',
'',
'IF :P23_BUDGET is null  THEN   :P23_BUDGET := 0; END IF;',
'',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(920085928535240902)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(461182705271131922)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE_DEVELOPER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'pev_k_main.upd_project_dev_record ( p_project_id =>:P23_PROJECT_ID ,',
'p_developer_id => :P23_DEVELOPER_ID, ',
'p_people_id =>:P23_PEOPLE_ID, ',
'p_start_date => :P23_START_DATE, ',
'p_end_date => :P23_END_DATE, ',
'p_status => :P23_STATUS, ',
'p_budget =>:P23_BUDGET ,',
'p_forecast => :P23_FORECAST, ',
'p_uat_date => :P23_UAT_DATE, ',
'p_resolved_date => :P23_RESOLVED_DATE);'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Chyba p\0159i \00FAprav\011B z\00E1znamu.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(920085928535240902)
,p_process_success_message=>unistr('Z\00E1znam upraven.')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920096344055240828)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(920085928535240902)
,p_process_when=>'SAVE, CANCEL, CLOSE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920096753501240827)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920095990261240828)
,p_process_sequence=>30
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Process Row of PEV_T_PROJECT_DEVELOPER_API'
,p_attribute_02=>'PEV_T_PROJECT_DEVELOPER'
,p_attribute_03=>'P23_PROJECT_ID'
,p_attribute_04=>'PROJECT_ID'
,p_attribute_05=>'P23_DEVELOPER_ID'
,p_attribute_06=>'DEVELOPER_ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
