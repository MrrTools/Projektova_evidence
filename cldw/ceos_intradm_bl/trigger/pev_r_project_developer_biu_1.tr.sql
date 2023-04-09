create or replace trigger PEV_R_PROJECT_DEVELOPER_BIU_1
BEFORE INSERT OR UPDATE ON PEV_T_PROJECT_DEVELOPER
FOR EACH ROW
-- $Header$
BEGIN
  IF inserting THEN
    :new.created_date := SYSDATE;
    :new.created_by := NVL(htmldb_application.g_user, USER);
        -- Pokud je definována sekvence, napojení na konkrétní sekvenci
        IF :new.project_ID IS NULL THEN
        :new.project_ID := PEV_S_PROJECT_DEVELOPER.NEXTVAL;
        END IF;
  ELSIF updating THEN
    :new.updated_date := SYSDATE;
    :new.updated_by := NVL(htmldb_application.g_user, USER);
  END IF;
END;
/

