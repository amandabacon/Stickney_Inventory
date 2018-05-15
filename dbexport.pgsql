--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.11
-- Dumped by pg_dump version 9.5.11

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
1	Test	Test	Test	2018-02-11 14:13:54.526662	AJ	Test
3	H-Alpha Solar Filter	T-Scanner	TS-1092	2018-02-24 14:59:27.264783	Amanda	Daystar Solar Filter
5	DSLR #2	25214	3246512	2018-02-24 15:11:53.88018	Amanda	Nikon Digital Camera D70 with AF Nikkor 50mm f/1.8D (product 2137, 3158445)
8	Green Laser	 GLY005BXX	E08810/25428	2018-02-24 15:36:24.174583	Amanda	Laserglow Technologies; Lyra-B5 Black +Gold; 532 nm; Class IIIa
9	Green Laser	--	--	2018-02-24 15:41:37.052676	Amanda	*Laser Pointer*; 532 nm; Class IIIB
10	2" Adapter	ADASCT	--	2018-02-24 15:49:08.575671	Amanda	ASTRO-PHYSICS; 2" Adapter for 9.25" SCTs and under, with Brass Locking Ring
13	Zhumell PLOSSL 9mm Eye Piece	PL090711100099	--	2018-02-24 16:10:14.064974	Amanda	There are 2 of these in white boxes.
11	Celestron 25mm Eye Piece	--	--	2018-02-24 15:55:55.270598	Amanda	There are 5 of these in white boxes. Box has an identifier: BZX01-P10-01 (K25)
17	Meade Super Plossl 26mm Eye Piece	07175-02	709942010060	2018-02-24 16:24:45.396409	Amanda	There are 3 of these on the shelf
16	Celestron Plossl 40mm Eye Piece	--	--	2018-02-24 16:23:13.814438	Amanda	There are 2 of these on the shelf
12	Celestron 9mm Eye Piece	--	--	2018-02-24 16:02:16.851693	Amanda	There are 4 of these in white boxes and 1 on the shelf. Box has an identifier: BZX01-P10-01 (K25); ONE HAS MELTED PLASTIC RESIDUE--NOTED ON BOX
18	CCD Telecompressor-0.67x	CCDT67	--	2018-02-24 16:32:08.014903	Amanda	ASTRO-PHYSICS
19	Celestron T-Adapter 1.25"	93625	--	2018-02-24 16:33:41.639288	Amanda	Celestron
20	2.7" Photo-Visual Telecompressor	27TVPH	--	2018-02-24 16:35:15.193944	Amanda	ASTRO-PHYSICS
21	Celestron T-Ring	93402	--	2018-02-24 16:37:11.385847	Amanda	3 of these in boxes; Nikon F,A
22	Pentax Adapter	93401	--	2018-02-24 16:37:50.008219	Amanda	In Celestron T-Ring box
14	ORION Q70 26mm Eye Piece	08827	--	2018-02-24 16:18:28.819716	Amanda	Box: B000M88ABQ; Orion 8827 26mm Q70 Wide
25	Zhumell Super View 30mm Eye Piece	E-GS-SV30	SV30	2018-02-25 14:50:42.703998	Amanda	There are 3 boxes: SV090760100150, SV090758100148, SV1214-4100194 (-=can't read). Model and serial from Agena AstroProducts
27	Orion No.25 Red Filter	--	05514	2018-02-25 15:01:48.165355	Amanda	Filter set found on Orion telescope.com. Set includes red, blue, green, and yellow.
28	Orion No.15 Yellow Filter	--	05514	2018-02-25 15:02:21.541955	Amanda	Filter set found on Orion telescope.com. Set includes red, blue, green, and yellow.
29	Orion No.58 Green Filter	--	05514	2018-02-25 15:03:01.225027	Amanda	Filter set found on Orion telescope.com. Set includes red, blue, green, and yellow. Found a box with another green filter; 1.25"; PO #24550; Two numbers on box --25064 & 05540
30	Orion No.80A Blue Filter	--	05514	2018-02-25 15:11:53.323042	Amanda	Filter set found on Orion telescope.com. Set includes red, blue, green, and yellow. There are two boxes. One has two blue filters, another has one blue filter. Numbers on boxes: 11040, 30064 & 21107.
31	Orion SkyGlow Filter, 1.25"	05660	--	2018-02-25 15:14:52.46448	Amanda	PO 30005
32	BAADER H-alpha Narrowband 7nm 50,4mm CCD-Filter	2458383	4047825009432	2018-02-25 15:21:17.521792	Amanda	In stackable SBIG BAADER LRGB&Ha SET--not in it though
33	BAADER RG CCD-Filter B 50,4mm	2458480B	4047825021731	2018-02-25 15:24:05.853488	Amanda	In stackable SBIG BAADER LRGB&Ha SET
34	BAADER RGB CCD-Filter G 50,4mm	2458480G	4047825021724	2018-02-25 15:26:00.979274	Amanda	In stackable SBIG BAADER LRGB&Ha SET
35	BAADER RGB CCD-Filter R 50,4mm	2458480R	4047825021717	2018-02-25 15:27:45.340453	Amanda	In stackable SBIG BAADER LRGB&Ha SET
36	BAADER UV/IR-Cut/L 50,4mm	2459205	4047825021373	2018-02-25 15:29:31.297654	Amanda	In stackable SBIG BAADER LRGB&Ha SET--not in it though
37	Celestron Moon Filters-1.25"	94119-A	050234941198	2018-02-25 15:36:04.774249	Amanda	There are 4 of these filters in the box.
38	Moon Filters-1.25"	--	--	2018-02-25 15:47:11.153769	Amanda	There are two of these that just have "Moon" on the front. One is located in the dome room, and one on the shelf.
40	Telrad Finder Sight	--	X000SWFMMR	2018-02-25 15:50:32.915681	Amanda	Distributed by Agena AstroProducts
41	Celestron Solar Filter-NexStar SLT 130	94139	050234941396	2018-02-25 15:56:11.521023	Amanda	There are 5 boxes. AstroMaster 130, PS127; 000000638851464 & 000000171818236
42	Zhumell 1.25" Laser Collimator	ZHUE029-1	ZHUM-ZHUE029-1	2018-02-25 16:03:33.18821	Amanda	Got the information from telescopeplus.com. There are 3 of these boxes.
43	Telescope Collimation Tools	--	--	2018-02-25 16:07:05.011732	Amanda	This is a box that has a 635 nm laser collimator + accessories; Orion collimating eye piece.
45	1.25" Eye Piece to 0.965 Adapter	07159	17093	2018-02-25 16:10:13.308778	Amanda	PO #23631
46	Dell Windows XP Professional	Property of Bennington College 54024; PP11L	--	2018-02-25 16:19:56.049977	Amanda	In black computer bag on second shelf from the top.
47	MacBook Pro 13-inch	Z0UH0003P; A1708	C02VG0X8HV2F	2018-02-25 16:21:24.258865	Amanda	Recent computer as of late 2017
2	Form	Form	Form	2018-02-11 14:39:12.395692		
4	Spectrometer	DMK 41AU02.AS	34510020	2018-02-24 15:03:18.994384	Amanda	The Imaging Source CCD USB (box has spare part)
15	Sirius Plossl 40mm Eye Piece	08730	--	2018-02-24 16:21:14.773139	Amanda	
23	T-to-C Camera Adapter Mount	07127/02086	--	2018-02-24 16:38:58.646738	Amanda	PO #26850
44	T-C 16mm Adapter	93636	--	2018-02-25 16:09:07.201631	Amanda	
26	Optica b/c Filter - Red	--	--	2018-02-25 14:59:36.855678	Amanda	
\.


--
-- Name: sobset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amandabacon
--

SELECT pg_catalog.setval('sobset_id_seq', 47, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

