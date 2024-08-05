-- FUNCTION: public.book_consultation(character varying, character varying, date, time without time zone, time without time zone)

-- DROP FUNCTION IF EXISTS public.book_consultation(character varying, character varying, date, time without time zone, time without time zone);

CREATE OR REPLACE FUNCTION public.book_consultation(
	p_patient_id character varying,
	p_doctor_id character varying,
	p_date date,
	p_start_time time without time zone,
	p_end_time time without time zone)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
    -- Verificar se o doctor_id existe
    IF NOT EXISTS (SELECT 1 FROM doctors WHERE id = p_doctor_id) THEN
        RAISE EXCEPTION 'Doctor ID % não encontrado', p_doctor_id;
    END IF;

    -- Verificar se o patient_id existe
    IF NOT EXISTS (SELECT 1 FROM patients WHERE id = p_patient_id) THEN
        RAISE EXCEPTION 'Patient ID % não encontrado', p_patient_id;
    END IF;

    -- Verificar se há um agendamento disponível
    IF NOT EXISTS (
        SELECT 1 FROM schedules
        WHERE doctor_id = p_doctor_id
          AND date = p_date
          AND start_time = p_start_time
          AND end_time = p_end_time
          AND status = 'AVAILABLE'
    ) THEN
        RAISE EXCEPTION 'No available schedule found for the given time';
    END IF;

    -- Tente atualizar o agendamento
    UPDATE schedules
    SET status = 'OCCUPIED',
        updated_at = now(),
        patient_id = p_patient_id
    WHERE doctor_id = p_doctor_id
      AND date = p_date
      AND start_time = p_start_time
      AND end_time = p_end_time
      AND status = 'AVAILABLE';

    -- Verifique se a atualização encontrou uma linha
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No available schedule found for the given time';
    END IF;
END;
$BODY$;

ALTER FUNCTION public.book_consultation(character varying, character varying, date, time without time zone, time without time zone)
    OWNER TO postgres;
