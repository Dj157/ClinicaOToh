--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: authdb; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA authdb;


ALTER SCHEMA authdb OWNER TO postgres;

--
-- Name: consultasdb; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA consultasdb;


ALTER SCHEMA consultasdb OWNER TO postgres;

--
-- Name: pacientesdb; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pacientesdb;


ALTER SCHEMA pacientesdb OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: usuarios; Type: TABLE; Schema: authdb; Owner: postgres
--

CREATE TABLE authdb.usuarios (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    usuario character varying(50) NOT NULL,
    senha character varying(255) NOT NULL,
    papel character varying(20) DEFAULT 'admin'::character varying NOT NULL
);


ALTER TABLE authdb.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: authdb; Owner: postgres
--

CREATE SEQUENCE authdb.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE authdb.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: authdb; Owner: postgres
--

ALTER SEQUENCE authdb.usuarios_id_seq OWNED BY authdb.usuarios.id;


--
-- Name: consultas; Type: TABLE; Schema: consultasdb; Owner: postgres
--

CREATE TABLE consultasdb.consultas (
    id integer NOT NULL,
    paciente_id integer NOT NULL,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    medico_id integer NOT NULL,
    especialidade character varying(50) NOT NULL,
    historico_exame bytea
);


ALTER TABLE consultasdb.consultas OWNER TO postgres;

--
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: consultasdb; Owner: postgres
--

CREATE SEQUENCE consultasdb.consultas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE consultasdb.consultas_id_seq OWNER TO postgres;

--
-- Name: consultas_id_seq; Type: SEQUENCE OWNED BY; Schema: consultasdb; Owner: postgres
--

ALTER SEQUENCE consultasdb.consultas_id_seq OWNED BY consultasdb.consultas.id;


--
-- Name: pacientes; Type: TABLE; Schema: pacientesdb; Owner: postgres
--

CREATE TABLE pacientesdb.pacientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character varying(11) NOT NULL,
    data_nascimento date,
    telefone character varying(15),
    email character varying(100),
    endereco character varying(200)
);


ALTER TABLE pacientesdb.pacientes OWNER TO postgres;

--
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: pacientesdb; Owner: postgres
--

CREATE SEQUENCE pacientesdb.pacientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE pacientesdb.pacientes_id_seq OWNER TO postgres;

--
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: pacientesdb; Owner: postgres
--

ALTER SEQUENCE pacientesdb.pacientes_id_seq OWNED BY pacientesdb.pacientes.id;


--
-- Name: usuarios id; Type: DEFAULT; Schema: authdb; Owner: postgres
--

ALTER TABLE ONLY authdb.usuarios ALTER COLUMN id SET DEFAULT nextval('authdb.usuarios_id_seq'::regclass);


--
-- Name: consultas id; Type: DEFAULT; Schema: consultasdb; Owner: postgres
--

ALTER TABLE ONLY consultasdb.consultas ALTER COLUMN id SET DEFAULT nextval('consultasdb.consultas_id_seq'::regclass);


--
-- Name: pacientes id; Type: DEFAULT; Schema: pacientesdb; Owner: postgres
--

ALTER TABLE ONLY pacientesdb.pacientes ALTER COLUMN id SET DEFAULT nextval('pacientesdb.pacientes_id_seq'::regclass);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: authdb; Owner: postgres
--

COPY authdb.usuarios (id, nome, cpf, usuario, senha, papel) FROM stdin;
\.


--
-- Data for Name: consultas; Type: TABLE DATA; Schema: consultasdb; Owner: postgres
--

COPY consultasdb.consultas (id, paciente_id, data, hora, medico_id, especialidade, historico_exame) FROM stdin;
\.


--
-- Data for Name: pacientes; Type: TABLE DATA; Schema: pacientesdb; Owner: postgres
--

COPY pacientesdb.pacientes (id, nome, cpf, data_nascimento, telefone, email, endereco) FROM stdin;
1	João da Silva	12345678901	1980-01-01	123456789	joao@example.com	Rua A, 123
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: authdb; Owner: postgres
--

SELECT pg_catalog.setval('authdb.usuarios_id_seq', 1, false);


--
-- Name: consultas_id_seq; Type: SEQUENCE SET; Schema: consultasdb; Owner: postgres
--

SELECT pg_catalog.setval('consultasdb.consultas_id_seq', 1, false);


--
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: pacientesdb; Owner: postgres
--

SELECT pg_catalog.setval('pacientesdb.pacientes_id_seq', 1, true);


--
-- Name: usuarios usuarios_cpf_key; Type: CONSTRAINT; Schema: authdb; Owner: postgres
--

ALTER TABLE ONLY authdb.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: authdb; Owner: postgres
--

ALTER TABLE ONLY authdb.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_usuario_key; Type: CONSTRAINT; Schema: authdb; Owner: postgres
--

ALTER TABLE ONLY authdb.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: consultasdb; Owner: postgres
--

ALTER TABLE ONLY consultasdb.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id);


--
-- Name: pacientes pacientes_cpf_key; Type: CONSTRAINT; Schema: pacientesdb; Owner: postgres
--

ALTER TABLE ONLY pacientesdb.pacientes
    ADD CONSTRAINT pacientes_cpf_key UNIQUE (cpf);


--
-- Name: pacientes pacientes_email_key; Type: CONSTRAINT; Schema: pacientesdb; Owner: postgres
--

ALTER TABLE ONLY pacientesdb.pacientes
    ADD CONSTRAINT pacientes_email_key UNIQUE (email);


--
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: pacientesdb; Owner: postgres
--

ALTER TABLE ONLY pacientesdb.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- Name: consultas consultas_paciente_id_fkey; Type: FK CONSTRAINT; Schema: consultasdb; Owner: postgres
--

ALTER TABLE ONLY consultasdb.consultas
    ADD CONSTRAINT consultas_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES pacientesdb.pacientes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
⁠ node server.js

