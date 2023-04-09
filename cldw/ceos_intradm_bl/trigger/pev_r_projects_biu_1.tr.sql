create or replace trigger PEV_R_PROJECTS_BIU_1
BEFORE INSERT OR UPDATE ON PEV_T_PROJECTS
FOR EACH ROW
-- $Header$
BEGIN
  IF inserting THEN
    :new.created_date := SYSDATE;
    :new.created_by := NVL(htmldb_application.g_user, USER);
	:new.PROJECT_CHANGE := SYSDATE;
        -- Pokud je definována sekvence, napojení na konkrétní sekvenci
        IF :new.ID IS NULL THEN
        :new.ID := PEV_S_PROJECTS.NEXTVAL;
        END IF;
  ELSIF updating THEN
    :new.updated_date := SYSDATE;
    :new.updated_by := NVL(htmldb_application.g_user, USER);
	:new.PROJECT_CHANGE := SYSDATE;
  END IF;
END;
/

