create or replace PACKAGE PEV_K_MAIN_CLDW_WRAP
/**
*Projektova evidence.
* <p>
* Sluzi k evidencii projektov.
*
* @version 2021-02-22 VHOMOLA  RM #44481: vytvoreni baliku
* @headcom
*/
AS

-----------------------------------------------------------------------

/**
  * Procedura merguje adw jedox do pev_t_projects
  *
  * @version 2021-02-22 VHOMOLA   Created
  */

procedure upd_projects_budget_forecast;

END;
/
show errors


--%carp-end
