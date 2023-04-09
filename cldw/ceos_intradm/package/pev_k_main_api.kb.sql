create or replace PACKAGE BODY PEV_K_MAIN_API AS

procedure del_project_status (p_id in integer) IS
  BEGIN
    PEV_K_MAIN.DEL_PROJECT_STATUS(
      P_ID => P_ID);
  END;


procedure del_project_state (p_id in integer) IS
  BEGIN
    PEV_K_MAIN.DEL_PROJECT_STATE(
      P_ID => P_ID);
  END;


procedure del_project_identification (p_id in integer) IS
  BEGIN
    PEV_K_MAIN.DEL_PROJECT_IDENTIFICATION(
      P_ID => P_ID);
  END;


procedure del_people_position(p_id in integer) IS
  BEGIN
    PEV_K_MAIN.DEL_PEOPLE_POSITION(
      P_ID => P_ID);
  END;


procedure del_projects (p_id in integer) IS
  BEGIN
    PEV_K_MAIN.DEL_PROJECTS(
      P_ID => P_ID);
  END;


procedure upd_projects (p_id IN NUMBER , p_name IN VARCHAR2 , p_project_state IN NUMBER ,p_identification IN NUMBER , p_project_status IN NUMBER , p_kakadu_number IN VARCHAR2 , p_bdc_number IN VARCHAR2 , p_bdc_ops IN VARCHAR2,
                        p_department IN NUMBER , p_project_manager IN NUMBER , p_business_owner IN NUMBER , p_it_owner IN NUMBER, p_start_date_expect IN DATE, p_start_date_real IN DATE,
                        p_end_date_exp IN DATE , p_end_date_real IN DATE, p_budget IN NUMBER, p_forecast IN NUMBER , p_forecast_approve_date IN DATE,
                        p_project_description IN VARCHAR2 , p_descr_scope IN VARCHAR2 , p_layout IN NUMBER , p_layout_url IN VARCHAR2, p_budget_approve_date IN DATE, id_out OUT NUMBER, p_budget_approve IN NUMBER, p_forecast_approve IN NUMBER, p_note IN VARCHAR2 DEFAULT NULL, p_approve IN NUMBER, p_email IN NUMBER,
                        p_is_duplicated IN NUMBER DEFAULT NULL) IS
  BEGIN
    PEV_K_MAIN.UPD_PROJECTS(
      P_ID => P_ID,
      P_NAME => P_NAME,
      P_PROJECT_STATE => P_PROJECT_STATE,
      P_IDENTIFICATION => P_IDENTIFICATION,
      P_PROJECT_STATUS => P_PROJECT_STATUS,
      P_KAKADU_NUMBER => P_KAKADU_NUMBER,
      P_BDC_NUMBER => P_BDC_NUMBER,
      P_BDC_OPS => P_BDC_OPS,
      P_DEPARTMENT => P_DEPARTMENT,
      P_PROJECT_MANAGER => P_PROJECT_MANAGER,
      P_BUSINESS_OWNER => P_BUSINESS_OWNER,
      P_IT_OWNER => P_IT_OWNER,
      P_START_DATE_EXPECT => P_START_DATE_EXPECT,
      P_START_DATE_REAL => P_START_DATE_REAL,
      P_END_DATE_EXP => P_END_DATE_EXP,
      P_END_DATE_REAL => P_END_DATE_REAL,
      P_BUDGET => P_BUDGET,
      P_FORECAST => P_FORECAST,
      P_FORECAST_APPROVE_DATE => P_FORECAST_APPROVE_DATE,
      P_PROJECT_DESCRIPTION => P_PROJECT_DESCRIPTION,
      P_DESCR_SCOPE => P_DESCR_SCOPE,
      P_LAYOUT => P_LAYOUT,
      P_LAYOUT_URL => P_LAYOUT_URL,
      P_BUDGET_APPROVE_DATE => P_BUDGET_APPROVE_DATE,
      ID_OUT => ID_OUT,
      P_BUDGET_APPROVE => P_BUDGET_APPROVE,
      P_FORECAST_APPROVE => P_FORECAST_APPROVE,
	  P_NOTE => P_NOTE,
	  P_APPROVE => P_APPROVE,
      P_EMAIL => P_EMAIL,
      P_IS_DUPLICATED => P_IS_DUPLICATED);
  END;


procedure upd_project_developer (p_project_id IN NUMBER, p_developer_order IN  NUMBER, p_developer_id IN NUMBER, p_people_id IN NUMBER) IS
  BEGIN
    PEV_K_MAIN.UPD_PROJECT_DEVELOPER(
      P_PROJECT_ID => P_PROJECT_ID,
      P_DEVELOPER_ORDER => P_DEVELOPER_ORDER,
      P_DEVELOPER_ID => P_DEVELOPER_ID,
      P_PEOPLE_ID => P_PEOPLE_ID);
  END;


procedure upd_project_dev_record (
p_project_id IN NUMBER , p_developer_id IN NUMBER,
p_people_id IN NUMBER, p_start_date IN DATE, p_end_date IN DATE,
p_status IN INTEGER, p_budget IN NUMBER , p_forecast IN NUMBER ,
p_uat_date IN DATE, p_resolved_date IN DATE) IS
  BEGIN
    PEV_K_MAIN.UPD_PROJECT_DEV_RECORD(
      P_PROJECT_ID => P_PROJECT_ID,
      P_DEVELOPER_ID => P_DEVELOPER_ID,
      P_PEOPLE_ID => P_PEOPLE_ID,
      P_START_DATE => P_START_DATE,
      P_END_DATE => P_END_DATE,
      P_STATUS => P_STATUS,
      P_BUDGET => P_BUDGET,
      P_FORECAST => P_FORECAST,
      P_UAT_DATE => P_UAT_DATE,
      P_RESOLVED_DATE => P_RESOLVED_DATE);
  END;


  PROCEDURE ins_mail_reqest(
        p_change_id  IN  INTEGER
    ) IS
  BEGIN
    PEV_K_MAIN.INS_MAIL_REQEST(
      P_CHANGE_ID => P_CHANGE_ID);
  END;


  PROCEDURE send_mails IS
  BEGIN
    PEV_K_MAIN.SEND_MAILS;
  END;


PROCEDURE job_na_maily IS
  BEGIN
    PEV_K_MAIN.JOB_NA_MAILY;
  END;


     PROCEDURE insert_change (
        l_record_id   VARCHAR2,
        l_cat      VARCHAR2,
        l_cat_id    VARCHAR2,
        l_item_id          VARCHAR2,
        l_item         VARCHAR2,
        l_old_value       VARCHAR2,
        l_value   VARCHAR2,
        l_action       VARCHAR2
       ) IS
  BEGIN
    PEV_K_MAIN.INSERT_CHANGE(
      L_RECORD_ID => L_RECORD_ID,
      L_CAT => L_CAT,
      L_CAT_ID => L_CAT_ID,
      L_ITEM_ID => L_ITEM_ID,
      L_ITEM => L_ITEM,
      L_OLD_VALUE => L_OLD_VALUE,
      L_VALUE => L_VALUE,
      L_ACTION => L_ACTION);
  END;

  PROCEDURE copy_developer (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER) IS
  BEGIN
    PEV_K_MAIN.COPY_DEVELOPER(
      P_PROJECT_ID_COPY => P_PROJECT_ID_COPY,
      P_PROJECT_ID_NEW => P_PROJECT_ID_NEW);
  END;

    PROCEDURE copy_files (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER) IS
  BEGIN
    PEV_K_MAIN.COPY_FILES(
      P_PROJECT_ID_COPY => P_PROJECT_ID_COPY,
      P_PROJECT_ID_NEW => P_PROJECT_ID_NEW);
  END;

  PROCEDURE del_project_journal (p_id in integer) IS
   BEGIN
    PEV_K_MAIN.DEL_PROJECT_JOURNAL(
      P_ID => P_ID);
   END;
  
  PROCEDURE  upd_logbook_record ( p_record_id IN INTEGER, p_project_id IN INTEGER , p_record_date IN DATE, p_text IN VARCHAR2) IS
    BEGIN
    PEV_K_MAIN.UPD_LOGBOOK_RECORD(
      P_RECORD_ID => P_RECORD_ID,
      P_PROJECT_ID => P_PROJECT_ID,
      P_RECORD_DATE => P_RECORD_DATE,
      P_TEXT => P_TEXT);
    END;

END;
/
show errors


--%carp-end
