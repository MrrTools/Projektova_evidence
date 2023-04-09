BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PEV_T_PROJECT_LOGBOOK CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/
CREATE TABLE PEV_T_PROJECT_LOGBOOK(
record_id  			     INTEGER  PRIMARY KEY NOT NULL ,
project_id 			     INTEGER NOT NULL,
record_date              DATE  DEFAULT sysdate NOT NULL,
text                     VARCHAR2(2000 CHAR),
is_deleted               NUMBER(1) DEFAULT 0 NOT NULL,
created_date             DATE DEFAULT sysdate NOT NULL ,
created_by               VARCHAR2(50 CHAR),
updated_date             DATE ,
updated_by               VARCHAR2(50 CHAR) ,
CONSTRAINT FK_PROJECT_ID_JOURNAL FOREIGN KEY (project_id) REFERENCES PEV_T_PROJECTS(id)
);


CREATE INDEX project_id_journal ON PEV_T_PROJECT_LOGBOOK(project_id);

COMMENT ON TABLE PEV_T_PROJECT_LOGBOOK IS 'Journal table.';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.record_id IS 'Primary key id';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.UPDATED_DATE IS 'date of last change';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.UPDATED_BY IS 'autor of last change';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.CREATED_DATE IS 'date of creating record';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.CREATED_BY IS 'autor of creating record';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.IS_DELETED IS 'deleted flag: 0 - valid, 1 - deleted';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.TEXT IS 'text message';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.RECORD_DATE IS 'date of record';
COMMENT ON COLUMN PEV_T_PROJECT_LOGBOOK.PROJECT_ID IS 'ID project foreign key';
/
