DECLARE
  PROCEDURE insert_pev_t_lov_people_position (	p_id integer,
												p_name VARCHAR2,
												p_is_deleted integer )                                                  
  IS
  l_count NUMBER := 0;
  BEGIN
    SELECT COUNT(*) 
    INTO l_count 
	FROM pev_t_lov_people_position where id = p_id;

    
   IF l_count = 0  THEN
      INSERT INTO pev_t_lov_people_position (	id,
												name,
												is_deleted
                                   )
      VALUES 								(	p_id ,
												p_name ,
												p_is_deleted  );
    
    ELSIF l_count > 0 THEN
      UPDATE pev_t_lov_people_position
      SET 
		  name = p_name,
          is_deleted = p_is_deleted
		  where id = p_id;
   END IF;
    
  END insert_pev_t_lov_people_position;

BEGIN
  insert_pev_t_lov_people_position(1,'Bussiness owner',0);
  insert_pev_t_lov_people_position(2,'Project manager',0);
  insert_pev_t_lov_people_position(3,' IT Owner ',0);
END;
/
