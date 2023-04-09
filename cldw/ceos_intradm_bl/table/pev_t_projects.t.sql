BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PEV_T_PROJECTS CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/
CREATE TABLE PEV_T_PROJECTS (
id integer,
name VARCHAR2(50 CHAR),
project_state integer,      -- FK
identification integer,  -- FK
project_status integer, -- FK - projekt_status
kakadu_number VARCHAR2(50 CHAR),          -- kakadu_cislo
bdc_number VARCHAR2(50 CHAR),
bdc_ops VARCHAR2(50 CHAR), -- upresnit co znamena
department integer, -- ID_Lekarny - select list 900-999
project_manager integer, -- FK - peoples
business_owner INTEGER, -- FK - peoples
it_owner integer, -- FK - peoples
start_date_expect date,
start_date_real date,
end_date_exp date,
end_date_real date,
budget number,
forecast number,
forecast_approve_date date,
BUDGET_APPROVE_DATE date,
budget_approve NUMBER,
forecast_approve NUMBER,
project_description VARCHAR2(2500 CHAR),
descr_scope VARCHAR2(2500 CHAR),
layout integer, -- 0/1
layout_url varchar2(150),
is_deleted integer default 0,
CREATED_DATE DATE,
CREATED_BY VARCHAR2(30 CHAR),
UPDATED_DATE DATE,
UPDATED_BY VARCHAR2(30 CHAR),
CONSTRAINT FK_PROJECT_MANAGER
    FOREIGN KEY (project_manager)
    REFERENCES PEV_T_PEOPLES(id),
CONSTRAINT FK_BUSINESS_OWNER
    FOREIGN KEY (business_owner)
    REFERENCES PEV_T_PEOPLES(id),
CONSTRAINT FK_IT_OWNER
    FOREIGN KEY (it_owner)
    REFERENCES PEV_T_PEOPLES(id),
CONSTRAINT FK_PROJECT_STATUS
    FOREIGN KEY (project_status)
    REFERENCES PEV_T_LOV_PROJECT_STATUS(id),
CONSTRAINT FK_PROJECT_STATE
    FOREIGN KEY (project_state)
    REFERENCES PEV_T_LOV_PROJECT_STATE(id),
CONSTRAINT FK_PROJECT_IDENTIFICATION
    FOREIGN KEY (identification)
    REFERENCES PEV_T_LOV_PROJECT_IDENTIFY(id),
CONSTRAINT PK_PROJECT PRIMARY KEY (id)
);
COMMENT ON TABLE PEV_T_PROJECTS IS 'Tabulka projektů.';
COMMENT ON COLUMN PEV_T_PROJECTS.UPDATED_DATE IS 'datum ulozeni';
COMMENT ON COLUMN PEV_T_PROJECTS.UPDATED_BY IS 'Uživatel, který uložil záznam.';
COMMENT ON COLUMN PEV_T_PROJECTS.CREATED_DATE IS 'datum vytvoření';
COMMENT ON COLUMN PEV_T_PROJECTS.CREATED_BY IS 'Uživatel, který vytvoril záznam.';
COMMENT ON COLUMN PEV_T_PROJECTS.id IS 'PK - ID Identifikátor';
COMMENT ON COLUMN PEV_T_PROJECTS.name IS 'Jmeno projektu';
COMMENT ON COLUMN PEV_T_PROJECTS.project_state IS 'FK -state';
COMMENT ON COLUMN PEV_T_PROJECTS.identification IS ' FK - identification';
COMMENT ON COLUMN PEV_T_PROJECTS.project_status IS 'FK - Project status';
COMMENT ON COLUMN PEV_T_PROJECTS.kakadu_number IS 'kakadu číslo';
COMMENT ON COLUMN PEV_T_PROJECTS.bdc_ops IS 'bdc_ops specifikace';
COMMENT ON COLUMN PEV_T_PROJECTS.bdc_number IS 'bdc_number specifikace';
COMMENT ON COLUMN PEV_T_PROJECTS.department IS 'ID_Lekarny - select list 900-999';
COMMENT ON COLUMN PEV_T_PROJECTS.is_deleted IS 'Příznak smazání záznamu (1 - smazán)';
COMMENT ON COLUMN PEV_T_PROJECTS.project_manager IS 'FK - peoples';
COMMENT ON COLUMN PEV_T_PROJECTS.business_owner IS 'FK - peoples';
COMMENT ON COLUMN PEV_T_PROJECTS.it_owner IS 'FK - peoples';
COMMENT ON COLUMN PEV_T_PROJECTS.start_date_expect IS 'Očekavaný start';
COMMENT ON COLUMN PEV_T_PROJECTS.start_date_real IS 'Reální start';
COMMENT ON COLUMN PEV_T_PROJECTS.end_date_exp IS 'Očekavaný konec';
COMMENT ON COLUMN PEV_T_PROJECTS.end_date_real IS 'Reální konec';
COMMENT ON COLUMN PEV_T_PROJECTS.forecast IS 'Odhad';
COMMENT ON COLUMN PEV_T_PROJECTS.forecast_approve_date IS 'Odhadovaný čas';
COMMENT ON COLUMN PEV_T_PROJECTS.project_description IS 'Popis';
COMMENT ON COLUMN PEV_T_PROJECTS.descr_scope IS 'Popis oblasti';
COMMENT ON COLUMN PEV_T_PROJECTS.layout IS 'Navrh 1/0';
COMMENT ON COLUMN PEV_T_PROJECTS.layout_url IS 'Navrh url';
COMMENT ON COLUMN PEV_T_PROJECTS.BUDGET_APPROVE_DATE IS 'Odhadovaný čas';
COMMENT ON COLUMN PEV_T_PROJECTS.budget_approve IS 'Osaba ktora schvalila budget';
COMMENT ON COLUMN PEV_T_PROJECTS.forecast_approve IS 'Osaba ktora schvalila forecast';
/
