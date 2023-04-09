BEGIN
  ceosapps.ddl_api.drop_synonym('PRODEJE_AGG_NADZASOBY');
END;
/
--%carp-begin
-- create or replace synonym PRODEJE_AGG_NADZASOBY for CEOS_INTRADM.PRODEJE_AGG_NADZASOBY_WRAP
-- /

--%carp-end
