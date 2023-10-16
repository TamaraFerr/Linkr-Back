--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.0 (Ubuntu 16.0-1.pgdg22.04+1)

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
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    userid integer NOT NULL,
    description text,
    likes integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    link text NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    userid integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    password text,
    username text,
    pictureurl text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (1, 2, '#Busca', 0, '2023-10-16 16:11:27.793981-03', 'http://www.google.com');
INSERT INTO public.posts VALUES (2, 2, '#Busca', 0, '2023-10-16 16:11:36.056766-03', 'http://www.google.com');
INSERT INTO public.posts VALUES (3, 6, '#Teste', 0, '2023-10-16 16:37:02.825263-03', 'http://localhost:3000/signup');
INSERT INTO public.posts VALUES (4, 6, '#Teste', 0, '2023-10-16 16:47:43.322551-03', 'http://localhost:3000/signup');
INSERT INTO public.posts VALUES (5, 2, '#Teste', 0, '2023-10-16 16:58:55.53648-03', 'http://www.uol.com.br');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, '2bcc44fe-811b-492e-bfa8-1c799819e5fc', '2023-10-15 22:04:33.258439-03');
INSERT INTO public.sessions VALUES (2, 3, 'cccc5b45-cbb4-41c6-b1b7-a8bf41d84e8e', '2023-10-15 22:16:55.176731-03');
INSERT INTO public.sessions VALUES (3, 3, '83b491c9-78bd-41e9-9747-88e81007266a', '2023-10-15 22:35:03.306242-03');
INSERT INTO public.sessions VALUES (4, 4, 'f4b51825-5332-412b-99bd-ba749a79468e', '2023-10-16 10:28:45.943949-03');
INSERT INTO public.sessions VALUES (5, 2, 'd83bf5fa-728b-45e6-aaf7-68b0f21e3930', '2023-10-16 15:27:24.428309-03');
INSERT INTO public.sessions VALUES (6, 2, '933d98a0-d2df-4bfe-ac9f-353f9d6c4d76', '2023-10-16 15:49:16.061922-03');
INSERT INTO public.sessions VALUES (7, 2, '00bfad96-4442-467d-b790-22a6262a8372', '2023-10-16 16:01:34.788986-03');
INSERT INTO public.sessions VALUES (8, 2, 'f6d7ba9b-0525-44b7-8810-2e6773567b46', '2023-10-16 16:03:15.76358-03');
INSERT INTO public.sessions VALUES (9, 2, '657ae79d-8256-4272-a909-78799789a0b3', '2023-10-16 16:04:06.942662-03');
INSERT INTO public.sessions VALUES (10, 2, '8334b9f3-558b-43da-ba6a-859adf1fd764', '2023-10-16 16:20:52.894298-03');
INSERT INTO public.sessions VALUES (11, 6, 'e2c35623-7f9f-4e92-a2cb-71417ea8a487', '2023-10-16 16:36:53.686533-03');
INSERT INTO public.sessions VALUES (12, 2, '9b9791d2-920f-4c07-9a5b-9a6c37737649', '2023-10-16 16:52:40.091372-03');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 't@p.com', '$2b$10$o/4BcBJO0ftUH7lZJ/i0O./V67lIvfbRKJW6lGzLynDpBmHHuhqvq', 'theo', 'https://yt3.ggpht.com/ytc/APkrFKbM-9aDyDQpEIPamllyf0f-YMM6iatlMjLXVuz545E=s600-c-k-c0x00ffffff-no-rj-rp-mo', '2023-10-15 21:14:09.359462-03');
INSERT INTO public.users VALUES (2, 'j@p.com', '$2b$10$aooTBqoIcz6VhVp2ZvXYz.6uYcR22CLU1gM5mZ2BCgjkpg1mFe5DS', 'joana', 'http://www.img.com/foto.jpg', '2023-10-15 21:56:56.123105-03');
INSERT INTO public.users VALUES (3, 'l@p.com', '$2b$10$J7tJzpSRT2bISkT3v59fAexDtT3M.KxuKezpmb9pEIG8T7nepXZLO', 'luiz', 'http://www.img.com/luiz.jpg', '2023-10-15 22:16:46.24099-03');
INSERT INTO public.users VALUES (4, 'l@l.com', '$2b$10$ueB9ETMK0ZS4lqHHJtQHK.8WbzidrN5w8p.RDR3dRzlWu1nEMYuKi', 'luiz', 'https://discord.com/channels/1161065625280598069/1161065625964257343', '2023-10-16 10:28:38.8307-03');
INSERT INTO public.users VALUES (5, 'theo@p.com', '$2b$10$l1XnFsEG6cKwvpfLSoepk.BfMHYMVbSl/7Kfaj8hwO6.eR2UxDtsG', 'theop', 'https://www.notion.so/bootcampra/Projeto-19-Projet-o-Linkr-725082e9c47a42029e938bd22346397e', '2023-10-16 15:39:29.42932-03');
INSERT INTO public.users VALUES (6, 'tam@p.com', '$2b$10$GV3Imze2Gqx4S6j1gyhpxuTC.c2H7w/nxhPK/R80pNP09rrfF72vm', 'tamara', 'http://localhost:3000/signup', '2023-10-16 16:36:43.31166-03');


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 5, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id, email);


--
-- PostgreSQL database dump complete
--

