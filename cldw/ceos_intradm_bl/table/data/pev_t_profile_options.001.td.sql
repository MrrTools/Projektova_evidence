DECLARE
    PROCEDURE update_PROFILE_OPTIONS(
        p_id                NUMBER,
        p_code				VARCHAR2,
		p_value				VARCHAR2

    )IS
        l_count NUMBER := 0;

BEGIN
    SELECT COUNT(*)
    INTO l_count
    FROM PEV_T_PROFILE_OPTIONS
    WHERE code = p_code AND
          id = p_id
		  ;

    IF l_count = 0 THEN
        INSERT INTO PEV_T_PROFILE_OPTIONS
        (
          id,
          code,
          value
        )VALUES(
          p_id,
          p_code,
          p_value
        );

    ELSIF l_count > 0 THEN
        UPDATE PEV_T_PROFILE_OPTIONS
        SET value = p_value
        WHERE id = p_id;
  END IF;

END update_PROFILE_OPTIONS;

BEGIN
  update_PROFILE_OPTIONS ( p_id			=> 1,
						   p_code			=> 'EMAIL_KAKADU',
						   p_value			=> 'zuzana.soukopova@drmax.cz'
						  );

  update_PROFILE_OPTIONS ( p_id			=> 2,
						   p_code			=> 'EMAIL_KAKADU_CC',
						   p_value			=> 'renata.svarcova@drmax.cz,simona.vaxmonska@drmax.cz,marek.tichy@drmax.cz,veronika.lzicarova@drmax.cz'
						  );

update_PROFILE_OPTIONS ( p_id			=> 3,
						   p_code			=> 'EMAIL_KAKADU_SUBJECT',
						   p_value			=> 'Vznik nové zakázky %KAKADU'
						  );
update_PROFILE_OPTIONS ( p_id			=> 4,
						   p_code			=> 'EMAIL_INACTIVE',
						   p_value			=> 'zuzana.soukopova@drmax.cz'
						  );

  update_PROFILE_OPTIONS ( p_id			=> 5,
						   p_code			=> 'EMAIL_INACTIVE_CC',
						   p_value			=> 'renata.svarcova@drmax.cz,simona.vaxmonska@drmax.cz,marek.tichy@drmax.cz,veronika.lzicarova@drmax.cz'
						  );
  update_PROFILE_OPTIONS ( p_id			=> 6,
						   p_code			=> 'EMAIL_INACTIVE_SUBJECT',
						   p_value			=> 'Ukončení zakázky projektu %KAKADU'
						  );

  update_PROFILE_OPTIONS ( p_id			=> 7,
						   p_code			=> 'EMAIL_SENDER',
						   p_value			=> 'projekty@drmax.cz'
						  );


END;
/
