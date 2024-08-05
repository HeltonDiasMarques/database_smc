-- FUNCTION: public.cancel_and_register_consultation(character varying, time without time zone)

-- DROP FUNCTION IF EXISTS public.cancel_and_register_consultation(character varying, time without time zone);

CREATE OR REPLACE FUNCTION public.cancel_and_register_consultation(
	p_patient_id character varying,
	p_start_time time without time zone)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    v_doctor_id character varying;
    v_date date;
    v_end_time time without time zone;
BEGIN
    -- Atualiza o status da consulta para AVAILABLE e limpa o patient_id
    UPDATE schedules
    SET status = 'AVAILABLE',
        patient_id = NULL,
        updated_at = NOW() -- Atualiza a data de modificação
    WHERE patient_id = p_patient_id AND start_time = p_start_time
    RETURNING doctor_id, date, end_time
    INTO v_doctor_id, v_date, v_end_time;

    -- Verifica se a consulta foi realmente atualizada antes de registrar o cancelamento
    IF FOUND THEN
        -- Registrar o cancelamento
        INSERT INTO cancellations (patient_id, doctor_id, date, start_time, end_time, cancelled_at)
        VALUES (p_patient_id, v_doctor_id, v_date, p_start_time, v_end_time, NOW());
    ELSE
        RAISE EXCEPTION 'No appointment found for patient % at time %', p_patient_id, p_start_time;
    END IF;
END;
$BODY$;

ALTER FUNCTION public.cancel_and_register_consultation(character varying, time without time zone)
    OWNER TO postgres;
