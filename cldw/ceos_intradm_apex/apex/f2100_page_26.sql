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
--     PAGE: 26
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00026
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>26);
end;
/
prompt --application/pages/page_00026
begin
wwv_flow_imp_page.create_page(
 p_id=>26
,p_name=>unistr('Kop\00EDrov\00E1ni projektu')
,p_alias=>unistr('KOP\00CDROV\00C1NI-PROJEKTU')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Kop\00EDrov\00E1ni projektu')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20210225135148'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10419707237709248)
,p_plug_name=>'copy_region'
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10419654660709247)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10419707237709248)
,p_button_name=>'BTN_COPY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Kop\00EDrovat')
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-copy'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(15432121042733410)
,p_branch_name=>'Go To Page 7'
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_PROJECT_ID:&P26_RETURN_PROJECT_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10419518195709246)
,p_name=>'P26_PROJECT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10419707237709248)
,p_prompt=>'Projekt'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name,id from pev_t_projects order by name '
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
 p_id=>wwv_flow_imp.id(15431329247733402)
,p_name=>'P26_RETURN_PROJECT_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10419707237709248)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10419992041709250)
,p_name=>'set_value'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P26_PROJECT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15431290878733401)
,p_event_id=>wwv_flow_imp.id(10419992041709250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P26_PROJECT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10419803962709249)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'copy project'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'c_name                            varchar2(50 char);',
'c_project_state                   number;',
'c_identification                  number;',
'c_project_status                  number;',
'c_kakadu_number                   varchar2(50 char);',
'c_bdc_number                      varchar2(50 char);',
'c_bdc_ops                         varchar2(50 char);',
'c_department                      number;',
'c_project_manager                 number;',
'c_business_owner                  number;',
'c_it_owner                        number;',
'c_start_date_expect               date;',
'c_start_date_real                 date;',
'c_end_date_exp                    date;',
'c_end_date_real                   date;',
'c_budget                          number;',
'c_forecast                        number;',
'c_forecast_approve_date           date;',
'c_project_description             varchar2(2500 char);    ',
'c_descr_scope                     varchar2(2500 char);',
'c_layout                          number;',
'c_layout_url                      varchar2(150 byte);',
'c_budget_approve_date             date;',
'c_budget_approve                  number;',
'c_forecast_approve                number;',
'c_note                            varchar2(2500 char);',
'c_approve                         number;',
'p_email                           number;',
'',
'BEGIN',
'',
'SELECT name, project_state, identification,  project_status, kakadu_number, bdc_number, bdc_ops, department, project_manager, business_owner, it_owner, start_date_expect,',
'       start_date_real, end_date_exp, end_date_real, budget, forecast, forecast_approve_date, project_description, descr_scope, layout, layout_url, budget_approve_date,',
'       budget_approve, forecast_approve, note, approve  ',
'INTO c_name, c_project_state, c_identification,  c_project_status, c_kakadu_number, c_bdc_number, c_bdc_ops, c_department, c_project_manager, c_business_owner, c_it_owner, c_start_date_expect,',
'       c_start_date_real, c_end_date_exp, c_end_date_real, c_budget, c_forecast, c_forecast_approve_date, c_project_description, c_descr_scope, c_layout, c_layout_url, c_budget_approve_date,',
'       c_budget_approve, c_forecast_approve, c_note, c_approve ',
'FROM pev_t_projects WHERE id = :P26_PROJECT;',
'',
'',
'',
'pev_k_main.upd_projects(    ',
'                                    p_id                                         => NULL,',
'                                    p_name                                       => c_name,					',
'				                    p_project_state                              => c_project_state,		',
'				                    p_identification                             => c_identification,			',
'				                    p_project_status                             => c_project_status,			',
'				                    p_kakadu_number                              => c_kakadu_number,			',
'				                    p_bdc_number                                 => c_bdc_number,		',
'				                    p_bdc_ops                                    => c_bdc_ops,				',
'				                    p_department                                 => c_department ,				 ',
'				                    p_project_manager                            => c_project_manager ,		',
'				                    p_business_owner                             => c_business_owner,			',
'				                    p_it_owner                                   => c_it_owner,',
'                                    id_out                                       => :P26_RETURN_PROJECT_ID,',
'                                    p_budget_approve                             => c_budget_approve,',
'                                    p_forecast_approve                           => c_forecast_approve,',
'                                    p_note                                       => c_note,',
'                                    p_approve                                    => c_approve ,',
'                                    p_email                                      => 1,',
'',
'    ',
'				                    p_start_date_expect                          =>     to_date( ',
'   to_char(to_date(c_start_date_expect)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),		',
'				                    p_start_date_real                            => to_date( ',
'   to_char(to_date(c_start_date_real)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),	',
'				                    p_end_date_exp                               => to_date( ',
'   to_char(to_date(c_end_date_exp)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),		',
'				                    p_end_date_real                              => to_date( ',
'   to_char(to_date(c_end_date_real)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),		',
'	',
'        ',
'        ',
'        ',
'         ',
'       ',
'        ',
'				                    p_budget                                     => c_budget,					',
'				                    p_forecast                                   => c_forecast,',
'    ',
'    ',
'				                    p_forecast_approve_date                      => to_date( ',
'   to_char(to_date(c_forecast_approve_date)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),	',
'    ',
'    ',
'    ',
'				                    p_project_description                        => c_project_description,	',
'				                    p_descr_scope                                => c_descr_scope,				',
'				                    p_layout                                     => c_layout,					',
'				                    p_layout_url                                =>  c_layout_url,',
'                             ',
'  				                    p_budget_approve_date                      => to_date( ',
'   to_char(to_date(c_budget_approve_date)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  )',
'                                  ,p_is_duplicated => 1',
'                             ',
'                             ',
'                             ',
'                             );',
'',
'',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(10419654660709247)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15431979368733408)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'copy attachment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'BEGIN',
'PEV_K_MAIN.copy_files(',
'     p_project_id_copy => :P26_PROJECT,',
'	 p_project_id_new => :P26_RETURN_PROJECT_ID);',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(10419654660709247)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15431812936733407)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'copy developer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'     PEV_K_MAIN.copy_developer(',
'        p_project_id_copy => :P26_PROJECT,',
'		p_project_id_new => :P26_RETURN_PROJECT_ID									',
'									);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(10419654660709247)
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
