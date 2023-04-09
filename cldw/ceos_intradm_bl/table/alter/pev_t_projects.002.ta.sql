COMMENT ON COLUMN PEV_T_PROJECTS.UPDATED_DATE IS 'Datum uložení';
COMMENT ON COLUMN PEV_T_PROJECTS.UPDATED_BY IS 'Uživatel, který uložil záznam';
COMMENT ON COLUMN PEV_T_PROJECTS.CREATED_DATE IS 'Datum vytvoření';
COMMENT ON COLUMN PEV_T_PROJECTS.CREATED_BY IS 'Uživatel, který vytvořil záznam';
COMMENT ON COLUMN PEV_T_PROJECTS.name IS 'Jméno projektu';
COMMENT ON COLUMN PEV_T_PROJECTS.budget IS 'Rozpočet';
COMMENT ON COLUMN PEV_T_PROJECTS.project_state IS 'FK PEV_T_LOV_PROJECT_STATE(ID) - Project_state';
COMMENT ON COLUMN PEV_T_PROJECTS.identification IS 'FK - PEV_T_LOV_PROJECT_IDENTIFY(ID)- Identification';
COMMENT ON COLUMN PEV_T_PROJECTS.project_status IS 'FK - PEV_T_LOV_PROJECT_STATUS(ID) -Project status';
COMMENT ON COLUMN PEV_T_PROJECTS.kakadu_number IS 'Kakadu číslo';
COMMENT ON COLUMN PEV_T_PROJECTS.bdc_ops IS 'Bdc_ops specifikace';
COMMENT ON COLUMN PEV_T_PROJECTS.bdc_number IS 'Bdc_number specifikace';
COMMENT ON COLUMN PEV_T_PROJECTS.department IS 'ID_Lekarny - select list 900-999';
COMMENT ON COLUMN PEV_T_PROJECTS.is_deleted IS 'Příznak smazání záznamu (1 - smazán)';
COMMENT ON COLUMN PEV_T_PROJECTS.project_manager IS 'LFK - PEV_T_PEOPLE(ID)';
COMMENT ON COLUMN PEV_T_PROJECTS.business_owner IS 'LFK - PEV_T_PEOPLE(ID)';
COMMENT ON COLUMN PEV_T_PROJECTS.it_owner IS 'LFK - PEV_T_PEOPLE(ID)';
COMMENT ON COLUMN PEV_T_PROJECTS.forecast IS 'Odhad';
COMMENT ON COLUMN PEV_T_PROJECTS.forecast_approve_date IS 'Odhadovaný datum';
COMMENT ON COLUMN PEV_T_PROJECTS.project_description IS 'Popis';
COMMENT ON COLUMN PEV_T_PROJECTS.descr_scope IS 'Popis oblasti';
COMMENT ON COLUMN PEV_T_PROJECTS.layout IS 'Návrh 1/0';
COMMENT ON COLUMN PEV_T_PROJECTS.layout_url IS 'Návrh url';
COMMENT ON COLUMN PEV_T_PROJECTS.BUDGET_APPROVE_DATE IS 'Odhadovaný čas';
COMMENT ON COLUMN PEV_T_PROJECTS.budget_approve IS 'Osoba která schvalila budget';
COMMENT ON COLUMN PEV_T_PROJECTS.forecast_approve IS 'Osoba která schvalila forecast';





