--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: a1_cadastro_de_clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.a1_cadastro_de_clientes (
    a1_cod integer NOT NULL,
    a1_nome character varying(100) NOT NULL,
    a1_tipo character varying(20) NOT NULL
);


--
-- Name: a3_cadastro_de_vendedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.a3_cadastro_de_vendedor (
    a3_cod integer NOT NULL,
    a3_nome character varying(100) NOT NULL,
    a3_regiao character varying(20) NOT NULL
);


--
-- Name: c5_cadastro_de_pedidos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.c5_cadastro_de_pedidos (
    c5_num integer NOT NULL,
    c5_emissao date NOT NULL,
    c5_codcli integer NOT NULL,
    c5_codven integer NOT NULL
);


--
-- Name: c6_itens_do_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.c6_itens_do_pedido (
    c6_num integer NOT NULL,
    c6_item character varying(3) NOT NULL,
    c6_codprod integer NOT NULL,
    c6_qtd integer NOT NULL,
    c6_prunit numeric(10,2) NOT NULL
);


--
-- Name: demo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo (
    id integer NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    hint text DEFAULT ''::text NOT NULL
);


--
-- Name: demo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;


--
-- Name: demo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);


--
-- Name: a1_cadastro_de_clientes a1_cadastro_de_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.a1_cadastro_de_clientes
    ADD CONSTRAINT a1_cadastro_de_clientes_pkey PRIMARY KEY (a1_cod);


--
-- Name: a3_cadastro_de_vendedor a3_cadastro_de_vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.a3_cadastro_de_vendedor
    ADD CONSTRAINT a3_cadastro_de_vendedor_pkey PRIMARY KEY (a3_cod);


--
-- Name: c5_cadastro_de_pedidos c5_cadastro_de_pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.c5_cadastro_de_pedidos
    ADD CONSTRAINT c5_cadastro_de_pedidos_pkey PRIMARY KEY (c5_num);


--
-- Name: c6_itens_do_pedido c6_itens_do_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.c6_itens_do_pedido
    ADD CONSTRAINT c6_itens_do_pedido_pkey PRIMARY KEY (c6_num, c6_item);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

