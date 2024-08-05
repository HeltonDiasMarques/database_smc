-- FUNCTION: public.save_schedule(character varying, date, time without time zone, time without time zone)

-- DROP FUNCTION IF EXISTS public.save_schedule(character varying, date, time without time zone, time without time zone);

CREATE OR REPLACE FUNCTION public.save_schedule(
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
    INSERT INTO schedules (id, doctor_id, date, start_time, end_time, status, created_at, updated_at)
    VALUES (uuid_generate_v4(), p_doctor_id, p_date, p_start_time, p_end_time, 'AVAILABLE', now(), now());
END;
$BODY$;

ALTER FUNCTION public.save_schedule(character varying, date, time without time zone, time without time zone)
    OWNER TO postgres;
