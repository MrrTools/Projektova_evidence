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
--   Date and Time:   21:21 Tuesday April 18, 2023
--   Exported By:     LSAROCKY
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 25
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00025
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>25);
end;
/
prompt --application/pages/page_00025
begin
wwv_flow_imp_page.create_page(
 p_id=>25
,p_name=>unistr('PEV - Smazat z\00E1znam')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Smazat z\00E1znam')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20221212004224'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(920111100120088544)
,p_plug_name=>unistr('Potvrdit smaz\00E1n\00ED')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(920111389120088546)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(920111100120088544)
,p_button_name=>'ANO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>'Smazat'
,p_button_position=>'CHANGE'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(920111216701088545)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(920111100120088544)
,p_button_name=>'NE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Zp\011Bt')
,p_button_position=>'CLOSE'
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461181217822131907)
,p_name=>'P25_POUZITY_CLOVEK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(920111100120088544)
,p_source=>unistr('Osobu nelze smazat, jeliko\017E existuje vazba na projekt.')
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920111663079088549)
,p_name=>'P25_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(920111100120088544)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(920111722683088550)
,p_name=>'P25_CISELNIK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(920111100120088544)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461181323827131908)
,p_name=>'New_1'
,p_event_sequence=>8
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461181450281131909)
,p_event_id=>wwv_flow_imp.id(461181323827131908)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P25_POUZITY_CLOVEK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461180960070131904)
,p_name=>'New'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pep.id from pev_t_peoples pep ',
'join pev_t_project_developer pro ',
'join pev_t_projects ps on ps.id = pro.project_id',
'on pro.people_id = pep.id',
'',
'where people_id = :P25_ID and :P25_CISELNIK LIKE ''LIDE'' and (ps.is_deleted != 1 or ps.is_deleted is null)    '))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461181013071131905)
,p_event_id=>wwv_flow_imp.id(461180960070131904)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P25_POUZITY_CLOVEK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461181150226131906)
,p_event_id=>wwv_flow_imp.id(461180960070131904)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(920111389120088546)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461181501808131910)
,p_name=>'New_2'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id from pev_t_projects pro',
'where :P25_CISELNIK LIKE ''LIDE'' and (pro.is_deleted != 1 or pro.is_deleted is null)    ',
'AND ( (BUDGET_APPROVE = :P25_ID ) OR (FORECAST_APPROVE = :P25_ID ) OR (PROJECT_MANAGER = :P25_ID ) OR (BUSINESS_OWNER = :P25_ID ) OR (IT_OWNER = :P25_ID ) )'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461181669351131911)
,p_event_id=>wwv_flow_imp.id(461181501808131910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P25_POUZITY_CLOVEK'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461181747640131912)
,p_event_id=>wwv_flow_imp.id(461181501808131910)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(920111389120088546)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920111411752088547)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Smazat'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare v_record_id integer;',
'v_cat_id number;',
'v_old_value varchar2(500 CHAR);',
'BEGIN',
'',
'CASE ',
' WHEN  :P25_CISELNIK = ''STATUS'' THEN',
'pev_k_main.del_project_status(p_id => :P25_ID);',
' WHEN  :P25_CISELNIK = ''STAV'' THEN',
'pev_k_main.del_project_state(p_id => :P25_ID);',
' WHEN :P25_CISELNIK = ''POZICE'' THEN',
'pev_k_main.del_people_position(p_id => :P25_ID);',
' WHEN :P25_CISELNIK = ''IDENTIFIKACE'' THEN',
'pev_k_main.del_project_identification(p_id => :P25_ID);',
' WHEN :P25_CISELNIK = ''LIDE'' THEN',
'UPDATE PEV_T_PEOPLES SET is_deleted = 1 where id = :P25_ID;',
' WHEN :P25_CISELNIK = ''SOUBOR'' THEN',
'      ',
'select project_id,file_name  into v_cat_id, v_old_value from PEV_T_FILES where id = :P25_ID;',
'',
'',
'    PEV_K_MAIN.INSERT_CHANGE(',
'      L_RECORD_ID => null,',
'      L_CAT => ''PROJECT'',',
'      L_CAT_ID => v_cat_id,',
'      L_ITEM_ID => null,',
unistr('      L_ITEM => ''Nov\00FD soubor'','),
'      L_OLD_VALUE =>v_old_value,',
'      L_VALUE => null,',
'      L_ACTION => ''I'');            ',
'',
'DELETE FROM PEV_T_FILES  where id = :P25_ID;',
'END CASE;',
'',
'',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    ceos_log.failure(SQLERRM || '' '' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);',
'    RAISE;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(920111389120088546)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920253273233658411)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Zavrit_po_smazat'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(920111389120088546)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(920111541404088548)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Nemazat'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(920111216701088545)
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
