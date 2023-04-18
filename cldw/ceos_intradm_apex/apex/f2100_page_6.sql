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
--     PAGE: 6
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00006
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>6);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>unistr('P\0159ehled')
,p_step_title=>unistr('P\0159ehled')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Define in the ''Execute when Page Loads'' page attribute',
'$( "#rep_prehled_projektu" ).on( "interactivereportviewchange", function( event, data ) {',
'    // add code to fire on selection change ',
'    alert (''aaa'');',
'} );'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'td[headers="NR_1_Budget"] {',
'  text-align: right;',
'}',
'td[headers="NR_1_Forecast"] {',
'  text-align: right;',
'}',
'',
'.file_null { display: none; }'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'JARDA'
,p_last_upd_yyyymmddhh24miss=>'20220322214411'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7432271595184708)
,p_plug_name=>unistr('Projektov\00E1 evidence - P\0159ehled')
,p_region_name=>'prehled_projektu'
,p_icon_css_classes=>'fa-archive'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516892914132734118)
,p_plug_name=>unistr('Projektov\00E1 evidence - P\0159ehled')
,p_region_name=>'rep_prehled_projektu'
,p_parent_plug_id=>wwv_flow_imp.id(7432271595184708)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  p.ID as EDIT,',
'       p.ID,',
'       p.ID as IDCKO,',
unistr('       apex_item.checkbox2(1, p.approve, CASE WHEN p.approve = 1 THEN ''CHECKED'' ELSE '''' END || '' DISABLED'' ) "Ke Schv\00E1len\00ED",'),
' --            CASE fil.file_name ',
' --   WHEN ''0'' THEN ''<span aria-hidden="true" class="fa fa-paperclip"></span>''',
'  --  ELSE null;',
' -- END as prilo,',
'       ',
'        (select  ''<span aria-hidden="true" class="fa fa-paperclip"></span>''',
'from PEV_T_FILES fil where fil.project_id = p.id fetch first 1 row only',
unistr('    ) as P\0158ILOHY,'),
'       p.NAME,',
'       state_name as PROJECT_STATE,',
'       pif.name as IDENTIFICATION,',
'       status_name as PROJECT_STATUS,',
'       p.KAKADU_NUMBER,',
'        CASE ',
'            WHEN sysdate > TRUNC(sysdate, ''YEAR'')+25   THEN',
'    (select sum(VALUE_EV)',
'           from PEV_M_INVOICE_SALDO_AGG sal',
'           where sal.PARTNER_KEY in',
'             (',
'                 select developer_id from PEV_T_PROJECT_DEVELOPER pd where p.id = pd.project_id',
'             )',
'            and sal.kakadu_key = p.kakadu_number  and sal.PERIOD_MONTH_KEY between TRUNC(sysdate, ''YEAR'') and ADD_MONTHS(TRUNC(sysdate,''YEAR'')-1,12)',
'             ',
'            ) ',
'            ',
'            ELSE',
'            ',
'    (select sum(VALUE_EV)',
'           from PEV_M_INVOICE_SALDO_AGG sal',
'           where sal.PARTNER_KEY in',
'             (',
'                 select developer_id from PEV_T_PROJECT_DEVELOPER pd where p.id = pd.project_id',
'             )',
'            and sal.kakadu_key = p.kakadu_number  and sal.PERIOD_MONTH_KEY between ADD_MONTHS(TRUNC(sysdate,''YEAR''),-12)  and TRUNC(sysdate, ''YEAR'')-1',
'             ',
'            ) ',
'',
unistr('            END as "Re\00E1l",'),
'',
'     (SELECT record_date || '' '' || text  FROM pev_t_project_logbook',
'            WHERE  ( updated_date = (',
'                SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                    THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = p.ID AND is_deleted != 1 AND record_date = (',
'                        SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = p.ID AND is_deleted != 1))',
'            OR',
'                created_date = (',
'                        SELECT MAX(CASE WHEN (updated_date IS NULL OR created_date > updated_date)',
'                            THEN created_date ELSE updated_date END) AS MaxDate FROM pev_t_project_logbook WHERE project_id = p.ID AND is_deleted != 1 AND record_date = (',
'                                SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = p.ID AND is_deleted != 1))',
'            AND record_date = (',
'                        SELECT MAX(record_date) FROM pev_t_project_logbook WHERE project_id = p.ID AND is_deleted != 1)',
'                        )',
'            AND is_deleted != 1',
'            AND  project_id = p.ID',
unistr('            AND  rownum = 1 )  as "Posledn\00ED z\00E1znam den\00EDku",     '),
'',
'       p.BDC_NUMBER,',
'       p.BDC_OPS,',
'       lek.lekarna_id || '' - '' || lek.lekarna as DEPARTMENT,',
'       p_pm.name || '' '' || p_pm.surname PROJECT_MANAGER,',
'       p_bo.name || '' '' || p_bo.surname BUSINESS_OWNER,',
'       p_io.name || '' '' || p_io.surname IT_OWNER,',
'       START_DATE_EXPECT,',
'       START_DATE_REAL,',
'       END_DATE_EXP,',
'       END_DATE_REAL,',
'       --ROUND(p.BUDGET,2) as BUDGET,',
'       --ROUND(p.FORECAST,2) as FORECAST,',
'       p.BUDGET,',
'       p.FORECAST,',
'       p.FORECAST_APPROVE_DATE,',
'       p.PROJECT_DESCRIPTION,',
'       p.DESCR_SCOPE,',
'       p.note,',
'       DECODE ( p.LAYOUT, 1, ''ANO'', 2, ''NE'',''NE'') as LAYOUT,',
'       p.LAYOUT_URL,',
'       p.IS_DELETED,',
'       p.CREATED_DATE,',
'       p.CREATED_BY,',
'       p.UPDATED_DATE,',
'       p.UPDATED_BY,',
unistr('       p.PROJECT_CHANGE as "Posledn\00ED zm\011Bna"'),
'  from PEV_T_PROJECTS p',
'  LEFT JOIN',
'    PEV_T_LOV_PROJECT_STATUS st on st.id = p.PROJECT_STATUS and st.status_type = ''P''',
'  LEFT JOIN',
'    PEV_T_LOV_PROJECT_STATE ste on ste.id = p.PROJECT_STATE ',
'  LEFT JOIN',
'    PEV_T_LOV_PROJECT_IDENTIFY pif on pif.id = p.IDENTIFICATION ',
'  LEFT JOIN',
'    PEV_T_PEOPLES p_pm on p_pm.id = p.PROJECT_MANAGER ',
'  LEFT JOIN',
'    PEV_T_PEOPLES p_bo on p_bo.id = p.BUSINESS_OWNER ',
'  LEFT JOIN',
'    PEV_T_PEOPLES p_io on p_io.id = p.IT_OWNER',
'  --JOIN PEV_T_PROJECT_DEVELOPER pd on p.id = pd.project_id',
'  --LEFT JOIN PEV_T_FILES fil on fil.project_id = p.id',
'  ',
'  LEFT JOIN LEKARNY lek on lek.lekarna_id = p.department',
'  where ( p.is_deleted != 1 or p.is_deleted is null ) order by IDCKO desc',
'  ',
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
 p_id=>wwv_flow_imp.id(471847255876966021)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_owner=>'LSAROCKY'
,p_internal_uid=>471847255876966021
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471847318401966022)
,p_db_column_name=>'EDIT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Edit'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_PROJECT_ID,P7_KAKADU,P7_EDIT_FLAG:#ID#,#KAKADU_NUMBER#,Y'
,p_column_linktext=>'<span class="fa fa-pencil"></span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_rpt_show_filter_lov=>'N'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'NVL(:REQUEST,''EMPTY'') NOT IN(''CSV_N'',''XLSX_N'',''PDF_N'',''XML__N'',''RTF'',''HTMLD_N'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471847431372966023)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_link=>'javascript:void(0)'
,p_column_linktext=>'<span class="fa fa-plus-square-o"></span><span class="PROJECT_ID" style="display:none">#ID#</span>'
,p_column_link_attr=>'class="showDETAILprojektu"'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'NVL(:REQUEST,''EMPTY'') NOT IN(''CSV_N'',''XLSX_N'',''PDF_N'',''XML__N'',''RTF'',''HTMLD_N'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471847613253966025)
,p_db_column_name=>'NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('N\00E1zev')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471847739416966026)
,p_db_column_name=>'PROJECT_STATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Stav'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471847817309966027)
,p_db_column_name=>'IDENTIFICATION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Identification'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471847937351966028)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status (projektu)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848083723966029)
,p_db_column_name=>'KAKADU_NUMBER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('KaKadu \010D\00EDslo')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848131022966030)
,p_db_column_name=>unistr('Re\00E1l')
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Re\00E1l')
,p_column_html_expression=>unistr('<span style="white-space: nowrap;">#Re\00E1l#</span>')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848265244966031)
,p_db_column_name=>'BDC_NUMBER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('BDC \010D\00EDslo')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848375518966032)
,p_db_column_name=>'BDC_OPS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Bdc Ops'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848423346966033)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Odd\011Bl\011Bn\00ED')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848551548966034)
,p_db_column_name=>'PROJECT_MANAGER'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Project Manager'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848658350966035)
,p_db_column_name=>'BUSINESS_OWNER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Business Owner'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848776015966036)
,p_db_column_name=>'IT_OWNER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'It Owner'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848889090966037)
,p_db_column_name=>'START_DATE_EXPECT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('O\010Dek\00E1van\00E9 zah\00E1jen\00ED')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471848993880966038)
,p_db_column_name=>'START_DATE_REAL'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>unistr('Re\00E1ln\00E9 zah\00E1jen\00ED')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849053483966039)
,p_db_column_name=>'END_DATE_EXP'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>unistr('O\010Dek\00E1van\00E9 ukon\010Den\00ED')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849163607966040)
,p_db_column_name=>'END_DATE_REAL'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>unistr('Re\00E1ln\00E9 ukon\010Den\00ED')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849219008966041)
,p_db_column_name=>'BUDGET'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Budget'
,p_column_html_expression=>'<span style="white-space: nowrap;">#BUDGET#</span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G99999G999G999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849314632966042)
,p_db_column_name=>'FORECAST'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Forecast'
,p_column_html_expression=>'<span style="white-space: nowrap;">#FORECAST#</span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G99999G999G999'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849454572966043)
,p_db_column_name=>'FORECAST_APPROVE_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>unistr('Schv\00E1len\00ED FC')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849563108966044)
,p_db_column_name=>'PROJECT_DESCRIPTION'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Popis projektu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849679171966045)
,p_db_column_name=>'DESCR_SCOPE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Popis scope'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471871876602973612)
,p_db_column_name=>'NOTE'
,p_display_order=>250
,p_column_identifier=>'AF'
,p_column_label=>unistr('Pozn\00E1mka')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849743927966046)
,p_db_column_name=>'LAYOUT'
,p_display_order=>260
,p_column_identifier=>'Y'
,p_column_label=>unistr('Arch. n\00E1vrh')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849834470966047)
,p_db_column_name=>'LAYOUT_URL'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>unistr('URL n\00E1vrhu')
,p_column_html_expression=>unistr('<a href="#LAYOUT_URL#" target=\201D_blank\201D>#LAYOUT_URL#</span>')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471849926802966048)
,p_db_column_name=>'IS_DELETED'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Is Deleted'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471850083794966049)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471850177554966050)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471870777297973601)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>unistr('Posledn\00ED zm\011Bna')
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471870825189973602)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6348971969431614)
,p_db_column_name=>unistr('P\0158ILOHY')
,p_display_order=>330
,p_column_identifier=>'AO'
,p_column_label=>unistr('P\0159ilohy')
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP:P13_PROJECT_ID:#ID#'
,p_column_linktext=>unistr('#P\0158ILOHY#')
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'NVL(:REQUEST,''EMPTY'') NOT IN(''CSV_N'',''XLSX_N'',''PDF_N'',''XML__N'',''RTF'',''HTMLD_N'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7436070423184746)
,p_db_column_name=>unistr('Posledn\00ED zm\011Bna')
,p_display_order=>340
,p_column_identifier=>'AQ'
,p_column_label=>unistr('Posledn\00ED Zm\011Bna')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7436164900184747)
,p_db_column_name=>'IDCKO'
,p_display_order=>350
,p_column_identifier=>'AR'
,p_column_label=>'Idcko'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10416033590709211)
,p_db_column_name=>unistr('Ke Schv\00E1len\00ED')
,p_display_order=>370
,p_column_identifier=>'AU'
,p_column_label=>unistr('Ke Schv\00E1len\00ED')
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>'NVL(:REQUEST,''EMPTY'') NOT IN(''CSV_N'',''XLSX_N'',''PDF_N'',''XML__N'',''RTF'',''HTMLD_N'')'
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12814820677599115)
,p_db_column_name=>unistr('Posledn\00ED z\00E1znam den\00EDku')
,p_display_order=>380
,p_column_identifier=>'AX'
,p_column_label=>unistr('Posledn\00ED Z\00E1znam Den\00EDku')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(471887098024020712)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4718871'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('EDIT:ID:P\0158ILOHY:Ke Schv\00E1len\00ED:PROJECT_STATE:IDENTIFICATION:KAKADU_NUMBER:NAME:PROJECT_STATUS:BDC_NUMBER:DEPARTMENT:PROJECT_MANAGER:BUSINESS_OWNER:IT_OWNER:START_DATE_EXPECT:END_DATE_EXP:FORECAST_APPROVE_DATE:START_DATE_REAL:END_DATE_REAL:Re\00E1l:BUDGET:L')
||'AYOUT:LAYOUT_URL:'
,p_sort_column_1=>'ID'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'IDCKO'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>unistr('Posledn\00ED zm\011Bna')
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'PROJECT_CHANGE'
,p_sort_direction_4=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(190901015236992616)
,p_report_id=>wwv_flow_imp.id(471887098024020712)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'PROJECT_STATE'
,p_operator=>'='
,p_expr=>unistr('Aktivn\00ED')
,p_condition_sql=>'"PROJECT_STATE" = #APXWS_EXPR#'
,p_condition_display=>unistr('#APXWS_COL_NAME# = ''Aktivn\00ED''  ')
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10419467713709245)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(516892914132734118)
,p_button_name=>'BTN_COPY'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Kop\00EDrovat projekt')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:26::'
,p_icon_css_classes=>'fa-files-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58596505860405533)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(516892914132734118)
,p_button_name=>'BTN_NEW'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Nov\00FD projekt')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,7:P7_PROJECT_ID,P7_EDIT_FLAG:,N'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26334548502786440)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(516892914132734118)
,p_button_name=>'Print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Tisk den\00EDku')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(190039667842137409)
,p_branch_name=>'Go To Page 32'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'PRINT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26334806315786443)
,p_name=>'P6_REPORT_SQL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(516892914132734118)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26334986345786444)
,p_name=>'P6_COLLECTION_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(516892914132734118)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(516895950802734148)
,p_name=>'DA_DETAIL_PROJEKT_DEVELOPER'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.showDETAILprojektu'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516896067581734149)
,p_event_id=>wwv_flow_imp.id(516895950802734148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'PLUGIN_PRETIUS_APEX_NESTED_REPORTS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(516892914132734118)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  --pp.packaging_type_key AS "ID typu obalu",',
'  --pt.packaging_type_name AS "Typ obalu",  ',
unistr('  --to_char(pp.weight, ''FM999G990D00'') as "V\00E1ha(g)"'),
'--  PROJECT_ID, ',
'   ''<a href="''',
'                            || apex_util.prepare_url(p_url => ''f?p=''',
'                                                              || v(''APP_ID'')',
'                                                              || '':23:''',
'                                                              || v(''SESSION'')',
'                                                              || ''::::P23_PROJECT_ID,P23_DEVELOPER_ID,P23_BUDGET:''',
'                                                              || pd.PROJECT_ID||'',''||pd.DEVELOPER_ID||'',''||pd.BUDGET, p_triggering_element => ''apex.jQuery(''''#rep_prehled_projektu'''')''',
'                                                    -- ''$(''''#URLS'''')''',
'                                                    )',
'                            || ''"><span class="fa fa-pencil" style="margin:auto; display:table;"></span></a><br>'' as "Editace",',
'  up.NAZEV as "Developer", ',
'  pep.name || '' '' || pep.surname as "Stakeholder", ',
unistr('  to_char(pd.START_DATE,''DD. MM. YYYY'') as "Re\00E1ln\00E9 datum zah\00E1jen\00ED", '),
unistr('  to_char(pd.END_DATE,''DD. MM. YYYY'') as "Re\00E1ln\00E9 datum ukon\010Den\00ED",'),
'  st.STATUS_NAME as "Status",',
'  /*(',
'  select listagg (VALUE_EV, '','') within group',
'           (order by VALUE_EV)',
'           from PEV_M_INVOICE_SALDO_AGG sal',
'           where sal.PARTNER_KEY = pd.developer_id and sal.kakadu_key = proj.kakadu_number',
'  ) --sal.VALUE_EV ',
unistr('  as "Re\00E1l",*/'),
' -- ROUND(pd.BUDGET,2) as "Budget", ',
' -- ROUND(pd.FORECAST,2) as "Forecast", ',
'  TO_CHAR(pd.BUDGET, ''999G999G999G999G999MI'') as "Budget",',
'  TO_CHAR(pd.FORECAST, ''999G999G999G999G999MI'') as "Forecast",',
'  --pd.FORECAST as "Forecast", ',
'  to_char(pd.UAT_DATE,''DD. MM. YYYY'') as "Datum UAT", ',
'  to_char(pd.RESOLVED_DATE,''DD. MM. YYYY'') as "Datum Resolved"',
'--  , ',
'--  DEVELOPER_ORDER, ',
'--  CREATED_DATE, ',
'--  CREATED_BY, ',
'--  UPDATED_DATE, ',
'--  UPDATED_BY',
'FROM',
'  pev_t_project_developer pd',
'LEFT JOIN',
'  ucetni_partneri up on up.partner_id = pd.developer_id',
'LEFT JOIN',
'    PEV_T_LOV_PROJECT_STATUS st on st.id = STATUS ',
'LEFT JOIN',
'    PEV_T_PEOPLES pep on pep.id = PEOPLE_ID',
'JOIN',
'    PEV_T_PROJECTS proj on pd.project_id = proj.id',
'--LEFT JOIN ',
'--   PEV_M_INVOICE_SALDO_AGG sal on sal.PARTNER_KEY = pd.developer_id and sal.kakadu_key = proj.kakadu_number',
'WHERE',
'  pd.project_id = ''#PROJECT_ID#''',
'order by developer_order'))
,p_attribute_02=>'CE:AA:CR'
,p_attribute_03=>'DTDC'
,p_attribute_06=>'#EBEBEB'
,p_attribute_08=>'#c5c5c5'
,p_attribute_09=>'#e3e3e3'
,p_attribute_11=>'No data found'
,p_attribute_13=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#DEFAULT_TEMPLATE#',
'<a href="javascript: void(0)" title="Refresh" class="nestedreport--refresh" id="nestedreportrefresh" style="display: none;">Refresh</a>',
''))
,p_attribute_14=>'EDT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(516896258702734151)
,p_name=>'Refresh_prehled'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(516892914132734118)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516896297162734152)
,p_event_id=>wwv_flow_imp.id(516896258702734151)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''#nestedreportrefresh'').click();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7435964164184745)
,p_event_id=>wwv_flow_imp.id(516896258702734151)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(516892914132734118)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10417361602709224)
,p_name=>'DA_PAGE_LOAD'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10417440749709225)
,p_event_id=>wwv_flow_imp.id(10417361602709224)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'KE_STAZENI'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26334635785786441)
,p_name=>'DA_PRINT'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(26334548502786440)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26334745956786442)
,p_event_id=>wwv_flow_imp.id(26334635785786441)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    lv_collection_name           CONSTANT apex_collections.collection_name%TYPE DEFAULT ''PREHLED_PROJEKTU'';',
'   l_report apex_ir.t_report;',
'   ln_region_id   apex_application_page_regions.region_id%type;',
'   rec_report_name         APEX_APPLICATION_GLOBAL.VC_ARR2;',
'   rec_report_value        APEX_APPLICATION_GLOBAL.VC_ARR2;',
'BEGIN ',
'SELECT region_id',
'   INTO ln_region_id',
'  FROM   apex_application_page_regions',
'WHERE  static_id      = ''rep_prehled_projektu''',
'AND    page_id        = :APP_PAGE_ID',
'AND    application_id = :APP_ID;',
'',
'',
'    l_report := APEX_IR.GET_REPORT (',
'                    p_page_id => 6,',
'                    p_region_id => ln_region_id,',
'                    p_report_id => NULL);',
'    ',
'    :P6_REPORT_SQL := l_report.sql_query;',
'    FOR i in 1..l_report.binds.count LOOP ',
'     rec_report_name(i):= l_report.binds(i).name;',
'     rec_report_value(i) := l_report.binds(i).value;',
'    END LOOP;',
'  ',
'    apex_collection.create_or_truncate_collection(''REPORT_BINDS'');',
'    apex_collection.add_members(',
'        p_collection_name => ''REPORT_BINDS'',',
'        p_c001 => rec_report_name,',
'        p_c002 => rec_report_value );',
'',
'DECLARE   ',
'   rec_names                    apex_application_global.vc_arr2;',
'   rec_values                   apex_application_global.vc_arr2;',
'BEGIN ',
'',
'  SELECT c001,',
'         c002',
'         BULK COLLECT ',
'    INTO rec_names,',
'         rec_values',
'    FROM apex_collections',
'   WHERE collection_name = ''REPORT_BINDS''',
'   ORDER BY seq_id;',
' ',
'  APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY_B (',
'        p_collection_name => lv_collection_name, ',
'        p_query => ''WITH data AS ( '' || :P6_REPORT_SQL || '' ) select * FROM data'',',
'        p_names => rec_names,',
'        p_values => rec_values,',
'        p_truncate_if_exists => ''YES'');',
'         ',
'  :P6_COLLECTION_COUNT := NVL( APEX_COLLECTION.COLLECTION_MEMBER_COUNT( p_collection_name => lv_collection_name) , 0);',
'   --htp.p(:P6_COLLECTION_COUNT);',
'END;',
'',
'',
'',
'END;',
'',
''))
,p_attribute_03=>'P6_REPORT_SQL,P6_COLLECTION_COUNT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190039587411137408)
,p_event_id=>wwv_flow_imp.id(26334635785786441)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'PRINT'
,p_attribute_02=>'N'
);
null;
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
