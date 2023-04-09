create or replace PACKAGE BODY pev_k_main_rf AS

  -- $Header: pev_k_main.ks.sql RM #41186: 2020-11-06 15:00:03 vytvorenie package $
  -- $Header: pev_k_main.ks.sql RM #41194  2020-11-06 15:00:03 mazacie procedury $
  -- $Header: pev_k_main.ks.sql RM #44481  2021-02-22  vytvoreni upd_projects_budget_forecast $
  -- $Header: pev_k_main.ks.sql RM #44733  2021-02-03  oprava upd_projects_budget_forecast budget cast $
  -- $Header: pev_k_main.ks.sql RM #44733  2021-03-03  oprava upd_projects_budget_forecast budget cast $
  -- $Header: pev_k_main.ks.sql RM #44869  2021-03-08  oprava upd_projects_budget_forecast budget cast $
  -- $Header: pev_k_main.ks.sql RM #45121  2021-03-16  oprava upd_projects_budget_forecast podle nového zadání $
  -- $Header: pev_k_main.ks.sql RM #45121  2021-03-16  oprava upd_projects_budget_forecast podle nového zadání $
  -- $Header: pev_k_main.ks.sql RM #46711  2021-05-21  journal procedury $
  -- $Header: pev_k_main.ks.sql RM #46711  2021-07-20  journal procedury uprava pre maily $
  -- $Header: pev_k_main.ks.sql RM #48902 jboldys 2021-08-18 fix declarace promennych v send_mails,send_mail_kakadu,create_mail_end_project $
  -- $Header: pev_k_main.ks.sql RM #53692 vhomola 2022-02-16 budget_forecast oprava  $
  -- $Header: pev_k_main.ks.sql refaktoring v ramci bc prace  $

  vc_pkgname CONSTANT VARCHAR2(30 char) := 'pev_k_main_rf';

vc_html_header CONSTANT clob :=
'<head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8">
        <title>Změny na projektu</title>
        <style>
           html, body {
       margin: 0 auto !important;
       padding: 0 !important;
       height: 100% !important;
       width: 100% !important;
   }
   /* Stop Outlook resizing small text. */
   * { -ms-text-size-adjust: 100%;}
   /* Stop Outlook from adding extra spacing to tables. */
   table, td {
       mso-table-lspace: 0pt !important;
       mso-table-rspace: 0pt !important;
   }
    /* Use a better rendering method when resizing images in Outlook IE. */
   img {-ms-interpolation-mode:bicubic;  }
 /* Prevent Windows 10 Mail from underlining links. Styles for underlined links should be inline. */
   a { text-decoration: none;  }
               body {font-family: sans-serif;}
          .styled-table {
          border-collapse: collapse;
          margin: 1px 10px;
          font-size: 0.9em;
          font-family: sans-serif;
          min-width: 400px;
          box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
          }    .styled-table thead tr {
          background-color: #7395AE;
          color: #ffffff;
          text-align: left;
          }
          .styled-table th,
          .styled-table td {
          padding: 1px 10px;
          text-align: left;
          }
          .styled-table tbody tr {
          border-bottom: 1px solid #dddddd;
          }

          .styled-table tbody tr:nth-of-type(even) {
          background-color: #f3f3f3;
          }

          .styled-table tbody tr:last-of-type {
          border-bottom: 2px solid #7395AE;
          }

        h2 {
                display:inline;
            }

        p {
   margin: 0px;
   padding: 0px;
}

        </style>
        </head>';
        


        
/*!
  Procedura nastavi is_deleted z 0 na 1 a teda zaznam bude zmazany z ciselnika

  \p_id - id statusu
  \p_reg - priznak ciselnika
 */

    PROCEDURE del_settings_page(p_id in integer, p_reg IN VARCHAR2) AS
    vc_procname VARCHAR2(100 char) := 'del_settings_page';
    v_record_id integer;
    v_cat_id number;
    v_old_value varchar2(500 CHAR);
    
    BEGIN
    
    CEOS_LOG.set_context_func (vc_pkgname || '.' || vc_procname);
        CASE 
          WHEN  p_reg = 'STATUS' THEN
            CEOS_LOG.notice('Zmazanie ciselniku PEV_T_LOV_PROJECT_STATUS');
            UPDATE PEV_T_LOV_PROJECT_STATUS SET is_deleted = 1 WHERE id = p_id;
          WHEN  p_reg = 'PROJECT' THEN
            CEOS_LOG.notice('Zmazanie projektu z PEV_T_LOV_PROJECT_STATUS');
            UPDATE PEV_T_PROJECTS SET is_deleted = 1 WHERE id = p_id;
          WHEN  p_reg  = 'STAV' THEN
            CEOS_LOG.notice('Zmazanie ciselniku PEV_T_LOV_PROJECT_STATE');
            UPDATE PEV_T_LOV_PROJECT_STATE SET is_deleted = 1 WHERE id = p_id;
          WHEN  p_reg  = 'POZICE' THEN
            CEOS_LOG.notice('Zmazanie ciselniku PEV_T_LOV_PEOPLE_POSITION');
            UPDATE PEV_T_LOV_PEOPLE_POSITION SET is_deleted = 1 WHERE id = p_id;
          WHEN  p_reg= 'IDENTIFIKACE' THEN
            CEOS_LOG.notice('Zmazanie ciselniku PEV_T_LOV_PROJECT_IDENTIFY');
            UPDATE PEV_T_LOV_PROJECT_IDENTIFY SET is_deleted = 1 WHERE id = p_id;
          WHEN  p_reg = 'LIDE' THEN
            CEOS_LOG.notice('Zmazanie ciselniku PEV_T_PEOPLES');
            UPDATE PEV_T_PEOPLES SET is_deleted = 1 where id = p_id;
          WHEN  p_reg = 'SOUBOR' THEN
      
            CEOS_LOG.notice('Zmazanie ciselniku PEV_T_FILES');
            SELECT project_id,file_name  into v_cat_id, v_old_value FROM PEV_T_FILES WHERE id = p_id;

                PEV_K_MAIN.INSERT_CHANGE(
                         L_RECORD_ID => null,
                         L_CAT => 'PROJECT',
                         L_CAT_ID => v_cat_id,
                         L_ITEM_ID => null,
                         L_ITEM => 'Nový soubor',
                         L_OLD_VALUE =>v_old_value,
                         L_VALUE => null,
                         L_ACTION => 'I');            

            DELETE FROM PEV_T_FILES  where id = p_id;
        END CASE;



  EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END del_settings_page;


----------------------------------------------------------------------------------

/*!
  Procedura vytvori alebo aktualizuje projekt


 */

    PROCEDURE upd_projects(
        p_id                     IN   NUMBER
       ,p_name                   IN   VARCHAR2
       ,p_project_state          IN   NUMBER
       ,p_identification         IN   NUMBER
       ,p_project_status         IN   NUMBER
       ,p_kakadu_number          IN   VARCHAR2
       ,p_bdc_number             IN   VARCHAR2
       ,p_bdc_ops                IN   VARCHAR2
       ,p_department             IN   NUMBER
       ,p_project_manager        IN   NUMBER
       ,p_business_owner         IN   NUMBER
       ,p_it_owner               IN   NUMBER
       ,p_start_date_expect      IN   DATE
       ,p_start_date_real        IN   DATE
       ,p_end_date_exp           IN   DATE
       ,p_end_date_real          IN   DATE
       ,p_budget                 IN   NUMBER
       ,p_forecast               IN   NUMBER
       ,p_forecast_approve_date  IN   DATE
       ,p_project_description    IN   VARCHAR2
       ,p_descr_scope            IN   VARCHAR2
       ,p_layout                 IN   NUMBER
       ,p_layout_url             IN   VARCHAR2
       ,p_budget_approve_date    IN   DATE
       ,id_out                   OUT  NUMBER
       ,p_budget_approve         NUMBER
       ,p_forecast_approve       IN   NUMBER
       ,p_approve                 IN NUMBER
       ,p_email                   IN NUMBER
       ,p_is_duplicated IN NUMBER DEFAULT NULL
       )AS

        vc_procname                  VARCHAR2(100 CHAR):= 'upd_projects';
        v_record_id                  INTEGER;
        p_action                     VARCHAR2(1 CHAR);
        p_is_deleted                 INTEGER;
        p_old_id                     NUMBER;
        p_old_name                   VARCHAR2(100 CHAR);
        p_old_project_state          NUMBER;
        p_old_identification         NUMBER;
        p_old_project_status         NUMBER;
        p_old_kakadu_number          VARCHAR2(100 CHAR);
        p_old_bdc_number             VARCHAR2(100 CHAR);
        p_old_bdc_ops                VARCHAR2(100 CHAR);
        p_old_department             NUMBER;
        p_old_project_manager        NUMBER;
        p_old_business_owner         NUMBER;
        p_old_it_owner               NUMBER;
        p_old_start_date_expect      DATE;
        p_old_start_date_real        DATE;
        p_old_end_date_exp           DATE;
        p_old_end_date_real          DATE;
        p_old_budget                 NUMBER;
        p_old_forecast               NUMBER;
        p_old_forecast_approve_date  DATE;
        p_old_project_description    VARCHAR2(2000 CHAR);
        p_old_descr_scope            VARCHAR2(2000 CHAR);
        p_old_layout                 NUMBER;
        p_old_layout_url             VARCHAR2(1000 CHAR);
        p_old_budget_approve_date    DATE;
        p_old_budget_approve         NUMBER;
        p_old_forecast_approve       NUMBER;
    p_old_note             VARCHAR(2000);
        p_old_approve                VARCHAR(5);
        p_approve_text               VARCHAR(5);
        p_duplicated                 NUMBER;
        cnt                          INTEGER;
    BEGIN
        ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);
        ceos_log.notice('update projectu');
        SELECT
            pev_s_changes_record.NEXTVAL
        INTO v_record_id
        FROM
            dual;

        ceos_log.notice('Change_rec: '
                        || v_record_id
                        || '   --- p_name,
                  p_project_state,
                  p_identification,
                  p_project_status,
                  p_kakadu_number,
                  p_bdc_number,
                  p_bdc_ops,
                  p_department,
                  p_project_manager,
                  p_business_owner,
                  p_it_owner,
                  p_start_date_expect,
                  p_start_date_real,
                  p_end_date_exp,
                  p_end_date_real,
                  p_budget,
                  p_forecast,
                  p_forecast_approve_date,
                  p_project_description,
                  p_descr_scope,
                  p_layout,
                  p_layout_url,
                  p_budget_approve_date,
                                    id_out,
                                    p_budget_approve,
                                    forecast_approve,
                  p_note
                                    p_approve');
        IF p_id IS NULL THEN
            INSERT INTO pev_t_projects(
                name
                ,project_state
                ,identification
                ,project_status
                ,kakadu_number
                ,bdc_number
                ,bdc_ops
                ,department
                ,project_manager
                ,business_owner
                ,it_owner
                ,start_date_expect
                ,start_date_real
                ,end_date_exp
                ,end_date_real
                ,budget
                ,forecast
                ,forecast_approve_date
                ,project_description
                ,descr_scope
                ,layout
                ,layout_url
                ,is_deleted
                ,budget_approve_date
                ,budget_approve
                ,forecast_approve
                ,approve
                ,is_duplicated
            )VALUES(
                p_name
               ,p_project_state
               ,p_identification
               ,p_project_status
               ,p_kakadu_number
               ,p_bdc_number
               ,p_bdc_ops
               ,p_department
               ,p_project_manager
               ,p_business_owner
               ,p_it_owner
               ,p_start_date_expect
               ,p_start_date_real
               ,p_end_date_exp
               ,p_end_date_real
               ,p_budget
               ,p_forecast
               ,p_forecast_approve_date
               ,p_project_description
               ,p_descr_scope
               ,p_layout
               ,p_layout_url
               ,'0'
               ,p_budget_approve_date
               ,p_budget_approve
               ,p_forecast_approve
               ,p_approve
               ,p_is_duplicated
            )RETURNING id INTO id_out;

            p_action := 'I';
        ELSE
            SELECT
                name
               ,project_state
               ,identification
               ,project_status
               ,kakadu_number
               ,bdc_number
               ,bdc_ops
               ,department
               ,project_manager
               ,business_owner
               ,it_owner
               ,start_date_expect
               ,start_date_real
               ,end_date_exp
               ,end_date_real
               ,budget
               ,forecast
               ,forecast_approve_date
               ,project_description
               ,descr_scope
               ,layout
               ,layout_url
               ,budget_approve_date
               ,budget_approve
               ,forecast_approve
         ,note
               ,approve
            INTO
                p_old_name
            ,p_old_project_state
            ,p_old_identification
            ,p_old_project_status
            ,p_old_kakadu_number
            ,p_old_bdc_number
            ,p_old_bdc_ops
            ,p_old_department
            ,p_old_project_manager
            ,p_old_business_owner
            ,p_old_it_owner
            ,p_old_start_date_expect
            ,p_old_start_date_real
            ,p_old_end_date_exp
            ,p_old_end_date_real
            ,p_old_budget
            ,p_old_forecast
            ,p_old_forecast_approve_date
            ,p_old_project_description
            ,p_old_descr_scope
            ,p_old_layout
            ,p_old_layout_url
            ,p_old_budget_approve_date
            ,p_old_budget_approve
            ,p_old_forecast_approve
      ,p_old_note
            ,p_old_approve
            FROM
                pev_t_projects
            WHERE
                id = p_id;




            UPDATE pev_t_projects
            SET
                name = p_name
            ,project_state = p_project_state
            ,identification = p_identification
            ,project_status = p_project_status
            ,kakadu_number = p_kakadu_number
            ,bdc_number = p_bdc_number
            ,bdc_ops = p_bdc_ops
            ,department = p_department
            ,project_manager = p_project_manager
            ,business_owner = p_business_owner
            ,it_owner = p_it_owner
            ,start_date_expect = p_start_date_expect
            ,start_date_real = p_start_date_real
            ,end_date_exp = p_end_date_exp
            ,end_date_real = p_end_date_real
            ,budget = p_budget
            ,forecast = p_forecast
            ,forecast_approve_date = p_forecast_approve_date
            ,project_description = p_project_description
            ,descr_scope = p_descr_scope
            ,layout = p_layout
            ,layout_url = p_layout_url
            ,is_deleted = '0'
            ,budget_approve_date = p_budget_approve_date
            ,budget_approve = p_budget_approve
            ,forecast_approve = p_forecast_approve
            ,approve          = p_approve
            WHERE
                id = p_id
            RETURNING id INTO id_out;

            p_action := 'U';
        END IF;

                    IF p_old_approve = '0' THEN p_old_approve := 'Ne'; END IF;
                    IF p_old_approve = '1' THEN p_old_approve := 'Ano'; END IF;
                    IF p_approve = '0' THEN p_approve_text := 'Ne'; END IF;
                    IF p_approve = '1' THEN p_approve_text := 'Ano'; END IF;



IF p_email = 0 THEN
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Název',p_old_name,p_name,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Stav',(select state_name from pev_t_lov_project_state where id = p_old_project_state),(select state_name from pev_t_lov_project_state where id = p_project_state),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Identifikace',(select name from pev_t_lov_project_identify where id = p_old_identification),(select name from pev_t_lov_project_identify where id = p_identification),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Status',(select status_name from pev_t_lov_project_status where id = p_old_project_status),(select status_name from pev_t_lov_project_status where id = p_project_status),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'KaKadu číslo',p_old_kakadu_number,p_kakadu_number,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'BDC číslo',p_old_bdc_number,p_bdc_number,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'BDC OPS',p_old_bdc_ops,p_bdc_ops,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Oddělení',p_old_department || ' - ' || (select lekarna from lekarny where lekarna_id = p_old_department),p_department || ' - ' || (select lekarna from lekarny where lekarna_id = p_department),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Project manager',(select name || ' ' || surname from pev_t_peoples where id = p_old_project_manager),(select name || ' ' || surname from pev_t_peoples where id = p_project_manager),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Bussines owner',(select name || ' ' || surname from pev_t_peoples where id = p_old_business_owner),(select name || ' ' || surname from pev_t_peoples where id = p_business_owner),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'IT owner',(select name || ' ' || surname from pev_t_peoples where id = p_old_it_owner),(select name || ' ' || surname from pev_t_peoples where id = p_it_owner),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Očekávané zahájení',p_old_start_date_expect,p_start_date_expect,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Reálné zahájení',p_old_start_date_real,p_start_date_real,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Očekávané ukončení',p_old_end_date_exp,p_end_date_exp,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Reálné ukončení',p_old_end_date_real,p_end_date_real,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Budget v Kč',p_old_budget,p_budget,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Forecast v Kč',p_old_forecast,p_forecast,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Termín schválení forecast',p_old_forecast_approve_date,p_forecast_approve_date,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Popis projektu',p_old_project_description,p_project_description,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Popis scope',p_old_descr_scope,p_descr_scope,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Architektonicý návrh',decode(p_old_layout ,1,'ANO',2,'NE'),decode(p_layout,1,'ANO',2,'NE'),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'URL arch. návrhu',p_old_layout_url,p_layout_url,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Termín schválení budget',p_old_budget_approve_date,p_budget_approve_date,p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Budget schválil',(select name || ' ' || surname from pev_t_peoples where id = p_old_budget_approve),(select name || ' ' || surname from pev_t_peoples where id = p_budget_approve),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Forecast schválil',(select name || ' ' || surname from pev_t_peoples where id = p_old_forecast_approve),(select name || ' ' || surname from pev_t_peoples where id = p_forecast_approve),p_action);
        INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION) values (v_record_id, 'PROJECT', id_out,'Ke schválení',p_old_approve,p_approve_text,p_action);

        IF p_action = 'U' THEN
            DELETE pev_t_changes
            WHERE
                    record_id = v_record_id
                AND(old_value = value
                    OR(old_value IS NULL
                       AND value IS NULL));

        END IF;

        IF p_action = 'I' THEN
            DELETE pev_t_changes
            WHERE
                    record_id = v_record_id
                AND value IS NULL;

        END IF;
        select is_duplicated into p_duplicated
        from pev_t_projects where id =nvl(p_id,id_out);
        -- New kakadu mail
        if ( p_old_kakadu_number is null and p_kakadu_number is not null )
        Or ( ( (p_old_kakadu_number is not null and p_kakadu_number is not null)
                or p_old_kakadu_number != p_kakadu_number )
                and p_duplicated = 1)
        THEN
       -- send_mail_kakadu ( p_project_id => nvl(p_id,id_out));
        
            INSERT INTO PEV_T_NOTE_REMIDER_LOG
                (NOTE_ID, NOTE_ICON, NOTE_ICON_COLOR, NOTE_HEADER, NOTE_TEXT, NOTE_COLOR, NOTE_ACCEPT)
                     SELECT 
                PEV_S_PROJECT_LOGBOOK.nextval,NOTE_ICON, NOTE_ICON_COLOR, 
                NOTE_HEADER ,sysdate || '   ' || NOTE_TEXT || p_name, NOTE_COLOR, 'javascript:apex.server.process("ACCEPT_NOTE", {x01: "'|| 
                PEV_S_PROJECT_LOGBOOK.nextval || '"});void(0);'
             FROM PEV_T_LOVE_REMIDER
             WHERE ID = 4;
        
            IF p_duplicated = 1 THEN
            update pev_t_projects set is_duplicated = 2 where id = nvl(p_id,id_out);
            END IF;
        END IF;

        -- Project to inactive mail
        if p_project_state = 2
        THEN
       -- create_mail_end_project ( p_project_id => nvl(p_id,id_out));
            
            INSERT INTO PEV_T_NOTE_REMIDER_LOG
                (NOTE_ID, NOTE_ICON, NOTE_ICON_COLOR, NOTE_HEADER, NOTE_TEXT, NOTE_COLOR, NOTE_ACCEPT)
             SELECT 
                PEV_S_PROJECT_LOGBOOK.nextval,NOTE_ICON, NOTE_ICON_COLOR, 
                NOTE_HEADER ,sysdate || '   ' || NOTE_TEXT || p_name, NOTE_COLOR, 'javascript:apex.server.process("ACCEPT_NOTE", {x01: "'|| 
                PEV_S_PROJECT_LOGBOOK.nextval || '"});void(0);'
             FROM PEV_T_LOVE_REMIDER
             WHERE ID = 3;
        
        END IF;

        SELECT
            COUNT(*)
        INTO cnt
        FROM
            pev_t_changes
        WHERE
            record_id = v_record_id;

        IF(cnt > 0)THEN
            ins_mail_reqest(p_change_id => v_record_id);
            job_na_maily (pi_project_id => nvl(p_id,id_out));
            
             INSERT INTO PEV_T_NOTE_REMIDER_LOG
                (NOTE_ID, NOTE_ICON, NOTE_ICON_COLOR, NOTE_HEADER, NOTE_TEXT, NOTE_COLOR, NOTE_ACCEPT)
             SELECT 
                PEV_S_PROJECT_LOGBOOK.nextval,NOTE_ICON, NOTE_ICON_COLOR, 
                NOTE_HEADER ,sysdate || '   ' || NOTE_TEXT || p_name, NOTE_COLOR, 'javascript:apex.server.process("ACCEPT_NOTE", {x01: "'|| 
                PEV_S_PROJECT_LOGBOOK.nextval || '"});void(0);'
             FROM PEV_T_LOVE_REMIDER
             WHERE ID = 2;
            
        END IF;
        ELSE
        null;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ceos_log.failure(sqlerrm
                             || ' '
                             || dbms_utility.format_error_backtrace);
            RAISE;
    END upd_projects;

----------------------------------------------------------------------------------
/*!
  Procedura vytvori alebo aktualizuje developerov


 */

procedure upd_project_developer (p_project_id IN NUMBER, p_developer_order IN  NUMBER, p_developer_id IN NUMBER, p_people_id IN NUMBER)
AS vc_procname VARCHAR2(100 char) := 'upd_developer';
    cnt NUMBER;
    p_old_developer_id pev_t_project_developer.developer_id%type;
    p_old_people_id pev_t_project_developer.people_id%type;
    v_record_id integer;
    p_action char;

BEGIN
     CEOS_LOG.set_context_func (vc_pkgname || '.' || vc_procname);
   CEOS_LOG.notice('update developers');
   CEOS_LOG.notice('        p_project_id,
                  p_developer_order,
                  p_developer_id,
                  p_people_id');
BEGIN
    SELECT
        developer_id
       ,people_id
    INTO
        p_old_developer_id
    ,p_old_people_id
    FROM
        pev_t_project_developer
    WHERE
            project_id = p_project_id
        AND developer_order = p_developer_order;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;

SELECT COUNT(*)
INTO cnt
FROM PEV_T_PROJECT_DEVELOPER where project_id = p_project_id and DEVELOPER_ORDER = p_developer_order ;
IF( cnt > 0 )
THEN
            IF p_developer_id is not null THEN
               CEOS_LOG.notice('UPDATE');
                update PEV_T_PROJECT_DEVELOPER
              set
                DEVELOPER_ID  = p_developer_id,
                PEOPLE_ID     = p_people_id
                  where project_id = p_project_id   and  developer_order= p_developer_order;


        else
              CEOS_LOG.notice('DELETE PEV_T_PROJECT_DEVELOPER WHERE
                PROJECT_ID = '||p_project_id||'
                AND
                DEVELOPER_ORDER = '||p_developer_order );

                DELETE PEV_T_PROJECT_DEVELOPER WHERE
                PROJECT_ID = p_project_id
                AND
                DEVELOPER_ORDER = p_developer_order;
                end if ;
ELSE

        IF p_developer_id is not null THEN
            CEOS_LOG.notice('INSERT');
            INSERT INTO PEV_T_PROJECT_DEVELOPER (

                    PROJECT_ID,
                    DEVELOPER_ID,
                    PEOPLE_ID,
                    DEVELOPER_ORDER

                                )
              VALUES                (

                    p_project_id,
                    p_developer_id,
                    p_people_id,
                                        p_developer_order );



        ELSE
          CEOS_LOG.notice('DELETE PEV_T_PROJECT_DEVELOPER WHERE
                PROJECT_ID = '||p_project_id||'
                AND
                DEVELOPER_ORDER = '||p_developer_order );

              DELETE PEV_T_PROJECT_DEVELOPER WHERE
                PROJECT_ID = p_project_id
                AND
                DEVELOPER_ORDER = p_developer_order;

End if;
  end if;

-- Pokud vše proběhlo a hodnoty se liší, zapíšeme do tabulky změn
p_action := 'U';

if ( p_old_developer_id != p_developer_id ) or ( p_old_developer_id is null and p_developer_id is not null)
or ( p_old_developer_id is not null and p_developer_id is  null)
 THEN
   select pev_s_changes_record.nextval into v_record_id from dual;

 INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM, OLD_VALUE, VALUE, ACTION)
 values (v_record_id, 'PROJECT', p_project_id,'Změna developera',
 (SELECT   nazev  FROM ucetni_partneri where partner_id = p_old_developer_id),
 (SELECT   nazev  FROM ucetni_partneri where partner_id = p_developer_id),
 p_action);
END IF;

if ( p_old_people_id != p_people_id ) or ( p_old_people_id is null and p_people_id is not null)
or ( p_old_people_id is not null and p_people_id is null)
 THEN
    select pev_s_changes_record.nextval into v_record_id from dual;
INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Změna osoby',
    (select name || ' ' || surname from pev_t_peoples where id = p_old_people_id),
    (select name || ' ' || surname from pev_t_peoples where id = p_people_id),
    p_action);
END IF;

    SELECT COUNT(*)
        INTO cnt
        FROM PEV_T_CHANGES where RECORD_ID = v_record_id;
        IF( cnt > 0 )
        THEN
            ins_mail_reqest ( p_change_id  =>  v_record_id );
            job_na_maily (pi_project_id => p_project_id);
        END IF;


  EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END upd_project_developer;

----------------------------------------------------------------------------------
/*!
  Procedura aktualizuje developerov


 */

PROCEDURE upd_project_dev_record(
    p_project_id     IN  NUMBER
   ,p_developer_id   IN  NUMBER
   ,p_people_id      IN  NUMBER
   ,p_start_date     IN  DATE
   ,p_end_date       IN  DATE
   ,p_status         IN  INTEGER
   ,p_budget         IN  NUMBER
   ,p_forecast       IN  NUMBER
   ,p_uat_date       IN  DATE
   ,p_resolved_date  IN  DATE
)

AS  vc_procname VARCHAR2(100 CHAR):= 'upd_project_dev_record';
    p_old_people_id NUMBER;
    p_old_start_date DATE;
    p_old_end_date DATE;
    p_old_status INTEGER;
    p_old_budget NUMBER;
    p_old_forecast NUMBER;
    p_old_uat_date DATE;
    p_old_resolved_date DATE;
    v_record_id INTEGER;
    p_action varchar2(1 CHAR);
    cnt integer;
    p_name_developer VARCHAR2(20 CHAR);
    p_name           VARCHAR2(20 CHAR);
BEGIN
     CEOS_LOG.set_context_func (vc_pkgname || '.' || vc_procname);
   CEOS_LOG.notice(p_project_id||', p_start_date' ||
                  p_start_date
                ||', p_developer_id'  ||  p_developer_id
                ||', p_people_id' ||  p_people_id || ',  p_end_date:'|| p_end_date ||' , p_status: '||  p_status || ', p_budget, p_forecast, p_uat_date, p_resolved_date' );
    select pev_s_changes_record.nextval into v_record_id from dual;

       SELECT
            people_id
           ,start_date
           ,end_date
           ,status
           ,budget
           ,forecast
           ,uat_date
           ,resolved_date
        INTO
            p_old_people_id
        ,p_old_start_date
        ,p_old_end_date
        ,p_old_status
        ,p_old_budget
        ,p_old_forecast
        ,p_old_uat_date
        ,p_old_resolved_date
        FROM
            pev_t_project_developer
        WHERE
                project_id = p_project_id
            AND developer_id = p_developer_id;

           p_action := 'U';
      update PEV_T_PROJECT_DEVELOPER
        set
          PEOPLE_ID           = p_people_id,
          START_DATE                  = p_start_date,
          END_DATE          = p_end_date,
          STATUS            = p_status,
          BUDGET            = p_budget,
          FORECAST          = p_forecast,
          UAT_DATE          = p_uat_date,
          RESOLVED_DATE       = p_resolved_date

          where PROJECT_ID = p_project_id and  DEVELOPER_ID = p_developer_id;

           update pev_t_projects
                    set pev_t_projects.PROJECT_CHANGE =  sysdate
                        where id = p_project_id;

  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Stakeholder',
    (select name || ' ' || surname from pev_t_peoples where id = p_old_people_id),
    (select name || ' ' || surname from pev_t_peoples where id = p_people_id)
    ,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Reálné datum zahájení',p_old_start_date,p_start_date,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Reálné datum ukončení',p_old_end_date,p_end_date,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Status',
    (select status_name from pev_t_lov_project_status where id = p_old_status),
    (select status_name from pev_t_lov_project_status where id = p_status)
    ,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Budget',p_old_budget,p_budget,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Forecast',p_old_forecast,p_forecast,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Datum UAT',p_old_uat_date,p_uat_date,p_action);
  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, 'PROJECT_DEVELOPER', p_project_id,p_developer_id,
    'Datum Resolved',p_old_resolved_date,p_resolved_date,p_action);

    IF p_action = 'U' THEN
    DELETE PEV_T_CHANGES where RECORD_ID = v_record_id and
    (OLD_VALUE = VALUE OR ( old_value is null and value is null ) );
    END IF;

    SELECT COUNT(*)
        INTO cnt
        FROM PEV_T_CHANGES where RECORD_ID = v_record_id;
        IF( cnt > 0 )
        THEN
            ins_mail_reqest ( p_change_id  =>  v_record_id );
             job_na_maily (pi_project_id => p_project_id);
        END IF;

                SELECT nazev INTO p_name_developer FROM  ucetni_partneri WHERE partner_id = p_developer_id;
                SELECT name INTO p_name FROM  pev_t_projects WHERE id = p_project_id;
                
                INSERT INTO PEV_T_NOTE_REMIDER_LOG
                (NOTE_ID, NOTE_ICON, NOTE_ICON_COLOR, NOTE_HEADER, NOTE_TEXT, NOTE_COLOR, NOTE_ACCEPT)
                     SELECT 
                PEV_S_PROJECT_LOGBOOK.nextval,NOTE_ICON, NOTE_ICON_COLOR, 
                NOTE_HEADER || p_name,sysdate || '   ' || NOTE_TEXT || p_name_developer, NOTE_COLOR, 'javascript:apex.server.process("ACCEPT_NOTE", {x01: "'|| 
                PEV_S_PROJECT_LOGBOOK.nextval || '"});void(0);'
             FROM PEV_T_LOVE_REMIDER
             WHERE ID = 5;


    ceos_log.success;
  EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END upd_project_dev_record;

----------------------------------------------------------------------------------
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
    )AS
    v_email_addr varchar2 (100 CHAR);
    BEGIN
        ceos_log.success;

    FOR peoples IN
    (select * from pev_t_peoples where email_notification = 1 and email is not null and is_deleted = 0)
        LOOP

           insert into PEV_T_MAIL_REQ (CHANGE_ID,PEOPLE_ID,EMAIL,STATUS)
        values
           ( p_change_id, peoples.id, peoples.email, '0');
        END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            ceos_log.failure(sqlerrm
                             || ' '
                             || dbms_utility.format_error_backtrace);
            RAISE;
    END ins_mail_reqest;


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
    PROCEDURE send_mails ( pi_project_id NUMBER default null )
    AS
        vc_procname       CONSTANT VARCHAR2(50 CHAR):= 'send_mails';

        l_text_body       CLOB;
        l_email_receiver  VARCHAR2(255 CHAR);
        l_send_email      VARCHAR2(255 CHAR);
        l_receiver_bcc    VARCHAR2(255 CHAR);
        l_sender          VARCHAR2(255 CHAR):= 'projekty@drmax.cz';
        l_subject         VARCHAR2(2000 CHAR);

        l_prostredi       VARCHAR2(20 CHAR);

        v_kakadu          pev_t_projects.kakadu_number%TYPE;
        v_nazev_projektu  pev_t_projects.name%TYPE;

        v_dodavatel       ucetni_partneri.nazev%TYPE;

        v_zmenu_provedl VARCHAR2(200 CHAR);
        cnt integer;
    BEGIN
        ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);

-- loop na jednotlivé emaily:
         FOR projekty IN(
            SELECT DISTINCT cat_id   AS project_id
              FROM pev_t_mail_req req JOIN pev_t_changes chgs ON chgs.record_id = req.change_id AND status = 0
              WHERE cat_id = pi_project_id OR pi_project_id IS NULL
        )LOOP
            SELECT name, kakadu_number
              INTO v_nazev_projektu, v_kakadu
              FROM pev_t_projects
             WHERE id = projekty.project_id;

           l_subject := 'Provedené změny na Projektu: ';
           l_subject := l_subject || v_nazev_projektu;
           IF  v_kakadu IS NOT NULL THEN
             l_subject := l_subject || ' - ' || v_kakadu;
           END IF;

           l_text_body := NULL;
           l_text_body := '<html>
             '||vc_html_header||'
            <body>
                       Dobrý den, <br>
            posílame Vám upozornění ke změně v evidenci projektu: <font size="4"><p>'|| v_nazev_projektu ||  '</p></font>' || '.'  || chr(10);
            WITH
               jmena
               AS
                 (SELECT DISTINCT NVL (chgs.updated_by, chgs.created_by)   AS jmeno
                    FROM pev_t_mail_req  req
                         JOIN pev_t_changes chgs ON chgs.record_id = req.change_id AND cat_id = projekty.project_id AND status = 0)
             SELECT LISTAGG (jmena.jmeno, ',') WITHIN GROUP (ORDER BY jmena.jmeno)
               INTO v_zmenu_provedl
               FROM jmena;

           l_text_body := l_text_body || '<p>' || 'Tuto změnu provedl ' ||
           v_zmenu_provedl || '.'|| '</p><br>';

           -- pasaz project
        SELECT COUNT(*)
          INTO cnt
          FROM pev_t_changes JOIN pev_t_mail_req ON pev_t_changes.record_id = pev_t_mail_req.change_id
         WHERE status = 0
           AND cat_id = projekty.project_id
           AND cat  LIKE 'PROJECT';

        IF cnt > 0 THEN
          l_text_body := l_text_body
                           || '<table class="styled-table" ><thead>
    <tr>
      <th>Položka</th>
      <th>Nová hodnota</th>
      <th>Původní hodnota</th>
    </tr>
  </thead><tbody>';
          FOR changes
           IN (SELECT *
                 FROM pev_t_changes
                WHERE     record_id IN
                            (SELECT change_id
                               FROM pev_t_mail_req  req
                                    JOIN pev_t_changes chgs ON chgs.record_id = req.change_id AND cat_id = projekty.project_id
                              WHERE status = 0)
                      AND cat LIKE 'PROJECT') LOOP
           l_text_body :=
                l_text_body
             || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
             || changes.item
             || '</b></TD><TD style="color:#00a21c">'
             || changes.VALUE
             || '</td><td style="color:#ff0000">'
             || changes.old_value
             || '</td></tr>';
         END LOOP;

         l_text_body := l_text_body || '</tbody>
                           </table><br>';

       END IF;


    -- pasaz project_developer
       SELECT COUNT (*)
         INTO cnt
         FROM pev_t_changes JOIN pev_t_mail_req ON pev_t_changes.record_id = pev_t_mail_req.change_id
        WHERE status = 0 AND cat LIKE 'PROJECT_DEVELOPER' AND cat_id = projekty.project_id;

        IF(cnt > 0)THEN
          l_text_body := l_text_body || '<table class="styled-table" ><thead>
    <tr>
       <th>Dodavatel</th>
      <th>Položka</th>
      <th>Nová hodnota</th>
      <th>Původní hodnota</th>

    </tr>
  </thead><tbody>';

                    FOR changes IN(
                    SELECT
                        *
                    FROM
                        pev_t_changes
                    WHERE
                       record_id in ( select change_id from pev_t_mail_req
                        where status = 0
                        )
                        and cat  LIKE 'PROJECT_DEVELOPER'
                        and cat_id = projekty.project_id
                    )LOOP
                        BEGIN
                          SELECT nazev
                            INTO v_dodavatel
                            FROM ucetni_partneri
                            WHERE partner_id = changes.item_id;

                        EXCEPTION
                          WHEN NO_DATA_FOUND THEN
                            v_dodavatel := NULL;
                        END;

                        l_text_body := l_text_body
                                       || '
                                       <tr><td style="width:200px">'
                                       || v_dodavatel
                                       || '</td><td style="width:150px"><b>'
                                       || changes.item
                                       || '</b></td><td style="color:#00a21c">'
                                       || changes.value
                                       || '</td><td style="color:#ff0000">'
                                       || changes.old_value
                                       || '</td></tr>';
                        END LOOP;
                l_text_body := l_text_body
                           || '</tbody>
                           </table><br>';

           END IF; -- konec pasaze projekt_developer

-- pasaz Journal
        SELECT COUNT(*)
          INTO cnt
          FROM pev_t_changes JOIN pev_t_mail_req ON  pev_t_changes.record_id = pev_t_mail_req.change_id
         WHERE status = 0
           AND cat  LIKE 'JOURNAL'
           AND cat_id = projekty.project_id;

        IF(cnt > 0)THEN
          l_text_body := l_text_body || '<p><b><h3>' || 'Projektový deník'  || '</p></b></h3><br>';
                    l_text_body := l_text_body
                           || '<table class="styled-table" ><thead>
    <tr>
       <th>Datum záznamu</th>
      <th>Provedená změna</th>
      <th>Text</th>
      <th>Původní text</th>

    </tr>
  </thead><tbody>';

                    FOR changes IN(
                    SELECT
                        *
                    FROM
                        pev_t_changes
                    WHERE
                       record_id in ( select change_id from pev_t_mail_req
                        where status = 0
                        )
                        and cat  LIKE 'JOURNAL'
                        and cat_id = projekty.project_id
                    )LOOP

                        l_text_body := l_text_body
                                       || '
                                       <tr><td style="width:200px">'
                                       || changes.journal_date
                                       || '</td><td style="width:150px">'
                                       || CASE WHEN changes.action = 'I' THEN 'Nový záznam'
                                               WHEN changes.action = 'U' THEN 'Aktualizovaný záznam'
                                               WHEN changes.action = 'D' THEN 'Smazaný záznam'
                                           END
                                       || '</td><td style="color:#00a21c">'
                                       || changes.value
                                       || '</td><td style="color:#ff0000">'
                                       || changes.old_value
                                       || '</td></tr>';


                        END LOOP;
                l_text_body := l_text_body
                           || '</tbody>
                           </table><br>';

        END IF; -- konec pasaze journal

        UPDATE pev_t_mail_req
           SET status = 1
         WHERE change_id IN ( select record_id from pev_t_changes changes where  cat_id = projekty.project_id and status = 0 );

   /*  UPDATE pev_t_mail_req
                SET
                    status = 1 where
       record_id in ( select change_id from pev_t_mail_req
                        where status = 0
                        )
                        and cat  LIKE 'PROJECT_DEVELOPER'
                        and cat_id = projekty.project_id; */


            l_text_body := l_text_body              || chr(10)
                           || '<div>
                           <font size="2"><p>Odkaz na aplikaci <a href="%link">ZDE</a></p></font>
                            </div>
                           </body></html>';

            SELECT  sys_context('USERENV','SERVER_HOST')
            INTO l_prostredi
            FROM  dual;

      --useknu posledni pismeno d t nebo p
           l_prostredi := substr(l_prostredi ,-1);
      -- vyberu adresu podle dev test prod

      --zamenuji VARIABLE_KEY %XXX
      --zamenuji %link za link na aplikaci
      CASE
        l_prostredi --bylo by vhodne ulozit linky do options tabulky
        WHEN 'd' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz-dev.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||projekty.project_id);
        WHEN 't' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz-test.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||projekty.project_id);
        WHEN 'p' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||projekty.project_id);
      END CASE;


  FOR requesty IN(
                SELECT
                    distinct email
                FROM
                    pev_t_mail_req
                WHERE
                    change_id in ( select record_id from pev_t_changes changes
                    where  cat_id = projekty.project_id
                    and status = 1 )
            )LOOP


        CASE
        l_prostredi
        WHEN 'd' THEN
          --l_email_receiver := 'testvma@ceosdata.com';
          --l_send_email     := 1;
          CEOS_LOG.notice ('DEV - doing nothing');
        --l_email_receiver := requesty.email||'DEVMAILFAKE';
        l_email_receiver := 'lukas.sarocky@ceosdata.com';
        l_send_email     := 1;
        CEOS_LOG.notice ('DEV - sending to '||l_email_receiver);

        WHEN 't' THEN
          l_email_receiver := 'testvma@ceosdata.com';
          CEOS_LOG.notice ('TEST - sending to '||l_email_receiver);
          l_send_email     := 1;

        WHEN 'p' THEN
          CEOS_LOG.notice ('PROD - sending to: '||requesty.email);

          l_email_receiver := requesty.email;
          l_send_email     := 1;

      END CASE;


             ceos_log.notice(l_email_receiver
                            || ' - '
                            || SUBSTR(l_text_body,1,2000));

     --až tady pošlu
            IF l_send_email = 1 THEN


  --vkladam do begin/end bloku aby kdyz dokde k chybe odeslani tak si zalogujeme emailovou adresu a nedojde k preruseni odesilani
                  BEGIN
                    app_utils.send_mail_html_with_attach(
                                                        p_to => l_email_receiver
                                                       ,p_cc => NULL
                                                       ,p_from => l_sender
                                                       ,p_subject => l_subject
                                                       ,p_text_body => l_text_body
                                                       ,p_attach_name => NULL
                                                       ,p_attach_mime => NULL
                                                       ,p_attach_blob => NULL
                    );

                    ceos_log.notice('Email sended to: '
                                    || l_email_receiver
                                    || ' - '
                                    || SUBSTR(l_text_body,1,2000));
                END;
            END IF;
        UPDATE pev_t_mail_req
                SET
                    status = 2
                WHERE
                    status =1 and
                    email = requesty.email;



        END LOOP;





    END LOOP;


        ceos_log.success;
    EXCEPTION
        WHEN OTHERS THEN
            ceos_log.notice('Chyba odeslání e-mailu! Email sended to: '
                            || l_email_receiver);
            ceos_log.failure('Chyba odeslání e-mailu! '
                             || dbms_utility.format_error_stack);
            ceos_log.set_context_func(vc_pkgname
                                      || '.send_emails_to_suppliers');


   END send_mails;



  PROCEDURE job_na_maily (pi_project_id NUMBER default NULL ) AS
    cnt integer;
    vc_procname       VARCHAR2(100 CHAR):= 'job_na_maily';
    BEGIN
        ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);
 IF   pi_project_id is null THEN
    SELECT
            COUNT(*)
        INTO cnt
        FROM
            dba_scheduler_jobs
        WHERE
            job_name = 'PEV_J_SEND_MAILS';

        IF(cnt > 0)THEN
            dbms_scheduler.set_attribute(
                                        name => 'PEV_J_SEND_MAILS'
                                       ,attribute => 'start_date'
                                       ,value => sysdate + 1/48 -- 1 / 48
            );

        ELSE
            dbms_scheduler.create_job(
                                     job_name => 'PEV_J_SEND_MAILS'
                                    ,job_type => 'PLSQL_BLOCK'
                                    ,job_action => 'BEGIN pev_k_main.send_mails; END;'
                                    ,start_date => sysdate + 1/48 -- 1 / 48
                                    ,auto_drop => true
                                    ,enabled => true
   --schedule_name            =>  'my_saved_schedule'
               );
        END IF;
-- JOBY NA JEDNOTLIVE PROJEKTY
 ELSE
        SELECT
            COUNT(*)
        INTO cnt
        FROM
            dba_scheduler_jobs
        WHERE
            job_name = 'PEV_J_SEND_MAILS_'||pi_project_id;

        IF(cnt > 0)THEN
            dbms_scheduler.set_attribute(
                                        name => 'PEV_J_SEND_MAILS_'||pi_project_id
                                       ,attribute => 'start_date'
                                       ,value => sysdate + 1/48 -- 1 / 48
            );

        ELSE
            dbms_scheduler.create_job(
                                     job_name => 'PEV_J_SEND_MAILS_'||pi_project_id
                                    ,job_type => 'PLSQL_BLOCK'
                                    ,job_action => 'BEGIN pev_k_main.send_mails(pi_project_id=>'|| pi_project_id ||'); END;'
                                    ,start_date => sysdate + 1/48 -- 1 / 48
                                    ,auto_drop => true
                                    ,enabled => true
   --schedule_name            =>  'my_saved_schedule'
               );
        END IF;
    END IF;


    END job_na_maily;



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
        l_item_id   VARCHAR2  ,
        l_item   VARCHAR2   ,
        l_old_value   VARCHAR2  ,
        l_value VARCHAR2 ,
        l_action    VARCHAR2
       )

     AS
      vc_procname    VARCHAR2(100 CHAR);
      v_record_id number;
      cnt integer;
    BEGIN
        ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);
    if l_record_id is null then
            SELECT
            pev_s_changes_record.NEXTVAL
        INTO v_record_id
        FROM
            dual;
    else v_record_id := l_record_id;
    end if;


  INSERT INTO PEV_T_CHANGES (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION)
    values (v_record_id, l_cat, l_cat_id,l_item_id,
    l_item,l_old_value,l_value,l_action);

    SELECT COUNT(*)
        INTO cnt
        FROM PEV_T_CHANGES where RECORD_ID = v_record_id;
        IF( cnt > 0 )
        THEN
            ins_mail_reqest ( p_change_id  =>  v_record_id );
            job_na_maily (pi_project_id => l_cat_id);
        END IF;


    ceos_log.success;
  EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;

END insert_change;

----------------------------------------------------------------------------------
/*!
  Procedura skopiruje developerov do kopirovaneho projektu



  * @version 2021-01-29  LSAROCKY    vytvoreníe procedury

 */

procedure copy_developer (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER)
AS vc_procname VARCHAR2(100 char) := 'copy_developer';
    cnt NUMBER;
    p_old_developer_id pev_t_project_developer.developer_id%type;
    p_old_people_id pev_t_project_developer.people_id%type;
    v_record_id integer;
    p_action char;
  c_developer_id   NUMBER;
  c_people_id      NUMBER;
  c_start_date     DATE;
  c_end_date       DATE;
  c_status     NUMBER;
  c_budget     NUMBER;
  c_forecast       NUMBER;
  c_uat_date       DATE;
  c_resolved_date  DATE;



BEGIN
     CEOS_LOG.set_context_func (vc_pkgname || '.' || vc_procname);
   CEOS_LOG.notice('copy developers');
   CEOS_LOG.notice('        p_project_id_copy,
                  p_project_id_new');


FOR i IN 1..7
LOOP

SELECT COUNT(*)
INTO cnt
FROM PEV_T_PROJECT_DEVELOPER where project_id = p_project_id_copy and DEVELOPER_ORDER = i ;
IF( cnt > 0 )
THEN

SELECT developer_id, people_id, start_date, end_date, status, budget, forecast, uat_date, resolved_date
INTO   c_developer_id, c_people_id, c_start_date, c_end_date, c_status, c_budget, c_forecast, c_uat_date, c_resolved_date
FROM pev_t_project_developer WHERE project_id = p_project_id_copy and developer_order = i;

            CEOS_LOG.notice('COPY DEVELOPER');
            INSERT INTO PEV_T_PROJECT_DEVELOPER (

                    PROJECT_ID,
                    DEVELOPER_ID,
                    PEOPLE_ID,
                    DEVELOPER_ORDER,
                    START_DATE,
                    END_DATE,
                    STATUS,
                    BUDGET,
                    FORECAST,
                    UAT_DATE,
                    RESOLVED_DATE

                                )
              VALUES                (

                    p_project_id_new,
                    c_developer_id,
                    c_people_id,
                                        i,
                    c_start_date,
                    c_end_date,
                    c_status,
                    c_budget,
                    c_forecast,
                    c_uat_date,
                    c_resolved_date);

ELSE
NULL;
END IF;

END LOOP;


  ceos_log.success;

  EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END copy_developer;

----------------------------------------------------------------------------------
/*!
  Procedura skopiruje prilohy do kopirovaneho projektu



  * @version 2021-01-29  LSAROCKY    vytvoreníe procedury

 */

procedure copy_files (p_project_id_copy IN NUMBER, p_project_id_new IN NUMBER)
AS vc_procname  VARCHAR2(100 char) := 'copy_files';
c_filename      VARCHAR2 (250 CHAR);
c_mime_type     VARCHAR2 (250 CHAR);
c_file_content  BLOB;
c_size          NUMBER;
cnt             NUMBER;



BEGIN
     CEOS_LOG.set_context_func (vc_pkgname || '.' || vc_procname);
   CEOS_LOG.notice('copy developers');
   CEOS_LOG.notice('        p_project_id_copy,
                  p_project_id_new');


SELECT COUNT (*) INTO cnt FROM pev_t_files WHERE project_id = p_project_id_copy;

IF cnt > 0 THEN

FOR i in 1..cnt
LOOP

SELECT file_name, file_mime_type, file_content, file_size
INTO   c_filename, c_mime_type, c_file_content, c_size
FROM   ( SELECT ROWNUM rn, file_name, file_mime_type, file_content, file_size   FROM pev_t_files where project_id = p_project_id_copy )
WHERE   rn = i;

 INSERT INTO PEV_T_FILES (
        PROJECT_ID,
        FILE_NAME,
        FILE_MIME_TYPE,
        FILE_CONTENT,
        FILE_SIZE
    ) VALUES (
        p_project_id_new,
        c_filename,
        c_mime_type,
        c_file_content,
        c_size
    );

END LOOP;
ELSE
NULL;
END IF;

  ceos_log.success;


  EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END copy_files;


/**  send_mails
  *
  1 -
Trigger: při doplnění pole KaKaDu číslo odeslat email (u obou stejný vzhled emailu i recipienti)

Komu: poslat email na zuzana.soukopova@drmax.cz a v kopii na renata.svarcova@drmax.cz a simona.vaxmonska@drmax.cz
Kdy: "okamžitě"
Předmět emailu: "Vznik nové zakázky <KAKADUČÍSLO>"
Tělo emailu bude obsahovat pole: KaKaDu číslo, Název projektu, Popis projektu a Projektový manažera* <p>
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
    PROCEDURE send_mail_kakadu ( p_project_id IN NUMBER)
    AS

        vc_procname       CONSTANT VARCHAR2(100 CHAR):= 'send_mail_kakadu';

        l_text_body       CLOB;
        l_email_receiver  VARCHAR2(100 CHAR);
        l_send_email      VARCHAR2(100 CHAR);
        l_cc              VARCHAR2(100 CHAR);
        l_sender          VARCHAR2(100 CHAR):= 'projekty@drmax.cz';
        l_subject         VARCHAR2(2000 CHAR);
        l_prostredi       VARCHAR2(20 CHAR);



        v_kakadu          pev_t_projects.kakadu_number%TYPE;
        v_nazev_projektu  pev_t_projects.name%TYPE;
        v_popis_projektu  pev_t_projects.project_description%TYPE;
        v_pm_id           pev_t_projects.project_manager%TYPE;
        v_pm_name         VARCHAR2(200 CHAR);

    BEGIN
        ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);
        ceos_log.notice ( 'select kakadu_number,name,project_description,project_manager
       into v_kakadu,v_nazev_projektu,v_popis_projektu,v_pm_id
       from pev_t_projects where id = '||p_project_id);

       select kakadu_number,name,project_description,project_manager
       into v_kakadu,v_nazev_projektu,v_popis_projektu,v_pm_id
       from pev_t_projects where id = p_project_id;

       if v_pm_id is not null then
       select name || ' ' || surname into v_pm_name
       from pev_t_peoples
       where id = v_pm_id;
       end if;

       select VALUE into l_send_email
       from pev_t_profile_options
       where code = 'EMAIL_KAKADU';

       select VALUE into l_cc
       from pev_t_profile_options
       where code = 'EMAIL_KAKADU_CC';

       select replace(VALUE,'%KAKADU', v_kakadu) into l_subject
       from pev_t_profile_options
       where code = 'EMAIL_KAKADU_SUBJECT';

       select VALUE into l_sender
       from pev_t_profile_options
       where code = 'EMAIL_SENDER';


      l_text_body := '<html>
              '||vc_html_header||'
        <body>
        Dobrý den, <br>
            Vznik nového projektu v evidenci projektu: <font size="4"><p>'|| v_nazev_projektu ||  '</p></font>' || '.'  || chr(10);
       l_text_body := l_text_body
|| '<table class="styled-table" >
<tbody>';

     l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Název projektu: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_nazev_projektu
                                       || '</td></tr>';

    l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Kakadu číslo: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_kakadu
                                       || '</td></tr>';

    l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Projekt manažer: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_pm_name
                                       || '</td></tr>';

    l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Popis projektu: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_popis_projektu
                                       || '</td></tr>';

l_text_body := l_text_body
|| '</tbody></table><br /><p style="font-size:10px">Odkaz na aplikaci <a href="%link">ZDE</a></p></body></html>';
       --emailu bude obsahovat pole: KaKaDu číslo, Název projektu, Popis projektu a Projektový manažera* <p>


            SELECT
                sys_context(
                    'USERENV'
                   ,'SERVER_HOST'
                )
            INTO l_prostredi
            FROM
                dual;

      --useknu posledni pismeno d t nebo p
                  l_prostredi := substr(
                                 l_prostredi
                                ,-1
                           );
      -- vyberu adresu podle dev test prod

      --zamenuji VARIABLE_KEY %XXX
      --zamenuji %link za link na aplikaci
      CASE
        l_prostredi --bylo by vhodne ulozit linky do options tabulky
        WHEN 'd' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz-dev.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||p_project_id);
        WHEN 't' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz-test.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||p_project_id);
        WHEN 'p' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||p_project_id);
      END CASE;

    CASE
        l_prostredi
        WHEN 'd' THEN
          --l_email_receiver := 'testvma@ceosdata.com';
          --l_send_email     := 1;
          CEOS_LOG.notice ('DEV - doing nothing');
        --l_email_receiver := requesty.email||'DEVMAILFAKE';
        l_email_receiver := 'libor.imrich@ceosdata.com';
        l_cc := null;
        l_send_email     := 1;
        CEOS_LOG.notice ('DEV - sending to '||l_email_receiver);

        WHEN 't' THEN
          l_email_receiver := 'testvma@ceosdata.com';
          l_cc := null;
          CEOS_LOG.notice ('TEST - sending to '||l_email_receiver);
          l_send_email     := 1;

        WHEN 'p' THEN
          CEOS_LOG.notice ('PROD - sending to: '||l_send_email);

          l_email_receiver := l_send_email;
          l_send_email     := 1;

      END CASE;


             ceos_log.notice(l_email_receiver
                            || ' - '
                            || SUBSTR(l_text_body,1,2000));

     --až tady pošlu
            IF l_send_email = 1 THEN


  --vkladam do begin/end bloku aby kdyz dokde k chybe odeslani tak si zalogujeme emailovou adresu a nedojde k preruseni odesilani
                  BEGIN
                    app_utils.send_mail_html_with_attach(
                                                        p_to => l_email_receiver
                                                       ,p_cc => l_cc
                                                       ,p_from => l_sender
                                                       ,p_subject => l_subject
                                                       ,p_text_body => l_text_body
                                                       ,p_attach_name => NULL
                                                       ,p_attach_mime => NULL
                                                       ,p_attach_blob => NULL
                    );

                    ceos_log.notice('Email sended to: '
                                    || l_email_receiver
                                    || ' - '
                                    || SUBSTR(l_text_body,1,2000));
                END;
            END IF;



     ceos_log.success;

    EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;

END send_mail_kakadu;




/**  send_mails
Trigger: při změně "Stavu" na Neaktivní
Komu: poslat email na zuzana.soukopova@drmax.cz a v kopii na renata.svarcova@drmax.cz a simona.vaxmonska@drmax.cz
Kdy: na konci příštího měsíce
Předmět: Ukončení zakázky projektu "<KAKADUČÍSLO>"
Tělo emailu bude obsahovat pole (stejný jak u 1): KaKaDu číslo, Název projektu, Popis projektu a Projektový manažera*
Př: Když změníme stav na Neaktivní 20.ledna...email půjde 28.února
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

    PROCEDURE create_mail_end_project ( p_project_id IN NUMBER)
    AS
        vc_procname       CONSTANT VARCHAR2(100 CHAR):= 'send_mail_kakadu';

        l_text_body       CLOB;

        l_email_receiver  VARCHAR2(255 CHAR);
        l_send_email      VARCHAR2(255 CHAR);
        l_cc              VARCHAR2(255 CHAR);
        l_sender          VARCHAR2(255 CHAR):= 'projekty@drmax.cz';
        l_subject         VARCHAR2(500 CHAR);
        l_prostredi       VARCHAR2(20  CHAR);

        v_kakadu          pev_t_projects.kakadu_number%TYPE;
        v_nazev_projektu  pev_t_projects.name%TYPE;
        v_popis_projektu  pev_t_projects.project_description%TYPE;
        v_pm_id           pev_t_projects.project_manager%TYPE;
        v_pm_name         VARCHAR2(255 CHAR);

    BEGIN
      ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);

      SELECT kakadu_number, name, project_description, project_manager
        INTO v_kakadu, v_nazev_projektu, v_popis_projektu, v_pm_id
        FROM pev_t_projects
       WHERE id = p_project_id;

      IF v_pm_id IS NOT NULL THEN

       SELECT name || ' ' || surname
         INTO v_pm_name
         FROM pev_t_peoples
        WHERE id = v_pm_id;

      END IF;

      SELECT VALUE
       INTO l_send_email
       FROM pev_t_profile_options
      WHERE code = 'EMAIL_INACTIVE';

     SELECT VALUE
       INTO l_cc
       FROM pev_t_profile_options
      WHERE code = 'EMAIL_INACTIVE_CC';

     SELECT REPLACE (VALUE, '%KAKADU', v_kakadu)
       INTO l_subject
       FROM pev_t_profile_options
      WHERE code = 'EMAIL_INACTIVE_SUBJECT';

     SELECT VALUE
       INTO l_sender
       FROM pev_t_profile_options
      WHERE code = 'EMAIL_SENDER';


      l_text_body := '<html>
              '||vc_html_header||'
        <body>
        Dobrý den, <br>
            Ukončení projektu v evidenci projektu: <font size="4"><p>'|| v_nazev_projektu ||  '</p></font>' || '.'  || chr(10);
       l_text_body := l_text_body
|| '<table class="styled-table" >
<tbody>';

     l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Název projektu: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_nazev_projektu
                                       || '</td></tr>';

    l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Kakadu číslo: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_kakadu
                                       || '</td></tr>';

    l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Projekt manažer: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_pm_name
                                       || '</td></tr>';

    l_text_body := l_text_body
                                       || '
                                       <! — [if mso]><TR><TD width="150px" ><b><![endif]-->'
                                       || 'Popis projektu: '
                                       || '</b></TD><TD style="color:#00a21c">'
                                       || v_popis_projektu
                                       || '</td></tr>';

l_text_body := l_text_body
|| '</tbody></table><br /><p style="font-size:10px">Odkaz na aplikaci <a href="%link">ZDE</a></p></body></html>';
       --emailu bude obsahovat pole: KaKaDu číslo, Název projektu, Popis projektu a Projektový manažera* <p>


            SELECT
                sys_context(
                    'USERENV'
                   ,'SERVER_HOST'
                )
            INTO l_prostredi
            FROM
                dual;

      --useknu posledni pismeno d t nebo p
                  l_prostredi := substr(
                                 l_prostredi
                                ,-1
                           );
      -- vyberu adresu podle dev test prod

      --zamenuji VARIABLE_KEY %XXX
      --zamenuji %link za link na aplikaci
      CASE
        l_prostredi --bylo by vhodne ulozit linky do options tabulky
        WHEN 'd' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz-dev.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||p_project_id);
        WHEN 't' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz-test.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||p_project_id);
        WHEN 'p' THEN
          l_text_body := replace(l_text_body, '%link', 'https://cz.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||p_project_id);
      END CASE;

    CASE
        l_prostredi
        WHEN 'd' THEN
          --l_email_receiver := 'testvma@ceosdata.com';
          --l_send_email     := 1;
          CEOS_LOG.notice ('DEV - doing nothing');
        --l_email_receiver := requesty.email||'DEVMAILFAKE';
        l_email_receiver := 'libor.imrich@ceosdata.com';
        l_cc := null;
        l_send_email     := 1;
        CEOS_LOG.notice ('DEV - sending to '||l_email_receiver);

        WHEN 't' THEN
          l_email_receiver := 'testvma@ceosdata.com';
          l_cc := null;
          CEOS_LOG.notice ('TEST - sending to '||l_email_receiver);
          l_send_email     := 1;

        WHEN 'p' THEN
          CEOS_LOG.notice ('PROD - sending to: '||l_send_email);

          l_email_receiver := l_send_email;
          l_send_email     := 1;

      END CASE;


             ceos_log.notice(l_email_receiver
                            || ' - '
                            || SUBSTR(l_text_body,1,2000));

     --až tady pošlu
            IF l_send_email = 1 THEN


  --vkladam do begin/end bloku aby kdyz dokde k chybe odeslani tak si zalogujeme emailovou adresu a nedojde k preruseni odesilani
                  BEGIN


               INSERT INTO PEV_T_MAIL_SCHEDULER
                    (PROJECT_ID,
                    MAIL_FROM,
                    MAIL_TO,
                    MAIL_CC,
                    MAIL_SUBJECT,
                    MAIL_BODY,
                    SEND_DATE,
                    STATUS)
                VALUES
                ( p_project_id, l_sender, l_email_receiver, l_cc, l_subject, l_text_body, ADD_MONTHS (LAST_DAY(trunc(SYSDATE)),1),1 );

                    ceos_log.notice('Email prepared to PEV_T_MAIL_SCHEDULER: '
                                    || l_email_receiver
                                    || ' - '
                                    || SUBSTR(l_text_body,1,2000));
                END;
            END IF;



     ceos_log.success;

    EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;

END create_mail_end_project;

/*
  * <b>INPUT</b>: <ul>
  * <li>pev_t_mail_req</li>
  * <li>pev_t_changes</li>
  * </ul>
  * <p>
  * <b>OUTPUT</b>: <ul>
  * <li>Email</li>
  * </ul>
  *
  * @headcom
  *
  * @version 2020-12-03  limrich    vytvorení procedury
  */

    PROCEDURE send_mail_end_projects
    AS
        l_email_receiver  VARCHAR2(100 CHAR);
        l_send_email      VARCHAR2(100 CHAR);
        l_cc              VARCHAR2(100 CHAR);
        l_sender          VARCHAR2(100 CHAR):= 'projekty@drmax.cz';
        l_subject         VARCHAR2(200 CHAR);
        l_prostredi       VARCHAR2(20 CHAR);
            vc_procname       VARCHAR2(100 CHAR):= 'send_mail_end_projects';
            l_text_body CLOB;

    BEGIN
                   ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);
         SELECT
        sys_context(
            'USERENV'
           ,'SERVER_HOST'
        )
    INTO l_prostredi
    FROM
        dual;

          --useknu posledni pismeno d t nebo p
                      l_prostredi := substr(
                         l_prostredi
                        ,-1
                   );


                  FOR EMAILS IN
                (SELECT
                *
            FROM
                pev_t_mail_scheduler
            WHERE
                    status = 1
                AND send_date <= sysdate
                )
        LOOP
        l_text_body := EMAILS.MAIL_BODY;

      -- vyberu adresu podle dev test prod

      --zamenuji VARIABLE_KEY %XXX
      --zamenuji %link za link na aplikaci
      CASE
        l_prostredi --bylo by vhodne ulozit linky do options tabulky
        WHEN 'd' THEN
          l_text_body := replace(EMAILS.MAIL_BODY, '%link', 'https://cz-dev.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||EMAILS.PROJECT_ID);
        WHEN 't' THEN
          l_text_body := replace(EMAILS.MAIL_BODY, '%link', 'https://cz-test.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||EMAILS.PROJECT_ID);
        WHEN 'p' THEN
          l_text_body := replace(EMAILS.MAIL_BODY, '%link', 'https://cz.dwh.dr-max.global/administrace/f?p=2100:7:::NO:RP,7:P7_PROJECT_ID:'||EMAILS.PROJECT_ID);
      END CASE;

    CASE
        l_prostredi
        WHEN 'd' THEN
          --l_email_receiver := 'testvma@ceosdata.com';
          --l_send_email     := 1;
          CEOS_LOG.notice ('DEV - doing nothing');
        --l_email_receiver := requesty.email||'DEVMAILFAKE';
        l_email_receiver := 'lukas.sarocky@ceosdata.com';
        l_cc := null;
        l_send_email     := 1;
        CEOS_LOG.notice ('DEV - sending to '||l_email_receiver);

        WHEN 't' THEN
          l_email_receiver := 'testvma@ceosdata.com';
          l_cc := null;
          CEOS_LOG.notice ('TEST - sending to '||l_email_receiver);
          l_send_email     := 1;

        WHEN 'p' THEN
          CEOS_LOG.notice ('PROD - sending to: '||EMAILS.MAIL_TO);
            l_cc := EMAILS.MAIL_CC;
          l_email_receiver := EMAILS.MAIL_TO;
          l_send_email     := 1;

      END CASE;


             ceos_log.notice(l_email_receiver
                            || ' - '
                            || SUBSTR(l_text_body,1,2000));

     --až tady pošlu
            IF l_send_email = 1 THEN


  --vkladam do begin/end bloku aby kdyz dokde k chybe odeslani tak si zalogujeme emailovou adresu a nedojde k preruseni odesilani
                  BEGIN


               app_utils.send_mail_html_with_attach(
                                                        p_to => l_email_receiver
                                                       ,p_cc => l_cc
                                                       ,p_from => EMAILS.MAIL_FROM
                                                       ,p_subject => EMAILS.MAIL_SUBJECT
                                                       ,p_text_body => EMAILS.MAIL_BODY
                                                       ,p_attach_name => NULL
                                                       ,p_attach_mime => NULL
                                                       ,p_attach_blob => NULL
                        );
                UPDATE PEV_T_MAIL_SCHEDULER SET STATUS=2 where id = EMAILS.ID;

                    ceos_log.notice('Email sended to: '
                                    || l_email_receiver
                                    || ' - '
                                    || SUBSTR(l_text_body,1,2000));
                END;
            END IF;

           END LOOP;

     ceos_log.success;

    EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;

END send_mail_end_projects;

 /*   PROCEDURE upd_projects_budget_forecast
    AS
    BEGIN

    ceos_log.set_context_func(vc_pkgname || '.upd_projects_budget_forecast');
	--update toho forecastu a budgetu, které nejsou v jedoxu, tak updatujeme tyto projekty na 0
	UPDATE pev_t_projects
       SET budget = 0
     WHERE kakadu_number NOT IN (SELECT budget_item_id
                                   FROM fa_jedox_budget_clh_v
                                  WHERE pmo_scenario_key like 'B%'
                                    AND SUBSTR(fin_period_key, 0, INSTR(fin_period_key, '/') - 1) = CASE WHEN TRUNC(SYSDATE) > TO_DATE(TO_CHAR(EXTRACT(YEAR FROM TRUNC(SYSDATE)) || '-01-15'), 'YYYY-MM-DD')
								                                                                         THEN EXTRACT(YEAR FROM TRUNC(SYSDATE))
								  																	     ELSE EXTRACT(YEAR FROM TRUNC(SYSDATE)) - 1
                                                                                                     END);

    ceos_log.notice('Update budgetu projektu, které už nejsou za aktuální rok v jedoxu na 0: ' || SQL%ROWCOUNT);

    UPDATE pev_t_projects
       SET forecast = 0
     WHERE kakadu_number NOT IN (SELECT budget_item_id
                                   FROM fa_jedox_budget_clh_v
                                  WHERE pmo_scenario_key LIKE 'F%'
                                    AND SUBSTR(fin_period_key, 0, INSTR(fin_period_key, '/') - 1) = CASE WHEN TRUNC(SYSDATE) > TO_DATE(TO_CHAR(EXTRACT(YEAR FROM TRUNC(SYSDATE)) || '-01-15'), 'YYYY-MM-DD')
								                                                                         THEN EXTRACT(YEAR FROM TRUNC(SYSDATE))
								  																	     ELSE EXTRACT(YEAR FROM TRUNC(SYSDATE)) - 1
                                                                                                     END);

    ceos_log.notice('Update forecastu projektu, které už nejsou za aktuální rok v jedoxu na 0: ' || SQL%ROWCOUNT);

    --update budget do pev_t_projects z jedoxu
    MERGE INTO pev_t_projects p
    USING (SELECT budget, pmo_scenario_key, budget_item_id
             FROM (SELECT SUM(local_amount) AS budget,
                          pmo_scenario_key,
                          budget_item_id,
                          SUBSTR(fin_period_key, 0, INSTR(fin_period_key, '/') - 1) AS budget_year
                     FROM fa_jedox_budget_clh_v
                    WHERE pmo_scenario_key like 'B%'
                    GROUP BY pmo_scenario_key,
                             budget_item_id,
                             SUBSTR(fin_period_key, 0, INSTR(fin_period_key, '/') - 1))
             WHERE budget_year = CASE
                    WHEN TRUNC(sysdate) >
                         TO_DATE(TO_CHAR(EXTRACT(YEAR FROM TRUNC(sysdate)) || '-01-15'),
                                 'YYYY-MM-DD') THEN
                     CAST(EXTRACT(YEAR FROM TRUNC(sysdate)) AS NUMBER)
                    ELSE
                     CAST(EXTRACT(YEAR FROM TRUNC(sysdate)) - 1 AS NUMBER)
                  END) t
    ON (p.kakadu_number = t.budget_item_id)
    WHEN MATCHED THEN UPDATE SET
      p.budget = t.budget
    WHERE p.project_state = 1;

    ceos_log.notice('Merge budget do pev_t_projects: ' || SQL%ROWCOUNT);


    --update forecast do pev_t_projects z jedoxu
    MERGE INTO pev_t_projects p
    USING (SELECT forecast,
                  pmo_scenario_key,
                  budget_item_id,
                  budget_year,
                  rn
             FROM (SELECT ROUND(SUM(local_amount), 0) AS forecast,
                          pmo_scenario_key,
                          budget_item_id,
                          SUBSTR(fin_period_key,
                                 0,
                                 INSTR(fin_period_key, '/') - 1) AS budget_year,
                          ROW_NUMBER() OVER(PARTITION BY budget_item_id, SUBSTR(fin_period_key, 0, INSTR(fin_period_key, '/') - 1) ORDER BY SUBSTR(fin_period_key, 0, INSTR(fin_period_key, '/') - 1) DESC, pmo_scenario_key DESC) AS rn
                     FROM fa_jedox_budget_clh_v
                    WHERE pmo_scenario_key LIKE 'F%'
                    GROUP BY pmo_scenario_key,
                             budget_item_id,
                             SUBSTR(fin_period_key,
                                    0,
                                    INSTR(fin_period_key, '/') - 1))
            WHERE budget_year = CASE
                    WHEN TRUNC(sysdate) >
                         TO_DATE(TO_CHAR(EXTRACT(YEAR FROM TRUNC(sysdate)) ||
                                         '-01-15'),
                                 'YYYY-MM-DD') THEN
                     EXTRACT(YEAR FROM TRUNC(sysdate))
                    ELSE
                     EXTRACT(YEAR FROM TRUNC(sysdate)) - 1
                  END
              AND rn = 1) t
    ON (p.kakadu_number = t.budget_item_id)
    WHEN MATCHED THEN
      UPDATE SET p.forecast = t.forecast
    WHERE p.project_state = 1;

    ceos_log.notice('Merge forecast do pev_t_projects: ' || SQL%ROWCOUNT);

    ceos_log.success;

    EXCEPTION
  WHEN OTHERS THEN
    ceos_log.failure(SQLERRM || ' ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;

  END upd_projects_budget_forecast;*/
----------------------------------------------------------------------------------

/*!
  Procedura vytvori alebo aktualizuje record v journale


 */

    PROCEDURE upd_logbook_record (p_project_id IN INTEGER , p_record_date IN DATE, p_text IN VARCHAR2)
    AS
        vc_procname                  VARCHAR2(100 CHAR):= 'upd_logbook_record';
        p_old_date                   DATE;
        p_old_text                   CLOB;
        p_change_id                  INTEGER;
        cnt                          NUMBER;
        p_name                       VARCHAR2(100 CHAR);

    BEGIN
        ceos_log.set_context_func(vc_pkgname
                                  || '.'
                                  || vc_procname);
        ceos_log.notice('update journal');
        
    SELECT COUNT(*)
    INTO cnt
    FROM pev_t_project_logbook where project_id = p_project_id and text_clob is not null;

        IF cnt < 1 THEN
            INSERT INTO pev_t_project_logbook(
                project_id
                ,record_date
                ,text_clob

            )VALUES(
                p_project_id
               ,p_record_date
               ,p_text
            )RETURNING record_id INTO p_change_id ;

            SELECT pev_s_changes_record.nextval INTO p_change_id FROM dual;


             INSERT INTO PEV_T_CHANGES
                (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION, JOURNAL_DATE, OLD_JOURNAL_DATE)
             values
                (p_change_id, 'JOURNAL', p_project_id,null,
                 'JOURNAL',p_old_text,p_text,'I', p_record_date, p_old_date);

        ELSE

            SELECT
                record_date,
                text_clob
             INTO
                p_old_date,
                p_old_text
             FROM
                    pev_t_project_logbook
             WHERE  project_id = project_id AND text_clob is not null;

            SELECT pev_s_changes_record.nextval INTO p_change_id FROM dual;


             INSERT INTO PEV_T_CHANGES
                (RECORD_ID, CAT, CAT_ID, ITEM_ID, ITEM, OLD_VALUE, VALUE, ACTION, JOURNAL_DATE, OLD_JOURNAL_DATE)
             values
                (p_change_id, 'JOURNAL', p_project_id,null,
                 'JOURNAL',p_old_text,p_text,'U', p_record_date, p_old_date);

            UPDATE pev_t_project_logbook
            SET
                text_clob = p_text
               ,record_date = p_record_date
            WHERE
                project_id = p_project_id AND text_clob is not null;
        END IF;

        -- zapis do pev_t_projects pre poslednu zmenu na projekte

        UPDATE pev_t_projects
            SET
                project_change = to_date( sysdate, 'DD.MM.YYYY HH24:MI:SS')
            WHERE
                id = p_project_id;

  SELECT COUNT(*)
    INTO cnt
    FROM PEV_T_CHANGES where RECORD_ID = p_change_id;
      IF( cnt > 0 )
      THEN
         ins_mail_reqest ( p_change_id  =>  p_change_id );
         job_na_maily   (pi_project_id => p_project_id);
         
         
         SELECT name INTO p_name FROM pev_t_projects WHERE id = p_project_id;
         
                                     INSERT INTO PEV_T_NOTE_REMIDER_LOG
                (NOTE_ID, NOTE_ICON, NOTE_ICON_COLOR, NOTE_HEADER, NOTE_TEXT, NOTE_COLOR, NOTE_ACCEPT)
             SELECT 
                PEV_S_PROJECT_LOGBOOK.nextval,NOTE_ICON, NOTE_ICON_COLOR, 
                NOTE_HEADER ,sysdate || '   ' || NOTE_TEXT || p_name, NOTE_COLOR, 'javascript:apex.server.process("ACCEPT_NOTE", {x01: "'|| 
                PEV_S_PROJECT_LOGBOOK.nextval || '"});void(0);'
             FROM PEV_T_LOVE_REMIDER
             WHERE ID = 1;
        
      END IF;
      
      
      
        ceos_log.success;

    EXCEPTION
        WHEN OTHERS THEN
            ceos_log.failure(sqlerrm
                             || ' '
                             || dbms_utility.format_error_backtrace);
            RAISE;
    END upd_logbook_record;

END pev_k_main_rf;