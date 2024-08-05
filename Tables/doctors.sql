-- Table: public.doctors

-- DROP TABLE IF EXISTS public.doctors;

CREATE TABLE IF NOT EXISTS public.doctors
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
    crm character varying(20) COLLATE pg_catalog."default" NOT NULL,
    specialty character varying(255) COLLATE pg_catalog."default" NOT NULL,
    user_type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT doctors_pkey PRIMARY KEY (id),
    CONSTRAINT doctors_cpf_key UNIQUE (cpf),
    CONSTRAINT doctors_email_key UNIQUE (email),
    CONSTRAINT doctors_phone_key UNIQUE (phone)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.doctors
    OWNER to postgres;