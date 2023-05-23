chat_mgsi.sql                                                                                       0000644 0000000 0000000 00000631671 14433117261 011743  0                                                                                                    ustar 00                                                                0000000 0000000                                                                                                                                                                        --
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    uid character(16) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO root;

--
-- Name: TABLE categories; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.categories IS 'Used to store categories.';


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO root;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.events (
    id integer NOT NULL,
    sender_id character varying(255) NOT NULL,
    type_name character varying(255) NOT NULL,
    "timestamp" double precision,
    intent_name character varying(255),
    action_name character varying(255),
    data text
);


ALTER TABLE public.events OWNER TO root;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO root;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: question_examples; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.question_examples (
    id bigint NOT NULL,
    uid character(16) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    question_id bigint NOT NULL,
    example text NOT NULL
);


ALTER TABLE public.question_examples OWNER TO root;

--
-- Name: TABLE question_examples; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.question_examples IS 'Used to store question examples.';


--
-- Name: question_examples_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.question_examples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_examples_id_seq OWNER TO root;

--
-- Name: question_examples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.question_examples_id_seq OWNED BY public.question_examples.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    uid character(16) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    category_id bigint NOT NULL,
    question text NOT NULL,
    answear text NOT NULL,
    links jsonb,
    tables jsonb,
    active boolean NOT NULL
);


ALTER TABLE public.questions OWNER TO root;

--
-- Name: TABLE questions; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.questions IS 'Used to store questions.';


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO root;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: question_examples id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.question_examples ALTER COLUMN id SET DEFAULT nextval('public.question_examples_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.categories (id, uid, created_at, updated_at, deleted_at, name) FROM stdin;
1	NWF5ZXMBFCNSZBNB	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Direkcija za vodne puteve
2	UXQ5I1MZWKJ7QKRQ	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za vazdušni saobraćaj i transport opasne robe
3	QDLJQ4I6NUUYEWZD	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za vodni saobraćaj i bezbednost plovidbe
4	ZL2SUAH3YASJQ8NJ	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za građevinske poslove, sprovođenje objedinjene procedure i ozakonjenje
5	2FNYFLUUWUAWPRM1	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za drumski transport, puteve i bezbednost saobraćaja
6	FUXLI95BAYOFBFUO	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za železnice i intermodalni transport
7	C5VSLQRCUOGIK2SN	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za inspekcijski nadzor
8	CUXEB5HYR9LJW53H	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za prostorno planiranje i urbanizam
9	XDT2QTMJKCNGLSUK	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Sektor za stambenu i arhitektonsku politiku, komunalne delatnosti i energetsku efikasnost
10	WJTKDBDHA3CDKVYR	2023-05-22 08:07:52	2023-05-22 08:07:52	\N	Uprava za utvrđivanje sposobnosti brodova za plovidbu
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.events (id, sender_id, type_name, "timestamp", intent_name, action_name, data) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2019_12_14_000001_create_personal_access_tokens_table	1
2	2023_05_20_080000_create_categories_table	1
3	2023_05_20_080200_create_questions_table	1
4	2023_05_20_080400_create_question_examples_table	1
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: question_examples; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.question_examples (id, uid, created_at, updated_at, deleted_at, question_id, example) FROM stdin;
22	M8JD4BMQXYW4HWID	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	22	Kako je moguće zatražiti pomoć osobama sa ivaliditetom prilikom dolaska na aerodrom Nikola Tesla Beograd, kao i na samom letu?
23	EKAECOB14N9VCOJE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	23	Gde se može proveriti red letanja Air Serbia ka određenim destinacijama?
24	MOCSS9X4B58LWZLJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	24	Kojim vidovima prevoza se može doći iz centra grada Beograda do aerodroma Nikola Tesla Beograd?
25	NONLM7ESTDQUUC85	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	25	U kojim slučajevima je potrebno da vozač poseduje ADR sertifikat za vozača vozila za prevoz opasne robe drumom?
26	LEH67SLXUDA6BYMO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	26	Na koji način se vrši uvoz pokretne opreme pod pitiskom ili ambalaže za prevoz opasne robe u Srbiju?
27	BLMNDOJBKBOXCXWC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	27	Na koju imejl adresu se dostavljaju godišnji izveštaji savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) u elektronskoj formi?
28	ZYALIGHKSVIODXBN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	28	Da li je za produženje važenja sertifikata za savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) potrebno odslušati obuku u ovlašćenom privrednom društvu ili drugom pravnom licu?
29	N1DIRECJ5KVSCI8V	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	29	Da li je za boce za vazduh koje se ugrađuju u vozila potrebno pribavljanje isprave o usaglašenosti prilikom uvoza u Srbiju?
30	T5CMUL4KV8E0VBS3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	30	Koji su kontakti lučkih kapetanija?
31	4MFJQANXATL7UQ5L	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	31	Gde mogu da se izvrše zdravstveni pregledi za izdavanje brodarske knjižice?
32	QFO5QXDQUEZLU45P	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	32	Gde mogu da se izvrše zdravstveni pregledi za izdavanje pomorske knjižice?
33	IJJDTALNBET1AMGG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	33	Koje je radno vreme lučkih kapetanija?
34	ETBMBNBNVXCRCWQJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	34	Koje su ovlašćene kompanije za posredovanje pri zapošljavanju pomoraca?
35	XZWKOWGGL2WL7COL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	35	Da li postoji u Republici Srbiji akreditovana institucija za obuku pomoraca i brodaraca?
36	IXC3E1OOFTCDXYZJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	36	Gde se izdaju međunarodne dozvole za upravljanje čamcem?
37	SVDIV4MNHOL5NXJR	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	37	Gde se rade tehnički pregledi čamaca namenjenih za sport i razonodu?
38	HKBKXJPFEZUT94TE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	38	Gde se rade tehnički pregledi čamaca namenjenih za privredne svrhe?
39	7UAOXT7EGHPN3RGG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	39	Koji je broj žiro-računa na koji se uplaćuju administrativne takse?
40	V1L2JGBENMGALMDM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	40	Gde se izdaju dozvole za upravljanje čamcem?
41	JDR8NR9EQFL6U05T	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	41	Gde se polaže ispit za vozara unutrašnje plovidbe i gde mogu da se pronađu pitanja za pripremu ispita?
42	ZOD7O7KIKKPXNCHM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	42	Da li se u Republici Srbiji priznaju ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama Evropske unije?
43	AABTBYQLYC5BMQKS	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	43	Da li je potrebno odobrenje za održavanje sportskih manifestacija na vodnom putu?
44	G01B8NQVRVCTCVEP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	44	Ko može da se bavi proizvodnjom čamaca u Republici Srbiji?
2	3QEYGKAIUWLLLIH5	2023-05-22 08:07:52	2023-05-22 20:50:13	2023-05-22 20:50:13	2	Interesuje me gde je moguće kupiti izdanja plovidbenih karata Dunava, Tise i Save?
3	KBPFVJRKIM1LHSHG	2023-05-22 08:07:52	2023-05-22 21:05:43	2023-05-22 21:05:43	3	Sa portala Direkcije za vodne puteve su preuzete elektronske plovidbene karte Dunava, Tise i Save, kako mogu da im pristupim?
4	BUVA7F6NNXFG3HQR	2023-05-22 08:07:52	2023-05-22 21:46:27	2023-05-22 21:46:27	4	Koja je procedura za ihodovanje Mišljenja u postupku izdavanja vodnih akata za vađenje rečnih nanosa?
5	PDEFGUFBRWP3GNVG	2023-05-22 08:07:52	2023-05-22 21:57:32	2023-05-22 21:57:32	5	Koja je procedura za postavljanje plutajućih objekata na vodnom zemljištu?
7	SCPS58W4MQUOWR4N	2023-05-22 08:07:53	2023-05-22 22:27:15	2023-05-22 22:27:15	7	Zanima me procedura registracije plovila?
8	8KMHCWLBW06P2RPH	2023-05-22 08:07:53	2023-05-22 22:35:56	2023-05-22 22:35:56	8	Želim da imam uvid u lokaciju plovila u okviru RIS sistema.
9	CCF7CPG6GL6JVKIH	2023-05-22 08:07:53	2023-05-22 22:40:52	2023-05-22 22:40:52	9	Potreban mi je uvid u istoriju kretanja plovila koje je izazvalo incident.
11	QT0JFIKTCY8LFQTD	2023-05-22 08:07:53	2023-05-22 22:48:02	2023-05-22 22:48:02	11	Za koje radove na međunarodnim i međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?
10	VDAGVB7MH6TKVCQW	2023-05-22 08:07:53	2023-05-22 22:52:29	2023-05-22 22:52:29	10	Na kojoj kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim i međudržavnim rekama?
12	C6C3DTK5QQ58HFFN	2023-05-22 08:07:53	2023-05-23 12:00:12	2023-05-23 12:00:12	12	Koji organ državne uprave je nadležan za uspostavljanje linijskog rečnog saobraćaja?
13	AQ4ET6BSHGGRTIPC	2023-05-22 08:07:53	2023-05-23 12:03:43	2023-05-23 12:03:43	13	Interesuje me postupak izdavanja plovidbenih dozvola?
14	BVRTAGIKYKCCRQXS	2023-05-22 08:07:53	2023-05-23 12:08:32	2023-05-23 12:08:32	14	Kako se može doći do Plana obeležavanja Dunava Save i Tise?
15	6RYYIWNKSG01YEAW	2023-05-22 08:07:53	2023-05-23 12:11:37	2023-05-23 12:11:37	15	Koja pravna lica mogu da obavljaju hidrografska merenja?
16	L1CYTIZ84XKNSB0R	2023-05-22 08:07:53	2023-05-23 12:21:12	2023-05-23 12:21:12	16	Koje su obaveze pravnih lica koja vrše hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?
17	NMOOXMYU2RRYNOWT	2023-05-22 08:07:53	2023-05-23 12:25:33	2023-05-23 12:25:33	17	Koji je sadržaj projekta za izvođenje poslova u okviru hidrografske delatnosti?
18	QQWPGZODAVKWAKJN	2023-05-22 08:07:53	2023-05-23 12:36:32	2023-05-23 12:36:32	18	Koja je procedura za ishodovanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima, koje izdaje Direkcija za vodne puteve?
19	TF30UOIVJ4SHJGMB	2023-05-22 08:07:53	2023-05-23 12:40:57	2023-05-23 12:40:57	19	Na kojoj kojoj web lokaciji se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?
20	RHBPERPIESR0ED6H	2023-05-22 08:07:53	2023-05-23 12:46:05	2023-05-23 12:46:05	20	Kako se vrši povraćaj novca usled otkazivanja leta?
21	QBEDOVHT9QTMIBKP	2023-05-22 08:07:53	2023-05-23 12:53:50	2023-05-23 12:53:50	21	Kako je moguće pronaći izgubljeni prtljag na aerodormu Nikola Tesla Beograd?
45	EHNNJFS30C0MJPNV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	45	Da li strani brodovima mogu da uplove u državni vodni put?
46	D3QVF1FHPZHZIYNT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	46	Ko u Republici Srbiji vrši utvrđivanje sposobnosti za plovidbu brodova unutrašnje plovidbe?
47	OGSPDYPCPWBLRVLA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	47	Ko izdaje odobrenja za obavljanje lučkih delatnosti u lukama i pristaništima?
48	I6WKSEWQ059Q2FRX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	48	Ko je nadležan za održavanje i obeležavanje Dunava i Save?
49	ZCN8UAAFTYSVJ7RX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	49	Gde se podnose zahtevi za izdavanje ovlašćenja o osposobljenosti članova posade brodova unutrašnje plovidbe?
50	F4GLQ8L4RCNKXVCM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	50	Šta je sertifikat zelene gradnje, ko je nadležan za izdavanje sertifikata zelene gradnje?
51	TOEIUR1B93A3U9UM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	51	Кako se određuje projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju?
52	F3RBN8EER6NDIAOE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	52	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta za koji je utvrđeno da je od posebnog značaja za Republiku Srbiju, sprovodi na osnovu donetog rešenja nadležne službe za katastar nepokretnosti?
53	A47XFMWCMF7BUWZE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	53	Da li se objekti, odnosno radovi za koje je utvrđeno da predstavljaju Projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju, mogu izvoditi na šumskom, odnosno poljoprivrednom zemljištu, odnosno da li je potrebna promena namene zemljišta, pre podnošenja zahteva za izdavanje građevinske dozvole?
54	MTDNTSVMSEK79A4A	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	54	Potrebno je tokom realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju izmestiti infrastrukturu, odnosno ukloniti/srušiti objekat koji je izgrađen suprotno zakonu, na koji način se u tom slučaju mogu rešiti imovinsko-prani odnosi?
55	LBMMJ4N7RUE2JEWZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	55	U postupku realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju, predviđeno je rušenje nezakonito izgrađene porodične kuće, koja su prava vlasnika iste?
56	SOLRKLPG4S0GH8YX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	56	Da li nadležni organ može da se obraća imaocima javnih ovlašćenja za izdavanje uslova, u postupku izdavanja lokacijskih uslova, ukoliko su u postupku izrade urbanističkog projekta već pribavljeni uslovi imalaca javnih ovlašćenja, takođe Da li će nadležni organ u postupku izdavanja lokacijskih uslova pribavljati dodatne uslove imaoca javnih ovlašćenja u odnosu na tehničke uslove pribavljene za izradu urbanističkog projekta?
57	KFQVAJZZTXJJ0FGC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	57	Planiramo izgradnju objekta površina preko 20.000m2, da li možemo podneti zahtev za izdavanje lokacijskih uslova i ostalih akata Ministarstvu građevinarstva, saobraćaja i infrastrukture?
58	ABWMUFFLWNAXZMHX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	58	Nadležni organ jedinice lokalne samouprave nije doneo odluku u roku od 30 dana od dana podnošenja zahteva za izdavanje lokacijskih uslova, koja su moja prava?
59	PKQRV9ZOULFOW0YO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	59	Da li trećem licu može biti priznato svojstvo strane u postupku izdavanja građevinske dozvole?
60	KOVGXW0KDZPGDCZI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	60	Кako se podnosi zahtev za ishodovanje lokacijskih uslova?
61	XUPSGTFGBC8H2TFX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	61	Da li je za izradu idejnog rešenja, a za potrebe pribavljanja lokacijskih uslova potrebna velika licenca?
62	CBXOZEJXLHRSP16Y	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	62	Кoju dokumentaciju je potrebno dostaviti uz zahtev za izdavanje lokacijskih uslova?
63	BX0Y2M8G2UYQ9QEA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	63	Da li je potrebno pribaviti akt nadležnog organa, građevinsku dozvolu odnosno rešenje o odobrenju za izvođenje radova, za radove na obejktu koji obuhvataju gletovanje i krečenje zidova, zamenu sanitarija u kupatilu, farbanje i popravku stolarije, kao i hoblovanje i lakiranje parketa“?
64	OO0SWCDNGJ967C4F	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	64	Da li izvođač radova može sve neophodne velike licence potrebne za izvođenje radova koje je ugovorio (koje su prepoznate kao neophodne shodno radovima definisanim ugovorom o građenju) da obezbedi preko jednog ili više podizvođača, a da pri tome izvođač radova kao pravno lice ne poseduje nijednu“?
65	Y5L3ERYAYI4YRTVV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	65	Da li je Rešenje o građevinskoj dozvoli doneto pre stupanja na snagu Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/13-US, 50/13-US, 98/13-US, 132/2014, 145/2014 i 83/2018), kojim je uvedeno da se  važenje građevinske dozvole vezuje za momenat prijave radova, i dalje važeće“ ?
66	XOSIK2CTWZDHBFOW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	66	Da li je potrebno pribavljanje akta nadležnog organa za izvođenje radova na postavljanju postrojenja instalisane snage do 50kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca – proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije?
67	LJNDNA1ZMRSYCFLU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	67	Šta je od dokumentacije potrebno dostaviti kako bi se dobila upotrebna dozvola i uknjižio objekat koji poseduje dozvolu za gradnju?
68	RONYCUKAITGFFTNA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	68	U čijoj nadležnosti je izdavanje građevinske dozvole za izgradnju postrojenja za tretman neopasnog otpada kapaciteta od oko 8 t na dnevnom nivou?
69	6AOSUVSEYXX0HRA2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	69	Da li predmet ozakonjenja može biti objekat za koji iz objektivnih razloga nije moguće pribaviti saglasnost suvlasnika na zemljištu?
70	GQFJ86TUB9K2S62H	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	70	Кada će biti omogućeno privremeno priključenje nezakonito izgrađenih objekata na mrežu, odnosno infrastrukturu?
71	RYY0DV3MWSXTSAFO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	71	Da li rešenje o ozakonjenju ima istu pravnu snagu kao i građevinska i upotrebna dozvola ili ne?
72	KFZE42Y9IE12KJ2Z	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	72	Кada su planirane izmene Zakona o ozakonjenju objekata („Službeni glasnik RS”, broj 96/15, 83/18, 81/20 - US, 1/23 – US), ili donošenje novog zakona u oblasti ozakonjenja kojim će biti omogućeno ozakonjenje nezakonito izgrađenih objekata izgrađenih posle 27. novembra 2015. godine?
73	CBGMSPZ70PWSPJZG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	73	Кoji su uslovi za dobijanje velikih licenci, odnosno rešenja o ispunjenosti uslova za izradu tehničke dokumentacije i građenje objekata?
74	EZ9XBS7Q8KC4Q0RJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	74	Da li lica koja poseduju licencu u stranoj državi mogu da obavljaju stručne poslove u svojstvu ovlašćenog lica u Republici Srbiji?
75	NLS4WKOHG9ICUOQU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	75	KO JE NADLEŽAN ZA POPRAVKU KOLOVOZA U ULICI ?
76	A20LCIVDFJIAMANU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	76	NA DRŽAVNOM PUTU U NASELjU PRIMEĆENO JE DA NE RADI SEMAFOR. KO JE NADLEŽAN ZA NjEGOVU POPRAVKU?
77	HTZNRYGLLTYAMUX0	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	77	TRAŽI SE SANACIJA UDARNIH RUPA NA DRŽAVNOM PUTU
78	OC8MYTYT6QCUTOWD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	78	TRAŽI SE IZGRADNjA TROTOARA NA DRŽAVNOM PUTU U NASELjU
79	PVT8DNORP89Q6XOJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	79	TRAŽI SE FINANSIJSKA POMOĆ ZA POPRAVKU I ASFALTIRANjE LOKALNIH(OPŠTINSKIH) PUTEVA
80	XU38UIQT5H0RXLLY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	80	TRAŽI SE ISPLATA EKSPROPRISANOG ZEMLjIŠTA ZA IZGRADNjU PUTA
81	D5ICLTLTNYVFQGIG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	81	KO IZDAJE DOZVOLE ZA VANREDNI PREVOZ ?
82	RDIKABIFZQMGR6PG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	82	TRAŽI SE POSTAVLjANjE ,,LEŽEĆIH POLICAJACA“ U ZONI ŠKOLA NA DRŽAVNOM PUTU
83	MFMQMFWGEDI897MZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	83	ŠTA JE POTREBNO ZA IZDAVANjE REŠENjA ZA POSTAVLjANjE SAOBRAĆAJNE SIGNALIZACIJE ZA VREME IZVOĐENjA RADOVA ( ili održavanja manifestacije) NA DRŽAVNOM PUTU?
84	MSET37T0BB1QRFUA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	84	ŠTA JE POTREBNO ZA IZDAVANjE REŠENjA KOJIM SE PRODUŽAVA PERIOD VAŽENjA PRETHODNO IZDATOG REŠENjA ZA TEHNIČKO REGULISANjE SAOBRAĆAJA
85	JYZNNVR3FGW3TREE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	85	Koji je uslov da domaći prevoznik može da dobije dozvole za obaljanje međunarodnog prevoza tereta?
86	XUNFNYCVPP5NWVJW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	86	Šta čini pojedinačni plan raspodele dozvola?
87	4OHUJHXXQVUJ52RK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	87	Gde i kako mogu da se podnose zahtevi za pojedinačni plan raspodele dozvola?
88	4CQGJY4OLJIE8QJ4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	88	Kada se utvrđuje pojedinačni plan raspodele?
89	PDHAAQ2TSMOQJTBR	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	89	Gde i kako mogu da se podnose zahtevi za zaduženje i razduženje dozvola za prevoz tereta?
90	ZFWU3EOG9BFJ5WXO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	90	Da li je dovoljno da se podnese zahtev za pojedinačni plan raspodele dozvola jednom godišnje?
91	7DAFUAXJIG8VMSTZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	91	Da li postoje rokovi za razduženje pojedinačnih dozvola?
92	N1GMIQVXNSSWEJBT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	92	Da li prevoznik koji nije predao zahtevi za pojedinačni plan raspodele dozvola, ako je počeo obavljanje delatnosti prevoza tereta nakon tog roka, može da podnese zahtev za reviziju pojedinačnog plana?
93	DGDXKXFH2URZLEKD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	93	Koliko ima revizija i kada se podnose zahtevi?
94	P9I0VKKCJRMGEJ8W	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	94	Da li prevoznici mogu da podnose zahteve za dobijanje pojedinačnih dozvola tokom godine a da nisu podneli zahteve za utvrđivanje pojedinačnog plana raspodele i nemaju dozvole u planu?
95	S9YMB96DA8JNU16C	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	95	Koji je uslov za obavljanje javnog prevoza putnika u drumskom saobraćaju?
96	Z2TEMZ1M8CQRDQCF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	96	Koji je uslov za obavljanje javnog prevoza tereta u drumskom saobraćaju?
97	VYNNITIGTJHO7USB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	97	Ko može da bude odgovorno lice kod domaćeg prevoznika?
98	DPAET9I5OSS1TH9D	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	98	Gde je moguće pronaći uputstvo i zahtev za izdavanje licence za prevoz?
99	LEZAHYSZKGWMUMYD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	99	Gde je moguće pronaći uputstvo i zahtev za izdavanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?
100	OJYOMUPTNBIFZEJM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	100	Da li je potrebno posedovati izvod licence za prevoz za svako vozilo iz voznog parka prevoznika?
101	H4OJETTZ4PZ9JQBM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	101	Do koje najveće dozvoljene mase vozila nije potreban izvod licence za prevoz?
102	UDLVUIB9JA7PRY6N	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	102	Ko vrši numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?
103	CTJ0KWRXOJ1Z7CYP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	103	Gde je moguće pronaći uputstvo i zahtev za numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?
104	KUMHIOSC1FDYAN6R	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	104	Ko sprovodi ispit za sticanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?
105	JBPZPFRSVCHEIQHF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	105	Ko radi registraciju i overu redova vožnje za međumesni linijski prevoz putnika?
106	LDBAUVWR3D6ATTYK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	106	U kom periodu se podnosi zahtev za registraciju i overu redova vožnje za međumesni linijski prevoz putnika?
107	DKXWSQF71GXIO4GB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	107	U kom periodu se preuzimaju registrovani redovi vožnje za međumesni linijski prevoz putnika?
108	ZIBPZYK4AUPELD7A	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	108	Od kada počinju da važe registrovani redovi vožnje za međumesni linijski prevoz putnika?
109	O3E5ROADFGKILJQ5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	109	Da li je red vožnje za međumesni linijski prevoz putnika moguće preneti na drugog prevoznika ili voziti u kooperaciji?
110	CGUFLVERFH6FEXX2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	110	Da li je potrebno posedovati posebnu dozvolu za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju?
111	Q0ZVEW2TWZYUSEYL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	111	Ko izdaje međunarodne dozvole za linijski prevoz putnika?
112	WNC2BHVS0AZX1VZZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	112	Ko izdaje licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?
113	DDQIYCWABDMVQO0C	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	113	Kada se podnosi zahtev za produženje roka važenja licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?
114	IIBIGB92IUPK7EBU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	114	Kada se podnosi zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika?
115	VYFOOMNTHYKHZ3NK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	115	KOJI SU DRŽAVNI, A KOJI OPŠTINSKI PUTEVI U REPUBLICI SRBIJI?
116	SBWIXVPIYUL6DQ6C	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	116	KO JE NADLEŽAN ZA POPRAVKU TROTOARA I BICIKLISTIČKIH STAZA UZ DRŽAVNI PUT U NASELjU?
117	CHMPAQMV89A0FU85	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	117	ŠTA SU NEKATEGORISANI PUTEVI I KO JE NADLEŽAN ZA NjIHOVO ODRŽAVANjE?
118	YEA0I83DSS95ZQEZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	118	KOJI ZAKONI REGULIŠU OBLAST PUTNE INFRASTRUKTURE?
119	IWGTCYOGKXOBKXXU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	119	KO JE NADLEŽAN ZA ODRŽAVANjE SISTEMA ZA ODVODNjAVANjE DRŽAVNOG PUTA U NASELjU?
120	WQYY0ILS2X3QVSKG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	120	DA LI AUTOPUT MORA DA IMA ZAUSTAVNU TRAKU?
121	71RQYKFCMP08VIKU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	121	DA LI PREVOZNIK MORA DA LIČNO PREUZME ILI RAZDUŽI DOZVOLE, LICENCE ZA PREVOZ; SERTIFIKAT ZA LICE ODGOVORNO ZA PREVOZ ILI DRUGU DOZVOLU ZA PREVOZ PUTNIKA?
122	SJPGOWNAMZMOSWPH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	122	DA LI PROBIJANjEM ROKA ZA VRAĆANjE/RAZDUŽENjE DOZVOLA PREVOZNIK TRPI NEKE SANKCIJE?
123	QL9ZDD8ISP9OWGP4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	123	DA LI SE RAZDUŽUJE JOŠ NEŠTO OSIM DOZVOLA ZA PREVOZ PUTNIKA I TERETA?
124	N0BLMURC2XWC1ZT1	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	124	KOJI ZAKON REGULIŠE OBLAST DRUMSKOG PREVOZA TERETA?
125	97HKYSCDTTRI2OBL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	125	KOJI ZAKON REGULIŠE OBLAST DRUMSKOG PREVOZA PUTNIKA?
126	Q5I60OJURNPJGZWT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	126	ŠTA SE DEŠAVA AKO SE DOZVOLA IZGUBI?
127	JTAOTBYLT4O9F4ZY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	127	KOJE SE TAKSE PLAĆAJU?
128	XHSXKMJ1F7ULEH1Y	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	128	NA OSNOVU ČEGA SE OBAVLjA MEĐUNARODNI PREVOZ PUTNIKA I TERETA SA DRUGOM DRŽAVOM?
129	JDZMTZBJWZPXL1HD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	129	KO RAZMENjUJE MEĐUNARODNE DOZVOLE ZA PREVOZ TERETA SA DRUGIM DRŽAVAMA?
130	IYGOKYQTESBRKJC2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	130	ŠTA JE TO CEMT DOZVOLA?
131	KIPRPVPPL168AGP9	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	131	DA LI JE MOGUĆE OBAVLjATI MEĐUNARODNI PREVOZ PUTNIKA SA LINIJSKOM DOZVOLOM ZAJEDNO SA PODVOZAROM?
132	VM8FONI3IJDMCMFU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	132	ŠTA JE TO INTERBUS SPORAZUM?
133	VWVFFUAD8BRQWVAA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	133	UKOLIKO SE OBAVLjA PREVOZ PO OSNOVU INTERBUS SPORAZUMA DA LI JE POTREBNA POSEBNA VANLINIJSKA DOZVOLA?
134	TBNZBMIITVSKYEH1	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	134	DA LI POSTOJE SEZONSKE LINIJE ZA OBAVLjANjE MEĐUNARODNOG PREVOZA PUTNIKA?
135	PADMQLA5TE9MVLMD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	135	DA LI JE DOZVOLjENO OBAVLjANjE TAKSI PREVOZA NA TERITORIJI JEDINICE DRUGE LOKALNE SAMOUPRAVE?
136	W0FTKT5EVEAANLFK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	136	DO KADA DRŽAVA DAJE SUBVENCIJE ZA TAKSI PREVOZNIKE?
137	HFQHOFQCVOU0CFLQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	137	Da li se i kada planira ponovno uspostavljanje železničkih linija koje su ukinute u proteklom periodu?
138	MYRWR90NRSJIRWY3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	138	Razlozi nesaobraćanja vozova u određenim danima?
139	PC3XDHK8TBMNNJEI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	139	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?
140	V6WCMIJ3IEF4NQBP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	140	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (SOKO)?
141	NYADZ7BVARAKES43	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	141	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (RegioEkspres)?
142	2YGWLPQYHPLC5PH3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	142	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (Regio vozovi)?
143	YDY2UVGRSLRHFFIJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	143	Regulisanje železničkog saobraćaja na putnim prelazima?
144	ABEN84XVG2XPGJH8	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	144	Poteškoće kupovine karata za putovanje vozom preko aplikacije i sajta preduzeća „Srbija Voz“ a.d?
145	XB9TP2YPFPELYZ7N	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	145	Informacije vezane za projekte koji su trenutno u realizaciji?
146	XVHU1KGJ83Z7DGDO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	146	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?
147	KCBGNK8AKQNDSBS2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	147	Da li se u tekućoj godini planira raspisivanje konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
148	HTBELGG737ZARGTF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	148	Koji privredni subjekti mogu konkurisati za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
149	WXFQYPPZSPNVWJ5G	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	149	Koji je maksimalan iznos koji može biti dodeljen jednom privrednom društvu koje ispunjava uslove u skladu sa konkursom za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
150	TU6FS4K1J1DESSCG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	150	Kada je planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila?
151	IYBGOAHLAULDX7GJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	151	Cena vozne karte i prevoz automobila na relaciji Zemun – Bar?
152	NSDDPXRA0CZUSU6B	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	152	Da li se u narednom periodu planira ponovno uspostavljanje železničkih linija koje su ukinute?
153	9GI0JODQFTOBYYF0	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	153	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?
154	QRMGIQWC0NWMKAGC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	154	Regulisanje železničkog saobraćaja na putnim prelazima?
155	2RHGEEVNPETIXUCW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	155	Informacije vezane za projekte koji su trenutno u realizaciji?
156	9QVI6YS1GCX6RP5H	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	156	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?
157	YBC08FRAMXWOYRXA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	157	Zašto građevinska inspekcija neće da izvrši rešenje kojim se nalaže uklanjanje bespravno izgrađenog objekta ili dela objekta?
158	NGTTN3G0YNXNYHFY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	158	Zašto građevinska inspekcija ne donosi rešenje o izvršenju za bespravno izvedene radove, za koje ima saznanje da je započet postupak legalizacije/ozakonjenja objekta ili dela objekta?
159	KRMTZSPFCLSTUQYJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	159	Zašto se objekat (zgrada), za koji je izdata građevinska dozvola, gradi blizu objekta na susednoj parceli ili na granici parcele?
160	QKC3EN5G962CNNSH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	160	Zašto građevinski inspektor ne proverava upis ili promenu prava nosioca prava na katastarskim parcelama ili objektu u skladu sa zakonom?
161	HUFQPJSMXCPDTFM3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	161	Prijave vezane za odvodnjavanje površinskih voda (zatrpavanje putnih kanala i/ili propusta, ili za nerešeno odvodnjavanje od puta do recipijenta.
162	Z9IUFW998LA9248B	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	162	Priključci na državni put. Zahtevi se uglavnom odnose na izgradnju priključka na državni put od strane suseda puta ili su u pitanju zahtevi za održavanje ili prilagođavanje postojećih priključaka na državni put, obično nakon izvedenih radova na rehabilitaciji puta.
163	MZMVHIH60P5UIWRO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	163	Pritužba na rad i postupanje profesionalnog upravnika stambene zajednice.
164	LPJOBY87QSFDYQ3S	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	164	Prevoznik nije održao polazak na liniji i nismo mogli da otputujemo na odredište. Kome da prijavim neodržavanje polaska i nadoknadim štetu?
165	BEIGFWEYCUJGENEH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	165	Imao sam problem sa taksi prevozom. Da li mogu da vam uputim prijavu?
166	NPMAFISJVXMWJRZ5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	166	Gde se mogu postavljati plutajući objekti i privezišta za čamce?
167	JG0YQ8DHQMAWIBQH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	167	Kako građevinska inspekcija odlučuje o prioritetima u pokretanju inspekcijskog nadzora iz svoje nadležnosti?
168	W1L1K8FQ2KDW5SN5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	168	Kako postupa građevinski inspektor kada na objektu nastanu oštećenja, nastala usled izgradnje objekta na susednoj parceli?
169	DMHYWN5PZXJDLBFT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	169	Trotoari duž državnog puta. Zahtevi se odnose na izgradnju novih ili održavanje postojećih trotoara duž državnog puta, uglavnom u zonama škola ili autobuskih stajališta.
170	DRIK0HBRHMGQRHUQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	170	Zahtevi za postavljanje saobraćajne signalizacije i opreme. Zahtevi se uglavnom odnose na postavljanje znakova za ograničenje brzine, obnovu oštećenenih znakova ili postavljanje saobraćajnih ogledala.
171	9LCIJ4QOVGMGLYZV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	171	Koja dokumenta mora imati upravljač čamca u plovidbi?
172	F2TS7TNUHLGWPNKR	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	172	Da li se čamac može registrovati u lučkoj kapetaniji prema mestu držanja čamca?
173	7AYGURPA6Y3ZBGYY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	173	Pritužbe na izlivanje otpadnih voda u kanale naseljenih mesta.
174	DSHBLLLCHLLNPHHJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	174	Da li mogu da vršim javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?
175	TR0UX1JRLQDJ7MRA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	175	Da li naša inspekcija izdaje rešenje za obavljanje limo servisa i koje uslove treba da ispuni privredno društvo ili preduzetnik?
176	VMP57GO7KRHCYYUB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	176	Da li je prevoznik u obavezi da mi izda voznu kartu?
177	P20BKTPPTRS3PPDA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	177	Kako da se ostvari uvid u planski dokument?
178	7U5CFYLRXNYDBNXE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	178	Zasto gradjani nisu neposredno obavesteni o odrzavanju javnog uvida u planski dokument?
179	YFIBQNFATAU2JYC4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	179	Zasto javni uvid u planski dokument ne traje duze nego sto je propisano, 15 dana za rani javni uvid, odnosno 30 dana za javni uvid u planski dokument, u smislu da nije propisano da javni uvid ne moze duze trajati?
180	7HAAIFO5XXOUYRXY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	180	Zasto se ne moze ostvariti javni uvid u planske dokumente, van radnog vremena nosioca izrade planskog dokumenta, odnosno zasto to nije moguce i vikendom?
181	SMV2IJXEN4IR6VEN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	181	Zasto se planovi pisu „previse strucnom terminologijom“, tako da zainteresovana javnost „ne moze potpuno da razume planska resenja“?
182	GX5KM7MPJPQVYHJM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	182	Podnosenje predstavki po usvojenom planskom dokumentu u smislu visine eksproprijacije.
183	BSVRD9OVFWWQZFTZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	183	Da li moze planskim dokumentom da se propise visina eksproprijacije za nepokretnosti?
184	UPGKLLBTEA7JQHBI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	184	Da li moze planskim dokumentom da se ubrza postupak eksproprijacije?
185	LAYMZOC6KCMWDIL7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	185	Podnosenje zahteva fizickih lica za priznavanje „stranke u postupku“ u smislu Zakona o opstem upravnom postupku, u toku izrade planskih dokumenata.
186	FMTULBWEIUAS2BFO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	186	Trazenje informacije o lokaciji kao informacije od javnog znacaja
187	A36SYVPNHX115DWB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	187	Predstavke građana koje se odnose na nezadovoljavajući kvalitet, obim ili kontinuitet pružanja komunalnih usluga
188	0YVPKLSQJX39E9YT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	188	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na promenu cena komunalnih usluga
189	UZDDYPSN5PBMMZU4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	189	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na priključenje na komunalnu infrastrukturu i vlasništvo vodomera
190	8XN5VLBX6DXLIVRA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	190	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na obavljanje komunalnih delatnosti za dve ili više jedinica lokalne samouprave
191	LVSQIRZYJMVCP7NO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	191	Ko ima obavezu podnošenja Zahteva za otpočinjanje obavljanja komunalnih delatnosti?
192	05RD5DSIUGRUOMCX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	192	Do kada je rok za dostavu izveštaja u vezi obavljanja komunalnih delatnosti
193	RULQLJ0Z3G1U0E4I	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	193	Da li je vršilac komunalne delatnosti u obavezi da Ministarstvu građevinarstva, saobraćaja i infrastrukturedostavi upitnik ili isti dostavlja jedinici lokalne samouprave
194	MZTVREQIHFD6TYXK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	194	Tumačenje Zakona o komunalnim delatnostima u vezi primene člana 9. u pogledu načina poveravanja komunalnih delatnosti
195	9XVDJ7RUDNNKLXQS	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	195	Gde se može vršiti pokopavanje posmrtnih ostataka umrlog odnosno da li groblje gde se preminulo lice pokopava mora biti u upotrebi?
196	TXSXXGDHULWU7DHX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	196	Pritužbe na rad vršilaca komunalnih delatnosti
197	ATDHMYAE4S6UQ5EL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	197	Tumačenje odredaba Posebnog kolektivnog ugovora za javna preduzeća u komunalnoj delatnosti na teritoriji Republike Srbije
198	WWLFE8C45I4IOYEX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	198	Šta sve obuhvata obavljanje komunalne delatnosti pogrebna delatnost i koje uslove treba da ispune privredni subjekti koji bi da obavljaju navedenu delatnost?
199	CMBCZZ3KEHY0FHXF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	199	Kako da podnesem zahtev za vršenje tehničkog nadzora plovila?
200	WZ6XYYZE3M6HJSWA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	200	Koja je procedura za vršenje tehničkog nadzora čamca, odnosno plutajućeg objekta?
201	DZFTIWXUKMXUIQCJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	201	Koji pregled sledi kada istekne plovidbena ili plutajuća dozvola?
202	Q16LQBD4JXUHIJSQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	202	Kako se registruje brod koji se uvozi iz zemlje koja je članica Evropske unije?
203	QYTSCCKGS1UNXD8Q	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	203	Ko izrađuje tehničku dokumentaciju za plovila?
204	QVGYTCGZWH2FPBL5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	204	Da li mogu da podnesem zahtev za pregled broda koji nije u mom vlasništvu?
205	MB5MMI4BZXULL9QW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	205	Kako mogu da izvršim prenamenu čamca za sport i razonodu u čamac za privredni ribolov?
206	PN2JRLIKE9FCKEWG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	206	Koje uslove treba da ispunim da bih mogao da pravim čamac ili plutajući objekat?
207	RIXKICRWZMRFQ0NE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	207	Kako da dobijem duplikate brodskih dokumenata koja su izgubljena?
208	8XHVXLMDJZHHY1FW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	208	Šta je potrebno od dokumentacije za registraciju novonabavljenog čamca/plutajućeg objekta za privredne svrhe?
209	Q1QEAQQZAHHKNEWW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	209	Kada počinje primena pravilnika za čamce i plutajuće objekte za privredne i javne svrhe?
210	WVUYCA1LUL42H9WG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	210	Koja je procedura overe tehničke dokumentacije za brodove unutrašnje plovidbe?
211	D18YMD3ZLRAQFCHJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	211	Šta je potrebno za dobijanje dozvole za prevoz opasnih tereta (ADN)?
212	GYHCDK0K9VG9FKIB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	212	Koji su rokovi za primenu poglavlja 13.01 ES-TRIN standarda , Oprema broda (sidreni uređaji)?
213	5MZTSJOJWBUPH0G0	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	213	Koji su rokovi za primenu poglavlja 6.02 ES-TRIN standarda Kormilarski uređaji?
1	EDEYMXJG2GZARFBP	2023-05-22 08:07:52	2023-05-22 12:42:38	2023-05-22 12:42:38	1	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnom i međudržavnim vodnim putevima?
214	FHGUPNTJG21ARJ1I	2023-05-22 12:42:38	2023-05-22 12:54:09	2023-05-22 12:54:09	1	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnom i međudržavnim vodnim putevima?
215	4FJ5O3OXUFKIB0TJ	2023-05-22 12:42:38	2023-05-22 12:54:09	2023-05-22 12:54:09	1	Gde se mogu preuzeti međunarodne i međudrkarte plovnog
216	U8ZCCGIIKRKEJ0AI	2023-05-22 12:54:09	2023-05-22 20:47:09	2023-05-22 20:47:09	1	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?
217	BMYXQXI3JZNAP99L	2023-05-22 12:54:09	2023-05-22 20:47:09	2023-05-22 20:47:09	1	Na kom sajtu se može pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?
218	KS48WLZWIQYRX6YZ	2023-05-22 12:54:09	2023-05-22 20:47:09	2023-05-22 20:47:09	1	Na kojoj web lokaciji se nalaze elektronske karte za međunarodne i međudržavne plovne puteve?
219	AYN6S097RZBF2X4E	2023-05-22 12:54:09	2023-05-22 20:47:09	2023-05-22 20:47:09	1	Sa kog sajta se mogu preuzeti međunarodne i međudržavne elektronske karte plovnog puta?
220	CRSINQ2GBK2ZYWXE	2023-05-22 20:47:09	2023-05-22 20:47:09	\N	1	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?
221	BZRXNWBV51NPL2XO	2023-05-22 20:47:09	2023-05-22 20:47:09	\N	1	Na kom sajtu se može pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?
222	1MUYSEEV0JZ4SN6B	2023-05-22 20:47:09	2023-05-22 20:47:09	\N	1	Na kojoj web lokaciji se nalaze elektronske karte za međunarodne i međudržavne plovne puteve?
223	DLDNMA0WDYEQ6IRA	2023-05-22 20:47:09	2023-05-22 20:47:09	\N	1	Sa kog sajta se mogu preuzeti međunarodne i međudržavne elektronske karte plovnog puta?
224	VZVMSZL2BKNG4DVU	2023-05-22 20:50:13	2023-05-22 20:50:13	\N	2	Interesuje me gde je moguće kupiti štampana izdanja plovidbenih karata Dunava, Tise i Save?
225	ZU1H51IXYYXRKL7I	2023-05-22 20:50:13	2023-05-22 20:50:13	\N	2	Da li je moguće elektronskim putem kupiti plovidbene karte Dunava, Tise i Save?
226	QCVANI7QTWPV1CLY	2023-05-22 20:50:13	2023-05-22 20:50:13	\N	2	Koja je cena plovidbenih karata Dunava, Tise i Save?
227	GIKBXBCFTEMFBKBQ	2023-05-22 20:50:13	2023-05-22 20:50:13	\N	2	Koja su prodajna mesta plovidbenih karata Dunava, Tise i Save?
228	9URRUPEZDYDVPPCF	2023-05-22 20:50:13	2023-05-22 20:50:13	\N	2	Gde se mogu kupiti plovidbene karte Dunava, Tise i Save?
229	KHHYG0GOD59VJBD7	2023-05-22 21:05:43	2023-05-22 21:05:43	\N	3	Sa portala Direkcije za vodne puteve su preuzete elektronske plovidbene karte Dunava, Tise i Save, kako mogu da im pristupim?
230	H49LPJ1AEWCTTE6N	2023-05-22 21:05:43	2023-05-22 21:05:43	\N	3	Nakon preuzimanja datoteke elektronskih plovidbenih karata, kako mogu da im pristupiti?
231	6I3AVVUMLLIJXI86	2023-05-22 21:05:43	2023-05-22 21:05:43	\N	3	Kako mogu preuzeti elektronske plovidbene karte iz datoteke?
232	5KSNV8AVU1VD93OM	2023-05-22 21:05:43	2023-05-22 21:05:43	\N	3	Na koji način se otvara datoteka za elektronske plovidbene karte na portalu Direkcije za vodne puteve?
233	MXWKGGDBZZPEPPQK	2023-05-22 21:05:43	2023-05-22 21:05:43	\N	3	Koja je procedura za pristup plovidbenim kartama u preuzetoj datoteci sa portala?
234	XTSAFD7W1A3WIF9J	2023-05-22 21:46:27	2023-05-22 21:46:27	\N	4	Koja je procedura za ishodovanje Mišljenja u postupku izdavanja vodnih akata za vađenje rečnih nanosa?
235	KG9AMEFD4YSSJJJU	2023-05-22 21:46:27	2023-05-22 21:46:27	\N	4	Na koji način se može dobiti Mišljenje u toku procesa izdavanja vodnih akata za vadjenje rečnih nanosa?
236	SUFPHYMGIHREREZ5	2023-05-22 21:46:27	2023-05-22 21:46:27	\N	4	Koja je procedura za dobijanje Mišljenja u postupku vodne saglasnosti za vađenje rečnog nanosa iz korita?
237	YT2N1BSH65WDKY8H	2023-05-22 21:46:27	2023-05-22 21:46:27	\N	4	Kako mogu da pribavim Mišljenje u postupku izdavanja vodnih uslova i izdavanja saglasnosti za vadjenje rečnog mulja?
238	WQS9DY3GLFLOZPST	2023-05-22 21:46:27	2023-05-22 21:46:27	\N	4	Gde se mogu preuzeti instrukcije za dobijanje Mišljenja za izdavanje saglasnosti za vadjene rečnog mulja?
239	EKVFFM9HWMX0PZ5F	2023-05-22 21:57:32	2023-05-22 21:57:32	\N	5	Koja je procedura za postavljanje plutajućih objekata na vodnom zemljištu?
240	MZSLZYBOSKKFMOBW	2023-05-22 21:57:32	2023-05-22 21:57:32	\N	5	Kako doći do dozvole za postavljanje plutajućih objekata na vodnom zemljištu?
241	51DSIOXKDQU2S41D	2023-05-22 21:57:32	2023-05-22 21:57:32	\N	5	Koji su uslovi za postavljanje plutajućih objekata na vodnom zemljištu?
242	HMXLFAHAPK2ZVBBQ	2023-05-22 21:57:32	2023-05-22 21:57:32	\N	5	Šta je potrebno za postavljanje plutujućeg objekta na vodnom zemljištu?
243	VMK9UNLYLICRSQWP	2023-05-22 21:57:32	2023-05-22 21:57:32	\N	5	Koje su odredbe za postavljanje plutajućih objekata na vodnom zemljištu?
6	6I4IVWL9CLJNUTHM	2023-05-22 08:07:53	2023-05-22 22:23:03	2023-05-22 22:23:03	6	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?
244	RZ6JYWQSDIFQCVJY	2023-05-22 22:23:03	2023-05-22 22:23:39	2023-05-22 22:23:39	6	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?
245	NAYBA9M3GZQEG6EY	2023-05-22 22:23:03	2023-05-22 22:23:39	2023-05-22 22:23:39	6	Da li Direkcija za vodne puteve izdaje saglasnost i dozvole za sva delovanja u okviru vodnog saobraćaja i infrastrukture?
246	S3YS1OJOM2MBYYB8	2023-05-22 22:23:03	2023-05-22 22:23:39	2023-05-22 22:23:39	6	Da li je izdavanje saglasnosti i dozvola za međunarodne i međudrdelokrug rada Direkcije za vodne puteve?
250	J1QOLNY32GWSUQKR	2023-05-22 22:27:15	2023-05-22 22:27:15	\N	7	Zanima me procedura registracije plovila?
251	XYBZITQM3W7RCJZS	2023-05-22 22:27:15	2023-05-22 22:27:15	\N	7	Koja je procedura za registraciju plovila?
252	TVDL6EVGPFQLN7KD	2023-05-22 22:27:15	2023-05-22 22:27:15	\N	7	Šta je potrebno od dokumentacije za registraciju plovila?
253	FY3BL8I6KQCDTBCV	2023-05-22 22:27:15	2023-05-22 22:27:15	\N	7	Kako doći do plovidbenih dokumenata?
254	ITFFM7UBKJ4QHITY	2023-05-22 22:27:15	2023-05-22 22:27:15	\N	7	Gde se mogu registrovati plovila?
247	A4R56E4XTC84GBTT	2023-05-22 22:23:39	2023-05-22 22:28:37	2023-05-22 22:28:37	6	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?
248	QT3GJVLIMN4BXL8F	2023-05-22 22:23:39	2023-05-22 22:28:37	2023-05-22 22:28:37	6	Da li Direkcija za vodne puteve izdaje saglasnost i dozvole za sva delovanja u okviru vodnog saobraćaja i infrastrukture?
249	EG9XQ4GAWNNXELG2	2023-05-22 22:23:39	2023-05-22 22:28:37	2023-05-22 22:28:37	6	Da li je izdavanje saglasnosti i dozvola za međunarodni i međudržavni vodni put u delokrugu rada Direkcije za vodne puteve?
255	AFNL9ZZQNUZLOQZY	2023-05-22 22:28:37	2023-05-22 22:28:37	\N	6	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?
256	DKCQHK2QED6XKPLI	2023-05-22 22:28:37	2023-05-22 22:28:37	\N	6	Da li Direkcija za vodne puteve izdaje saglasnost i dozvole za sva delovanja u okviru vodnog saobraćaja i infrastrukture?
257	YDAW5ZQEHQE1EZSW	2023-05-22 22:28:37	2023-05-22 22:28:37	\N	6	Da li je izdavanje saglasnosti i dozvola za međunarodni i međudržavni vodni put u delokrugu rada Direkcije za vodne puteve?
258	AHMS9VP8A17DSJFQ	2023-05-22 22:35:56	2023-05-22 22:35:56	\N	8	Želim da imam uvid u lokaciju plovila u okviru RIS sistema.
259	QLFCRCHUASET2AJY	2023-05-22 22:35:56	2023-05-22 22:35:56	\N	8	Kako mogu da pristupim RIS sistemu?
260	G8T3W6PSZM8EQHYN	2023-05-22 22:35:56	2023-05-22 22:35:56	\N	8	Koji su uslovi za dobijanje dozvole za pristup RIS sistemu?
261	KNIV5BBXSUQHJKGH	2023-05-22 22:35:56	2023-05-22 22:35:56	\N	8	Da li Direkcija za vodne puteve izdaje odobrenja za uvid u lokacije plovila?
262	Q2IOSURUQSRNQCH6	2023-05-22 22:35:56	2023-05-22 22:35:56	\N	8	Kome Direkcija za vodne puteve daje odobrenje za uvid u lokacije vozila u okviru RIS sitema?
263	XZBHSPC2Z43I84TS	2023-05-22 22:40:52	2023-05-22 22:40:52	\N	9	Potreban mi je uvid u istoriju kretanja plovila koje je izazvalo incident.
264	WIDM2H8BMKEFTTK3	2023-05-22 22:40:52	2023-05-22 22:40:52	\N	9	Da li fizička lica mogu pristupiti arhivi kretanja plovila?
265	FSBVAMGKMITUIACZ	2023-05-22 22:40:52	2023-05-22 22:40:52	\N	9	Da li fizička lica imaju mogućnost da pristupe istoriji kretanja plovila koje je izazvalo incident?
266	M82GJXAOIACTY7BU	2023-05-22 22:40:52	2023-05-22 22:40:52	\N	9	Na koji način mogu imati uvid u istoriju kretanja plovila koje je izazvalo incident?
267	TXZDBNONCNZLVSLX	2023-05-22 22:40:52	2023-05-22 22:40:52	\N	9	Koja je procedura za ivid u istoriju kretanja plovila koje je izazvalo incident?
268	8IINYE2DBAUK4KWH	2023-05-22 22:48:02	2023-05-22 22:48:02	\N	11	Za koje radove na međunarodnim i međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?
269	63ANJE7SNOA0YDKS	2023-05-22 22:48:02	2023-05-22 22:48:02	\N	11	Za koje radove na međunarodnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?
270	NWMSULQKMCOWKNIB	2023-05-22 22:48:02	2023-05-22 22:48:02	\N	11	Da li i za koje radove na međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnost?
271	44SAQBVNZFTCIYL1	2023-05-22 22:48:02	2023-05-22 22:48:02	\N	11	Za izvodjenje kojih radova Direkcija za vodne puteve izdaje saglasnost?
272	NVGJCDOX1LTTZOXU	2023-05-22 22:48:02	2023-05-22 22:48:02	\N	11	Da li Direkcija za vodne puteve izdaje saglasnost za radove na međudržavnim i međunarodnim putevima?
273	U5N9ZZU5UT3RIJG5	2023-05-22 22:52:29	2023-05-22 22:52:29	\N	10	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim i međudržavnim rekama?
274	5EP2B9XH9TYLTDHC	2023-05-22 22:52:29	2023-05-22 22:52:29	\N	10	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova na međunarodnim i međudržavnim rekama?
275	B5P2M735GMCMHL7A	2023-05-22 22:52:29	2023-05-22 22:52:29	\N	10	Na kojoj web lokaciji se mogu preuzeti situacioni prikazi i produženi profili mostova na međunarodnim i međudržavnim rekama?
276	HTQWIBD4V7FYKT42	2023-05-22 22:52:29	2023-05-22 22:52:29	\N	10	Na kojoj web lokaciji se mogu preuzeti svi podaci o mostovima na međunarodnim i međudržavnim rekama?
277	RXLI8T13H9YLNDNZ	2023-05-22 22:52:29	2023-05-22 22:52:29	\N	10	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim rekama?
278	74SIYALTIV6AVUOJ	2023-05-23 12:00:12	2023-05-23 12:00:12	\N	12	Koji organ državne uprave je nadležan za uspostavljanje linijskog rečnog saobraćaja?
279	F2CB2WL8SXLGQ2DT	2023-05-23 12:00:12	2023-05-23 12:00:12	\N	12	Ko organizuje red vožnje rečnog saobraćaja?
280	GIJA2BJ0AGQOUZFD	2023-05-23 12:00:12	2023-05-23 12:00:12	\N	12	Koja institucija uređuje domaći rečni saobraćaj?
281	PM2KGQB06AH66XAR	2023-05-23 12:00:12	2023-05-23 12:00:12	\N	12	Ko uspostavlja linijski rečni saobraćaj?
282	TNEYB4IVFE59EQ3T	2023-05-23 12:00:12	2023-05-23 12:00:12	\N	12	U čijoj nadležnosti je uspostavljanje linijskog rečnog saobraćaja?
283	FCRKUS7ISA5K6FAZ	2023-05-23 12:03:43	2023-05-23 12:03:43	\N	13	Interesuje me postupak izdavanja plovidbenih dozvola?
284	YCEYQ7A7N6JX4D1C	2023-05-23 12:03:43	2023-05-23 12:03:43	\N	13	Koji su uslovi za dobijanje plovidbene dozvole?
285	MHZ4GTEBM2DB6Y6T	2023-05-23 12:03:43	2023-05-23 12:03:43	\N	13	Na koji način se izdaju plovidbene dozvole?
286	RQZX1EZHP6VNTW3Y	2023-05-23 12:03:43	2023-05-23 12:03:43	\N	13	Koja je procedura za dobijanje plovidbene dozvole?
287	XZEYXMBW03D0HJPQ	2023-05-23 12:03:43	2023-05-23 12:03:43	\N	13	Kako doći do plovidbene dozvole?
288	SYF42SH4CSCRCSM0	2023-05-23 12:08:32	2023-05-23 12:08:32	\N	14	Kako se može doći do Plana obeležavanja Dunava, Save i Tise?
289	MUH5S4NWGDPYHZ2O	2023-05-23 12:08:32	2023-05-23 12:08:32	\N	14	Gde mogu pogledati Plan obeležavnja Dunava, Save i Tise?
290	6PH6IYLVZ4N3P9BE	2023-05-23 12:08:32	2023-05-23 12:08:32	\N	14	Na kojoj web adresi mogu preuzeti Plan obeležavanja Dunava, Save i Tise?
291	FDEW85JSKJZ4QPSL	2023-05-23 12:08:32	2023-05-23 12:08:32	\N	14	Gde se može preuzeti Plan obeležavanja Dunava, Save i Tise?
292	QVVQJZHXGH6YH5WD	2023-05-23 12:08:32	2023-05-23 12:08:32	\N	14	Da li postoji u elektronskoj formi Plan obeleđavanja Dunava, Save i Tise?
293	8LUB1CRNBNDE0VH6	2023-05-23 12:11:37	2023-05-23 12:11:37	\N	15	Koja pravna lica mogu da obavljaju hidrografska merenja?
294	ZK5J5BZI6B4ADYIL	2023-05-23 12:11:37	2023-05-23 12:11:37	\N	15	Koji su uslovi za obavljanje hidrografske delatnosti?
295	9IMPUCZV07LOGTLO	2023-05-23 12:21:12	2023-05-23 12:21:12	\N	16	Koje su obaveze pravnih lica koja vrše hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?
296	56Z2FN3KOGBFHGSF	2023-05-23 12:21:12	2023-05-23 12:21:12	\N	16	Pod kojim uslovima pravna lica mogu vršiti hidrografsko merenje?
297	MHXIOHISWAEOLPLL	2023-05-23 12:21:12	2023-05-23 12:21:12	\N	16	Koja je procedura za vršenje hidrografskog merenja na međunarodnim i međudržavnim putevima?
298	G09MDDIBNUYHS8DH	2023-05-23 12:21:12	2023-05-23 12:21:12	\N	16	Šta je potrebno za vršenje merenja na međunarodnim i međudržavnim vodnim putevima?
299	Q3DPABUZTW1TAR6L	2023-05-23 12:21:12	2023-05-23 12:21:12	\N	16	Koja je dokumentacija potrebna pravnim licima za hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?
300	MV9OX0AJUHOO4EZT	2023-05-23 12:25:33	2023-05-23 12:28:35	2023-05-23 12:28:35	17	Koji je sadržaj projekta za izvođenje poslova u okviru hidrografske delatnosti?
301	MQV84GQJUTXEVUK8	2023-05-23 12:25:33	2023-05-23 12:28:35	2023-05-23 12:28:35	17	Gde se mogu naći uputstva za izradu projekta za izvodjenje poslova u okviru hidrografske delatnosti?
302	XNAL3OELQBLZOJEC	2023-05-23 12:25:33	2023-05-23 12:28:35	2023-05-23 12:28:35	17	Šta treba da sadr
303	33N7BVCQMX4U7LNC	2023-05-23 12:28:35	2023-05-23 12:28:35	\N	17	Koji je sadržaj projekta za izvođenje poslova u okviru hidrografske delatnosti?
304	USMVMVM7PPUVIAAJ	2023-05-23 12:28:35	2023-05-23 12:28:35	\N	17	Gde se mogu naći uputstva za izradu projekta za izvodjenje poslova u okviru hidrografske delatnosti?
305	MW57JWNRTGFCRG3Y	2023-05-23 12:28:35	2023-05-23 12:28:35	\N	17	Šta čini projekat za izvođenje poslova hidrografskih delatnosti?
306	PFBVICAKFUDUJHTZ	2023-05-23 12:36:32	2023-05-23 12:36:32	\N	18	Koja je procedura za ishodovanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima, koje izdaje Direkcija za vodne puteve?
307	6D1WSPJEPSQN127D	2023-05-23 12:36:32	2023-05-23 12:36:32	\N	18	Koja je procedura za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima?
308	TARVOUMI4YZFIEXL	2023-05-23 12:36:32	2023-05-23 12:36:32	\N	18	Da li na sajtu Direkcije za vodne puteve postoje smernice za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima?
309	FP1WDS5NZG7E2I5T	2023-05-23 12:36:32	2023-05-23 12:36:32	\N	18	Kako doći do Zahteva za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunardnim i međudržavnim vodnim putevima?
310	TXCI2WG10BX2T0NU	2023-05-23 12:36:32	2023-05-23 12:36:32	\N	18	Koji su uslovi za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na vodnim putevima?
311	SSPHOBDESCYWHUVX	2023-05-23 12:40:57	2023-05-23 12:40:57	\N	19	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?
312	4BMK7JJF4RSYPE8A	2023-05-23 12:40:57	2023-05-23 12:40:57	\N	19	Gde se mogu informisati o raspoloživim dubinama na kritičnim mestima za plovidbu?
313	72FRUQULDAWUX3JZ	2023-05-23 12:40:57	2023-05-23 12:40:57	\N	19	Sa kog linka se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim mestima za plovidbu?
314	8T5IJXRVS8NP77BI	2023-05-23 12:40:57	2023-05-23 12:40:57	\N	19	Da li na sajtu Direkcije za vodne puteve postoje podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?
315	L2JXTM7DSO4QLANE	2023-05-23 12:40:57	2023-05-23 12:40:57	\N	19	Da li na sajtu Direkcije za vodne puteve postoje podaci o raspoloživim dubinama na kritičnim mestima za plovidbu?
316	XWZIYRJEDMWE3GSP	2023-05-23 12:46:05	2023-05-23 12:46:05	\N	20	Kako se vrši povraćaj novca usled otkazivanja leta?
317	F0SFFQAZFCSCA02Y	2023-05-23 12:46:05	2023-05-23 12:46:05	\N	20	Kome upućujem zahtev za povrćaj novca usled otkazivanaj leta?
318	BR3RNVHEWOQJ5BFE	2023-05-23 12:46:05	2023-05-23 12:46:05	\N	20	Koja je kontakt adresa za potraživanje novčane naknade usled otkazivanja leta?
319	U1KCNG4UCYDYZCKA	2023-05-23 12:46:05	2023-05-23 12:46:05	\N	20	Kome se treba obratiti za povraćaj novca kada se otkaže let?
320	NB9Z90DDFGN4ZLFU	2023-05-23 12:46:05	2023-05-23 12:46:05	\N	20	Koja je procedura za povraćaj novca usled otkazivanja leta?
321	OCTHZBAPYMJYI7YR	2023-05-23 12:53:50	2023-05-23 12:53:50	\N	21	Kako je moguće pronaći izgubljeni prtljag na aerodormu Nikola Tesla Beograd?
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.questions (id, uid, created_at, updated_at, deleted_at, category_id, question, answear, links, tables, active) FROM stdin;
28	ZMYMMDRTDXC4TMNO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Da li je za produženje važenja sertifikata za savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) potrebno odslušati obuku u ovlašćenom privrednom društvu ili drugom pravnom licu?	Potrebno je odslušati  obuku za savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) u nekom od ovlašćenih centara?	\N	\N	t
3	IXVHRK1LGB5TONZR	2023-05-22 08:07:52	2023-05-22 21:05:43	\N	1	Sa portala Direkcije za vodne puteve su preuzete elektronske plovidbene karte Dunava, Tise i Save, kako mogu da im pristupim?	<p>Nakon preuzimanja .ZIP datoteka sa plovidbenim kartama, potrebno je da instalirate program za pregled karata u standardnom .000 formatu, SeeMyENC ( <a title="https://www.sevencs.com/products/software-downloads" href="https://www.sevencs.com/products/software-downloads" target="_blank" rel="noopener">https://www.sevencs.com/products/software-downloads</a> ) i da nakon otvaranja datoteke ceo "ROOT" folder prevučete u prozor sa leve strane aplikacije.</p>	[{"link": "https://www.sevencs.com/products/software-downloads", "type": "url", "placeholder": "@link1@"}]	\N	t
4	N1VCOLXOEVCJFXIQ	2023-05-22 08:07:52	2023-05-22 21:46:27	\N	1	Koja je procedura za ishodovanje Mišljenja u postupku izdavanja vodnih akata za vađenje rečnih nanosa?	<p>Procedura za ishodovanje Mi&scaron;ljenja u postupku izdavanja vodnih uslova i Mi&scaron;ljenja u postupku izdavanja vodne saglasnosti, za vađenje rečnog nanosa iz korita međunarodnih i međudržavnih vodnih puteva detaljno je opisana na internet prezentaciji Direkcije za vodne puteve: <a title="https://www.plovput.rs/izdavanje-akata-misljenja-za-bagerovanje" href="https://www.plovput.rs/izdavanje-akata-misljenja-za-bagerovanje" target="_blank" rel="noopener">https://www.plovput.rs/izdavanje-akata-misljenja-za-bagerovanje</a></p>	[{"link": "https://www.plovput.rs/izdavanje-akata-misljenja-za-bagerovanje", "type": "url", "placeholder": "@link1@"}]	\N	t
5	XWIA4OH8VE4WXGLX	2023-05-22 08:07:52	2023-05-22 21:57:32	\N	1	Koja je procedura za postavljanje plutajućih objekata na vodnom zemljištu?	<p>Direkcija za vodne puteve nije nadležna za postavljanje plutajućih objekata na vodnom zemlji&scaron;tu, već to uređuje i obezbeđuje jedinica lokalne samouprave na čijoj teritoriji je planirano postavljanje plutajućih objekata.</p>	\N	\N	t
7	AJ89TGZTMOHCPQHG	2023-05-22 08:07:53	2023-05-22 22:27:15	\N	1	Zanima me procedura registracije plovila?	<p>Registracijom plovila se bave se nadležne lučke kapetanije koje kao područne jedinica nadležnog Ministarstva obavljaju delatnosti registracije plovila i izdavanja plovidbenih dokumenata.</p>	\N	\N	t
8	UZWGDX0OJTWLZWGS	2023-05-22 08:07:53	2023-05-22 22:35:56	\N	1	Želim da imam uvid u lokaciju plovila u okviru RIS sistema.	<p>Zbog privatnosti podataka i za&scaron;tite konkurencije, pristup RIS sistemu Srbije imaju isključivo nadležne odnosno institucije od posebnog državnog značaja. Pristup takođe mogu da dobiju i brodarske kompanije koje na zvaničan zahtev odnosno odobrenje Direkcije za vodne puteve mogu da dobiju uvid u lokaciju isključivo onih plovila koja se nalaze u njihovom vlasni&scaron;tvu.</p>	\N	\N	t
9	K70XBMBRM6EELXUT	2023-05-22 08:07:53	2023-05-22 22:40:52	\N	1	Potreban mi je uvid u istoriju kretanja plovila koje je izazvalo incident.	<p>Uvid u istoriju kretanja plovila u okviru RIS sistema mogu da dobiju isključivo pravosudni organi koji su pokrenuli postupak protiv fizičkog ili pravnog lica zbog izazivanja plovidbenog incidenta. Direkcija za vodne puteve po dobijanju zvaničnog zahteva od nadležnog suda dostavlja arhivu kretanja plovila u vidu trajektorije, vremena i lokacije u svim raspoloživim odnosno potrebnim formatima.</p>	\N	\N	t
11	VW2QVHCXSZQALCAV	2023-05-22 08:07:53	2023-05-22 22:48:02	\N	1	Za koje radove na međunarodnim i međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?	<p>Za izvođenje radova na međunarodnim i međudržavnim vodnim putevima koji ne podležu izdavanju akata u ostvarivanju prava na izgradnju u skladu sa zakonom kojim se uređuje planiranje i izgradnja, potrebno je pribaviti nautičku saglasnost koju izdaje nadležna lučka kapetanija i saglasnost koju izdaje Direkcija za vodne puteve i to pre početka izvođenja radova.</p>	\N	\N	t
10	FC3FII2IAFLRXHTK	2023-05-22 08:07:53	2023-05-22 22:52:29	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim i međudržavnim rekama?	<p>Tražene podatke možete preuzeti na internet prezentaciji Direkcije za vodne puteve: <a title="https://www.plovput.rs/plovidbeni-bilten" href="https://www.plovput.rs/plovidbeni-bilten" target="_blank" rel="noopener">https://www.plovput.rs/plovidbeni-bilten</a></p>	[{"link": "https://www.plovput.rs/plovidbeni-bilten", "type": "url", "placeholder": "@link1@"}]	\N	t
12	WQNYER9QHCGVKPJB	2023-05-22 08:07:53	2023-05-23 12:00:12	\N	1	Koji organ državne uprave je nadležan za uspostavljanje linijskog rečnog saobraćaja?	<p>Organizaciju lokalne linijske plovidbe uređuje i obezbeđuje jedinica lokalne samouprave na čijoj teritoriji se obavlja lokalna linijska plovidba. Direkcija za vodne puteve izdaje uslove za izradu tehničke dokumentacije za postavljanje plutajućih objekata za pristajanje plovila koja vr&scaron;e prevoz putnika u domaćoj linijskoj plovidbi na međunarodnim i međudržavnim vodnim putevima, kao i saglasnost na urađenu tehničku dokumentaciju.</p>	\N	\N	t
13	RFKVDFEEVH68WAMF	2023-05-22 08:07:53	2023-05-23 12:03:43	\N	1	Interesuje me postupak izdavanja plovidbenih dozvola?	<p>Izdavanje plovidbenih dozvola je u nadležnosti lučkih kapetanija koje periodično organizuju polaganje posebnih ispita neophodnih za sticanje plovidbene dozvole.</p>	\N	\N	t
14	DMEJEQ8NSP4A69CR	2023-05-22 08:07:53	2023-05-23 12:08:32	\N	1	Kako se može doći do Plana obeležavanja Dunava, Save i Tise?	<p>Aktuelni plan obeležavanja Dunava, Save i Tise, kao i izdanja iz prethodnih godina možete preuzeti na portalu Direkcije: <a title="https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf" href="https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf" target="_blank" rel="noopener">https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf</a></p>	[{"link": "https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf", "type": "url", "placeholder": "@link1@"}]	\N	t
22	GK5ABW3TJRYWNTVN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Kako je moguće zatražiti pomoć osobama sa ivaliditetom prilikom dolaska na aerodrom Nikola Tesla Beograd, kao i na samom letu?	Prilikom dolaska na aerodrom Nikola Tesla Beograd svim putnicima koji imaju poteškoće u kretanju, obezbeđen je odgovarajući vid asistencije. Prilikom kupovine avio karte neophodno je naznačiti posebne potrebe putnika, a to je moguće učiniti i prilikom registracije na let.	\N	\N	t
23	GZVUSA5C0IOZ6FNJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Gde se može proveriti red letanja Air Serbia ka određenim destinacijama?	Na zvaničnoj internet stranici Air Serbia ( @link1@ ) može se proveriti reda letenja.	[{"link": "https://www.airserbia.com", "type": "url", "placeholder": "@link1@"}]	\N	t
24	PIDJSTUUFW6PJXLN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Kojim vidovima prevoza se može doći iz centra grada Beograda do aerodroma Nikola Tesla Beograd?	Pored sopstvenog prevoza ili taksi prevoza, može se doći javnim graskim prevozom na sledećim autobuskim linijama: - 72 sa Zelenog venca, - A1 sa stanice Trg Slavija, - 860i od Palate pravde, i - 860mv sa Glavne autobuske stanice.	\N	\N	t
25	IFJ0AROFRMDI9UP8	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	U kojim slučajevima je potrebno da vozač poseduje ADR sertifikat za vozača vozila za prevoz opasne robe drumom?	Svi vozači koji prevoze opasnu robu moraju posedovati ADR sertifikat za vozača vozila koje prevozi opasnu robu drumom. Izuzetak su prevozi koji se obavljaju po izuzećima prema 1.1.3.6, 3.4 ili 3.5 ADR (multilateralni sporazum o transportu opsane robe drumom). U ovim slučajevima angažovani savetnik za bezbednost u transportu opasne robe u drumskom saobraćaju određuje da za prevoz nije potrebno angažovati vozača sa ADR sertifikatom za vozača vozila za prevoz opasne robe već vozača koji je prošao obuku od strane savetnika za bezbednost u transportu opasne robe.	\N	\N	t
26	EAUESCAGAMOWJVBE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Na koji način se vrši uvoz pokretne opreme pod pitiskom ili ambalaže za prevoz opasne robe u Srbiju?	U Republiku Srbiju se može uvesti samo pokretna oprema pod pritiskom koja je ispitana i odobrena u Srbiji ili Evropskoj uniji i kao takva poseduje srpski znak usaglašenosti (tri A) ili evropski znak usaglašenosti (Pi). Ambalaža mora da poseduje odobrenje prema ADR (multilateralni sporazum o transportu opsane robe drumom) odnosno RID (multilateralni sporazum o transportu opsane robe železnicom) sporazumima. Uz zahtev na propisanom formularu dostavljaju se dokazi o uplati pripadajuće administrativne takse, kopija sertifikata čije se priznavanje traži sa zvaničnim prevodom sudskog tumača i izveštaj o ispitivanju. U zavisnosti od vrste sertifikata koji se priznaje može se zahtevati tehnički crtež ili neki drugi dokument.	\N	\N	t
27	OLJWY4Z914SMFAHX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Na koju imejl adresu se dostavljaju godišnji izveštaji savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) u elektronskoj formi?	Rok za dostavljanje godišnjeg izveptaja je 1. mart tekuće godine za predhodnu godinu na mail adresu @email1@	[{"link": "tor@mgsi.gov.rs", "type": "email", "placeholder": "@email1@"}]	\N	t
47	YL5JC2NKRSPKWMS8	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Ko izdaje odobrenja za obavljanje lučkih delatnosti u lukama i pristaništima?	Agencija za upravljanje lukama izdaje i oduzima odobrenje za obavljanje lučke delatnosti. Sedište Agencije za upravljanje lukama je u Beogradu, Nemanjina 4.	\N	\N	t
16	IZ1W3F6XZB7MC5QZ	2023-05-22 08:07:53	2023-05-23 12:21:12	\N	1	Koje su obaveze pravnih lica koja vrše hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?	<p>Pravno lice koje vr&scaron;e hidrografsko merenje, dužno je da obavesti Direkciju za vodne puteve o datumu početka i obimu poslova u okviru hidrografske delatnosti koje će vr&scaron;iti na međunarodnim i međudržavnim vodnim putevima, kao i da dostavi po primerak projekta za izvođenje planiranih poslova u okviru hidrografske delatnosti, a prikupljene podatke da dostavi u roku od 30 dana od dana zavr&scaron;etka radova.</p>	\N	\N	t
18	KXQY4ZEYXW5SLWDW	2023-05-22 08:07:53	2023-05-23 12:36:32	\N	1	Koja je procedura za ishodovanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima, koje izdaje Direkcija za vodne puteve?	<p>Procedura za ishodovanje Re&scaron;enja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima podrazumeva podno&scaron;enje odgovarajućeg zahteva kod Direkcije za vodne puteve, pod uslovima koji su dati na internet prezentaciji Direkcije za vodne puteve: <a title="https://www.plovput.rs/izdavanje-resenja-o-potvrdjivanju-validnosti-hidrografskih-podataka" href="https://www.plovput.rs/izdavanje-resenja-o-potvrdjivanju-validnosti-hidrografskih-podataka" target="_blank" rel="noopener">https://www.plovput.rs/izdavanje-resenja-o-potvrdjivanju-validnosti-hidrografskih-podataka</a></p>	[{"link": "https://www.plovput.rs/izdavanje-resenja-o-potvrdjivanju-validnosti-hidrografskih-podataka", "type": "url", "placeholder": "@link1@"}]	\N	t
19	OZK5NEGFG0QC1379	2023-05-22 08:07:53	2023-05-23 12:40:57	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?	<p>Tražene podatke možete preuzeti na internet prezentaciji Direkcije za vodne puteve: <a title="https://www.plovput.rs/plovidbeni-bilten" href="https://www.plovput.rs/plovidbeni-bilten" target="_blank" rel="noopener">https://www.plovput.rs/plovidbeni-bilten</a></p>	[{"link": "https://www.plovput.rs/plovidbeni-bilten", "type": "url", "placeholder": "@link1@"}]	\N	t
20	NV1QRMRIQW9T1OIQ	2023-05-22 08:07:53	2023-05-23 12:46:05	\N	2	Kako se vrši povraćaj novca usled otkazivanja leta?	<p>Upućuje se zahtev za naknadu, na mail adresu: <a href="mailto:guest.support@airserbia.com">guest.support@airserbia.com</a>.</p>	[{"link": "guest.support@airserbia.com", "type": "email", "placeholder": "@link1@"}]	\N	t
29	JH9NXF4IXV60R7QU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	2	Da li je za boce za vazduh koje se ugrađuju u vozila potrebno pribavljanje isprave o usaglašenosti prilikom uvoza u Srbiju?	Za uvoz u Republiku Srbiju nije potrebno pribavljanje isprave o usaglašenosti za posude za vazduh koje su izrađene prema direktivi 2014/68/EU i koriste se za ugradnju u vozila, najčešće za sklopove oslanjanja vozila. Uobičajeno je da takva oprema nosi evropski znak usaglašenosti CE.	\N	\N	t
30	6TFOE2YZRLY0AK7K	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Koji su kontakti lučkih kapetanija?	@table1@	[{"link": "+381112029900", "type": "phone", "title": "011/2029-900", "placeholder": "@phone1@"}, {"link": "+38113342560", "type": "phone", "title": "013/342-560", "placeholder": "@phone2@"}, {"link": "+381264627140", "type": "phone", "title": "026/4627-140", "placeholder": "@phone3@"}, {"link": "+38126614290", "type": "phone", "title": "026/614-290", "placeholder": "@phone4@"}, {"link": "+38112662219", "type": "phone", "title": "012/662-219", "placeholder": "@phone5@"}, {"link": "+38119800284", "type": "phone", "title": "019/800-284", "placeholder": "@phone6@"}, {"link": "+38193524026", "type": "phone", "title": "019/3524-026", "placeholder": "@phone7@"}, {"link": "+38122621080", "type": "phone", "title": "022/621-080", "placeholder": "@phone7@"}, {"link": "+38122621080", "type": "phone", "title": "022/621-080", "placeholder": "@phone8@"}, {"link": "+381212962133", "type": "phone", "title": "021/2962-133", "placeholder": "@phone9@"}, {"link": "+38124812200", "type": "phone", "title": "024/812-200", "placeholder": "@phone10@"}, {"link": "+38121526684", "type": "phone", "title": "021/526-684", "placeholder": "@phone11@"}, {"link": "+38121528457", "type": "phone", "title": "021/528-457", "placeholder": "@phone12@"}, {"link": "+38125772245", "type": "phone", "title": "025/772-245", "placeholder": "@phone13@"}, {"link": "+38121750071", "type": "phone", "title": "021/750-071", "placeholder": "@phone14@"}]	[{"columns": [["Beograd", "Karađorđeva 6", "@phone1@"], ["Pančevo", "Dositejeva 13", "@phone2@"], ["Smederevo", "Despota Đurđa 11", "@phone3@", "@phone4@"], ["Veliko Gradište", "Obala kralja Petra I br. 13", "@phone5@"], ["Kladovo", "Dunavska 11", "@phone6@"], ["Prahovo", "Pristanišna zona b.b.", "@phone7@"], ["Sremska Mitrovica", "Promenada 13", "@phone8@"], ["Titel", "Potiski kej 1", "@phone9@"], ["Senta", "Glavna br. 1", "@phone10@"], ["Novi Sad", "Beogradski kej 11", "@phone11@", "@phone12@"], ["Apatin", "Dunavske obale b.b.", "@phone13@"], ["Bačka Palanka", "Kralja Petra I br. 5", "@phone14@"]], "headers": ["Grad", "Adresa", "Telefon 1", "Telefon 2"], "placeholder": "@table1@"}]	t
31	AVNUYLO4G3I4TE2S	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde mogu da se izvrše zdravstveni pregledi za izdavanje brodarske knjižice?	Zdravstvene preglede za izdavanje brodarske knjižice vrše ovlašćene zdravstvene ustanove za preglede članova posade brodova unutrašnje plovidbe, čiji spisak je objavljen na sajtu ministarstva, @link1@.	[{"link": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-zdravstvenih-ustanova-ovlashtshenih-za-vrshenje-zdravstvenih-pregleda-chlanova", "type": "url", "placeholder": "@link1@"}]	\N	t
32	ODWSKMEVBXS13VIJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde mogu da se izvrše zdravstveni pregledi za izdavanje pomorske knjižice?	Zdravstvene preglede za izdavanje pomorske knjižice vrše ovlašćene zdravstvene ustanove za preglede pomoraca, čiji spisak je objavljen na sajtu ministarstva, @link1@.	[{"link": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-zdravstvenih-ustanova-ovlashtshenih-za-vrshenje-zdravstvenih-pregleda-pomoraca", "type": "url", "placeholder": "@link1@"}]	\N	t
33	BWLSCD4OZWL035Z5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Koje je radno vreme lučkih kapetanija?	Radno vreme lučkih kapetanija je od 07:30 do 15:30 časova.	\N	\N	t
34	UGCXY1LKCPKUKU99	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Koje su ovlašćene kompanije za posredovanje pri zapošljavanju pomoraca?	Spisak ovlašćenih kompanija za posredovanje pri zapošljavanju pomoraca je objavljen na sajtu ministarstva, @link1@.	[{"link": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-kompanija-za-posredovanje-pri-zaposhljavanju-pomoraca", "type": "url", "placeholder": "@link1@"}]	\N	t
35	DZLIYFJE7L0IU43U	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Da li postoji u Republici Srbiji akreditovana institucija za obuku pomoraca i brodaraca?	U Republici Srbiji trenutno nema akreditovanih institucija za obuku pomoraca i brodaraca.	\N	\N	t
36	HH0LBTI8HVBAOYNH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde se izdaju međunarodne dozvole za upravljanje čamcem?	Međunarodne dozvole za upravljanje čamcem izdaju lučke kapetanije prema prebivalištu podnosioca zahteva.	\N	\N	t
37	OTX3UA2XBK3GALVQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde se rade tehnički pregledi čamaca namenjenih za sport i razonodu?	Tehničke preglede čamaca namenjenih za sport i razonodu vrše lučke kapetanije prema prebivalištu podnosioca zahteva.	\N	\N	t
38	ABEMJV0TJHAFMLHO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde se rade tehnički pregledi čamaca namenjenih za privredne svrhe?	Uprava za utvrđivanje sposobnosti brodova za plovidbu, koja je organ uprave u sastavu ovog ministarstva vrši tehničke preglede čamaca namenjenih za privredne svrhe. Sedište Uprave je na Novom Beogradu, ulica Narodnih heroja 30.	\N	\N	t
39	IFPHKQSHF5SCRQ6D	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Koji je broj žiro-računa na koji se uplaćuju administrativne takse?	Administrativne takse uplaćuju se u korist Budžeta Republike Srbije, broj računa je 840-742221843-57, broj modela je 97, a poziv na broj se razlikuje u zavisnosti od opštine gde se uplaćuje.	\N	\N	t
40	FWPKHJXKEO4TLV16	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde se izdaju dozvole za upravljanje čamcem?	Dozvole za upravljanje čamcem izdaju lučke kapetanije prema prebivalištu podnosioca zahteva.	\N	\N	t
41	SXLDOQFHPCECCNAA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde se polaže ispit za vozara unutrašnje plovidbe i gde mogu da se pronađu pitanja za pripremu ispita?	Ispit za vozara unutrašnje plovidbe polaže se u ovom ministarstvu. Pitanja za pripremanje ispita mogu se naći na sajtu ministarstva, @link1@.	[{"link": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-pitanja-za-polaganje-ispita-za-sticanje-svedochanstva-o-osposobljenosti-za", "type": "url", "placeholder": "@link1@"}]	\N	t
42	CL0131BECKPYIOQS	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Da li se u Republici Srbiji priznaju ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama Evropske unije?	Republika Srbiji priznaje ovlašćenja članova posade brodova unutrašnje plovidbe koja su izdala države članice Evropske unije.	\N	\N	t
43	UOHL8DG3DQCJPYEH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Da li je potrebno odobrenje za održavanje sportskih manifestacija na vodnom putu?	Na vodnom putu mogu se održavati sportska takmičenja, odnosno priredbe, na osnovu odobrenja lučke kapetanije.	\N	\N	t
44	RDTZN0MKSMOUBWZR	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Ko može da se bavi proizvodnjom čamaca u Republici Srbiji?	Čamce mogu da grade odobreni proizvođači kojima je Uprava za utvrđivanje sposobnosti brodova za plovidbu izdala odobrenje za gradnju čamaca. Na sajtu Uprave za utvrđivanje sposobnosti brodova nalazi se popis izdatih odobrenja.	\N	\N	t
45	RY03DFZBYMQ0CBUH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Da li strani brodovima mogu da uplove u državni vodni put?	Brodovi strane zastave mogu da uplove u državni vodni put ukoliko imaju odobrenje ovog ministarstva.	\N	\N	t
46	XZH8F6EBCGA1FO9V	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Ko u Republici Srbiji vrši utvrđivanje sposobnosti za plovidbu brodova unutrašnje plovidbe?	Uprava za utvrđivanje sposobnosti brodova za plovidbu, koja je organ uprave u sastavu ovog ministarstva vrši preglede brodova unutrašnje plovidbe. Sedište Uprave je na Novom Beogradu, ulica Narodnih heroja 30.	\N	\N	t
48	BSJZJYQW0KCXLZVM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Ko je nadležan za održavanje i obeležavanje Dunava i Save?	Direkcija za vodne puteve, koja je organ uprave u sastavu ovog ministarstva vrši tehničko održavanje Dunava i Save. Sedište Direkcije za vodne puteve je u Beogradu, Francuska 9.	\N	\N	t
49	DEMLYDN4XILKEV3D	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	3	Gde se podnose zahtevi za izdavanje ovlašćenja o osposobljenosti članova posade brodova unutrašnje plovidbe?	Zahtevi za izdavanje ovlašćenja o osposobljenosti članova posade brodova unutrašnje plovidbe podnose se nadležnoj lučkoj kapetaniji prema prebivalištu podnosioca zahteva.	\N	\N	t
50	J6W0RBJWV8HMNWUE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Šta je sertifikat zelene gradnje, ko je nadležan za izdavanje sertifikata zelene gradnje?	Sertifikat zelene gradnje je potvrda za koju je u cilju smanjenja emisije gasova sa efektom staklene bašte, korišćenja ekološki sertifikovanih građevinskih materijala i opreme, smanjenja produkcije otpada, korišćenja obnovljivih izvora energije, za sve nove zgrade preko 10.000 m2 bruto razvijene građevinske površine, po izdavanju upotrebne dozvole, propisana obaveza pribavljanja sertifikata zelene gradnje. Vlada na predlog ministarstva nadležnog za poslove građevinarstva donosi strategiju za unapređenje  mera podsticaja zelene gradnje postojećeg nacionalnog fonda zgrada. Sertifikat izdaje međunarodni sistem za sertifikaciju zelenih zgrada, kojim se verifikuje da je objekat ispunio zadate kriterijume i služi za ocenjivanje kvaliteta i stepena ispunjenosti kriterijuma zelene gradnje, odnosno Agencija za prostorno planiranje  i urbanizam Republike Srbije, koja izdaje odnosno potvrđuje sertifikate zelene gradnje.	\N	\N	t
51	WHNXNXD5IFQMRHEL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Кako se određuje projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju?	Projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju na predlog ministarstva nadležnog za poslove građevinarstva  utvrđuje Vlada Republike Srbije.	\N	\N	t
52	W6AFJ1UACG4KWGGK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta za koji je utvrđeno da je od posebnog značaja za Republiku Srbiju, sprovodi na osnovu donetog rešenja nadležne službe za katastar nepokretnosti?	Organ nadležan za poslove državnog premera i katastra provodi deobu katastarskih parcela bez obzira na vrstu zemljišta, na osnovu projekta parcelacije i preparcelacije za izgradnju linijskog infrastrukturnog objekta za koji je utvrđeno da je od posebnog značaja za Republiku Srbiju, elaborata geodetskih radova za provođenje promena u katastru nepokretnosti, odnosno plana parcelacije sadržanog u planskom dokumentu i projekta eksproprijacije sa dokazom o izvršenoj tehničkoj kontroli. Deoba katastarskih parcela sprovodi se samo kroz bazu podataka katastra nepokretnosti, van upravnog postupka i o sprovedenoj deobi se ne donosi posebno rešenje.	\N	\N	t
53	CAPDUOBWCQPSJRDP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li se objekti, odnosno radovi za koje je utvrđeno da predstavljaju Projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju, mogu izvoditi na šumskom, odnosno poljoprivrednom zemljištu, odnosno da li je potrebna promena namene zemljišta, pre podnošenja zahteva za izdavanje građevinske dozvole?	Naknada za promenu namene poljoprivrednog i šumskog u građevinsko zemljište ne plaća se prilikom izgradnje objekata od značaja, odnosno od posebnog značaja za Republiku Srbiju, kao i za izgradnju objekata javne namene u skladu sa programom uređivanja građevinskog zemljišta kada je obveznik plaćanja Republika Srbija, autonomna pokrajina, odnosno jedinica lokalne samouprave, kao i javna preduzeća čiji su osnivači Republika Srbija, autonomna pokrajina, odnosno jedinica lokalne samouprave. Dakle u odnosu na navedene radove, odnosno objekte nije potrebno sprovesti promenu namene šumkog, odnosno poljoprivrednog zemljišta pre podnošenja zahteva za izdavanje građevinske dozvole.	\N	\N	t
54	YYPAH61OIRGK6N12	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Potrebno je tokom realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju izmestiti infrastrukturu, odnosno ukloniti/srušiti objekat koji je izgrađen suprotno zakonu, na koji način se u tom slučaju mogu rešiti imovinsko-prani odnosi?	Ako  je za potrebe izvođenja radova na izgradnji linijske infrastrukture od posebnog značaja za Republiku Srbiju potrebno sprovesti uklanjanje objekta izgrađenog suprotno zakonu, kao dokaz o odgovarajućem pravu smatra se: 1) izjava overena u skladu sa zakonom koji uređuje overu potpisa, kojom se stranka legitimisana u postupku ozakonjenja neopozivo izjašnjava da nije zainteresovana za ozakonjenje objekta izgrađenog suprotno zakonu, te da ovlašćuje investitora da bespravno izgrađeni objekat može ukloniti, kao i da na osnovu navedene izjave u njeno ime i za njen račun može obustaviti postupak ozakonjenja kod nadležnog organa, u skladu sa zakonom koji uređuje upravni postupak; 2) saglasnost vlasnika zemljišta na kome se nalazi objekat izgrađen suprotno zakonu, ako objekat nije evidentiran i popisan od strane građevinskog inspektora; 3) saglasnost upravljača infrastrukture/vršioca komunalne delatnosti, ako objekat izgrađen suprotno zakonu predstavlja linijski infrastrukturni objekat, odnosno objekat komunalne infrastrukture.	\N	\N	t
55	MREUYJJVS2XKT0BP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	U postupku realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju, predviđeno je rušenje nezakonito izgrađene porodične kuće, koja su prava vlasnika iste?	U slučaju izgradnje linijskog infrastrukturnog objekta od posebnog značaja za Republiku Srbiju, investitor takvog objekta dužan je da, vlasniku stambenog objekta (porodične stambene zgrade ili stambenog objekta koji se sastoji od više stanova) izgrađenog suprotno zakonu pre stupanja na snagu planskog akta kojim je zemljište na kome se takav objekat nalazi određeno za javne namene, obezbedi drugi odgovarajući stambeni objekat ili stan, bez obzira da li je za taj objekat pokrenut postupak ozakonjenja, ili da mu isplati novčanu naknadu u visini sredstava potrebnih radi obezbeđivanja drugog odgovarajućeg stambenog objekta ili stana.	\N	\N	t
70	TYVM5WKEG9IPHHYU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Кada će biti omogućeno privremeno priključenje nezakonito izgrađenih objekata na mrežu, odnosno infrastrukturu?	Odredbama člana 41. Zakona, propisane su novčane kazne za privredni prestup za javno preduzeće, javno komunalno preduzeće, privredno društvo ili drugo pravno lice, koje po prijemu akta kojim se odbacuje ili odbija zahtev za ozakonjenje ne isključi objekat sa mreže odnosno infrastrukture na koju je privremeno priključen kao i u slučaju kada objekat koji je u postupku ozakonjenja priključi na mrežu, odnosno infrastrukturu. Propisivanje navedene odredbe imalo je za cilj da se vlasnici nezakonito izgrađenih objekta podstaknu da uđu u postupak ozakonjenja i uzmu aktivno učešće u istom kako bi na što jednostavniji način rešili svoje  socijalno i stambeno pitanje.	\N	\N	t
87	6MRCCEPRT6PQOA4I	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Gde i kako mogu da se podnose zahtevi za pojedinačni plan raspodele dozvola?	Zahtevi se podnose do 30. novembra tekuće godine za narednu godinu, na šalteru Uprave za zajedničke poslove republičkih organa, adresa: Sremska 3-5, 11000 Beograd, Ministarstvo građevinarstva, saobraćaja i infrastrukture	\N	\N	t
56	1TN9QKUSVQLXHGQU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li nadležni organ može da se obraća imaocima javnih ovlašćenja za izdavanje uslova, u postupku izdavanja lokacijskih uslova, ukoliko su u postupku izrade urbanističkog projekta već pribavljeni uslovi imalaca javnih ovlašćenja, takođe Da li će nadležni organ u postupku izdavanja lokacijskih uslova pribavljati dodatne uslove imaoca javnih ovlašćenja u odnosu na tehničke uslove pribavljene za izradu urbanističkog projekta?	Uslovi imalaca javnog ovlašćenja, prikupljeni u postupku izrade i potvrđivanja urbanističkog projekta, su istovremeno i uslovi koji se koriste prilikom izdavanja lokacijskih uslova, ukoliko se uz zahtev za izdavanje lokacijskih uslova dostavi i potvrđen urbanistički projekat. Međutim, ukoliko su uslovi imalaca javnih ovlašćenja koji su pribavljeni za potrebe izrade Urbanističkog projekta istekli, nadležni organ će se obratiti nadležnim imaocima javnih ovlašćenja za pribavljanje odgovarajućih uslova. Sa druge strane, ukoliko u postupku izrade urbanističkog projekta nisu pribavljeni svi uslovi imalaca javnih ovlašćenja, nadležni organ će postupiti u skladu sa članom 54 važećeg Zakona o planiranju i izgradnji, u kom se navodi sledeće: „Ako planski dokument, odnosno separat, ne sadrži mogućnosti, ograničenja i uslove za izgradnju objekata, odnosno sve uslove za priključenje na komunalnu, saobraćajnu i ostalu infrastrukturu, nadležni organ te uslove pribavlja po službenoj dužnosti, o trošku podnosioca zahteva uz naknadu stvarnih troškova izdavanja.	\N	\N	t
57	CAUXLP2QYBGXEWN5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Planiramo izgradnju objekta površina preko 20.000m2, da li možemo podneti zahtev za izdavanje lokacijskih uslova i ostalih akata Ministarstvu građevinarstva, saobraćaja i infrastrukture?	U slučaju izgradnje objekta čija je bruto razvijena građevinska površina preko 20.000m2, investitor može podneti zahtev za izdavanje svih akata za izgradnju građevinske dozvole jedinici lokalne samouprave ili ministarstvu nadležnom za poslove građevinarstva. Investitor, koji je ishodovao lokacijske uslove pred nadležnim organom jedinice lokalne samouprave, može podneti zahtev za izdavanje građevinske dozvole ministarstvu nadležnom za poslove građevinarstva bez obaveze sprovođenja postupka revizije projekta. Investitor, koji podnosi zahtev za izdavanje lokacijskih uslova pred ministarstvom nadležnim za poslove građevinarstva, sve dalje postupke vodi i okončava po odredbama ovog zakona.	\N	\N	t
58	8NYVHR5EKFLYJOA4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Nadležni organ jedinice lokalne samouprave nije doneo odluku u roku od 30 dana od dana podnošenja zahteva za izdavanje lokacijskih uslova, koja su moja prava?	Кada organ iz stava 2. ovog člana ne reši po zahtevu za izdavanje lokacijskih uslova, građevinske i/ili upotrebne dozvole u zakonom propisanom roku, odnosno u roku od najviše 30 dana od dana podnošenja urednog zahteva stranke, kao i u svim slučajevima „ćutanja administracije“, nadležno ministarstvo će, po zahtevu stranke, preuzeti nadležnost za izdavanje građevinske dozvole tih akata. Organ od koga je nadležno ministarstvo preuzelo nadležnost za izdavanje građevinske dozvole, dužan je da odmah, a najkasnije u roku od pet radnih dana od prijema zahteva za ustupanje spisa, ministarstvu dostavi sve spise predmeta.	\N	\N	t
59	TN1ODCIK3XUOBVGN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li trećem licu može biti priznato svojstvo strane u postupku izdavanja građevinske dozvole?	Stranka u postupku izdavanja građevinske dozvole je investitor, te ne postoji mogućnost priznavanja svojstva stranke u postupku izdavanja građevinske dozvole trećim licima.	\N	\N	t
60	6XE3NS73WSXHXH5J	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Кako se podnosi zahtev za ishodovanje lokacijskih uslova?	Zahtev za izdavanje lokacijskih uslova podnosi se elektronski u objedinjenoj proceduri nadležnom organu u sladu sa čl. 6. Uredbe o lokacijskim uslovima ("Službeni glasnik RS", broj 115/2020 ), kao i u skladu sa čl. 6 Pravilnika o postupku sprovođenja objedinjene procedure elektronskim putem ("Službeni glasnik RS", broj 68 od 25. septembra 2019), kojim je propisano da se postupak za izdavanje lokacijskih uslova pokreće podnošenjem zahteva nadležnom organu kroz CIS.	\N	\N	t
61	IHEGC4GPU5B6L6TQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li je za izradu idejnog rešenja, a za potrebe pribavljanja lokacijskih uslova potrebna velika licenca?	Za izradu idejnog rešenja, a za potrebe pribavljanja lokacijskih uslova potrebna je velika licenca, u skladu sa:\n- Pravilnikom o uslovima koje treba da ispune pravna lica i preduzetnici za obavljanje poslova izrade tehničke dokumentacije, odnosno građenja objekata, za objekte za koje građevinsku dozvolu izdaje ministarstvo, odnosno nadležni organ autonomne pokrajine, a koji precizira potrebu posedovanja velike licence po vrsti objekta i vrsti tehničke dokumentacije\n- Članom 116 Zakona o planiranju i izgradnji („Sl. glasnik RS“ br. 72/09, 81/09 – ispravka, 64/10 – odluka US, 24/11, 121/12, 42/13-odluka US, 50/13-odluka US, 98/13-odluka US, 132/14, 145/14 i 83/2018, 31/2019, 37/2019, 9/2020 i 52/2021) kojim je propisano da se tehnička dokumentacija izrađuje kao generalni projekat, idejno rešenje, idejni projekat, projekat za građevinsku dozvolu, projekat za izvođenje i projekat izvedenog objekta.	\N	\N	t
62	WAGGNG2GXLVWL1SR	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Кoju dokumentaciju je potrebno dostaviti uz zahtev za izdavanje lokacijskih uslova?	U skladu sa čl. 6 st.2 Pravilnika o postupku sprovođenja objedinjene procedure elektronskim putem ("Službeni glasnik RS", broj 68 od 25. septembra 2019) propisano je da se uz zahtev za izdavanje lokacijskih uslova prilaže idejno rešenje, u skladu sa pravilnikom kojim se uređuje sadržina tehničke dokumentacije. Takođe potrebno je dostaviti dokaz o uplati administrativne takse za kao i  dokaz o plaćenim republičkim administrativnim taksama (opšta taksa za podnesak, čija je visina propisana Tarifnim brojem 1 i taksa za izdavanje lokacijskih uslova, čija je visina propisana Tarifnim brojem 171v) sve u skladu sa  Zakonom o republičkim administrativnim taksama ("Sl. glasnik RS", br. 43/2003, 51/2003 - ispr., 61/2005, 101/2005 - dr. zakon, 5/2009, 54/2009, 50/2011, 70/2011 - usklađeni din. izn., 55/2012 - usklađeni din. izn., 93/2012, 47/2013 - usklađeni din. izn., 65/2013 - dr. zakon, 57/2014 - usklađeni din. izn., 45/2015 - usklađeni din. izn., 83/2015, 112/2015, 50/2016 - usklađeni din. izn., 61/2017 - usklađeni din. izn., 113/2017, 3/2018 - ispr., 50/2018 - usklađeni din. izn., 95/2018, 38/2019 - usklađeni din. izn., 86/2019, 90/2019 - ispr., 98/2020 - usklađeni din. izn., 144/2020, 62/2021 - usklađeni din. izn. i 138/2022), kao i dokaz o plaćenoj naknadi za CEOP, primalac Agencija za privredne registre, Brankova br. 25, Beograd, u skladu sa članom 22. stav 1, tačke 1 i 2 Odluke o naknadama za poslove registracije i druge usluge koje pruža Agencija za privredne registre (̰„Sl. glasnik RS”, br. 131/2022)	\N	\N	t
85	LAVNTDQY5VILGUD8	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Koji je uslov da domaći prevoznik može da dobije dozvole za obaljanje međunarodnog prevoza tereta?	Uslov je da prevoznik podnese zahtev za utvrđivanje pojedinačnog plana raspodele. Zahtev se podnosi na šalteru uprave za zajedničke poslove republičkih organa, adresa: Sremska 3-5, 11000 Beograd, Ministarstvo građevinarstva, saobraćaja i infrastrukture	\N	\N	t
86	GNLOEYTDN7OONSZK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Šta čini pojedinačni plan raspodele dozvola?	Pojedinačni plan raspodele čine pojedinačne, vremenske i CEMT dozvole	\N	\N	t
63	SQVVRU4FJWFUGKSD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li je potrebno pribaviti akt nadležnog organa, građevinsku dozvolu odnosno rešenje o odobrenju za izvođenje radova, za radove na obejktu koji obuhvataju gletovanje i krečenje zidova, zamenu sanitarija u kupatilu, farbanje i popravku stolarije, kao i hoblovanje i lakiranje parketa“?	Članom 2. Zakona o planiranju i izgradnji („Sl.glasnik RS“ br. 72/2009, 81/2009-ispr., 64/2010-odluka US, 24/2011, 121/2012, 42/2013 – odluka US, 50/2013 – odluka US, 98/2013 – odluka US, 132/2014, 145/2014, 83/2018, 31/2019 i 37/2019 –dr-zakon, 9/2020 i 52/2021) definisano je značenje pojedinih izraza, upotrebljenih u ovom zakonu, te je definisan, između ostalog, pojam tekućeg (redovnog) održavanja objekta kao izvođenje radova koji se preduzimaju radi sprečavanja oštećenja koja nastaju upotrebom objekta ili radi otklanjanja tih oštećenja, a sastoje se od pregleda, popravki i preduzimanja preventivnih i zaštitnih mera, odnosno svi radovi kojima se obezbeđuje održavanje objekta na zadovoljavajućem nivou upotrebljivosti, kao što su krečenje, farbanje, zamena obloga, zamena sanitarija, radijatora, zamena unutrašnje i spoljašnje stolarije i bravarije, zamena unutrašnjih instalacija i opreme bez povećanja kapaciteta i drugi slični radovi, ako se njima ne menja spoljni izgled zgrade i ako nemaju uticaj na zajedničke delove zgrade i njihovo korišćenje. Članom 2. Pravilnikom o posebnoj vrsti objekata i posebnoj vrsti radova za koje nije potrebno pribavljati akt nadležnog organa, kao i vrsti objekata koji se grade, odnosno vrsti radova koji se izvode, na osnovu rešenja o odobrenju za izvođenje radova, kao i obimu i sadržaju i kontroli tehničke dokumentacije koja se prilaže uz zahtev i postupku koji nadležni organ sprovodi („Službeni glasnik RS“, br. 102/2020, 16/2021 i 87/2021, propisane su posebne vrste objekata i posebne vrste radova za koje nije potrebno pribavljati akt nadležnog organa, gde, između ostalog, spadaju radovi na tekućem održavanju objekta ili dela objekta (stana ili drugog posebnog dela). Iz navedenog sledi da za radove koji se mogu svrstati u radove tekućeg održavanja, nije potrebno pribavljati akt nadležnog organa.	\N	\N	t
64	V2R0EMFM9XG9HKNL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li izvođač radova može sve neophodne velike licence potrebne za izvođenje radova koje je ugovorio (koje su prepoznate kao neophodne shodno radovima definisanim ugovorom o građenju) da obezbedi preko jednog ili više podizvođača, a da pri tome izvođač radova kao pravno lice ne poseduje nijednu“?	Članom 150. Zakona o planiranju i izgradnji ("Sl. glasnik RS", br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/2013 - odluka US, 50/2013 - odluka US, 98/2013 - odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 - dr. zakon, 9/2020 i 52/2021) u daljem takstu - Zakon, propisano je da  građenje objekta, odnosno izvođenje radova može da vrši pravno lice ili preduzetnik (u daljem tekstu: izvođač radova), osnovan u skladu sa zakonom koji: 1) ima zaposlene, odnosno radno angažovane licencirane izvođače radova upisane u registar licenciranih izvođača u skladu sa ovim zakonom i propisima donetim na osnovu ovog zakona, sa stručnim rezultatima; 2) ima odgovarajuće stručne rezultate; 3) poseduje rešenje o ispunjenosti uslova za građenje odgovarajuće vrste objekata, odnosno izvođenje odgovarajuće vrste radova na tim objektima; 4) je upisan u odgovarajući registar za građenje odgovarajuće vrste objekata, odnosno izvođenje odgovarajućih radova na tim objektima, koji vodi ministarstvo nadležno za poslove planiranja i izgradnje u skladu sa ovim zakonom. Istim članom, stavom drugim, propisano je da,  ako izvođač radova za određene radove angažuje drugo pravno lice ili drugog preduzetnika (u daljem tekstu: podizvođač), podizvođač mora da ispunjava uslove propisane ovim zakonom i propisima donetim na osnovu ovog zakona, za izvođenje te vrste radova za koje je angažovan.\nIzvođač radova mora ispunjavati uslove propisane članom 150. Zakona, a ukoliko angažuje podizvođača, i podizvođač mora da ispunjava uslove propisane Zakonom i propisima donetim na osnovu zakona, odnosno za objekte iz člana 133. stav 2. Zakona o planiranju i izgradnji, podizvođač mora, između ostalog, da bude upisan u odgovarajući registar za građenje odgovarajuće vrste objekata, odnosno izvođenje odgovarajućih radova na tim objektima, koji vodi ministarstvo nadležno za poslove planiranja i izgradnje u skladu sa ovim Zakonom.	\N	\N	t
65	M27NMSTHPX4H3RRW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li je Rešenje o građevinskoj dozvoli doneto pre stupanja na snagu Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/13-US, 50/13-US, 98/13-US, 132/2014, 145/2014 i 83/2018), kojim je uvedeno da se  važenje građevinske dozvole vezuje za momenat prijave radova, i dalje važeće“ ?	Odredbama člana 140. Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/13-US, 50/13-US, 98/13-US, 132/2014 i 145/2014) – u daljem tekstu „Zakon“, koji je važio u vreme izdavanja predmetnog rešenja o građevinskoj dozvoli, bilo je propisano da građevinska dozvola prestaje da važi ako se ne otpočne sa građenjem objekta, odnosno izvođenjem radova, u roku od dve godine od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola. Rešenje kojim se utvrđuje prestanak važenja građevinske dozvole iz stava 1. ovog člana donosi organ nadležan za izdavanje građevinske dozvole. Građevinska dozvola prestaje da važi ako se u roku od pet godina od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola, ne izda upotrebna dozvola, osim za objekte iz člana 133. ovog zakona, objekte komunalne infrastrukture koji se izvode fazno i porodične stambene zgrade koje investitor gradi radi rešavanja svojih stambenih potreba. Na zahtev investitora, nadležni organ može doneti rešenje kojim se odobrava da pravnosnažna građevinska dozvola ostaje na pravnoj snazi još dve godine od roka propisanog stavom 3. ovog člana, ako investitor pruži dokaz da je stepen završenosti objekata preko 80%, odnosno ako se u postupku utvrdi da je objekat ukrovljen, sa postavljenom spoljnom stolarijom i izvedenim razvodima unutrašnjih instalacija koje omogućavaju njegovo priključenje na spoljnu mrežu infrastrukture. Posle isteka roka iz stava 3, odnosno stava 4. ovog člana, investitor plaća na račun Poreske uprave naknadu u visini poreza na imovinu, koji bi se plaćao u skladu sa zakonom kojim se uređuje porez na imovinu za ceo objekat, da je isti izgrađen u skladu sa građevinskom dozvolom, sve dok se za tu lokaciju ne izda nova građevinska dozvola. Rešenje kojim se utvrđuje prestanak važenja građevinske dozvole iz stava 3. odnosno stava 4. ovog člana donosi organ nadležan za izdavanje građevinske dozvole, a po pravnosnažnosti to rešenje dostavlja Poreskoj upravi na čijoj teritoriji se nalazi predmetni objekat.\nDalje, odredbama člana 148. Zakona, bilo je propisano da investitor podnosi prijavu radova organu koji je izdao građevinsku dozvolu najkasnije osam dana pre početka izvođenja radova. Uz prijavu radova podnosi se dokaz o regulisanju obaveza u pogledu doprinosa za uređivanje građevinskog zemljišta, u skladu sa ovim zakonom, kao i dokaz o plaćenoj administrativnoj taksi. Za linijske infrastrukturne objekte, pored dokaza iz stava 2. ovog člana, kada je rešenje o građevinskoj dozvoli izdato na osnovu konačnog rešenja o eksproprijaciji, dostavlja se i akt ministarstva nadležnog za poslove finansija o uvođenju u posed nepokretnosti, u skladu sa posebnim zakonom, odnosno zaključen ugovor o pravu službenosti u skladu sa ovim zakonom. U prijavi iz stava 1. ovog člana investitor navodi datum početka i rok završetka građenja, odnosno izvođenja radova. Nadležni organ o podnetoj prijavi obaveštava građevinsku inspekciju. Rok za završetak građenja počinje da teče od dana podnošenja prijave iz stava 1. ovog člana.\nIz navedenih zakonskih odredbi sledi da je investitor bio dužan da organu koji je izdao građevinsku dozvolu prijavi početak građenja objekta, najkasnije osam dana pre početka izvođenja radova. Takođe, sledi da ukoliko je po predmetnom rešenju o građevinskoj dozvoli, otpočeto sa izvođenjem radova, odnosno sa građenjem objekta u roku od dve godine od dana pravnosnažnosti rešenja, građevinska dozvola i dalje važi, bez obzira na predviđen rok završetka građenja objekta. Dakle, Zakon je kao momenat koji utiče na važenje građevinske dozvole predviđao faktičko otpočinjanje sa izvođenjem radova, odnosno sa građenjem objekta. \nDalje, ukazujemo da za objekte iz člana 133. Zakona, u sitaciji kada je otpočeto sa izvođenjem radova, odnosno građenjem objekta u roku od dve godine od dana pravnosnažnosti rešenja o građevinskoj dozvoli (što predstavlja preduslov koji utiče na važenje građevinske dozvole), Zakon nije predviđao rok za pribavljanje upotrebne dozvole.	\N	\N	t
66	WVFHNCJOQKHVTMK1	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li je potrebno pribavljanje akta nadležnog organa za izvođenje radova na postavljanju postrojenja instalisane snage do 50kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca – proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije?	Članom 144. Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/2013 - odluka US, 50/2013 - odluka US, 98/2013 - odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 - dr. zakon, 9/2020 i 52/2021) – u daljem tekstu „Zakon“, propisano je da se posebna vrsta objekata može graditi, odnosno određeni radovi izvoditi i bez pribavljanja akta nadležnog organa, u skladu sa posebnim propisom iz člana 201. stav 7. tačka 13a) ovog zakona, odnosno Pravilnikom o posebnoj vrsti objekata i posebnoj vrsti radova za koje nije potrebno pribavljati akt nadležnog organa, kao i vrsti objekata koji se grade, odnosno vrsti radova koji se izvode, na osnovu rešenja o odobrenju za izvođenje radova, kao i obimu i sadržaju i kontroli tehničke dokumentacije koja se prilaže iz zahtev i postupku koji nadležni organ sprovodi.\nČlanom 2. stav 1. tačka 4a) Pravilnika o posebnoj vrsti objekata i posebnoj vrsti radova za koje nije potrebno pribavljati akt nadležnog organa, kao i vrsti objekata koji se grade, odnosno vrsti radova koji se izvode, na osnovu rešenja o odobrenju za izvođenje radova, kao i obimu i sadržaju i kontroli tehničke dokumentacije koja se prilaže iz zahtev i postupku koji nadležni organ sprovodi („Sl. glasnik RS“, br. 102/2020, 16/2021 i 87/2021) – u daljem tekstu „Pravilnik“, propisano je da za posebne vrste objekata i posebne vrste radova nije potrebno pribavljati akt nadležnog organa, između ostalog, i za postrojenja instalisane snage do 50 kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca koji stiče status kupca - proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije.\nImajući u vidu navedene odredbe Zakona i Pravilnika, sledi da za postavljanje postrojenja instalisane snage do 50kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca – proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije, nije potrebno pribaviti akt nadležnog organa za izvođenje radova (dakle, niti građevinsku dozvolu, niti rešenje o odobrenju za izvođenje radova).	\N	\N	t
67	Z9JS9NOPF4V6QIUD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Šta je od dokumentacije potrebno dostaviti kako bi se dobila upotrebna dozvola i uknjižio objekat koji poseduje dozvolu za gradnju?	Zakonom o planiranju i izradnji („Službeni glasnik RS“, br. 72/09, 81/09-ispravka, 64/10-US, 24/11, 121/12, 42/13-US, 50/13-US, 98/13-US, 132/14, 145/2014, 83/18, 31/19, 37/19 i 9/2020), članom 8 a) stavovima 1. i 2. propisano je da se razmena dokumenata i podnesaka u objedinjenoj proceduri obavlja elektronskim putem, te da se sva akta koja u vezi sa objedinjenom procedurom donose nadležni organi i imaoci javnih ovlašćenja, kao i podnesci i dokumenti koji se dostavljaju u objedinjenoj proceduri, uključujući i tehničku dokumentaciju, dostavljaju u formi elektronskog dokumenta. Članom 158. Zakona o planiranju i izgradnji, stav 1. propisano je da organ koji je izdao građevinsku dozvolu izdaje rešenjem upotrebnu dozvolu, u roku od pet radnih dana od dana podnošenja zahteva za izdavanje upotrebne dozvole, dok je stavom 4. propisano da se uz zahtev za izdavanje upotrebne dozvole prilaže izveštaj komisije za tehnički pregled kojim se utvrđuje da je objekat podoban za upotrebu sa predlogom da se može izdati upotrebna dozvola, projekat izvedenog objekta izrađen u skladu sa pravilnikom kojim se bliže uređuje sadržina tehničke dokumentacije, odnosno projekat za izvođenje i izjava stručnog nadzora, izvođača radova i investitora da nije odstupljeno od projekta za izvođenje, a za objekte iz člana 145. ovog zakona za koje nije propisana izrada projekta za izvođenje izjava investitora, vršioca stručnog nadzora i odgovornog izvođača radova da nije odstupljeno od idejnog projekta, specifikacija posebnih delova, rešenje o utvrđivanju kućnog broja, elaborat geodetskih radova za izvedeni objekat i posebne delove objekta i elaborat geodetskih radova za podzemne instalacije, sertifikat o energetskim svojstvima objekta, ako je za objekat propisana obaveza pribavljanja sertifikata o energetskim svojstvima, kao i drugi dokazi u skladu sa propisom kojim se bliže uređuje postupak sprovođenja objedinjene procedure, u ovom slučaju Pravilnik o postupku sprovođenja objedinjene procedure elektronskim putem ("Sl. glasnik RS", br. 68/2019). Stavom 16. i 17. ovog člana propisano je da, u roku od pet radnih dana po pravnosnažnosti izdate upotrebne dozvole, nadležni organ po službenoj dužnosti dostavlja organu nadležnom za poslove državnog premera i katastra upotrebnu dozvolu, elaborat geodetskih radova za izvedeni objekat i posebne delove objekta, kao i elaborat geodetskih radova za podzemne instalacije, te da organ nadležan za poslove državnog premera i katastra vrši upis prava svojine na objektu, odnosno posebnim delovima objekta, i o tome obaveštava investitora i nadležni organ uprave u roku od sedam dana od dostavljanja upotrebne dozvole. Članom 140. stav 4. propisano je da građevinska dozvola prestaje da važi ako se u roku od pet godina od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola, ne izda upotrebna dozvola, osim za objekte iz člana 133. ovog zakona (odnosi se na objekte za koje građevinsku dozvolu izdaje Ministarstvo), objekte komunalne infrastrukture koji se izvode fazno i porodične stambene zgrade koje investitor gradi radi rešavanja svojih stambenih potreba. Odredbe st. 4. ovog člana odnose se i na rešenja o građevinskoj dozvoli, odnosno rešenja o odobrenju za izgradnju koja su izdata u skladu sa ranije važećim zakonima kojima je uređivana izgradnja objekata, pre 11. septembra 2009. godine. Rok za pribavljanje upotrebne dozvole za ove objekte je dve godine od dana stupanja na snagu ovog zakona. Iz navedenih zakonskih i podzakonskih odredbi sledi da se zahtev podnosi organu koji je izdao građevinsku dozvolu elektronskim putem kroz CIS, da se uz zahtev prilaže dokumentacija propisana članom 158. Zakona o planiranju i izgradnji i Pravilnikom o postupku sprovođenja objedinjene procedure elektronskim putem, te da nadležni organ po službenoj dužnosti po pravnosnažnosti upotrebne dozvole istu dostavlja organu nadležnom za poslove državnog premera i katastra zajedno sa elaboratima kako bi izvršio upis prava svojine na objektu. Ukoliko je istekao rok od pet godina od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola, a da nije doneto rešenje o upotrebnoj dozvoli, nadležni organ donosi rešenje kojim se utvrđuje prestanak važenja građevinske dozvole. Imajući u vidu da se u tom slučaju može smatrati da je objekat izgrađen bez građevinske dozvole, odnosno bez odobrenja nadležnog organa za gradnju u smislu Zakona o planiranju i izgradnji, to isti može postati predmet ozakonjenja objekata, pod uslovima koji su propisani odredbama Zakona o ozakonjenju objekata.	\N	\N	t
68	0UL8HFN9W8N49HMD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	U čijoj nadležnosti je izdavanje građevinske dozvole za izgradnju postrojenja za tretman neopasnog otpada kapaciteta od oko 8 t na dnevnom nivou?	Članom 133. stav 2. tačka 10) Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/2013 - odluka US, 50/2013 - odluka US, 98/2013 - odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 - dr. Zakon, 9/2020 i 52/2021), propisano je da Ministarstvo građevinarstva, saobraćaja i infrastrukture između ostalog, izdaje građevinsku dozvolu za izgradnju postrojenja za tretman neopasnog otpada, spaljivanjem ili hemijskim postupcima, kapaciteta više od 70 t dnevno. Odredbama člana 134. istog Zakona propisano je da se poverava autonomnoj pokrajini izdavanje građevinskih dozvola za izgradnju objekata određenih u članu 133. ovog zakona koji se u celini grade na teritoriji autonomne pokrajine. Poverava se jedinicama lokalne samouprave izdavanje građevinskih dozvola za izgradnju objekata koji nisu određeni u članu 133. ovog Zakona. Imajući u vidu navedeno, a u skladu sa citiranim odredbama Zakona o planiranju i izgradnji, za izdavanje građevinske dozvole za izgradnju postrojenja za tretman neopasnog otpada, kapaciteta manjeg od 70 t dnevno, na teritoriji opštine Šabac, nadležna je jedinica lokalne samouprave na čijem području je planirana izgradnja navedenog objekta.	\N	\N	t
69	23RVAD7KUEOKMGR0	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li predmet ozakonjenja može biti objekat za koji iz objektivnih razloga nije moguće pribaviti saglasnost suvlasnika na zemljištu?	U slučaju kada je predmet ozakonjenja objekat izgrađen na građevinskom zemljištu na kome postoji pravo susvojine kao dokaz o odgovarajućem pravu dostavlja se pismena saglasnost svih suvlasnika. Shodno napred navedenom organ nadležan za poslove ozakonjenja će u slučaju kada je predmet ozakonjenja objekat izgrađen na građevinskom zemljištu, na kome postoji pravo susvojine, u svim postupcima ozakonjenja koji nisu pravnosnažno okončani do 5. juna 2020 godine, u fazi pribavljanja dokaza o odgovarajućem pravu na građevinskom zemljištu, vlasniku nezakonito izgrađenog objekata naložiti dostavljanje dokaza iz stava 6. člana 10. Zakona, a koji čini pismena saglasnost svih suvlasnika, bez obzira da li je već data overena izjava zainteresovanog lica da se suvlasnik koji je znao ili mogao znati za izgradnju objekta odnosno izvođenje radova koji su predmet ozakonjenja u vreme izgradnje tome nije protivio.	\N	\N	t
71	CE90WY8CWS4FILKG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li rešenje o ozakonjenju ima istu pravnu snagu kao i građevinska i upotrebna dozvola ili ne?	Zakonom nije propisana mogućnost pribavljanja upotrebne dozvole na osnovu rešenja o ozakonjenju objekata, već je osnov za upis prava svojine na objektu u javnu knjigu o evidenciji nepokretnosti i pravima na njima, upravo pravnosnažno rešenje o ozakonjenju. Na osnovu napred navedenog nesporno je da pravnosnažno rešenje o ozakonjenju predstavlja dokaz o „legalnom” objektu te da se tad na takvom objektu mogu izvoditi radovi u skladu sa odredbama Zakona o planiranju i izgradnji. Shodno navedenom, rešenje o ozakonjenju, predstavlja pravni osnov kao i upotrebna dozvola na osnovu kojih se dalje mogu ostvarivati prava i obaveze saglasno odredbama posebnih zakona.	\N	\N	t
72	QZY2LHR5SGG1YZ6R	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Кada su planirane izmene Zakona o ozakonjenju objekata („Službeni glasnik RS”, broj 96/15, 83/18, 81/20 - US, 1/23 – US), ili donošenje novog zakona u oblasti ozakonjenja kojim će biti omogućeno ozakonjenje nezakonito izgrađenih objekata izgrađenih posle 27. novembra 2015. godine?	U ovom trenutku nije sačinjen nacrt novog zakona kojim se reguliše oblast ozakonjenja nezakonito izgrađenih objekata niti izmene i dopune postojećeg zakona, a saglasno važećem Zakonu, svi objekti izgrađeni bez izdatog rešenja o građevinskoj dozvoli ili rešenja o odobrenju izvođenja radova posle 27. novembra 2015. godine nisu predmet ozakonjenja u skladu sa odredbama ovog zakona i nadležni građevinski inspektor za te objekte donosi rešenje o rušenju, koje je izvršno danom donošenja, u skladu sa Zakonom o planiranju i izgradnji.	\N	\N	t
73	RTJWPD9301XSVGPI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Кoji su uslovi za dobijanje velikih licenci, odnosno rešenja o ispunjenosti uslova za izradu tehničke dokumentacije i građenje objekata?	Uslov za dobijanje Rešenja o ispunjenosti uslova za izradu tehničke dokumentacije za objekte za koje građevinsku dozvolu izdaje ministarstvo, je da pravno lice ili preduzetnik imaju najmanje dva zaposlena, odnosno radno angažovana lica sa punim radnim vremenom, koja imaju odgovarajuće stručne rezultate (reference) da su bili odgovorni projektanti na vrsti objekata za koju se licenca traži, a uslov za dobijanje Rešenja o ispunjenosti uslova za građenje objekata za koje građevinsku dozvolu izdaje ministarstvo, je da pravno lice ili preduzetnik imaju najmanje dva zaposlena, odnosno radno angažovana lica sa punim radnim vremenom, koja imaju odgovarajuće stručne rezultate (reference) da su bili odgovorni izvođači radova na vrsti objekata za koje se traži licenca.	\N	\N	t
74	OBZGNYYTDTPHPRTK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	4	Da li lica koja poseduju licencu u stranoj državi mogu da obavljaju stručne poslove u svojstvu ovlašćenog lica u Republici Srbiji?	Zakonom o planiranju i izgradnji ("Sl. glasnik RS", br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/2013 - odluka US, 50/2013 - odluka US, 98/2013 - odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 - dr. zakon, 9/2020 i 52/2021) , odredbom člana 162a stav 1. propisano je da fizičko lice kome je izdata licenca ili drugo ovlašćenje, odnosno lice koje je upisano u odgovarajući registar nadležnog organa ili tela prema propisima druge države za obavljanje stručnih poslova koji odgovaraju stručnim poslovima utvrđenim ovim zakonom, ima pravo u Republici Srbiji na obavljanje tih stručnih poslova u svojstvu odgovornog lica pod uslovima reciprociteta i ukoliko ispunjava uslove utvrđene ovim zakonom, propisima donetim na osnovu ovog zakona i posebnim zakonom kojim se uređuje priznavanje stranih profesionalnih kvalifikacija. Takođe, strano ovlašćeno fizičko lice mora da ispunjava uslove utvrđene zakonom kojim se uređuje zapošljavanje i rad stranaca. Postupak utvrđivanja ispunjenosti uslova sprovodi ministarstvo nadležno za poslove planiranja i izgradnje u skladu sa ovim zakonom i propisima donetim na osnovu ovog zakona, posebnim zakonom kojim se uređuje priznavanje profesionalnih kvalifikacija i drugim posebnim propisima.	\N	\N	t
75	S9SG8PX4I3PCFERB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KO JE NADLEŽAN ZA POPRAVKU KOLOVOZA U ULICI ?	ZA POPRAVKU ULICA I OPŠTINSKIH PUTEVA NADLEŽNA JE JEDINICA LOKALNE SAMOUPRAVE.	\N	\N	t
76	ZNWWM93UDGTCYBYA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	NA DRŽAVNOM PUTU U NASELjU PRIMEĆENO JE DA NE RADI SEMAFOR. KO JE NADLEŽAN ZA NjEGOVU POPRAVKU?	ZA POPRAVKU SEMAFORA U NASELjU NA DRŽAVNOM PUTU NADLEŽNA JE JEDINICA LOKALNE SAMOUPRAVE	\N	\N	t
77	FNBW4OJUPX1R4BG7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	TRAŽI SE SANACIJA UDARNIH RUPA NA DRŽAVNOM PUTU	ZA ODRŽAVANjE DRŽAVNIH PUTEVA ( I PRIPADAJUĆE SAOBRAĆAJNE SIGNALIZACIJE) NADLEŽNO JE JAVNO PREDUZEĆE PUTEVI SRBIJE, BUL.KRALjA ALEKSANDRA 282, BEOGRAD	\N	\N	t
78	BQT5PDEGD4ZT0LUF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	TRAŽI SE IZGRADNjA TROTOARA NA DRŽAVNOM PUTU U NASELjU	ZA IZGRADNjU TROTOARA NA DRŽAVNOM ( KAO I NA OPŠTINSKOM) PUTU U NASELjU NADLEŽNA JE JEDINICA LOKALNE SAMOUPRAVE	\N	\N	t
79	Z1SHMDZYENUWMHFU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	TRAŽI SE FINANSIJSKA POMOĆ ZA POPRAVKU I ASFALTIRANjE LOKALNIH(OPŠTINSKIH) PUTEVA	FINANSIJSKA POMOĆ MOŽE SE DOBITI OD MINISTARSTVA PRIVREDE-SEKTOR ZA INVESTICIJE U INFRASTRUKTURU	\N	\N	t
80	OSCBCQKEPC2WCUUN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	TRAŽI SE ISPLATA EKSPROPRISANOG ZEMLjIŠTA ZA IZGRADNjU PUTA	UKOLIKO JE ZEMLjIŠTE EKSPROPRISANO ZA POTREBE IZGRADNjE DRŽAVNOG PUTA POTREBNO JE DA SE OBRATITE JP,,PUTEVI SRBIJE“ BUL.KRALjA ALEKSANDRA 282, BEOGRAD ILI NADLEŽNOJ OPŠTINI/GRADU UKOLIKO JE U PITANjU ULICA, OPŠTINSKI PUT ILI NEKATEGORISANI PUT.	\N	\N	t
81	WERTISXUWPPN0OPJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KO IZDAJE DOZVOLE ZA VANREDNI PREVOZ ?	DOZVOLE ZA VANREDNI PREVOZ NA DRŽAVNOM PUTU IZDAJE JAVNO PREDUZEĆE ,,PUTEVI SRBIJE“ , A NA OPŠTINSKIM PUTEVIMA I ULICAMA ORGAN ZA POSLOVE SAOBRAĆAJA U JEDINICI LOKALNE SAMOUPRAVE	\N	\N	t
82	NGNPU8IXANVX3VNM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	TRAŽI SE POSTAVLjANjE ,,LEŽEĆIH POLICAJACA“ U ZONI ŠKOLA NA DRŽAVNOM PUTU	ZAHTEV MINISTARSTVU PODNOSI JEDINICA LOKALNE SAMOUPRAVE SA IZRAĐENIM PROJEKTOM NA KOJI JE DATA SAGLASNOST JP,,PUTEVI SRBIJE“	\N	\N	t
83	9WAVKLSBA0WQIX5L	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	ŠTA JE POTREBNO ZA IZDAVANjE REŠENjA ZA POSTAVLjANjE SAOBRAĆAJNE SIGNALIZACIJE ZA VREME IZVOĐENjA RADOVA ( ili održavanja manifestacije) NA DRŽAVNOM PUTU?	PROJEKAT SAOBRAĆAJNE SIGNALIZACIJE SA IZVRŠENOM TEHNIČKOM KONTROLOM U 3 ( TRI) PRIMERKA, URAĐENO OD PREDUZEĆA SA LICENCOM P131S1, SAGLASNOST JP,,PUTEVI SRBIJE“ NA PROJEKAT, DOKAZ O ODOBRENIM RADOVIMA ZBOG KOJIH SE MENjA REŽIM SASAOBRAĆAJA, OBAVEŠTENjE O PERIODU IZVOĐENjA RADOVA,DOKAZ O UPLAĆENIM TAKSAMA NA RAČUN: BUDžET RS BROJ : 840-742221843-57, POZIV NA BROJ: 97 50-016, U SKLADU SA TARIFNIM BROJEM 1. I TARIFNIM BROJEM 147.ST.2 ZAKONA O REP.ADM.TAKSAMA	\N	\N	t
84	KDOMBU7MC44DDWXZ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	ŠTA JE POTREBNO ZA IZDAVANjE REŠENjA KOJIM SE PRODUŽAVA PERIOD VAŽENjA PRETHODNO IZDATOG REŠENjA ZA TEHNIČKO REGULISANjE SAOBRAĆAJA	ZAHTEV, OBAVEŠTENjE O PERIODU IZVOĐENjA RADOVA, DOKAZ O UPLAĆENIM TAKSAMA NA RAČUN: BUDžET RS BROJ : 840-742221843-57, POZIV NA BROJ: 97 50-016, U SKLADU SA TARIFNIM BROJEM 1. I 9. ZAKONA O REPUBLIČKIM ADMINISTRATIVNIM TAKSAMA	\N	\N	t
88	XAJLH4KDSUTIPMH5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Kada se utvrđuje pojedinačni plan raspodele?	Po prijemu zahteva, Ministarstvo građevinarstva, saobraćaja i infrastrukture utvrđuje predlog plan raspodele, prevoznici imaju rok od sedam dana da dostave primedbe na objavljeni predlog. Nakon razmatranja primedbi utvrđeni plan raspodele se objavljuje najkasnije do 25. decembra tekuće godine za narednu godinu.	\N	\N	t
89	NGHDHY28JMGLF14P	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Gde i kako mogu da se podnose zahtevi za zaduženje i razduženje dozvola za prevoz tereta?	Na šalteru Uprave za zajedničke poslove republičkih organa, adresa: Sremska 3-5, 11000 Beograd, Ministarstvo građevinarstva, saobraćaja i infrastrukture	\N	\N	t
90	MBKFPLVB7CYILNUN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li je dovoljno da se podnese zahtev za pojedinačni plan raspodele dozvola jednom godišnje?	Utvrđivanje pojedinačnog plana raspodele obuhvata i tri revizije tog plana koje ministarstvo vrši u toku kalendarske godine.	\N	\N	t
91	PTVCLDZ2KN7PUXEO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li postoje rokovi za razduženje pojedinačnih dozvola?	Postoje rokovi za razduženje propisani Opštim delom plana raspodele i počinju da teku danom preuzimanja pojedinačne dozvole.	\N	\N	t
92	AKVMYQAUZ8WEVMIC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li prevoznik koji nije predao zahtevi za pojedinačni plan raspodele dozvola, ako je počeo obavljanje delatnosti prevoza tereta nakon tog roka, može da podnese zahtev za reviziju pojedinačnog plana?	Da. Zahtev za reviziju pojedinačnog plana podnosi se za preostali period do kraja godine i podnosi ga prevoznik koji nije podneo zahtev za utvrđivanje plana raspodele.	\N	\N	t
93	NWGKMHMRGCORBJF7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Koliko ima revizija i kada se podnose zahtevi?	Postoje tri revizije pojedinačnog plana u toku godine: aprilska, julska i oktobarska. -zahtevi za aprilsku reviziju podnose se do 10. marta tekuće godine, - zahtevi za julsku reviziju podnose se do 10. juna tekuće godine, - zahtevi za oktobarsku reviziju podnose se do 10. septembra tekuće godine,	\N	\N	t
94	EXOKQGBG8U7Y0SOM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li prevoznici mogu da podnose zahteve za dobijanje pojedinačnih dozvola tokom godine a da nisu podneli zahteve za utvrđivanje pojedinačnog plana raspodele i nemaju dozvole u planu?	Mogu da podnose vanredne zahteve svake nedelje do 30. novembra tekuće godine. Komisija ministarstva jednom nedeljno odlučuje o zahtevima iz fonda 3% u skladu sa propisanim pravilnikom.	\N	\N	t
95	AJEEIG0NXWDVNEYV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Koji je uslov za obavljanje javnog prevoza putnika u drumskom saobraćaju?	Potrebno je posedovati licencu za obavljanje javnog prevoza putnika u drumskom saobraćaju za odgovarajuću vrstu prevoza (međunarodni, domaći, linijski i vanslinijski)	\N	\N	t
96	5BVLMVWFJHNSWSB2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Koji je uslov za obavljanje javnog prevoza tereta u drumskom saobraćaju?	Potrebno je posedovati licencu za obavljanje javnog prevoza tereta u drumskom saobraćaju (međunarodni, domaći)	\N	\N	t
97	FMK9UNLBXCSQ4IKQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Ko može da bude odgovorno lice kod domaćeg prevoznika?	Odgovorno lice kod domaćeg prevoznika može biti lice koje poseduje sertifikat o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza (prevoz putnika ili prevoz tereta)	\N	\N	t
98	RFE69CIDN92IVEON	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Gde je moguće pronaći uputstvo i zahtev za izdavanje licence za prevoz?	Uputstvo i zahtev za izdavanje licence za prevoz moguće je pronaći na internet prezentaciji MGSI.	\N	\N	t
99	F7XOZCYGNSJ4WK71	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Gde je moguće pronaći uputstvo i zahtev za izdavanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?	Uputstvo i zahtev za izdavanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza moguće je pronaći na internet prezentaciji MGSI.	\N	\N	t
100	3SAQ1L5IZ3CI8VUD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li je potrebno posedovati izvod licence za prevoz za svako vozilo iz voznog parka prevoznika?	Potrebno je posedovati izvod licence za prevoz za svako motorno vozilo iz voznog parka prevoznika.	\N	\N	t
101	CRZAYUTWZTX2OST1	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Do koje najveće dozvoljene mase vozila nije potreban izvod licence za prevoz?	Za sva teretna motorna vozila iznad 3,5 tone najveće dozvoljene nosivosti je potrebno posedovati izvod licence za prevoz.	\N	\N	t
102	85SCHQXT5WHEGZKU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Ko vrši numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?	MGSI vrši numeraciju sertifikata za teretna vozila nacionalnim brojem i produženje važnosti ovih sertifikata.	\N	\N	t
103	1XPU1HEVQEIX9XWF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Gde je moguće pronaći uputstvo i zahtev za numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?	Uputstvo i zahtev numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi) moguće je pronaći na internet prezentaciji MGSI.	\N	\N	t
104	RACFUAS0PQBTLDGS	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Ko sprovodi ispit za sticanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?	Ispit za sticanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza sprovodi MGSI.	\N	\N	t
105	L5UHNTAWUTZFZ0KC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Ko radi registraciju i overu redova vožnje za međumesni linijski prevoz putnika?	Registraciju i overu redova vožnje za međumesni linijski prevoz putnika vrši MGSI.	\N	\N	t
106	FMOEQCNPBUKFLGH3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	U kom periodu se podnosi zahtev za registraciju i overu redova vožnje za međumesni linijski prevoz putnika?	Zahtev za registraciju i overu redova vožnje za međumesni linijski prevoz putnika podnosi se od 15-30. maja tekuće godine.	\N	\N	t
107	SIH7Z45QN1ZQEXPB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	U kom periodu se preuzimaju registrovani redovi vožnje za međumesni linijski prevoz putnika?	Registrovani redovi vožnje za međumesni linijski prevoz putnika preuzimaju se od 10-20. jula tekuće godine.	\N	\N	t
108	SBWUBQ9KP4GZVCI3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Od kada počinju da važe registrovani redovi vožnje za međumesni linijski prevoz putnika?	Registrovani redovi vožnje za međumesni linijski prevoz putnika počinju da važe od 01. oktobra tekuće godine sa rokom važenja od pet godina.	\N	\N	t
109	C75RVTKEQYGT0QSE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li je red vožnje za međumesni linijski prevoz putnika moguće preneti na drugog prevoznika ili voziti u kooperaciji?	Red vožnje za međumesni linijski prevoz putnika nije moguće preneti na drugog prevoznika ili voziti u kooperaciji.	\N	\N	t
110	Q7IXEAYZ8CMCYVJB	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Da li je potrebno posedovati posebnu dozvolu za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju?	Za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju nije potrebno posedovati posebnu dozvolu već je neophodno posedovati knjigu putnih listova za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju kju izdaje MGSI.	\N	\N	t
111	GMEHO1GCKFF8AEI7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Ko izdaje međunarodne dozvole za linijski prevoz putnika?	Međunarodne dozvole za linijski prevoz putnika izdaje MGSI uz prethodno odobren odgovarajući međunarodni red vožnje.	\N	\N	t
112	QPANHWDDFWSX7K1R	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Ko izdaje licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?	Licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije izdaje MGSI na osnovu prethodno ispunjenih zakonskih uslova.	\N	\N	t
113	M7OESBMC1U2DXORT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Kada se podnosi zahtev za produženje roka važenja licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?	Zahtev za produženje roka važenja licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije podnosi se najkasnije 90 dana pre isteka roka važenja važeće licence.	\N	\N	t
114	BL5W8DCKFOW8AIWT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	Kada se podnosi zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika?	Zahtev za zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika podnosi se najkasnije četiri meseca, odnosno tri meseca za susedne države pre isteka roka važenja važeće dozvole.	\N	\N	t
115	ITUE4KTBK6KZHOOL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KOJI SU DRŽAVNI, A KOJI OPŠTINSKI PUTEVI U REPUBLICI SRBIJI?	SPISAK DRŽAVNIH PUTEVA NALAZI SE U UREDBI O KATEGORIZACIJI DRŽAVNIH PUTEVA ( ,,SL.GL.RS“105/13 119/13 I 93/15). AKT O KATEGORIZACIJI OPŠTINSKIH PUTEVA I ULICA DONOSI SVAKA JEDINICA LOKALNE SAMOUPRAVE ZA PUTEVE NA SVOJOJ TERITORIJI	\N	\N	t
116	PFMQACFIUI0PVIYT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KO JE NADLEŽAN ZA POPRAVKU TROTOARA I BICIKLISTIČKIH STAZA UZ DRŽAVNI PUT U NASELjU?	ZA POPRAVKU DODATNIH ELEMENATA PUTA ZA POTREBE NASELjA ( KAO ŠTO SU PEŠAČKE I BICIKLISTIČKE STAZE, TROTOARI, AUT.STAJALIŠTA) NADLEŽNA JE JEDINICA LOKALNE SAMOUPRAVE	\N	\N	t
117	KOVXCWBRPWJCRQ3K	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	ŠTA SU NEKATEGORISANI PUTEVI I KO JE NADLEŽAN ZA NjIHOVO ODRŽAVANjE?	TO JE PUT KOJI JE NADLEŽNI ORGAN PROGLASIO NEKATEGORISANIM ( OPŠTINA ILI GRAD) I KAO TAKAV JE UPISAN U JAVNE EVIDENCIJE O NEPOKRETNOSTIMA. GRAD MOŽE POVERITI UPRAVLjANjE NEKATEGORISANIM PUTEVIMA GRADSKOJ OPŠTINI.	\N	\N	t
118	EDDL1W9NBA2A4EP5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KOJI ZAKONI REGULIŠU OBLAST PUTNE INFRASTRUKTURE?	ZAKON O PUTEVIMA, ZAKON O BEZBEDNOSTI SAOBRAĆAJA NA PUTEVIMA I ZAKON O PLANIRANjU I IZGRADNjI	\N	\N	t
119	PBCKR2NVVTKIIY9R	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KO JE NADLEŽAN ZA ODRŽAVANjE SISTEMA ZA ODVODNjAVANjE DRŽAVNOG PUTA U NASELjU?	UPRAVLjAČ DRŽAVNOG PUTA-JP,,PUTEVI SRBIJE“ NADLEŽNO JE ZA ODRŽAVANjE SISTEMA ZA OVODNjAVANjE PUTA U NASELjU UKOLIKO TAJ SISTEM NIJE DEO MESNE KANALIZACIONE MREŽE ( U TOM SLUČAJU NADLEŽNA JE JEDINICA LOKALNE SAMOUPRAVE)	\N	\N	t
120	IXCHVTVDZYGTLGAL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI AUTOPUT MORA DA IMA ZAUSTAVNU TRAKU?	AUTOPUT MORA DA IMA ZAUSTAVNU TRAKU, OSIM NA MOSTOVIMA I U TUNELIMA( GDE SE U DUŽIM TUNELIMA NA ODREĐENOM RASTOJANjU IZVODE ZAUSTAVNE POVRŠINE)	\N	\N	t
121	ISUELHAQI9EMA0TI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI PREVOZNIK MORA DA LIČNO PREUZME ILI RAZDUŽI DOZVOLE, LICENCE ZA PREVOZ; SERTIFIKAT ZA LICE ODGOVORNO ZA PREVOZ ILI DRUGU DOZVOLU ZA PREVOZ PUTNIKA?	ZAHTEVE ZA PREUZIMANjE SVIH DOKUMENATA IZ NADLEŽNOSTI MGSI I RAZDUŽENjE MOGU DA PODNOSE OVLAŠĆENA LICA OD STRANE DOMAĆEG PREVOZNIKA.	\N	\N	t
122	WQV9P0PJH7DID6XF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI PROBIJANjEM ROKA ZA VRAĆANjE/RAZDUŽENjE DOZVOLA PREVOZNIK TRPI NEKE SANKCIJE?	ROKOVI ZA RAZDUŽENjE DOZVOLA, U ZAVISNOSTI OD KONTIGENTA POSTOJE PROPISANI OPŠTIM DELOM PLANA RASPODELE KOJI SE NALAZI NA INTERNET PREZENTACIJI MINISTARSTVA GRAĐEVINARSTVA, SAOBRAĆAJA I INFRASTRUKTURE. NAKON ISTEKA PROPISANOG ROKA PREVOZNIK NE MOŽE DA PREUZME NI JEDNU POJEDINAČNU DOZVOLU DO TRENUTKA RAZDUŽENjA PREDMETNE DOZVOLE.	\N	\N	t
123	DMQYOVAYVT9ZJBZ2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI SE RAZDUŽUJE JOŠ NEŠTO OSIM DOZVOLA ZA PREVOZ PUTNIKA I TERETA?	RAZDUŽUJU SE LISTOVI IZ DNEVNIKA PUTOVANjA O OBAVLjENIM VOŽNjAMA ZA GODIŠNjE I CEMT DOZVOLE. JEDNOM MESEČNO ZA PRETHODNI MESEC.	\N	\N	t
124	5ZPXSN4TABCQMYXM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KOJI ZAKON REGULIŠE OBLAST DRUMSKOG PREVOZA TERETA?	ZAKON O PREVOZU TERETA U DRUMSKOM SAOBRAĆAJU	\N	\N	t
125	FDQEOCFX2I678IFV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KOJI ZAKON REGULIŠE OBLAST DRUMSKOG PREVOZA PUTNIKA?	ZAKON O PREVOZU PUTNIKA U DRUMSKOM SAOBRAĆAJU	\N	\N	t
126	ZXQPJF7VBZ4B7JFW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	ŠTA SE DEŠAVA AKO SE DOZVOLA IZGUBI?	PODNOSI SE MINISTARSTVU PRIJAVA O IZGUBLjENOJ DOZVOLI, NA OSNOVU ČEGA SE UMANjUJE BROJ DOZVOLA NA RASPOLAGANjU U TEKUĆOJ GODINI I U NAREDNOJ GODINI; ILI SE PLAĆA KAZNA PROPISANA UREDBOM O RASPODELI STRANIH DOZVOLA ZA MEĐUNARODNI PREVOZ TERETA	\N	\N	t
127	GN0TBYMYZHL81YPO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KOJE SE TAKSE PLAĆAJU?	SVE INFORMACIJE O ZAHTEVIMA I IZNOSIMA TAKSI MOŽETE PRONAĆI NA INTERNET PREZENTACIJI MINISTARSTVA GRAĐEVINARSTVA, SAOBRAĆAJA I INFRASTRUKTURE	\N	\N	t
128	DZOBE54DIDMNCRTI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	NA OSNOVU ČEGA SE OBAVLjA MEĐUNARODNI PREVOZ PUTNIKA I TERETA SA DRUGOM DRŽAVOM?	MEĐUNARODNI PREVOZ PUTNIKA I TERETA SA DRUGOM DRŽAVOM OBAVLjA SE NA OSNOVU MEĐUNARODNIH BILATERALNIH ILI MULTILATERALNIH SPORAZUMA	\N	\N	t
129	KOGRRYPIWKVCQ6I3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	KO RAZMENjUJE MEĐUNARODNE DOZVOLE ZA PREVOZ TERETA SA DRUGIM DRŽAVAMA?	MEĐUNARODNE DOZVOLE ZA PREVOZ TERETA SA DRUGIM DRŽAVAMA RAZMENjUJE MGSI NA OSNOVU PRETHODNO DOGOVORENIH GODIŠNjIH KVOTA SA DRUGOM DRŽAVOM	\N	\N	t
130	ZOWCVDOUUZNN1OTN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	ŠTA JE TO CEMT DOZVOLA?	CEMT DOZVOLA JE MEĐUNARODNA MULTILATERALNA DOZVOLA KOJA OMOGUĆAVA DOMAĆEM PREVOZNIKU PREVOZ NEOGRANIČENOG BROJA PREVOZA TERETA U PERIODU OD GODINU DANA.	\N	\N	t
131	O8QQTFOPK3HHMMYY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI JE MOGUĆE OBAVLjATI MEĐUNARODNI PREVOZ PUTNIKA SA LINIJSKOM DOZVOLOM ZAJEDNO SA PODVOZAROM?	MOGUĆE JE OBAVLjATI MEĐUNARODNI PREVOZ PUTNIKA SA LINIJSKOM DOZVOLOM ZAJEDNO SA PODVOZAROM UKOLIKO JE ISTOM ODOBRENO OBAVLjANjE PREVOZA I DA JE UPISAN U DOZVOLU.	\N	\N	t
132	HWGREH9IMYDOVDXC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	ŠTA JE TO INTERBUS SPORAZUM?	INTERBUS SPORAZUM JE MEĐUNARODNI MULTILATERALNI SPORAZUM KOJI UREĐUJE MEĐUNARODNI VANLINIJSKI PREVOZ PUTNIKA	\N	\N	t
133	5QUFQWCVKKWJ9P2E	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	UKOLIKO SE OBAVLjA PREVOZ PO OSNOVU INTERBUS SPORAZUMA DA LI JE POTREBNA POSEBNA VANLINIJSKA DOZVOLA?	UKOLIKO SE PREVOZ OBAVLjA PO OSNOVU INTERBUS SPORAZUMA GDE NIJE POTREBNA POSEBNA DOZVOLA, ZA TAKAV PREVOZ POTREBNO JE POSEDOVATI SAMO INTERBUS PUTNI LIST U AUTOBUSU PREVOZNIKA KOJI OBAVLjA PREVOZ.	\N	\N	t
134	D0OGJXZZMQHYRIAD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI POSTOJE SEZONSKE LINIJE ZA OBAVLjANjE MEĐUNARODNOG PREVOZA PUTNIKA?	SEZONSKE LINIJE ZA OBAVLjANjE MEĐUNARODNOG PREVOZA PUTNIKA POSTOJE I IZDAJU SE PO OSNOVU DOGOVORA DVE DRŽAVE IZMEĐU KOJIH SE OBAVLjA OVAJ PREVOZ UZ PRETHODNO USAGLAŠEN I ODOBREN MEĐUNARODNI RED VOŽNjE.	\N	\N	t
135	JZBQZKRA016PUHB2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DA LI JE DOZVOLjENO OBAVLjANjE TAKSI PREVOZA NA TERITORIJI JEDINICE DRUGE LOKALNE SAMOUPRAVE?	OBAVLjANjE TAKSI PREVOZA NA TERITORIJI JEDINICE DRUGE LOKALNE SAMOUPRAVE JE DOZVOLjENO SAMO RADI DOVOŽENjA PUTNIKA IZ JEDINICE LOKALNE SAMOUPRAVE GDE JE TAKSI PREVOZNIK REGISTROVAN.	\N	\N	t
136	BT5WIRS7M1LFDQ0L	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	5	DO KADA DRŽAVA DAJE SUBVENCIJE ZA TAKSI PREVOZNIKE?	SUBVENCIJE ZA TAKSI PREVOZNIKE SE DODELjUJU PO OSNOVU DOSTAVLjENIH ZAHTEVA ZA DOBIJANjE SUBVENCIJE ZAKLjUČNO SA 31.12.2022. GODINE.	\N	\N	t
137	XWEIKD3O0RHPEXBE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Da li se i kada planira ponovno uspostavljanje železničkih linija koje su ukinute u proteklom periodu?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Srbija Voz“ a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor (svaka železnička linija ima drugačiji razlog, a samim tim i odgovor).	\N	\N	t
138	4VQQ9FUPAAV2QUAO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Razlozi nesaobraćanja vozova u određenim danima?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Srbija Voz“ a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor (shodno potpuno različitim deonicama i kategorijama vozova odgovori se dostavljaju u skladu sa istim).	\N	\N	t
139	1S6MBFIBK6MFLCPL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa nadležnim organom dostavlja informacije koje stranka/firma traže (svaki zahtev je potpuno različit i uvek se odnosi na različite parcele).	\N	\N	t
140	HPR9RQO1BS3SURYF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (SOKO)?	Ministarstvo građevinarstva, saobraćaja i infrastrukture dostavlja informacije o saobraćanju voza „Soko“ i stanicama na kojima se zaustavlja. Stanice na kojima se „Soko“ zaustavlja su: Beograd Centar, Novi Beograd i Novi Sad.	\N	\N	t
141	RH94TED3YJVWJKWR	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (RegioEkspres)?	Ministarstvo građevinarstva, saobraćaja i infrastrukture dostavlja informacije o saobraćanju RegioEkspres vozova i stanicama na kojima se zaustavlja. Stanice na kojima se Regio Ekspres zaustavlja su: Beograd Centar, Novi Beograd, Batajnica, Nova Pazova, Stara Pazova, Inđija, Beška, Sremski Karlovci i Novi Sad.	\N	\N	t
142	N6RZAQO90F592VZ4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (Regio vozovi)?	Ministarstvo građevinarstva, saobraćaja i infrastrukture dostavlja informacije o saobraćanju RegioEkspres vozova i stanicama na kojima se zaustavlja. Stanice na kojima se Regio Ekspres zaustavlja su: Beograd Centar, Novi Beograd, Tošin Bunar, Zemun, Zemunsko Polje, Batajnica, Nova Pazova, Stara Pazova, Inđija, Beška, Sremski Karlovci, Petrovaradin i Novi Sad.	\N	\N	t
143	1O1SLBAAZYXQ6WI5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Regulisanje železničkog saobraćaja na putnim prelazima?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Infrastruktura železnice Srbije“ a.d. proverava koji su razlozi ovog problema i molba i u skladu sa tim dostavlja odgovor (svaka predstavka se odnosi na drugačiji putni prelaz i samim tim odgovori nisu generisani).	\N	\N	t
144	RYEZUFQ7ZEUXFHMD	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Poteškoće kupovine karata za putovanje vozom preko aplikacije i sajta preduzeća „Srbija Voz“ a.d?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Srbija Voz“ a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor (uglavnom problemi su: pad sistema, neposedovanje platnih kartica, slabo poznavanje korišćenja noovih aplikacija na pametnim telefonima, itd.).	\N	\N	t
145	2KTKUSWNTROYYUJV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za projekte koji su trenutno u realizaciji?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Infrastruktura železnice Srbije“ a.d. dostavljamo odgovor (pitanja se odnose na različite projekte, kao i na različite segmente projekata, a samim tim odgovori nisu generisani).	\N	\N	t
146	FVJJV9JFPV9S480C	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Infrastruktura železnice Srbije“ a.d. dostavljamo odgovor (pitanja se odnose na različite projekte i to najčešće u vezi početka realizacije projekata).	\N	\N	t
147	I9IMGFMXUMIQIIZF	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Da li se u tekućoj godini planira raspisivanje konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?	Sve informacije o javnom pozivu za učešće u konkursu za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta se mogu naći na zvaničnom sajtu Ministarstva građevinarstva, saobraćaja i infrastrukture.	\N	\N	t
148	MBPJSDURSWPWEFBJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Koji privredni subjekti mogu konkurisati za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?	Privredni subjekti koji konkurišu za dodelu stimulativnih sredstava moraju da imaju šifru delatnosti koja se dodeljuje privrednim subjektima preko koga se realizuje kombinovani transport u skladu sa članom 104. Zakona o železnici („Službeni Glasnik RS“, broj 41/18), odnosno to mogu biti:\n- Vlasnici i upravljači terminala za kombinovani transport;\n- Operateri za železnički i drumski transport;\n- Operateri kombinovanog transporta;\n- Upravljači železničke infrastrukture i špedicije.	\N	\N	t
149	1RAA3JJAIYDHYDCW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Koji je maksimalan iznos koji može biti dodeljen jednom privrednom društvu koje ispunjava uslove u skladu sa konkursom za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?	Maksimalan iznos koji može biti dodeljen jednom privrednom društvu u okviru konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta iznosi 20.000.000,00 dinara.	\N	\N	t
150	OPQXTQILZYW8V9TI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Kada je planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila?	Planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila se očekuje tokom juna tekuće godine, a detaljne informacije se mogu pronaći na zvaničnom sajtu „Srbija Voz“ a.d.	\N	\N	t
151	HNNPZXWCVLFP2AB7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Cena vozne karte i prevoz automobila na relaciji Zemun – Bar?	Cena vozne karte za jedan smer po osobi iznosi 21.00€. Cena prevoza praćenog automobila/motocikla/skutera od Zemuna do Bara iznosi 30 €. Obavezan uslov za prevoz automobila je da isti budu visine do 1,55 m.	\N	\N	t
152	JIKJFBBXO2ZJKS4H	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Da li se u narednom periodu planira ponovno uspostavljanje železničkih linija koje su ukinute?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Srbija Voz“ a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor (svaka železnička linija ima drugačiji razlog, a samim tim i odgovor).	\N	\N	t
153	NAJMBSN86SKVPVBK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa nadležnim organom dostavlja informacije koje stranka/firma traže (svaki zahtev je potpuno različit i uvek se odnosi na različite parcele).	\N	\N	t
154	UIV6HKTAYWTNB1BC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Regulisanje železničkog saobraćaja na putnim prelazima?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Infrastruktura železnice Srbije“ a.d. proverava koji su razlozi ovog problema i molba i u skladu sa tim dostavlja odgovor (svaka predstavka se odnosi na drugačiji putni prelaz i samim tim odgovori nisu generisani).	\N	\N	t
155	RFES6GIF6CSXUGO4	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za projekte koji su trenutno u realizaciji?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Infrastruktura železnice Srbije“ a.d. dostavlja odgovor (pitanja se odnose na različite projekte, kao i na različite segmente projekata, a samim tim odgovori nisu generisani)	\N	\N	t
156	T6XEO5SSUZRZ98LL	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	6	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem „Infrastruktura železnice Srbije“ a.d. dostavlja odgovor (pitanja se odnose na različite projekte i to najčešće u vezi početka realizacije projekata)	\N	\N	t
157	HLRWSDEIZPEPUYKT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Zašto građevinska inspekcija neće da izvrši rešenje kojim se nalaže uklanjanje bespravno izgrađenog objekta ili dela objekta?	Građevinska inspekcija neizvršava rešenja koja je doneo građevinski inspektor. Navedena rešenja izvršava ministarstvo,autonomna pokrajina ( AP )  ili jedinica lokalne samouprave ( JLS )  u čijem se sastavu nalazi građevinska inspekcija. Izvršenje rešenja je izvorna nadležnost autonomne pokrajine ( AP ) ili jedinice lokalne samouprave ( JLS ) i ne spada u poverene poslove.	\N	\N	t
158	OLN9PZBS3YIECXA1	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Zašto građevinska inspekcija ne donosi rešenje o izvršenju za bespravno izvedene radove, za koje ima saznanje da je započet postupak legalizacije/ozakonjenja objekta ili dela objekta?	Troškove izvršenja, kao i sudske troškove, snosio bi organ uprave, a ne vlasnik nelegalno izgrađenog objekta, ukoliko bi se objekat uklonio pre pravnosnažno okončanog postupka ozakonjenja, u slučajevima kada bi se odobrilo ozakonjenje predmetnog objekta. Postupak legalizacije/ozakonjenja nije izvestan zbog moguće izmene planskog dokumenta, a sve do pravnosnažno okončanog postupka ozakonjenja.	\N	\N	t
159	CCBWVAD9QNPNZUCW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Zašto se objekat (zgrada), za koji je izdata građevinska dozvola, gradi blizu objekta na susednoj parceli ili na granici parcele?	Postupak izdavanja građevinske dozvole nije u nadležnosti građevinske inspekcije.	\N	\N	t
160	AIWQ1HOPJ3YPN87F	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Zašto građevinski inspektor ne proverava upis ili promenu prava nosioca prava na katastarskim parcelama ili objektu u skladu sa zakonom?	Sva pitanja vezana za upis ili promenu prava na katastarskim parcelama ili objektu vrši Republički geodetski zavod – Sektor za nadzor i kontrolu. Kontakt – adresa: Bulevar vojvode Mišića br. 39, Beograd, e-posta: @email1@, tel: @phone1@	[{"link": "mailto:sun@rgz.gov.rz", "type": "email", "title": "sun@rgz.gov.rz", "placeholder": "@email1@"}, {"link": "tel:381117152603", "type": "phone", "title": "011/715-26-03", "placeholder": "@phone1@"}]	\N	t
161	NH4ZO6KCT0XAP0IQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Prijave vezane za odvodnjavanje površinskih voda (zatrpavanje putnih kanala i/ili propusta, ili za nerešeno odvodnjavanje od puta do recipijenta.	Vrši se inspekcijski nadzor, odgovor zavisi od utvrđenog činjeničnog stanja. Odgovor za zatrpavanje putnih kanala i/ili propusta: Na osnovu Vaše predstavke je izvršen inspekcijski nadzor. Upravljaču puta (ili Licu koje je izvršilo zatrpavanje) je dat nalog za čišćenje zatrpanog putnog kanala/propusta. Odgovor za nerešeno odvodnjavanje od puta do recipijenta: Na osnovu člana 46. Zakona o putevima, sused javnog puta dužan je da omogući slobodno oticanje vode, postavljanje snegobrana i odlaganje snega sa javnog puta na njegovo zemljište uz naknadu, koja ne može biti niža od tržišne, zbog ograničenja prava imovine na zemljištu, odnosno naknadu prouzrokovane štete. Potrebno je da se obratite JP Putevi Srbije, kao upravljaču puta, sa ciljem uređenja međusobnih odnosa u skladu sa navedenim članom Zakona, ili nadležnom pravosudnom organu.	\N	\N	t
162	PSHVCIRKF6IZGXU3	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Priključci na državni put. Zahtevi se uglavnom odnose na izgradnju priključka na državni put od strane suseda puta ili su u pitanju zahtevi za održavanje ili prilagođavanje postojećih priključaka na državni put, obično nakon izvedenih radova na rehabilitaciji puta.	Odgovor za izgradnju: Izgradnja priključka na državni put je uređena Zakonom o planiranju i izgradnji. Za potrebe dobijanja građevinske dozvole potrebno je izraditi projektno-tehničku dokumentaciju od strane ovlašćene organizacije, i pribaviti uslove i rešenje od strane JP Putevi Srbije kao upravljača državnog puta, na osnovu člana 41. Zakona o putevima. Odgovor za prilagođavanje priključka po završenim radovima na državnom putu: Uobičajena praksa je da se nakon završetka radova na kolovozu puta pristupi prilagođavanju priključaka na put. Ukoliko Vam je ograničena mogućnost pristupa Vašoj imovini, možete se obratiti izvođaču radova, nadzornom organu JP Putevi Srbije ili nadležnom pravosudnom organu.	\N	\N	t
163	WED5D4OD0R1PN1JW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Pritužba na rad i postupanje profesionalnog upravnika stambene zajednice.	Sve pritužbe su dostavljene nadležnoj inspekciji jedinice lokalne samouprave na dalje postupanje	\N	\N	t
164	KVHRVXP7B6BY0WRG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Prevoznik nije održao polazak na liniji i nismo mogli da otputujemo na odredište. Kome da prijavim neodržavanje polaska i nadoknadim štetu?	Prijavu možete u pisanom ili elektronskom obliku podneti republičkoj inspekciji za drumski saobraćaj ako se radi o međumesnom linijskom prevozu putnika ili nadležnoj lokalnoj inspekciji ako je u pitanju gradsko prigradski prevoz.	\N	\N	t
165	XC96EF6VOPXQL6PK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Imao sam problem sa taksi prevozom. Da li mogu da vam uputim prijavu?	Taksi prevoz je u nadležnosti lokalne samouprave na čijoj se teritoriji odvija prevoz i prijavu možete uputiti nadležnoj lokalnoj inspekciji.	\N	\N	t
166	V4JFKSKINN6ATLTA	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Gde se mogu postavljati plutajući objekti i privezišta za čamce?	Na mestima i pod uslovima koje je odredila nadležna lokalna samouprava  Planom postavljanja i Odlukom za korišćenje obale i vodnog prostora.	\N	\N	t
167	XT9J115RP5CHP2A5	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Kako građevinska inspekcija odlučuje o prioritetima u pokretanju inspekcijskog nadzora iz svoje nadležnosti?	Građevinski inspektor pokreće postupak inspekcijskog nadzora (ceneći podnesak građana kao inicijativu za pokretanje postupka), prvo na objektima na kojima se trenutno izvode građevinski radovi, a zatim i na objektima na kojima je završeno izvođenje građevinskih radova. Ukoliko građevinski inspektor, po prijemu podneska, proceni da je u pitanju neznatan rizik, ne pokreće inspekcijski nadzor.	\N	\N	t
168	3GOIJAK7SN1RZVLC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Kako postupa građevinski inspektor kada na objektu nastanu oštećenja, nastala usled izgradnje objekta na susednoj parceli?	Građevinski inspektor preduzima mere u skladu sa ovlašćenjima, ali NE VRŠI procenu štete oštećenog objekta.	\N	\N	t
169	OVUZ2TYQI0KI6NDQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Trotoari duž državnog puta. Zahtevi se odnose na izgradnju novih ili održavanje postojećih trotoara duž državnog puta, uglavnom u zonama škola ili autobuskih stajališta.	Odgovor za izgradnju: Obzirom da se radi o elementu puta koji se gradi za potrebe naselja, potrebno je da se obratite jedinici lokalne samouprave koja je dužna da trotoar izgradi u svemu prema članu 84. Zakona o putevima. Odgovor za održavanje: Obzirom da se radi o elementu puta koji je izgrađen za potrebe naselja, potrebno je da se obratite jedinici lokalne samouprave koja je dužna da trotoar održava, prema članu 72. Zakona o putevima	\N	\N	t
170	TZH1EXPOD9A6ZVW7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Zahtevi za postavljanje saobraćajne signalizacije i opreme. Zahtevi se uglavnom odnose na postavljanje znakova za ograničenje brzine, obnovu oštećenenih znakova ili postavljanje saobraćajnih ogledala.	Vrši se inspekcijski nadzor, odgovor zavisi od utvrđenog činjeničnog stanja. Pozitivan odgovor: Na osnovu Vaše predstavke je izvršen inspekcijski nadzor. Utvrđeno je da je bezbednost saobraćaja ugrožena i upravljaču puta dat nalog za dopunu/obnovu/postavljanje dodatne saobraćajne signalizacije i putne opreme, kao i nalog za izmenu projekta saobraćajne signalizacije na predmetnoj deonici puta(po potrebi). Negativan odgovor: Na osnovu Vaše predstavke je izvršen inspekcijski nadzor. Izvršena je kontrola projektne dokumentacije i postavljene signalizacije i opreme na terenu. Nisu utvrđeni nedostaci. Bezbednost saobraćaja nije ugrožena. Nema osnova za dalje postupanje.	\N	\N	t
171	CLO3HIPFLHNWXYLV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Koja dokumenta mora imati upravljač čamca u plovidbi?	Važeću plovidbenu dozvolu i dozvolu za upravljanje čamcem.	\N	\N	t
172	GIKQCXGHWKMV5EMN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Da li se čamac može registrovati u lučkoj kapetaniji prema mestu držanja čamca?	Ne, čamac se registruje u mesno nadležnoj lučkoj kapetaniji po mestu prebivališta vlasnika čamca.	\N	\N	t
173	SSOZVPYCVD4HTF0G	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Pritužbe na izlivanje otpadnih voda u kanale naseljenih mesta.	Pristigle pritužbe biće dostavljene nadležnoj inspekcijijedinice lokalne samouprave na dalje postupanje.	\N	\N	t
174	DE3RTTZWMK5RXUSI	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Da li mogu da vršim javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?	Može samo u obliku limo servisa definisanim članovima 137a. – 137d. Zakona o prevozu putnika u drumskom saobraćaju.	\N	\N	t
175	6FD64BIBI9WBBRBN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Da li naša inspekcija izdaje rešenje za obavljanje limo servisa i koje uslove treba da ispuni privredno društvo ili preduzetnik?	Rešenje za obavljanje limo servisa izdaje jedinica lokalne samouprave na kojoj se nalazi sedište pravnog lica ili preduzetnika, a uslovi su propisani članovima 137a. – 137d. Zakona o prevozu putnika u drumskom saobraćaju.	\N	\N	t
176	PPUQVYXFPJLY9KBN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	7	Da li je prevoznik u obavezi da mi izda voznu kartu?	Prevoznik je u obavezi da putniku izda voznu kartu sa svim podacima propisanim Zakonom.	\N	\N	t
177	VUJOIXIYU8AOHGJQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Kako da se ostvari uvid u planski dokument?	Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona, uredjen je nacin i postupak ostvarivanja javnog uvida u planski dokument. Uvid u planski dokument se ostvaruje u toku izrade planskog dokumenta u toku ranog javnog uvida koji traje 15 dana, kao i u toku javnog uvida koji traje 30 dana. Rani javni uvid organizuje nosilac izrade planskog dokumenta i obavlja se elektronski na zvanicnoj internet stranici nosioca izrade planskog dokumenta. Javni uvid se odvija u sedistu nosioca izrade planskog dokumenta, kao i na teritoriji obuhvata planskog dokumenta u trajanju od 30 dana. Za prostorne planove se u toku javnog uvida organizuje prezentacija, dok je zakonodavac za urbanisticke planove ostavio mogucnost organizacije prezentacije, odnosno prezentacija u toku javnog uvida nije obavezna. Po usvajanju planskog dokumenta, on ima snagu propisa i jednako dejstvo prema svima, tako da su planski dokumenti, kao i svi propisi javno dostupni. Tekstualni deo planskih dokumenata se objavljuje se u sluzbenim glasilima, a graficki deo je dostupan na zvanicinim internet stranicama nosioca izrade planskih dokumenata. Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona propisano je uspostavljanje Centralnog registra planskih dokumenata, koji je uspostavljen kao jedan od servisa Republickog geodetskog zavoda i nalazi se na internet adresi @link1@	[{"link": "https://www.crpd.gov.rs", "type": "url", "title": "www.crpd.gov.rs", "placeholder": "@link1@"}]	\N	t
178	S3VDDHWHHSKBBPFG	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Zasto gradjani nisu neposredno obavesteni o odrzavanju javnog uvida u planski dokument?	Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona propisano je da se javnim oglasavanjem u dnevnom listu za teritoriju Republike Srbije, lokalnom listu, zvanicnoj internet stranici nosioca izrade planskih dokumenata, smatra da je javnost obavestena. Izuzetak je kada se radi o izradi urbanistickog projekta za potrebe utvrdjivanja javnog interesa, kada se vrsi neposredno obavestavanje sopstvenika nepokretnosti u obuhvatu urbanistickog projekta.	\N	\N	t
179	XVCCZVQXUBSI6X5B	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Zasto javni uvid u planski dokument ne traje duze nego sto je propisano, 15 dana za rani javni uvid, odnosno 30 dana za javni uvid u planski dokument, u smislu da nije propisano da javni uvid ne moze duze trajati?	Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona propisana je duzina trajanja ranog javnog uvida i javnog uvida u planske dokumente. U slucaju da postoji velika zainteresovanost javnosti za neki planski dokument, moguce je produziti trajanje javnog uvida.	\N	\N	t
180	DAKPVNCYZ22LVSWP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Zasto se ne moze ostvariti javni uvid u planske dokumente, van radnog vremena nosioca izrade planskog dokumenta, odnosno zasto to nije moguce i vikendom?	Uvid u planske dokumente se odvija u zvanicnim sedistima organa uprave, odnosno organa autonomne pokrajine i organima jedinice lokalne samouprave, odnosno nosioca izrade planskih dokumenata, tako da su po pravilu vezani za radno vreme ovih organa. Ovo nije materija Zakona o planiranju i izgradnji i propisa donetih na osnovu ovog zakona, tako da se radno vreme navedenih institucija moze prilagoditi u skladu sa potrebama stanovnistva, odnosno korisnika njihovih usluga. Javni uvid u elektronskom obliku moze se ostvariti od 00-24 casova sedam dana u nedelji na zvanicnim internet stranicama nosilaca izrade planskih dokumenata.	\N	\N	t
181	THOWPW98BAZ4HPXC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Zasto se planovi pisu „previse strucnom terminologijom“, tako da zainteresovana javnost „ne moze potpuno da razume planska resenja“?	Planski dokumenti se rade na osnovu Zakona o planiranju i izgradnji i propisa donetih na osnovu ovog zakona. Pravilnikom o sadrzini, nacinu i postupku izrade plasnkih dokumenata propisana je sadrzina planskih dokumenata. Planovi se rade na osnovu odgovarajucih istrazivanja, koje se sprovode na osnovu opstih naucnih metoda (indukcija, dedukcija, analiza, sinteza, statisticki i komparativni metod, istorijski metod i kartografske metode). Maksimalno su pojednostavljeni, a svaka lokacija nosi određene specifikume i zavise od autorske arhitekture, koje nisu predmet planskih dokumenata.	\N	\N	t
182	00KSAKQTURLIL4GV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Podnosenje predstavki po usvojenom planskom dokumentu u smislu visine eksproprijacije.	Podnosenje predstavki po usvojenom planskom dokumentu nisu predmet pripreme, koordinacije i pracenje izrade planskih dokumenata.	\N	\N	t
183	ZXZTH947XR4PRPXX	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Da li moze planskim dokumentom da se propise visina eksproprijacije za nepokretnosti?	Ne. Utvrdjivanje visine eksproprijacije utvrdjuje lokalna poreska administracija na osnovu prosecne vrednosti prometa na nepokretnosima.	\N	\N	t
184	WP9B8T2ZZBQLOSNV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Da li moze planskim dokumentom da se ubrza postupak eksproprijacije?	Ne. Postupak utvrdjivanja javnog interesa je utvrdjen zakonom i drugim propisima kojim se uredjuje eksproprijacija. Planskim dokumentom se mogu uvrditi prioritetna planska resenja, kao i faznost i etapnost sprovodjenja plana.	\N	\N	t
185	KJGUPNQNI4OX54YU	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Podnosenje zahteva fizickih lica za priznavanje „stranke u postupku“ u smislu Zakona o opstem upravnom postupku, u toku izrade planskih dokumenata.	Priprema, koordinacija i pracenje izrade planskih dokumenata je vanupravni postupak, na koji se ne primenjuju zakoni i propisi kojim je uredjen opsti upravni postupak. U toku pripreme, koordinacije i pracenja izrade planskih dokumenata ne vodi se upravni postupak, ne izdaju se resenja, niti drugi upravni akti. Zainteresovana javnost ostvaruje uvid u toku ranog javnog uvida, javnog uvida, kao i u skladu sa zakonom kojim su uredjene informacije od javnog znacaja.	\N	\N	t
186	5DCCCBFEUPTXCYMM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	8	Trazenje informacije o lokaciji kao informacije od javnog znacaja	Informacija o lokaciji se izdaje u skladu sa Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona i ne predstavljaju informaciju od javnog znacaja. Da bi se dobila informacija o lokaciji, odnosno informacija o mogucnostima izgradnje na nekoj katastarskoj parceli, potrebno je podneti zahtev stvarno nadleznom organu, uplatiti takse propisane zakonom i drugim propisima, kao i dostaviti dokaz o izvrsenoj uplati.	\N	\N	t
187	4EW98GHEE2QKSEDV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Predstavke građana koje se odnose na nezadovoljavajući kvalitet, obim ili kontinuitet pružanja komunalnih usluga	Ustavom Republike Srbije („Službeni glasnik RS” br.98/06) propisano je da opština preko svojih organa, u skladu sa zakonom uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti (član 190. stav 1. tačka 1). Nadalje, odredbom člana 20. Zakona o lokalnoj samoupravi („Službeni glasnik RS”, br. 129/07, 83/14 – dr. zakon, 101/16 , 47/18 i 111/2021-dr.zakon), propisana je nadležnost opštine, između ostalog, da uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti. Odredbom člana 2. Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18, u daljem tekstu: Zakon) propisano je da komunalne delatnosti podrazumevaju pružanje komunalnih usluga od značaja za ostvarivanje životnih potreba fizičkih i pravnih lica kod kojih je jedinica lokalne samouprave dužna da stvori uslove za obezbeđenje odgovarajućeg kvaliteta, obima, dostupnosti i kontinuiteta komunalnih delatnosti. Nadalje, članom 4. Zakona propisano je da jedinica lokalne samouprave obezbeđuje organizacione, materijalne i druge uslove za izgradnju, održavanje i funkcionisanje komunalnih objekata i za tehničko i tehnološko jedinstvo sistema i uređuje i obezbeđuje obavljanje komunalnih delatnosti i njihov razvoj. Dakle, jedinice lokalne samouprave su u ustavnoj i zakonskoj obavezi da obezbede uslove za obavljanje komunalnih delatnosti u skladu sa zakonom koji reguliše komunalne delatnosti. Napominjemo da jedinica lokalne samouprave može svojom odlukom, u skladu sa statutom, predvideti da gradska opština, mesna zajednica ili drugi oblik mesne samouprave obavlja određene poslove u vezi sa obezbeđivanjem uslova za obavljanje komunalnih delatnosti, kao i da obezbeđivanje uslova za obavljanje komunalnih delatnosti obuhvata aktivnosti na jačanju kapaciteta i funkcionalnosti komunalne infrastrukture, obezbeđenje sredstava za finansiranje izgradnje komunalne infrastrukture, aktivnosti na praćenju kvaliteta komunalnih usluga, kao i preduzimanje mera za kontinuirano vršenje komunalnih delatnosti u cilju obezbeđenja životnih potreba fizičkih i pravnih lica.	\N	\N	t
188	XPZQBT18S1VXSRCW	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na promenu cena komunalnih usluga	Zakonom o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18)( u daljem tekstu: Zakon), određuju se komunalne delatnosti i uređuju opšti uslovi i način njihovog obavljanja. Članom 28. Zakona propisano je da odluku o promeni cene komunalnih usluga donosi vršilac komunalne delatnosti, na koju saglasnost daje nadležan organ jedinice lokalne samouprave. Uz zahtev za davanje saglasnosti vršilac komunalne delatnosti nadležnom organu jedinice lokalne samouprave dostavlja obrazloženje koje naročito sadrži razloge za promenu i detaljnu strukturu predložene cene. Takođe, jedinica lokalne samouprave je u obavezi da objavi zahtev za davanje saglasnosti na odluku o promeni cena komunalnih usluga, sa obrazloženjem, na oglasnoj tabli u sedištu jedinice lokalne samouprave, kao i u elektronskom obliku putem interneta, najmanje 15 dana pre donošenja odluke. Napominjemo, da su Zakonom određene dve vrste komunalnog inspekcijskog nadzora: prva koju vrši republička komunalna inspekcija i druga koju vrši komunalna inspekcija na nivou jedinice lokalne samouprave. Tako je članom 32. stav 4. Zakona propisano da nadzor nad radom vršilaca komunalne delatnosti vrši jedinica lokalne samouprave.	\N	\N	t
6	Y5RKVRBNT8YLE6UB	2023-05-22 08:07:52	2023-05-22 22:28:37	\N	1	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?	<p>Delove obale i vodnog prostora na kojima se mogu graditi hidrotehnički objekti i marine, postavljati plutajući objekti, plutajući objekti za snabdevanje brodova gorivom i privezi&scaron;ta za čamce, kao i uslove i način postavljanja plutajućih objekata i privezi&scaron;ta za čamce, određuje nadležni organ lokalne samouprave u skladu sa zakonom kojim se uređuje lokalna samouprava. Na propise i druge op&scaron;te akte koje donose nadležni organi lokalne samouprave koji uređuju ovu materiju, kao i na plan postavljanja plutajućih objekata, plutajućih objekata za snabdevanje brodova gorivom i privezi&scaron;ta za čamce, prethodno se pribavlja saglasnost Ministarstva nadležnog za poslove saobraćaja (Ministarstvo građevinarstva, saobraćaja i infrastrukture).</p>	\N	\N	t
189	FI0V9ROCK1OWK9UE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na priključenje na komunalnu infrastrukturu i vlasništvo vodomera	Zakonom o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18) ( u daljem tekstu: Zakon) određene su komunalne delatnosti i uređeni opšti uslovi i način njihovog obavljanja. Članom 3. stav 1. tačka 1) propisano je da komunalna delatnost snabdevanje vodom za piće zahvatanje, prečišćavanje, prerada i isporuka vode vodovodnom mrežom do mernog instrumenta potrošača, obuhvatajući i merni instrument. Nadalje, članom 31. Zakona je propisano da glavni merni instrument za merenje potrošnje vode ugrađen na mestu priključenja instalacija korisnika na komunalnu infrastrukturu predstavlja sastavni deo komunalne infrastrukture, kao i da se nabavka ovog mernog instrumenta vrši iz nadoknade za priključak, koju plaća investitor, odnosno vlasnik nepokretnosti. Takođe, napominjemo da Zakon prepoznaje i individualni merni instrument. Individualni merni instrumenti su ugrađeni na instalacijama korisnika, služe merenju potrošnje vode za pojedinačne stanove, odnosno pojedinačne poslovne prostorije, u svojini su vlasnika pojedinačnih stanova, odnosno, vlasnika pojedinačnih poslovnih prostorija i oni snose troškove nabavke, ugradnje, eksploatacije, održavanja i funkcionisanja individualnih mernih instrumenata.	\N	\N	t
190	GV02BX1N8GSBNNUO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na obavljanje komunalnih delatnosti za dve ili više jedinica lokalne samouprave	Članom 10. Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18) ( u daljem tekstu: Zakon) propisano je da dve ili više jedinica lokalne samouprave mogu sporazumom urediti zajedničko obavljanje komunalnih delatnosti, osim ako to nije drugačije uređeno drugim posebnim propisom. Nadalje, stav 2. istog člana propisuje da ukoliko utvrde interes za zajedničko obavljanje komunalnih delatnosti, opštinsko, odnosno gradsko veće svake jedinice lokalne samouprave donosi odluku o izradi studije opravdanosti koja sadrži : detaljan prikaz zatečenog stanja u toj komunalnoj delatnosti, finansijsku analizu sa predračunom potrebnih ulaganja, izvore finansiranja i prethodnu finansijsku ocenu opravdanosti zajedničkog obavljanja komunalne delatnosti, analizu tržišta za tu komunalnu delatnost, detaljni prikaz ekonomski opravdanih i pravno mogućih modela zajedničkog obavljanja komunalne delatnosti, detaljno obrazloženje predloženog modela zajedničkog obavljanja komunalne delatnosti sa osvrtom na prednosti i nedostatke tog modela u odnosu na druge moguće modele, posebno u odnosu na dotadašnji model obavljanja komunalne delatnosti, očekivane rezultate predloženog modela, kao i preduslove za postizanje tih rezultata, pregled rizika i predloga za njihovo otklanjanje, odnosno predupređivanje. Ako se na osnovu rezultata studije utvrdi opravdanost zajedničkog obavljanja komunalne delatnosti, opštinsko, odnosno gradsko veće podnosi skupštini jedinice lokalne samouprave predlog odluke o načinu obavljanja komunalne delatnosti i predlog sporazuma o zajedničkom obezbeđivanju obavljanja komunalne delatnosti. Sporazum o zajedničkom obavljanju komunalne delatnosti smatra se zaključenim kada ga u istovetnom tekstu usvoje sve skupštine jedinica lokalne samouprave u periodu koji ne može da bude duži od tri meseca od dobijanja predloga.	\N	\N	t
191	SIPQR3GTUZJVEZBN	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Ko ima obavezu podnošenja Zahteva za otpočinjanje obavljanja komunalnih delatnosti?	Odredbom člana 4. stav 5. tačka 2 ) Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18) ( u daljem tekstu: Zakon) , određeno je da Vlada uređuje sadržinu, način i uslove za otpočinjanje obavljanja komunalnih delatnosti. Radi sprovođenja navedene odredbe, Vlada je donela Uredbu o načinu i uslovima za otpočinjanje obavljanja komunalnih delatnosti („Službeni glasnik RS”, br. 13/18 ,66/18 i 51/19 - u daljem tekstu:Uredba) kojom su propisani način i uslovi za otpočinjanje obavljanja komunalnih delatnosti. Uredba je stupila na snagu 22. februara 2018. godine. Nadalje,shodno članu 8a Zakona i Uredbi, svaki privredni subjekat koji otpočinje vršenje komunalne delatnosti u obavezi je da podnese zahtev za proveru ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Rešenje o ispunjenosti uslova za obavljanje komunalne delatnosti vršilaca komunalnih delatnosti, donosi ministar nadležan za poslove komunalnih delatnosti a nakon što Komisija, obrazovana u skladu sa Zakonom utvrdi da su za to ispunjeni uslovi iz Uredbe. Vršioci komunalnih delatnosti koji su do stupanja na snagu Uredbe obavljali te komunalne delatnosti, nemaju obavezu da podnose zahtev za utvrđivanje ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Međutim, bili su u obavezi da u roku od tri meseca od dana stupanja na snagu Uredbe usklade svoje poslovanje sa Uredbom.	\N	\N	t
192	NGXUTTTDF7AOAONH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Do kada je rok za dostavu izveštaja u vezi obavljanja komunalnih delatnosti	Shodno članu 8. Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18) jedinica lokalne samouprave dužna je da do kraja februara tekuće godine dostavi Ministarstvu građevinarstva, saobraćaja i infrastrukture izveštaj, na propisanom obrascu, u vezi sa obavljanjem komunalnih delatnosti u prethodnoj godini.	\N	\N	t
193	DYOXROVKYCCA75ZH	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Da li je vršilac komunalne delatnosti u obavezi da Ministarstvu građevinarstva, saobraćaja i infrastrukturedostavi upitnik ili isti dostavlja jedinici lokalne samouprave	Shodno članu 8. Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18) jedinica lokalne samouprave dostavlja Ministarstvu građevinarstva, saobraćaja i infrastrukture (u daljem tekstu: Ministarstvo) izveštaj o komunalnim delatnostima za prethodnu godinu, izuzev vršioca komunalne delatnosti pogrebna delatnost koji su u obavezi da Ministarstvu dostave izveštaj, na propisanom obrascu, u vezi sa obavljanjem te komunalne delatnosti. Napominjemo, da je vršilac komunalne delatnosti dužan da na zahtev Ministarstva dostavi Ministarstvu podatke i obaveštenja u vezi sa obavljanjem komunalnih delatnosti u roku od 15 dana od dana prijema zahteva Ministarstva.	\N	\N	t
194	ROJATDSE9MOMMYOC	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Tumačenje Zakona o komunalnim delatnostima u vezi primene člana 9. u pogledu načina poveravanja komunalnih delatnosti	Odredbama Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18) (u daljem tekstu: Zakon), propisano je da komunalne delatnosti mogu obavljati javna preduzeća, privredna društva, preduzetnici ili drugi privredni subjekti ( član 5. stav 1), kao i da se poveravanje obavljanja komunalne delatnosti vrši na osnovu odluke skupštine jedinice lokalne samouprave o načinu obavljanja komunalne delatnosti i ugovora o poveravanju, osim kad se osniva javno preduzeće (član 9. stav 3). Takođe, članom 9. stav 1. Zakona propisano je da se pod poveravanjem obavljanja komunalne delatnosti podrazumeva vremenski oročeno ugovorno uređivanje odnosa u vezi sa obavljanjem komunalne delatnosti ili pojedinih poslova iz okvira komunalne delatnosti između jedne ili više jedinica lokalne samouprave i vršioca komunalne delatnosti, koje za cilj ima pružanje komunalnih usluga na teritoriji jedne ili više jedinica lokalne samouprave ili na delu teritorije jedinice lokalne samouprave. Nadalje, odredbom člana 9. stav 7. Zakona, propisano je da se na postupak poveravanja obavljanja komunalne delatnosti čije se finansiranje obezbeđuje iz budžeta jedinice lokalne samouprave, odnosno čije se finansiranje obezbeđuje u celosti ili delimično naplatom naknade od korisnika komunalnih usluga, primenjuju odredbe zakona kojima se uređuje javno-privatno partnerstvo i koncesije. Ova odredba primenjuje se počev od 1. januara 2017.godine, od stupanja na snagu Zakona o izmenama i dopunama Zakona o komunalnim delatnostima („Službeni glasnik RS”, br. 104/16). Odredbom člana 20. Zakona o lokalnoj samoupravi („Službeni glasnik RS”, br. 129/07, 83/14 – dr. zakon, 101/16– dr. zakon i 47/18), propisana je nadležnost opštine, između ostalog, da uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti, dok je članom 32. tačka 8) propisano da skupština opštine, u skladu sa zakonom, osniva službe, javna preduzeća, ustanove i organizacije, utvrđene statutom opštine i vrši nadzor nad njima. Iz navedenih odredaba zakona proizilazi da je jedinica lokalne samouprave ovlašćena da uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti i da,u cilju obavljanja komunalnih delatnosti, osniva javna preduzeća, a može i ugovorom o poveravanju da obavljanje ovih poslova poveri drugom pravnom ili fizičkom licu.	\N	\N	t
195	ILE0SML2QPGNXEEQ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Gde se može vršiti pokopavanje posmrtnih ostataka umrlog odnosno da li groblje gde se preminulo lice pokopava mora biti u upotrebi?	Zakonom o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11 i 104/16), odredbom člana 3. tačka 6) propisano je da komunalna delatnost upravljanje grobljima i sahranjivanje obuhvata upravljanje i održavanje groblja, održavanje grobnog mesta i naplata naknade za održavanje grobnog mesta, obezbeđivanje, davanje u zakup i prodaja uređenih grobnih mesta, pokopavanje i ekshumacija posmrtnih ostataka, kremiranje i ostavljanje pepela pokojnika, održavanje objekata koji se nalaze u sklopu groblja (mrtvačnica, kapela, rozarijum, kolumbarijum, krematorijum) i održavanje pasivnih grobalja i spomen-obeležja. Nadalje odredbom člana 13. stav 1. istog zakona propisano je, između ostalog, da skupština jedinice lokalne samouprave odlukama propisuje način obavljanja komunalne delatnosti kao i opšta i posebna prava i obaveze vršilaca komunalne delatnosti i korisnika usluga na svojoj teritoriji. Zakonom i sahranjivanju i grobljima („Službeni glasnik SRS”, br. 20/77, 24/84 i 6/89 i „Službeni glasnik RS”, br. 53/93, 67/93, 48/94, 101/05 – dr. zakon, 120/12 – odluka US i 84/13 – odluka US)( u daljem tekstu: Zakon), propisano je da se sahranjivanje umrlih, određivanje i stavljanje van upotrebe groblja, održavanje i uređenje groblja i krematorijuma vrši na način utvrđen propisom skupštine opštine, donetim u skladu sa načelima tog zakona i drugim propisima koji se odnose na sahranjivanje i groblja. Zakonom je takođe propisano da se sahranjivanje umrlih može vršiti samo na groblju ( član 2) kao i da se grobljem, u smislu ovog zakona, smatra zemljište koje je odgovarajućim urbanističkim planom ili odlukom skupštine opštine određeno za sahranjivanje umrlih ( član 4). Nadalje, Zakon propisuje da svako naseljeno mesto, po pravilu, ima groblje ( član 16) kao i da organizacija udruženog rada koja vrši poslove pogrebne delatnosti i uređivanja i održavanja groblja ili mesna zajednica kojoj je povereno vršenje tih poslova (vršilac komunalne delatnosti upravljanje grobljima i sahranjivanje) daje na korišćenje grobna mesta (parcele) pod uslovima i na način utvrđen odlukom skupštine opštine (član 17. stav 1). Na osnovu svega iznetog proizilazi da jedinice lokalne samouprave opštim aktom uređuju bliže uslove i način obavljanja komunalne delatnosti upravljanje grobljima i sahranjivanje, kao i da se se pokopavanje posmrtnih ostataka umrlog može vršiti samo na groblju koje je u upotrebi i koje je odgovarajućim urbanističkim planom odnosno odlukom skupštine opštine određeno za sahranjivanje umrlih.	\N	\N	t
196	TQANETULGACOM1IY	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Pritužbe na rad vršilaca komunalnih delatnosti	Članom 13. Zakona propisano da skupština jedinice lokalne samouprave odlukama propisuje, između ostalog i način kontinuiranog izjašnjavanja (najmanje jednom godišnje) korisnika komunalnih usluga o kvalitetu pružanja komunalnih usluga od strane vršilaca komunalnih delatnosti, koje se može organizovati elektronskim putem ili na drugi pogodan način. Ukoliko su rezultati izjašnjavanja korisnika komunalnih usluga takvi da većina nije zadovoljna pruženom komunalnom uslugom određenog vršioca komunalne delatnosti, jedinica lokalne samouprave pokreće postupak preispitivanja rada tog vršioca komunalne delatnosti i nalaže mu da otkloni nedostatke koji su navedeni u izjašnjavanju korisnika u roku koji ne može biti duži od 90 dana. Napominjemo, da su Zakonom određene dve vrste komunalnog inspekcijskog nadzora: prva koju vrši republička komunalna inspekcija i druga koju vrši komunalna inspekcija na nivou jedinice lokalne samouprave. Tako je članom 32. stav 4. Zakona propisano da nadzor nad radom vršilaca komunalne delatnosti vrši jedinica lokalne samouprave.	\N	\N	t
197	CDQ4WGV29B4P4EUM	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Tumačenje odredaba Posebnog kolektivnog ugovora za javna preduzeća u komunalnoj delatnosti na teritoriji Republike Srbije	Odredbom člana 8. stav 2. Zakona o radu („Službeni glasnik RS”, br. 24/05, 61/05, 54/09, 32/13, 75/14, 13/17 – odluka US, 113/17 i 95/18 – autentično tumačenje), propisano je, između ostalog, da se odredbama opšteg akta i ugovorom o radu mogu utvrditi veća prava i povoljniji uslovi rada od prava i uslova utvrđenih zakonom. Poseban kolektivni ugovor za javna preduzeća u komunalnoj delatnosti na teritoriji Republike Srbije („Službeni glasnik RS”, broj 30/21, u daljem tekstu: Poseban kolektivni ugovor), između ostalog, propisuje prava, obaveze i odgovornosti iz radnog odnosa i po osnovu rada i ostala pitanja od značaja za zaposlene i poslodavca, kao i da doprinosi ujednačavanju primene prava, obaveza i odgovornosti zaposlenih i poslodavaca u javnim preduzećima u oblasti komunalnih delatnosti na teritoriji Republike Srbije. Zakon o radu postavio je hijerarhijski odnos između zakona, kolektivnog ugovora na različitim nivoima i pravilnika o radu (opšti akti) i ugovora o radu, na sledeći način: - opštim aktom i ugovorom o radu mogu da se utvrde veća prava i povoljniji uslovi rada od prava i uslova utvrđenih zakonom, kao i druga prava koja nisu utvrđena zakonom, osim ako zakonom nije drugačije određeno; - opšti akt i ugovor o radu ne mogu da utvrđuju manja prava i nepovoljnije uslove rada od prava i uslova utvrđenih zakonom; - ako opšti akt sadrži takve odredbe - neposredno se primenjuju odredbe zakona. U ovom slučaju nezakonitost i neustavnost opšteg akta utvrđuje se pred Ustavnim sudom; - ugovor o radu kao akt niže pravne snage ne može da utvrđuje manja prava i nepovoljnije uslove rada od prava i uslova koji su utvrđeni zakonom i opštim aktom (kolektivnim ugovorom ili pravilnikom o radu); - ako ugovor takve odredbe sadrži - one su ništave, što se utvrđuje pred nadležnim sudom; - u hijerarhiji kolektivnih ugovora koji obavezuju poslodavca - kolektivni ugovor kod poslodavca ne sme da sadrži nepovoljnije uslove rada i manja prava od uslova i prava utvrđenih posebnim odnosno opštim kolektivnim ugovorom koji obavezuje poslodavca (ako je član udruženja koje je zaključilo kolektivni ugovor više pravne snage ili je doneta odluka o proširenom dejstvu opšteg ili posebnog kolektivnog ugovora). Odredba člana 263. Zakona o radu propisuje da se kolektivni ugovor zaključuje na period do tri godine. Po isteku navedenog roka, kolektivni ugovor prestaje da važi, ako se učesnici kolektivnog ugovora drukčije ne sporazumeju najkasnije 30 dana pre isteka važenja kolektivnog ugovora. Takođe, isti zakon odredbom člana 243. propisuje da se poseban kolektivni ugovor zaključuje za teritoriju jedinice teritorijalne autonomije ili lokalne samouprave, a odredba člana 246. precizira da poseban kolektivni ugovor za javna preduzeća i javne službe zaključuju osnivač, odnosno organ koji on ovlasti, i reprezentativni sindikat. Odredbom člana 254. Zakona o radu propisano je da su učesnici u zaključivanju kolektivnog ugovora dužni da pregovaraju, kao i da ako se u toku pregovora ne postigne saglasnost za zaključivanje kolektivnog ugovora u roku od 45 dana od dana započinjanja pregovora, učesnici mogu da obrazuju arbitražu za rešavanje spornih pitanja. Takođe, za delatnosti od opšteg interesa, sporovi u zaključivanju, izmeni i dopuni i primeni kolektivnih ugovora rešavaju se u skladu sa zakonom. S tim u vezi, ukoliko postoji spor u vezi sa zaključivanjem kolektivnog ugovora, sindikat može da inicira rešavanje ove vrste kolektivnog radnog spora u skladu sa Zakonom o mirnom rešavanju radnih sporova („Službeni glasnik RS”, br. 125/04 i 104/09), u postupku pred Republičkom agencijom za mirno rešavanje radnih sporova uz učešće miritelja, pod uslovom da strane u sporu prihvate da spor reše na ovaj način. Miritelj bi se u tom slučaju uključio u postupak pregovora radi zaključivanja kolektivnog ugovora, međutim, samo zaključivanje kolektivnog ugovora zavisi od saglasnosti volja ovlašćenih pregovarača da isti zaključe i potpišu. Kolektivni ugovor je kao i svaki drugi ugovor proizvod saglasnosti volja onih koji ga zaključuju. Budući da se do te saglasnosti može doći jedino sporazumevanjem, zakon ne propisuje dužnost zaključivanja kolektivnog ugovora, već dužnost, odnosno obavezu pregovaranja. Kako će proces pregovaranja teći i kako će biti okončan, zavisi od učesnika i njihove uspešnosti pregovaranja. Imajući u vidu dobrovoljnu prirodu kolektivnog ugovora, Zakonom o radu i međunarodnim konvencijama nisu predviđene sankcije za poslodavca koji ne započne postupak pregovaranja za zaključivanje kolektivnog ugovora i ne zaključi kolektivni ugovor, ali u skladu sa članom 3. stav 5) Zakona o radu, poslodavac koji ne prihvati inicijativu reprezentativnog sindikata za pristupanje pregovorima za zaključenje kolektivnog ugovora, ne može pravilnikom o radu da uredi prava i obaveze iz radnog odnosa.	\N	\N	t
198	MJF4AVCJCLTGLGHT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	9	Šta sve obuhvata obavljanje komunalne delatnosti pogrebna delatnost i koje uslove treba da ispune privredni subjekti koji bi da obavljaju navedenu delatnost?	Zakon o komunalnim delatnostima („Službeni glasnik RS”, br. 88/11, 104/16 i 95/18), (u daljem tekstu: Zakon) propisuje da komunalna delatnost pogrebna delatnost obuhvata preuzimanje i prevoz posmrtnih ostataka od mesta smrti, odnosno mesta na kome se nalazi umrla osoba i prevoz do mesta određenog posebnim propisom, organizacija sahrane i ispraćaja sa pribavljanjem potrebne dokumentacije za organizaciju prevoza i sahranjivanja, čuvanje posmrtnih ostataka u rashladnom uređaju i pripremanje pokojnika za sahranjivanje. Nadalje, odredbom člana 4. stav 5. tačka 2 ) Zakona određeno je da Vlada uređuje sadržinu, način i uslove za otpočinjanje obavljanja komunalnih delatnosti. Radi sprovođenja navedene odredbe, Vlada je donela Uredbu o načinu i uslovima za otpočinjanje obavljanja komunalnih delatnosti („Službeni glasnik RS”, br. 13/18 ,66/18 i 51/19 - u daljem tekstu: Uredba) kojom su propisani način i uslovi za otpočinjanje obavljanja komunalnih delatnosti i posebno su uređeni: stručna osposobljenost kadrova i tehnički kapacitet koje moraju da ispune vršioci komunalnih delatnosti. Uredba je stupila na snagu 22. februara 2018. godine i nalazi se na zvaničnom sajtu Ministarstva građevinarstva, saobraćaja i infrastrukture @link1@ Shodno članu 8a Zakona i Uredbi, svaki privredni subjekat koji otpočinje vršenje komunalne delatnosti u obavezi je da podnese zahtev za proveru ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Vršioci komunalnih delatnosti koji su do stupanja na snagu Uredbe obavljali te komunalne delatnosti, nemaju obavezu da podnose zahtev za utvrđivanje ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Međutim, bili su u obavezi da u roku od tri meseca od dana stupanja na snagu Uredbe usklade svoje poslovanje sa Uredbom.	[{"link": "https://www.mgsi.gov.rs/cir/dokumenti/uredba-o-nachinu-i-uslovima-za-otpochinjanje-obavljanja-komunalnih-delatnosti", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/uredba-o-nachinu-i-uslovima-za-otpochinjanje-obavljanja-komunalnih-delatnosti", "placeholder": "@link1@"}]	\N	t
199	QLWUO01EKEBPIQCT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Kako da podnesem zahtev za vršenje tehničkog nadzora plovila?	Obrazac zahteva za vršenje tehničkog nadzora plovila je objavljen na sajtu Uprave za utvrđivanje sposobnosti brodova za plovidbu (u daljem tekstu Uprava) @link1@. Zahtev možete dostaviti poštom na našu adresu, ul. Narodnih heroja 30/II – Novi Beograd, elektronskim putem na adresu @email1@ ili lično. Instrukcije za podnošenje zahteva za vršenje tehničkog nadzora / industrijskog nadzora iz delokruga Uprave i plaćanje republičke administrativne takse za podnošenje zahteva objavljene su na sajtu Uprave.	[{"link": "http://www.uprava-brodova.gov.rs", "type": "url", "title": "www.uprava-brodova.gov.rs", "placeholder": "@link1@"}, {"link": "mail:office@uprava-brodova.gov.rs", "type": "email", "title": "office@uprava-brodova.gov.rs", "placeholder": "@email1@"}]	\N	t
200	XEEDWFJYWHELWHS2	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Koja je procedura za vršenje tehničkog nadzora čamca, odnosno plutajućeg objekta?	Uz popunjen zahtev za vršenje tehničkog nadzora čamca/plutajućeg objekta dostavlja se dokaz o izvršenoj uplati republičke administrativne takse za podnošenje zahteva i kopija plovidbene/ plutajuće dozvole. U zavisnosti od vrste tehničkog nadzora i tehničkih karakteristika čamca/plutajućeg objekta Uprava izdaje Nalog za uplatu takse za vršenje tehničkog nadzora u skladu sa tarifama koje su propisane Zakonom o republičkim administrativnim taksama. Nakon izvršene uplate lice ovlašćeno za tehnički nadzor izlazi na teren i vrši tehnički nadzor.	\N	\N	t
201	S41VVSZE8K9D3BYT	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Koji pregled sledi kada istekne plovidbena ili plutajuća dozvola?	Redovan pregled plovila može se izvršiti najranije 30 dana pre isteka roka, odnosno najkasnije 30 dana posle isteka važnosti plovidbene odnosno plutajuće dozvole. Ukoliko je važnost plovidbene/plutajuće dozvole izstekla više od 30 dana stranka podnosi zahtev za vanredni pregled.	\N	\N	t
202	STOXJSS8ZGKHVC8B	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Kako se registruje brod koji se uvozi iz zemlje koja je članica Evropske unije?	Vlasnik broda podnosi: 1) zahtev za vanredni pregled u svrhu upisa po priznanju svedočanstva zajednice (EU) sa dokazom o uplaćenoj taksi za podnošenje zahteva i original dokumenta (Brodsko svedočanstvo i Svedočanstvo o baždarenju) ili kopije sa pečatom „CERTIFIED COPY“; 2) zahtev za zamenu para ploča na trupu, ili zahtev za baždarenje broda (ukoliko brod ne poseduje važeće brodsko svedočastvo). Na osnovu validne dokumentacije i plaćene takse za vršenje tehničkog nadzora Uprava stiče mogućnost za izlazak na teren na kome identifikuje objekat, proverava usklađenost sa Brodskim svedočanstvom i izdaje brodu nove baždarske pločice. U zavisnosti od tipa i opreme broda Uprava definiše dodatne zahteve za izdavanje potrebnih brodskih isprava. Nakon izvršenog pregleda Uprava izdaje potvrdu radi dobijanja Rešenja o određivanju imena i pozivnog znaka broda koje izdaje Ministarstvo građevinarstva, saobraćaja i infrastrukture. Na osnovu rešenja o imenu broda Uprava izdaje brodske isprave radi upisa broda u domaći upisnik brodova.	\N	\N	t
203	TQRLQC5XT76S4O3U	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Ko izrađuje tehničku dokumentaciju za plovila?	Uprava pregleda samo tehničku dokumentaciju koju izrađuje uslužno privredno društvo, a koje ima za to odobrenje od strane Uprave. Spisak izdatih odobrenja za društva koja izrađuju tehničku dokumentaciju je objavljen na sajtu Uprave.	\N	\N	t
204	BO0PQ3JGEXOQCVQV	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Da li mogu da podnesem zahtev za pregled broda koji nije u mom vlasništvu?	Možete, ukoliko ste upisani kao zakupac, ili korisnik broda u Upisnik brodova koji vodi nadležna Lučka kapetanija, ili uz odgovarajuće ovlašćenje vlasnika broda.	\N	\N	t
205	BYUF1GKBPYREUODO	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Kako mogu da izvršim prenamenu čamca za sport i razonodu u čamac za privredni ribolov?	Svi vlasnici čamaca koji su registrovani za sport i razonodu moći će da izvrše prenamenu u čamce za privredni ribolov uz važeću plovidbenu dozvolu do 17. maja 2023. godine uz napomenu da moraju biti registrovani za privredni ribolov u Agenciji za privredne registre. U ovom slučaju vlasnik/korisnik podnosi zahtev za osnovni pregled čamca za privredni ribolov. Nakon navedenog datuma vlasnici su u obavezi da dostave tehničku dokumentaciju u skladu sa Pravilnikom o tehničkim pravilima za čamce, ploveća tela i plutajuće objekte („Sl. glasnik RS“, br. 35/2018), Prilog 2 – Tehnička pravila za čamce za privredne i javne svhe.	\N	\N	t
206	WD01BBMVRBXTG8GP	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Koje uslove treba da ispunim da bih mogao da pravim čamac ili plutajući objekat?	Ako se odlučite za gradnju čamca potrebno je da podnesete zahtev za pregled tehničke dokumentacije. Dokumentacija se dostavlja u tri primerka. Nakon odobrene tehničke dokumentacije podnosi se zahtev za nadzor nad gradnjom čamca ili plutajućeg objekta koji se vrši u radionici koju je Uprava priznala za izgradnju željenih plovila. Spisak priznatih radionica možete pronaći na sajtu Uprave. Predlažemo da pogledate tipski odobrene čamce jer se u tom slučaju vrši samo osnovni pregled plovila.	\N	\N	t
207	SWSNR8XAOQF4SSZE	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Kako da dobijem duplikate brodskih dokumenata koja su izgubljena?	Upavi se podnosi zahtev za izdavanje duplikata brodskih ispava i knjiga uz dokaz da je dokument oglašen nevažećim. Uz ovaj zahtev se ne plaća republička taksa za podnošenje zahteva. Plaća se taksa za izdradu dokumenata.	\N	\N	t
208	E2WSSO2LVMFUVG8O	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Šta je potrebno od dokumentacije za registraciju novonabavljenog čamca/plutajućeg objekta za privredne svrhe?	Za dokumentaciju je potreban dokaz o vlasništvu, tipsko odobrenje ili svedočanstvo o gradnji. Potrebno je da podnesete zahtev za osnovni pregled čamca za privredne i javne svrhe i dokaz o izvršenoj uplati takse za podnošenje zahteva. U koliko je čamac uvežen potrebno je dostaviti deklaraciju - CE znak ili tehnička dokumentacija, Račun o kupovini i carinsku deklaraciju.	\N	\N	t
209	XKGTRJDOHVLNPP1B	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Kada počinje primena pravilnika za čamce i plutajuće objekte za privredne i javne svrhe?	U toku je predlog izmene uredbe.	\N	\N	t
210	YZKOAHMPSVBKJOUS	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Koja je procedura overe tehničke dokumentacije za brodove unutrašnje plovidbe?	Uprava za utvrđivanje sposobnosti brodova za plovidbu vrši proveru tehničke dokumentacije na osnovu prema članu 90i Zakona o plovidbi i lukama na unutrašnjim vodama.	\N	\N	t
211	AMEXE1DKPOSTGXAJ	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Šta je potrebno za dobijanje dozvole za prevoz opasnih tereta (ADN)?	Potrebno je dostaviti Upravi ADN srtifikat od priznatog klasifikacionog društva.	\N	\N	t
212	MQ8ID3AUB8LS5CAK	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Koji su rokovi za primenu poglavlja 13.01 ES-TRIN standarda , Oprema broda (sidreni uređaji)?	Rok za usaglašavanje opreme za sidrenje prema poglavlju 13.01 je 30.12.2024.god.	\N	\N	t
213	KQRBDLFCNVQLOGC7	2023-05-22 08:07:53	2023-05-22 08:07:53	\N	10	Koji su rokovi za primenu poglavlja 6.02 ES-TRIN standarda Kormilarski uređaji?	Rok za usaglašavanje objekta sa poglavljem 6.02 ES-TRIN standarda je 01.01.2026. god.	\N	\N	t
15	S01P49G2GARYIALH	2023-05-22 08:07:53	2023-05-23 12:11:37	\N	1	Koja pravna lica mogu da obavljaju hidrografska merenja?	<p>Hidrografska merenja mogu da obavljaju pravna lica, koja su u skladu sa čl.6. st. 3. Zakona o hidrografskoj delatnosti (&bdquo;Službeni glasnik RS&ldquo; br. 9/20), ishodovala Re&scaron;enje Ministarstva nadležnog za poslove saobraćaja o ispunjenosti uslova za obavljanje hidrografske delatnosti. Za dodatne informacije možete da se obratite Ministarstvu građevinarstva, saobraćaja i infrastrukture, Sektoru za vodni saobraćaj i bezbednost plovidbe na brojeve telefona: 011/3619-491 i 011/3621-698 ili putem po&scaron;te na adresu Nemanjina 22-26, Beograd.</p>	\N	\N	t
1	SABZ98BJ9HBXCMNN	2023-05-22 08:07:52	2023-05-22 20:47:09	\N	1	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?	<p>Položaj plovnog puta na reci Savi i reci Dunav (međunarodni vodni putevi) i na reci Tisi (međudržavni vodni put) dostupni su su na internet prezentaciji Direkcije za vodne puteve: <a title="https://www.plovput.rs/elektronske-plovidbene-karte" href="https://www.plovput.rs/elektronske-plovidbene-karte" target="_blank" rel="noopener">https://www.plovput.rs/elektronske-plovidbene-karte</a></p>	[{"link": "https://www.plovput.rs/elektronske-plovidbene-karte", "type": "url", "placeholder": "@link1@"}]	\N	t
2	7SG86VEMLF1WRFUK	2023-05-22 08:07:52	2023-05-22 20:50:13	\N	1	Interesuje me gde je moguće kupiti štampana izdanja plovidbenih karata Dunava, Tise i Save?	<p>Direkcija za vodne puteve ne poseduje &scaron;tampana izdanja plovidbenih karata. Plovidbene karte Dunava, Tise i Save se nalaze na portalu Direkcije gde se mogu preuzeti u elektronskoj formi i potpuno besplatno: <a title="https://www.plovput.rs/papirne-plovidbene-karte" href="https://www.plovput.rs/papirne-plovidbene-karte" target="_blank" rel="noopener">https://www.plovput.rs/papirne-plovidbene-karte</a></p>	[{"link": "https://www.plovput.rs/papirne-plovidbene-karte", "type": "url", "placeholder": "@link1@"}]	\N	t
17	6VPECZ4UMF1UQTTC	2023-05-22 08:07:53	2023-05-23 12:28:35	\N	1	Koji je sadržaj projekta za izvođenje poslova u okviru hidrografske delatnosti?	<p>Direkcija za vodne puteve donela je Uputstvo za izradu projekta za izvođenje poslova u okviru hidrografske delatnosti, koje se može preuzeti na internet prezentaciji Direkcije za vodne puteve: <a title="https://www.plovput.rs/file/usluge/izdavanje-resenja-potvrdjivanje-validnosti-hidrografskih-podataka/potvrdjivanje-validnosti-hidrografskih-podataka-uputstvo-za-plan.pdf" href="https://www.plovput.rs/file/usluge/izdavanje-resenja-potvrdjivanje-validnosti-hidrografskih-podataka/potvrdjivanje-validnosti-hidrografskih-podataka-uputstvo-za-plan.pdf" target="_blank" rel="noopener">https://www.plovput.rs/file/usluge/izdavanje-resenja-potvrdjivanje-validnosti-hidrografskih-podataka/potvrdjivanje-validnosti-hidrografskih-podataka-uputstvo-za-plan.pdf</a></p>	[{"link": "https://www.plovput.rs/file/usluge/izdavanje-resenja-potvrdjivanje-validnosti-hidrografskih-podataka/potvrdjivanje-validnosti-hidrografskih-podataka-uputstvo-za-plan.pdf", "type": "url", "placeholder": "@link1@"}]	\N	t
21	LGEGBEYJRBTEZZTY	2023-05-22 08:07:53	2023-05-23 12:53:50	\N	2	Kako je moguće pronaći izgubljeni prtljag na aerodormu Nikola Tesla Beograd?	<p>U slučaju da prtljag nije stigao u Beograd, a putovali ste stranim avio-kompanijama obratite se Službi traganja za prtljagom sa avio kartom, služba se nalazi neposredno pored trake za preuzimanje prtljaga ili putem mail adrese: <a href="mailto:lostandfound@sky-partner.rs">lostandfound@sky-partner.rs</a> putem ili putem telefona <a href="tel:+381 64 6419 025">+381 64 6419 025</a>. Ukoliko ste putovali nacionalnom avio-kompanijom Air Serbia možete se obratiti putem mail adrese: <a href="mailto:baggagestervice@airserbia.com">baggagestervice@airserbia.com</a>.</p>	[{"link": "lostandfound@sky-partner.rs", "type": "email", "placeholder": "@email1@"}, {"link": "baggagestervice@airserbia.com", "type": "email", "placeholder": "@email2@"}, {"link": "+381 64 6419 025", "type": "phone", "placeholder": "@phone1@"}]	\N	t
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: question_examples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.question_examples_id_seq', 321, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.questions_id_seq', 213, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: question_examples question_examples_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.question_examples
    ADD CONSTRAINT question_examples_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: ix_events_sender_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX ix_events_sender_id ON public.events USING btree (sender_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: question_examples question_examples_question_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.question_examples
    ADD CONSTRAINT question_examples_question_id_foreign FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: questions questions_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       