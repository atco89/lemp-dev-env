--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
    links jsonb NOT NULL,
    attachments jsonb NOT NULL,
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
1	EIFNUZIXZUCSLIF6	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Direkcija za vodne puteve
2	H4LDFUZ3A04XVIO7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za vazdušni saobraćaj i transport opasne robe
3	TRN4FOSJIOE9ZK17	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za vodni saobraćaj i bezbednost plovidbe
4	C5YBCSF4HJTNBC3Y	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za građevinske poslove, sprovođenje objedinjene procedure i ozakonjenje
5	PBZMZWQWSRLABP8Y	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za drumski transport, puteve i bezbednost saobraćaja
6	0CLPRZ8CCZIKSVB7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za železnice i intermodalni transport
7	JBGBXHFYTMBLJOZE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za inspekcijski nadzor
8	B2GB8YQZWIOMQWSF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za prostorno planiranje i urbanizam
9	V9U9ZF4EH0CWR9CK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Sektor za stambenu i arhitektonsku politiku, komunalne delatnosti i energetsku efikasnost
10	WLUD3LCOAC5GVD9E	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Uprava za utvrđivanje sposobnosti brodova za plovidbu
11	IYNWZESMZFWHV5T7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Putevi Srbije
12	RBLVDMEF54YVQ7JX	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Rukovodstvo
13	CC5PZDNKZCCMVAX3	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	Čista Srbija
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.events (id, sender_id, type_name, "timestamp", intent_name, action_name, data) FROM stdin;
1	5b05edaa899949e5b87d9542b9c42571	action	1687887695.9282765	\N	action_session_start	{"event": "action", "timestamp": 1687887695.9282765, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_session_start", "policy": null, "confidence": 1.0, "action_text": null, "hide_rule_turn": false}
2	5b05edaa899949e5b87d9542b9c42571	session_started	1687887695.928512	\N	\N	{"event": "session_started", "timestamp": 1687887695.928512, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}}
3	5b05edaa899949e5b87d9542b9c42571	action	1687887695.928539	\N	action_listen	{"event": "action", "timestamp": 1687887695.928539, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": null, "confidence": null, "action_text": null, "hide_rule_turn": false}
4	5b05edaa899949e5b87d9542b9c42571	user	1687887697.4878192	welcome	\N	{"event": "user", "timestamp": 1687887697.4878192, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "/welcome", "parse_data": {"intent": {"name": "welcome", "confidence": 1.0}, "entities": [], "text": "/welcome", "message_id": "5f4636fb54fe434eab39e8463dfcdeb6", "metadata": {}, "intent_ranking": [{"name": "welcome", "confidence": 1.0}]}, "input_channel": "socketio", "message_id": "5f4636fb54fe434eab39e8463dfcdeb6"}
5	5b05edaa899949e5b87d9542b9c42571	user_featurization	1687887697.4994137	\N	\N	{"event": "user_featurization", "timestamp": 1687887697.4994137, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "use_text_for_featurization": false}
6	5b05edaa899949e5b87d9542b9c42571	action	1687887697.4994397	\N	utter_welcome	{"event": "action", "timestamp": 1687887697.4994397, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "utter_welcome", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
7	5b05edaa899949e5b87d9542b9c42571	bot	1687887697.4996638	\N	\N	{"event": "bot", "timestamp": 1687887697.4996638, "metadata": {"utter_action": "utter_welcome", "model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "Zdravo, ja sam Jasna, digitalni asistent Ministarstva gra\\u0111evinarstva, saobra\\u0107aja i infrastrukture. Trenutno se nalazim u test fazi, tako da Vas molim da mi ne zamerite ako nemam odgovor na svako od va\\u0161ih pitanja ili ako vam ponekad dam neta\\u010dan odgovor.\\n\\nKako mogu da Vam pomognem?", "data": {"elements": null, "quick_replies": null, "buttons": null, "attachment": null, "image": null, "custom": null}}
8	5b05edaa899949e5b87d9542b9c42571	action	1687887697.5130033	\N	action_listen	{"event": "action", "timestamp": 1687887697.5130033, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
9	5b05edaa899949e5b87d9542b9c42571	user	1687887733.9533718	faq12	\N	{"event": "user", "timestamp": 1687887733.9533718, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "Ko je ministar?", "parse_data": {"intent": {"name": "faq12", "confidence": 0.9996628761291504}, "entities": [], "text": "Ko je ministar?", "message_id": "767d4f53e1a84566b88c5fbdaea75f65", "metadata": {}, "text_tokens": [[0, 2], [3, 5], [6, 14], [14, 15]], "intent_ranking": [{"name": "faq12", "confidence": 0.9996628761291504}, {"name": "faq9", "confidence": 0.0002077163226203993}, {"name": "faq8", "confidence": 9.304934792453423e-05}, {"name": "welcome", "confidence": 1.66607915161876e-05}, {"name": "faq11", "confidence": 4.188712409813888e-06}, {"name": "faq6", "confidence": 4.130305569560733e-06}, {"name": "faq10", "confidence": 2.854111926353653e-06}, {"name": "thanks_goodbye", "confidence": 2.548717020545155e-06}, {"name": "faq4", "confidence": 1.8015150544670178e-06}, {"name": "goodbye", "confidence": 1.3688562603419996e-06}], "response_selector": {"all_retrieval_intents": ["faq5", "faq12", "faq11", "faq6", "faq9", "faq2", "faq4", "faq7", "faq8", "faq10", "faq3", "faq13", "faq1"], "faq1": {"response": {"responses": [{"text": "Organizaciju lokalne linijske plovidbe ure\\u0111uje i obezbe\\u0111uje jedinica lokalne samouprave na \\u010dijoj teritoriji se obavlja lokalna linijska plovidba. Direkcija za vodne puteve izdaje uslove za izradu tehni\\u010dke dokumentacije za postavljanje plutaju\\u0107ih objekata za pristajanje plovila koja vr\\u0161e prevoz putnika u doma\\u0107oj linijskoj plovidbi na me\\u0111unarodnim i me\\u0111udr\\u017eavnim vodnim putevima, kao i saglasnost na ura\\u0111enu tehni\\u010dku dokumentaciju. Za vi\\u0161e informacija posetitie sajt Direkcije za voden puteve [https://www.plovput.rs](https://www.plovput.rs) ili ih kontaktirajte, telefon +381 11 30 29 800."}], "confidence": 0.5340937376022339, "intent_response_key": "faq1/ask_NTXUEIWZ1BV5U3WI", "utter_action": "utter_faq1/ask_NTXUEIWZ1BV5U3WI"}, "ranking": [{"confidence": 0.5340937376022339, "intent_response_key": "faq1/ask_NTXUEIWZ1BV5U3WI"}, {"confidence": 0.07684088498353958, "intent_response_key": "faq1/ask_6V23P2XXETN5BPII"}, {"confidence": 0.07328048348426819, "intent_response_key": "faq1/ask_LSWDI4ER3W2ADIXX"}, {"confidence": 0.07011422514915466, "intent_response_key": "faq1/ask_WMUFIMRDUDOJIDOT"}, {"confidence": 0.05218314379453659, "intent_response_key": "faq1/ask_0GQD9NLEHEQNK0JL"}, {"confidence": 0.04940897598862648, "intent_response_key": "faq1/ask_WF8STAMPEKQNWDDG"}, {"confidence": 0.03229641169309616, "intent_response_key": "faq1/ask_9Q6U8UN7LXBBPD51"}, {"confidence": 0.028956890106201172, "intent_response_key": "faq1/ask_IQBMLB9RL8HT9BVS"}, {"confidence": 0.01632986031472683, "intent_response_key": "faq1/ask_LPMIAYYRFRDMJW7R"}, {"confidence": 0.012860504910349846, "intent_response_key": "faq1/ask_CHUMC2HWXE3AXK0V"}]}, "faq2": {"response": {"responses": [{"text": "Svi voza\\u010di koji prevoze opasnu robu moraju posedovati ADR sertifikat za voza\\u010da vozila koje prevozi opasnu robu drumom. Izuzetak su prevozi koji se obavljaju po izuze\\u0107ima prema 1.1.3.6, 3.4 ili 3.5 ADR multilateralni sporazum o transportu opasne robe drumom. U ovim slu\\u010dajevima anga\\u017eovani savetnik za bezbednost u transportu opasne robe u drumskom saobra\\u0107aju odre\\u0111uje da za prevoz nije potrebno anga\\u017eovati voza\\u010da sa ADR sertifikatom za voza\\u010da vozila za prevoz opasne robe, ve\\u0107 voza\\u010da koji je pro\\u0161ao obuku od strane savetnika za bezbednost u transportu opasne robe. Za detaljnije informacije posetite link AMMS a **[https://amss-cmv.co.rs/adr1/](https://amss-cmv.co.rs/adr1/)**."}], "confidence": 0.30359581112861633, "intent_response_key": "faq2/ask_TIBRMPXZAOTDGGGV", "utter_action": "utter_faq2/ask_TIBRMPXZAOTDGGGV"}, "ranking": [{"confidence": 0.30359581112861633, "intent_response_key": "faq2/ask_TIBRMPXZAOTDGGGV"}, {"confidence": 0.1671232134103775, "intent_response_key": "faq2/ask_WLBHZ0OVV3Z8KWQI"}, {"confidence": 0.1296747773885727, "intent_response_key": "faq2/ask_H7EOXIC29GCNUT87"}, {"confidence": 0.09473087638616562, "intent_response_key": "faq2/ask_KAQCV18T1YTWI9OK"}, {"confidence": 0.05863960459828377, "intent_response_key": "faq2/ask_UGALQEUGJWXFT1WZ"}, {"confidence": 0.05580450966954231, "intent_response_key": "faq2/ask_EECP913SRYOZIZB0"}, {"confidence": 0.05555292218923569, "intent_response_key": "faq2/ask_BZNLMOUM96THDWN3"}, {"confidence": 0.052445415407419205, "intent_response_key": "faq2/ask_X581CYNUM5YO5DI9"}, {"confidence": 0.04120608791708946, "intent_response_key": "faq2/ask_KL4CJBS68CXAMXJO"}, {"confidence": 0.024110212922096252, "intent_response_key": "faq2/ask_FVICYYYZI9XA0VHB"}]}, "faq3": {"response": {"responses": [{"text": "Uprava za utvr\\u0111ivanje sposobnosti brodova za plovidbu, koja je organ uprave u sastavu ovog ministarstva vr\\u0161i preglede brodova unutra\\u0161nje plovidbe. Sedi\\u0161te Uprave je na Novom Beogradu, ulica Narodnih heroja 30. Za dodatne informacije posetite sajt **[http://uprava-brodova.gov.rs/registar_stage/cir](http://uprava-brodova.gov.rs/registar_stage/cir)**."}], "confidence": 0.127725750207901, "intent_response_key": "faq3/ask_7LM1C2QNVC8W9PC8", "utter_action": "utter_faq3/ask_7LM1C2QNVC8W9PC8"}, "ranking": [{"confidence": 0.127725750207901, "intent_response_key": "faq3/ask_7LM1C2QNVC8W9PC8"}, {"confidence": 0.11210279911756516, "intent_response_key": "faq3/ask_WNQSHPFE1UA7TCRU"}, {"confidence": 0.1115138903260231, "intent_response_key": "faq3/ask_7UP4TXQMIP1I0XBF"}, {"confidence": 0.09241607040166855, "intent_response_key": "faq3/ask_LIMGCDSMSLNDT19Q"}, {"confidence": 0.0829324871301651, "intent_response_key": "faq3/ask_YTUKVR5OATW79BR7"}, {"confidence": 0.08122637867927551, "intent_response_key": "faq3/ask_PHFZ5HWV5P11DRRX"}, {"confidence": 0.06552120298147202, "intent_response_key": "faq3/ask_ZLNHTIYKND9K8B8S"}, {"confidence": 0.04041362181305885, "intent_response_key": "faq3/ask_SJFTCNMS1PAGG34D"}, {"confidence": 0.03682774305343628, "intent_response_key": "faq3/ask_SIMGD2WLADFGDWSR"}, {"confidence": 0.03530938923358917, "intent_response_key": "faq3/ask_TILVDKJVSKGAGI10"}]}, "faq4": {"response": {"responses": [{"text": "Stranka u postupku izdavanja gra\\u0111evinske dozvole je investitor, te ne postoji mogu\\u0107nost priznavanja svojstva stranke u postupku izdavanja gra\\u0111evinske dozvole tre\\u0107im licima."}], "confidence": 0.08519020676612854, "intent_response_key": "faq4/ask_YKTTDZ2OF0IBVFBL", "utter_action": "utter_faq4/ask_YKTTDZ2OF0IBVFBL"}, "ranking": [{"confidence": 0.08519020676612854, "intent_response_key": "faq4/ask_YKTTDZ2OF0IBVFBL"}, {"confidence": 0.07787143439054489, "intent_response_key": "faq4/ask_JVL9KLTSWATYN7NS"}, {"confidence": 0.06255699694156647, "intent_response_key": "faq4/ask_JSO7A4GBJQO1P7JT"}, {"confidence": 0.040544815361499786, "intent_response_key": "faq4/ask_DV9OI0I1PLUHMA6Q"}, {"confidence": 0.03851839154958725, "intent_response_key": "faq4/ask_K5HUFKW9J3KOE7XU"}, {"confidence": 0.03845867142081261, "intent_response_key": "faq4/ask_VMN8KWNLM9NNHIQI"}, {"confidence": 0.036727115511894226, "intent_response_key": "faq4/ask_CRAARH8ID6ESFE1H"}, {"confidence": 0.030099842697381973, "intent_response_key": "faq4/ask_9Z25ESETUUR9FILE"}, {"confidence": 0.028956061229109764, "intent_response_key": "faq4/ask_4HLAYCOLDH1ICCXD"}, {"confidence": 0.02677866816520691, "intent_response_key": "faq4/ask_IKAVLXEKJASTM7F0"}]}, "faq5": {"response": {"responses": [{"text": "Za popravku ulica i op\\u0161tinskih puteva nadle\\u017ena je jedinica lokalne samouprave. Za dodatne informacije obratite se Grupi za odr\\u017eavanje puteva na broj telefona 011/2609425 radnim danima od 10 do 13 \\u010dasova, 011/2608729 radnim danima od 10 do 13 \\u010dasova, a mo\\u017eete pisati i na imejl adresu **[drumski.putevi@mgsi.gov.rs](mailto:mailto:drumski.putevi@mgsi.gov.rs)**."}], "confidence": 0.07350467145442963, "intent_response_key": "faq5/ask_WCYKOGAZAVHBHCBH", "utter_action": "utter_faq5/ask_WCYKOGAZAVHBHCBH"}, "ranking": [{"confidence": 0.07350467145442963, "intent_response_key": "faq5/ask_WCYKOGAZAVHBHCBH"}, {"confidence": 0.06676988303661346, "intent_response_key": "faq5/ask_LIHCOOOVYO7DNLUT"}, {"confidence": 0.03574753552675247, "intent_response_key": "faq5/ask_SQPURDHRMZMCEYIU"}, {"confidence": 0.03531041368842125, "intent_response_key": "faq5/ask_UGY6SGPQYVEX8QRZ"}, {"confidence": 0.031773194670677185, "intent_response_key": "faq5/ask_FJ9983IGK8LXRMKO"}, {"confidence": 0.031137648969888687, "intent_response_key": "faq5/ask_J64HV7Q6GQWOAYFH"}, {"confidence": 0.030757389962673187, "intent_response_key": "faq5/ask_M1UER8CUPTVSUCLH"}, {"confidence": 0.028996959328651428, "intent_response_key": "faq5/ask_7BRHXPXVSNHRQVW6"}, {"confidence": 0.027858730405569077, "intent_response_key": "faq5/ask_CUI10QSDUYDMHAND"}, {"confidence": 0.02486715093255043, "intent_response_key": "faq5/ask_HT7KMFIKCWXEQX3P"}]}, "faq6": {"response": {"responses": [{"text": "Va\\u0161u prijavu za posao mo\\u017eete na\\u0107i i poslati preko sajta Srbija Voza u delu Karijera **[https://srbijavoz.rs/karijera/](https://srbijavoz.rs/karijera/)**."}], "confidence": 0.11160926520824432, "intent_response_key": "faq6/ask_IEJF7FLOQ8HZZBB5", "utter_action": "utter_faq6/ask_IEJF7FLOQ8HZZBB5"}, "ranking": [{"confidence": 0.11160926520824432, "intent_response_key": "faq6/ask_IEJF7FLOQ8HZZBB5"}, {"confidence": 0.05886213481426239, "intent_response_key": "faq6/ask_ODTCSMNUBPC4FXKJ"}, {"confidence": 0.05872861668467522, "intent_response_key": "faq6/ask_ORKRS8HN4DZYENNH"}, {"confidence": 0.05008484050631523, "intent_response_key": "faq6/ask_0JLGSO4AGBTDL70N"}, {"confidence": 0.043667878955602646, "intent_response_key": "faq6/ask_477JFVYKU8D9R0ZS"}, {"confidence": 0.036816615611314774, "intent_response_key": "faq6/ask_QGEF4MES9JLHIYGU"}, {"confidence": 0.02792983129620552, "intent_response_key": "faq6/ask_ZHXTT8K29GOZULO0"}, {"confidence": 0.027873080223798752, "intent_response_key": "faq6/ask_3MVFLD5Y6CJI5UIQ"}, {"confidence": 0.02670285850763321, "intent_response_key": "faq6/ask_91YZ94FBI89WK1D1"}, {"confidence": 0.026580166071653366, "intent_response_key": "faq6/ask_TDIKR3BFQR00NM8T"}]}, "faq7": {"response": {"responses": [{"text": "Prevoznik je u obavezi da putniku izda voznu kartu sa svim podacima propisanim Zakonom."}], "confidence": 0.3625633120536804, "intent_response_key": "faq7/ask_OTFWZODLTMWKHTQH", "utter_action": "utter_faq7/ask_OTFWZODLTMWKHTQH"}, "ranking": [{"confidence": 0.3625633120536804, "intent_response_key": "faq7/ask_OTFWZODLTMWKHTQH"}, {"confidence": 0.1396915167570114, "intent_response_key": "faq7/ask_XEDADTPDNKNS7GP8"}, {"confidence": 0.06870966404676437, "intent_response_key": "faq7/ask_NWXMWX2J0MUO6ASR"}, {"confidence": 0.05935860425233841, "intent_response_key": "faq7/ask_CQHWO0QMAXQGGQZJ"}, {"confidence": 0.05778009444475174, "intent_response_key": "faq7/ask_RGSLRV9EUZPZXBLI"}, {"confidence": 0.04905210807919502, "intent_response_key": "faq7/ask_Q6CMQ7E6TL2GHIXT"}, {"confidence": 0.04040010645985603, "intent_response_key": "faq7/ask_JCZQTPSAD8GP0RMB"}, {"confidence": 0.032224807888269424, "intent_response_key": "faq7/ask_8C7AF4HSLLLD4R5T"}, {"confidence": 0.025155939161777496, "intent_response_key": "faq7/ask_2SCXLXELIEP9JK4J"}, {"confidence": 0.020439233630895615, "intent_response_key": "faq7/ask_TVNLONV5FJDQZSGR"}]}, "faq8": {"response": {"responses": [{"text": "Zakonom o planiranju i izgradnji **[https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji](https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji)** i propisima donetim na osnovu ovog zakona propisano je da se javnim ogla\\u0161avanjem u dnevnom listu za teritoriju Republike Srbije, lokalnom listu, zvani\\u010dnoj internet stranici nosioca izrade planskih dokumenata, smatra da je javnost obave\\u0161tena. Izuzetak je kada se radi o izradi urbanisti\\u010dkog projekta za potrebe utvrdjivanja javnog interesa, kada se vr\\u0161i neposredno obave\\u0161tavanje sopstvenika nepokretnosti u obuhvatu urbanisti\\u010dkog projekta."}], "confidence": 0.8355056047439575, "intent_response_key": "faq8/ask_MPDEBWKWPOXVBA7Q", "utter_action": "utter_faq8/ask_MPDEBWKWPOXVBA7Q"}, "ranking": [{"confidence": 0.8355056047439575, "intent_response_key": "faq8/ask_MPDEBWKWPOXVBA7Q"}, {"confidence": 0.03363028168678284, "intent_response_key": "faq8/ask_3SUNMWSAKRSUGT7S"}, {"confidence": 0.028774335980415344, "intent_response_key": "faq8/ask_F378VLAMXQLNJJI1"}, {"confidence": 0.028484774753451347, "intent_response_key": "faq8/ask_FEOUIY9BRCMUS16B"}, {"confidence": 0.022607598453760147, "intent_response_key": "faq8/ask_WJRIKDJBTE1DPKFO"}, {"confidence": 0.013453778810799122, "intent_response_key": "faq8/ask_SWRRN6DD4VIT6WNG"}, {"confidence": 0.012759977020323277, "intent_response_key": "faq8/ask_SPBLRA3QQQVUMJZ8"}, {"confidence": 0.00873537641018629, "intent_response_key": "faq8/ask_ACA3FWHNUCNNWA8D"}, {"confidence": 0.008420881815254688, "intent_response_key": "faq8/ask_DBT4SYOSWBIMJD0O"}, {"confidence": 0.007627385668456554, "intent_response_key": "faq8/ask_F0TA5GMKXJ1GJN8R"}]}, "faq9": {"response": {"responses": [{"text": "Shodno \\u010dlanu 8. Zakona o komunalnim delatnostima **[https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg](https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg)**Slu\\u017ebeni glasnik RS, br. 88/11, 104/16 i 95/18 jedinica lokalne samouprave dostavlja Ministarstvu gra\\u0111evinarstva, saobra\\u0107aja i infrastrukture u daljem tekstu Ministarstvo izve\\u0161taj o komunalnim delatnostima za prethodnu godinu, izuzev vr\\u0161ioca komunalne delatnosti pogrebna delatnost koji su u obavezi da Ministarstvu dostave izve\\u0161taj, na propisanom obrascu, u vezi sa obavljanjem te komunalne delatnosti. Napominjemo, da je vr\\u0161ilac komunalne delatnosti du\\u017ean da na zahtev Ministarstva dostavi Ministarstvu podatke i obave\\u0161tenja u vezi sa obavljanjem komunalnih delatnosti u roku od 15 dana od dana prijema zahteva Ministarstva."}], "confidence": 0.3139556348323822, "intent_response_key": "faq9/ask_SCPFOQBU5REHL19H", "utter_action": "utter_faq9/ask_SCPFOQBU5REHL19H"}, "ranking": [{"confidence": 0.3139556348323822, "intent_response_key": "faq9/ask_SCPFOQBU5REHL19H"}, {"confidence": 0.15697337687015533, "intent_response_key": "faq9/ask_4W4REP0LBHIQ5GU9"}, {"confidence": 0.10294682532548904, "intent_response_key": "faq9/ask_8OOFAY8DQPIG5WWD"}, {"confidence": 0.10127992928028107, "intent_response_key": "faq9/ask_DRI7YOETKLYRS1QF"}, {"confidence": 0.09331517666578293, "intent_response_key": "faq9/ask_BH0QRNLTJ9YLPYS7"}, {"confidence": 0.0810718908905983, "intent_response_key": "faq9/ask_TDJTTHHFK1NESMGD"}, {"confidence": 0.04022865369915962, "intent_response_key": "faq9/ask_DQJAX2OTTIXIMMJY"}, {"confidence": 0.039250001311302185, "intent_response_key": "faq9/ask_NJ0YZLZH7YSVYI5V"}, {"confidence": 0.03173401951789856, "intent_response_key": "faq9/ask_SYNS9HEOXDNMP69P"}, {"confidence": 0.019838061183691025, "intent_response_key": "faq9/ask_CZJLIIYN4RZ82YBM"}]}, "faq10": {"response": {"responses": [{"text": "Uprava pregleda samo tehni\\u010dku dokumentaciju koju izra\\u0111uje uslu\\u017eno privredno dru\\u0161tvo, a koje ima za to odobrenje od strane Uprave. Spisak izdatih odobrenja za dru\\u0161tva koja izra\\u0111uju tehni\\u010dku dokumentaciju je objavljen na sajtu Uprave za utvr\\u0111ivanje sposobnosti brodova za plovidbu."}], "confidence": 0.2589671313762665, "intent_response_key": "faq10/ask_FTMFDOOVWGCFDEKT", "utter_action": "utter_faq10/ask_FTMFDOOVWGCFDEKT"}, "ranking": [{"confidence": 0.2589671313762665, "intent_response_key": "faq10/ask_FTMFDOOVWGCFDEKT"}, {"confidence": 0.19375409185886383, "intent_response_key": "faq10/ask_8IA91SE72HDI9KPD"}, {"confidence": 0.1371743381023407, "intent_response_key": "faq10/ask_SHKXXAZDHXUJ9OFB"}, {"confidence": 0.0933339074254036, "intent_response_key": "faq10/ask_AQPIJEK0NWMS290P"}, {"confidence": 0.0785849392414093, "intent_response_key": "faq10/ask_MUUBDJCK0QLP101T"}, {"confidence": 0.044920410960912704, "intent_response_key": "faq10/ask_XQTXM5VUTSOEULZI"}, {"confidence": 0.03964444622397423, "intent_response_key": "faq10/ask_LZKA3TBTIUXZK6UC"}, {"confidence": 0.03801583871245384, "intent_response_key": "faq10/ask_UZSDBS1GKLD1YSBB"}, {"confidence": 0.02319546602666378, "intent_response_key": "faq10/ask_TW7XVIYHCEFFURUE"}, {"confidence": 0.021189123392105103, "intent_response_key": "faq10/ask_XNSMCV9XBKOSL4JB"}]}, "faq11": {"response": {"responses": [{"text": "Broj telefona je 0800-100-104, [info.centar@putevi-srbije.rs](mailto:info.centar@putevi-srbije.rs)."}], "confidence": 0.16303975880146027, "intent_response_key": "faq11/ask_HGJFQWAOBSLLGUQY", "utter_action": "utter_faq11/ask_HGJFQWAOBSLLGUQY"}, "ranking": [{"confidence": 0.16303975880146027, "intent_response_key": "faq11/ask_HGJFQWAOBSLLGUQY"}, {"confidence": 0.11572693288326263, "intent_response_key": "faq11/ask_2EEHNCGGHAFMQKMV"}, {"confidence": 0.08238258212804794, "intent_response_key": "faq11/ask_HUTYMYPZPOY0S7GN"}, {"confidence": 0.0499563068151474, "intent_response_key": "faq11/ask_NLU6TVEBNML76R6W"}, {"confidence": 0.04897033050656319, "intent_response_key": "faq11/ask_HONIOUUZJAKFOAAC"}, {"confidence": 0.047665275633335114, "intent_response_key": "faq11/ask_OTCY5SKPIZ34ZYBV"}, {"confidence": 0.04356082156300545, "intent_response_key": "faq11/ask_1BRDTMOZ51EID7DM"}, {"confidence": 0.03921999782323837, "intent_response_key": "faq11/ask_HHJTTCHLXNHUPTXF"}, {"confidence": 0.032818716019392014, "intent_response_key": "faq11/ask_L02VL9RGLRICOYZS"}, {"confidence": 0.02906716987490654, "intent_response_key": "faq11/ask_DF9U5TEETPML2APH"}]}, "faq12": {"response": {"responses": [{"text": "Ministar gradjevinarstva, saobra\\u0107aja i infrastrukture je Goran Vesi\\u0107. [https://www.srbija.gov.rs/biografija/195190/goran-vesic.php](https://www.srbija.gov.rs/biografija/195190/goran-vesic.php)."}], "confidence": 0.993378758430481, "intent_response_key": "faq12/ask_BJDSUKUWYZ38ZI0P", "utter_action": "utter_faq12/ask_BJDSUKUWYZ38ZI0P"}, "ranking": [{"confidence": 0.993378758430481, "intent_response_key": "faq12/ask_BJDSUKUWYZ38ZI0P"}, {"confidence": 0.002231819787994027, "intent_response_key": "faq12/ask_SJJBHHKDYP2O18ZD"}, {"confidence": 0.0012607232201844454, "intent_response_key": "faq12/ask_GMLPPXUYCXHWOBBN"}, {"confidence": 0.001027755788527429, "intent_response_key": "faq12/ask_BBCEV5LTTKOPHQOV"}, {"confidence": 0.0008257376030087471, "intent_response_key": "faq12/ask_ZIPS4GOGFSUZQZNH"}, {"confidence": 0.0004486863617785275, "intent_response_key": "faq12/ask_EOSAUKNEBLDTYHDL"}, {"confidence": 0.00022427996736951172, "intent_response_key": "faq12/ask_JERBQGCMXZJRWKF9"}, {"confidence": 0.00013517179468180984, "intent_response_key": "faq12/ask_WWS48MTDQF8AX7LQ"}, {"confidence": 0.00012018484267173335, "intent_response_key": "faq12/ask_77XT7W7UNTJHB3GC"}, {"confidence": 9.849650086835027e-05, "intent_response_key": "faq12/ask_KE3ZXYDGDOX1H3KM"}]}, "faq13": {"response": {"responses": [{"text": "Projekat podrazumeva izgradnju postrojenja za pre\\u010di\\u0161\\u0107avanja otpadnih voda, kanalizacione mre\\u017ee i pumpnih stanica u 65 gradova i op\\u0161tina, odnosno na 89 lokacija u Republici Srbiji \\u0161to uklju\\u010duje 157 postrojenja za preradu otpadnih voda ukupnog kapaciteta 2.326.000 ekvivalenta stanovnika i 5.206.679,31 m cevi kanalizacione mre\\u017ee. Vi\\u0161e informacija na [https://cistasrbija.rs](https://cistasrbija.rs)."}], "confidence": 0.35675114393234253, "intent_response_key": "faq13/ask_J1I064RMWOMCQ4RG", "utter_action": "utter_faq13/ask_J1I064RMWOMCQ4RG"}, "ranking": [{"confidence": 0.35675114393234253, "intent_response_key": "faq13/ask_J1I064RMWOMCQ4RG"}, {"confidence": 0.24083475768566132, "intent_response_key": "faq13/ask_NKTDTR670XCR2OOO"}, {"confidence": 0.11284816265106201, "intent_response_key": "faq13/ask_XGWZFYLIZI3559FB"}, {"confidence": 0.10695797204971313, "intent_response_key": "faq13/ask_GWPRTOHGYAEOBRTS"}, {"confidence": 0.08763565123081207, "intent_response_key": "faq13/ask_Q8ULTUIL1AE72WRA"}, {"confidence": 0.038400210440158844, "intent_response_key": "faq13/ask_J42C15B9ZDLYWIGO"}, {"confidence": 0.029883813112974167, "intent_response_key": "faq13/ask_0O14YHMZQVWFRJXG"}, {"confidence": 0.026688246056437492, "intent_response_key": "faq13/ask_LRPIDEWTGJH49K5U"}]}}}, "input_channel": "socketio", "message_id": "767d4f53e1a84566b88c5fbdaea75f65"}
10	5b05edaa899949e5b87d9542b9c42571	user_featurization	1687887733.9636393	\N	\N	{"event": "user_featurization", "timestamp": 1687887733.9636393, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "use_text_for_featurization": false}
11	5b05edaa899949e5b87d9542b9c42571	action	1687887733.9636662	\N	utter_faq12	{"event": "action", "timestamp": 1687887733.9636662, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "utter_faq12", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": false}
12	5b05edaa899949e5b87d9542b9c42571	bot	1687887733.963893	\N	\N	{"event": "bot", "timestamp": 1687887733.963893, "metadata": {"utter_action": "utter_faq12/ask_BJDSUKUWYZ38ZI0P", "model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "Ministar gradjevinarstva, saobra\\u0107aja i infrastrukture je Goran Vesi\\u0107. [https://www.srbija.gov.rs/biografija/195190/goran-vesic.php](https://www.srbija.gov.rs/biografija/195190/goran-vesic.php).", "data": {"elements": null, "quick_replies": null, "buttons": null, "attachment": null, "image": null, "custom": null}}
13	5b05edaa899949e5b87d9542b9c42571	action	1687887733.9753928	\N	action_listen	{"event": "action", "timestamp": 1687887733.9753928, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": false}
14	3dc6954202454fd18b0280d62e107e60	action	1687938642.1193814	\N	action_session_start	{"event": "action", "timestamp": 1687938642.1193814, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_session_start", "policy": null, "confidence": 1.0, "action_text": null, "hide_rule_turn": false}
15	3dc6954202454fd18b0280d62e107e60	session_started	1687938642.1195996	\N	\N	{"event": "session_started", "timestamp": 1687938642.1195996, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}}
16	3dc6954202454fd18b0280d62e107e60	action	1687938642.1196241	\N	action_listen	{"event": "action", "timestamp": 1687938642.1196241, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": null, "confidence": null, "action_text": null, "hide_rule_turn": false}
17	3dc6954202454fd18b0280d62e107e60	user	1687938642.2348151	welcome	\N	{"event": "user", "timestamp": 1687938642.2348151, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "/welcome", "parse_data": {"intent": {"name": "welcome", "confidence": 1.0}, "entities": [], "text": "/welcome", "message_id": "77dd98b0564e4b109bc7d21c98bfb915", "metadata": {}, "intent_ranking": [{"name": "welcome", "confidence": 1.0}]}, "input_channel": "socketio", "message_id": "77dd98b0564e4b109bc7d21c98bfb915"}
18	3dc6954202454fd18b0280d62e107e60	user_featurization	1687938642.2441254	\N	\N	{"event": "user_featurization", "timestamp": 1687938642.2441254, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "use_text_for_featurization": false}
19	3dc6954202454fd18b0280d62e107e60	action	1687938642.2441516	\N	utter_welcome	{"event": "action", "timestamp": 1687938642.2441516, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "utter_welcome", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
20	3dc6954202454fd18b0280d62e107e60	bot	1687938642.244381	\N	\N	{"event": "bot", "timestamp": 1687938642.244381, "metadata": {"utter_action": "utter_welcome", "model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "Zdravo, ja sam Jasna, digitalni asistent Ministarstva gra\\u0111evinarstva, saobra\\u0107aja i infrastrukture. Trenutno se nalazim u test fazi, tako da Vas molim da mi ne zamerite ako nemam odgovor na svako od va\\u0161ih pitanja ili ako vam ponekad dam neta\\u010dan odgovor.\\n\\nKako mogu da Vam pomognem?", "data": {"elements": null, "quick_replies": null, "buttons": null, "attachment": null, "image": null, "custom": null}}
21	3dc6954202454fd18b0280d62e107e60	action	1687938642.255001	\N	action_listen	{"event": "action", "timestamp": 1687938642.255001, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
22	9a87335d384440508687f4104ef0df7a	action	1687969736.4781163	\N	action_session_start	{"event": "action", "timestamp": 1687969736.4781163, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_session_start", "policy": null, "confidence": 1.0, "action_text": null, "hide_rule_turn": false}
23	9a87335d384440508687f4104ef0df7a	session_started	1687969736.478333	\N	\N	{"event": "session_started", "timestamp": 1687969736.478333, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}}
24	9a87335d384440508687f4104ef0df7a	action	1687969736.4783573	\N	action_listen	{"event": "action", "timestamp": 1687969736.4783573, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": null, "confidence": null, "action_text": null, "hide_rule_turn": false}
25	9a87335d384440508687f4104ef0df7a	user	1687969736.587536	welcome	\N	{"event": "user", "timestamp": 1687969736.587536, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "/welcome", "parse_data": {"intent": {"name": "welcome", "confidence": 1.0}, "entities": [], "text": "/welcome", "message_id": "d8cc43812ae84bf6bf046b755bce420c", "metadata": {}, "intent_ranking": [{"name": "welcome", "confidence": 1.0}]}, "input_channel": "socketio", "message_id": "d8cc43812ae84bf6bf046b755bce420c"}
26	9a87335d384440508687f4104ef0df7a	user_featurization	1687969736.596448	\N	\N	{"event": "user_featurization", "timestamp": 1687969736.596448, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "use_text_for_featurization": false}
27	9a87335d384440508687f4104ef0df7a	action	1687969736.596473	\N	utter_welcome	{"event": "action", "timestamp": 1687969736.596473, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "utter_welcome", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
28	9a87335d384440508687f4104ef0df7a	bot	1687969736.5967205	\N	\N	{"event": "bot", "timestamp": 1687969736.5967205, "metadata": {"utter_action": "utter_welcome", "model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "Zdravo, ja sam Jasna, digitalni asistent Ministarstva gra\\u0111evinarstva, saobra\\u0107aja i infrastrukture. Trenutno se nalazim u test fazi, tako da Vas molim da mi ne zamerite ako nemam odgovor na svako od va\\u0161ih pitanja ili ako vam ponekad dam neta\\u010dan odgovor.\\n\\nKako mogu da Vam pomognem?", "data": {"elements": null, "quick_replies": null, "buttons": null, "attachment": null, "image": null, "custom": null}}
29	9a87335d384440508687f4104ef0df7a	action	1687969736.6069465	\N	action_listen	{"event": "action", "timestamp": 1687969736.6069465, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
30	e0994fb45f9147f486e9060021f7135a	action	1687970261.3308275	\N	action_session_start	{"event": "action", "timestamp": 1687970261.3308275, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_session_start", "policy": null, "confidence": 1.0, "action_text": null, "hide_rule_turn": false}
31	e0994fb45f9147f486e9060021f7135a	session_started	1687970261.3310375	\N	\N	{"event": "session_started", "timestamp": 1687970261.3310375, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}}
32	e0994fb45f9147f486e9060021f7135a	action	1687970261.3310604	\N	action_listen	{"event": "action", "timestamp": 1687970261.3310604, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": null, "confidence": null, "action_text": null, "hide_rule_turn": false}
33	e0994fb45f9147f486e9060021f7135a	user	1687970261.438183	welcome	\N	{"event": "user", "timestamp": 1687970261.438183, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "/welcome", "parse_data": {"intent": {"name": "welcome", "confidence": 1.0}, "entities": [], "text": "/welcome", "message_id": "09ea19bc2aa344ac95b56ae8f6533222", "metadata": {}, "intent_ranking": [{"name": "welcome", "confidence": 1.0}]}, "input_channel": "socketio", "message_id": "09ea19bc2aa344ac95b56ae8f6533222"}
34	e0994fb45f9147f486e9060021f7135a	user_featurization	1687970261.447023	\N	\N	{"event": "user_featurization", "timestamp": 1687970261.447023, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "use_text_for_featurization": false}
35	e0994fb45f9147f486e9060021f7135a	action	1687970261.4470477	\N	utter_welcome	{"event": "action", "timestamp": 1687970261.4470477, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "utter_welcome", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
36	e0994fb45f9147f486e9060021f7135a	bot	1687970261.447271	\N	\N	{"event": "bot", "timestamp": 1687970261.447271, "metadata": {"utter_action": "utter_welcome", "model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "text": "Zdravo, ja sam Jasna, digitalni asistent Ministarstva gra\\u0111evinarstva, saobra\\u0107aja i infrastrukture. Trenutno se nalazim u test fazi, tako da Vas molim da mi ne zamerite ako nemam odgovor na svako od va\\u0161ih pitanja ili ako vam ponekad dam neta\\u010dan odgovor.\\n\\nKako mogu da Vam pomognem?", "data": {"elements": null, "quick_replies": null, "buttons": null, "attachment": null, "image": null, "custom": null}}
37	e0994fb45f9147f486e9060021f7135a	action	1687970261.4572012	\N	action_listen	{"event": "action", "timestamp": 1687970261.4572012, "metadata": {"model_id": "bf4b070fb2e94a3e86e465736d24ca41", "assistant_id": "20230627-164006-many-angel"}, "name": "action_listen", "policy": "RulePolicy", "confidence": 1.0, "action_text": null, "hide_rule_turn": true}
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
8	9TFHQBM5EJZDOSPW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Kako se može doći do Plana obeležavanja Dunava, Save i Tise?
9	TH1LWHMWCL81LGHQ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Gde mogu pogledati Plan obeležavnja Dunava, Save i Tise?
10	BBF54NP83ZUNE9AA	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Na kojoj web adresi mogu preuzeti Plan obeležavanja Dunava, Save i Tise?
11	D53OR6HABGAV8FFR	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Gde se može preuzeti Plan obeležavanja Dunava, Save i Tise?
12	4XTYGFACT3OCRWBL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Da li postoji u elektronskoj formi Plan obeležavanja Dunava, Save i Tise?
13	GWGUG2TAVEEPQOGE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Sa portala Direkcije za vodne puteve su preuzete elektronske plovidbene karte Dunava, Tise i Save, kako mogu da im pristupim?
14	HSMCB6UDUHJ0AGCE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Nakon preuzimanja datoteke elektronskih plovidbenih karata, kako mogu da im pristupiti?
15	LNO0YK8BTUHC0UTJ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Kako mogu preuzeti elektronske plovidbene karte iz datoteke?
16	PXKRFNB2XMBFQO7M	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Na koji način se otvara datoteka za elektronske plovidbene karte na portalu Direkcije za vodne puteve?
17	FVVB5YDFUCYAP4SA	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Koja je procedura za pristup plovidbenim kartama u preuzetoj datoteci sa portala?
18	XKWSOCMYWC4YCQQK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?
19	ANT62SNQJH4LM63H	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Gde se mogu informisati o raspoloživim dubinama na kritičnim mestima za plovidbu?
20	UNE4E6O7ALVSG4L1	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Sa kog linka se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim mestima za plovidbu?
21	Z5QEDAE5F7J80UCV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Da li na sajtu Direkcije za vodne puteve postoje podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?
22	Y4VFPUVNULPAL8DE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Da li na sajtu Direkcije za vodne puteve postoje podaci o raspoloživim dubinama na kritičnim mestima za plovidbu?
23	QPOVN10U3IDBTLU7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Gde mogu da saznam dubine na rekama?
24	8L0KG2DPNHVA8RCG	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Potrebne su mi dubine pri trenutnom vodostaju na kritičnim mestima za plovidbu
25	UPEXX5VTUIWYJIUW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Koje su dubine Dunava, Save i Tise?
26	RA4ENDKZBBNAQA6J	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Koja je dubina Dunava?
27	FBXSEPYRRQTIYKZL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	4	Koja je dubina Save?
28	C70SVO2KECLJMJ3G	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	5	Želim da imam uvid u lokaciju plovila u okviru RIS sistema.
29	8MAVPLDPHPATGEZS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	5	Kako mogu da pristupim RIS sistemu?
30	MIPEQ5GOLZNG5OJL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	5	Koji su uslovi za dobijanje dozvole za pristup RIS sistemu?
31	YIH6RBGFSU2VTSNO	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	5	Da li Direkcija za vodne puteve izdaje odobrenja za uvid u lokacije plovila?
32	DYZ7V59WJMH0ZMNK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	5	Kome Direkcija za vodne puteve daje odobrenje za uvid u lokacije vozila u okviru RIS sitema?
33	Y0Y4MUHC3DGFMV0H	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	5	Potrebna mi je lokacija plovila
34	PGH1BMUQJ1CHRALU	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	6	Potreban mi je uvid u istoriju kretanja plovila koje je izazvalo incident.
35	S7P2RGLI31HZ5OMH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	6	Da li fizička lica mogu pristupiti arhivi kretanja plovila?
36	1HIUDGCLGIFNHLOW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	6	Da li fizička lica imaju mogućnost da pristupe istoriji kretanja plovila koje je izazvalo incident?
37	6TKCMVZHDOP93NQR	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	6	Na koji način mogu imati uvid u istoriju kretanja plovila koje je izazvalo incident?
38	NITGVTVI1KVRWDF7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	6	Koja je procedura za uvid u istoriju kretanja plovila koje je izazvalo incident?
39	DJWTSDU3DVUGFXJA	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Koji organ državne uprave je nadležan za uspostavljanje linijskog rečnog saobraćaja?
40	NYSKFGKP6536IA3Q	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Ko organizuje red vožnje rečnog saobraćaja?
41	U7BXL7WD8JJXDAVS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Koja institucija uređuje domaći rečni saobraćaj?
42	3T45OB5XAKHJJXVB	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Ko uspostavlja linijski rečni saobraćaj?
43	TVWDMEXYFTMOOD8T	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	U čijoj nadležnosti je uspostavljanje linijskog rečnog saobraćaja?
44	B4YXI0BCSTIP2SHK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Kako da registrujem liniju u vodnom saobraćaju?
45	YG3XVKRJIG0FU6HL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Kako da registrujem liniju u rečnom saobraćaju?
46	JDF9EDAMTTTH6I2T	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Gde mogu da registrujem liniju u vodnom saobraćaju?
47	O4GSO3ZOAT13YRVL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Gde mogu da registrujem liniju u rečnom saobraćaju?
48	KAVHADKR8SSIQXA4	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	7	Da li je moguće registrovati liniju u vodnom saobraćaju?
49	VQTSHYPV644AUAT4	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Interesuje me postupak izdavanja plovidbenih dozvola?
50	9M7CBF19UZDCOGTR	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Koji su uslovi za dobijanje plovidbene dozvole?
51	XNHNFFQTDAGWAUUQ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Na koji način se izdaju plovidbene dozvole?
52	4BFRYQFBIIUSUMFI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Koja je procedura za dobijanje plovidbene dozvole?
53	ESBDWBXDE2HRZSLI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Kako doći do plovidbene dozvole?
54	GRRUO8JR2BOUGCUP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Potrebna mi je plovidbena dozvola
55	KK4DWRZPSGKMHH0Q	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Potrebna mi je dozvola za upravljanje čamcem
56	YFGZKH6RRGTRICTV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	8	Potrebna mi je dozvola za upravljanje brodom
57	LKKYKFFGOS17YZ1F	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	9	Koja je procedura za ishodovanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima, koje izdaje Direkcija za vodne puteve?
58	SLTZMTGSEAVPV5JY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	9	Koja je procedura za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima?
59	FJWYMQC87XZVK6WT	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	9	Da li na sajtu Direkcije za vodne puteve postoje smernice za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima?
60	QFKDTKF2PREXW4HG	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	9	Kako doći do Zahteva za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunardnim i međudržavnim vodnim putevima?
61	N7YHE0IQJOG2FRXM	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	9	Koji su uslovi za dobijanje Rešenja o potvrđivanju validnosti hidrografskih podataka na vodnim putevima?
62	82UWWWNKK11JHIYO	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Koja je procedura za ishodovanje Mišljenja u postupku izdavanja vodnih akata za vađenje rečnih nanosa?
63	KAADCF32GYMBFJ19	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Na koji način se može dobiti Mišljenje u toku procesa izdavanja vodnih akata za vadjenje rečnih nanosa?
64	V3FDAN7OE7JWAQHB	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Koja je procedura za dobijanje Mišljenja u postupku vodne saglasnosti za vađenje rečnog nanosa iz korita?
65	NDVPAZJAWJTWAB2E	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Kako mogu da pribavim Mišljenje u postupku izdavanja vodnih uslova i izdavanja saglasnosti za vadjenje rečnog mulja?
66	RVYL4Z9DNDTULAQW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Gde se mogu preuzeti instrukcije za dobijanje Mišljenja za izdavanje saglasnosti za vadjene rečnog mulja?
67	4WRSJNEQR1NQ8NLJ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Kako da dobijem saglasnost za vađenje rečnog nanosa?
68	ADUOQTQ4SJAN1CW3	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	10	Kako da dobijem saglanost za vadjenje rečnog nanosa?
69	YQPOLW3JZDQTV2ML	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?
70	9YB9HW0XFYDZTKPN	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Na kom sajtu se može pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?
71	G98NB3SQK59V8PDP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Na kojoj web lokaciji se nalaze elektronske karte za međunarodne i međudržavne plovne puteve?
72	S7F6O8WYKNDU1DGH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Sa kog sajta se mogu preuzeti međunarodne i međudržavne elektronske karte plovnog puta?
73	SXDZFOEFNYWYPOYS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Kako da saznam koji su plovni putevi u Srbiji?
74	XY68ROAICGHEEFFC	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Koji su plovni putevi u Srbiji?
75	ESB8PBXP31IDJEGS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	11	Da li Srbija ima plovne puteve?
76	2A7HXQL67C9TLVHL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Interesuje me gde je moguće kupiti štampana izdanja plovidbenih karata Dunava, Tise i Save?
77	4VNG3VKZY6H0U0KM	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Kako mogu da kupim plovidbenu kartu Dunava?
78	CGXGTDVYCCOUIVY9	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Koja je cena plovidbenih karata Dunava, Tise i Save?
79	WGTIYTQDCA4Y9ALI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Koja su prodajna mesta plovidbenih karata Dunava, Tise i Save?
80	ZFWPN3SXWLUW9LS3	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Gde se mogu kupiti plovidbene karte Dunava, Tise i Save?
81	NAHNMUQOAXBF8DOF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Gde mogu da kupim plovidbenu kartu Dunava?
82	MDD3NJW1AVHDNSCM	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Gde mogu da kupim plovidbenu kartu Save?
83	NDL0QEHTKLVCVL1Y	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	12	Gde mogu da kupim plovidbenu kartu Tise?
84	ZUW5DYARYQFJNKHU	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	13	Koji je sadržaj projekta za izvođenje poslova u okviru hidrografske delatnosti?
85	JPA0KRTDUH1WMZUF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	13	Gde se mogu naći uputstva za izradu projekta za izvodjenje poslova u okviru hidrografske delatnosti?
86	U6ZTQV3FVMIS1IEO	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	13	Šta čini projekat za izvođenje poslova hidrografskih delatnosti?
87	WQ85IWK9OE4TKNDI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	14	Koja pravna lica mogu da obavljaju hidrografska merenja?
88	6359B0VWVOBG80DE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	14	Koji su uslovi za obavljanje hidrografske delatnosti?
89	GSAZVL9AP5HZWSPO	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	14	Ko radi hidrografska merenja?
90	KXM59UCRXKI03MDJ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Koja je procedura za postavljanje plutajućih objekata na vodnom zemljištu?
91	UUTWESBWVZNBAKCJ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Kako doći do dozvole za postavljanje plutajućih objekata na vodnom zemljištu?
92	F1XJPYV0WMHX831L	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Koji su uslovi za postavljanje plutajućih objekata na vodnom zemljištu?
93	BPP9UXDE4J9Z448M	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Šta je potrebno za postavljanje plutujućeg objekta na vodnom zemljištu?
94	TCCFGMSXDABYSXZ6	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Koje su odredbe za postavljanje plutajućih objekata na vodnom zemljištu?
95	IO96CGU1H9VRCX76	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Kako da postavim plutajući objekat na vodnom zemljištu?
96	ULNSMKHAEXLZUONP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	15	Ko izdaje dozvolu za postavljanje splavova?
97	NS9FRRKUUFPZAIL1	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	16	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?
98	XWXMY7CBMLW73WZG	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	16	Da li Direkcija za vodne puteve izdaje saglasnost i dozvole za sva delovanja u okviru vodnog saobraćaja i infrastrukture?
99	JFJWJRV0FEHFVIMV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	16	Da li je izdavanje saglasnosti i dozvola za međunarodni i međudržavni vodni put u delokrugu rada Direkcije za vodne puteve?
100	ZPKZIMVI0MDVKVDP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Zanima me procedura registracije plovila?
101	UQU95ZINBBD51OLF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Koja je procedura za registraciju plovila?
102	QMT82Z5PRVMYR1BW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Šta je potrebno od dokumentacije za registraciju plovila?
103	P9L6KEKWNLT4SE41	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Kako doći do plovidbenih dokumenata?
104	8Q6ZMQMFCYWIHYUU	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Gde se mogu registrovati plovila?
105	NUJYBLYYXOV8JD4P	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Kako da registrujem plovilo?
106	4EXO0ICNKUEWEZQH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Kako da registrujem brod?
107	OSX3GSCWVK5QLB2B	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	17	Kako da registrujem čamac?
108	VQZDBP0HPCZJLCSN	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	18	Za koje radove na međunarodnim i međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?
109	Y5FEWK6POGCFZD5N	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	18	Za koje radove na međunarodnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?
110	K8WPDLSRKCGCEDPP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	18	Da li i za koje radove na međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnost?
111	29AZCEEFEDZWR8MP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	18	Za izvodjenje kojih radova Direkcija za vodne puteve izdaje saglasnost?
112	4ETVSZNGDD2SXWBD	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	18	Da li Direkcija za vodne puteve izdaje saglasnost za radove na međudržavnim i međunarodnim putevima?
113	DWSU43T2TEEIAZ6R	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	19	Koje su obaveze pravnih lica koja vrše hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?
114	0PX47Q4PTVUVVRTH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	19	Pod kojim uslovima pravna lica mogu vršiti hidrografsko merenje?
115	38LM2INC43ATRE04	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	19	Koja je procedura za vršenje hidrografskog merenja na međunarodnim i međudržavnim putevima?
116	1VJ6VXEA1IHXKLTV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	19	Šta je potrebno za vršenje merenja na međunarodnim i međudržavnim vodnim putevima?
117	2VJ7MNYQY93D2LME	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	19	Koja je dokumentacija potrebna pravnim licima za hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?
118	DEHXVUMRZVRBDUHM	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Red letenja AirSerbia?
119	UKAWAVOPHKCYUAXS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Gde se može proveriti red letanja Er Srbije ka određenim destinacijama?
120	RCV4MSWSNTJV6BTI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Na kojoj web stranici mogu pogledati raspored letenja Er Srbije?
121	A18IEBOFJPTN2CYN	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Gde se mogu informisati o dolascima I odlascima Er Srbije?
122	1QJEF1LXIL4FMOSK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	U kom odeljku na zvaničnom sajtu Er Srbije se mogu informisati o redu letenja ka željenim destinacijama?
123	SRBUQSDDCRJXOUTY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Gde se nalazi red letenja na zvaničnom sajtu Er Srbije?
124	SN0MOJP6CW6HFSZ6	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Potreban mi je red letenja
125	PNLJGTGGYUEHWJR5	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	20	Kako da saznam red letenja?
126	LNBYO6WOQ2NAQ2NR	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	21	Da li je za boce za vazduh koje se ugrađuju u vozila potrebno pribavljanje isprave o usaglašenosti prilikom uvoza u Srbiju?
127	U8QWBMWH8OLUSKZW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	21	Da li su potrebne isprave o usaglašenosti za boce za vazduh prilikom uvoza u Srbiju?
128	BEMJWJRKDEAINSN7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	21	Da li je potrebno pribaviti isprave o usagašenosti za ugradnju boce za vazduh prilikom uvoza u Srbiju?
129	DOJCKDHMI9CXKHOG	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	21	Koje su isprave potrebne za boce za vazduh koje se ugradjuju u vozila prilikom uvoza u Srbiju?
130	EWWGMMITEZ9RC63H	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Da li je za produženje važenja sertifikata za savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) potrebno odslušati obuku u ovlašćenom privrednom društvu ili drugom pravnom licu?
131	FSNW5HZYL5HODD3N	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Da li je za produženje važenja sertifikata za savetnika za bezbednost u transportu opasne robe potrebno odslušati obuku u nekom od ovlašćenih privrednih centara?
132	ZOMHHTGETGHHELEG	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Gde se vrši obuka za produženje sertifikata za savetnika za bezbednost u transportu opasne robe?
133	UVC3AGPP5EXL5CXY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Da li je potrebno za produženje sertifikata za savetnika za bezbednost u transportu opasne robe otići na obuku?
134	K3NPXI86AF53NP2S	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Da li je potrebna obuka za produženje sertifikata za savetnika za bezbednost u transportu opasne robe?
135	THYPTLBJPXWGWYE9	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Kako mogu produžiti sertifikat za savetnika za bezbednost u transportu opasne robe u drumskom, železničkom i vodnom saobraćaju?
136	ZSKFVWROK5RIGIJH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Gde da se obratim za produženje sertifikata za savetnika za bezbednost u transportu opasne robe u drumskom, železničkom i vodnom saobraćaju?
137	X1WLX7VWZIGUBTCV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Gde mogu odlsušati obuku za produženje sertifikata za savetnika za bezbednost u trasnportu opasne robe u drumskom, železničkom i vodnom saobraćaju?
138	963T6UNNP6DRB5DB	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Koja je procedura za obnovu sertifikata za savetnika za bezbednost u transportu opsané robe u drumskom, železničkom i vodnom saobraćaju?
139	WDL7WQJNUEYFBQY6	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	22	Kako da produžim sertifikat za savetnika za bezbednost u transportu opasne robe?
140	ZPUCOKH8IYU2K5LZ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	23	Na koju imejl adresu se dostavljaju godišnji izveštaji savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) u elektronskoj formi?
141	ANHWU7SZNB5DFE1P	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	23	Na koji način se dostavljaju godišnji izveštaji savetnika za bezbednost u transportu opasne robe?
142	AOUJWOZUMBPIL590	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	23	Koji je krajnji rok za slanje godišnjeg izveštaja savetnika za bezbednost u transportu opasne robe?
143	5SUL5IRIP9JGD6GU	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	23	Da li se godišnji izveštaji savetnika za bezbednost u transportu opasne robe mogu slati i elektronskim i redovnim putem?
144	934TTYWFECQLFV7W	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	23	Kome treba dostaviti godišnji izveštaj savetnika za bezbednost u transportu opasne robe u drumskom, železničkom i vodnom saobraćaju?
145	X299PWGVNFMMYEZL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Kako da nadjem izgubljeni prtljag?
146	FN38AYZQVFTV6H3D	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Kako je moguće pronaći izgubljeni prtljag na aerodormu Nikola Tesla Beograd?
147	H9DEB3WFLDRSXVVS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Gde mogu prijaviti izgubljeni prtljag?
148	JK64SCOEUHD4QYIA	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Kome se mogu obratiti za pomoć u pronalaženju izgubljenog prtljaga?
149	CKZMFZFEV3S56KXB	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Gde se nalazi sužba za prijavu izgubljenog prtljaga na aerodromu?
150	A3EPIGA3F3WA8BNK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Da li mogu elektronskim putem prijaviti izgubljeni prtljag?
151	S9OJOD1T5YNWUMAA	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Izgubio sam prtljag sta da radim?
152	KCTRAF1FBIOANGBQ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Izgubila sam prtljag sta da radim?
153	UODJJ31FEERKNZU7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Kako da prijavim izgubljeni prtljag?
154	BNSSTDDRDZGJK1WE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	24	Izgubio sam prtljag na aerodromu, kako da ga pronadjem?
155	H9AUSPBZRVYONVSB	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Kako se vrši povraćaj novca usled otkazivanja leta?
156	BICMDINUGO13EHWH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Kome upućujem zahtev za povrćaj novca usled otkazivanaj leta?
157	PRXAJKWYVFTYQOWF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Koja je kontakt adresa za potraživanje novčane naknade usled otkazivanja leta?
158	GOSTEACCE43QKLSF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Kome se treba obratiti za povraćaj novca kada se otkaže let?
159	SMMZPQ7TCYV9IQJC	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Koja je procedura za povraćaj novca usled otkazivanja leta?
160	NNZKOPR5X2CSCASN	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Otkazan mi je let, kako da povratim novac?
161	8EQFBPXLA5C1XZSZ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Otkazan mi je let, sta da radim?
162	ATZXEK1YPZUQRJDY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Otkazan mi je let, kako da povratim pare?
163	KP6W5IJIA0RO6GA3	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	25	Povracaj novca u slucaju otkazivanja leta
164	86XELM2KEYAVUN9X	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Kako je moguće zatražiti pomoć osobama sa invaliditetom prilikom dolaska na aerodrom Nikola Tesla Beograd, kao i na samom letu?
165	ZMIJMIJSKKMAM4ZI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Kada putnik sa invaliditetom dođe na aerodrom gde se trebe uputiti da bi se prijavio za pomoć?
166	YK7QFM3QBUOGR9ON	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Koliko ranije je potrebno da putnik sa invaliditetom najavi da mu je potrebna pomoć prilikom registracije i ukrcavanja u avion?
167	P08Y7LEONOZN6288	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Da li postoji osoblje koje pomaže putnicima sa invaliditetom na aerodromu Nikola Tesla?
168	HBAA6GLLHUIQOAGP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Prilikom ulaska na aerodrom kome putnik sa invaliditetom treba da se obrati za pomoć?
169	CWF71TSV95XW7S89	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Pomoć osobama są invaliditetom na aerodromu
170	QSNSSZGEPM2LB9TK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Potrebna mi je pomoc za osobu sa invaliditetom na aerodromu
171	YH6CHU5Y9QVXPYFD	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	26	Kome da se javim za pomoc osobi są invaliditetom na aerodromu?
172	RQX8OE35AIBHRREK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Kojim vidovima prevoza se može doći iz centra grada Beograda do aerodroma Nikola Tesla Beograd?
173	HBZCC3DVGOPNMVJH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Koje linije gradskog prevoza saobraćaju do aerodroma Nikola Tesla?
174	EXHRKLG51POENCCH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Da li postoji voz koji ide od Beograda do aerodroma Nikola Tesla?
175	E05R6GDGPMGCTURM	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Da li postoji kombi koji prevozi putnike od centra grada do aerodroma?
176	BMOKIU3ZD9J2853F	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Da li postoji noćna linija gradskog prevoza iz centra ka aerodromu i obrnatno?
177	YSJGCNXBDBNIGGBK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Kako da stignem iz grada do aerodroma?
178	RQ9J55LMLGBJPOTY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Kako da stignem iz Beograda do aerodroma?
179	HR8YGODTPXU969WO	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	27	Da li neki autobus ide iz grada do aerodroma Nikola Tesla?
180	PUFJJUHKBEAOPUKE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	28	U kojim slučajevima je potrebno da vozač poseduje ADR sertifikat za vozača vozila za prevoz opasne robe drumom?
181	CRIEUYSHWPBDVID5	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	28	Da li svi vozači vozila za prevoz opasne robe moraju imati ADR sertifikat?
182	QQDLHAGVHK4VPEZ5	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	28	Da li vozač koji je prošao obuku za bezbednost u transportu opasne robe mora posedovati ADR sertifikat?
183	P0GTUIUGXEIBEIBY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	28	Ako je vozač prošao obuku za bezbedno transportovanje opasne robe da li mora da ima ADR sertifikat?
184	PRCXYXTDL9RUVJEM	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	28	Koji vozači vozila za prevoz opasne robe ne moraju imati ADR sertifikat?
185	2EDG3QDI43OB8QW7	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	28	Ko sve mora da ima ADR sertifikat?
186	XO00AKCKGO5YQMWL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	29	Na koji način se vrši uvoz pokretne opreme pod pitiskom ili ambalaže za prevoz opasne robe u Srbiju?
187	N7Z46MY0TOR32N5N	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	29	Koja je procedura za uvoz pokretne opreme pod pritiskom ili ambalaže za prevoz opasne robe u Srbiju?
188	WYXCOHVQ43NN81TU	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	29	Šta je potrebno od dokumentacije za uvoz opreme za prevoz opasne robe u Srbiju?
189	0QTNYJZ61AOB04KP	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	29	Da li postoje određene dozvole i sertifikati koji se moraju steći za uvoz pokretne opreme i ambalaže za prevoz opasne robe u Srbiju?
190	GFTGMWIOE7YPJNHD	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	29	Kolike su administrativne takse za uvoz opreme pod pitiskom ili ambalaže za prevoz opasne robe u Srbiju?
198	AAFE9GOBQAGXJ29J	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	32	Koje je radno vreme lučkih kapetanija?
199	7ILIGSGJA6SKFLXX	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	32	Kada radi lučka kapetanija?
200	GRHIIY6PNXKXGG4W	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	32	Od koliko sati radi lučka kapetanija?
201	WRZA1MAAGD3DBOXI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	32	Do koliko sati radi lučka kapetanija?
202	0VCY01VLQFZJV1YI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Da li postoji u Republici Srbiji akreditovana institucija za obuku pomoraca i brodaraca?
203	TZVQFJRARI5I5ZSI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Gde se obučavaju pomorci i brodarci?
204	5BGQ5GENTWMMVATF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Gde mogu da prođem obuku za pomorstvo i brodarstvo?
205	CRA4R2HGWGHGZHKT	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Gde mogu da prođem obuku za pomorstvo?
206	OLQHWOP95I05W8YQ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Gde mogu da nađem obuku za brodarstvo?
207	R6KW3CPRBAZQSLNV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Hoću da prođem obuku za pomorstvo
208	FI7VZLDNFNLGTAIZ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	33	Hoću da prođem obuku za brodarstvo
209	IOHNZ7KC2FDSJEZA	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	34	Gde mogu da se izvrše zdravstveni pregledi za izdavanje pomorske knjižice?
210	XBUIIAAQAK7MZ4WK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	34	Gde da uradim zdravstveni pregled za pomorsku knjižicu?
211	1NVHSJCDOP6KR2FT	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	34	Da li za izdavanje pomorske knjižice treba zdravstveni pregled?
212	BR3U7MZMEAGJ2G7R	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	34	Kako da uradim zdravstveni pregled za izdavanje pomorske knjižice?
213	O17HGV299BWHVKWZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	35	Ko izdaje odobrenja za obavljanje lučkih delatnosti u lukama i pristaništima?
214	DUGCJDELHNYG13VJ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	35	Kako da dobijem odobrenje za obavljanje luckih delatnosti?
215	LQXSG5VTAFX6MUSN	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	35	Ko moze da se bavi luckim delatnostima?
218	87KAYQSJERVGGEJP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	37	Gde se izdaju međunarodne dozvole za upravljanje čamcem?
219	A3CU0DFLRFOEGAMT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	37	Potrebna mi je međunarodna dozvola za upravljanje čamcem
220	3DKWFGQWFA5QRGUH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	37	Gde mogu da izvadim međunarodnu dozvolu za upravljanje čamcem?
221	CFIHAI7BMXOV6ENH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	37	Gde mogu da izvadim međunarodnu dozvolu za čamac?
222	SINIMM00SNELEIXB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	37	Da li je potrebna međunarodna dozvola za čamac?
223	YCXR8GL7MVMG2YRJ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	37	Treba mi međunarodna dozvola za upravljanje čamcem
224	7HFT0HINIAHHXVLF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Gde se izdaju dozvole za upravljanje čamcem?
225	LOXVH5U5Z81Z7JNL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Gde mogu da dobijem dozvolu za upravaljanje čamcem?
226	0J1D9ZNGAVVJD6SZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Kako da dobijem dozvolu za upravljanje čamcem?
227	QQJ2DQQXJ67GYIMY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Gde da uzmem dozvolu za upravljanje čamcem?
228	GKL3W6IOEKIXNP7Y	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Gde mogu da izvadim dozvolu za upravljajem čamcem?
229	6CE4RS1OZVDNP0M3	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Treba mi dozvola za upravljanje čamcem
230	U3U3UZHOJQCS4T9L	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	38	Kako da izvadim dozvolu za upraljvanje čamcem?
231	KKDSESS7T0GMXIQW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	39	Da li je potrebno odobrenje za održavanje sportskih manifestacija na vodnom putu?
232	B3QVMWT103NCX6MS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	39	Potrebna mi je dozvola za održavanje sportske manifestacije na vodonom putu
233	NUDCEKLDBHDVYDDU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	39	Kako da izvadim dozvolu za održavanje sportske manifestacije na vodnom putu?
234	QXAY0B9LYAI9QEWD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	39	Gde mogu da dobijem dozvolu za održavanje sprotske manifestacije na vodnom putu?
235	TOEFT8NDVCSWHZEY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	39	Gde mogu da izvadim dozvolu za održavanje sprotske manifestacije na vodnom putu?
236	UHP5CSHPCLFPM04Z	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	40	Ko je nadležan za održavanje i obeležavanje Dunava i Save?
237	SC3FUGQL3NKXSKKB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	40	Ko održava Dunav i Savu?
238	3GE17NGFMNWIRY38	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	40	Ko obeležava Dunav I Savu?
239	1HU0T1IHX4UOYPHP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	41	Gde se polaže ispit za vozara unutrašnje plovidbe i gde mogu da se pronađu pitanja za pripremu ispita?
240	SKRO6712DQZP8RBJ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	41	Kako da položim ispit za vozara unutrašnje plovidbe?
241	ZMPGET81BDQRGMXB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	41	Gde mogu da polažem ispit za vozara unutrašnje plovidbe?
242	AJ1KU0EABSRPTM99	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	41	Kako da se pripremim za ispit za vozara unutrašnje plovidbe?
243	4RBCCJJ99XFALJXX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	42	Gde mogu da se izvrše zdravstveni pregledi za izdavanje brodarske knjižice?
244	KTRKQRBL4HBEYYZZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	42	Kako da izvršim zdravstveni pregled za izdavanje brodraske knjižice?
245	GQD7FBGDUFRTXK6Q	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	42	Treba mi zdravstveni pregled za brodarsku knjižicu?
246	8TSQHBAP9ER2K87O	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	42	Da li mi treba zdravstveni pregled za bordarsku knjižicu?
247	TKODQGGMUR8EONDX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	42	Kako uradim zdravstveni pregled za brodarsku knjižicu?
248	G6VJHI36EWBZQXSP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Gde se rade tehnički pregledi čamaca?
249	1VLWPMJ40SQNY4XO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Gde se rade tehnički pregledi čamaca namenjenih za sport i razonodu?
250	W5LMX4TJ8ZLCGFAV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Gde se radi tehnicki pregledi čamaca namenjenih za privredne svrhe?
251	TZJQZXV0EOYR09JA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Gde da uradim tehnički pregled za čamac?
217	1TWCWBWFG8P8EIDG	2023-06-27 18:39:49	2023-06-28 14:40:49	2023-06-28 14:40:49	36	Da li u Srbiji važe ovlašćenja članova posade brodova iz Evropske unije?
196	NXDXW3N9AZTCP8L3	2023-06-27 18:39:48	2023-06-28 19:31:56	2023-06-28 19:31:56	30	Koje avione ima Air Srbija?
252	G8RIQDMEOE438DZN	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Kako da uradim tehnički pregled za čamac?
253	C86QIAV7VXUTB65B	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Potrebno je da uradim tehnički pregled za čamac
254	T6ISKSO7Y5ZEJURR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	43	Gde mogu da uradim tehnički pregled za čamac?
255	YCEGFR6OTTZIRJUS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	44	Koje su ovlašćene kompanije za posredovanje pri zapošljavanju pomoraca?
256	LCSACL6IT8RBZWMT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	44	Koje kompanije mogu da zapošljavaju pomorce?
257	9H5BUZJPHU2NYDYA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	44	Treba mi spisak kompanija koje zapošljavaju pomorce?
258	DCRMY3FPOCVSVN11	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	44	Treba mi posao u pomorstvu?
259	BHCZ7U49RRR8DR1R	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	44	Kako da nađem kompanije koje zapošljavaju pomorce?
260	5RKSZFLKGICKAWGS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Koji su kontakti lučkih kapetanija?
261	QH2TGYVM45QPDNT3	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Mogu li dobiti sve kontakte lučkih kapetanija?
262	O1RJ1L9RMJXOZNPT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Gde se mogu naći svi kontakti lučkih kapetanija?
263	UV82L2EAZAKJ0BAC	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Potrebni su mi kontakti svih lučkih kapetanija
264	S5PCZ8QM3BNPXNTD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Koji su brojevi telefona svih lučkih kapetanija?
265	D5HGO0H4AMHSDXPG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Treba mi kontakt lucke kapetanije
266	QQJNXZ8CPQXHXGKS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	45	Koji je broj lucke kapetanije
268	ZLL8WHW1ZSWBDKAV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	47	Ko može da se bavi proizvodnjom čamaca u Republici Srbiji?
269	MMJUAEOFYKBQLHNE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	47	Da li mogu da se bavim proizvodnjom čamaca?
270	9CZBWYWG2RWIPYNG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	47	Ko sve može da se bavi proizvodnjom čamaca?
271	FNHBJ2F7MJIFNCGD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	47	Ko sve može da proizvodi čamce?
272	C5DC7FTW6S1K53WU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	47	Ko su ovlašćeni proizvođači čamaca?
273	YAQMPCNSOWTFHSQG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	47	Ko su sve ovlašćeni proizvodjaci camaca?
274	RFPQ7XBPIYDAL7ST	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	48	Da li strani brodovi mogu da uplove u državni vodni put?
275	UO0FZWTZWE89PEFS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	48	Mogu li strani brodovi da plove našim rekama?
276	SRJNZAHE6WOQ52DS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	48	Da li brodovi iz inostranstva mogu da plove našim rekama?
277	TZ81KDKQTD1XAT6O	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	48	Da li brodovi iz inostranstva mogu da plove rekama u Srbiji?
278	FY3UFNNGM9QMWDY1	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	49	Ko u Republici Srbiji vrši utvrđivanje sposobnosti za plovidbu brodova unutrašnje plovidbe?
279	UFWZWOEHYZZWRBMZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	49	Ko vrši utvrđivanje sposobnosti brodova za plovidbu?
280	XLTLSCFOKGEGDCYO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	49	Kako da utvrdim da li mi je brod sposoban za plovodibu?
281	2J2EAXMGO1BKBY9Q	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	49	Treba da utvrdim da li je brod sposoban za plovodibu
282	SO8SFGQODJZ1L9QJ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	50	Gde se podnose zahtevi za izdavanje ovlašćenja o osposobljenosti članova posade brodova unutrašnje plovidbe?
283	DLEQRW3F6P31GKGL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	50	Gde da podnesem zahtev o osposobljenosti članova posade brodova?
284	CJ1WIKN9NDEQ4ZYR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	50	Kako da pribavim dokument o osposobljenosti članova posade brodova?
285	WBURWSLCBVQQHSOP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Kako mogu da dobijem gradjevinsku dozvolu?
286	DCE5CV92LDHS15EW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Kako mogu da dobijem građevinsku dozvolu?
287	N00RMLQR4N08T7H9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Kako da izvadim građevinsku dozvolu?
288	RRU5543CH7CPXAVW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Kako da izvadim gradjevinsku dozvolu?
289	EMCJRU9VLBHMIGYE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Treba mi gradjevinska dozvola
290	AXENOODE8VNKBU7O	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Treba mi građevinska dozvola
291	WA3DP2JMVNA97B34	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Kako se vadi gradjevinska dozvola?
292	ZLNYMBDH9XKDROUJ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Kako se vadi građevinska dozvola?
293	H4ZQN3WS0U0Q2MPG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Gde se vadi građevinska dozvola?
294	CCNOB3OE763GKCSE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Gde se vadi gradjevinska dozvola?
295	EBQWLU7VTXCG1LQ8	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Šta je od dokumentacije potrebno za gradjevinsku dozvolu?
296	A6I1UX5UQLAGN3NR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Šta je od dokumenta potrebno za građevinsku dozvolu?
297	HZVJZED3GWZ832N9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Šta mi je potrebno za gradjevinsku dozvolu?
298	HJF6QYYSBH5D5LPG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Šta mi je potrebno za građevinsku dozvolu?
299	ZLLKEKQWM7QFDUEW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Gradim kuću. Kako da izvadim gradjevinsku dozvolu?
300	4RZWWH6SRM2H6OFA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Gradim kuću. Kako da izvadim građevinsku dozvolu?
301	QXGGGQOMW8JFM0NU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Gradim zgradu. Kako da izvadim gradjevinsku dozvolu?
302	J6EKUGE8VOQKBIM7	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	51	Gradim zgradu. Kako da izvadim građevinsku dozvolu?
305	UE7PBYWY8F8XPDUZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	54	Da li nadležni organ može da se obraća imaocima javnih ovlašćenja za izdavanje uslova, u postupku izdavanja lokacijskih uslova, ukoliko su u postupku izrade urbanističkog projekta već pribavljeni uslovi imalaca javnih ovlašćenja, takođe da li će nadležni organ u postupku izdavanja lokacijskih uslova pribavljati dodatne uslove imaoca javnih ovlašćenja u odnosu na tehničke uslove pribavljene za izradu urbanističkog projekta?
304	W7YAHKA8JZPUQNZ8	2023-06-27 18:39:49	2023-06-28 18:21:51	2023-06-28 18:21:51	53	U postupku realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju, predviđeno je rušenje nezakonito izgrađene porodične kuće, koja su prava vlasnika iste?
306	RHHLXIEMSVABZXWL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	55	Кako se određuje projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju?
307	YQLYQM3ZGSISKPVB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	55	Ko odredjuje da li je projekat za izgradnju od posebnog zanačaja?
308	QNSAC6IV1VRPEHTL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	55	Ko utvrdjuje da li je projekat za izgradnju od posebnog značaja?
309	DXGOCEWMDGGRJBYU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	56	Кada će biti omogućeno privremeno priključenje nezakonito izgrađenih objekata na mrežu, odnosno infrastrukturu?
310	LBXPQ35DRPKVNEI7	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	56	Da li je moguće priključiti nelegalno izgradjen objekat na infrastrukturu?
311	WUM4ZOQNLSDLXQAL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	56	Da li je moguće priključiti nelegalno izgradjen objekat na struju?
312	Z5RQVVLFGHYVBUNZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	56	Da li je moguće priključiti nelegalno izgradjen objekat na vodovod?
313	BIRCW9WJOXNJQOBI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	57	Da li rešenje o ozakonjenju ima istu pravnu snagu kao i građevinska i upotrebna dozvola ili ne?
314	7NOML30SDFFWFMQ3	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	57	Da li je rešenje o ozakonjenju isto što i građevinska dozvola?
315	9A0BQSRGL0KV2VKK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	57	Da li je rešenje o ozakonjenju isto što i uporebna dozvola?
316	DPWER4BMUAKFKP0Y	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	58	Da li je Rešenje o građevinskoj dozvoli doneto pre stupanja na snagu Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/13-US, 50/13-US, 98/13-US, 132/2014, 145/2014 i 83/2018), kojim je uvedeno da se  važenje građevinske dozvole vezuje za momenat prijave radova, i dalje važeće“ ?
317	B9B96OEHUHVV2I8A	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	59	Koji je rok za završetak autoputa Pakovraće Požega?
318	KZG5ZXGLJPX3XGBK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	59	Kada će biti gotov autoput do Požege?
319	PSJPWNJLQOZ6XAOH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	59	Koji je rok za završetak auto-puta do Požege?
320	BEOOFJUJBOCEY5LU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	60	Da li izvođač radova može sve neophodne velike licence potrebne za izvođenje radova koje je ugovorio (koje su prepoznate kao neophodne shodno radovima definisanim ugovorom o građenju) da obezbedi preko jednog ili više podizvođača, a da pri tome izvođač radova kao pravno lice ne poseduje nijednu“?
321	ZNUNSPFV3AGJSAIR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	61	Da li lica koja poseduju licencu u stranoj državi mogu da obavljaju stručne poslove u svojstvu ovlašćenog lica u Republici Srbiji?
322	AHDLTMWVQHDPN8XL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	62	Da li trećem licu može biti priznato svojstvo strane u postupku izdavanja građevinske dozvole?
323	ULDFCLKBGYQT7I9P	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	62	Da li je moguće da treće lice preuzme građevinsku dozvolu za određeni projekat?
324	DLDJEZU10KPOVBTW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	62	Da li samo investitor može podići građevinsku dozvolu?
325	FGVALLNT4W2E0XIH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	62	Može li investito da pošalje treće lice da preuzme građevinsku dozvolu?
326	HHJJMNRCBNL0WIMF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	63	Da li se objekti, odnosno radovi za koje je utvrđeno da predstavljaju Projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju, mogu izvoditi na šumskom, odnosno poljoprivrednom zemljištu, odnosno da li je potrebna promena namene zemljišta, pre podnošenja zahteva za izdavanje građevinske dozvole?
327	Z3NDHNH9LF1OVC9O	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	63	Da li se objekti ili radovi od posebnog značaja mogu vršiti na šumskom ili poljoprivrednom zemljjštu?
328	PH84PGKAYNIHRCDX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	63	Da li je potrebna prenamena zemljišta za izgradnu ili izvođenje radova na objektima od posebnog značaja?
329	CC5NLVYHR10FJIL9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da dobijem upotrebnu dozvolu?
330	ZT3ATLPPKD9J1GVV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Treba mi upotrebna dozvola?
331	P3CY7CHSK2PFKLUI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da uknjižim objekat?
332	PGOO01O8APOSL1PB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da uknjizim objekat?
333	ZU7AZLLP0SPLG0LH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da dobijem upotrebnu dozvolu za zgradu?
334	9KIKQ441QI8I6ZNZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da dobijem upotrebnu dozvolu za kucu?
335	4JJFHVCGEDO0MTWH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da uknjizim zgradu?
336	HBMNL6B2GPBBBOQJ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da uknjizim kucu?
337	Z81L2LHGM90ABPUF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da uknjižim zgradu?
338	QZK8JF4FDYNH4O8J	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	64	Kako da uknjižim kuću?
339	GRTDKY53O9GB9K8S	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	65	Da li predmet ozakonjenja može biti objekat za koji iz objektivnih razloga nije moguće pribaviti saglasnost suvlasnika na zemljištu?
340	ERGMPE3UE3HE5GZQ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	65	Da li mogu da ozakonim objekat ako nemam saglasnost suvlasnika zemljišta?
341	EACAAQUQTFZTELBD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	65	Kako da se ozakoni objekat bez saglasnosti suvlasnika zemljišta?
342	KFJCRMKHFR9Z44BR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Šta je sertifikat zelene gradnje, ko je nadležan za izdavanje sertifikata zelene gradnje?
343	GKWRP54PN671LDJI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Kako da dobijem sertifikat za zelenu gradnju?
344	IK3SZXQCMR6Q6Q0R	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Gde mogu da izvadim sertifikat za zelenu gradnju?
345	QCIX7KCD7ZCVYRZP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Da li moram da imam sertifikat za zelenu gradnu?
346	RJFKQC3GNVKFTY3D	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Ko sve mora da ima sertifikat za zelenu gradnju?
347	APUAVUCCZR7CBVEP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Da li sam u obavezi da imam sertifikat za zelenu gradnju?
348	L7CDZNHTG03THKIT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	66	Ko je sve u obavezi da ima sertifikat za zelenu gradnju?
349	YKJFUTCZ1K8DUQLK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	67	Potrebno je tokom realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju izmestiti infrastrukturu, odnosno ukloniti/srušiti objekat koji je izgrađen suprotno zakonu, na koji način se u tom slučaju mogu rešiti imovinsko-pravni odnosi?
350	H1ND9P5USSI9B58G	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	68	U čijoj nadležnosti je izdavanje građevinske dozvole za izgradnju postrojenja za tretman neopasnog otpada kapaciteta od oko 8 t na dnevnom nivou?
351	3QHICX1RLY62TL4A	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Кako se podnosi zahtev za preuzimanje lokacijskih uslova?
352	4ZDUN1B64VSGGRKY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Kako da podnesem zahtev za lokacijske uslove?
353	CO7J6ZNQRFFDZEYR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Da li mogu elektronskim putem da podnesem zahtev za dobijanje lokacijskih uslova?
354	YSGWVCI7A9VQC7NR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Kako da dobijem lokacijske uslove?
355	IC4TSY38YLUO8CMI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Kako da izvadim lokacijske uslove?
356	WJ8HOXZVTBOBBU8E	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Na koji način mogu podneti zahtev za lokacijske uslove?
357	SSOYCHQZOOSVC6DR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Gde mogu podneti zahtev za lokacijske uslove?
358	QFHAFETOIWIWB0BU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Kako da dođem do lokacijskih uslova?
359	M3BSNKVE73YYYUW1	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	69	Na koji način da dodjem do lokacijskih uslova?
360	A7RF3VHAEG8VQRAS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	70	Da li možemo podneti zahtev za izdavanje lokacijskih uslova i ostalih akata Ministarstvu građevinarstva, saobraćaja i infrastrukture za izgradnju objekta površine veće od 20 000 m2?
361	DGRLNLA3GAXKGKM2	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	70	Da li mogu podneti zahtev za izdavanje lokacijskih uslova i ostalih akata Ministarstvu građevinarstva, saobraćaja i infrastrukture?
362	GRHPYC5XDKHAJVYV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	70	Gde mogu podneti zahtev za izdavanje lokacijskih uslova i ostalih akata?
363	A1ZN82UYRGQG9MJT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	70	Da li lokacijske uslove mogu da izvadim u Ministarstvu građevinarstva, saobraćaja i infarastrukture?
364	7TODENYWACQ5PU0L	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	70	Da li lokacijske uslove mogu da izvadim u Ministarstvu?
365	JRSJYXQRVQAWLASI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	70	Gde mogu da izvadim lokacijske uslove?
366	EXJHMI3Y1JBVFAWA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	71	Nadležni organ jedinice lokalne samouprave nije doneo odluku u roku od 30 dana od dana podnošenja zahteva za izdavanje lokacijskih uslova, koja su moja prava?
367	CG7RGGSCAW9MQBBO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	71	Sta da radim ukoliko Opstina nije donela odluku u roku od 30 dana od podnošenja zahteva za izadavanje lokacijskih uslova?
368	YUFMCIZTP2JBIHJ5	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	71	Sta da radim ukoliko Grad nije doneo odluku u roku od 30 dana od podnosenja zahteva za izadavanje lokacijskih uslova?
369	4VDQHPOOHLZHDCJZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	71	Čekam preko 30 dana od podnošenja zahteva za izdavanje lokacijskih uslova.
370	9VHPRJFF0BR6PYAB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	72	Da li je za izradu idejnog rešenja, a za potrebe pribavljanja lokacijskih uslova potrebna velika licenca?
371	E2CPSKA9BEWWATJO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	72	Da li je potrebno da imam veliku licencu za lokacijske uslove i izradu idejnog resenja?
372	SIP3F1YYG9NUTBRF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	72	Jel mi treba velika licenca za lokacijske uslove i izradu idejnog resenja?
373	N0ZLU61WAGXL4HY8	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	73	Кoju dokumentaciju je potrebno dostaviti uz zahtev za izdavanje lokacijskih uslova?
374	34UBFJNQ8NFOLFYM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	73	Sta mi je porebno od dokumentacije za lokacijske uslove?
375	NXNI9W6PRDB3JXNI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	73	Sta je potrebno od dokumenata za izdavanje lokacijskih uslova?
376	QKYMFGIPVYJ9XEKX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	73	Koja dokumenta su mi potrebna da bih izvadio lokacijske uslove?
377	LUZ1FVP9OLIWVFUI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	73	Koja dokumenta su mi potrebna da bih izvadila lokacijske uslove?
378	5CFYMZQSJF2MEIOI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	74	Da li je potrebno pribaviti akt nadležnog organa, građevinsku dozvolu odnosno rešenje o odobrenju za izvođenje radova, za radove na objektu koji obuhvataju gletovanje i krečenje zidova, zamenu sanitarija u kupatilu, farbanje i popravku stolarije, kao i hoblovanje i lakiranje parketa“?
379	DRYM8CMF76NNRR1J	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	74	Da li je potrebna gradjevinska dozvola za krecenje zidova?
380	8ZDMF7RLFDJX2DEV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	74	Da li je potrebna gradjevinska dozvola za zamenu sanitarija?
381	PCVT2FH7UAKTNFBL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	74	Da li je potrebna gradjevinska dozvola za popravku stolarije?
382	IQIGZ7BR425TV3T6	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	74	Da li je potrebna gradjevinska dozvola za hoblovanje i lakiranje parketa?
383	QNPCOCYNAFGD1UIF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	75	Da li je potrebno pribavljanje akta nadležnog organa za izvođenje radova na postavljanju postrojenja instalisane snage do 50kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca – proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije?
384	EEVHROYHWIWWWGOU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	76	Кada su planirane izmene Zakona o ozakonjenju objekata („Službeni glasnik RS”, broj 96/15, 83/18, 81/20 - US, 1/23 – US), ili donošenje novog zakona u oblasti ozakonjenja kojim će biti omogućeno ozakonjenje nezakonito izgrađenih objekata izgrađenih posle 27. novembra 2015. godine?
385	ZEJRPPGEXVE2JA9Q	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	76	Kada će da prodje novi snimak?
386	AYOGCAXQYYXXSIQG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	76	Kako da ozakonim objekat izgradjen posle 2015. godine?
387	RDEKAO0XMWSHPLKK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	76	Da li je moguće ozakoniti objekat izgradjen posle 2015. godine?
388	WLKEYDFAFWSR2T9J	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	77	Кoji su uslovi za dobijanje velikih licenci, odnosno rešenja o ispunjenosti uslova za izradu tehničke dokumentacije i građenje objekata?
393	Y6KLRKJOFDWPYFPA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	80	Koji je rok za završetak Moravskog koridora?
394	PYJY1EVGDNNTXASA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	80	Kada će biti gotov Moravski koridor?
395	5W5MWJAFHC5XTYJI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	80	Kada će autoputem biti spojeni koridor 10 i koridor 11?
396	FQSHMFUCKO89SOCZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	80	Kada će autoputem biti spojeni Kruševac i Čačak?
391	TDCPMLGDIBOI3TSL	2023-06-27 18:39:49	2023-06-28 16:27:54	2023-06-28 16:27:54	79	Koji je rok za završetak radova na saobraćajnici Iverak – Lajkovac?
392	ECZ0PCZOZKKRZZ7X	2023-06-27 18:39:49	2023-06-28 16:27:54	2023-06-28 16:27:54	79	Kada će biti gotov put Iverak – Lajkovac?
397	WGNQTDKJOFV5JBMJ	2023-06-27 18:39:49	2023-06-28 16:30:33	2023-06-28 16:30:33	81	Koji je rok za zavreštak auto-puta Ruma Šabac?
399	KNJSC16GWWPBH9G4	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	82	Koji je rok za izgradnju Fruškogroskog koridora?
400	3AGM7FUDDQXOJTEY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	82	Kada će biti gotov Fruškogorski koridor?
401	VAW4AN6EWN16AXYS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	82	Kada će biti gotov tunel ispod Fruške gore?
402	SLJZV12FQK4LHGUS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	82	Kada će biti izgrađen tunel ispod Fruške gore?
405	ZO5GXY9NYVRSIGJY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	84	Koji je rok za završetak radova na brodskoj prevodnici Đerdap 2?
406	4UVQZOO4TZTPGSOO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	84	Koji je rok za završetak radova na brodskoj prevodnici Djerdap 2?
407	TUU255OMO9QRCHCI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	84	Kada će biti gotova brodska prevodnica na Đerdapu?
410	KNHUIEKZIOBRKUFY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	86	Kada će biti proširena luka Bogojevo?
411	XFMQZU3RQOGOHJFH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	86	Koji je rok za proširenje luke Bogojevo?
412	RDSUMUW1ZOXMWWHD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	86	Kada se očekuje proširenje luke Bogojevo?
415	IE6RA3EJERJKUQYC	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	88	Kada će biti izgrađena nova luka u Beogradu?
416	XTMK8HIIMYD0QAAW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	88	Da li će Beograd da dobije novu luku?
417	YHHGWMQ0L90UGDHP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	88	Koji je rok za izgradnju nove luke u Beogradu?
420	JOWXDVWQULRBBTK5	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	90	Kada će biti izgradjen novi terminal na beogradskom aerodromu?
421	EUJDHNJBBVHMWJWE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	90	Kada će biti izgrađen novi terminal na aerodromu u Beogradu?
422	SFBGWBXRFCS6GXRD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	90	Kada ce biti izgradjen novi terminal na aerodromu Nikola Tesla?
423	SRR5GDWK40RGYW99	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	90	Koji je rok za izgradnju novog terminala na aerodromu Nikola Tesla?
424	BHAU4YIVHBEBRDGO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	91	Kada će biti implementiran novi radarski sistem na aerodromu Nikola Tesla?
425	OIZQPWNLBFTZ6FEV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	91	Kada će beogradski aerodrom dobiti novi radarski sistem?
426	6MESAHKDC7ZWZP2Y	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	91	Da li će aerodrom u Beogradu da dobije novi radarski sistem?
427	TOLQEZ3IPFYN2JPU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	92	Kada će biti gotova brza pruga Novi Sad – Subotica?
428	05DJPSUXN67S4M1E	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	92	Koji je rok za izgradnju brze pruge Novi Sad – Subotica?
429	O8ZARJ8G8BSAZERZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	92	Kada će biti izgradjena brza pruga do Subotice?
430	XHLOKUOGM8TWTBIY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	92	Kada će biti izgrađena brza pruga do Subotice?
431	ROSKMZBOVLFOVHEA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	93	Kada će biti rekonstruisana pruga od Niša do Dimitrovgrada?
432	KQMTDATFG47X4PPU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	93	Koji je rok za rekonstrukciju pruge od Niša do Dimitrovgrada?
433	PZUKWSOIWD8WFSRQ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	93	Kada će biti rekonstruisana pruga Niš – Dimitrovgrad?
434	IFBNWOY4LDSARPUF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	93	Koji je rok za rekonstrukciju pruge Niš – Dimitrovgrad?
435	4AKAE7AZWB27AW7W	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	94	Kada će biti gotova obilaznica oko Užica?
436	7DU5QMPY4D7TPRC9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	94	Koji je rok za izgradnju obilaznice oko Užica?
437	PSNOMC3S4L50D5C0	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	94	Kada će Užice da dobije obilaznicu?
438	IIMIAZ32NEBG4HUW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	95	Kada će biti izgrađen metro u Beogradu?
439	RHRRUV3HUVP4WDZ7	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	95	Kada će da krene izgradnja metroa u Beogradu?
440	MC9XY5IMHREGPYVF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	95	Kada će da bude gotov beogradski metro?
441	LG9OWCKUM3UOWT0C	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	95	Kada ce biti izgradjen metro u Beogradu?
442	CX4SN1UOIYE9UCBC	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	95	Kada ce da krene izgradnja metroa u Beogradu?
443	GNG9Y5RQOPU461F9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	95	Kada ce biti gotov beogradski metro?
444	AZEHS1XWKSVOXUKF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	96	Koliko ima revizija za pojedinačni plan raspodele dozvola i kada se podnose zahtevi?
445	DU1AQYIG2B1CH4XU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	97	Šta je potrebno za izdavanje rešenja kojim se produžava period važenja prethodno izdatog rešenja za tehničko regulisanje saobraćaja?
446	FJEFEJLDVCM303NM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	98	Da li prevoznici mogu da podnose zahteve za dobijanje pojedinačnih dozvola tokom godine a da nisu podneli zahteve za utvrđivanje pojedinačnog plana raspodele i nemaju dozvole u planu?
447	7TTINEUOWF0KGQST	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	99	Da li postoje rokovi za razduženje pojedinačnih dozvola?
448	VQV883EPLFACWQLX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	99	Da li ima neki rok za razduženje pojedinačnih dozvola?
449	RJT8PABH6T4HZCOG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	99	Koji je rok za razduženje pojedinačnih dozvola?
450	RQOODSAB0YTWDM8Z	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	100	Ko sprovodi ispit za sticanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?
451	J9G22WU0VAQ4IJFA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	100	Gde da polozim ispit za ospoboljenost za obavljanje prevoza?
452	PEEB14QRKISS0IFO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	100	Potreban mi je sertifikat o profesionalnoj osposobljenosti za obavljanje prevoza?
453	9UB86YHWCR2QCWTQ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	100	Gde da polozim za sertifikat o profesionalnoj osposobljenosti za obavljanje prevoza?
413	LOTOCAJXQB84RLR0	2023-06-27 18:39:49	2023-06-28 15:28:08	2023-06-28 15:28:08	87	Kada će biti proširena luka Prahovo?
414	A1Z4SOTGQ4UUJ8KQ	2023-06-27 18:39:49	2023-06-28 15:28:08	2023-06-28 15:28:08	87	Koji je rok za proširenje luke Prahovo?
403	WQTZ97ITC4ENMVOF	2023-06-27 18:39:49	2023-06-28 16:31:45	2023-06-28 16:31:45	83	Kada će biti izgrađen put preko Radan planine?
404	QOIWFWS1JG0WUL3F	2023-06-27 18:39:49	2023-06-28 16:31:45	2023-06-28 16:31:45	83	Koji je rok za izgradnju puta preko Radan planine?
418	UAV42X0RIPEZVFLY	2023-06-27 18:39:49	2023-06-28 16:32:51	2023-06-28 16:32:51	89	Kada će biti proširena luka u Sremskoj Mitrovici?
419	TGHMAWDJ8EXP3G94	2023-06-27 18:39:49	2023-06-28 16:32:51	2023-06-28 16:32:51	89	Koji je rok za proširenje luke u Sremskoj Mitrovici?
454	9MBAFQOK8NSKNFXI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	101	Koji je uslov da domaći prevoznik može da dobije dozvole za obavljanje međunarodnog prevoza tereta?
455	BZBEXDXDEBJBVLD7	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	101	Šta mi je potrebno od dokumetnacije da bih dobio dozvolu za obavljanje medjunarodnog prevoza tereta
456	6JWLJDL9PH3IYF8R	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	101	Koja dokumenta su mi potrebna za dozvolu za obavljanje međunarodnog prevoza tereta?
457	43IYBQX4UHFYWT10	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	101	Kako da dobijem dozvolu za medjunarodni prevoz tereta?
458	PEZXQRWEE9KAZVQU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	101	Treba mi dozvola za medjunarodni prevoz tereta
459	BSCHX3UZULOQTREL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	102	Gde i kako mogu da se podnose zahtevi za pojedinačni plan raspodele dozvola?
460	XL1OF1B0X0NBZVB7	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	102	Gde mogu da podnesem zahtev za pojedinačni plan raspodele dozvola?
461	BW7UQFWFZFRTWAEK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	102	Kako da podnesem zahtev za pojedinačni plan raspodele dozvola?
462	RNVSAJJFONEZW0AY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	102	Treba mi pojedinačni plan raspodele dozvola
463	ZXIZFZXPPGVYKNIN	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	103	Šta čini pojedinačni plan raspodele dozvola?
464	OFATPCWNIKPPHZFY	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	103	Šta je pojedinačni plan raspodele dozvola?
465	P9J6SHSS4SMRRN0P	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	104	Koji je uslov za obavljanje javnog prevoza putnika u drumskom saobraćaju?
466	X5XPEVZCPULLGERW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	104	Koje uslove moram da ispunim da bih mogao da prevozim putnike?
467	39DYVCAFJT6XFAY9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	104	Da li postoje uslovi za obavljanje javnog prevoza putnika?
468	OHDKIBPYRREFXFET	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	104	Koje uslove treba da ispunim za obavljanje javnog prevoza putnika?
469	FBMPIYAMASJV9FP6	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	104	Uslovi za obavljanje javnog prevoza putnika
470	FSVVWNWYAEKU4NS5	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	105	Koji je uslov za obavljanje javnog prevoza tereta u drumskom saobraćaju?
471	GOIXLBCAKRHAN2BL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	105	Da li postoje uslovi za obavljanje javnog prevoza tereta?
472	28WNVOEZ0ROJDIJV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	105	Koje uslove treba da ispunim da bih obavljao javni prevoz tereta?
473	7O1GHNXY14I0HY7K	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	105	Kako da obavljam javni prevoz tereta?
474	XU7HXPG9ONNDEJEH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	106	Ko može da bude odgovorno lice kod domaćeg prevoznika?
475	GEGMNWNIZVWVJ9PR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	106	Sta mi je potrebno da budem odgovorno lice kod prevoznika?
476	DC6TIJ8JGENAZG0P	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	106	Kako da postanem odgovorno lice kod domaceg prevoznika?
477	VNGITRPXHKZVUUHS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	106	Koja dokumenta su potrebna za odgovornom licu kod prevoznika?
478	GTUQVXSJSVAF0RAX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Ko radi registraciju i overu reda vožnje za međumesni linijski prevoz putnika?
479	UKJNC0IWHYKXDWTS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Kako da registrujem red vožnje za međumesni linijski prevoz putnika?
480	WXIDIIOLXJDJMK9S	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Kako da overim red vožnje za međumesni linijski prevoz putnika?
481	XJCVXI4BVWHVIQ8F	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Treba da registrujem red vožnje za međumesni linijski prevoz putnika
482	PRQNZHAFORLR72VH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Treba da overim red vožnje za međumesni linijski prevoz putnika
483	PUN5DQ5FXSO8YLXW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Kako da overim red vožnje za medjumesni linijski prevoz putnika?
484	PA5QMAXN11MCYCGR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Treba da registrujem red vožnje za medjumesni linijski prevoz putnika
485	UXAYOWOWMRSR1F3J	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	107	Treba da overim red vožnje za medjumesni linijski prevoz putnika
486	54NTH0MVCXWNUEHX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	108	Gde i kako mogu da se podnose zahtevi za zaduženje i razduženje dozvola za prevoz tereta?
487	OVAVZHC6THFEKOMU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	108	Kako da podnesem zahtev za zaduženje dozvole za prevoz tereta?
488	ZG1ZVGNYKX9MMJ0S	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	108	Kako da podnesem zahtev za razduženje dozvole za prevoz tereta?
489	FKCCY3DWTQERCTAB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	108	Treba da zadužim dozvolu za prevoz tereta
490	DNFSJC43GIUNO2TA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	108	Treba mi dozvola za prevoz tereta
491	MQDEFANZMDYCD1ED	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	108	Treba da razdužim dozvolu za prevoz tereta
492	ZIWOZ7NMWHKHV6N6	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	109	Ko je nadležan za izgradnju trotoara na državnom putu?
493	INBJBAZJCHAYTPBZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	109	Kojoj instituciji da se obratim za izgradnju trotoara u naselju?
494	RBPG7SKUPAZY46CP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	109	Ko odobrava izgradnju trotoara na državnom putu?
495	DA0HVHKRQELBHGBX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	109	Da li je moguce da se izgradi trotoar na drzavnom putu?
496	ZIXIJMY8VW8MOBYH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	109	Potreban nam je trotoar u naselju
497	HKRJB1CD65GU4JLO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	109	Kome da se obratim za izgradnju trotoara?
498	V1KW8BOR7LZ6NVLT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	110	Ko daje finansijsku pomoć za popravku i asfaltiranje lokalnih puteva?
499	JN0PDPV16N94XSM5	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	111	Ko izdaje dozvole za vanredni prevoz?
500	7PI8JHX5DVIRCJ33	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	111	Kako da dobijem dozvolu za vanredni prevoz?
501	HSV9MTVAECQ4NLEA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	111	Kako da izvadim dozvolu za vanredni prevoz?
502	HWTVCB7JEFL4D94S	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	111	Gde mogu da izvadim dozvolu za vanredni prevoz?
503	KPK55DHEARI37NPS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	111	Treba mi dozvola za vanredni prevoz
504	1QVUIQXM2FHORMWE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	112	Kome se podnosi zahtev za postavljanje "ležećih policajaca"?
505	AMWKH4BDF7HPQT1G	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	112	Moze li da se postavi lezeci policajac u zoni skole na drzavnom putu?
506	SXM1HKAKYWEYKMP0	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	112	Kako da se postavi lezeci policajac u zoni skole na drzavnom putu?
507	F09AHEYZXUIU9GDT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	112	Ko postavlja lezeceg policajca u zoni skole na drzavnom putu?
562	DTXIHDODB1UAKE2D	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	130	Koji zakon uređuje oblast drumskog prevoza putnika?
508	WDWY7BBXV52SLSNO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	113	Da li je dovoljno da se podnese zahtev za pojedinačni plan raspodele dozvola jednom godišnje?
509	I6H8CIQIAE7BD5HL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	113	Koliko puta se podnosi zahtev za pojedinačni plan raspodele dozvola?
510	II4MWJR6YKWHC0RZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	114	Da li prevoznik koji nije predao zahtevi za pojedinačni plan raspodele dozvola, ako je počeo obavljanje delatnosti prevoza tereta nakon tog roka, može da podnese zahtev za reviziju pojedinačnog plana?
511	TKVZQJTO7N1AORDU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	115	Gde je moguće pronaći uputstvo i zahtev za numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?
512	QMYSLD3OAYSBQANN	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	115	Treba mi upustvo I zahtev za numeraciju sertifikata za teretna vozila nacionalnim brojem?
513	KTOFVFMCUCHSCNMZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	115	Treba mi numeracija sertifikata za teretna vozila nacionalnim brojem
514	6E1WVC98XFEUBYIP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	116	Ko vrši numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?
515	W4B5S67KZZQQ3MCI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	116	Kako da numerisem teretna vozila nacionalnim brojem?
516	0APKJ2MU7IRASLHN	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	116	Kako da numerisem teretno vozilo nacionalnim brojem?
517	RWT9ISQWXMOABBLC	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	117	Da li je potrebno posedovati izvod licence za prevoz za svako vozilo iz voznog parka prevoznika?
518	ELKWGO8VQ8SE9FYE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	117	Da su potrebne pojedinacne dozvole za svako vozilo iz voznog parka?
519	D5NPSWQ814VB1FIP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	117	Da li svako vozilo iz voznog parka mora da ima dozvolu?
520	J4ARO1BZZ0FUNW42	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	118	Da li je red vožnje za međumesni linijski prevoz putnika moguće preneti na drugog prevoznika ili voziti u kooperaciji?
521	KHHAUXBSQOZOOSWB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	118	Da li može drugi prevoznik da koristi moj red vožnje u međumesnom linijskom prevozu putnika?
522	A6YCGU0FDBXN3AHT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	118	Da li može drugi prevoznik da koristi moj red vožnje u medjumesnom linijskom prevozu putnika?
523	OC0OKZQC4TOZO6OM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	119	Šta je nekategorisani put?
524	HKDE3VNJ6DHTBPGS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	119	Ko je nadležan za nekategorisani put?
525	7SBGE7EXP6KDQOKR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	119	Ko održava nekategorisani put?
526	VX8QXLPKCZQMHHYP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	119	Šta su nekategorisani putevi i ko je nadležan za njihovo održavanje?
527	PRP7JXKPVRMGTCMI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	119	Ko popravlja nekategorisani put?
528	WSTDHLDSIZ10L3U1	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	120	Da li auto-put mora da ima zaustavnu traku?
529	HF4TW10YI3HWDHXM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	120	Da li na autoputu postoji zaustavna traka?
530	CMFGWG8N1VW2WIVU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	120	Mora li Autoput da ima zaustavnu traku?
531	JICIIGNRY9PZZF4B	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	120	Da li auto put mora da ima zaustavnu traku?
532	STPPQNEPLVEUKMSL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	120	Morali auto put da ima zaustavnu traku?
533	MCGCSADFQRU1QH23	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	121	Na osnovu čega se obavlja međunarodni prevoz putnika i tereta sa drugom državom?
534	EKZJSFQBMRS0SZTE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	122	Da li je moguće obavljati međunarodni prevoz putnika sa linijskom dozvolom zajedno sa podvozarom?
536	SZKQC4NDNTGO9NFW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	124	Da li postoje sezonske linije za obavljanje međunarodnog prevoza putnika?
537	3YMBVYC9PCLKGXOV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	125	Ko izdaje licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?
538	0RQ9JB2NTJCTDLHI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	125	Gde da izvadim licencu za pružanje staničnih usluga?
539	8JZ1S1BSHWZ8UTVI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	125	Treba mi licenca za pružanje staničnih usluga?
540	5XT1N7AIZZGS8QAH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	125	Kako da izvadim licencu za pružanje staničnih usluga?
541	ROJOSAZUNRDI7F7U	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	126	Koji zakoni regulišu oblast putne infrastrukture?
542	JL3RNTNVP2RADEWG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	126	Koji zakon se odnosi na putnu infrastrukturu?
543	GQ36IVYM5D7TZDNF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	127	Ko je nadležan za popravku trotoara i biciklističkih staza uz državni put u naselju?
544	7PR55PG2CGOJRR1R	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	127	Ko popravlja trotoare uz državni put u naselju?
545	X4VFZFSXVUY1X0HI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	127	Ko popravlja biciklističke staze uz dravžni put u naselju?
546	U9PNOUH80AR4F5KV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	127	Ko održava trotoare uz državni put u naselju?
547	0ZQFKIVFURLTIIM8	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	127	Ko održava biciklističke staze uz državni put u naselju?
548	EHPLSFLTOVJWAVZ8	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	127	Ko je nadležan za trotoare uz državni put u naselju?
549	GHHNQDR2WWY7ER0O	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	127	Ko je nadležan za biciklističke staze uz državni put u naselju?
550	SV2BIXQ1AI2WO0BN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji putevi spadaju u opštinske?
551	X5RDRAI55B8JC9HL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji su državni, a koji opštinski putevi u Republici Srbiji?
552	0YAUDNXASTA5BNCO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji su državni putev?
553	Q7OTJELWORGKUUSG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji su opštinski putevi?
554	PFVGFMJYPTEKI4LL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji su lokalni putevi?
555	A5MHMBUL6YGZNTRY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji putevi spadaju u državne?
556	GTKIBQLVYQUSEL3F	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	128	Koji putevi spadaju u lokalne?
557	JG3VHMX3IRLHLX1J	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	129	Da li prevoznik mora lično da preuzme ili razduži dozvole i licence za prevoz sertifikat za lice odgovorno za prevoz ili drugu dozvolu za prevoz putnika?
558	HBHVQHO7MYCLSYJQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	129	Da li se dozvole za prevoz lično razdužuju?
559	YDFIOKXQUTVBRBCY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	129	Da li se licence za prevoz lično razdužuju?
560	UBVZUEDUTWHSOLDY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	129	Da li se sertifikat za odgovorno lice lično razdužuje?
561	PQVACGREYJYJOSOL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	130	Koji zakon reguliše oblast drumskog prevoza putnika?
563	NWVCLFLNFBES28XJ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	130	Koji zakon uredjuje oblast drumskog prevoza putnika?
564	VJBO0EKOB1JDMXC3	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	131	Koja je cena taksi?
565	OG0WYJD6HERKMUKO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	131	Da li je potreban zahtev uz takse?
566	ZPBM6ABMHHDYSEAV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	131	Koje takse se plaćaju?
567	P46SDZ7MC6D472T0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	131	Koliko iznose takse?
568	WJMBEATOOHWWVVFH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	131	Koliko iznose takse uz zahtev?
569	OFQMA9VOB46KQXHX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	132	Da li je dozvoljeno obavljanje taksi prevoza na teritoriji jedinice druge lokalne samouprave?
570	QKNLKURQ3IMWOHQ0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	132	Da li mogu da taksiram u drugoj opštini ili gradu?
571	D4EMPTNMWQNX7IZA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	132	Da li je moguće baviti se taksi prevozom u drugoj opštini ili gradu?
572	0S5LY6GZL6LI9D3I	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	133	Da li je potrebno posedovati posebnu dozvolu za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju?
573	YAQO60YWEZLFZ4TT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	133	Da li mi treba posebna dozvola za vanlinijski prevoz putnika?
574	TSIOG2V84BAS0WWF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	133	Koja dozvola mi je potrebna za obavljanje vanlinijskog prevoza putnika?
575	EBK0GT1QBLCUOM18	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	134	Ko je nadležan za popravku semafora u određenom naselju na državnom putu?
576	5TIMGLVTNZL5SVLX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	134	Ko je nadlezan za popravku semafora u naselju na drzavnom putu?
577	0XDXQR4TVESHK0KO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	134	Ko popravlja semafore u naselju na drzavnom putu?
578	6X891SCDURA7NN2S	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	134	Kome da prijavim da ne radi semafor u naselju na drzavnom putu?
579	WFKPYYKW0USSXBIY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	135	Koja je procedura kada izgubim dozvolu?
580	PHH6VFILC01C8GFZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	135	Izgubio sam dozvolu za prevoz. Šta da radim?
581	J4JENECTCTOJBMWD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	135	Šta da radim ako sam izgubio dozvolu za prevoz?
582	KG5A7FXQCTSP8BZ7	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	136	Gde je moguće pronaći uputstvo i zahtev za izdavanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?
583	PQXDCR3UNMRPNLXG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	136	Treba mi sertifikat o osposobljenosti za obavljanje prevoza?
584	DYLV73O2LIPT1QVK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	137	Koji zakon reguliše oblast drumskog prevoza tereta?
585	WSH0KSBBWM4CCLB4	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	137	Koji se zakon odnosi na oblast drumskog prevoza tereta?
586	QNEDU7E271QTMV0M	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	137	Koji zakon uređuje oblast drumskog prevoza tereta?
587	3ZYUIVGB1VBKYS7S	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	138	Ko je nadležan za popravku kolovoza u ulici?
588	EVLA79RUOOTE7OBJ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	138	Ko popravlja rupe na kolovozu?
589	SEQDRU6TSCBIZO5C	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	138	Ko odrzava kolovoz?
590	WFYXCOEUBROGXVUF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	138	Ko popravlja ulice?
591	YGO5GYSAXJ27OKYW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	138	Ko odrzava ulice?
592	AZI6J7HTAM64ZUL7	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	139	Šta je potrebno za izdavanje rešenja za postavljanje saobraćajne signalizacije za vreme izvođenja radova ( ili održavanja manifestacije) na državnom putu?
593	ZBDDPLMEQRXQHSXD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	140	Kada se utvrđuje pojedinačni plan raspodele?
594	NJNCJFRZJJBXUPII	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	140	Ko utvrđuje pojedinačni plan raspodele dozvola?
595	KG4N7JYKNFO7VUML	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	140	Ko utvrdjuje pojedinačni plan raspodele dozvola?
596	IGEBI3BAXSG9NB4M	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	141	Kada se podnosi zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika?
597	LMBPLCUZLVLJGV8U	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	141	Koji je rok za podnošenje zahteva za produženje roka važenja međunarodne dozvole za linijski prevoz putnika?
598	EPFAO6DTBUWOD2CN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	141	Koji je rok za podnošenje zahteva za produženje roka važenja medjunarodne dozvole za linijski prevoz putnika?
599	RFCIKV8BA7BOM9ED	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	141	Kada mogu da podnesem zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika?
600	JQVRLWTSP6QLBJYG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	141	Kada mogu da podnesem zahtev za produženje roka važenja medjunarodne dozvole za linijski prevoz putnika?
601	CEKPP7JXEZU5ADBV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	142	Ko vrši isplatu ekspropisanog zemljišta za izgradnju puta?
602	F0YTWAHBLNDJ0QSB	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	142	Kako da naplatim zemljište kroz koje je prošao put?
603	MKKKXMKYJHAT3VDO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	142	Kroz moje zemljište prolazi put, kako da naplatim?
604	U6PKPNXVSW0LZKDD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	142	Kako da naplatim eksproprijaciju zemljišta?
605	XWEO1LKOUF6XITBN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	142	Zemljište mi je u fazi eksproprijacije zbog izgradnje puta. Kako da naplatim?
606	YQ9BHRQUUDF8IMR5	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	143	Da li probijanjem roka za vraćanje/razduživanje dozvola prevoznik trpi neke sankcije?
607	XOCBKTM5TBQIP3K8	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	144	Do koje najveće dozvoljene mase vozila nije potreban izvod licence za prevoz?
608	BHIW8WYNVXAFMGHA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	144	Za koju dozvoljenu masu nije potreban izvod licence za prevoz?
609	9X2H1ZCORSK66KRR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	144	Imam vozilo ispod 3.5 tone, da li mi je potreban izvod licence za prevoz?
610	3MB9DQ129BQ1SDXC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	144	Da li mi je potrean izvod licence za prevoz?
611	YTYZBYTYD03WYLFL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	145	Šta još treba razdužiti sa dozvolom za prevoz putnika i tereta?
612	8CSOEWWZTVBJEIW4	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	146	Ko razmenjuje međunarodne dozvole za prevoz tereta sa drugim državama?
613	QKTIDUCXQ5YLPWIA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	147	Ko je nadležan za sanaciju udarnih rupa na državnom putu?
614	LGRQ4WI5VYCXLM0R	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	147	Ko popravlja rupe na drzavnom putu?
615	Z9YICK6QXRLE2H9B	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	147	Ko krpi rupe na drzavno putu?
616	6FDSLQKV3OLTGYHH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	147	Otvorila se pupa na drzavnom putu
617	WPH3B9PPIBNETVD5	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	147	Kome da prijavim rupe na drzavnom putu?
618	E710IJX8ZNWPECZN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Ko izdaje međunarodne dozvole za linijski prevoz putnika?
619	PT7VTOQIRAGRKCQL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Kako da dobijem međunarodnu dozvolu za linijski prevoz putnika?
620	V8EQAZA2IMWYBGSM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Kako da dobijem medjunarodnu dozvolu za linijski prevoz putnika?
621	YFQWNSYSJZ93HTFM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Treba mi medjunarodna dozvola za linijski prevoz putnika
622	NDACBO4CKC7A2U8P	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Treba mi međunarodna dozvola za linijski prevoz putnika
623	OH2MIFDLAJMTCGXL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Gde da izvadim medjunarodnu dozvolu za linijski prevoz putnika?
624	UPNEY5C8CQMC7DZ0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	148	Gde da izvadim međunarodnu dozvolu za linijski prevoz putnika?
625	ASJACFXDWOGRYEAD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	U kom periodu se podnosi zahtev za registraciju i overu reda vožnje za međumesni linijski prevoz putnika?
626	Y4C08FZQIRHMI4U1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	Kada se podnose zahtevi za registraciju i overu redova vožnje za međumesni linijski prevoz putnika?
627	81JO6YIA1EQLKHJF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	Kada se podnose zahtevi za registraciju i overu redova vožnje za medjumesni linijski prevoz putnika?
628	E4OB8VYTHNZ9PAL3	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	Kada mogu da podnesem zahtev za registraciju i overu reda vožnje za međumesni i linijski prevoz putnika?
629	AUQHRN3GWCSQFQBV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	Kada mogu da podnesem zahtev za registraciju i overu reda vožnje za medjumesni i linijski prevoz putnika?
630	G1GQPKJQWRF2PSHV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	Koji je rok za podnošenje zahteva za za registraciju i overu reda vožnje za međumesni i linijski prevoz putnika?
631	9YLLST3EDFPWJE2B	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	149	Koji je rok za podnošenje zahteva za za registraciju i overu reda vožnje za medjumesni i linijski prevoz putnika?
632	RN9WRIHGGVQU1CLG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	U kom periodu se preuzimaju registrovani red vožnje za međumesni linijski prevoz putnika?
633	BYXUFMFTMUSKZKJA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	Kada se preuzimaju registrovani redovi vožnje za međumesni linijski prevoz putnika?
634	L1WCLXVY6V4YANUS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	Kada se preuzimaju registrovani redovi vožnje za medjumesni linijski prevoz putnika?
635	EIQUWPWHNUWTRZNA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	Kada mogu da preuzmem registrovan red vožnje za medjumesni linijski prevoz putnika?
636	9QZL2XGJDNVFFASG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	Kada mogu da preuzmem registrovan red vožnje za međumesni linijski prevoz putnika?
637	1F9DUV6WIBCTVJZC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	Koji je rok za preuzimanje registrovanog reda vožnje za međumesni linijski prevoz putnika?
638	JGXZD5ERX4OC2VLM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	150	Koji je rok za preuzimanje registrovanog reda vožnje za medjumesni linijski prevoz putnika?
639	WJZELNCU647K6LS0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	151	Od kada počinju da važe registrovani redovi vožnje za međumesni linijski prevoz putnika?
640	61LIW3NTU4HTH6MV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	152	Gde je moguće pronaći uputstvo i zahtev za izdavanje licence za prevoz?
641	R6X5KDXCCR25Y6LY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	152	Kako da podnesem zahtev za izdavanje licenci za prevoz?
642	VSNOSQ3CFJHV6CTJ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	152	Gde mogu da podnesem zahtev za licencu za prevoz?
643	SNBR3HD4WAX2OS7C	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	152	Treba mi licenca za prevoz?
644	07KFL7YGPRZXTHMT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	153	Kada se podnosi zahtev za produženje roka važenja licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?
645	SLCBHUPFRIW2YBA6	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	153	Kako da podnesem zahtev za produženje roka važenja licence za pružanje staničnih usluga?
646	HYE6UCWNDME4POBA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	153	Treba da podnesem zahtev za produženje roka važenja licence za pružanje staničnih usluga?
647	SGXYCOWFY3YNJ9SU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	154	Ko je nadležan za održavanje sistema za odvodnjavanje državnog puta u naselju?
648	CQP1W30JDHR9LTUD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	154	Ko održava odvod državnog puta u naselju?
649	SBN3YMGTS9HQKVHC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	154	Ko popravlja odvod državnog puta u naselju?
650	AXTH9FZF8VS3RVT8	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	155	Šta je to Interbus sporazum?
651	7XTQXSI3X62JFPWK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	156	Ukoliko se obavlja prevoz po osnovu Interbus sporazuma da li je potrebna posebna vanlinijska dozvola?
652	OHM38UYB0A8LGONS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	157	Do kada država daje subvencije za taksi prevoznike?
653	XSQSE8FJPNTZCRUO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	157	Do kada mogu da apliciram za subvencije za taksi prevoz?
654	X9J9TV6EPC29PU1C	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	157	Postoje li subvencije za taksi prevoz?
655	U89BQHHBJGA5BZL0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	157	Koji je rok za podnosenje zahteva za subvencije za taksi prevoz?
656	WGTN3V1QLLWG0Y3N	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko u Srbiji ima autoputeva?
657	4ZTGEFWPVPXXOFYA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koja je dužina autoputeva u Srbiji?
658	ZOA5DOTNKR8FDZ3N	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koja je duzina autoputeva u Srbiji?
659	QIDV9DVG9T97RBSZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko u Srbiji ima auto puteva?
660	TAT4RNPKKGJAWDAD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koja je dužina auto puteva u Srbiji?
661	BCO3URGNMZIOVNKI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koja je duzina auto puteva u Srbiji?
662	UJEDKW12ZXKFV3K9	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko u Srbiji ima kilometara auto puta?
663	ZCSPXJMF6SXPESXD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko u Srbiji ima kilometara autoputa?
664	PKAMENQPHWXXQ1T9	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko je izgrađeno auto puteva u Srbiji?
665	TDLV6XV0OAVSTZIK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko je izgrađeno autoputeva u Srbiji?
666	ZS3R5K9T4PB14ZVE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko je izgradjeno autoputeva u Srbiji?
667	TAMV7I6HISVGKQUY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	158	Koliko je izgradjeno auto puteva u Srbiji?
670	ICXALASQ3JZBOOWF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	160	Kako se zove brzi voz od Beograda do Novog Sada?
671	1HB6JKDG543WLBTE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	160	Kako se zove brzi voz koji povezuje Beograd i Novi Sad?
672	SD5SRGDEUVHTB2EF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	161	Koja je prednost Otvorenog Balkana?
673	PODRZ3JYBKDMDLJA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	161	Šta je to Otvoreni Balkan?
674	TAPLSMDTNIKCXMNY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	161	Sta je to Otvoreni Balkan?
675	G60GDKTEXGOHPVDD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	162	Koliko traje koncesija za Aerodrom Nikola Tesla?
676	IO1EEVFLA9EMR6XW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	162	Koliko traje koncesija za aerodrom u Beogradu?
677	9NCWTBFLL6A8SBJM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	162	Koliko traje koncesija za beogradski aerodrom?
678	KN9VAPGRYN5V5QKI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Koje su prednosti novog Zakona o planiranju i izgradnji?
679	EM9G2FISJHOUUWVV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Koje su novine u Zakonu o planiranju i izgradnji?
680	VMJ8QMGHWY57DKVU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Šta se unapređuje novim Zakonom o planiranju i izgradnji?
681	SKKZZYOKBAU9IRHC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Sta se unapredjuje novim Zakonom o planiranju i izgradnji?
682	TOY9NMZK5VFMY1OX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Koje su prednosti izmena Zakona o planiranju i izgradnji?
683	O9PCQMPZCXFWP9F6	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Šta donose promene Zakona o planiranju i izgradnji?
684	YNGOBZMZR4JPFPFA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	163	Sta donose promene Zakona o planiranju i izgradnji?
685	8UQOQXCVTC1MRAF5	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	164	Šta je to zelena gradnja?
686	141VXNXYMHMNETLI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	164	Sta je to zelena gradnja?
687	QSYIP1VCUD4IWIAH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	164	Kako drzava stimulise zelenu gradnju?
688	DM1XSOFGLQB8SREQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	164	Kako država stimulište zelene gradnju?
689	H5IV0998GLSYMIGK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	165	Šta je to sertifikat zelene gradnje?
690	EKPH5KHTPAI0UU1K	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	165	Sta je to sertifikat zelene gradnje?
691	PWPLHDTXQHKJ1W6J	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	165	Kako da zgrada dobije zeleni sertifikat?
692	JR0BPA6ECYAD9RG0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	165	Šta je to zeleni sertifikat?
693	KZS8MWN2BXMFJ1GT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	165	Sta je to zeleni sertifikat?
694	DJ0LL2TOMRG7U14A	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Gde mogu da vidim red vožnje voza SOKO?
695	KLTA6C60OZJNBPHE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Gde mogu da vidim red voznje voza Soko?
696	FSJ7KX74V5KQUMFV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Gde mogu da vidim red vožnje vozova?
697	92DXHWZSTMZOIKIS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Gde mogu da vidim red voznje vozova?
698	JWCU021PBBLF6ZOO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Potreban mi je red vožnje vozova
699	AES4OSKOYSF2M4BZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Potreban mi je red voznje vozova
700	7EW8UWIBWJIP1IVW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Gde mogu da nadjem red voznje vozova
701	5D3SPTEWYHL61DYH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	166	Gde mogu da nađem red vožnje vozova
702	IAOJIDLKM8QYAHK1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Kako se stimuliše energetska efikasnost zgrada?
703	HFOLJOQYAQDLP5LL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Kako se stimulište energetska efikasnost kuća?
704	G8RWPOA4CRSZUV2L	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Kako se stimuliše energetska efikasnost objekata?
705	H8KJUKP6MX9R8Q1B	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Kako se stimulise energetska efikasnost zgrada?
706	XGK9DQIGGOHC9GW0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Kako se stimuliše energetska efikasnost kuca?
707	FQLI0NTN79Y8SPOX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Da li postoji neki program za energetsku efikasnost?
708	85ASUUHPZZNPZC7G	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	167	Postoje li projekti vezani za energetsku efikasnost?
710	2LID1CDJCBLADUWT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	169	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (RegioEkspres)?
711	WQCOSFSAUTTYLG0Q	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	169	Koje su stanice voza Regio Ekspres?
712	Z9NP80X9IZJ4GVL5	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	169	Gde sve staje voz Regio Ekspres?
713	B0EFEFXPKMGEKEE3	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	170	Da li se i kada planira ponovno uspostavljanje železničkih linija koje su ukinute u proteklom periodu?
714	HCSHVESZ4PZ1CTVW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	170	Kada će ponovo biti uspostavljene ukinute železničke linije?
715	CEDX0XOBI19ONOMM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	170	Da li će biti obnovljene ukinute železničke linije?
716	EEEXTOG0IEDUIZJU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	170	Hoćete li obnoviti ukinute železničke linije?
719	TTZSFS0T3ILYJAZO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	173	Kako se reglulise saobracaj na putnim prelazima?
720	ELGSPU5TF2QIVKVE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	173	Kako se reguliše saobraćaj na putnim prelazima?
721	KL95RKTRX7UMO2QO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	173	Kako se reguliše sa saobraćaj na pružnim prelazima?
722	XH7W3GGVZ2GT1VBZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	173	Kako se reguliše saobraćaj na prelazima preko pruge?
723	EVYPQL9LVKPONGPF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	173	Kako se regulise saobracaj na prelazima preko pruge?
724	4QBN98SQJ2D2IH9T	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	173	Regulisanje železničkog saobraćaja na putnim prelazima?
709	V1FTLGGCFBJRHX58	2023-06-27 18:39:50	2023-06-28 19:28:36	2023-06-28 19:28:36	168	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?
718	O4R0VWPTR1H9CPVG	2023-06-27 18:39:50	2023-06-28 19:29:04	2023-06-28 19:29:04	172	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?
726	JIHZHKK0E6LRAGXA	2023-06-27 18:39:50	2023-06-28 19:30:00	2023-06-28 19:30:00	175	Informacije vezane za projekte koji su trenutno u realizaciji?
727	CKC6YN0DRGPNZNNC	2023-06-27 18:39:50	2023-06-28 19:30:11	2023-06-28 19:30:11	176	Informacije vezane za projekte koji su trenutno u realizaciji?
736	1VQAQHKQAVUIMOIJ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	184	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (Regio vozovi)?
737	JKILIX1TE4DMPTME	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	184	Gde staja Regio vozovi na liniji Beograd - Novi Sad?
738	IWMXNFGIJWRWGUHC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	184	Koje su stanice regio vozova na liniji Beograd - Novi Sad?
739	LRH6DVQWE5KXICZX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	185	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (SOKO)?
740	C8HCRGFR4KX3P6PX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	185	Koje su stanice voza Soko?
741	BQJIUHZ88WANZ0UU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	185	Gde staje voz Soko?
742	UACWF3A3MVFOKZJK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	185	Gde staje brzi voz Beograd - Novi Sad?
743	DJKPLXWICSGFSIGP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	186	Koji privredni subjekti mogu konkurisati za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
744	ETFJQX6DKSIW6JZD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	187	Koja je cena vozne karte i prevoza automobila na relaciji Zemun – Bar?
745	FJUJCEV4DMV9IK1Z	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	187	Koja je cena prevoza automobila vozom od Zemuna do Bara?
746	TQLT8IQMSL66IIR6	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	187	Koja je cena prevoza automobila vozom do Bara?
747	UIWCZEH3IE4Y6DWZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	187	Koliko košta prevoz automobila vozom od Beograda do Bara?
748	JALOIAJQVO2SUX93	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	188	Zašto vozovi pri ulasku u naseljeno mesto koriste sirenu?
749	9BQD7SYAGL4JZ560	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	188	Da li vozovi mogu da pređu putni prelaz bez korišćenja sirene?
750	OORT8CEHJLJ6FG2M	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	188	Da li mašinovođa može da smanji zvučnu signalizaciju tokom noći, prilikom nailaska na putni prelaz?
751	HCXETUNELDUE3UWT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	189	Da li će biti zapošljavanja u kompaniji Srbija Voz?
752	C0EQLI1QDVA6TF6A	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	189	Kako mogu da se zaposlim u Srbija vozu?
753	PZMLO5TTFSE1LLBY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	189	Da li mogu da se zaposlim u Srbija vozu?
754	UDTEYIWHSCZHB5VA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	190	Da li planirate nova ulaganja u vozove?
755	BL8IRRHHCM3U0QJY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	190	Da li se planiraju nova ulaganja u vozove?
756	BNNSWIRRTXAIBVQN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	190	Kada će biti kupljene nove lokomotive?
757	BUXOYZQCAMYSQGX0	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	190	Dali će biti nabavka novih lokomotiva?
758	JDZAFB4MGGUBEPKM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	191	Da li će biti dodatnih polazaka vozova za Novi Sad u toku „Exit“ festivala?
759	F2XFRITECU4R1VXR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	191	Da li će više vozova ići za Novi Sad za vreme Exita?
760	ZIFXZAJFBF7SAHQI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	191	Da li će biti više vozova za Novi Sad za vreme Egzita?
761	4IZVAQTKHED40HPG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	192	Kako može da se kontaktira neka od službi kompanije Srbija Voz?
762	F6ZIM3PNCSZ6RTWI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	192	Koji je kontakt kompanije Srbija voz?
763	ACLTIKLYVMNZ1GC1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	192	Treba mi broj telefona Srbija voza
764	FDBV1RNW0KJADHZC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	192	Kako da kontaktiram Srbija voz?
765	DL6QUHUSWJ19KMVD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	193	Kako može da se pošalje prijava za posao u kompaniji Srbija Voz?
766	GHZKH2TMMJAQGIYB	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	193	Kako da se prijavim za posao u Srbija vozu?
767	OLIY8AZKM0CLNGJ7	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	193	Kako da apliciram za posao u Srbija vozu?
768	EAM4IUNLAUA2TXU1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	194	Da li Srbija Voz ima turističke ponude vozom Nostalgija i Šarganska osmica?
769	7TQQB0BQELTPMCLQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	195	Da li žene rade kao mašinovođe u kompaniji Srbija Voz?
770	1PTBHAMCBMTZKVXN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	195	Da li žene mogu da rade kao mašinovođe?
771	3JKQSQCHIT8LFYH7	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	195	Da li žena može da bude mašinovođa?
772	VFMDTZPE6Q486AIW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	195	Da li žene rade kao mašinovodje u kompaniji Srbija Voz?
773	8GWESTUAJDQAYCMW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	195	Da li žene mogu da rade kao mašinovodje?
774	KQOH8OGZ0F9X9GOQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	195	Da li žena može da bude mašinovodja?
775	XIGQP2ZSNAYY0EEL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	196	Da li postoje popusti i posebne ponude za grupna putovanja vozom?
776	GMCS41C0CVQOMLNM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	196	Da li su cene niže za grupna putovanja vozom?
777	LL1XLNEN9L4PYPB3	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	197	Da li postoji internet kupovina voznih karata?
778	DAC4NNB00DLEXWCW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	197	Da li mogu da kupim kartu za voz putem interneta?
779	WUJ3LGTAJ6LLSHCX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	197	Kako da kupim kartu za voz preko interneta?
729	9YEG71HBLMTWR3OF	2023-06-27 18:39:50	2023-06-28 19:33:37	2023-06-28 19:33:37	178	Kada je planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila?
731	PNMI7RUZOGRU7XC2	2023-06-27 18:39:50	2023-06-28 19:38:21	2023-06-28 19:38:21	179	Da li se u narednom periodu planira ponovno uspostavljanje železničkih linija koje su ukinute?
732	A1GGM1YQHTJKVZ1G	2023-06-27 18:39:50	2023-06-28 19:40:21	2023-06-28 19:40:21	180	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?
733	GBM2HIA0ZU8PZCWS	2023-06-27 18:39:50	2023-06-28 19:40:34	2023-06-28 19:40:34	181	Regulisanje železničkog saobraćaja na putnim prelazima?
734	QJN4GBNDT4N2ELGO	2023-06-27 18:39:50	2023-06-28 19:41:22	2023-06-28 19:41:22	182	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?
735	F5RH42DSPUJMMBBH	2023-06-27 18:39:50	2023-06-28 19:43:17	2023-06-28 19:43:17	183	Poteškoće kupovine karata za putovanje vozom preko aplikacije i sajta preduzeća „Srbija Voz“ a.d?
782	EQUISJUXS0GYQ6RG	2023-06-27 18:39:50	2023-06-28 19:44:46	2023-06-28 19:44:46	199	Koje je radno vreme Železničkog muzeja?
780	OEKHCPPAFU2OMTTY	2023-06-27 18:39:50	2023-06-28 19:45:46	2023-06-28 19:45:46	198	Potrebne su mi infromacije o SRB plus kartici?
781	WZ1PNKIR0XFAR4BR	2023-06-27 18:39:50	2023-06-28 19:45:46	2023-06-28 19:45:46	198	Sta je to SRB plus kartica?
784	8SXMU0ROWT4QN5DK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	200	Da je potrebno najaviti grupne posete za Železnički muzej?
785	DTJJVINAAYGTKJBR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	200	Kako da najavim grupnu posetu Železničkom muzeju?
786	NZNQRHG83YZPFBKU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko obezbedjuje saobracaj na prelazima preko pruge?
787	IJM4KJEYBCMXYO6C	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko obezbeđuje saobraćaj na prelazima preko pruge?
788	GD325Q1XKZYXRRC3	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko je nadlezan za postavljane signalizacije na putnim prelazima?
789	O8QCNAATCGNBZLOB	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko je nadležan za postavljanje signalizacije na pružnim prelazima?
790	MMETTV3UMGBSAVRC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko je nadlezan za postavljanje signalizacije na pruznim prelazima?
791	33UKPJU6CEPORXTW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko postavlja branike na prelazima pruge preko puta?
792	JTRN1VJZKTJJMWMS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko postavlja branike na putnim prelazima?
793	IQATHR1QLCYATJ2Y	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko postavlja branike na pružnim prelazima?
794	EIDTVYKXISNBTTVZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko postavlja branike na putnim prelazima?
795	C2IBVOKJRUQ1OFSK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko je nadležan za obezbeđenje saobraćaja na putnim prelazima preko pruge (postavljanje branika, saobraćajnih znakova na putu, itd.)?
796	UBZAKE8JA3WHJUB6	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	201	Ko obezbeđuje saobraćaj na prelazima preko pruge?
798	HFHRXR6TSTO2GOT3	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	203	Na koji način se obezbeđuju pružni prelazi na prugama za velike brzine?
799	BGDFOKCZWSRMGHUS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	203	Na koji nacin se obebedjuju pruzni prelazi na prugama za velike brzine?
800	FS68QZAXD2ICRTNE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	203	Kako se obezbeđuju putni prelazi na prugama za velike brzine?
801	XSXLI3DKI6L6UEOZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	203	Kako se obezbedjuju putni prelazi na prugama za velike brzine?
802	CIBUR6P3CBLZK2YC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	203	Na koji način se obezbeđuju putni prelazi na prugama za velike brzine?
803	NLUNX4GSCRRTZMYL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	203	Kako se obezbeđuju putni prelazi na brzim prugama?
804	LIJOOGE12J8E0CNE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	204	Ko je nadležan za otvaranje novih i zatvaranje postojećih putnih prelaza?
805	XZVCBMAITQSMLWRP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	204	Da li je moguće da se otvori novi putni prelaz preko pruge?
806	V24XFXFSDVQSTLTH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	204	Može li da se zatvori putni prelaz preko pruge?
807	KCUDTSNJJRAU05OL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kako da prijavim da ne rade branici na putnom prelazu?
808	M0KTUQT8PTMRI5UN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kako da prijavim da ne rade branici na pruznom prelazu?
809	IT8F1LXVBBSOGDGW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kako da prijavim da ne rade branici na pružnom prelazu?
810	7TUXCQDGICVQEZ7I	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kome da prijavim da ne rade branici na putnom prelazu?
811	8MVKC2QHJPTRCAVO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kome da prijavim da ne rade branici na pruznom prelazu?
812	XAOLHLMVTMWLJXH1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kome da prijavim da ne rade branici na pružnom prelazu?
813	FLH0N55XSKAIH43J	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kome se može prijaviti neispravan rad uređaja na putnom prelazu?
814	QQ161EGRPIYYDOMT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Kako da prijavim neispravne rampe na putnom prelazu preko pruge?
815	SMVOQXNCEGOCZ1DA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	205	Rampe na prelazu preko pruge nisu ispravne. Kome da prijavim?
817	OFTGQQS5JRDAVVLP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	207	Kako se treba ponašati u neposrednoj blizini kontaktne mreže?
819	IV5C76ZYPEORQ7RT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	209	Na kojim mestima i pod kojim uslovima je dozvoljen prelazak pruge?
820	7ULGOUZRYLXVL7PS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	209	Gde mogu da predjem preko pruge?
821	7YLGMA1XZHCCO56X	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	209	Gde je dozvoljen prelazak preko pruge?
822	6EV0NNMBT1GSSHFO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	210	Ko je odgovoran za bezbedno i nesmetano odvijanje železničkog saobraćaja?
823	CODSVLDN0NVVSROY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	211	Kada će biti izgradjena brza pruga do Nisa?
824	QX7OWP4NZTGUZRDI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	211	Kada će biti izgrađena brza pruga do Niša?
825	17ZQCLAQ5SRJVBMM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	211	Kada će biti izgrađena brza pruga od Beograda do Niša?
826	RXNMNELSV9RYSXAF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	211	Kada ce biti izgradjena brza pruga od Beograda do Nisa?
827	IV82ZHGFQN6YS1ZG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	211	Kada će biti izgrađena brza pruga Beograd - Niš?
828	A1X27F0ZEKAZ6YMR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	211	Kada ce biti izgradjena brza pruga Beograd - Nis?
829	US1QNCCB84IQKFKS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	212	Kada će biti završeni radovi na izgradnji železničke stanice Beograd Centar u Prokopu?
830	FEWO2L8GNWSEWOJC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	212	Kada će biti završeni radovi na Prokopu?
831	YZO0TPI4LHEEVYON	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	212	Kada ce biti zavrseni radovi na Prokopu?
832	JJZBDEPPG71BTNUQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Kada će biti rekonstruisana barska pruga?
833	OEZYJ7RGDJE47JAZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Kada će biti rekonstruisana pruga Beograd – Bar?
834	Q8CDTT2JU2P4YCZP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Kada ce biti rekonstruisana pruga Beograd – Bar?
835	6YYOROGIQN5HSOHI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Kada ce biti rekonstruisana pruga ka Baru?
836	IOOQTG0NVA4KXRYE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Kada će biti rekonstruisana pruga ka Baru?
837	KMGXERBGYEZHVEVP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Da li se planira rekonstrukcija pruge Beograd – Bar?
838	WEAY5A4TKNEMDKNE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	213	Da li se planira rekonstrukcija pruge ka Baru?
816	PVJBS1YQ7L8Q7AOA	2023-06-27 18:39:50	2023-06-28 19:48:34	2023-06-28 19:48:34	206	Da li su vozači drumskih vozila dužni da se zaustave ispred putnog prelaza?
818	EJ2SYPHVPOORKRID	2023-06-27 18:39:50	2023-06-28 19:51:23	2023-06-28 19:51:23	208	Da li je dozvoljeno kretanje po otvorenoj pruzi?
839	EXWT9KL1V6UKPSDA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	214	Kada se može očekivati rekonstrukcija pruge Beograd – Šid?
840	NV4EONB3VCOH53LD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	214	Da li će se rekonstruisati pruga Beograd – Šid?
841	GF93HIJFRINNPO34	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	214	Da li ce se rekonstruisati pruga Beograd – Sid?
842	3HBNSE8QU0RETYAL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	214	Da li ce biti rekonstruisana pruga od Beograda ka Zagebu?
843	XBXIBHB3BSX01KOP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Koliko je neobezbeđenih putnih prelaza u Srbiji?
844	5LTSFIRMLDY9XSNQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Koliko je neobezbedjenih putnih prelaza u Srbiji?
845	FMWOZOVKOZ7ALM9Z	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Koliko je neobezbeđenih pružnih prelaza u Srbiji?
846	S67TOJ0AW4CXLBJT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Koliko je neobezbedjenih pruznih prelaza u Srbiji?
847	HZRHBPYK2QIOSKKI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Da li postoje neobezbedjeni pruzni prelazi?
848	OSSZAP6IG1MUYYLJ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Da li postoje neobezbeđeni pružni prelazi u Srbji?
849	XAGR00NL2H14UKHF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Da li postoje neobzbedjeni putni prelazi u Srbiji?
850	DSM4ZNDRXED4GVRQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	215	Da li postoje neobebeđeni putni prelazi u Srbiji?
851	IQFSQ35AUKQSYEHO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	216	Koliko kilometara pruga postoji u Srbiji?
852	XK56IX4P9LP5UWSQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	216	Koliko ima pruga u Srbiji?
853	8XEPZSYODTYLWLSZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	216	Koja je dužina pruga u Srbiji?
854	PWPJTNJVWRJAYEAH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	216	Koja je duzina pruga u Srbiji?
855	XC4DXMM68BZIXHVZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Da li je bezbednost saobraćaja ugrožena kada ne rade rampe na putnom prelazu?
856	FS7UEHJNEHHFZ4KY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Da li je bezbebednost saobracaja ugrozena kada ne rade rampe na pruznom prelazu?
857	GLW3SCFEDQSHWBAK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Da li je bezbebednost saobracaja ugrozena kada ne rade rampe na pružnom prelazu?
858	Q4KJFZIPUMQ0OV6O	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Šta ako ne rade rampe na putnom prelazu?
859	YK8GCARAWY5ZE4AM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Sta ako ne rade rampe na putnom prelazu?
860	S2LJ34MWE1E0CQOK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Šta ako ne rade rampe na pružnom prelazu?
861	N85BXC7SXSYP1SOR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	217	Sta ako ne rade rampe na pruznom prelazu?
862	KHUY8DIGEF5MYCE2	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko košta postavljanje rampi na putnom prelazu?
863	JEQBP5RLHJAD8YMB	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko kosta postavljanje rampi na putnom prelazu?
864	LKELWVTEIYQZBYUZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko košta postavljanje rampi na pružnom prelazu?
865	QBUDX9JPLKPQMB6B	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko košta postavljanje rampi na pruznom prelazu?
866	GRDFWWPTBICERDUT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko kosta postavljanje rampi na putnom prelazu?
867	AKTLDZ8MFR0Q1GP2	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko kosta postavljanje rampi na pruznom prelazu?
868	HUTKABMPJUTRZTWK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koliko kosta postavljanje rampi na pružnom prelazu?
869	PKITF33OUIF6CLER	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koja je cena postavljanja rampe na putnom prelazu?
870	FHYJORDC29PC6ZCH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koja je cena postavljanja rampe na pružnom prelazu?
871	NNTBJA5DGQDIX7DK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	218	Koja je cena postavljanja rampe na pruznom prelazu?
872	WN3HQWIIVZPPFGCF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Šta je najčešći uzrok nesreća na putnim prelazima?
873	NPWJLMFQN7DAUYFC	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Šta je najčešći uzrok nesreća na pružnim prelazima?
874	X7VWCLIVJHWGE4EM	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Sta je najcesci uzrok nesreca na putniim prelazima?
875	1ROV1TTYC6U4EZXP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Sta je najcesci uzrok nesreca na pruznim plazima?
876	VA0PXNIF1JKK7FGO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Zbog cega se dogadjaju nesrece na putnim prelazima?
877	I716YQR2DMZLPLNE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Zbog cega se dogadjaju nesrece na pruznim prelazima?
878	9TVHPMTVK2VDWQDO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	219	Zbog čega se događaju nesreće na pružnim prelazima?
879	0RHUCN5UF0BPXBQH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	220	Zašto voz isklizne iz šina?
880	1FWTVBAAMARMKBWS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	220	Zasto voz isklizne iz sina?
881	VZTINSVHPCHTR8FH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	220	Zašto voz isklizne sa pruge?
882	TASBSDJR5P5SZP04	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	220	Zasto voz isklizne sa pruge?
883	FESXIRPOERNTFW4U	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	221	Koliko ljudi godišnje strada od udara kontaktne mreže?
884	VO2OVMLPIFQVOC8O	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	221	Koliko ljudi godisnje strada od udara kontaktne mreze?
885	ZJUCNHWCJERLPZ0K	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	221	Koliko osoba godišnje strada od udara kontaktne mreže?
886	DMFJAQXGRYUOK6GN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	221	Koliko osoba godisnje strada od udara kontaktne mreze?
887	NEZSNVGPQ3VHLBYP	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	222	Koliko osoba godišnje strada na putnim prelazima?
888	MLZ4XUVCU8MDXOH8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	222	Koliko osoba godisnje strada na putnim prelazima?
889	RZGFDNZVNTCTHVEV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	222	Koliko osoba godišnje strada na pružnim prelazima?
890	PQUDTKIRFVWKJKFX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	222	Koliko osoba godisnje strada na putnim prelazima?
891	OX8NT49USMGU4AWY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	223	Koje kampanje sprovodi ministarstvo za bezbednost na pružnim prelazima?
892	WHNLKUG7FP08JPJU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	223	Koje kampanje sprovodi ministarstvo za bezbednost na pruznim prelazima?
893	5HZFJCW7IRUPYDD6	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	223	Koje kampanje sprovodi ministarstvo za bezbednost na putnim prelazima?
894	L9L2YN7DDVXJDQPT	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Koje su pruge u planu za rekonstrukciju?
895	UUD5AIZHT129INNV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Koje ce pruge biti rekonstruisane?
896	ZKHO9YV2FXLQ7PAN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Koje će pruge biti rekonstruisane?
897	4I3F8CUQAVCC7HU7	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Da li postoji plan za rekonstrukciju pruga?
898	KSTKZI1F1BC6EGTM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Gde mogu da vidim koje ce pruge biti rekonstruisane?
899	FPH0PLLMGF2EWTDR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Gde mogu da vidim koje će pruge biti rekonstruisane?
900	AJUWYRFRJHL652W3	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Koje će pruge da se grade?
901	SBIJKYOUNRT1QVPJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Da li će da se grade nove pruge?
902	WVHCLIFAGMWMAW5Q	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Koje ce pruge da se grade?
903	QG5XDOMQSIKKI3YI	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	224	Da li ce da se grade nove pruge?
904	MLAZKIU1XWZSJ3KZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	225	Koje su pruge modernizovane?
905	VASPJZWXGV5E4Z2D	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	225	Koje su rekonstruisane pruge?
906	KHNI5ZSKA5O3DVPO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	225	Gde mogu da vidim spisak rekonstruisanih pruga?
907	4UT3XNLORJONNYES	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	225	Gde mogu da vidim spisak modernizovanih pruga?
911	CNGYUTTYO0WOFKGX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	229	Kako postupa građevinski inspektor kada na objektu nastanu oštećenja usled izgradnje objekta na susednoj parceli?
912	WJQVC0ZCRTKQ11SM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome mogu da uputim prijavu za taksi prevoz?
913	XTXJQJOO3L9FCZQQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome da se obratim zbog problema sa taksi prevozom?
914	QI0C7JIEK85DY4XZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome da se obratim zbog problema sa taksistom?
915	UXDNRIDUJDZJIYSP	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kako da prijavim taksistu?
916	BU9IVGSKQUFHZ7QO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome da prijavim taksistu?
917	BCTSERPV3V6FZU19	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome da prijavim neprijatnost u taksi prevozu?
918	MDRROUE3F8YRHLYZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Taksista mi je naplatio prevoz više nego što je cena. Kome da prijavim?
919	DAAZLX1H4JK13OTJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome da prijavim divlje taksiste?
920	YFSKSD8XPFWVIKNH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	230	Kome da prijavim divljeg taksistu?
921	G8L26H6ALCPZ4XKH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	231	Kako građevinska inspekcija odlučuje o prioritetima u pokretanju inspekcijskog nadzora iz svoje nadležnosti?
922	3TJZ1VO3MXPKG7U9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	232	Koja dokumenta mora imati upravljač čamca u plovidbi?
923	UD7BLPWLLTZ3MJRS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	232	Koja dokumenta su mi potrebna da bih mogao da upravljam čamcem?
924	9PPMKPD0AEOTC6FA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	232	Koja dokumenta treba da izvadim da bih vozio čamac?
927	TONGC4LHIZ40HLSZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	235	Kome da uputim pritužbe na izlivanje otpadnih voda u kanale naseljenih mesta?
928	OZOVF8ME0AZNQUW2	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	235	Kome da prijavim izlivanje otpadnih voda u kanale u naseljenim mestima?
929	HIY90CQUPU0CQBAV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	235	Kanalizacija se izliva u kanale
936	M9UPYFWAUKBNRCM9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	239	Kome da prijavim nerealizovani polazak odredjene linije i kako da nadoknadim štetu?
937	IBV5CU5KX6ZW6CMS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	239	Kako da prijavim da se nije održao polazak na autobuskoj liniji?
938	SMHVCF2BXXMQW3PP	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	239	Kako da vratim novac jer se nije održao polazak na autobuskoj liniji?
939	D0U1X4GZ8OSS4MTB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	239	Kako da gratin pare jer se nije održao polazak na autobuskoj linij?
940	J0KTQLFYAS6OYA5N	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	239	Nije održan polazak na autobuskoj liniji. Šta da radim?
942	X382RQH0YQLEZRKY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	241	Gde se mogu postavljati plutajući objekti i privezišta za čamce?
943	EI6HKQESMOJH1RNK	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	241	Gde mogu da postavim splav?
944	TA2AH1JG5YEPLZ9J	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	241	Gde mogu da parkiram camac?
945	YLXWF7UGBZK7JBHI	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	241	Gde mogu da privezem splav?
946	GO5MWD07LJHWVNNJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	241	Gde mogu da privezem camac?
947	MXPRITYINPIR8I2Q	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	242	Prijave vezane za odvodnjavanje površinskih voda (zatrpavanje putnih kanala i/ili propusta, ili za nerešeno odvodnjavanje od puta do recipijenta.
948	8URDUPK74WNAPHWS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	243	Zašto građevinska inspekcija neće da izvrši rešenje kojim se nalaže uklanjanje bespravno izgrađenog objekta ili dela objekta?
949	KYFZSAJ0DEO8FG7H	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	243	Zašto građevinska inspekcija neće da sruši bespravno izgrađen objekat?
950	ZLK2GC7YSZP59T0X	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	243	Zašto gradjevinska inspekcija neće da sruši bespravno izgradjen objekat?
910	ZNQQHCYOEHSACJTR	2023-06-27 18:39:51	2023-06-28 19:56:45	2023-06-28 19:56:45	228	Zašto građevinski inspektor ne proverava upis ili promenu prava nosioca prava na katastarskim parcelama ili objektu u skladu sa zakonom?
925	A6283IM6G3MZJUCB	2023-06-27 18:39:51	2023-06-28 19:59:19	2023-06-28 19:59:19	233	Koja institucija je nadležna za izgradnju i obnovu postojećih trotoara duž državnog puta?
926	STKI6WJBM0QUOMZH	2023-06-27 18:39:51	2023-06-28 20:00:25	2023-06-28 20:00:25	234	Da li se čamac može registrovati u lučkoj kapetaniji prema mestu držanja čamca?
930	S4R6JEAUJYHMOIL2	2023-06-27 18:39:51	2023-06-28 20:01:44	2023-06-28 20:01:44	236	Da li mogu da vršim javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?
931	KMEBJ1S3K5Y0LNKV	2023-06-27 18:39:51	2023-06-28 20:01:44	2023-06-28 20:01:44	236	Da li mogu da prevozim 8 ili 9 putniika u kombiju?
932	WQHU8JKXTTLI8FFW	2023-06-27 18:39:51	2023-06-28 20:02:46	2023-06-28 20:02:46	237	Da li je prevoznik u obavezi da mi izda voznu kartu?
933	JGFO6JWL0AFSFLXR	2023-06-27 18:39:51	2023-06-28 20:02:46	2023-06-28 20:02:46	237	Da li moram da imam kartu za vožnju?
934	VMJTWWELLYKR0XGE	2023-06-27 18:39:51	2023-06-28 20:03:43	2023-06-28 20:03:43	238	Kome se upućuje pritužba na rad i postupanje profesionalnog upravnika stambene zajednice?
935	FZ839PZGF8UBOAG7	2023-06-27 18:39:51	2023-06-28 20:03:43	2023-06-28 20:03:43	238	Kako da dam pritužbu na rad profesionalnog upravnika stambene zajednice?
941	0YT8YJETLESEPG1A	2023-06-27 18:39:51	2023-06-28 20:04:53	2023-06-28 20:04:53	240	Šta je potrebno za priključivanje na državni put?
951	E1GT2C9DEH4BEXY7	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	244	Kome se upućuje zahtev za postavljanje saobraćajne signalizacije i bezbednosne saobraćajne opreme na putu?
952	6ZGRTRDT0PN2LDLK	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	245	Da li naša inspekcija izdaje rešenje za obavljanje limo servisa i koje uslove treba da ispuni privredno društvo ili preduzetnik?
953	FRNMIMB708NU68KX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	246	Kako da prijavim korupciju?
954	WOCLU5SFKWHWKBOW	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	246	Kako mogu da prijavim korupciju?
955	7R8KNG5RAK4XQPWJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	246	Želim da prijavim korupciju
956	K6BPHXE9BTDCZYB2	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	246	Mogu li da prijavim korupciju
957	E6UXO8QT7OH1CWSQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	247	Koji je kontakt Inspekcije ministrastva?
958	LKHMBGPRRDSKPOGQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	247	Koji je broj telefona inspekcije?
959	TXIXNGE0GZAPIO9F	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	247	Kako da dobijem inspekciju?
960	K3UIDZF1OD67RUMM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	247	Kako da prijavim problem inspekciji?
961	AM6HVIYMPJUDOBDE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	247	Kako da prijavim nelegalnu gradnju?
962	UJEQ8FJVVNJAVEVI	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	248	Zašto se ne može ostvariti javni uvid u planske dokumente, van radnog vremena nosioca izrade planskog dokumenta, odnosno zašto to nije moguće i vikendom?
963	UWV21J5VSS7LHNUN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	249	Da li može planskim dokumentom da se ubrza postupak eksproprijacije?
964	DXNLYWMLAQRRTK3S	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	250	Zašto se planovi pišu „previše stručnom terminologijom“, tako da zainteresovana javnost „ne može potpuno da razume planska resenja“?
966	I0UBGUU7OKIC2ZVE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	252	Da li može planskim dokumentom da se propiše visina eksproprijacije za nepokretnosti?
967	IKEBN1OA24OZNFHC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	253	Podnosenje zahteva fizickih lica za priznavanje „stranke u postupku“ u smislu Zakona o opstem upravnom postupku, u toku izrade planskih dokumenata.
968	PAX82XBD7XBIMFNN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	254	Zasto javni uvid u planski dokument ne traje duže nego što je propisano, 15 dana za rani javni uvid, odnosno 30 dana za javni uvid u planski dokument, u smislu da nije propisano da javni uvid ne može duže trajati?
969	E4HUPFBL4UNHMWGS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	255	Da li  informacija o lokaciji predstavlja informaciju od javnog značaja?
970	50WAZQFNSMOV2QVY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	255	Da li je informacija o lokaciji informacija od javnog znacaja?
971	VGCTTTQHLCHGKA25	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	256	Zasto gradjani nisu neposredno obavesteni o odrzavanju javnog uvida u planski dokument?
972	NNI6DKY5QYRFD2WD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	256	Gde mogu da saznam da li je pokrenut javni uvid u planski dokument?
973	IRUQZ73KUYQOZPLF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	256	Kako mogu da znam da li je pokrenut javni uvid u planski dokument?
974	3YPQL4LM0R0AWRJF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	256	Da li je pokrenut javni uvid u planski dokument?
975	0DHZ2JOA6TR5SXVX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Gde se nalaze planska dokumenta?
976	SRD1NI7HOTA3PNB5	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Gde se nalaze planski dokumenti?
977	2MAEWTQMQYP1ZBKN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Gde mogu da ostvarim uvid u planski dokument?
978	KTTGSTPGZQWTE9ZY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Kako da se ostvari uvid u planski dokument?
979	MIDZVSHDHEC79YTD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Kako da vidim planski dokument?
980	JCCFOVVTUDYKECQS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Hteo bih da vidim planski dokument?
981	Q0TA82XALYZRVDJE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	257	Gde mogu da vidim planski dokument?
982	8UJ32AHUBHNK03BR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	258	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na priključenje na komunalnu infrastrukturu i vlasništvo vodomera
983	9AVAGCFZ4IMIVGIV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	259	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na obavljanje komunalnih delatnosti za dve ili više jedinica lokalne samouprave
984	JXI2EAOHTQDIQM7O	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	260	Tumačenje odredaba Posebnog kolektivnog ugovora za javna preduzeća u komunalnoj delatnosti na teritoriji Republike Srbije
985	UHFWFNZQMW1DKHMA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	261	Tumačenje Zakona o komunalnim delatnostima u vezi primene člana 9. u pogledu načina poveravanja komunalnih delatnosti
986	KMSBGMEERDR1LIKR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	262	Predstavke građana koje se odnose na nezadovoljavajući kvalitet, obim ili kontinuitet pružanja komunalnih usluga
987	TXYELZ8TPPJERXZ4	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	262	Kome da prijavim loše komunlane usluge?
988	JWSLVXQEOWHGMWQO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	262	Ko je nadležan za komunalne usluge?
989	UCIUL9CHGYFCCJ9F	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	262	Kako da prijavim probleme sa komunalnim uslugama?
990	QYRKUJUVWPKZNOL8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	263	Do kada je rok za dostavu izveštaja u vezi obavljanja komunalnih delatnosti?
991	VO6OYXJRIAJGWD55	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	264	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na promenu cena komunalnih usluga
992	TET9RZMR9GYPHQOJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	265	Ko ima obavezu podnošenja Zahteva za otpočinjanje obavljanja komunalnih delatnosti?
993	ICK1LHKF4W3T0G4B	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	266	Da li je vršilac komunalne delatnosti u obavezi da Ministarstvu građevinarstva, saobraćaja i infrastrukture dostavi upitnik ili isti dostavlja jedinici lokalne samouprave?
994	2PGEX6X9HB73PLHO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	267	Gde se može vršiti pokopavanje posmrtnih ostataka umrlog odnosno da li groblje gde se preminulo lice pokopava mora biti u upotrebi?
995	VXMTMAVW4ZKZ2OBG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	268	Pritužbe na rad vršilaca komunalnih delatnosti
996	KZXQP7IVACDBXHRG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	268	Kako da prijavim komunalno preduzeće?
997	3X6DXYAEPMLDYBHV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	268	Smeće i otpad se ne odvoze danima. Kome da prijavim?
998	HBMVENLPVURQAEFA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	268	Smeće i otpad se ne odvoze danima. Kako da prijavim?
999	YI0PQSPAO2MTERNB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	269	Šta sve obuhvata obavljanje komunalne delatnosti pogrebna delatnost i koje uslove treba da ispune privredni subjekti koji bi da obavljaju navedenu delatnost?
1002	GTM7TXSOPOQ6WZZL	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	271	Koja je procedura za vršenje tehničkog nadzora čamca, odnosno plutajućeg objekta?
1003	Z4GGOXLLEBTBBDFO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	271	Koja je procedura za tehnicki nadzor splava?
1004	8V4LE1HBXJ3MDPB8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	271	Koja je procedrua za tehnicki nadzor camca?
1005	MAO5HBEJMMZF1TJT	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	272	Kada počinje primena pravilnika za čamce i plutajuće objekte za privredne i javne svrhe?
1006	N93GWYXLX0TFHEHO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	273	Koji su rokovi za primenu poglavlja 13.01 ES-TRIN standarda , Oprema broda (sidreni uređaji)?
1007	PTZP4CEGIIXZ70BN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	274	Koji su rokovi za primenu poglavlja 6.02 ES-TRIN standarda Kormilarski uređaji?
1008	RYXQM5BQBYWYN20R	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	275	Da li mogu da podnesem zahtev za pregled broda koji nije u mom vlasništvu?
1009	USOXCFV3ADQSQF6T	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	275	Zakupac sam broda. Da li mogu da podnesem zahtev za pregled broda?
1010	GKPFHSD3ECLSGRQO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	276	Koja je procedura overe tehničke dokumentacije za brodove unutrašnje plovidbe?
1011	ZRLEVTQT7ZUXSARV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	277	Šta je potrebno od dokumentacije za registraciju novonabavljenog čamca/plutajućeg objekta za privredne svrhe?
1012	HJ2DTUMC5KPPTOXV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	277	Zelim da registrujem camac
1013	XKOFJCO7KFJ0ENZX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	277	Kako da registrujem camac?
1014	N0JADHXWNEBIB60F	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	277	Sta mi je potrebno do dokumenata da registrujem camac?
1015	7ABUCDCEHHSEOFFQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	277	Sta mi je potrebno do dokumenata da registrujem splav?
1016	ESHPMCDLSYDAGM8A	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	277	Kako da registrujem splav?
1018	R67VQ1BPYQFX4UMP	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	279	Koji pregled sledi kada istekne plovidbena ili plutajuća dozvola?
1019	LHV4LJ1Q4RMC2JAW	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	279	Istekla mi je plovidbena dozvola. Sta treba da uradim?
1020	OTQ24U1JFX1V5HL9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	279	Istekla mi je plovodbena dozvola za camac. Koji pregled treba da uradim da bih je produzio?
1021	XCMMODUIVABHVKS8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	279	Istekla mi je plovodbena dozvola za splav. Koji pregled treba da uradim da bih je produzio?
1022	FCZAQF3OXHDTDTMH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	280	Kako mogu da proizvodom splavove?
1023	MV2PMFIOIR8SQZHZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	280	Koje uslove treba da ispunim da bih mogao da pravim čamac ili plutajući objekat?
1024	P0PEY8OS2ZQCKGKK	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	280	Da li mogu da se bavim izradom čamaca i splavova?
1025	0UBBYT8VPFMXRSVG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	280	Kako mogu da proizvodim čamce?
1026	GGLP1KHHGS5DC3QQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	281	Kako mogu da izvršim prenamenu čamca za sport i razonodu u čamac za privredni ribolov?
1027	EDNVOLVEMIWPZY1D	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	281	Da li mogu da čamac namenjen za sport i razonodu koristim za privredni ribolov?
1028	YXU4OVOTPXVWZYKZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	281	Potrebna mi je prenamena čamca
1029	BG7ZCZASYLJOEVYE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	281	Zelim da prenamenim čamac
1030	2PD6K82OCLGBKKTP	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	282	Kako da dobijem duplikate brodskih dokumenata koja su izgubljena?
1031	HRIFWIU0SJANI9MC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	282	Izgubio sam brodska dokumenta. Sta da radim?
1032	0OWZCRAK9LQ1VPUQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	282	Potrebni su mi duplikati brodskih dokumenata
1033	H5RLAF1JYULZP8KD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	283	Kako da podnesem zahtev za vršenje tehničkog nadzora plovila?
1034	HBXMCOBDEM2YE4MT	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	283	Zelim da mi se uradi tehnicki nadzor plovila?
1035	3MQZFVDZAWMMY55T	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	283	Zelim da uradim tehnicki nadzor plovila. Gde da se prijavim?
1036	7X4HX5NFB4GCRK4U	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako se registruje brod koji se uvozi iz zemlje koja je članica Evropske unije?
1037	OPAZYDYDJRMN1V8U	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod iz Evropske unije?
1038	JS7XEEDXB5ZX3KN1	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kupio sam brod u Evropskoj uniji. Kako da ga registrujem?
1039	ISWOZRNJMKFCTKH3	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Nemackoj?
1040	FCQLSEBTGEFJQRRA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Italiji?
1041	AQPMCJB5BJM8PKW3	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Francuskoj?
1042	T5GO3GNG005MGEIJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Holandiji?
1043	EIEQI7OLTFOGPJ25	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Spaniji?
1044	XERLPSWDPTEXCRLL	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Grckoj?
1045	NNVWL1JEGBVMRCZH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	284	Kako da registrujem brod koji sam kupio u Sloveniji?
1047	QW8JCV9CD5RKTWCG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine?
1048	PZBBLDS5DSDG0EMR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine od Beograda do Niša?
1049	83WQYCDNXQZHDRLR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine od Novog Sada do Beograda?
1050	VUQXWKLEJKNF5ONS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine od Šida do Beograda?
1051	V6WS2UJ9JEBYN3AN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine od Horgoša do Preševa?
1052	4SIU7BSJOIJEO12S	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine od Beograda do Čačka?
1053	BZOR39BYBMMNTGC8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koja je cena putarine od Beograda do Kragujevca?
1054	JNXIHJYHEKVW9I1Q	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koliko košta putarina?
1055	M8JRR24WMEGN8HMD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Gde mogu da dobijem cene putarine?
1017	DAXS8DZ26M12VWJV	2023-06-27 18:39:51	2023-06-28 20:07:22	2023-06-28 20:07:22	278	Šta je potrebno za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1046	O4XUZVVSZHKTXOFD	2023-06-27 18:39:51	2023-06-28 20:07:52	2023-06-28 20:07:52	285	Na računu imam sredstava, iz kog razloga mi je povezivanje kartice sa uređajem neuspešno?
1056	TQIFPFODRSGEIRNJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	286	Koliko košta putarina?
1057	Q9VLVZXOWHX49C6N	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	287	Gde mogu da kupim TAG za putarinu?
1058	XCJRHT3CEK82PPV9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	287	Gde može da se kupi TAG za ENP?
1059	88R3SBGE9IA9Q8VR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	287	Kako da kupim TAG za putarinu?
1060	TV9CLHTNI42HCBMJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	288	Kako da povežem TAG uređaj sa karticom?
1061	N9MOQR5OOF9B97FU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	288	Kako da povežem TAG uredjaj sa karticom?
1062	GTYF2DBFAQ0NGYQK	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	288	Da li TAG može da se poveže sa platnom karticom?
1063	0NRFNFSVJG5EOUJ4	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	289	Gde mogu da vidim stanje na putevima?
1064	OV4AEDOWG7I5JUKU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	289	Interesuje me stanje na putevima?
1065	5SAOHDJRC5OWDUD7	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	289	Da li ima radova na putevima?
1066	BCXJQHHNXMRWJJOG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	289	Na kojim putevima se izvode radovi?
1067	SWZCCNVDZCGJWAXE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	289	Kako da saznam da li se izvode radovi na putu?
1068	YJ3KHGGBTS0JHKEW	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	290	Uspešno registrovan uređaj, ima para na kartici, ali kad dođe na naplatnu stanicu, izbacuje na displeju tag na sivoj listi?
1069	9DBLYG0LFFBRHEG2	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	291	Gde se na putevima nalaze elektro punjači?
1070	DCPKCIBSASMTRLK4	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	291	Da li na auto-putu postoje punjači za električna vozila?
1071	FZ5FL9RUEC4NJ5ET	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	291	Gde mogu da napunim električno vozilo?
1072	WD3BOEE2VCNM6YPS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	291	Da li postoji brzi punjač za električno vozilo?
1073	5DJS8Y9N2GCTTF8P	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	292	Da li ima gužve na naplatnim stanicama?
1074	UVLBKTZUOTX6ZFZY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	292	Da li ima zadržavanja na naplatnim stanicama?
1075	HSKUNAY2HE6TTPE8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	292	Gde mogu da proverim koje je zadržavanje na naplatnim stanicama?
1076	X8LSQFTW0QKKI6ZR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	292	Gde mogu da proverim da li ima gužve na naplatnim stanicama?
1077	KLDQ647X52J5DYQU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	293	Koji je broj informativnog centra Puteva Srbije?
1078	TYEUII4QY4SKQVTR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	293	Koji je broj Puteva Srbije?
1079	0HIC1LFTGT7JWMNM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	293	Treba mi broj puteva Srbije?
1082	YC9IRIKHCXTLR9NX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	296	Da li isti uređaj može da se koristi u okviru ENPay mobilne aplikacije i za VEB portal?
1083	TQTZWDTQRJ7LNLO4	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	297	Da li može ENP uređaj da se koristi u zemljama regiona?
1084	VN8ZIGDZB1KB6CC0	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	298	Traži mi verifikacioni kod prilikom registracije ENP uređaja na VEB portal?
1085	FIPD8ZSW7K2VV9ZJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	299	Nema dovoljno sredstava na kartici, da li se može registrovati?
1087	RANPJHBDDZMKGMCM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	301	Da li mogu svoj postojeći uređaj  da registrujem na VEB portal preko interneta bez dolaska u poslovnicu?
1088	ZY1NAVFKQ8VSI8WH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	302	Postoji li način da se registruje uređaj na web servis, bez QR kod-a?
1089	J7SLANF50LHOKXTQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	303	Da li je web servis za elektronsku naplatu putarine dostupan svim korisnicima ENP?
1090	7JEDSOZ8MFDP20TS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	304	Da li mogu više TAG-ova da povežem na jednu platnu karticu?
1091	XCCXCZBEEUABOSCF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	305	Skinuta veća sredstva prilikom prolaska kroz naplatnu stanicu , putem uređaja za ENP?
1096	1Z0DW3J2G8ODIMJ8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	310	Kako mogu da dobijem listing prolaska za ENP uređaj?
1097	ZNYGTEBPPKZSPKBA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	311	Gde mogu da kupim nosač za ENP uređaj?
1098	FCEN1T85VS3NSVGZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	312	Kada će da krene sa funkcionisanjem integrisana naplata putarine između Srbije i Makedonije?
1099	QN0OWBLXIPJNMIXB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	312	Kada ce da krene sa funkcionisanjem integrisana naplata putarine izmedju Srbije i Makedonije?
1100	U3EQ9LOHGHNZWMAV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	312	Kada ce moci sa jednim tagom da se putuje kroz Srbiju i Severnu Makedoniju?
1101	79RKUB9T5FNWAXPR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	312	Kada će moći sa jednim tagom da se putuje kroz Srbiju i Severnu Makedoniju?
1102	B6NFZARV72DHHZSM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	312	Kada ce poceti funkcionisanje Open Balkan integrisane putarine?
1103	SP5J2ZYE4XGIOWVG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	312	Kada će početi funkcionisanje Open Balkan integrisane putarine?
1179	CJ32COUHEJVWFJYO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	331	Cemu sluzi energetski pasos?
1110	ITJALNMSCFIEZVCQ	2023-06-27 18:39:51	2023-06-28 14:44:18	2023-06-28 14:44:18	314	Ko je ministar?
1111	TVOYGKYPHGWVXST5	2023-06-27 18:39:51	2023-06-28 14:44:18	2023-06-28 14:44:18	314	Ko je ministar građevinarstva, saobraćaja i infrastrukture?
1112	ISXQVVMOTBY7VQNY	2023-06-27 18:39:51	2023-06-28 14:44:18	2023-06-28 14:44:18	314	Ko vodi ministarstvo građevinarstva, saobraćaja i infrastrukture?
1080	QWWMKQQPXJ33U5OU	2023-06-27 18:39:51	2023-06-28 20:09:07	2023-06-28 20:09:07	294	Gde mogu da kupim  ENP uređaj za VEB portal u okviru projekta Open Balkan?
1081	CU5XDZNOBVTYO34P	2023-06-27 18:39:51	2023-06-28 20:12:45	2023-06-28 20:12:45	295	Kako mogu da izvršim prekonfiguraciju postojećeg ENP uređaja na VEB servis?
1092	5PDMPPPQKZTBIL7T	2023-06-27 18:39:51	2023-06-28 20:13:56	2023-06-28 20:13:56	306	Neispravan uređaj za ENP?
1094	9FVA84HFZUUE4XTU	2023-06-27 18:39:51	2023-06-28 20:15:00	2023-06-28 20:15:00	308	Provera stanja na ENP uređaju?
1095	FYPW50PNTY2NOL22	2023-06-27 18:39:51	2023-06-28 20:16:37	2023-06-28 20:16:37	309	Da li imam popust na putarinu ako koristim ENP uređaj?
1093	B6U9JRXYKLSWTLQA	2023-06-27 18:39:51	2023-06-28 20:17:49	2023-06-28 20:17:49	307	Da li uređaj može da se koristi za motocikle?
1086	WWPFBBCTILAV2VQA	2023-06-27 18:39:51	2023-06-28 20:19:57	2023-06-28 20:19:57	300	Kada ću moći sa srpskim TAG-om da prolazim kroz Makedoniju?
1169	EJQZEFI5KX30MVZU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	329	Sta je to Cista Srbija?
1170	DVDVJKMHYEJXVHQO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	329	Šta je Čista Srbija?
1171	JFC5A9D9QH6KPXS2	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	329	Šta je projekat Čista Srbija?
1172	BZVY7ETQNFVA7M1F	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	329	Gde se realizuje projekat Čista Srbija?
1173	DLCWHNF2MRQ3L4AF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	329	Gde se realizuje projekat Cista Srbija?
1176	RWIJVMGY4AB23CYJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	331	Šta je energetski pasoš?
1177	41ZUXAN5RWQI3MAO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	331	Sta je energetski pasos?
1178	PSM9ZRIDWUMNBWLR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	331	Čemu služi energetski pasoš?
1115	JF08SRKXNZ5EPS1X	2023-06-27 18:39:51	2023-06-28 14:44:53	2023-06-28 14:44:53	315	Ko je premijer Srbije?
1116	TBHGC57M0QLCHHOR	2023-06-27 18:39:51	2023-06-28 14:44:53	2023-06-28 14:44:53	315	Ko je predsednik Vlade Republike Srbije?
1121	MGDQGFU6VS2PJSUX	2023-06-27 18:39:51	2023-06-28 14:45:35	2023-06-28 14:45:35	316	Ko je direktor JP Putevi Srbije?
1122	ZJ5HGO4V5SPNURHH	2023-06-27 18:39:51	2023-06-28 14:45:35	2023-06-28 14:45:35	316	Ko vodi JP Putevi Srbije?
1123	TVSHFALMLR7FJKDK	2023-06-27 18:39:51	2023-06-28 14:45:35	2023-06-28 14:45:35	316	Ko je šef JP Putevi Srbije?
1124	PP0H1HSBGP9YQZKR	2023-06-27 18:39:51	2023-06-28 14:45:35	2023-06-28 14:45:35	316	Ko je sef JP Putevi Srbije?
1125	IW7U55ZVNIPI3G6T	2023-06-27 18:39:51	2023-06-28 14:45:35	2023-06-28 14:45:35	316	Ko je generalni direktor JP Putevi Srbije?
1126	6KSGXINMLPONPQEE	2023-06-27 18:39:51	2023-06-28 14:46:11	2023-06-28 14:46:11	317	Kako mogu pisati ministru, na koju adresu?
1127	0IER6WGSRFI33LIL	2023-06-27 18:39:51	2023-06-28 14:46:11	2023-06-28 14:46:11	317	Kako mogu da se obratim ministru?
1128	XQJ4ETGBXB8SZWJQ	2023-06-27 18:39:51	2023-06-28 14:46:11	2023-06-28 14:46:11	317	Koji je mejl ministra Vesića?
1129	IGWNDXPIHBFHWBSW	2023-06-27 18:39:51	2023-06-28 14:46:55	2023-06-28 14:46:55	318	Kako Ministarstvo podržava profesionalno usavršavanje i edukaciju mladih?
1130	XLHDPXHFEP69KJXQ	2023-06-27 18:39:51	2023-06-28 14:46:55	2023-06-28 14:46:55	318	Da li postoje prakse za studente u Ministarstvu?
1131	19BOF1ICWGWJMAF8	2023-06-27 18:39:51	2023-06-28 14:46:55	2023-06-28 14:46:55	318	Kako da se prijavim za studentsku praksu u Ministarstvu?
1132	CXXLHJTBJIKDEFI6	2023-06-27 18:39:51	2023-06-28 14:47:28	2023-06-28 14:47:28	319	Ko je Goran Vesić?
1133	JNC8C7SN8RC57NCG	2023-06-27 18:39:51	2023-06-28 14:47:28	2023-06-28 14:47:28	319	Ko je Goran Vesic?
1134	DE26WGOGKJWPWM8V	2023-06-27 18:39:51	2023-06-28 14:47:28	2023-06-28 14:47:28	319	Šta znaš o Goranu Vesicu
1135	UXZX8NQKS3NYUBYE	2023-06-27 18:39:51	2023-06-28 14:47:28	2023-06-28 14:47:28	319	Šta znaš o Vesicu
1136	3RHS3JJPJ8VUQRED	2023-06-27 18:39:51	2023-06-28 14:48:01	2023-06-28 14:48:01	320	Ko je Aleksandar Vučić?
1137	ZIWZURINUUW627IN	2023-06-27 18:39:51	2023-06-28 14:48:01	2023-06-28 14:48:01	320	Ko je Aleksadnar Vucic?
1138	KYPW1FH3KLXTER11	2023-06-27 18:39:51	2023-06-28 14:48:01	2023-06-28 14:48:01	320	Šta znaš o Vucicu
1139	3R70SCYBEHRRIVVG	2023-06-27 18:39:51	2023-06-28 14:48:47	2023-06-28 14:48:47	321	Ko je Ana Brnabić?
1140	DGVO5K4WC9F8HBVY	2023-06-27 18:39:51	2023-06-28 14:48:47	2023-06-28 14:48:47	321	Ko je Ana Brnabic?
1141	A5F3UHCRBR1IGWCG	2023-06-27 18:39:51	2023-06-28 14:48:47	2023-06-28 14:48:47	321	Šta znaš o Brnabic
1142	BAVZYQBZWIW5SYVL	2023-06-27 18:39:51	2023-06-28 14:49:20	2023-06-28 14:49:20	322	Koji je kontakt Ministarstva?
1143	MTTY0H8ZXPTQE0O8	2023-06-27 18:39:51	2023-06-28 14:49:20	2023-06-28 14:49:20	322	Koji je broj telefona ministarstva?
1144	23TNA2VNZHWGVZH4	2023-06-27 18:39:51	2023-06-28 14:49:55	2023-06-28 14:49:55	323	Gde mogu da vidim rezultate ministarstva?
1145	W4H2FNE9DUPIZQ6D	2023-06-27 18:39:51	2023-06-28 14:49:55	2023-06-28 14:49:55	323	Koji su rezultati ministarstva?
1146	OS4LDLETD4XQSMDP	2023-06-27 18:39:51	2023-06-28 14:49:55	2023-06-28 14:49:55	323	Koji su rezultati ministarstva u prvih 100 dana Vlade?
1148	M2SEPTWTAYWNUR9G	2023-06-27 18:39:51	2023-06-28 14:50:27	2023-06-28 14:50:27	324	Koji su najznačajniji projekti ministarstva?
1149	XVTOHDIHCGN9GAN0	2023-06-27 18:39:51	2023-06-28 14:50:27	2023-06-28 14:50:27	324	Koji su najznačajniji projekti koji se rade?
1150	7VSMLJCXG4RXKWKK	2023-06-27 18:39:51	2023-06-28 14:50:27	2023-06-28 14:50:27	324	Koji su najznačajniji projekti koji se grade?
1154	OPY3DRZROY26LD5U	2023-06-27 18:39:51	2023-06-28 14:50:46	2023-06-28 14:50:46	325	Koja je adresa Ministarstva?
1155	HHMUHLJBMCAZMBZ9	2023-06-27 18:39:51	2023-06-28 14:50:46	2023-06-28 14:50:46	325	Na kojoj adresi se nalazite?
1156	6PK13BHHPKPBMDBQ	2023-06-27 18:39:51	2023-06-28 14:50:46	2023-06-28 14:50:46	325	Gde se nalazi ministarstvo?
1157	JWK1BDMMVUQEXYHT	2023-06-27 18:39:51	2023-06-28 14:50:46	2023-06-28 14:50:46	325	Gde je pisarnica ministarstva?
1158	9YXSIILRB4BIWCQN	2023-06-27 18:39:51	2023-06-28 14:51:28	2023-06-28 14:51:28	326	Da li ministarstvo ima Fejsbuk ili Instagram stranicu?
1159	4BJOMEXJM3CMPG8Z	2023-06-27 18:39:51	2023-06-28 14:51:28	2023-06-28 14:51:28	326	Da li ministarsvo ima Facebook?
1160	ZHBFVZJIKIAJRZUH	2023-06-27 18:39:51	2023-06-28 14:51:28	2023-06-28 14:51:28	326	Da li ministarstvo ima drutšvene mreže?
1161	MW51LTKPN6KDHVAN	2023-06-27 18:39:51	2023-06-28 14:51:28	2023-06-28 14:51:28	326	Da li ministarstvo ima drustvene mreze?
1162	BK7WMDHFVL1OG0GK	2023-06-27 18:39:51	2023-06-28 14:52:06	2023-06-28 14:52:06	327	Šta je prioritet u radu ministarstva?
1163	M2VSEBGDW6I2BQBC	2023-06-27 18:39:51	2023-06-28 14:52:06	2023-06-28 14:52:06	327	Sta je prioritet u radu ministrastva?
1164	RFAKPKDNSFI6NPDH	2023-06-27 18:39:51	2023-06-28 14:52:06	2023-06-28 14:52:06	327	Koji su prioriteti u vasem radu?
1165	6SFGTJXQE5WSRMLK	2023-06-27 18:39:51	2023-06-28 14:52:06	2023-06-28 14:52:06	327	Koji su prioriteti u vašem radu?
1166	ZZFVD17NQLTJPAWH	2023-06-27 18:39:51	2023-06-28 14:52:36	2023-06-28 14:52:36	328	Koje sektore obuhvata ministarstvo?
1167	2FZ5CFSNTMFAN6RZ	2023-06-27 18:39:51	2023-06-28 14:52:36	2023-06-28 14:52:36	328	Koje sve sektore ima ministarstvo?
1168	JLUSKLWKDMIQLQ8C	2023-06-27 18:39:51	2023-06-28 14:52:36	2023-06-28 14:52:36	328	Koji su sektori ministarstva?
1174	7Q1HZS8YF2AM4LZS	2023-06-27 18:39:51	2023-06-28 20:18:47	2023-06-28 20:18:47	330	Kada ce biti izgradjena fabrika za preradu otpadnih voda u Velikom Selu?
1175	LGHLYF3VZ9FGMMPQ	2023-06-27 18:39:51	2023-06-28 20:18:47	2023-06-28 20:18:47	330	Kada će biti izgrađena fabrika za preradu otpadnih voda u Velikom Selu?
1180	28WMWX1CZLZJ6ATD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	332	Kako mogu da proverim da li zgrada ima energetski pasoš?
1181	GZ2SRWNHWFEJ50TA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	332	Kako mogu da proverim da li zgrada ima energetski pasos?
1182	SZATN3TKBEDSFZHH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	332	Gde mogu da vidim da li zgrada ima energetski pasoš?
1183	PMVCS2JWWQENSUOB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	332	Gde mogu da vidim da li zgrada ima energetski pasos?
1184	YZDWVEDHHTLTT9UN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	333	Šta je projekat Socijalnog stanovanja?
1185	WOEJUPX3KTFOWBEH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	333	Sta je projekat Socijalnog stanovanja?
1186	BEDCWH9ADF49TESK	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	333	Gde se sprovodi projekat Socijalnog stanovanja?
1187	AT3B2VA4F1D0WORU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	333	Za koga se grade stanovi u okviru projekta socijalno stanovanje?
1188	COSA2VMY56K5BIXM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	334	Da li ministarstvo radi na pristupanju Srbije Evropskoj uniji?
1189	X06GT4Q7FCZ3U3HB	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	334	Koje su obaveze ministarstva na putu Srbije ka Evropskoj unji?
1190	0SSDEPGCXNIJ06OG	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	334	Da li ministarstvo radi na putu Srbije ka Evropskoj uniji?
1191	MBSNILQUZVUH7DBK	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	334	Da li ministarstvo ima obaveze za pristupanje Evropskoj uniji?
1192	UHPF1OFTCKXNPRLS	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	335	Da li Srbiji postoji Vazduhoplovna akademija?
1193	LPHGECGYF4ODVQMT	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	335	Gde mogu da se školuju kadrovi u vazdušnom saobraćaju?
1194	UOLYRAEHKVZI3O1E	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	335	Gde mogu da se skoluju kadrovi u vazdusnom saobracaju?
1195	HGYCUU1JUI05OFVG	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	336	Šta su to projekti Integralnog razvoja?
1196	PIYCZK19HWBQDVVP	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	336	Sta su to projekti Integralnog razvoja?
1197	ATHQUBWAXECI8BH5	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	336	Koji su projekti integralnog ravoja?
1	IX7O2YBTOZMFVXJ0	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim i međudržavnim rekama?
2	S8DSIBA1XUUP8BX7	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova na međunarodnim i međudržavnim rekama?
3	JUXPMSHOUBUKEUMH	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Na kojoj web lokaciji se mogu preuzeti situacioni prikazi i produženi profili mostova na međunarodnim i međudržavnim rekama?
4	47FXJVGAKCW48T1L	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Na kojoj web lokaciji se mogu preuzeti svi podaci o mostovima na međunarodnim i međudržavnim rekama?
5	02JUREUONWURAGO0	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim rekama?
6	CRRX7APEIWEIS0KM	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Gde mogu da saznam podatke o visinama plovidbenih otvora mostova?
7	AMKULDI1RIGBXURE	2023-06-27 18:39:48	2023-06-28 09:52:40	2023-06-28 09:52:40	1	Potrebne su mi visine plovidbenih otvora mostova
1198	1CDCF9VTYON9MEAE	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim i međudržavnim rekama?
1199	ORTYKLXHGRPFJJ7S	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova na međunarodnim i međudržavnim rekama?
1200	JFKMP4EOW72VECUY	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Na kojoj web lokaciji se mogu preuzeti situacioni prikazi i produženi profili mostova na međunarodnim i međudržavnim rekama?
1201	7O3SBFYYLCPYCNJ6	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Na kojoj web lokaciji se mogu preuzeti svi podaci o mostovima na međunarodnim i međudržavnim rekama?
1202	KSEQS3UL7CIX0I0S	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim rekama?
1203	XPNLGKSZ1B2KLGEI	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Gde mogu da saznam podatke o visinama plovidbenih otvora mostova?
1204	8VUFKIPKUBG8R3XW	2023-06-28 09:52:40	2023-06-28 09:52:40	\N	1	Potrebne su mi visine plovidbenih otvora mostova
197	VD36BXVWAABNAV7I	2023-06-27 18:39:48	2023-06-28 14:38:40	2023-06-28 14:38:40	31	Gde se rade tehnički pregledi čamaca namenjenih za privredne svrhe?
1205	FRUH7QV2FDM1GQMI	2023-06-28 14:38:40	2023-06-28 14:38:40	\N	31	Gde se obavljaju tehnički pregledi čamaca namenjenih za privredne svrhe?
1206	UUJTBIU0G1N8ZDKK	2023-06-28 14:38:40	2023-06-28 14:38:40	\N	31	Na kojim mestima se vrše tehnički pregledi čamaca koji se koriste u privredne svrhe?
1207	VVLOZHJZW7UAGNHM	2023-06-28 14:38:40	2023-06-28 14:38:40	\N	31	Gde se obavljaju tehnički pregledi čamaca koji su namenjeni za poslovne svrhe?
1208	2Y1S6OOJWSAFB0VS	2023-06-28 14:38:40	2023-06-28 14:38:40	\N	31	Gde se može obaviti tehnički pregled čamaca koji se koriste u privrednim delatnostima?
1209	FGJI30GXDYLDIK3S	2023-06-28 14:38:40	2023-06-28 14:38:40	\N	31	U kojim objektima se vrše tehnički pregledi čamaca namenjenih za privredu?
216	6QJV0YWKMW9CYMYI	2023-06-27 18:39:49	2023-06-28 14:40:49	2023-06-28 14:40:49	36	Da li se u Republici Srbiji priznaju ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama Evropske unije?
1210	XR6LSLGL0MDTW7P8	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li se u Srbiji priznaju ovlašćenja članova posade brodova unutrašnje plovidbe koja su stekli u zemljama članicama Evropske unije?
1211	LFQPA613KXGNHKVU	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li su ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama Evropske unije priznata u Republici Srbiji?
1212	A3EMLFY8QHDTNRPS	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li se u Republici Srbiji prihvataju ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama EU?
1213	QDHM6O35XIVXB8IT	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li je u Srbiji priznat kvalifikacioni status članova posade brodova unutrašnje plovidbe koji su stečeni u zemljama članicama Evropske unije?
1214	TQS8QEIDNG6WKQI9	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li su u Republici Srbiji validna ovlašćenja članova posade brodova unutrašnje plovidbe koja su stekli u državama članicama EU?
1215	E6I7S21ZMWTLRNWM	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li se ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama Evropske unije priznaju u Srbiji?
1216	FRIV5JTDVJ4XBE3H	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li se u Srbiji priznaju kvalifikacije članova posade brodova unutrašnje plovidbe koje su stekli u zemljama članicama EU?
1217	PVTAJAHO1JJ2TKBD	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li se u Republici Srbiji prihvataju kvalifikacije članova posade brodova unutrašnje plovidbe koje su stekli u državama članicama Evropske unije?
1218	ZQVYANYO0XVW0RGY	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li su ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama EU pravno priznata u Srbiji?
1219	VPSAETYH0HEZRYEA	2023-06-28 14:40:49	2023-06-28 14:40:49	\N	36	Da li su u Srbiji priznate kvalifikacije članova posade brodova unutrašnje plovidbe koje su stekli u zemljama članicama Evropske unije?
267	HHSAG8MYPVX9BKBI	2023-06-27 18:39:49	2023-06-28 14:41:31	2023-06-28 14:41:31	46	Koji je broj žiro-računa na koji se uplaćuju administrativne takse?
1220	L0BZTCBEIQYVSXTC	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Na koji broj žiro-računa treba izvršiti uplatu administrativnih taksi?
1221	BTBNJSOGQTNHGVLX	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Koji je broj žiro-računa na koji se vrše uplate za administrativne takse?
1222	GAILSP7UIUJ0ZYBT	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Koje je broj žiro-računa na koji treba uplatiti administrativne takse?
1223	4I8J543XMBGC70OO	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Na koji račun treba izvršiti uplatu administrativnih taksi?
1224	3535NCCVWMESNG8F	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Koji je tačan broj žiro-računa za uplatu administrativnih taksi?
1225	ZJWFEGV1LGSRRJ8V	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Na koji žiro-račun se uplaćuju administrativne takse?
1226	FM5LUFMTRQI3UMS8	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Za koju svrhu se koristi broj žiro-računa za uplatu administrativnih taksi?
1227	396GEGJNHY3JZVK0	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Gde treba izvršiti uplatu administrativnih taksi na broj žiro-računa?
1228	LPA2YJJJVRE4XJ17	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Koja je numeracija žiro-računa za plaćanje administrativnih taksi?
1229	MHSKUOLD4LSWY2HV	2023-06-28 14:41:31	2023-06-28 14:41:31	\N	46	Na kojem žiro-računu se vrši uplata za administrativne takse?
303	CMXYYVO869ZA8ZI2	2023-06-27 18:39:49	2023-06-28 14:42:33	2023-06-28 14:42:33	52	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta za koji je utvrđeno da je od posebnog značaja za Republiku Srbiju, sprovodi na osnovu donetog rešenja nadležne službe za katastar nepokretnosti?
1230	DD4ZVEAZVJQ9VTHF	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta od posebnog značaja za Republiku Srbiju sprovodi na osnovu rešenja nadležne službe za katastar nepokretnosti?
1231	TFLS61PQ8LJAWJ1D	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se parcelacijom katastarskih parcela za izgradnju linijskog infrastrukturnog objekta, koji je od posebnog značaja za Republiku Srbiju, postupa u skladu s rešenjem nadležne službe za katastar nepokretnosti?
1232	0CCAOIXVVLYGRUXX	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta koji je od posebnog značaja za Republiku Srbiju, vrši na temelju rešenja nadležne službe za katastar nepokretnosti?
1233	F9NMSUJFKA1U9QY5	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li je deoba katastarskih parcela radi izgradnje linijskog infrastrukturnog objekta, koji je od posebnog značaja za Republiku Srbiju, regulisana rešenjem nadležne službe za katastar nepokretnosti?
1234	DNWIQLW4YWZZJDB7	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se za deobu katastarskih parcela namenjenih za izgradnju linijskog infrastrukturnog objekta, koji je od posebnog značaja za Republiku Srbiju, zahteva rešenje od nadležne službe za katastar nepokretnosti?
1235	UAQ5GGKVCQ0U3HOU	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se deoba katastarskih parcela za izgradnju infrastrukturnog objekta od posebnog značaja za Republiku Srbiju vrši prema rešenju nadležne službe za katastar nepokretnosti?
1236	Z8HO04DFI7DRSOTV	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se, za potrebe izgradnje linijskog infrastrukturnog objekta koji je od posebnog značaja za Republiku Srbiju, vrši deoba katastarskih parcela prema donetom rešenju nadležne službe za katastar nepokretnosti?
1237	6MFVE7U7PNFSSXQQ	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta, koji je od posebnog značaja za Republiku Srbiju, obavlja na temelju rešenja nadležne službe za katastar nepokretnosti?
1238	UL8CN4IQOSYFTVQE	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li se za deobu katastarskih parcela, koje će biti iskorišćene za izgradnju linijskog infrastrukturnog objekta koji je od posebnog značaja za Republiku Srbiju, zahteva rešenje nadležne službe za katastar nepokretnosti?
1239	WHQJPL7OFG7QXVZG	2023-06-28 14:42:33	2023-06-28 14:42:33	\N	52	Da li je potrebno rešenje nadležne službe za katastar nepokretnosti za sprovođenje deobe katastarskih parcela namenjenih za izgradnju linijskog infrastrukturnog objekta, koji je od posebnog značaja za Republiku Srbiju?
1104	L5MONBNIAM98CZT1	2023-06-27 18:39:51	2023-06-28 14:43:25	2023-06-28 14:43:25	313	Ko je predsednik države?
1105	AO1US06MXYG5IKL2	2023-06-27 18:39:51	2023-06-28 14:43:25	2023-06-28 14:43:25	313	Ko je predsednik drzave?
1106	2XEDMAPEW1QOEQTU	2023-06-27 18:39:51	2023-06-28 14:43:25	2023-06-28 14:43:25	313	Ko je predsednik Srbije?
1107	QNH6GJEPKQ8IYOU9	2023-06-27 18:39:51	2023-06-28 14:43:25	2023-06-28 14:43:25	313	Ko je predsednik Republike Srbije?
1108	APR1MW24PY4WLQAP	2023-06-27 18:39:51	2023-06-28 14:43:25	2023-06-28 14:43:25	313	Ko je sef drzave?
1109	FSPOCQRH3ALYZOUI	2023-06-27 18:39:51	2023-06-28 14:43:25	2023-06-28 14:43:25	313	Ko je šef države?
1240	CXVA5DWP9TMCJUM0	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Ko je predsjednik države?
1241	DKG27DRCVCIFWKDT	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Ko je predsednik države?
1242	AVGA3JEFZJUHRY0W	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Koji je predsednik države?
1243	BKYOSLRUAHDP6EJC	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Ko je vođa države?
1244	JG06BYPEVRQCQPS2	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Koji političar je na čelu države?
1245	MISLJK37RTKPEJRP	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Koji je trenutni predsednik države?
1246	4UORU5CG7C9Q7NX1	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Ko obavlja funkciju predsednika države?
1247	NP567SWRYFDYGQYJ	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Trenutno, ko je najviši državni funkcioner?
1248	YEZI2CRIUTBDLXMP	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Kome pripada titula predsednika države?
1249	NPUY8QDUMPBAKYAU	2023-06-28 14:43:25	2023-06-28 14:43:25	\N	313	Koji pojedinac trenutno obavlja dužnost predsednika države?
1113	IY99CTENSTXH1SEX	2023-06-27 18:39:51	2023-06-28 14:44:18	2023-06-28 14:44:18	314	Ko vodi ministarstvo gradjevinarstva, saobracaja i infrastrukture?
1114	A8UJ1QOOHYDTBXXL	2023-06-27 18:39:51	2023-06-28 14:44:18	2023-06-28 14:44:18	314	Ko vodi ministarstvo?
1250	8H4WGRDQDW86NQZE	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko je ministar?
1251	BGITGUCNFEMXLBFG	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko je ministar građevinarstva, saobraćaja i infrastrukture?
1252	AWE6P38YEDOBYWDA	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko vodi ministarstvo građevinarstva, saobraćaja i infrastrukture?
1253	UP2ZGWVWBMDN6UKX	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko vodi ministarstvo gradjevinarstva, saobracaja i infrastrukture?
1254	GY1WNMRNQSQII4H6	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko vodi ministarstvo?
1255	CT8PGIXQN13L6HPY	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko trenutno obavlja funkciju ministra građevinarstva, saobraćaja i infrastrukture?
1256	KLPCM99N7IUBU0AL	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Koji političar trenutno obavlja dužnost ministra građevinarstva, saobraćaja i infrastrukture?
1257	8SDW22ZIU2ZLUESX	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko je zadužen za resor građevinarstva, saobraćaja i infrastrukture?
1258	7CXHJEBI0NGQ2KRU	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Kako se zove ministar koji upravlja sektorima građevinarstva, saobraćaja i infrastrukture?
1259	F8IKXU5Y4E6MQL8N	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko je osoba koja trenutno rukovodi ministarstvom građevinarstva, saobraćaja i infrastrukture?
1260	ZI3XKAV6Y98SHAND	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Koji je ime ministra koji nadgleda oblasti građevinarstva, saobraćaja i infrastrukture?
1261	VMXCFOCY7DU5HWGT	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko je ministar odgovoran za građevinarstvo, saobraćaj i infrastrukturu?
1262	G7MN23ZNRFRC1FWD	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Koji političar trenutno ima ulogu ministra za građevinarstvo, saobraćaj i infrastrukturu?
1263	OU7FOVYN5VJ07TQ1	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Ko je trenutno na čelu ministarstva za građevinarstvo, saobraćaj i infrastrukturu?
1264	IHJBYE47HNB30ICR	2023-06-28 14:44:18	2023-06-28 14:44:18	\N	314	Kako se zove ministar koji upravlja sektorima građevine, saobraćaja i infrastrukture?
1117	Q0I8SSZ2INOTWQSB	2023-06-27 18:39:51	2023-06-28 14:44:53	2023-06-28 14:44:53	315	Ko je šef Vlade Srbije?
1118	BWGBW2W8ED1WDNZM	2023-06-27 18:39:51	2023-06-28 14:44:53	2023-06-28 14:44:53	315	Ko je sef Vlade Srbije?
1119	4678K0MREQD0H5R8	2023-06-27 18:39:51	2023-06-28 14:44:53	2023-06-28 14:44:53	315	Ko vodi Vladu RS?
1120	W6V117OZEASE5DMK	2023-06-27 18:39:51	2023-06-28 14:44:53	2023-06-28 14:44:53	315	Ko vodi Vladu Republike Srbije?
1265	5FQLEIU48P0YYVWI	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je premijer Srbije?
1266	NWIL8YIX1D8S5OKF	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je predsednik Vlade Republike Srbije?
1267	ZQQTW18VAERLMRV3	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je šef Vlade Srbije?
1268	SYVVNI7FCJXKLSWH	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je sef Vlade Srbije?
1269	QH2E5V1ST9JAOTOX	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko vodi Vladu RS?
1270	LRKNTHPPFMKLS08D	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko vodi Vladu Republike Srbije?
1271	ETWX0WNGTQXZMKCX	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Koji političar trenutno obavlja funkciju premijera u Srbiji?
1272	KM9YFNUPCHCQ53KP	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je trenutni premijer u Srbiji?
1273	WBJN40TLBYFHNQ1S	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je osoba koja se nalazi na čelu Vlade Republike Srbije?
1274	7QJA2YOLJFVDCIMY	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Koji je ime i prezime trenutnog premijera Srbije?
1275	WWLEGGU1XI1MU0BN	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je lider Vlade u Srbiji?
1276	J4GVFKDDQFSNXJXU	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Kako se zove osoba koja obavlja funkciju premijera u Srbiji?
1277	E21BPDWON7IA0ABM	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Koji politički lider je trenutno na poziciji premijera Srbije?
1278	RAEN8SVKYDKYV2XB	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Tko je trenutno na čelu vlade u Srbiji?
1279	LWV0ES4W5DVGTWWS	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Ko je premijer u Srbiji u ovom trenutku?
1280	VKKNA80S1ZVJAF4U	2023-06-28 14:44:53	2023-06-28 14:44:53	\N	315	Kako se zove osoba koja je na poziciji premijera u Srbiji?
1281	GS0X0ZE4IWFDAK8V	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je direktor JP Putevi Srbije?
1282	GM1ZG6C0AIDYV103	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko vodi JP Putevi Srbije?
1283	UM6S7MDLNPG8JMIZ	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je šef JP Putevi Srbije?
1284	3UUAP5BWSZ6ZA0I2	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je sef JP Putevi Srbije?
1285	4N3SIBMOBOUZ1TS2	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je generalni direktor JP Putevi Srbije?
1286	WTYUJSQMLPEQTEVG	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Koji je direktor Javnog preduzeća Putevi Srbije?
1287	PCP3JACCQRMRD40P	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je na čelu JP Putevi Srbije kao direktor?
1288	6T74OJE4A6QNKADY	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Kako se zove direktor Javnog preduzeća Putevi Srbije?
1289	KQNKTLAETBFU6KQ8	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko obavlja funkciju direktora u JP Putevi Srbije?
1290	HG10VUHO68ZQRWMD	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Koji je ime direktora u Javnom preduzeću Putevi Srbije?
1291	H0VLGH81NARAISEL	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je trenutni direktor JP Putevi Srbije?
1292	6ROND0PMA9BDYQ3Q	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Kome pripada funkcija direktora u JP Putevi Srbije?
1293	YEUP4GE9PRIOEMDY	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je odgovoran za vođenje JP Putevi Srbije kao direktor?
1294	K0JY1QEWPPWXY4GD	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Kako se preziva osoba koja je postavljena za direktora JP Putevi Srbije?
1295	KASGFNYI6UU0ICE3	2023-06-28 14:45:35	2023-06-28 14:45:35	\N	316	Ko je osoba koja trenutno rukovodi JP Putevi Srbije kao direktor?
1296	GJHDKR4VYD5XTL1W	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako mogu pisati ministru, na koju adresu?
1297	HOFB3ZU0KNUX0SKQ	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako mogu da se obratim ministru?
1298	AHXZGUUPZ19D7HY7	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Koji je mejl ministra Vesića?
1299	SULIMOO36CYF8QSY	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako mogu da kontaktiram ministra i na koju adresu mogu pisati?
1300	O915QVJ45B4RLFQ2	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Na koju adresu mogu poslati pismo ministru i kako mogu da mu pišem?
1301	CYUM4VQXWMATEVLH	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Koja je adresa ministra i kako mogu da mu se obratim pisanim putem?
1302	FLTVXSD4LFZCCLMI	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako mogu da pišem ministru i koja je tačna adresa na koju treba poslati pismo?
1303	QBNEMVHPZWENBH9P	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Na koju tačno adresu mogu uputiti pismo ministru i kako da mu se obratim?
1304	CSMZJH3WWDEEZWPQ	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako da se pismeno obratim ministru i koju adresu treba da koristim?
1305	EORZGQ34QUC19ZJ7	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Koju adresu treba da koristim kada želim da pišem ministru i kako mogu da mu se obratim?
1306	UBC0HRNXIMHYVUA5	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako da kontaktiram ministra putem pisma i koja je adresa na koju treba poslati?
1307	D3NPHWUBDZQLIJDN	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Na koju adresu treba poslati pismo ministru i koji je najbolji način da mu se obratim pisanim putem?
1308	YRXMHK0QAUMQAR4J	2023-06-28 14:46:11	2023-06-28 14:46:11	\N	317	Kako mogu pisati ministru i koja je tačna poštanska adresa na koju trebam slati pisma?
1309	MPVRPQTLZTRPZHTZ	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kako Ministarstvo podržava profesionalno usavršavanje i edukaciju mladih?
1310	TTLG7QYRNAA6ZSII	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Da li postoje prakse za studente u Ministarstvu?
1311	LTDPYCJST9SQ6DKY	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kako da se prijavim za studentsku praksu u Ministarstvu?
1312	GHTECXXLL77GR4XF	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Na koji način Ministarstvo podržava profesionalno usavršavanje i obrazovanje mladih?
1313	QVPN1L6O3MMJWQAE	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kako Ministarstvo pruža podršku profesionalnom usavršavanju i edukaciji mladih?
1314	QGRR7APZF2E6LBCG	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Koji su načini na koje Ministarstvo podržava profesionalno usavršavanje i edukaciju mladih?
1315	A1P5MV9TXVWXE4EH	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kakve mere Ministarstvo preduzima radi podrške profesionalnom usavršavanju i obrazovanju mladih?
1316	DA4WOAWBCYC801G2	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kako Ministarstvo podržava mlade u njihovom profesionalnom usavršavanju i edukaciji?
1317	IHCIR73K6VWC7SN3	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Koje inicijative Ministarstvo sprovodi kako bi podržalo profesionalno usavršavanje i obrazovanje mladih?
1318	0MCZXORQAKXAMWF0	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kako Ministarstvo podstiče mlade na profesionalno usavršavanje i edukaciju?
1319	3G6YFBUPQ8SRKZWN	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Koje programe Ministarstvo nudi za podršku profesionalnom usavršavanju i obrazovanju mladih?
1320	CGXOTY20KURNYSDV	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Na koji način Ministarstvo podržava mlade ljude u sticanju profesionalnih veština i znanja?
1321	Q8N98GRRICBAB4P5	2023-06-28 14:46:55	2023-06-28 14:46:55	\N	318	Kako Ministarstvo pruža podršku mladima u njihovom napredovanju kroz profesionalno usavršavanje i edukaciju?
1322	RQNLUJVASLXUBEG3	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Ko je Goran Vesić?
1323	3VQH0DEON1GZM8PY	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Ko je Goran Vesic?
1324	8YCHNIXKFZRODUEM	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Šta znaš o Goranu Vesicu
1325	UBVA9MUKM7MXWDFU	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Šta znaš o Vesicu
1326	OT6PKDK6GCFROSEK	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Ko je osoba po imenu Goran Vesić?
1327	1QZ48P8R9B2NUKJT	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Koji je identitet Gorana Vesića?
1328	YKI8QN9KPNWYXE75	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Šta možete reći o Goranu Vesiću?
1329	768YYL1BMSRUI1RH	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Ko je tačno Goran Vesić?
1330	DSGNHALAXYFEP831	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	O kome se radi kada se pomene ime Goran Vesić?
1331	I36LNLLJP7PASOKW	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Kako biste opisali Gorana Vesića?
1332	BZFJRGK6JPEZD2YQ	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Ko je Goran Vesić i koju ulogu ima?
1333	JDKIZV2L7LBZJVBN	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Možete li mi reći nešto više o Goranu Vesiću?
1334	5KNJZ51RNTKUIB5U	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Zašto je Goran Vesić poznat?
1335	GQUSLUV6ODQTDT9W	2023-06-28 14:47:28	2023-06-28 14:47:28	\N	319	Koje su nadležnosti i zanimanje Gorana Vesića?
1336	6NYJAKL2JDZ4G0EF	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je Aleksandar Vučić?
1337	9AFEZ87YM3WZN1HS	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je Aleksadnar Vucic?
1338	LBPPQMZ7VKSHLFFK	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Šta znaš o Vucicu
1339	ESCYLOSFGD5FPRYB	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je osoba po imenu Aleksandar Vučić?
1340	6WGNXWHWXUFXM6RE	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Koji je identitet Aleksandra Vučića?
1341	1ONBPQPPPWOBKJDA	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Šta možete reći o Aleksandru Vučiću?
1342	0HSUTAZ4PKN4OGN5	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je taj čovek, Aleksandar Vučić?
1343	TKCEKUCOPE70DYW2	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je političar po imenu Aleksandar Vučić?
1344	2CRK4KSDH25DO1CP	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Molim Vas, recite mi nešto o Aleksandru Vučiću.
1345	D6P97HNEXGIHKE41	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Šta znamo o Aleksandru Vučiću?
1346	YYMCFESZL4C8GTY5	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Kako biste opisali Aleksandra Vučića?
1347	1OMSZ6QYXVEIP46N	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je trenutni predsednik Srbije, Aleksandar Vučić?
1348	PHJRBKHJBFIN8PIO	2023-06-28 14:48:01	2023-06-28 14:48:01	\N	320	Ko je lider Srpske napredne stranke, Aleksandar Vučić?
1349	JBJM9TEZSHMMQYOG	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Ko je Ana Brnabić?
1350	52QQWO6LZIOA3YZS	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Ko je Ana Brnabic?
1351	VTQQNRZKOKUBZWJI	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Šta znaš o Brnabic
1352	WBMWYYEJSVV6YWQM	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Šta je Ana Brnabić po zanimanju?
1353	TGWQAFADREEYRAKL	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Ko je osoba Ana Brnabić?
1354	HLXSCDRO4ZQ3ETPG	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Kako se zove Ana Brnabić?
1355	H7CTIUDFSGWY84DE	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Koja je uloga Ane Brnabić?
1356	HPLIXJYNCYOEVZ5R	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Ko je Ana Brnabić u politici?
1357	DSYHZKAQPNQV2LNA	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Šta treba da znamo o Ani Brnabić?
1358	B7GCJC7SCRTAQXVK	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Ko je trenutna premijerka Srbije?
1359	8BC7IHMAQXWWIRRN	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Koji je položaj Ane Brnabić u vladi?
1360	DGMHJEDPFGMKXZMR	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Kako biste opisali Anu Brnabić?
1361	SSJT6GPXLSLU4OJ4	2023-06-28 14:48:47	2023-06-28 14:48:47	\N	321	Koji su dosadašnji dostignuća Ane Brnabić?
1362	PSEK42JAJ9RJZM5J	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Koji je kontakt Ministarstva?
1363	QWVZHL6LHTLH10Q2	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Koji je broj telefona ministarstva?
1364	ITI5DPNF0ZI2KXN2	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Kakav je broj telefona Ministarstva?
1365	TLVKOS5SUNBQKEEN	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Kako mogu da stupim u kontakt sa Ministarstvom?
1366	SVMHIN0OXKTS9YUZ	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Koja je adresa Ministarstva?
1367	QYMBKJVLDCL6GFTI	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Na koji način mogu da se povežem sa Ministarstvom?
1368	98PGVESLIJDJBFCS	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Gde mogu da pronađem kontakt podatke Ministarstva?
1369	DW7XSHKLETC68XHV	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Koji je e-mail Ministarstva?
1370	UV5TARRVESPXHUWH	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Da li možete da mi date kontakt informacije Ministarstva?
1371	NEA4C8FUUWV8QN4I	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Kako mogu da se informišem o kontaktu sa Ministarstvom?
1372	PQHHM728HX8KCPP3	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Koje su opcije za kontaktiranje Ministarstva?
1373	JYQORCI12UQVLO4Z	2023-06-28 14:49:20	2023-06-28 14:49:20	\N	322	Na koji način mogu da ostvarim komunikaciju sa Ministarstvom?
1147	TN27F7LWZQLMURDQ	2023-06-27 18:39:51	2023-06-28 14:49:55	2023-06-28 14:49:55	323	Koji su najznačajniji rezultati ministarstva?
1374	TSDNODXMYREG0PH2	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Gde mogu da vidim rezultate ministarstva?
1375	WS4VH7SA10KZHQTY	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Koji su rezultati ministarstva?
1376	SN4D6QR28B1WSJYP	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Koji su rezultati ministarstva u prvih 100 dana Vlade?
1377	SVJW3UCFPBGYLFLU	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Koji su najznačajniji rezultati ministarstva?
1378	T0ZNSXS22TBUOQSM	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Kako mogu da pristupim rezultatima ministarstva?
1379	U0BJJJZSKYFRCA5D	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Gde su dostupni rezultati ministarstva?
1380	RDA0M7YNPWMD39G0	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Kako mogu da se informišem o rezultatima ministarstva?
1381	YKI9YEOJRCFK1P5O	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Gde mogu da proverim rezultate ministarstva?
1382	BV2ZWJ9NYDXM6ZHB	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Na kojem mestu mogu da vidim rezultate ministarstva?
1383	VZQ4ZHZVDRTLUBUP	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Kako da pronađem rezultate ministarstva?
1384	GJ88XFE8HQGDVDFQ	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Koja je lokacija za pregled rezultata ministarstva?
1385	XWYB7LRRJY8CG8PW	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Gde su objavljeni rezultati ministarstva?
1386	SVTL3GMEKTQ6N4QQ	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Kako mogu da pronađem informacije o rezultatima ministarstva?
1387	DEAEFGZFWSMXEFV7	2023-06-28 14:49:55	2023-06-28 14:49:55	\N	323	Gde se mogu naći rezultati ministarstva?
1151	ODLG5XKU5KRGUOZT	2023-06-27 18:39:51	2023-06-28 14:50:27	2023-06-28 14:50:27	324	Koji su najznacajniji projekti ministarstva?
1152	N63JT6AMID6TZEE9	2023-06-27 18:39:51	2023-06-28 14:50:27	2023-06-28 14:50:27	324	Koji su najznacajniji projekti koji se rade?
1153	5EQH1OU1MYXWMMI2	2023-06-27 18:39:51	2023-06-28 14:50:27	2023-06-28 14:50:27	324	Koji su najznacajni projekti koji se grade?
1388	2MULT2J1VNH7Y26Z	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najznačajniji projekti ministarstva?
1389	VK24HCL8D5NGOIXB	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najznačajniji projekti koji se rade?
1390	CC6QZQM34JAWRCTN	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najznačajniji projekti koji se grade?
1391	FGEVWXTWTFQ1THGZ	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najznacajniji projekti ministarstva?
1392	VWASVIDQDHMHSVHM	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najznacajniji projekti koji se rade?
1393	UGOZXA9NNXQFHF5D	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najznacajni projekti koji se grade?
1394	OGTCQAYOTPZZ6UCS	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koje su najvažnije inicijative Ministarstva?
1395	WZWQLGUEIWIO8VSA	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najbitniji projekti Ministarstva?
1396	LJAY7FMIBZOGHWOX	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koje su ključne aktivnosti Ministarstva?
1397	PAU2LF5IBDYSJWDY	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Na kojim projektima Ministarstvo fokusira najviše pažnje?
1398	HN3NBF3SWSDYIRMY	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koji su najistaknutiji programi Ministarstva?
1399	XDUUCDGCVOPIZECY	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koje su glavne inicijative Ministarstva?
1400	F4TRXONK0BNDBCGX	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koje su najvažnije realizovane akcije Ministarstva?
1401	CJY9PK4JSXMD3SQR	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koje su najznačajnije inovacije Ministarstva?
1402	JTAI4J8MHJHTP9L9	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Na kojim projektima Ministarstvo ostvaruje najveći uticaj?
1403	71DJW0HK4XRJZRJK	2023-06-28 14:50:27	2023-06-28 14:50:27	\N	324	Koje su najuspješnije inicijative Ministarstva?
1404	H20303ZBHLL1UFK0	2023-06-28 14:50:46	2023-06-28 14:50:46	\N	325	Koja je adresa Ministarstva?
1405	CQFXATVOTN0LXBUJ	2023-06-28 14:50:46	2023-06-28 14:50:46	\N	325	Na kojoj adresi se nalazite?
1406	NLQ5MU6YQTKAAGIR	2023-06-28 14:50:46	2023-06-28 14:50:46	\N	325	Gde se nalazi ministarstvo?
1407	QDRSRNBINSBBGMIX	2023-06-28 14:50:46	2023-06-28 14:50:46	\N	325	Gde je pisarnica ministarstva?
1408	QBT7NRBCZRKJKVHM	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li ministarstvo ima Fejsbuk ili Instagram stranicu?
1409	PUTZXVBQIYHCSGG5	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li ministarsvo ima Facebook?
1410	GNFBBEUCTR1BTUVP	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li ministarstvo ima drutšvene mreže?
1411	H0TPHGF9BS84ZAUF	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li ministarstvo ima drustvene mreze?
1412	MEN4PDT0MGAHCS8G	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li Ministarstvo ima zvaničnu Fejsbuk ili Instagram stranicu?
1413	ODD4TYCVXDQVURZ1	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Postoji li Fejsbuk ili Instagram stranica Ministarstva?
1414	LREEZKEUVLNQ64GP	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li Ministarstvo ima aktivnu Fejsbuk ili Instagram stranicu?
1415	YXFYWMDT59XPIKKT	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Koje su zvanične društvene mreže Ministarstva, da li su to Fejsbuk i Instagram?
1416	JXRKCIGM5ZDYPI4G	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li Ministarstvo održava Fejsbuk ili Instagram profil?
1417	MFG5LSDZEZTKSDVW	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li je Ministarstvo prisutno na Fejsbuku ili Instagramu?
1418	EQCOXDMF3GRZNR2M	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Koje su društvene mreže koje koristi Ministarstvo, da li su to Fejsbuk i Instagram?
1419	RRGMRZYLJ4OAHT7J	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Da li Ministarstvo ima svoj Fejsbuk ili Instagram nalog?
1420	8W58VCDZLH8AZ1YY	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Postoji li Fejsbuk ili Instagram stranica koja pripada Ministarstvu?
1421	SDIKIRXDHSVABWOP	2023-06-28 14:51:28	2023-06-28 14:51:28	\N	326	Gde mogu pronaći Fejsbuk ili Instagram stranicu Ministarstva?
1422	WK67FUANANYYHBZD	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Šta je prioritet u radu ministarstva?
1423	XEQEKJ5LDMF4JFNF	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Sta je prioritet u radu ministrastva?
1424	8PDSGKHIH0UAPQDT	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koji su prioriteti u vasem radu?
1425	6GZ0SWN3OZLOTLJW	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koji su prioriteti u vašem radu?
1426	EPBVKRU7YDFMMZ1N	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koji je glavni fokus rada ministarstva?
1427	R1MCVO9RUWI2YJOJ	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koje su glavne oblasti koje ministarstvo stavlja na prvi plan u svom radu?
1428	ROVA1A2SWGCSTS4N	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koji aspekti su prioritet ministarstva u njihovom radu?
1429	AZAAK3D0SXM153YA	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Na šta ministarstvo stavlja najveći naglasak u svom radu?
1430	BTYNX95QR59HYRM1	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koje su ključne tačke koje ministarstvo smatra prioritetnim u svom radu?
1431	NXAL1EKODRQ0CMZ6	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Šta je najvažniji zadatak ministarstva u njihovom svakodnevnom radu?
1432	MKLDBOZR85DGCOF5	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koji su najvažniji ciljevi ministarstva u obavljanju svojih dužnosti?
1433	OFMV47LX9CJTBWN1	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koje su najvažnije inicijative ministarstva u njihovim radnim aktivnostima?
1434	PKDNY4PT7GBKKHZT	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Na šta ministarstvo stavlja najviše pažnje u svojim operacijama?
1435	KPM030SDMWZJQCC1	2023-06-28 14:52:06	2023-06-28 14:52:06	\N	327	Koji su ključni prioriteti ministarstva u ispunjavanju njihovih odgovornosti?
1436	VQ4QCVRTDR2KJUYU	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koje sektore obuhvata ministarstvo?
1437	GWAYFZHQYVAUE7GH	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koje sve sektore ima ministarstvo?
1438	7UYEQOUHNVSSHXGQ	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koji su sektori ministarstva?
1439	BNTMGWW9HBTPDHDO	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koji sektori su uključeni u nadležnost ministarstva?
1440	FKQ1AKIFUUZ938JK	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koje oblasti su obuhvaćene ministarstvom?
1441	MMYT2XZU5PQSZTXI	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koji sektor ministarstvo pokriva?
1442	RPPNVVOHZPJ0PW1B	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Na koje sektore se ministarstvo fokusira?
1443	IJ1V0BXPDWRPYHZY	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koje su sektorske nadležnosti ministarstva?
1444	Z7CJONMDH0KT1RGF	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Kojim područjima ministarstvo daje podršku?
1445	B3IH1X7SLMJCURNY	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koji su sektori uključeni u delokrug ministarstva?
1446	CCYXVGQAYH71D334	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koje su oblasti pokrivene od strane ministarstva?
1447	QKHW1PT7HNAFKI7R	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koji su sektori regulisani od strane ministarstva?
1448	OTVXV70V4LPTA1UW	2023-06-28 14:52:36	2023-06-28 14:52:36	\N	328	Koje industrije su pod jurisdikcijom ministarstva?
408	WUMXXSTW629FMIIQ	2023-06-27 18:39:49	2023-06-28 15:27:31	2023-06-28 15:27:31	85	Kada će iz Dunava biti izvađena nemačka flota iz Drugog svetskog rata?
409	FOQ3ANOUTDI5ZGFQ	2023-06-27 18:39:49	2023-06-28 15:27:31	2023-06-28 15:27:31	85	Kada će iz reka biti izvađena nemačka flota iz Drugog svetskog rata?
1449	WTPXJOAMQIBTLGWC	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će iz Dunava biti izvađena nemačka flota iz Drugog svetskog rata?
1450	LNCPLWSPVP3CVQGC	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će iz reka biti izvađena nemačka flota iz Drugog svetskog rata?
1451	1XKY4W69SRCJSC0R	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti uklonjena nemačka flota iz Drugog svetskog rata iz Dunava?
1452	IRU1TMXPC69MVBJO	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će se izvući nemačka flota iz Drugog svetskog rata iz Dunava?
1453	XQE6R8LBM1MUXGTU	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti izvučena nemačka flota iz Drugog svetskog rata iz Dunava?
1454	4V1PCRBWVGJEFYOJ	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti uklonjena nemačka ratna flota iz Drugog svetskog rata iz Dunava?
1455	5THMOCXQUUBWXBDJ	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti izdignuta nemačka flota iz Drugog svetskog rata iz Dunava?
1456	QDCEBLQALIREEDFY	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti uklonjene nemačke brodove iz Drugog svetskog rata iz Dunava?
1457	XDE3FR5RCHDQRTD4	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će se izvaditi nemačka flota iz Drugog svetskog rata iz Dunava?
1458	PTVFBVXDSXBSR14O	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti podignuta nemačka flota iz Drugog svetskog rata iz Dunava?
1459	UKKIEGOMXM1EBVSK	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti izvučene nemačke ratne brodove iz Drugog svetskog rata iz Dunava?
1460	Z5E4TGMVV3BFNEOX	2023-06-28 15:27:31	2023-06-28 15:27:31	\N	85	Kada će biti uklonjena nemačka mornarica iz Drugog svetskog rata iz Dunava?
1461	WSB5PBGKWIVQJQYS	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će biti proširena luka Prahovo?
1462	U7ACINFDRIAPW4IK	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Koji je rok za proširenje luke Prahovo?
1463	72FSTU0TMQ4DDT54	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će se proširiti luka Prahovo?
1464	C4BEF1OPLTEKPIPU	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada je planirano proširenje luke Prahovo?
1465	EZPT0SHI9AQ3EBUA	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada se očekuje proširenje luke Prahovo?
1466	RLDI1QQU7PGQMTNV	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će biti proširena prahovska luka?
1467	MEXDO9RDESYDH3OV	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će se dogoditi proširenje luke Prahovo?
1468	QYTLAZJ8EHBOLB0A	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će biti izvršeno proširenje prahovske luke?
1469	7E4OBUVRKANW4JTX	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će biti povećana luka Prahovo?
1470	6T8CRQ67SE9WMESV	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će se luka Prahovo proširiti?
1471	LGCKAPDEFVMZHZOC	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada će biti proširenje prahovske luke ostvareno?
1472	PFA1N1DKHNBSQEDS	2023-06-28 15:28:08	2023-06-28 15:28:08	\N	87	Kada se očekuje širenje luke Prahovo?
389	BGA8KFGEZWXK9QTC	2023-06-27 18:39:49	2023-06-28 16:26:06	2023-06-28 16:26:06	78	Koji je rok za završetak autoputa Sremska Rača – Kuzmin?
390	UMRL39A9GOBFHQVR	2023-06-27 18:39:49	2023-06-28 16:26:06	2023-06-28 16:26:06	78	Kada će biti gotov autoput Sremska Rača Kuzmin?
1473	I5L2DKRRCUBZSX0P	2023-06-28 16:26:06	2023-06-28 16:26:48	2023-06-28 16:26:48	78	Koji je rok za završetak autoputa Sremska Rača - Kuzmin?
1474	HJMY9SXGNAMDVJOT	2023-06-28 16:26:06	2023-06-28 16:26:48	2023-06-28 16:26:48	78	Kada će biti gotov autoput Sremska Rača Kuzmin?
1475	SD6WXDQ8MAGFIAEQ	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Koji je rok za završetak autoputa Sremska Rača - Kuzmin?
1476	XRVVWBEHGRODWBBK	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Kada će biti gotov autoput Sremska Rača Kuzmin?
1477	IJ19GXDLJQOJ4BSY	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	ada će biti završen autoput Sremska Rača - Kuzmin?
1478	D5ASUVENNRESM9QA	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Do kada je planiran završetak autoputa Sremska Rača - Kuzmin?
1479	8LZ3DJZQ9BJ7FFAR	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Koliko je vremena potrebno da se završi autoput Sremska Rača - Kuzmin?
1480	JCVWLL7KSWGX6FZP	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Postoji li određeni datum do kojeg će biti završen autoput Sremska Rača - Kuzmin?
1481	OY2CEALXPFCXANB0	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Mogu li dobiti informaciju o tačnom roku za završetak autoputa Sremska Rača - Kuzmin?
1482	41UV6B5TNW6IM4AC	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Koji je predviđeni krajnji datum izgradnje autoputa Sremska Rača - Kuzmin?
1483	1WTX9DR4GWGGOIEX	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Da li postoji definisani rok za dovršetak autoputa Sremska Rača - Kuzmin?
1484	EB8TFT4F0FQER1JU	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Kada će biti okončana izgradnja autoputa Sremska Rača - Kuzmin?
1485	6V93ZPNUCBXFXBXB	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Koliko još vremena je potrebno da se završi autoput Sremska Rača - Kuzmin?
1486	IHEYNE3AYPTJJJMA	2023-06-28 16:26:48	2023-06-28 16:26:48	\N	78	Kada se očekuje da će biti pušten u saobraćaj autoput Sremska Rača - Kuzmin?
1487	SDAFILA1QKYAMXKR	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Koji je rok za završetak radova na saobraćajnici Iverak – Lajkovac?
1488	D9MPZA5FNILGVJUN	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Kada će biti gotov put Iverak – Lajkovac?
1489	MSBGE8LAOXZLP6IQ	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Kada se planira završetak radova na saobraćajnici Iverak - Lajkovac?
1490	KPINHBJX078LUNUA	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Koliko je vremena predviđeno za dovršetak radova na saobraćajnici Iverak - Lajkovac?
1491	NVSQBC4DIW3EHE49	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Postoji li određeni datum do kojeg će biti završeni radovi na saobraćajnici Iverak - Lajkovac?
1492	8LYKWOL6A8HNRH5N	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Do kada se očekuje da će biti završena izgradnja saobraćajnice Iverak - Lajkovac?
1493	OUUQ3KG5SJ1W85UH	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Koji je predviđeni krajnji rok za završetak radova na saobraćajnici Iverak - Lajkovac?
1494	PVEHZL1C3TMGPIPF	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Da li postoji definisani rok za završetak radova na saobraćajnici Iverak - Lajkovac?
1495	IKQ3YR2OC2ZJESDE	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Kada se očekuje da će biti okončana izgradnja saobraćajnice Iverak - Lajkovac?
1496	7OCIDMQZL8CI7BVK	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Koliko još vremena je potrebno da se dovrše radovi na saobraćajnici Iverak - Lajkovac?
1497	CUOLDUF6ZIALLBQU	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Kada će biti završeni radovi na saobraćajnici Iverak - Lajkovac?
1498	H7ZNMMRTWIMY2EBK	2023-06-28 16:27:54	2023-06-28 16:27:54	\N	79	Mogu li dobiti informaciju o tačnom roku za završetak radova na saobraćajnici Iverak - Lajkovac?
398	4MTNCLXKBFUU8MKD	2023-06-27 18:39:49	2023-06-28 16:30:33	2023-06-28 16:30:33	81	Kada će biti gotov autoput Ruma – Šabac?
1499	JWPYZGFDWLRYULGA	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koji je rok za zavreštak auto-puta Ruma Šabac?
1500	FNP3FDVUIUXNPFTZ	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Kada će biti gotov autoput Ruma – Šabac?
1501	ZLKFNHCMHXBPZ1H4	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Do kada se očekuje da će biti završen auto-put Ruma - Šabac?
1502	T5I5UP4N3MAPQ4G3	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Kada je predviđen krajnji rok za završetak auto-puta Ruma - Šabac?
1503	2WGLS0IUCTCAMR4J	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koliko je vremena planirano za dovršetak auto-puta Ruma - Šabac?
1504	ZVMVXKKCQHRJV9WR	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Da li postoji definisan datum za završetak auto-puta Ruma - Šabac?
1505	DUG6PERDZS5LAYSF	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Kada će biti okončana izgradnja auto-puta Ruma - Šabac?
1506	UBCC8WHC4LTKKZAA	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koje je predviđeno trajanje izgradnje auto-puta Ruma - Šabac?
1507	AAHNL59G3OR9TH15	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Do kada se očekuje da će biti završeni radovi na auto-putu Ruma - Šabac?
1508	DFMEI5ORQ5L6V6GH	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koji je rok za dovršetak auto-puta Ruma - Šabac?
1509	WLWWTL0KUFSETTB1	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koliko još vremena je potrebno da se završi auto-put Ruma - Šabac?
1510	39VWBYH2ZFOZXAO5	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Mogu li dobiti informaciju o tačnom roku za završetak auto-puta Ruma - Šabac?
1511	GGTAKTE3G4XLTH6A	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Do kada se očekuje da će biti završen autoput Ruma - Sabac?
1512	QYECUO8ZSYLHGYSC	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Kada je predviđen krajnji rok za završetak autoputa Ruma - Sabac?
1513	5NPLM6KW021HJWSE	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koliko je vremena planirano za dovršetak autoputa Ruma - Sabac?
1514	IAOQAKJ8K4JHRGBQ	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Da li postoji definisan datum za završetak autoputa Ruma - Sabac?
1515	DGY0LQ7TB8PMUO9B	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Kada će biti okončana izgradnja autoputa Ruma - Sabac?
1516	SPXJKURA3NP0WLGA	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koje je predviđeno trajanje izgradnje autoputa Ruma - Sabac?
1517	V5MLYZKLTRUHCEDR	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Do kada se očekuje da će biti završeni radovi na autoputu Ruma - Sabac?
1518	AM2ZRUC4D1ZYLV6F	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koji je rok za dovršetak autoputa Ruma - Sabac?
1519	YCNCINMVAJHSINCT	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Koliko još vremena je potrebno da se završi autoput Ruma - Sabac?
1520	EESJATRMOIXGN3US	2023-06-28 16:30:33	2023-06-28 16:30:33	\N	81	Mogu li dobiti informaciju o tačnom roku za završetak autoputa Ruma - Sabac?
1521	YYOSB5BGKYHOHZPU	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Kada će biti izgrađen put preko Radan planine?
1522	XIUI8VKDMLRZCAAH	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Koji je rok za izgradnju puta preko Radan planine?
1523	DL8LY3TEET6I9BJA	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	ada će biti dovršena izgradnja puta preko Radan planine?
1524	7ASQ8TUGEUTH1JIW	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Koliko je vremena potrebno za izgradnju puta preko Radan planine?
1525	RYEJTHZPMC4D6ENK	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Kada je planiran završetak izgradnje puta preko Radan planine?
1526	IZVT7RO6ZTJV12JV	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Do kada se očekuje da će biti završen put preko Radan planine?
1527	3UXR0ZO22LWM9HZV	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Koji je predviđeni rok za izgradnju puta preko Radan planine?
1528	YXQ6BGOTVT1G1WFI	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Da li postoji definisan datum za završetak izgradnje puta preko Radan planine?
1529	L6BBUPPIKWKERSAL	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Kada će biti okončana izgradnja puta preko Radan planine?
1530	FPXG5BXZKXCAU014	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Koliko još vremena je potrebno da se izgradi put preko Radan planine?
1531	S79YXEEPOZ4GO0U0	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Kada će biti pušten u saobraćaj put preko Radan planine?
1532	XLV0TSVCZ44KDX0N	2023-06-28 16:31:45	2023-06-28 16:31:45	\N	83	Mogu li dobiti informaciju o tačnom roku za izgradnju puta preko Radan planine?
1533	J3NOWJOWFYSJAZPR	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Kada će biti proširena luka u Sremskoj Mitrovici?
1534	LEOPZ6J0DQ0L29UO	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Koji je rok za proširenje luke u Sremskoj Mitrovici?
1535	LLCSZSF3UCEDQXAX	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Do kada se planira proširenje luke u Sremskoj Mitrovici?
1536	MENDGDULMYDBB9ZB	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Koji je predviđeni rok za proširenje luke u Sremskoj Mitrovici?
1537	TVUXXYLTLVVS8Z27	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Kada će biti završeno proširenje luke u Sremskoj Mitrovici?
1538	J3KXS7SEPUQLJ3CV	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Koliko je vremena potrebno za proširenje luke u Sremskoj Mitrovici?
1539	8MMJWJP0GSWXGJD4	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Da li postoji definisani datum za završetak proširenja luke u Sremskoj Mitrovici?
1540	OSEHUYSDLOI3RODC	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Kada će biti okončano proširenje luke u Sremskoj Mitrovici?
1541	R1MP622YFHL9RDO6	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Koliko još vremena je potrebno da se proširi luka u Sremskoj Mitrovici?
1542	ZZDUTWYZWZMKR8O1	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Kada se očekuje da će biti završeno proširenje luke u Sremskoj Mitrovici?
1543	TLWLVEA5F9ZYXIQL	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Mogu li dobiti informaciju o tačnom roku za proširenje luke u Sremskoj Mitrovici?
1544	FLT3KBM5MSIJOFEG	2023-06-28 16:32:51	2023-06-28 16:32:51	\N	89	Kada će biti završena izgradnja proširenja luke u Sremskoj Mitrovici?
535	LA5QC52HX3W4LT9I	2023-06-27 18:39:49	2023-06-28 16:34:30	2023-06-28 16:34:30	123	Šta je to CEMT dozvola?
1545	OOIJXIMU6CETMUTB	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Šta je to CEMT dozvola?
1546	V8BU2MYGRPXJAS6V	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Koja je svrha CEMT dozvole?
1547	8MZ9PYE7ARJPITK1	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Šta predstavlja CEMT dozvola?
1548	NB6GCGIOY6EJTK0K	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Kako se definiše CEMT dozvola?
1549	RGH1YVAMSKAPSUPT	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Kakva je uloga CEMT dozvole?
1550	3JWC8DGM04NRUNRW	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Šta omogućava CEMT dozvola?
1551	AZHZTVQEGVODZXS4	2023-06-28 16:34:30	2023-06-28 16:34:30	\N	123	Koje su karakteristike CEMT dozvole?
668	QPV8H0TTAN8BC6ZO	2023-06-27 18:39:50	2023-06-28 16:36:52	2023-06-28 16:36:52	159	Kada će biti usvojen novi Zakon o planiranju i izgradnji?
669	VZI4B4KQTCGH3WOG	2023-06-27 18:39:50	2023-06-28 16:36:52	2023-06-28 16:36:52	159	Kada ce biti usvojen novi Zakon o planiranju i izgradnji?
1552	E9GRG0RXXJ4QDJDO	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Kada će biti usvojen novi Zakon o planiranju i izgradnji?
1553	BCEHUCAVKQ4EAGTX	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Kada ce biti usvojen novi Zakon o planiranju i izgradnji?
1554	FQKQYWLMLLKN6B3F	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Do kada se očekuje usvajanje novog Zakona o planiranju i izgradnji?
1555	JIKVHVKK9FH5R4WQ	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Koji je predviđeni rok za usvajanje novog Zakona o planiranju i izgradnji?
1556	EGGDICJKSCCFABZC	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Kada će biti donesen novi Zakon o planiranju i izgradnji?
1557	NAAU2NKNNWLS6L7B	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Koliko je vremena potrebno za usvajanje novog Zakona o planiranju i izgradnji?
1558	GG8EMYXGUWF9IAHE	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Da li postoji definisani datum za usvajanje novog Zakona o planiranju i izgradnji?
1559	VEQXSUKRFD3VHMK5	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Kada će biti okončano usvajanje novog Zakona o planiranju i izgradnji?
1560	BPSDX1JK1TVVL2EJ	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Koje je predviđeno trajanje procesa usvajanja novog Zakona o planiranju i izgradnji?
1561	0CQSZR4YBXAFM7FZ	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Kada se očekuje da će biti usvojen novi Zakon o planiranju i izgradnji?
1562	UAEQ1HLVK80ES3V7	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Mogu li dobiti informaciju o tačnom roku za usvajanje novog Zakona o planiranju i izgradnji?
1563	59IJ5JYTHC8MWNLZ	2023-06-28 16:36:52	2023-06-28 16:36:52	\N	159	Kada će biti završeno usvajanje novog Zakona o planiranju i izgradnji?
1564	DWG0P88S9XWMSDPE	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	U postupku realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju, predviđeno je rušenje nezakonito izgrađene porodične kuće, koja su prava vlasnika iste?
1565	XI54O8CNWTGVBVJW	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Koja su prava vlasnika nezakonito izgrađene porodične kuće u okviru Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1566	1TRUZSJHJ2LVXUUB	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Koji su prava vlasnika nelegalno izgrađene porodične kuće u toku realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1567	GZUCH5LAUMR0PA0U	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Kakva su prava vlasnika neovlašćeno podignute porodične kuće u procesu sprovođenja Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1568	0HXBAGONPR4AD1VK	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Šta su prava vlasnika ilegalno sagrađene porodične kuće u vezi sa Projektom za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1569	OD3IWBLV9WLOEKBO	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Koji su pravni položaj vlasnika nezakonito podignute porodične kuće u sklopu Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1570	AJPKTX79PJKK9DV4	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Koja su prava vlasnika nelegalno sagrađene porodične kuće tokom realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1571	L4XU5G43TJXW3JIB	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Kako su zaštićena prava vlasnika neovlašćeno izgrađene porodične kuće u procesu izvođenja Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1572	UOT6EJUNVJODMI6V	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Na koji način su regulisana prava vlasnika ilegalno izgrađene porodične kuće u okviru Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1573	JFMI2C4JPRLLGY71	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Koja prava ima vlasnik nezakonito podignute porodične kuće u vezi sa sprovođenjem Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
1574	APQLMLJZLD90ETNS	2023-06-28 18:21:51	2023-06-28 18:21:51	\N	53	Kako su prava vlasnika nelegalno sagrađene porodične kuće zaštićena u kontekstu Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju?
717	Y9GWBBX6OIASXZAS	2023-06-27 18:39:50	2023-06-28 19:28:11	2023-06-28 19:28:11	171	Razlozi nesaobraćanja vozova u određenim danima?
1575	PPLIALKSJFGPUEZR	2023-06-28 19:28:11	2023-06-28 19:28:11	\N	171	Razlozi nesaobraćanja vozova u određenim danima?
1576	HTMFGA9VA0L5LN0T	2023-06-28 19:28:36	2023-06-28 19:28:36	\N	168	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?
1577	ZNFG7FI0VENJE0UG	2023-06-28 19:29:04	2023-06-28 19:29:04	\N	172	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?
725	KO57IPHWWRIDTYFU	2023-06-27 18:39:50	2023-06-28 19:29:46	2023-06-28 19:29:46	174	Koji je maksimalan iznos koji može biti dodeljen jednom privrednom društvu koje ispunjava uslove u skladu sa konkursom za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
1578	KSEOAAHCEEQTB09V	2023-06-28 19:29:46	2023-06-28 19:29:46	\N	174	Koji je maksimalan iznos koji može biti dodeljen jednom privrednom društvu koje ispunjava uslove u skladu sa konkursom za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
1579	GJOQGWCAUKRDUXMM	2023-06-28 19:30:00	2023-06-28 19:30:00	\N	175	Informacije vezane za projekte koji su trenutno u realizaciji?
1580	HTJP6PCVDOWKVANI	2023-06-28 19:30:11	2023-06-28 19:30:11	\N	176	Informacije vezane za projekte koji su trenutno u realizaciji?
191	ZT1ZEZGHKJ8XMI47	2023-06-27 18:39:48	2023-06-28 19:31:56	2023-06-28 19:31:56	30	Koliko aviona ima Air Serbia?
192	6PAELCC5STM8XK69	2023-06-27 18:39:48	2023-06-28 19:31:56	2023-06-28 19:31:56	30	Koliko aviona ima Er Serbia?
193	KRXIBSNCZ9ERFQMG	2023-06-27 18:39:48	2023-06-28 19:31:56	2023-06-28 19:31:56	30	Koja je velicina flote Er Srbije?
194	YUGGXDFE21P6TL1T	2023-06-27 18:39:48	2023-06-28 19:31:56	2023-06-28 19:31:56	30	Koja je veličina flote Er Srbije?
195	NDBKLBJL7OFPPIJF	2023-06-27 18:39:48	2023-06-28 19:31:56	2023-06-28 19:31:56	30	Koje avione ima Er Srbija?
1581	FHRPRSCPPVG19NQ9	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliko aviona ima Air Serbia?
1582	DNKWYARQEKE3K3DA	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliko aviona ima Er Serbia?
1583	CBIYJ5CIQQNHZ009	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koja je velicina flote Er Srbije?
1584	5FEZJ9AVPC26YWES	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koja je veličina flote Er Srbije?
1585	7ZVHVNMGFP9QVNG0	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koje avione ima Er Srbija?
1586	OKL6E9CQXA02MZQD	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koje avione ima Air Srbija?
1587	WRKOO1R0AVKEEBCH	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliki je broj aviona u vlasništvu Air Serbia?
1588	UE6VZZ2AHSMXIKTW	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliko aviona poseduje Air Serbia?
1589	NZCATNRJYU5YOF7J	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Kakav je broj aviona u floti Air Serbia?
1590	QBC3GOVLMKHENVHT	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliko letelica ima Air Serbia?
1591	UTR49XOLSUCYR730	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koja je količina aviona u sastavu Air Serbia?
1592	TTJWMKMC97GIDNRF	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliki je ukupan broj aviona u Air Seriba?
1593	3Y3DLVNV6HUOTM4M	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koliko aviona je registrovano kod Air Seriba?
1594	9ARDB3VBUT7TPKUP	2023-06-28 19:31:56	2023-06-28 19:31:56	\N	30	Koje je tačno brojka aviona u Air Serbia?
728	OXXRH4EFIKRIXRHN	2023-06-27 18:39:50	2023-06-28 19:32:11	2023-06-28 19:32:11	177	Da li se u tekućoj godini planira raspisivanje konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
1595	EZRO0YMODWWDQUP9	2023-06-28 19:32:11	2023-06-28 19:32:11	\N	177	Da li se u tekućoj godini planira raspisivanje konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?
730	VMT1WNRTUOPJM1JC	2023-06-27 18:39:50	2023-06-28 19:33:37	2023-06-28 19:33:37	178	Kada će moći da se prevoze automobili vozom od Beograda do Bara?
1596	UN6ANDAWPBRXBYCQ	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada je planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila?
1597	PJZKGHNKWQYZHT7J	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će moći da se prevoze automobili vozom od Beograda do Bara?
1598	48JSERMXXRKGZZR2	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti moguće prevoziti automobile vozom između Beograda i Bara?
1599	HEAHPTBIHWWSJ9PU	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti omogućen prevoz automobila vozom sa Beograda do Bara?
1600	BFFEYML3JEGANW7E	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	U kojem vremenskom periodu će biti dostupan prevoz automobila vozom iz Beograda do Bare?
1601	TOUDXA8PO763APKN	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti realizovan prevoz vozila vozom između Beograda i Bara?
1602	CMYGJWIRCE31EXF0	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti otvorena usluga prevoza automobila vozom od Beograda do Bara?
1603	FQXFMAF5YTYSBRL5	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Koje je predviđeno vreme kada će se moći prevoziti automobili vozom od Beograda do Bara?
1604	STZTQII42PY6JOVO	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti uveden sistem prevoza automobila vozom sa Beograda do Bara?
1605	KPJJGHJ5WDI5R2FN	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	U kojem trenutku će biti omogućen transport automobila vozom iz Beograda do Bara?
1606	X3KMF1PZG5FAHCWT	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti uspostavljen redovni prevoz automobila vozom na relaciji Beograd - Bar?
1607	MTG64V6ORY5GOEYK	2023-06-28 19:33:37	2023-06-28 19:36:35	2023-06-28 19:36:35	178	Kada će biti dostupna usluga prevoza automobila vozom od Beograda do Bara?
1608	MMI3QOCDEVLNBFXT	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada je planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila?
1609	NM1NXOMHAN97DME9	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će moći da se prevoze automobili vozom od Beograda do Bara?
1610	DWW2Y0ZYXSIJRIRZ	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti moguće prevoziti automobile vozom između Beograda i Bara?
1611	Q8R71MPPDHOLDCBF	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti omogućen prevoz automobila vozom sa Beograda do Bara?
1612	TGDUKJXZ3KTJMYOP	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	U kojem vremenskom periodu će biti dostupan prevoz automobila vozom iz Beograda do Bare?
1613	Y2CGFVQUDV5X8LGM	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti realizovan prevoz vozila vozom između Beograda i Bara?
1614	VOVA7NASPR41IRJ4	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti otvorena usluga prevoza automobila vozom od Beograda do Bara?
1615	F88M247ZKPVETHXX	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Koje je predviđeno vreme kada će se moći prevoziti automobili vozom od Beograda do Bara?
1616	PCSW8DUGCGGDZBG8	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti uveden sistem prevoza automobila vozom sa Beograda do Bara?
1617	WG7MWJJXIFCI2CDG	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	U kojem trenutku će biti omogućen transport automobila vozom iz Beograda do Bara?
1618	7XEL563KMAEYQEB8	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti uspostavljen redovni prevoz automobila vozom na relaciji Beograd - Bar?
1619	B9PWSGFTPCF9FJFG	2023-06-28 19:36:35	2023-06-28 19:36:35	\N	178	Kada će biti dostupna usluga prevoza automobila vozom od Beograda do Bara?
1620	I4YZYPVWP1RSD11U	2023-06-28 19:38:21	2023-06-28 19:38:21	\N	179	Da li se u narednom periodu planira ponovno uspostavljanje železničkih linija koje su ukinute?
1621	ANXRTVTO8TT5UTRM	2023-06-28 19:40:21	2023-06-28 19:40:21	\N	180	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?
1622	F7G0C5KPMFF2RICF	2023-06-28 19:40:34	2023-06-28 19:40:34	\N	181	Regulisanje železničkog saobraćaja na putnim prelazima?
1623	LW573I1SPUVKJ2B7	2023-06-28 19:41:22	2023-06-28 19:41:22	\N	182	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?
1624	AABE9IC65TKFAKGJ	2023-06-28 19:43:17	2023-06-28 19:43:17	\N	183	Poteškoće kupovine karata za putovanje vozom preko aplikacije i sajta preduzeća „Srbija Voz“ a.d?
783	LBST8HFLGUQE5FBT	2023-06-27 18:39:50	2023-06-28 19:44:46	2023-06-28 19:44:46	199	Kada radi Železnički muzej?
1625	VT3HMIDOGKBBRM2T	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Koje je radno vreme Železničkog muzeja?
1626	N8ZA0YR8C4HAGR5V	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Kada radi Železnički muzej?
1627	ZRMEIPFPEKUMDZ1A	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Koji su radni sati Železničkog muzeja?
1628	SXBBI49ABJMNNIK4	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Koje su otvorene satnice Železničkog muzeja?
1629	OSFG25TMQU4JSJNI	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	U koje vreme Železnički muzej radi?
1630	ZYEVBGDYOB7WXY1B	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Kada je otvoren Železnički muzej?
1631	ZYCPECWOQ3RQHAAX	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Koji su termini radnog vremena Železničkog muzeja?
1632	IF40AY9XNRUDA7D2	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Koje su tačne radne doba Železničkog muzeja?
1633	ORMD6BUO5R3BIQIW	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	U koje vreme posetitelji mogu posetiti Železnički muzej?
1634	8JX4OBDMHZZLX6NG	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Kada možemo očekivati otvoren Železnički muzej?
1635	J0MMCD969FZC2WGI	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	Koje su vremenske okvire rada Železničkog muzeja?
1636	I0KWMORBOXRQ7FEU	2023-06-28 19:44:46	2023-06-28 19:44:46	\N	199	U kojim terminima je moguće posetiti Železnički muzej?
1637	NEAOU4U3YMPMQ1Z0	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Potrebne su mi infromacije o SRB plus kartici?
1638	OH2RO6CMTMIRN3CE	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Sta je to SRB plus kartica?
1639	MWFAPZNVSXEBCQYB	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Molim vas da mi pružite informacije o SRB plus kartici.
1640	CDZNNSJRHSLGXWGB	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Želeo/la bih da saznam sve detalje o SRB plus kartici.
1641	LBTIRLJBJQZLAP3A	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Koje su informacije dostupne o SRB plus kartici?
1642	0OG3LXAIA4BFXN2P	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Možete li mi objasniti kako funkcioniše SRB plus kartica?
1643	KZMQPNLTPTYS7EB6	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Gde mogu pronaći informacije o SRB plus kartici?
1644	3KCZT67IQDQQFPPE	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Kako se mogu informisati o prednostima i uslovima SRB plus kartice?
1645	QZW17YVJP4CT6P98	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Koje su karakteristike SRB plus kartice?
1646	FZLBBDRFNCM0H5TQ	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Da li možete da mi pružite sve relevantne informacije o SRB plus kartici?
1647	V8TENIX5KW41TJXX	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Koje su usluge i pogodnosti povezane sa SRB plus karticom?
1648	LXNRNWVXITRQMEBR	2023-06-28 19:45:46	2023-06-28 19:45:46	\N	198	Kako mogu dobiti detaljne informacije o SRB plus kartici?
797	BR2LUIGVGLP9KTUJ	2023-06-27 18:39:50	2023-06-28 19:47:01	2023-06-28 19:47:01	202	Ko je odgovoran za održavanje potrebne zone preglednosti na putnim prelazima preko pruge?
1649	8Z80SIN7H5JWBML4	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Ko je odgovoran za održavanje potrebne zone preglednosti na putnim prelazima preko pruge?
1650	FYUFCBCSW4ZHLX0M	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Ko je zadužen za održavanje potrebne vidljivosti na putnim prelazima preko pruge?
1651	6CJNZOD4JGABSLHH	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Kome je poverena odgovornost za održavanje dovoljne zone preglednosti na putnim prelazima preko železničke pruge?
1652	XDIMDGZPEY0IJ7KO	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Ko je odgovoran za održavanje vidljivosti na putnim prelazima preko pruge?
1653	LBUOLXM0GLXAUWKN	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Kome je pripada odgovornost za održavanje potrebne zone preglednosti na putnim prelazima preko pruge?
1654	YFM0I9GGZP4PMTOC	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Ko je nadležan za održavanje dovoljne vidljivosti na putnim prelazima preko železnice?
1655	EDGF1DMNQW51XR4W	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Kome je dodeljena dužnost održavanja potrebne zone preglednosti na putnim prelazima preko pruge?
1656	ASEN6CUGVKHUOCKF	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Ko je odgovoran za održavanje vidne zone na putnim prelazima preko železničke pruge?
1657	CEBERRXFLS1JDKBK	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Kome je povereno održavanje dovoljne preglednosti na putnim prelazima preko pruge?
1658	T0JBYWQT5TJH4WUG	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Ko je zadužen za održavanje potrebne vidljivosti na putnim prelazima preko železnice?
1659	ZNFQZID7OVJLSP4E	2023-06-28 19:47:01	2023-06-28 19:47:01	\N	202	Kome je dodeljena odgovornost za održavanje zone preglednosti na putnim prelazima preko pruge?
1660	NOUJAHLUVNJJSPSX	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li su vozači drumskih vozila dužni da se zaustave ispred putnog prelaza?
1661	FSS0QZSG1TNKXXVC	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li je obavezno da vozači drumskih vozila zaustave vozila ispred putnog prelaza?
1662	Z3QPY1LV1X1YRW9L	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li su vozači drumskih vozila dužni da se zaustave na putnom prelazu?
1663	GWCUSEAOSW9SUJ0I	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li je obaveza vozača drumskih vozila da se zaustave ispred putnog prelaza?
1664	JMRZPWPGHIATOTIM	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li je potrebno da vozači drumskih vozila stanu ispred putnog prelaza?
1665	RKOAGN7OZS8YGUVA	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li je vozačima drumskih vozila naloženo da se zaustave prelazeći putni prelaz?
1666	TAHMD5ZIXV1I3KIX	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li postoji zahtev da se vozači drumskih vozila zaustave prelazeći putni prelaz?
1667	PNJ3PEPECXX45UGO	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li je propisano da se vozači drumskih vozila zaustave na putnom prelazu?
1668	LSBRBLKXJX384IJF	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li vozači drumskih vozila moraju da se zaustave prelazeći putni prelaz?
1669	W1X5GMMPVIPV11BI	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li se od vozača drumskih vozila zahteva da se zaustave ispred putnog prelaza?
1670	2CYTW70Z9PC907C9	2023-06-28 19:48:34	2023-06-28 19:48:34	\N	206	Da li je vozačima drumskih vozila obavezno da se zaustave ispred putnog prelaza?
1671	DWRI0Z2NCC0VKPME	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno kretanje po otvorenoj pruzi?
1672	1UZ3PE2GYYIG1WOC	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno kretanje po otvorenoj železničkoj pruzi?
1673	7XXWYOMXQAXCTO2U	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dopušteno hodanje po otvorenoj pruzi?
1674	KSUEXQGSVDLREIH7	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno kretanje pešaka po železničkoj pruzi?
1675	WZEY1HT7JEJXH83M	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno šetanje po otvorenoj pruzi?
1676	VA4A7LGGUEC4ON98	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno trčanje po železničkoj pruzi?
1677	JXOCF89KLSICLZMC	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno boraviti na otvorenoj pruzi?
1678	JKFYFNHEKKU5FKRO	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno prelaziti železničku prugu van označenih mesta?
1679	NQ6HDFBSS0MJ3IN6	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je legalno biti na otvorenoj pruzi?
1680	OSASMXZLHX47ZH67	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno voziti bicikl po otvorenoj železničkoj pruzi?
1681	NERBNGMVGOFNKEO4	2023-06-28 19:51:23	2023-06-28 19:51:23	\N	208	Da li je dozvoljeno boraviti na ili pored železničke pruge?
908	2RNNCKZOQAQTUEGG	2023-06-27 18:39:51	2023-06-28 19:54:31	2023-06-28 19:54:31	226	Zašto se objekat (zgrada), za koji je izdata građevinska dozvola, gradi blizu objekta na susednoj parceli ili na granici parcele?
1682	T6QZ6PMJPQZDZGQG	2023-06-28 19:54:31	2023-06-28 19:54:31	\N	226	Zašto se objekat (zgrada), za koji je izdata građevinska dozvola, gradi blizu objekta na susednoj parceli ili na granici parcele?
909	SCJDQSJLD6KFQAI3	2023-06-27 18:39:51	2023-06-28 19:54:56	2023-06-28 19:54:56	227	Zašto građevinska inspekcija ne donosi rešenje o izvršenju za bespravno izvedene radove, za koje ima saznanje da je započet postupak legalizacije/ozakonjenja objekta ili dela objekta?
1683	82JBMBCWHKHVI1U2	2023-06-28 19:54:56	2023-06-28 19:54:56	\N	227	Zašto građevinska inspekcija ne donosi rešenje o izvršenju za bespravno izvedene radove, za koje ima saznanje da je započet postupak legalizacije/ozakonjenja objekta ili dela objekta?
1684	KCOMI0UIF9QPUVXT	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Ko vrši upis ili promenu prava na katastarskim parcelama?
1685	PYTDPNWHV6GYRXXI	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Ko je odgovoran za upis ili promenu prava na katastarskim parcelama?
1686	RFBCTFMJ3RMYSQQK	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Kome je povereno vršenje upisa ili promene prava na katastarskim parcelama?
1687	NZ7EV9AKCHWWXO6P	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Ko obavlja upis ili promenu prava na katastarskim parcelama?
1688	VG7S7DJBD96U1VPN	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Koji organ ili institucija je zadužen za upisivanje ili menjanje prava na katastarskim parcelama?
1689	YTYOMQTRFJGQXJGG	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Kome se treba obratiti za upis ili promenu prava na katastarskim parcelama?
1690	LZ2WRSKZ1IDIGVPM	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Koje telo ili organizacija je nadležna za obavljanje upisa ili promene prava na katastarskim parcelama?
1691	LKZLMT9E3KTF9HM4	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Ko je ovlašćen za sprovođenje upisa ili promene prava na katastarskim parcelama?
1692	YO6THIMXTERRCYDN	2023-06-28 19:56:45	2023-06-28 19:56:45	\N	228	Kome je pripadajuća uloga za upisivanje ili menjanje prava na katastarskim parcelama?
1693	PFXJB6LJTM9EWFG0	2023-06-28 19:56:46	2023-06-28 19:56:46	\N	228	Ko je nadležan za sprovodjenje postupka upisa ili promene prava na katastarskim parcelama?
1694	8IJED44DRXNN0NDQ	2023-06-28 19:56:46	2023-06-28 19:56:46	\N	228	Ko je odgovoran za vođenje evidencije o upisima ili promenama prava na katastarskim parcelama?
1695	RLVIQVXYDLX1P2VX	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Koja institucija je nadležna za izgradnju i obnovu postojećih trotoara duž državnog puta?
1696	6LEYBIYET7OYBZL3	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Ko je odgovoran za izgradnju i obnovu postojećih trotoara duž državnog puta?
1697	XFTO7TKS5AV0RNZ2	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Kome je pripadajuća nadležnost za izgradnju i obnovu trotoara duž državnog puta?
1698	4ONRDDG4ZLWEHUSF	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Koja institucija je zadužena za izgradnju i obnovu trotoara duž državnog puta?
1699	YMKSEULQTRXY8ZOY	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Koji organ je nadležan za obnovu i izgradnju trotoara duž državnog puta?
1700	MTOULESLHZQTQV3J	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Ko je odgovoran za izgradnju i obnovu trotoara duž državnog puta?
1701	GDIY3WED8IQOZXCZ	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Ko je ovlašćen za izgradnju i obnovu trotoara duž državnog puta?
1702	SMIDIPCMNHGNCBDH	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Kome je poverena nadležnost za izgradnju i obnovu trotoara duž državnog puta?
1703	SQN4CXVH37LL2BDY	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Koji organ vrši izgradnju i obnovu trotoara duž državnog puta?
1704	EPKKABMCFGZ5BXZS	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Koja institucija je nadležna za obnovu i izgradnju trotoara na državnom putu?
1705	WEETYDZBCFOONXQM	2023-06-28 19:59:19	2023-06-28 19:59:19	\N	233	Ko je zadužen za izgradnju i obnovu trotoara duž državnog puta?
1706	NADVZP5MQPR77ICT	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li se čamac može registrovati u lučkoj kapetaniji prema mestu držanja čamca?
1707	FAB9XKPNCGMJBRRF	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Može li se čamac registrovati u lučkoj kapetaniji na osnovu mesta na kojem se čamac nalazi?
1708	TJYUZKV9LDHJQMFL	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li je moguće registrovati čamac u lučkoj kapetaniji prema mestu gde se čamac čuva?
1709	JLNOKQVN6FOKVBLS	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li je dozvoljeno da se čamac registruje u lučkoj kapetaniji na osnovu lokacije gde se čamac nalazi?
1710	R0QOTCXGBW6CHELF	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Može li se čamac prijaviti u lučkoj kapetaniji prema mestu držanja čamca?
1711	ZTQTECKM1FBG3NIZ	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li je moguće registrovati čamac u lučkoj kapetaniji na temelju lokacije na kojoj se čamac čuva?
1712	MFC4MASYTSCKRL1N	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li je dopušteno da se čamac registruje u lučkoj kapetaniji prema mestu gde se čamac nalazi?
1713	DXGHZJAKEPORDZZA	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Može li se čamac upisati u lučkoj kapetaniji na osnovu mesta na kojem se čamac drži?
1714	GTKKUKZXJ1DMVGWI	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li je moguće registrovati čamac u lučkoj kapetaniji prema lokaciji gde se čamac nalazi?
1715	JZHGBKV27WVAELND	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Da li je dozvoljeno da se čamac prijavi u lučkoj kapetaniji na osnovu mesta držanja čamca?
1716	M4NEEDV5OC9N76QY	2023-06-28 20:00:25	2023-06-28 20:00:25	\N	234	Može li se čamac evidentirati u lučkoj kapetaniji prema mestu na kojem se čamac nalazi?
1717	LYQZT4YYCMPL7AKI	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li mogu da vršim javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?
1718	NWPE5CD0KIQHP6BK	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li mogu da prevozim 8 ili 9 putniika u kombiju?
1719	BWXA2GI3A2EUGNAM	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li je dozvoljeno vršiti javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?
1720	P5NKUPGO5TO9NQGS	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Može li se vozilom registrovanim za prevoz 8 ili 9 lica obavljati javni prevoz putnika?
1721	RDXOGCAQUB8OCFD6	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li je dopušteno obavljati javni prevoz putnika vozilom koje je registrovano za prevoz 8 ili 9 lica?
1722	ANRCVL8UMYDI5WRC	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Može li se javni prevoz putnika obavljati vozilom registrovanim za prevoz 8 ili 9 lica?
1723	HJA6OV6QLERHJSUS	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li je dozvoljeno koristiti vozilo registrovano za prevoz 8 ili 9 lica za javni prevoz putnika?
1724	JF8UYFHBC6S1JOKN	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Može li se vozilom koje je registrovano za prevoz 8 ili 9 lica vršiti javni prevoz putnika?
1725	0PVR693Q9GEH1GYS	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li je dozvoljeno pružati javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?
1726	MAO2VDDTGNBLJK61	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Može li se vozilom registrovanim za prevoz 8 ili 9 lica obavljati javni prevoz putnika?
1727	BERNCMXYUDCX46EB	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Da li je dopušteno obavljati javni prevoz putnika vozilom koje je registrovano za prevoz 8 ili 9 lica?
1728	IR1GH3Y3W7APEZCF	2023-06-28 20:01:44	2023-06-28 20:01:44	\N	236	Može li se javni prevoz putnika obavljati vozilom registrovanim za prevoz 8 ili 9 lica?
1729	JN0DALNQ8LWDDJF3	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je prevoznik u obavezi da mi izda voznu kartu?
1730	9I45FG2581YMFIVV	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li moram da imam kartu za vožnju?
1731	BAXBMJQVRWKEVH4D	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je prevoznik dužan da mi izda voznu kartu?
1732	EONSSYEGHOVSFTVK	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Moraju li prevoznici izdati voznu kartu?
1733	6UIAGGRI9OVOKW0A	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je prevoznik obavezan da mi pruži voznu kartu?
1734	RM3WV6QUHWRVHGEQ	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Jesu li prevoznici u obavezi da mi obezbede voznu kartu?
1735	ZQ9REGHS83OQTMOT	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je izdavanje vozne karte obaveza prevoznika?
1736	PKXAGHC2SFJPBDTS	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je prevoznik dužan da mi pruži kartu za putovanje?
1737	7DQ2LNK3WJ1IWIBN	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Moram li dobiti voznu kartu od prevoznika?
1738	VDDOB9QDFNG5UZCZ	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je prevoznik obavezan da mi izda kartu za prevoz?
1739	EYBA0JEJU2KAET4V	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Da li je izdavanje vozne karte deo odgovornosti prevoznika?
1740	RFYRDIDABBC9ZVHO	2023-06-28 20:02:46	2023-06-28 20:02:46	\N	237	Jesam li u pravu da prevoznik treba da mi obezbedi voznu kartu?
1741	JQKNEFPNDOIWEE0L	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome se upućuje pritužba na rad i postupanje profesionalnog upravnika stambene zajednice?
1742	N5GXO7RTEZR2VWOA	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kako da dam pritužbu na rad profesionalnog upravnika stambene zajednice?
1743	ZN92YRTCRD1CS7WH	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome se može podneti pritužba na rad i postupanje profesionalnog upravnika stambene zajednice?
1744	PTRKFH5L1YQWZAQS	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome treba uputiti pritužbu na rad i postupanje profesionalnog upravnika stambene zajednice?
1745	QSCIQV02FIYM68XX	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Ko je nadležan za prijem pritužbi na rad i postupanje profesionalnog upravnika stambene zajednice?
1746	ZEPCXK650LICTTWF	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome se može obratiti sa pritužbom na rad i postupanje profesionalnog upravnika stambene zajednice?
1747	52EH8LLQLLX7GI6A	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Ko je odgovoran za razmatranje pritužbi na rad i postupanje profesionalnog upravnika stambene zajednice?
1748	XPETQMILP2OJBVBF	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome treba da se obratim ako imam pritužbu na rad i postupanje profesionalnog upravnika stambene zajednice?
1749	L4NGPH84OL5O6QF3	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome je pripadajuća nadležnost za prijem pritužbi na rad i postupanje profesionalnog upravnika stambene zajednice?
1750	BD2ZRVKJD1FGDAQW	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Ko je odgovoran za rešavanje pritužbi na rad i postupanje profesionalnog upravnika stambene zajednice?
1751	RTJSYAWXAPA3XFOJ	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Kome se mogu uputiti pritužbe na rad i postupanje profesionalnog upravnika stambene zajednice?
1752	US9DPRNXO5DRWUV8	2023-06-28 20:03:43	2023-06-28 20:03:43	\N	238	Ko je zadužen za razmatranje pritužbi na rad i postupanje profesionalnog upravnika stambene zajednice?
1753	TR4IIPTGAYTPOPTZ	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Šta je potrebno za priključivanje na državni put?
1754	DVH3ALDINL3BDWZG	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koje su zahteve za priključivanje na državni put?
1755	DT6NYYI9OGBIODG1	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Šta je potrebno da bi se legalno priključio na državni put?
1756	WET9VTC4HNHJPF9X	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koje su uslove za dobijanje priključka na državni put?
1757	AQUJJ3YJLNSXVQPT	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koji su koraci i dokumentacija potrebni za priključivanje na državni put?
1758	YDLTAP7OMXA93IX0	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Šta je sve neophodno za uspešno priključivanje na državni put?
1759	7EVPUWG442KAAU3E	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koje su procedure i formalnosti za ostvarivanje priključka na državni put?
1760	DFXUOZXL4W7DGL3H	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koja dokumenta su obavezna za priključivanje na državni put?
1761	6MLKLKMGBGFZQKPS	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koji su zahtevi i pravila za povezivanje na državni put?
1762	VKKZOANADFBZ1IY5	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koje su smernice i uslovi za dobijanje pristupa državnom putu?
1763	LFDP8ECZ0RSRPAMU	2023-06-28 20:04:53	2023-06-28 20:04:53	\N	240	Koje su potrebne dozvole i saglasnosti za priključivanje na državni put?
1000	SCOIMWZFBTJUX3R7	2023-06-27 18:39:51	2023-06-28 20:05:55	2023-06-28 20:05:55	270	Ko izrađuje tehničku dokumentaciju za plovila?
1001	CIIIM389HAMLLTFF	2023-06-27 18:39:51	2023-06-28 20:05:55	2023-06-28 20:05:55	270	Ko izdaje tehnicku dokumentaciju za plovila?
1764	SOFNE68OCOHPHJU3	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko izrađuje tehničku dokumentaciju za plovila?
1765	AEJAWKNZVZFIDSJC	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko izdaje tehnicku dokumentaciju za plovila?
1766	YEWNJGOHTSDW5OID	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Kome je povereno izrada tehničke dokumentacije za plovila?
1767	5OI5TDBMVYMPQEMG	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko je odgovoran za izradu tehničke dokumentacije za plovila?
1768	TU2R2IRIX40HFAEG	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Koji entitet se bavi izradom tehničke dokumentacije za plovila?
1769	V6NSMTYGCSZNRYJS	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko je nadležan za pripremu tehničke dokumentacije za plovila?
1770	GOURMBKIPDD6ECKN	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Kome se može obratiti za izradu tehničke dokumentacije za plovila?
1771	FUFMF5ZTNIK5ZFEA	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko je zadužen za pripremu tehničke dokumentacije za plovila?
1772	AXNYG6QWFYOLKVPO	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Kome je pripadajuća uloga u izradi tehničke dokumentacije za plovila?
1773	NWSCWZD6EFH505MC	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko je ovlašćen za izradu tehničke dokumentacije za plovila?
1774	FI3AQMEDS0HNEL75	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Koji organ ili institucija vrši izradu tehničke dokumentacije za plovila?
1775	XK0KECILF67GEE5R	2023-06-28 20:05:55	2023-06-28 20:05:55	\N	270	Ko je stručan za pripremu tehničke dokumentacije za plovila?
965	7WY0OPEV2OLIS6QX	2023-06-27 18:39:51	2023-06-28 20:06:14	2023-06-28 20:06:14	251	Podnošenje predstavki po usvojenom planskom dokumentu u smislu visine eksproprijacije.
1776	2NCGNPWJU0LWD24V	2023-06-28 20:06:14	2023-06-28 20:06:14	\N	251	Podnošenje predstavki po usvojenom planskom dokumentu u smislu visine eksproprijacije.
1777	XX9WTRFZBGZQDZXV	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Šta je potrebno za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1778	6HY5MO176PEGVONO	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Koje su zahteve za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1779	9NKFOJIHKLSYRZVF	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Šta je sve neophodno za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1780	TG3BY5E5Y5OPT3ZI	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Koja dokumentacija je potrebna za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1781	TDD6AGHBF4W1YXVB	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Koji su koraci i procedura za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1782	SKBM5ZYXYB1RKG5R	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Koje su smernice i uslovi za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1783	TYUCRS8MZXGGGGIP	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Ko je nadležan za izdavanje dozvole za prevoz opasnih tereta (ADN) i šta je potrebno za njeno dobijanje?
1784	P8TXCSJTSUPVCOYI	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Kako se može dobiti dozvola za prevoz opasnih tereta (ADN) i koje su potrebne formalnosti?
1785	I0TNYT1QFBKKAQE4	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Koje su pravne i administrativne zahteve za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1786	LZ2THBLESOEZBRY1	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Kome se treba obratiti i koje su potrebne informacije za dobijanje dozvole za prevoz opasnih tereta (ADN)?
1787	G9MCIVDMTLNKTWA6	2023-06-28 20:07:22	2023-06-28 20:07:22	\N	278	Koji su uslovi i zahtevi za dobijanje dozvole za prevoz opasnih tereta (ADN) i ko je odgovoran za njen izdavanje?
1788	8FT6Y1LYUXHQWJIM	2023-06-28 20:07:52	2023-06-28 20:07:52	\N	285	Na računu imam sredstava, iz kog razloga mi je povezivanje kartice sa uređajem neuspešno?
1789	JGSOOKX0KZQDQEPI	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde mogu da kupim  ENP uređaj za VEB portal u okviru projekta Open Balkan?
1790	LD8L1NZNEAABXZXD	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde je moguće nabaviti tag uređaj za Open Balkan?
1791	XX9IJDZS4XPFWZMC	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde se može kupiti tag uređaj za Open Balkan?
1792	YHSAOZ4JSDWAN33S	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Koji su prodajni objekti gde mogu kupiti tag uređaj za Open Balkan?
1793	DGI3RPXVBVZEGIBL	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde se mogu naći tag uređaji za Open Balkan u prodaji?
1794	19Y35BN8Z2H14ZLX	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Koje su lokacije na kojima mogu nabaviti tag uređaj za Open Balkan?
1795	DDMNKBV3I7JAPTK0	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde se može obaviti kupovina tag uređaja za Open Balkan?
1796	UGSHZQHH85Z41QUQ	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Koji su distributeri tag uređaja za Open Balkan i gde ih mogu pronaći?
1797	X2UMQNWNPRLVRXXJ	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde mogu pronaći prodavnicu koja prodaje tag uređaje za Open Balkan?
1798	YIESCOZ99JZQQYIH	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Koji su online prodajni sajtovi na kojima mogu kupiti tag uređaj za Open Balkan?
1799	CIYNOKMF14EPH0UZ	2023-06-28 20:09:07	2023-06-28 20:09:07	\N	294	Gde se može obaviti kupovina tag uređaja za Open Balkan i koje su opcije dostupne?
1800	XIGNCOG877XINYJ3	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Kako mogu da izvršim prekonfiguraciju postojećeg ENP uređaja na VEB servis?
1801	NYJB3PQDQK5YZAZR	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Koji su koraci za prekonfiguraciju postojećeg ENP tag uređaja?
1802	12EDEUUEBKK6FXYX	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Kako mogu da promenim podešavanja na postojećem ENP tag uređaju?
1803	LT5NBXE7T0HPNWGN	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Koja je procedura za prekonfiguraciju postojećeg ENP tag uređaja?
1804	BTR1Q3XO2XET6WHK	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Kako mogu da modifikujem postavke na već instaliranom ENP tag uređaju?
1805	EBWPXER07N46TXD9	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Koje su korake potrebne za prilagođavanje postojećeg ENP tag uređaja?
1806	E3HONW2KQMPEADH3	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Kako mogu da izmenim konfiguraciju na ENP tag uređaju koji već imam?
1807	BVQPH4VQMEKFE7GU	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Koje su opcije dostupne za prekonfiguraciju postojećeg ENP tag uređaja?
1808	EZQP3B2SLZH48NQX	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Koji su postupci za prepravljanje podešavanja na ENP tag uređaju koji već posedujem?
1809	2Y3WSD0MDVE5VE5A	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Kako mogu da ažuriram postavke na postojećem ENP tag uređaju?
1810	LSWVQMGPATDJXGXZ	2023-06-28 20:12:45	2023-06-28 20:12:45	\N	295	Koje su mogućnosti za prilagođavanje podešavanja na već postavljenom ENP tag uređaju?
1811	PVLHXEGAOGEQBHUH	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Neispravan uređaj za ENP?
1812	AYQUISHS4AWFRLSJ	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Šta da radim ako imam neispravan uređaj za ENP?
1813	DLOKW0LJZQXNCQZL	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Kako da se postupam ako mi ne radi uređaj za ENP?
1814	5Q6VJR8JS4B37Q7A	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Koja je procedura za rešavanje problema sa neispravnim uređajem za ENP?
1815	RJLVLISYUOHGVSFP	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Kako da se nosim sa neispravnim uređajem za ENP?
1816	7E0BK7J3IXVMCKWY	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Ko je odgovoran za popravku neispravnog uređaja za ENP?
1817	B6HJEMVR2OUMHLFQ	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Koja su rešenja kada se suočim sa neispravnim uređajem za ENP?
1818	D4DWKP0H4WBZAKXF	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Koje su opcije dostupne za otklanjanje problema sa neispravnim uređajem za ENP?
1819	2W5FAOBACKGEVCR6	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Kako da prijavim neispravnost uređaja za ENP?
1820	7HXV3KQVKSYHL2PX	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Koja je nadležna institucija za rešavanje problema sa neispravnim uređajem za ENP?
1821	FGWW2UM3PERXP9RO	2023-06-28 20:13:56	2023-06-28 20:13:56	\N	306	Šta mogu da uradim ako imam problem sa uređajem za ENP koji ne funkcioniše ispravno?
1822	JXZXXLGU24Z39HOP	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Provera stanja na ENP uređaju?
1823	YGXHBTZTTT5RQOQE	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako da proverim stanje na ENP uređaju?
1824	XCSRRSXQVDP67JCR	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koje su opcije za proveru stanja na ENP uređaju?
1825	2MF0QOWIRZ1PBGDI	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako mogu da saznam trenutno stanje na ENP uređaju?
1826	4JOGEVMDI1SNZXNK	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koja je procedura za proveru stanja na ENP uređaju?
1827	TE0ZVUBWAKRZUXJC	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako da dobijem informacije o stanju na ENP uređaju?
1828	BBOJLIACPBQMJHGR	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Na koji način mogu da proverim status na ENP uređaju?
1829	VZ61UZNEAAZZWUUU	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koje su metode za proveru stanja na ENP uređaju?
1830	EDACCNPB0F9FI9B4	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koji su koraci za proveru trenutnog stanja na ENP uređaju?
1831	SVZTZVCIQ1U5CWRS	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako da saznam informacije o stanju na ENP uređaju?
1832	T9OMZCMGJOYXDAZQ	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Na koji način mogu dobiti detalje o stanju na ENP uređaju?
1833	BXGSTADMERRM8EXW	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako da proverim stanje na TAG uređaju?
1834	9AQXQFXYZYA0UEQU	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koje su opcije za proveru stanja na TAG uređaju?
1835	NJE0W7FZ6E7YJH9Z	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako mogu da saznam trenutno stanje na TAG uređaju?
1836	P6NFSE0THB25YMZP	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koja je procedura za proveru stanja na TAG uređaju?
1837	65GBM2BQYD6S6MMT	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako da dobijem informacije o stanju na TAG uređaju?
1838	LGMRXIEIG5IO4VQH	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Na koji način mogu da proverim status na TAG uređaju?
1839	PP7Z62ZNDNOKNDEG	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koje su metode za proveru stanja na TAG uređaju?
1840	CTYLBKFMZ6MU1PDZ	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Koji su koraci za proveru trenutnog stanja na TAG uređaju?
1841	FAZZPYPVBTI3C1EJ	2023-06-28 20:15:00	2023-06-28 20:15:00	\N	308	Kako da saznam informacije o stanju na TAG uređaju?
1842	4XGWYKVO0VIWVYJ8	2023-06-28 20:15:01	2023-06-28 20:15:01	\N	308	Na koji način mogu dobiti detalje o stanju na TAG uređaju?
1843	3QKVEH0HSULFA859	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li imam popust na putarinu ako koristim ENP uređaj?
1844	HIV54BNXOQWQNDS5	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li se odobrava popust na putarinu ukoliko koristim ENP uređaj?
1845	P9FRDHRPVKWQBFGM	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koje su beneficije u vidu popusta na putarinu prilikom korišćenja ENP uređaja?
1846	VMQ38QEAJEMI5YMD	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li postoji privilegija popusta na putarinu za korisnike ENP uređaja?
1847	5ZRLJXQ3YTNDDWS2	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koji su uslovi za dobijanje popusta na putarinu prilikom korišćenja ENP uređaja?
1848	UYNCNKHODGX380NK	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li ENP uređaj omogućava snižene tarife za putarine?
1849	U1JCK4ZLJZADDNYZ	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koje su pogodnosti u smislu smanjenja cene putarine prilikom korišćenja ENP uređaja?
1850	8GFNKYICM6JMZJ2D	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li korišćenje ENP uređaja podrazumeva privilegovanu cenu putarine?
1851	FWOJE2CCTCSZII3K	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Kako mogu ostvariti popust na putarinu ukoliko koristim ENP uređaj?
1852	FJCPT84S8A84XXZP	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koje su prednosti u vidu smanjenja troškova putarine pri korišćenju ENP uređaja?
1853	1MSGN9TOJ5K41ZBC	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li ENP uređaj donosi finansijske olakšice u smislu popusta na putarine?
1854	WWO2YT7TMPH8OMAL	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li imam popust na putarinu ako koristim TAG uređaj?
1855	LZNSSKCYUC7U9AMP	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li se odobrava popust na putarinu ukoliko koristim TAG uređaj?
1856	KZCGRCJZZUODXZKA	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koje su beneficije u vidu popusta na putarinu prilikom korišćenja TAG uređaja?
1857	OWYQV5VM9FYYG0FG	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li postoji privilegija popusta na putarinu za korisnike TAG uređaja?
1858	KHN2JCDJD2EKSEYW	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koji su uslovi za dobijanje popusta na putarinu prilikom korišćenja TAG uređaja?
1859	JDTYIBUWOHFUBX3O	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li TAG uređaj omogućava snižene tarife za putarine?
1860	CDZBONKLAZ9KPAYJ	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koje su pogodnosti u smislu smanjenja cene putarine prilikom korišćenja TAG uređaja?
1861	Z9DSARZWTZ9VEYEE	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li korišćenje TAG uređaja podrazumeva privilegovanu cenu putarine?
1862	S2XKGD72RELR3WV1	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Kako mogu ostvariti popust na putarinu ukoliko koristim TAG uređaj?
1863	UNU5AOTVW0V5ODVD	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Koje su prednosti u vidu smanjenja troškova putarine pri korišćenju TAG uređaja?
1864	7XUGIXIEJ47UK8FH	2023-06-28 20:16:37	2023-06-28 20:16:37	\N	309	Da li TAG uređaj donosi finansijske olakšice u smislu popusta na putarine?
1865	NP2DPLSQNQWS0RSM	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li uređaj može da se koristi za motocikle?
1866	HMUAZQMSCRIU3BHS	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li je TAG uređaj kompatibilan sa motociklima?
1867	9WZBPLRFYC4DTTW3	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Mogu li motociklisti koristiti TAG uređaj?
1868	Z09BJD5SFY5RGX5O	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li je moguće upotrebiti TAG uređaj za naplatu putarine na motociklima?
1869	NTOMVKT5LWUPCSFV	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li se TAG uređaj može koristiti na motociklima?
1870	LDR4Z7WYTPGD1IB8	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li je dozvoljeno montirati TAG uređaj na motocikl?
1871	9FWXJWRAOHFNWMZU	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Koje vrste vozila mogu koristiti TAG uređaj, uključujući motocikle?
1872	VZX8XMD9KEZ5KASF	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li motociklisti imaju mogućnost korišćenja TAG uređaja za plaćanje putarine?
1873	IXG3GHUIHY7B846R	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li je TAG uređaj pogodan za upotrebu na motociklima?
1874	KNTD25ETKHVAQRSJ	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Koja vozila su podržana za korišćenje TAG uređaja, uključujući motocikle?
1875	WDVONIFMJFGAKPNY	2023-06-28 20:17:49	2023-06-28 20:17:49	\N	307	Da li postoji specifičnost ili ograničenje u vezi sa korišćenjem TAG uređaja na motociklima?
1876	M56RJUBP57EJEZAG	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada ce biti izgradjena fabrika za preradu otpadnih voda u Velikom Selu?
1877	K7MOOV3CXBEXTSAI	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada će biti izgrađena fabrika za preradu otpadnih voda u Velikom Selu?
1878	6HPJWQJ6WFIIXCKB	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Koji je planirani datum završetka izgradnje fabrike za preradu otpadnih voda u Velikom Selu?
1879	RJFOUCURLUOC3GID	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada se očekuje da će biti okončana izgradnja fabrike za preradu otpadnih voda u Velikom Selu?
1880	UKPDKMONXIPTIAXG	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Da li postoji precizan datum kada će biti završena fabrika za preradu otpadnih voda u Velikom Selu?
1881	SLNSEGN92ASP1ZAP	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada se predviđa da će biti izgrađena fabrika za preradu otpadnih voda u Velikom Selu?
1882	ALO9ZR5NMRNPDAMC	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Koje je planirano vreme za završetak izgradnje fabrike za preradu otpadnih voda u Velikom Selu?
1883	3VLBHLZUUMTNQASD	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada će biti dovršena izgradnja fabrike za preradu otpadnih voda u Velikom Selu?
1884	AGX9EIEBSDQBTM4Z	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Da li postoji tačan raspored za izgradnju fabrike za preradu otpadnih voda u Velikom Selu?
1885	FSBBCZPLW20532SM	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada se očekuje da će biti operativna fabrika za preradu otpadnih voda u Velikom Selu?
1886	6XLRIREYR9CWERQT	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Koje su prognoze za završetak izgradnje fabrike za preradu otpadnih voda u Velikom Selu?
1887	7VX7VYXHWVVNO4DQ	2023-06-28 20:18:47	2023-06-28 20:18:47	\N	330	Kada će biti spremna za upotrebu fabrika za preradu otpadnih voda u Velikom Selu?
1888	SMLTZ3VLU6OPH4B3	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada ću moći sa srpskim TAG-om da prolazim kroz Makedoniju?
1889	DMSG2EHW49VQ7TD8	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada će srpski TAG biti prihvaćen za prolazak kroz Makedoniju?
1890	ZL035JS65IAD2WJV	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Koje je očekivano vreme kada će srpski TAG biti validan za korišćenje u Makedoniji?
1891	IXXT8KDA2HZALBM6	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada će srpski TAG biti kompatibilan za putovanje kroz Makedoniju?
1892	SOPM32CTPNODBYRR	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Da li postoji planirani datum kada će srpski TAG biti prihvaćen u Makedoniji?
1893	6RQRIJUFPOVU0YGF	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada će biti moguće koristiti srpski TAG za prolazak kroz makedonske naplatne rampe?
1894	KIIAFKSCIPZHMGWP	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Koje su prognoze za implementaciju srpskog TAG-a u Makedoniji?
1895	M1SPATQPX5AQETYW	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada će srpski TAG biti aktiviran za upotrebu na makedonskim putevima?
1896	TQPHJGCJSUPNMWKA	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Da li je poznato kada će srpski TAG biti odobren za korišćenje u Makedoniji?
1897	ILHDMHY6NXSATBYW	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada će srpski TAG biti legalan za putovanje kroz Makedoniju?
1898	JOJMFNXKMDPWWBW7	2023-06-28 20:19:57	2023-06-28 20:19:57	\N	300	Kada se očekuje da će srpski TAG biti operativan za upotrebu na makedonskim putevima?
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.questions (id, uid, created_at, updated_at, deleted_at, category_id, question, answear, links, attachments, active) FROM stdin;
1	AWN55XZBDVH3IXID	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim visinama plovidbenih otvora mostova, kao i situacioni prikazi i podužni profili mostova na međunarodnim i međudržavnim rekama?	Tražene podatke možete preuzeti na internet prezentaciji Direkcije za vodne puteve @link1@.	{"0": {"path": "https://www.plovput.rs/plovidbeni-bilten", "type": "url", "title": "https://www.plovput.rs/plovidbeni-bilten", "placeholder": "@link1@"}}	null	t
2	WF8STAMPEKQNWDDG	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Kako se može doći do Plana obeležavanja Dunava, Save i Tise?	Aktuelni plan obeležavanja Dunava, Save i Tise, kao i izdanja iz prethodnih godina možete preuzeti na portalu Direkcije @link1@.	{"0": {"path": "https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf", "type": "url", "title": "https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf", "placeholder": "@link1@"}}	null	t
3	MAKQBWLPXHM0P69O	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Sa portala Direkcije za vodne puteve su preuzete elektronske plovidbene karte Dunava, Tise i Save, kako mogu da im pristupim?	Nakon preuzimanja .ZIP datoteka sa plovidbenim kartama, potrebno je da instalirate program za pregled karata u standardnom .000 formatu, SeeMyENC @link1@ i da nakon otvaranja datoteke ceo **ROOT** folder prevučete u prozor sa leve strane aplikacije.	{"0": {"path": "https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf", "type": "url", "title": "https://www.plovput.rs/file/plan_obelezavanja/plan-obelezavanja-2023-cir.pdf", "placeholder": "@link1@"}}	null	t
4	6V23P2XXETN5BPII	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Na kojoj web lokaciji se mogu preuzeti podaci o raspoloživim dubinama pri trenutnom vodostaju na kritičnim sektorima za plovidbu?	Tražene podatke možete preuzeti sa internet prezentaciji Direkcije za vodne puteve @link1@.	{"0": {"path": "https://www.plovput.rs/plovidbeni-bilten", "type": "url", "title": "https://www.plovput.rs/plovidbeni-bilten", "placeholder": "@link1@"}}	null	t
5	9Q6U8UN7LXBBPD51	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Želim da imam uvid u lokaciju plovila u okviru RIS sistema.	Zbog privatnosti podataka i zaštite konkurencije, pristup RIS sistemu Srbije imaju isključivo nadležne, odnosno institucije od posebnog državnog značaja. Pristup takođe mogu da dobiju i brodarske kompanije koje na zvaničan zahtev odnosno odobrenje Direkcije za vodne puteve mogu da dobiju uvid u lokaciju isključivo onih plovila koja se nalaze u njihovom vlasništvu.	null	null	t
6	0GQD9NLEHEQNK0JL	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Potreban mi je uvid u istoriju kretanja plovila koje je izazvalo incident.	Uvid u istoriju kretanja plovila u okviru RIS sistema mogu da dobiju isključivo pravosudni organi koji su pokrenuli postupak protiv fizičkog ili pravnog lica zbog izazivanja plovidbenog incidenta. Direkcija za vodne puteve po dobijanju zvaničnog zahteva od nadležnog suda dostavlja arhivu kretanja plovila u vidu trajektorije, vremena i lokacije u svim raspoloživim odnosno potrebnim formatima. Za više informacija posetitie sajt Direkcije za voden puteve @link1@ ili ih kontaktirajte, telefon @link2@.	{"0": {"path": "https://www.plovput.rs", "type": "url", "title": "https://www.plovput.rs", "placeholder": "@link1@"}, "1": {"path": "+381113029800", "type": "tel", "title": "+381 11 30 29 800", "placeholder": "@link2@"}}	null	t
7	NTXUEIWZ1BV5U3WI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koji organ državne uprave je nadležan za uspostavljanje linijskog rečnog saobraćaja?	Organizaciju lokalne linijske plovidbe uređuje i obezbeđuje jedinica lokalne samouprave na čijoj teritoriji se obavlja lokalna linijska plovidba. Direkcija za vodne puteve izdaje uslove za izradu tehničke dokumentacije za postavljanje plutajućih objekata za pristajanje plovila koja vrše prevoz putnika u domaćoj linijskoj plovidbi na međunarodnim i međudržavnim vodnim putevima, kao i saglasnost na urađenu tehničku dokumentaciju. Za više informacija posetitie sajt Direkcije za voden puteve @link1@ ili ih kontaktirajte, telefon @link2@.	{"0": {"path": "https://www.plovput.rs", "type": "url", "title": "https://www.plovput.rs", "placeholder": "@link1@"}, "1": {"path": "+381113029800", "type": "tel", "title": "+381 11 30 29 800", "placeholder": "@link2@"}}	null	t
8	JQWJZM0CVDQLKIQH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Interesuje me postupak izdavanja plovidbenih dozvola?	Izdavanje plovidbenih dozvola je u nadležnosti lučkih kapetanija koje periodično organizuju polaganje posebnih ispita neophodnih za sticanje plovidbene dozvole. Za više informacija posetitie sajt Direkcije za voden puteve @link1@ ili ih kontaktirajte, telefon @link2@.	{"0": {"path": "https://www.plovput.rs", "type": "url", "title": "https://www.plovput.rs", "placeholder": "@link1@"}, "1": {"path": "+381113029800", "type": "tel", "title": "+381 11 30 29 800", "placeholder": "@link2@"}}	null	t
9	WNOYLEXYKYK2DMDW	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koja je procedura za ishodovanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima, koje izdaje Direkcija za vodne puteve?	Procedura za ishodovanje Rešenja o potvrđivanju validnosti hidrografskih podataka na međunarodnim i međudržavnim vodnim putevima podrazumeva podnošenje odgovarajućeg zahteva kod Direkcije za vodne puteve, pod uslovima koji su dati na internet prezentaciji Direkcije za vodne puteve @link1@.	{"0": {"path": "https://www.plovput.rs/izdavanje-resenja-o-potvrdjivanju-validnosti-hidrografskih-podataka", "type": "url", "title": "https://www.plovput.rs/izdavanje-resenja-o-potvrdjivanju-validnosti-hidrografskih-podataka", "placeholder": "@link1@"}}	null	t
10	WMUFIMRDUDOJIDOT	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koja je procedura za ishodovanje Mišljenja u postupku izdavanja vodnih akata za vađenje rečnih nanosa?	Procedura za ishodovanje Mišljenja u postupku izdavanja vodnih uslova i Mišljenja u postupku izdavanja vodne saglasnosti, za vađenje rečnog nanosa iz korita međunarodnih i međudržavnih vodnih puteva detaljno je opisana na internet prezentaciji Direkcije za vodne puteve @link1@.	{"0": {"path": "https://www.plovput.rs/izdavanje-akata-misljenja-za-bagerovanje", "type": "url", "title": "https://www.plovput.rs/izdavanje-akata-misljenja-za-bagerovanje", "placeholder": "@link1@"}}	null	t
11	LPMIAYYRFRDMJW7R	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Na kojoj web lokaciji je moguće pogledati i preuzeti položaj plovnog puta na međunarodnim i međudržavnim vodnim putevima?	Položaj plovnog puta na reci Savi i Dunavu međunarodni vodni putevi i na reci Tisi međudržavni vodni put dostupni su na internet prezentaciji Direkcije za vodne puteve @link1@.	{"0": {"path": "https://www.plovput.rs/elektronske-plovidbene-karte", "type": "url", "title": "https://www.plovput.rs/elektronske-plovidbene-karte", "placeholder": "@link1@"}}	null	t
88	LTRJDQREGC0WQD3C	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti izgrađena nova luka u Beogradu?	Rok za završetak projekta Izgradnja nove Luke u Beogradu je četvrti kvartal 2026. godine.	null	null	t
12	IQBMLB9RL8HT9BVS	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Interesuje me gde je moguće kupiti štampana izdanja plovidbenih karata Dunava, Tise i Save?	Direkcija za vodne puteve ne poseduje štampana izdanja plovidbenih karata. Plovidbene karte Dunava, Tise i Save se nalaze na portalu Direkcije za vodne puteve, gde se mogu preuzeti potpuno besplatno u elektronskoj formi @link1@.	{"0": {"path": "https://www.plovput.rs/papirne-plovidbene-karte", "type": "url", "title": "https://www.plovput.rs/papirne-plovidbene-karte", "placeholder": "@link1@"}}	null	t
13	DO67GTLLZWVBS8YF	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koji je sadržaj projekta za izvođenje poslova u okviru hidrografske delatnosti?	Direkcija za vodne puteve donela je Uputstvo za izradu projekta za izvođenje poslova u okviru hidrografske delatnosti, koje se može preuzeti na internet prezentaciji Direkcije za vodne puteve @link1@ ili ih kontaktirajte na @link2@.	{"0": {"path": "https://www.plovput.rs/file/usluge/izdavanje-resenja-potvrdjivanje-validnosti-hidrografskih-podataka/potvrdjivanje-validnosti-hidrografskih-podataka-uputstvo-za-plan.pdf", "type": "url", "title": "https://www.plovput.rs/file/usluge/izdavanje-resenja-potvrdjivanje-validnosti-hidrografskih-podataka/potvrdjivanje-validnosti-hidrografskih-podataka-uputstvo-za-plan.pdf", "placeholder": "@link1@"}, "1": {"path": "+381113029800", "type": "tel", "title": "+381 11 30 29 800", "placeholder": "@link2@"}}	null	t
14	WHJ58TQPQTICSZVH	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koja pravna lica mogu da obavljaju hidrografska merenja?	Hidrografska merenja mogu da obavljaju pravna lica, koja su u skladu sa čl.6. st. 3. Zakona o hidrografskoj delatnosti @link1@ Službeni glasnik RS br. 9/20, ishodovala Rešenje Ministarstva nadležnog za poslove saobraćaja o ispunjenosti uslova za obavljanje hidrografske delatnosti. Za dodatne informacije možete da se obratite Ministarstvu građevinarstva, saobraćaja i infrastrukture, Sektoru za vodni saobraćaj i bezbednost plovidbe na brojeve telefona @link2@ i @link3@ ili putem pošte na adresu Nemanjina 2226, Beograd.	{"0": {"path": "http://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2020/9/3/reg", "type": "url", "title": "http://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2020/9/3/reg", "placeholder": "@link1@"}, "1": {"path": "+381113619491", "type": "tel", "title": "+381 11 36 19 491", "placeholder": "@link2@"}, "2": {"path": "+381113621698", "type": "tel", "title": "+381 11 36 21 698", "placeholder": "@link3@"}}	null	t
15	LSWDI4ER3W2ADIXX	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koja je procedura za postavljanje plutajućih objekata na vodnom zemljištu?	Direkcija za vodne puteve nije nadležna za postavljanje plutajućih objekata na vodnom zemljištu, već to uređuje i obezbeđuje jedinica lokalne samouprave na čijoj teritoriji je planirano postavljanje plutajućih objekata. Za više informacija možete se obratiti jedinici lokalne samouprave na čijoj teritoriji želite da postavite plutajući objekat.	null	null	t
16	TWWQGSLMVK74QCPV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Da li Direkcija za vodne puteve izdaje saglasnost na plansku dokumentaciju čiji je obuhvat međunarodni i/ili međudržavni vodni put?	Delove obale i vodnog prostora na kojima se mogu graditi hidrotehnički objekti i marine, postavljati plutajući objekti, plutajući objekti za snabdevanje brodova gorivom i privezišta za čamce, kao i uslove i način postavljanja plutajućih objekata i privezišta za čamce, određuje nadležni organ lokalne samouprave u skladu sa zakonom kojim se uređuje lokalna samouprava. Na propise i druge opšte akte koje donose nadležni organi lokalne samouprave koji uređuju ovu materiju, kao i na plan postavljanja plutajućih objekata, plutajućih objekata za snabdevanje brodova gorivom i privezišta za čamce, prethodno se pribavlja saglasnost Ministarstva nadležnog za poslove saobraćaja Ministarstvo građevinarstva, saobraćaja i infrastrukture. Za više informacija posetite @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/cir/dokumenti-list/89/176", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti-list/89/176", "placeholder": "@link1@"}}	null	t
17	3AZJMFJGGRGZSVNE	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Zanima me procedura registracije plovila?	Registracijom plovila se bave nadležne lučke kapetanije koje kao područne jedinice nadležnog Ministarstva obavljaju delatnosti registracije plovila i izdavanja plovidbenih dokumenata. Na sledećem linku možete pogledati spisak lučkih kapetanija Srbije, kao i spisak područnih jedinica opština lučkih kapetanija @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/lat/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "type": "url", "title": "https://www.mgsi.gov.rs/lat/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "placeholder": "@link1@"}}	null	t
18	TVSVKVJBOANO9GAY	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Za koje radove na međunarodnim i međudržavnim vodnim putevima Direkcija za vodne puteve izdaje saglasnosti?	Za izvođenje radova na međunarodnim i međudržavnim vodnim putevima koji ne podležu izdavanju akata u ostvarivanju prava na izgradnju u skladu sa zakonom kojim se uređuje planiranje i izgradnja, potrebno je pribaviti nautičku saglasnost koju izdaje nadležna lučka kapetanija i saglasnost koju izdaje Direkcija za vodne puteve i to pre početka izvođenja radova. Za više informacija posetitie sajt Direkcije za voden puteve @link1@ ili ih kontaktirajte, telefon @link2@.	{"0": {"path": "https://www.plovput.rs", "type": "url", "title": "https://www.plovput.rs", "placeholder": "@link1@"}, "1": {"path": "+381113029800", "type": "tel", "title": "+381 11 30 29 800", "placeholder": "@link2@"}}	null	t
19	CHUMC2HWXE3AXK0V	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	1	Koje su obaveze pravnih lica koja vrše hidrografsko merenje na međunarodnim i međudržavnim vodnim putevima?	Pravno lice koje vrše hidrografsko merenje, dužno je da obavesti Direkciju za vodne puteve o datumu početka i obimu poslova u okviru hidrografske delatnosti koje će vršiti na međunarodnim i međudržavnim vodnim putevima, kao i da dostavi po primerak projekta za izvođenje planiranih poslova u okviru hidrografske delatnosti, a prikupljene podatke da dostavi u roku od 30 dana od dana završetka radova. Za dodatne informacije posetite sajt Direkcije za vodne puteve @link1@ ili ih nazovite na broj telefona @link2@.	{"0": {"path": "https://www.plovput.rs/контакт", "type": "url", "title": "https://www.plovput.rs/контакт", "placeholder": "@link1@"}, "1": {"path": "+381113029800", "type": "tel", "title": "+381 11 30 29 800", "placeholder": "@link2@"}}	null	t
20	KL4CJBS68CXAMXJO	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Gde se može proveriti red letanja Er Srbije ka određenim destinacijama?	Na zvaničnoj internet stranici Er Srbije **@LINK1@** može se proveriti red letenja.	{"0": {"auto": true, "path": "https://www.airserbia.com", "type": "url", "title": "https://www.airserbia.com", "placeholder": "@LINK1@"}}	null	t
89	KMHRD5CQKESXZKWK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti proširena luka u Sremskoj Mitrovici?	Rok za završetak projekta Proširenje kapaciteta Luke Sremska Mitrovica je decembar 2025. godine.	null	null	t
21	BZNLMOUM96THDWN3	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Da li je za boce za vazduh koje se ugrađuju u vozila potrebno pribavljanje isprave o usaglašenosti prilikom uvoza u Srbiju?	Za uvoz u Republiku Srbiju nije potrebno pribavljanje isprave o usaglašenosti za posude za vazduh koje su izrađene prema direktivi 2014/68/EU i koriste se za ugradnju u vozila, najčešće za sklopove oslanjanja vozila. Uobičajeno je da takva oprema nosi evropski znak usaglašenosti CE. za više informacija posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture, sektor za vazdušni saobraćaj i transport opasne robe **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-vazdusni-saobracaj-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-vazdusni-saobracaj-0", "placeholder": "@LINK1@"}}	null	t
22	FVICYYYZI9XA0VHB	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Da li je za produženje važenja sertifikata za savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) potrebno odslušati obuku u ovlašćenom privrednom društvu ili drugom pravnom licu?	Potrebno je odslušati obuku za savetnika za bezbednost u transportu opasne robe u drumskom, železničkom ili vodnom saobraćaju u nekom od ovlašćenih centara. Za detaljne inforamcije posetite sajt AMMSa **@LINK1@**.	{"0": {"auto": true, "path": "https://amss-cmv.co.rs/adr1/", "type": "url", "title": "https://amss-cmv.co.rs/adr1/", "placeholder": "@LINK1@"}}	null	t
23	X581CYNUM5YO5DI9	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Na koju imejl adresu se dostavljaju godišnji izveštaji savetnika za bezbednost u transportu opasne robe (u drumskom, železničkom ili vodnom saobraćaju) u elektronskoj formi?	Rok za dostavljanje godišnjeg izveštaja je 1. mart tekuće godine, a za predhodnu godinu poslati na mejl adresu **@EMAIL1@** Za više informacija posetite sajt Ministartsva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/", "type": "url", "title": "https://www.mgsi.gov.rs/", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:tor@mgsi.gov.rs", "type": "mail", "title": "tor@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
24	UGALQEUGJWXFT1WZ	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Kako je moguće pronaći izgubljeni prtljag na aerodormu Nikola Tesla Beograd?	U slučaju da prtljag nije stigao u Beograd, a putovali ste stranim aviokompanijama, obratite se Službi traganja za prtljagom sa avio kartom. Služba se nalazi neposredno pored trake za preuzimanje prtljaga ili putem mail adrese **@EMAIL1@** putem ili putem telefona 381 64 6419 025tel381 64 6419 025. Ukoliko ste putovali nacionalnom aviokompanijom Air Serbia možete se obratiti putem mail adrese **@EMAIL2@**.Detaljnije informacije možete naći na linku **@LINK1@**.	{"0": {"auto": true, "path": "https://beg.aero/lat/prakticni_vodic/prtljag/neprispeli_prtljag", "type": "url", "title": "https://beg.aero/lat/prakticni_vodic/prtljag/neprispeli_prtljag", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:lostandfound@skypartner.rs", "type": "mail", "title": "lostandfound@skypartner.rs", "placeholder": "@EMAIL1@"}, "2": {"auto": true, "path": "mailto:baggagestervice@airserbia.com", "type": "mail", "title": "baggagestervice@airserbia.com", "placeholder": "@EMAIL2@"}}	null	t
25	KAQCV18T1YTWI9OK	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Kako se vrši povraćaj novca usled otkazivanja leta?	Usled otkizavanja leta upućuje se Zahtev za naknadu, na mail adresu **@EMAIL1@**. Za više informacija posetite link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.airserbia.com/footer_copy_menu/sve-pravne-informacije/prava_putnika/obavestenje", "type": "url", "title": "https://www.airserbia.com/footer_copy_menu/sve-pravne-informacije/prava_putnika/obavestenje", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:guest.support@airserbia.com", "type": "mail", "title": "guest.support@airserbia.com", "placeholder": "@EMAIL1@"}}	null	t
26	EBRHBESWM6UEN538	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Kako je moguće zatražiti pomoć osobama sa invaliditetom prilikom dolaska na aerodrom Nikola Tesla Beograd, kao i na samom letu?	Prilikom dolaska na aerodrom Nikola Tesla Beograd svim putnicima koji imaju poteškoće u kretanju, obezbeđen je odgovarajući vid asistencije. Prilikom kupovine avio karte neophodno je naznačiti posebne potrebe putnika, a to je moguće učiniti i prilikom registracije na let. Za detaljnije informacije posetite link **@LINK1@**.	{"0": {"auto": true, "path": "https://beg.aero/lat/prakticni_vodic/pomoc_prilikom_putovanja/smanjena_pokretljivost", "type": "url", "title": "https://beg.aero/lat/prakticni_vodic/pomoc_prilikom_putovanja/smanjena_pokretljivost", "placeholder": "@LINK1@"}}	null	t
27	WLBHZ0OVV3Z8KWQI	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Kojim vidovima prevoza se može doći iz centra grada Beograda do aerodroma Nikola Tesla Beograd?	Pored sopstvenog prevoza ili taksi prevoza, može se doći javnim gradskim prevozom na sledećim autobuskim linijama 72 sa Zelenog venca, A1 sa stanice Trg Slavija, 860i od Palate pravde, i 860mv sa Glavne autobuske stanice. Za više informacija posetite sledeće linkove **@LINK1@**, **@LINK3@** i **@LINK4@**.	{"0": {"auto": true, "path": "https://beg.aero/lat/parking_i_prilaz/transport/javni_prevoz", "type": "url", "title": "https://beg.aero/lat/parking_i_prilaz/transport/javni_prevoz", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://www.busevi.com/red-voznje/linija-a1-trg-slavija-kralja-milutina-aerodrom-nikola-tesla/", "type": "url", "title": "https://www.busevi.com/red-voznje/linija-a1-trg-slavija-kralja-milutina-aerodrom-nikola-tesla/", "placeholder": "@LINK3@"}, "2": {"auto": true, "path": "https://www.gsp.rs/dokumenti/dnevne_linije/linije-pdf/72.pdf", "type": "url", "title": "https://www.gsp.rs/dokumenti/dnevne_linije/linije-pdf/72.pdf", "placeholder": "@LINK4@"}}	null	t
28	TIBRMPXZAOTDGGGV	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	U kojim slučajevima je potrebno da vozač poseduje ADR sertifikat za vozača vozila za prevoz opasne robe drumom?	Svi vozači koji prevoze opasnu robu moraju posedovati ADR sertifikat za vozača vozila koje prevozi opasnu robu drumom. Izuzetak su prevozi koji se obavljaju po izuzećima prema 1.1.3.6, 3.4 ili 3.5 ADR multilateralni sporazum o transportu opasne robe drumom. U ovim slučajevima angažovani savetnik za bezbednost u transportu opasne robe u drumskom saobraćaju određuje da za prevoz nije potrebno angažovati vozača sa ADR sertifikatom za vozača vozila za prevoz opasne robe, već vozača koji je prošao obuku od strane savetnika za bezbednost u transportu opasne robe. Za detaljnije informacije posetite link AMMS a **@LINK1@**.	{"0": {"auto": true, "path": "https://amss-cmv.co.rs/adr1/", "type": "url", "title": "https://amss-cmv.co.rs/adr1/", "placeholder": "@LINK1@"}}	null	t
90	MP9YAS1S7KV5BNHW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti izgradjen novi terminal na beogradskom aerodromu?	Završetak svih radova na projektu Izgradnja novog terminala na aerodromu Nikola Tesla se očekuje krajem 2023. godine.	null	null	t
91	9Z25ESETUUR9FILE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti implementiran novi radarski sistem na aerodromu Nikola Tesla?	Rok za završetak projekta je januar 2024. godine.	null	null	t
29	EECP913SRYOZIZB0	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Na koji način se vrši uvoz pokretne opreme pod pitiskom ili ambalaže za prevoz opasne robe u Srbiju?	U Republiku Srbiju se može uvesti samo pokretna oprema pod pritiskom koja je ispitana i odobrena u Srbiji ili Evropskoj uniji i kao takva poseduje srpski znak usaglašenosti tri A ili evropski znak usaglašenosti Pi. Ambalaža mora da poseduje odobrenje prema ADR multilateralni sporazum o transportu opasne robe drumom odnosno RID multilateralni sporazum o transportu opasne robe železnicom sporazumima. Uz zahtev na propisanom formularu dostavljaju se dokazi o uplati pripadajuće administrativne takse, kopija sertifikata čije se priznavanje traži sa zvaničnim prevodom sudskog tumača i izveštaj o ispitivanju. U zavisnosti od vrste sertifikata koji se priznaje može se zahtevati tehnički crtež ili neki drugi dokument. Detaljnije možete pročitati u Zakonu o transportu opasne robe do kog vas vodi link **@LINK1@**.	{"0": {"auto": true, "path": "http://www.parlament.gov.rs/upload/archive/files/lat/pdf/predlozi_zakona/2623-16%20-%20lat.pdf", "type": "url", "title": "http://www.parlament.gov.rs/upload/archive/files/lat/pdf/predlozi_zakona/2623-16%20-%20lat.pdf", "placeholder": "@LINK1@"}}	null	t
30	H7EOXIC29GCNUT87	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	2	Koliko aviona ima Air Serbia?	Nacionalni prevoznik Air Serbia ima sledece avione u floti AIRBUS A 330200 2 AIRBUS A 320 3 AIRBUS A 319 10 ATR 72600 6 Flotu aviona nacionalnog prevoznika Air Serbia, sa specifikacijom aviona, možete da pogledate na linku @link1@.	{"0": {"path": "https://www.airserbia.com/footer_menu/kompanija/nasa-flota", "type": "url", "title": "https://www.airserbia.com/footer_menu/kompanija/nasa-flota", "placeholder": "@link1@"}}	null	t
31	SIMGD2WLADFGDWSR	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Gde se rade tehnički pregledi čamaca namenjenih za privredne svrhe?	Uprava za utvrđivanje sposobnosti brodova za plovidbu, koja je organ uprave u sastavu ovog ministarstva vrši tehničke preglede čamaca namenjenih za privredne svrhe. Sedište Uprave je na Novom Beogradu, ulica Narodnih heroja 30.	null	null	t
32	TILVDKJVSKGAGI10	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Koje je radno vreme lučkih kapetanija?	Radno vreme lučkih kapetanija je od 0730 do 1530 časova.	null	null	t
33	LIMGCDSMSLNDT19Q	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Da li postoji u Republici Srbiji akreditovana institucija za obuku pomoraca i brodaraca?	U Republici Srbiji trenutno nema akreditovanih institucija za obuku pomoraca i brodaraca.	null	null	t
34	PHFZ5HWV5P11DRRX	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Gde mogu da se izvrše zdravstveni pregledi za izdavanje pomorske knjižice?	Zdravstvene preglede za izdavanje pomorske knjižice vrše ovlašćene zdravstvene ustanove za preglede pomoraca, čiji spisak je objavljen na sajtu ministarstva, **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-zdravstvenih-ustanova-ovlashtshenih-za-vrshenje-zdravstvenih-pregleda-pomoraca", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-zdravstvenih-ustanova-ovlashtshenih-za-vrshenje-zdravstvenih-pregleda-pomoraca", "placeholder": "@LINK1@"}}	null	t
35	ZLNHTIYKND9K8B8S	2023-06-27 18:39:48	2023-06-27 18:39:48	\N	3	Ko izdaje odobrenja za obavljanje lučkih delatnosti u lukama i pristaništima?	Agencija za upravljanje lukama izdaje i oduzima odobrenje za obavljanje lučke delatnosti. Sedište Agencije za upravljanje lukama je u Beogradu, Nemanjina 4. Za dodatne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://www.aul.gov.rs/kontakt", "type": "url", "title": "https://www.aul.gov.rs/kontakt", "placeholder": "@LINK1@"}}	null	t
36	7OLFHBQOKRJGYXLP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Da li se u Republici Srbiji priznaju ovlašćenja članova posade brodova unutrašnje plovidbe stečena u državama članicama Evropske unije?	Republika Srbiji priznaje ovlašćenja članova posade brodova unutrašnje plovidbe koja su izdala države članice Evropske unije.	null	null	t
37	UKZ6VZR6LECHQS9N	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Gde se izdaju međunarodne dozvole za upravljanje čamcem?	Međunarodne dozvole za upravljanje čamcem izdaju lučke kapetanije prema prebivalištu podnosioca zahteva. Za više informacije posetite sajt Ministarstva za gradjevinarstvo, saobraćaj i infrastrukturu, sektor za vodni saobraćaj **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "type": "url", "title": "https://www.mgsi.gov.rs/cir/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "placeholder": "@LINK1@"}}	null	t
38	A0JGYXINKQA7DFPB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Gde se izdaju dozvole za upravljanje čamcem?	Dozvole za upravljanje čamcem izdaju lučke kapetanije prema prebivalištu podnosioca zahteva. Za pregled lučkih kapetanija prema prebivalištu posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "type": "url", "title": "https://www.mgsi.gov.rs/cir/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "placeholder": "@LINK1@"}}	null	t
39	YVPXEKNDVFYN4PCX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Da li je potrebno odobrenje za održavanje sportskih manifestacija na vodnom putu?	Na vodnom putu mogu se održavati sportska takmičenja, odnosno priredbe, na osnovu odobrenja lučke kapetanije. Za više informacija posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture, sektor za vodni saobraćaj **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-vodni-saobracaj-i-bezbednost-plovidbe", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-vodni-saobracaj-i-bezbednost-plovidbe", "placeholder": "@LINK1@"}}	null	t
40	7UP4TXQMIP1I0XBF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Ko je nadležan za održavanje i obeležavanje Dunava i Save?	Direkcija za vodne puteve, koja je organ uprave u sastavu ovog ministarstva vrši tehničko održavanje Dunava i Save. Sedište Direkcije za vodne puteve je u Beogradu, Francuska 9. Za dodatne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://www.plovput.rs/", "type": "url", "title": "http://www.plovput.rs/", "placeholder": "@LINK1@"}}	null	t
41	NJ2NBVJQUVKFCJIM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Gde se polaže ispit za vozara unutrašnje plovidbe i gde mogu da se pronađu pitanja za pripremu ispita?	Ispit za vozara unutrašnje plovidbe polaže se u ovom ministarstvu. Pitanja za pripremanje ispita mogu se naći na sajtu ministarstva, **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-pitanja-za-polaganje-ispita-za-sticanje-svedochanstva-o-osposobljenosti-za", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-pitanja-za-polaganje-ispita-za-sticanje-svedochanstva-o-osposobljenosti-za", "placeholder": "@LINK1@"}}	null	t
92	NK1B4VP4XDIIZDBO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti gotova brza pruga Novi Sad – Subotica?	Rok za završetak projekta izgradnje brze pruge Novi Sad Subotica je 31. decembar 2024. godine.	null	null	t
42	NSQDIP3PU3QET8QE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Gde mogu da se izvrše zdravstveni pregledi za izdavanje brodarske knjižice?	Zdravstvene preglede za izdavanje brodarske knjižice vrše ovlašćene zdravstvene ustanove za preglede članova posade brodova unutrašnje plovidbe, čiji spisak je objavljen na sajtu ministarstva, **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-zdravstvenih-ustanova-ovlashtshenih-za-vrshenje-zdravstvenih-pregleda-chlanova", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-zdravstvenih-ustanova-ovlashtshenih-za-vrshenje-zdravstvenih-pregleda-chlanova", "placeholder": "@LINK1@"}}	null	t
43	I2OYK74Q2WOSHVI3	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Gde se rade tehnički pregledi čamaca?	Tehničke preglede čamaca namenjenih za sport i razonodu vrše lučke kapetanije prema prebivalištu podnosioca zahteva. Uprava za utvrđivanje sposobnosti brodova za plovidbu, koja je organ uprave u sastavu ovog ministarstva vrši tehničke preglede čamaca namenjenih za privredne svrhe. Sedište Uprave je na Novom Beogradu, ulica Narodnih heroja 30. Za dodatne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
44	3NZQ46TP3KUMNFPI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Koje su ovlašćene kompanije za posredovanje pri zapošljavanju pomoraca?	Spisak ovlašćenih kompanija za posredovanje pri zapošljavanju pomoraca je objavljen na sajtu ministarstva, **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-kompanija-za-posredovanje-pri-zaposhljavanju-pomoraca", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/spisak-kompanija-za-posredovanje-pri-zaposhljavanju-pomoraca", "placeholder": "@LINK1@"}}	null	t
45	IZP3MCUOS86GBRFW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Koji su kontakti lučkih kapetanija?	Beograd Karađorđeva 6, 381112029900, 381112029900; Pančevo Dositejeva 13, 38113342560, 38113342560; Smederevo Despota Đurđa 11, 381264627140, 381264627140, 38126614290, 38126614290; Veliko Gradište Obala kralja Petra I br. 13, 38112662219, 38112662219; Kladovo Dunavska 11 ,38119800284, 38119800284; Prahovo Pristanišna zona b.b, 38193524026, 38193524026; Sremska Mitrovica Promenada 13, 38122621080, 38122621080; Titel Potiski kej 1, 381212962133, 381212962133; Senta Glavna br. 1, 38124812200, 38124812200; Novi Sad Beogradski kej 11, 38121526684, 38121526684, 38121528457, 38121528457; Apatin Dunavske obale b.b, 38125772245, 38125772245; Bačka Palanka Kralja Petra I br. 5, 38121750071, 38121750071.	null	null	t
46	SJFTCNMS1PAGG34D	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Koji je broj žiro-računa na koji se uplaćuju administrativne takse?	Administrativne takse uplaćuju se u korist Budžeta Republike Srbije, broj računa je 84074222184357, broj modela je 97, a poziv na broj se razlikuje u zavisnosti od opštine gde se uplaćuje. Za detaljne informacije posetitie link **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/wp-content/uploads/2019/10/Instrukcije-za-takse-Lat_22-10-2019.pdf", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/wp-content/uploads/2019/10/Instrukcije-za-takse-Lat_22-10-2019.pdf", "placeholder": "@LINK1@"}}	null	t
47	WNQSHPFE1UA7TCRU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Ko može da se bavi proizvodnjom čamaca u Republici Srbiji?	Čamce mogu da grade odobreni proizvođači kojima je Uprava za utvrđivanje sposobnosti brodova za plovidbu izdala odobrenje za gradnju čamaca. Na sajtu Uprave za utvrđivanje sposobnosti brodova nalazi se popis izdatih odobrenja **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir/", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir/", "placeholder": "@LINK1@"}}	null	t
48	YTUKVR5OATW79BR7	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Da li strani brodovi mogu da uplove u državni vodni put?	Brodovi strane zastave mogu da uplove u državni vodni put ukoliko imaju odobrenje ovog ministarstva. Za dodatne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://www.plovput.rs/vesti/16/184", "type": "url", "title": "https://www.plovput.rs/vesti/16/184", "placeholder": "@LINK1@"}}	null	t
49	7LM1C2QNVC8W9PC8	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Ko u Republici Srbiji vrši utvrđivanje sposobnosti za plovidbu brodova unutrašnje plovidbe?	Uprava za utvrđivanje sposobnosti brodova za plovidbu, koja je organ uprave u sastavu ovog ministarstva vrši preglede brodova unutrašnje plovidbe. Sedište Uprave je na Novom Beogradu, ulica Narodnih heroja 30. Za dodatne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
50	YZAFOKENQLCLTDP2	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	3	Gde se podnose zahtevi za izdavanje ovlašćenja o osposobljenosti članova posade brodova unutrašnje plovidbe?	Zahtevi za izdavanje ovlašćenja o osposobljenosti članova posade brodova unutrašnje plovidbe podnose se nadležnoj lučkoj kapetaniji prema prebivalištu podnosioca zahteva. Pregled lučkih kapetanije možete naći na linku **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "type": "url", "title": "https://www.mgsi.gov.rs/lat/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "placeholder": "@LINK1@"}}	null	t
51	RZ7CW60OWTQHGCXA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kako mogu da dobijem gradjevinsku dozvolu?	Poštovani, kompletnu proceduru dobijanja građevinske dozvole možete da pročitate na dokumentu koji Vam dostavljamo.	null	{"0": {"path": "gradjevinska-dozvola.pdf", "type": "pdf"}}	t
52	4HLAYCOLDH1ICCXD	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li se deoba katastarskih parcela za izgradnju linijskog infrastrukturnog objekta za koji je utvrđeno da je od posebnog značaja za Republiku Srbiju, sprovodi na osnovu donetog rešenja nadležne službe za katastar nepokretnosti?	Organ nadležan za poslove državnog premera i katastra provodi deobu katastarskih parcela bez obzira na vrstu zemljišta, na osnovu projekta parcelacije i preparcelacije za izgradnju linijskog infrastrukturnog objekta za koji je utvrđeno da je od posebnog značaja za Republiku Srbiju, elaborata geodetskih radova za provođenje promena u katastru nepokretnosti, odnosno plana parcelacije sadržanog u planskom dokumentu i projekta eksproprijacije sa dokazom o izvršenoj tehničkoj kontroli. Deoba katastarskih parcela sprovodi se samo kroz bazu podataka katastra nepokretnosti, van upravnog postupka i o sprovedenoj deobi se ne donosi posebno rešenje.	null	null	t
93	LX3JXBBEELNZ0KTV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti rekonstruisana pruga od Niša do Dimitrovgrada?	Rok za završetak radova na projektu rekonstrukcije i modernizacije dela pruge Niš Brestovac je 31. mart 2024. godine.	null	null	t
53	DSYUNSEGJDYXCTMW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	U postupku realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju, predviđeno je rušenje nezakonito izgrađene porodične kuće, koja su prava vlasnika iste?	U slučaju izgradnje linijskog infrastrukturnog objekta od posebnog značaja za Republiku Srbiju, investitor takvog objekta dužan je da, vlasniku stambenog objekta porodične stambene zgrade ili stambenog objekta koji se sastoji od više stanova izgrađenog suprotno zakonu pre stupanja na snagu planskog akta kojim je zemljište na kome se takav objekat nalazi određeno za javne namene, obezbedi drugi odgovarajući stambeni objekat ili stan, bez obzira da li je za taj objekat pokrenut postupak ozakonjenja, ili da mu isplati novčanu naknadu u visini sredstava potrebnih radi obezbeđivanja drugog odgovarajućeg stambenog objekta ili stana.	null	null	t
54	NAPL69CNTAWLYZMZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li nadležni organ može da se obraća imaocima javnih ovlašćenja za izdavanje uslova, u postupku izdavanja lokacijskih uslova, ukoliko su u postupku izrade urbanističkog projekta već pribavljeni uslovi imalaca javnih ovlašćenja, takođe da li će nadležni organ u postupku izdavanja lokacijskih uslova pribavljati dodatne uslove imaoca javnih ovlašćenja u odnosu na tehničke uslove pribavljene za izradu urbanističkog projekta?	Uslovi imalaca javnog ovlašćenja, prikupljeni u postupku izrade i potvrđivanja urbanističkog projekta, su istovremeno i uslovi koji se koriste prilikom izdavanja lokacijskih uslova, ukoliko se uz zahtev za izdavanje lokacijskih uslova dostavi i potvrđen urbanistički projekat. Međutim, ukoliko su uslovi imalaca javnih ovlašćenja koji su pribavljeni za potrebe izrade Urbanističkog projekta istekli, nadležni organ će se obratiti nadležnim imaocima javnih ovlašćenja za pribavljanje odgovarajućih uslova. Sa druge strane, ukoliko u postupku izrade urbanističkog projekta nisu pribavljeni svi uslovi imalaca javnih ovlašćenja, nadležni organ će postupiti u skladu sa članom 54 važećeg Zakona o planiranju i izgradnji, u kom se navodi sledeće Ako planski dokument, odnosno separat, ne sadrži mogućnosti, ograničenja i uslove za izgradnju objekata, odnosno sve uslove za priključenje na komunalnu, saobraćajnu i ostalu infrastrukturu, nadležni organ te uslove pribavlja po službenoj dužnosti, o trošku podnosioca zahteva uz naknadu stvarnih troškova izdavanja.	null	null	t
55	DMEQIT3VQSQ6NXBP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Кako se određuje projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju?	Projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju na predlog ministarstva nadležnog za poslove građevinarstva utvrđuje Vlada Republike Srbije. Za više informacija posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture, sektor za građevinske poslove, sprovođenje objedinjenih procedura i ozakonjenja **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
56	ZOCYEY7WZ3UTXQYT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Кada će biti omogućeno privremeno priključenje nezakonito izgrađenih objekata na mrežu, odnosno infrastrukturu?	Odredbama člana 41. Zakona, propisane su novčane kazne za privredni prestup za javno preduzeće, javno komunalno preduzeće, privredno društvo ili drugo pravno lice, koje po prijemu akta kojim se odbacuje ili odbija zahtev za ozakonjenje ne isključi objekat sa mreže odnosno infrastrukture na koju je privremeno priključen kao i u slučaju kada objekat koji je u postupku ozakonjenja priključi na mrežu, odnosno infrastrukturu. Propisivanje navedene odredbe imalo je za cilj da se vlasnici nezakonito izgrađenih objekta podstaknu da uđu u postupak ozakonjenja i uzmu aktivno učešće u istom kako bi na što jednostavniji način rešili svoje socijalno i stambeno pitanje. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
57	DV9OI0I1PLUHMA6Q	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li rešenje o ozakonjenju ima istu pravnu snagu kao i građevinska i upotrebna dozvola ili ne?	Zakonom nije propisana mogućnost pribavljanja upotrebne dozvole na osnovu rešenja o ozakonjenju objekata, već je osnov za upis prava svojine na objektu u javnu knjigu o evidenciji nepokretnosti i pravima na njima, upravo pravnosnažno rešenje o ozakonjenju. Na osnovu napred navedenog nesporno je da pravnosnažno rešenje o ozakonjenju predstavlja dokaz o legalnom objektu te da se tad na takvom objektu mogu izvoditi radovi u skladu sa odredbama Zakona o planiranju i izgradnji. Shodno navedenom, rešenje o ozakonjenju, predstavlja pravni osnov kao i upotrebna dozvola na osnovu kojih se dalje mogu ostvarivati prava i obaveze saglasno odredbama posebnih zakona. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
58	WDBGMN9IWSOCYYQK	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li je Rešenje o građevinskoj dozvoli doneto pre stupanja na snagu Zakona o planiranju i izgradnji („Sl. glasnik RS“, br. 72/2009, 81/2009 - ispr., 64/2010 - odluka US, 24/2011, 121/2012, 42/13-US, 50/13-US, 98/13-US, 132/2014, 145/2014 i 83/2018), kojim je uvedeno da se  važenje građevinske dozvole vezuje za momenat prijave radova, i dalje važeće“ ?	Odredbama člana 140. Zakona o planiranju i izgradnji Sl. glasnik RS, br. 72/2009, 81/2009 ispr., 64/2010 odluka US, 24/2011, 121/2012, 42/13US, 50/13US, 98/13US, 132/2014 i 145/2014 u daljem tekstu Zakon, koji je važio u vreme izdavanja predmetnog rešenja o građevinskoj dozvoli, bilo je propisano da građevinska dozvola prestaje da važi ako se ne otpočne sa građenjem objekta, odnosno izvođenjem radova, u roku od dve godine od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola. Rešenje kojim se utvrđuje prestanak važenja građevinske dozvole iz stava 1. ovog člana donosi organ nadležan za izdavanje građevinske dozvole. Građevinska dozvola prestaje da važi ako se u roku od pet godina od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola, ne izda upotrebna dozvola, osim za objekte iz člana 133. ovog zakona, objekte komunalne infrastrukture koji se izvode fazno i porodične stambene zgrade koje investitor gradi radi rešavanja svojih stambenih potreba. Na zahtev investitora, nadležni organ može doneti rešenje kojim se odobrava da pravnosnažna građevinska dozvola ostaje na pravnoj snazi još dve godine od roka propisanog stavom 3. ovog člana, ako investitor pruži dokaz da je stepen završenosti objekata preko 80, odnosno ako se u postupku utvrdi da je objekat ukrovljen, sa postavljenom spoljnom stolarijom i izvedenim razvodima unutrašnjih instalacija koje omogućavaju njegovo priključenje na spoljnu mrežu infrastrukture. Posle isteka roka iz stava 3, odnosno stava 4. ovog člana, investitor plaća na račun Poreske uprave naknadu u visini poreza na imovinu, koji bi se plaćao u skladu sa zakonom kojim se uređuje porez na imovinu za ceo objekat, da je isti izgrađen u skladu sa građevinskom dozvolom, sve dok se za tu lokaciju ne izda nova građevinska dozvola. Rešenje kojim se utvrđuje prestanak važenja građevinske dozvole iz stava 3. odnosno stava 4. ovog člana donosi organ nadležan za izdavanje građevinske dozvole, a po pravnosnažnosti to rešenje dostavlja Poreskoj upravi na čijoj teritoriji se nalazi predmetni objekat. Dalje, odredbama člana 148. Zakona, bilo je propisano da investitor podnosi prijavu radova organu koji je izdao građevinsku dozvolu najkasnije osam dana pre početka izvođenja radova. Uz prijavu radova podnosi se dokaz o regulisanju obaveza u pogledu doprinosa za uređivanje građevinskog zemljišta, u skladu sa ovim zakonom, kao i dokaz o plaćenoj administrativnoj taksi. Za linijske infrastrukturne objekte, pored dokaza iz stava 2. ovog člana, kada je rešenje o građevinskoj dozvoli izdato na osnovu konačnog rešenja o eksproprijaciji, dostavlja se i akt ministarstva nadležnog za poslove finansija o uvođenju u posed nepokretnosti, u skladu sa posebnim zakonom, odnosno zaključen ugovor o pravu službenosti u skladu sa ovim zakonom. U prijavi iz stava 1. ovog člana investitor navodi datum početka i rok završetka građenja, odnosno izvođenja radova. Nadležni organ o podnetoj prijavi obaveštava građevinsku inspekciju. Rok za završetak građenja počinje da teče od dana podnošenja prijave iz stava 1. ovog člana. Iz navedenih zakonskih odredbi sledi da je investitor bio dužan da organu koji je izdao građevinsku dozvolu prijavi početak građenja objekta, najkasnije osam dana pre početka izvođenja radova. Takođe, sledi da ukoliko je po predmetnom rešenju o građevinskoj dozvoli, otpočeto sa izvođenjem radova, odnosno sa građenjem objekta u roku od dve godine od dana pravnosnažnosti rešenja, građevinska dozvola i dalje važi, bez obzira na predviđen rok završetka građenja objekta. Dakle, Zakon je kao momenat koji utiče na važenje građevinske dozvole predviđao faktičko otpočinjanje sa izvođenjem radova, odnosno sa građenjem objekta. Dalje, ukazujemo da za objekte iz člana 133. Zakona, u sitaciji kada je otpočeto sa izvođenjem radova, odnosno građenjem objekta u roku od dve godine od dana pravnosnažnosti rešenja o građevinskoj dozvoli što predstavlja preduslov koji utiče na važenje građevinske dozvole, Zakon nije predviđao rok za pribavljanje upotrebne dozvole.	null	null	t
59	QQG6XBVZMTBATX56	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za završetak autoputa Pakovraće Požega?	Rok za završetak radova na projektu Projektovanje i izgradnja autoputa Pakovraće Požega je 31. decembar 2023. godine.	null	null	t
94	CGSGH8SS0RW1HLAU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti gotova obilaznica oko Užica?	Izgradnja obilaznice oko Užica će biti završena u roku od 30 meseci, računajući od usvajanja idejnog projekta koji je planiran za početak drugog kvartala 2023. godine.	null	null	t
95	A1PRWQMAEQ1J78Y4	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti izgrađen metro u Beogradu?	Nasipanjem 72 hektara na Makiškom polju je počela izgradnja metroa u Beogradu. Na jesen 2023. kreće izgradnja depoa za metro. Do 2028. godine Beograd će imati prvu liniju metroa dužine 21,3 kilometara od Makiša do Mirijeva sa 23 stanice, a do 2030. godine i drugu liniju od Bežanijske Kose do Mirijeva, dužine 24 kilometara sa 24 stanice. Trenutno se projektuje treća linija od Bežanijske kose do Banjice, dužine 24 kilometra i sa planirane 22 stanice.	null	null	t
60	ZBEOG2H3GNBPFNDM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li izvođač radova može sve neophodne velike licence potrebne za izvođenje radova koje je ugovorio (koje su prepoznate kao neophodne shodno radovima definisanim ugovorom o građenju) da obezbedi preko jednog ili više podizvođača, a da pri tome izvođač radova kao pravno lice ne poseduje nijednu“?	Članom 150. Zakona o planiranju i izgradnji Sl. glasnik RS, br. 72/2009, 81/2009 ispr., 64/2010 odluka US, 24/2011, 121/2012, 42/2013 odluka US, 50/2013 odluka US, 98/2013 odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 dr. zakon, 9/2020 i 52/2021 u daljem takstu Zakon, propisano je da građenje objekta, odnosno izvođenje radova može da vrši pravno lice ili preduzetnik u daljem tekstu izvođač radova, osnovan u skladu sa zakonom koji 1 ima zaposlene, odnosno radno angažovane licencirane izvođače radova upisane u registar licenciranih izvođača u skladu sa ovim zakonom i propisima donetim na osnovu ovog zakona, sa stručnim rezultatima; 2 ima odgovarajuće stručne rezultate; 3 poseduje rešenje o ispunjenosti uslova za građenje odgovarajuće vrste objekata, odnosno izvođenje odgovarajuće vrste radova na tim objektima; 4 je upisan u odgovarajući registar za građenje odgovarajuće vrste objekata, odnosno izvođenje odgovarajućih radova na tim objektima, koji vodi ministarstvo nadležno za poslove planiranja i izgradnje u skladu sa ovim zakonom. Istim članom, stavom drugim, propisano je da, ako izvođač radova za određene radove angažuje drugo pravno lice ili drugog preduzetnika u daljem tekstu podizvođač, podizvođač mora da ispunjava uslove propisane ovim zakonom i propisima donetim na osnovu ovog zakona, za izvođenje te vrste radova za koje je angažovan. Izvođač radova mora ispunjavati uslove propisane članom 150. Zakona, a ukoliko angažuje podizvođača, i podizvođač mora da ispunjava uslove propisane Zakonom i propisima donetim na osnovu zakona, odnosno za objekte iz člana 133. stav 2. Zakona o planiranju i izgradnji, podizvođač mora, između ostalog, da bude upisan u odgovarajući registar za građenje odgovarajuće vrste objekata, odnosno izvođenje odgovarajućih radova na tim objektima, koji vodi ministarstvo nadležno za poslove planiranja i izgradnje u skladu sa ovim Zakonom. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
61	K5HUFKW9J3KOE7XU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li lica koja poseduju licencu u stranoj državi mogu da obavljaju stručne poslove u svojstvu ovlašćenog lica u Republici Srbiji?	Zakonom o planiranju i izgradnji Sl. glasnik RS, br. 72/2009, 81/2009 ispr., 64/2010 odluka US, 24/2011, 121/2012, 42/2013 odluka US, 50/2013 odluka US, 98/2013 odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 dr. zakon, 9/2020 i 52/2021 , odredbom člana 162a stav 1. propisano je da fizičko lice kome je izdata licenca ili drugo ovlašćenje, odnosno lice koje je upisano u odgovarajući registar nadležnog organa ili tela prema propisima druge države za obavljanje stručnih poslova koji odgovaraju stručnim poslovima utvrđenim ovim zakonom, ima pravo u Republici Srbiji na obavljanje tih stručnih poslova u svojstvu odgovornog lica pod uslovima reciprociteta i ukoliko ispunjava uslove utvrđene ovim zakonom, propisima donetim na osnovu ovog zakona i posebnim zakonom kojim se uređuje priznavanje stranih profesionalnih kvalifikacija. Takođe, strano ovlašćeno fizičko lice mora da ispunjava uslove utvrđene zakonom kojim se uređuje zapošljavanje i rad stranaca. Postupak utvrđivanja ispunjenosti uslova sprovodi ministarstvo nadležno za poslove planiranja i izgradnje u skladu sa ovim zakonom i propisima donetim na osnovu ovog zakona, posebnim zakonom kojim se uređuje priznavanje profesionalnih kvalifikacija i drugim posebnim propisima. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
62	YKTTDZ2OF0IBVFBL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li trećem licu može biti priznato svojstvo strane u postupku izdavanja građevinske dozvole?	Stranka u postupku izdavanja građevinske dozvole je investitor, te ne postoji mogućnost priznavanja svojstva stranke u postupku izdavanja građevinske dozvole trećim licima.	null	null	t
63	IKAVLXEKJASTM7F0	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li se objekti, odnosno radovi za koje je utvrđeno da predstavljaju Projekat za izgradnju objekata od posebnog značaja za Republiku Srbiju, mogu izvoditi na šumskom, odnosno poljoprivrednom zemljištu, odnosno da li je potrebna promena namene zemljišta, pre podnošenja zahteva za izdavanje građevinske dozvole?	Naknada za promenu namene poljoprivrednog i šumskog u građevinsko zemljište ne plaća se prilikom izgradnje objekata od značaja, odnosno od posebnog značaja za Republiku Srbiju, kao i za izgradnju objekata javne namene u skladu sa programom uređivanja građevinskog zemljišta kada je obveznik plaćanja Republika Srbija, autonomna pokrajina, odnosno jedinica lokalne samouprave, kao i javna preduzeća čiji su osnivači Republika Srbija, autonomna pokrajina, odnosno jedinica lokalne samouprave. Dakle u odnosu na navedene radove, odnosno objekte nije potrebno sprovesti promenu namene šumkog, odnosno poljoprivrednog zemljišta pre podnošenja zahteva za izdavanje građevinske dozvole. Za dodatne informacije posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@** Ili se obratiti telefonskim pozivom na broj 011/3616422.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
64	IECXBDFE5HGZHCVU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Šta je od dokumentacije potrebno dostaviti kako bi se dobila upotrebna dozvola i uknjižio objekat koji poseduje dozvolu za gradnju?	Zakonom o planiranju i izradnji Službeni glasnik RS, br. 72/09, 81/09ispravka, 64/10US, 24/11, 121/12, 42/13US, 50/13US, 98/13US, 132/14, 145/2014, 83/18, 31/19, 37/19 i 9/2020, članom 8 a stavovima 1. i 2. propisano je da se razmena dokumenata i podnesaka u objedinjenoj proceduri obavlja elektronskim putem, te da se sva akta koja u vezi sa objedinjenom procedurom donose nadležni organi i imaoci javnih ovlašćenja, kao i podnesci i dokumenti koji se dostavljaju u objedinjenoj proceduri, uključujući i tehničku dokumentaciju, dostavljaju u formi elektronskog dokumenta. Članom 158. Zakona o planiranju i izgradnji, stav 1. propisano je da organ koji je izdao građevinsku dozvolu izdaje rešenjem upotrebnu dozvolu, u roku od pet radnih dana od dana podnošenja zahteva za izdavanje upotrebne dozvole, dok je stavom 4. propisano da se uz zahtev za izdavanje upotrebne dozvole prilaže izveštaj komisije za tehnički pregled kojim se utvrđuje da je objekat podoban za upotrebu sa predlogom da se može izdati upotrebna dozvola, projekat izvedenog objekta izrađen u skladu sa pravilnikom kojim se bliže uređuje sadržina tehničke dokumentacije, odnosno projekat za izvođenje i izjava stručnog nadzora, izvođača radova i investitora da nije odstupljeno od projekta za izvođenje, a za objekte iz člana 145. ovog zakona za koje nije propisana izrada projekta za izvođenje izjava investitora, vršioca stručnog nadzora i odgovornog izvođača radova da nije odstupljeno od idejnog projekta, specifikacija posebnih delova, rešenje o utvrđivanju kućnog broja, elaborat geodetskih radova za izvedeni objekat i posebne delove objekta i elaborat geodetskih radova za podzemne instalacije, sertifikat o energetskim svojstvima objekta, ako je za objekat propisana obaveza pribavljanja sertifikata o energetskim svojstvima, kao i drugi dokazi u skladu sa propisom kojim se bliže uređuje postupak sprovođenja objedinjene procedure, u ovom slučaju Pravilnik o postupku sprovođenja objedinjene procedure elektronskim putem Sl. glasnik RS, br. 68/2019. Stavom 16. i 17. ovog člana propisano je da, u roku od pet radnih dana po pravnosnažnosti izdate upotrebne dozvole, nadležni organ po službenoj dužnosti dostavlja organu nadležnom za poslove državnog premera i katastra upotrebnu dozvolu, elaborat geodetskih radova za izvedeni objekat i posebne delove objekta, kao i elaborat geodetskih radova za podzemne instalacije, te da organ nadležan za poslove državnog premera i katastra vrši upis prava svojine na objektu, odnosno posebnim delovima objekta, i o tome obaveštava investitora i nadležni organ uprave u roku od sedam dana od dostavljanja upotrebne dozvole. Članom 140. stav 4. propisano je da građevinska dozvola prestaje da važi ako se u roku od pet godina od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola, ne izda upotrebna dozvola, osim za objekte iz člana 133. ovog zakona odnosi se na objekte za koje građevinsku dozvolu izdaje Ministarstvo, objekte komunalne infrastrukture koji se izvode fazno i porodične stambene zgrade koje investitor gradi radi rešavanja svojih stambenih potreba. Odredbe st. 4. ovog člana odnose se i na rešenja o građevinskoj dozvoli, odnosno rešenja o odobrenju za izgradnju koja su izdata u skladu sa ranije važećim zakonima kojima je uređivana izgradnja objekata, pre 11. septembra 2009. godine. Rok za pribavljanje upotrebne dozvole za ove objekte je dve godine od dana stupanja na snagu ovog zakona. Iz navedenih zakonskih i podzakonskih odredbi sledi da se zahtev podnosi organu koji je izdao građevinsku dozvolu elektronskim putem kroz CIS, da se uz zahtev prilaže dokumentacija propisana članom 158. Zakona o planiranju i izgradnji i Pravilnikom o postupku sprovođenja objedinjene procedure elektronskim putem, te da nadležni organ po službenoj dužnosti po pravnosnažnosti upotrebne dozvole istu dostavlja organu nadležnom za poslove državnog premera i katastra zajedno sa elaboratima kako bi izvršio upis prava svojine na objektu. Ukoliko je istekao rok od pet godina od dana pravnosnažnosti rešenja kojim je izdata građevinska dozvola, a da nije doneto rešenje o upotrebnoj dozvoli, nadležni organ donosi rešenje kojim se utvrđuje prestanak važenja građevinske dozvole. Imajući u vidu da se u tom slučaju može smatrati da je objekat izgrađen bez građevinske dozvole, odnosno bez odobrenja nadležnog organa za gradnju u smislu Zakona o planiranju i izgradnji, to isti može postati predmet ozakonjenja objekata, pod uslovima koji su propisani odredbama Zakona o ozakonjenju objekata. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
65	CRAARH8ID6ESFE1H	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li predmet ozakonjenja može biti objekat za koji iz objektivnih razloga nije moguće pribaviti saglasnost suvlasnika na zemljištu?	U slučaju kada je predmet ozakonjenja objekat izgrađen na građevinskom zemljištu na kome postoji pravo susvojine kao dokaz o odgovarajućem pravu dostavlja se pismena saglasnost svih suvlasnika. Shodno napred navedenom organ nadležan za poslove ozakonjenja će u slučaju kada je predmet ozakonjenja objekat izgrađen na građevinskom zemljištu, na kome postoji pravo susvojine, u svim postupcima ozakonjenja koji nisu pravnosnažno okončani do 5. juna 2020 godine, u fazi pribavljanja dokaza o odgovarajućem pravu na građevinskom zemljištu, vlasniku nezakonito izgrađenog objekata naložiti dostavljanje dokaza iz stava 6. člana 10. Zakona, a koji čini pismena saglasnost svih suvlasnika, bez obzira da li je već data overena izjava zainteresovanog lica da se suvlasnik koji je znao ili mogao znati za izgradnju objekta odnosno izvođenje radova koji su predmet ozakonjenja u vreme izgradnje tome nije protivio. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
66	OYOKPRH7XPP23S7V	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Šta je sertifikat zelene gradnje, ko je nadležan za izdavanje sertifikata zelene gradnje?	Sertifikat zelene gradnje je potvrda čiji je cilj smanjenje emisije gasova sa efektom staklene bašte, korišćenje ekološki sertifikovanih građevinskih materijala i opreme, smanjenje produkcije otpada, korišćenje obnovljivih izvora energije, za sve nove zgrade preko 10.000 m2 bruto razvijene građevinske površine, po izdavanju upotrebne dozvole, propisana obaveza pribavljanja sertifikata zelene gradnje. Vlada na predlog ministarstva nadležnog za poslove građevinarstva donosi strategiju za unapređenje mera podsticaja zelene gradnje postojećeg nacionalnog fonda zgrada. Sertifikat izdaje međunarodni sistem za sertifikaciju zelenih zgrada, kojim se verifikuje da je objekat ispunio zadate kriterijume i služi za ocenjivanje kvaliteta i stepena ispunjenosti kriterijuma zelene gradnje, odnosno Agencija za prostorno planiranje i urbanizam Republike Srbije, koja izdaje odnosno potvrđuje sertifikate zelene gradnje.	null	null	t
67	AJND3ZAXRLTSG9QH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Potrebno je tokom realizacije Projekta za izgradnju objekata od posebnog značaja za Republiku Srbiju izmestiti infrastrukturu, odnosno ukloniti/srušiti objekat koji je izgrađen suprotno zakonu, na koji način se u tom slučaju mogu rešiti imovinsko-pravni odnosi?	Ako je za potrebe izvođenja radova na izgradnji linijske infrastrukture od posebnog značaja za Republiku Srbiju potrebno sprovesti uklanjanje objekta izgrađenog suprotno zakonu, kao dokaz o odgovarajućem pravu smatra se 1 izjava overena u skladu sa zakonom koji uređuje overu potpisa, kojom se stranka legitimisana u postupku ozakonjenja neopozivo izjašnjava da nije zainteresovana za ozakonjenje objekta izgrađenog suprotno zakonu, te da ovlašćuje investitora da bespravno izgrađeni objekat može ukloniti, kao i da na osnovu navedene izjave u njeno ime i za njen račun može obustaviti postupak ozakonjenja kod nadležnog organa, u skladu sa zakonom koji uređuje upravni postupak; 2 saglasnost vlasnika zemljišta na kome se nalazi objekat izgrađen suprotno zakonu, ako objekat nije evidentiran i popisan od strane građevinskog inspektora; 3 saglasnost upravljača infrastrukture/vršioca komunalne delatnosti, ako objekat izgrađen suprotno zakonu predstavlja linijski infrastrukturni objekat, odnosno objekat komunalne infrastrukture.	null	null	t
68	O1YTDIYUM5FXWFEX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	U čijoj nadležnosti je izdavanje građevinske dozvole za izgradnju postrojenja za tretman neopasnog otpada kapaciteta od oko 8 t na dnevnom nivou?	Članom 133. stav 2. tačka 10 Zakona o planiranju i izgradnji Sl. glasnik RS, br. 72/2009, 81/2009 ispr., 64/2010 odluka US, 24/2011, 121/2012, 42/2013 odluka US, 50/2013 odluka US, 98/2013 odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 dr. Zakon, 9/2020 i 52/2021, propisano je da Ministarstvo građevinarstva, saobraćaja i infrastrukture između ostalog, izdaje građevinsku dozvolu za izgradnju postrojenja za tretman neopasnog otpada, spaljivanjem ili hemijskim postupcima, kapaciteta više od 70 t dnevno. Odredbama člana 134. istog Zakona propisano je da se poverava autonomnoj pokrajini izdavanje građevinskih dozvola za izgradnju objekata određenih u članu 133. ovog zakona koji se u celini grade na teritoriji autonomne pokrajine. Poverava se jedinicama lokalne samouprave izdavanje građevinskih dozvola za izgradnju objekata koji nisu određeni u članu 133. ovog Zakona. Imajući u vidu navedeno, a u skladu sa citiranim odredbama Zakona o planiranju i izgradnji, za izdavanje građevinske dozvole za izgradnju postrojenja za tretman neopasnog otpada, kapaciteta manjeg od 70 t dnevno, na teritoriji opštine Šabac, nadležna je jedinica lokalne samouprave na čijem području je planirana izgradnja navedenog objekta. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
69	7TW6HNLMBBF3B3K3	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Кako se podnosi zahtev za preuzimanje lokacijskih uslova?	Zahtev za izdavanje lokacijskih uslova podnosi se elektronski u objedinjenoj proceduri nadležnom organu u skladu sa čl. 6. Uredbe o lokacijskim uslovima Službeni glasnik RS, broj 115/2020 , kao i u skladu sa čl. 6 Pravilnika o postupku sprovođenja objedinjene procedure elektronskim putem Službeni glasnik RS, broj 68 od 25. septembra 2019, kojim je propisano da se postupak za izdavanje lokacijskih uslova pokreće podnošenjem zahteva nadležnom organu kroz CIS. Za detaljnije informacije posetitie link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/zahtev-za-izdavanje-informacije-o-lokaciji", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/zahtev-za-izdavanje-informacije-o-lokaciji", "placeholder": "@LINK1@"}}	null	t
70	JVL9KLTSWATYN7NS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li možemo podneti zahtev za izdavanje lokacijskih uslova i ostalih akata Ministarstvu građevinarstva, saobraćaja i infrastrukture za izgradnju objekata površine preko 20 000 m2?	U slučaju izgradnje objekta čija je bruto razvijena građevinska površina preko 20.000 m2, investitor može podneti zahtev za izdavanje svih akata za izgradnju građevinske dozvole jedinici lokalne samouprave ili ministarstvu nadležnom za poslove građevinarstva. Investitor, koji je ishodovao lokacijske uslove pred nadležnim organom jedinice lokalne samouprave, može podneti zahtev za izdavanje građevinske dozvole ministarstvu nadležnom za poslove građevinarstva bez obaveze sprovođenja postupka revizije projekta. Investitor, koji podnosi zahtev za izdavanje lokacijskih uslova pred ministarstvom nadležnim za poslove građevinarstva, sve dalje postupke vodi i okončava po odredbama ovog zakona. Za dodatne informacije posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@** Ili se obratiti telefonskim pozivom na broj 011/3616422.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
96	7SEUPMN2BG60WM3U	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Koliko ima revizija za pojedinačni plan raspodele dozvola i kada se podnose zahtevi?	Postoje tri revizije pojedinačnog plana u toku godine aprilska, julska i oktobarska. zahtevi za aprilsku reviziju podnose se do 10. marta tekuće godine, zahtevi za julsku reviziju podnose se do 10. juna tekuće godine, zahtevi za oktobarsku reviziju podnose se do 10. septembra tekuće godine,.	null	null	t
97	J0PHVN4FVUR84GEM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Šta je potrebno za izdavanje rešenja kojim se produžava period važenja prethodno izdatog rešenja za tehničko regulisanje saobraćaja?	Zahtev, obaveštenje o periodu izvođenja radova, dokaz o uplaćenim taksama na račun budžet RS broj 84074222184357, poziv na broj 97 50016, u skladu sa tarifnim brojem 1. i 9. Zakona o republičkim administrativnim taksama.	null	null	t
71	YVH3LVLCLZGFJCGH	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Nadležni organ jedinice lokalne samouprave nije doneo odluku u roku od 30 dana od dana podnošenja zahteva za izdavanje lokacijskih uslova, koja su moja prava?	ada organ iz stava 2. ovog člana ne reši po zahtevu za izdavanje lokacijskih uslova, građevinske i/ili upotrebne dozvole u zakonom propisanom roku, odnosno u roku od najviše 30 dana od dana podnošenja urednog zahteva stranke, kao i u svim slučajevima ćutanja administracije, nadležno ministarstvo će, po zahtevu stranke, preuzeti nadležnost za izdavanje građevinske dozvole tih akata. Organ od koga je nadležno ministarstvo preuzelo nadležnost za izdavanje građevinske dozvole, dužan je da odmah, a najkasnije u roku od pet radnih dana od prijema zahteva za ustupanje spisa, ministarstvu dostavi sve spise predmeta. Za dodatne informacije posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@** Ili se obratiti telefonskim pozivom na broj 011/3616422.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
72	JSO7A4GBJQO1P7JT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li je za izradu idejnog rešenja, a za potrebe pribavljanja lokacijskih uslova potrebna velika licenca?	Za izradu idejnog rešenja, a za potrebe pribavljanja lokacijskih uslova potrebna je velika licenca, u skladu sa Pravilnikom o uslovima koje treba da ispune pravna lica i preduzetnici za obavljanje poslova izrade tehničke dokumentacije, odnosno građenja objekata, za objekte za koje građevinsku dozvolu izdaje ministarstvo, odnosno nadležni organ autonomne pokrajine, a koji precizira potrebu posedovanja velike licence po vrsti objekta i vrsti tehničke dokumentacije Članom 116 Zakona o planiranju i izgradnji Sl. glasnik RS br. 72/09, 81/09 ispravka, 64/10 odluka US, 24/11, 121/12, 42/13odluka US, 50/13odluka US, 98/13odluka US, 132/14, 145/14 i 83/2018, 31/2019, 37/2019, 9/2020 i 52/2021 kojim je propisano da se tehnička dokumentacija izrađuje kao generalni projekat, idejno rešenje, idejni projekat, projekat za građevinsku dozvolu, projekat za izvođenje i projekat izvedenog objekta. Za dodatne informacije posetite sajt Ministarstva za građevinarstvo, saobraćaj i infrastrukturu **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
73	S3CKKOLBMYYNOD20	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Кoju dokumentaciju je potrebno dostaviti uz zahtev za izdavanje lokacijskih uslova?	U skladu sa čl. 6 st.2 Pravilnika o postupku sprovođenja objedinjene procedure elektronskim putem Službeni glasnik RS, broj 68 od 25. septembra 2019 propisano je da se uz zahtev za izdavanje lokacijskih uslova prilaže idejno rešenje, u skladu sa pravilnikom kojim se uređuje sadržina tehničke dokumentacije. Takođe potrebno je dostaviti dokaz o uplati administrativne takse za kao i dokaz o plaćenim republičkim administrativnim taksama opšta taksa za podnesak, čija je visina propisana Tarifnim brojem 1 i taksa za izdavanje lokacijskih uslova, čija je visina propisana Tarifnim brojem 171v sve u skladu sa Zakonom o republičkim administrativnim taksama Sl. glasnik RS, br. 43/2003, 51/2003 ispr., 61/2005, 101/2005 dr. zakon, 5/2009, 54/2009, 50/2011, 70/2011 usklađeni din. izn., 55/2012 usklađeni din. izn., 93/2012, 47/2013 usklađeni din. izn., 65/2013 dr. zakon, 57/2014 usklađeni din. izn., 45/2015 usklađeni din. izn., 83/2015, 112/2015, 50/2016 usklađeni din. izn., 61/2017 usklađeni din. izn., 113/2017, 3/2018 ispr., 50/2018 usklađeni din. izn., 95/2018, 38/2019 usklađeni din. izn., 86/2019, 90/2019 ispr., 98/2020 usklađeni din. izn., 144/2020, 62/2021 usklađeni din. izn. i 138/2022, kao i dokaz o plaćenoj naknadi za CEOP, primalac Agencija za privredne registre, Brankova br. 25, Beograd, u skladu sa članom 22. stav 1, tačke 1 i 2 Odluke o naknadama za poslove registracije i druge usluge koje pruža Agencija za privredne registre Sl. glasnik RS, br. 131/2022 Za dodadtne informacije posetitie link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/zahtev-za-izdavanje-informacije-o-lokaciji", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/zahtev-za-izdavanje-informacije-o-lokaciji", "placeholder": "@LINK1@"}}	null	t
74	VMN8KWNLM9NNHIQI	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li je potrebno pribaviti akt nadležnog organa, građevinsku dozvolu odnosno rešenje o odobrenju za izvođenje radova, za radove na objektu koji obuhvataju gletovanje i krečenje zidova, zamenu sanitarija u kupatilu, farbanje i popravku stolarije, kao i hoblovanje i lakiranje parketa“?	Članom 2. Zakona o planiranju i izgradnji Sl.glasnik RS br. 72/2009, 81/2009ispr., 64/2010odluka US, 24/2011, 121/2012, 42/2013 odluka US, 50/2013 odluka US, 98/2013 odluka US, 132/2014, 145/2014, 83/2018, 31/2019 i 37/2019 drzakon, 9/2020 i 52/2021 definisano je značenje pojedinih izraza, upotrebljenih u ovom zakonu, te je definisan, između ostalog, pojam tekućeg redovnog održavanja objekta kao izvođenje radova koji se preduzimaju radi sprečavanja oštećenja koja nastaju upotrebom objekta ili radi otklanjanja tih oštećenja, a sastoje se od pregleda, popravki i preduzimanja preventivnih i zaštitnih mera, odnosno svi radovi kojima se obezbeđuje održavanje objekta na zadovoljavajućem nivou upotrebljivosti, kao što su krečenje, farbanje, zamena obloga, zamena sanitarija, radijatora, zamena unutrašnje i spoljašnje stolarije i bravarije, zamena unutrašnjih instalacija i opreme bez povećanja kapaciteta i drugi slični radovi, ako se njima ne menja spoljni izgled zgrade i ako nemaju uticaj na zajedničke delove zgrade i njihovo korišćenje. Članom 2. Pravilnikom o posebnoj vrsti objekata i posebnoj vrsti radova za koje nije potrebno pribavljati akt nadležnog organa, kao i vrsti objekata koji se grade, odnosno vrsti radova koji se izvode, na osnovu rešenja o odobrenju za izvođenje radova, kao i obimu i sadržaju i kontroli tehničke dokumentacije koja se prilaže uz zahtev i postupku koji nadležni organ sprovodi Službeni glasnik RS, br. 102/2020, 16/2021 i 87/2021, propisane su posebne vrste objekata i posebne vrste radova za koje nije potrebno pribavljati akt nadležnog organa, gde, između ostalog, spadaju radovi na tekućem održavanju objekta ili dela objekta stana ili drugog posebnog dela. Iz navedenog sledi da za radove koji se mogu svrstati u radove tekućeg održavanja, nije potrebno pribavljati akt nadležnog organa. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
98	4FFEC7J1ECIPRZKZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li prevoznici mogu da podnose zahteve za dobijanje pojedinačnih dozvola tokom godine a da nisu podneli zahteve za utvrđivanje pojedinačnog plana raspodele i nemaju dozvole u planu?	Mogu da podnose vanredne zahteve svake nedelje do 30. novembra tekuće godine. Komisija ministarstva jednom nedeljno odlučuje o zahtevima iz fonda 3 u skladu sa propisanim pravilnikom. Za detaljne informacije možete se obratiti Sektoru za drumski transport, puteve i bezbednost saobraćaja, telefon @link1@, imejl adresa @link2@.	{"0": {"path": "+381112691432", "type": "tel", "title": "+381 (0) 11 269 14 32", "placeholder": "@link1@"}, "1": {"path": "mailto:drumski@mgsi.gov.rs", "type": "mail", "title": "drumski@mgsi.gov.rs", "placeholder": "@link2@"}}	null	t
75	ODDNVUVFW02TWO0U	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Da li je potrebno pribavljanje akta nadležnog organa za izvođenje radova na postavljanju postrojenja instalisane snage do 50kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca – proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije?	Članom 144. Zakona o planiranju i izgradnji Sl. glasnik RS, br. 72/2009, 81/2009 ispr., 64/2010 odluka US, 24/2011, 121/2012, 42/2013 odluka US, 50/2013 odluka US, 98/2013 odluka US, 132/2014, 145/2014, 83/2018, 31/2019, 37/2019 dr. zakon, 9/2020 i 52/2021 u daljem tekstu Zakon, propisano je da se posebna vrsta objekata može graditi, odnosno određeni radovi izvoditi i bez pribavljanja akta nadležnog organa, u skladu sa posebnim propisom iz člana 201. stav 7. tačka 13a ovog zakona, odnosno Pravilnikom o posebnoj vrsti objekata i posebnoj vrsti radova za koje nije potrebno pribavljati akt nadležnog organa, kao i vrsti objekata koji se grade, odnosno vrsti radova koji se izvode, na osnovu rešenja o odobrenju za izvođenje radova, kao i obimu i sadržaju i kontroli tehničke dokumentacije koja se prilaže iz zahtev i postupku koji nadležni organ sprovodi. Članom 2. stav 1. tačka 4a Pravilnika o posebnoj vrsti objekata i posebnoj vrsti radova za koje nije potrebno pribavljati akt nadležnog organa, kao i vrsti objekata koji se grade, odnosno vrsti radova koji se izvode, na osnovu rešenja o odobrenju za izvođenje radova, kao i obimu i sadržaju i kontroli tehničke dokumentacije koja se prilaže iz zahtev i postupku koji nadležni organ sprovodi Sl. glasnik RS, br. 102/2020, 16/2021 i 87/2021 u daljem tekstu Pravilnik, propisano je da za posebne vrste objekata i posebne vrste radova nije potrebno pribavljati akt nadležnog organa, između ostalog, i za postrojenja instalisane snage do 50 kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca koji stiče status kupca proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije. Imajući u vidu navedene odredbe Zakona i Pravilnika, sledi da za postavljanje postrojenja instalisane snage do 50kW za proizvodnju energije iz energije sunca za potrebe krajnjeg kupca proizvođača u skladu sa propisima kojima se uređuje korišćenje obnovljivih izvora energije, nije potrebno pribaviti akt nadležnog organa za izvođenje radova dakle, niti građevinsku dozvolu, niti rešenje o odobrenju za izvođenje radova. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
76	YSJJ7DHFT9JYM4NT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Кada su planirane izmene Zakona o ozakonjenju objekata („Službeni glasnik RS”, broj 96/15, 83/18, 81/20 - US, 1/23 – US), ili donošenje novog zakona u oblasti ozakonjenja kojim će biti omogućeno ozakonjenje nezakonito izgrađenih objekata izgrađenih posle 27. novembra 2015. godine?	U ovom trenutku nije sačinjen nacrt novog zakona kojim se reguliše oblast ozakonjenja nezakonito izgrađenih objekata niti izmene i dopune postojećeg zakona, a saglasno važećem Zakonu, svi objekti izgrađeni bez izdatog rešenja o građevinskoj dozvoli ili rešenja o odobrenju izvođenja radova posle 27. novembra 2015. godine nisu predmet ozakonjenja u skladu sa odredbama ovog zakona i nadležni građevinski inspektor za te objekte donosi rešenje o rušenju, koje je izvršno danom donošenja, u skladu sa Zakonom o planiranju i izgradnji. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
77	ZUXUTI7EZMVQ6HV3	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Кoji su uslovi za dobijanje velikih licenci, odnosno rešenja o ispunjenosti uslova za izradu tehničke dokumentacije i građenje objekata?	Uslov za dobijanje Rešenja o ispunjenosti uslova za izradu tehničke dokumentacije za objekte za koje građevinsku dozvolu izdaje ministarstvo, je da pravno lice ili preduzetnik imaju najmanje dva zaposlena, odnosno radno angažovana lica sa punim radnim vremenom, koja imaju odgovarajuće stručne rezultate reference da su bili odgovorni projektanti na vrsti objekata za koju se licenca traži, a uslov za dobijanje Rešenja o ispunjenosti uslova za građenje objekata za koje građevinsku dozvolu izdaje ministarstvo, je da pravno lice ili preduzetnik imaju najmanje dva zaposlena, odnosno radno angažovana lica sa punim radnim vremenom, koja imaju odgovarajuće stručne rezultate reference da su bili odgovorni izvođači radova na vrsti objekata za koje se traži licenca. Za dodatne informacije pozovite 011/3616422 ili posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/lat/sektori/sektor-za-gradevinske-poslove-sprovodenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	t
78	MU1P28OC3SBYSRCN	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za završetak autoputa Sremska Rača – Kuzmin?	Rok za završetak radova na projektu Izgradnja autoputa Sremska Rača Kuzmin je avgust 2024. godine.	null	null	t
79	RGRBMDEGSJCQ4BXS	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za završetak radova na saobraćajnici Iverak - Lajkovac?	Rok za završetak radova na projektu Izgradnja brze saobraćajnice do Valjeva, deonica Iverak Lajkovac je maj 2024. godine.	null	null	t
80	TGLC8TM7HUX6BFZ5	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za završetak Moravskog koridora?	Krajem aprila 2023. godine završena je i puštena u saobraćaj deonica od Pojata do Kruševca Makrešane, dužine 16,9 km, a do kraja leta očekuje se završetak dela od Makrešana do Koševa dužine 10,9 km, čime će biti kompletno završena prva deonica Moravskog koridora. Plan je da ceo projekat Moravskog koridora završetkom deonice 2 bude izgrađen i otvoren za saobraćaj sredinom 2025. godine.	null	null	t
81	IZ1YILSIL2O3WQBW	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za zavreštak auto-puta Ruma Šabac?	Deonica Ruma Šabac, na kojoj se izvode asfalterski radovi, biće završena do kraja septembra 2023. godine. Most preko Save, koji je deo deonice 2, već je spojen u julu ove godine, godinu dana pre roka za završetak. Očekivani rok za završetak deonice 3 je kraj 2024. godine, čime će biti kompletno završena izgradnja ovog projekta.	null	null	t
82	3G5OIXIEEW4F4SNB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za izgradnju Fruškogroskog koridora?	Rok za završetak projekta Brza saobraćajnica Novi Sad Ruma Fruškogorski koridor je kraj 2025. godine.	null	null	t
83	ZVLQUGD34PEACWHC	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti izgrađen put preko Radan planine?	Rok za završetak projekta Izgradnja puta preko Radan planine je kraj 2023. godine.	null	null	t
84	QAQHQPK4FAV2U4EU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Koji je rok za završetak radova na brodskoj prevodnici Đerdap 2?	Rok za završetak projekta Adaptacija brodske prevodnice u sastavu HE Đerdap 2 je april 2024. godine.	null	null	t
85	COOSAPSHFE45MBLZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će iz Dunava biti izvađena nemačka flota iz Drugog svetskog rata?	Rok za završetak projekta Vađenje potopljene nemačke flote iz Drugog svetskog rata je decembar 2027. godine.	null	null	t
86	Y3TCXZGGCSU5WFCE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti proširena luka Bogojevo?	Rok za završetak projekta Proširenje kapaciteta Luke Bogojevo je decembar 2024.	null	null	t
87	BW4RI0SXAJYAAMD9	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	4	Kada će biti proširena luka Prahovo?	Rok za završetak projekta Proširenje kapaciteta Luke Prahovo je decembar 2024.	null	null	t
99	UGY6SGPQYVEX8QRZ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li postoje rokovi za razduženje pojedinačnih dozvola?	Postoje rokovi za razduženje propisani Opštim delom plana raspodele i počinju da teku danom preuzimanja pojedinačne dozvole. Za dodatne informacije posetite link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/godisnji-plan-raspodele-za-2023-godinu", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/godisnji-plan-raspodele-za-2023-godinu", "placeholder": "@LINK1@"}}	null	t
100	W1SG5Y7SCDDZ6OWQ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko sprovodi ispit za sticanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?	Ispit za sticanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza sprovodi MGSI. Više informacija možete naći na sajtu @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "placeholder": "@link1@"}}	null	t
101	DKXKUCHPIPOVCZSP	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Koji je uslov da domaći prevoznik može da dobije dozvole za obavljanje međunarodnog prevoza tereta?	Uslov je da prevoznik podnese zahtev za utvrđivanje pojedinačnog plana raspodele. Zahtev se podnosi na šalteru Uprave za zajedničke poslove republičkih organa, adresa Sremska 35, 11000 Beograd, Ministarstvo građevinarstva, saobraćaja i infrastrukture.	null	null	t
102	4MLFVFIVTPMRFQWL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Gde i kako mogu da se podnose zahtevi za pojedinačni plan raspodele dozvola?	Zahtevi se podnose do 30. novembra tekuće godine za narednu godinu, na šalteru Uprave za zajedničke poslove republičkih organa, adresa Sremska 35, 11000 Beograd, Ministarstvo građevinarstva, saobraćaja i infrastrukture.	null	null	t
103	CFD97HIOMWHU6HTE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Šta čini pojedinačni plan raspodele dozvola?	Pojedinačni plan raspodele čine pojedinačne, vremenske i CEMT dozvole. Za više informacija kliknite na link @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/lat/dokumenti/godisnji-plan-raspodele-za-2023-godinu", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/godisnji-plan-raspodele-za-2023-godinu", "placeholder": "@link1@"}}	null	t
104	W0R0CZ44F2YY9GWG	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Koji je uslov za obavljanje javnog prevoza putnika u drumskom saobraćaju?	Potrebno je posedovati licencu za obavljanje javnog prevoza putnika u drumskom saobraćaju za odgovarajuću vrstu prevoza međunarodni, domaći, linijski i vanslinijski . Za više informacija možete pozvati 1. Odsek za prevoz putnika u drumskom saobraćaju domaći, @link1@ radnim danima od 1013 časova , imejl adresa @link2@ 2. Odsek za prevoz putnika u drumskom saobraćaju međunarodni, @link3@ radnim danima od 1013 časova , @link4@ radnim danima od 1013 časova , imejl adresa @link5@.	{"0": {"path": "+381112929750", "type": "tel", "title": "+381 (0) 11 292 97 50", "placeholder": "@link1@"}, "1": {"path": "mailto:drumski.putnicki@mgsi.gov.rs", "type": "mail", "title": "drumski.putnicki@mgsi.gov.rs", "placeholder": "@link2@"}, "2": {"path": "+381112929748", "type": "tel", "title": "+381 (0) 11 292 97 48", "placeholder": "@link3@"}, "3": {"path": "+381113114291", "type": "tel", "title": "+381 (0) 11 311 42 91", "placeholder": "@link4@"}, "4": {"path": "mailto:drumski.putnicki@mgsi.gov.rs", "type": "mail", "title": "drumski.putnicki@mgsi.gov.rs", "placeholder": "@link5@"}}	null	t
105	X6G4APDK7GJT94RR	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Koji je uslov za obavljanje javnog prevoza tereta u drumskom saobraćaju?	Potrebno je posedovati licencu za obavljanje javnog prevoza tereta u drumskom saobraćaju međunarodni i domaći. Za dodatne informacije možete nazvati Odsek za prevoz tereta u drumskom saobraćaju @link1@, @link2@ radnim danima od 1013 časova, imejl adresa @link3@.	{"0": {"path": "011/29-29-745", "type": "tel", "title": "011/29-29-745", "placeholder": "@link1@"}, "1": {"path": "011/29-29-746", "type": "tel", "title": "011/29-29-746", "placeholder": "@link2@"}, "2": {"path": "mailto:drumski.teretni@mgsi.gov.rs", "type": "mail", "title": "drumski.teretni@mgsi.gov.rs", "placeholder": "@link3@"}}	null	t
106	ZVFB4HYKYMNCEIYE	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko može da bude odgovorno lice kod domaćeg prevoznika?	Odgovorno lice kod domaćeg prevoznika može biti lice koje poseduje sertifikat o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza prevoz putnika ili prevoz tereta. Za više informacija kliknite link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/odsek/odeljenje-za-drumski-transport-0", "type": "url", "title": "https://www.mgsi.gov.rs/lat/odsek/odeljenje-za-drumski-transport-0", "placeholder": "@LINK1@"}}	null	t
107	XQFQLH84JJHEDXN6	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko radi registraciju i overu reda vožnje za međumesni linijski prevoz putnika?	Registraciju i overu reda vožnje za međumesni linijski prevoz putnika vrši MGSI. Detaljnije možete pogledati na linku **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/domaci-prevoz-putnika", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/domaci-prevoz-putnika", "placeholder": "@LINK1@"}}	null	t
108	NNZTDSBPDNVP1YAF	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Gde i kako mogu da se podnose zahtevi za zaduženje i razduženje dozvola za prevoz tereta?	Na šalteru Uprave za zajedničke poslove republičkih organa, adresa Sremska 35, 11000 Beograd, Ministarstvo građevinarstva, saobraćaja i infrastrukture.	null	null	t
109	KBUZ47B8LPHUPK99	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko je nadležan za izgradnju trotoara na državnom putu?	Za izgradnju trotoara na državnom kao i na opštinskom putu u naselju nadležna je jedinica lokalne samouprave.	null	null	t
110	WGBVOQRBILSSXI3A	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko daje finansijsku pomoć za popravku i asfaltiranje lokalnih puteva?	Finansijska pomoć može se dobiti od Ministarstva privredesektor za investicije u infrastrukturu.	null	null	t
111	SQPURDHRMZMCEYIU	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko izdaje dozvole za vanredni prevoz?	Dozvole za vanredni prevoz na državnom putu izdaje javno preduzeće ,,Putevi Srbije , a na opštinskim putevima i ulicama organ za poslove saobraćaja u jedinici lokalne samouprave. Za dodatne informacije posetite njihov sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://www.putevi-srbije.rs/index.php", "type": "url", "title": "https://www.putevi-srbije.rs/index.php", "placeholder": "@LINK1@"}}	null	t
112	KJNNHF5FHT3QGOTV	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Kome se podnosi zahtev za postavljanje "ležećih policajaca"?	Zahtev Ministarstvu podnosi jedinica lokalne samouprave sa izrađenim projektom na koji je data saglasnost JP Putevi Srbije. Za više informacija obratite se Grupi za bezbednost saobraćaja, kontakt telefoni 011 2609241, 011 2609120, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.bezbednostsaobracaja@mgsi.gov.rs", "type": "mail", "title": "drumski.bezbednostsaobracaja@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
113	AEXAIMXGQAAMNZZL	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li je dovoljno da se podnese zahtev za pojedinačni plan raspodele dozvola jednom godišnje?	Utvrđivanje pojedinačnog plana raspodele obuhvata i tri revizije tog plana koje ministarstvo vrši u toku kalendarske godine. Za dodatne informacije posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture, sektor za drumski transport, puteve i bezbednost saobraćaja **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "placeholder": "@LINK1@"}}	null	t
114	MEPOGIWB5P7DP65K	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li prevoznik koji nije predao zahtevi za pojedinačni plan raspodele dozvola, ako je počeo obavljanje delatnosti prevoza tereta nakon tog roka, može da podnese zahtev za reviziju pojedinačnog plana?	Da. Zahtev za reviziju pojedinačnog plana podnosi se za preostali period do kraja godine i podnosi ga prevoznik koji nije podneo zahtev za utvrđivanje plana raspodele. Za dodatne informacije kliknite na link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/godisnji-plan-raspodele-za-2023-godinu", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/godisnji-plan-raspodele-za-2023-godinu", "placeholder": "@LINK1@"}}	null	t
115	E5EICICCTDIPXUBM	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Gde je moguće pronaći uputstvo i zahtev za numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?	Uputstvo i zahtev numeraciju sertifikata za teretna vozila nacionalnim brojem EURO standardi moguće je pronaći na internet prezentaciji **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "placeholder": "@LINK1@"}}	null	t
116	CQ9VBOMZPOGRMKW4	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko vrši numeraciju sertifikata za teretna vozila nacionalnim brojem (EURO standardi)?	MGSI vrši numeraciju sertifikata za teretna vozila nacionalnim brojem i produženje važnosti ovih sertifikata. Za dodadtne informacije možete se obratiti Odseku za prevoz tereta u drumskom saobraćaju 011/2929745, 011/2929746 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.teretni@mgsi.gov.rs", "type": "mail", "title": "drumski.teretni@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
117	FJ9983IGK8LXRMKO	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li je potrebno posedovati izvod licence za prevoz za svako vozilo iz voznog parka prevoznika?	Potrebno je posedovati izvod licence za prevoz za svako motorno vozilo iz voznog parka prevoznika. Za dodatne informacije posetite sajt **@LINK1@** Za više informacija možete pozvati Odsek za licenciranje i sertifikaciju u drumskom saobraćaju licence za javni prevoz 011/2929758, 011/2929759 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:drumski.licence@mgsi.gov.rs", "type": "mail", "title": "drumski.licence@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
118	ZVFUZYTLIXPDMYCX	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li je red vožnje za međumesni linijski prevoz putnika moguće preneti na drugog prevoznika ili voziti u kooperaciji?	Red vožnje za međumesni linijski prevoz putnika nije moguće preneti na drugog prevoznika ili voziti u kooperaciji.	null	null	t
119	7BRHXPXVSNHRQVW6	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Šta su nekategorisani putevi i ko je nadležan za njihovo održavanje?	To je put koji je nadležni organ proglasio nekategorisanim opština ili grad i kao takav je upisan u javne evidencije o nepokretnostima. Grad može poveriti upravljanje nekategorisanim putevima gradskoj opštini.	null	null	t
120	SLVRP3EWCR05O8CA	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li auto-put mora da ima zaustavnu traku?	Autoput mora da ima zaustavnu traku, osim na mostovima i u tunelima gde se u dužim tunelima na određenom rastojanju izvode zaustavne površine.	null	null	t
121	VGHD7N4BU0WX383J	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Na osnovu čega se obavlja međunarodni prevoz putnika i tereta sa drugom državom?	Međunarodni prevoz putnika i tereta sa drugom državom obavlja se na osnovu međunarodnih bilateralnih ili multilateralnih sporazuma.	null	null	t
122	ANFEOVAO6EYSY64Y	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li je moguće obavljati međunarodni prevoz putnika sa linijskom dozvolom zajedno sa podvozarom?	Moguće je obavljati međunarodni prevoz putnika sa linijskom dozvolom zajedno sa podvozarom ukoliko je istom odobreno obavljanje prevoza i da je upisan u dozvolu.	null	null	t
123	I9MKJBEZ6DNB5BXQ	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Šta je to CEMT dozvola?	CEMT dozvola je međunarodna multilateralna dozvola koja omogućava domaćem prevozniku prevoz neograničenog broja prevoza tereta u periodu od godinu dana.	null	null	t
124	1ZPKUTEXIDKDGE8S	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Da li postoje sezonske linije za obavljanje međunarodnog prevoza putnika?	Sezonske linije za obavljanje međunarodnog prevoza putnika postoje i izdaju se po osnovu dogovora dve države između kojih se obavlja ovaj prevoz uz prethodno usaglašen i odobren međunarodni red vožnje.	null	null	t
125	PG3KHFDCQRGD1XSB	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko izdaje licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?	Licence za pružanje staničnih usluga autobuske stanice na teritoriji Republike Srbije izdaje MGSI na osnovu prethodno ispunjenih zakonskih uslova. Za sve informacije možete se obratiti Odseku za licenciranje i sertifikaciju u drumskom saobraćaju licence za javni prevoz 011/2929758, 011/2929759 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.licence@mgsi.gov.rs", "type": "mail", "title": "drumski.licence@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
138	WCYKOGAZAVHBHCBH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko je nadležan za popravku kolovoza u ulici?	Za popravku ulica i opštinskih puteva nadležna je jedinica lokalne samouprave. Za dodatne informacije obratite se Grupi za održavanje puteva na broj telefona 011/2609425 radnim danima od 10 do 13 časova, 011/2608729 radnim danima od 10 do 13 časova, a možete pisati i na imejl adresu **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.putevi@mgsi.gov.rs", "type": "mail", "title": "drumski.putevi@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
126	OOFJ9QVVQGK4AN3M	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Koji zakoni regulišu oblast putne infrastrukture?	Zakon o putevima **@LINK1@**, Zakon o bezbednosti saobraćaja na putevima **@LINK2@** i Zakon o planiranju i izgradnji **@LINK3@**.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/zakon-o-bezbednosti-saobratshaja-na-putevima", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/zakon-o-bezbednosti-saobratshaja-na-putevima", "placeholder": "@LINK2@"}, "2": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "placeholder": "@LINK3@"}}	null	t
127	PLDFEBIN6JJCBSNT	2023-06-27 18:39:49	2023-06-27 18:39:49	\N	5	Ko je nadležan za popravku trotoara i biciklističkih staza uz državni put u naselju?	Za popravku dodatnih elemenata puta za potrebe naselja kao što su pešačke i biciklističke staze, trotoari, autobuska stajališta nadležna je jedinica lokalne samouprave.	null	null	t
128	16FQIE07YXERWQDA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koji su državni, a koji opštinski putevi u Republici Srbiji?	Spisak državnih puteva nalazi se u Uredbi o kategorizaciji državnih puteva ,,sl.gl.rs**@PHONE1@**/13 i 93/15. **@LINK1@** Akt o kategorizaciji opštinskih puteva i ulica donosi svaka jedinica lokalne samouprave za puteve na svojoj teritoriji.	{"0": {"auto": true, "path": "http://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/vlada/uredba/2015/93/4", "type": "url", "title": "http://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/vlada/uredba/2015/93/4", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "tel:105/13 119", "type": "tel", "title": "105/13 119", "placeholder": "@PHONE1@"}}	null	t
129	NIFZ0UTOOTLKGVYR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Da li prevoznik mora lično da preuzme ili razduži dozvole i licence za prevoz sertifikat za lice odgovorno za prevoz ili drugu dozvolu za prevoz putnika?	Zahteve za preuzimanje svih dokumenata iz nadležnosti MGSI i razduženje mogu da podnose ovlašćena lica od strane domaćeg prevoznika. Za dodadtne informacije posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/odsek/odsek-za-licenciranje-i-sertifikaciju-u-drumskom-saobratshaju", "type": "url", "title": "https://www.mgsi.gov.rs/cir/odsek/odsek-za-licenciranje-i-sertifikaciju-u-drumskom-saobratshaju", "placeholder": "@LINK1@"}}	null	t
130	YHJEXQYLGJN5HZ8E	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koji zakon reguliše oblast drumskog prevoza putnika?	Zakon o prevozu putnika u drumskom saobraćaju **@LINK1@**.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/5", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/5", "placeholder": "@LINK1@"}}	null	t
131	TPI4SMLNIJYIIKTD	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koje takse se plaćaju?	Sve informacije o zahtevima i iznosima taksi možete pronaći na internet prezentaciji Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/informacije-uputstva-i-formulari", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/informacije-uputstva-i-formulari", "placeholder": "@LINK1@"}}	null	t
132	A7XBKKXIMOJRSLIE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Da li je dozvoljeno obavljanje taksi prevoza na teritoriji jedinice druge lokalne samouprave?	Obavljanje taksi prevoza na teritoriji jedinice druge lokalne samouprave je dozvoljeno samo radi dovoženja putnika iz jedinice lokalne samouprave gde je taksi prevoznik registrovan.	null	null	t
133	Y8Q95K2TNEKDOBUW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Da li je potrebno posedovati posebnu dozvolu za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju?	Za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju nije potrebno posedovati posebnu dozvolu, već je neophodno posedovati knjigu putnih listova za obavljanje vanlinijskog prevoza putnika u domaćem saobraćaju koju izdaje MGSI.	null	null	t
134	EN9ICYOOW2RDSR9O	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko je nadležan za popravku semafora u određenom naselju na državnom putu?	Za popravku semafora u naselju na državnom putu nadležna je jedinica lokalne samouprave. Za dodatne informacije obratite se Sektoru za drumski transport, puteve i bezbednost saobraćaja, kontakt 2691432, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski@mgsi.gov.rs", "type": "mail", "title": "drumski@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
135	CUI10QSDUYDMHAND	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koja je procedura kada izgubim dozvolu?	Podnosi se Ministarstvu prijava o izgubljenoj dozvoli, na osnovu čega se umanjuje broj dozvola na raspolaganju u tekućoj godini i u narednoj godini; ili se plaća kazna propisana Uredbom o raspodeli stranih dozvola za međunarodni prevoz tereta **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/sites/default/files/Uredba%20o%20raspodeli%20stranih%20dozvola%20za%20medjunarodni%20prevoz%20tereta%20%28Sl.%20glasnik%20RS%2C%20br.%20111-2022%20i%20144-2022%29.pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/Uredba%20o%20raspodeli%20stranih%20dozvola%20za%20medjunarodni%20prevoz%20tereta%20%28Sl.%20glasnik%20RS%2C%20br.%20111-2022%20i%20144-2022%29.pdf", "placeholder": "@LINK1@"}}	null	t
136	MI6XI9KZJ8UURL2M	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Gde je moguće pronaći uputstvo i zahtev za izdavanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza?	Uputstvo i zahtev za izdavanje sertifikata o profesionalnoj osposobljenosti za obavljanje odgovarajuće vrste prevoza moguće je pronaći na internet prezentaciji **@LINK1@**. Za više informacija možete pozvati Odsek za licenciranje i sertifikaciju u drumskom saobraćaju licence za javni prevoz 011/2929758, 011/2929759 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:drumski.licence@mgsi.gov.rs", "type": "mail", "title": "drumski.licence@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
137	LYG7DH2TAMEZCEQI	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koji zakon reguliše oblast drumskog prevoza tereta?	Zakon o prevozu tereta u drumskom saobraćaju **@LINK1@**.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2015/68/7/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2015/68/7/reg", "placeholder": "@LINK1@"}}	null	t
139	PKPVURN3YYXMGPER	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Šta je potrebno za izdavanje rešenja za postavljanje saobraćajne signalizacije za vreme izvođenja radova ( ili održavanja manifestacije) na državnom putu?	Projekat saobraćajne signalizacije sa izvršenom tehničkom kontrolom u 3 tri primerka, urađeno od preduzeća sa licencom p131s1, saglasnost JP,,Putevi Srbije na projekat, dokaz o odobrenim radovima zbog kojih se menja režim saobraćaja, obaveštenje o periodu izvođenja radova, dokaz o uplaćenim taksama na račun budžet RS broj 84074222184357, poziv na broj 97 50016, u skladu sa tarifnim brojem 1. i tarifnim brojem 147.st.2 Zakona o rep.adm.taksama.	null	null	t
140	1SXG8HGR5PLQDNYQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Kada se utvrđuje pojedinačni plan raspodele?	Po prijemu zahteva, Ministarstvo građevinarstva, saobraćaja i infrastrukture utvrđuje predlog plana raspodele, prevoznici imaju rok od sedam dana da dostave primedbe na objavljeni predlog. Nakon razmatranja primedbi utvrđeni plan raspodele se objavljuje najkasnije do 25. decembra tekuće godine za narednu godinu.	null	null	t
141	KNPZKBC2LWO0LZPR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Kada se podnosi zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika?	Zahtev za produženje roka važenja međunarodne dozvole za linijski prevoz putnika podnosi se najkasnije četiri meseca, odnosno tri meseca za susedne države pre isteka roka važenja važeće dozvole.	null	null	t
142	97XQXUSZBMZLQET7	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko vrši isplatu ekspropisanog zemljišta za izgradnju puta?	Ukoliko je zemljište eksproprisano za potrebe izgradnje državnog puta potrebno je da se obratite JP Putevi Srbije Bulevar kralja Aleksandra 282, Beograd ili nadležnoj opštini/gradu ukoliko je u pitanju ulica, opštinski put ili nekategorisani put. Za dodatne informacije posetite njihov sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://www.putevi-srbije.rs/index.php", "type": "url", "title": "https://www.putevi-srbije.rs/index.php", "placeholder": "@LINK1@"}}	null	t
143	VVBC5QAQZX5HFVE4	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Da li probijanjem roka za vraćanje/razduživanje dozvola prevoznik trpi neke sankcije?	Rokovi za razduživanje dozvola, u zavisnosti od kontigenta postoje propisani opštim delom plana raspodele koji se nalazi na internet prezentaciji Ministarstva građevinarstva, saobraćaja i infrastrukture. Nakon isteka propisanog roka prevoznik ne može da preuzme nijednu pojedinačnu dozvolu do trenutka razduženja predmetne dozvole.	null	null	t
144	5JYTK5LCHLIYTSES	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Do koje najveće dozvoljene mase vozila nije potreban izvod licence za prevoz?	Za sva teretna motorna vozila iznad 3,5 tone najveće dozvoljene nosivosti je potrebno posedovati izvod licence za prevoz. Za dedatljnije informacije pročitajte Upustvo za dobijanje potvrda o ispunjavanju tehničkih i tehničkotehnoloških uslova koje mora ispunjavati teretno vozilo ili skup vozila **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/sites/default/files/Uputstvo%20za%20dobijanje%20potvrda%20o%20ispunjavanju%20tehnickih%20i%20tehnicko-tehnoloskih%20uslova%20koje%20mora%20ispunjavati%20teretno%20vozilo%20ili%20skup%20vozila%2006-07-2017.pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/Uputstvo%20za%20dobijanje%20potvrda%20o%20ispunjavanju%20tehnickih%20i%20tehnicko-tehnoloskih%20uslova%20koje%20mora%20ispunjavati%20teretno%20vozilo%20ili%20skup%20vozila%2006-07-2017.pdf", "placeholder": "@LINK1@"}}	null	t
145	EVKCEPDTZ5QWU2RR	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Šta još treba razdužiti sa dozvolom za prevoz putnika i tereta?	Razdužuju se listovi iz dnevnika putovanja o obavljenim vožnjama za godišnje i CEMT dozvole. Jednom mesečno za prethodni mesec.	null	null	t
146	ZV7SFN8YHRXWP8PW	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko razmenjuje međunarodne dozvole za prevoz tereta sa drugim državama?	Međunarodne dozvole za prevoz tereta sa drugim državama razmenjuje MGSI na osnovu prethodno dogovorenih godišnjih kvota sa drugom državom. Za dodatne informacije možete pozvati Odsek za prevoz tereta u drumskom saobraćaju, 011/2929745 i 011/2929746 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.teretni@mgsi.gov.rs", "type": "mail", "title": "drumski.teretni@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
147	M1UER8CUPTVSUCLH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko je nadležan za sanaciju udarnih rupa na državnom putu?	Za održavanje državnih puteva i pripadajuće saobraćajne signalizacije nadležno je javno preduzeće Putevi Srbije, Bulevar kralja Aleksandra 282, Beograd. Za dodatne informacije posetite njihov sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://www.putevi-srbije.rs/index.php", "type": "url", "title": "https://www.putevi-srbije.rs/index.php", "placeholder": "@LINK1@"}}	null	t
148	J64HV7Q6GQWOAYFH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko izdaje međunarodne dozvole za linijski prevoz putnika?	Međunarodne dozvole za linijski prevoz putnika izdaje MGSI uz prethodno odobren odgovarajući međunarodni red vožnje. Za dodatne informacije možete se obratiti Odseku za prevoz putnika u drumskom saobraćaju međunarodni 011/2929748 radnim danima od 10 do 13 časova, 011/3114291radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.putnicki@mgsi.gov.rs", "type": "mail", "title": "drumski.putnicki@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
149	E4QCPT3LT27VA29Y	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	U kom periodu se podnosi zahtev za registraciju i overu reda vožnje za međumesni linijski prevoz putnika?	Zahtev za registraciju i overu reda vožnje za međumesni linijski prevoz putnika podnosi se od 1530. maja tekuće godine. Za više detalja posetite link **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/domaci-prevoz-putnika", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/domaci-prevoz-putnika", "placeholder": "@LINK1@"}}	null	t
150	0DZMR4ZWO3IUHI0K	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	U kom periodu se preuzimaju registrovani red vožnje za međumesni linijski prevoz putnika?	Registrovani red vožnje za međumesni linijski prevoz putnika preuzimaju se od 1020. jula tekuće godine. Detaljnije možete pričitate na linku **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/domaci-prevoz-putnika", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/domaci-prevoz-putnika", "placeholder": "@LINK1@"}}	null	t
151	UAEP9JKGHH4IW26X	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Od kada počinje da važi registrovani red vožnje za međumesni linijski prevoz putnika?	Registrovani red vožnje za međumesni linijski prevoz putnika počinje da važi od 01. oktobra tekuće godine sa rokom važenja od pet godina.	null	null	t
162	898XBO2JWU9GGZYY	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koliko traje koncesija za Aerodrom Nikola Tesla?	Koncesionar, francuska firma Vansi, postao je operater na aerodromu Nikola Tesla 2018. godine, a koncesija je ugovorena na 25 godina.	null	null	t
152	WNOBGOFSMTI7I2GU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Gde je moguće pronaći uputstvo i zahtev za izdavanje licence za prevoz?	Uputstvo i zahtev za izdavanje licence za prevoz moguće je pronaći na internet prezentaciji MGSI **@LINK1@**. Za više informacija možete pozvati Odsek za licenciranje i sertifikaciju u drumskom saobraćaju licence za javni prevoz 011/2929758, 011/2929759 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-drumski-transport-puteve-i-bezbednost-saobracaja-0", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:drumski.licence@mgsi.gov.rs", "type": "mail", "title": "drumski.licence@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
153	B9CYDWHDDJ5CMIGK	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Kada se podnosi zahtev za produženje roka važenja licence za pružanje staničnih usluga (autobuske stanice) na teritoriji Republike Srbije?	Zahtev za produženje roka važenja licence za pružanje staničnih usluga autobuske stanice na teritoriji Republike Srbije podnosi se najkasnije 90 dana pre isteka roka važenja važeće licence. Za sve informacije možete se obratiti Odseku za licenciranje i sertifikaciju u drumskom saobraćaju licence za javni prevoz 011/2929758, 011/2929759 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:drumski.licence@mgsi.gov.rs", "type": "mail", "title": "drumski.licence@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
154	7USFH6TGTAH4FKJU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ko je nadležan za održavanje sistema za odvodnjavanje državnog puta u naselju?	Upravljač državnog puta JP,,Putevi Srbije nadležno je za održavanje sistema za odvodnjavanje puta u naselju ukoliko taj sistem nije deo mesne kanalizacione mreže u tom slučaju nadležna je jedinica lokalne samouprave. Za dodatne informacije posetite njihov sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://www.putevi-srbije.rs/index.php/%D0%BA%D0%BE%D0%BD%D1%82%D0%B0%D0%BA%D1%82-%D1%98%D0%BF%D0%BF%D1%81", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/%D0%BA%D0%BE%D0%BD%D1%82%D0%B0%D0%BA%D1%82-%D1%98%D0%BF%D0%BF%D1%81", "placeholder": "@LINK1@"}}	null	t
155	8QNH7DWNS73XJACZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Šta je to Interbus sporazum?	Interbus sporazum je međunarodni multilateralni sporazum koji uređuje međunarodni vanlinijski prevoz putnika. Na navedenom linku možete pročitati više **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/sites/default/files/%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%20%D0%BE%20%D0%BF%D0%BE%D1%82%D0%B2%D1%80%D1%92%D0%B8%D0%B2%D0%B0%D1%9A%D1%83%20%D0%A1%D0%BF%D0%BE%D1%80%D0%B0%D0%B7%D1%83%D0%BC%D0%B0%20%D0%BE%20%D0%BC%D0%B5%D1%92%D1%83%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B5%D0%B2%D0%BE%D0%B7%D1%83%20%D0%BF%D1%83%D1%82%D0%BD%D0%B8%D0%BA%D0%B0%20....pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%20%D0%BE%20%D0%BF%D0%BE%D1%82%D0%B2%D1%80%D1%92%D0%B8%D0%B2%D0%B0%D1%9A%D1%83%20%D0%A1%D0%BF%D0%BE%D1%80%D0%B0%D0%B7%D1%83%D0%BC%D0%B0%20%D0%BE%20%D0%BC%D0%B5%D1%92%D1%83%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B5%D0%B2%D0%BE%D0%B7%D1%83%20%D0%BF%D1%83%D1%82%D0%BD%D0%B8%D0%BA%D0%B0%20....pdf", "placeholder": "@LINK1@"}}	null	t
156	TU1S5RIKDISR4NWA	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Ukoliko se obavlja prevoz po osnovu Interbus sporazuma da li je potrebna posebna vanlinijska dozvola?	Ukoliko se prevoz obavlja po osnovu Interbus sporazuma gde nije potrebna posebna dozvola, za takav prevoz potrebno je posedovati samo Interbus putni list u autobusu prevoznika koji obavlja prevoz **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/sites/default/files/%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%20%D0%BE%20%D0%BF%D0%BE%D1%82%D0%B2%D1%80%D1%92%D0%B8%D0%B2%D0%B0%D1%9A%D1%83%20%D0%A1%D0%BF%D0%BE%D1%80%D0%B0%D0%B7%D1%83%D0%BC%D0%B0%20%D0%BE%20%D0%BC%D0%B5%D1%92%D1%83%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B5%D0%B2%D0%BE%D0%B7%D1%83%20%D0%BF%D1%83%D1%82%D0%BD%D0%B8%D0%BA%D0%B0%20....pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/%D0%97%D0%B0%D0%BA%D0%BE%D0%BD%20%D0%BE%20%D0%BF%D0%BE%D1%82%D0%B2%D1%80%D1%92%D0%B8%D0%B2%D0%B0%D1%9A%D1%83%20%D0%A1%D0%BF%D0%BE%D1%80%D0%B0%D0%B7%D1%83%D0%BC%D0%B0%20%D0%BE%20%D0%BC%D0%B5%D1%92%D1%83%D0%BD%D0%B0%D1%80%D0%BE%D0%B4%D0%BD%D0%BE%D0%BC%20%D0%BF%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B5%D0%B2%D0%BE%D0%B7%D1%83%20%D0%BF%D1%83%D1%82%D0%BD%D0%B8%D0%BA%D0%B0%20....pdf", "placeholder": "@LINK1@"}}	null	t
157	DRILBTNEXMDUKSBT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Do kada država daje subvencije za taksi prevoznike?	Subvencije za taksi prevoznike se dodeljuju po osnovu dostavljenih zahteva za dobijanje subvencije zaključno sa 31.12.2022. godine. Sva dokumenta vezana za subvencije za taksi prevoznike možete pogledati na linku **@LINK1@**, takođe, za dodatna pitanja možete nazvati Odsek za prevoz putnika u drumskom saobraćajusubvencije u taksi prevozi, 011/2929762 radnim danima od 10 do 13 časova, 011/3117545 radnim danima od 10 do 13 časova, imejl adresa **@EMAIL1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/subvencije-u-taksi-prevozu", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/subvencije-u-taksi-prevozu", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:drumski.taxi@mgsi.gov.rs", "type": "mail", "title": "drumski.taxi@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
158	LTL7AY3HESISQTJL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koliko u Srbiji ima autoputeva?	Od izgradnje prvog autoputa za vreme SFRJ do 2012. godine u Srbiji je izgrađeno 596 kilometara autoputeva. Od 2012. godine do danas izgradili smo novih 435 kilometara, a trenutno se gradi oko 400 kilometara autoputeva.	null	null	t
159	BH235TPBYI4MCG07	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Kada će biti usvojen novi Zakon o planiranju i izgradnji?	Nakon izrade novog zakona, sprovođenja javne rasprave i svih neophodnih procedura, Vlada Republike Srbije usvojila je Predlog zakona o izmenama i dopunama Zakona o planiranju i izgradnji i uputila ga u Narodnu skupštinu Republike Srbije. Očekuje se da rasprava o Predlogu zakona bude na nekoj od narednih sednica Parlamenta.	null	null	t
160	LIHCOOOVYO7DNLUT	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Kako se zove brzi voz od Beograda do Novog Sada?	Brzi voz na relaciji Beograd Novi Sad dobio je ime SOKO.	null	null	t
161	HT7KMFIKCWXEQX3P	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Šta je to Otvoreni Balkan?	Otvoreni Balkan je inicijativa koju je pokrenuo predsednik Aleksandar Vučić. To je zajednički projekat Srbije, Severne Makedonije i Albanije, napravljen sa idejom slobodnog protoka robe, kapitala i ljudi između država članica. Neke od prednosti inicijative koje se odnose na resor ministarstva su uspostavljanje traka na granicama samo za zemlje članice, kao i sistem integrisane naplate putarine koji uskoro treba da krene sa funkcionisanjem.	null	null	t
163	VUTKCJLULGTD1MQO	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Koje su prednosti novog Zakona o planiranju i izgradnji?	Ključne izmene i dopune Zakona o planiranju i izgradnji su 1. Unapređenje elektronskog sistema CEOP za izdavanje građevinskih dozvola 2. Uvođenje novi elemenata Zelene agende 3. Povećanje odgovornosti ovlašćenih lica u postupcima izdavanja akta za izgradnju 4. Ukidanje Zakona o konverziji uz naknadu određenoj kategoriji lica 5. Ukidanje Lex specialisa za linijske infrastrukturne objekte 6. Otklanjanje kolizionih odredbi 7. Formiranje Agencije za prostorno planiranje i urbanizam Republike Srbije 8. Uvođenje Glavnog državnog urbaniste i Glavnog urbaniste Autonomne pokrajine Vojvodina 9. Prenos dela ovlašćenja sa državnog organa na druga pravna lica i javne beležnike 10. Pojačana zaštita zaštićenih prirodnih i kulturnih područja 11. Pojačana aktivnost jedinica lokalnih samouprava u oblasti planiranja i uređenja prostora 12. Usaglašenost izmena i dopuna Zakona sa propisima EU Predlog zakona možete da pogledate na linku @link1@.	{"0": {"path": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "type": "url", "title": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "placeholder": "@link1@"}}	null	t
164	IX4S5AQDRD1LIGNU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Šta je to zelena gradnja?	Predlogo izmena i dopuna Zakona o planiranju i izgradnji uvedeni su novi elementi Zelene agende koji definišu pravila i stimuliši zelenu gradnju u Srbiji. Glavne prednosti su 1. Unapređenje odredbi o energetskoj efikasnosti 2. Uvođenje termina zelene gradnje sa izdavanjem sertifikata 3. Povećanje elektromobilnosti 4. Preciziranje odredbi o izgradnji solarnih parkova 5. Registar brownfield lokacija 6. Upravaljanje i skladištenje građevinskog otpada Predlog zakona možete da pogledate na linku @link1@.	{"0": {"path": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "type": "url", "title": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "placeholder": "@link1@"}}	null	t
165	GHPKDPUD6ACWLMY9	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Šta je to sertifikat zelene gradnje?	Sertifikat zelene gradnje je potvrda izdata u skladu sa međunarodnim sistemom za sertifikaciju zelenih zgrada, kojim se verifikuje da je objekat ispunio zadate kriterijume i služi za ocenjivanje kvaliteta i stepena ispunjenosti kriterijuma zelene gradnje. Izmenama i dopunama Zakona o planiranju i izgradnji je predviđeno da Agencija za prostorno planiranje i urbanizam Republike Srbije izdaje odnosno potvrđuje sertifikate zelene gradnje.Bitno je napomenuti da su predložene odredbe usaglašene i urađene u neposrednoj komunikaciji sa Savetom zelene gradnje, dok je za izradu podzakonskog akta planirano uključivanje svih ostalih organizacija, udruženja i državnih organa, koji se bave ovim pitanjima. Predlog zakona možete da pogledate na linku @link1@.	{"0": {"path": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "type": "url", "title": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "placeholder": "@link1@"}}	null	t
166	YFMNHS5QNNWTYUW9	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Gde mogu da vidim red vožnje voza SOKO?	Red vožnje možete da pogledate na sledećem linku @link1@.	{"0": {"path": "https://w3.srbvoz.rs/redvoznje", "type": "url", "title": "https://w3.srbvoz.rs/redvoznje", "placeholder": "@link1@"}}	null	t
167	FCOBMSXDLEEWIGMP	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	5	Kako se stimuliše energetska efikasnost zgrada?	Izmenama i dopunama Zakona o planiranju i izgradnji predviđena je izrada Nacionalne metodologije proračuna energetskih karakteristika zgrada, čime je napravljen značajan iskorak ka daljem unapređenju energetske efikasnosti. Predlog zakona možete da pogledate na linku @link1@.	{"0": {"path": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "type": "url", "title": "http://www.parlament.gov.rs/upload/archive/files/cir/pdf/predlozi_zakona/13_saziv/894-23.pdf", "placeholder": "@link1@"}}	null	t
169	FIPZUD1TNJHLGXZ8	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (RegioEkspres)?	Ministarstvo građevinarstva, saobraćaja i infrastrukture dostavlja informacije o saobraćanju RegioEkspres vozova i stanicama na kojima se zaustavlja. Stanice na kojima se Regio Ekspres zaustavlja su Beograd Centar, Novi Beograd, Batajnica, Nova Pazova, Stara Pazova, Inđija, Beška, Sremski Karlovci i Novi Sad. Za više informacija posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/", "type": "url", "title": "https://srbijavoz.rs/", "placeholder": "@LINK1@"}}	null	t
170	JWQNSGXRUADHMTR9	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li se i kada planira ponovno uspostavljanje železničkih linija koje su ukinute u proteklom periodu?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Srbija Voz a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor.	null	null	t
173	T4YUWAZMX6KVPXRF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Regulisanje železničkog saobraćaja na putnim prelazima?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Infrastruktura železnice Srbije a.d. proverava koji su razlozi ovog problema i molba i u skladu sa tim dostavlja odgovor svaka predstavka se odnosi na drugačiji putni prelaz i samim tim odgovori nisu generisani.	null	null	t
168	CAJNJ49ASJNCR3AE	2023-06-27 18:39:50	2023-06-28 19:28:36	\N	6	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Infrastruktura železnice Srbije a.d. dostavljamo odgovor pitanja se odnose na različite projekte i to najčešće u vezi početka realizacije projekata.	null	null	f
172	ZHXTT8K29GOZULO0	2023-06-27 18:39:50	2023-06-28 19:29:04	\N	6	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa nadležnim organom dostavlja informacije koje stranka/firma traže svaki zahtev je potpuno različit i uvek se odnosi na različite parcele.	null	null	f
174	FXJXYTGL4NUW0LXB	2023-06-27 18:39:50	2023-06-28 19:29:46	\N	6	Koji je maksimalan iznos koji može biti dodeljen jednom privrednom društvu koje ispunjava uslove u skladu sa konkursom za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?	Maksimalan iznos koji može biti dodeljen jednom privrednom društvu u okviru konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta iznosi 20.000.000,00 dinara.	null	null	f
178	OSSXCMF6IYK6TQUN	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kada je planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd – Bar za prevoz praćenih automobila?	Planiran početak saobraćaja vozova u letnjoj sezoni na relaciji Beograd Bar za prevoz praćenih automobila se očekuje tokom juna tekuće godine, a detaljne informacije se mogu pronaći na zvaničnom sajtu Srbija Voz a.d. **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/", "type": "url", "title": "https://srbijavoz.rs/", "placeholder": "@LINK1@"}}	null	t
184	XZ6EKPLEKEI09PZB	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (Regio vozovi)?	Ministarstvo građevinarstva, saobraćaja i infrastrukture dostavlja informacije o saobraćanju RegioEkspres vozova i stanicama na kojima se zaustavlja. Stanice na kojima se Regio Ekspres zaustavlja su Beograd Centar, Novi Beograd, Tošin Bunar, Zemun, Zemun Polje, Batajnica, Nova Pazova, Stara Pazova, Inđija, Beška, Sremski Karlovci, Petrovaradin i Novi Sad. Za više informacija posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/informacije/", "type": "url", "title": "https://srbijavoz.rs/informacije/", "placeholder": "@LINK1@"}}	null	t
185	ZQW1EYDKOR1YM0XX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Informacije vezane za saobraćaj vozova na liniji Beograd Centar – Novi Sad (SOKO)?	Ministarstvo građevinarstva, saobraćaja i infrastrukture dostavlja informacije o saobraćanju voza Soko i stanicama na kojima se zaustavlja. Stanice na kojima se Soko zaustavlja su Beograd Centar, Novi Beograd i Novi Sad. Za više informacija posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/informacije/", "type": "url", "title": "https://srbijavoz.rs/informacije/", "placeholder": "@LINK1@"}}	null	t
186	N2AON33DWULSXSAL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Koji privredni subjekti mogu konkurisati za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?	Privredni subjekti koji konkurišu za dodelu stimulativnih sredstava moraju da imaju šifru delatnosti koja se dodeljuje privrednim subjektima preko koga se realizuje kombinovani transport u skladu sa članom 104. Zakona o železnici **@LINK1@** Službeni Glasnik RS, broj 41/18, odnosno to mogu biti Vlasnici i upravljači terminala za kombinovani transport; Operateri za železnički i drumski transport; Operateri kombinovanog transporta; Upravljači železničke infrastrukture i špedicije.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-zeleznici-0", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-zeleznici-0", "placeholder": "@LINK1@"}}	null	t
187	A93VJJPB1NS0E2ES	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Koja je cena vozne karte i prevoza automobila na relaciji Zemun – Bar?	Cena vozne karte za jedan smer po osobi iznosi 21.00. Cena prevoza praćenog automobila/motocikla/skutera od Zemuna do Bara iznosi 30 . Obavezan uslov za prevoz automobila je da isti budu visine do 1,55 m. Za dodadtne informacije posetite sajt Srbijavoz a.d.d. **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/informacije/", "type": "url", "title": "https://srbijavoz.rs/informacije/", "placeholder": "@LINK1@"}}	null	t
201	3MVFLD5Y6CJI5UIQ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Ko je nadležan za obezbeđenje saobraćaja na putnim prelazima preko pruge (postavljanje branika, saobraćajnih znakova na putu, itd.)?	Za unapređenje bezbednosti saobraćaja na putnim prelazima je odgovorna Infrastruktura železnice Srbije a.d. i upravljač puta JP Putevi Srbije ili jedinica lokalne samouprave u zavisnosti od ranga puta sa kojim se ukršta pruga.	null	null	t
176	VGYYWR00JDFPMKPX	2023-06-27 18:39:50	2023-06-28 19:30:11	\N	6	Informacije vezane za projekte koji su trenutno u realizaciji?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Infrastruktura železnice Srbije a.d. dostavljamo odgovor pitanja se odnose na različite projekte, kao i na različite segmente projekata, a samim tim odgovori nisu generisani.	null	null	f
179	0MJSXFOOB5UCZDEZ	2023-06-27 18:39:50	2023-06-28 19:38:21	\N	6	Da li se u narednom periodu planira ponovno uspostavljanje železničkih linija koje su ukinute?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Srbija Voz a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor svaka železnička linija ima drugačiji razlog, a samim tim i odgovor.	null	null	f
180	PQ5O7KR4T1QTNBF0	2023-06-27 18:39:50	2023-06-28 19:40:21	\N	6	Problemi i informacije o predstojećim i trenutnim eksproprijacijama?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa nadležnim organom dostavlja informacije koje stranka/firma traže svaki zahtev je potpuno različit i uvek se odnosi na različite parcele.	null	null	f
181	L4ICFK32XRCYFVJS	2023-06-27 18:39:50	2023-06-28 19:40:34	\N	6	Regulisanje železničkog saobraćaja na putnim prelazima?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Infrastruktura železnice Srbije a.d. proverava koji su razlozi ovog problema i molba i u skladu sa tim dostavlja odgovor svaka predstavka se odnosi na drugačiji putni prelaz i samim tim odgovori nisu generisani.	null	null	f
182	LEUM2GAPIV0D8TUJ	2023-06-27 18:39:50	2023-06-28 19:41:22	\N	6	Informacije vezane za projekte čija se realizacija očekuje u narednom periodu?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Infrastruktura železnice Srbije a.d. dostavlja odgovor pitanja se odnose na različite projekte i to najčešće u vezi početka realizacije projekata.	null	null	f
183	KGE11RNKKE5MTH8O	2023-06-27 18:39:50	2023-06-28 19:43:17	\N	6	Poteškoće kupovine karata za putovanje vozom preko aplikacije i sajta preduzeća „Srbija Voz“ a.d?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Srbija Voz a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor uglavnom problemi su pad sistema, neposedovanje platnih kartica, slabo poznavanje korišćenja noovih aplikacija na pametnim telefonima, itd..	null	null	f
188	KLWSKSLWYBKPZO2I	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Zašto vozovi pri ulasku u naseljeno mesto koriste sirenu? 	Poštovani, Imajući u vidu činjenicu da je funkcionisanje železničkog saobraćaja strogo definisano pravilnicima i propisima, bezbednost svih učesnika u saobraćaju je svakako primarna i prioritetna. Zvučna signalizacija je neophodna, a naročito tokom noći i u uslovima smanjene vidljivosti i ima svoju nezamenjivu funkciju u predupređivanju eventualnih nesreća i nezgoda. S obzirom da se Vaša žalba odnosi na zvučnu signalizaciju, ona je striktno regulisana Saobraćajnim i Signalnim pravilnikom, kojima je mašinovođi, propisan način postupanja, tj. obaveza da najavljuje zvučnim signalom približavanje voza naseljenom mestu, putnom prelazu, tunelu, mostu i sl. Svako drugačije postupanje bi bilo neregularno i nepropisno, mašinovođa bi snosio posledice, a bezbednost svih učesnika u saobraćaju bi bila ugrožena. Dakle, zvučna signalizacija je neophodna i mašinovođa je u obavezi da daje signalni znak 67 PAZI, shodno članu 160 važećeg Signalnog pravilnika i MORA da poštuje odredbe pomenutog pravilnika. Što se konkretno mašinovođa zaposlenih u Srbija Kargo a.d. tiče, oni se striktno pridržavaju Signalnog Pravilnika, baš kako ne bi došlo do eventualne zloupotrebe propisa i proizvođenja nepotrebne dodatne buke.	null	null	t
189	XOXLZ85RHDJSVNAV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li će biti zapošljavanja u kompaniji Srbija Voz?	Akcionarsko društvo Srbija Voz je u skladu sa programom poslovanja planira zapošljavanje 150 ljudi za 2023. godinu i to različitih obrazovnih profila. Sve informacije možete pratiti na sajtu Srbija Voza u delu koji se tiče karijere **@LINK1@****@LINK2@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs", "type": "url", "title": "https://srbijavoz.rs", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://srbijavoz.rs/", "type": "url", "title": "https://srbijavoz.rs/", "placeholder": "@LINK2@"}}	null	t
190	IZCCRI8SIM2QKP1B	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li planirate nova ulaganja u vozove?	Da, očekujemo novih 18 Štadler Flirtova koji su u planu da budu kao Regio Ekspres i u toku je postupak pripreme tehničke specifikacije za nabavku Kineskih vozova za 200km na sat.	null	null	t
191	FVUXCAA2OQEVQNNH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li će biti dodatnih polazaka vozova za Novi Sad u toku „Exit“ festivala?	Da, obezbeđene su dodatne linije na relaciji Novi Sad Beograd u toku trajanja Egzit festivala. Red vožnje možete pogledati na **@LINK1@**.	{"0": {"auto": true, "path": "https://w3.srbvoz.rs/redvoznje", "type": "url", "title": "https://w3.srbvoz.rs/redvoznje", "placeholder": "@LINK1@"}}	null	t
192	62NO3YXNKHYJAN5N	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kako može da se kontaktira neka od službi kompanije Srbija Voz?	Kontakt podaci su dostupni na sajtu Srbija Voz **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/kontakt", "type": "url", "title": "https://srbijavoz.rs/kontakt", "placeholder": "@LINK1@"}}	null	t
193	IEJF7FLOQ8HZZBB5	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kako može da se pošalje prijava za posao u kompaniji Srbija Voz?	Vašu prijavu za posao možete naći i poslati preko sajta Srbija Voza u delu Karijera **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/karijera/", "type": "url", "title": "https://srbijavoz.rs/karijera/", "placeholder": "@LINK1@"}}	null	t
194	5AYCJOVYQZXYIQUG	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li Srbija Voz ima turističke ponude vozom Nostalgija i Šarganska osmica?	Da, sve ponude možete videti na zvaničnoj veb stranici kompanije kao i preko Bukinga kako za individualne, tako i za grupne izlete i putovanja. **@LINK1@****@LINK2@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs", "type": "url", "title": "https://srbijavoz.rs", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://srbijavoz.rs/", "type": "url", "title": "https://srbijavoz.rs/", "placeholder": "@LINK2@"}}	null	t
195	ZWYPFFHHONCHRZ8S	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li žene rade kao mašinovođe u kompaniji Srbija Voz?	Da, ponosni smo sa udelom ženske populacije u kompanij Srbija Voz, kako među mašinovođama, tako i među drugim zanimanjima. Prema statističkim podacima vezanim za rodnu ravnopravnost među Evropskim železnicama, Srbija Voz je u samom vrhu po broju zaposlenih žena.	null	null	t
196	477JFVYKU8D9R0ZS	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li postoje popusti i posebne ponude za grupna putovanja vozom?	Srbija Voz poklanja veliku pažnju za stalne korisnike naših usluga i omogućene su brojne povlastice. Više informacija na **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/ponude/#gp", "type": "url", "title": "https://srbijavoz.rs/ponude/#gp", "placeholder": "@LINK1@"}}	null	t
197	WV2PDF7QL2KKMD2I	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li postoji internet kupovina voznih karata?	Da, postoji aplikacija putem koje možete da izvršite kupovinu vaših karata **@LINK1@**.	{"0": {"auto": true, "path": "https://webapi1.srbvoz.rs/ekarta/app/#!/home", "type": "url", "title": "https://webapi1.srbvoz.rs/ekarta/app/#!/home", "placeholder": "@LINK1@"}}	null	t
198	OJ0UIGHSCY4OQUQ9	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Potrebne su mi infromacije o SRB plus kartici?	SRB Plus kartice za mlade do 26 godina iznosi 400.00 rsd i važi godinu dana od datuma izdavanja. Mogu je kupiti državljani Republike Srbije i državljani stranih zemalja sa stalnim boravkom u Srbiji. Kartica omogućava kupovinu mesečnih karata na željenoj relaciji kao i popust od 30 na redovnu cenu za kupovinu voznih karata u unutrašnjem saobraćaju putničke, brze vozove. SRB Plus karticu možete kupiti na blagajnama sledećih stanica Beograd Centar, Novi Beograd, Kraljevo, Užice, Priboj, Valjevo, Niš, Zaječar, Aleksinac, Jagodina, Palanka, Požarevac, Vršac, Pančevo varoš , Zrenjanin, Stara Pazova, Inđija, Ruma, Novi Sad, Sombor i Subotica.. i istu odah dobijate. Celokupnu ponudu možete pogledati na **@LINK1@**.	{"0": {"auto": true, "path": "https://srbijavoz.rs/ponude/", "type": "url", "title": "https://srbijavoz.rs/ponude/", "placeholder": "@LINK1@"}}	null	t
199	6YYFJVWUKPPZXUDE	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Koje je radno vreme Železničkog muzeja?	Radno vreme Železničkog muzeja je od ponedeljka do petka od 8 do 16 časova. Ulaz u Muzej je slobodan. Više informacija na **@LINK1@**.	{"0": {"auto": true, "path": "https://www.zeleznicesrbije.com/zeleznicki-muzej/", "type": "url", "title": "https://www.zeleznicesrbije.com/zeleznicki-muzej/", "placeholder": "@LINK1@"}}	null	t
200	ODTCSMNUBPC4FXKJ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da je potrebno najaviti grupne posete za Železnički muzej?	Grupne posete se najavljuju i zakazuju dandva unapred. Za grupe je obezbeđen obilazak stalne postavke uz vođenje iskusnog kustosa Zakažite vašu posetu na 0113610334 ili na **@EMAIL1@****@EMAIL2@**.	{"0": {"auto": true, "path": "mailto:muzej@srbrail.rsma", "type": "mail", "title": "muzej@srbrail.rsma", "placeholder": "@EMAIL1@"}, "1": {"auto": true, "path": "mailto:iltomuzej@srbrail.rs", "type": "mail", "title": "iltomuzej@srbrail.rs", "placeholder": "@EMAIL2@"}}	null	t
202	QGEF4MES9JLHIYGU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Ko je odgovoran za održavanje potrebne zone preglednosti na putnim prelazima preko pruge?	Za održavanje potrebne zone preglednosti na putnim prelazima odnosno za čišćenje drveća i drugog rastinja u ovom pojasu su odgovorni zajedno upravljač železničke infrastrukture Infrastruktura železnice Srbije a.d. i upravljač puta JP Putevi Srbije ili jedinica lokalne samouprave u zavisnosti od ranga puta sa kojim se ukršta pruga.	null	null	t
203	KVEVZOXDIZLFY53W	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Na koji način se obezbeđuju putni prelazi na prugama za velike brzine?	Na prugama za brzine preko 160 km/h ne sme da bude ukrštanja pruge i puta u nivou, tako da na ovim deonicama pruge nema putnih prelaza u nivou, već su svi denivelisani, odnosno na mestima ovih ukrštaja su izgrađeni nadvožnjaci ili podvožnjaci.	null	null	t
204	ORKRS8HN4DZYENNH	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Ko je nadležan za otvaranje novih i zatvaranje postojećih putnih prelaza?	Ministarstvo građevinarstva, saobraćaja i infrastrukture donosi Rešenje o otvaranju novih i zatvaranju postojećih putnih prelaza, uz prethodno pribavljeno mišljenje i saglasnost upravljača železničke infrastrukture i upravljača puta, a na osnovu inicijative fizičkog ili pravnog lica.	null	null	t
205	C5KRAOFUCGCDWD5R	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kome se može prijaviti neispravan rad uređaja na putnom prelazu?	Svaki uočeni kvar na uređaju na putnom prelazu se može prijaviti Infrastruktura železnice Srbije a.d. ili Ministarstvu građevinarstva, saobraćaja i infrastrukture koje će u koordinaciji sa Infrastruktura železnice Srbije a.d. uložiti dodatne napore da se predmetni kvar otkloni.Kontakt **@LINK1@** i **@LINK3@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/contacts", "type": "url", "title": "https://www.mgsi.gov.rs/cir/contacts", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://infrazs.rs/kontakt-2/", "type": "url", "title": "https://infrazs.rs/kontakt-2/", "placeholder": "@LINK3@"}}	null	t
206	VRQAWUX3JT6QZIW2	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li su vozači drumskih vozila dužni da se zaustave ispred putnog prelaza?	Vozači drumskim vozila su dužni da se zaustave ispred svakog putnog prelaza bez obzira na mere osiguranja koje su primenjene na tom putnom prelazi i da nastave dalju vožnju tek nakon što se uvere da ni iz jednog smera ne nailazi voz.	null	null	t
207	WEUZBVOKL0XTS1YL	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kako se treba ponašati u neposrednoj blizini kontaktne mreže?	Imajući u vidu da je napon u kontaktnoj mreži 25 kV, nije dozvoljeno kretati se u neposrednoj blizini kontaktne mreže niti bilo kojim delom tela ili predmetom dodirivati bilo koji od elemenata kontaktne mreže. Kretanje je dozvoljeno isključivo na bezbednoj udaljenosti i pod strogo konrolisanim i posebnim uslovima, kao i pod stalnim nadzorom odgovornih radnika.	null	null	t
208	PHG7RFNOIKDKA0CF	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li je dozvoljeno kretanje po otvorenoj pruzi?	Kretanje po otvorenoj pruzi je strogo zabranjeno i kažnjivo prema zakonskim propisima kojima se reguliše bezbednost železničkog saobraćaja.	null	null	t
209	0JLGSO4AGBTDL70N	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Na kojim mestima i pod kojim uslovima je dozvoljen prelazak pruge?	Prelazak pruge je dozvonjen samo i isključivo na za to obeleženim i osiguranim mestima, kao što su putni prelazi, nadvožnjaci, podvožnjaci, pešački mostovi, pothodnici, itd. Na svim ostalim mestima koja nisu propisno obeležena i osigurana je strogo zabranjen prelazak preko pruge.	null	null	t
210	91YZ94FBI89WK1D1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Ko je odgovoran za bezbedno i nesmetano odvijanje železničkog saobraćaja?	Za bezbedno i nesmetano odvijanje železničkog saobraćaja su odgovorni upravljač železničke infrastrukture i železnički prevoznik koji direktno učestvuju u odvijanju železničkog saobraćaja, ali i svi ostali učesnici u železničkom, ali i u drumskom saobraćaju pre svega na putnim prelazima, koji indirektno učestvuju u odvijanju železničkog saobraćaja.	null	null	t
211	7DE51UZSUGYUDH8Y	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kada će biti izgradjena brza pruga do Nisa?	Vremenski horizont za izgradnju brze pruge Beograd Niš je 2028. godina.	null	null	t
212	LJBIUG9BS6RXGYSZ	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kada će biti završeni radovi na izgradnji železničke stanice Beograd Centar u Prokopu?	Nova stanična zgrada Beograd Centar u Prokopu biće završena 20. oktobra 2023. godine. Radovi na izgradnji nove stanične zgrade počeli su početkom avgusta 2022. godine. Nova železnička stanica u Beograd Centru biće izgrađena oko 5.600 kvadratnih metara, u potpunosti za potrebe prijema i otpreme putnika. Projektovano je 10 koloseka i 6 perona i planirano je da se formiraju potrebni stanični i komercijalni kapaciteti i sadržaji. Ona će zadovoljiti sve najviše standarde u putničkom železničkom saobraćaju. Peronski deo biće povezan sa staničnom zgradom, biće postavljeni liftovi, eskalatori i konvejeri, a putnici će dobiti nove čekaonice, blagajne i druge sadržaje neophodne za funkcionisanje putničkog saobraćaja.	null	null	t
213	R6NHUOHVVMKATQEX	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kada će biti rekonstruisana barska pruga?	Jedan od značajnijih projekata modernizacija pruga u Srbiji je i rekonstrukcija deonice Valjevo Vrbnica granica sa Crnom Gorom, u dužini od 209,8 kilometara. Reč je o deonici na međunarodnoj železničkoj magistrali Beograd Bar, između Srbije i Crne Gore, koja je puštena u saobraćaj 1976. godine. Projektom je predviđena rekonstrukcija i modernizacija ove magistralne, elektrificirane pruge Valjevo Vrbnica granica sa Crnom Gorom. Projektovanje je završeno krajem 2022. godine. Vrednost ugovora za projektovanje iznosila je 20,9 miliona evra, a finansiranje je bilo obezbeđeno iz novog ruskog kredita. Urađen je Idejni projekat i Studija o proceni uticaja na životnu sredinu. Rekonstrukcija i modernizacija ovog dela barske pruge obuhvata sedam deonica pruge, a izgradnja se planira u dve faze za svaku deonicu. Procenjuje se da je vrednost projekta oko 980 miliona evra. Početak radova i realizacija projekta zavise od obezbeđivanja finansijskih sredstava. U proteklom periodu, Infrastruktura železnice Srbije sklopila je ugovor sa izvođačem radova za rekonstrukciju Stojanovog mosta, na deonici Zlatibor Priboj.	null	null	t
214	XIAC9N5FOA72GBJV	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Kada se može očekivati rekonstrukcija pruge Beograd – Šid?	U toku je priprema tehničke dokumentacije za ovaj projekat. Trenutno se radi idejni projekta sa Studijom opravdanosti i Studijom o proceni uticaja na životnu sredinu. Kompletna projektna dokumentacija će biti gotova do kraja 2023. godine, nakon čega će se znati tačna vrednost radova i shodno obezbeđenju sredstava moći će da se pristupi rekonstrukciji pruge.	null	null	t
241	ZVNMEV8YEJ1XHDZ7	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Gde se mogu postavljati plutajući objekti i privezišta za čamce?	Na mestima i pod uslovima koje je odredila nadležna lokalna samouprava Planom postavljanja i Odlukom za korišćenje obale i vodnog prostora. Za dodatne informacije nazovite Odsek za inspekcijske poslove bezbednosti plovidbe, 011/2600964.	null	null	t
215	G55WESTYHX8DUDUU	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Koliko je neobezbeđenih putnih prelaza u Srbiji?	Na srpskim prugama postoji ukupno 2.118 putnih prelaza i svi su obezbeđeni. Iako je duboko u svesti ljudi shvatanje da je obezbeđen samo onaj putni prelaz koji ima rampu nije tako. Svi putni prelazi su na prugama Infrastrukture železnice Srbije su obezbeđeni. Ne postoje neobezbeđeni putni prelazi. Ukoliko na putnom prelazu nema signalnosigurnosne opreme branici, polubranici, zvučna i svetlosna signalizacija, ni znakova vertikalne drumske Andrejin krst, znak Stop, onda se i ne radi o regularnom, već o divljem, nepropisnom i neregularnom prelazu preko pruge, koji ne predstavlja putni prelaz.	null	null	t
216	3DOUCUR3XCJ4JJK2	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Koliko kilometara pruga postoji u Srbiji?	U Srbiji imamo ukupno oko 3.400 kilometara pruga, od kojih je elektrificirano oko 1.300 kilometara. Dvokolosečno je 288 kilometara pruga.	null	null	t
217	WZTDULNSWOOZM76H	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Da li je bezbednost saobraćaja ugrožena kada ne rade rampe na putnom prelazu?	Bezbednost saobraćaja u situacijama kada je uređaj putnog prelaza u kvaru nije ugrožena. Iako u očima javnosti veliku opasnost stvara situacija da su rampe podignute dok voz prolazi, u takvim slučajevima propisane su procedure koje železničko osoblje striktno poštuje, uz pojačan oprez i odgovarajuću signalizaciju. U skladu sa tim, železnička kompozicija se na ovim mestima zaustavlja pre putnog prelaza, zatim zvučnim signalom upozorava na nailazak voza i tek kada se mašinovođe uvere da na pruzi nema drumskih vozila i drugih učesnika u saobraćaju i da ne postoji mogućnost ugrožavanja ljudskih života, sa posebnom opreznošću prelaze preko putnog prelaza.	null	null	t
218	VH4KI7C7JCGP8VS5	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Koliko košta postavljanje rampi na putnom prelazu?	Izgradnja signalnog uređaja na putnom prelazu u blizini posednutog železničkog službenog mesta gde uređajem rukuje železnički radnik iz stanice iznosi oko 200.000 evra, a izgradnja novog uređaja na putnom prelazu na otvorenoj pruzi zavisi od nivoa tehničke opremljenosti pruge i iznosi od oko 250.000 pa i do 300.000 evra. Cena opremanja elektronskog putnog prelaza zavisi od složenosti saobraćajne situacije, a obuhvata projektovanje, građevinske radove, nabavku savremene opreme i njeno postavljanje.	null	null	t
219	TDIKR3BFQR00NM8T	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Šta je najčešći uzrok nesreća na putnim prelazima?	Najčešći uzrok saobraćajnih nesreća na putnim prelazima je nepoštovanje saobraćajne signalizacije, propisa i pravila. Šinsko vozilo uvek ima prednost u odnosu na drumski saobraćaj na putnim prelazima, bez obzira na rang puta, što je propisano i zakonom. Vozači često zaboravljaju da je zaustavni put železničke kompozicije između 700 i 1000 metara i da koliko god voz izgleda daleko nije moguća trenutna reakcija.	null	null	t
220	PNXDW1GAEDE0LNL1	2023-06-27 18:39:50	2023-06-27 18:39:50	\N	6	Zašto voz isklizne iz šina?	Uzroci iskliznuća teretnih vagona mogu biti brojni prekoračenje brzine, odgovornost izvršnog osoblja koje učestvuje u organizaciji i funkcionisanju saobraćaja, pretovarenost vagona odnosno cisterni, sastav teretne železničke kompozicije, tehnička mana ili neispravnost teretnih vagona odnosno cisterni, stanje železničke infrastrukture, ali i dejstvo više ovih faktora od kojih ni jedan pojedinačno ne bi doveo do iskliznuća. Uzrok iskliznuća, i na osnovu toga odgovornost, za svaki slučaj pojedinačno utvrđuje zajednička železnička komisija. Procedura utvrđivanja uzroka iskliznuća vagona, kao i rad zajedničkih železničkih komisija strogo su definisani, pa samim tim i utvrđivanje odgovornosti za svaki pojedinačni slučaj.	null	null	t
221	DMG7ERRHGILLKSLH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	6	Koliko ljudi godišnje strada od udara kontaktne mreže?	Svake godine prosečno strada četiri do pet, uglavnom mladih osoba, od posledica strujnog udara iz kontaktne mreže, koja se nalazi iznad železničke pruge. Ovakve nesreće uglavnom nastaju prilikom penjanja na vagone. Kroz kontaktnu mrežu prolazi struja jačine 25.000 volti, tako da bi došlo do strujnog udara nije neophodno da se dodirnu vodovi, već je dovoljno samo da se uđe u strujno kolo koje može da bude udaljeno i nekoliko metara od kablova.	null	null	t
222	SBWJHNFIQQV3BMQQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	6	Koliko osoba godišnje strada na putnim prelazima?	U proteklih 8 godina na srpskim prugama godišnje pogine 19, a bude povređeno 9 osoba, od udara voza dok su prelazili prugu na nedozvoljenom mestu, nalazili se na koloseku ili bili nepažljivi u blizini železničkih šina. Apelujemo na građane da ne prelaze preko koloseka na nedozvoljenim mestima i na nepropisan način i da se ne kreću po pruzi, jer to je opasno poživot, zabranjeno, a gotovo po pravilu se završava tragično i neko nastrada.	null	null	t
223	XUGHFIN54UO1VMLC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	6	Koje kampanje sprovodi ministarstvo za bezbednost na pružnim prelazima?	Ministarstvo građevinarstva, saobraćaja I infrastrukture pokrenulo je kampanju podizanja bezbednosti na putnima prelazima pod nazivom ,,Tanka je linija. Cilj ove kampanje je usmerena na podizanje svesti u javnosti I edukacija vozaca I drugih učesnika u saobraćaju o bezbednosti na putnim prelazima u Srbiji.	null	null	t
224	OCBE2G3WAVAJL9HV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	6	Koje su pruge u planu za rekonstrukciju?	Poštovani, na sledećem PDF dokumentu možete da vidite planove za rekonstrukciju, modernizaciju I izgradnju pruga.	null	{"0": {"path": "pruge-u-planu-za-projektovanje.pdf", "type": "pdf"}}	t
225	HWGRMVXXWIQOV3B0	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	6	Koje su pruge modernizovane?	Poštovani, spisak modernizovanih i rekonstruisanih pruga u poslednijh 10 godina možete da vidite na PDF fajlu ispod.	null	{"0": {"path": "rekonstruisane-i-modernizovane-pruge.pdf", "type": "pdf"}}	t
320	77XT7W7UNTJHB3GC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je Aleksandar Vučić?	Aleksandar Vučić je predsednik Republike Srbije. Njegovu biografiju možete da pogledate na @link1@.	{"0": {"path": "https://www.predsednik.rs/predsednik/biografija", "type": "url", "title": "https://www.predsednik.rs/predsednik/biografija", "placeholder": "@link1@"}}	null	t
228	FGH4QUKYS3E7DPWU	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Zašto građevinski inspektor ne proverava upis ili promenu prava nosioca prava na katastarskim parcelama ili objektu u skladu sa zakonom?	Sva pitanja vezana za upis ili promenu prava na katastarskim parcelama ili objektu vrši Republički geodetski zavod Sektor za nadzor i kontrolu. Kontakt adresa Bulevar vojvode Mišića br. 39, Beograd, eposta @email1@, tel @phone1@.	null	null	t
229	XVP1JQAFJUOZ7CR9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kako postupa građevinski inspektor kada na objektu nastanu oštećenja usled izgradnje objekta na susednoj parceli?	Građevinski inspektor preduzima mere u skladu sa ovlašćenjima, ali NE VRŠI procenu štete oštećenog objekta.	null	null	t
230	NWXMWX2J0MUO6ASR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kome mogu da uputim prijavu za taksi prevoz?	Taksi prevoz je u nadležnosti lokalne samouprave na čijoj se teritoriji odvija prevoz i prijavu možete uputiti nadležnoj lokalnoj inspekciji.	null	null	t
231	UCYB7G1DNXDWCFNE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kako građevinska inspekcija odlučuje o prioritetima u pokretanju inspekcijskog nadzora iz svoje nadležnosti?	Građevinski inspektor pokreće postupak inspekcijskog nadzora ceneći podnesak građana kao inicijativu za pokretanje postupka, prvo na objektima na kojima se trenutno izvode građevinski radovi, a zatim i na objektima na kojima je završeno izvođenje građevinskih radova. Ukoliko građevinski inspektor, po prijemu podneska, proceni da je u pitanju neznatan rizik, ne pokreće inspekcijski nadzor. Za dodatne informacije nazovite Odeljenje republičke građevinske inspekcije 011/3122884.	null	null	t
232	Q6CMQ7E6TL2GHIXT	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Koja dokumenta mora imati upravljač čamca u plovidbi?	Važeću plovidbenu dozvolu i dozvolu za upravljanje čamcem. Za dodatne informacije nazovite Odsek za inspekcijske poslove bezbednosti plovidbe 011/2600964.	null	null	t
233	TVNLONV5FJDQZSGR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Koja institucija je nadležna za izgradnju i obnovu postojećih trotoara duž državnog puta?	Odgovor za izgradnju Obzirom na to da se radi o elementu puta koji se gradi za potrebe naselja, potrebno je da se obratite jedinici lokalne samouprave koja je dužna da trotoar izgradi prema članu 84.**@LINK1@** SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6**@LINK2@** . Odgovor za održavanje Obzirom na to da se radi o elementu puta koji je izgrađen za potrebe naselja, potrebno je da se obratite jedinici lokalne samouprave koja je dužna da trotoar održava, prema članu 72. Za više informacija obratite se Odeljenju republičke inspekcije za državne puteve, 011/2609276.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6", "placeholder": "@LINK2@"}}	null	t
234	UZMA2LX5TYGTDJGF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Da li se čamac može registrovati u lučkoj kapetaniji prema mestu držanja čamca?	Ne, čamac se registruje u mesno nadležnoj lučkoj kapetaniji po mestu prebivališta vlasnika čamca. **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "type": "url", "title": "https://www.mgsi.gov.rs/cir/odsek/odeljenje-za-poslove-unutrasnje-plovidbe-lucke-kapetanije", "placeholder": "@LINK1@"}}	null	t
235	YIBJV02JD5OTOZWZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kome da uputim pritužbe na izlivanje otpadnih voda u kanale naseljenih mesta?	Ako ste pritužbu poslali MInistarstvu građevinarstva, saobraćaja i infastrukture, ona će biti prosleđena nadležnoj inspekciji jedinice lokalne samouprave na dalje postupanje. Ovaj problem možete i direktno da uputite inspekciji u Vašoj opštini ili gradu. Za više informacija nazovite Odeljenje republičke komunalne inspekcije 011/2287551.	null	null	t
236	UHZBME8VJAIVQ066	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Da li mogu da vršim javni prevoz putnika vozilom registrovanim za prevoz 8 ili 9 lica?	Može samo u obliku limo servisa definisanim članovima 137a. 137d. Zakona o prevozu putnika u drumskom saobraćaju **@LINK1@**.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/5", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/5", "placeholder": "@LINK1@"}}	null	t
237	OTFWZODLTMWKHTQH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Da li je prevoznik u obavezi da mi izda voznu kartu?	Prevoznik je u obavezi da putniku izda voznu kartu sa svim podacima propisanim Zakonom.	null	null	t
238	2SCXLXELIEP9JK4J	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kome se upućuje pritužba na rad i postupanje profesionalnog upravnika stambene zajednice?	Sve pritužbe se dostavljaju nadležnoj inspekciji jedinice lokalne samouprave na dalje postupanje.	null	null	t
239	KG2I52BBQ22CZZOS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kome da prijavim nerealizovani polazak odredjene linije i kako da nadoknadim štetu?	Prijavu možete u pisanom ili elektronskom obliku podneti republičkoj inspekciji za drumski saobraćaj Odeljenje republičke inspekcije za drumski saobraćaj 011/2135425 ako se radi o međumesnom linijskom prevozu putnika ili nadležnoj lokalnoj inspekciji ako je u pitanju gradski i prigradski prevoz.	null	null	t
240	CQHWO0QMAXQGGQZJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Šta je potrebno za priključivanje na državni put?	Odgovor za izgradnju Izgradnja priključka na državni put je uređena Zakonom o planiranju i izgradnji. Za potrebe dobijanja građevinske dozvole potrebno je izraditi projektnotehničku dokumentaciju od strane ovlašćene organizacije, i pribaviti uslove i rešenje od strane JP Putevi Srbije kao upravljača državnog puta, na osnovu člana 41. Zakona o putevima. Odgovor za prilagođavanje priključka po završenim radovima na državnom putu Uobičajena praksa je da se nakon završetka radova na kolovozu puta pristupi prilagođavanju priključaka na put. Ukoliko Vam je ograničena mogućnost pristupa Vašoj imovini, možete se obratiti izvođaču radova, nadzornom organu JP Putevi Srbije **@LINK1@** ili nadležnom pravosudnom organu.	{"0": {"auto": true, "path": "https://www.putevi-srbije.rs/", "type": "url", "title": "https://www.putevi-srbije.rs/", "placeholder": "@LINK1@"}}	null	t
242	RGSLRV9EUZPZXBLI	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Prijave vezane za odvodnjavanje površinskih voda (zatrpavanje putnih kanala i/ili propusta, ili za nerešeno odvodnjavanje od puta do recipijenta.	Vrši se inspekcijski nadzor, odgovor zavisi od utvrđenog činjeničnog stanja. Odgovor za zatrpavanje putnih kanala i/ili propusta Na osnovu Vaše predstavke je izvršen inspekcijski nadzor. Upravljaču puta ili Licu koje je izvršilo zatrpavanje je dat nalog za čišćenje zatrpanog putnog kanala/propusta. Odgovor za nerešeno odvodnjavanje od puta do recipijenta Na osnovu člana 46. Zakona o putevima **@LINK1@**, sused javnog puta dužan je da omogući slobodno oticanje vode, postavljanje snegobrana i odlaganje snega sa javnog puta na njegovo zemljište uz naknadu, koja ne može biti niža od tržišne, zbog ograničenja prava imovine na zemljištu, odnosno naknadu prouzrokovane štete. Potrebno je da se obratite JP Putevi Srbije, kao upravljaču puta, sa ciljem uređenja međusobnih odnosa u skladu sa navedenim članom Zakona, ili nadležnom pravosudnom organu.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/6", "placeholder": "@LINK1@"}}	null	t
243	EDYOBMJ5QOFMDXBZ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Zašto građevinska inspekcija neće da izvrši rešenje kojim se nalaže uklanjanje bespravno izgrađenog objekta ili dela objekta?	Građevinska inspekcija neizvršava rešenja koja je doneo građevinski inspektor. Navedena rešenja izvršava ministarstvo,autonomna pokrajina AP ili jedinica lokalne samouprave JLS u čijem se sastavu nalazi građevinska inspekcija. Izvršenje rešenja je izvorna nadležnost autonomne pokrajine AP ili jedinice lokalne samouprave JLS i ne spada u poverene poslove. Za dodatne informacije nazovite 011/2138311, imejl **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:inspekcija@mgsi.gov.rs", "type": "mail", "title": "inspekcija@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
244	JCZQTPSAD8GP0RMB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kome se upućuje zahtev za postavljanje saobraćajne signalizacije i bezbednosne saobraćajne opreme na putu?	Vrši se inspekcijski nadzor, odgovor zavisi od utvrđenog činjeničnog stanja. Pozitivan odgovor Na osnovu Vaše predstavke je izvršen inspekcijski nadzor. Utvrđeno je da je bezbednost saobraćaja ugrožena i upravljaču puta dat nalog za dopunu/obnovu/postavljanje dodatne saobraćajne signalizacije i putne opreme, kao i nalog za izmenu projekta saobraćajne signalizacije na predmetnoj deonici putapo potrebi. Negativan odgovor Na osnovu Vaše predstavke je izvršen inspekcijski nadzor. Izvršena je kontrola projektne dokumentacije i postavljene signalizacije i opreme na terenu. Nisu utvrđeni nedostaci. Bezbednost saobraćaja nije ugrožena. Nema osnova za dalje postupanje. Za više informacija obratite se Odeljenju republičke inspekcije za državne puteve, 011/2609276.	null	null	t
245	ADXFSECSDAQEENA1	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Da li naša inspekcija izdaje rešenje za obavljanje limo servisa i koje uslove treba da ispuni privredno društvo ili preduzetnik?	Rešenje za obavljanje limo servisa izdaje jedinica lokalne samouprave na kojoj se nalazi sedište pravnog lica ili preduzetnika, a uslovi su propisani članovima 137a. 137d. Zakona o prevozu putnika u drumskom saobraćaju **@LINK1@**.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/5", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2018/41/5", "placeholder": "@LINK1@"}}	null	t
246	8C7AF4HSLLLD4R5T	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Kako da prijavim korupciju?	Poštovani, borba protiv korupcije je jedan od prioriteta Ministarstva građevinarstva, saobraćaja i infrastrukture. Korupciju možete da prijavite na mejl @link1@; Vašu predstavku prosledićemo nadležnim institucijama i obavestićemo Vas u što kraćem roku o njenom statusu.	{"0": {"path": "kabinet@mgsi.gov.rs", "type": "mail", "title": "kabinet@mgsi.gov.rs", "placeholder": "@link1@"}}	null	t
247	XEDADTPDNKNS7GP8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	7	Koji je kontakt Inspekcije ministrastva?	Broj telefona Inspekcije je @link1@, a email adresa je @link2@.	{"0": {"path": "+381112138311", "type": "tel", "title": "+381 (0) 11 213 83 11", "placeholder": "@link1@"}, "1": {"path": "inspekcija@mgsi.gov.rs", "type": "mail", "title": "inspekcija@mgsi.gov.rs", "placeholder": "@link2@"}}	null	t
248	WJRIKDJBTE1DPKFO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Zašto se ne može ostvariti javni uvid u planske dokumente, van radnog vremena nosioca izrade planskog dokumenta, odnosno zašto to nije moguće i vikendom?	Uvid u planske dokumente se odvija u zvaničnim sedištima organa uprave, odnosno organa autonomne pokrajine i organima jedinice lokalne samouprave, odnosno nosioca izrade planskih dokumenata, tako da su po pravilu vezani za radno vreme ovih organa. Ovo nije materija Zakona o planiranju i izgradnji i propisa donetih na osnovu ovog zakona, tako da se radno vreme navedenih institucija moze prilagoditi u skladu sa potrebama stanovništva, odnosno korisnika njihovih usluga. Javni uvid u elektronskom obliku može se ostvariti od 0024 časova sedam dana u nedelji na zvaničnim internet stranicama nosilaca izrade planskih dokumenata.	null	null	t
249	FEOUIY9BRCMUS16B	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Da li može planskim dokumentom da se ubrza postupak eksproprijacije?	Ne. Postupak utvrđivanja javnog interesa je utvrđen zakonom i drugim propisima kojim se uređuje eksproprijacija. Planskim dokumentom se mogu uvrditi prioritetna planska rešenja, kao i faznost i etapnost sprovođenja plana.	null	null	t
250	SPBLRA3QQQVUMJZ8	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Zašto se planovi pišu „previše stručnom terminologijom“, tako da zainteresovana javnost „ne može potpuno da razume planska resenja“?	Planski dokumenti se rade na osnovu Zakona o planiranju i izgradnji i propisa donetih na osnovu ovog zakona. Pravilnikom o sadržini, načinu i postupku izrade plasnkih dokumenata propisana je sadržina planskih dokumenata. Planovi se rade na osnovu odgovarajućih istraživanja, koje se sprovode na osnovu opstih naučnih metoda indukcija, dedukcija, analiza, sinteza, statistički i komparativni metod, istorijski metod i kartografske metode. Maksimalno su pojednostavljeni, a svaka lokacija nosi određene specifikume i zavise od autorske arhitekture, koje nisu predmet planskih dokumenata.	null	null	t
252	DBT4SYOSWBIMJD0O	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Da li može planskim dokumentom da se propiše visina eksproprijacije za nepokretnosti?	Ne. Utvrdjivanje visine eksproprijacije utvrdjuje lokalna poreska administracija na osnovu prosečne vrednosti prometa na nepokretnosima.	null	null	t
253	ACA3FWHNUCNNWA8D	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Podnošenje zahteva fizičkih lica za priznavanje „stranke u postupku“ u smislu Zakona o opštem upravnom postupku, u toku izrade planskih dokumenata.	Priprema, koordinacija i praćenje izrade planskih dokumenata je vanupravni postupak, na koji se ne primenjuju zakoni i propisi kojim je uređen opšti upravni postupak. U toku pripreme, koordinacije i praćenja izrade planskih dokumenata ne vodi se upravni postupak, ne izdaju se rešenja, niti drugi upravni akti. Zainteresovana javnost ostvaruje uvid u toku ranog javnog uvida, javnog uvida, kao i u skladu sa zakonom kojim su uređene informacije od javnog značaja.	null	null	t
254	SWRRN6DD4VIT6WNG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Zasto javni uvid u planski dokument ne traje duže nego što je propisano, 15 dana za rani javni uvid, odnosno 30 dana za javni uvid u planski dokument, u smislu da nije propisano da javni uvid ne može duže trajati?	Zakonom o planiranju i izgradnji **@LINK1@** i propisima donetim na osnovu ovog zakona propisana je dužina trajanja ranog javnog uvida i javnog uvida u planske dokumente. U slučaju da postoji velika zainteresovanost javnosti za neki planski dokument, moguće je produžiti trajanje javnog uvida.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "placeholder": "@LINK1@"}}	null	t
255	3SUNMWSAKRSUGT7S	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Da li  informacija o lokaciji predstavlja informaciju od javnog značaja?	Informacija o lokaciji se izdaje u skladu sa Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona i ne predstavljaju informaciju od javnog značaja. Da bi se dobila informacija o lokaciji, odnosno informacija o mogucnostima izgradnje na nekoj katastarskoj parceli, potrebno je podneti zahtev stvarno nadleznom organu, uplatiti takse propisane zakonom i drugim propisima, kao i dostaviti dokaz o izvrsenoj uplati. Dokumenta možete pronaći na linku **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/zahtev-za-izdavanje-informacije-o-lokaciji", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/zahtev-za-izdavanje-informacije-o-lokaciji", "placeholder": "@LINK1@"}}	null	t
256	MPDEBWKWPOXVBA7Q	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Zasto gradjani nisu neposredno obavešteni o održavanju javnog uvida u planski dokument?	Zakonom o planiranju i izgradnji **@LINK1@** i propisima donetim na osnovu ovog zakona propisano je da se javnim oglašavanjem u dnevnom listu za teritoriju Republike Srbije, lokalnom listu, zvaničnoj internet stranici nosioca izrade planskih dokumenata, smatra da je javnost obaveštena. Izuzetak je kada se radi o izradi urbanističkog projekta za potrebe utvrdjivanja javnog interesa, kada se vrši neposredno obaveštavanje sopstvenika nepokretnosti u obuhvatu urbanističkog projekta.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "placeholder": "@LINK1@"}}	null	t
257	F378VLAMXQLNJJI1	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	8	Gde se nalaze planska dokumenta?	Zakonom o planiranju i izgradnji **@LINK1@** i propisima donetim na osnovu ovog zakona, uredjen je način i postupak ostvarivanja javnog uvida u planski dokument. Uvid u planski dokument se ostvaruje u toku izrade planskog dokumenta u toku ranog javnog uvida koji traje 15 dana, kao i u toku javnog uvida koji traje 30 dana. Rani javni uvid organizuje nosilac izrade planskog dokumenta i obavlja se elektronski na zvaničnoj internet stranici nosioca izrade planskog dokumenta. Javni uvid se odvija u sedištu nosioca izrade planskog dokumenta, kao i na teritoriji i obuhvata planski dokument u trajanju od 30 dana. Za prostorne planove se u toku javnog uvida organizuje prezentacija, dok je zakonodavac za urbanističke planove ostavio mogućnost organizacije prezentacije, odnosno prezentacija u toku javnog uvida nije obavezna. Po usvajanju planskog dokumenta, on ima snagu propisa i jednako dejstvo prema svima, tako da su planski dokumenti, kao i svi propisi javno dostupni. Tekstualni deo planskih dokumenata se objavljuje u službenim glasilima, a grafički deo je dostupan na zvaničinim internet stranicama nosioca izrade planskih dokumenata. Zakonom o planiranju i izgradnji i propisima donetim na osnovu ovog zakona propisano je uspostavljanje Centralnog registra planskih dokumenata, koji je uspostavljen kao jedan od servisa Republičkog geodetskog zavoda i nalazi se na internet adresi **@LINK2@** www.crpd.gov.rs.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "type": "url", "title": "https://www.mgsi.gov.rs/lat/dokumenti/zakon-o-planiranju-i-izgradnji", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://www.crpd.gov.rs", "type": "url", "title": "https://www.crpd.gov.rs", "placeholder": "@LINK2@"}}	null	t
258	M4PTFB56O0EM70QA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na priključenje na komunalnu infrastrukturu i vlasništvo vodomera	Zakonom o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11, 104/16 i 95/18 u daljem tekstu Zakon određene su komunalne delatnosti i uređeni opšti uslovi i način njihovog obavljanja. Članom 3. stav 1. tačka 1 propisano je da komunalna delatnost snabdevanje vodom za piće zahvatanje, prečišćavanje, prerada i isporuka vode vodovodnom mrežom do mernog instrumenta potrošača, obuhvatajući i merni instrument. Nadalje, članom 31. Zakona je propisano da glavni merni instrument za merenje potrošnje vode ugrađen na mestu priključenja instalacija korisnika na komunalnu infrastrukturu predstavlja sastavni deo komunalne infrastrukture, kao i da se nabavka ovog mernog instrumenta vrši iz nadoknade za priključak, koju plaća investitor, odnosno vlasnik nepokretnosti. Takođe, napominjemo da Zakon prepoznaje i individualni merni instrument. Individualni merni instrumenti su ugrađeni na instalacijama korisnika, služe merenju potrošnje vode za pojedinačne stanove, odnosno pojedinačne poslovne prostorije, u svojini su vlasnika pojedinačnih stanova, odnosno, vlasnika pojedinačnih poslovnih prostorija i oni snose troškove nabavke, ugradnje, eksploatacije, održavanja i funkcionisanja individualnih mernih instrumenata.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
321	UVXGFFCA37FYL0LB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je Ana Brnabić?	Ana Brnabić je predsednica Vlade Republike Srbije. Njenu biografiju možete da pogledate na @link1@.	{"0": {"path": "https://www.srbija.gov.rs/biografija/184/ana-brnabic.php", "type": "url", "title": "https://www.srbija.gov.rs/biografija/184/ana-brnabic.php", "placeholder": "@link1@"}}	null	t
323	APT8JRGKRB8UCILL	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Gde mogu da vidim rezultate ministarstva?	Najznačajnije rezulate možete da pogledate na izveštaju 100 dana MGSI koji se nalazi na linku @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/sites/default/files/100-dana-MGSI.pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/100-dana-MGSI.pdf", "placeholder": "@link1@"}}	null	t
259	DQJAX2OTTIXIMMJY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na obavljanje komunalnih delatnosti za dve ili više jedinica lokalne samouprave	Članom 10. Zakona o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11, 104/16 i 95/18 u daljem tekstu Zakon propisano je da dve ili više jedinica lokalne samouprave mogu sporazumom urediti zajedničko obavljanje komunalnih delatnosti, osim ako to nije drugačije uređeno drugim posebnim propisom. Nadalje, stav 2. istog člana propisuje da ukoliko utvrde interes za zajedničko obavljanje komunalnih delatnosti, opštinsko, odnosno gradsko veće svake jedinice lokalne samouprave donosi odluku o izradi studije opravdanosti koja sadrži detaljan prikaz zatečenog stanja u toj komunalnoj delatnosti, finansijsku analizu sa predračunom potrebnih ulaganja, izvore finansiranja i prethodnu finansijsku ocenu opravdanosti zajedničkog obavljanja komunalne delatnosti, analizu tržišta za tu komunalnu delatnost, detaljni prikaz ekonomski opravdanih i pravno mogućih modela zajedničkog obavljanja komunalne delatnosti, detaljno obrazloženje predloženog modela zajedničkog obavljanja komunalne delatnosti sa osvrtom na prednosti i nedostatke tog modela u odnosu na druge moguće modele, posebno u odnosu na dotadašnji model obavljanja komunalne delatnosti, očekivane rezultate predloženog modela, kao i preduslove za postizanje tih rezultata, pregled rizika i predloga za njihovo otklanjanje, odnosno predupređivanje. Ako se na osnovu rezultata studije utvrdi opravdanost zajedničkog obavljanja komunalne delatnosti, opštinsko, odnosno gradsko veće podnosi skupštini jedinice lokalne samouprave predlog odluke o načinu obavljanja komunalne delatnosti i predlog sporazuma o zajedničkom obezbeđivanju obavljanja komunalne delatnosti. Sporazum o zajedničkom obavljanju komunalne delatnosti smatra se zaključenim kada ga u istovetnom tekstu usvoje sve skupštine jedinica lokalne samouprave u periodu koji ne može da bude duži od tri meseca od dobijanja predloga.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
260	LTHHJMV4UZQRDWOX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Tumačenje odredaba Posebnog kolektivnog ugovora za javna preduzeća u komunalnoj delatnosti na teritoriji Republike Srbije	Odredbom člana 8. stav 2. Zakona o radu Službeni glasnik RS, br. 24/05, 61/05, 54/09, 32/13, 75/14, 13/17 odluka US, 113/17 i 95/18 autentično tumačenje, propisano je, između ostalog, da se odredbama opšteg akta i ugovorom o radu mogu utvrditi veća prava i povoljniji uslovi rada od prava i uslova utvrđenih zakonom. Poseban kolektivni ugovor za javna preduzeća u komunalnoj delatnosti na teritoriji Republike Srbije Službeni glasnik RS, broj 30/21, u daljem tekstu Poseban kolektivni ugovor, između ostalog, propisuje prava, obaveze i odgovornosti iz radnog odnosa i po osnovu rada i ostala pitanja od značaja za zaposlene i poslodavca, kao i da doprinosi ujednačavanju primene prava, obaveza i odgovornosti zaposlenih i poslodavaca u javnim preduzećima u oblasti komunalnih delatnosti na teritoriji Republike Srbije. Zakon o radu postavio je hijerarhijski odnos između zakona, kolektivnog ugovora na različitim nivoima i pravilnika o radu opšti akti i ugovora o radu, na sledeći način opštim aktom i ugovorom o radu mogu da se utvrde veća prava i povoljniji uslovi rada od prava i uslova utvrđenih zakonom, kao i druga prava koja nisu utvrđena zakonom, osim ako zakonom nije drugačije određeno; opšti akt i ugovor o radu ne mogu da utvrđuju manja prava i nepovoljnije uslove rada od prava i uslova utvrđenih zakonom; ako opšti akt sadrži takve odredbe neposredno se primenjuju odredbe zakona. U ovom slučaju nezakonitost i neustavnost opšteg akta utvrđuje se pred Ustavnim sudom; ugovor o radu kao akt niže pravne snage ne može da utvrđuje manja prava i nepovoljnije uslove rada od prava i uslova koji su utvrđeni zakonom i opštim aktom kolektivnim ugovorom ili pravilnikom o radu; ako ugovor takve odredbe sadrži one su ništave, što se utvrđuje pred nadležnim sudom; u hijerarhiji kolektivnih ugovora koji obavezuju poslodavca kolektivni ugovor kod poslodavca ne sme da sadrži nepovoljnije uslove rada i manja prava od uslova i prava utvrđenih posebnim odnosno opštim kolektivnim ugovorom koji obavezuje poslodavca ako je član udruženja koje je zaključilo kolektivni ugovor više pravne snage ili je doneta odluka o proširenom dejstvu opšteg ili posebnog kolektivnog ugovora. Odredba člana 263. Zakona o radu propisuje da se kolektivni ugovor zaključuje na period do tri godine. Po isteku navedenog roka, kolektivni ugovor prestaje da važi, ako se učesnici kolektivnog ugovora drukčije ne sporazumeju najkasnije 30 dana pre isteka važenja kolektivnog ugovora. Takođe, isti zakon odredbom člana 243. propisuje da se poseban kolektivni ugovor zaključuje za teritoriju jedinice teritorijalne autonomije ili lokalne samouprave, a odredba člana 246. precizira da poseban kolektivni ugovor za javna preduzeća i javne službe zaključuju osnivač, odnosno organ koji on ovlasti, i reprezentativni sindikat. Odredbom člana 254. Zakona o radu propisano je da su učesnici u zaključivanju kolektivnog ugovora dužni da pregovaraju, kao i da ako se u toku pregovora ne postigne saglasnost za zaključivanje kolektivnog ugovora u roku od 45 dana od dana započinjanja pregovora, učesnici mogu da obrazuju arbitražu za rešavanje spornih pitanja. Takođe, za delatnosti od opšteg interesa, sporovi u zaključivanju, izmeni i dopuni i primeni kolektivnih ugovora rešavaju se u skladu sa zakonom. S tim u vezi, ukoliko postoji spor u vezi sa zaključivanjem kolektivnog ugovora, sindikat može da inicira rešavanje ove vrste kolektivnog radnog spora u skladu sa Zakonom o mirnom rešavanju radnih sporova Službeni glasnik RS, br. 125/04 i 104/09, u postupku pred Republičkom agencijom za mirno rešavanje radnih sporova uz učešće miritelja, pod uslovom da strane u sporu prihvate da spor reše na ovaj način. Miritelj bi se u tom slučaju uključio u postupak pregovora radi zaključivanja kolektivnog ugovora, međutim, samo zaključivanje kolektivnog ugovora zavisi od saglasnosti volja ovlašćenih pregovarača da isti zaključe i potpišu. Kolektivni ugovor je kao i svaki drugi ugovor proizvod saglasnosti volja onih koji ga zaključuju. Budući da se do te saglasnosti može doći jedino sporazumevanjem, zakon ne propisuje dužnost zaključivanja kolektivnog ugovora, već dužnost, odnosno obavezu pregovaranja. Kako će proces pregovaranja teći i kako će biti okončan, zavisi od učesnika i njihove uspešnosti pregovaranja. Imajući u vidu dobrovoljnu prirodu kolektivnog ugovora, Zakonom o radu i međunarodnim konvencijama nisu predviđene sankcije za poslodavca koji ne započne postupak pregovaranja za zaključivanje kolektivnog ugovora i ne zaključi kolektivni ugovor, ali u skladu sa članom 3. stav 5 Zakona o radu, poslodavac koji ne prihvati inicijativu reprezentativnog sindikata za pristupanje pregovorima za zaključenje kolektivnog ugovora, ne može pravilnikom o radu da uredi prava i obaveze iz radnog odnosa.	null	null	t
261	NJ0YZLZH7YSVYI5V	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Tumačenje Zakona o komunalnim delatnostima u vezi primene člana 9. u pogledu načina poveravanja komunalnih delatnosti	Odredbama Zakona o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11, 104/16 i 95/18 u daljem tekstu Zakon, propisano je da komunalne delatnosti mogu obavljati javna preduzeća, privredna društva, preduzetnici ili drugi privredni subjekti član 5. stav 1, kao i da se poveravanje obavljanja komunalne delatnosti vrši na osnovu odluke skupštine jedinice lokalne samouprave o načinu obavljanja komunalne delatnosti i ugovora o poveravanju, osim kad se osniva javno preduzeće član 9. stav 3. Takođe, članom 9. stav 1. Zakona propisano je da se pod poveravanjem obavljanja komunalne delatnosti podrazumeva vremenski oročeno ugovorno uređivanje odnosa u vezi sa obavljanjem komunalne delatnosti ili pojedinih poslova iz okvira komunalne delatnosti između jedne ili više jedinica lokalne samouprave i vršioca komunalne delatnosti, koje za cilj ima pružanje komunalnih usluga na teritoriji jedne ili više jedinica lokalne samouprave ili na delu teritorije jedinice lokalne samouprave. Nadalje, odredbom člana 9. stav 7. Zakona, propisano je da se na postupak poveravanja obavljanja komunalne delatnosti čije se finansiranje obezbeđuje iz budžeta jedinice lokalne samouprave, odnosno čije se finansiranje obezbeđuje u celosti ili delimično naplatom naknade od korisnika komunalnih usluga, primenjuju odredbe zakona kojima se uređuje javnoprivatno partnerstvo i koncesije. Ova odredba primenjuje se počev od 1. januara 2017.godine, od stupanja na snagu Zakona o izmenama i dopunama Zakona o komunalnim delatnostima Službeni glasnik RS, br. 104/16. Odredbom člana 20. Zakona o lokalnoj samoupravi Službeni glasnik RS, br. 129/07, 83/14 dr. zakon, 101/16 dr. zakon i 47/18, propisana je nadležnost opštine, između ostalog, da uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti, dok je članom 32. tačka 8 propisano da skupština opštine, u skladu sa zakonom, osniva službe, javna preduzeća, ustanove i organizacije, utvrđene statutom opštine i vrši nadzor nad njima. Iz navedenih odredaba zakona proizilazi da je jedinica lokalne samouprave ovlašćena da uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti i da,u cilju obavljanja komunalnih delatnosti, osniva javna preduzeća, a može i ugovorom o poveravanju da obavljanje ovih poslova poveri drugom pravnom ili fizičkom licu.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
262	4W4REP0LBHIQ5GU9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Predstavke građana koje se odnose na nezadovoljavajući kvalitet, obim ili kontinuitet pružanja komunalnih usluga	Ustavom Republike Srbije Službeni glasnik RS br.98/06 propisano je da opština preko svojih organa, u skladu sa zakonom uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti član 190. stav 1. tačka 1. Nadalje, odredbom člana 20. Zakona o lokalnoj samoupravi Službeni glasnik RS, br. 129/07, 83/14 dr. zakon, 101/16 , 47/18 i 111/2021dr.zakon, propisana je nadležnost opštine, između ostalog, da uređuje i obezbeđuje obavljanje i razvoj komunalnih delatnosti. Odredbom člana 2. Zakona o komunalnim delatnostima Službeni glasnik RS, br. 88/11, 104/16 i 95/18, u daljem tekstu Zakon propisano je da komunalne delatnosti podrazumevaju pružanje komunalnih usluga od značaja za ostvarivanje životnih potreba fizičkih i pravnih lica kod kojih je jedinica lokalne samouprave dužna da stvori uslove za obezbeđenje odgovarajućeg kvaliteta, obima, dostupnosti i kontinuiteta komunalnih delatnosti. Nadalje, članom 4. Zakona propisano je da jedinica lokalne samouprave obezbeđuje organizacione, materijalne i druge uslove za izgradnju, održavanje i funkcionisanje komunalnih objekata i za tehničko i tehnološko jedinstvo sistema i uređuje i obezbeđuje obavljanje komunalnih delatnosti i njihov razvoj. Dakle, jedinice lokalne samouprave su u ustavnoj i zakonskoj obavezi da obezbede uslove za obavljanje komunalnih delatnosti u skladu sa zakonom koji reguliše komunalne delatnosti. Napominjemo da jedinica lokalne samouprave može svojom odlukom, u skladu sa statutom, predvideti da gradska opština, mesna zajednica ili drugi oblik mesne samouprave obavlja određene poslove u vezi sa obezbeđivanjem uslova za obavljanje komunalnih delatnosti, kao i da obezbeđivanje uslova za obavljanje komunalnih delatnosti obuhvata aktivnosti na jačanju kapaciteta i funkcionalnosti komunalne infrastrukture, obezbeđenje sredstava za finansiranje izgradnje komunalne infrastrukture, aktivnosti na praćenju kvaliteta komunalnih usluga, kao i preduzimanje mera za kontinuirano vršenje komunalnih delatnosti u cilju obezbeđenja životnih potreba fizičkih i pravnih lica.	null	null	t
263	8OOFAY8DQPIG5WWD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Do kada je rok za dostavu izveštaja u vezi obavljanja komunalnih delatnosti?	Shodno članu 8. Zakona o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11, 104/16 i 95/18 jedinica lokalne samouprave dužna je da do kraja februara tekuće godine dostavi Ministarstvu građevinarstva, saobraćaja i infrastrukture izveštaj, na propisanom obrascu, u vezi sa obavljanjem komunalnih delatnosti u prethodnoj godini.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
264	TDJTTHHFK1NESMGD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Tumačenje Zakona o komunalim delatnostima u delu koji se odnosi na promenu cena komunalnih usluga	Zakonom o komunalnim delatnostima **@LINK1@**Službeni glasnik RS, br. 88/11, 104/16 i 95/18 u daljem tekstu Zakon, određuju se komunalne delatnosti i uređuju opšti uslovi i način njihovog obavljanja. Članom 28. Zakona propisano je da odluku o promeni cene komunalnih usluga donosi vršilac komunalne delatnosti, na koju saglasnost daje nadležan organ jedinice lokalne samouprave. Uz zahtev za davanje saglasnosti vršilac komunalne delatnosti nadležnom organu jedinice lokalne samouprave dostavlja obrazloženje koje naročito sadrži razloge za promenu i detaljnu strukturu predložene cene. Takođe, jedinica lokalne samouprave je u obavezi da objavi zahtev za davanje saglasnosti na odluku o promeni cena komunalnih usluga, sa obrazloženjem, na oglasnoj tabli u sedištu jedinice lokalne samouprave, kao i u elektronskom obliku putem interneta, najmanje 15 dana pre donošenja odluke. Napominjemo, da su Zakonom određene dve vrste komunalnog inspekcijskog nadzora prva koju vrši republička komunalna inspekcija i druga koju vrši komunalna inspekcija na nivou jedinice lokalne samouprave. Tako je članom 32. stav 4. Zakona propisano da nadzor nad radom vršilaca komunalne delatnosti vrši jedinica lokalne samouprave.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
325	HEOPK5NXQQLWT0JZ	2023-06-27 18:39:51	2023-06-28 14:50:46	\N	12	Koji su najznačajniji projekti ministarstva?	Poštovani, adresa Ministarstva građevinarstva, saobraćaja i infrastrukture je Beograd, Nemanjina ulica 2226.	null	null	f
265	BH0QRNLTJ9YLPYS7	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Ko ima obavezu podnošenja Zahteva za otpočinjanje obavljanja komunalnih delatnosti?	Odredbom člana 4. stav 5. tačka 2 Zakona o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11, 104/16 i 95/18 u daljem tekstu Zakon , određeno je da Vlada uređuje sadržinu, način i uslove za otpočinjanje obavljanja komunalnih delatnosti. Radi sprovođenja navedene odredbe, Vlada je donela Uredbu o načinu i uslovima za otpočinjanje obavljanja komunalnih delatnosti Službeni glasnik RS, br. 13/18 ,66/18 i 51/19 u daljem tekstuUredba kojom su propisani način i uslovi za otpočinjanje obavljanja komunalnih delatnosti. Uredba je stupila na snagu 22. februara 2018. godine. Nadalje,shodno članu 8a Zakona i Uredbi, svaki privredni subjekat koji otpočinje vršenje komunalne delatnosti u obavezi je da podnese zahtev za proveru ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Rešenje o ispunjenosti uslova za obavljanje komunalne delatnosti vršilaca komunalnih delatnosti, donosi ministar nadležan za poslove komunalnih delatnosti a nakon što Komisija, obrazovana u skladu sa Zakonom utvrdi da su za to ispunjeni uslovi iz Uredbe. Vršioci komunalnih delatnosti koji su do stupanja na snagu Uredbe obavljali te komunalne delatnosti, nemaju obavezu da podnose zahtev za utvrđivanje ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Međutim, bili su u obavezi da u roku od tri meseca od dana stupanja na snagu Uredbe usklade svoje poslovanje sa Uredbom.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
266	SCPFOQBU5REHL19H	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Da li je vršilac komunalne delatnosti u obavezi da Ministarstvu građevinarstva, saobraćaja i infrastrukture dostavi upitnik ili isti dostavlja jedinici lokalne samouprave?	Shodno članu 8. Zakona o komunalnim delatnostima **@LINK1@**Službeni glasnik RS, br. 88/11, 104/16 i 95/18 jedinica lokalne samouprave dostavlja Ministarstvu građevinarstva, saobraćaja i infrastrukture u daljem tekstu Ministarstvo izveštaj o komunalnim delatnostima za prethodnu godinu, izuzev vršioca komunalne delatnosti pogrebna delatnost koji su u obavezi da Ministarstvu dostave izveštaj, na propisanom obrascu, u vezi sa obavljanjem te komunalne delatnosti. Napominjemo, da je vršilac komunalne delatnosti dužan da na zahtev Ministarstva dostavi Ministarstvu podatke i obaveštenja u vezi sa obavljanjem komunalnih delatnosti u roku od 15 dana od dana prijema zahteva Ministarstva.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}}	null	t
267	CZJLIIYN4RZ82YBM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Gde se može vršiti pokopavanje posmrtnih ostataka umrlog odnosno da li groblje gde se preminulo lice pokopava mora biti u upotrebi?	Zakonom o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11 i 104/16, odredbom člana 3. tačka 6 propisano je da komunalna delatnost upravljanje grobljima i sahranjivanje obuhvata upravljanje i održavanje groblja, održavanje grobnog mesta i naplata naknade za održavanje grobnog mesta, obezbeđivanje, davanje u zakup i prodaja uređenih grobnih mesta, pokopavanje i ekshumacija posmrtnih ostataka, kremiranje i ostavljanje pepela pokojnika, održavanje objekata koji se nalaze u sklopu groblja mrtvačnica, kapela, rozarijum, kolumbarijum, krematorijum i održavanje pasivnih grobalja i spomenobeležja. Nadalje odredbom člana 13. stav 1. istog zakona propisano je, između ostalog, da skupština jedinice lokalne samouprave odlukama propisuje način obavljanja komunalne delatnosti kao i opšta i posebna prava i obaveze vršilaca komunalne delatnosti i korisnika usluga na svojoj teritoriji. Zakonom i sahranjivanju i grobljima Službeni glasnik SRS, br. 20/77, 24/84 i 6/89 i Službeni glasnik RS, br. 53/93, 67/93, 48/94, 101/05 dr. zakon, 120/12 odluka US i 84/13 odluka US u daljem tekstu Zakon, propisano je da se sahranjivanje umrlih, određivanje i stavljanje van upotrebe groblja, održavanje i uređenje groblja i krematorijuma vrši na način utvrđen propisom skupštine opštine, donetim u skladu sa načelima tog zakona i drugim propisima koji se odnose na sahranjivanje i groblja. Zakonom je takođe propisano da se sahranjivanje umrlih može vršiti samo na groblju član 2 kao i da se grobljem, u smislu ovog zakona, smatra zemljište koje je odgovarajućim urbanističkim planom ili odlukom skupštine opštine određeno za sahranjivanje umrlih član 4. Nadalje, Zakon propisuje da svako naseljeno mesto, po pravilu, ima groblje član 16 kao i da organizacija udruženog rada koja vrši poslove pogrebne delatnosti i uređivanja i održavanja groblja ili mesna zajednica kojoj je povereno vršenje tih poslova vršilac komunalne delatnosti upravljanje grobljima i sahranjivanje daje na korišćenje grobna mesta parcele pod uslovima i na način utvrđen odlukom skupštine opštine član 17. stav 1. Na osnovu svega iznetog proizilazi da jedinice lokalne samouprave opštim aktom uređuju bliže uslove i način obavljanja komunalne delatnosti upravljanje grobljima i sahranjivanje, kao i da se se pokopavanje posmrtnih ostataka umrlog može vršiti samo na groblju koje je u upotrebi i koje je odgovarajućim urbanističkim planom odnosno odlukom skupštine opštine određeno za sahranjivanje umrlih. Za dodatne informacije nazovite Sektor za stambenu i arhitektonsku politiku, komunalne delatnosti i energetsku efikasnost 011/3640697, imejl **@EMAIL1@**.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:stanovanje@mgsi.gov.rs", "type": "mail", "title": "stanovanje@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
268	DRI7YOETKLYRS1QF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Pritužbe na rad vršilaca komunalnih delatnosti	Članom 13. Zakona propisano da skupština jedinice lokalne samouprave odlukama propisuje, između ostalog i način kontinuiranog izjašnjavanja najmanje jednom godišnje korisnika komunalnih usluga o kvalitetu pružanja komunalnih usluga od strane vršilaca komunalnih delatnosti, koje se može organizovati elektronskim putem ili na drugi pogodan način. Ukoliko su rezultati izjašnjavanja korisnika komunalnih usluga takvi da većina nije zadovoljna pruženom komunalnom uslugom određenog vršioca komunalne delatnosti, jedinica lokalne samouprave pokreće postupak preispitivanja rada tog vršioca komunalne delatnosti i nalaže mu da otkloni nedostatke koji su navedeni u izjašnjavanju korisnika u roku koji ne može biti duži od 90 dana. Napominjemo, da su Zakonom određene dve vrste komunalnog inspekcijskog nadzora prva koju vrši republička komunalna inspekcija i druga koju vrši komunalna inspekcija na nivou jedinice lokalne samouprave. Tako je članom 32. stav 4. Zakona propisano da nadzor nad radom vršilaca komunalne delatnosti vrši jedinica lokalne samouprave.Za dodatne informacije nazovite Sektor za stambenu i arhitektonsku politiku, komunalne delatnosti i energetsku efikasnost 011/3640697, imejl **@EMAIL1@**.	{"0": {"auto": true, "path": "mailto:stanovanje@mgsi.gov.rs", "type": "mail", "title": "stanovanje@mgsi.gov.rs", "placeholder": "@EMAIL1@"}}	null	t
269	SYNS9HEOXDNMP69P	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	9	Šta sve obuhvata obavljanje komunalne delatnosti pogrebna delatnost i koje uslove treba da ispune privredni subjekti koji bi da obavljaju navedenu delatnost?	Zakon o komunalnim delatnostima **@LINK1@** Službeni glasnik RS, br. 88/11, 104/16 i 95/18, u daljem tekstu Zakon propisuje da komunalna delatnost pogrebna delatnost obuhvata preuzimanje i prevoz posmrtnih ostataka od mesta smrti, odnosno mesta na kome se nalazi umrla osoba i prevoz do mesta određenog posebnim propisom, organizacija sahrane i ispraćaja sa pribavljanjem potrebne dokumentacije za organizaciju prevoza i sahranjivanja, čuvanje posmrtnih ostataka u rashladnom uređaju i pripremanje pokojnika za sahranjivanje. Nadalje, odredbom člana 4. stav 5. tačka 2 Zakona određeno je da Vlada uređuje sadržinu, način i uslove za otpočinjanje obavljanja komunalnih delatnosti. Radi sprovođenja navedene odredbe, Vlada je donela Uredbu o načinu i uslovima za otpočinjanje obavljanja komunalnih delatnosti Službeni glasnik RS, br. 13/18 ,66/18 i 51/19 u daljem tekstu Uredba kojom su propisani način i uslovi za otpočinjanje obavljanja komunalnih delatnosti i posebno su uređeni stručna osposobljenost kadrova i tehnički kapacitet koje moraju da ispune vršioci komunalnih delatnosti. Uredba je stupila na snagu 22. februara 2018. godine i nalazi se na zvaničnom sajtu Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK2@** Shodno članu 8a Zakona i Uredbi, svaki privredni subjekat koji otpočinje vršenje komunalne delatnosti u obavezi je da podnese zahtev za proveru ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Vršioci komunalnih delatnosti koji su do stupanja na snagu Uredbe obavljali te komunalne delatnosti, nemaju obavezu da podnose zahtev za utvrđivanje ispunjenosti uslova za otpočinjanje obavljanja komunalnih delatnosti. Međutim, bili su u obavezi da u roku od tri meseca od dana stupanja na snagu Uredbe usklade svoje poslovanje sa Uredbom.	{"0": {"auto": true, "path": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "type": "url", "title": "https://www.pravno-informacioni-sistem.rs/SlGlasnikPortal/eli/rep/sgrs/skupstina/zakon/2011/88/2/reg", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/dokumenti/uredba-o-nachinu-i-uslovima-za-otpochinjanje-obavljanja-komunalnih-delatnosti", "type": "url", "title": "https://www.mgsi.gov.rs/cir/dokumenti/uredba-o-nachinu-i-uslovima-za-otpochinjanje-obavljanja-komunalnih-delatnosti", "placeholder": "@LINK2@"}}	null	t
270	FTMFDOOVWGCFDEKT	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Ko izrađuje tehničku dokumentaciju za plovila?	Uprava pregleda samo tehničku dokumentaciju koju izrađuje uslužno privredno društvo, a koje ima za to odobrenje od strane Uprave. Spisak izdatih odobrenja za društva koja izrađuju tehničku dokumentaciju je objavljen na sajtu Uprave za utvrđivanje sposobnosti brodova za plovidbu.	null	null	t
271	TW7XVIYHCEFFURUE	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Koja je procedura za vršenje tehničkog nadzora čamca, odnosno plutajućeg objekta?	Uz popunjen zahtev za vršenje tehničkog nadzora čamca/plutajućeg objekta dostavlja se dokaz o izvršenoj uplati republičke administrativne takse za podnošenje zahteva i kopija plovidbene/ plutajuće dozvole. U zavisnosti od vrste tehničkog nadzora i tehničkih karakteristika čamca/plutajućeg objekta Uprava izdaje Nalog za uplatu takse za vršenje tehničkog nadzora u skladu sa tarifama koje su propisane Zakonom o republičkim administrativnim taksama. Nakon izvršene uplate lice ovlašćeno za tehnički nadzor izlazi na teren i vrši tehnički nadzor. Za dodatne informacije posetiti sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
272	GBNG9FHGPPHWX8ZR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Kada počinje primena pravilnika za čamce i plutajuće objekte za privredne i javne svrhe?	U toku je predlog izmene uredbe.	null	null	t
273	XNSMCV9XBKOSL4JB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Koji su rokovi za primenu poglavlja 13.01 ES-TRIN standarda , Oprema broda (sidreni uređaji)?	Rok za usaglašavanje opreme za sidrenje prema poglavlju 13.01 je 30.12.2024.god.	null	null	t
274	84BHNJI8JCM4BFEJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Koji su rokovi za primenu poglavlja 6.02 ES-TRIN standarda Kormilarski uređaji?	Rok za usaglašavanje objekta sa poglavljem 6.02 ESTRIN standarda je 01.01.2026. god.	null	null	t
275	AMGXJZQSMBXHITCL	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Da li mogu da podnesem zahtev za pregled broda koji nije u mom vlasništvu?	Možete, ukoliko ste upisani kao zakupac, ili korisnik broda u Upisnik brodova koji vodi nadležna Lučka kapetanija, ili uz odgovarajuće ovlašćenje vlasnika broda. Na linku možete pregledati elektronski Upisnik brodova **@LINK1@**.	{"0": {"auto": true, "path": "https://upls.rs/elektronski-upisnik-brodova", "type": "url", "title": "https://upls.rs/elektronski-upisnik-brodova", "placeholder": "@LINK1@"}}	null	t
276	LZKA3TBTIUXZK6UC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Koja je procedura overe tehničke dokumentacije za brodove unutrašnje plovidbe?	Uprava za utvrđivanje sposobnosti brodova za plovidbu vrši proveru tehničke dokumentacije na osnovu i prema članu 90i Zakona o plovidbi i lukama na unutrašnjim vodama.	null	null	t
277	8IA91SE72HDI9KPD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Šta je potrebno od dokumentacije za registraciju novonabavljenog čamca/plutajućeg objekta za privredne svrhe?	Za dokumentaciju je potreban dokaz o vlasništvu, tipsko odobrenje ili svedočanstvo o gradnji. Potrebno je da podnesete zahtev za osnovni pregled čamca za privredne i javne svrhe i dokaz o izvršenoj uplati takse za podnošenje zahteva. U koliko je čamac uvežen potrebno je dostaviti deklaraciju CE znak ili tehnička dokumentacija, Račun o kupovini i carinsku deklaraciju. Za još korisnih informacija posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
278	HALKRTDGLK4TSVOT	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Šta je potrebno za dobijanje dozvole za prevoz opasnih tereta (ADN)?	Potrebno je dostaviti Upravi ADN srtifikat od priznatog klasifikacionog društva. Za dodadtne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
279	YFEMMK0L3EVOIAQR	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Koji pregled sledi kada istekne plovidbena ili plutajuća dozvola?	Redovan pregled plovila može se izvršiti najranije 30 dana pre isteka roka, odnosno najkasnije 30 dana posle isteka važnosti plovidbene odnosno plutajuće dozvole. Ukoliko je važnost plovidbene/plutajuće dozvole izstekla više od 30 dana stranka podnosi zahtev za vanredni pregled. Za dodadtne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
280	SHKXXAZDHXUJ9OFB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Koje uslove treba da ispunim da bih mogao da pravim čamac ili plutajući objekat?	Ako se odlučite za gradnju čamca potrebno je da podnesete zahtev za pregled tehničke dokumentacije. Dokumentacija se dostavlja u tri primerka. Nakon odobrene tehničke dokumentacije podnosi se zahtev za nadzor nad gradnjom čamca ili plutajućeg objekta koji se vrši u radionici koju je Uprava priznala za izgradnju željenih plovila. Spisak priznatih radionica možete pronaći na sajtu Uprave **@LINK1@**. Predlažemo da pogledate tipski odobrene čamce jer se u tom slučaju vrši samo osnovni pregled plovila.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
281	UZSDBS1GKLD1YSBB	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Kako mogu da izvršim prenamenu čamca za sport i razonodu u čamac za privredni ribolov?	Svi vlasnici čamaca koji su registrovani za sport i razonodu moći će da izvrše prenamenu u čamce za privredni ribolov uz važeću plovidbenu dozvolu do 17. maja 2023. godine uz napomenu da moraju biti registrovani za privredni ribolov u Agenciji za privredne registre. U ovom slučaju vlasnik/korisnik podnosi zahtev za osnovni pregled čamca za privredni ribolov. Nakon navedenog datuma vlasnici su u obavezi da dostave tehničku dokumentaciju u skladu sa Pravilnikom o tehničkim pravilima za čamce, ploveća tela i plutajuće objekte Sl. glasnik RS, br. 35/2018, Prilog 2 Tehnička pravila za čamce za privredne i javne svhe. Za dodatne informacije posetitie sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
282	XQTXM5VUTSOEULZI	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Kako da dobijem duplikate brodskih dokumenata koja su izgubljena?	Upavi se podnosi zahtev za izdavanje duplikata brodskih ispava i knjiga uz dokaz da je dokument oglašen nevažećim. Uz ovaj zahtev se ne plaća republička taksa za podnošenje zahteva. Plaća se taksa za izdradu dokumenata. Za dodatne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
322	JERBQGCMXZJRWKF9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Koji je kontakt Ministarstva?	Poštovani, možete da nam pišete na @link1@, a celu kontakt listu možete da pogledate na linku @link2@.	{"0": {"path": "kabinet@mgsi.gov.rs", "type": "mail", "title": "kabinet@mgsi.gov.rs", "placeholder": "@link1@"}, "1": {"path": "https://www.mgsi.gov.rs/cir/contacts", "type": "url", "title": "https://www.mgsi.gov.rs/cir/contacts", "placeholder": "@link2@"}}	null	t
283	MUUBDJCK0QLP101T	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Kako da podnesem zahtev za vršenje tehničkog nadzora plovila?	Obrazac zahteva za vršenje tehničkog nadzora plovila je objavljen na sajtu Uprave za utvrđivanje sposobnosti brodova za plovidbu u daljem tekstu Uprava **@LINK1@**. Zahtev možete dostaviti poštom na našu adresu, ul. Narodnih heroja 30/II Novi Beograd, elektronskim putem na adresu **@EMAIL1@****@EMAIL2@** ili lično. Instrukcije za podnošenje zahteva za vršenje tehničkog nadzora / industrijskog nadzora iz delokruga Uprave i plaćanje republičke administrativne takse za podnošenje zahteva objavljene su na sajtu Uprave.	{"0": {"auto": true, "path": "http://www.uprava-brodova.gov.rs", "type": "url", "title": "http://www.uprava-brodova.gov.rs", "placeholder": "@LINK1@"}, "1": {"auto": true, "path": "mailto:office@upravabrodova.gov.rs", "type": "mail", "title": "office@upravabrodova.gov.rs", "placeholder": "@EMAIL1@"}, "2": {"auto": true, "path": "mailto:mailtooffice@upravabrodova.gov.rs", "type": "mail", "title": "mailtooffice@upravabrodova.gov.rs", "placeholder": "@EMAIL2@"}}	null	t
284	AQPIJEK0NWMS290P	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	10	Kako se registruje brod koji se uvozi iz zemlje koja je članica Evropske unije?	Vlasnik broda podnosi1. zahtev za vanredni pregled u svrhu upisa po priznanju svedočanstva zajednice EU sa dokazom o uplaćenoj taksi za podnošenje zahteva i original dokumenta Brodsko svedočanstvo i Svedočanstvo o baždarenju ili kopije sa pečatom CERTIFIED COPY;2. zahtev za zamenu para ploča na trupu, ili zahtev za baždarenje broda ukoliko brod ne poseduje važeće brodsko svedočastvo. Na osnovu validne dokumentacije i plaćene takse za vršenje tehničkog nadzora Uprava stiče mogućnost za izlazak na teren na kome identifikuje objekat, proverava usklađenost sa Brodskim svedočanstvom i izdaje brodu nove baždarske pločice. U zavisnosti od tipa i opreme broda Uprava definiše dodatne zahteve za izdavanje potrebnih brodskih isprava. Nakon izvršenog pregleda Uprava izdaje potvrdu radi dobijanja Rešenja o određivanju imena i pozivnog znaka broda koje izdaje Ministarstvo građevinarstva, saobraćaja i infrastrukture. Na osnovu rešenja o imenu broda Uprava izdaje brodske isprave radi upisa broda u domaći upisnik brodova. Za dodadtne informacije posetite sajt **@LINK1@**.	{"0": {"auto": true, "path": "http://uprava-brodova.gov.rs/registar_stage/cir", "type": "url", "title": "http://uprava-brodova.gov.rs/registar_stage/cir", "placeholder": "@LINK1@"}}	null	t
286	QVJ1KK8JHT7SEYFY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Koja je cena putarine?	Cene putarine možete da vidite na sledećem linku @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/категоризација-возила-ценовник-путарине", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/категоризација-возила-ценовник-путарине", "placeholder": "@link1@"}}	null	t
287	1CUZILJDEOKWBY2I	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Gde mogu da kupim TAG za putarinu?	Spisak prodajnih mesta TAG uređaja možete da dobijete na sledećem linku @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/енп-електронска-наплата-путарина/овлашћени-дистрибутери", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/енп-електронска-наплата-путарина/овлашћени-дистрибутери", "placeholder": "@link1@"}}	null	t
288	2EEHNCGGHAFMQKMV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Kako da povežem TAG uređaj sa karticom?	Proceduru povezivanja TAG uređaja sa karticom možete da pročitate na sledećem linku @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/images/putarine/web-portal-korisnicko-uputstvo.pdf", "type": "url", "title": "https://www.putevi-srbije.rs/images/putarine/web-portal-korisnicko-uputstvo.pdf", "placeholder": "@link1@"}}	null	t
289	NLU6TVEBNML76R6W	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Gde mogu da vidim stanje na putevima?	Informacije o stanju na državnim putevima možete da dobijete na linku @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/стање-на-државним-путевима", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/стање-на-државним-путевима", "placeholder": "@link1@"}}	null	t
290	QCFYZHDWDUDYIU8B	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Uspešno registrovan uređaj, ima para na kartici, ali kad dođe na naplatnu stanicu, izbacuje na displeju tag na sivoj listi?	Tag ne može biti na sivoj listi ukoliko je korisnik uspešno registrovao platnu debitnu/kreditnu karticu i sproveo registraciju do kraja. TAG je 30 minuta nakon uspešne registracije na web servis spreman za korišćenje, odnosno postaje aktivan.	null	null	t
291	BED3YWOCCALULXSV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Gde se na putevima nalaze elektro punjači?	**Elektro punjači snage 2250kW su locirani*** na platou naplatne stanice Preševo iz smera GP sa Makedonijom ka Nišu,* na platou naplatne stanice Šid iz smera GP sa Hrvatskom ka Beogradu,* na platou naplatne stanice Dimitrovgrad iz smera GP sa Bugarskom ka Nišu,* na platou naplatne stanice Subotica iz smera GP sa Mađarskom ka Beogradu,* na odmorištu Boljkovci, na autoputu Miloš Veliki smer BeogradČačak, u blizini naplatne stanice LjigNavedeni punjači poseduju tri priključka dva za brzo DC punjenje i jedan za brzo AC punjenje. Ovakva stanica omogućava napajanje električnih automobila maksimalnom izlaznom snagom 50 kW za DC i 22 kW za AC punjenje.**Elektro punjači snage 175kW su locirani*** Na platou bivše naplatne stanice Niš smer BeogradNiš* Na platou bivše naplatne stanice Niš smer NišBeograd* Na platou naplatne stanice Beograd smer NišBeogradZa više informacija posetite link @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/електропуњачи", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/електропуњачи", "placeholder": "@link1@"}}	null	t
292	SIAJ8FCHQKDAREMX	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li ima gužve na naplatnim stanicama?	Informacije o zadržavanju na naplatnim stanicama možete da pronađete na linku @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/задржавање-на-наплатним-станицама", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/задржавање-на-наплатним-станицама", "placeholder": "@link1@"}}	null	t
293	HGJFQWAOBSLLGUQY	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Koji je broj informativnog centra Puteva Srbije?	Broj telefona je @link1@, @link2@.	{"0": {"path": "0800100104", "type": "tel", "title": "0800-100-104", "placeholder": "@link1@"}, "1": {"path": "info.centar@putevi-srbije.rs", "type": "mail", "title": "info.centar@putevi-srbije.rs", "placeholder": "@link2@"}}	null	t
294	ZRE7IZ60HWNBAQSP	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Gde mogu da kupim  ENP uređaj za VEB portal u okviru projekta Open Balkan?	Kupovinu uređaja za VEB portal za elektronsku naplatu putarine možete izvršiti u poslovnicama Pošte Srbije, ili u poslovnicama JP Putevi Srbijeu Beogradu, Ustanička 64/5. sprat radno vreme radnim danima od 0700 do 2200 časova;u Novom Sadu, Kralja Petra I 28a radno vreme radnim danima od 0730 do 1530 časova;u Čačku, Braće Stanić 45 radno vreme radnim danima od 0730 do 1530 časova;u Nišu, Bulevar 12. februar, 4. prilaz u sklopu naplatne stanice Niš sever radno vreme svakog dana od 0700 do 2200 časova.Spisak prodajnih mesta JP Pošta Srbije možete naći na zvaničnoj internet prezentaciji JP Putevi Srbije @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/images/putarine/Spisak-prodajnih-mesta-uredjaja-za-ENP-u-Postama-Srbije.pdf", "type": "url", "title": "https://www.putevi-srbije.rs/images/putarine/Spisak-prodajnih-mesta-uredjaja-za-ENP-u-Postama-Srbije.pdf", "placeholder": "@link1@"}}	null	t
295	DF9U5TEETPML2APH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Kako mogu da izvršim prekonfiguraciju postojećeg ENP uređaja na VEB servis?	Prekonfiguracija postojećeg ENP uređaja u pripejd sistemu u postpejd sistem se vrši trenutno samo u poslovnicama JP Putevi Srbije,* u Beogradu, Ustanička 64/5. sprat radno vreme radnim danima od 0700 do 2200 časova;* u Novom Sadu, Kralja Petra I 28a radno vreme radnim danima od 0730 do 1530 časova;* u Čačku, Braće Stanić 45 radno vreme radnim danima od 0730 do 1530 časova;* u Nišu, Bulevar 12. februar, 4. prilaz u sklopu naplatne stanice Niš sever radno vreme svakog dana od 0700 do 2200 časova.Neophodno je da se uređaj odnese u poslovnicu i da se izvrši prekonfiguracija istog, i registrovanje na WEB portal za elektronsku naplatu u okviru projekta Open Balkan.	null	null	t
296	HHJTTCHLXNHUPTXF	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li isti uređaj može da se koristi u okviru ENPay mobilne aplikacije i za VEB portal?	Ukoliko je Vaš ENP uređaj registrovan na mobilnu aplikaciju ENPay, isti nije moguće i registrovati na VEB portal za elektronsku naplatu, u okviru projekta Open Balkan. Potrebno je da postojeći uređaj prekonfigurišete u pripejd sistem kod ovlašćenog distributera ALLYES, i zatim ga registrujete na VEB portal za elektronsku naplatu putarine.Nije moguće da jedan uređaj bude registrovan na mobilnu aplikaciju i portal za elektronsku naplatu putarine.Konfiguracija pripejd uređaja se vrši u poslovnicama JP Putevi Srbije* u Beogradu, Ustanička 64/5. sprat radno vreme radnim danima od 0700 do 2200 časova;* u Novom Sadu, Kralja Petra I 28a radno vreme radnim danima od 0730 do 1530 časova;* u Čačku, Braće Stanić 45 radno vreme radnim danima od 0730 do 1530 časova;* u Nišu, Bulevar 12. februar, 4. prilaz u sklopu naplatne stanice Niš sever radno vreme svakog dana od 0700 do 2200 časova.	null	null	t
297	1BRDTMOZ51EID7DM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li može ENP uređaj da se koristi u zemljama regiona?	Još uvek nije omogućeno korišćenje ENP uređaja u zemljama regiona. Javnost će biti blagovremeno obaveštena o početku rada sistema.	null	null	t
298	1TWFYDEYYXBHEQH4	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Traži mi verifikacioni kod prilikom registracije ENP uređaja na VEB portal?	Verifikacioni kod prilikom registracije svih korisnika, pa i korisnika koji su kupili uređaj u pošti, je podatak u polju Ugovora u kojem se evidentira registarska oznaka.	null	null	t
299	UOTO5S9NLVEERVHC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Nema dovoljno sredstava na kartici, da li se može registrovati?	Korisnik se može registrovati, ali ukoliko nakon ostvarenih prolazaka kroz naplatne stanice ne bude imao novac za plaćanje, TAG će biti postavljen na Sivu listu do izmirenja dugovanja.	null	null	t
300	TIDBVVTGJ6BIUVP0	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Kada ću moći sa srpskim TAG-om da prolazim kroz Makedoniju?	JP Putevi Srbije su izradili jedinstvenu platformu za elektronsku naplatu putarine i u tehničkom delu Republika Srbija je spremna za povezivanje sa Republikom Severnom Makedonijom. Onog trenutka kada i Republika Severna Makedonija u tehničkom delu bude spremna za povezivanje na jedinstvenu platformu za elektronsku naplatu putarine, korisnici će sa istim TAG uređajem moći da prolaze kroz Republiku Srbiju i Republiku Severenu Makedoniju, ali i ostale zemlje regiona koje budu prihvatile i ispunile naše uslove povezivanja na jedinstveni sistem za elektronsku naplatu putarine. Javnost će biti blagovremeno obaveštena kada se u potpunosti uspostavi jedinstven sistem naplate putarine između Republike Srbije i Republike Severne Makedonije, kao i ostalih zemljama u regionu.	null	null	t
301	HUTYMYPZPOY0S7GN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li mogu svoj postojeći uređaj  da registrujem na VEB portal preko interneta bez dolaska u poslovnicu?	Nije moguće. Potrebno je TAG uređaj fizički doneti na neko od prodajnih mesta za ENP pri JPPS.	null	null	t
302	SGF930GOJCKDUCBK	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Postoji li način da se registruje uređaj na web servis, bez QR kod-a?	Postoji, tako što će korisnik otići na url adresu u web browser pretraživaču @link1@ gde unosi sve tražene podatke.	{"0": {"path": "https://openbalkan-etc.com", "type": "url", "title": "https://openbalkan-etc.com", "placeholder": "@link1@"}}	null	t
303	WDFGXVKIYAH1G5CJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li je web servis za elektronsku naplatu putarine dostupan svim korisnicima ENP?	Web servis za elektronsku naplatu putarine je trenutno dostupan fizičkim licima i za 1. kategoriju vozila.	null	null	t
304	VMU9WV9EB3HZR4LH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li mogu više TAG-ova da povežem na jednu platnu karticu?	Prvim povezivanjem TAG uređaja na web servis, korisnik dobija pristup svom nalogu gde može dodati više uređaja na svoju registrovanu platnu karticu. Uređaje koji se dodaju kroz nalog potrebno je pre samog dodavanja prekonfigurisati fizički na nekom od prodajnih mesta za ENP pri JPPS.	null	null	t
305	8IJPFDCJWHWGJALC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Skinuta veća sredstva prilikom prolaska kroz naplatnu stanicu , putem uređaja za ENP?	Obaveštavamo Vas da je potrebno da podnesete reklamaciju na nelogično skinuta sredstva sa uređaja za ENP. Obrazac se nalazi na zvaničnoj internet prezentaciji JP Putevi Srbije, na sledećem linku @link1@. Navedeni obrazac je potrebno da popunite i pošaljete na mejl adresu @link2@. Po obrađenoj reklamaciji kolege iz Odseka za rešavanje reklamacija korisnika ENP će Vas obavestiti o ishodu.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/sr/enp-elektronska-naplata-putarine/reklamacije", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/sr/enp-elektronska-naplata-putarine/reklamacije", "placeholder": "@link1@"}, "1": {"path": "enp.reklamacije@putevi-srbije.rs", "type": "mail", "title": "enp.reklamacije@putevi-srbije.rs", "placeholder": "@link2@"}}	null	t
171	WNSTM7WDZCQUWVBC	2023-06-27 18:39:50	2023-06-28 19:28:11	\N	6	Razlozi nesaobraćanja vozova u određenim danima?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Srbija Voz a.d. proverava koji su razlozi ovog problema i u skladu sa tim dostavlja odgovor shodno potpuno različitim deonicama i kategorijama vozova odgovori se dostavljaju u skladu sa istim.	null	null	f
306	RLMGGGYLFKAIGUG9	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Neispravan uređaj za ENP?	Reklamaciju na ispravnost ENP uređaja je moguće podneti kod bilo kog našeg ovlašćenog distributera, kao i u prostorijama JP Putevi Srbije u Beogradu, Ustanička 64/5. sprat radno vreme radnim danima od 0700 do 2200 časova;u Novom Sadu, Kralja Petra I 28a radno vreme radnim danima od 0730 do 1530 časova;u Čačku, Braće Stanić 45 radno vreme radnim danima od 0730 do 1530 časova;u Nišu, Bulevar 12. februar, 4. prilaz u sklopu naplatne stanice Niš sever radno vreme svakog dana od 0700 do 2200 časova.Potrebno je da donesete uređaj na odabrano mesto, i da popunite obrazac Reklamacija na ispravnost ENP uređaja.Po obrađenoj reklamaciji ukoliko je uređaj van garantnog roka, dobijate dopis o preostalim sredstvima na adresu iz ugovora. Taj dopis prilažete kao vid dopune uz drugi uređaj za ENP kod nekog od ovlašćenih distiributera. Ukoliko je uređaj koji reklamirate u garantnom roku, dobijate novi za prebačenim sredstvima.	null	null	t
307	L02VL9RGLRICOYZS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li uređaj može da se koristi za motocikle?	Zbog trenutnih tehničkih mogućnosti i tipa opreme za elektronsku naplatu putarine, ENP uređaj može konfigurisati isključivo za I, II, III i IV kategoriju. U skladu sa propisanim Uputstvom za postavljanje i korišćenje ENP uređaja i maksimalnom bezbednošću učesnika u saobraćaju, motocikli ne ispunjavaju uslove za upotrebu istih. Trenutno na samim naplatnim stanicama ne postoji mogućnost obračuna putarine ostvarene elektronskim putem za vozila koja pripadaju IA kategoriji. Za to je potrebno izvršiti čitav niz izmena i dopuna počevši od organizacionih, strateških, tehničkih i nabaviti odgovarajuću opremu koja bi omogućavala motociklistima da na ispravan način koriste ENP uređaje prilikom prolaska kroz naplatnu rampu, a da se pritom on tretira kao posebna kategorija vozila.	null	null	t
308	HONIOUUZJAKFOAAC	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Provera stanja na ENP uređaju?	Proveru sredstava na uređaju možete izvršiti kod ovlašćenih distributera uz fizičko prisustvo uređaja, kao i pri ulasku na autoput, na semaforu prikazane registarske oznake, kategorija i iznos kredita.	null	null	t
309	CTHDZ4EHNYNNF93C	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Da li imam popust na putarinu ako koristim ENP uređaj?	Korisnici uređaja za ENP ostvaruju popust u pripejd sistemu od 6 prilikom dopune uređaja, odnosno 6 prilikom plaćanja računa u postpejd sistemu, od 01.04.2023.godine.	null	null	t
310	OTCY5SKPIZ34ZYBV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Kako mogu da dobijem listing prolaska za ENP uređaj?	Neophodno je da korisnik podnese zahtev za listing prolaska koji se nalazi na zvaničnoj internet prezentaciji JP Putevi Srbije. Listing sadrži podatke za prethodni mesec, a ukoliko korisnik želi listing za više meseci potrebno je da uputi zahteve za svaki mesec posebno. Obrađeni zahtevi se elektronskim putem dostavljaju korisnicima od 10. u mesecu za prethodni mesec. Popunjen zahtev se šalje na email adresu @link1@.	{"0": {"path": "enp.listing@putevi-srbije.rs", "type": "mail", "title": "enp.listing@putevi-srbije.rs", "placeholder": "@link1@"}}	null	t
311	8OUJAB3GMHODTPHJ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Gde mogu da kupim nosač za ENP uređaj?	Nosač za ENP uređaj možete kupiti na mestima ovlašćenih distributera. Spisak distributera koji vrše prodaju nosača nalazi se na zvaničnoj internet prezentaciji JP Putevi Srbije @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/sr/enp-elektronska-naplata-putarine/nosa%C4%8Di-za-enp-ure%C4%91aj", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/sr/enp-elektronska-naplata-putarine/nosa%C4%8Di-za-enp-ure%C4%91aj", "placeholder": "@link1@"}}	null	t
312	7FOF0SDJCDKOE3YD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	11	Kada će da krene sa funkcionisanjem integrisana naplata putarine između Srbije i Makedonije?	Vlade Srbije i Severne Makedonijie, odnosno resorna ministarstva postigli su dogovor o integirsanoj naplati putarine, odnosno mogućnosti da sa tagom jedne države prolazite kroz naplatne stanice druge. Uskoro se očekuje puštanje sistema u rad, a takođe i proširenje sistema na okolne zemlje. Više informacija na @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/images/putarine/web-portal-korisnicko-uputstvo.pdf", "type": "url", "title": "https://www.putevi-srbije.rs/images/putarine/web-portal-korisnicko-uputstvo.pdf", "placeholder": "@link1@"}}	null	t
313	KE3ZXYDGDOX1H3KM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je predsednik države?	Predsednik Republike Srbije je Aleksandar Vučić. @link1@.	{"0": {"path": "https://www.predsednik.rs/predsednik/biografija", "type": "url", "title": "https://www.predsednik.rs/predsednik/biografija", "placeholder": "@link1@"}}	null	t
314	BJDSUKUWYZ38ZI0P	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je ministar gradjevinarstva, saobracaja i infrastrukture?	Ministar gradjevinarstva, saobraćaja i infrastrukture je Goran Vesić. @link1@.	{"0": {"path": "https://www.srbija.gov.rs/biografija/195190/goran-vesic.php", "type": "url", "title": "https://www.srbija.gov.rs/biografija/195190/goran-vesic.php", "placeholder": "@link1@"}}	null	t
315	BBCEV5LTTKOPHQOV	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je premijer Srbije?	Predsednica Vlade Republike Srbije je Ana Brnabić. @link1@.	{"0": {"path": "https://www.srbija.gov.rs/biografija/184/ana-brnabic.php", "type": "url", "title": "https://www.srbija.gov.rs/biografija/184/ana-brnabic.php", "placeholder": "@link1@"}}	null	t
316	EZCJFVSZZQLOA3K3	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je direktor JP Putevi Srbije?	Direktor JP Putevi Srbije je Zoran Drobnjak, koji funkciju generalnog direktora ovo preduzeća obavlja od 2008. godine. @link1@.	{"0": {"path": "https://www.putevi-srbije.rs/index.php/директор/радна-биографија-в-д-директора", "type": "url", "title": "https://www.putevi-srbije.rs/index.php/директор/радна-биографија-в-д-директора", "placeholder": "@link1@"}}	null	t
317	GMLPPXUYCXHWOBBN	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Kako mogu pisati ministru, na koju adresu?	Možete da se obratite na mejl @link1@.	{"0": {"path": "kabinet@mgsi.gov.rs", "type": "mail", "title": "kabinet@mgsi.gov.rs", "placeholder": "@link1@"}}	null	t
318	EOSAUKNEBLDTYHDL	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Kako Ministarstvo podržava profesionalno usavršavanje i edukaciju mladih?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa Univerzitetom u Beogradu pokrenulo je projekat studentske prakse. Do sada je obuku prošlo 26 studenata, a u narednom periodu planira se novi ciklus prakse. Javnost će biti blagovremeno obaveštena na sajtu i društvenim mrežama Ministarstva.	null	null	t
319	ZIPS4GOGFSUZQZNH	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Ko je Goran Vesić?	Goran Vesić obavlja funkciju ministra građevinarstva, saobraćaja i infrastrukture. Njegovu biografiju možete da pogledate na @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/cir/ministar-gradjevinarstva-saobratshaja-i-infrastrukture", "type": "url", "title": "https://www.mgsi.gov.rs/cir/ministar-gradjevinarstva-saobratshaja-i-infrastrukture", "placeholder": "@link1@"}}	null	t
324	RV6A5FGZERMFINWW	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Koji su najznačajniji projekti ministarstva?	Poštovani, listu najvažnijih projekata i aktivnosti ministarstva možete da pogledate na linku @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/sites/default/files/100-dana-MGSI.pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/100-dana-MGSI.pdf", "placeholder": "@link1@"}}	null	t
326	SJJBHHKDYP2O18ZD	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Da li ministarstvo ima Fejsbuk ili Instagram stranicu?	Ministarstvo ima svoje društvene mreže na kojima obaveštava javnost o svojim aktivnostima. Fejsbuk @link1@ Instagram @link2@.	{"0": {"path": "https://www.facebook.com/izgradnjasrbije", "type": "url", "title": "https://www.facebook.com/izgradnjasrbije", "placeholder": "@link1@"}, "1": {"path": "https://www.instagram.com/izgradnjasrbije", "type": "url", "title": "https://www.instagram.com/izgradnjasrbije", "placeholder": "@link2@"}}	null	t
327	HLWKWGOQ8FIR5DBM	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Šta je prioritet u radu ministarstva?	Prioritet u radu Ministarstva građevinrastva, saobraćaja i infrastrukture je sprovođenje aktivnosti prate državnu politiku u kojoj Srbija postaje moderna, uspešna i povezana zemlja. Na tom putu razvoj saobraćajne infrastrukture zauzima posebno mesto, pa tako je izgradnja autoputeva, brzih saobraćajnica, brzih pruga ključna za ekonomski napredak i ravnomerni razvoj Srbije.	null	null	t
328	WWS48MTDQF8AX7LQ	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	12	Koje sektore obuhvata ministarstvo?	Ministarstvo građevinarstva, saobraćaja i infarastrukture ima 9 sektora, koji pokrivaju delokrug našeg rada. Detaljan spisak sa nadležnostima i opisom posla možete da vidite na linku @link1@.	{"0": {"path": "https://www.mgsi.gov.rs/cir/sectors", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sectors", "placeholder": "@link1@"}}	null	t
329	J1I064RMWOMCQ4RG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	13	Šta je Čista Srbija?	Projekat podrazumeva izgradnju postrojenja za prečišćavanja otpadnih voda, kanalizacione mreže i pumpnih stanica u 65 gradova i opština, odnosno na 89 lokacija u Republici Srbiji što uključuje 157 postrojenja za preradu otpadnih voda ukupnog kapaciteta 2.326.000 ekvivalenta stanovnika i 5.206.679,31 m cevi kanalizacione mreže. Više informacija na @link1@.	{"0": {"path": "https://cistasrbija.rs", "type": "url", "title": "https://cistasrbija.rs", "placeholder": "@link1@"}}	null	t
330	0O14YHMZQVWFRJXG	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	13	Kada će biti izgrađena fabrika za preradu otpadnih voda u Velikom Selu?	Posle duže vremena projekat je pokrenut sa mrtve tačke. Potpisani su aneksi ugovora kako bi projekat mogao nesmetano da se sprovodi. Vremenski horizont za izgradnju Fabrike za preradu otpadnih voda u Velikom selu je 2027. godina.	null	null	t
331	LRPIDEWTGJH49K5U	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	13	Šta je energetski pasoš?	Energetski pasoš je Sertifikat o energetskim svojstvima zgrade sadrži podatke o energetskom razredu zgrade, odnosno potrebnoj energiji za grejanje, o kvalitetu zgrade, kao i preporuke za unapređenje komfora i smanjenje potrošnje energije.	null	null	t
332	Q8ULTUIL1AE72WRA	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	13		Energetsku efikasnost zgrade možete da saznate preko energetskog pasoša, dokumenta koji svaka novija zgrada mora da ima i u kojem je navedeno koliko je potrebno energije za grejanje zgrade. Pasoš pa i projekti su javno dostupni dokumenti. Za veći deo novih zgrada, energetski pasoši mogu da se nađu na sajtu Centralnog registra energetskih pasoša @link1@.	{"0": {"path": "https://crep.gov.rs", "type": "url", "title": "https://crep.gov.rs", "placeholder": "@link1@"}}	null	t
333	GWPRTOHGYAEOBRTS	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	13	Šta je projekat Socijalnog stanovanja?	Projekat, Socijalno stanovanje, podrazumeva izgradnju socijalnih stanova , tj. aktivno uključivanje I izgradnju kapaciteta lokalnih samouprava za pripadnike romske populacije, žene koje su žrtve porodičnog nasilja I drugi koji žive u neadekvatnim uslovima. Opšti cilj programa je doprineti povećanom socijalnom uključivanju žena i muškaraca, devojčica i dečaka koji žive u siromaštvu i isključeni iz društva, i omogućiti im dostojanstven život i aktivno učešće u društvu. Od početka 2023. godine u Loznici je useljeno 14 porodica u socijalne stanove. Isto tako, u Čačku je u pomenute stanove useljeno 12 porodica.	null	null	t
334	NKTDTR670XCR2OOO	2023-06-27 18:39:51	2023-06-27 18:39:51	\N	13	Da li ministarstvo radi na pristupanju Srbije Evropskoj uniji?	Na Međuvladinoj konferenciji o pristupanju Republike Srbije Evropskoj uniji u Briselu 14. decembra 2021. godine, otvoren je Klaster 4 Zeleni dogovor i održiva povezanost, koji obuhvata četiri poglavlja u pristupnim pregovorima među kojima su Poglavlje 14 Transportna politika i Poglavlje 21 Transevropske mreže. Za prvih 100 dana rada ministarstva, rađeno je na pripremi 4 od 6 zakona u vezi sa poglavljima 14 i 21. To su izrada Nacrta zakona o izmenama i dopunama Zakona o železnici; izrada Nacrta zakona o interoperabilnosti u železničkom saobraćaju; izrada Nacrta zakona o žičarama za transport lica; izrada Nacrta zakona o održavanju zgrada.	null	null	t
335	XGWZFYLIZI3559FB	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	13	Da li Srbiji postoji Vazduhoplovna akademija?	Ministar građevinarstva, saobraćaja i infrastrukture Goran Vesić otvorio je 30. Januara 2023. godine rekonstruisani objekat Vazduhoplovne akademije u Beogradu, gde pored školovanja 120 pilota godišnje, u Vazduhoplovnoj akademiji obrazuju i i mehaničari, kontrolori leta i drugo osoblje. Licence koje se budu dobijale, vazice I u EU, a moći ce da se školuju I kadrovi iz drugih zemalja Bosne I Hercegovine, Crne Gore, Albanije, Turske I Severne Makedonije.	null	null	t
336	J42C15B9ZDLYWIGO	2023-06-27 18:39:52	2023-06-27 18:39:52	\N	13	Šta su to projekti Integralnog razvoja?	Projkti Integralnog razvoja je program koje je sprovelo Ministarstvo građevinarstva, saobraćaja i infrastrukture i čiji je cilj uređenje i razvoj Jugozapadne Srbije i Ovčarsko kablarske klisure. Javni poziv je raspisan 05. januara 2023. godine i trajao je do 31. januara 2023. Cilj javnog poziva je uređenje i razvoj Jugozapadne Srbije i Ovčarsko kablarske klisure kroz pružanje finansijske podrške jedinicima lokalne samouprave. Rezultate konkursa i spisak projekata možete da pogledate na linkovima @link1@ @link2@.	{"0": {"path": "https://www.mgsi.gov.rs/sites/default/files/ODLUKA%20o%20izboru%20jls%20na%20teritoriji%20OKK.pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/ODLUKA%20o%20izboru%20jls%20na%20teritoriji%20OKK.pdf", "placeholder": "@link1@"}, "1": {"path": "https://www.mgsi.gov.rs/sites/default/files/Odluka%20o%20izboru%20jls%20za%20teritoriju%20JZS%2C%2017.03.2023.%20godine.pdf", "type": "url", "title": "https://www.mgsi.gov.rs/sites/default/files/Odluka%20o%20izboru%20jls%20za%20teritoriju%20JZS%2C%2017.03.2023.%20godine.pdf", "placeholder": "@link2@"}}	null	t
175	IMZNKMHBJGERQUIK	2023-06-27 18:39:50	2023-06-28 19:30:00	\N	6	Informacije vezane za projekte koji su trenutno u realizaciji?	Ministarstvo građevinarstva, saobraćaja i infrastrukture u saradnji sa preduzećem Infrastruktura železnice Srbije a.d. dostavlja odgovor pitanja se odnose na različite projekte, kao i na različite segmente projekata, a samim tim odgovori nisu generisani.	null	null	f
177	BLEXSQRZBDTR37YQ	2023-06-27 18:39:50	2023-06-28 19:32:11	\N	6	Da li se u tekućoj godini planira raspisivanje konkursa za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta?	Sve informacije o javnom pozivu za učešće na konkursu za dodelu finansijskih sredstava kao stimulativnih mera za unapređenje kombinovanog transporta se mogu naći na zvaničnom sajtu Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@**.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/", "type": "url", "title": "https://www.mgsi.gov.rs/", "placeholder": "@LINK1@"}}	null	f
226	TOR38M2Z51Z2XFHU	2023-06-27 18:39:51	2023-06-28 19:54:31	\N	7	Zašto se objekat (zgrada), za koji je izdata građevinska dozvola, gradi blizu objekta na susednoj parceli ili na granici parcele?	Postupak izdavanja građevinske dozvole nije u nadležnosti građevinske inspekcije. Za više informacija posetite sajt Ministarstva građevinarstva, saobraćaja i infrastrukture **@LINK1@** ili nazovite Sektor za građevinske poslove, sprovođenje objedinjenje procedure i ozakonjenje 011/3616422.	{"0": {"auto": true, "path": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-gradjevinske-poslove-sprovodjenje-objedinjene-procedure-i-ozakonjenje", "type": "url", "title": "https://www.mgsi.gov.rs/cir/sektori/sektor-za-gradjevinske-poslove-sprovodjenje-objedinjene-procedure-i-ozakonjenje", "placeholder": "@LINK1@"}}	null	f
227	B7UPINTQAAHRMILO	2023-06-27 18:39:51	2023-06-28 19:54:56	\N	7	Zašto građevinska inspekcija ne donosi rešenje o izvršenju za bespravno izvedene radove, za koje ima saznanje da je započet postupak legalizacije/ozakonjenja objekta ili dela objekta?	Troškove izvršenja, kao i sudske troškove, snosio bi organ uprave, a ne vlasnik nelegalno izgrađenog objekta, ukoliko bi se objekat uklonio pre pravnosnažno okončanog postupka ozakonjenja, u slučajevima kada bi se odobrilo ozakonjenje predmetnog objekta. Postupak legalizacije/ozakonjenja nije izvestan zbog moguće izmene planskog dokumenta, a sve do pravnosnažno okončanog postupka ozakonjenja.	null	null	f
251	F0TA5GMKXJ1GJN8R	2023-06-27 18:39:51	2023-06-28 20:06:13	\N	8	Podnošenje predstavki po usvojenom planskom dokumentu u smislu visine eksproprijacije.	Podnošenje predstavki po usvojenom planskom dokumentu nisu predmet pripreme, koordinacije i praćenja izrade planskih dokumenata.	null	null	f
285	WJTQAENLINW3J3MQ	2023-06-27 18:39:51	2023-06-28 20:07:52	\N	11	Na računu imam sredstava, iz kog razloga mi je povezivanje kartice sa uređajem neuspešno?	Treba proveriti da korisnik nije ukucao broj tekućeg računa, umesto broj kartice, kao i da li je tom karticom omogućeno internet plaćanje.	null	null	f
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.events_id_seq', 37, true);


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

SELECT pg_catalog.setval('public.question_examples_id_seq', 1898, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.questions_id_seq', 336, true);


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

