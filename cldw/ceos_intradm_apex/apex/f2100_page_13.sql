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
--     PAGE: 13
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00013
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>13);
end;
/
prompt --application/pages/page_00013
begin
wwv_flow_imp_page.create_page(
 p_id=>13
,p_name=>unistr('P\0159\00EDlohy')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('P\0159\00EDlohy')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20201213230412'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470525385825023804)
,p_plug_name=>unistr('P\0159\00EDlohy')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'ID,',
'PROJECT_ID',
',FILE_NAME',
',FILE_MIME_TYPE',
',FILE_SIZE',
', dbms_lob.getlength(file_content)  DOWNLOAD',
'',
'',
'from PEV_T_FILES where project_id = :P13_PROJECT_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(470502480639308213)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_owner=>'LSAROCKY'
,p_internal_uid=>470502480639308213
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470502601025308215)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('St\00E1hnout')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PEV_T_FILES:FILE_CONTENT:ID:::FILE_NAME:::attachment::'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470502764051308216)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00E1zev Souboru')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470502888571308217)
,p_db_column_name=>'ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470502931071308218)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470503037911308219)
,p_db_column_name=>'FILE_MIME_TYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'File Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470503109213308220)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'File Size'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(470545392812959109)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4705454'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOWNLOAD:FILE_NAME:ID:PROJECT_ID:FILE_MIME_TYPE:FILE_SIZE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(470501996352308208)
,p_name=>'P13_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(470525385825023804)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
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
