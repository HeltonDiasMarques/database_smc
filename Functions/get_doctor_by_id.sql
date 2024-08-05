-- FUNCTION: public.get_doctor_by_id(character varying)

-- DROP FUNCTION IF EXISTS public.get_doctor_by_id(character varying);

CREATE OR REPLACE FUNCTION public.get_doctor_by_id(
	p_id character varying)
    RETURNS TABLE(id character varying, name character varying, email character varying, password character varying, cpf character varying, datebirth character varying, cep character varying, street character varying, neighborhood character varying, city character varying, state character varying, number character varying, phone character varying, crm character varying, specialty character varying, user_type character varying) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT 
        d.id, 
        d.name, 
        d.email, 
        d.password, 
        d.cpf, 
        d.datebirth, 
        d.cep, 
        d.street, 
        d.neighborhood, 
        d.city, 
        d.state, 
        d.number, 
        d.phone, 
        d.crm, 
        d.specialty, 
        d.user_type
    FROM doctors d
    WHERE d.id = p_id;
END;
$BODY$;

ALTER FUNCTION public.get_doctor_by_id(character varying)
    OWNER TO postgres;
