-- Table: public.cancellations

-- DROP TABLE IF EXISTS public.cancellations;

CREATE TABLE IF NOT EXISTS public.cancellations
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    patient_id character varying COLLATE pg_catalog."default" NOT NULL,
    doctor_id character varying COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    cancelled_at timestamp without time zone DEFAULT now(),
    CONSTRAINT cancellations_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cancellations
    OWNER to postgres;