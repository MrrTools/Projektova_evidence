--%carp-begin
create or replace force view PEV_T_PROJECT_DEVELOPER_API as
select "PROJECT_ID", "DEVELOPER_ID", "PEOPLE_ID", "START_DATE", "END_DATE", "STATUS", "BUDGET", "FORECAST", "UAT_DATE",
    "RESOLVED_DATE","DEVELOPER_ORDER", "CREATED_DATE", "CREATED_BY", "UPDATED_DATE", "UPDATED_BY"
 from PEV_T_PROJECT_DEVELOPER
/
show errors


COMMENT ON TABLE PEV_T_PROJECT_DEVELOPER_API IS 'Vazebnní tabulka developera na projekt.'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.PROJECT_ID IS 'FK - project'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.DEVELOPER_ID IS 'FK - cldw_operations.ucetni_partneri ID'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.PEOPLE_ID IS 'FK - people_id'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.START_DATE IS 'Datum startu'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.END_DATE IS 'Datum konca'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.STATUS IS 'FK - projek_status'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.BUDGET IS 'Rozpočet'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.FORECAST IS 'Odhad'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.UAT_DATE IS 'Datum uat'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.RESOLVED_DATE IS 'Datum vyřešení'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.DEVELOPER_ORDER IS 'Pořadí ve formuláří detail projektu (Dev 1-5)'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.CREATED_DATE IS 'datum vytvoření'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.CREATED_BY IS 'Uživatel, který vytvoril záznam.'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.UPDATED_DATE IS 'datum ulozeni'
/

COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER_API.UPDATED_BY IS 'Uživatel, který uložil záznam.'
/

--%carp-end
