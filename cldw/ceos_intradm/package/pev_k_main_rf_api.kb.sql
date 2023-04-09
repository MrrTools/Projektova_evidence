--------------------------------------------------------
--  File created - Neděle-dubna-09-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PEV_K_MAIN_RF_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CEOS_INTRADM"."PEV_K_MAIN_RF_API" 
/**
*Projektova evidence.
* <p>
* Sluzi k evidencii projektov.
*
* @version 2020-11-06 LSAROCKY  RM #40890: projektova evidence
* @headcom
*/
AS
  -- $Header: pev_k_main.ks.sql RM #41194: 2020-11-06 15:00:03 vytvorenie package $
  -- $Header: pev_k_main.ks.sql RM #41194  2020-11-06 15:00:03 mazacie procedury $

-----------------------------------------------------------------------
/**
  * Procedure that delete status.
  *
  * @param p_id	-  id statusu
  * @param p_reg	-  id statusu  
  *
  * @version 2023-02-28 LSAROCKY   Created
  */

procedure del_settings_page(p_id in integer, p_reg  IN VARCHAR2);
/**
  * Procedure that create or update  project.
  *
  * @param p_id						-  id projektu
  * @param p_name					-  name
  * @param p_project_state			-  id stavu
  * @param p_identification			-  id identifikace
  * @param p_project_status			-  id status
  * @param p_kakadu_number			-  kakadu number
  * @param p_bdc_number				-  bdc number
  * @param p_bdc_ops				-  bdc ops
  * @param p_department				-  lekaren
  * @param p_project_manager		-  project manager
  * @param p_business_owner			-  bussines owner
  * @param p_it_owner				-  it owner
  * @param p_start_date_expect		-  ocakavany start
  * @param p_start_date_real		-  realny start
  * @param p_end_date_exp			-  ocakavany koniec
  * @param p_end_date_real			-  realny koniec
  * @param p_budget					-  budget
  * @param p_forecast				-  forecast
  * @param p_forecast_approve_date	-  forecast date
  * @param p_budget_approve_date	-  budget date
  * @param p_project_description	-  popis projektu
  * @paramp_descr_scope				-  scope popis
  * @param p_layout					-  architek posuok
  * @param p_layout_url				-  url
  * @param p_is_deleted				-  delete status
  * @param p_budget_approve_date	-  datum schvalenia
  * @param id_out			        -  id output
  * @param p_budget_approve			- budget aprrove
  * @param p_forecast_approve		-  forecast aprrove
  * @param p_note					-  note
  * @param p_approve				-  approve
  * @param p_email				    -  status emailu pre kopirovanie
  * @version 2020-11-12 LSAROCKY   Created
  */

procedure upd_projects (p_id IN NUMBER , p_name IN VARCHAR2 , p_project_state IN NUMBER ,p_identification IN NUMBER , p_project_status IN NUMBER , p_kakadu_number IN VARCHAR2 , p_bdc_number IN VARCHAR2 , p_bdc_ops IN VARCHAR2,
                        p_department IN NUMBER , p_project_manager IN NUMBER , p_business_owner IN NUMBER , p_it_owner IN NUMBER, p_start_date_expect IN DATE, p_start_date_real IN DATE,
                        p_end_date_exp IN DATE , p_end_date_real IN DATE, p_budget IN NUMBER, p_forecast IN NUMBER , p_forecast_approve_date IN DATE,
                        p_project_description IN VARCHAR2 , p_descr_scope IN VARCHAR2,
                        p_layout IN NUMBER , p_layout_url IN VARCHAR2, p_budget_approve_date IN DATE,
                        id_out OUT NUMBER, p_budget_approve IN NUMBER, p_forecast_approve IN NUMBER,
                         p_approve IN NUMBER, p_email IN NUMBER,
                        p_is_duplicated IN NUMBER DEFAULT NULL);
/**
  * Procedure that create or update  developer row.
  *
  * @param p_project_id						-  id projektu
  * @param p_developer_id					-  id developera
  * @param p_people_id						-  id people
  * @param p_people_id						-  id people
  *	@p_developer_order                      -  developer number
  * @version 2020-11-12 LSAROCKY   Created
  */

procedure upd_project_developer (p_project_id IN NUMBER, p_developer_order IN  NUMBER, p_developer_id IN NUMBER, p_people_id IN NUMBER);

/**
  * Procedure that update  developer row.
  *
  * @param p_project_id						-  id projektu
  * @param p_developer_id					-  id developera
  * @param p_people_id						-  id people
  * @param p_people_id						-  id people
  *	@p_start_date                     		-  start date
  *	@p_end_date                     		-  end date
  *	@p_status                    			-  status
  *	@p_budget                    			-  budger
  *	@p_forecast                    			-  forecast
  *	@p_uat_date                     		-  uat date
  *	@p_resolved_date                     	-  resolved_date
  * @version 2020-11-12 LSAROCKY   Created
  */

procedure upd_project_dev_record (
p_project_id IN NUMBER , p_developer_id IN NUMBER,
p_people_id IN NUMBER, p_start_date IN DATE, p_end_date IN DATE,
p_status IN INTEGER, p_budget IN NUMBER , p_forecast IN NUMBER ,
p_uat_date IN DATE, p_resolved_date IN DATE);

/**  ins_mail_reqest
  *
  *
  * Vytvoří request, pokud měl uživatel zakliklé notitfikace v pev_t_peoples.
  * <p>
  * <b>INPUT</b>: <ul>
  * <li>pev_t_peoples</li>
  * <li></li>
  * </ul>
  * <p>
  * <b>OUTPUT</b>: <ul>
  * <li>PEV_T_MAIL_REQ</li>
  * </ul>
  *
  * @param p_change_id  - record id from pev_t_changes
  * @headcom
  *
  * @version 2020-12-03  limrich    vytvorení procedury
  */
  PROCEDURE ins_mail_reqest(
        p_change_id  IN  INTEGER
    );
------------------------------------------------------
/**  send_mails
  *
  * provede rozesílku. projde emailové adresy z mail reqestů a
  * pro každou vytvoří z každého requestu soupis changes a ty rozešle na emaily..
  * <p>
  * <b>INPUT</b>: <ul>
  * <li>pev_t_mail_req</li>
  * <li>pev_t_changes</li>
  * </ul>
  * <p>
  * <b>OUTPUT</b>: <ul>
  * <li>Email a změna statusu v mail request</li>
  * </ul>
  *
  * @headcom
  *
  * @version 2020-12-03  limrich    vytvorení procedury
  */
  PROCEDURE send_mails;

PROCEDURE job_na_maily;

/**  insert_change
  * Procedura insertne záznam do pev_t_changes
  * <p>
  * <b>INPUT</b>:
  * <ul>
  * </ul>
  * <p>
  * <b>OUTPUT</b>: <ul>
  * <li>PEV_T_CHANGES/li>
  * </ul>
  *
  * @headcom
  *
  * @version 2020-12-03  limrich    vytvorení procedury
  */
     PROCEDURE insert_change (
        l_record_id   VARCHAR2,
        l_cat      VARCHAR2,
        l_cat_id    VARCHAR2,
        l_item_id          VARCHAR2,
        l_item         VARCHAR2,
        l_old_value       VARCHAR2,
        l_value   VARCHAR2,
        l_action       VARCHAR2
       );


/**
  * Procedure that developer into copy project .
  *
  * @p_project_id_copy					-  id kopirovaneho projektu
  * @ p_project_id_new					-  id noveho projektu
  * @version 2021-01-29 LSAROCKY   Created
  */

PROCEDURE copy_developer (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER);

/**
  * Procedure that copy files into  project .
  *
  * @p_project_id_copy					-  id kopirovaneho projektu
  * @ p_project_id_new					-  id noveho projektu
  * @version 2021-01-29 LSAROCKY   Created
  */

procedure copy_files (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER);

  /**
  * Procedure that update  journal.
  *
  * @param p_project_id			-  id projektu
  * @p_record					-  id zaznamu
  * @p_record_date				-  record date
  * @p_text					    -  text
  * @version 2021-21-05 LSAROCKY   Created
  */

  PROCEDURE  upd_logbook_record ( p_project_id IN INTEGER , p_record_date IN DATE, p_text IN VARCHAR2);

END;

/

  GRANT EXECUTE ON "CEOS_INTRADM"."PEV_K_MAIN_RF_API" TO "CEOS_INTRADM_APEX" WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Package Body PEV_K_MAIN_RF_API
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "CEOS_INTRADM"."PEV_K_MAIN_RF_API" AS

procedure del_settings_page(p_id in integer, p_reg  IN VARCHAR2) IS
  BEGIN
    PEV_K_MAIN_RF.DEL_SETTINGS_PAGE(
      P_ID => P_ID,
      P_REG => P_REG);
  END;

procedure upd_projects (p_id IN NUMBER , p_name IN VARCHAR2 , p_project_state IN NUMBER ,p_identification IN NUMBER , p_project_status IN NUMBER , p_kakadu_number IN VARCHAR2 , p_bdc_number IN VARCHAR2 , p_bdc_ops IN VARCHAR2,
                        p_department IN NUMBER , p_project_manager IN NUMBER , p_business_owner IN NUMBER , p_it_owner IN NUMBER, p_start_date_expect IN DATE, p_start_date_real IN DATE,
                        p_end_date_exp IN DATE , p_end_date_real IN DATE, p_budget IN NUMBER, p_forecast IN NUMBER , p_forecast_approve_date IN DATE,
                        p_project_description IN VARCHAR2 , p_descr_scope IN VARCHAR2 , p_layout IN NUMBER , p_layout_url IN VARCHAR2, p_budget_approve_date IN DATE, id_out OUT NUMBER, p_budget_approve IN NUMBER, p_forecast_approve IN NUMBER, p_approve IN NUMBER, p_email IN NUMBER,
                        p_is_duplicated IN NUMBER DEFAULT NULL) IS
  BEGIN
    PEV_K_MAIN_RF.UPD_PROJECTS(
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
	  P_APPROVE => P_APPROVE,
      P_EMAIL => P_EMAIL,
      P_IS_DUPLICATED => P_IS_DUPLICATED);
  END;


procedure upd_project_developer (p_project_id IN NUMBER, p_developer_order IN  NUMBER, p_developer_id IN NUMBER, p_people_id IN NUMBER) IS
  BEGIN
    PEV_K_MAIN_RF.UPD_PROJECT_DEVELOPER(
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
    PEV_K_MAIN_RF.UPD_PROJECT_DEV_RECORD(
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
    PEV_K_MAIN_RF.INS_MAIL_REQEST(
      P_CHANGE_ID => P_CHANGE_ID);
  END;


  PROCEDURE send_mails IS
  BEGIN
    PEV_K_MAIN_RF.SEND_MAILS;
  END;


PROCEDURE job_na_maily IS
  BEGIN
    PEV_K_MAIN_RF.JOB_NA_MAILY;
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
    PEV_K_MAIN_RF.INSERT_CHANGE(
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
    PEV_K_MAIN_RF.COPY_DEVELOPER(
      P_PROJECT_ID_COPY => P_PROJECT_ID_COPY,
      P_PROJECT_ID_NEW => P_PROJECT_ID_NEW);
  END;

    PROCEDURE copy_files (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER) IS
  BEGIN
    PEV_K_MAIN_RF.COPY_FILES(
      P_PROJECT_ID_COPY => P_PROJECT_ID_COPY,
      P_PROJECT_ID_NEW => P_PROJECT_ID_NEW);
  END;

  PROCEDURE  upd_logbook_record ( p_project_id IN INTEGER , p_record_date IN DATE, p_text IN VARCHAR2) IS
    BEGIN
    PEV_K_MAIN_RF.UPD_LOGBOOK_RECORD(
      P_PROJECT_ID => P_PROJECT_ID,
      P_RECORD_DATE => P_RECORD_DATE,
      P_TEXT => P_TEXT);
    END;

END;

/

  GRANT EXECUTE ON "CEOS_INTRADM"."PEV_K_MAIN_RF_API" TO "CEOS_INTRADM_APEX" WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Synonymn PEV_K_MAIN_RF
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE SYNONYM "CEOS_INTRADM"."PEV_K_MAIN_RF" FOR "CEOS_INTRADM_BL"."PEV_K_MAIN_RF";
