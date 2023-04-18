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
--     PAGE: 12
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00012
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>12);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>unistr('Nahr\00E1t p\0159\00EDlohu')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Nahr\00E1t p\0159\00EDlohu')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20210114100715'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460254199445466319)
,p_plug_name=>unistr('P\0159\00EDlohy')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2341717513582225884)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select FILE_NAME',
'',
'',
'from PEV_T_FILES where project_id = :P12_PROJECT_ID'))
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
 p_id=>wwv_flow_imp.id(460254213860466320)
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
,p_internal_uid=>460254213860466320
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460254501230466323)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(460329200929977002)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4603293'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(919890572227690146)
,p_plug_name=>unistr('P\0159\00EDloha')
,p_region_name=>'reg_nahrat_soubor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'PLUGIN_DE.DANIELH.DROPZONE2'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_footer=>unistr('<b>Maxim\00E1ln\00ED velikost p\0159\00EDlohy je 20 MB</b>')
,p_attribute_01=>'COLLECTION'
,p_attribute_02=>'DROPZONE_UPLOAD'
,p_attribute_07=>'STYLE2'
,p_attribute_08=>'200px'
,p_attribute_09=>'200px'
,p_attribute_10=>'20'
,p_attribute_15=>'NORMAL'
,p_attribute_16=>'true'
,p_attribute_17=>'true'
,p_attribute_18=>'false'
,p_attribute_19=>'true'
,p_attribute_20=>'false'
,p_attribute_22=>'false'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(919890835190690149)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(919890572227690146)
,p_button_name=>'Close'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Zav\0159it')
,p_button_position=>'CLOSE'
,p_icon_css_classes=>'fa-reply'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460253778778466315)
,p_name=>'P12_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(919890572227690146)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(919890651089690147)
,p_name=>'upload_dropzone'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(919890572227690146)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_DE.DANIELH.DROPZONE2|REGION TYPE|dropzone-upload-complete'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(919890706587690148)
,p_event_id=>wwv_flow_imp.id(919890651089690147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  -- get files data from saved apex_collection',
'  CURSOR l_cur_files IS',
'    SELECT c001    AS filename,',
'           c002    AS mime_type,',
'           n001    AS file_id,',
'           n002    AS file_size,',
'           blob001 AS file_content',
'      FROM apex_collections',
'     WHERE collection_name = ''DROPZONE_UPLOAD'';',
'     v_record_id integer;',
'BEGIN',
'  -- loop over files cursor',
'  FOR l_rec_files IN l_cur_files LOOP',
'    -- do whatever processing is required prior to the insert into your own table',
'    INSERT INTO PEV_T_FILES (',
'        PROJECT_ID,',
'        FILE_NAME,',
'        FILE_MIME_TYPE,',
'        FILE_CONTENT,',
'        FILE_SIZE',
'    ) VALUES (',
'        :P12_PROJECT_ID,',
'        l_rec_files.filename,',
'        l_rec_files.mime_type,',
'        l_rec_files.file_content,',
'        DBMS_LOB.GETLENGTH(l_rec_files.file_content)',
'    );',
'      ',
'    PEV_K_MAIN.INSERT_CHANGE(',
'      L_RECORD_ID => null,',
'      L_CAT => ''PROJECT'',',
'      L_CAT_ID => :P12_PROJECT_ID,',
'      L_ITEM_ID => null,',
unistr('      L_ITEM => ''Nov\00FD soubor'','),
'      L_OLD_VALUE => null,',
'      L_VALUE => l_rec_files.filename,',
'      L_ACTION => ''I'');',
'          ',
'  END LOOP;',
'  -- clear original apex collection (only if exist)',
'  IF apex_collection.collection_exists(p_collection_name => ''DROPZONE_UPLOAD'') THEN',
'    apex_collection.delete_collection(p_collection_name => ''DROPZONE_UPLOAD'');',
'  END IF;',
'END;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460347190750803444)
,p_event_id=>wwv_flow_imp.id(919890651089690147)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(460254199445466319)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(460992982863176711)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'close_dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(919890835190690149)
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
