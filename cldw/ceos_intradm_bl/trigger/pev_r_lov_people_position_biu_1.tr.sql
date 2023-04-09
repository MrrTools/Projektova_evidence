create or replace trigger PEV_R_LOV_PEOPLE_POSITION_BIU_1
BEFORE INSERT OR UPDATE ON PEV_T_LOV_PEOPLE_POSITION
FOR EACH ROW
-- $Header$
BEGIN
  IF inserting THEN
    :new.created_date := SYSDATE;
    :new.created_by := NVL(htmldb_application.g_user, USER);
  ELSIF updating THEN
    :new.updated_date := SYSDATE;
    :new.updated_by := NVL(htmldb_application.g_user, USER);
  END IF;
END;
/
