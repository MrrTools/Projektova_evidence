BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE PEV_S_CHANGES_RECORD';
  EXCEPTION WHEN others THEN
    null;
END;
/
CREATE SEQUENCE  PEV_S_CHANGES_RECORD  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE;
