BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PEV_T_PROJECT_DEVELOPER CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/
CREATE TABLE PEV_T_PROJECT_DEVELOPER(
project_id          integer,     
developer_id        integer,   
people_id           integer,      
start_date          date,
end_date            date,
status              integer,         
budget              number,
forecast            number,
uat_date            date,
resolved_date       date,
developer_order     integer,
CREATED_DATE        DATE,
CREATED_BY          VARCHAR2(30 CHAR),
UPDATED_DATE        DATE,
UPDATED_BY          VARCHAR2(30 CHAR),
CONSTRAINT FK_PROJ_DEV_PROJECT
    FOREIGN KEY (project_id)
    REFERENCES PEV_T_PROJECTS(id),
/*CONSTRAINT FK_PROJ_DEVELOPER
    FOREIGN KEY (developer_id)
    REFERENCES UCETNI_PARTNERI(id),*/
CONSTRAINT FK_PROJ_DEV_STATUS
    FOREIGN KEY (status)
    REFERENCES PEV_T_LOV_PROJECT_STATUS(id),
CONSTRAINT FK_DEV_PEOPLES
    FOREIGN KEY (people_id)
    REFERENCES PEV_T_PEOPLES(id),
CONSTRAINT PK_PEV_T_PROJECT_DEVELOPER primary key (project_id, developer_id)
);
COMMENT ON TABLE PEV_T_PROJECT_DEVELOPER IS 'Vazebnní tabulka developera na projekt.';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.developer_order IS 'Pořadí ve formuláří detail projektu (Dev 1-5)';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.UPDATED_DATE IS 'datum ulozeni';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.UPDATED_BY IS 'Uživatel, který uložil záznam.';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.CREATED_DATE IS 'datum vytvoření';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.CREATED_BY IS 'Uživatel, který vytvoril záznam.';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.project_id IS 'FK - project';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.developer_id IS 'FK - cldw_operations.ucetni_partneri ID';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.people_id IS 'FK - people_id';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.start_date IS 'Datum startu';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.end_date IS 'Datum konca';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.status IS 'FK - projek_status';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.budget IS 'Rozpočet';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.forecast IS 'Odhad';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.uat_date IS 'Datum uat';
COMMENT ON COLUMN PEV_T_PROJECT_DEVELOPER.resolved_date IS 'Datum vyřešení';
/
