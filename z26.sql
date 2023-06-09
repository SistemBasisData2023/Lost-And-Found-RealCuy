--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: jurusan; Type: TYPE; Schema: public; Owner: gemilangbramadhan
--

CREATE TYPE public.jurusan AS ENUM (
    'ARSITEKTUR',
    'ARSI. INTERIOR',
    'TEKNIK BIOMEDIS',
    'TEKNIK BIOPROSES',
    'TEKNIK ELEKTRO',
    'TEKNIK INDUSTRI',
    'TEKNIK KIMIA',
    'TEKNIK KOMPUTER',
    'TEKNIK LINGKUNGAN',
    'TEKNIK MESIN',
    'TEKNIK METALURGI DAN MATERIAL',
    'TEKNIK PERKAPALAN',
    'TEKNIK SIPIL'
);


ALTER TYPE public.jurusan OWNER TO gemilangbramadhan;

--
-- Name: seencheck; Type: TYPE; Schema: public; Owner: gemilangbramadhan
--

CREATE TYPE public.seencheck AS ENUM (
    'SENT',
    'SEEN'
);


ALTER TYPE public.seencheck OWNER TO gemilangbramadhan;

--
-- Name: statustype; Type: TYPE; Schema: public; Owner: gemilangbramadhan
--

CREATE TYPE public.statustype AS ENUM (
    'Lost',
    'Found',
    'Gotcha!',
    'Share'
);


ALTER TYPE public.statustype OWNER TO gemilangbramadhan;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chat; Type: TABLE; Schema: public; Owner: gemilangbramadhan
--

CREATE TABLE public.chat (
    chat_id bigint NOT NULL,
    sent_time timestamp with time zone DEFAULT now(),
    messages text NOT NULL,
    msg_status public.seencheck DEFAULT 'SENT'::public.seencheck,
    sender_id integer,
    receiver_id integer
);


ALTER TABLE public.chat OWNER TO gemilangbramadhan;

--
-- Name: chat_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: gemilangbramadhan
--

CREATE SEQUENCE public.chat_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chat_id_seq OWNER TO gemilangbramadhan;

--
-- Name: chat_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gemilangbramadhan
--

ALTER SEQUENCE public.chat_chat_id_seq OWNED BY public.chat.chat_id;


--
-- Name: chat_room; Type: TABLE; Schema: public; Owner: gemilangbramadhan
--

CREATE TABLE public.chat_room (
    room_id bigint NOT NULL,
    room_name text NOT NULL,
    chat_id integer,
    sender_id integer,
    receiver_id integer
);


ALTER TABLE public.chat_room OWNER TO gemilangbramadhan;

--
-- Name: chat_room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: gemilangbramadhan
--

CREATE SEQUENCE public.chat_room_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_room_room_id_seq OWNER TO gemilangbramadhan;

--
-- Name: chat_room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gemilangbramadhan
--

ALTER SEQUENCE public.chat_room_room_id_seq OWNED BY public.chat_room.room_id;


--
-- Name: detail_chat; Type: TABLE; Schema: public; Owner: gemilangbramadhan
--

CREATE TABLE public.detail_chat (
    id_chat integer NOT NULL,
    id_room integer NOT NULL,
    sender integer NOT NULL,
    receiver integer NOT NULL,
    "time" timestamp with time zone DEFAULT now() NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.detail_chat OWNER TO gemilangbramadhan;

--
-- Name: detail_chat_id_chat_seq; Type: SEQUENCE; Schema: public; Owner: gemilangbramadhan
--

CREATE SEQUENCE public.detail_chat_id_chat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detail_chat_id_chat_seq OWNER TO gemilangbramadhan;

--
-- Name: detail_chat_id_chat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gemilangbramadhan
--

ALTER SEQUENCE public.detail_chat_id_chat_seq OWNED BY public.detail_chat.id_chat;


--
-- Name: post; Type: TABLE; Schema: public; Owner: gemilangbramadhan
--

CREATE TABLE public.post (
    post_id bigint NOT NULL,
    user_id integer,
    post_txt text NOT NULL,
    rise_vote integer DEFAULT 0,
    post_date timestamp with time zone DEFAULT now(),
    status public.statustype NOT NULL
);


ALTER TABLE public.post OWNER TO gemilangbramadhan;

--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: gemilangbramadhan
--

CREATE SEQUENCE public.post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_post_id_seq OWNER TO gemilangbramadhan;

--
-- Name: post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gemilangbramadhan
--

ALTER SEQUENCE public.post_post_id_seq OWNED BY public.post.post_id;


--
-- Name: room_chat; Type: TABLE; Schema: public; Owner: gemilangbramadhan
--

CREATE TABLE public.room_chat (
    id_room integer NOT NULL,
    person_1 integer NOT NULL,
    person_2 integer NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.room_chat OWNER TO gemilangbramadhan;

--
-- Name: room_chat_id_room_seq; Type: SEQUENCE; Schema: public; Owner: gemilangbramadhan
--

CREATE SEQUENCE public.room_chat_id_room_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_chat_id_room_seq OWNER TO gemilangbramadhan;

--
-- Name: room_chat_id_room_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gemilangbramadhan
--

ALTER SEQUENCE public.room_chat_id_room_seq OWNED BY public.room_chat.id_room;


--
-- Name: user_data; Type: TABLE; Schema: public; Owner: gemilangbramadhan
--

CREATE TABLE public.user_data (
    user_id bigint NOT NULL,
    email character varying(40) NOT NULL,
    password text NOT NULL,
    username character varying(40) NOT NULL,
    name character varying(50) NOT NULL,
    bio character varying(255),
    birth_date date NOT NULL,
    jurusan_kuliah public.jurusan NOT NULL
);


ALTER TABLE public.user_data OWNER TO gemilangbramadhan;

--
-- Name: user_data_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gemilangbramadhan
--

CREATE SEQUENCE public.user_data_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_data_user_id_seq OWNER TO gemilangbramadhan;

--
-- Name: user_data_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gemilangbramadhan
--

ALTER SEQUENCE public.user_data_user_id_seq OWNED BY public.user_data.user_id;


--
-- Name: chat chat_id; Type: DEFAULT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat ALTER COLUMN chat_id SET DEFAULT nextval('public.chat_chat_id_seq'::regclass);


--
-- Name: chat_room room_id; Type: DEFAULT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat_room ALTER COLUMN room_id SET DEFAULT nextval('public.chat_room_room_id_seq'::regclass);


--
-- Name: detail_chat id_chat; Type: DEFAULT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.detail_chat ALTER COLUMN id_chat SET DEFAULT nextval('public.detail_chat_id_chat_seq'::regclass);


--
-- Name: post post_id; Type: DEFAULT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.post ALTER COLUMN post_id SET DEFAULT nextval('public.post_post_id_seq'::regclass);


--
-- Name: room_chat id_room; Type: DEFAULT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.room_chat ALTER COLUMN id_room SET DEFAULT nextval('public.room_chat_id_room_seq'::regclass);


--
-- Name: user_data user_id; Type: DEFAULT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.user_data ALTER COLUMN user_id SET DEFAULT nextval('public.user_data_user_id_seq'::regclass);


--
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: gemilangbramadhan
--

COPY public.chat (chat_id, sent_time, messages, msg_status, sender_id, receiver_id) FROM stdin;
\.


--
-- Data for Name: chat_room; Type: TABLE DATA; Schema: public; Owner: gemilangbramadhan
--

COPY public.chat_room (room_id, room_name, chat_id, sender_id, receiver_id) FROM stdin;
\.


--
-- Data for Name: detail_chat; Type: TABLE DATA; Schema: public; Owner: gemilangbramadhan
--

COPY public.detail_chat (id_chat, id_room, sender, receiver, "time", message) FROM stdin;
1	1	2	3	2023-06-09 13:59:13.206276+00	Hallo
2	1	3	2	2023-06-09 13:59:38.587092+00	Hallo Juga
3	4	1	3	2023-06-09 14:10:39.846138+00	Testing bro
4	4	3	1	2023-06-09 14:10:51.606051+00	Masuk bro
5	6	3	4	2023-06-10 04:52:30.394229+00	Assalamualaykum, look at the stars, look how they shine for you
6	6	4	3	2023-06-10 04:58:51.954525+00	Waalaikum salam brader in love
7	1	3	2	2023-06-10 05:03:48.097912+00	Lagi ngapain bro?
8	1	3	2	2023-06-10 05:03:55.63685+00	masuk ga bro chat gua?
9	1	2	3	2023-06-10 05:06:11.807977+00	Masuk dong
10	1	3	2	2023-06-10 05:19:28.175537+00	Coba chat lagi bang
11	1	2	3	2023-06-10 05:19:49.06489+00	ni gua bales
12	1	2	3	2023-06-10 07:56:17.52161+00	bro bro
13	1	2	3	2023-06-10 07:56:18.038052+00	
14	1	3	2	2023-06-10 07:56:59.034466+00	
15	1	3	2	2023-06-10 07:57:07.861215+00	ko masih ada null ya bro
16	7	3	5	2023-06-10 08:09:08.814099+00	salam kenal bos
17	6	3	4	2023-06-10 08:15:10.420362+00	btw kenapa nama lu testosteron bro?
18	4	3	1	2023-06-10 08:37:26.639066+00	nitip bro biar bisa di paling atas
19	4	3	1	2023-06-10 10:24:45.071895+00	halo
20	10	3	8	2023-06-10 12:14:20.219605+00	tes bang
21	11	9	8	2023-06-10 12:18:32.24767+00	Testing dari akun Ivan bang
22	10	3	8	2023-06-10 13:25:22.939828+00	tes lagi
23	13	3	9	2023-06-10 13:26:32.070465+00	Test bro
24	13	3	9	2023-06-10 13:43:18.522033+00	salam
25	4	3	1	2023-06-10 13:45:24.661978+00	tes
26	6	3	4	2023-06-10 13:45:45.683672+00	kadang error kadang engga
27	15	2	9	2023-06-10 13:46:55.734453+00	Salken bro
28	16	2	8	2023-06-10 13:49:16.037245+00	Tes chat
29	2	2	6	2023-06-10 13:49:32.578833+00	test chat
30	1	2	3	2023-06-10 13:51:08.378166+00	bleh suka ada error key di PersonChat dah
31	1	3	2	2023-06-10 13:53:07.363529+00	nah itu gua juga bingung
32	1	3	2	2023-06-10 13:53:15.345688+00	semua orang bingung
33	1	3	2	2023-06-10 13:53:22.859556+00	emang mbanya ga bingung?
34	1	3	2	2023-06-10 13:53:30.847701+00	semua orang di dunia bingung
35	1	3	2	2023-06-10 13:53:35.693832+00	kecuali nanti di Surga
36	1	2	3	2023-06-11 10:59:00.429128+00	Halo bleh
37	1	3	2	2023-06-11 10:59:46.884226+00	halo bleh
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: gemilangbramadhan
--

COPY public.post (post_id, user_id, post_txt, rise_vote, post_date, status) FROM stdin;
2	1	Dicari kucing ilang warna biru dongker, matanya putih makannya ikan, tolong banget kalo ketemu kabarin gua	0	2023-06-03 09:25:38.164042+00	Lost
4	3	Ini testing share dari akun Dobleh yaa	0	2023-06-04 13:21:22.928438+00	Share
16	3	Ini testing Lost dari akun Dobleh juga	0	2023-06-04 13:23:17.502628+00	Lost
17	3	Ini testing Lost dari akun Dobleh juga	0	2023-06-04 13:23:34.801515+00	Found
18	3	Ini testing Found dari akun Dobleh juga	0	2023-06-04 13:26:23.43628+00	Found
20	2	Kalo ini testing dari akun si Tester harusnya bisa	0	2023-06-04 13:29:22.851966+00	Lost
21	2	Cek sharenya si Tester aman ini	0	2023-06-04 13:31:02.16071+00	Share
25	2	Testing auto refresh cuy di Lost	0	2023-06-04 13:38:17.557614+00	Lost
27	2	Morning juga dari Tester	0	2023-06-05 03:51:58.568351+00	Share
30	1	Dicari kucing ilang warna biru dongker, matanya putih makannya ikan, tolong banget kalo ketemu kabarin gua	0	2023-06-07 08:47:48.709052+00	Lost
31	5	Dicari kucing ilang warna biru dongker, matanya putih makannya ikan, tolong banget kalo ketemu kabarin gua	0	2023-06-07 08:48:05.460298+00	Lost
44	3	assalamualaykum, look at the stars	0	2023-06-10 05:21:04.201786+00	Share
45	3	Jir barang gua ilang mulu dah	0	2023-06-10 08:16:03.740815+00	Gotcha!
48	3	Dicari earphone kuning di kutek	0	2023-06-10 08:27:37.691835+00	Gotcha!
52	3	Test lost	0	2023-06-10 08:35:51.183471+00	Lost
53	8	test test	0	2023-06-10 10:16:34.305969+00	Share
54	8	ditemukan temen	0	2023-06-10 10:17:26.854601+00	Found
55	9	Salam damai dari binjai	0	2023-06-10 12:19:52.601368+00	Lost
56	2	Berhasil edit profile cuy	0	2023-06-11 05:00:16.833972+00	Share
\.


--
-- Data for Name: room_chat; Type: TABLE DATA; Schema: public; Owner: gemilangbramadhan
--

COPY public.room_chat (id_room, person_1, person_2, created_at) FROM stdin;
1	2	3	2023-06-09 08:24:27.377727+00
2	2	6	2023-06-09 08:26:44.024705+00
4	1	3	2023-06-09 13:53:50.223313+00
6	3	4	2023-06-09 17:01:11.736271+00
7	3	5	2023-06-09 17:07:52.508784+00
8	3	6	2023-06-09 17:13:17.778051+00
9	3	7	2023-06-09 17:14:05.971132+00
10	3	8	2023-06-10 12:14:12.369776+00
11	9	8	2023-06-10 12:18:25.353289+00
13	3	9	2023-06-10 13:20:35.329669+00
15	2	9	2023-06-10 13:23:16.020468+00
16	2	8	2023-06-10 13:49:09.096751+00
\.


--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: gemilangbramadhan
--

COPY public.user_data (user_id, email, password, username, name, bio, birth_date, jurusan_kuliah) FROM stdin;
1	testing@gmail.com	$2b$10$UTkZvUeaMFd54S2m3X9pm.1KoazINMOhHVEwWw1XmL64mdo5WBYTu	Testing	Testing cuy	\N	2000-09-12	TEKNIK KOMPUTER
4	Testosteron@gmail.com	$2b$10$PflvCR8F5SSPfIwDxcAVkeH2TUtCsGtM/WZ0.xdYN.dx8Un0e/aQC	Testosteron	Test Test	\N	2007-04-12	TEKNIK BIOMEDIS
5	ivan.testing3@gmail.com	$2b$10$xNGHmMpb8VGVorsYhqvTRue9Y.RpcRXwsGy0dEK3aKbT9aDOQCFke	Testing1	Ivan Testing	\N	2003-08-12	TEKNIK MESIN
6	akunbaru@gmail.com	$2b$10$IISni1w3RSppAqmaNW7ydub2AOUgqrE9N99jGW3G3u4wa7y44M4Uu	Akun.Baru	Akun Baru Ini Bang	\N	2002-12-07	TEKNIK MESIN
7	ny0ba@gmail.com	$2b$10$NqTsvMVK6NXkOU77vnFD8.RwpkdF9SoqA/eSDYfWeOGt38Jn97GGS	Nyoba	Account nyoba	\N	2003-08-12	TEKNIK MESIN
8	gemilang@gmail.com	$2b$10$QIdRaiUJyfv1waABXOBJMO4f0XGvMOWZwQvFXO/XwF1mun5GpLiw6	gemilang	Gemilang	\N	2000-11-12	TEKNIK KOMPUTER
9	Ivan@gmail.com	$2b$10$tA5FPzLHA3V6pC0F6WoMIe3LQ1HBs.Sz5Bw.C2tbImya/qY.NV4nK	Ivan	Ivan Gunawan	\N	1998-10-01	TEKNIK LINGKUNGAN
2	Tester@gmail.com	$2b$10$D3tJoa.Er0Wj8wpMYvFvW.sisuP3qaGR9jGb5GQ1vRBdKjB.5KJPC	Tester	QA cape juga yaa 	Buah nangka buah mengkudu	2020-01-28	TEKNIK KOMPUTER
3	Dobleh@gmail.com	$2b$10$IQCyrsCuHgdDQMXVDIwEv.oGX4LXj8og8LDv0rYIDzuOIixxAWHR.	Dobleh	Saya, Dobleh, Kabor	Ini akun tester dari pertama kali program dibuat cuyy	2005-10-13	ARSITEKTUR
\.


--
-- Name: chat_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gemilangbramadhan
--

SELECT pg_catalog.setval('public.chat_chat_id_seq', 1, false);


--
-- Name: chat_room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gemilangbramadhan
--

SELECT pg_catalog.setval('public.chat_room_room_id_seq', 2, true);


--
-- Name: detail_chat_id_chat_seq; Type: SEQUENCE SET; Schema: public; Owner: gemilangbramadhan
--

SELECT pg_catalog.setval('public.detail_chat_id_chat_seq', 37, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gemilangbramadhan
--

SELECT pg_catalog.setval('public.post_post_id_seq', 56, true);


--
-- Name: room_chat_id_room_seq; Type: SEQUENCE SET; Schema: public; Owner: gemilangbramadhan
--

SELECT pg_catalog.setval('public.room_chat_id_room_seq', 16, true);


--
-- Name: user_data_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gemilangbramadhan
--

SELECT pg_catalog.setval('public.user_data_user_id_seq', 9, true);


--
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (chat_id);


--
-- Name: chat_room chat_room_pkey; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat_room
    ADD CONSTRAINT chat_room_pkey PRIMARY KEY (room_id);


--
-- Name: detail_chat detail_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.detail_chat
    ADD CONSTRAINT detail_chat_pkey PRIMARY KEY (id_chat);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);


--
-- Name: room_chat room_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.room_chat
    ADD CONSTRAINT room_chat_pkey PRIMARY KEY (id_room);


--
-- Name: user_data user_data_email_key; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_email_key UNIQUE (email);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (user_id);


--
-- Name: user_data user_data_username_key; Type: CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_username_key UNIQUE (username);


--
-- Name: detail_chat detail_chat_id_room_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.detail_chat
    ADD CONSTRAINT detail_chat_id_room_fkey FOREIGN KEY (id_room) REFERENCES public.room_chat(id_room);


--
-- Name: detail_chat detail_chat_receiver_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.detail_chat
    ADD CONSTRAINT detail_chat_receiver_fkey FOREIGN KEY (receiver) REFERENCES public.user_data(user_id);


--
-- Name: detail_chat detail_chat_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.detail_chat
    ADD CONSTRAINT detail_chat_sender_fkey FOREIGN KEY (sender) REFERENCES public.user_data(user_id);


--
-- Name: chat_room fk_chat_room; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat_room
    ADD CONSTRAINT fk_chat_room FOREIGN KEY (chat_id) REFERENCES public.chat(chat_id) ON DELETE SET NULL;


--
-- Name: post fk_user_data; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_user_data FOREIGN KEY (user_id) REFERENCES public.user_data(user_id) ON DELETE CASCADE;


--
-- Name: chat fk_user_data_receiver; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT fk_user_data_receiver FOREIGN KEY (receiver_id) REFERENCES public.user_data(user_id) ON DELETE CASCADE;


--
-- Name: chat_room fk_user_data_receiver_room; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat_room
    ADD CONSTRAINT fk_user_data_receiver_room FOREIGN KEY (receiver_id) REFERENCES public.user_data(user_id) ON DELETE SET NULL;


--
-- Name: chat fk_user_data_sender; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT fk_user_data_sender FOREIGN KEY (sender_id) REFERENCES public.user_data(user_id) ON DELETE CASCADE;


--
-- Name: chat_room fk_user_data_sender_room; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.chat_room
    ADD CONSTRAINT fk_user_data_sender_room FOREIGN KEY (sender_id) REFERENCES public.user_data(user_id) ON DELETE SET NULL;


--
-- Name: room_chat room_chat_person_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.room_chat
    ADD CONSTRAINT room_chat_person_1_fkey FOREIGN KEY (person_1) REFERENCES public.user_data(user_id);


--
-- Name: room_chat room_chat_person_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gemilangbramadhan
--

ALTER TABLE ONLY public.room_chat
    ADD CONSTRAINT room_chat_person_2_fkey FOREIGN KEY (person_2) REFERENCES public.user_data(user_id);


--
-- PostgreSQL database dump complete
--

