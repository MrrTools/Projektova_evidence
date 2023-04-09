BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PEV_T_FILES CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/
CREATE TABLE PEV_T_FILES (
id integer,
PROJECT_ID INTEGER NOT NULL ENABLE NOVALIDATE,
FILE_NAME VARCHAR2(250 CHAR) NOT NULL ENABLE NOVALIDATE,
FILE_MIME_TYPE VARCHAR2(250 CHAR) NOT NULL ENABLE NOVALIDATE,
FILE_SIZE NUMBER NOT NULL ENABLE NOVALIDATE,
FILE_CONTENT BLOB NOT NULL ENABLE NOVALIDATE,
CREATED_DATE DATE,
CREATED_BY VARCHAR2(30 CHAR),
UPDATED_DATE DATE,
UPDATED_BY VARCHAR2(30 CHAR),
CONSTRAINT FK_PROJECT_FILES
    FOREIGN KEY (project_id)
    REFERENCES PEV_T_PROJECTS(id)
);
COMMENT ON TABLE PEV_T_FILES IS 'Tabulka pro ukládání souborů.';
COMMENT ON COLUMN PEV_T_FILES.id IS 'id';
COMMENT ON COLUMN PEV_T_FILES.UPDATED_DATE IS 'datum ulozeni';
COMMENT ON COLUMN PEV_T_FILES.UPDATED_BY IS 'Uživatel, který uložil záznam.';
COMMENT ON COLUMN PEV_T_FILES.CREATED_DATE IS 'datum vytvoření';
COMMENT ON COLUMN PEV_T_FILES.CREATED_BY IS 'Uživatel, který vytvoril záznam.';
COMMENT ON COLUMN PEV_T_FILES.FILE_NAME IS 'Název souboru';
COMMENT ON COLUMN PEV_T_FILES.FILE_MIME_TYPE IS 'MIME typ';
COMMENT ON COLUMN PEV_T_FILES.FILE_SIZE IS 'Velkost v bitech';
COMMENT ON COLUMN PEV_T_FILES.FILE_CONTENT IS 'Obsah souboru';
COMMENT ON COLUMN PEV_T_FILES.PROJECT_ID IS 'ID projektu';
/
