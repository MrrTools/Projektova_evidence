BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PEV_T_PEOPLES CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/
CREATE TABLE PEV_T_PEOPLES (
id                  integer,
name                VARCHAR2(30 CHAR),
surname             VARCHAR2(30 CHAR),
position            integer, 
email               VARCHAR2(50 CHAR),
phone_number        VARCHAR2(30 CHAR),
developer           integer,  
note                VARCHAR2(200 CHAR),
email_notification  integer default 0,  
is_deleted          integer default 0, 
CREATED_DATE        DATE,
CREATED_BY          VARCHAR2(30 CHAR),
UPDATED_DATE        DATE,
UPDATED_BY          VARCHAR2(30 CHAR),
CONSTRAINT FK_PEOPLE_POSITION
    FOREIGN KEY (id)
    REFERENCES PEV_T_LOV_PEOPLE_POSITION(id),
/*CONSTRAINT FK_DEVELOPER
    FOREIGN KEY (developer)
    REFERENCES UCETNI_PARTNERI(partner_id),*/
CONSTRAINT PK_PEOPLES PRIMARY KEY (id)
);
COMMENT ON TABLE PEV_T_PEOPLES IS 'Tabulka lidí. S defionovanou position interní, s developer partnerští.';
COMMENT ON COLUMN PEV_T_PEOPLES.UPDATED_DATE IS 'datum ulozeni';
COMMENT ON COLUMN PEV_T_PEOPLES.UPDATED_BY IS 'Uživatel, který uložil záznam.';
COMMENT ON COLUMN PEV_T_PEOPLES.CREATED_DATE IS 'datum vytvoření';
COMMENT ON COLUMN PEV_T_PEOPLES.CREATED_BY IS 'Uživatel, který vytvoril záznam.';
COMMENT ON COLUMN PEV_T_PEOPLES.id IS 'PK - ID Identifikátor';
COMMENT ON COLUMN PEV_T_PEOPLES.name IS 'Jmeno';
COMMENT ON COLUMN PEV_T_PEOPLES.surname IS 'Příjmení';
COMMENT ON COLUMN PEV_T_PEOPLES.position IS ' FK - Pozice';
COMMENT ON COLUMN PEV_T_PEOPLES.email IS 'Email';
COMMENT ON COLUMN PEV_T_PEOPLES.phone_number IS 'tel. číslo';
COMMENT ON COLUMN PEV_T_PEOPLES.developer IS 'FK - UCETNI_PARTNERI(PARTNER_ID) - Developer';
COMMENT ON COLUMN PEV_T_PEOPLES.note IS 'Poznámka';
COMMENT ON COLUMN PEV_T_PEOPLES.email_notification IS 'Příznak notifikace 1/0';
COMMENT ON COLUMN PEV_T_PEOPLES.is_deleted IS 'Příznak smazání záznamu (1 - smazán)';
/


