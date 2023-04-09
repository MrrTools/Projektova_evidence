create or replace PACKAGE BODY PEV_K_MAIN_CLDW_WRAP AS

procedure upd_projects_budget_forecast IS
  BEGIN
    PEV_K_MAIN.upd_projects_budget_forecast;
  END;

END;
/
show errors


--%carp-end
