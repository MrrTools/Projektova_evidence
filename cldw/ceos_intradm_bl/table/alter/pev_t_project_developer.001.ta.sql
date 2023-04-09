COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.UPDATED_DATE IS 'Datum uložení';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.UPDATED_BY IS 'Uživatel, který uložil záznam';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.CREATED_DATE IS 'Datum vytvoření';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.CREATED_BY IS 'Uživatel, který vytvořil záznam';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.project_id IS 'FK - PEV_T_PROJECTS(project_id) - project id';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.people_id IS 'FK -  PEV_T_PEOPLE(ID) - people_id';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.end_date IS 'Datum konce';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.status IS 'FK - PEV_T_LOV_PROJECT_STATUS(ID) - status';






