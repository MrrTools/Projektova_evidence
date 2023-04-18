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
--   Date and Time:   21:18 Tuesday April 18, 2023
--   Exported By:     LSAROCKY
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 8
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00008
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>8);
end;
/
prompt --application/pages/page_00008
begin
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>unistr('Nastaven\00ED')
,p_step_title=>unistr('Nastaven\00ED')
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.non-visible { display: none; }',
'',
'#reg_lide_ig_toolbar .a-Button--hot {',
'    background-color: #3baa2c;',
'  --  color: #ffffff;',
'   -- font-weight: inherit;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'MIROSLAV.TLUSTY'
,p_last_upd_yyyymmddhh24miss=>'20211019104715'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516205474267262242)
,p_plug_name=>unistr('Lid\00E9')
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516203839256262226)
,p_plug_name=>unistr('Lid\00E9')
,p_region_name=>'reg_lide'
,p_parent_plug_id=>wwv_flow_imp.id(516205474267262242)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  apex_item.checkbox2(1, a.EMAIL_NOTIFICATION,DECODE(a.EMAIL_NOTIFICATION,1,''CHECKED'',NULL)) "a.EMAIL_NOTIFICATION",',
'        a.ID,',
'        a.NAME,',
'        a.SURNAME,',
unistr('        LISTAGG ( nvl(b.NAME, ''p\0159i\0159adit'') , '', '' ) WITHIN GROUP( ORDER BY  b.id ) "POSITION",'),
'       a.EMAIL,',
'       --to_char(a.PHONE_NUMBER,''999G999G999MI'') as "PHONE NUMBERR",',
'       a.PHONE_NUMBER,',
'       c.NAZEV as DEVELOPER,',
'       a.NOTE,',
'       apex_item.checkbox2(1, a.IS_DELETED,DECODE(a.IS_DELETED,1,''CHECKED'',NULL)) "IS_DELETED"',
'       --nvl(to_char(pp.POSITION_id),''non-visible'') as style',
'  from PEV_T_PEOPLES a',
'                       left join UCETNI_PARTNERI c           ON c.partner_id=a.DEVELOPER',
'                       left join PEV_T_PEOPLE_POSITIONS pp ON pp.people_id = a.id',
'                       left join PEV_T_LOV_PEOPLE_POSITION b ON pp.POSITION_id=b.ID',
'                       where a.is_deleted !=1 or a.is_deleted is null',
'  group by',
'     apex_item.checkbox2(1, a.EMAIL_NOTIFICATION,DECODE(a.EMAIL_NOTIFICATION,1,''CHECKED'',NULL)),',
'        a.ID,',
'        a.NAME,',
'        a.SURNAME,',
'       a.EMAIL,',
'       --to_char(a.PHONE_NUMBER,''999G999G999MI''),',
'       a.PHONE_NUMBER,',
'       c.NAZEV,',
'       a.NOTE,',
'       apex_item.checkbox2(1, a.IS_DELETED,DECODE(a.IS_DELETED,1,''CHECKED'',NULL))',
'       --nvl(to_char(pp.POSITION_id),''non-visible'')',
'       ',
'  order by surname;',
'     '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(460104376522939723)
,p_name=>'IS_DELETED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IS_DELETED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Smazat'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_ID,P25_CISELNIK:&ID.,LIDE'
,p_link_text=>'<span class="fa fa-trash-o"> </span>'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471871797966973611)
,p_name=>'PHONE_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PHONE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Phone Number'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>120
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920108782012088520)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Edit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>true
,p_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:P11_ID:&ID.'
,p_link_text=>'<span class="fa fa-pencil" style="margin:auto; display:table;"></span>'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920108860013088521)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Jm\00E9no')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>120
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920108979793088522)
,p_name=>'SURNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SURNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('P\0159\00EDjmen\00ED')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>120
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920109026536088523)
,p_name=>'POSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Pozice'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP:P24_PEOPLE_ID:&ID.'
,p_link_text=>'<span title="&POSITION.">&POSITION.</span>'
,p_link_attributes=>'class="&style."'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920109151903088524)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920109364366088526)
,p_name=>'DEVELOPER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEVELOPER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Developer'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>150
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920109462237088527)
,p_name=>'NOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Pozn\00E1mka')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>800
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(920109817566088531)
,p_name=>'EMAIL_NOTIFICATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'a.EMAIL_NOTIFICATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Email Notifikace'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_02=>'LOV'
,p_attribute_05=>'PLAIN'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:NE;0,ANO;1'
,p_lov_display_extra=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(920108554913088518)
,p_internal_uid=>459958163698369815
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) { ',
'    var $ = apex.jQuery, ',
'        toolbarData = $.apex.interactiveGrid.copyDefaultToolbar(), ',
'        toolbarGroup = toolbarData[toolbarData.length - 2]; // this is the last group with reset button ',
'  ',
'    // add our own button ',
'    toolbarGroup.controls.push( { ',
'        type: "BUTTON", ',
'        action: "NOVY_LIDI", ',
'        id: "BTN_PRIDAT_LIDI", ',
unistr('        label: "P\0159idat dal\0161\00ED osobu", '),
'        hot: true, ',
'        icon: "icon-ig-edit",',
'        iconBeforeLabel: true, ',
'        hide: false, ',
'        disabled: false ',
'    }); ',
'    ',
'       config.toolbarData = toolbarData; ',
'      ',
'    config.initActions = function( actions ) { ',
'        // can modify state of existing actions or add your own ',
'        // can also pass in an array of actions to add ',
'        actions.add( { ',
'            name: "NOVY_LIDI", ',
unistr('            label: "P\0159idat osobu", '),
'             ',
'            action: function(event, focusElement) { ',
'               $(''#btn_pridat_osobu'').click();             //STATIC ID of button ',
'            } ',
'        } ); ',
'        ',
'             } ',
' return config; ',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(920148475340413925)
,p_interactive_grid_id=>wwv_flow_imp.id(920108554913088518)
,p_static_id=>'32817911'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(920148574616413923)
,p_report_id=>wwv_flow_imp.id(920148475340413925)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(460595227736440059)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(460104376522939723)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(472235321885317872)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(471871797966973611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920149506622413911)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(920108782012088520)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920150064928413908)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(920108860013088521)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920150506828413906)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(920108979793088522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920151316338413904)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(920109026536088523)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920151842151413902)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(920109151903088524)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920152807289413897)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(920109364366088526)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920153382974413895)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(920109462237088527)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(920166894861366015)
,p_view_id=>wwv_flow_imp.id(920148574616413923)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(920109817566088531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516205575658262243)
,p_plug_name=>'Status'
,p_region_template_options=>'#DEFAULT#:t-Region--accent10:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516205800406262246)
,p_plug_name=>'Status'
,p_region_name=>'reg_status'
,p_parent_plug_id=>wwv_flow_imp.id(516205575658262243)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--stretchInputs'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       STATUS_NAME,',
unistr('       DECODE (STATUS_TYPE,''P'',''Projektov\00FD status (P)'', ''Status projektu dodavatele'') STATUS,'),
'       DECODE (ID,9,null,10,null,11,null, ''<span class="fa fa-trash-o"> </span>'') IS_DELETED,',
'       CREATED_DATE,',
'       CREATED_BY,',
'       UPDATED_DATE,',
'       UPDATED_BY',
'  from PEV_T_LOV_PROJECT_STATUS',
'  where is_deleted !=1;'))
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
 p_id=>wwv_flow_imp.id(516205933829262247)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LSAROCKY'
,p_internal_uid=>56055542614543544
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(516206189707262249)
,p_db_column_name=>'STATUS_NAME'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00E1zev')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(58596421528405532)
,p_db_column_name=>'STATUS'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Typ'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(516206032939262248)
,p_db_column_name=>'ID'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(516206396532262252)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(516206550162262253)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919283853593176304)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919283982071176305)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461062762898021102)
,p_db_column_name=>'IS_DELETED'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Smazat'
,p_column_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_CISELNIK,P25_ID:STATUS,#ID#'
,p_column_linktext=>'#IS_DELETED#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(919292341660176016)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4591420'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS_NAME:STATUS:IS_DELETED:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516205657757262244)
,p_plug_name=>'Stav'
,p_region_name=>'reg_stav'
,p_region_template_options=>'#DEFAULT#:t-Region--accent5:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919283991752176306)
,p_plug_name=>'Stav'
,p_parent_plug_id=>wwv_flow_imp.id(516205657757262244)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       STATE_NAME,',
'       IS_DELETED,',
'       CREATED_DATE,',
'       CREATED_BY,',
'       UPDATED_DATE,',
'       UPDATED_BY',
'  from PEV_T_LOV_PROJECT_STATE',
'  where IS_DELETED != 1;'))
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
 p_id=>wwv_flow_imp.id(919284107251176307)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LSAROCKY'
,p_internal_uid=>459133716036457604
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284233521176308)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Smazat'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284339691176309)
,p_db_column_name=>'STATE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00E1zev')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284438194176310)
,p_db_column_name=>'IS_DELETED'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Smazat'
,p_column_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_ID,P25_CISELNIK:#ID#,STAV'
,p_column_linktext=>'<span class="fa fa-trash-o"> </span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284520605176311)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284654216176312)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284789624176313)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919284820370176314)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(919298432551094667)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4591481'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:STATE_NAME:IS_DELETED:CREATED_DATE:CREATED_BY:UPDATED_DATE:UPDATED_BY'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(516205714400262245)
,p_plug_name=>'Identifikace'
,p_region_template_options=>'#DEFAULT#:t-Region--accent4:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919284960941176315)
,p_plug_name=>'Identification'
,p_region_name=>'reg_identification'
,p_parent_plug_id=>wwv_flow_imp.id(516205714400262245)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       NAME,',
'       IS_DELETED,',
'       CREATED_DATE,',
'       CREATED_BY,',
'       UPDATED_DATE,',
'       UPDATED_BY',
'  from PEV_T_LOV_PROJECT_IDENTIFY',
'   where IS_DELETED != 1;'))
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
 p_id=>wwv_flow_imp.id(919285065770176316)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LSAROCKY'
,p_internal_uid=>459134674555457613
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285143957176317)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Smazat'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285222714176318)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00E1zev')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285390391176319)
,p_db_column_name=>'IS_DELETED'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Smazat'
,p_column_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_ID,P25_CISELNIK:#ID#,IDENTIFIKACE'
,p_column_linktext=>'<span class="fa fa-trash-o"> </span>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285450466176320)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285583998176321)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285625689176322)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919285708440176323)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(919299019857094666)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4591487'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:NAME:IS_DELETED:CREATED_DATE:CREATED_BY:UPDATED_DATE:UPDATED_BY'
);
end;
/
begin
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919287891524176345)
,p_plug_name=>'Pozice'
,p_region_template_options=>'#DEFAULT#:t-Region--accent3:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919288045644176346)
,p_plug_name=>'Position'
,p_region_name=>'reg_position'
,p_parent_plug_id=>wwv_flow_imp.id(919287891524176345)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       NAME,',
'       DECODE (ID,1,null,2,null,3,null, ''<span class="fa fa-trash-o"> </span>'') IS_DELETED,',
'       CREATED_DATE,',
'       CREATED_BY,',
'       UPDATED_DATE,',
'       UPDATED_BY',
'  from PEV_T_LOV_PEOPLE_POSITION',
'   where IS_DELETED != 1;'))
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
 p_id=>wwv_flow_imp.id(919288136434176347)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'LSAROCKY'
,p_internal_uid=>459137745219457644
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919288198697176348)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Smazat'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919288356513176349)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('N\00E1zev')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919288548777176351)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919288659812176352)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919288754906176353)
,p_db_column_name=>'UPDATED_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(919486096459897704)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461065139103021126)
,p_db_column_name=>'IS_DELETED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Smazat'
,p_column_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_CISELNIK,P25_ID:POZICE,#ID#'
,p_column_linktext=>'#IS_DELETED#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(919497628501315992)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4593473'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:IS_DELETED:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919286100991176327)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(516205474267262242)
,p_button_name=>'P8_btn_pridat_osobu'
,p_button_static_id=>'btn_pridat_osobu'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('P\0159idat osobu')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919285952390176325)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(919283991752176306)
,p_button_name=>'P8_btn_pridat_stav'
,p_button_static_id=>'btn_pridat_stav'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('P\0159idat stav')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919285994898176326)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(516205800406262246)
,p_button_name=>'P8_btn_pridat_status'
,p_button_static_id=>'btn_pridat_status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('P\0159idat status')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919486372626897706)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(919288045644176346)
,p_button_name=>'P8_btn_pridat_pos'
,p_button_static_id=>'btn_pridat_pos'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('P\0159idat pozici')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919285882632176324)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(919284960941176315)
,p_button_name=>'P8_btn_pridat_iden'
,p_button_static_id=>'btn_pridat_iden'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('P\0159idat identifikaci')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,18::'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919488673782897729)
,p_name=>'refresh_lide'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(516203839256262226)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919488713228897730)
,p_event_id=>wwv_flow_imp.id(919488673782897729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(516203839256262226)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58598273993405550)
,p_name=>'refresh_lide_1'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(919286100991176327)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461022430977312201)
,p_event_id=>wwv_flow_imp.id(58598273993405550)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(516203839256262226)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919488824726897731)
,p_name=>'refresh_status'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(516205800406262246)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919488976596897732)
,p_event_id=>wwv_flow_imp.id(919488824726897731)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(516205800406262246)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919489044791897733)
,p_name=>'refresh_stav'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(919283991752176306)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919489134556897734)
,p_event_id=>wwv_flow_imp.id(919489044791897733)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(919283991752176306)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919489290596897735)
,p_name=>'refresh_pozice'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(919288045644176346)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919489344338897736)
,p_event_id=>wwv_flow_imp.id(919489290596897735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(919288045644176346)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919489402758897737)
,p_name=>'refresh_identifikace'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(919284960941176315)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919489543109897738)
,p_event_id=>wwv_flow_imp.id(919489402758897737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(919284960941176315)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58598159905405549)
,p_name=>'Hide_button_pridat_lidi'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58598273993405550)
,p_event_id=>wwv_flow_imp.id(58598159905405549)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(919286100991176327)
,p_attribute_01=>'N'
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
