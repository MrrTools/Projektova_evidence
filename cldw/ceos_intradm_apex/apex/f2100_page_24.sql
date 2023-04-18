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
--     PAGE: 24
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     706450243198997
--

begin
null;
end;
/
prompt --application/pages/delete_00024
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>24);
end;
/
prompt --application/pages/page_00024
begin
wwv_flow_imp_page.create_page(
 p_id=>24
,p_name=>'PEV - Osoba - pozice'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Pozice osoby v projektov\00E9 evidenci')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'16'
,p_last_updated_by=>'LSAROCKY'
,p_last_upd_yyyymmddhh24miss=>'20201124092146'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(460103789307939717)
,p_plug_name=>'Pozice'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(2341717988556225885)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(460104140637939721)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(460103789307939717)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(2341739166090226293)
,p_button_image_alt=>unistr('Ulo\017Eit')
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460103864234939718)
,p_name=>'P24_POZICE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(460103789307939717)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Pozice'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LISTAGG(position_id, '':'')',
'         WITHIN GROUP (ORDER BY position_id) "positions"',
'  FROM PEV_T_PEOPLE_POSITIONS',
'  WHERE people_id = :P24_PEOPLE_ID;'))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'select name, id from PEV_T_LOV_PEOPLE_POSITION where is_deleted !=1 or is_deleted is null'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460103975636939719)
,p_name=>'P24_PEOPLE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460103789307939717)
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select name || '' '' || surname, id from PEV_T_PEOPLES where id=:P24_PEOPLE_ID'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(2341738539209226269)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(460104077391939720)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'INSERT_POSITION'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_counter       NUMBER;',
'    p_position_ids  VARCHAR(100);',
'    loop_counter    NUMBER;',
'    v_id            NUMBER;',
'BEGIN',
'    p_position_ids := :P24_POZICE;',
' SAVEPOINT people_position;   ',
'    DELETE PEV_T_PEOPLE_POSITIONS',
'    WHERE',
'            people_id = to_number(',
'                :p24_people_id',
'            );',
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
'                :p24_people_id',
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
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Chyba'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(460104140637939721)
,p_process_success_message=>unistr('Pozice ulo\017Eeny')
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(460104270251939722)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE'
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
