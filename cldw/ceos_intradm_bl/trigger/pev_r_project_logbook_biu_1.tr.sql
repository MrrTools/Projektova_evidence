create or replace trigger PEV_R_PROJECT_LOGBOOK_BIU_1
BEFORE INSERT OR UPDATE ON PEV_T_PROJECT_LOGBOOK
FOR EACH ROW
-- $Header$
BEGIN
  IF inserting THEN
    :new.created_date := SYSDATE;
    :new.created_by := NVL(apex_application.g_user, USER);
        -- Pokud je definována sekvence, napojení na konkrétní sekvenci
        IF :new.record_id IS NULL THEN
        :new.record_id := PEV_S_PROJECT_LOGBOOK.NEXTVAL;
        END IF;
  ELSIF updating THEN
    :new.updated_date := SYSDATE;
    :new.updated_by := NVL(apex_application.g_user, USER);
  END IF;
END;
/
