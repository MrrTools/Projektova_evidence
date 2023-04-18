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
--     PAGE: 32
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00032
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>32);
end;
/
prompt --application/pages/page_00032
begin
wwv_flow_imp_page.create_page(
 p_id=>32
,p_name=>'PRINT_JOURNAL'
,p_alias=>'TEST'
,p_step_title=>'TEST'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20210716153412'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(190016365221813951)
,p_plug_name=>'COLECTION_QUERY'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    c001,',
'    c002,',
'    c003,',
'    c004,',
'    c005,',
'    c006,',
'    c007,',
'        c008,',
'            c009,',
'                c010',
'',
'  from apex_collections',
'  where collection_name =''PREHLED_PROJEKTU'';'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'COLECTION_QUERY'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(190016403850813951)
,p_name=>'TEST'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JARDA'
,p_internal_uid=>190016403850813951
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190016812229813952)
,p_db_column_name=>'C001'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'C001'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190017200564813952)
,p_db_column_name=>'C002'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'C002'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190017610695813952)
,p_db_column_name=>'C003'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'C003'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190018092342813953)
,p_db_column_name=>'C004'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'C004'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190018457444813953)
,p_db_column_name=>'C005'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'C005'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26335058035786445)
,p_db_column_name=>'C006'
,p_display_order=>15
,p_column_identifier=>'F'
,p_column_label=>'C006'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26335193228786446)
,p_db_column_name=>'C007'
,p_display_order=>25
,p_column_identifier=>'G'
,p_column_label=>'C007'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190038850020137401)
,p_db_column_name=>'C008'
,p_display_order=>35
,p_column_identifier=>'H'
,p_column_label=>'C008'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190038976482137402)
,p_db_column_name=>'C009'
,p_display_order=>45
,p_column_identifier=>'I'
,p_column_label=>'C009'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(190039053233137403)
,p_db_column_name=>'C010'
,p_display_order=>55
,p_column_identifier=>'J'
,p_column_label=>'C010'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(190018860316814512)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1900189'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'C001:C002:C003:C004:C005:C006:C007:C008:C009:C010'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(190039871272137411)
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(190039333248137406)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EXPOR_XLXS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_context         apex_exec.t_context;',
'    l_export          apex_data_export.t_export;',
'    l_print_config    apex_data_export.t_print_config;',
'    l_project_idx     pls_integer;',
' l_columns               apex_data_export.t_columns;',
'begin',
'   ',
'    l_context := apex_exec.open_query_context(',
'        p_location    => apex_exec.c_location_local_db,',
'        p_sql_query   => ''select c008 as PROJECT, TEXT ,RECORD_DATE, created_by  from PEV_T_PROJECT_LOGBOOK JOIN  apex_collections',
'  ON collection_name =''''PREHLED_PROJEKTU'''' AND  project_id=TO_NUMBER(c002) and is_deleted != 1 ORDER by project_id desc,record_date desc'' );',
'',
'l_print_config := apex_data_export.get_print_config(',
'        p_body_font_color             => ''#4B4540'',',
unistr('        p_page_header                 => ''Projektov\00FD den\00EDk'','),
'        p_page_header_font_color      => ''#ed813e'',',
'        p_page_header_font_size       => 14,',
'        p_page_header_font_weight     => apex_data_export.c_font_weight_bold,',
'       -- p_page_footer                 => NULL,',
'        p_page_footer_font_color      => ''#4B4540'',',
'        p_page_footer_font_size       => 14,   ',
'        p_page_footer_font_weight     => apex_data_export.c_font_weight_bold,',
'        p_border_width                => 0.1,',
'        p_border_color                => ''#4B4540'');   ',
'',
'      ',
'',
'',
' -- Define columns',
'    apex_data_export.add_column(',
'        p_columns             => l_columns,',
'        p_name                => ''PROJECT'',',
'        p_heading             => ''Project'',',
'        p_is_column_break    => TRUE);',
'',
'    apex_data_export.add_column(',
'        p_columns             => l_columns,',
'        p_name                => ''RECORD_DATE'',',
'        p_heading             => ''Project/Datum.zapisu'');    ',
'',
'    apex_data_export.add_column(',
'        p_columns             => l_columns,',
'        p_name                => ''TEXT'',',
'        p_heading             => ''Text'');',
'',
'',
'',
'    ',
'   /* apex_data_export.add_column(',
'        p_columns             => l_columns,',
'        p_name                => ''CREATED_BY'',',
'        p_heading             => ''Autor'');    */',
'',
'    l_export := apex_data_export.export (',
'                        p_context      => l_context,',
'                        p_format       => apex_data_export.c_format_xlsx,',
'                        p_print_config => l_print_config,',
'                         p_columns               => l_columns',
'                        );',
'',
'',
'    apex_exec.close( l_context );',
'',
'    apex_data_export.download( p_export => l_export);',
'',
'exception',
'   ',
'    when others then',
'        apex_exec.close( l_context );',
'        raise;',
'end;'))
,p_process_clob_language=>'PLSQL'
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
