-- FUNCTION: public.get_schedule_by_doctor_id(character varying)

-- DROP FUNCTION IF EXISTS public.get_schedule_by_doctor_id(character varying);

CREATE OR REPLACE FUNCTION public.get_schedule_by_doctor_id(
	p_doctor_id character varying)
    RETURNS TABLE(id character varying, doctor_id character varying, date date, start_time time without time zone, end_time time without time zone, status character varying, created_at timestamp without time zone, updated_at timestamp without time zone) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT 
        s.id::character varying, 
        s.doctor_id::character varying, 
        s.date, 
        s.start_time, 
        s.end_time, 
        s.status::character varying, 
        s.created_at, 
        s.updated_at
    FROM 
        schedules s
    WHERE 
        s.doctor_id = p_doctor_id;
END;
$BODY$;

ALTER FUNCTION public.get_schedule_by_doctor_id(character varying)
    OWNER TO postgres;
