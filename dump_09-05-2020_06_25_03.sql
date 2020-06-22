--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Name: inquiries_maker_development; Type: DATABASE; Schema: -; Owner: postgres
--

\connect inquiries_maker_development

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

SET default_with_oids = false;

--
-- Name: ahoy_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ahoy_messages (
    id bigint NOT NULL,
    user_type character varying,
    user_id bigint,
    "to" text,
    mailer character varying,
    subject text,
    sent_at timestamp without time zone,
    token character varying,
    opened_at timestamp without time zone,
    clicked_at timestamp without time zone
);


ALTER TABLE public.ahoy_messages OWNER TO postgres;

--
-- Name: ahoy_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ahoy_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ahoy_messages_id_seq OWNER TO postgres;

--
-- Name: ahoy_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ahoy_messages_id_seq OWNED BY public.ahoy_messages.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: cleaning_inquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cleaning_inquiries (
    id bigint NOT NULL,
    partner_token character varying,
    locale character varying DEFAULT 'de'::character varying NOT NULL,
    client_first_name character varying,
    client_last_name character varying,
    client_salutation character varying,
    client_email character varying,
    client_mobile character varying,
    client_street_and_number character varying,
    client_postal_code character varying,
    client_city character varying,
    client_property_size character varying,
    is_moving_request boolean DEFAULT false NOT NULL,
    is_cleaning_request boolean DEFAULT true NOT NULL,
    cleaning_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    origin character varying,
    hostname character varying,
    path character varying,
    referrer character varying,
    ip character varying
);


ALTER TABLE public.cleaning_inquiries OWNER TO postgres;

--
-- Name: cleaning_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cleaning_inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleaning_inquiries_id_seq OWNER TO postgres;

--
-- Name: cleaning_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cleaning_inquiries_id_seq OWNED BY public.cleaning_inquiries.id;


--
-- Name: combined_inquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combined_inquiries (
    id bigint NOT NULL,
    partner_token character varying,
    locale character varying DEFAULT 'de'::character varying NOT NULL,
    client_first_name character varying,
    client_last_name character varying,
    client_salutation character varying,
    client_email character varying,
    client_mobile character varying,
    client_street_and_number character varying,
    client_postal_code character varying,
    client_property_size character varying,
    client_city character varying,
    moving_city character varying,
    is_moving_request boolean DEFAULT true NOT NULL,
    is_cleaning_request boolean DEFAULT true NOT NULL,
    moving_street_and_number character varying,
    moving_postal_code character varying,
    moving_date date,
    cleaning_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    origin character varying,
    hostname character varying,
    path character varying,
    referrer character varying,
    ip character varying
);


ALTER TABLE public.combined_inquiries OWNER TO postgres;

--
-- Name: combined_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.combined_inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.combined_inquiries_id_seq OWNER TO postgres;

--
-- Name: combined_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.combined_inquiries_id_seq OWNED BY public.combined_inquiries.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id bigint NOT NULL,
    quarter character varying,
    send_count integer DEFAULT 0 NOT NULL,
    representation character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: moving_inquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moving_inquiries (
    id bigint NOT NULL,
    partner_token character varying,
    locale character varying DEFAULT 'de'::character varying NOT NULL,
    client_first_name character varying,
    client_last_name character varying,
    client_salutation character varying,
    client_email character varying,
    client_mobile character varying,
    client_street_and_number character varying,
    client_postal_code character varying,
    client_city character varying,
    client_property_size character varying,
    is_moving_request boolean DEFAULT true NOT NULL,
    is_cleaning_request boolean DEFAULT false NOT NULL,
    moving_street_and_number character varying,
    moving_postal_code character varying,
    moving_city character varying,
    moving_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    origin character varying,
    hostname character varying,
    path character varying,
    referrer character varying,
    ip character varying
);


ALTER TABLE public.moving_inquiries OWNER TO postgres;

--
-- Name: moving_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moving_inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moving_inquiries_id_seq OWNER TO postgres;

--
-- Name: moving_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moving_inquiries_id_seq OWNED BY public.moving_inquiries.id;


--
-- Name: received_inquiry_responses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.received_inquiry_responses (
    id bigint NOT NULL,
    moving_inquiry_id bigint,
    cleaning_inquiry_id bigint,
    combined_inquiry_id bigint,
    response_body jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quarter character varying
);


ALTER TABLE public.received_inquiry_responses OWNER TO postgres;

--
-- Name: received_inquiry_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.received_inquiry_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.received_inquiry_responses_id_seq OWNER TO postgres;

--
-- Name: received_inquiry_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.received_inquiry_responses_id_seq OWNED BY public.received_inquiry_responses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: ahoy_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ahoy_messages ALTER COLUMN id SET DEFAULT nextval('public.ahoy_messages_id_seq'::regclass);


--
-- Name: cleaning_inquiries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_inquiries ALTER COLUMN id SET DEFAULT nextval('public.cleaning_inquiries_id_seq'::regclass);


--
-- Name: combined_inquiries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combined_inquiries ALTER COLUMN id SET DEFAULT nextval('public.combined_inquiries_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: moving_inquiries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moving_inquiries ALTER COLUMN id SET DEFAULT nextval('public.moving_inquiries_id_seq'::regclass);


--
-- Name: received_inquiry_responses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.received_inquiry_responses ALTER COLUMN id SET DEFAULT nextval('public.received_inquiry_responses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ahoy_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ahoy_messages (id, user_type, user_id, "to", mailer, subject, sent_at, token, opened_at, clicked_at) FROM stdin;
1	User	2	invoice@movu.ch	InvoiceMailer#invoice	UOS Invoice Q3 2019	2019-10-08 16:06:49.078083	flnhrrFuAnQycdZXk7qeUlte2jTDIxPh	\N	\N
2	User	2	invoice@movu.ch	InvoiceMailer#invoice	UOS Invoice Q3 2019	2019-10-18 06:30:01.226438	SNap82zRWjYJB67LkGqHpD7UigP4IHgo	\N	\N
3	\N	\N	stephan.burri@gmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-10-21 20:40:19.453321	qSydxoxDYEcMGI1Gn7A2xgZLLKBVMjHB	\N	\N
4	\N	\N	heto@posteo.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-10-25 07:51:25.14157	4t6lHSsMsB5KKSSktvMy0DtMOnAjiegj	\N	\N
5	\N	\N	manu.duwe@googlemail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-10-28 15:46:57.596282	53HsekJPogfCBLaqcpF9hIwDrxtMaoXS	\N	\N
6	\N	\N	guido.vogt70@gmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-11-11 11:02:55.71931	684alqOODTbiJs28ne0t6ZHHjs1q8rLG	\N	\N
7	\N	\N	s.werly@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-11-17 13:24:14.447132	oXdtJH5qVSnhdw47zR0IiKOHQtSAHy5P	\N	\N
8	\N	\N	Schenzle@gmx.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-11-25 14:32:01.667015	53056XCD37cOJGEYTZNBIvRBY3zdrRvV	\N	\N
9	\N	\N	gaby.kingue@sunrise.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-12-02 18:20:05.972828	lqnBKvFBr9jDYkbqnTBcAO7PG7oaSrVO	\N	\N
10	\N	\N	houhou.siham@gmail.com	ClientMailer#client	Complétez votre demande de déménagement s.v.p.!	2019-12-04 08:29:13.176972	9nOS1uGAsYg9nl2L9PmJcMLiHGjOLRXd	\N	\N
11	\N	\N	houhou.siham@gmail.com	ClientMailer#client	Complétez votre demande de nettoyage s.v.p.!	2019-12-04 08:30:17.984164	8sOdP28Bh5PFrMRL9utMcqgSdmEzfpJd	\N	\N
12	\N	\N	roland.glur@gmx.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-12-26 09:07:11.292826	iWVPiespnJOjpKKNkGynhN0mMlcia6s9	\N	\N
13	\N	\N	roland.glur@gmx.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2019-12-26 09:07:49.28903	qe0wAGiwrXZAKkHfp96JSW8MKL5sTpPY	\N	\N
14	\N	\N	hayley_van_de_glind@hotmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2019-12-28 12:54:16.555708	WsaDqmsm76Zi2v8b0WPEzAJKw1H2Wjg4	\N	\N
15	\N	\N	k@juste.li	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-01-03 14:02:21.382035	8g5Qh1oXZNf22NBE7l8IMN9hmiBqEHQs	\N	\N
16	\N	\N	k@juste.li	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-01-03 14:03:26.611577	Amo4vTHbY0dDZhMnUSe9svJXGDfw5Oqc	\N	\N
17	\N	\N	julia.binkert@gmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-01-08 11:27:08.358359	BWlIew7WyixeGWMbxo2tydskuEzYPbXo	\N	\N
18	\N	\N	julia.binkert@gmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-01-08 11:28:04.641039	GTRK9boIWy0QHqv4Xo0kr5ndTkPPuo2X	\N	\N
19	User	2	invoice@movu.ch	InvoiceMailer#invoice	UOS Invoice Q4 2019	2020-01-21 17:15:39.913412	WpcSA1atUYRQXfnfUYtoWkD4KgF5RFq3	\N	\N
20	\N	\N	jennifer.estella85@gmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-01-22 10:33:21.751186	OCNC2jVNmjiH4nGYrnYdJjq5hc2pX1qD	\N	\N
21	\N	\N	monika@niederhofer.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-01-30 06:37:35.958813	vM1prmMYvj5inSh5Fzss4Mb0PwP89OP2	\N	\N
22	\N	\N	monika@niederhofer.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-01-30 06:38:38.051964	aFnFDJ4cJqWTYP226Jtt4CyPxR5K9YsF	\N	\N
23	\N	\N	harald.r@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-01-31 15:33:46.587015	3pqOl6kqnQwxKA1qeo3hBStqpdGSU29X	\N	\N
24	\N	\N	harald.r@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-01-31 15:35:14.11	ibwwedZB1gkd2Ya8WGLZni7BHwhMTk9l	\N	\N
25	\N	\N	giuseppe.cannella@me.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-02-07 11:25:06.723403	vKIyqQzOuWnPutrwMl8dEwtjXDJwMa14	\N	\N
26	\N	\N	k.oberhauser@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-02-09 17:40:10.977932	ALMon0dANHiRnnLqNE2pRNyMTdUKX5VE	\N	\N
27	\N	\N	k.oberhauser@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-02-09 17:40:59.509133	ewIDT37iTETWl9kIBaIjhzsOSVxr2Cbr	\N	\N
28	\N	\N	trinkler_tamara95@hotmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-02-23 14:29:44.237053	NE966xMYIAmgyoBNDX1ZH8CDeHhKnvLe	\N	\N
29	\N	\N	trinkler_tamara95@hotmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-02-23 14:32:00.775642	A0Qx3amTedyT31kTHtV09RY8DXMgkOxV	\N	\N
30	\N	\N	sihan.hamdo@hotmail.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-03-09 17:29:04.938371	0zR4mie7AgoSJOasqrnxKwzmGHJFMrzG	\N	\N
31	\N	\N	ebrooksbank@hotmail.com	ClientMailer#client	Complete your moving inquiry please!	2020-04-09 15:54:54.843396	qvnkeYQL33JInB6xJwFHcQ2qBErwIAaw	\N	\N
32	User	2	invoice@movu.ch	InvoiceMailer#invoice	UOS Invoice Q1 2020	2020-04-10 13:48:26.631825	jJgioCTJQqZs4paSt570W7lOmn5aTpUV	\N	\N
33	\N	\N	linda.voneuw@gmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-04-12 16:45:24.438422	uZsUWJe8B0247LyvNl0hufc6PCkqMPhP	\N	\N
34	\N	\N	walter.berger@gmx.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-04-20 13:11:04.896314	zssGwptW9Q5HLNTBmK4LSncOvgvMvEMH	\N	\N
35	\N	\N	bg.roger@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-04-22 07:23:47.378465	gybXUKO8ElxCR4AKABVrOLnDqvfPAKoN	\N	\N
36	\N	\N	antuor@datazug.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-04-28 10:14:58.23488	wtv4mszd5df2xk3wkYWMTo40fDZmQZDJ	\N	\N
37	\N	\N	antuor@datazug.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Reinigung Anfrage!	2020-04-28 10:28:12.97977	o9fOgZNbCxTy5TNWMt8dAKLV8IPL0LkL	\N	\N
38	\N	\N	anjaknab@hotmail.com	ClientMailer#client	Complete your moving inquiry please!	2020-05-04 16:05:51.936378	TNhBLhJ99MkPtcFd7w8QyJD0GWWs0aJF	\N	\N
39	\N	\N	anjaknab@hotmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-05-05 14:22:33.123836	LM7ntq1HEPHD3rFYVhKCw6hdntcaFiAI	\N	\N
40	\N	\N	anjaknab@hotmail.com	ClientMailer#client	Complete your moving inquiry please!	2020-05-05 14:31:26.712989	nBz8KbQuYtSgm5tnojjnLZXimBb0fwMP	\N	\N
41	\N	\N	freskim.ramushi@hotmail.com	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-05-06 10:12:15.424032	E84CoIeuUzWrAsoYVJ8UGxgLJXFOML5P	\N	\N
42	\N	\N	dior.senegal@bluewin.ch	ClientMailer#client	vervollständigen Sie Bitte Ihre Umzugsanfrage!	2020-05-07 13:14:15.235275	MqjlAlG6CYY1cTnQnZ7KTmpGtPIJgHHX	\N	\N
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-07-04 05:46:07.549495	2018-07-04 05:46:07.549495
\.


--
-- Data for Name: cleaning_inquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cleaning_inquiries (id, partner_token, locale, client_first_name, client_last_name, client_salutation, client_email, client_mobile, client_street_and_number, client_postal_code, client_city, client_property_size, is_moving_request, is_cleaning_request, cleaning_date, created_at, updated_at, origin, hostname, path, referrer, ip) FROM stdin;
1	\N	de	julia	kinner	ms	julia.kinner@gmx.ch	+41764254422	Reidholzstrasse 25	8805	Richterswil	size_4	f	t	2018-07-31	2018-07-22 14:18:16.245894	2018-07-22 14:18:16.245894	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	194.230.159.221
2	\N	de	Melanie	Müller–Schacher	ms	melanie.schacher@gmail.com	+41796613110	Obereystrasse 2	6207	Nottwil	size_4	f	t	2018-11-23	2018-09-17 08:15:45.977057	2018-09-17 08:15:45.977057	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/reinigungs-offerte/	https://umzug-offerte-schweiz.com/umzug-offerte/	77.56.173.104
3	\N	de	Gerda	Hablützel	ms	gerda.habluetzel@bluewin.ch	+41796738483	Grotzenmühlestrasse, 5b	8840	Einsiedeln	size_1	f	t	2019-01-28	2018-10-03 08:13:27.116972	2018-10-03 08:13:27.116972	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	178.194.135.17
4	\N	de	Dominique	Zwahlen	ms	conchini@gmx.ch	+41786333534	Dammweg 7	4922	Bützberg	size_3	f	t	2018-11-30	2018-10-12 04:15:36.01272	2018-10-12 04:15:36.01272	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/de/moving_inquiries/new	158.181.116.205
6	\N	de	Anette	Surer	ms	annettesurer67@gmail.com	+41793614738	Ergolzstrasse 46	4414	Füllinsdorf	size_3	f	t	2018-12-17	2018-10-19 07:23:23.372674	2018-10-19 07:23:23.372674	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/reinigungs-offerte/	https://umzug-offerte-schweiz.com/umzug-offerte/	145.15.244.29
7	\N	en	Bartosz	Wlodarczyk	mr	bwlodarczyk01@gmail.com	+41797776312	Spittelhofring 14	4665	Oftringen	size_4	f	t	2019-02-11	2018-11-14 15:39:59.303289	2018-11-14 15:39:59.303289	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/reinigungs-offerte/	https://umzug-offerte-schweiz.com/	194.51.167.165
8	\N	de	Stefanie	Seiler	ms	stefanieseiler@bluewin.ch	+41764977545	Schenkstrasse 31	3008	Bern	size_4	f	t	2018-12-27	2018-11-14 20:15:36.487734	2018-11-14 20:15:36.487734	https://umzug-offerte-schweiz.com				
9	\N	de	Vincent	Clerc	mr	sushibar@bluewin.ch	+41792634488	Untere Mühlestrasse 4	8105	Regensdorf	size_4	f	t	2019-03-25	2019-01-09 08:48:34.13726	2019-01-09 08:48:34.13726	https://umzug-offerte-schweiz.com				
10	\N	de	Cornel	Krämer	mr	cornel.kraemer@outlook.com	+41799392917	Im Grund 4	9553	Bettwiesen	size_4	f	t	2019-03-26	2019-01-24 18:52:53.637407	2019-01-24 18:52:53.637407	https://umzug-offerte-schweiz.com				
11	\N	de	Wachter	Dominic	mr	wachter.dominic@gmx.ch	+41764940103	St.Gallerstrasse 54a	9500	Wil	size_4	f	t	2019-04-23	2019-02-04 15:00:58.548031	2019-02-04 15:00:58.548031	https://umzug-offerte-schweiz.com				
12	\N	de	Mario	Stähli	mr	mario.staehli@gmail.com	+41798318655	Fiechtenstrasse 12	4950	Huttwil	size_3	f	t	2019-05-31	2019-03-29 07:53:57.357643	2019-03-29 07:53:57.357643	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	178.197.233.58
13	\N	de	Peter	Ryffe	mr	peter.ryffe@hispeed.ch	+41796562284	Breitenweg 46	3700	Spiez	size_4	f	t	2019-07-25	2019-04-02 06:31:18.998923	2019-04-02 06:31:18.998923	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/de/moving_inquiries/new	193.5.216.100
14	\N	de	Claudionor 	Barbosa Cavalcante	mr	patrick.loman@gmx.ch	+41799462608	Stockhornstrasse 21	3700	Spiez	size_4	f	t	2019-06-27	2019-04-07 09:49:19.944289	2019-04-07 09:49:19.944289	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/de/moving_inquiries/new	88.66.45.188
15	\N	de	Catia	Baioni	ms	cpbaioni@gmail.com	+41764058385	Dennikofenweg 77	3073	Gümligen	size_3	f	t	2019-07-31	2019-04-10 12:05:47.304282	2019-04-10 12:05:47.304282	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	212.103.89.244
16	\N	de	Roberta	Borg Bartolo	ms	rborgbartolo@gmail.com	+41768194224	Strasse, 2	6060	Sarnen	size_3	f	t	2019-06-27	2019-04-14 11:40:31.12652	2019-04-14 11:40:31.12652	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	84.226.43.4
17	\N	de	Nikitas	Gkikopoulos	mr	ngkikop@gmail.com	+41766854590	Gönhardweg 6	5000	Aarau	size_2	f	t	2019-07-30	2019-04-16 19:44:27.315099	2019-04-16 19:44:27.315099	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/en/thank-you/	https://forms.umzug-offerte-schweiz.com/	178.38.117.70
19	\N	de	Bedriye	Yavuz	ms	ro-ro@gmx.ch	+41796981848	Bleichestrasse 61	3066	Stettlen	size_4	f	t	2019-06-27	2019-06-25 23:17:53.860849	2019-06-25 23:17:53.860849	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/de/moving_inquiries/new	159.69.250.153
20	\N	de	Teresa	Markwalder	ms	redlawkram@bluemail.ch	+41787674444	Rue du Maupas 36B	1004	Lausanne	size_1	f	t	2019-10-30	2019-07-24 14:02:00.252178	2019-07-24 14:02:00.252178	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	159.69.250.153
21	\N	en	Rony	NEHME	mr	rony.nehme@gmail.com	+41767488148	Dorfgasse 16	8810	Horgen	size_1	f	t	2019-10-02	2019-08-30 07:32:52.461508	2019-08-30 07:32:52.461508	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/en/thank-you/	https://forms.umzug-offerte-schweiz.com/en/moving_inquiries/new	159.69.250.153
22	\N	de	Katharina	Wyss	ms	kwyss@bluewin.ch	+41794221731	Rätschengässli 49	8302	Kloten	size_5	f	t	2019-10-01	2019-09-13 20:19:00.850131	2019-09-13 20:19:00.850131	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	159.69.250.153
23	\N	fr	siham	houhou	ms	houhou.siham@gmail.com	+41786016573	reiterstrasse 17	3013	Berne	size_3	f	t	2020-01-30	2019-12-04 08:30:16.134454	2019-12-04 08:30:16.134454	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/fr/merci/	https://forms.umzug-offerte-schweiz.com/fr/moving_inquiries/new	159.69.250.153
24	\N	de	Roland	Glur	mr	roland.glur@gmx.ch	+41792456076	Oberemattstrasse 41	4133	Pratteln	size_3	f	t	2020-04-29	2019-12-26 09:07:47.213016	2019-12-26 09:07:47.213016	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	159.69.250.153
25	\N	de	Kathrin	Juste	ms	k@juste.li	+41767388700	Rebenweg 11	6331	Hünenberg	size_4	f	t	2020-03-11	2020-01-03 14:03:24.757442	2020-01-03 14:03:24.757442	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/reinigungs-offerte/	https://umzug-offerte-schweiz.com/vielen-dank/	159.69.250.153
26	\N	de	Julia	Binkert	ms	julia.binkert@gmail.com	+41764327738	Schaffhauserstrasse 139	8057	Zürich	size_2	f	t	2020-03-30	2020-01-08 11:28:02.043107	2020-01-08 11:28:02.043107	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/de/moving_inquiries/new	159.69.250.153
27	\N	de	Monika	Niederhofer	ms	monika@niederhofer.ch	+41767259424	Chemin du Fau Blanc 5	1009	Pully	size_3	f	t	2020-03-18	2020-01-30 06:38:36.459243	2020-01-30 06:38:36.459243	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	159.69.250.153
28	\N	de	Harald	Ruehsheim	mr	harald.r@bluewin.ch	+41792343526	Ringstrasse 18	9200	Gossau SG	size_2	f	t	2020-04-30	2020-01-31 15:35:12.513687	2020-01-31 15:35:12.513687	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/de/moving_inquiries/new	159.69.250.153
29	\N	de	Giuseppe	Cannella	mr	giuseppe.cannella@me.com	+41763820211	Althofstrasse 5	5432	Neuenhof	size_2	f	t	2020-05-29	2020-02-07 11:25:04.662107	2020-02-07 11:25:04.662107	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/reinigungs-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
30	\N	de	Karl	Oberhauser	mr	k.oberhauser@bluewin.ch	+41792865759	Terbinerstrasse 7	3930	Visp	size_3	f	t	2020-04-23	2020-02-09 17:40:57.946853	2020-02-09 17:40:57.946853	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/	https://forms.umzug-offerte-schweiz.com/	159.69.250.153
31	\N	de	Tamara	Trinkler	ms	trinkler_tamara95@hotmail.com	+41799126436	Kistlerstrasse 8	8864	Reichenburg	size_3	f	t	2020-05-29	2020-02-23 14:29:41.558137	2020-02-23 14:29:41.558137	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/reinigungs-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
32	\N	de	Annemarie	Tuor	ms	antuor@datazug.ch	+41792736107	Neudorfstr. 7	6312	Steinhausen	size_3	f	t	2020-08-26	2020-04-28 10:28:10.640411	2020-04-28 10:28:10.640411	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/vielen-dank/		159.69.250.153
\.


--
-- Data for Name: combined_inquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combined_inquiries (id, partner_token, locale, client_first_name, client_last_name, client_salutation, client_email, client_mobile, client_street_and_number, client_postal_code, client_property_size, client_city, moving_city, is_moving_request, is_cleaning_request, moving_street_and_number, moving_postal_code, moving_date, cleaning_date, created_at, updated_at, origin, hostname, path, referrer, ip) FROM stdin;
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, quarter, send_count, representation, created_at, updated_at) FROM stdin;
1	Q3 2018	1	/invoices/Q3 2018.pdf?debug=true	2018-09-07 12:00:00	2018-09-07 12:00:00
2	Q4 2018	1	/invoices/Q4 2018.pdf?debug=true	2019-01-11 07:38:12.855048	2019-01-11 07:38:12.855048
3	Q1 2019	2	/invoices/Q1 2019.pdf?debug=true	2019-04-17 11:44:01.135806	2019-05-04 03:44:01.238566
4	Q2 2019	1	/invoices/Q2 2019.pdf?debug=true	2019-08-05 15:10:35.255549	2019-08-05 15:10:35.255549
5	Q3 2019	2	/invoices/Q3 2019.pdf?debug=true	2019-10-08 16:06:40.73746	2019-10-18 06:29:54.19589
6	Q4 2019	1	/invoices/Q4 2019.pdf?debug=true	2020-01-21 17:15:34.036866	2020-01-21 17:15:34.036866
7	Q1 2020	1	/invoices/Q1 2020.pdf?debug=true	2020-04-10 13:48:20.882492	2020-04-10 13:48:20.882492
\.


--
-- Data for Name: moving_inquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moving_inquiries (id, partner_token, locale, client_first_name, client_last_name, client_salutation, client_email, client_mobile, client_street_and_number, client_postal_code, client_city, client_property_size, is_moving_request, is_cleaning_request, moving_street_and_number, moving_postal_code, moving_city, moving_date, created_at, updated_at, origin, hostname, path, referrer, ip) FROM stdin;
1	\N	de	Kirishanth	Kridaran	mr	kridaran@gmail.com	+41789744444	Rietliweg 3	9475	Sevelen	size_3	t	f	Konsumstrasse 3	9403	Goldach SG	2018-07-14	2018-07-04 12:48:45.425792	2018-07-04 12:48:45.425792	?	?	?	?	?
2	\N	de	Annemarie	Minder	ms	annemarie.furrer@gmail.com	+41793836917	Im-Hof 13	8606	Greifensee	size_2	t	f	Rossauerstrasse 36	8932	Mettmenstetten	2018-07-30	2018-07-06 14:37:03.841073	2018-07-06 14:37:03.841073	\N	\N	\N	\N	\N
3	\N	de	Samira	Fravi	ms	samira.fravi@gmail.com	+41763902600	Neunfornerstrasse 22	8475	Ossingen	size_1	t	f	Spinnereiplatz 1	8041	Zurich	2018-07-14	2018-07-13 03:35:57.64813	2018-07-13 03:35:57.64813	https://umzug-offerte-schweiz.com	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	213.127.82.210
4	\N	de	Tony	Zedel	mr	tony.zedel@gmail.com	+41787000075	Sägenstrasse 24	7000	Chur	size_4	t	f	Lauerzweg 3	6010	Kriens	2018-10-05	2018-07-17 15:00:54.352212	2018-07-17 15:00:54.352212	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/tag/umzug-offerte-schweiz/	10.50.243.11
5	\N	de	Julia	Kinner	ms	julia.kinner@gmx.ch	+41764264422	Reidholzstrasse 25	8805	Richterswil	size_4	t	f	Etzelstrasse 70	8712	Stäfa	2018-07-31	2018-07-22 14:16:31.672792	2018-07-22 14:16:31.672792	https://umzug-offerte-schweiz.com	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	194.230.159.221
6	\N	de	Dino	König	mr	Dino.koenig@bluewin.ch	+41767787665	Hauptstrasse 9	4147	Aesch (BL)	size_3	t	f	Wydengasse 7	2557	Studen	2018-08-17	2018-08-06 11:18:03.905638	2018-08-06 11:18:03.905638	https://umzug-offerte-schweiz.com	\N	\N	\N	\N
7	\N	de	Andrea	Zbinden	ms	a.zbinden@gmx.ch	+41793425718	Lorrainestrasse 62	3014	Bern	size_2	t	f	Gerbestrasse 32a	3072	Ostermundigen	2018-08-22	2018-08-13 12:16:16.800085	2018-08-13 12:16:16.800085	https://umzug-offerte-schweiz.com	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	217.192.234.3
8	\N	fr	Philippe	SIDLER	mr	philsidler4@gmail.com	+41788391519	Mythenquai 28	8002	Zürich	size_3	t	f	Munchenhaldenstrasse 7	8008	Zürich	2018-09-07	2018-08-23 17:45:49.45043	2018-09-04 04:02:31.546709	https://umzug-offerte-schweiz.com	\N	\N	\N	\N
13	\N	de	Susanne	Pollak	ms	s.pollak@bluewin.ch	+41792462142	Schluochrain 46c	7057	Langwies	size_2	t	f	Via Principale 2	7153	Falera	2018-12-10	2018-09-09 07:47:33.252148	2018-09-09 07:47:33.252148	https://umzug-offerte-schweiz.com				
14	\N	de	Patrizia	Münch	ms	patrizia.muench@gmail.com	+41765432567	Kirchstrasse 81	2540	Grenchen	size_1	t	f	Schmelzistrasse 11	2540	Grenchen	2018-09-24	2018-09-18 14:03:28.282742	2018-09-18 14:03:28.282742	https://umzug-offerte-schweiz.com				
15	\N	de	Annemarie	Bakker	ms	annemarie.justina@gmail.com	+41798477367	Unterbiel 55	4418	Reigoldswil	size_6	t	f	Mittlere Chläberen 6	4418	Reigoldswil	2018-11-17	2018-10-02 17:18:40.343553	2018-10-02 17:18:40.343553	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/kundenbewertungen/	85.0.88.100
16	\N	de	Gerda	Hablützel	ms	gerda.habluetzel@bluewin.ch	+41796738483	Grotzenmühlestrasse, 5b	8840	Einsiedeln	size_4	t	f	Grosserstrasse 66	8841	Gross	2019-01-26	2018-10-03 08:12:37.77132	2018-10-03 08:12:37.77132	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/		178.194.135.17
18	\N	en	narinard	tanvirat	ms	narinard@gmail.com	+41768225401	kronenstrasse 25	8006	zurich	size_3	t	f	neufeldstrasse 13	3012	Bern	2018-12-01	2018-10-06 15:47:05.395497	2018-10-06 15:47:05.395497	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/		80.218.138.158
19	\N	de	Dominique	Zwahlen	ms	conchini@gmx.ch	+41786333534	Dammweg 7	4922	Bützberg	size_3	t	f	Oberstockstrasse 4	6416	Steinerberg 	2018-11-30	2018-10-12 04:14:35.509712	2018-10-12 04:14:35.509712	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/		158.181.116.205
20	\N	de	Lukas	Keller	mr	keller.lukas@gmx.net	+41765083293	Dornacherstrasse 10	4053	Basel	size_2	t	f	Bachtelstrasse 33	8400	Winterthur	2018-11-30	2018-10-13 15:57:38.879835	2018-10-13 15:57:38.879835	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/		178.197.236.201
21	\N	de	Daniel	Weber	mr	daenu182@hotmail.com	+41792145091	Grabmattweg 6	3176	Neuenegg	size_2	t	f	Schwandenhubelstrasse 371	3098	Schliern b. Köniz	2018-11-26	2018-10-17 18:13:39.476958	2018-10-17 18:13:39.476958	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/		188.60.13.122
22	\N	de	M	GENDRE	ms	murielgendre@x-fly.ch	+41763323575	Badenerstr. 295	8003	Zürich	size_3	t	f	Brahmsstr. 90	8003	Zürich	2018-12-15	2018-11-01 20:02:41.301554	2018-11-01 20:02:41.301554	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	178.83.73.66
23	\N	de	David	Suter	mr	david.suter@gmx.ch	+41798139888	Josefstrasse 8	4133	Pratteln	size_1	t	f	Ifangweg 8	8610	Uster	2018-11-17	2018-11-07 18:44:49.727548	2018-11-07 18:44:49.727548	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	178.197.225.197
24	\N	en	Natalia	Zakharova	ms	zakharova@internexco.ch	+41796592217	Bernerstrasse 335	8952	Schlieren	size_3	t	f	Dorfgässli 2	6331	Hünenberg	2018-12-07	2018-11-08 13:54:17.20873	2018-11-08 13:54:17.20873	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	213.200.230.211
25	\N	de	Fabienne	Rusch	ms	fabienne.rusch@gmx.ch	+41762509780	Ochsenbeinstrasse 14	3008	Bern	size_2	t	f	Riehenring 18	4058	Basel	2018-12-13	2018-11-13 13:00:51.975304	2018-11-13 13:00:51.975304	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	84.226.78.211
26	\N	de	Stefanie	Seiler	ms	stefanieseiler@bluewin.ch	+41764977545	Schenkstrasse 31	3008	Bern	size_4	t	f	Scheuermattweg 29	3043	Uettligen	2018-12-21	2018-11-14 20:14:37.770251	2018-11-14 20:14:37.770251	https://umzug-offerte-schweiz.com				
27	\N	de	junho	zwahlen	mr	junhozwahlen0799155610@gmail.com	+41799155610	250 b	3762	Tahl	size_3	t	f	obere Bahnhofstrasse 2	3700	Spiez	2019-02-01	2018-11-29 07:19:18.408987	2018-11-29 07:19:18.408987	https://umzug-offerte-schweiz.com				
28	\N	de	Adrien	Clinard	mr	adrien.clinard@bluewin.ch	+41794438896	Anemonenstrasse 1	8047	Zürich	size_1	t	f	Altweg 18	8047	Zürich	2018-12-14	2018-11-29 19:21:43.934846	2018-11-29 19:21:43.934846	https://umzug-offerte-schweiz.com				
29	\N	de	Vincent	Clerc	mr	sushibar@bluewin.ch	+41792634488	Untere Mühlestrasse 4	8105	Regensdorf	size_4	t	f	Wattetstrasse 4	8105	Regensdorf	2019-03-22	2019-01-09 08:47:31.606183	2019-01-09 08:47:31.606183	https://umzug-offerte-schweiz.com				
30	\N	de	Roman	Widmer	mr	roman.widmer1@gmx.ch	+41792754200	Hofmannstrasse 19	8405	Winterthur	size_4	t	f	Bederstrasse 60	8002	Zürich	2019-03-31	2019-01-15 21:02:30.891187	2019-01-15 21:02:30.891187	https://umzug-offerte-schweiz.com				
31	\N	de	Matthias	Haene	mr	mhaene@zoho.com	+41787841910	Klingenstrasse 4	8005	Zürich	size_3	t	f	Schachenstrasse 148	8906	Bonstetten	2019-02-01	2019-01-17 23:05:12.36447	2019-01-17 23:05:12.36447					
32	\N	de	Stephan	Fandrey	mr	s.fandrey@googlemail.com	+41786040541	Äussere Grundstrasse 11	8910	Affoltern am Albis	size_4	t	f	Lettenstrasse 7	8916	Jonen	2019-05-04	2019-01-22 19:38:36.384848	2019-01-22 19:38:36.384848	https://umzug-offerte-schweiz.com				
33	\N	de	Cornel	Krämer	mr	cornel.kraemer@outlook.com	+41799392917	Im Grund 4	9553	Bettwiesen	size_4	t	f	Weinfelderstr. 32	8580	Amriswil	2019-03-01	2019-01-24 18:50:05.035799	2019-01-24 18:50:05.035799	https://umzug-offerte-schweiz.com				
34	\N	de	Dominic	Wachter	mr	wachter.dominic@gmx.ch	+41764940103	St.Gallerstrasse 54a	9500	Wil	size_4	t	f	Obere Bahnhofstrasse 45	9500	Wil	2019-04-16	2019-02-04 14:59:47.692474	2019-02-04 14:59:47.692474	https://umzug-offerte-schweiz.com				
35	\N	de	Zenno	Steiner	mr	zenosteiner@yahoo.de	+41791234567	Affolternstrasse 161	8050	Zürich	size_1	t	f	Gasometerstrasse 29	8005	Zürich	2019-03-15	2019-02-14 10:04:34.23697	2019-02-14 10:04:34.23697	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	82.197.167.134
36	\N	de	Andrea	Rebsamen	ms	andrea@rebsamen.net	+41792561612	Feldeggstrasse 46, Zürich	8008	Zürich	size_2	t	f	Florasstrasse 1,	8008	Zürich	2019-03-28	2019-03-01 10:11:23.507221	2019-03-01 10:11:23.507221	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	165.222.180.133
37	\N	de	Corinne	Lüdi	ms	corinne.luedi@gmx.ch	+41792347627	Wiessbadstr. 3	3006	Bern	size_3	t	f	Thunplatz 8	3006	Bern	2019-05-20	2019-03-13 09:50:25.450238	2019-03-13 09:50:25.450238	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/impressum/	79.140.126.30
38	\N	de	Adrian	Suter	mr	adrian.suter@wortrei.ch	+41763694417	Schmiedengasse 23	5012	Schönenwerd	size_6	t	f	Museggstrasse 15	6004	Luzern	2019-07-15	2019-03-25 14:00:46.891216	2019-03-25 14:00:46.891216	https://pwm-image.trendmicro.com				
39	\N	de	Mario	Stähli	mr	mario.staehli@gmail.com	+41798318655	Fiechtenstrasse 12	4950	Huttwil	size_1	t	f	Fiechtenstrasse 12	3111	Tägertschi	2019-05-25	2019-03-29 07:52:44.679918	2019-03-29 07:52:44.679918	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	178.197.233.58
45	\N	de	Ryffe	Peter	mr	peter.ryffe@hispeed.ch	+41796562284	Breitenweg 46	3700	Spiez	size_4	t	f	Ahorniweg 41	3700	Spiez	2019-07-18	2019-04-02 06:29:51.819205	2019-04-02 06:29:51.819205	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	193.5.216.100
46	\N	de	Claudionor	Barbosa Cavalcante	mr	patrick.loman@gmx.ch	+41799462608	Stockhornstrasse 21	3700	Spiez	size_4	t	f	Erlenmattstrasse 81	4058	Basel	2019-06-18	2019-04-07 09:48:16.720929	2019-04-07 09:48:16.720929	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	88.66.45.188
47	\N	de	Tobias	Straka	mr	tobias@straka.ch	+41799352473	Saumstrasse 14	8003	Zürich	size_2	t	f	Schmiedenstrasse 34	8840	Einsiedeln	2019-05-21	2019-04-09 09:19:40.327429	2019-04-09 09:19:40.327429	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	212.203.120.1
48	\N	de	Catia	Baioni	ms	cpbaioni@gmail.com	+41764058385	Tannackerstrasse 8a	3073	Gümligen	size_3	t	f	Dennikofenweg 77	3073	Gümligen	2019-07-26	2019-04-10 12:05:14.153289	2019-04-10 12:05:14.153289	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	212.103.89.244
49	\N	de	Werner	Rechberger	mr	w.rechberger@gmx.ch	+41799543411	Neuhauserstrasse 50	8500	Frauenfeld	size_3	t	f	Am Stadtbach 7a	8500	Frauenfeld	2019-05-22	2019-04-12 11:42:37.409551	2019-04-12 11:42:37.409551	https://umzug-offerte-schweiz.com				
50	\N	de	Roberta	Borg Bartolo	ms	rborgbartolo@gmail.com	+41768194224	Strasse, 2	6060	Sarnen	size_3	t	f	Tramweg 41	6414	Oberarth	2019-06-22	2019-04-14 11:39:12.635777	2019-04-14 11:39:12.635777	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	84.226.43.4
51	\N	en	Nikitas	Gkikopoulos	mr	ngkikop@gmail.com	+41766854590	Gönhardweg 6	5000	Aarau	size_2	t	f	Blauäcker 12	8051	Zürich	2019-06-29	2019-04-16 19:43:53.608676	2019-04-16 19:43:53.608676	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	178.38.117.70
53	\N	de	Raquel 	Correia 	ms	raquel.correia.de@outlook.com	+41794559123	Wolhausenstrasse 23	8910	Affoltern am Albis 	size_1	t	f	Schürbachstrasse 9	8134	Adliswil 	2019-06-14	2019-05-02 19:40:45.821818	2019-05-02 19:40:45.821818	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	85.0.182.167
54	\N	de	Damian	Breu	mr	gaston1@gmx.ch	+41793420160	Freiburgstrasse 161	3008	Bern	size_3	t	f	Brückfeldstrasse 37	3012	Bern	2019-06-25	2019-05-20 15:48:16.627327	2019-05-20 15:48:16.627327	https://umzug-offerte-schweiz.com				
55	\N	de	magdalena	majorek	ms	lena24@gmx.ch	+41793180920	bodenholzstrasse 55	8340	hadlikon	size_1	t	f	dorfn 16	3754	diemtigen	2019-06-28	2019-05-25 18:36:57.877923	2019-05-25 18:36:57.877923	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/region/spiez/	https://umzug-offerte-schweiz.com/	178.238.173.65
56	\N	de	Britta	Kaula	ms	bkaula@gmail.com	+41794084004	Albulastrasse 81	7411	Sils i.D.	size_5	t	f	Fabrikstrasse 1	8887	Mels	2019-09-17	2019-06-07 08:04:13.109897	2019-06-07 08:04:13.109897	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
57	\N	de	Nilde 	Nanchen 	ms	nilden@netplus.ch	+41792863078	Chemin des Cigales 27 	1907	Saxon	size_4	t	f	Rue de l'autoroute 26	1907	Saxon	2019-06-25	2019-06-15 00:29:14.118424	2019-06-15 00:29:14.118424	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/gebiet/siders/	159.69.250.153
58	\N	de	Hans-Rudolf	Schenker	mr	hr.schenker@pro9.ch	+41779911717	Riedbachstrasse 51	3027	Bern-Bethlehem	size_1	t	f	Sägestrasse 78	3098	Köniz	2019-07-03	2019-06-21 16:53:45.138692	2019-06-21 16:53:45.138692	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/region/bern/	https://umzug-offerte-schweiz.com/impressum/	159.69.250.153
59	\N	de	Bedriye	Yavuz	ms	ro-ro@gmx.ch	+41796981848	Bleichestrasse 61	3066	Stettlen	size_4	t	f	Oberdorf 1	6345	Neuheim	2019-07-26	2019-06-25 23:16:20.618645	2019-06-25 23:16:20.618645	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
60	\N	de	Claude	Fuhrer	mr	elu2710@bluewin.ch	+41791532884	Rue de la Paix 31	2720	Tramelan	size_3	t	f	Bärenburg 132	7440	Andeer	2019-07-24	2019-07-02 17:57:51.567681	2019-07-02 17:57:51.567681	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
61	\N	de	Ver	Portmann	ms	vpormann@norgine.com	+41798901440	Medius AG Neue Bahnhofstrasse 160 	4132	Muttenz	size_1	t	f	SpePharm AG Werftestrasse 3	6005	Luzern	2019-07-24	2019-07-09 07:18:43.996912	2019-07-09 07:18:43.996912	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
62	\N	en	stuart 	sims	mr	stuart.sims@hotmail.com	+41791744201	kehlhofstrasse 16	8003	Zurich	size_3	t	f	lessingstrasse 17	8002	Zurich 	2019-07-27	2019-07-12 14:56:34.96511	2019-07-12 14:56:34.96511	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/en/quotes-for-moving-within-switzerland/		159.69.250.153
63	\N	de	Teresa	Markwalder	ms	redlawkram@bluemail.ch	+41787674444	Rue du Maupas 36B	1004	Lausanne	size_1	t	f	Käferholzstrasse 54	8057	Zürich	2019-10-30	2019-07-24 14:00:13.629832	2019-07-24 14:00:13.629832	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
64	\N	de	Monika	Schmid	ms	Schmidmonika029@gmail.com	+41786754321	Josefstrasse 1	8000	Zürich 	size_5	t	f	Imgaicker 1	8000	Zürich 	2019-08-30	2019-08-12 19:21:06.846486	2019-08-12 19:21:06.846486	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/kontakt/	159.69.250.153
65	\N	de	Jacqueline	Clerc	ms	jade32@bluewin.ch	+41798239946	Lufingerstrasse 48	8185	Winkel	size_2	t	f	Mülibachstr. 7	8185	Winkel	2019-10-03	2019-08-14 12:23:35.959796	2019-08-14 12:23:35.959796	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
66	\N	de	Gabriela	Mugglin	ms	gabriela.mugglin@gmail.com	+41795413253	Mittelholzerstrasse, 12	3006	Bern	size_3	t	f	Wiesenstrasse 12	3072	Ostermundigen	2019-09-07	2019-08-27 20:18:14.752613	2019-08-27 20:18:14.752613	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
67	\N	en	Rony	NEHME	mr	rony.nehme@gmail.com	+41767488148	Dorfgasse 16	8810	Horgen	size_1	t	f	Neudorfstrasse 58	8810	Horgen	2019-10-01	2019-08-30 07:31:31.29378	2019-08-30 07:31:31.29378	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/region/horgen		159.69.250.153
68	\N	de	Katharina	Wyss	ms	kwyss@bluewin.ch	+41794221731	Rätschengässli 49	8302	Kloten	size_1	t	f	Hauptstrasse 48	3917	Kippel	2019-10-14	2019-09-13 20:17:42.482911	2019-09-13 20:17:42.482911	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/region/basel/	https://umzug-offerte-schweiz.com/region/buelach/	159.69.250.153
69	\N	de	flavia	schütz	ms	f_sch@gmx.ch	+41766678931	rue karl-stauffer 18	2502	bienne	size_3	t	f	albrecht-hallerstrasse, 12	2502	bienne	2019-10-25	2019-09-19 07:29:52.311594	2019-09-19 07:29:52.311594	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
70	\N	de	Arik	Schweiger	mr	arikschweiger@outlook.com	+41786998681	Suurstoffi 29	6343	Rotkreuz	size_3	t	f	Suurstoffi 37	6343	Rotkreuz	2019-11-20	2019-10-05 14:14:31.233881	2019-10-05 14:14:31.233881	https://forms.umzug-offerte-schweiz.com				
71	\N	de	Stephan	Burri	mr	stephan.burri@gmail.com	+41799457342	Pappelnweg 32	4310	Rheinfelden	size_2	t	f	Aufwiesenstrasse 14	8305	Dietlikon	2019-11-06	2019-10-21 20:40:15.65936	2019-10-21 20:40:15.65936	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
72	\N	de	Tobias	Heer	mr	heto@posteo.ch	+41788820581	Haltingerstrasse 31	4057	Basel	size_1	t	f	St. Alban Vorstadt 63	4052	Basel	2019-11-15	2019-10-25 07:51:21.368679	2019-10-25 07:51:21.368679	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
73	\N	de	Manu	Duwe	ms	manu.duwe@googlemail.com	+41799173718	Winkelstrasse 6	9464	Rüthi	size_3	t	f	Unterdorfstrasse 90 	9443	Widnau	2019-11-28	2019-10-28 15:46:54.500028	2019-10-28 15:46:54.500028	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
74	\N	de	Guido	Vogt	mr	guido.vogt70@gmail.com	+41799177705	Stationsstrasse 23 a	8604	Volketswil	size_3	t	f	in der Höh 48	8604	Volketswil	2020-02-27	2019-11-11 11:02:51.099885	2019-11-11 11:02:51.099885	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
75	\N	de	Stefan	Werly	mr	s.werly@bluewin.ch	+41789080801	10 Rebenweg	5213	Villnachern	size_3	t	f	Muristrasse 17	5628	Aristau	2019-12-19	2019-11-17 13:24:10.188663	2019-11-17 13:24:10.188663	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
76	\N	de	Susanne	Schenzle	ms	Schenzle@gmx.ch	+41797686376	Grubenackerstrasse 80	8052	Zürich	size_2	t	f	Friesenbergstrasse 17	8055	Zürich	2020-01-03	2019-11-25 14:31:58.73552	2019-11-25 14:31:58.73552	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
77	\N	de	Gabriela	Kingué	ms	gaby.kingue@sunrise.ch	+41764402886	Grindelstrasse 59	8604	Volketswil	size_2	t	f	Hagenholzstrasse 73	8602	Kloten	2019-12-20	2019-12-02 18:20:02.987821	2019-12-02 18:20:02.987821	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
78	\N	fr	siham	houhou	ms	houhou.siham@gmail.com	+41786016573	reiterstrasse 17	3013	berne	size_3	t	f	weltpostrasse  3	3015	berne	2020-01-29	2019-12-04 08:29:09.919557	2019-12-04 08:29:09.919557	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/kundenbewertungen/	159.69.250.153
79	\N	de	Roland	Glur	mr	roland.glur@gmx.ch	+41792456076	Oberemattstrasse, 41	4133	Pratteln	size_3	t	f	Burgallee 1	6247	Schötz	2020-04-28	2019-12-26 09:07:07.410124	2019-12-26 09:07:07.410124	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
80	\N	de	Hayley	Van de Glind 	ms	hayley_van_de_glind@hotmail.com	+41798524013	Seestrasse 34b	8806	Bäch	size_3	t	f	Alte Landstrasse 30	8803	Rüschlikon	2020-01-18	2019-12-28 12:54:07.27676	2019-12-28 12:54:07.27676	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/ortschaft/kuessnacht/	https://www.google.ch/	159.69.250.153
81	\N	de	Kathrin	Juste	ms	k@juste.li	+41767388700	Rebenweg 11	6331	Hünenberg	size_4	t	f	Rheinfallstrasse 11	8447	Dachsen	2020-03-11	2020-01-03 14:02:18.402433	2020-01-03 14:02:18.402433	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
82	\N	de	Julia	Binkert	ms	julia.binkert@gmail.com	+41764327738	Schaffhauserstrasse 139	8057	Zürich	size_2	t	f	Langacherstrasse 10	8932	Mettmenstetten	2020-03-21	2020-01-08 11:27:04.342772	2020-01-08 11:27:04.342772	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
83	\N	de	Jennifer	Brunner	ms	jennifer.estella85@gmail.com	+41764741738	Seemättlistrasse 6	4132	Muttenz 	size_1	t	f	Genossenschaftsstrasse 5	4132	Muttenz 	2020-02-25	2020-01-22 10:33:19.635378	2020-01-22 10:33:19.635378	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
84	\N	de	Monika	Niederhofer	ms	monika@niederhofer.ch	+41767259424	Chemin du Fau Blanc 5	1009	Pully	size_3	t	f	Turmstrasse 3	4566	Halten	2020-03-17	2020-01-30 06:37:33.701403	2020-01-30 06:37:33.701403	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
85	\N	de	Harald	Ruehsheim	mr	harald.r@bluewin.ch	+41792343526	Ringstrasse 18	9200	Gossau SG	size_1	t	f	St.Gallerstrasse 118	9200	Gossau SG	2020-04-30	2020-01-31 15:33:43.79274	2020-01-31 15:33:43.79274	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
86	\N	de	Karl	Oberhauser	mr	k.oberhauser@bluewin.ch	+41792865759	Terbinerstrasse 7	3930	Visp	size_3	t	f	Brückenweg 12b	3930	Visp	2020-04-23	2020-02-09 17:40:08.961862	2020-02-09 17:40:08.961862	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
87	\N	de	Tamara	Trinkler	ms	trinkler_tamara95@hotmail.com	+41799126436	Kistlerstrasse 8	8864	Reichenburg	size_3	t	f	Säntisstrasse 7	8854	Siebnen	2020-05-29	2020-02-23 14:31:58.645034	2020-02-23 14:31:58.645034	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
88	\N	de	Sihan	Hamdo	ms	sihan.hamdo@hotmail.ch	+41786729477	Im wilacker 21	4106	Therwil	size_2	t	f	Baslerstrasse 11	4106	Therwil	2020-04-20	2020-03-09 12:10:56.665923	2020-03-09 12:10:56.665923	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
89	\N	en	Emma	Brooksbank	ms	ebrooksbank@hotmail.com	+41788006712	Badenerstrasse 26	8952	Schlieren	size_3	t	f	Badenerstrasse 26	8952	Schlieren	2020-04-27	2020-04-09 15:54:52.129495	2020-04-09 15:54:52.129495	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/en/quotes-for-moving-within-switzerland/		159.69.250.153
90	\N	de	Linda	von Euw	ms	linda.voneuw@gmail.com	+41789456926	Kesslerstrasse 9	8952	Schlieren	size_3	t	f	Sandweidstrasse 2	5634	Merenschwand	2020-06-26	2020-04-12 16:45:22.197063	2020-04-12 16:45:22.197063	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
91	\N	de	Walter	Berger	mr	walter.berger@gmx.ch	+41786530102	Fichtenweg 12	9470	Buchs	size_4	t	f	Weiligstrasse 50	7310	Bad Ragaz	2020-06-15	2020-04-20 13:11:01.818326	2020-04-20 13:11:01.818326	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
92	\N	de	Burger	Roger	mr	bg.roger@bluewin.ch	+41796872830	Buchacker 94	5058	Wiliberg	size_2	t	f	Apfelweg 6	5053	Staffelbach	2020-06-12	2020-04-22 07:23:44.700577	2020-04-22 07:23:44.700577	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/region/oftringen/	159.69.250.153
93	\N	de	Annemarie	Tuor	ms	antuor@datazug.ch	+41792736107	Neudorfstrassee 7	6312	Steinhausen	size_3	t	f	Via Lucmagn 8	7180	Disentis	2020-08-24	2020-04-28 10:14:55.654688	2020-04-28 10:14:55.654688	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
94	\N	en	Anja	Knab	ms	anjaknab@hotmail.com	+41755555555	Eichstrasse 20	8045	Zürich	size_2	t	f	Avenue de l'Europe 20	1700	Fribourg	2020-07-01	2020-05-04 16:05:48.878296	2020-05-04 16:05:48.878296	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
95	\N	de	Anja	Knab	ms	anjaknab@hotmail.com	+41755555555	Eichstrasse 20	8045	Zürich	size_2	t	f	Im Tiergarten 50	8055	Zürich	2020-07-01	2020-05-05 14:22:30.528143	2020-05-05 14:22:30.528143	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
96	\N	en	Anja	Knab	ms	anjaknab@hotmail.com	+41755555555	Eichstrasse 20	8045	Zürich	size_2	t	f	Im Tiergarten 50	8055	Zürich	2020-07-01	2020-05-05 14:31:24.338132	2020-05-05 14:31:24.338132	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
97	\N	de	Freskim	Ramushi	mr	freskim.ramushi@hotmail.com	+41786772119	Ackerstrasse 25	4057	Basel	size_3	t	f	Hammerstrasse 176	4057	Basel	2020-07-07	2020-05-06 10:12:12.587293	2020-05-06 10:12:12.587293	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
98	\N	de	Dior	Dieng	ms	dior.senegal@bluewin.ch	+41794773216	Tobelstrasse 22	8127	Forch	size_3	t	f	Wassbergstrasse 37	8127	Forch	2020-06-01	2020-05-07 13:14:12.414957	2020-05-07 13:14:12.414957	https://umzug-offerte-schweiz.com	umzug-offerte-schweiz.com	/umzug-offerte/	https://umzug-offerte-schweiz.com/	159.69.250.153
\.


--
-- Data for Name: received_inquiry_responses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.received_inquiry_responses (id, moving_inquiry_id, cleaning_inquiry_id, combined_inquiry_id, response_body, created_at, updated_at, quarter) FROM stdin;
1	1	\N	\N	{"id": 119589, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 85296, "client_sex": "male", "partner_id": null, "client_city": "Sevelen", "flow_status": "step_2", "moving_city": "Goldach SG", "moving_date": "2018-07-14", "client_email": "kridaran@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/6cb867e8a13c846526c5f585fbf1801e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzA3MDg1MjcuMjMzMTc5fQ.spXa_UeBRm9h1uvYOG6S-j59_DTO4JwKEIDiywVu2Ac&authorization_token=6cb867e8a13c846526c5f585fbf1801e&inquiry_id=119589", "cleaning_date": null, "client_mobile": "078 974 44 44", "original_kind": "moving", "client_last_name": "Kridaran", "client_first_name": "Kirishanth", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 9475, "moving_postal_code": 9403, "authorization_token": "6cb867e8a13c846526c5f585fbf1801e", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Rietliweg 3", "moving_street_and_number": "Konsumstrasse 3"}	2018-07-04 12:48:47.804611	2018-08-28 15:51:58.343915	Q3 2018
2	2	\N	\N	{"id": 119994, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 85668, "client_sex": "female", "partner_id": null, "client_city": "Greifensee", "flow_status": "step_2", "moving_city": "Mettmenstetten", "moving_date": "2018-07-30", "client_email": "annemarie.furrer@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/1735691a81501a422122711e26c646a7/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzA4ODc4MjYuMjUwMzU2NH0.fA-rKVdY8iBlu8RW1pP1rXWbwIZpwEFoVFc4CvM6I4M&authorization_token=1735691a81501a422122711e26c646a7&inquiry_id=119994", "cleaning_date": null, "client_mobile": "079 383 69 17", "original_kind": "moving", "client_last_name": "Minder", "client_first_name": "Annemarie", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8606, "moving_postal_code": 8932, "authorization_token": "1735691a81501a422122711e26c646a7", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Im Hof 13", "moving_street_and_number": "Rossauerstrasse 36"}	2018-07-06 14:37:06.85117	2018-08-28 15:51:58.346423	Q3 2018
3	3	\N	\N	{"id": 121090, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 86274, "client_sex": "female", "partner_id": null, "client_city": "Ossingen", "flow_status": "step_2", "moving_city": "Zurich", "moving_date": "2018-07-14", "client_email": "samira.fravi@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/66cc3abd5bc349393c7a2c2f1a717ff1/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzE0NTI5NTkuODk0MDQxOH0.Mk1f2XdXBQzyXISGUuWivSFa8dijYIfpeDZQEeTlBcU&authorization_token=66cc3abd5bc349393c7a2c2f1a717ff1&inquiry_id=121090", "cleaning_date": null, "client_mobile": "076 390 26 00", "original_kind": "moving", "client_last_name": "Fravi", "client_first_name": "Samira", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8475, "moving_postal_code": 8041, "authorization_token": "66cc3abd5bc349393c7a2c2f1a717ff1", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Neunfornerstrasse 22", "moving_street_and_number": "Spinnereiplatz 1"}	2018-07-13 03:36:00.661703	2018-08-28 15:51:58.348573	Q3 2018
4	4	\N	\N	{"id": 122718, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 87808, "client_sex": "female", "partner_id": null, "client_city": "Richterswil", "flow_status": "step_2", "moving_city": "Stafa", "moving_date": "2018-07-31", "client_email": "julia.kinner@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/89284a3a87895dbb8fbba591564ffadc/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzIyNjg5OTUuNTA2NDUwMn0.oAr-nvc7KD3ZyaM4mV9L9W4fGqvuUjTDxlh_hgSgnxE&authorization_token=89284a3a87895dbb8fbba591564ffadc&inquiry_id=122718", "cleaning_date": null, "client_mobile": "076 426 44 22", "original_kind": "moving", "client_last_name": "Kinner", "client_first_name": "Julia", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8805, "moving_postal_code": 8712, "authorization_token": "89284a3a87895dbb8fbba591564ffadc", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Reidholzstrasse 25", "moving_street_and_number": "Etzelstrasse 70"}	2018-07-22 14:16:36.312968	2018-08-28 15:51:58.354433	Q3 2018
5	5	\N	\N	{"id": 121880, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 87152, "client_sex": "male", "partner_id": null, "client_city": "Chur", "flow_status": "step_2", "moving_city": "Kriens", "moving_date": "2018-10-05", "client_email": "tony.zedel@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/e06b45c87f9b2e5d7573ac6505de3821/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzE4Mzk2NTkuNzgyNTUwOH0.cGZHmy42dyM12IrDB0v197jtzGZKIR8yJJPEpenys8k&authorization_token=e06b45c87f9b2e5d7573ac6505de3821&inquiry_id=121880", "cleaning_date": null, "client_mobile": "078 700 00 75", "original_kind": "moving", "client_last_name": "Zedel", "client_first_name": "Tony", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 7000, "moving_postal_code": 6010, "authorization_token": "e06b45c87f9b2e5d7573ac6505de3821", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Sägenstrasse 24", "moving_street_and_number": "Lauerzweg 3"}	2018-07-17 15:01:00.635356	2018-08-28 15:51:58.350709	Q3 2018
6	\N	1	\N	{"id": 122722, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 87808, "client_sex": "female", "partner_id": null, "client_city": "Richterswil", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "julia.kinner@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/43da14f07129c40c023ec9a5aa91badc/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzIyNjkwOTYuNTUwMTY0fQ.nXsngzscNs0CCxEJwcG2d3KWDV_EFCJNiPBYk23ieV0&authorization_token=43da14f07129c40c023ec9a5aa91badc&inquiry_id=122722", "cleaning_date": "2018-07-31", "client_mobile": "076 425 44 22", "original_kind": "cleaning", "client_last_name": "kinner", "client_first_name": "julia", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 8805, "moving_postal_code": null, "authorization_token": "43da14f07129c40c023ec9a5aa91badc", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Reidholzstrasse 25", "moving_street_and_number": null}	2018-07-22 14:18:16.796798	2018-08-28 15:51:58.356407	Q3 2018
7	6	\N	\N	{"id": 125105, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 15582, "client_sex": "male", "partner_id": null, "client_city": "Aesch (BL)", "flow_status": "step_2", "moving_city": "Studen", "moving_date": "2018-08-17", "client_email": "dino.koenig@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/17271c3f246a6b0f31cc1e30c59dd2cd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzM1NTQyODcuODM2NTg4NH0.DIAWTKQkiaUJ_u1s51t6eEgycoi-SQ5aPjtUkGvNaTc&authorization_token=17271c3f246a6b0f31cc1e30c59dd2cd&inquiry_id=125105", "cleaning_date": null, "client_mobile": "076 778 76 65", "original_kind": "moving", "client_last_name": "König", "client_first_name": "Dino", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4147, "moving_postal_code": 2557, "authorization_token": "17271c3f246a6b0f31cc1e30c59dd2cd", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Hauptstrasse 9", "moving_street_and_number": "Wydengasse 7"}	2018-08-06 11:18:08.535113	2018-08-28 15:51:58.358494	Q3 2018
8	7	\N	\N	{"id": 126636, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 12610, "client_sex": "female", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": "Ostermundigen", "moving_date": "2018-08-22", "client_email": "a.zbinden@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/0b2ce44008ca729372a0ef65ae6254dd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzQyMTA3NzguNTYyMDIzNH0.R1RlrBXbV0yKMc-tOIfIm4fKrsppjwBloybP6unLP_4&authorization_token=0b2ce44008ca729372a0ef65ae6254dd&inquiry_id=126636", "cleaning_date": null, "client_mobile": "079 342 57 18", "original_kind": "moving", "client_last_name": "Zbinden", "client_first_name": "Andrea", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3014, "moving_postal_code": 3072, "authorization_token": "0b2ce44008ca729372a0ef65ae6254dd", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Lorrainestrasse 62", "moving_street_and_number": "Gerbestrasse 32a"}	2018-08-14 01:39:38.986667	2018-08-28 15:51:58.361031	Q3 2018
9	8	\N	\N	{"id": 128605, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 92300, "client_sex": "male", "partner_id": null, "client_city": "Zurich", "flow_status": "step_2", "moving_city": "Zurich", "moving_date": "2018-09-07", "client_email": "philsidler4@gmail.com", "continue_url": "https://customers.movu.ch/fr/inquiries/c3826e7a508fb42302e2e67fcad4ba23/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzUwNDYzNTQuMDM5MjI3Mn0.CPGdxoudz2CijrlV7q-sGj8RgP7iAAiQlKdx21pehJs&authorization_token=c3826e7a508fb42302e2e67fcad4ba23&inquiry_id=128605", "cleaning_date": null, "client_mobile": "078 839 15 19", "original_kind": "moving", "client_last_name": "SIDLER", "client_first_name": "Philippe", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8002, "moving_postal_code": 8008, "authorization_token": "c3826e7a508fb42302e2e67fcad4ba23", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Mythenquai 28", "moving_street_and_number": "Munchenhaldenstrasse 7"}	2018-08-23 17:45:55.05851	2018-08-28 15:51:58.365546	Q3 2018
14	13	\N	\N	{"id": 131645, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 94622, "client_sex": "female", "partner_id": null, "client_city": "Langwies", "flow_status": "step_2", "moving_city": "Falera", "moving_date": "2018-12-10", "client_email": "s.pollak@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/53e214329221820aacee57f254fd91f3/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzY0NzkyNTYuNjg2NjU1M30.pQlpVwOCBhEzoyx3nrakA0cog1myihXVhadqp6L8N2o&authorization_token=53e214329221820aacee57f254fd91f3&inquiry_id=131645", "cleaning_date": null, "client_mobile": "079 246 21 42", "original_kind": "moving", "client_last_name": "Pollak", "client_first_name": "Susanne", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 7057, "moving_postal_code": 7153, "authorization_token": "53e214329221820aacee57f254fd91f3", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Schluochrain 46c", "moving_street_and_number": "Via Principale 2"}	2018-09-09 07:47:37.738329	2018-09-19 00:26:18.531638	Q4 2018
15	\N	2	\N	{"id": 133146, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 95799, "client_sex": "female", "partner_id": null, "client_city": "Nottwil", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "melanie.schacher@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/790d932ff39a08d39ebc5361fccfb5fd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzcxNzIxNDguOTE2OTExOH0.5_Upof2MkYLTpacpObAVy_XZCtTwi8adSXJ-eOJ-pns&authorization_token=790d932ff39a08d39ebc5361fccfb5fd&inquiry_id=133146", "cleaning_date": "2018-11-23", "client_mobile": "079 661 31 10", "original_kind": "cleaning", "client_last_name": "Müller–Schacher", "client_first_name": "Melanie", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 6207, "moving_postal_code": null, "authorization_token": "790d932ff39a08d39ebc5361fccfb5fd", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Obereystrasse 2", "moving_street_and_number": null}	2018-09-17 08:15:49.631032	2018-09-19 00:26:19.040203	Q4 2018
16	14	\N	\N	{"id": 133585, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 96128, "client_sex": "female", "partner_id": null, "client_city": "Grenchen", "flow_status": "step_2", "moving_city": "Grenchen", "moving_date": "2018-09-24", "client_email": "patrizia.muench@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/8c72cb602046706f263e263dfc6f8ffb/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzczMDg4NjYuNzAyNDI2Mn0.5yfw4K87uss4aSIAG50FeCZjnw-iE-hVej4kcH6iCDk&authorization_token=8c72cb602046706f263e263dfc6f8ffb&inquiry_id=133585", "cleaning_date": null, "client_mobile": "076 543 25 67", "original_kind": "moving", "client_last_name": "Münch", "client_first_name": "Patrizia", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 2540, "moving_postal_code": 2540, "authorization_token": "8c72cb602046706f263e263dfc6f8ffb", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Kirchstrasse 81", "moving_street_and_number": "Schmelzistrasse 11"}	2018-09-18 22:14:27.211125	2018-09-19 00:26:19.052135	Q4 2018
17	15	\N	\N	{"id": 136062, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 97953, "client_sex": "female", "partner_id": null, "client_city": "Reigoldswil", "flow_status": "step_2", "moving_city": "Reigoldswil", "moving_date": "2018-11-17", "client_email": "annemarie.justina@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/a7dffd6dedd7b364a809d7a68f28e821/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzg1MDA3MjQuNDM5MDY4Nn0.3tvg7X79vN2izOhUTf9ZIDjWof4UbiaXx8JTvoYnszU&authorization_token=a7dffd6dedd7b364a809d7a68f28e821&inquiry_id=136062", "cleaning_date": null, "client_mobile": "079 847 73 67", "original_kind": "moving", "client_last_name": "Bakker", "client_first_name": "Annemarie", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 4418, "moving_postal_code": 4418, "authorization_token": "a7dffd6dedd7b364a809d7a68f28e821", "is_cleaning_request": false, "client_property_size": "size_6", "client_street_and_number": "Unterbiel 55", "moving_street_and_number": "Mittlere Chläberen 6"}	2018-10-02 17:18:45.205779	2018-10-02 17:18:45.205779	Q4 2018
18	16	\N	\N	{"id": 136161, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 98032, "client_sex": "female", "partner_id": null, "client_city": "Einsiedeln", "flow_status": "step_2", "moving_city": "Gross", "moving_date": "2019-01-26", "client_email": "gerda.habluetzel@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/af45072134530989f6e8bd3a46e4e4a4/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzg1NTQzNjEuNTY2ODEyOH0.WOFtWzkXgdY6LH7KTy0MEtccVFKU-8HZPAHcE3LN6Kk&authorization_token=af45072134530989f6e8bd3a46e4e4a4&inquiry_id=136161", "cleaning_date": null, "client_mobile": "079 673 84 83", "original_kind": "moving", "client_last_name": "Hablützel", "client_first_name": "Gerda", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8840, "moving_postal_code": 8841, "authorization_token": "af45072134530989f6e8bd3a46e4e4a4", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Grotzenmühlestrasse, 5b", "moving_street_and_number": "Grosserstrasse 66"}	2018-10-03 08:12:42.273713	2018-10-03 08:12:42.273713	Q4 2018
19	\N	3	\N	{"id": 136162, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 98032, "client_sex": "female", "partner_id": null, "client_city": "Einsiedeln", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "gerda.habluetzel@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/770983c05cd6f72f1a84bd251f7328e4/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzg1NTQ0MDkuOTY0MjIyMn0.WyhxQZc0Cz-Bwf1v3t22ar-nEc9WGGCMZ-OxmvEHyjk&authorization_token=770983c05cd6f72f1a84bd251f7328e4&inquiry_id=136162", "cleaning_date": "2019-01-28", "client_mobile": "079 673 84 83", "original_kind": "cleaning", "client_last_name": "Hablützel", "client_first_name": "Gerda", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 8840, "moving_postal_code": null, "authorization_token": "770983c05cd6f72f1a84bd251f7328e4", "is_cleaning_request": true, "client_property_size": "size_1", "client_street_and_number": "Grotzenmühlestrasse, 5b", "moving_street_and_number": null}	2018-10-03 08:13:30.256202	2018-10-03 08:13:30.256202	Q4 2018
21	18	\N	\N	{"id": 136679, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 98426, "client_sex": "female", "partner_id": null, "client_city": "zurich", "flow_status": "step_2", "moving_city": "Bern", "moving_date": "2018-12-01", "client_email": "narinard@gmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/5368cd11dfcdc233be1fc2b04ddc2ee4/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzg4NDA4MzMuNjA1NTM0OH0.yXrpYA5RzC0UV_O1kBdNH97yEZl7PDP0ffoos0xHSyA&authorization_token=5368cd11dfcdc233be1fc2b04ddc2ee4&inquiry_id=136679", "cleaning_date": null, "client_mobile": "076 822 54 01", "original_kind": "moving", "client_last_name": "tanvirat", "client_first_name": "narinard", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8006, "moving_postal_code": 3012, "authorization_token": "5368cd11dfcdc233be1fc2b04ddc2ee4", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "kronenstrasse 25", "moving_street_and_number": "neufeldstrasse 13"}	2018-10-06 15:47:14.235262	2018-10-06 15:47:14.235262	Q4 2018
22	19	\N	\N	{"id": 137684, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 80001, "client_sex": "female", "partner_id": null, "client_city": "Bützberg", "flow_status": "step_2", "moving_city": "Steinerberg ", "moving_date": "2018-11-30", "client_email": "conchini@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/d55ce95282ecfb1e9703db4fa5257076/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzkzMTc2ODAuODMzNjQ5Mn0.s8jyCbm1RfXuMAsTP1XsW1RZQYGZbcuWU3M3vqHkBLA&authorization_token=d55ce95282ecfb1e9703db4fa5257076&inquiry_id=137684", "cleaning_date": null, "client_mobile": "078 633 35 34", "original_kind": "moving", "client_last_name": "Zwahlen", "client_first_name": "Dominique", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 4922, "moving_postal_code": 6416, "authorization_token": "d55ce95282ecfb1e9703db4fa5257076", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Dammweg 7", "moving_street_and_number": "Oberstockstrasse 4"}	2018-10-12 04:14:41.316267	2018-10-12 04:14:41.316267	Q4 2018
23	\N	4	\N	{"id": 137685, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 80001, "client_sex": "female", "partner_id": null, "client_city": "Bützberg", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "conchini@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/b4c68f4c47df0789d58eb6dbba0307ec/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1MzkzMTc3MzguNjgzNDg1M30.pubAmwSs3YNnKVT89ejy_yF4ZtZfoxUwbkOVR5AnlGk&authorization_token=b4c68f4c47df0789d58eb6dbba0307ec&inquiry_id=137685", "cleaning_date": "2018-11-30", "client_mobile": "078 633 35 34", "original_kind": "cleaning", "client_last_name": "Zwahlen", "client_first_name": "Dominique", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 4922, "moving_postal_code": null, "authorization_token": "b4c68f4c47df0789d58eb6dbba0307ec", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Dammweg 7", "moving_street_and_number": null}	2018-10-12 04:15:39.006404	2018-10-12 04:15:39.006404	Q4 2018
24	20	\N	\N	{"id": 137900, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 99314, "client_sex": "male", "partner_id": null, "client_city": "Basel", "flow_status": "step_2", "moving_city": "Winterthur", "moving_date": "2018-11-30", "client_email": "keller.lukas@gmx.net", "continue_url": "https://customers.movu.ch/de/inquiries/96c0e3a4c72dcb0c3d6f2d060ad373d3/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzk0NDYyNjEuMTM5NzU5OH0.dm1hQBC23fEGcg7yj2pWSJM6vCkBeyCvSC_tTZB2SJg&authorization_token=96c0e3a4c72dcb0c3d6f2d060ad373d3&inquiry_id=137900", "cleaning_date": null, "client_mobile": "076 508 32 93", "original_kind": "moving", "client_last_name": "Keller", "client_first_name": "Lukas", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4053, "moving_postal_code": 8400, "authorization_token": "96c0e3a4c72dcb0c3d6f2d060ad373d3", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Dornacherstrasse 10", "moving_street_and_number": "Bachtelstrasse 33"}	2018-10-13 15:57:41.845521	2018-10-13 15:57:41.845521	Q4 2018
25	21	\N	\N	{"id": 138656, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 99886, "client_sex": "male", "partner_id": null, "client_city": "Neuenegg", "flow_status": "step_2", "moving_city": "Schliern b. Köniz", "moving_date": "2018-11-26", "client_email": "daenu182@hotmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/318b09b71de7c7d1e148f3922f7ee823/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzk4MDAwMjUuNzg3Nzg5Nn0.EONMB-4f91nipCOUc0QIaFl-qkHReXyWx6AFCXZ6dio&authorization_token=318b09b71de7c7d1e148f3922f7ee823&inquiry_id=138656", "cleaning_date": null, "client_mobile": "079 214 50 91", "original_kind": "moving", "client_last_name": "Weber", "client_first_name": "Daniel", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3176, "moving_postal_code": 3098, "authorization_token": "318b09b71de7c7d1e148f3922f7ee823", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Grabmattweg 6", "moving_street_and_number": "Schwandenhubelstrasse 371"}	2018-10-17 18:13:46.503179	2018-10-17 18:13:46.503179	Q4 2018
27	\N	6	\N	{"id": 138913, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 100065, "client_sex": "female", "partner_id": null, "client_city": "Füllinsdorf", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "annettesurer67@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/197ca1a27c0caad13ed0e37173b833fd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Mzk5MzM4MDUuMDYxMTQyfQ.VpDV-7T-68IjOUJgvHwlG1OaSkABjLgDSNcjUdsIe9s&authorization_token=197ca1a27c0caad13ed0e37173b833fd&inquiry_id=138913", "cleaning_date": "2018-12-17", "client_mobile": "079 361 47 38", "original_kind": "cleaning", "client_last_name": "Surer", "client_first_name": "Anette", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 4414, "moving_postal_code": null, "authorization_token": "197ca1a27c0caad13ed0e37173b833fd", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Ergolzstrasse 46", "moving_street_and_number": null}	2018-10-19 07:23:25.702477	2018-10-19 07:23:25.702477	Q4 2018
28	22	\N	\N	{"id": 141257, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 101814, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2018-12-15", "client_email": "murielgendre@x-fly.ch", "continue_url": "https://customers.movu.ch/de/inquiries/e5b432ead8a0890c64861efe4f5c8449/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDExMDI1NjcuMzY1MjMxNX0.lrY1uUEuljCYcFgWEmR7tPMkFyG_mF6WO1lqwIA_6XY&authorization_token=e5b432ead8a0890c64861efe4f5c8449&inquiry_id=141257", "cleaning_date": null, "client_mobile": "076 332 35 75", "original_kind": "moving", "client_last_name": "GENDRE", "client_first_name": "M", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8003, "moving_postal_code": 8003, "authorization_token": "e5b432ead8a0890c64861efe4f5c8449", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Badenerstr. 295", "moving_street_and_number": "Brahmsstr. 90"}	2018-11-01 20:02:48.408127	2018-11-01 20:02:48.408127	Q4 2018
29	23	\N	\N	{"id": 142249, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 102573, "client_sex": "male", "partner_id": null, "client_city": "Pratteln", "flow_status": "step_2", "moving_city": "Uster", "moving_date": "2018-11-17", "client_email": "david.suter@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/5b2f25f03d50adfecd657623291a1298/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDE2MTYyOTQuNDE2OTk1fQ.DkuLY7H48IxrnzmzbV0AsBP-7hSzGrgeqvXDzNKDvYw&authorization_token=5b2f25f03d50adfecd657623291a1298&inquiry_id=142249", "cleaning_date": null, "client_mobile": "079 813 98 88", "original_kind": "moving", "client_last_name": "Suter", "client_first_name": "David", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4133, "moving_postal_code": 8610, "authorization_token": "5b2f25f03d50adfecd657623291a1298", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Josefstrasse 8", "moving_street_and_number": "Ifangweg 8"}	2018-11-07 18:44:55.249727	2018-11-07 18:44:55.249727	Q4 2018
30	24	\N	\N	{"id": 142415, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 93327, "client_sex": "female", "partner_id": null, "client_city": "Schlieren", "flow_status": "step_2", "moving_city": "Hünenberg", "moving_date": "2018-12-07", "client_email": "zakharova@internexco.ch", "continue_url": "https://customers.movu.ch/en/inquiries/c73b4bf379c87a1e815493f066580fbf/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDE2ODUyNjAuMzIzOTYzMn0.kcabxiZPQaWorYW5gznSpJTQ_KtF2wm2DljI6RrBaRY&authorization_token=c73b4bf379c87a1e815493f066580fbf&inquiry_id=142415", "cleaning_date": null, "client_mobile": "079 659 22 17", "original_kind": "moving", "client_last_name": "Zakharova", "client_first_name": "Natalia", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8952, "moving_postal_code": 6331, "authorization_token": "c73b4bf379c87a1e815493f066580fbf", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Bernerstrasse 335", "moving_street_and_number": "Dorfgässli 2"}	2018-11-08 13:54:21.402507	2018-11-08 13:54:21.402507	Q4 2018
31	25	\N	\N	{"id": 143259, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 102504, "client_sex": "female", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": "Basel", "moving_date": "2018-12-13", "client_email": "fabienne.rusch@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/dfc9794ad1aac18d8f4a4bd5384f29b8/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDIxMTQwNTQuOTkwMDE0OH0.2y8QQfGCKoj0FRKOt_aS_0LizWjaIgI6Wu1j5Ew1BdQ&authorization_token=dfc9794ad1aac18d8f4a4bd5384f29b8&inquiry_id=143259", "cleaning_date": null, "client_mobile": "076 250 97 80", "original_kind": "moving", "client_last_name": "Rusch", "client_first_name": "Fabienne", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3008, "moving_postal_code": 4058, "authorization_token": "dfc9794ad1aac18d8f4a4bd5384f29b8", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Ochsenbeinstrasse 14", "moving_street_and_number": "Riehenring 18"}	2018-11-13 13:00:55.609348	2018-11-13 13:00:55.609348	Q4 2018
32	\N	7	\N	{"id": 143507, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 26978, "client_sex": "male", "partner_id": null, "client_city": "Oftringen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "bwlodarczyk01@gmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/ddcef0b0f551ce0b97715769810e1a09/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDIyMTAwMDUuMjkxNzI3M30.nQCqJNVKcP3ssoSckuN5mNUFj5i8UK-VyAgJ4vxo7jE&authorization_token=ddcef0b0f551ce0b97715769810e1a09&inquiry_id=143507", "cleaning_date": "2019-02-11", "client_mobile": "079 777 63 12", "original_kind": "cleaning", "client_last_name": "Wlodarczyk", "client_first_name": "Bartosz", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 4665, "moving_postal_code": null, "authorization_token": "ddcef0b0f551ce0b97715769810e1a09", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Spittelhofring 14", "moving_street_and_number": null}	2018-11-14 15:40:05.783534	2018-11-14 15:40:05.783534	Q4 2018
33	26	\N	\N	{"id": 143560, "kind": "moving", "origin": "thirdparty_partner", "status": "submitted", "user_id": 103551, "client_sex": "female", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": "Uettligen", "moving_date": "2018-12-21", "client_email": "stefanieseiler@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/8b0f49d75eeb296b9cf83cb1aa5b24c8/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDIyMjY0NzkuNTY1MjY5Mn0.yg3CDsany3qvwY_oLmNqo_JyC3X-a6VK_hXA4fkFJUc&authorization_token=8b0f49d75eeb296b9cf83cb1aa5b24c8&inquiry_id=143560", "cleaning_date": null, "client_mobile": "076 497 75 45", "original_kind": "moving", "client_last_name": "Seiler", "client_first_name": "Stefanie", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3008, "moving_postal_code": 3043, "authorization_token": "8b0f49d75eeb296b9cf83cb1aa5b24c8", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Schenkstrasse 31", "moving_street_and_number": "Scheuermattweg 29"}	2018-11-14 20:14:40.396787	2018-11-14 20:14:40.396787	Q4 2018
34	\N	8	\N	{"id": 143561, "kind": "cleaning", "origin": "thirdparty_partner", "status": "submitted", "user_id": 103551, "client_sex": "female", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "stefanieseiler@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/96154390eb7ff1b56a44c110b2c54752/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDIyMjY1MzcuNzY0OTI4OH0.UHwcfXyAc9T0YMkv_RtipaBa1yxDBOxy3_RJo5wz_zE&authorization_token=96154390eb7ff1b56a44c110b2c54752&inquiry_id=143561", "cleaning_date": "2018-12-27", "client_mobile": "076 497 75 45", "original_kind": "cleaning", "client_last_name": "Seiler", "client_first_name": "Stefanie", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 3008, "moving_postal_code": null, "authorization_token": "96154390eb7ff1b56a44c110b2c54752", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Schenkstrasse 31", "moving_street_and_number": null}	2018-11-14 20:15:38.213782	2018-11-14 20:15:38.213782	Q4 2018
35	27	\N	\N	{"id": 146042, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 105378, "client_sex": "male", "partner_id": null, "client_city": "Tahl", "flow_status": "step_2", "moving_city": "Spiez", "moving_date": "2019-02-01", "client_email": "junhozwahlen0799155610@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/6146c60c6b2f9182b2447cb454d98219/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDM1MTA4NzkuMTcxODczM30.wWprcic7ZUEUNz3CFhMqP_cQHJJy8yYv23jcbcPxMe4&authorization_token=6146c60c6b2f9182b2447cb454d98219&inquiry_id=146042", "cleaning_date": null, "client_mobile": "079 915 56 10", "original_kind": "moving", "client_last_name": "zwahlen", "client_first_name": "junho", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3762, "moving_postal_code": 3700, "authorization_token": "6146c60c6b2f9182b2447cb454d98219", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "250 b", "moving_street_and_number": "obere Bahnhofstrasse 2"}	2018-11-29 17:01:19.658761	2018-11-29 17:01:19.658761	Q4 2018
36	28	\N	\N	{"id": 146062, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 105449, "client_sex": "male", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2018-12-14", "client_email": "adrien.clinard@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/0c6d5101de1f183597dae7924e60ce77/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDM1MTkzMDcuNjA1ODkzOX0.ynzayreTSpjySag5fOz_9w7L82LLPfpS_xffCvfY6Xg&authorization_token=0c6d5101de1f183597dae7924e60ce77&inquiry_id=146062", "cleaning_date": null, "client_mobile": "079 443 88 96", "original_kind": "moving", "client_last_name": "Clinard", "client_first_name": "Adrien", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8047, "moving_postal_code": 8047, "authorization_token": "0c6d5101de1f183597dae7924e60ce77", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Anemonenstrasse 1", "moving_street_and_number": "Altweg 18"}	2018-11-29 19:21:48.400745	2018-11-29 19:21:48.400745	Q4 2018
37	29	\N	\N	{"id": 152036, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 109927, "client_sex": "male", "partner_id": null, "client_city": "Regensdorf", "flow_status": "step_2", "moving_city": "Regensdorf", "moving_date": "2019-03-22", "client_email": "sushibar@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/b2936b79534e7ed88428a450fcb0127e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDcwMjM2NTcuMjY0NDQ0fQ.nVmMKXiMg_EgXDULUdpw9fnMgiEGXEB-z5UNMYE0TZM&authorization_token=b2936b79534e7ed88428a450fcb0127e&inquiry_id=152036", "cleaning_date": null, "client_mobile": "079 263 44 88", "original_kind": "moving", "client_last_name": "Clerc", "client_first_name": "Vincent", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8105, "moving_postal_code": 8105, "authorization_token": "b2936b79534e7ed88428a450fcb0127e", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Untere Mühlestrasse 4", "moving_street_and_number": "Wattetstrasse 4"}	2019-01-09 08:47:38.518746	2019-01-09 08:47:38.518746	Q1 2019
38	\N	9	\N	{"id": 152038, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 109927, "client_sex": "male", "partner_id": null, "client_city": "Regensdorf", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "sushibar@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/7cb36166d39bcabb525f4fccf2912c0c/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDcwMjM3MTcuMDQyNzQ3NX0.bQrbg866UE9C9nng_OK3wo1d1CxORkLgfjKM7boZrfY&authorization_token=7cb36166d39bcabb525f4fccf2912c0c&inquiry_id=152038", "cleaning_date": "2019-03-25", "client_mobile": "079 263 44 88", "original_kind": "cleaning", "client_last_name": "Clerc", "client_first_name": "Vincent", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 8105, "moving_postal_code": null, "authorization_token": "7cb36166d39bcabb525f4fccf2912c0c", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Untere Mühlestrasse 4", "moving_street_and_number": null}	2019-01-09 08:48:37.74342	2019-01-09 08:48:37.74342	Q1 2019
39	30	\N	\N	{"id": 153707, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 111194, "client_sex": "male", "partner_id": null, "client_city": "Winterthur", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2019-03-31", "client_email": "roman.widmer1@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/d590a886ca5801ae5966566879ac8a1e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDc1ODYxNTYuNzM3OTk5Mn0.7dY66YQri8XA8zswmYp_EH_Puh4gDImXDed1XkluRPI&authorization_token=d590a886ca5801ae5966566879ac8a1e&inquiry_id=153707", "cleaning_date": null, "client_mobile": "079 275 42 00", "original_kind": "moving", "client_last_name": "Widmer", "client_first_name": "Roman", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8405, "moving_postal_code": 8002, "authorization_token": "d590a886ca5801ae5966566879ac8a1e", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Hofmannstrasse 19", "moving_street_and_number": "Bederstrasse 60"}	2019-01-15 21:02:37.417284	2019-01-15 21:02:37.417284	Q1 2019
40	31	\N	\N	{"id": 154310, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 111627, "client_sex": "male", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Bonstetten", "moving_date": "2019-02-01", "client_email": "mhaene@zoho.com", "continue_url": "https://customers.movu.ch/de/inquiries/3fd8e8791692c195f2500fc93f193308/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDc3NjYzMTcuMTA3MDQ0NX0.W6Ojd2Mit1WCm3Ho1jTVlEf73TZmS25vaLu1-YgwSHU&authorization_token=3fd8e8791692c195f2500fc93f193308&inquiry_id=154310", "cleaning_date": null, "client_mobile": "078 784 19 10", "original_kind": "moving", "client_last_name": "Haene", "client_first_name": "Matthias", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8005, "moving_postal_code": 8906, "authorization_token": "3fd8e8791692c195f2500fc93f193308", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Klingenstrasse 4", "moving_street_and_number": "Schachenstrasse 148"}	2019-01-17 23:05:17.709609	2019-01-17 23:05:17.709609	Q1 2019
41	32	\N	\N	{"id": 155504, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 110819, "client_sex": "male", "partner_id": null, "client_city": "Affoltern am Albis", "flow_status": "step_2", "moving_city": "Jonen", "moving_date": "2019-05-04", "client_email": "s.fandrey@googlemail.com", "continue_url": "https://customers.movu.ch/de/inquiries/73b00bf73f4c0a189daeddce6f939f91/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDgxODU5MjAuNDIwMDA5fQ.eD3c6wdkXRE-baY0dQs5GhQ-TvkAGgLp6voh_Wwn9E0&authorization_token=73b00bf73f4c0a189daeddce6f939f91&inquiry_id=155504", "cleaning_date": null, "client_mobile": "078 604 05 41", "original_kind": "moving", "client_last_name": "Fandrey", "client_first_name": "Stephan", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8910, "moving_postal_code": 8916, "authorization_token": "73b00bf73f4c0a189daeddce6f939f91", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Äussere Grundstrasse 11", "moving_street_and_number": "Lettenstrasse 7"}	2019-01-22 19:38:41.088966	2019-01-22 19:38:41.088966	Q1 2019
42	33	\N	\N	{"id": 156037, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 110584, "client_sex": "male", "partner_id": null, "client_city": "Bettwiesen", "flow_status": "step_2", "moving_city": "Amriswil", "moving_date": "2019-03-01", "client_email": "cornel.kraemer@outlook.com", "continue_url": "https://customers.movu.ch/de/inquiries/801d8c42ef0bd7a427ea54dbcfae396d/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDgzNTU4MDguMzY4NjQwNH0.0vTCCkoA0b5jwxetIpe3ZMZx0NKj7rd9DEGbdUhyDNg&authorization_token=801d8c42ef0bd7a427ea54dbcfae396d&inquiry_id=156037", "cleaning_date": null, "client_mobile": "079 939 29 17", "original_kind": "moving", "client_last_name": "Krämer", "client_first_name": "Cornel", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 9553, "moving_postal_code": 8580, "authorization_token": "801d8c42ef0bd7a427ea54dbcfae396d", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Im Grund 4", "moving_street_and_number": "Weinfelderstr. 32"}	2019-01-24 18:50:09.05766	2019-01-24 18:50:09.05766	Q1 2019
43	\N	10	\N	{"id": 156039, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 110584, "client_sex": "male", "partner_id": null, "client_city": "Bettwiesen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "cornel.kraemer@outlook.com", "continue_url": "https://customers.movu.ch/de/inquiries/b744c468691fe3979cc034e519a37805/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDgzNTU5NzcuMTM4Nzk5Mn0.CnZWk7bnBlbVCXDlzp2n0j0d4S-E9oVYk_2HqgmA2ZA&authorization_token=b744c468691fe3979cc034e519a37805&inquiry_id=156039", "cleaning_date": "2019-03-26", "client_mobile": "079 939 29 17", "original_kind": "cleaning", "client_last_name": "Krämer", "client_first_name": "Cornel", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 9553, "moving_postal_code": null, "authorization_token": "b744c468691fe3979cc034e519a37805", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Im Grund 4", "moving_street_and_number": null}	2019-01-24 18:52:57.633869	2019-01-24 18:52:57.633869	Q1 2019
44	34	\N	\N	{"id": 158658, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 113258, "client_sex": "male", "partner_id": null, "client_city": "Wil", "flow_status": "step_2", "moving_city": "Wil", "moving_date": "2019-04-16", "client_email": "wachter.dominic@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/f1eda141829dec59c5fa8dc2600f63f3/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDkyOTIzOTIuMTQ3ODM1N30.dvM5utychmk5PQ8XiTXUc4xpLrRmjT-bwfUaMtgfcKQ&authorization_token=f1eda141829dec59c5fa8dc2600f63f3&inquiry_id=158658", "cleaning_date": null, "client_mobile": "076 494 01 03", "original_kind": "moving", "client_last_name": "Wachter", "client_first_name": "Dominic", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 9500, "moving_postal_code": 9500, "authorization_token": "f1eda141829dec59c5fa8dc2600f63f3", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "St.Gallerstrasse 54a", "moving_street_and_number": "Obere Bahnhofstrasse 45"}	2019-02-04 14:59:52.90785	2019-02-04 14:59:52.90785	Q1 2019
45	\N	11	\N	{"id": 158659, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 113258, "client_sex": "male", "partner_id": null, "client_city": "Wil", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "wachter.dominic@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/c08eb0c79e7ff7dee5ce8d140e77918f/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NDkyOTI0NjEuOTAwMDI2fQ.1tcKTFvUEzfApQw4PU8fF8Uv8YR7_IWyTnPKYjPk6_I&authorization_token=c08eb0c79e7ff7dee5ce8d140e77918f&inquiry_id=158659", "cleaning_date": "2019-04-23", "client_mobile": "076 494 01 03", "original_kind": "cleaning", "client_last_name": "Dominic", "client_first_name": "Wachter", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 9500, "moving_postal_code": null, "authorization_token": "c08eb0c79e7ff7dee5ce8d140e77918f", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "St.Gallerstrasse 54a", "moving_street_and_number": null}	2019-02-04 15:01:02.560331	2019-02-04 15:01:02.560331	Q1 2019
46	35	\N	\N	{"id": 161351, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 116679, "client_sex": "male", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2019-03-15", "client_email": "zenosteiner@yahoo.de", "continue_url": "https://customers.movu.ch/de/inquiries/f90a3d7d192b17a8f186b474874ff49d/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTAxMzg2NzcuMTg2NjAxMn0.kcpRhFR2njEdZIfV27rn2nn_UwnTgkdjT-5ZdycnVfE&authorization_token=f90a3d7d192b17a8f186b474874ff49d&inquiry_id=161351", "cleaning_date": null, "client_mobile": "079 123 45 67", "original_kind": "moving", "client_last_name": "Steiner", "client_first_name": "Zenno", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8050, "moving_postal_code": 8005, "authorization_token": "f90a3d7d192b17a8f186b474874ff49d", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Affolternstrasse 161", "moving_street_and_number": "Gasometerstrasse 29"}	2019-02-14 10:04:38.056005	2019-02-14 10:04:38.056005	Q1 2019
47	36	\N	\N	{"id": 165250, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 119589, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2019-03-28", "client_email": "andrea@rebsamen.net", "continue_url": "https://customers.movu.ch/de/inquiries/aaa89419d9b450bff53b4ff6225f5427/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTE0MzUwODguMjM3Nzg1fQ.E-hZaoZEIVHPfvYZYTafx-UsYvYVpbBitAeHLEObQ0M&authorization_token=aaa89419d9b450bff53b4ff6225f5427&inquiry_id=165250", "cleaning_date": null, "client_mobile": "079 256 16 12", "original_kind": "moving", "client_last_name": "Rebsamen", "client_first_name": "Andrea", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8008, "moving_postal_code": 8008, "authorization_token": "aaa89419d9b450bff53b4ff6225f5427", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Feldeggstrasse 46, Zürich", "moving_street_and_number": "Florasstrasse 1,"}	2019-03-01 10:11:29.13248	2019-03-01 10:11:29.13248	Q1 2019
48	37	\N	\N	{"id": 168212, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 121839, "client_sex": "female", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": "Bern", "moving_date": "2019-05-20", "client_email": "corinne.luedi@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/30dfd1a2386c7696b9cfc580f5600b95/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTI0NzA2MzIuMzAwMDE2Nn0.zyFNtiZLIWzqmJcWjHI9b5mecg98ZKBqzJvQA1ShwUA&authorization_token=30dfd1a2386c7696b9cfc580f5600b95&inquiry_id=168212", "cleaning_date": null, "client_mobile": "079 234 76 27", "original_kind": "moving", "client_last_name": "Lüdi", "client_first_name": "Corinne", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3006, "moving_postal_code": 3006, "authorization_token": "30dfd1a2386c7696b9cfc580f5600b95", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Wiessbadstr. 3", "moving_street_and_number": "Thunplatz 8"}	2019-03-13 09:50:33.490694	2019-03-13 09:50:33.490694	Q1 2019
49	38	\N	\N	{"id": 171127, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 123808, "client_sex": "male", "partner_id": null, "client_city": "Schönenwerd", "flow_status": "step_2", "moving_city": "Luzern", "moving_date": "2019-07-15", "client_email": "adrian.suter@wortrei.ch", "continue_url": "https://customers.movu.ch/de/inquiries/07dd907cf2209ef4c8939f60b02a84bf/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTM1MjI0NTQuOTMyNjg1OX0.7vaauS9CkbkcfyHoVNP0paau3KncoC6sJEPZjGyi_Js&authorization_token=07dd907cf2209ef4c8939f60b02a84bf&inquiry_id=171127", "cleaning_date": null, "client_mobile": "076 369 44 17", "original_kind": "moving", "client_last_name": "Suter", "client_first_name": "Adrian", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 5012, "moving_postal_code": 6004, "authorization_token": "07dd907cf2209ef4c8939f60b02a84bf", "is_cleaning_request": false, "client_property_size": "size_6", "client_street_and_number": "Schmiedengasse 23", "moving_street_and_number": "Museggstrasse 15"}	2019-03-25 14:00:56.012107	2019-03-25 14:00:56.012107	Q1 2019
50	39	\N	\N	{"id": 172154, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 124474, "client_sex": "male", "partner_id": null, "client_city": "Huttwil", "flow_status": "step_2", "moving_city": "Tägertschi", "moving_date": "2019-05-25", "client_email": "mario.staehli@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/5235aae9f3196ac1bc83ed132c642682/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTM4NDU5NzAuMzgyMTMyNX0.e88yC4mOKyZ0accoZSbL9QWTtUOGVedOGPdlOo9Bxwk&authorization_token=5235aae9f3196ac1bc83ed132c642682&inquiry_id=172154", "cleaning_date": null, "client_mobile": "079 831 86 55", "original_kind": "moving", "client_last_name": "Stähli", "client_first_name": "Mario", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4950, "moving_postal_code": 3111, "authorization_token": "5235aae9f3196ac1bc83ed132c642682", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Fiechtenstrasse 12", "moving_street_and_number": "Fiechtenstrasse 12"}	2019-03-29 07:52:51.546152	2019-03-29 07:52:51.546152	Q1 2019
52	\N	12	\N	{"id": 172156, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 124474, "client_sex": "male", "partner_id": null, "client_city": "Huttwil", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "mario.staehli@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/08993f37bbcb056d0ac8b8613bc74387/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTM4NDYwNTIuNzQ2MTIyOH0.BKggti7sMkeVHUyRe0MEg0pc11TOXaJgV6XzIO3Y-i8&authorization_token=08993f37bbcb056d0ac8b8613bc74387&inquiry_id=172156", "cleaning_date": "2019-05-31", "client_mobile": "079 831 86 55", "original_kind": "cleaning", "client_last_name": "Stähli", "client_first_name": "Mario", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 4950, "moving_postal_code": null, "authorization_token": "08993f37bbcb056d0ac8b8613bc74387", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Fiechtenstrasse 12", "moving_street_and_number": null}	2019-03-29 07:54:13.481456	2019-03-29 07:54:13.481456	Q1 2019
57	45	\N	\N	{"id": 172985, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 125011, "client_sex": "male", "partner_id": null, "client_city": "Spiez", "flow_status": "step_2", "moving_city": "Spiez", "moving_date": "2019-07-18", "client_email": "peter.ryffe@hispeed.ch", "continue_url": "https://customers.movu.ch/de/inquiries/e059ced98f84a7f8699ad56848e4012e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQxODY1OTguMDg5NjAzN30.cvma2aVvM49wXZcS__A95JY8l0v-z4Yuoh-cXNLedvg&authorization_token=e059ced98f84a7f8699ad56848e4012e&inquiry_id=172985", "cleaning_date": null, "client_mobile": "079 656 22 84", "original_kind": "moving", "client_last_name": "Peter", "client_first_name": "Ryffe", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3700, "moving_postal_code": 3700, "authorization_token": "e059ced98f84a7f8699ad56848e4012e", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Breitenweg 46", "moving_street_and_number": "Ahorniweg 41"}	2019-04-02 06:30:00.260754	2019-04-02 06:30:00.260754	Q2 2019
58	\N	13	\N	{"id": 172987, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 125011, "client_sex": "male", "partner_id": null, "client_city": "Spiez", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "peter.ryffe@hispeed.ch", "continue_url": "https://customers.movu.ch/de/inquiries/68b02706f33a56a95e5ebed319d76b0b/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQxODY2ODAuOTc1MTQzNH0.vIIisLTQ-DkUAIY1h5vZsg1wesD7HJU32W8sttYpV_k&authorization_token=68b02706f33a56a95e5ebed319d76b0b&inquiry_id=172987", "cleaning_date": "2019-07-25", "client_mobile": "079 656 22 84", "original_kind": "cleaning", "client_last_name": "Ryffe", "client_first_name": "Peter", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 3700, "moving_postal_code": null, "authorization_token": "68b02706f33a56a95e5ebed319d76b0b", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Breitenweg 46", "moving_street_and_number": null}	2019-04-02 06:31:21.766402	2019-04-02 06:31:21.766402	Q2 2019
59	46	\N	\N	{"id": 174495, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 125894, "client_sex": "male", "partner_id": null, "client_city": "Spiez", "flow_status": "step_2", "moving_city": "Basel", "moving_date": "2019-06-18", "client_email": "patrick.loman@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/0190216ce1839afde0c60c5dd1e2f32e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQ2MzA1MDAuOTU5ODkzfQ.sSCwYRu-oiAFYHy1raCP2boeJxT_pZKSsbQK67P1wjA&authorization_token=0190216ce1839afde0c60c5dd1e2f32e&inquiry_id=174495", "cleaning_date": null, "client_mobile": "079 946 26 08", "original_kind": "moving", "client_last_name": "Barbosa Cavalcante", "client_first_name": "Claudionor", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3700, "moving_postal_code": 4058, "authorization_token": "0190216ce1839afde0c60c5dd1e2f32e", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Stockhornstrasse 21", "moving_street_and_number": "Erlenmattstrasse 81"}	2019-04-07 09:48:22.064802	2019-04-07 09:48:22.064802	Q2 2019
60	\N	14	\N	{"id": 174496, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 125894, "client_sex": "male", "partner_id": null, "client_city": "Spiez", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "patrick.loman@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/99130da56eaec5d3fde98012f1b720d0/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQ2MzA1NjIuNjY3NzM2NX0.Uw97YzgKIf7MsiFWPl_lRYJ90fEP452yx2xKFVyfsSk&authorization_token=99130da56eaec5d3fde98012f1b720d0&inquiry_id=174496", "cleaning_date": "2019-06-27", "client_mobile": "079 946 26 08", "original_kind": "cleaning", "client_last_name": "Barbosa Cavalcante", "client_first_name": "Claudionor ", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 3700, "moving_postal_code": null, "authorization_token": "99130da56eaec5d3fde98012f1b720d0", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Stockhornstrasse 21", "moving_street_and_number": null}	2019-04-07 09:49:23.212075	2019-04-07 09:49:23.212075	Q2 2019
61	47	\N	\N	{"id": 175076, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 126249, "client_sex": "male", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Einsiedeln", "moving_date": "2019-05-21", "client_email": "tobias@straka.ch", "continue_url": "https://customers.movu.ch/de/inquiries/ed4a156d546926f85210f7d25362a46e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQ4MDE1ODMuNzMzOTgyM30.vTYEojLI-joAPDTJrdDcSBRoMCIlI-2jVg8jJne4zR8&authorization_token=ed4a156d546926f85210f7d25362a46e&inquiry_id=175076", "cleaning_date": null, "client_mobile": "079 935 24 73", "original_kind": "moving", "client_last_name": "Straka", "client_first_name": "Tobias", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8003, "moving_postal_code": 8840, "authorization_token": "ed4a156d546926f85210f7d25362a46e", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Saumstrasse 14", "moving_street_and_number": "Schmiedenstrasse 34"}	2019-04-09 09:19:49.66909	2019-04-09 09:19:49.66909	Q2 2019
62	48	\N	\N	{"id": 175431, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 126422, "client_sex": "female", "partner_id": null, "client_city": "Gümligen", "flow_status": "step_2", "moving_city": "Gümligen", "moving_date": "2019-07-26", "client_email": "cpbaioni@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/4c1af117468aafeed1377510df799049/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQ4OTc5MTkuNzIwNzMyN30.Y3Lc3axy15b4S6qSW0WTCc1wDWx7yM3Jx8YOmqasKHE&authorization_token=4c1af117468aafeed1377510df799049&inquiry_id=175431", "cleaning_date": null, "client_mobile": "076 405 83 85", "original_kind": "moving", "client_last_name": "Baioni", "client_first_name": "Catia", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3073, "moving_postal_code": 3073, "authorization_token": "4c1af117468aafeed1377510df799049", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Tannackerstrasse 8a", "moving_street_and_number": "Dennikofenweg 77"}	2019-04-10 12:05:39.077748	2019-04-10 12:05:39.077748	Q2 2019
63	\N	15	\N	{"id": 175432, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 126422, "client_sex": "female", "partner_id": null, "client_city": "Gümligen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "cpbaioni@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/5abe614ff2a81e9ea50c25d022e86cca/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTQ4OTc5NTMuODA0NjE0M30.VPErddJObjyjWD2fRsaD21eqsBThtVAvJk_npGgMfrE&authorization_token=5abe614ff2a81e9ea50c25d022e86cca&inquiry_id=175432", "cleaning_date": "2019-07-31", "client_mobile": "076 405 83 85", "original_kind": "cleaning", "client_last_name": "Baioni", "client_first_name": "Catia", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 3073, "moving_postal_code": null, "authorization_token": "5abe614ff2a81e9ea50c25d022e86cca", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Dennikofenweg 77", "moving_street_and_number": null}	2019-04-10 12:05:56.259625	2019-04-10 12:05:56.259625	Q2 2019
64	49	\N	\N	{"id": 175978, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 126804, "client_sex": "male", "partner_id": null, "client_city": "Frauenfeld", "flow_status": "step_2", "moving_city": "Frauenfeld", "moving_date": "2019-05-22", "client_email": "w.rechberger@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/23777dc9304eabae5996a9f55b391971/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTUwNjkzNjAuMjQ0MTg3Nn0.1Qj2uXm3DfcU9gQGLr4TXSCT0TAFKmOBQck9qqlDNwM&authorization_token=23777dc9304eabae5996a9f55b391971&inquiry_id=175978", "cleaning_date": null, "client_mobile": "079 954 34 11", "original_kind": "moving", "client_last_name": "Rechberger", "client_first_name": "Werner", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8500, "moving_postal_code": 8500, "authorization_token": "23777dc9304eabae5996a9f55b391971", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Neuhauserstrasse 50", "moving_street_and_number": "Am Stadtbach 7a"}	2019-04-12 11:42:41.20718	2019-04-12 11:42:41.20718	Q2 2019
65	50	\N	\N	{"id": 176353, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 100613, "client_sex": "female", "partner_id": null, "client_city": "Sarnen", "flow_status": "step_2", "moving_city": "Oberarth", "moving_date": "2019-06-22", "client_email": "rborgbartolo@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/f4d36b35445dfa3ff8cd00f14591c904/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTUyNDE5NjIuMDE2NDE4NX0.SeKgTUKr9JO7jBuFSjwPPimrdJWDu-HDrUL9K61EWhs&authorization_token=f4d36b35445dfa3ff8cd00f14591c904&inquiry_id=176353", "cleaning_date": null, "client_mobile": "076 819 42 24", "original_kind": "moving", "client_last_name": "Borg Bartolo", "client_first_name": "Roberta", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 6060, "moving_postal_code": 6414, "authorization_token": "f4d36b35445dfa3ff8cd00f14591c904", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Strasse, 2", "moving_street_and_number": "Tramweg 41"}	2019-04-14 11:39:22.671603	2019-04-14 11:39:22.671603	Q2 2019
66	\N	16	\N	{"id": 176356, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 100613, "client_sex": "female", "partner_id": null, "client_city": "Sarnen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "rborgbartolo@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/6a8f67462de6edc8a6c525e4beea294a/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTUyNDIwMzQuMTk5Mjk1fQ.WSidsrc-jZxMCzO3HLgsRkqGKHJAiMznsePAAuX0Y5c&authorization_token=6a8f67462de6edc8a6c525e4beea294a&inquiry_id=176356", "cleaning_date": "2019-06-27", "client_mobile": "076 819 42 24", "original_kind": "cleaning", "client_last_name": "Borg Bartolo", "client_first_name": "Roberta", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 6060, "moving_postal_code": null, "authorization_token": "6a8f67462de6edc8a6c525e4beea294a", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Strasse, 2", "moving_street_and_number": null}	2019-04-14 11:40:34.818002	2019-04-14 11:40:34.818002	Q2 2019
67	\N	17	\N	{"id": 177212, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 127529, "client_sex": "male", "partner_id": null, "client_city": "Aarau", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "ngkikop@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/32b05e5fb9e36772bd2472986e6f3c41/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTU1MDAwNjEuOTY4NzUyfQ.sfJS83cYsjZqA3fwQcwQvAcnkSSarZKIS9OzlpQ8u9o&authorization_token=32b05e5fb9e36772bd2472986e6f3c41&inquiry_id=177212", "cleaning_date": "2019-07-30", "client_mobile": "076 685 45 90", "original_kind": "cleaning", "client_last_name": "Gkikopoulos", "client_first_name": "Nikitas", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 5000, "moving_postal_code": null, "authorization_token": "32b05e5fb9e36772bd2472986e6f3c41", "is_cleaning_request": true, "client_property_size": "size_2", "client_street_and_number": "Gönhardweg 6", "moving_street_and_number": null}	2019-04-17 11:21:02.662713	2019-04-17 11:21:02.662713	Q2 2019
68	51	\N	\N	{"id": 177214, "kind": "moving", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 127529, "client_sex": "male", "partner_id": null, "client_city": "Aarau", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2019-06-29", "client_email": "ngkikop@gmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/935a9d8b75d0f42731ba2751d25bfa64/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTU1MDAxMjIuODQyNDEzNH0.rXnTAEvpm5cY19Xj-6pnRpCVP3Zxky6xOrcztLl6bso&authorization_token=935a9d8b75d0f42731ba2751d25bfa64&inquiry_id=177214", "cleaning_date": null, "client_mobile": "076 685 45 90", "original_kind": "moving", "client_last_name": "Gkikopoulos", "client_first_name": "Nikitas", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 5000, "moving_postal_code": 8051, "authorization_token": "935a9d8b75d0f42731ba2751d25bfa64", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Gönhardweg 6", "moving_street_and_number": "Blauäcker 12"}	2019-04-17 11:22:03.494742	2019-04-17 11:22:03.494742	Q2 2019
73	53	\N	\N	{"id": 181153, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 129657, "client_sex": "female", "partner_id": null, "client_city": "Affoltern am Albis ", "flow_status": "step_2", "moving_city": "Adliswil ", "moving_date": "2019-06-14", "client_email": "raquel.correia.de@outlook.com", "continue_url": "https://customers.movu.ch/de/inquiries/4c2beff11d4a756533e47c7f2d29c776/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTY5Mzk4MTguNTM4NTZ9.1mCEQLa99JvjTZ8i2sbqsaOYGpGBf7acJsUrYGImrF0&authorization_token=4c2beff11d4a756533e47c7f2d29c776&inquiry_id=181153", "cleaning_date": null, "client_mobile": "079 455 91 23", "original_kind": "moving", "client_last_name": "Correia ", "client_first_name": "Raquel ", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8910, "moving_postal_code": 8134, "authorization_token": "4c2beff11d4a756533e47c7f2d29c776", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Wolhausenstrasse 23", "moving_street_and_number": "Schürbachstrasse 9"}	2019-05-04 03:16:59.361485	2019-05-04 03:16:59.361485	Q2 2019
74	54	\N	\N	{"id": 185539, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 131090, "client_sex": "male", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": "Bern", "moving_date": "2019-06-25", "client_email": "gaston1@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/6c60b7eb526c6871ee23c342219083b7/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTgzNjczMDAuNTQyNjk1NX0.zVFcJPjEfLkS41gePdZlffquOfJrQZ8qMw-m4zC2JEc&authorization_token=6c60b7eb526c6871ee23c342219083b7&inquiry_id=185539", "cleaning_date": null, "client_mobile": "079 342 01 60", "original_kind": "moving", "client_last_name": "Breu", "client_first_name": "Damian", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3008, "moving_postal_code": 3012, "authorization_token": "6c60b7eb526c6871ee23c342219083b7", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Freiburgstrasse 161", "moving_street_and_number": "Brückfeldstrasse 37"}	2019-05-20 15:48:27.503091	2019-05-20 15:48:27.503091	Q2 2019
75	55	\N	\N	{"id": 186958, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 132845, "client_sex": "female", "partner_id": null, "client_city": "hadlikon", "flow_status": "step_2", "moving_city": "diemtigen", "moving_date": "2019-06-28", "client_email": "lena24@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/f4e8b6c52ca22f58bb204fedbecddfd6/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTg4MDk0MjUuNDc5NzgwNH0.S_jbYPqw1bosqMDIGM7Yff0jUks59lVntbqsjEA0s48&authorization_token=f4e8b6c52ca22f58bb204fedbecddfd6&inquiry_id=186958", "cleaning_date": null, "client_mobile": "079 318 09 20", "original_kind": "moving", "client_last_name": "majorek", "client_first_name": "magdalena", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8340, "moving_postal_code": 3754, "authorization_token": "f4e8b6c52ca22f58bb204fedbecddfd6", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "bodenholzstrasse 55", "moving_street_and_number": "dorfn 16"}	2019-05-25 18:37:06.186409	2019-05-25 18:37:06.186409	Q2 2019
76	56	\N	\N	{"id": 190148, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 134593, "client_sex": "female", "partner_id": null, "client_city": "Sils i.D.", "flow_status": "step_2", "moving_city": "Mels", "moving_date": "2019-09-17", "client_email": "bkaula@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/e376ef1aee14f4136e47571583fb33dd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NTk4OTQ2NTMuNjgwOTUzfQ.Yuy_p4-YVwNtYa_5H6AmV7RLAJLtseQZ_7YLcgSFUwU&authorization_token=e376ef1aee14f4136e47571583fb33dd&inquiry_id=190148", "cleaning_date": null, "client_mobile": "079 408 40 04", "original_kind": "moving", "client_last_name": "Kaula", "client_first_name": "Britta", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 7411, "moving_postal_code": 8887, "authorization_token": "e376ef1aee14f4136e47571583fb33dd", "is_cleaning_request": false, "client_property_size": "size_5", "client_street_and_number": "Albulastrasse 81", "moving_street_and_number": "Fabrikstrasse 1"}	2019-06-07 08:04:14.463065	2019-06-07 08:04:14.463065	Q2 2019
77	57	\N	\N	{"id": 192138, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 135730, "client_sex": "female", "partner_id": null, "client_city": "Saxon", "flow_status": "step_2", "moving_city": "Saxon", "moving_date": "2019-06-25", "client_email": "nilden@netplus.ch", "continue_url": "https://customers.movu.ch/de/inquiries/c6785d6849aad0aeee523b31e229516c/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjA1NTg1NTcuNTc5MTYzfQ.FaK-vLb3kG3s7kSVklDETZJf35QCqhENEIdHgcyvNlU&authorization_token=c6785d6849aad0aeee523b31e229516c&inquiry_id=192138", "cleaning_date": null, "client_mobile": "079 286 30 78", "original_kind": "moving", "client_last_name": "Nanchen ", "client_first_name": "Nilde ", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 1907, "moving_postal_code": 1907, "authorization_token": "c6785d6849aad0aeee523b31e229516c", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Chemin des Cigales 27 ", "moving_street_and_number": "Rue de l'autoroute 26"}	2019-06-15 00:29:18.167963	2019-06-15 00:29:18.167963	Q2 2019
78	58	\N	\N	{"id": 193835, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 136792, "client_sex": "male", "partner_id": null, "client_city": "Bern-Bethlehem", "flow_status": "step_2", "moving_city": "Köniz", "moving_date": "2019-07-03", "client_email": "hr.schenker@pro9.ch", "continue_url": "https://customers.movu.ch/de/inquiries/5f122bd9a7e3c78b669f2df6c6a229a9/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjExMzYwMjUuNjQzNzk5fQ.t8iWm3Jq4lDSChHm-Xw8Nq4CwINsT0la4XOkBcWHqIA&authorization_token=5f122bd9a7e3c78b669f2df6c6a229a9&inquiry_id=193835", "cleaning_date": null, "client_mobile": "077 991 17 17", "original_kind": "moving", "client_last_name": "Schenker", "client_first_name": "Hans-Rudolf", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3027, "moving_postal_code": 3098, "authorization_token": "5f122bd9a7e3c78b669f2df6c6a229a9", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Riedbachstrasse 51", "moving_street_and_number": "Sägestrasse 78"}	2019-06-21 16:53:46.190508	2019-06-21 16:53:46.190508	Q2 2019
79	59	\N	\N	{"id": 194916, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 137381, "client_sex": "female", "partner_id": null, "client_city": "Stettlen", "flow_status": "step_2", "moving_city": "Neuheim", "moving_date": "2019-07-26", "client_email": "ro-ro@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/fc0e0ef6d3a5f9a61612e00f1bdc937d/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjE1MDQ1ODAuOTc2ODc4fQ.3xXfTWodtOfoEQlqzU7bEr4VYakeTrMKFPV7Mb6hTUI&authorization_token=fc0e0ef6d3a5f9a61612e00f1bdc937d&inquiry_id=194916", "cleaning_date": null, "client_mobile": "079 698 18 48", "original_kind": "moving", "client_last_name": "Yavuz", "client_first_name": "Bedriye", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3066, "moving_postal_code": 6345, "authorization_token": "fc0e0ef6d3a5f9a61612e00f1bdc937d", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Bleichestrasse 61", "moving_street_and_number": "Oberdorf 1"}	2019-06-25 23:16:21.572551	2019-06-25 23:16:21.572551	Q2 2019
80	\N	19	\N	{"id": 194917, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 137381, "client_sex": "female", "partner_id": null, "client_city": "Stettlen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "ro-ro@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/e42c585b6eab9c4c4f4be0c5f63004bc/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjE1MDQ2NzQuMjI3ODc5NX0.eK_4glfDGIHW_B4TlvpOIu43wsa9nNDHIQHJ4dQ7yuU&authorization_token=e42c585b6eab9c4c4f4be0c5f63004bc&inquiry_id=194917", "cleaning_date": "2019-06-27", "client_mobile": "079 698 18 48", "original_kind": "cleaning", "client_last_name": "Yavuz", "client_first_name": "Bedriye", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 3066, "moving_postal_code": null, "authorization_token": "e42c585b6eab9c4c4f4be0c5f63004bc", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Bleichestrasse 61", "moving_street_and_number": null}	2019-06-25 23:17:54.603421	2019-06-25 23:17:54.603421	Q2 2019
81	60	\N	\N	{"id": 196634, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 138296, "client_sex": "male", "partner_id": null, "client_city": "Tramelan", "flow_status": "step_2", "moving_city": "Andeer", "moving_date": "2019-07-24", "client_email": "elu2710@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/7990a53256a658a4d8999426e908175e/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjIwOTAyNzEuOTI4Nzg5fQ.tw5wCpdlWFN0fKU936-lNVm2hkelymxFuNxKiMF-dxw&authorization_token=7990a53256a658a4d8999426e908175e&inquiry_id=196634", "cleaning_date": null, "client_mobile": "079 153 28 84", "original_kind": "moving", "client_last_name": "Fuhrer", "client_first_name": "Claude", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 2720, "moving_postal_code": 7440, "authorization_token": "7990a53256a658a4d8999426e908175e", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Rue de la Paix 31", "moving_street_and_number": "Bärenburg 132"}	2019-07-02 17:57:52.558491	2019-07-02 17:57:52.558491	Q3 2019
82	61	\N	\N	{"id": 198317, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 139276, "client_sex": "female", "partner_id": null, "client_city": "Muttenz", "flow_status": "step_2", "moving_city": "Luzern", "moving_date": "2019-07-24", "client_email": "vpormann@norgine.com", "continue_url": "https://customers.movu.ch/de/inquiries/f227f0e2f3780f7685e0dafbbc11d5a4/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjI2NTY3MjQuMzY2OTI1Mn0.q71dm_e0GLmvHeLu-7XignbfoRU-rdFVG19geC1VFA8&authorization_token=f227f0e2f3780f7685e0dafbbc11d5a4&inquiry_id=198317", "cleaning_date": null, "client_mobile": "079 890 14 40", "original_kind": "moving", "client_last_name": "Portmann", "client_first_name": "Ver", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 4132, "moving_postal_code": 6005, "authorization_token": "f227f0e2f3780f7685e0dafbbc11d5a4", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Medius AG Neue Bahnhofstrasse 160 ", "moving_street_and_number": "SpePharm AG Werftestrasse 3"}	2019-07-09 07:18:45.120397	2019-07-09 07:18:45.120397	Q3 2019
83	62	\N	\N	{"id": 199349, "kind": "moving", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 139804, "client_sex": "male", "partner_id": null, "client_city": "Zurich", "flow_status": "step_2", "moving_city": "Zurich ", "moving_date": "2019-07-27", "client_email": "stuart.sims@hotmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/61e784ca4e4215ebe3e0784760097328/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjI5NDMzOTUuMzM0MDA3NX0.Ib-LDHg1CUbcCLePrHDNVEo8FZiDGTL_3mbUvN-sXMc&authorization_token=61e784ca4e4215ebe3e0784760097328&inquiry_id=199349", "cleaning_date": null, "client_mobile": "079 174 42 01", "original_kind": "moving", "client_last_name": "sims", "client_first_name": "stuart ", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8003, "moving_postal_code": 8002, "authorization_token": "61e784ca4e4215ebe3e0784760097328", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "kehlhofstrasse 16", "moving_street_and_number": "lessingstrasse 17"}	2019-07-12 14:56:35.664982	2019-07-12 14:56:35.664982	Q3 2019
84	63	\N	\N	{"id": 202079, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 141329, "client_sex": "female", "partner_id": null, "client_city": "Lausanne", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2019-10-30", "client_email": "redlawkram@bluemail.ch", "continue_url": "https://customers.movu.ch/de/inquiries/638678ff0fb2e601c25f8b27f9bd916d/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjM5NzY4MTQuMzEwMTAxNX0.8WLEZwxaKf5lO16mExdlXs1yJePNjF97-bpaLzc1m3s&authorization_token=638678ff0fb2e601c25f8b27f9bd916d&inquiry_id=202079", "cleaning_date": null, "client_mobile": "078 767 44 44", "original_kind": "moving", "client_last_name": "Markwalder", "client_first_name": "Teresa", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 1004, "moving_postal_code": 8057, "authorization_token": "638678ff0fb2e601c25f8b27f9bd916d", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Rue du Maupas 36B", "moving_street_and_number": "Käferholzstrasse 54"}	2019-07-24 14:00:14.766234	2019-07-24 14:00:14.766234	Q3 2019
85	\N	20	\N	{"id": 202081, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 141329, "client_sex": "female", "partner_id": null, "client_city": "Lausanne", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "redlawkram@bluemail.ch", "continue_url": "https://customers.movu.ch/de/inquiries/60fbf1f8e27b7e8a36939972b156b643/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjM5NzY5MjAuNzA1NTUyNn0.PnCVmVJjsnojQ0U2whjgPUHXpon_upt0qDS3m5IiVh0&authorization_token=60fbf1f8e27b7e8a36939972b156b643&inquiry_id=202081", "cleaning_date": "2019-10-30", "client_mobile": "078 767 44 44", "original_kind": "cleaning", "client_last_name": "Markwalder", "client_first_name": "Teresa", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 1004, "moving_postal_code": null, "authorization_token": "60fbf1f8e27b7e8a36939972b156b643", "is_cleaning_request": true, "client_property_size": "size_1", "client_street_and_number": "Rue du Maupas 36B", "moving_street_and_number": null}	2019-07-24 14:02:01.015137	2019-07-24 14:02:01.015137	Q3 2019
86	64	\N	\N	{"id": 206162, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 143550, "client_sex": "female", "partner_id": null, "client_city": "Zürich ", "flow_status": "step_2", "moving_city": "Zürich ", "moving_date": "2019-08-30", "client_email": "schmidmonika029@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/c18d797b2d2b9efbb1cca2b2b49b1238/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjU2Mzc2NjcuNDYxODY1N30.fNz7UZ4deoST82ykCHQqKw2z_d69mCG-ZEG2ZL3oUlc&authorization_token=c18d797b2d2b9efbb1cca2b2b49b1238&inquiry_id=206162", "cleaning_date": null, "client_mobile": "078 675 43 21", "original_kind": "moving", "client_last_name": "Schmid", "client_first_name": "Monika", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8000, "moving_postal_code": 8000, "authorization_token": "c18d797b2d2b9efbb1cca2b2b49b1238", "is_cleaning_request": false, "client_property_size": "size_5", "client_street_and_number": "Josefstrasse 1", "moving_street_and_number": "Imgaicker 1"}	2019-08-12 19:21:07.937009	2019-08-12 19:21:07.937009	Q3 2019
87	65	\N	\N	{"id": 206615, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 143811, "client_sex": "female", "partner_id": null, "client_city": "Winkel", "flow_status": "step_2", "moving_city": "Winkel", "moving_date": "2019-10-03", "client_email": "jade32@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/9c195dc51c1abc7f8d46ecd5f3ea6fb5/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjU3ODU0MTYuNTA5Mjc5fQ.pPgul_S0CYF4HdBZ5dB_Ih8VrK5y2xRXpuZwHb6QCeo&authorization_token=9c195dc51c1abc7f8d46ecd5f3ea6fb5&inquiry_id=206615", "cleaning_date": null, "client_mobile": "079 823 99 46", "original_kind": "moving", "client_last_name": "Clerc", "client_first_name": "Jacqueline", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8185, "moving_postal_code": 8185, "authorization_token": "9c195dc51c1abc7f8d46ecd5f3ea6fb5", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Lufingerstrasse 48", "moving_street_and_number": "Mülibachstr. 7"}	2019-08-14 12:23:37.031477	2019-08-14 12:23:37.031477	Q3 2019
88	66	\N	\N	{"id": 210005, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 145661, "client_sex": "female", "partner_id": null, "client_city": "Bern", "flow_status": "step_2", "moving_city": "Ostermundigen", "moving_date": "2019-09-07", "client_email": "gabriela.mugglin@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/8305f4b6e5c6b9ae5b14a4b49d13623c/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjY5MzcwOTUuNTAzMzg5OH0.KjTwQtr80RbZiakPlRJEiMmpZWRvTVk8cnlz2WxGYJk&authorization_token=8305f4b6e5c6b9ae5b14a4b49d13623c&inquiry_id=210005", "cleaning_date": null, "client_mobile": "079 541 32 53", "original_kind": "moving", "client_last_name": "Mugglin", "client_first_name": "Gabriela", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3006, "moving_postal_code": 3072, "authorization_token": "8305f4b6e5c6b9ae5b14a4b49d13623c", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Mittelholzerstrasse, 12", "moving_street_and_number": "Wiesenstrasse 12"}	2019-08-27 20:18:15.880939	2019-08-27 20:18:15.880939	Q3 2019
89	67	\N	\N	{"id": 210632, "kind": "moving", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 137361, "client_sex": "male", "partner_id": null, "client_city": "Horgen", "flow_status": "step_2", "moving_city": "Horgen", "moving_date": "2019-10-01", "client_email": "rony.nehme@gmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/00bd9f1a85401fab4a06eeab170ab27f/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjcxNTAyOTEuOTE1NDkxfQ.Q0pRewM992g4ifSZKjd4Gnw07AEl8Ze7_Xr3_xtZqUk&authorization_token=00bd9f1a85401fab4a06eeab170ab27f&inquiry_id=210632", "cleaning_date": null, "client_mobile": "076 748 81 48", "original_kind": "moving", "client_last_name": "NEHME", "client_first_name": "Rony", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8810, "moving_postal_code": 8810, "authorization_token": "00bd9f1a85401fab4a06eeab170ab27f", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Dorfgasse 16", "moving_street_and_number": "Neudorfstrasse 58"}	2019-08-30 07:31:32.306018	2019-08-30 07:31:32.306018	Q3 2019
90	\N	21	\N	{"id": 210634, "kind": "cleaning", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 137361, "client_sex": "male", "partner_id": null, "client_city": "Horgen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "rony.nehme@gmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/63e5a4efa2f86527c5444f69805e428f/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NjcxNTAzNzMuMDAwODk1M30.HV-9PggW4M_3aOuqkKw37Oct7_R3IyEGHLoCUukdXe0&authorization_token=63e5a4efa2f86527c5444f69805e428f&inquiry_id=210634", "cleaning_date": "2019-10-02", "client_mobile": "076 748 81 48", "original_kind": "cleaning", "client_last_name": "NEHME", "client_first_name": "Rony", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 8810, "moving_postal_code": null, "authorization_token": "63e5a4efa2f86527c5444f69805e428f", "is_cleaning_request": true, "client_property_size": "size_1", "client_street_and_number": "Dorfgasse 16", "moving_street_and_number": null}	2019-08-30 07:32:53.311669	2019-08-30 07:32:53.311669	Q3 2019
91	68	\N	\N	{"id": 214523, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 148178, "client_sex": "female", "partner_id": null, "client_city": "Kloten", "flow_status": "step_2", "moving_city": "Kippel", "moving_date": "2019-10-14", "client_email": "kwyss@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/3ab14bcb41db8f4d75b50587195e57cb/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Njg0MDU4NjIuOTE4MDU2N30.qmQmvtAfMSMFvrN9VfalJqqLvuHW6VXS0wTetLbJdFQ&authorization_token=3ab14bcb41db8f4d75b50587195e57cb&inquiry_id=214523", "cleaning_date": null, "client_mobile": "079 422 17 31", "original_kind": "moving", "client_last_name": "Wyss", "client_first_name": "Katharina", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8302, "moving_postal_code": 3917, "authorization_token": "3ab14bcb41db8f4d75b50587195e57cb", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Rätschengässli 49", "moving_street_and_number": "Hauptstrasse 48"}	2019-09-13 20:17:43.574807	2019-09-13 20:17:43.574807	Q3 2019
92	\N	22	\N	{"id": 214524, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 148178, "client_sex": "female", "partner_id": null, "client_city": "Kloten", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "kwyss@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/5f39ee17fa011f0a98846dc0f412e10a/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Njg0MDU5NDEuMzgwODY2fQ.kyR36C_oGPgoPiyrSigei2l2gi_sQt3YxNi-iJ6ezyg&authorization_token=5f39ee17fa011f0a98846dc0f412e10a&inquiry_id=214524", "cleaning_date": "2019-10-01", "client_mobile": "079 422 17 31", "original_kind": "cleaning", "client_last_name": "Wyss", "client_first_name": "Katharina", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 8302, "moving_postal_code": null, "authorization_token": "5f39ee17fa011f0a98846dc0f412e10a", "is_cleaning_request": true, "client_property_size": "size_5", "client_street_and_number": "Rätschengässli 49", "moving_street_and_number": null}	2019-09-13 20:19:01.757822	2019-09-13 20:19:01.757822	Q3 2019
93	69	\N	\N	{"id": 216011, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 141434, "client_sex": "female", "partner_id": null, "client_city": "bienne", "flow_status": "step_2", "moving_city": "bienne", "moving_date": "2019-10-25", "client_email": "f_sch@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/68eea329e3c5259766c336197dbd7861/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Njg4NzgxOTIuNzIyNzg0M30.-aaXnFhM8BRaRPhY4QrqOtTjeAn9FoNARTMVTeOQMHE&authorization_token=68eea329e3c5259766c336197dbd7861&inquiry_id=216011", "cleaning_date": null, "client_mobile": "076 667 89 31", "original_kind": "moving", "client_last_name": "schütz", "client_first_name": "flavia", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 2502, "moving_postal_code": 2502, "authorization_token": "68eea329e3c5259766c336197dbd7861", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "rue karl-stauffer 18", "moving_street_and_number": "albrecht-hallerstrasse, 12"}	2019-09-19 07:29:53.191738	2019-09-19 07:29:53.191738	Q3 2019
94	70	\N	\N	{"id": 219936, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 151184, "client_sex": "male", "partner_id": null, "client_city": "Rotkreuz", "flow_status": "step_2", "moving_city": "Rotkreuz", "moving_date": "2019-11-20", "client_email": "arikschweiger@outlook.com", "continue_url": "https://customers.movu.ch/de/inquiries/b84e050ef7b8a63736531ff66edfbbde/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzAyODQ4NzEuODcxNTQ4N30.ndcJzKMi-7EmEIVMAl0JfFTVKPkNB_TPUzxI-vZhSjk&authorization_token=b84e050ef7b8a63736531ff66edfbbde&inquiry_id=219936", "cleaning_date": null, "client_mobile": "078 699 86 81", "original_kind": "moving", "client_last_name": "Schweiger", "client_first_name": "Arik", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 6343, "moving_postal_code": 6343, "authorization_token": "b84e050ef7b8a63736531ff66edfbbde", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Suurstoffi 29", "moving_street_and_number": "Suurstoffi 37"}	2019-10-05 14:14:32.38551	2019-10-05 14:14:32.38551	Q4 2019
95	71	\N	\N	{"id": 223172, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 153345, "client_sex": "male", "partner_id": null, "client_city": "Rheinfelden", "flow_status": "step_2", "moving_city": "Dietlikon", "moving_date": "2019-11-06", "client_email": "stephan.burri@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/00acd6c80081e423c45851e4d355b3c1/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzE2OTA0MTYuMzk4NjYyM30.ysiK5M66LjYFzd-SOPv_IKnm8ftD6sDNvvoLi84_MKw&authorization_token=00acd6c80081e423c45851e4d355b3c1&inquiry_id=223172", "cleaning_date": null, "client_mobile": "079 945 73 42", "original_kind": "moving", "client_last_name": "Burri", "client_first_name": "Stephan", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4310, "moving_postal_code": 8305, "authorization_token": "00acd6c80081e423c45851e4d355b3c1", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Pappelnweg 32", "moving_street_and_number": "Aufwiesenstrasse 14"}	2019-10-21 20:40:16.974754	2019-10-21 20:40:16.974754	Q4 2019
96	72	\N	\N	{"id": 223849, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 153846, "client_sex": "male", "partner_id": null, "client_city": "Basel", "flow_status": "step_2", "moving_city": "Basel", "moving_date": "2019-11-15", "client_email": "heto@posteo.ch", "continue_url": "https://customers.movu.ch/de/inquiries/a1b4add3059829b6be00ede949045a6c/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzE5ODk4ODEuODUxNDAwOX0.GWLWfYoNzNnrweZWuRYepbk0Z2BtqbbE01Mraq8rJaA&authorization_token=a1b4add3059829b6be00ede949045a6c&inquiry_id=223849", "cleaning_date": null, "client_mobile": "078 882 05 81", "original_kind": "moving", "client_last_name": "Heer", "client_first_name": "Tobias", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4057, "moving_postal_code": 4052, "authorization_token": "a1b4add3059829b6be00ede949045a6c", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Haltingerstrasse 31", "moving_street_and_number": "St. Alban Vorstadt 63"}	2019-10-25 07:51:22.415029	2019-10-25 07:51:22.415029	Q4 2019
97	73	\N	\N	{"id": 224400, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 154202, "client_sex": "female", "partner_id": null, "client_city": "Rüthi", "flow_status": "step_2", "moving_city": "Widnau", "moving_date": "2019-11-28", "client_email": "manu.duwe@googlemail.com", "continue_url": "https://customers.movu.ch/de/inquiries/abb412b980f769b1a82db65c4337aaaa/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzIyNzc2MTQuOTQyODI1fQ.14a3WNZ4xpyW9jJamdWdZ58wO4JF4jpuU9btb_IEEzE&authorization_token=abb412b980f769b1a82db65c4337aaaa&inquiry_id=224400", "cleaning_date": null, "client_mobile": "079 917 37 18", "original_kind": "moving", "client_last_name": "Duwe", "client_first_name": "Manu", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 9464, "moving_postal_code": 9443, "authorization_token": "abb412b980f769b1a82db65c4337aaaa", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Winkelstrasse 6", "moving_street_and_number": "Unterdorfstrasse 90 "}	2019-10-28 15:46:55.406711	2019-10-28 15:46:55.406711	Q4 2019
98	74	\N	\N	{"id": 226755, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 156004, "client_sex": "male", "partner_id": null, "client_city": "Volketswil", "flow_status": "step_2", "moving_city": "Volketswil", "moving_date": "2020-02-27", "client_email": "guido.vogt70@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/41c417a18ffadfe19752920f822444bf/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzM0NzAxNzEuNzYxNzg3N30.Z9EfY89jmlQ0t8_hueWzii28bvzyLGPThAteBOBKr6c&authorization_token=41c417a18ffadfe19752920f822444bf&inquiry_id=226755", "cleaning_date": null, "client_mobile": "079 917 77 05", "original_kind": "moving", "client_last_name": "Vogt", "client_first_name": "Guido", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 8604, "moving_postal_code": 8604, "authorization_token": "41c417a18ffadfe19752920f822444bf", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Stationsstrasse 23 a", "moving_street_and_number": "in der Höh 48"}	2019-11-11 11:02:52.38453	2019-11-11 11:02:52.38453	Q4 2019
99	75	\N	\N	{"id": 227735, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 156703, "client_sex": "male", "partner_id": null, "client_city": "Villnachern", "flow_status": "step_2", "moving_city": "Aristau", "moving_date": "2019-12-19", "client_email": "s.werly@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/545ac8c8ef7612ec2b8f696dcd098519/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzM5OTcwNTAuNjY5NzA0Mn0.deTe1wkZljocldl9XgA0arrrm5aoP_LkxNWEk-EbvJs&authorization_token=545ac8c8ef7612ec2b8f696dcd098519&inquiry_id=227735", "cleaning_date": null, "client_mobile": "078 908 08 01", "original_kind": "moving", "client_last_name": "Werly", "client_first_name": "Stefan", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 5213, "moving_postal_code": 5628, "authorization_token": "545ac8c8ef7612ec2b8f696dcd098519", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "10 Rebenweg", "moving_street_and_number": "Muristrasse 17"}	2019-11-17 13:24:11.233756	2019-11-17 13:24:11.233756	Q4 2019
100	76	\N	\N	{"id": 229136, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 157648, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2020-01-03", "client_email": "schenzle@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/009379a3b9ff81aab9b9720d3a2bf8fc/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzQ2OTIzMTkuMjI5NDI0NX0.v_x1e0Kvwfuts6L0IE_jkFyanslq_6S8N2B-BwbX6dQ&authorization_token=009379a3b9ff81aab9b9720d3a2bf8fc&inquiry_id=229136", "cleaning_date": null, "client_mobile": "079 768 63 76", "original_kind": "moving", "client_last_name": "Schenzle", "client_first_name": "Susanne", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8052, "moving_postal_code": 8055, "authorization_token": "009379a3b9ff81aab9b9720d3a2bf8fc", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Grubenackerstrasse 80", "moving_street_and_number": "Friesenbergstrasse 17"}	2019-11-25 14:31:59.770702	2019-11-25 14:31:59.770702	Q4 2019
101	77	\N	\N	{"id": 230280, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 158391, "client_sex": "female", "partner_id": null, "client_city": "Volketswil", "flow_status": "step_2", "moving_city": "Kloten", "moving_date": "2019-12-20", "client_email": "gaby.kingue@sunrise.ch", "continue_url": "https://customers.movu.ch/de/inquiries/fef07d143c154af59affa804d6f268dc/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzUzMTA4MDMuMzg4NTQ1NX0.wsFiMfDsNCWdqjFiWb-h8MxXrLyRfq8JE-AzbNAN-70&authorization_token=fef07d143c154af59affa804d6f268dc&inquiry_id=230280", "cleaning_date": null, "client_mobile": "076 440 28 86", "original_kind": "moving", "client_last_name": "Kingué", "client_first_name": "Gabriela", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8604, "moving_postal_code": 8602, "authorization_token": "fef07d143c154af59affa804d6f268dc", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Grindelstrasse 59", "moving_street_and_number": "Hagenholzstrasse 73"}	2019-12-02 18:20:04.252976	2019-12-02 18:20:04.252976	Q4 2019
102	78	\N	\N	{"id": 230529, "kind": "moving", "locale": "fr", "origin": "thirdparty_partner", "status": "submitted", "user_id": 152683, "client_sex": "female", "partner_id": null, "client_city": "berne", "flow_status": "step_2", "moving_city": "berne", "moving_date": "2020-01-29", "client_email": "houhou.siham@gmail.com", "continue_url": "https://customers.movu.ch/fr/inquiries/091e03f8004c905962e18ce942ef1876/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzU0NDgxNTAuNTY3OTY3N30.n7WPibv8JseAURYUbxpgaA9aD-rj_lUQCWLdR8AuNAI&authorization_token=091e03f8004c905962e18ce942ef1876&inquiry_id=230529", "cleaning_date": null, "client_mobile": "078 601 65 73", "original_kind": "moving", "client_last_name": "houhou", "client_first_name": "siham", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 3013, "moving_postal_code": 3015, "authorization_token": "091e03f8004c905962e18ce942ef1876", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "reiterstrasse 17", "moving_street_and_number": "weltpostrasse  3"}	2019-12-04 08:29:10.963421	2019-12-04 08:29:10.963421	Q4 2019
103	\N	23	\N	{"id": 230530, "kind": "cleaning", "locale": "fr", "origin": "thirdparty_partner", "status": "submitted", "user_id": 152683, "client_sex": "female", "partner_id": null, "client_city": "Berne", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "houhou.siham@gmail.com", "continue_url": "https://customers.movu.ch/fr/inquiries/7ea2c78e5cc5e2c5384fc2aefe2fe0dd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzU0NDgyMTYuNTY5NjMwOX0.CWQBQHxna_ZDyDE6l8S_EUbD3-KGMCkEjoMexB1RtEE&authorization_token=7ea2c78e5cc5e2c5384fc2aefe2fe0dd&inquiry_id=230530", "cleaning_date": "2020-01-30", "client_mobile": "078 601 65 73", "original_kind": "cleaning", "client_last_name": "houhou", "client_first_name": "siham", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 3013, "moving_postal_code": null, "authorization_token": "7ea2c78e5cc5e2c5384fc2aefe2fe0dd", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "reiterstrasse 17", "moving_street_and_number": null}	2019-12-04 08:30:16.919678	2019-12-04 08:30:16.919678	Q4 2019
104	79	\N	\N	{"id": 233747, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 160749, "client_sex": "male", "partner_id": null, "client_city": "Pratteln", "flow_status": "step_2", "moving_city": "Schötz", "moving_date": "2020-04-28", "client_email": "roland.glur@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/256be4971d2c90cf68adb510d851c37a/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzczNTEyMjguMzUyNTQ0NX0.6r3kpKIF36duuzO-yX-KHETrmFzg1mfBBea5INm87lo&authorization_token=256be4971d2c90cf68adb510d851c37a&inquiry_id=233747", "cleaning_date": null, "client_mobile": "079 245 60 76", "original_kind": "moving", "client_last_name": "Glur", "client_first_name": "Roland", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4133, "moving_postal_code": 6247, "authorization_token": "256be4971d2c90cf68adb510d851c37a", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Oberemattstrasse, 41", "moving_street_and_number": "Burgallee 1"}	2019-12-26 09:07:08.96446	2019-12-26 09:07:08.96446	Q4 2019
105	\N	24	\N	{"id": 233748, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 160749, "client_sex": "male", "partner_id": null, "client_city": "Pratteln", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "roland.glur@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/45e061a552cc4e0a7509d3275affe022/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzczNTEyNjcuNjI5NDR9.HgglBrtJmZWGsPHGh1Yn3Q8UeEbHRhD2xxWMRc5TxNg&authorization_token=45e061a552cc4e0a7509d3275affe022&inquiry_id=233748", "cleaning_date": "2020-04-29", "client_mobile": "079 245 60 76", "original_kind": "cleaning", "client_last_name": "Glur", "client_first_name": "Roland", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 4133, "moving_postal_code": null, "authorization_token": "45e061a552cc4e0a7509d3275affe022", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Oberemattstrasse 41", "moving_street_and_number": null}	2019-12-26 09:07:48.04324	2019-12-26 09:07:48.04324	Q4 2019
106	80	\N	\N	{"id": 234025, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 160947, "client_sex": "female", "partner_id": null, "client_city": "Bäch", "flow_status": "step_2", "moving_city": "Rüschlikon", "moving_date": "2020-01-18", "client_email": "hayley_van_de_glind@hotmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/8002d77237dbd9fd00acd51f21d9c758/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Nzc1Mzc2NDcuNzAxNTAzfQ.jEWtuf-LJ-Un5a2yRWtwItvIicAaidvSXZfzQj5b0x8&authorization_token=8002d77237dbd9fd00acd51f21d9c758&inquiry_id=234025", "cleaning_date": null, "client_mobile": "079 852 40 13", "original_kind": "moving", "client_last_name": "Van de Glind ", "client_first_name": "Hayley", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8806, "moving_postal_code": 8803, "authorization_token": "8002d77237dbd9fd00acd51f21d9c758", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Seestrasse 34b", "moving_street_and_number": "Alte Landstrasse 30"}	2019-12-28 12:54:14.330025	2019-12-28 12:54:14.330025	Q4 2019
107	81	\N	\N	{"id": 234786, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 161490, "client_sex": "female", "partner_id": null, "client_city": "Hünenberg", "flow_status": "step_2", "moving_city": "Dachsen", "moving_date": "2020-03-11", "client_email": "k@juste.li", "continue_url": "https://customers.movu.ch/de/inquiries/5d59503849cc73f346657218a6d722c3/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzgwNjAxMzguODM5NDI5NH0.pw1wD6ELqk4Ctd11Z-TBjAstwTLLMPe23ED32cBgKcE&authorization_token=5d59503849cc73f346657218a6d722c3&inquiry_id=234786", "cleaning_date": null, "client_mobile": "076 738 87 00", "original_kind": "moving", "client_last_name": "Juste", "client_first_name": "Kathrin", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 6331, "moving_postal_code": 8447, "authorization_token": "5d59503849cc73f346657218a6d722c3", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Rebenweg 11", "moving_street_and_number": "Rheinfallstrasse 11"}	2020-01-03 14:02:19.276618	2020-01-03 14:02:19.276618	Q1 2020
108	\N	25	\N	{"id": 234787, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 161490, "client_sex": "female", "partner_id": null, "client_city": "Hünenberg", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "k@juste.li", "continue_url": "https://customers.movu.ch/de/inquiries/a7bc3d6b714e31fcaf94460a8883db3b/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1NzgwNjAyMDUuMTExNjUwNX0.LjRPyB9MzZDOuK7xDdb8q2JDOgnQkXTuBnFVE1lcf8g&authorization_token=a7bc3d6b714e31fcaf94460a8883db3b&inquiry_id=234787", "cleaning_date": "2020-03-11", "client_mobile": "076 738 87 00", "original_kind": "cleaning", "client_last_name": "Juste", "client_first_name": "Kathrin", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 6331, "moving_postal_code": null, "authorization_token": "a7bc3d6b714e31fcaf94460a8883db3b", "is_cleaning_request": true, "client_property_size": "size_4", "client_street_and_number": "Rebenweg 11", "moving_street_and_number": null}	2020-01-03 14:03:25.463143	2020-01-03 14:03:25.463143	Q1 2020
109	82	\N	\N	{"id": 235865, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 162232, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Mettmenstetten", "moving_date": "2020-03-21", "client_email": "julia.binkert@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/53de3f62ae51d44d18d1aed92a28a85f/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Nzg0ODI4MjQuOTE4NjQyNX0.FAIw042dOPaypR2OXgejFkLxL1gh6J3tYf_BHWU8U_E&authorization_token=53de3f62ae51d44d18d1aed92a28a85f&inquiry_id=235865", "cleaning_date": null, "client_mobile": "076 432 77 38", "original_kind": "moving", "client_last_name": "Binkert", "client_first_name": "Julia", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8057, "moving_postal_code": 8932, "authorization_token": "53de3f62ae51d44d18d1aed92a28a85f", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Schaffhauserstrasse 139", "moving_street_and_number": "Langacherstrasse 10"}	2020-01-08 11:27:05.537805	2020-01-08 11:27:05.537805	Q1 2020
110	\N	26	\N	{"id": 235867, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 162232, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "julia.binkert@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/a256e1fa4eade9f0a0d817d7307e95ad/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Nzg0ODI4ODIuNDkwODEwNn0.-NfFf2c7cSBccH2gSI_IZMbGtMUa8jNPuNTZmCTu2K0&authorization_token=a256e1fa4eade9f0a0d817d7307e95ad&inquiry_id=235867", "cleaning_date": "2020-03-30", "client_mobile": "076 432 77 38", "original_kind": "cleaning", "client_last_name": "Binkert", "client_first_name": "Julia", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 8057, "moving_postal_code": null, "authorization_token": "a256e1fa4eade9f0a0d817d7307e95ad", "is_cleaning_request": true, "client_property_size": "size_2", "client_street_and_number": "Schaffhauserstrasse 139", "moving_street_and_number": null}	2020-01-08 11:28:02.86866	2020-01-08 11:28:02.86866	Q1 2020
111	83	\N	\N	{"id": 239275, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 156442, "client_sex": "female", "partner_id": null, "client_city": "Muttenz ", "flow_status": "step_2", "moving_city": "Muttenz ", "moving_date": "2020-02-25", "client_email": "jennifer.estella85@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/e7c61ffb799a18a1c220ca1393ce7ce2/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1Nzk2ODkxOTkuOTQ5NzQ5N30.345iWQWZBC7Zq76HlwTj7r8fatyyRQmD1W7GH0O7M9o&authorization_token=e7c61ffb799a18a1c220ca1393ce7ce2&inquiry_id=239275", "cleaning_date": null, "client_mobile": "076 474 17 38", "original_kind": "moving", "client_last_name": "Brunner", "client_first_name": "Jennifer", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 4132, "moving_postal_code": 4132, "authorization_token": "e7c61ffb799a18a1c220ca1393ce7ce2", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Seemättlistrasse 6", "moving_street_and_number": "Genossenschaftsstrasse 5"}	2020-01-22 10:33:20.469032	2020-01-22 10:33:20.469032	Q1 2020
112	84	\N	\N	{"id": 241316, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 165935, "client_sex": "female", "partner_id": null, "client_city": "Pully", "flow_status": "step_2", "moving_city": "Halten", "moving_date": "2020-03-17", "client_email": "monika@niederhofer.ch", "continue_url": "https://customers.movu.ch/de/inquiries/627225531919cd9ed876723ed3355141/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODAzNjYyNTQuMDI3Mjg5Mn0.Ja2WYQ9hY326Vtc45a1TcT_pjoYTe_I0wDlpk4TMu14&authorization_token=627225531919cd9ed876723ed3355141&inquiry_id=241316", "cleaning_date": null, "client_mobile": "076 725 94 24", "original_kind": "moving", "client_last_name": "Niederhofer", "client_first_name": "Monika", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 1009, "moving_postal_code": 4566, "authorization_token": "627225531919cd9ed876723ed3355141", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Chemin du Fau Blanc 5", "moving_street_and_number": "Turmstrasse 3"}	2020-01-30 06:37:34.566783	2020-01-30 06:37:34.566783	Q1 2020
113	\N	27	\N	{"id": 241317, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 165935, "client_sex": "female", "partner_id": null, "client_city": "Pully", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "monika@niederhofer.ch", "continue_url": "https://customers.movu.ch/de/inquiries/447608bb66fe9cc3de40afde4ffd61dc/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODAzNjYzMTYuNzg4NzUxNn0.dlZ-plELuZnIaD5z0n8ZZ2xeQRjhjZXJ_Lkr5aBSTck&authorization_token=447608bb66fe9cc3de40afde4ffd61dc&inquiry_id=241317", "cleaning_date": "2020-03-18", "client_mobile": "076 725 94 24", "original_kind": "cleaning", "client_last_name": "Niederhofer", "client_first_name": "Monika", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 1009, "moving_postal_code": null, "authorization_token": "447608bb66fe9cc3de40afde4ffd61dc", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Chemin du Fau Blanc 5", "moving_street_and_number": null}	2020-01-30 06:38:37.141318	2020-01-30 06:38:37.141318	Q1 2020
114	85	\N	\N	{"id": 241708, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 180, "client_sex": "male", "partner_id": null, "client_city": "Gossau SG", "flow_status": "step_2", "moving_city": "Gossau SG", "moving_date": "2020-04-30", "client_email": "harald.r@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/cf8608a427c051d6f6da18fb8cf453cd/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODA0ODQ4MjQuMDUxODk5NH0.WYn_AYUV3-pWxTWTLAZkAnrpdwFtA5YetshLk9PbCAw&authorization_token=cf8608a427c051d6f6da18fb8cf453cd&inquiry_id=241708", "cleaning_date": null, "client_mobile": "079 234 35 26", "original_kind": "moving", "client_last_name": "Ruehsheim", "client_first_name": "Harald", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 9200, "moving_postal_code": 9200, "authorization_token": "cf8608a427c051d6f6da18fb8cf453cd", "is_cleaning_request": false, "client_property_size": "size_1", "client_street_and_number": "Ringstrasse 18", "moving_street_and_number": "St.Gallerstrasse 118"}	2020-01-31 15:33:44.460791	2020-01-31 15:33:44.460791	Q1 2020
115	\N	28	\N	{"id": 241709, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 180, "client_sex": "male", "partner_id": null, "client_city": "Gossau SG", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "harald.r@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/2bd25ea7daa81316081e9d5973e1a3e5/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODA0ODQ5MTIuNzg3MDY5Nn0.QfGRQwwgG01NUZ0ow_UPSocoGasNJI55Bi6YLdnUH0I&authorization_token=2bd25ea7daa81316081e9d5973e1a3e5&inquiry_id=241709", "cleaning_date": "2020-04-30", "client_mobile": "079 234 35 26", "original_kind": "cleaning", "client_last_name": "Ruehsheim", "client_first_name": "Harald", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 9200, "moving_postal_code": null, "authorization_token": "2bd25ea7daa81316081e9d5973e1a3e5", "is_cleaning_request": true, "client_property_size": "size_2", "client_street_and_number": "Ringstrasse 18", "moving_street_and_number": null}	2020-01-31 15:35:13.148765	2020-01-31 15:35:13.148765	Q1 2020
116	\N	29	\N	{"id": 243462, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 167141, "client_sex": "male", "partner_id": null, "client_city": "Neuenhof", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "giuseppe.cannella@me.com", "continue_url": "https://customers.movu.ch/de/inquiries/c38920b784667484dd370fc052fd81c0/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODEwNzQ3MDQuOTU2MzkzN30.X1yHiWDXyO5jg4OS_5rx4B9Nq9-AmgbIHrVDRjUPeiI&authorization_token=c38920b784667484dd370fc052fd81c0&inquiry_id=243462", "cleaning_date": "2020-05-29", "client_mobile": "076 382 02 11", "original_kind": "cleaning", "client_last_name": "Cannella", "client_first_name": "Giuseppe", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 5432, "moving_postal_code": null, "authorization_token": "c38920b784667484dd370fc052fd81c0", "is_cleaning_request": true, "client_property_size": "size_2", "client_street_and_number": "Althofstrasse 5", "moving_street_and_number": null}	2020-02-07 11:25:05.332452	2020-02-07 11:25:05.332452	Q1 2020
117	86	\N	\N	{"id": 243954, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 167649, "client_sex": "male", "partner_id": null, "client_city": "Visp", "flow_status": "step_2", "moving_city": "Visp", "moving_date": "2020-04-23", "client_email": "k.oberhauser@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/5b6081cf67b17d03156a78b923f4ecc0/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODEyNzAwMDkuMjcyODk0OX0.tJ58V0PTuJNQDXKb_TOD_wvIDAUDhT-OmAlXx_QPEXk&authorization_token=5b6081cf67b17d03156a78b923f4ecc0&inquiry_id=243954", "cleaning_date": null, "client_mobile": "079 286 57 59", "original_kind": "moving", "client_last_name": "Oberhauser", "client_first_name": "Karl", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 3930, "moving_postal_code": 3930, "authorization_token": "5b6081cf67b17d03156a78b923f4ecc0", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Terbinerstrasse 7", "moving_street_and_number": "Brückenweg 12b"}	2020-02-09 17:40:09.811171	2020-02-09 17:40:09.811171	Q1 2020
118	\N	30	\N	{"id": 243956, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 167649, "client_sex": "male", "partner_id": null, "client_city": "Visp", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "k.oberhauser@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/ed40e86ad08124be438eaf07d322dea0/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODEyNzAwNTguMTY5NzE1Nn0.lDGfHJt-rB2bqRXAOrk-3ERPy1kiDZAYhnc9jOMCah8&authorization_token=ed40e86ad08124be438eaf07d322dea0&inquiry_id=243956", "cleaning_date": "2020-04-23", "client_mobile": "079 286 57 59", "original_kind": "cleaning", "client_last_name": "Oberhauser", "client_first_name": "Karl", "client_salutation": "mr", "is_moving_request": false, "client_postal_code": 3930, "moving_postal_code": null, "authorization_token": "ed40e86ad08124be438eaf07d322dea0", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Terbinerstrasse 7", "moving_street_and_number": null}	2020-02-09 17:40:58.554275	2020-02-09 17:40:58.554275	Q1 2020
119	\N	31	\N	{"id": 247807, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 170157, "client_sex": "female", "partner_id": null, "client_city": "Reichenburg", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "trinkler_tamara95@hotmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/1a2c9eebfa9b9b3db4fe6496ac073772/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODI0NjgxODEuODIzNTMxfQ.uk5tVtZUb3S3a_Phb_9Tc9cqWe8RO3Fjm8eMKVL620Q&authorization_token=1a2c9eebfa9b9b3db4fe6496ac073772&inquiry_id=247807", "cleaning_date": "2020-05-29", "client_mobile": "079 912 64 36", "original_kind": "cleaning", "client_last_name": "Trinkler", "client_first_name": "Tamara", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 8864, "moving_postal_code": null, "authorization_token": "1a2c9eebfa9b9b3db4fe6496ac073772", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Kistlerstrasse 8", "moving_street_and_number": null}	2020-02-23 14:29:42.335383	2020-02-23 14:29:42.335383	Q1 2020
120	87	\N	\N	{"id": 247808, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 170157, "client_sex": "female", "partner_id": null, "client_city": "Reichenburg", "flow_status": "step_2", "moving_city": "Siebnen", "moving_date": "2020-05-29", "client_email": "trinkler_tamara95@hotmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/3691636ba94acd09081f326ca65cd78f/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODI0NjgzMTguODg4MjIxfQ.zoc8Ro9fvncuicaDqricVMyfJUdFspec1-qeax53m0Q&authorization_token=3691636ba94acd09081f326ca65cd78f&inquiry_id=247808", "cleaning_date": null, "client_mobile": "079 912 64 36", "original_kind": "moving", "client_last_name": "Trinkler", "client_first_name": "Tamara", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8864, "moving_postal_code": 8854, "authorization_token": "3691636ba94acd09081f326ca65cd78f", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Kistlerstrasse 8", "moving_street_and_number": "Säntisstrasse 7"}	2020-02-23 14:31:59.297422	2020-02-23 14:31:59.297422	Q1 2020
121	88	\N	\N	{"id": 251814, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 172477, "client_sex": "female", "partner_id": null, "client_city": "Therwil", "flow_status": "step_2", "moving_city": "Therwil", "moving_date": "2020-04-20", "client_email": "sihan.hamdo@hotmail.ch", "continue_url": "https://customers.movu.ch/de/inquiries/a1c67ba17c9c484b6e418163078e308c/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODM3NzQ5NDAuOTE5OTgwOH0.Nd_lOVSG_g0IheEKNNZjoM3i-gEv7ODjQqtR299ho2k&authorization_token=a1c67ba17c9c484b6e418163078e308c&inquiry_id=251814", "unknown_date": false, "cleaning_date": null, "client_mobile": "078 672 94 77", "original_kind": "moving", "client_last_name": "Hamdo", "client_first_name": "Sihan", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 4106, "moving_postal_code": 4106, "authorization_token": "a1c67ba17c9c484b6e418163078e308c", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Im wilacker 21", "moving_street_and_number": "Baslerstrasse 11"}	2020-03-09 17:29:01.52363	2020-03-09 17:29:01.52363	Q1 2020
122	89	\N	\N	{"id": 257787, "kind": "moving", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 175025, "client_sex": "female", "partner_id": null, "client_city": "Schlieren", "flow_status": "step_2", "moving_city": "Schlieren", "moving_date": "2020-04-27", "client_email": "ebrooksbank@hotmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/96671d59f9e7d1da088bbb31baf8bcb3/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODY0NDc2OTIuNTA4MzkwN30.iuBtNBdKubDZyUAOA8WgALzqCWyrGjNOXZ_qFJNkyew&authorization_token=96671d59f9e7d1da088bbb31baf8bcb3&inquiry_id=257787", "unknown_date": false, "cleaning_date": null, "client_mobile": "078 800 67 12", "original_kind": "moving", "client_last_name": "Brooksbank", "client_first_name": "Emma", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8952, "moving_postal_code": 8952, "authorization_token": "96671d59f9e7d1da088bbb31baf8bcb3", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Badenerstrasse 26", "moving_street_and_number": "Badenerstrasse 26"}	2020-04-09 15:54:53.119655	2020-04-09 15:54:53.119655	Q2 2020
123	90	\N	\N	{"id": 258023, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 175814, "client_sex": "female", "partner_id": null, "client_city": "Schlieren", "flow_status": "step_2", "moving_city": "Merenschwand", "moving_date": "2020-06-26", "client_email": "linda.voneuw@gmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/da45c4f4078646d1d23635f3470cabc3/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODY3MDk5MjIuNDYwOTc4fQ.RSKYAryhlkoz-Y9wgy_som6gPvFZZYpDxYoJeCTMls0&authorization_token=da45c4f4078646d1d23635f3470cabc3&inquiry_id=258023", "unknown_date": false, "cleaning_date": null, "client_mobile": "078 945 69 26", "original_kind": "moving", "client_last_name": "von Euw", "client_first_name": "Linda", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8952, "moving_postal_code": 5634, "authorization_token": "da45c4f4078646d1d23635f3470cabc3", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Kesslerstrasse 9", "moving_street_and_number": "Sandweidstrasse 2"}	2020-04-12 16:45:23.528609	2020-04-12 16:45:23.528609	Q2 2020
124	91	\N	\N	{"id": 259215, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 176418, "client_sex": "male", "partner_id": null, "client_city": "Buchs", "flow_status": "step_2", "moving_city": "Bad Ragaz", "moving_date": "2020-06-15", "client_email": "walter.berger@gmx.ch", "continue_url": "https://customers.movu.ch/de/inquiries/536097ae85f1280938e85cc501cd1c5c/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODczODgyNjIuMzIyOTYwMX0.abtF7utx-4IToxA7pK8xNi-mMtalVWJDGEds3T9dh48&authorization_token=536097ae85f1280938e85cc501cd1c5c&inquiry_id=259215", "unknown_date": false, "cleaning_date": null, "client_mobile": "078 653 01 02", "original_kind": "moving", "client_last_name": "Berger", "client_first_name": "Walter", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 9470, "moving_postal_code": 7310, "authorization_token": "536097ae85f1280938e85cc501cd1c5c", "is_cleaning_request": false, "client_property_size": "size_4", "client_street_and_number": "Fichtenweg 12", "moving_street_and_number": "Weiligstrasse 50"}	2020-04-20 13:11:03.435857	2020-04-20 13:11:03.435857	Q2 2020
125	92	\N	\N	{"id": 259527, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 176567, "client_sex": "male", "partner_id": null, "client_city": "Wiliberg", "flow_status": "step_2", "moving_city": "Staffelbach", "moving_date": "2020-06-12", "client_email": "bg.roger@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/d21aae40b667ec52249a34b9d5e40677/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODc1NDAyMjQuOTYwMjQ0Mn0.WeNA5kgp0YDy1RB55bofkUScuQYHkyKY_qhuK-6KwRk&authorization_token=d21aae40b667ec52249a34b9d5e40677&inquiry_id=259527", "unknown_date": false, "cleaning_date": null, "client_mobile": "079 687 28 30", "original_kind": "moving", "client_last_name": "Roger", "client_first_name": "Burger", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 5058, "moving_postal_code": 5053, "authorization_token": "d21aae40b667ec52249a34b9d5e40677", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Buchacker 94", "moving_street_and_number": "Apfelweg 6"}	2020-04-22 07:23:45.645149	2020-04-22 07:23:45.645149	Q2 2020
126	93	\N	\N	{"id": 260589, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177052, "client_sex": "female", "partner_id": null, "client_city": "Steinhausen", "flow_status": "step_2", "moving_city": "Disentis", "moving_date": "2020-08-24", "client_email": "antuor@datazug.ch", "continue_url": "https://customers.movu.ch/de/inquiries/7257bdbe55a1870357e5c0a9e907bfd6/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODgwNjg4OTUuOTg2NDc3Nn0.LuKPx6NMAMR4Beqykt2-G6_QCUwlIADF4iM8xRAsg0A&authorization_token=7257bdbe55a1870357e5c0a9e907bfd6&inquiry_id=260589", "unknown_date": false, "cleaning_date": null, "client_mobile": "079 273 61 07", "original_kind": "moving", "client_last_name": "Tuor", "client_first_name": "Annemarie", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 6312, "moving_postal_code": 7180, "authorization_token": "7257bdbe55a1870357e5c0a9e907bfd6", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Neudorfstrassee 7", "moving_street_and_number": "Via Lucmagn 8"}	2020-04-28 10:14:56.858448	2020-04-28 10:14:56.858448	Q2 2020
127	\N	32	\N	{"id": 260593, "kind": "cleaning", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177052, "client_sex": "female", "partner_id": null, "client_city": "Steinhausen", "flow_status": "step_2", "moving_city": null, "moving_date": null, "client_email": "antuor@datazug.ch", "continue_url": "https://customers.movu.ch/de/inquiries/582635ddc279e159ce30afba9ac54a8f/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODgwNjk2OTAuODcxMjI4Mn0.jnbVKs23SiLKt8yyTLjDy5bmme4C7x61xkLOujFi7T8&authorization_token=582635ddc279e159ce30afba9ac54a8f&inquiry_id=260593", "unknown_date": false, "cleaning_date": "2020-08-26", "client_mobile": "079 273 61 07", "original_kind": "cleaning", "client_last_name": "Tuor", "client_first_name": "Annemarie", "client_salutation": "ms", "is_moving_request": false, "client_postal_code": 6312, "moving_postal_code": null, "authorization_token": "582635ddc279e159ce30afba9ac54a8f", "is_cleaning_request": true, "client_property_size": "size_3", "client_street_and_number": "Neudorfstr. 7", "moving_street_and_number": null}	2020-04-28 10:28:11.55853	2020-04-28 10:28:11.55853	Q2 2020
128	94	\N	\N	{"id": 261700, "kind": "moving", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177605, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Fribourg", "moving_date": "2020-07-01", "client_email": "anjaknab@hotmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/c8239694b52b26254f281f2ca654a7d2/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODg2MDgzNDkuMTYyOTU4Nn0.UrGaeSkQ1VEbZZRIWvX_fkwCEWPiNBjcfhdvPKi-0Yc&authorization_token=c8239694b52b26254f281f2ca654a7d2&inquiry_id=261700", "unknown_date": false, "cleaning_date": null, "client_mobile": "075 555 55 55", "original_kind": "moving", "client_last_name": "Knab", "client_first_name": "Anja", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8045, "moving_postal_code": 1700, "authorization_token": "c8239694b52b26254f281f2ca654a7d2", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Eichstrasse 20", "moving_street_and_number": "Avenue de l'Europe 20"}	2020-05-04 16:05:50.282489	2020-05-04 16:05:50.282489	Q2 2020
129	95	\N	\N	{"id": 261888, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177605, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2020-07-01", "client_email": "anjaknab@hotmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/fd374882d2dde5f72d8d78eb0fcb1961/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODg2ODg1NTAuODY0NTk4M30.r2nNMNMRJFbEWBP4JOMw5fZiDoGOy3gv8xmOTZJ8DeU&authorization_token=fd374882d2dde5f72d8d78eb0fcb1961&inquiry_id=261888", "unknown_date": false, "cleaning_date": null, "client_mobile": "075 555 55 55", "original_kind": "moving", "client_last_name": "Knab", "client_first_name": "Anja", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8045, "moving_postal_code": 8055, "authorization_token": "fd374882d2dde5f72d8d78eb0fcb1961", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Eichstrasse 20", "moving_street_and_number": "Im Tiergarten 50"}	2020-05-05 14:22:31.519806	2020-05-05 14:22:31.519806	Q2 2020
130	96	\N	\N	{"id": 261890, "kind": "moving", "locale": "en", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177605, "client_sex": "female", "partner_id": null, "client_city": "Zürich", "flow_status": "step_2", "moving_city": "Zürich", "moving_date": "2020-07-01", "client_email": "anjaknab@hotmail.com", "continue_url": "https://customers.movu.ch/en/inquiries/e381d59e1a9f740e0eba548c6594997b/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODg2ODkwODQuNTY0MDMxNn0.zOjLa3wEHOsmkqIOGb7Tgp9ORmZIKcd1RQEBzr7_RZk&authorization_token=e381d59e1a9f740e0eba548c6594997b&inquiry_id=261890", "unknown_date": false, "cleaning_date": null, "client_mobile": "075 555 55 55", "original_kind": "moving", "client_last_name": "Knab", "client_first_name": "Anja", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8045, "moving_postal_code": 8055, "authorization_token": "e381d59e1a9f740e0eba548c6594997b", "is_cleaning_request": false, "client_property_size": "size_2", "client_street_and_number": "Eichstrasse 20", "moving_street_and_number": "Im Tiergarten 50"}	2020-05-05 14:31:25.247144	2020-05-05 14:31:25.247144	Q2 2020
131	97	\N	\N	{"id": 262042, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177762, "client_sex": "male", "partner_id": null, "client_city": "Basel", "flow_status": "step_2", "moving_city": "Basel", "moving_date": "2020-07-07", "client_email": "freskim.ramushi@hotmail.com", "continue_url": "https://customers.movu.ch/de/inquiries/b72ae6867ad5b39000f73db6728b4408/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODg3NTk5MzIuODQ1NTk0Nn0.L3WpfeJw2aNVxhUMaVgcmVhLbOBnn1ll7nXOFgA8UQs&authorization_token=b72ae6867ad5b39000f73db6728b4408&inquiry_id=262042", "unknown_date": false, "cleaning_date": null, "client_mobile": "078 677 21 19", "original_kind": "moving", "client_last_name": "Ramushi", "client_first_name": "Freskim", "client_salutation": "mr", "is_moving_request": true, "client_postal_code": 4057, "moving_postal_code": 4057, "authorization_token": "b72ae6867ad5b39000f73db6728b4408", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Ackerstrasse 25", "moving_street_and_number": "Hammerstrasse 176"}	2020-05-06 10:12:13.80079	2020-05-06 10:12:13.80079	Q2 2020
132	98	\N	\N	{"id": 262279, "kind": "moving", "locale": "de", "origin": "thirdparty_partner", "status": "submitted", "user_id": 177863, "client_sex": "female", "partner_id": null, "client_city": "Forch", "flow_status": "step_2", "moving_city": "Forch", "moving_date": "2020-06-01", "client_email": "dior.senegal@bluewin.ch", "continue_url": "https://customers.movu.ch/de/inquiries/61870f5059a404d822c36ac8920073f5/steps/step_2?auth_token=eyJhbGciOiJIUzI1NiJ9.eyJrZXkiOjE1ODg4NTcyNTIuNjk4NjI1Nn0.078Jf4wCqFzOm-Es7OA_rLW_rhbH7RnRXkDNfb0hjCo&authorization_token=61870f5059a404d822c36ac8920073f5&inquiry_id=262279", "unknown_date": false, "cleaning_date": null, "client_mobile": "079 477 32 16", "original_kind": "moving", "client_last_name": "Dieng", "client_first_name": "Dior", "client_salutation": "ms", "is_moving_request": true, "client_postal_code": 8127, "moving_postal_code": 8127, "authorization_token": "61870f5059a404d822c36ac8920073f5", "is_cleaning_request": false, "client_property_size": "size_3", "client_street_and_number": "Tobelstrasse 22", "moving_street_and_number": "Wassbergstrasse 37"}	2020-05-07 13:14:13.550471	2020-05-07 13:14:13.550471	Q2 2020
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20180421211338
20180421222001
20180421223558
20180513145658
20180609112915
20180710142233
20180710142235
20180710142237
20180823213240
20180919010339
20191005183706
20191005183707
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	info@umzug-offerte-schweiz.com	$2a$11$fmNtWrzGwkIDJk9Kz3/bTOHbIhGMpWcLSspyFeoV7fC4Qi7i1B5Im	\N	\N	\N	147	2020-05-07 13:57:35.52066	2020-04-10 13:37:06.739754	82.169.49.47	82.169.49.47	2018-07-04 05:46:07.737842	2020-05-07 13:57:35.521642
2	invoice@movu.ch	$2a$11$dCWsbAIZyp48ao6J9gESGuBNL1wVyDhp5xWN1IGvLj8XWA9nxU8Q6	\N	\N	\N	0	\N	\N	\N	\N	2019-10-07 01:03:59.588528	2019-10-07 01:03:59.588528
\.


--
-- Name: ahoy_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ahoy_messages_id_seq', 42, true);


--
-- Name: cleaning_inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cleaning_inquiries_id_seq', 32, true);


--
-- Name: combined_inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combined_inquiries_id_seq', 1, false);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 7, true);


--
-- Name: moving_inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moving_inquiries_id_seq', 98, true);


--
-- Name: received_inquiry_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.received_inquiry_responses_id_seq', 132, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ahoy_messages ahoy_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ahoy_messages
    ADD CONSTRAINT ahoy_messages_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cleaning_inquiries cleaning_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cleaning_inquiries
    ADD CONSTRAINT cleaning_inquiries_pkey PRIMARY KEY (id);


--
-- Name: combined_inquiries combined_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combined_inquiries
    ADD CONSTRAINT combined_inquiries_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: moving_inquiries moving_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moving_inquiries
    ADD CONSTRAINT moving_inquiries_pkey PRIMARY KEY (id);


--
-- Name: received_inquiry_responses received_inquiry_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.received_inquiry_responses
    ADD CONSTRAINT received_inquiry_responses_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_ahoy_messages_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ahoy_messages_on_token ON public.ahoy_messages USING btree (token);


--
-- Name: index_ahoy_messages_on_user_type_and_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ahoy_messages_on_user_type_and_user_id ON public.ahoy_messages USING btree (user_type, user_id);


--
-- Name: index_received_inquiry_responses_on_cleaning_inquiry_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_received_inquiry_responses_on_cleaning_inquiry_id ON public.received_inquiry_responses USING btree (cleaning_inquiry_id);


--
-- Name: index_received_inquiry_responses_on_combined_inquiry_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_received_inquiry_responses_on_combined_inquiry_id ON public.received_inquiry_responses USING btree (combined_inquiry_id);


--
-- Name: index_received_inquiry_responses_on_moving_inquiry_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_received_inquiry_responses_on_moving_inquiry_id ON public.received_inquiry_responses USING btree (moving_inquiry_id);


--
-- Name: index_received_inquiry_responses_on_response_body; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_received_inquiry_responses_on_response_body ON public.received_inquiry_responses USING btree (response_body);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: received_inquiry_responses fk_rails_6cbdad3ba8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.received_inquiry_responses
    ADD CONSTRAINT fk_rails_6cbdad3ba8 FOREIGN KEY (moving_inquiry_id) REFERENCES public.moving_inquiries(id);


--
-- Name: received_inquiry_responses fk_rails_72afea4e29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.received_inquiry_responses
    ADD CONSTRAINT fk_rails_72afea4e29 FOREIGN KEY (combined_inquiry_id) REFERENCES public.combined_inquiries(id);


--
-- Name: received_inquiry_responses fk_rails_c79ee7a598; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.received_inquiry_responses
    ADD CONSTRAINT fk_rails_c79ee7a598 FOREIGN KEY (cleaning_inquiry_id) REFERENCES public.cleaning_inquiries(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

