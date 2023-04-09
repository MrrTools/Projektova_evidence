--%carp-begin
create or replace force view PEV_T_FILES_API as
select "ID", "PROJECT_ID", "FILE_NAME", "FILE_MIME_TYPE", "FILE_SIZE", "FILE_CONTENT", "CREATED_DATE", "CREATED_BY",
    "UPDATED_DATE","UPDATED_BY"
 from PEV_T_FILES
/
show errors


COMMENT ON TABLE PEV_T_FILES_API IS 'Tabulka pro ukládání souborů.'
/

COMMENT ON COLUMN PEV_T_FILES_API.ID IS 'id'
/

COMMENT ON COLUMN PEV_T_FILES_API.PROJECT_ID IS 'ID projektu'
/

COMMENT ON COLUMN PEV_T_FILES_API.FILE_NAME IS 'Název souboru'
/

COMMENT ON COLUMN PEV_T_FILES_API.FILE_MIME_TYPE IS 'MIME typ'
/

COMMENT ON COLUMN PEV_T_FILES_API.FILE_SIZE IS 'Velkost v bitech'
/

COMMENT ON COLUMN PEV_T_FILES_API.FILE_CONTENT IS 'Obsah souboru'
/

COMMENT ON COLUMN PEV_T_FILES_API.CREATED_DATE IS 'datum vytvoření'
/

COMMENT ON COLUMN PEV_T_FILES_API.CREATED_BY IS 'Uživatel, který vytvoril záznam.'
/

COMMENT ON COLUMN PEV_T_FILES_API.UPDATED_DATE IS 'datum ulozeni'
/

COMMENT ON COLUMN PEV_T_FILES_API.UPDATED_BY IS 'Uživatel, který uložil záznam.'
/

--%carp-end