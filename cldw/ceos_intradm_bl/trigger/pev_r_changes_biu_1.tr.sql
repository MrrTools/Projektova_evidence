create or replace trigger PEV_R_CHANGES_BIU_1
BEFORE INSERT OR UPDATE ON PEV_T_CHANGES
FOR EACH ROW
-- $Header$
BEGIN
  IF inserting THEN
    :new.created_date := SYSDATE;
    :new.created_by := NVL(htmldb_application.g_user, USER);
        -- Pokud je definována sekvence, napojení na konkrétní sekvenci
        IF :new.ID IS NULL THEN
        :new.ID := PEV_S_CHANGES.NEXTVAL;
        END IF;
  ELSIF updating THEN
    :new.updated_date := SYSDATE;
    :new.updated_by := NVL(htmldb_application.g_user, USER);
  END IF;
END;
/

