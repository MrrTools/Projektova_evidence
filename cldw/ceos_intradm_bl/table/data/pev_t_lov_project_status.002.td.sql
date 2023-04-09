DECLARE
  PROCEDURE insert_pev_t_lov_project_status (	p_id integer,
												p_status_name VARCHAR2,
												P_status_type char,
												p_is_deleted integer )                                                  
  IS
  l_count NUMBER := 0;
  BEGIN
    SELECT COUNT(*) 
    INTO l_count 
	FROM pev_t_lov_project_status
  where id = p_id;
    
    IF l_count = 0 THEN
      INSERT INTO pev_t_lov_project_status (	id,
												status_name,
												status_type,
												is_deleted
                                   )
      VALUES 								(	p_id ,
												p_status_name ,
												P_status_type ,
												p_is_deleted  );
    
    ELSIF l_count > 0 THEN
      UPDATE pev_t_lov_project_status
      SET 
		  status_name = p_status_name,
          status_type = P_status_type,
          is_deleted = p_is_deleted
		  where id = p_id;
    END IF;
    
  END insert_pev_t_lov_project_status;

BEGIN
  insert_pev_t_lov_project_status(1,'Ideový záměr', null, 1);
  insert_pev_t_lov_project_status(2,'1 - HL Solution', null, 0);
  insert_pev_t_lov_project_status(3,'3 - New', null, 0);
  insert_pev_t_lov_project_status(4,'2 - Approved', null, 0);
  insert_pev_t_lov_project_status(5,'Close', null, 1);
  insert_pev_t_lov_project_status(6,'9 - Waiting', null, 0);
  insert_pev_t_lov_project_status(7,'4 - Analysis', null, 0);
  insert_pev_t_lov_project_status(8,'5 - In progress', null, 0);
  insert_pev_t_lov_project_status(9,'6 - UAT', null, 0);
  insert_pev_t_lov_project_status(10,'7 - Resolved', null, 0);
  insert_pev_t_lov_project_status(11,'8 - Done', null, 0);
  insert_pev_t_lov_project_status(12,'Idea phase','P', 0);
  insert_pev_t_lov_project_status(13,'Initiation phase','P', 0);
  insert_pev_t_lov_project_status(14,'Planning phase','P', 0);
  insert_pev_t_lov_project_status(15,'Executing phase','P', 0);
  insert_pev_t_lov_project_status(16,'Closed phase','P', 0);
  commit;
END;
/
