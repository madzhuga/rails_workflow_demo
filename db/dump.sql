--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: order_lines; Type: TABLE; Schema: public; Owner: maxim; Tablespace: 
--

CREATE TABLE order_lines (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    qty integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.order_lines OWNER TO localhost;

--
-- Name: order_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE order_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_lines_id_seq OWNER TO localhost;

--
-- Name: order_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE order_lines_id_seq OWNED BY order_lines.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE orders (
    id integer NOT NULL,
    customer_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.orders OWNER TO localhost;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO localhost;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying(255),
    active boolean,
    vendor_id integer,
    unit_price double precision,
    stock_qty integer,
    reserved_qty integer,
    min_qty integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.products OWNER TO localhost;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO localhost;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: rails_workflow_contexts; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE rails_workflow_contexts (
    id integer NOT NULL,
    parent_id integer,
    parent_type character varying(255),
    body json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rails_workflow_contexts OWNER TO localhost;

--
-- Name: rails_workflow_contexts_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE rails_workflow_contexts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_workflow_contexts_id_seq OWNER TO localhost;

--
-- Name: rails_workflow_contexts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE rails_workflow_contexts_id_seq OWNED BY rails_workflow_contexts.id;


--
-- Name: rails_workflow_errors; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE rails_workflow_errors (
    id integer NOT NULL,
    message character varying(255),
    stack_trace text,
    parent_id integer,
    parent_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    resolved boolean
);


ALTER TABLE public.rails_workflow_errors OWNER TO localhost;

--
-- Name: rails_workflow_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE rails_workflow_errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_workflow_errors_id_seq OWNER TO localhost;

--
-- Name: rails_workflow_errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE rails_workflow_errors_id_seq OWNED BY rails_workflow_errors.id;


--
-- Name: rails_workflow_operation_templates; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE rails_workflow_operation_templates (
    id integer NOT NULL,
    title character varying(255),
    source text,
    dependencies text,
    operation_class character varying(255),
    process_template_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    async boolean,
    child_process_id integer,
    assignment_id integer,
    assignment_type character varying(255),
    kind character varying(255),
    role character varying(255),
    "group" character varying(255),
    instruction text,
    is_background boolean DEFAULT true,
    type character varying(255)
);


ALTER TABLE public.rails_workflow_operation_templates OWNER TO localhost;

--
-- Name: rails_workflow_operation_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE rails_workflow_operation_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_workflow_operation_templates_id_seq OWNER TO localhost;

--
-- Name: rails_workflow_operation_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE rails_workflow_operation_templates_id_seq OWNED BY rails_workflow_operation_templates.id;


--
-- Name: rails_workflow_operations; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE rails_workflow_operations (
    id integer NOT NULL,
    status integer,
    async boolean,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    process_id integer,
    template_id integer,
    dependencies text,
    child_process_id integer,
    assignment_id integer,
    assignment_type character varying(255),
    assigned_at timestamp without time zone,
    type character varying(255),
    is_active boolean,
    completed_at timestamp without time zone,
    is_background boolean
);


ALTER TABLE public.rails_workflow_operations OWNER TO localhost;

--
-- Name: rails_workflow_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE rails_workflow_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_workflow_operations_id_seq OWNER TO localhost;

--
-- Name: rails_workflow_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE rails_workflow_operations_id_seq OWNED BY rails_workflow_operations.id;


--
-- Name: rails_workflow_process_templates; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE rails_workflow_process_templates (
    id integer NOT NULL,
    title character varying(255),
    source text,
    manager_class character varying(255),
    process_class character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying(255)
);


ALTER TABLE public.rails_workflow_process_templates OWNER TO localhost;

--
-- Name: rails_workflow_process_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE rails_workflow_process_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_workflow_process_templates_id_seq OWNER TO localhost;

--
-- Name: rails_workflow_process_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE rails_workflow_process_templates_id_seq OWNED BY rails_workflow_process_templates.id;


--
-- Name: rails_workflow_processes; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE rails_workflow_processes (
    id integer NOT NULL,
    status integer,
    async boolean,
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    template_id integer,
    type character varying(255)
);


ALTER TABLE public.rails_workflow_processes OWNER TO localhost;

--
-- Name: rails_workflow_processes_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE rails_workflow_processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rails_workflow_processes_id_seq OWNER TO localhost;

--
-- Name: rails_workflow_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE rails_workflow_processes_id_seq OWNED BY rails_workflow_processes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO localhost;

--
-- Name: users; Type: TABLE; Schema: public; Owner: localhost; Tablespace:
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    role character varying(255)
);


ALTER TABLE public.users OWNER TO localhost;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: localhost
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO localhost;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: localhost
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY order_lines ALTER COLUMN id SET DEFAULT nextval('order_lines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY rails_workflow_contexts ALTER COLUMN id SET DEFAULT nextval('rails_workflow_contexts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY rails_workflow_errors ALTER COLUMN id SET DEFAULT nextval('rails_workflow_errors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY rails_workflow_operation_templates ALTER COLUMN id SET DEFAULT nextval('rails_workflow_operation_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY rails_workflow_operations ALTER COLUMN id SET DEFAULT nextval('rails_workflow_operations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY rails_workflow_process_templates ALTER COLUMN id SET DEFAULT nextval('rails_workflow_process_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY rails_workflow_processes ALTER COLUMN id SET DEFAULT nextval('rails_workflow_processes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: localhost
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: order_lines; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY order_lines (id, order_id, product_id, qty, created_at, updated_at) FROM stdin;
31	12	1	1	2015-02-10 16:21:43.460091	2015-02-10 16:21:43.460091
32	12	2	2	2015-02-10 16:21:43.474962	2015-02-10 16:21:43.474962
33	12	3	3	2015-02-10 16:21:43.485121	2015-02-10 16:21:43.485121
\.


--
-- Name: order_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('order_lines_id_seq', 33, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY orders (id, customer_id, created_at, updated_at) FROM stdin;
12	2	2015-02-10 16:21:43.428054	2015-02-10 16:21:43.428054
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('orders_id_seq', 12, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY products (id, name, active, vendor_id, unit_price, stock_qty, reserved_qty, min_qty, created_at, updated_at) FROM stdin;
1	Test Product #1	\N	\N	12	500	4	50	2015-02-09 18:02:14.298965	2015-02-10 16:22:26.950948
2	Test Product #2	\N	\N	23	500	7	10	2015-02-09 18:04:02.377629	2015-02-10 16:22:26.96204
3	Test Product #3	\N	\N	15	25	10	10	2015-02-09 18:04:26.101027	2015-02-10 16:22:26.97307
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('products_id_seq', 3, true);


--
-- Data for Name: rails_workflow_contexts; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY rails_workflow_contexts (id, parent_id, parent_type, body, created_at, updated_at) FROM stdin;
1	1	Workflow::Process	{"resource":{"id":8,"class":"Order"}}	2015-02-09 19:37:16.596733	2015-02-09 19:37:16.596733
2	1	Workflow::Operation	{"resource":{"id":8,"class":"Order"}}	2015-02-09 19:37:16.761363	2015-02-09 19:37:16.761363
3	1	Workflow::Error	{"parent":{"id":1,"class":"Workflow::Process"},"target":{"id":1,"class":"Workflow::Process"},"method":"build_dependencies","args":[{"id":1,"class":"OrderValidation"}]}	2015-02-09 19:37:17.020582	2015-02-09 19:37:17.020582
4	2	Workflow::Operation	{"resource":{"id":8,"class":"Order"}}	2015-02-09 19:38:22.638002	2015-02-09 19:38:22.638002
5	3	Workflow::Operation	{"resource":{"id":8,"class":"Order"},"orderValid":true}	2015-02-09 19:38:22.80376	2015-02-09 19:38:22.80376
6	2	Workflow::Process	{"resource":{"id":9,"class":"Order"}}	2015-02-09 19:39:25.70428	2015-02-09 19:39:25.70428
7	4	Workflow::Operation	{"resource":{"id":9,"class":"Order"}}	2015-02-09 19:39:25.834166	2015-02-09 19:39:25.834166
8	5	Workflow::Operation	{"resource":{"id":9,"class":"Order"},"orderValid":false}	2015-02-09 19:39:26.078433	2015-02-09 19:39:26.078433
9	3	Workflow::Process	{"resource":{"id":10,"class":"Order"}}	2015-02-09 19:58:33.209583	2015-02-09 19:58:33.209583
10	6	Workflow::Operation	{"resource":{"id":10,"class":"Order"}}	2015-02-09 19:58:33.332066	2015-02-09 19:58:33.332066
11	7	Workflow::Operation	{"resource":{"id":10,"class":"Order"},"orderValid":false}	2015-02-09 19:58:33.530454	2015-02-09 19:58:33.530454
12	4	Workflow::Process	{"resource":{"id":11,"class":"Order"}}	2015-02-09 19:59:09.661348	2015-02-09 19:59:09.661348
13	8	Workflow::Operation	{"resource":{"id":11,"class":"Order"}}	2015-02-09 19:59:09.794754	2015-02-09 19:59:09.794754
14	2	Workflow::Error	{"parent":{"id":4,"class":"Workflow::Process"},"target":{"id":4,"class":"Workflow::Process"},"method":"build_dependencies","args":[{"id":8,"class":"OrderValidation"}]}	2015-02-09 19:59:09.994922	2015-02-09 19:59:09.994922
15	3	Workflow::Error	{"parent":{"id":4,"class":"Workflow::Process"},"target":{"id":4,"class":"Workflow::Process"},"method":"build_dependencies","args":[{"id":8,"class":"OrderValidation"}]}	2015-02-09 20:00:50.928824	2015-02-09 20:00:50.928824
16	4	Workflow::Error	{"parent":{"id":4,"class":"Workflow::Process"},"target":{"id":4,"class":"Workflow::Process"},"method":"build_dependencies","args":[{"id":8,"class":"OrderValidation"}]}	2015-02-09 20:02:15.555284	2015-02-09 20:02:15.555284
17	9	Workflow::Operation	{"resource":{"id":11,"class":"Order"},"url_path":"edit_order_path","url_params":[{"id":11,"class":"Order"}]}	2015-02-09 20:02:27.605936	2015-02-09 20:02:27.605936
18	10	Workflow::Operation	{"resource":{"id":11,"class":"Order"},"url_path":"edit_order_path","url_params":[{"id":11,"class":"Order"}],"orderValid":true}	2015-02-09 20:12:23.773507	2015-02-09 20:12:23.773507
19	5	RailsWorkflow::Process	{"resource":{"id":12,"class":"Order"}}	2015-02-10 16:21:43.67017	2015-02-10 16:21:43.67017
20	11	RailsWorkflow::Operation	{"resource":{"id":12,"class":"Order"}}	2015-02-10 16:21:43.896855	2015-02-10 16:21:43.896855
21	12	RailsWorkflow::Operation	{"resource":{"id":12,"class":"Order"},"orderValid":false,"url_path":"edit_order_path","url_params":[{"id":12,"class":"Order"}]}	2015-02-10 16:21:44.204188	2015-02-10 16:21:44.204188
22	13	RailsWorkflow::Operation	{"resource":{"id":12,"class":"Order"},"orderValid":true,"url_path":"edit_order_path","url_params":[{"id":12,"class":"Order"}]}	2015-02-10 16:22:26.885045	2015-02-10 16:22:26.885045
\.


--
-- Name: rails_workflow_contexts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('rails_workflow_contexts_id_seq', 22, true);


--
-- Data for Name: rails_workflow_errors; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY rails_workflow_errors (id, message, stack_trace, parent_id, parent_type, created_at, updated_at, resolved) FROM stdin;
\.


--
-- Name: rails_workflow_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('rails_workflow_errors_id_seq', 4, true);


--
-- Data for Name: rails_workflow_operation_templates; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY rails_workflow_operation_templates (id, title, source, dependencies, operation_class, process_template_id, created_at, updated_at, async, child_process_id, assignment_id, assignment_type, kind, role, "group", instruction, is_background, type) FROM stdin;
1	Order Validation	\N	\N	OrderValidation	1	2015-02-09 18:49:05.693104	2015-02-09 18:49:05.693104	f	\N	\N	\N	default	\N	\N	\N	t	
2	Correct Invalid Order Information	\N	[{"id":1,"statuses":[2]}]	ProcessInvalidOrder	1	2015-02-09 19:07:56.488993	2015-02-09 19:07:56.488993	f	\N	\N	\N	user_role	sale	\N		t	ProcessInvalidOrderTemplate
3	Reserve Stock Positions	\N	[{"id":1,"statuses":[2]},{"id":2,"statuses":[2]}]	ReserveStockPositions	1	2015-02-09 19:20:47.127717	2015-02-09 19:20:47.127717	f	\N	\N	\N	default	\N	\N	\N	t	ReserveStockPositionsTemplate
\.


--
-- Name: rails_workflow_operation_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('rails_workflow_operation_templates_id_seq', 3, true);


--
-- Data for Name: rails_workflow_operations; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY rails_workflow_operations (id, status, async, title, created_at, updated_at, process_id, template_id, dependencies, child_process_id, assignment_id, assignment_type, assigned_at, type, is_active, completed_at, is_background) FROM stdin;
11	2	f	Order Validation	2015-02-10 16:21:43.884884	2015-02-10 16:21:44.016677	5	1	[]	\N	\N	\N	\N	OrderValidation	\N	2015-02-10 16:21:44.01373	t
12	2	f	Correct Invalid Order Information #12	2015-02-10 16:21:44.147104	2015-02-10 16:22:26.782557	5	2	[{"operation_id":11,"status":2}]	\N	4	User	2015-02-10 16:22:24.213059	ProcessInvalidOrder	t	2015-02-10 16:22:26.780255	t
13	2	f	Reserve Stock Positions	2015-02-10 16:22:26.849853	2015-02-10 16:22:26.981909	5	3	[{"operation_id":12,"status":2}]	\N	\N	\N	\N	ReserveStockPositions	\N	2015-02-10 16:22:26.979301	t
\.


--
-- Name: rails_workflow_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('rails_workflow_operations_id_seq', 13, true);


--
-- Data for Name: rails_workflow_process_templates; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY rails_workflow_process_templates (id, title, source, manager_class, process_class, created_at, updated_at, type) FROM stdin;
1	Processing Order #	\N			2015-02-09 18:43:33.026077	2015-02-09 18:43:33.026077	
\.


--
-- Name: rails_workflow_process_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('rails_workflow_process_templates_id_seq', 1, true);


--
-- Data for Name: rails_workflow_processes; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY rails_workflow_processes (id, status, async, title, created_at, updated_at, template_id, type) FROM stdin;
5	2	\N	Processing Order #	2015-02-10 16:21:43.590604	2015-02-10 16:22:27.086875	1	\N
\.


--
-- Name: rails_workflow_processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('rails_workflow_processes_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY schema_migrations (version) FROM stdin;
20150209172314
20150209172316
20150123172243
20150202091139
20150206192702
20150207181058
20150209173226
20150209175803
20150209175919
20150209175923
20150209180608
20150210070051
20150210161941
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: localhost
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, role) FROM stdin;
2	admin@test.com	$2a$10$uwn.riGpK2tmiAQuja.ncO1TyxJXLGXlVgFQDmrb8TkbxCpTKPx5C	\N	\N	\N	1	2015-02-09 17:39:01.996479	2015-02-09 17:39:01.996479	127.0.0.1	127.0.0.1	2015-02-09 17:39:01.979426	2015-02-09 17:39:01.999412	admin	\N
1	user@example.com	$2a$10$7.mF5KHhg0zk1Z55czWDde8fvyLZcwlJUyIYaxrg.ZNne1ybpNfPW	\N	\N	\N	0	\N	\N	\N	\N	2015-02-09 17:23:35.585533	2015-02-09 18:07:18.22158	\N	admin
3	admin@admin.com	$2a$10$pbd2cRrXF21CSyrxEY1beuJQOVODii.Lxd8E6Vtz9UuLWXOxH1N/6	\N	\N	\N	0	\N	\N	\N	\N	2015-02-09 19:31:00.55203	2015-02-09 19:31:00.55203	\N	admin
6	prov@test.com	$2a$10$nHNcKhbgsug4sEEZcxczieShWRY0IUDE419SX5FkJcgQjwwUfNrVy	\N	\N	\N	0	\N	\N	\N	\N	2015-02-09 19:31:16.577724	2015-02-09 19:31:16.577724	\N	stock
5	customer@test.com	$2a$10$GgJUkMbcNmbdP.q9F2WU5.1o7KkX8EURvd5Haj464o1gWVHCO3Ut2	\N	\N	\N	1	2015-02-09 19:31:31.591745	2015-02-09 19:31:31.591745	127.0.0.1	127.0.0.1	2015-02-09 19:31:00.74892	2015-02-09 19:31:31.594472	\N	customer
4	sales@test.com	$2a$10$JrGQMjOCDWfwJGMv0ouOt.iesteNmQdfcLP2SBIoo7TXwrZCTqqEC	\N	\N	\N	2	2015-02-10 16:22:17.952585	2015-02-09 19:53:51.116009	127.0.0.1	127.0.0.1	2015-02-09 19:31:00.657197	2015-02-10 16:22:17.96001	\N	sale
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: localhost
--

SELECT pg_catalog.setval('users_id_seq', 6, true);


--
-- Name: order_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY order_lines
    ADD CONSTRAINT order_lines_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: rails_workflow_contexts_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY rails_workflow_contexts
    ADD CONSTRAINT rails_workflow_contexts_pkey PRIMARY KEY (id);


--
-- Name: rails_workflow_errors_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY rails_workflow_errors
    ADD CONSTRAINT rails_workflow_errors_pkey PRIMARY KEY (id);


--
-- Name: rails_workflow_operation_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY rails_workflow_operation_templates
    ADD CONSTRAINT rails_workflow_operation_templates_pkey PRIMARY KEY (id);


--
-- Name: rails_workflow_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY rails_workflow_operations
    ADD CONSTRAINT rails_workflow_operations_pkey PRIMARY KEY (id);


--
-- Name: rails_workflow_process_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY rails_workflow_process_templates
    ADD CONSTRAINT rails_workflow_process_templates_pkey PRIMARY KEY (id);


--
-- Name: rails_workflow_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY rails_workflow_processes
    ADD CONSTRAINT rails_workflow_processes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: localhost; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_rails_workflow_contexts_on_parent_id_and_parent_type; Type: INDEX; Schema: public; Owner: localhost; Tablespace:
--

CREATE INDEX index_rails_workflow_contexts_on_parent_id_and_parent_type ON rails_workflow_contexts USING btree (parent_id, parent_type);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: localhost; Tablespace:
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: localhost; Tablespace:
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: localhost; Tablespace:
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: localhost
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM localhost;
GRANT ALL ON SCHEMA public TO localhost;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

