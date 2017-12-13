--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: update_date(); Type: FUNCTION; Schema: public; Owner: amandabacon
--

CREATE FUNCTION update_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN NEW.date = now(); RETURN NEW; END; $$;


ALTER FUNCTION public.update_date() OWNER TO amandabacon;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sobset; Type: TABLE; Schema: public; Owner: amandabacon
--

CREATE TABLE sobset (
    id integer NOT NULL,
    item_name character varying(50) NOT NULL,
    model character varying(50) NOT NULL,
    serial_num character varying(25) NOT NULL,
    date timestamp without time zone DEFAULT now(),
    logger_name character varying(20),
    description text
);


ALTER TABLE sobset OWNER TO amandabacon;

--
-- Name: sobset_id_seq; Type: SEQUENCE; Schema: public; Owner: amandabacon
--

CREATE SEQUENCE sobset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sobset_id_seq OWNER TO amandabacon;

--
-- Name: sobset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amandabacon
--

ALTER SEQUENCE sobset_id_seq OWNED BY sobset.id;


--
-- Name: user_table; Type: TABLE; Schema: public; Owner: amandabacon
--

CREATE TABLE user_table (
    id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(25) NOT NULL,
    privilege integer DEFAULT 0 NOT NULL
);


ALTER TABLE user_table OWNER TO amandabacon;

--
-- Name: user_table_id_seq; Type: SEQUENCE; Schema: public; Owner: amandabacon
--

CREATE SEQUENCE user_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_table_id_seq OWNER TO amandabacon;

--
-- Name: user_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amandabacon
--

ALTER SEQUENCE user_table_id_seq OWNED BY user_table.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: amandabacon
--

ALTER TABLE ONLY sobset ALTER COLUMN id SET DEFAULT nextval('sobset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: amandabacon
--

ALTER TABLE ONLY user_table ALTER COLUMN id SET DEFAULT nextval('user_table_id_seq'::regclass);


--
-- Data for Name: sobset; Type: TABLE DATA; Schema: public; Owner: amandabacon
--

COPY sobset (id, item_name, model, serial_num, date, logger_name, description) FROM stdin;
1	Test	Test	Test	2017-12-12 23:45:14.008491	A	Test
2	TEST	TEST	TEST	2017-12-12 23:45:14.008491	A	TEST
3	TEST	TEST	TEST	2017-12-12 23:45:14.008491	A	TEST
4	Meade	TEST	TEST	2017-12-12 23:45:14.008491	A	TEST
5	Meade Test	TEST	TEST	2017-12-12 23:45:14.008491	A	TEST
6	MEADE	TEST	TEST	2017-12-12 23:45:14.008491	A	TEST
7	MEADE	TEST	TEST	2017-12-12 23:45:14.008491	A	TEST
8	Coronado Cemex Eyepiece Set	BAR	B0039ZJXQA	2017-12-12 23:51:47.440149	AJ	Not solar filter
9	SERIES 4000 1.25" EYEPIECE AND FILTER SET	607001	B00Z17ZD5O	2017-12-12 23:53:22.868648	AJ	In case
10	CORONADO 2X BARLOW	\tBAR	\tB0039ZJXQA	2017-12-12 23:54:11.270206	AJ	One eyepiece
11	MEADE SERIES 5000 2" DIAGONAL MIRROR 	07680	B004FJGYM0	2017-12-13 00:01:52.901055	AJ	Star diagonal
12				2017-12-13 00:39:59.082753		
13	16" Dome Telescope	N/A	N/A	2017-12-13 00:40:31.845851	AJ	owner's manual
14	Orion 8945 SkyQuest Dobsonian	8945	B001DDW9V6	2017-12-13 07:42:24.483985	AJ	12"
15	Orion Dobsonian Reflector	8974	B00D2LDZLK	2017-12-13 07:43:20.85251	AJ	8"
16	Orion Dobsonian Reflector	8974	B00D2LDZLK	2017-12-13 07:43:26.259877	AJ	8"
17	Celestron NexStar Computerized Telescope	31145	B0007UQNNQ	2017-12-13 07:45:28.849654	AJ	Needs batteries
18	Celestron Collimation Eyepiece	94182	B00009R7RJ	2017-12-13 07:47:13.367143	AJ	In unmarked box
\.


--
-- Name: sobset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amandabacon
--

SELECT pg_catalog.setval('sobset_id_seq', 18, true);


--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: amandabacon
--

COPY user_table (id, user_name, password, email, privilege) FROM stdin;
1	Test	Test	Test	0
\.


--
-- Name: user_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amandabacon
--

SELECT pg_catalog.setval('user_table_id_seq', 1, true);


--
-- Name: sobset_pkey; Type: CONSTRAINT; Schema: public; Owner: amandabacon
--

ALTER TABLE ONLY sobset
    ADD CONSTRAINT sobset_pkey PRIMARY KEY (id);


--
-- Name: user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: amandabacon
--

ALTER TABLE ONLY user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

