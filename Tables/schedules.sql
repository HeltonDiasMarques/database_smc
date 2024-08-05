-- Table: public.schedules

-- DROP TABLE IF EXISTS public.schedules;

CREATE TABLE IF NOT EXISTS public.schedules
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    doctor_id character varying COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    status character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    patient_id character varying COLLATE pg_catalog."default",
    CONSTRAINT schedules_pkey PRIMARY KEY (id),
    CONSTRAINT unique_schedule UNIQUE (doctor_id, date, start_time, end_time),
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id)
        REFERENCES public.doctors (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.schedules
    OWNER to postgres;