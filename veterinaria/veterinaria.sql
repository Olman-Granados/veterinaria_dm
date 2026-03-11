--
-- PostgreSQL database dump
--

\restrict uHIhDD5v8qLgPJgMEkVGz3ADbVOCDAeRtVcr6g9RauTzWCuwZuTkJabS7D821ax

-- Dumped from database version 17.9
-- Dumped by pg_dump version 18.1

-- Started on 2026-03-09 16:17:36

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 63153)
-- Name: atencion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atencion (
    atencion_id integer NOT NULL,
    mascota_id integer NOT NULL,
    fecha_atencion date NOT NULL,
    observaciones text,
    total numeric(10,2) DEFAULT 0
);


ALTER TABLE public.atencion OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 63152)
-- Name: atencion_atencion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atencion_atencion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.atencion_atencion_id_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 221
-- Name: atencion_atencion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atencion_atencion_id_seq OWNED BY public.atencion.atencion_id;


--
-- TOC entry 218 (class 1259 OID 63130)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cliente_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20),
    email character varying(100),
    direccion text,
    fecha_registro date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 63129)
-- Name: cliente_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cliente_id_seq OWNED BY public.cliente.cliente_id;


--
-- TOC entry 226 (class 1259 OID 63176)
-- Name: detalleatencion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalleatencion (
    detalle_id integer NOT NULL,
    atencion_id integer NOT NULL,
    servicio_id integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    CONSTRAINT detalleatencion_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT detalleatencion_precio_unitario_check CHECK ((precio_unitario > (0)::numeric))
);


ALTER TABLE public.detalleatencion OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 63175)
-- Name: detalleatencion_detalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalleatencion_detalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalleatencion_detalle_id_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalleatencion_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalleatencion_detalle_id_seq OWNED BY public.detalleatencion.detalle_id;


--
-- TOC entry 220 (class 1259 OID 63140)
-- Name: mascota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mascota (
    mascota_id integer NOT NULL,
    cliente_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especie character varying(50) NOT NULL,
    raza character varying(100),
    fecha_nacimiento date,
    sexo character(1),
    CONSTRAINT mascota_sexo_check CHECK ((sexo = ANY (ARRAY['M'::bpchar, 'H'::bpchar])))
);


ALTER TABLE public.mascota OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 63139)
-- Name: mascota_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mascota_mascota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mascota_mascota_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 219
-- Name: mascota_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mascota_mascota_id_seq OWNED BY public.mascota.mascota_id;


--
-- TOC entry 224 (class 1259 OID 63168)
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    servicio_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio_base numeric(10,2) NOT NULL,
    categoria character varying(50),
    CONSTRAINT servicio_precio_base_check CHECK ((precio_base > (0)::numeric))
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 63167)
-- Name: servicio_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicio_servicio_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 223
-- Name: servicio_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicio_servicio_id_seq OWNED BY public.servicio.servicio_id;


--
-- TOC entry 4765 (class 2604 OID 63156)
-- Name: atencion atencion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atencion ALTER COLUMN atencion_id SET DEFAULT nextval('public.atencion_atencion_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 63133)
-- Name: cliente cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cliente_id SET DEFAULT nextval('public.cliente_cliente_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 63179)
-- Name: detalleatencion detalle_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalleatencion ALTER COLUMN detalle_id SET DEFAULT nextval('public.detalleatencion_detalle_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 63143)
-- Name: mascota mascota_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota ALTER COLUMN mascota_id SET DEFAULT nextval('public.mascota_mascota_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 63171)
-- Name: servicio servicio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio ALTER COLUMN servicio_id SET DEFAULT nextval('public.servicio_servicio_id_seq'::regclass);


--
-- TOC entry 4937 (class 0 OID 63153)
-- Dependencies: 222
-- Data for Name: atencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atencion (atencion_id, mascota_id, fecha_atencion, observaciones, total) FROM stdin;
1	1	2025-01-10	Chequeo general	59000.00
2	2	2025-01-15	Vacunacion	66000.00
3	3	2025-01-20	Baño y corte	54000.00
4	4	2025-02-05	Desparasitacion	47000.00
5	5	2025-02-10	Chequeo general	71000.00
6	6	2025-02-15	Vacunacion	44000.00
7	7	2025-03-01	Examen sangre	71000.00
8	8	2025-03-05	Cirugia menor	134000.00
9	9	2025-03-10	Baño	27000.00
10	10	2025-03-15	Consulta	35000.00
11	11	2025-01-25	Vacuna	54000.00
12	12	2025-02-20	Chequeo	79000.00
13	1	2025-03-18	Control	51000.00
14	2	2025-03-22	Desparasitacion	47000.00
15	3	2025-02-28	Consulta	32000.00
16	4	2025-03-30	Vacuna	50000.00
17	5	2025-01-18	Baño	54000.00
18	6	2025-02-12	Examen	59000.00
19	7	2025-03-25	Consulta	51000.00
20	8	2025-01-08	Chequeo	47000.00
21	9	2025-02-14	Vacuna	66000.00
22	10	2025-03-02	Desparasitacion	30000.00
23	11	2025-01-12	Consulta	76000.00
24	12	2025-02-18	Baño	39000.00
25	1	2025-03-28	Vacuna	50000.00
\.


--
-- TOC entry 4933 (class 0 OID 63130)
-- Dependencies: 218
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cliente_id, nombre, telefono, email, direccion, fecha_registro) FROM stdin;
1	Carlos Ramirez	8888-1111	carlos@email.com	San Jose	2026-03-08
2	Ana Lopez	8888-2222	ana@email.com	Heredia	2026-03-08
3	Luis Mora	8888-3333	luis@email.com	Cartago	2026-03-08
4	Sofia Vega	8888-4444	sofia@email.com	Alajuela	2026-03-08
5	Mario Rojas	8888-5555	mario@email.com	Escazu	2026-03-08
6	Laura Castro	8888-6666	laura@email.com	Curridabat	2026-03-08
7	Daniel Herrera	8888-7777	daniel@email.com	Moravia	2026-03-08
8	Elena Solis	8888-8888	elena@email.com	Tibas	2026-03-08
\.


--
-- TOC entry 4941 (class 0 OID 63176)
-- Dependencies: 226
-- Data for Name: detalleatencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalleatencion (detalle_id, atencion_id, servicio_id, cantidad, precio_unitario, subtotal) FROM stdin;
1	1	2	2	12000.00	24000.00
2	2	2	2	12000.00	36000.00
3	3	2	2	12000.00	24000.00
4	4	2	1	12000.00	24000.00
5	5	2	2	12000.00	36000.00
6	6	2	2	12000.00	24000.00
7	7	2	2	12000.00	36000.00
8	8	2	1	12000.00	24000.00
9	9	2	2	12000.00	12000.00
10	10	2	2	12000.00	12000.00
11	11	2	1	12000.00	24000.00
12	12	2	1	12000.00	36000.00
13	13	2	2	12000.00	24000.00
14	14	2	1	12000.00	24000.00
15	15	2	2	12000.00	12000.00
16	16	2	3	12000.00	24000.00
17	17	2	1	12000.00	24000.00
18	18	2	1	12000.00	24000.00
19	19	2	2	12000.00	24000.00
20	20	2	2	12000.00	12000.00
21	21	2	3	12000.00	36000.00
22	22	2	3	12000.00	12000.00
23	23	2	2	12000.00	36000.00
24	24	2	3	12000.00	24000.00
25	25	2	1	12000.00	12000.00
26	1	1	1	15000.00	15000.00
27	1	8	1	20000.00	20000.00
28	2	2	1	12000.00	12000.00
29	2	3	1	18000.00	18000.00
30	3	5	1	10000.00	10000.00
31	3	6	1	5000.00	5000.00
32	3	1	1	15000.00	15000.00
33	4	4	1	8000.00	8000.00
34	4	1	1	15000.00	15000.00
35	5	1	1	15000.00	15000.00
36	5	8	1	20000.00	20000.00
37	6	2	1	12000.00	12000.00
38	6	4	1	8000.00	8000.00
39	7	8	1	20000.00	20000.00
40	7	1	1	15000.00	15000.00
41	8	7	1	75000.00	75000.00
42	8	1	1	15000.00	15000.00
43	8	8	1	20000.00	20000.00
44	9	5	1	10000.00	10000.00
45	9	6	1	5000.00	5000.00
46	10	1	1	15000.00	15000.00
47	10	4	1	8000.00	8000.00
48	11	3	1	18000.00	18000.00
49	11	2	1	12000.00	12000.00
50	12	1	1	15000.00	15000.00
51	12	8	1	20000.00	20000.00
52	12	4	1	8000.00	8000.00
53	13	1	1	15000.00	15000.00
54	13	2	1	12000.00	12000.00
55	14	4	1	8000.00	8000.00
56	14	1	1	15000.00	15000.00
57	15	1	1	15000.00	15000.00
58	15	6	1	5000.00	5000.00
59	16	3	1	18000.00	18000.00
60	16	4	1	8000.00	8000.00
61	17	5	1	10000.00	10000.00
62	17	6	1	5000.00	5000.00
63	17	1	1	15000.00	15000.00
64	18	8	1	20000.00	20000.00
65	18	1	1	15000.00	15000.00
66	19	1	1	15000.00	15000.00
67	19	2	1	12000.00	12000.00
68	20	1	1	15000.00	15000.00
69	20	8	1	20000.00	20000.00
70	21	2	1	12000.00	12000.00
71	21	3	1	18000.00	18000.00
72	22	4	1	8000.00	8000.00
73	22	5	1	10000.00	10000.00
74	23	1	1	15000.00	15000.00
75	23	8	1	20000.00	20000.00
76	23	6	1	5000.00	5000.00
77	24	5	1	10000.00	10000.00
78	24	6	1	5000.00	5000.00
79	25	3	1	18000.00	18000.00
80	25	2	1	12000.00	12000.00
81	25	4	1	8000.00	8000.00
\.


--
-- TOC entry 4935 (class 0 OID 63140)
-- Dependencies: 220
-- Data for Name: mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mascota (mascota_id, cliente_id, nombre, especie, raza, fecha_nacimiento, sexo) FROM stdin;
1	1	Max	Perro	Labrador	2020-05-10	M
2	1	Luna	Gato	Siames	2021-03-15	H
3	2	Rocky	Perro	Bulldog	2019-07-20	M
4	3	Mia	Gato	Persa	2022-01-10	H
5	4	Toby	Perro	Poodle	2018-09-12	M
6	5	Nala	Gato	Criollo	2021-11-02	H
7	6	Simba	Perro	Golden	2020-04-18	M
8	6	Coco	Perro	Chihuahua	2022-06-05	H
9	7	Lola	Gato	Angora	2019-12-22	H
10	8	Bruno	Perro	Boxer	2017-08-30	M
11	2	Kiara	Gato	Siames	2023-02-14	H
12	3	Thor	Perro	Husky	2021-10-09	M
\.


--
-- TOC entry 4939 (class 0 OID 63168)
-- Dependencies: 224
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicio (servicio_id, nombre, precio_base, categoria) FROM stdin;
1	Consulta general	15000.00	Consulta
2	Vacuna rabia	12000.00	Vacuna
3	Vacuna triple	18000.00	Vacuna
4	Desparasitacion	8000.00	Tratamiento
5	Baño	10000.00	Estetica
6	Corte de uñas	5000.00	Estetica
7	Cirugia menor	75000.00	Procedimiento
8	Examen de sangre	20000.00	Laboratorio
\.


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 221
-- Name: atencion_atencion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atencion_atencion_id_seq', 25, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cliente_id_seq', 8, true);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalleatencion_detalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalleatencion_detalle_id_seq', 81, true);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 219
-- Name: mascota_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mascota_mascota_id_seq', 12, true);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 223
-- Name: servicio_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_servicio_id_seq', 8, true);


--
-- TOC entry 4778 (class 2606 OID 63161)
-- Name: atencion atencion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT atencion_pkey PRIMARY KEY (atencion_id);


--
-- TOC entry 4774 (class 2606 OID 63138)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cliente_id);


--
-- TOC entry 4782 (class 2606 OID 63183)
-- Name: detalleatencion detalleatencion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalleatencion
    ADD CONSTRAINT detalleatencion_pkey PRIMARY KEY (detalle_id);


--
-- TOC entry 4776 (class 2606 OID 63146)
-- Name: mascota mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pkey PRIMARY KEY (mascota_id);


--
-- TOC entry 4780 (class 2606 OID 63174)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (servicio_id);


--
-- TOC entry 4784 (class 2606 OID 63162)
-- Name: atencion atencion_mascota_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atencion
    ADD CONSTRAINT atencion_mascota_id_fkey FOREIGN KEY (mascota_id) REFERENCES public.mascota(mascota_id);


--
-- TOC entry 4785 (class 2606 OID 63184)
-- Name: detalleatencion detalleatencion_atencion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalleatencion
    ADD CONSTRAINT detalleatencion_atencion_id_fkey FOREIGN KEY (atencion_id) REFERENCES public.atencion(atencion_id);


--
-- TOC entry 4786 (class 2606 OID 63189)
-- Name: detalleatencion detalleatencion_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalleatencion
    ADD CONSTRAINT detalleatencion_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES public.servicio(servicio_id);


--
-- TOC entry 4783 (class 2606 OID 63147)
-- Name: mascota mascota_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.cliente(cliente_id);


-- Completed on 2026-03-09 16:17:36

--
-- PostgreSQL database dump complete
--

\unrestrict uHIhDD5v8qLgPJgMEkVGz3ADbVOCDAeRtVcr6g9RauTzWCuwZuTkJabS7D821ax

