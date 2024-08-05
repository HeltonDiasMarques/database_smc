-- FUNCTION: public.update_doctor(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION IF EXISTS public.update_doctor(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.update_doctor(
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
    UPDATE doctors
    SET name = p_name,
        email = p_email,
        password = p_password,
        cpf = p_cpf,
        datebirth = p_datebirth,
        cep = p_cep,
        street = p_street,
        neighborhood = p_neighborhood,
        city = p_city,
        state = p_state,
        number = p_number,
        phone = p_phone,
        crm = p_crm,
        specialty = p_specialty,
        user_type = p_user_type
    WHERE id = p_id;
END;
$BODY$;

ALTER FUNCTION public.update_doctor(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)
    OWNER TO postgres;
