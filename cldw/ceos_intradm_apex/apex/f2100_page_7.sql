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
--   Date and Time:   21:19 Tuesday April 18, 2023
--   Exported By:     LSAROCKY
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 7
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00007
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>7);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'Detail'
,p_step_title=>'Detail'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.ui-dialog-titlebar-close {    visibility: hidden !important;}',
'#P7_BUDGET_DISPLAY{',
'       text-align: right;',
'         width: 20%;',
'}',
'',
'#P7_FORECAST_DISPLAY{',
'       text-align: right;',
'         width: 20%;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20221114150357'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460827101459863622)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460825158253863602)
,p_plug_name=>unistr('P\0159\00EDlohy')
,p_parent_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_region_template_options=>'#DEFAULT#:t-Region--accent12:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
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
'from PEV_T_FILES where project_id = :P7_PROJECT_ID',
'',
'',
''))
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
 p_id=>wwv_flow_imp.id(461066094540021135)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_owner=>'LIMRICH'
,p_internal_uid=>461066094540021135
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461066186931021136)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461066279339021137)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Smazat'
,p_column_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_CISELNIK,P25_ID:SOUBOR,#ID#'
,p_column_linktext=>'<span class="fa fa-trash-o"> </span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461066388558021138)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('N\00E1zev souboru')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461066464192021139)
,p_db_column_name=>'FILE_MIME_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Mime Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461066550447021140)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'File Size'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461066692504021141)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('St\00E1hnout')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PEV_T_FILES:FILE_CONTENT:ID:::FILE_NAME:::inline::'
,p_static_id=>'custom-download-button'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(461177224124508504)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4611773'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:DOWNLOAD:PROJECT_ID:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919765738026535722)
,p_plug_name=>'Identifikace projektu'
,p_parent_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_region_template_options=>'#DEFAULT#:t-Region--accent5:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919766414495535729)
,p_plug_name=>'Detaily Projektu'
,p_parent_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_region_template_options=>'#DEFAULT#:t-Region--accent6:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919766745519535732)
,p_plug_name=>'Kontakty'
,p_parent_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(461062638453021101)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919767665262535741)
,p_plug_name=>unistr('Term\00EDny a finance')
,p_parent_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919890115761690142)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(460825158253863602)
,p_button_name=>'P7_BTN_addition'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nahr\00E1t p\0159\00EDlohu')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP:P12_PROJECT_ID:&P7_PROJECT_ID.'
,p_button_condition=>'P7_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-file-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27354684473040831)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(919766414495535729)
,p_button_name=>'P7_JOURNAL_BUTTON'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary:t-Button--iconLeft:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Projektov\00FD den\00EDk')
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_PROJECT_ID:&P7_PROJECT_ID.'
,p_button_condition=>'P7_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-address-book-o'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(460825034347863601)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_button_name=>'P7_BTN_BACK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('P\0159ehled')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>'P7_PROJECT_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919960113730852624)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(460827101459863622)
,p_button_name=>'P7_BTN_CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit Projekt')
,p_button_position=>'CREATE'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10417277328709223)
,p_name=>'P7_APPROVE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Ke schv\00E1len\00ED')
,p_source=>'Select APPROVE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'1'
,p_attribute_03=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(112281798981819044)
,p_name=>'P7_EDIT_FLAG'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(166740206652339401)
,p_name=>'P7_P_JOURNAL1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(919766414495535729)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Posledn\00ED z\00E1znam v den\00EDku')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*SELECT record_date || '' ''|| text  FROM pev_t_project_logbook',
'WHERE record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1)',
'AND is_deleted != 1',
'AND  project_id = :P7_PROJECT_ID;*/',
'',
'SELECT record_date || '' '' || text  FROM pev_t_project_logbook',
'WHERE  updated_date = (',
'    SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1 AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1))',
'                OR',
'                created_date = (',
'    SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1 AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1))',
'AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = 227 AND is_deleted != 1)',
'AND is_deleted != 1',
'AND  project_id = :P7_PROJECT_ID;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cMaxlength=>999
,p_cHeight=>6
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(166742030416339419)
,p_name=>'P7_P_JOURNAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(919766414495535729)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Posledn\00ED z\00E1znam v den\00EDku')
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*SELECT record_date || '' ''|| text  FROM pev_t_project_logbook',
'WHERE record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1)',
'AND is_deleted != 1',
'AND  project_id = :P7_PROJECT_ID;*/',
'',
'',
'SELECT record_date || '''' || text  FROM pev_t_project_logbook',
'WHERE  updated_date = (',
'    SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1 AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1))',
'                OR',
'                created_date = (',
'    SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1 AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1))',
'AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1)',
'AND is_deleted != 1',
'AND  project_id = :P7_PROJECT_ID',
'AND  rownum = 1;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460122289887913032)
,p_name=>'P7_ID_PROJECT_DEVELOPER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460253824007466316)
,p_name=>'P7_SCH_BUDGET'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>'Budget schvalil'
,p_source=>'Select BUDGET_APPROVE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name || '' '' || surname,id from PEV_T_PEOPLES ',
'            where  IS_DELETED != 1 and developer is null'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460347382463803446)
,p_name=>'P7_TEL_PM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460995735631176739)
,p_name=>'P7_AUTO_DEV_6'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 6'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 6)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460995829295176740)
,p_name=>'P7_DEVELOPER_6'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_6'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_6 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460995951362176741)
,p_name=>'P7_DEV_NAME_6'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=6'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname,id from PEV_T_PEOPLES where DEVELOPER= :P7_DEVELOPER_6 and IS_DELETED != 1 order by surname'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_6'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460996098016176742)
,p_name=>'P7_EMAIL_DEV_6'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460996165628176743)
,p_name=>'P7_TEL_DEV_6'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460996295487176744)
,p_name=>'P7_P_NOTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(919766414495535729)
,p_prompt=>unistr('Pozn\00E1mka')
,p_source=>'Select NOTE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cMaxlength=>999
,p_cHeight=>6
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471871985200973613)
,p_name=>'P7_AUTO_DEV_7'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 7'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 7)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471872017477973614)
,p_name=>'P7_DEVELOPER_7'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_7'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_7 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471872110239973615)
,p_name=>'P7_DEV_NAME_7'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=6'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname,id from PEV_T_PEOPLES where DEVELOPER= :P7_DEVELOPER_7 and IS_DELETED != 1 order by surname'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_7'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471872286102973616)
,p_name=>'P7_EMAIL_DEV_7'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471872308297973617)
,p_name=>'P7_TEL_DEV_7'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919765859632535723)
,p_name=>'P7_NAZEV_PRO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>unistr('N\00E1zev Projektu')
,p_source=>'Select NAME from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(919765985342535724)
,p_name=>'P7_BDC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>unistr('BDC \010D\00EDslo')
,p_source=>'Select BDC_NUMBER from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919765997457535725)
,p_name=>'P7_KAKADU'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('KaKadu \010D\00EDslo')
,p_source=>'Select KAKADU_NUMBER from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766157013535726)
,p_name=>'P7_BDC_OPS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>'BDC OPS'
,p_source=>'Select BDC_OPS from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766252963535727)
,p_name=>'P7_STAV'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>'Stav'
,p_source=>'Select PROJECT_STATE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATE_NAME,ID',
'    from PEV_T_LOV_PROJECT_STATE',
'      where IS_DELETED != 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766298467535728)
,p_name=>'P7_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>'Status'
,p_source=>'Select PROJECT_STATUS from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select STATUS_NAME,ID',
'    from PEV_T_LOV_PROJECT_STATUS',
'      where IS_DELETED != 1 and status_type = ''P'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766568755535730)
,p_name=>'P7_P_PROJEKTU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(919766414495535729)
,p_prompt=>'Popis projektu'
,p_source=>'Select PROJECT_DESCRIPTION from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cMaxlength=>999
,p_cHeight=>6
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766620211535731)
,p_name=>'P7_P_SCOPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(919766414495535729)
,p_prompt=>'Scope Popis'
,p_source=>'Select DESCR_SCOPE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>200
,p_cMaxlength=>999
,p_cHeight=>6
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766850521535733)
,p_name=>'P7_BUS_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Business owner'
,p_source=>'Select BUSINESS_OWNER from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.name || '' '' || p.surname, p.id from PEV_T_PEOPLES p',
'join PEV_T_PEOPLE_POSITIONS pp on p.id = pp.people_id',
'where   is_deleted != 1 and position_id = 1 and p.developer is null order by p.surname;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919766923964535734)
,p_name=>'P7_PRO_MAN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>unistr('Projektov\00FD mana\017Eer')
,p_source=>'Select PROJECT_MANAGER from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.name || '' '' || p.surname, p.id from PEV_T_PEOPLES p',
'join PEV_T_PEOPLE_POSITIONS pp on p.id = pp.people_id',
'where   is_deleted != 1 and position_id = 2  and p.developer is null order by p.surname ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767005812535735)
,p_name=>'P7_IT_OWN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'IT owner'
,p_source=>'Select IT_OWNER from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.name || '' '' || p.surname, p.id from PEV_T_PEOPLES p',
'join PEV_T_PEOPLE_POSITIONS pp on p.id = pp.people_id',
'where   is_deleted != 1 and position_id = 3  and p.developer is null order by p.surname;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767102081535736)
,p_name=>'P7_DEVELOPER_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_1'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_1 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767256810535737)
,p_name=>'P7_DEVELOPER_2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_2'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_2 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767361195535738)
,p_name=>'P7_DEVELOPER_3'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_3'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_3 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767471314535739)
,p_name=>'P7_DEVELOPER_4'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_4'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_4 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767557581535740)
,p_name=>'P7_DEVELOPER_5'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_source=>'select partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_5'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nazev  || '' - ''|| adr_ulice || '' ''||  adr_mesto ,partner_id from ucetni_partneri where nazev = :P7_AUTO_DEV_5 ',
''))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767737817535742)
,p_name=>'P7_OZ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('O\010Dek\00E1van\00E9 zah\00E1jen\00ED')
,p_source=>'Select START_DATE_EXPECT from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767825466535743)
,p_name=>'P7_OU'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('O\010Dek\00E1van\00E9 ukon\010Den\00ED')
,p_source=>'Select END_DATE_EXP from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919767964353535744)
,p_name=>'P7_RZ'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('Re\00E1ln\00E9 zah\00E1jen\00ED')
,p_source=>'Select START_DATE_REAL from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919768008651535745)
,p_name=>'P7_RU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('Re\00E1ln\00E9 ukon\010Den\00ED')
,p_source=>'Select END_DATE_REAL from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919768136838535746)
,p_name=>'P7_ARCH_NAVRH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('Architektonick\00FD n\00E1vrh')
,p_source=>'Select LAYOUT from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:ANO;1,NE;2'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919768386227535748)
,p_name=>'P7_URL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('URL arch. n\00E1vrhu')
,p_source=>'Select LAYOUT_URL from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919768890374535753)
,p_name=>'P7_BUDGET'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Budget v K\010D')
,p_source=>'Select TO_CHAR(budget, ''999G999G999G999G999MI'') from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919886315710690104)
,p_name=>'P7_TER_SCH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('Term\00EDn schv\00E1len\00ED budget')
,p_source=>'Select BUDGET_APPROVE_DATE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919886479536690105)
,p_name=>'P7_FORECAST'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Forecast v K\010D')
,p_source=>'select TO_CHAR(forecast, ''999G999G999G999G999MI'') from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919886568104690106)
,p_name=>'P7_TER_SCH_FK'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('Term\00EDn schv\00E1len\00ED forecast')
,p_source=>'Select FORECAST_APPROVE_DATE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_encrypt_session_state_yn=>'N'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919886640366690107)
,p_name=>'P7_EMAIL_BO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919887500911690116)
,p_name=>'P7_EMAIL_PM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919887667577690117)
,p_name=>'P7_EMAIL_IT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919887778864690118)
,p_name=>'P7_TEL_BO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919887831452690119)
,p_name=>'P7_TEL_IT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(919766745519535732)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919887908663690120)
,p_name=>'P7_DEV_NAME_1'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=1'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name || '' '' || surname,id from PEV_T_PEOPLES ',
'            where DEVELOPER= :P7_DEVELOPER_1 and IS_DELETED != 1 order by surname'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_1'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888081732690121)
,p_name=>'P7_DEV_NAME_2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=2'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname,id from PEV_T_PEOPLES where DEVELOPER= :P7_DEVELOPER_2 and IS_DELETED != 1 order by surname'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_2'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888097175690122)
,p_name=>'P7_DEV_NAME_3'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=3'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname,id from PEV_T_PEOPLES where DEVELOPER= :P7_DEVELOPER_3 and IS_DELETED != 1 order by surname'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_3'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888229835690123)
,p_name=>'P7_DEV_NAME_4'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=4'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname,id from PEV_T_PEOPLES where DEVELOPER=  :P7_DEVELOPER_4 and IS_DELETED != 1 order by surname'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_4'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888384992690124)
,p_name=>'P7_DEV_NAME_5'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_use_cache_before_default=>'NO'
,p_source=>'select people_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order=5'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname,id from PEV_T_PEOPLES where DEVELOPER= :P7_DEVELOPER_5 and IS_DELETED != 1 order by surname'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P7_DEVELOPER_5'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888426764690125)
,p_name=>'P7_EMAIL_DEV_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888553070690126)
,p_name=>'P7_EMAIL_DEV_2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888600387690127)
,p_name=>'P7_EMAIL_DEV_3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888722336690128)
,p_name=>'P7_EMAIL_DEV_4'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919888838657690129)
,p_name=>'P7_EMAIL_DEV_5'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919889657998690137)
,p_name=>'P7_TEL_DEV_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919889747835690138)
,p_name=>'P7_TEL_DEV_2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919889871189690139)
,p_name=>'P7_TEL_DEV_3'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919889918921690140)
,p_name=>'P7_TEL_DEV_4'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919890050584690141)
,p_name=>'P7_TEL_DEV_5'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Telefon'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919958551867852608)
,p_name=>'P7_PROJECT_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919958823096852611)
,p_name=>'P7_SCH_FORECAST'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(919767665262535741)
,p_prompt=>unistr('Forecast Schv\00E1lil')
,p_source=>'Select FORECAST_APPROVE from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name || '' '' || surname,id from PEV_T_PEOPLES ',
'            where  IS_DELETED != 1  and developer is null'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919960288418852625)
,p_name=>'P7_DEPARTMENT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>unistr('odd\011Blen\00ED')
,p_source=>'Select DEPARTMENT from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lekarna_id ||'' - ''|| lekarna,lekarna_id from lekarny where lekarna_id between 900 and 999',
'order by lekarna_id;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919960614045852629)
,p_name=>'P7_IDENTIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(919765738026535722)
,p_prompt=>'Identification'
,p_source=>'Select IDENTIFICATION from PEV_T_PROJECTS where id = :P7_PROJECT_ID'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name,id from PEV_T_LOV_PROJECT_IDENTIFY where is_deleted != 1'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919962005096852643)
,p_name=>'P7_AUTO_DEV_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 1'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 1)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919962171893852644)
,p_name=>'P7_AUTO_DEV_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 2'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 2)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919962214027852645)
,p_name=>'P7_AUTO_DEV_3'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 3'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 3)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919962308558852646)
,p_name=>'P7_AUTO_DEV_4'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 4'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 4)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(919962465981852647)
,p_name=>'P7_AUTO_DEV_5'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(461062638453021101)
,p_prompt=>'Developer 5'
,p_source=>'select nazev from ucetni_partneri where partner_id in (select developer_id from PEV_T_PROJECT_DEVELOPER where project_id = :P7_PROJECT_ID and developer_order = 5)'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select nazev from ucetni_partneri'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(2341738604382226269)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'Y'
,p_attribute_10=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(460104473822939724)
,p_validation_name=>'Validace na stejne developery'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P7_DEVELOPER_1 != :P7_DEVELOPER_2 AND',
':P7_DEVELOPER_1 != :P7_DEVELOPER_3 AND',
':P7_DEVELOPER_1 != :P7_DEVELOPER_4 AND',
':P7_DEVELOPER_1 != :P7_DEVELOPER_5 AND',
':P7_DEVELOPER_1 != :P7_DEVELOPER_6 AND',
':P7_DEVELOPER_1 != :P7_DEVELOPER_7 AND',
':P7_DEVELOPER_2 != :P7_DEVELOPER_3 AND',
':P7_DEVELOPER_2 != :P7_DEVELOPER_4 AND',
':P7_DEVELOPER_2 != :P7_DEVELOPER_5 AND',
':P7_DEVELOPER_2 != :P7_DEVELOPER_6 AND',
':P7_DEVELOPER_2 != :P7_DEVELOPER_7 AND',
':P7_DEVELOPER_3 != :P7_DEVELOPER_4 AND',
':P7_DEVELOPER_3 != :P7_DEVELOPER_5 AND',
':P7_DEVELOPER_3 != :P7_DEVELOPER_6 AND',
':P7_DEVELOPER_3 != :P7_DEVELOPER_7 AND',
':P7_DEVELOPER_4 != :P7_DEVELOPER_5 AND',
':P7_DEVELOPER_4 != :P7_DEVELOPER_6 AND',
':P7_DEVELOPER_4 != :P7_DEVELOPER_7 AND',
':P7_DEVELOPER_5 != :P7_DEVELOPER_6 AND',
':P7_DEVELOPER_5 != :P7_DEVELOPER_7 AND',
':P7_DEVELOPER_6 != :P7_DEVELOPER_7'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Developer mus\00ED b\00FDt unik\00E1tn\00ED')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(460347760911803450)
,p_validation_name=>'nazev'
,p_validation_sequence=>20
,p_validation=>'P7_NAZEV_PRO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('n\00E1zev nesm\00ED b\00FDt pr\00E1zdn\00FD')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919887069055690111)
,p_name=>'show_email_phone_BO'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_BUS_OWNER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919887141888690112)
,p_event_id=>wwv_flow_imp.id(919887069055690111)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_BUS_OWNER;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_BO,:P7_TEL_BO',
'from PEV_T_PEOPLES',
'where ID = :P7_BUS_OWNER;',
'ELSE ',
':P7_EMAIL_BO := null;',
':P7_TEL_BO := null;',
'END IF;',
'END;',
'',
'',
''))
,p_attribute_02=>'P7_BUS_OWNER'
,p_attribute_03=>'P7_EMAIL_BO,P7_TEL_BO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461181841014131913)
,p_name=>'show_email_phone_BO_1'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461181956896131914)
,p_event_id=>wwv_flow_imp.id(461181841014131913)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_BUS_OWNER;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_BO,:P7_TEL_BO',
'from PEV_T_PEOPLES',
'where ID = :P7_BUS_OWNER;',
'ELSE ',
':P7_EMAIL_BO := null;',
':P7_TEL_BO := null;',
'END IF;',
'END;',
'',
'',
''))
,p_attribute_02=>'P7_BUS_OWNER'
,p_attribute_03=>'P7_EMAIL_BO,P7_TEL_BO'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919887384658690114)
,p_name=>'show_email_phone_PM'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PRO_MAN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919887446370690115)
,p_event_id=>wwv_flow_imp.id(919887384658690114)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_PRO_MAN;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_PM,:P7_TEL_PM',
'from PEV_T_PEOPLES',
'where ID = :P7_PRO_MAN;',
'ELSE ',
':P7_EMAIL_PM := null;',
':P7_TEL_PM := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_PRO_MAN'
,p_attribute_03=>'P7_EMAIL_PM,P7_TEL_PM'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461182093273131915)
,p_name=>'show_email_phone_PM_1'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461182198024131916)
,p_event_id=>wwv_flow_imp.id(461182093273131915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_PRO_MAN;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_PM,:P7_TEL_PM',
'from PEV_T_PEOPLES',
'where ID = :P7_PRO_MAN;',
'ELSE ',
':P7_EMAIL_PM := null;',
':P7_TEL_PM := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_PRO_MAN'
,p_attribute_03=>'P7_EMAIL_PM,P7_TEL_PM'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919958958685852612)
,p_name=>'show_email_phone_IT'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_IT_OWN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919959003018852613)
,p_event_id=>wwv_flow_imp.id(919958958685852612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_IT_OWN;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_IT,:P7_TEL_IT',
'from PEV_T_PEOPLES',
'where ID = :P7_IT_OWN;',
'ELSE ',
':P7_EMAIL_IT := null;',
':P7_TEL_IT := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_IT_OWN'
,p_attribute_03=>'P7_EMAIL_IT,P7_TEL_IT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461182204200131917)
,p_name=>'show_email_phone_IT_1'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461182375544131918)
,p_event_id=>wwv_flow_imp.id(461182204200131917)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_IT_OWN;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_IT,:P7_TEL_IT',
'from PEV_T_PEOPLES',
'where ID = :P7_IT_OWN;',
'ELSE ',
':P7_EMAIL_IT := null;',
':P7_TEL_IT := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_IT_OWN'
,p_attribute_03=>'P7_EMAIL_IT,P7_TEL_IT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919959181698852614)
,p_name=>'show_email_phone_DEV_N_1'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919959281813852615)
,p_event_id=>wwv_flow_imp.id(919959181698852614)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_1;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_1,:P7_TEL_DEV_1',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_1;',
'ELSE ',
':P7_EMAIL_DEV_1 := null;',
':P7_TEL_DEV_1 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_1'
,p_attribute_03=>'P7_EMAIL_DEV_1,P7_TEL_DEV_1'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461066701593021142)
,p_name=>'show_email_phone_DEV_N_1_1'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461066824586021143)
,p_event_id=>wwv_flow_imp.id(461066701593021142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_1;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_1,:P7_TEL_DEV_1',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_1;',
'ELSE ',
':P7_EMAIL_DEV_1 := null;',
':P7_TEL_DEV_1 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_1'
,p_attribute_03=>'P7_EMAIL_DEV_1,P7_TEL_DEV_1'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919959320937852616)
,p_name=>'show_email_phone_DEV_N_2'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919959439049852617)
,p_event_id=>wwv_flow_imp.id(919959320937852616)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_2;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_2,:P7_TEL_DEV_2',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_2;',
'ELSE ',
':P7_EMAIL_DEV_2 := null;',
':P7_TEL_DEV_2 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_2'
,p_attribute_03=>'P7_EMAIL_DEV_2,P7_TEL_DEV_2'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461066950945021144)
,p_name=>'show_email_phone_DEV_N_2_1'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461067065602021145)
,p_event_id=>wwv_flow_imp.id(461066950945021144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_2;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_2,:P7_TEL_DEV_2',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_2;',
'ELSE ',
':P7_EMAIL_DEV_2 := null;',
':P7_TEL_DEV_2 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_2'
,p_attribute_03=>'P7_EMAIL_DEV_2,P7_TEL_DEV_2'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919959535057852618)
,p_name=>'show_email_phone_DEV_N_3'
,p_event_sequence=>130
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_3'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919959594413852619)
,p_event_id=>wwv_flow_imp.id(919959535057852618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_3;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_3,:P7_TEL_DEV_3',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_3;',
'ELSE ',
':P7_EMAIL_DEV_3 := null;',
':P7_TEL_DEV_3 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_3'
,p_attribute_03=>'P7_EMAIL_DEV_3,P7_TEL_DEV_3'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461067139564021146)
,p_name=>'show_email_phone_DEV_N_3_1'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461067217204021147)
,p_event_id=>wwv_flow_imp.id(461067139564021146)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_3;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_3,:P7_TEL_DEV_3',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_3;',
'ELSE ',
':P7_EMAIL_DEV_3 := null;',
':P7_TEL_DEV_3 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_3'
,p_attribute_03=>'P7_EMAIL_DEV_3,P7_TEL_DEV_3'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919959710507852620)
,p_name=>'show_email_phone_DEV_N_4'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_4'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919959813596852621)
,p_event_id=>wwv_flow_imp.id(919959710507852620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_4;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_4,:P7_TEL_DEV_4',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_4;',
'ELSE ',
':P7_EMAIL_DEV_4 := null;',
':P7_TEL_DEV_4 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_4'
,p_attribute_03=>'P7_EMAIL_DEV_4,P7_TEL_DEV_4'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461067355242021148)
,p_name=>'show_email_phone_DEV_N_4_1'
,p_event_sequence=>160
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461067456059021149)
,p_event_id=>wwv_flow_imp.id(461067355242021148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_4;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_4,:P7_TEL_DEV_4',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_4;',
'ELSE ',
':P7_EMAIL_DEV_4 := null;',
':P7_TEL_DEV_4 := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_4'
,p_attribute_03=>'P7_EMAIL_DEV_4,P7_TEL_DEV_4'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919959917322852622)
,p_name=>'show_email_phone_DEV_N_5'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919960019025852623)
,p_event_id=>wwv_flow_imp.id(919959917322852622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_5;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_5,:P7_TEL_DEV_5',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_5;',
'ELSE ',
':P7_EMAIL_DEV_5   := null;',
':P7_TEL_DEV_5     := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_5'
,p_attribute_03=>'P7_EMAIL_DEV_5,P7_TEL_DEV_5'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460996547346176747)
,p_name=>'show_email_phone_DEV_N_6'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_6'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460996637035176748)
,p_event_id=>wwv_flow_imp.id(460996547346176747)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_6;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_6,:P7_TEL_DEV_6',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_6;',
'ELSE ',
':P7_EMAIL_DEV_6   := null;',
':P7_TEL_DEV_6     := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_6'
,p_attribute_03=>'P7_EMAIL_DEV_6,P7_TEL_DEV_6'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(471872693261973620)
,p_name=>'show_email_phone_DEV_N_7'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_DEV_NAME_7'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471872784117973621)
,p_event_id=>wwv_flow_imp.id(471872693261973620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_7;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_7,:P7_TEL_DEV_7',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_7;',
'ELSE ',
':P7_EMAIL_DEV_7   := null;',
':P7_TEL_DEV_7     := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_7'
,p_attribute_03=>'P7_EMAIL_DEV_7,P7_TEL_DEV_7'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461067523913021150)
,p_name=>'show_email_phone_DEV_N_5_1'
,p_event_sequence=>200
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461180691315131901)
,p_event_id=>wwv_flow_imp.id(461067523913021150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_5;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_5,:P7_TEL_DEV_5',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_5;',
'ELSE ',
':P7_EMAIL_DEV_5   := null;',
':P7_TEL_DEV_5     := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_5'
,p_attribute_03=>'P7_EMAIL_DEV_5,P7_TEL_DEV_5'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460996349473176745)
,p_name=>'show_email_phone_DEV_N_6_1'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460996493375176746)
,p_event_id=>wwv_flow_imp.id(460996349473176745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_6;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_6,:P7_TEL_DEV_6',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_6;',
'ELSE ',
':P7_EMAIL_DEV_6   := null;',
':P7_TEL_DEV_6     := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_6'
,p_attribute_03=>'P7_EMAIL_DEV_6,P7_TEL_DEV_6'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(471872470497973618)
,p_name=>'show_email_phone_DEV_N_7_1'
,p_event_sequence=>220
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471872509722973619)
,p_event_id=>wwv_flow_imp.id(471872470497973618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PEOPLES where ID = :P7_DEV_NAME_7;',
'IF( cnt > 0 )',
'THEN',
'select EMAIL,PHONE_NUMBER',
'into :P7_EMAIL_DEV_7,:P7_TEL_DEV_7',
'from PEV_T_PEOPLES',
'where ID = :P7_DEV_NAME_7;',
'ELSE ',
':P7_EMAIL_DEV_7  := null;',
':P7_TEL_DEV_7     := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_DEV_NAME_7'
,p_attribute_03=>'P7_EMAIL_DEV_7,P7_TEL_DEV_7'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919958239866852605)
,p_name=>'show_hide_url'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_ARCH_NAVRH'
,p_condition_element=>'P7_ARCH_NAVRH'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919958292725852606)
,p_event_id=>wwv_flow_imp.id(919958239866852605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_URL'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919958462635852607)
,p_event_id=>wwv_flow_imp.id(919958239866852605)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_URL'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460829411465863645)
,p_event_id=>wwv_flow_imp.id(919958239866852605)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_URL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920269649982631705)
,p_name=>'DEV_ID_1'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920269850251631707)
,p_event_id=>wwv_flow_imp.id(920269649982631705)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_1'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920269988789631708)
,p_event_id=>wwv_flow_imp.id(920269649982631705)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920270222458631711)
,p_name=>'DEV_ID_2'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920270888158631717)
,p_event_id=>wwv_flow_imp.id(920270222458631711)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_2'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920270424005631713)
,p_event_id=>wwv_flow_imp.id(920270222458631711)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920270895324631718)
,p_name=>'DEV_ID_3'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_3'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920271256110631721)
,p_event_id=>wwv_flow_imp.id(920270895324631718)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_3'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920271120576631720)
,p_event_id=>wwv_flow_imp.id(920270895324631718)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_3'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920271327492631722)
,p_name=>'DEV_ID_4'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_4'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920271611168631725)
,p_event_id=>wwv_flow_imp.id(920271327492631722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_4'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920271578077631724)
,p_event_id=>wwv_flow_imp.id(920271327492631722)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_4'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(920271706126631726)
,p_name=>'DEV_ID_5'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_5'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920272069933631729)
,p_event_id=>wwv_flow_imp.id(920271706126631726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_5'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(920271984435631728)
,p_event_id=>wwv_flow_imp.id(920271706126631726)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_5'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460996704246176749)
,p_name=>'DEV_ID_6'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_6'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460996885630176750)
,p_event_id=>wwv_flow_imp.id(460996704246176749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_6'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470501214006308201)
,p_event_id=>wwv_flow_imp.id(460996704246176749)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_6'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(471872866108973622)
,p_name=>'DEV_ID_7'
,p_event_sequence=>300
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_7'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471872909241973623)
,p_event_id=>wwv_flow_imp.id(471872866108973622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_7'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471873098967973624)
,p_event_id=>wwv_flow_imp.id(471872866108973622)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_7'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919962642941852649)
,p_name=>'hide_dev_id'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919962714169852650)
,p_event_id=>wwv_flow_imp.id(919962642941852649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_1'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460252678081466304)
,p_name=>'hide_dev_id_2'
,p_event_sequence=>320
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460252757339466305)
,p_event_id=>wwv_flow_imp.id(460252678081466304)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_2'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460252831824466306)
,p_name=>'hide_dev_id_3'
,p_event_sequence=>330
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460252932609466307)
,p_event_id=>wwv_flow_imp.id(460252831824466306)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_3'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460253029881466308)
,p_name=>'hide_dev_id_4'
,p_event_sequence=>340
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460253184608466309)
,p_event_id=>wwv_flow_imp.id(460253029881466308)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_4'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460253237640466310)
,p_name=>'hide_dev_id_5'
,p_event_sequence=>350
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460253364745466311)
,p_event_id=>wwv_flow_imp.id(460253237640466310)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_5'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460253930534466317)
,p_name=>'DEV_ID_1_DELETE'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_1'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_1_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_1_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_1_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460103407453939714)
,p_event_id=>wwv_flow_imp.id(460253930534466317)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_1'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460254007169466318)
,p_event_id=>wwv_flow_imp.id(460253930534466317)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460103505950939715)
,p_event_id=>wwv_flow_imp.id(460253930534466317)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460105951666939739)
,p_event_id=>wwv_flow_imp.id(460253930534466317)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_DEVELOPER_1'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460255588926466333)
,p_name=>'DEV_ID_2_DELETE'
,p_event_sequence=>370
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_2'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_2_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_2_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_2_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460255660378466334)
,p_event_id=>wwv_flow_imp.id(460255588926466333)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_2'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460255776870466335)
,p_event_id=>wwv_flow_imp.id(460255588926466333)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_2'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460255842047466336)
,p_event_id=>wwv_flow_imp.id(460255588926466333)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_2'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460256093061466338)
,p_name=>'DEV_ID_3_DELETE'
,p_event_sequence=>380
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_3'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_3_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_3_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_3_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460256187677466339)
,p_event_id=>wwv_flow_imp.id(460256093061466338)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_3'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460256278006466340)
,p_event_id=>wwv_flow_imp.id(460256093061466338)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P7_AUTO_DEV_3'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460256356162466341)
,p_event_id=>wwv_flow_imp.id(460256093061466338)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_3'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460256570104466343)
,p_name=>'DEV_ID_4_DELETE'
,p_event_sequence=>390
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_4'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_4_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_4_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_4_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460256636691466344)
,p_event_id=>wwv_flow_imp.id(460256570104466343)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_4'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460256776812466345)
,p_event_id=>wwv_flow_imp.id(460256570104466343)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
''))
,p_attribute_02=>'P7_AUTO_DEV_4'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460256880783466346)
,p_event_id=>wwv_flow_imp.id(460256570104466343)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_4'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460257092552466348)
,p_name=>'DEV_ID_5_DELETE'
,p_event_sequence=>400
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_5'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_5_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_5_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_5_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460257163116466349)
,p_event_id=>wwv_flow_imp.id(460257092552466348)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_5'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460257252948466350)
,p_event_id=>wwv_flow_imp.id(460257092552466348)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
''))
,p_attribute_02=>'P7_AUTO_DEV_5'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460342801689803401)
,p_event_id=>wwv_flow_imp.id(460257092552466348)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_5'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(470501392541308202)
,p_name=>'DEV_ID_6_DELETE'
,p_event_sequence=>410
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_6'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_6_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_6_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_6_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470501457459308203)
,p_event_id=>wwv_flow_imp.id(470501392541308202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_6'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470501590920308204)
,p_event_id=>wwv_flow_imp.id(470501392541308202)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
''))
,p_attribute_02=>'P7_AUTO_DEV_6'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(470501623994308205)
,p_event_id=>wwv_flow_imp.id(470501392541308202)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_6'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(471873156333973625)
,p_name=>'DEV_ID_7_DELETE'
,p_event_sequence=>420
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_AUTO_DEV_7'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_7_HIDDEN").value == "" || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_7_HIDDEN").value.length == 0 || document.getElementById("oj-inputsearch-input-P7_AUTO_DEV_7_HIDDEN").value=='
||' null',
''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471873241042973626)
,p_event_id=>wwv_flow_imp.id(471873156333973625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_7'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471873340093973627)
,p_event_id=>wwv_flow_imp.id(471873156333973625)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'null;',
''))
,p_attribute_02=>'P7_AUTO_DEV_7'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471873432929973628)
,p_event_id=>wwv_flow_imp.id(471873156333973625)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_7'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460345119748803424)
,p_name=>'New'
,p_event_sequence=>430
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460345318137803426)
,p_event_id=>wwv_flow_imp.id(460345119748803424)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_DEVELOPER_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(460829908213863650)
,p_name=>'refresh_import'
,p_event_sequence=>440
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(919890115761690142)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460991951828176701)
,p_event_id=>wwv_flow_imp.id(460829908213863650)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460825158253863602)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461064975389021124)
,p_name=>'refresh_import_1'
,p_event_sequence=>450
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461065090908021125)
,p_event_id=>wwv_flow_imp.id(461064975389021124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460825158253863602)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(112280382788819030)
,p_name=>'show_forecast'
,p_event_sequence=>460
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112280482235819031)
,p_event_id=>wwv_flow_imp.id(112280382788819030)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'BEGIN',
'SELECT COUNT(*)',
'INTO cnt',
'FROM PEV_T_PROJECTS where ID = :P7_PROJECT_ID;',
'IF( cnt > 0 )',
'THEN',
'select TO_CHAR(forecast, ''999G999G999G999G999MI'')',
'into :P7_FORECAST',
'from PEV_T_PROJECTS',
'where ID = :P7_PROJECT_ID;',
'ELSE ',
':P7_FORECAST  := null;',
'END IF;',
'END;'))
,p_attribute_02=>'P7_PROJECT_ID'
,p_attribute_03=>'P7_FORECAST'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(112282256776819049)
,p_name=>'disable_forecast_budget'
,p_event_sequence=>530
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P7_EDIT_FLAG'
,p_display_when_cond2=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(112282354859819050)
,p_event_id=>wwv_flow_imp.id(112282256776819049)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_BUDGET,P7_FORECAST'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'document.getElementById("P7_BUDGET").readOnly = true;',
'document.getElementById("P7_FORECAST").readOnly = true;',
'document.getElementById("P7_BUDGET").style.color = ''grey'';',
'document.getElementById("P7_FORECAST").style.color = ''grey'';',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(166741618653339415)
,p_name=>'refresh_poznamka'
,p_event_sequence=>540
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(166741914220339418)
,p_event_id=>wwv_flow_imp.id(166741618653339415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_P_JOURNAL'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT record_date || '' '' || text  FROM pev_t_project_logbook',
'WHERE  updated_date = (',
'    SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1 AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1))',
'                OR',
'                created_date = (',
'    SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1 AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1))',
'AND record_date = (',
'    SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = :P7_PROJECT_ID AND is_deleted != 1)',
'AND is_deleted != 1',
'AND  project_id = :P7_PROJECT_ID',
'AND  rownum = 1;'))
,p_attribute_07=>'P7_P_JOURNAL'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(166741730333339416)
,p_event_id=>wwv_flow_imp.id(166741618653339415)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P7_P_JOURNAL1'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919960548177852628)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update_projects'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
unistr('        IF  :P7_PROJECT_ID  IS NULL THEN   apex_application.g_print_success_message := ''<span style="color:white">Projekt vytvo\0159en </span>'';'),
unistr('        ELSE apex_application.g_print_success_message := ''<span style="color:white">Projekt aktualizov\00E1n</span>'';'),
'        END IF;',
'',
'pev_k_main.upd_projects(    ',
'                                    p_id                                         => :P7_PROJECT_ID,',
'                                    p_name                                       => :P7_NAZEV_PRO,					',
'				                    p_project_state                              => :P7_STAV,		',
'				                    p_identification                             => :p7_IDENTIFICATION,			',
'				                    p_project_status                             => :P7_STATUS,			',
'				                    p_kakadu_number                              => :P7_KAKADU,			',
'				                    p_bdc_number                                 => :P7_BDC,		',
'				                    p_bdc_ops                                    => :p7_BDC_OPS,				',
'				                    p_department                                 => :P7_DEPARTMENT ,				 ',
'				                    p_project_manager                            => :P7_PRO_MAN ,		',
'				                    p_business_owner                             => :P7_BUS_OWNER,			',
'				                    p_it_owner                                   => :P7_IT_OWN,',
'                                    id_out                                       => :P7_PROJECT_ID,',
'                                    p_budget_approve                             => :P7_SCH_BUDGET,',
'                                    p_forecast_approve                           => :P7_SCH_FORECAST,',
'                                    p_note                                       => :P7_P_NOTE,',
'                                    p_approve                                    => :P7_APPROVE,',
'                                    p_email                                      => 0,',
'    ',
'',
'    ',
'				                    p_start_date_expect                          =>     to_date( ',
'   to_char(to_date(:P7_OZ)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),		',
'				                    p_start_date_real                            => to_date( ',
'   to_char(to_date(:P7_RZ)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),	',
'				                    p_end_date_exp                               => to_date( ',
'   to_char(to_date(:P7_OU)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),		',
'				                    p_end_date_real                              => to_date( ',
'   to_char(to_date(:P7_RU)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),		',
'	',
'        ',
'        ',
'        ',
'         ',
'       ',
'        ',
'				                    p_budget                                     => :P7_BUDGET,					',
'				                    p_forecast                                   => :P7_FORECAST,',
'    ',
'    ',
'				                    p_forecast_approve_date                      => to_date( ',
'   to_char(to_date(:P7_TER_SCH_FK)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  ),	',
'    ',
'    ',
'    ',
'				                    p_project_description                        => :P7_P_PROJEKTU,	',
'				                    p_descr_scope                                => :P7_P_SCOPE,				',
'				                    p_layout                                     => :P7_ARCH_NAVRH,					',
'				                    p_layout_url                                =>  :P7_URL,',
'                             ',
'  				                    p_budget_approve_date                      => to_date( ',
'   to_char(to_date(:P7_TER_SCH)),',
'   ''DD.MM.YYYY HH24:MI:SS''',
'  )',
'                               ',
'                             ',
'                             ',
'                             ',
'                             );',
'                             ',
'                             ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919960113730852624)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919961378038852636)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update_developer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'cnt NUMBER;',
'type dev is table of NUMBER;',
'type pep is table of NUMBER;',
'collection_of_dev dev := dev(:P7_DEVELOPER_1,:P7_DEVELOPER_2,:P7_DEVELOPER_3,:P7_DEVELOPER_4,:P7_DEVELOPER_5,:P7_DEVELOPER_6,:P7_DEVELOPER_7);',
'collection_of_pep pep := pep(:P7_DEV_NAME_1,:P7_DEV_NAME_2,:P7_DEV_NAME_3,:P7_DEV_NAME_4,:P7_DEV_NAME_5,:P7_DEV_NAME_6,:P7_DEV_NAME_7);',
'BEGIN',
'FOR i in 1..7',
'loop',
'',
'                                PEV_K_MAIN.upd_project_developer(',
'                                p_project_id => :P7_PROJECT_ID,',
'							    p_developer_id => collection_of_dev(i),					',
'								p_people_id =>   collection_of_pep(i),		',
'								p_developer_order => i				',
'										);',
'end loop;',
'',
'',
'',
'END;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919960113730852624)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(919961246770852635)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear session'
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'7'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P7_PROJECT_ID'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_is_stateful_y_n=>'Y'
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
