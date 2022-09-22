--
-- PostgreSQL database dump
--

-- Dumped from database version 10.21 (Ubuntu 10.21-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.21 (Ubuntu 10.21-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: citizen; Type: SCHEMA; Schema: -; Owner: simone
--

CREATE SCHEMA citizen;


ALTER SCHEMA citizen OWNER TO simone;

--
-- Name: patient; Type: SCHEMA; Schema: -; Owner: simone
--

CREATE SCHEMA patient;


ALTER SCHEMA patient OWNER TO simone;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: simone
--

CREATE TABLE public.account (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.account OWNER TO simone;

--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: simone
--

CREATE SEQUENCE public.account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_id_seq OWNER TO simone;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simone
--

ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account.user_id;


--
-- Name: rdd; Type: TABLE; Schema: public; Owner: simone
--

CREATE TABLE public.rdd (
    rdd_id integer NOT NULL,
    pi character varying(50) NOT NULL,
    name character varying(355) NOT NULL,
    path character varying(355) NOT NULL,
    created_at timestamp without time zone,
    start_date date NOT NULL,
    end_date date NOT NULL,
    published boolean NOT NULL,
    title character varying(50),
    CONSTRAINT no_null_string CHECK (((name)::text <> ''::text))
);


ALTER TABLE public.rdd OWNER TO simone;

--
-- Name: rdd_rdd_id_seq; Type: SEQUENCE; Schema: public; Owner: simone
--

CREATE SEQUENCE public.rdd_rdd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rdd_rdd_id_seq OWNER TO simone;

--
-- Name: rdd_rdd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: simone
--

ALTER SEQUENCE public.rdd_rdd_id_seq OWNED BY public.rdd.rdd_id;


--
-- Name: account user_id; Type: DEFAULT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.account ALTER COLUMN user_id SET DEFAULT nextval('public.account_user_id_seq'::regclass);


--
-- Name: rdd rdd_id; Type: DEFAULT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.rdd ALTER COLUMN rdd_id SET DEFAULT nextval('public.rdd_rdd_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: simone
--

COPY public.account (user_id, username, password) FROM stdin;
1	simo	1111
3	sofi	1234
4	ire	0987
22	lore	0000
23	admin	admin
24	Mario	7788
25	Anna	3344
26	Stefano Dalmiani	0011
27	Simone Bocca	8888
\.


--
-- Data for Name: rdd; Type: TABLE DATA; Schema: public; Owner: simone
--

COPY public.rdd (rdd_id, pi, name, path, created_at, start_date, end_date, published, title) FROM stdin;
238	Simone Bocca	ExpiredRDDBundle.json	/home/simone/UniTn/iehr/iehr-server/RP/central-node/login-upload/RDD/ExpiredRDDBundle.json	2021-04-06 11:45:28	2020-02-01	2020-11-30	f	COVID  zero day (2)
239	Simone Bocca	NoMatchRDDBundle.json	/home/simone/UniTn/iehr/iehr-server/RP/central-node/login-upload/RDD/NoMatchRDDBundle.json	2021-04-06 11:45:46	2020-01-01	2021-12-31	f	COVID  zero day (1)
244	simo	FTGMResearchStudy2.json	/home/simone/UniTn/IEHR/IEHR-server/RDS/central-node/login-upload/RDD/FTGMResearchStudy2.json	2022-03-18 13:47:23	2020-07-09	2025-09-14	f	INTERVAL Research Study
245	Simone Bocca	Interval RDDBundle-PDF_v4.json	/home/simone/UniTn/IEHR/IEHR-server/RDS/central-node/login-upload/RDD/Interval RDDBundle-PDF_v4.json	2022-04-20 20:02:10	2020-07-09	2025-09-14	f	INTERVAL Research Study
246	simo	Interval RDDBundle-PDF_v4_contained_questionnaire.json	/home/simone/UniTn/IEHR/IEHR-server/RDS/central-node/login-upload/RDD/Interval RDDBundle-PDF_v4_contained_questionnaire.json	2022-05-18 09:56:32	2020-07-09	2025-09-14	f	INTERVAL Research Study
\.


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simone
--

SELECT pg_catalog.setval('public.account_user_id_seq', 27, true);


--
-- Name: rdd_rdd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: simone
--

SELECT pg_catalog.setval('public.rdd_rdd_id_seq', 246, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (user_id);


--
-- Name: account account_username_key; Type: CONSTRAINT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- Name: rdd rdd_name_key; Type: CONSTRAINT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.rdd
    ADD CONSTRAINT rdd_name_key UNIQUE (name);


--
-- Name: rdd rdd_path_key; Type: CONSTRAINT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.rdd
    ADD CONSTRAINT rdd_path_key UNIQUE (path);


--
-- Name: rdd rdd_pkey; Type: CONSTRAINT; Schema: public; Owner: simone
--

ALTER TABLE ONLY public.rdd
    ADD CONSTRAINT rdd_pkey PRIMARY KEY (rdd_id);


--
-- PostgreSQL database dump complete
--

