-- FUNCTION: public.get_patient_by_id(character varying)

-- DROP FUNCTION IF EXISTS public.get_patient_by_id(character varying);

CREATE OR REPLACE FUNCTION public.get_patient_by_id(
	p_id character varying)
    RETURNS TABLE(id character varying, name character varying, email character varying, password character varying, cpf character varying, datebirth character varying, cep character varying, street character varying, neighborhood character varying, city character varying, state character varying, number character varying, phone character varying, phonespare character varying, allergies text, notes text, transcript text, user_type character varying) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT 
        p.id, 
        p.name, 
        p.email, 
        p.password, 
        p.cpf, 
        p.datebirth, 
        p.cep, 
        p.street, 
        p.neighborhood, 
        p.city, 
        p.state, 
        p.number, 
        p.phone, 
        p.phonespare, 
        p.allergies, 
        p.notes, 
        p.transcript, 
        p.user_type
    FROM patients p
    WHERE p.id = p_id;
END;
$BODY$;

ALTER FUNCTION public.get_patient_by_id(character varying)
    OWNER TO postgres;
