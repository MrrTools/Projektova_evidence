BEGIN
   DBMS_SCHEDULER.DROP_JOB ('PEV_J_SEND_END_MONTH_EMAILS');
    EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/

BEGIN

    DBMS_SCHEDULER.CREATE_JOB (
            job_name => 'PEV_J_SEND_END_MONTH_EMAILS',
            job_type => 'PLSQL_BLOCK',
            job_action => 'BEGIN PEV_K_MAIN.send_mail_end_projects; END;',
            start_date => SYSDATE,
            repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=-1;BYHOUR=7',
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => 'Job for reminder about end of projects');

    DBMS_SCHEDULER.SET_ATTRIBUTE(
             name => 'PEV_J_SEND_END_MONTH_EMAILS',
             attribute => 'logging_level',
             value => DBMS_SCHEDULER.LOGGING_FULL);

    DBMS_SCHEDULER.enable(name=>'PEV_J_SEND_END_MONTH_EMAILS');

END;
/
