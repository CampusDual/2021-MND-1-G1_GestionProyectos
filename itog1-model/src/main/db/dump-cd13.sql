--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-02-02 15:59:16

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

DROP DATABASE cd13;
--
-- TOC entry 3058 (class 1262 OID 188867)
-- Name: cd13; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE cd13 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect cd13

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 209 (class 1259 OID 189498)
-- Name: employees_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employees_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

--
-- TOC entry 206 (class 1259 OID 189222)
-- Name: employees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employees (
    id_employee integer DEFAULT nextval('public.employees_pk_seq'::regclass) NOT NULL,
    name character varying(50),
    surname character varying(50),
    job integer
);


--
-- TOC entry 210 (class 1259 OID 189503)
-- Name: employees_projects_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employees_projects_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 208 (class 1259 OID 189286)
-- Name: employees_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employees_projects (
    id_employee_project integer DEFAULT nextval('public.employees_projects_pk_seq'::regclass) NOT NULL,
    id_employee integer,
    id_project integer,
    employee_involvement_in_project integer
);


--
-- TOC entry 212 (class 1259 OID 189814)
-- Name: job_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job_role (
    job_name character varying NOT NULL,
    id_job integer NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 189820)
-- Name: job_role_id_job_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.job_role_id_job_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 213
-- Name: job_role_id_job_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.job_role_id_job_seq OWNED BY public.job_role.id_job;


--
-- TOC entry 215 (class 1259 OID 189848)
-- Name: project_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_status (
    id_status integer NOT NULL,
    status_name character varying NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 189846)
-- Name: project_status_id_status_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 214
-- Name: project_status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_status_id_status_seq OWNED BY public.project_status.id_status;


--
-- TOC entry 211 (class 1259 OID 189507)
-- Name: projects_pk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 207 (class 1259 OID 189228)
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id_project integer DEFAULT nextval('public.projects_pk_seq'::regclass) NOT NULL,
    name character varying(50),
    status integer,
    manager character varying(50)
);


--
-- TOC entry 197 (class 1259 OID 188897)
-- Name: ti18n; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n (
    id_i18n integer NOT NULL,
    class_name character varying(150),
    i18n_description character varying(250)
);


--
-- TOC entry 198 (class 1259 OID 188902)
-- Name: ti18n_value; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ti18n_value (
    id_i18n_value integer NOT NULL,
    id_i18n integer NOT NULL,
    "KEY" character varying(250),
    es_es character varying(10485760),
    en_us character varying(10485760),
    gl_es character varying(10485760)
);


--
-- TOC entry 199 (class 1259 OID 188910)
-- Name: trequest_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trequest_statistics (
    id_request_statistics integer NOT NULL,
    service_name character varying(255),
    method_name character varying(50),
    user_name character varying(50),
    execution_date date,
    execution_time integer,
    method_params character varying(5000),
    service_exception character varying(5000)
);


--
-- TOC entry 200 (class 1259 OID 188918)
-- Name: trole; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole (
    id_rolename integer NOT NULL,
    rolename character varying(255),
    xmlclientpermission character varying(10485760)
);


--
-- TOC entry 202 (class 1259 OID 188944)
-- Name: trole_server_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trole_server_permission (
    id_role_server_permission integer NOT NULL,
    id_rolename integer,
    id_server_permission integer
);


--
-- TOC entry 201 (class 1259 OID 188936)
-- Name: tserver_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tserver_permission (
    id_server_permission integer NOT NULL,
    permission_name character varying(10485760)
);


--
-- TOC entry 203 (class 1259 OID 188959)
-- Name: tsetting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tsetting (
    id_setting integer NOT NULL,
    setting_key character varying(10485760),
    setting_value character varying(10485760),
    setting_comment character varying(10485760)
);


--
-- TOC entry 196 (class 1259 OID 188879)
-- Name: tuser; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser (
    user_ character varying(50) NOT NULL,
    password character varying(50),
    name character varying(50),
    surname character varying(50),
    email character varying(50),
    nif character varying(50),
    userblocked timestamp without time zone,
    lastpasswordupdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    firstlogin boolean DEFAULT true
);


--
-- TOC entry 204 (class 1259 OID 188967)
-- Name: tuser_preference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_preference (
    id_user_preference integer NOT NULL,
    preference_name character varying(150),
    user_login character varying(150),
    preference_value character varying(10485760)
);


--
-- TOC entry 205 (class 1259 OID 188994)
-- Name: tuser_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tuser_role (
    id_user_role integer NOT NULL,
    id_rolename integer,
    user_ character varying(50)
);


--
-- TOC entry 2853 (class 2604 OID 189822)
-- Name: job_role id_job; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_role ALTER COLUMN id_job SET DEFAULT nextval('public.job_role_id_job_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 189851)
-- Name: project_status id_status; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_status ALTER COLUMN id_status SET DEFAULT nextval('public.project_status_id_status_seq'::regclass);


--
-- TOC entry 3043 (class 0 OID 189222)
-- Dependencies: 206
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.employees VALUES (41, 'Napoleon', 'Kime', 1);
INSERT INTO public.employees VALUES (42, 'Minni', 'Picardo', 1);
INSERT INTO public.employees VALUES (3, 'Lind', 'Baldetti', 1);
INSERT INTO public.employees VALUES (6, 'Mycah', 'Itshak', 1);
INSERT INTO public.employees VALUES (44, 'Ilka', 'Gerner', 1);
INSERT INTO public.employees VALUES (55, 'Alen', 'Nela', 2);
INSERT INTO public.employees VALUES (69, 'William', 'Smellie', 2);
INSERT INTO public.employees VALUES (71, 'Jeda', 'Isler', 2);
INSERT INTO public.employees VALUES (46, 'Tracy', 'Reubens', 1);
INSERT INTO public.employees VALUES (45, 'Loreen', 'Gimenez', 1);
INSERT INTO public.employees VALUES (72, 'Jeda ', 'Isler', 2);
INSERT INTO public.employees VALUES (4, 'María', 'Serginson', 1);
INSERT INTO public.employees VALUES (2, 'Fogell', 'McLovin', 1);
INSERT INTO public.employees VALUES (1, 'Gweneth', 'Maria', 1);
INSERT INTO public.employees VALUES (5, 'Karon', 'Bloxam', 1);
INSERT INTO public.employees VALUES (7, 'Gonzalo', 'Tuffey', 1);
INSERT INTO public.employees VALUES (8, 'Inesita', 'Kyne', 1);
INSERT INTO public.employees VALUES (9, 'Vance', 'Einchcombe', 1);
INSERT INTO public.employees VALUES (11, 'Ronalda', 'Rittmeyer', 1);
INSERT INTO public.employees VALUES (12, 'Aldrich', 'Nassy', 2);
INSERT INTO public.employees VALUES (13, 'Dagmar', 'Head', 1);
INSERT INTO public.employees VALUES (14, 'Guillaume', 'Scafe', 1);
INSERT INTO public.employees VALUES (15, 'Haily', 'Spellar', 1);
INSERT INTO public.employees VALUES (51, 'Juan', 'Pedro', 1);
INSERT INTO public.employees VALUES (50, 'Kermie', 'Boakes', 1);
INSERT INTO public.employees VALUES (49, 'Viva', 'Dominka', 1);
INSERT INTO public.employees VALUES (48, 'Pavlov', 'Goodlife', 1);
INSERT INTO public.employees VALUES (47, 'Evelyn', 'Shakesb', 1);
INSERT INTO public.employees VALUES (16, 'Charleen', 'Lisciardelli', 1);
INSERT INTO public.employees VALUES (17, 'Joannes', 'McGroarty', 1);
INSERT INTO public.employees VALUES (18, 'Charlena', 'Lazer', 1);
INSERT INTO public.employees VALUES (26, 'Elisabeth', 'Wyley', 1);
INSERT INTO public.employees VALUES (43, 'Benny', 'Batecok', 1);
INSERT INTO public.employees VALUES (20, 'Charisse', 'Ganny', 1);
INSERT INTO public.employees VALUES (21, 'Carmela', 'Andrysiak', 1);
INSERT INTO public.employees VALUES (22, 'Iona', 'Ayree', 1);
INSERT INTO public.employees VALUES (23, 'Crystal', 'Pascoe', 1);
INSERT INTO public.employees VALUES (24, 'Moshe', 'Peyes', 1);
INSERT INTO public.employees VALUES (25, 'Parry', 'Glasser', 1);
INSERT INTO public.employees VALUES (27, 'Letisha', 'Week', 1);
INSERT INTO public.employees VALUES (29, 'Ivor', 'Oddey', 1);
INSERT INTO public.employees VALUES (30, 'Elwira', 'Stamps', 1);
INSERT INTO public.employees VALUES (31, 'Marla', 'Cuberley', 1);
INSERT INTO public.employees VALUES (32, 'Hilary', 'Goare', 1);
INSERT INTO public.employees VALUES (33, 'Doyle', 'Ovey', 1);
INSERT INTO public.employees VALUES (34, 'Justinn', 'Frank', 1);
INSERT INTO public.employees VALUES (35, 'Shoshanna', 'Harsum', 1);
INSERT INTO public.employees VALUES (36, 'Wernher', 'Stairs', 1);
INSERT INTO public.employees VALUES (38, 'Perry', 'Cassar', 1);
INSERT INTO public.employees VALUES (39, 'Ania', 'Culshew', 1);
INSERT INTO public.employees VALUES (40, 'Gerianne', 'Dunham', 1);


--
-- TOC entry 3045 (class 0 OID 189286)
-- Dependencies: 208
-- Data for Name: employees_projects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.employees_projects VALUES (29, 1, 29, 33);
INSERT INTO public.employees_projects VALUES (51, 1, 51, 33);
INSERT INTO public.employees_projects VALUES (13, 2, 13, 25);
INSERT INTO public.employees_projects VALUES (25, 2, 25, 25);
INSERT INTO public.employees_projects VALUES (52, 2, 52, 25);
INSERT INTO public.employees_projects VALUES (54, 4, 54, 100);
INSERT INTO public.employees_projects VALUES (55, 5, 55, 100);
INSERT INTO public.employees_projects VALUES (3, 6, 3, 50);
INSERT INTO public.employees_projects VALUES (56, 6, 56, 50);
INSERT INTO public.employees_projects VALUES (65, 15, 17, 25);
INSERT INTO public.employees_projects VALUES (16, 9, 16, 20);
INSERT INTO public.employees_projects VALUES (27, 9, 27, 20);
INSERT INTO public.employees_projects VALUES (49, 9, 49, 20);
INSERT INTO public.employees_projects VALUES (59, 9, 59, 20);
INSERT INTO public.employees_projects VALUES (103, 9, 6, 20);
INSERT INTO public.employees_projects VALUES (28, 11, 28, 50);
INSERT INTO public.employees_projects VALUES (1, 13, 1, 33);
INSERT INTO public.employees_projects VALUES (6, 13, 6, 33);
INSERT INTO public.employees_projects VALUES (63, 13, 39, 33);
INSERT INTO public.employees_projects VALUES (47, 14, 47, 50);
INSERT INTO public.employees_projects VALUES (64, 14, 25, 50);
INSERT INTO public.employees_projects VALUES (31, 15, 31, 25);
INSERT INTO public.employees_projects VALUES (32, 15, 32, 25);
INSERT INTO public.employees_projects VALUES (66, 16, 19, 100);
INSERT INTO public.employees_projects VALUES (67, 17, 51, 100);
INSERT INTO public.employees_projects VALUES (15, 18, 15, 20);
INSERT INTO public.employees_projects VALUES (35, 18, 35, 20);
INSERT INTO public.employees_projects VALUES (36, 18, 36, 20);
INSERT INTO public.employees_projects VALUES (43, 18, 43, 20);
INSERT INTO public.employees_projects VALUES (68, 18, 23, 20);
INSERT INTO public.employees_projects VALUES (70, 20, 45, 50);
INSERT INTO public.employees_projects VALUES (104, 20, 50, 50);
INSERT INTO public.employees_projects VALUES (38, 21, 38, 33);
INSERT INTO public.employees_projects VALUES (71, 21, 37, 33);
INSERT INTO public.employees_projects VALUES (10, 23, 10, 50);
INSERT INTO public.employees_projects VALUES (20, 24, 20, 33);
INSERT INTO public.employees_projects VALUES (45, 24, 45, 33);
INSERT INTO public.employees_projects VALUES (74, 24, 37, 33);
INSERT INTO public.employees_projects VALUES (33, 25, 33, 50);
INSERT INTO public.employees_projects VALUES (75, 25, 35, 50);
INSERT INTO public.employees_projects VALUES (77, 27, 27, 100);
INSERT INTO public.employees_projects VALUES (17, 32, 17, 20);
INSERT INTO public.employees_projects VALUES (19, 32, 19, 20);
INSERT INTO public.employees_projects VALUES (42, 32, 42, 20);
INSERT INTO public.employees_projects VALUES (82, 32, 7, 20);
INSERT INTO public.employees_projects VALUES (110, 32, 27, 20);
INSERT INTO public.employees_projects VALUES (83, 33, 39, 100);
INSERT INTO public.employees_projects VALUES (12, 34, 12, 33);
INSERT INTO public.employees_projects VALUES (41, 34, 41, 33);
INSERT INTO public.employees_projects VALUES (84, 34, 29, 33);
INSERT INTO public.employees_projects VALUES (8, 36, 8, 33);
INSERT INTO public.employees_projects VALUES (23, 36, 23, 33);
INSERT INTO public.employees_projects VALUES (86, 36, 44, 33);
INSERT INTO public.employees_projects VALUES (88, 38, 17, 50);
INSERT INTO public.employees_projects VALUES (39, 40, 39, 50);
INSERT INTO public.employees_projects VALUES (90, 40, 39, 50);
INSERT INTO public.employees_projects VALUES (91, 41, 21, 50);
INSERT INTO public.employees_projects VALUES (40, 42, 40, 33);
INSERT INTO public.employees_projects VALUES (92, 42, 50, 33);
INSERT INTO public.employees_projects VALUES (106, 42, 50, 33);
INSERT INTO public.employees_projects VALUES (44, 43, 44, 33);
INSERT INTO public.employees_projects VALUES (94, 44, 41, 50);
INSERT INTO public.employees_projects VALUES (96, 46, 18, 50);
INSERT INTO public.employees_projects VALUES (101, 46, 32, 50);
INSERT INTO public.employees_projects VALUES (9, 47, 9, 33);
INSERT INTO public.employees_projects VALUES (24, 47, 24, 33);
INSERT INTO public.employees_projects VALUES (97, 47, 25, 33);
INSERT INTO public.employees_projects VALUES (21, 48, 21, 33);
INSERT INTO public.employees_projects VALUES (22, 48, 22, 33);
INSERT INTO public.employees_projects VALUES (98, 48, 29, 33);
INSERT INTO public.employees_projects VALUES (48, 49, 48, 50);
INSERT INTO public.employees_projects VALUES (99, 49, 14, 50);
INSERT INTO public.employees_projects VALUES (5, 50, 5, 50);
INSERT INTO public.employees_projects VALUES (137, 50, 60, 50);
INSERT INTO public.employees_projects VALUES (138, 51, 60, 50);
INSERT INTO public.employees_projects VALUES (167, 1, 68, 10);
INSERT INTO public.employees_projects VALUES (170, 15, 68, 25);
INSERT INTO public.employees_projects VALUES (199, 69, 42, 75);
INSERT INTO public.employees_projects VALUES (171, 7, 57, 100);
INSERT INTO public.employees_projects VALUES (143, 51, 60, 50);
INSERT INTO public.employees_projects VALUES (107, 38, 2, 50);
INSERT INTO public.employees_projects VALUES (200, 11, 42, 30);
INSERT INTO public.employees_projects VALUES (112, 45, 24, 50);
INSERT INTO public.employees_projects VALUES (182, 1, 44, 5);
INSERT INTO public.employees_projects VALUES (109, 2, 23, 25);
INSERT INTO public.employees_projects VALUES (114, 45, 24, 90);
INSERT INTO public.employees_projects VALUES (89, 39, 45, 60);
INSERT INTO public.employees_projects VALUES (7, 44, 7, 10);
INSERT INTO public.employees_projects VALUES (188, 3, 3, 1);
INSERT INTO public.employees_projects VALUES (53, 3, 53, 23);
INSERT INTO public.employees_projects VALUES (166, 3, 68, 68);
INSERT INTO public.employees_projects VALUES (195, 69, 30, 25);
INSERT INTO public.employees_projects VALUES (61, 11, 49, 20);


--
-- TOC entry 3049 (class 0 OID 189814)
-- Dependencies: 212
-- Data for Name: job_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.job_role VALUES ('Encargado/a', 2);
INSERT INTO public.job_role VALUES ('Desarrollador/a', 1);


--
-- TOC entry 3052 (class 0 OID 189848)
-- Dependencies: 215
-- Data for Name: project_status; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.project_status VALUES (20, 'En curso');
INSERT INTO public.project_status VALUES (30, 'Finalizado');
INSERT INTO public.project_status VALUES (10, 'Pendiente');


--
-- TOC entry 3044 (class 0 OID 189228)
-- Dependencies: 207
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.projects VALUES (42, 'Sonren', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (8, 'Stell', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (30, 'Zin', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (40, 'Duosom', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (50, 'Vevo', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (60, 'Voyager', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (59, 'Zearc', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (1, 'Voltsilli', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (6, 'Stimer', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (68, 'Bosco', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (2, 'Andalax', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (5, 'Gembucket', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (7, 'Tresom', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (10, 'Domainer', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (11, 'Alpha', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (12, 'Temp', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (13, 'Wrapsafe', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (14, 'Opela', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (15, 'Cardguard', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (17, 'Bitwolf', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (18, 'Quo Lux', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (19, 'Span', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (20, 'Lotlux', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (21, 'Tres-Zap', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (22, 'Zaam-Dox', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (23, 'Stronghold', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (25, 'Subin', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (26, 'Prodder', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (27, 'Tin', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (28, 'Aerified', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (29, 'Sonsing', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (31, 'Kanlam', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (32, 'Daltfresh', 20, 'Alen Nela');
INSERT INTO public.projects VALUES (33, 'Zathin', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (34, 'Zamit', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (38, 'Konklab', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (39, 'Fintone', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (41, 'Matsoft', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (43, 'Fixflex', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (44, 'Namfix', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (45, 'Viva', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (47, 'Voyatouch', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (49, 'Treeflex', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (51, 'Flowdesk', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (53, 'Job', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (56, 'Flexidy', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (57, 'Otcom', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (16, 'Zillows', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (54, 'Airfield', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (73, 'mabel', 10, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (4, 'Keylex', 30, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (3, 'Transcof', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (70, 'Leid', 30, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (55, 'Beta', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (74, 'Monte', 10, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (75, 'Red', 10, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (9, 'Overhold', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (24, 'Crate', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (37, 'Offguard', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (48, 'Batsoft', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (35, 'Underhold', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (52, 'Crodler', 20, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (77, 'Digital', 10, 'Aldrich Nassy');
INSERT INTO public.projects VALUES (81, 'Ames', 10, 'Daphne Koller');
INSERT INTO public.projects VALUES (36, 'Temper', 30, 'Alen Nela');


--
-- TOC entry 3034 (class 0 OID 188897)
-- Dependencies: 197
-- Data for Name: ti18n; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ti18n VALUES (0, 'i18n.bundle', 'Resource bundle in database');


--
-- TOC entry 3035 (class 0 OID 188902)
-- Dependencies: 198
-- Data for Name: ti18n_value; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3036 (class 0 OID 188910)
-- Dependencies: 199
-- Data for Name: trequest_statistics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3037 (class 0 OID 188918)
-- Dependencies: 200
-- Data for Name: trole; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole VALUES (0, 'admin', '<?xml version="1.0" encoding="UTF-8"?><security></security>');


--
-- TOC entry 3039 (class 0 OID 188944)
-- Dependencies: 202
-- Data for Name: trole_server_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.trole_server_permission VALUES (0, 0, 0);


--
-- TOC entry 3038 (class 0 OID 188936)
-- Dependencies: 201
-- Data for Name: tserver_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tserver_permission VALUES (0, 'com.ontimize.jee.common.services.user.IUserInformationService/getUserInformation');


--
-- TOC entry 3040 (class 0 OID 188959)
-- Dependencies: 203
-- Data for Name: tsetting; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tsetting VALUES (0, 'mail_host', 'smtp.gmail.com', 'Host del servidor');
INSERT INTO public.tsetting VALUES (1, 'mail_port', '587', 'Puerto del servidor de email');
INSERT INTO public.tsetting VALUES (2, 'mail_protocol', 'smtp', 'Protocolo de env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (3, 'mail_user', 'mi.mail@example.com', 'Usuario para el env\u005cu00edo de mails');
INSERT INTO public.tsetting VALUES (4, 'mail_password', 'mis_credenciales', 'Password del servidor de mail');
INSERT INTO public.tsetting VALUES (5, 'mail_encoding', 'UTF-8', 'Codificaci\u005cu00f3n de mails');
INSERT INTO public.tsetting VALUES (6, 'mail_properties', 'mail.smtp.auth:true;mail.smtp.starttls.enable:true;', 'Propiedades de mails');
INSERT INTO public.tsetting VALUES (7, 'report_folder', 'C:/applications/ontimize-boot-app/reports', 'Carpeta de las plantillas de report');


--
-- TOC entry 3033 (class 0 OID 188879)
-- Dependencies: 196
-- Data for Name: tuser; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser VALUES ('demo', 'demouser', 'demo', 'demo', NULL, '44460713B', NULL, '2021-11-16 16:40:35.233838', false);


--
-- TOC entry 3041 (class 0 OID 188967)
-- Dependencies: 204
-- Data for Name: tuser_preference; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3042 (class 0 OID 188994)
-- Dependencies: 205
-- Data for Name: tuser_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tuser_role VALUES (0, 0, 'demo');


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 209
-- Name: employees_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employees_pk_seq', 72, true);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 210
-- Name: employees_projects_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.employees_projects_pk_seq', 202, true);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 213
-- Name: job_role_id_job_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.job_role_id_job_seq', 2, true);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 214
-- Name: project_status_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.project_status_id_status_seq', 1, false);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 211
-- Name: projects_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_pk_seq', 81, true);


--
-- TOC entry 2901 (class 2606 OID 189830)
-- Name: job_role job_role_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_role
    ADD CONSTRAINT job_role_pk PRIMARY KEY (id_job);


--
-- TOC entry 2903 (class 2606 OID 189856)
-- Name: project_status project_status_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_status
    ADD CONSTRAINT project_status_pk PRIMARY KEY (id_status);


--
-- TOC entry 2857 (class 2606 OID 188885)
-- Name: tuser sys_pk_10092; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser
    ADD CONSTRAINT sys_pk_10092 PRIMARY KEY (user_);


--
-- TOC entry 2869 (class 2606 OID 188925)
-- Name: trole sys_pk_10096; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole
    ADD CONSTRAINT sys_pk_10096 PRIMARY KEY (id_rolename);


--
-- TOC entry 2888 (class 2606 OID 188998)
-- Name: tuser_role sys_pk_10100; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT sys_pk_10100 PRIMARY KEY (id_user_role);


--
-- TOC entry 2872 (class 2606 OID 188943)
-- Name: tserver_permission sys_pk_10108; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tserver_permission
    ADD CONSTRAINT sys_pk_10108 PRIMARY KEY (id_server_permission);


--
-- TOC entry 2866 (class 2606 OID 188917)
-- Name: trequest_statistics sys_pk_10112; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trequest_statistics
    ADD CONSTRAINT sys_pk_10112 PRIMARY KEY (id_request_statistics);


--
-- TOC entry 2880 (class 2606 OID 188966)
-- Name: tsetting sys_pk_10116; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tsetting
    ADD CONSTRAINT sys_pk_10116 PRIMARY KEY (id_setting);


--
-- TOC entry 2883 (class 2606 OID 188974)
-- Name: tuser_preference sys_pk_10120; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_preference
    ADD CONSTRAINT sys_pk_10120 PRIMARY KEY (id_user_preference);


--
-- TOC entry 2860 (class 2606 OID 188901)
-- Name: ti18n sys_pk_10124; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n
    ADD CONSTRAINT sys_pk_10124 PRIMARY KEY (id_i18n);


--
-- TOC entry 2863 (class 2606 OID 188909)
-- Name: ti18n_value sys_pk_10128; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ti18n_value
    ADD CONSTRAINT sys_pk_10128 PRIMARY KEY (id_i18n_value);


--
-- TOC entry 2877 (class 2606 OID 188948)
-- Name: trole_server_permission sys_pk_10134; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT sys_pk_10134 PRIMARY KEY (id_role_server_permission);


--
-- TOC entry 2891 (class 2606 OID 189226)
-- Name: employees sys_pk_11001; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT sys_pk_11001 PRIMARY KEY (id_employee);


--
-- TOC entry 2894 (class 2606 OID 189232)
-- Name: projects sys_pk_11011; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT sys_pk_11011 PRIMARY KEY (id_project);


--
-- TOC entry 2899 (class 2606 OID 189290)
-- Name: employees_projects sys_pk_11021; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees_projects
    ADD CONSTRAINT sys_pk_11021 PRIMARY KEY (id_employee_project);


--
-- TOC entry 2884 (class 1259 OID 189016)
-- Name: sys_idx_10103; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10103 ON public.tuser_role USING btree (user_);


--
-- TOC entry 2885 (class 1259 OID 189017)
-- Name: sys_idx_10105; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10105 ON public.tuser_role USING btree (id_rolename);


--
-- TOC entry 2873 (class 1259 OID 189014)
-- Name: sys_idx_10137; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10137 ON public.trole_server_permission USING btree (id_rolename);


--
-- TOC entry 2874 (class 1259 OID 189015)
-- Name: sys_idx_10139; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_10139 ON public.trole_server_permission USING btree (id_server_permission);


--
-- TOC entry 2895 (class 1259 OID 189301)
-- Name: sys_idx_11023; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_11023 ON public.employees_projects USING btree (id_employee);


--
-- TOC entry 2896 (class 1259 OID 189302)
-- Name: sys_idx_11024; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sys_idx_11024 ON public.employees_projects USING btree (id_project);


--
-- TOC entry 2855 (class 1259 OID 188990)
-- Name: sys_idx_sys_pk_10092_10093; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10092_10093 ON public.tuser USING btree (user_);


--
-- TOC entry 2867 (class 1259 OID 189018)
-- Name: sys_idx_sys_pk_10096_10097; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10096_10097 ON public.trole USING btree (id_rolename);


--
-- TOC entry 2886 (class 1259 OID 189009)
-- Name: sys_idx_sys_pk_10100_10101; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10100_10101 ON public.tuser_role USING btree (id_user_role);


--
-- TOC entry 2870 (class 1259 OID 189010)
-- Name: sys_idx_sys_pk_10108_10109; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10108_10109 ON public.tserver_permission USING btree (id_server_permission);


--
-- TOC entry 2864 (class 1259 OID 189019)
-- Name: sys_idx_sys_pk_10112_10113; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10112_10113 ON public.trequest_statistics USING btree (id_request_statistics);


--
-- TOC entry 2878 (class 1259 OID 188993)
-- Name: sys_idx_sys_pk_10116_10117; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10116_10117 ON public.tsetting USING btree (id_setting);


--
-- TOC entry 2881 (class 1259 OID 188991)
-- Name: sys_idx_sys_pk_10120_10121; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10120_10121 ON public.tuser_preference USING btree (id_user_preference);


--
-- TOC entry 2858 (class 1259 OID 189021)
-- Name: sys_idx_sys_pk_10124_10125; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10124_10125 ON public.ti18n USING btree (id_i18n);


--
-- TOC entry 2861 (class 1259 OID 189020)
-- Name: sys_idx_sys_pk_10128_10130; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10128_10130 ON public.ti18n_value USING btree (id_i18n_value);


--
-- TOC entry 2875 (class 1259 OID 189011)
-- Name: sys_idx_sys_pk_10134_10135; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_10134_10135 ON public.trole_server_permission USING btree (id_role_server_permission);


--
-- TOC entry 2889 (class 1259 OID 189227)
-- Name: sys_idx_sys_pk_11001_11002; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_11001_11002 ON public.employees USING btree (id_employee);


--
-- TOC entry 2892 (class 1259 OID 189233)
-- Name: sys_idx_sys_pk_11011_11012; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_11011_11012 ON public.projects USING btree (id_project);


--
-- TOC entry 2897 (class 1259 OID 189303)
-- Name: sys_idx_sys_pk_11021_11022; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX sys_idx_sys_pk_11021_11022 ON public.employees_projects USING btree (id_employee_project);


--
-- TOC entry 2908 (class 2606 OID 189831)
-- Name: employees employees_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_fk FOREIGN KEY (job) REFERENCES public.job_role(id_job);


--
-- TOC entry 2910 (class 2606 OID 189291)
-- Name: employees_projects fk_temployees_projects; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees_projects
    ADD CONSTRAINT fk_temployees_projects FOREIGN KEY (id_employee) REFERENCES public.employees(id_employee);


--
-- TOC entry 2911 (class 2606 OID 189296)
-- Name: employees_projects fk_tprojects; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees_projects
    ADD CONSTRAINT fk_tprojects FOREIGN KEY (id_project) REFERENCES public.projects(id_project);


--
-- TOC entry 2906 (class 2606 OID 188999)
-- Name: tuser_role fk_trole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_trole FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2904 (class 2606 OID 188949)
-- Name: trole_server_permission fk_trole_server_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_trole_server_permission FOREIGN KEY (id_rolename) REFERENCES public.trole(id_rolename);


--
-- TOC entry 2905 (class 2606 OID 188954)
-- Name: trole_server_permission fk_tserver_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trole_server_permission
    ADD CONSTRAINT fk_tserver_permission FOREIGN KEY (id_server_permission) REFERENCES public.tserver_permission(id_server_permission);


--
-- TOC entry 2907 (class 2606 OID 189004)
-- Name: tuser_role fk_tuser; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tuser_role
    ADD CONSTRAINT fk_tuser FOREIGN KEY (user_) REFERENCES public.tuser(user_);


--
-- TOC entry 2909 (class 2606 OID 189871)
-- Name: projects projects_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_fk FOREIGN KEY (status) REFERENCES public.project_status(id_status);


-- Completed on 2023-02-02 15:59:20

--
-- PostgreSQL database dump complete
--

