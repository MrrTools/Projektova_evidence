--%carp-begin
create or replace force view PEV_T_PEOPLE_POSITIONS_API as
select "PEOPLE_ID", "POSITION_ID", "CREATED_DATE", "CREATED_BY", "UPDATED_DATE", "UPDATED_BY"
 from PEV_T_PEOPLE_POSITIONS
/
show errors


COMMENT ON TABLE PEV_T_PEOPLE_POSITIONS_API IS 'Vazebnní tabulka člověk - pozice.'
/

COMMENT ON COLUMN PEV_T_PEOPLE_POSITIONS_API.PEOPLE_ID IS 'FK - ID člověka'
/

COMMENT ON COLUMN PEV_T_PEOPLE_POSITIONS_API.POSITION_ID IS 'FK - project'
/

COMMENT ON COLUMN PEV_T_PEOPLE_POSITIONS_API.CREATED_DATE IS 'datum vytvoření'
/

COMMENT ON COLUMN PEV_T_PEOPLE_POSITIONS_API.CREATED_BY IS 'Uživatel, který vytvoril záznam.'
/

COMMENT ON COLUMN PEV_T_PEOPLE_POSITIONS_API.UPDATED_DATE IS 'datum ulozeni'
/

COMMENT ON COLUMN PEV_T_PEOPLE_POSITIONS_API.UPDATED_BY IS 'Uživatel, který uložil záznam.'
/

--%carp-end