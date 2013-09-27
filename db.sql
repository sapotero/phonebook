--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-09-27 16:59:16 MSK

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 167 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1886 (class 0 OID 0)
-- Dependencies: 167
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 24578)
-- Dependencies: 5
-- Name: abonent; Type: TABLE; Schema: public; Owner: sapotero; Tablespace: 
--

CREATE TABLE abonent (
    id bigint NOT NULL,
    tid integer NOT NULL,
    name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    cid integer
);


ALTER TABLE public.abonent OWNER TO sapotero;

--
-- TOC entry 161 (class 1259 OID 24576)
-- Dependencies: 5 162
-- Name: abonent_id_seq; Type: SEQUENCE; Schema: public; Owner: sapotero
--

CREATE SEQUENCE abonent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abonent_id_seq OWNER TO sapotero;

--
-- TOC entry 1887 (class 0 OID 0)
-- Dependencies: 161
-- Name: abonent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sapotero
--

ALTER SEQUENCE abonent_id_seq OWNED BY abonent.id;


--
-- TOC entry 164 (class 1259 OID 24586)
-- Dependencies: 5
-- Name: country; Type: TABLE; Schema: public; Owner: sapotero; Tablespace: 
--

CREATE TABLE country (
    id bigint NOT NULL,
    country character varying(40) NOT NULL,
    code character varying(5) NOT NULL
);


ALTER TABLE public.country OWNER TO sapotero;

--
-- TOC entry 163 (class 1259 OID 24584)
-- Dependencies: 164 5
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: sapotero
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO sapotero;

--
-- TOC entry 1888 (class 0 OID 0)
-- Dependencies: 163
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sapotero
--

ALTER SEQUENCE country_id_seq OWNED BY country.id;


--
-- TOC entry 166 (class 1259 OID 24594)
-- Dependencies: 5
-- Name: town; Type: TABLE; Schema: public; Owner: sapotero; Tablespace: 
--

CREATE TABLE town (
    id bigint NOT NULL,
    town character varying(50) NOT NULL,
    code character varying(5) NOT NULL
);


ALTER TABLE public.town OWNER TO sapotero;

--
-- TOC entry 165 (class 1259 OID 24592)
-- Dependencies: 166 5
-- Name: town_id_seq; Type: SEQUENCE; Schema: public; Owner: sapotero
--

CREATE SEQUENCE town_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.town_id_seq OWNER TO sapotero;

--
-- TOC entry 1889 (class 0 OID 0)
-- Dependencies: 165
-- Name: town_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sapotero
--

ALTER SEQUENCE town_id_seq OWNED BY town.id;


--
-- TOC entry 1864 (class 2604 OID 24581)
-- Dependencies: 162 161 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: sapotero
--

ALTER TABLE ONLY abonent ALTER COLUMN id SET DEFAULT nextval('abonent_id_seq'::regclass);


--
-- TOC entry 1865 (class 2604 OID 24589)
-- Dependencies: 164 163 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: sapotero
--

ALTER TABLE ONLY country ALTER COLUMN id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- TOC entry 1866 (class 2604 OID 24597)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: sapotero
--

ALTER TABLE ONLY town ALTER COLUMN id SET DEFAULT nextval('town_id_seq'::regclass);


--
-- TOC entry 1874 (class 0 OID 24578)
-- Dependencies: 162 1879
-- Data for Name: abonent; Type: TABLE DATA; Schema: public; Owner: sapotero
--

INSERT INTO abonent (id, tid, name, phone, cid) VALUES (10, 1, 'Пеле', '159732486', 1);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (12, 1, 'Джекки Робинсон', '369852147', 1);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (2, 2, 'Джон Кеннеди', '23456789', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (3, 3, 'Брюс Ли', '34578912', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (4, 4, 'Чарльз Линдберг', '456789123', 3);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (7, 4, 'Мать Тереза', '789123456', 3);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (11, 3, 'Андрей Сахаров', '268459713', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (9, 2, 'Роза Паркс', '9123456789', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (8, 3, 'Эммелин Панкхёрст', '891234567', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (6, 3, 'Мэрилин Монро', '678912345', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (5, 1, 'Харви Милк', '567891234', 1);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (1, 2, 'Хелен Келлер', '12345678', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (13, 1, 'Джорджио Армани', '79168750575', 2);
INSERT INTO abonent (id, tid, name, phone, cid) VALUES (15, 2, 'Моххамед Али', '954876321', 1);


--
-- TOC entry 1890 (class 0 OID 0)
-- Dependencies: 161
-- Name: abonent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sapotero
--

SELECT pg_catalog.setval('abonent_id_seq', 15, true);


--
-- TOC entry 1876 (class 0 OID 24586)
-- Dependencies: 164 1879
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: sapotero
--

INSERT INTO country (id, country, code) VALUES (3, 'Финляндия', '358');
INSERT INTO country (id, country, code) VALUES (2, 'Болгария', '359');
INSERT INTO country (id, country, code) VALUES (1, 'Венгрия', '36');
INSERT INTO country (id, country, code) VALUES (4, 'Россия', '7');


--
-- TOC entry 1891 (class 0 OID 0)
-- Dependencies: 163
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sapotero
--

SELECT pg_catalog.setval('country_id_seq', 5, true);


--
-- TOC entry 1878 (class 0 OID 24594)
-- Dependencies: 166 1879
-- Data for Name: town; Type: TABLE DATA; Schema: public; Owner: sapotero
--

INSERT INTO town (id, town, code) VALUES (1, 'Будапешт', '1');
INSERT INTO town (id, town, code) VALUES (2, 'София', '2');
INSERT INTO town (id, town, code) VALUES (3, 'Пловдив', '32');
INSERT INTO town (id, town, code) VALUES (4, 'Хельсинки', '9');
INSERT INTO town (id, town, code) VALUES (5, 'Москва', '49640');


--
-- TOC entry 1892 (class 0 OID 0)
-- Dependencies: 165
-- Name: town_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sapotero
--

SELECT pg_catalog.setval('town_id_seq', 5, true);


--
-- TOC entry 1868 (class 2606 OID 24583)
-- Dependencies: 162 162 1880
-- Name: abonent_pkey; Type: CONSTRAINT; Schema: public; Owner: sapotero; Tablespace: 
--

ALTER TABLE ONLY abonent
    ADD CONSTRAINT abonent_pkey PRIMARY KEY (id);


--
-- TOC entry 1870 (class 2606 OID 24591)
-- Dependencies: 164 164 1880
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: sapotero; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 1872 (class 2606 OID 24599)
-- Dependencies: 166 166 1880
-- Name: town_pkey; Type: CONSTRAINT; Schema: public; Owner: sapotero; Tablespace: 
--

ALTER TABLE ONLY town
    ADD CONSTRAINT town_pkey PRIMARY KEY (id);


--
-- TOC entry 1885 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-09-27 16:59:16 MSK

--
-- PostgreSQL database dump complete
--

