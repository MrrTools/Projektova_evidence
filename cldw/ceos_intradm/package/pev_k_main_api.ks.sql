create or replace PACKAGE PEV_K_MAIN_API
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
  *
  * @version 2020-11-06 LSAROCKY   Created
  */

procedure del_project_status (p_id in integer);

/**
  * Procedure that delete state.
  *
  * @param p_id	-  id stavu
  *
  * @version 2020-11-06 LSAROCKY   Created
  */

procedure del_project_state (p_id in integer);

/**
  * Procedure that delete identification.
  *
  * @param p_id	-  id identifikace
  *
  * @version 2020-11-06 LSAROCKY   Created
  */

procedure del_project_identification (p_id in integer);

/**
  * Procedure that delete position.
  *
  * @param p_id	-  id statusu
  *
  * @version 2020-11-06 LSAROCKY   Created
  */

procedure del_people_position(p_id in integer);

/**
  * Procedure that delete project.
  *
  * @param p_id	-  id statusu
  *
  * @version 2020-11-06 LSAROCKY   Created
  */

procedure del_projects (p_id in integer);


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
                        p_note IN VARCHAR2 DEFAULT NULL, p_approve IN NUMBER, p_email IN NUMBER,
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
  * Procedure that delete journal record.
  *
  * @param p_id	-  record id
  *
  * @version 2020-21-05 LSAROCKY   Created
  */

  PROCEDURE del_project_journal (p_id in integer);


  /**
  * Procedure that update  journal.
  *
  * @param p_project_id			-  id projektu
  * @p_record					-  id zaznamu
  * @p_record_date				-  record date
  * @p_text					    -  text
  * @version 2021-21-05 LSAROCKY   Created
  */

  PROCEDURE  upd_logbook_record ( p_record_id IN INTEGER, p_project_id IN INTEGER , p_record_date IN DATE, p_text IN VARCHAR2);

END;
/
show errors


--%carp-end
