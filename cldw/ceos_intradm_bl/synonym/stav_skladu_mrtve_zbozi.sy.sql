BEGIN
  ceosapps.ddl_api.drop_synonym('STAV_SKLADU_MRTVE_ZBOZI');
END;
/
--%carp-begin
-- create or replace synonym STAV_SKLADU_MRTVE_ZBOZI for CEOS_INTRADM.STAV_SKLADU_MRTVE_ZBOZI_WRAP
-- /

--%carp-end
