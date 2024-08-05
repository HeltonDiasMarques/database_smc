-- FUNCTION: public.update_patient(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, text, text, character varying)

-- DROP FUNCTION IF EXISTS public.update_patient(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, text, text, character varying);

CREATE OR REPLACE FUNCTION public.update_patient(
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
	p_phonespare character varying,
	p_allergies text,
	p_notes text,
	p_transcript text,
	p_user_type character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
    UPDATE patients
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
        phonespare = p_phonespare,
        allergies = p_allergies,
        notes = p_notes,
        transcript = p_transcript,
        user_type = p_user_type
    WHERE id = p_id;
END;
$BODY$;

ALTER FUNCTION public.update_patient(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, text, text, character varying)
    OWNER TO postgres;
