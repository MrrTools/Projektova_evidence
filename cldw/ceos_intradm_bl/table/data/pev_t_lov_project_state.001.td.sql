DECLARE
  PROCEDURE insert_pev_t_lov_project_state (	p_id integer,
												p_state_name VARCHAR2,
												p_is_deleted integer )                                                  
  IS
  l_count NUMBER := 0;
  BEGIN
    SELECT COUNT(*) 
    INTO l_count 
	FROM pev_t_lov_project_state    where id = p_id;
    
    IF l_count = 0  THEN
      INSERT INTO pev_t_lov_project_state (	id,
												state_name,
												is_deleted
                                   )
      VALUES 								(	p_id ,
												p_state_name ,
												p_is_deleted  );
    
    ELSIF l_count > 0 THEN
      UPDATE pev_t_lov_project_state
      SET 
		  state_name = p_state_name,
          is_deleted = p_is_deleted
          where  id = p_id;
    END IF;
    
  END insert_pev_t_lov_project_state;

BEGIN
  insert_pev_t_lov_project_state(1,'Aktivní',0);
  insert_pev_t_lov_project_state(2,'Neaktivní',0);
END;
/
