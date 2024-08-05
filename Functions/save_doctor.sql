-- FUNCTION: public.save_doctor(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION IF EXISTS public.save_doctor(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.save_doctor(
	p_id character varying,
	p_name character varying,
	p_email character varying,
	p_password character varying,
	p_cpf character varying,
	p_datebirth character varying,
	p_cep character varying,
	p_street character varying,
	p_neighborhood character varying,
	p_city character varying,
	p_state character varying,
	p_number character varying,
	p_phone character varying,
	p_crm character varying,
	p_specialty character varying,
	p_user_type character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
    INSERT INTO doctors (id, name, email, password, cpf, datebirth, cep, street, neighborhood, city, state, number, phone, crm, specialty, user_type)
    VALUES (p_id, p_name, p_email, p_password, p_cpf, p_datebirth, p_cep, p_street, p_neighborhood, p_city, p_state, p_number, p_phone, p_crm, p_specialty, p_user_type);
END;
$BODY$;

ALTER FUNCTION public.save_doctor(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
    OWNER TO postgres;
