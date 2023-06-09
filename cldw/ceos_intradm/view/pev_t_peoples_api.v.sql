--%carp-begin
create or replace force view PEV_T_PEOPLES_API as
select "ID", "NAME", "SURNAME", "POSITION", "EMAIL", "PHONE_NUMBER", "DEVELOPER", "NOTE", "EMAIL_NOTIFICATION",
    "IS_DELETED","CREATED_DATE", "CREATED_BY", "UPDATED_DATE", "UPDATED_BY"
 from PEV_T_PEOPLES
/
show errors


COMMENT ON TABLE PEV_T_PEOPLES_API IS 'Tabulka lidí. S defionovanou position interní, s developer partnerští.'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.ID IS 'PK - ID Identifikátor'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.NAME IS 'Jmeno'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.SURNAME IS 'Příjmení'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.POSITION IS ' FK - Pozice'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.EMAIL IS 'Email'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.PHONE_NUMBER IS 'tel. číslo'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.DEVELOPER IS 'FK - UCETNI_PARTNERI(PARTNER_ID) - Developer'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.NOTE IS 'Poznámka'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.EMAIL_NOTIFICATION IS 'Příznak notifikace 1/0'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.IS_DELETED IS 'Příznak smazání záznamu (1 - smazán)'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.CREATED_DATE IS 'datum vytvoření'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.CREATED_BY IS 'Uživatel, který vytvoril záznam.'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.UPDATED_DATE IS 'datum ulozeni'
/

COMMENT ON COLUMN PEV_T_PEOPLES_API.UPDATED_BY IS 'Uživatel, který uložil záznam.'
/

--%carp-end
