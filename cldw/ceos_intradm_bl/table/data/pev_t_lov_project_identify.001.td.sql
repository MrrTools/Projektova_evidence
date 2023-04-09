DECLARE
  PROCEDURE insert_pev_t_lov_project_identify (	p_id integer,
												p_name VARCHAR2,
												p_is_deleted integer )                                                  
  IS
  l_count NUMBER := 0;
  BEGIN
    SELECT COUNT(*) 
    INTO l_count 
	FROM pev_t_lov_project_identify where id = p_id;
    
    IF l_count = 0 THEN
      INSERT INTO pev_t_lov_project_identify (	id,
												name,
												is_deleted
                                   )
      VALUES 								(	p_id ,
												p_name ,
												p_is_deleted  );
    
    ELSIF l_count > 0 THEN
      UPDATE pev_t_lov_project_identify
      SET id = p_id,
		  name = p_name,
          is_deleted = p_is_deleted
		  WHERE id = p_ID;
    END IF;
    
  END insert_pev_t_lov_project_identify;

BEGIN
  insert_pev_t_lov_project_identify(1,'Projekt',0);
  insert_pev_t_lov_project_identify(2,'Cont. devel',0);
END;
/
