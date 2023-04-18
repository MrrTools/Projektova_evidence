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
--     PAGE: 11
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00011
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>11);
end;
/
prompt --application/pages/page_00011
begin
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>unistr('P\0159idat Lidi')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Lid\00E9 - Projektov\00E1 evidence')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20201209205826'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919532085149005601)
,p_plug_name=>unistr('P\0159idat Lidi')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341709960609225853)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919532727567005601)
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
 p_id=>wwv_flow_imp.id(919533146086005600)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(919532727567005601)
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
 p_id=>wwv_flow_imp.id(919532619724005601)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(919532727567005601)
,p_button_name=>'DELETE'
,p_button_static_id=>'btn_delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>'Smazat'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919532528048005601)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(919532727567005601)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit')
,p_button_position=>'NEXT'
,p_button_condition=>'P11_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919532486274005601)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(919532727567005601)
,p_button_name=>'CREATE'
,p_button_static_id=>'btn_create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit')
,p_button_position=>'NEXT'
,p_button_condition=>'P11_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460347484885803447)
,p_name=>'P11_ID_PEOPLE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(516891831166734107)
,p_name=>'P11_DEVELOPER_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partner_id from ucetni_partneri where nazev = :P11_DEVELOPER ',
'and ROWNUM = 1',
'or (:P11_DEVELOPER is null and partner_id = (select developer from pev_t_peoples where id = :P11_ID) )'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P11_DEVELOPER ',
'or partner_id = (select developer from pev_t_peoples where id = :P11_ID )'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919535535392005598)
,p_name=>'P11_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
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
 p_id=>wwv_flow_imp.id(919535944478005598)
,p_name=>'P11_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Jm\00E9no')
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919536377968005597)
,p_name=>'P11_SURNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('P\0159\00EDjmen\00ED')
,p_source=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>120
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919536718984005597)
,p_name=>'P11_POSITION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_prompt=>'Pozice'
,p_source=>'select people_id from PEV_T_PEOPLE_POSITIONS  where PEOPLE_ID = :P11_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'select name, id from PEV_T_LOV_PEOPLE_POSITION where is_deleted !=1 or is_deleted is null'
,p_field_template=>wwv_flow_imp.id(2341738689224226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919537126484005596)
,p_name=>'P11_EMAIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>200
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919537552721005596)
,p_name=>'P11_PHONE_NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Telefon'
,p_source=>'PHONE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.MASKED_FIELD'
,p_cSize=>30
,p_cMaxlength=>11
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'999 999 999'
,p_attribute_02=>'_'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919537985848005596)
,p_name=>'P11_DEVELOPER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Developer'
,p_source=>'DEVELOPER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev',
'  from ucetni_partneri',
''))
,p_cSize=>30
,p_read_only_when=>'P11_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919538333769005596)
,p_name=>'P11_NOTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Pozn\00E1mka')
,p_source=>'NOTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>800
,p_cHeight=>4
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920110374726088536)
,p_name=>'P11_EMAIL_NOTIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(919532085149005601)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Emailov\00E1 Notifikace')
,p_source=>'EMAIL_NOTIFICATION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Ano;1,Ne;0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(460346717634803440)
,p_validation_name=>'first_number_of_tel_num'
,p_validation_sequence=>10
,p_validation=>'P11_PHONE_NUMBER'
,p_validation2=>'[6-9][0-9][0-9][ ][0-9]{3}[ ][0-9]{3}'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('\0161patn\00FD form\00E1t')
,p_associated_item=>wwv_flow_imp.id(919537552721005596)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(460346805902803441)
,p_validation_name=>'9_digit'
,p_validation_sequence=>20
,p_validation=>'Length(:P11_PHONE_NUMBER)=11'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\010D\00EDslo je p\0159\00EDli\0161 kr\00E1tk\00E9')
,p_associated_item=>wwv_flow_imp.id(919537552721005596)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(460346962966803442)
,p_validation_name=>'email_format'
,p_validation_sequence=>30
,p_validation=>'regexp_like (:P11_EMAIL, ''^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('\0161patn\00FD form\00E1t')
,p_associated_item=>wwv_flow_imp.id(919537126484005596)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919488489896897727)
,p_name=>'refresh_po_modale'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(919532085149005601)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919488514263897728)
,p_event_id=>wwv_flow_imp.id(919488489896897727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(919532085149005601)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(516891957952734108)
,p_name=>'autocomplete_id'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_DEVELOPER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516892289132734111)
,p_event_id=>wwv_flow_imp.id(516891957952734108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P11_DEVELOPER'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516892818763734117)
,p_event_id=>wwv_flow_imp.id(516891957952734108)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_DEVELOPER_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516892099111734110)
,p_event_id=>wwv_flow_imp.id(516891957952734108)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_DEVELOPER_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(516892630037734115)
,p_name=>'hide_developer_id'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NULL'
,p_display_when_cond=>'P11_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516892779330734116)
,p_event_id=>wwv_flow_imp.id(516892630037734115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_DEVELOPER_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920252778338658406)
,p_name=>'hide_developer_abc'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P11_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920252822450658407)
,p_event_id=>wwv_flow_imp.id(920252778338658406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_DEVELOPER'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920253097920658410)
,p_event_id=>wwv_flow_imp.id(920252778338658406)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#P11_DEVELOPER_ID'').attr(''readonly'', true);'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461182449099131919)
,p_name=>'hide_developer_ID_nondeveloper'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>'select developer from pev_t_peoples where id = :P11_ID and developer is null'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461182584016131920)
,p_event_id=>wwv_flow_imp.id(461182449099131919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_DEVELOPER_ID'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460347556763803448)
,p_name=>'hide_checkbox'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_display_when_cond=>'P11_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460347651022803449)
,p_event_id=>wwv_flow_imp.id(460347556763803448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_POSITION'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460992481582176706)
,p_name=>'New'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(919533146086005600)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460992570686176707)
,p_event_id=>wwv_flow_imp.id(460992481582176706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919539103656005595)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PEV_T_PEOPLES_API'
,p_attribute_01=>'CEOS_INTRADM'
,p_attribute_02=>'PEV_T_PEOPLES_API'
,p_attribute_03=>'P11_ID'
,p_attribute_04=>'ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919539517070005594)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PEV_T_PEOPLES_API'
,p_attribute_01=>'CEOS_INTRADM'
,p_attribute_02=>'PEV_T_PEOPLES_API'
,p_attribute_03=>'P11_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'U'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58596180543405529)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'NEW'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_counter       NUMBER;',
'    p_position_ids  VARCHAR(100);',
'    loop_counter    NUMBER;',
'    v_id            NUMBER;',
'BEGIN',
'',
'insert into pev_t_peoples (NAME, SURNAME, POSITION, EMAIL, PHONE_NUMBER, DEVELOPER, NOTE, EMAIL_NOTIFICATION, IS_DELETED)',
'values (',
'',
':P11_NAME,',
':P11_SURNAME,',
'null,--:P11_POSITION,',
':P11_EMAIL,',
':P11_PHONE_NUMBER,',
':P11_DEVELOPER_ID,',
':P11_NOTE,',
':P11_EMAIL_NOTIFICATION',
',0)',
'',
'RETURNING ID INTO :P11_ID_PEOPLE ;',
'',
'',
'',
'',
'    p_position_ids := :P11_POSITION;',
' SAVEPOINT people_position;   ',
'            ',
'v_counter := regexp_count(',
'                             p_position_ids',
'                            ,'':''',
'                 )',
'                 + 1;',
'    FOR loop_counter IN 1..v_counter LOOP',
'        v_id :=(trim(regexp_substr(',
'                                  p_position_ids',
'                                 ,''[^:]+''',
'                                 ,1',
'                                 ,loop_counter',
'                     )));',
'',
'       ',
'            INSERT INTO pev_t_people_positions(',
'                people_id',
'                ,position_id',
'            )VALUES(',
'                :P11_ID_PEOPLE',
'               ,v_id',
'            );',
'',
'    END LOOP;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
unistr('        ceos_log.failure(''Chyba p\0159i vkl\00E1d\00E1n\00ED z\00E1znamu u\017Eivatetle id: '''),
'                         || v_id',
'                         || dbms_utility.format_error_stack);',
'        ROLLBACK TO people_position;',
'        RAISE;',
'END;',
'',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919532486274005601)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58596258569405530)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update pev_t_peoples ',
'set',
'NAME=:P11_NAME, SURNAME=:P11_SURNAME, POSITION=null, EMAIL=:P11_EMAIL, PHONE_NUMBER=:P11_PHONE_NUMBER, DEVELOPER=:P11_DEVELOPER_ID,',
' NOTE=:P11_NOTE, EMAIL_NOTIFICATION=:P11_EMAIL_NOTIFICATION, IS_DELETED=0',
'where id=:P11_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919532528048005601)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919539898203005594)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919532619724005601)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919540330076005594)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919532486274005601)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58598159905405549)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog_save'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919532528048005601)
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
