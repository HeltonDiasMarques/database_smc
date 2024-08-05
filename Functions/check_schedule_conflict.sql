-- FUNCTION: public.check_schedule_conflict(character varying, date, time without time zone, time without time zone)

-- DROP FUNCTION IF EXISTS public.check_schedule_conflict(character varying, date, time without time zone, time without time zone);

CREATE OR REPLACE FUNCTION public.check_schedule_conflict(
	p_doctor_id character varying,
	p_date date,
	p_start_time time without time zone,
	p_end_time time without time zone)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
    RETURN EXISTS (
        SELECT 1
        FROM schedules
        WHERE doctor_id = p_doctor_id
        AND date = p_date
        AND (
            (start_time <= p_start_time AND end_time > p_start_time) OR
            (start_time < p_end_time AND end_time >= p_end_time) OR
            (start_time >= p_start_time AND end_time <= p_end_time)
        )
    );
END;
$BODY$;

ALTER FUNCTION public.check_schedule_conflict(character varying, date, time without time zone, time without time zone)
    OWNER TO postgres;
