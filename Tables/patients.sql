-- Table: public.patients

-- DROP TABLE IF EXISTS public.patients;

CREATE TABLE IF NOT EXISTS public.patients
(
    id character varying(5) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    cpf character varying(11) COLLATE pg_catalog."default" NOT NULL,
    datebirth character varying(10) COLLATE pg_catalog."default" NOT NULL,
    cep character varying(9) COLLATE pg_catalog."default" NOT NULL,
    street character varying(255) COLLATE pg_catalog."default" NOT NULL,
    neighborhood character varying(255) COLLATE pg_catalog."default" NOT NULL,
    city character varying(255) COLLATE pg_catalog."default" NOT NULL,
    state character varying(2) COLLATE pg_catalog."default" NOT NULL,
    "number" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(11) COLLATE pg_catalog."default" NOT NULL,
    phonespare character varying(11) COLLATE pg_catalog."default",
    allergies text COLLATE pg_catalog."default",
    notes text COLLATE pg_catalog."default",
    transcript text COLLATE pg_catalog."default",
    user_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT patients_pkey PRIMARY KEY (id),
    CONSTRAINT patients_cpf_key UNIQUE (cpf),
    CONSTRAINT patients_email_key UNIQUE (email),
    CONSTRAINT patients_phone_key UNIQUE (phone),
    CONSTRAINT patients_phonespare_key UNIQUE (phonespare)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.patients
    OWNER to postgres;