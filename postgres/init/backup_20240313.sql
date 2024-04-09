--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

CREATE DATABASE noc_solucoes;

\connect noc_solucoes;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: core_access_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_access_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(50),
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    cpf character varying(14),
    telephone character varying(15)
);


ALTER TABLE public.core_access_user OWNER TO postgres;

--
-- Name: core_access_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_access_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.core_access_user_groups OWNER TO postgres;

--
-- Name: core_access_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_access_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_access_user_groups_id_seq OWNER TO postgres;

--
-- Name: core_access_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_access_user_groups_id_seq OWNED BY public.core_access_user_groups.id;


--
-- Name: core_access_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_access_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_access_user_id_seq OWNER TO postgres;

--
-- Name: core_access_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_access_user_id_seq OWNED BY public.core_access_user.id;


--
-- Name: core_access_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_access_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.core_access_user_user_permissions OWNER TO postgres;

--
-- Name: core_access_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_access_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_access_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: core_access_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_access_user_user_permissions_id_seq OWNED BY public.core_access_user_user_permissions.id;


--
-- Name: core_contact_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_contact_contact (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.core_contact_contact OWNER TO postgres;

--
-- Name: core_contact_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_contact_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contact_contact_id_seq OWNER TO postgres;

--
-- Name: core_contact_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_contact_contact_id_seq OWNED BY public.core_contact_contact.id;


--
-- Name: core_log_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_log_log (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    type integer NOT NULL,
    model character varying(100) NOT NULL,
    data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_log_log OWNER TO postgres;

--
-- Name: core_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_log_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_log_log_id_seq OWNER TO postgres;

--
-- Name: core_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_log_log_id_seq OWNED BY public.core_log_log.id;


--
-- Name: core_registration_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_application (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.core_registration_application OWNER TO postgres;

--
-- Name: core_registration_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_application_id_seq OWNER TO postgres;

--
-- Name: core_registration_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_application_id_seq OWNED BY public.core_registration_application.id;


--
-- Name: core_registration_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_city (
    id integer NOT NULL,
    description character varying(45) NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.core_registration_city OWNER TO postgres;

--
-- Name: core_registration_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_city_id_seq OWNER TO postgres;

--
-- Name: core_registration_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_city_id_seq OWNED BY public.core_registration_city.id;


--
-- Name: core_registration_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_company (
    id integer NOT NULL,
    registration_date timestamp with time zone NOT NULL,
    description character varying(150) NOT NULL,
    address character varying(200) NOT NULL,
    city_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_registration_company OWNER TO postgres;

--
-- Name: core_registration_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_company_id_seq OWNER TO postgres;

--
-- Name: core_registration_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_company_id_seq OWNED BY public.core_registration_company.id;


--
-- Name: core_registration_companyapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_companyapplication (
    id integer NOT NULL,
    registration_date timestamp with time zone NOT NULL,
    application_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.core_registration_companyapplication OWNER TO postgres;

--
-- Name: core_registration_companyapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_companyapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_companyapplication_id_seq OWNER TO postgres;

--
-- Name: core_registration_companyapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_companyapplication_id_seq OWNED BY public.core_registration_companyapplication.id;


--
-- Name: core_registration_companyuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_companyuser (
    id integer NOT NULL,
    registration_date timestamp with time zone NOT NULL,
    company_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.core_registration_companyuser OWNER TO postgres;

--
-- Name: core_registration_companyuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_companyuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_companyuser_id_seq OWNER TO postgres;

--
-- Name: core_registration_companyuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_companyuser_id_seq OWNED BY public.core_registration_companyuser.id;


--
-- Name: core_registration_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_country (
    id integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.core_registration_country OWNER TO postgres;

--
-- Name: core_registration_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_country_id_seq OWNER TO postgres;

--
-- Name: core_registration_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_country_id_seq OWNED BY public.core_registration_country.id;


--
-- Name: core_registration_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_state (
    id integer NOT NULL,
    description character varying(100) NOT NULL,
    acronym character varying(2) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.core_registration_state OWNER TO postgres;

--
-- Name: core_registration_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_state_id_seq OWNER TO postgres;

--
-- Name: core_registration_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_state_id_seq OWNED BY public.core_registration_state.id;


--
-- Name: core_registration_userapplication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_registration_userapplication (
    id integer NOT NULL,
    company_application_id integer NOT NULL,
    company_user_id integer NOT NULL
);


ALTER TABLE public.core_registration_userapplication OWNER TO postgres;

--
-- Name: core_registration_userapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_registration_userapplication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_registration_userapplication_id_seq OWNER TO postgres;

--
-- Name: core_registration_userapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_registration_userapplication_id_seq OWNED BY public.core_registration_userapplication.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: nerv_accelerometermeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_accelerometermeasure (
    id integer NOT NULL,
    x bigint NOT NULL,
    x_sf integer NOT NULL,
    y bigint NOT NULL,
    y_sf integer NOT NULL,
    z bigint NOT NULL,
    z_sf integer NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.nerv_accelerometermeasure OWNER TO postgres;

--
-- Name: nerv_accelerometermeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_accelerometermeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_accelerometermeasure_id_seq OWNER TO postgres;

--
-- Name: nerv_accelerometermeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_accelerometermeasure_id_seq OWNED BY public.nerv_accelerometermeasure.id;


--
-- Name: nerv_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_area (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    description text NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.nerv_area OWNER TO postgres;

--
-- Name: nerv_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_area_id_seq OWNER TO postgres;

--
-- Name: nerv_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_area_id_seq OWNED BY public.nerv_area.id;


--
-- Name: nerv_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_device (
    id integer NOT NULL,
    ip character varying(20) NOT NULL,
    mac character varying(20) NOT NULL,
    description text NOT NULL,
    status character varying(45) NOT NULL,
    registration_date timestamp with time zone NOT NULL
);


ALTER TABLE public.nerv_device OWNER TO postgres;

--
-- Name: nerv_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_device_id_seq OWNER TO postgres;

--
-- Name: nerv_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_device_id_seq OWNED BY public.nerv_device.id;


--
-- Name: nerv_humiditymeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_humiditymeasure (
    id integer NOT NULL,
    humidity bigint NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.nerv_humiditymeasure OWNER TO postgres;

--
-- Name: nerv_humiditymeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_humiditymeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_humiditymeasure_id_seq OWNER TO postgres;

--
-- Name: nerv_humiditymeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_humiditymeasure_id_seq OWNED BY public.nerv_humiditymeasure.id;


--
-- Name: nerv_luminositymeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_luminositymeasure (
    id integer NOT NULL,
    luminosity bigint NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.nerv_luminositymeasure OWNER TO postgres;

--
-- Name: nerv_luminositymeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_luminositymeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_luminositymeasure_id_seq OWNER TO postgres;

--
-- Name: nerv_luminositymeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_luminositymeasure_id_seq OWNED BY public.nerv_luminositymeasure.id;


--
-- Name: nerv_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_measurement (
    id integer NOT NULL,
    date_time_stamp timestamp with time zone NOT NULL,
    message_counter integer NOT NULL,
    generation boolean NOT NULL,
    setup_id integer NOT NULL
);


ALTER TABLE public.nerv_measurement OWNER TO postgres;

--
-- Name: nerv_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_measurement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_measurement_id_seq OWNER TO postgres;

--
-- Name: nerv_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_measurement_id_seq OWNED BY public.nerv_measurement.id;


--
-- Name: nerv_setup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_setup (
    id integer NOT NULL,
    date_setup timestamp with time zone NOT NULL,
    status character varying(45) NOT NULL,
    description text NOT NULL,
    area_id integer NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.nerv_setup OWNER TO postgres;

--
-- Name: nerv_setup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_setup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_setup_id_seq OWNER TO postgres;

--
-- Name: nerv_setup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_setup_id_seq OWNED BY public.nerv_setup.id;


--
-- Name: nerv_temperaturemeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nerv_temperaturemeasure (
    id integer NOT NULL,
    temperature bigint NOT NULL,
    temperature_sf integer NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.nerv_temperaturemeasure OWNER TO postgres;

--
-- Name: nerv_temperaturemeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nerv_temperaturemeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nerv_temperaturemeasure_id_seq OWNER TO postgres;

--
-- Name: nerv_temperaturemeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nerv_temperaturemeasure_id_seq OWNED BY public.nerv_temperaturemeasure.id;


--
-- Name: organic_nodes_control_area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_area (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    description text NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_area OWNER TO postgres;

--
-- Name: organic_nodes_control_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_area_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_area_id_seq OWNED BY public.organic_nodes_control_area.id;


--
-- Name: organic_nodes_control_central; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_central (
    id integer NOT NULL,
    registration_date timestamp with time zone NOT NULL,
    mac character varying(20) NOT NULL,
    model text NOT NULL,
    status character varying(8) NOT NULL,
    scaling_governor text NOT NULL,
    data_permanence integer NOT NULL,
    version_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_central OWNER TO postgres;

--
-- Name: organic_nodes_control_central_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_central_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_central_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_central_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_central_id_seq OWNED BY public.organic_nodes_control_central.id;


--
-- Name: organic_nodes_control_circuit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_circuit (
    id integer NOT NULL,
    phase character varying(3) NOT NULL,
    breaker character varying(15) NOT NULL,
    name character varying(16) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.organic_nodes_control_circuit OWNER TO postgres;

--
-- Name: organic_nodes_control_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_circuit_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_circuit_id_seq OWNED BY public.organic_nodes_control_circuit.id;


--
-- Name: organic_nodes_control_cpuassessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_cpuassessment (
    id integer NOT NULL,
    frequency bigint NOT NULL,
    used integer NOT NULL,
    temperature bigint NOT NULL,
    temperature_sf integer NOT NULL,
    voltage bigint NOT NULL,
    voltage_sf integer NOT NULL,
    central_id integer NOT NULL,
    date_time_stamp timestamp with time zone NOT NULL
);


ALTER TABLE public.organic_nodes_control_cpuassessment OWNER TO postgres;

--
-- Name: organic_nodes_control_cpuassessment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_cpuassessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_cpuassessment_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_cpuassessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_cpuassessment_id_seq OWNED BY public.organic_nodes_control_cpuassessment.id;


--
-- Name: organic_nodes_control_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_device (
    id integer NOT NULL,
    mac character varying(20) NOT NULL,
    description text NOT NULL,
    status character varying(45) NOT NULL,
    registration_date timestamp with time zone NOT NULL,
    device_setup_id integer NOT NULL,
    device_type_id integer NOT NULL,
    ip character varying(20) NOT NULL
);


ALTER TABLE public.organic_nodes_control_device OWNER TO postgres;

--
-- Name: organic_nodes_control_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_device_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_device_id_seq OWNED BY public.organic_nodes_control_device.id;


--
-- Name: organic_nodes_control_devicecharacterizationlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_devicecharacterizationlog (
    id integer NOT NULL,
    alteration_date timestamp with time zone NOT NULL,
    type character varying(25) NOT NULL,
    status character varying(25) NOT NULL,
    description text NOT NULL,
    result_files character varying(250),
    device_id integer NOT NULL,
    device_setup_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_devicecharacterizationlog OWNER TO postgres;

--
-- Name: organic_nodes_control_devicecharacterizationlog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_devicecharacterizationlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_devicecharacterizationlog_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_devicecharacterizationlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_devicecharacterizationlog_id_seq OWNED BY public.organic_nodes_control_devicecharacterizationlog.id;


--
-- Name: organic_nodes_control_devicecompany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_devicecompany (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.organic_nodes_control_devicecompany OWNER TO postgres;

--
-- Name: organic_nodes_control_devicecompany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_devicecompany_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_devicecompany_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_devicecompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_devicecompany_id_seq OWNED BY public.organic_nodes_control_devicecompany.id;


--
-- Name: organic_nodes_control_devicesetup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_devicesetup (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL,
    firmware_id integer NOT NULL,
    hardware_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_devicesetup OWNER TO postgres;

--
-- Name: organic_nodes_control_devicesetup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_devicesetup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_devicesetup_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_devicesetup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_devicesetup_id_seq OWNED BY public.organic_nodes_control_devicesetup.id;


--
-- Name: organic_nodes_control_devicetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_devicetype (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL,
    device_company_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_devicetype OWNER TO postgres;

--
-- Name: organic_nodes_control_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_devicetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_devicetype_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_devicetype_id_seq OWNED BY public.organic_nodes_control_devicetype.id;


--
-- Name: organic_nodes_control_energymeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_energymeasure (
    id integer NOT NULL,
    current integer NOT NULL,
    current_sf integer NOT NULL,
    voltage integer NOT NULL,
    voltage_sf integer NOT NULL,
    measurement_id integer NOT NULL,
    phase character varying(1) NOT NULL
);


ALTER TABLE public.organic_nodes_control_energymeasure OWNER TO postgres;

--
-- Name: organic_nodes_control_energymeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_energymeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_energymeasure_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_energymeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_energymeasure_id_seq OWNED BY public.organic_nodes_control_energymeasure.id;


--
-- Name: organic_nodes_control_firmware; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_firmware (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    version character varying(5) NOT NULL,
    nature character varying(5) NOT NULL,
    function character varying(5) NOT NULL,
    status character varying(5) NOT NULL,
    description text NOT NULL,
    path character varying(150) NOT NULL
);


ALTER TABLE public.organic_nodes_control_firmware OWNER TO postgres;

--
-- Name: organic_nodes_control_firmware_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_firmware_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_firmware_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_firmware_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_firmware_id_seq OWNED BY public.organic_nodes_control_firmware.id;


--
-- Name: organic_nodes_control_fport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_fport (
    id integer NOT NULL,
    fport integer NOT NULL,
    nature character varying(20) NOT NULL,
    description text NOT NULL,
    firmware_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_fport OWNER TO postgres;

--
-- Name: organic_nodes_control_fport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_fport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_fport_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_fport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_fport_id_seq OWNED BY public.organic_nodes_control_fport.id;


--
-- Name: organic_nodes_control_frequencymeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_frequencymeasure (
    id integer NOT NULL,
    frequency bigint NOT NULL,
    frequency_sf integer NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_frequencymeasure OWNER TO postgres;

--
-- Name: organic_nodes_control_frequencymeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_frequencymeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_frequencymeasure_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_frequencymeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_frequencymeasure_id_seq OWNED BY public.organic_nodes_control_frequencymeasure.id;


--
-- Name: organic_nodes_control_hardware; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_hardware (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    nature character varying(5) NOT NULL,
    version character varying(5) NOT NULL,
    esp_router integer NOT NULL,
    current_ic character varying(5) NOT NULL,
    sensor character varying(5) NOT NULL,
    status character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.organic_nodes_control_hardware OWNER TO postgres;

--
-- Name: organic_nodes_control_hardware_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_hardware_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_hardware_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_hardware_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_hardware_id_seq OWNED BY public.organic_nodes_control_hardware.id;


--
-- Name: organic_nodes_control_loraaccess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_loraaccess (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    device_eui character varying(25) NOT NULL,
    lora_server character varying(25) NOT NULL,
    status character varying(10) NOT NULL,
    otaa_app_key character varying(100) NOT NULL,
    device_profile character varying(15) NOT NULL
);


ALTER TABLE public.organic_nodes_control_loraaccess OWNER TO postgres;

--
-- Name: organic_nodes_control_loraaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_loraaccess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_loraaccess_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_loraaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_loraaccess_id_seq OWNED BY public.organic_nodes_control_loraaccess.id;


--
-- Name: organic_nodes_control_loradevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_loradevice (
    id integer NOT NULL,
    device_id integer NOT NULL,
    lora_access_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_loradevice OWNER TO postgres;

--
-- Name: organic_nodes_control_loradevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_loradevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_loradevice_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_loradevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_loradevice_id_seq OWNED BY public.organic_nodes_control_loradevice.id;


--
-- Name: organic_nodes_control_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_measurement (
    id integer NOT NULL,
    date_time_stamp timestamp with time zone NOT NULL,
    message_counter integer NOT NULL,
    setup_id integer NOT NULL,
    source integer NOT NULL,
    generation boolean NOT NULL
);


ALTER TABLE public.organic_nodes_control_measurement OWNER TO postgres;

--
-- Name: organic_nodes_control_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_measurement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_measurement_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_measurement_id_seq OWNED BY public.organic_nodes_control_measurement.id;


--
-- Name: organic_nodes_control_memoryassessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_memoryassessment (
    id integer NOT NULL,
    ram_used integer NOT NULL,
    memory_free integer NOT NULL,
    memory_total integer NOT NULL,
    central_id integer NOT NULL,
    date_time_stamp timestamp with time zone NOT NULL
);


ALTER TABLE public.organic_nodes_control_memoryassessment OWNER TO postgres;

--
-- Name: organic_nodes_control_memoryassessment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_memoryassessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_memoryassessment_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_memoryassessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_memoryassessment_id_seq OWNED BY public.organic_nodes_control_memoryassessment.id;


--
-- Name: organic_nodes_control_monitoreddevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_monitoreddevice (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL,
    "monthly_kW_consumption" numeric(12,3) NOT NULL,
    voltage integer NOT NULL,
    power integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_monitoreddevice OWNER TO postgres;

--
-- Name: organic_nodes_control_monitoreddevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_monitoreddevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_monitoreddevice_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_monitoreddevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_monitoreddevice_id_seq OWNED BY public.organic_nodes_control_monitoreddevice.id;


--
-- Name: organic_nodes_control_mqttaccess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_mqttaccess (
    id integer NOT NULL,
    mqtt_id character varying(45) NOT NULL,
    mqtt_port integer NOT NULL,
    status character varying(10) NOT NULL,
    mqtt_server character varying(20) NOT NULL,
    pub_topic character varying(100) NOT NULL,
    action character varying(10) NOT NULL,
    type character varying(10) NOT NULL,
    sub_topic character varying(100) NOT NULL,
    sub_user character varying(20) NOT NULL,
    pub_user character varying(20) NOT NULL,
    user_mqtt character varying(20) NOT NULL
);


ALTER TABLE public.organic_nodes_control_mqttaccess OWNER TO postgres;

--
-- Name: organic_nodes_control_mqttaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_mqttaccess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_mqttaccess_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_mqttaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_mqttaccess_id_seq OWNED BY public.organic_nodes_control_mqttaccess.id;


--
-- Name: organic_nodes_control_mqttdevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_mqttdevice (
    id integer NOT NULL,
    device_id integer NOT NULL,
    mqtt_access_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_mqttdevice OWNER TO postgres;

--
-- Name: organic_nodes_control_mqttdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_mqttdevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_mqttdevice_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_mqttdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_mqttdevice_id_seq OWNED BY public.organic_nodes_control_mqttdevice.id;


--
-- Name: organic_nodes_control_networkmeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_networkmeasure (
    id integer NOT NULL,
    gateway_id character varying(25) NOT NULL,
    send_pack_counter integer NOT NULL,
    rssi integer NOT NULL,
    snr numeric(9,3) NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_networkmeasure OWNER TO postgres;

--
-- Name: organic_nodes_control_networkmeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_networkmeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_networkmeasure_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_networkmeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_networkmeasure_id_seq OWNED BY public.organic_nodes_control_networkmeasure.id;


--
-- Name: organic_nodes_control_powermeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_powermeasure (
    id integer NOT NULL,
    phase character varying(1) NOT NULL,
    power_factor numeric(6,3) NOT NULL,
    active_power bigint NOT NULL,
    active_power_sf integer NOT NULL,
    reactive_power bigint NOT NULL,
    reactive_power_sf integer NOT NULL,
    measurement_id integer NOT NULL,
    voltage_current_angle bigint NOT NULL,
    apparent_power bigint NOT NULL,
    apparent_power_sf integer NOT NULL,
    voltage_current_angle_sf integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_powermeasure OWNER TO postgres;

--
-- Name: organic_nodes_control_powermeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_powermeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_powermeasure_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_powermeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_powermeasure_id_seq OWNED BY public.organic_nodes_control_powermeasure.id;


--
-- Name: organic_nodes_control_temperaturemeasurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_temperaturemeasurement (
    id integer NOT NULL,
    temperature bigint NOT NULL,
    temperature_sf integer NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_temperaturemeasurement OWNER TO postgres;

--
-- Name: organic_nodes_control_sensormeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_sensormeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_sensormeasure_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_sensormeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_sensormeasure_id_seq OWNED BY public.organic_nodes_control_temperaturemeasurement.id;


--
-- Name: organic_nodes_control_setup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_setup (
    id integer NOT NULL,
    date_setup timestamp with time zone NOT NULL,
    status character varying(45) NOT NULL,
    description text NOT NULL,
    area_id integer NOT NULL,
    circuit_id integer NOT NULL,
    device_id integer NOT NULL,
    monitored_device_id integer NOT NULL,
    central_id integer
);


ALTER TABLE public.organic_nodes_control_setup OWNER TO postgres;

--
-- Name: organic_nodes_control_setup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_setup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_setup_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_setup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_setup_id_seq OWNED BY public.organic_nodes_control_setup.id;


--
-- Name: organic_nodes_control_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_version (
    id integer NOT NULL,
    version character varying(10) NOT NULL,
    repositorio text NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.organic_nodes_control_version OWNER TO postgres;

--
-- Name: organic_nodes_control_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_version_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_version_id_seq OWNED BY public.organic_nodes_control_version.id;


--
-- Name: organic_nodes_control_voltagelagmeasure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organic_nodes_control_voltagelagmeasure (
    id integer NOT NULL,
    angle bigint NOT NULL,
    angle_sf integer NOT NULL,
    phase_combination character varying(3) NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.organic_nodes_control_voltagelagmeasure OWNER TO postgres;

--
-- Name: organic_nodes_control_voltagelagmeasure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organic_nodes_control_voltagelagmeasure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organic_nodes_control_voltagelagmeasure_id_seq OWNER TO postgres;

--
-- Name: organic_nodes_control_voltagelagmeasure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organic_nodes_control_voltagelagmeasure_id_seq OWNED BY public.organic_nodes_control_voltagelagmeasure.id;


--
-- Name: solar_energy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_energy (
    id integer NOT NULL,
    measured_by character varying(15) NOT NULL,
    unit_measurement character varying(5) NOT NULL,
    date timestamp with time zone NOT NULL,
    value numeric(11,4) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_energy OWNER TO postgres;

--
-- Name: solar_energy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_energy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_energy_id_seq OWNER TO postgres;

--
-- Name: solar_energy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_energy_id_seq OWNED BY public.solar_energy.id;


--
-- Name: solar_energydetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_energydetail (
    id integer NOT NULL,
    type character varying(15) NOT NULL,
    date timestamp with time zone NOT NULL,
    value numeric(18,6) NOT NULL,
    unit_measurement character varying(5) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_energydetail OWNER TO postgres;

--
-- Name: solar_energydetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_energydetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_energydetail_id_seq OWNER TO postgres;

--
-- Name: solar_energydetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_energydetail_id_seq OWNED BY public.solar_energydetail.id;


--
-- Name: solar_environmentbenefit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_environmentbenefit (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    benefit character varying(20) NOT NULL,
    quantity numeric(19,6) NOT NULL,
    type character varying(20) NOT NULL,
    unit_measurement character varying(10) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_environmentbenefit OWNER TO postgres;

--
-- Name: solar_environmentbenefit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_environmentbenefit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_environmentbenefit_id_seq OWNER TO postgres;

--
-- Name: solar_environmentbenefit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_environmentbenefit_id_seq OWNED BY public.solar_environmentbenefit.id;


--
-- Name: solar_inverter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_inverter (
    id integer NOT NULL,
    description character varying(15) NOT NULL,
    manufacturer character varying(15) NOT NULL,
    model character varying(25) NOT NULL,
    serial_number character varying(25) NOT NULL,
    communication_method character varying(15) NOT NULL,
    connected_optimizers integer NOT NULL,
    version_firmware1 character varying(15) NOT NULL,
    version_firmware2 character varying(15) NOT NULL,
    cpu_version character varying(15) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_inverter OWNER TO postgres;

--
-- Name: solar_inverter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_inverter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_inverter_id_seq OWNER TO postgres;

--
-- Name: solar_inverter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_inverter_id_seq OWNED BY public.solar_inverter.id;


--
-- Name: solar_inverterdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_inverterdata (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    total_active_power numeric(12,4) NOT NULL,
    dc_voltage numeric(12,4) NOT NULL,
    ground_fault_resistance numeric(12,4) NOT NULL,
    power_limit numeric(9,4) NOT NULL,
    total_energy numeric(18,6) NOT NULL,
    temperature numeric(5,3) NOT NULL,
    inverter_mode character varying(25) NOT NULL,
    operation_mode integer NOT NULL,
    l1_ca_frequency numeric(12,4) NOT NULL,
    l1_ca_current numeric(12,4) NOT NULL,
    l1_ca_voltage numeric(12,4) NOT NULL,
    l1_apparent_power numeric(12,4) NOT NULL,
    l1_active_power numeric(12,4) NOT NULL,
    l1_reactive_power numeric(12,4) NOT NULL,
    l1_cos_phi numeric(4,2) NOT NULL,
    vl1to2 numeric(12,4) NOT NULL,
    l2_ca_frequency numeric(12,4) NOT NULL,
    l2_ca_current numeric(12,4) NOT NULL,
    l2_ca_voltage numeric(12,4) NOT NULL,
    l2_apparent_power numeric(12,4) NOT NULL,
    l2_active_power numeric(12,4) NOT NULL,
    l2_reactive_power numeric(12,4) NOT NULL,
    l2_cos_phi numeric(4,2) NOT NULL,
    vl2to3 numeric(12,4) NOT NULL,
    l3_ca_frequency numeric(12,4) NOT NULL,
    l3_ca_current numeric(12,4) NOT NULL,
    l3_ca_voltage numeric(12,4) NOT NULL,
    l3_apparent_power numeric(12,4) NOT NULL,
    l3_active_power numeric(12,4) NOT NULL,
    l3_reactive_power numeric(12,4) NOT NULL,
    l3_cos_phi numeric(4,2) NOT NULL,
    vl3to1 numeric(12,4) NOT NULL,
    inverter_id integer NOT NULL
);


ALTER TABLE public.solar_inverterdata OWNER TO postgres;

--
-- Name: solar_inverterdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_inverterdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_inverterdata_id_seq OWNER TO postgres;

--
-- Name: solar_inverterdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_inverterdata_id_seq OWNED BY public.solar_inverterdata.id;


--
-- Name: solar_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_module (
    id integer NOT NULL,
    description character varying(25) NOT NULL,
    serial_number character varying(25) NOT NULL,
    module_id_site integer NOT NULL,
    string_id integer NOT NULL
);


ALTER TABLE public.solar_module OWNER TO postgres;

--
-- Name: solar_module_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_module_id_seq OWNER TO postgres;

--
-- Name: solar_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_module_id_seq OWNED BY public.solar_module.id;


--
-- Name: solar_moduledata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_moduledata (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    current numeric(22,20) NOT NULL,
    current_unit character varying(5) NOT NULL,
    power numeric(25,20) NOT NULL,
    power_unit character varying(5) NOT NULL,
    module_voltage numeric(9,4) NOT NULL,
    module_voltage_unit character varying(5) NOT NULL,
    optimizer_voltage numeric(9,4) NOT NULL,
    optimizer_voltage_unit character varying(5) NOT NULL,
    module_id integer NOT NULL
);


ALTER TABLE public.solar_moduledata OWNER TO postgres;

--
-- Name: solar_moduledata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_moduledata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_moduledata_id_seq OWNER TO postgres;

--
-- Name: solar_moduledata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_moduledata_id_seq OWNED BY public.solar_moduledata.id;


--
-- Name: solar_moduleenergy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_moduleenergy (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    value numeric(9,4) NOT NULL,
    unit character varying(5) NOT NULL,
    module_id integer NOT NULL
);


ALTER TABLE public.solar_moduleenergy OWNER TO postgres;

--
-- Name: solar_moduleenergy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_moduleenergy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_moduleenergy_id_seq OWNER TO postgres;

--
-- Name: solar_moduleenergy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_moduleenergy_id_seq OWNED BY public.solar_moduleenergy.id;


--
-- Name: solar_moduleposition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_moduleposition (
    id integer NOT NULL,
    x_position numeric(9,4) NOT NULL,
    y_position numeric(9,4) NOT NULL,
    rotation numeric(9,4) NOT NULL,
    orientation character varying(10) NOT NULL,
    module_id integer NOT NULL
);


ALTER TABLE public.solar_moduleposition OWNER TO postgres;

--
-- Name: solar_moduleposition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_moduleposition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_moduleposition_id_seq OWNER TO postgres;

--
-- Name: solar_moduleposition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_moduleposition_id_seq OWNED BY public.solar_moduleposition.id;


--
-- Name: solar_overview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_overview (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    total_energy numeric(18,6) NOT NULL,
    year_energy numeric(18,6) NOT NULL,
    month_energy numeric(18,6) NOT NULL,
    day_energy numeric(18,6) NOT NULL,
    current_power numeric(18,6) NOT NULL,
    measured_by character varying(15) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_overview OWNER TO postgres;

--
-- Name: solar_overview_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_overview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_overview_id_seq OWNER TO postgres;

--
-- Name: solar_overview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_overview_id_seq OWNED BY public.solar_overview.id;


--
-- Name: solar_power; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_power (
    id integer NOT NULL,
    measured_by character varying(15) NOT NULL,
    unit_measurement character varying(5) NOT NULL,
    date timestamp with time zone NOT NULL,
    value numeric(11,4) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_power OWNER TO postgres;

--
-- Name: solar_power_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_power_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_power_id_seq OWNER TO postgres;

--
-- Name: solar_power_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_power_id_seq OWNED BY public.solar_power.id;


--
-- Name: solar_powerdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_powerdetail (
    id integer NOT NULL,
    unit_measurement character varying(5) NOT NULL,
    date timestamp with time zone NOT NULL,
    value numeric(12,4) NOT NULL,
    power_plant_id integer NOT NULL
);


ALTER TABLE public.solar_powerdetail OWNER TO postgres;

--
-- Name: solar_powerdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_powerdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_powerdetail_id_seq OWNER TO postgres;

--
-- Name: solar_powerdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_powerdetail_id_seq OWNED BY public.solar_powerdetail.id;


--
-- Name: solar_powerplant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_powerplant (
    id integer NOT NULL,
    id_power_plant integer NOT NULL,
    description character varying(45) NOT NULL,
    status character varying(15) NOT NULL,
    peak_power numeric(9,4) NOT NULL,
    last_update_time timestamp with time zone NOT NULL,
    installation_date timestamp with time zone NOT NULL,
    notes character varying(15) NOT NULL,
    type character varying(45) NOT NULL,
    address character varying(45) NOT NULL,
    zip character varying(45) NOT NULL,
    maximum_power numeric(9,4) NOT NULL,
    city_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.solar_powerplant OWNER TO postgres;

--
-- Name: solar_powerplant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_powerplant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_powerplant_id_seq OWNER TO postgres;

--
-- Name: solar_powerplant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_powerplant_id_seq OWNED BY public.solar_powerplant.id;


--
-- Name: solar_predictionsenergy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_predictionsenergy (
    id integer NOT NULL,
    prediction_date timestamp with time zone NOT NULL
);


ALTER TABLE public.solar_predictionsenergy OWNER TO postgres;

--
-- Name: solar_predictionsenergy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_predictionsenergy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_predictionsenergy_id_seq OWNER TO postgres;

--
-- Name: solar_predictionsenergy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_predictionsenergy_id_seq OWNED BY public.solar_predictionsenergy.id;


--
-- Name: solar_predictionsenergyvalues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_predictionsenergyvalues (
    id integer NOT NULL,
    generation_date timestamp with time zone NOT NULL,
    prediction_type character varying(6) NOT NULL,
    power_prediction numeric(11,4) NOT NULL,
    id_prediction_id integer NOT NULL
);


ALTER TABLE public.solar_predictionsenergyvalues OWNER TO postgres;

--
-- Name: solar_predictionsenergyvalues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_predictionsenergyvalues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_predictionsenergyvalues_id_seq OWNER TO postgres;

--
-- Name: solar_predictionsenergyvalues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_predictionsenergyvalues_id_seq OWNED BY public.solar_predictionsenergyvalues.id;


--
-- Name: solar_runconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_runconfiguration (
    id integer NOT NULL,
    update_city boolean NOT NULL,
    update_company boolean NOT NULL,
    id_site integer NOT NULL,
    api_key character varying(45) NOT NULL,
    real_time boolean NOT NULL,
    finish_run boolean NOT NULL,
    run_interval_seconds integer NOT NULL,
    run_interval_days integer NOT NULL,
    start_date date NOT NULL,
    finish_date date NOT NULL
);


ALTER TABLE public.solar_runconfiguration OWNER TO postgres;

--
-- Name: solar_runconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_runconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_runconfiguration_id_seq OWNER TO postgres;

--
-- Name: solar_runconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_runconfiguration_id_seq OWNED BY public.solar_runconfiguration.id;


--
-- Name: solar_string; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solar_string (
    id integer NOT NULL,
    description character varying(25) NOT NULL,
    inverter_id integer NOT NULL
);


ALTER TABLE public.solar_string OWNER TO postgres;

--
-- Name: solar_string_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solar_string_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_string_id_seq OWNER TO postgres;

--
-- Name: solar_string_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solar_string_id_seq OWNED BY public.solar_string.id;


--
-- Name: wi_finder_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_application (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    api_id integer NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.wi_finder_application OWNER TO postgres;

--
-- Name: wi_finder_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_application_id_seq OWNER TO postgres;

--
-- Name: wi_finder_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_application_id_seq OWNED BY public.wi_finder_application.id;


--
-- Name: wi_finder_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_configuration (
    id integer NOT NULL,
    server_chirpstack character varying(45) NOT NULL,
    server_loracloud character varying(45) NOT NULL,
    token_id integer NOT NULL,
    application_id integer NOT NULL
);


ALTER TABLE public.wi_finder_configuration OWNER TO postgres;

--
-- Name: wi_finder_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_configuration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_configuration_id_seq OWNER TO postgres;

--
-- Name: wi_finder_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_configuration_id_seq OWNED BY public.wi_finder_configuration.id;


--
-- Name: wi_finder_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_device (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    deveui character varying(45) NOT NULL,
    application_id integer NOT NULL
);


ALTER TABLE public.wi_finder_device OWNER TO postgres;

--
-- Name: wi_finder_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_device_id_seq OWNER TO postgres;

--
-- Name: wi_finder_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_device_id_seq OWNED BY public.wi_finder_device.id;


--
-- Name: wi_finder_devicedata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_devicedata (
    id integer NOT NULL,
    date_publish timestamp with time zone NOT NULL,
    date_registration timestamp with time zone NOT NULL,
    antenna_id integer NOT NULL,
    antenna_latitude numeric(11,8) NOT NULL,
    antenna_longitude numeric(11,8) NOT NULL,
    antenna_altitude numeric(11,4) NOT NULL,
    toa numeric(9,4) NOT NULL,
    rssi numeric(9,4) NOT NULL,
    snr numeric(9,4) NOT NULL,
    mac_address1 character varying(45),
    signal_strength1 numeric(9,4) NOT NULL,
    mac_address2 character varying(45),
    signal_strength2 numeric(9,4) NOT NULL,
    mac_address3 character varying(45),
    signal_strength3 numeric(9,4) NOT NULL,
    latitude numeric(11,8) NOT NULL,
    longitude numeric(11,8) NOT NULL,
    device_id integer NOT NULL,
    gateway_id integer NOT NULL,
    battery numeric(5,2) NOT NULL,
    humidity numeric(5,2) NOT NULL,
    temperature numeric(5,2) NOT NULL
);


ALTER TABLE public.wi_finder_devicedata OWNER TO postgres;

--
-- Name: wi_finder_devicedata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_devicedata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_devicedata_id_seq OWNER TO postgres;

--
-- Name: wi_finder_devicedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_devicedata_id_seq OWNED BY public.wi_finder_devicedata.id;


--
-- Name: wi_finder_gateway; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_gateway (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description character varying(45) NOT NULL,
    api_id character varying(45) NOT NULL,
    organization_id integer NOT NULL
);


ALTER TABLE public.wi_finder_gateway OWNER TO postgres;

--
-- Name: wi_finder_gateway_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_gateway_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_gateway_id_seq OWNER TO postgres;

--
-- Name: wi_finder_gateway_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_gateway_id_seq OWNED BY public.wi_finder_gateway.id;


--
-- Name: wi_finder_organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_organization (
    id integer NOT NULL,
    description character varying(45) NOT NULL,
    api_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.wi_finder_organization OWNER TO postgres;

--
-- Name: wi_finder_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_organization_id_seq OWNER TO postgres;

--
-- Name: wi_finder_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_organization_id_seq OWNED BY public.wi_finder_organization.id;


--
-- Name: wi_finder_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_token (
    id integer NOT NULL,
    token character varying(100) NOT NULL
);


ALTER TABLE public.wi_finder_token OWNER TO postgres;

--
-- Name: wi_finder_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_token_id_seq OWNER TO postgres;

--
-- Name: wi_finder_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_token_id_seq OWNED BY public.wi_finder_token.id;


--
-- Name: wi_finder_tokenutilization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wi_finder_tokenutilization (
    id integer NOT NULL,
    queries_made integer NOT NULL,
    token_id integer NOT NULL,
    last_use_date timestamp with time zone NOT NULL
);


ALTER TABLE public.wi_finder_tokenutilization OWNER TO postgres;

--
-- Name: wi_finder_tokenutilization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wi_finder_tokenutilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wi_finder_tokenutilization_id_seq OWNER TO postgres;

--
-- Name: wi_finder_tokenutilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wi_finder_tokenutilization_id_seq OWNED BY public.wi_finder_tokenutilization.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: core_access_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user ALTER COLUMN id SET DEFAULT nextval('public.core_access_user_id_seq'::regclass);


--
-- Name: core_access_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_groups ALTER COLUMN id SET DEFAULT nextval('public.core_access_user_groups_id_seq'::regclass);


--
-- Name: core_access_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.core_access_user_user_permissions_id_seq'::regclass);


--
-- Name: core_contact_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contact_contact ALTER COLUMN id SET DEFAULT nextval('public.core_contact_contact_id_seq'::regclass);


--
-- Name: core_log_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_log_log ALTER COLUMN id SET DEFAULT nextval('public.core_log_log_id_seq'::regclass);


--
-- Name: core_registration_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_application ALTER COLUMN id SET DEFAULT nextval('public.core_registration_application_id_seq'::regclass);


--
-- Name: core_registration_city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_city ALTER COLUMN id SET DEFAULT nextval('public.core_registration_city_id_seq'::regclass);


--
-- Name: core_registration_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_company ALTER COLUMN id SET DEFAULT nextval('public.core_registration_company_id_seq'::regclass);


--
-- Name: core_registration_companyapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyapplication ALTER COLUMN id SET DEFAULT nextval('public.core_registration_companyapplication_id_seq'::regclass);


--
-- Name: core_registration_companyuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyuser ALTER COLUMN id SET DEFAULT nextval('public.core_registration_companyuser_id_seq'::regclass);


--
-- Name: core_registration_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_country ALTER COLUMN id SET DEFAULT nextval('public.core_registration_country_id_seq'::regclass);


--
-- Name: core_registration_state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_state ALTER COLUMN id SET DEFAULT nextval('public.core_registration_state_id_seq'::regclass);


--
-- Name: core_registration_userapplication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_userapplication ALTER COLUMN id SET DEFAULT nextval('public.core_registration_userapplication_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: nerv_accelerometermeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_accelerometermeasure ALTER COLUMN id SET DEFAULT nextval('public.nerv_accelerometermeasure_id_seq'::regclass);


--
-- Name: nerv_area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_area ALTER COLUMN id SET DEFAULT nextval('public.nerv_area_id_seq'::regclass);


--
-- Name: nerv_device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_device ALTER COLUMN id SET DEFAULT nextval('public.nerv_device_id_seq'::regclass);


--
-- Name: nerv_humiditymeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_humiditymeasure ALTER COLUMN id SET DEFAULT nextval('public.nerv_humiditymeasure_id_seq'::regclass);


--
-- Name: nerv_luminositymeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_luminositymeasure ALTER COLUMN id SET DEFAULT nextval('public.nerv_luminositymeasure_id_seq'::regclass);


--
-- Name: nerv_measurement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_measurement ALTER COLUMN id SET DEFAULT nextval('public.nerv_measurement_id_seq'::regclass);


--
-- Name: nerv_setup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_setup ALTER COLUMN id SET DEFAULT nextval('public.nerv_setup_id_seq'::regclass);


--
-- Name: nerv_temperaturemeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_temperaturemeasure ALTER COLUMN id SET DEFAULT nextval('public.nerv_temperaturemeasure_id_seq'::regclass);


--
-- Name: organic_nodes_control_area id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_area ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_area_id_seq'::regclass);


--
-- Name: organic_nodes_control_central id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_central ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_central_id_seq'::regclass);


--
-- Name: organic_nodes_control_circuit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_circuit ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_circuit_id_seq'::regclass);


--
-- Name: organic_nodes_control_cpuassessment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_cpuassessment ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_cpuassessment_id_seq'::regclass);


--
-- Name: organic_nodes_control_device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_device ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_device_id_seq'::regclass);


--
-- Name: organic_nodes_control_devicecharacterizationlog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecharacterizationlog ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_devicecharacterizationlog_id_seq'::regclass);


--
-- Name: organic_nodes_control_devicecompany id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecompany ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_devicecompany_id_seq'::regclass);


--
-- Name: organic_nodes_control_devicesetup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicesetup ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_devicesetup_id_seq'::regclass);


--
-- Name: organic_nodes_control_devicetype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicetype ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_devicetype_id_seq'::regclass);


--
-- Name: organic_nodes_control_energymeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_energymeasure ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_energymeasure_id_seq'::regclass);


--
-- Name: organic_nodes_control_firmware id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_firmware ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_firmware_id_seq'::regclass);


--
-- Name: organic_nodes_control_fport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_fport ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_fport_id_seq'::regclass);


--
-- Name: organic_nodes_control_frequencymeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_frequencymeasure ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_frequencymeasure_id_seq'::regclass);


--
-- Name: organic_nodes_control_hardware id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_hardware ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_hardware_id_seq'::regclass);


--
-- Name: organic_nodes_control_loraaccess id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_loraaccess ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_loraaccess_id_seq'::regclass);


--
-- Name: organic_nodes_control_loradevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_loradevice ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_loradevice_id_seq'::regclass);


--
-- Name: organic_nodes_control_measurement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_measurement ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_measurement_id_seq'::regclass);


--
-- Name: organic_nodes_control_memoryassessment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_memoryassessment ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_memoryassessment_id_seq'::regclass);


--
-- Name: organic_nodes_control_monitoreddevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_monitoreddevice ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_monitoreddevice_id_seq'::regclass);


--
-- Name: organic_nodes_control_mqttaccess id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_mqttaccess ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_mqttaccess_id_seq'::regclass);


--
-- Name: organic_nodes_control_mqttdevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_mqttdevice ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_mqttdevice_id_seq'::regclass);


--
-- Name: organic_nodes_control_networkmeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_networkmeasure ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_networkmeasure_id_seq'::regclass);


--
-- Name: organic_nodes_control_powermeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_powermeasure ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_powermeasure_id_seq'::regclass);


--
-- Name: organic_nodes_control_setup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_setup_id_seq'::regclass);


--
-- Name: organic_nodes_control_temperaturemeasurement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_temperaturemeasurement ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_sensormeasure_id_seq'::regclass);


--
-- Name: organic_nodes_control_version id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_version ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_version_id_seq'::regclass);


--
-- Name: organic_nodes_control_voltagelagmeasure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_voltagelagmeasure ALTER COLUMN id SET DEFAULT nextval('public.organic_nodes_control_voltagelagmeasure_id_seq'::regclass);


--
-- Name: solar_energy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_energy ALTER COLUMN id SET DEFAULT nextval('public.solar_energy_id_seq'::regclass);


--
-- Name: solar_energydetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_energydetail ALTER COLUMN id SET DEFAULT nextval('public.solar_energydetail_id_seq'::regclass);


--
-- Name: solar_environmentbenefit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_environmentbenefit ALTER COLUMN id SET DEFAULT nextval('public.solar_environmentbenefit_id_seq'::regclass);


--
-- Name: solar_inverter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_inverter ALTER COLUMN id SET DEFAULT nextval('public.solar_inverter_id_seq'::regclass);


--
-- Name: solar_inverterdata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_inverterdata ALTER COLUMN id SET DEFAULT nextval('public.solar_inverterdata_id_seq'::regclass);


--
-- Name: solar_module id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_module ALTER COLUMN id SET DEFAULT nextval('public.solar_module_id_seq'::regclass);


--
-- Name: solar_moduledata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduledata ALTER COLUMN id SET DEFAULT nextval('public.solar_moduledata_id_seq'::regclass);


--
-- Name: solar_moduleenergy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleenergy ALTER COLUMN id SET DEFAULT nextval('public.solar_moduleenergy_id_seq'::regclass);


--
-- Name: solar_moduleposition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleposition ALTER COLUMN id SET DEFAULT nextval('public.solar_moduleposition_id_seq'::regclass);


--
-- Name: solar_overview id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_overview ALTER COLUMN id SET DEFAULT nextval('public.solar_overview_id_seq'::regclass);


--
-- Name: solar_power id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_power ALTER COLUMN id SET DEFAULT nextval('public.solar_power_id_seq'::regclass);


--
-- Name: solar_powerdetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerdetail ALTER COLUMN id SET DEFAULT nextval('public.solar_powerdetail_id_seq'::regclass);


--
-- Name: solar_powerplant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerplant ALTER COLUMN id SET DEFAULT nextval('public.solar_powerplant_id_seq'::regclass);


--
-- Name: solar_predictionsenergy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_predictionsenergy ALTER COLUMN id SET DEFAULT nextval('public.solar_predictionsenergy_id_seq'::regclass);


--
-- Name: solar_predictionsenergyvalues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_predictionsenergyvalues ALTER COLUMN id SET DEFAULT nextval('public.solar_predictionsenergyvalues_id_seq'::regclass);


--
-- Name: solar_runconfiguration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_runconfiguration ALTER COLUMN id SET DEFAULT nextval('public.solar_runconfiguration_id_seq'::regclass);


--
-- Name: solar_string id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_string ALTER COLUMN id SET DEFAULT nextval('public.solar_string_id_seq'::regclass);


--
-- Name: wi_finder_application id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_application ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_application_id_seq'::regclass);


--
-- Name: wi_finder_configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_configuration ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_configuration_id_seq'::regclass);


--
-- Name: wi_finder_device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_device ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_device_id_seq'::regclass);


--
-- Name: wi_finder_devicedata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_devicedata ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_devicedata_id_seq'::regclass);


--
-- Name: wi_finder_gateway id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_gateway ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_gateway_id_seq'::regclass);


--
-- Name: wi_finder_organization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_organization ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_organization_id_seq'::regclass);


--
-- Name: wi_finder_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_token ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_token_id_seq'::regclass);


--
-- Name: wi_finder_tokenutilization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_tokenutilization ALTER COLUMN id SET DEFAULT nextval('public.wi_finder_tokenutilization_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_access_user_groups core_access_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_groups
    ADD CONSTRAINT core_access_user_groups_pkey PRIMARY KEY (id);


--
-- Name: core_access_user_groups core_access_user_groups_user_id_group_id_26f84476_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_groups
    ADD CONSTRAINT core_access_user_groups_user_id_group_id_26f84476_uniq UNIQUE (user_id, group_id);


--
-- Name: core_access_user core_access_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user
    ADD CONSTRAINT core_access_user_pkey PRIMARY KEY (id);


--
-- Name: core_access_user_user_permissions core_access_user_user_pe_user_id_permission_id_5f2d0ab3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_user_permissions
    ADD CONSTRAINT core_access_user_user_pe_user_id_permission_id_5f2d0ab3_uniq UNIQUE (user_id, permission_id);


--
-- Name: core_access_user_user_permissions core_access_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_user_permissions
    ADD CONSTRAINT core_access_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: core_access_user core_access_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user
    ADD CONSTRAINT core_access_user_username_key UNIQUE (username);


--
-- Name: core_contact_contact core_contact_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_contact_contact
    ADD CONSTRAINT core_contact_contact_pkey PRIMARY KEY (id);


--
-- Name: core_log_log core_log_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_log_log
    ADD CONSTRAINT core_log_log_pkey PRIMARY KEY (id);


--
-- Name: core_registration_application core_registration_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_application
    ADD CONSTRAINT core_registration_application_pkey PRIMARY KEY (id);


--
-- Name: core_registration_city core_registration_city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_city
    ADD CONSTRAINT core_registration_city_pkey PRIMARY KEY (id);


--
-- Name: core_registration_company core_registration_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_company
    ADD CONSTRAINT core_registration_company_pkey PRIMARY KEY (id);


--
-- Name: core_registration_companyapplication core_registration_companyapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyapplication
    ADD CONSTRAINT core_registration_companyapplication_pkey PRIMARY KEY (id);


--
-- Name: core_registration_companyuser core_registration_companyuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyuser
    ADD CONSTRAINT core_registration_companyuser_pkey PRIMARY KEY (id);


--
-- Name: core_registration_country core_registration_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_country
    ADD CONSTRAINT core_registration_country_pkey PRIMARY KEY (id);


--
-- Name: core_registration_state core_registration_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_state
    ADD CONSTRAINT core_registration_state_pkey PRIMARY KEY (id);


--
-- Name: core_registration_userapplication core_registration_userapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_userapplication
    ADD CONSTRAINT core_registration_userapplication_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: solar_moduledata moduledata_date_module_const; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduledata
    ADD CONSTRAINT moduledata_date_module_const UNIQUE (date, module_id);


--
-- Name: solar_moduleenergy moduleenergy_date_module_const; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleenergy
    ADD CONSTRAINT moduleenergy_date_module_const UNIQUE (date, module_id);


--
-- Name: nerv_accelerometermeasure nerv_accelerometermeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_accelerometermeasure
    ADD CONSTRAINT nerv_accelerometermeasure_pkey PRIMARY KEY (id);


--
-- Name: nerv_area nerv_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_area
    ADD CONSTRAINT nerv_area_pkey PRIMARY KEY (id);


--
-- Name: nerv_device nerv_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_device
    ADD CONSTRAINT nerv_device_pkey PRIMARY KEY (id);


--
-- Name: nerv_humiditymeasure nerv_humiditymeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_humiditymeasure
    ADD CONSTRAINT nerv_humiditymeasure_pkey PRIMARY KEY (id);


--
-- Name: nerv_luminositymeasure nerv_luminositymeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_luminositymeasure
    ADD CONSTRAINT nerv_luminositymeasure_pkey PRIMARY KEY (id);


--
-- Name: nerv_measurement nerv_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_measurement
    ADD CONSTRAINT nerv_measurement_pkey PRIMARY KEY (id);


--
-- Name: nerv_setup nerv_setup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_setup
    ADD CONSTRAINT nerv_setup_pkey PRIMARY KEY (id);


--
-- Name: nerv_temperaturemeasure nerv_temperaturemeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_temperaturemeasure
    ADD CONSTRAINT nerv_temperaturemeasure_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_area organic_nodes_control_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_area
    ADD CONSTRAINT organic_nodes_control_area_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_central organic_nodes_control_central_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_central
    ADD CONSTRAINT organic_nodes_control_central_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_circuit organic_nodes_control_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_circuit
    ADD CONSTRAINT organic_nodes_control_circuit_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_cpuassessment organic_nodes_control_cpuassessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_cpuassessment
    ADD CONSTRAINT organic_nodes_control_cpuassessment_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_device organic_nodes_control_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_device
    ADD CONSTRAINT organic_nodes_control_device_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_devicecharacterizationlog organic_nodes_control_devicecharacterizationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecharacterizationlog
    ADD CONSTRAINT organic_nodes_control_devicecharacterizationlog_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_devicecompany organic_nodes_control_devicecompany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecompany
    ADD CONSTRAINT organic_nodes_control_devicecompany_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_devicesetup organic_nodes_control_devicesetup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicesetup
    ADD CONSTRAINT organic_nodes_control_devicesetup_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_devicetype organic_nodes_control_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicetype
    ADD CONSTRAINT organic_nodes_control_devicetype_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_energymeasure organic_nodes_control_energymeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_energymeasure
    ADD CONSTRAINT organic_nodes_control_energymeasure_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_firmware organic_nodes_control_firmware_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_firmware
    ADD CONSTRAINT organic_nodes_control_firmware_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_fport organic_nodes_control_fport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_fport
    ADD CONSTRAINT organic_nodes_control_fport_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_frequencymeasure organic_nodes_control_frequencymeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_frequencymeasure
    ADD CONSTRAINT organic_nodes_control_frequencymeasure_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_hardware organic_nodes_control_hardware_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_hardware
    ADD CONSTRAINT organic_nodes_control_hardware_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_loraaccess organic_nodes_control_loraaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_loraaccess
    ADD CONSTRAINT organic_nodes_control_loraaccess_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_loradevice organic_nodes_control_loradevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_loradevice
    ADD CONSTRAINT organic_nodes_control_loradevice_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_measurement organic_nodes_control_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_measurement
    ADD CONSTRAINT organic_nodes_control_measurement_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_memoryassessment organic_nodes_control_memoryassessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_memoryassessment
    ADD CONSTRAINT organic_nodes_control_memoryassessment_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_monitoreddevice organic_nodes_control_monitoreddevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_monitoreddevice
    ADD CONSTRAINT organic_nodes_control_monitoreddevice_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_mqttaccess organic_nodes_control_mqttaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_mqttaccess
    ADD CONSTRAINT organic_nodes_control_mqttaccess_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_mqttdevice organic_nodes_control_mqttdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_mqttdevice
    ADD CONSTRAINT organic_nodes_control_mqttdevice_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_networkmeasure organic_nodes_control_networkmeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_networkmeasure
    ADD CONSTRAINT organic_nodes_control_networkmeasure_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_powermeasure organic_nodes_control_powermeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_powermeasure
    ADD CONSTRAINT organic_nodes_control_powermeasure_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_temperaturemeasurement organic_nodes_control_sensormeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_temperaturemeasurement
    ADD CONSTRAINT organic_nodes_control_sensormeasure_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_setup organic_nodes_control_setup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup
    ADD CONSTRAINT organic_nodes_control_setup_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_version organic_nodes_control_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_version
    ADD CONSTRAINT organic_nodes_control_version_pkey PRIMARY KEY (id);


--
-- Name: organic_nodes_control_voltagelagmeasure organic_nodes_control_voltagelagmeasure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_voltagelagmeasure
    ADD CONSTRAINT organic_nodes_control_voltagelagmeasure_pkey PRIMARY KEY (id);


--
-- Name: solar_energy solar_energy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_energy
    ADD CONSTRAINT solar_energy_pkey PRIMARY KEY (id);


--
-- Name: solar_energydetail solar_energydetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_energydetail
    ADD CONSTRAINT solar_energydetail_pkey PRIMARY KEY (id);


--
-- Name: solar_environmentbenefit solar_environmentbenefit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_environmentbenefit
    ADD CONSTRAINT solar_environmentbenefit_pkey PRIMARY KEY (id);


--
-- Name: solar_inverter solar_inverter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_inverter
    ADD CONSTRAINT solar_inverter_pkey PRIMARY KEY (id);


--
-- Name: solar_inverterdata solar_inverterdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_inverterdata
    ADD CONSTRAINT solar_inverterdata_pkey PRIMARY KEY (id);


--
-- Name: solar_module solar_module_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_module
    ADD CONSTRAINT solar_module_pkey PRIMARY KEY (id);


--
-- Name: solar_moduledata solar_moduledata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduledata
    ADD CONSTRAINT solar_moduledata_pkey PRIMARY KEY (id);


--
-- Name: solar_moduleenergy solar_moduleenergy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleenergy
    ADD CONSTRAINT solar_moduleenergy_pkey PRIMARY KEY (id);


--
-- Name: solar_moduleposition solar_moduleposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleposition
    ADD CONSTRAINT solar_moduleposition_pkey PRIMARY KEY (id);


--
-- Name: solar_overview solar_overview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_overview
    ADD CONSTRAINT solar_overview_pkey PRIMARY KEY (id);


--
-- Name: solar_power solar_power_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_power
    ADD CONSTRAINT solar_power_pkey PRIMARY KEY (id);


--
-- Name: solar_powerdetail solar_powerdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerdetail
    ADD CONSTRAINT solar_powerdetail_pkey PRIMARY KEY (id);


--
-- Name: solar_powerplant solar_powerplant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerplant
    ADD CONSTRAINT solar_powerplant_pkey PRIMARY KEY (id);


--
-- Name: solar_predictionsenergy solar_predictionsenergy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_predictionsenergy
    ADD CONSTRAINT solar_predictionsenergy_pkey PRIMARY KEY (id);


--
-- Name: solar_predictionsenergyvalues solar_predictionsenergyvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_predictionsenergyvalues
    ADD CONSTRAINT solar_predictionsenergyvalues_pkey PRIMARY KEY (id);


--
-- Name: solar_runconfiguration solar_runconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_runconfiguration
    ADD CONSTRAINT solar_runconfiguration_pkey PRIMARY KEY (id);


--
-- Name: solar_string solar_string_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_string
    ADD CONSTRAINT solar_string_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_application wi_finder_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_application
    ADD CONSTRAINT wi_finder_application_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_configuration wi_finder_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_configuration
    ADD CONSTRAINT wi_finder_configuration_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_device wi_finder_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_device
    ADD CONSTRAINT wi_finder_device_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_devicedata wi_finder_devicedata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_devicedata
    ADD CONSTRAINT wi_finder_devicedata_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_gateway wi_finder_gateway_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_gateway
    ADD CONSTRAINT wi_finder_gateway_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_organization wi_finder_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_organization
    ADD CONSTRAINT wi_finder_organization_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_token wi_finder_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_token
    ADD CONSTRAINT wi_finder_token_pkey PRIMARY KEY (id);


--
-- Name: wi_finder_tokenutilization wi_finder_tokenutilization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_tokenutilization
    ADD CONSTRAINT wi_finder_tokenutilization_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_access_user_groups_group_id_d0e4c2e3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_access_user_groups_group_id_d0e4c2e3 ON public.core_access_user_groups USING btree (group_id);


--
-- Name: core_access_user_groups_user_id_514bed45; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_access_user_groups_user_id_514bed45 ON public.core_access_user_groups USING btree (user_id);


--
-- Name: core_access_user_user_permissions_permission_id_7f4a6013; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_access_user_user_permissions_permission_id_7f4a6013 ON public.core_access_user_user_permissions USING btree (permission_id);


--
-- Name: core_access_user_user_permissions_user_id_3ceccc5a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_access_user_user_permissions_user_id_3ceccc5a ON public.core_access_user_user_permissions USING btree (user_id);


--
-- Name: core_access_user_username_a768533c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_access_user_username_a768533c_like ON public.core_access_user USING btree (username varchar_pattern_ops);


--
-- Name: core_log_log_user_id_b6bceac6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_log_log_user_id_b6bceac6 ON public.core_log_log USING btree (user_id);


--
-- Name: core_registration_city_state_id_42fc6d09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_city_state_id_42fc6d09 ON public.core_registration_city USING btree (state_id);


--
-- Name: core_registration_company_city_id_62bb7bfb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_company_city_id_62bb7bfb ON public.core_registration_company USING btree (city_id);


--
-- Name: core_registration_company_user_id_edeb6a88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_company_user_id_edeb6a88 ON public.core_registration_company USING btree (user_id);


--
-- Name: core_registration_companyapplication_application_id_3dcb0003; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_companyapplication_application_id_3dcb0003 ON public.core_registration_companyapplication USING btree (application_id);


--
-- Name: core_registration_companyapplication_company_id_d20221d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_companyapplication_company_id_d20221d2 ON public.core_registration_companyapplication USING btree (company_id);


--
-- Name: core_registration_companyuser_company_id_323cc94d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_companyuser_company_id_323cc94d ON public.core_registration_companyuser USING btree (company_id);


--
-- Name: core_registration_companyuser_user_id_85d7cf1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_companyuser_user_id_85d7cf1b ON public.core_registration_companyuser USING btree (user_id);


--
-- Name: core_registration_state_country_id_e2e50bb4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_state_country_id_e2e50bb4 ON public.core_registration_state USING btree (country_id);


--
-- Name: core_registration_userappl_company_application_id_8625f66a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_userappl_company_application_id_8625f66a ON public.core_registration_userapplication USING btree (company_application_id);


--
-- Name: core_registration_userapplication_company_user_id_a7d4073e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_registration_userapplication_company_user_id_a7d4073e ON public.core_registration_userapplication USING btree (company_user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: moduledata_date_module_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moduledata_date_module_idx ON public.solar_moduledata USING btree (date, module_id);


--
-- Name: moduleenergy_date_module_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moduleenergy_date_module_idx ON public.solar_moduleenergy USING btree (date, module_id);


--
-- Name: nerv_accelerometermeasure_measurement_id_c52966e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_accelerometermeasure_measurement_id_c52966e2 ON public.nerv_accelerometermeasure USING btree (measurement_id);


--
-- Name: nerv_area_company_id_cc78ffd0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_area_company_id_cc78ffd0 ON public.nerv_area USING btree (company_id);


--
-- Name: nerv_humiditymeasure_measurement_id_3d5443a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_humiditymeasure_measurement_id_3d5443a0 ON public.nerv_humiditymeasure USING btree (measurement_id);


--
-- Name: nerv_luminositymeasure_measurement_id_5b672c30; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_luminositymeasure_measurement_id_5b672c30 ON public.nerv_luminositymeasure USING btree (measurement_id);


--
-- Name: nerv_measurement_setup_id_238aa14d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_measurement_setup_id_238aa14d ON public.nerv_measurement USING btree (setup_id);


--
-- Name: nerv_setup_area_id_7c9c71b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_setup_area_id_7c9c71b5 ON public.nerv_setup USING btree (area_id);


--
-- Name: nerv_setup_device_id_a3478f3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_setup_device_id_a3478f3f ON public.nerv_setup USING btree (device_id);


--
-- Name: nerv_temperaturemeasure_measurement_id_a416507a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nerv_temperaturemeasure_measurement_id_a416507a ON public.nerv_temperaturemeasure USING btree (measurement_id);


--
-- Name: organic_nodes_control_area_company_id_e261c32f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_area_company_id_e261c32f ON public.organic_nodes_control_area USING btree (company_id);


--
-- Name: organic_nodes_control_central_central_version_id_8d47b7fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_central_central_version_id_8d47b7fe ON public.organic_nodes_control_central USING btree (version_id);


--
-- Name: organic_nodes_control_cpuassessment_central_id_823e4543; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_cpuassessment_central_id_823e4543 ON public.organic_nodes_control_cpuassessment USING btree (central_id);


--
-- Name: organic_nodes_control_devi_device_id_330ad2a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_devi_device_id_330ad2a9 ON public.organic_nodes_control_devicecharacterizationlog USING btree (device_id);


--
-- Name: organic_nodes_control_devi_device_setup_id_c1b9ab00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_devi_device_setup_id_c1b9ab00 ON public.organic_nodes_control_devicecharacterizationlog USING btree (device_setup_id);


--
-- Name: organic_nodes_control_devi_user_id_4e27ecde; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_devi_user_id_4e27ecde ON public.organic_nodes_control_devicecharacterizationlog USING btree (user_id);


--
-- Name: organic_nodes_control_device_device_setup_id_779054d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_device_device_setup_id_779054d7 ON public.organic_nodes_control_device USING btree (device_setup_id);


--
-- Name: organic_nodes_control_device_device_type_id_f3fc4562; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_device_device_type_id_f3fc4562 ON public.organic_nodes_control_device USING btree (device_type_id);


--
-- Name: organic_nodes_control_devicesetup_firmware_id_34f2d7bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_devicesetup_firmware_id_34f2d7bb ON public.organic_nodes_control_devicesetup USING btree (firmware_id);


--
-- Name: organic_nodes_control_devicesetup_hardware_id_dea82bb6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_devicesetup_hardware_id_dea82bb6 ON public.organic_nodes_control_devicesetup USING btree (hardware_id);


--
-- Name: organic_nodes_control_devicetype_device_company_id_e5972836; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_devicetype_device_company_id_e5972836 ON public.organic_nodes_control_devicetype USING btree (device_company_id);


--
-- Name: organic_nodes_control_energymeasure_measurement_id_e3628736; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_energymeasure_measurement_id_e3628736 ON public.organic_nodes_control_energymeasure USING btree (measurement_id);


--
-- Name: organic_nodes_control_fport_firmware_id_7bb70261; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_fport_firmware_id_7bb70261 ON public.organic_nodes_control_fport USING btree (firmware_id);


--
-- Name: organic_nodes_control_frequencymeasure_measurement_id_ce132604; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_frequencymeasure_measurement_id_ce132604 ON public.organic_nodes_control_frequencymeasure USING btree (measurement_id);


--
-- Name: organic_nodes_control_loradevice_device_id_6960ebb3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_loradevice_device_id_6960ebb3 ON public.organic_nodes_control_loradevice USING btree (device_id);


--
-- Name: organic_nodes_control_loradevice_lora_access_id_761c02c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_loradevice_lora_access_id_761c02c8 ON public.organic_nodes_control_loradevice USING btree (lora_access_id);


--
-- Name: organic_nodes_control_measurement_setup_id_f472e67b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_measurement_setup_id_f472e67b ON public.organic_nodes_control_measurement USING btree (setup_id);


--
-- Name: organic_nodes_control_memoryassessment_central_id_2d128542; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_memoryassessment_central_id_2d128542 ON public.organic_nodes_control_memoryassessment USING btree (central_id);


--
-- Name: organic_nodes_control_mqttdevice_device_id_d19ea05a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_mqttdevice_device_id_d19ea05a ON public.organic_nodes_control_mqttdevice USING btree (device_id);


--
-- Name: organic_nodes_control_mqttdevice_mqtt_access_id_7539291d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_mqttdevice_mqtt_access_id_7539291d ON public.organic_nodes_control_mqttdevice USING btree (mqtt_access_id);


--
-- Name: organic_nodes_control_networkmeasure_measurement_id_c7b8a89a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_networkmeasure_measurement_id_c7b8a89a ON public.organic_nodes_control_networkmeasure USING btree (measurement_id);


--
-- Name: organic_nodes_control_powermeasure_measurement_id_9236ae3d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_powermeasure_measurement_id_9236ae3d ON public.organic_nodes_control_powermeasure USING btree (measurement_id);


--
-- Name: organic_nodes_control_sensormeasure_measurement_id_98006bfb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_sensormeasure_measurement_id_98006bfb ON public.organic_nodes_control_temperaturemeasurement USING btree (measurement_id);


--
-- Name: organic_nodes_control_setup_area_id_72a5703b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_setup_area_id_72a5703b ON public.organic_nodes_control_setup USING btree (area_id);


--
-- Name: organic_nodes_control_setup_central_id_181089c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_setup_central_id_181089c0 ON public.organic_nodes_control_setup USING btree (central_id);


--
-- Name: organic_nodes_control_setup_circuit_id_53306096; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_setup_circuit_id_53306096 ON public.organic_nodes_control_setup USING btree (circuit_id);


--
-- Name: organic_nodes_control_setup_device_id_80b0f286; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_setup_device_id_80b0f286 ON public.organic_nodes_control_setup USING btree (device_id);


--
-- Name: organic_nodes_control_setup_monitored_device_id_3eff32e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_setup_monitored_device_id_3eff32e9 ON public.organic_nodes_control_setup USING btree (monitored_device_id);


--
-- Name: organic_nodes_control_voltagelagmeasure_measurement_id_cadacd54; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX organic_nodes_control_voltagelagmeasure_measurement_id_cadacd54 ON public.organic_nodes_control_voltagelagmeasure USING btree (measurement_id);


--
-- Name: solar_energy_power_plant_id_9c007a3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_energy_power_plant_id_9c007a3b ON public.solar_energy USING btree (power_plant_id);


--
-- Name: solar_energydetail_power_plant_id_62101fac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_energydetail_power_plant_id_62101fac ON public.solar_energydetail USING btree (power_plant_id);


--
-- Name: solar_environmentbenefit_power_plant_id_291ba18b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_environmentbenefit_power_plant_id_291ba18b ON public.solar_environmentbenefit USING btree (power_plant_id);


--
-- Name: solar_inverter_power_plant_id_13241ac2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_inverter_power_plant_id_13241ac2 ON public.solar_inverter USING btree (power_plant_id);


--
-- Name: solar_inverterdata_inverter_id_bf69c099; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_inverterdata_inverter_id_bf69c099 ON public.solar_inverterdata USING btree (inverter_id);


--
-- Name: solar_module_string_id_6fd440da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_module_string_id_6fd440da ON public.solar_module USING btree (string_id);


--
-- Name: solar_moduledata_module_id_b9faa459; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_moduledata_module_id_b9faa459 ON public.solar_moduledata USING btree (module_id);


--
-- Name: solar_moduleenergy_module_id_ed315b7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_moduleenergy_module_id_ed315b7a ON public.solar_moduleenergy USING btree (module_id);


--
-- Name: solar_moduleposition_module_id_1fbcf4cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_moduleposition_module_id_1fbcf4cc ON public.solar_moduleposition USING btree (module_id);


--
-- Name: solar_overview_power_plant_id_406a7f66; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_overview_power_plant_id_406a7f66 ON public.solar_overview USING btree (power_plant_id);


--
-- Name: solar_power_power_plant_id_9c027c1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_power_power_plant_id_9c027c1f ON public.solar_power USING btree (power_plant_id);


--
-- Name: solar_powerdetail_power_plant_id_81b11630; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_powerdetail_power_plant_id_81b11630 ON public.solar_powerdetail USING btree (power_plant_id);


--
-- Name: solar_powerplant_city_id_8d7949db; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_powerplant_city_id_8d7949db ON public.solar_powerplant USING btree (city_id);


--
-- Name: solar_powerplant_company_id_c532d7c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_powerplant_company_id_c532d7c3 ON public.solar_powerplant USING btree (company_id);


--
-- Name: solar_predictionsenergyvalues_id_prediction_id_11016925; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_predictionsenergyvalues_id_prediction_id_11016925 ON public.solar_predictionsenergyvalues USING btree (id_prediction_id);


--
-- Name: solar_string_inverter_id_7b5f4c3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solar_string_inverter_id_7b5f4c3b ON public.solar_string USING btree (inverter_id);


--
-- Name: wi_finder_application_organization_id_06e9e532; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_application_organization_id_06e9e532 ON public.wi_finder_application USING btree (organization_id);


--
-- Name: wi_finder_configuration_application_id_75364485; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_configuration_application_id_75364485 ON public.wi_finder_configuration USING btree (application_id);


--
-- Name: wi_finder_configuration_token_id_3d24b9f1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_configuration_token_id_3d24b9f1 ON public.wi_finder_configuration USING btree (token_id);


--
-- Name: wi_finder_device_application_id_6999982b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_device_application_id_6999982b ON public.wi_finder_device USING btree (application_id);


--
-- Name: wi_finder_devicedata_device_id_99816c1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_devicedata_device_id_99816c1f ON public.wi_finder_devicedata USING btree (device_id);


--
-- Name: wi_finder_devicedata_gateway_id_549c2d91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_devicedata_gateway_id_549c2d91 ON public.wi_finder_devicedata USING btree (gateway_id);


--
-- Name: wi_finder_gateway_organization_id_ee98bb6d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_gateway_organization_id_ee98bb6d ON public.wi_finder_gateway USING btree (organization_id);


--
-- Name: wi_finder_organization_company_id_3ccb84c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_organization_company_id_3ccb84c4 ON public.wi_finder_organization USING btree (company_id);


--
-- Name: wi_finder_tokenutilization_token_id_962d89f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wi_finder_tokenutilization_token_id_962d89f3 ON public.wi_finder_tokenutilization USING btree (token_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_access_user_groups core_access_user_groups_group_id_d0e4c2e3_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_groups
    ADD CONSTRAINT core_access_user_groups_group_id_d0e4c2e3_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_access_user_groups core_access_user_groups_user_id_514bed45_fk_core_access_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_groups
    ADD CONSTRAINT core_access_user_groups_user_id_514bed45_fk_core_access_user_id FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_access_user_user_permissions core_access_user_use_permission_id_7f4a6013_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_user_permissions
    ADD CONSTRAINT core_access_user_use_permission_id_7f4a6013_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_access_user_user_permissions core_access_user_use_user_id_3ceccc5a_fk_core_acce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_access_user_user_permissions
    ADD CONSTRAINT core_access_user_use_user_id_3ceccc5a_fk_core_acce FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_log_log core_log_log_user_id_b6bceac6_fk_core_access_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_log_log
    ADD CONSTRAINT core_log_log_user_id_b6bceac6_fk_core_access_user_id FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_city core_registration_ci_state_id_42fc6d09_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_city
    ADD CONSTRAINT core_registration_ci_state_id_42fc6d09_fk_core_regi FOREIGN KEY (state_id) REFERENCES public.core_registration_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_companyapplication core_registration_co_application_id_3dcb0003_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyapplication
    ADD CONSTRAINT core_registration_co_application_id_3dcb0003_fk_core_regi FOREIGN KEY (application_id) REFERENCES public.core_registration_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_company core_registration_co_city_id_62bb7bfb_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_company
    ADD CONSTRAINT core_registration_co_city_id_62bb7bfb_fk_core_regi FOREIGN KEY (city_id) REFERENCES public.core_registration_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_companyuser core_registration_co_company_id_323cc94d_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyuser
    ADD CONSTRAINT core_registration_co_company_id_323cc94d_fk_core_regi FOREIGN KEY (company_id) REFERENCES public.core_registration_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_companyapplication core_registration_co_company_id_d20221d2_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyapplication
    ADD CONSTRAINT core_registration_co_company_id_d20221d2_fk_core_regi FOREIGN KEY (company_id) REFERENCES public.core_registration_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_companyuser core_registration_co_user_id_85d7cf1b_fk_core_acce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_companyuser
    ADD CONSTRAINT core_registration_co_user_id_85d7cf1b_fk_core_acce FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_company core_registration_co_user_id_edeb6a88_fk_core_acce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_company
    ADD CONSTRAINT core_registration_co_user_id_edeb6a88_fk_core_acce FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_state core_registration_st_country_id_e2e50bb4_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_state
    ADD CONSTRAINT core_registration_st_country_id_e2e50bb4_fk_core_regi FOREIGN KEY (country_id) REFERENCES public.core_registration_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_userapplication core_registration_us_company_application__8625f66a_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_userapplication
    ADD CONSTRAINT core_registration_us_company_application__8625f66a_fk_core_regi FOREIGN KEY (company_application_id) REFERENCES public.core_registration_companyapplication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_registration_userapplication core_registration_us_company_user_id_a7d4073e_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_registration_userapplication
    ADD CONSTRAINT core_registration_us_company_user_id_a7d4073e_fk_core_regi FOREIGN KEY (company_user_id) REFERENCES public.core_registration_companyuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_access_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_access_user_id FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_accelerometermeasure nerv_accelerometerme_measurement_id_c52966e2_fk_nerv_meas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_accelerometermeasure
    ADD CONSTRAINT nerv_accelerometerme_measurement_id_c52966e2_fk_nerv_meas FOREIGN KEY (measurement_id) REFERENCES public.nerv_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_area nerv_area_company_id_cc78ffd0_fk_core_registration_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_area
    ADD CONSTRAINT nerv_area_company_id_cc78ffd0_fk_core_registration_company_id FOREIGN KEY (company_id) REFERENCES public.core_registration_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_humiditymeasure nerv_humiditymeasure_measurement_id_3d5443a0_fk_nerv_meas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_humiditymeasure
    ADD CONSTRAINT nerv_humiditymeasure_measurement_id_3d5443a0_fk_nerv_meas FOREIGN KEY (measurement_id) REFERENCES public.nerv_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_luminositymeasure nerv_luminositymeasu_measurement_id_5b672c30_fk_nerv_meas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_luminositymeasure
    ADD CONSTRAINT nerv_luminositymeasu_measurement_id_5b672c30_fk_nerv_meas FOREIGN KEY (measurement_id) REFERENCES public.nerv_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_measurement nerv_measurement_setup_id_238aa14d_fk_nerv_setup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_measurement
    ADD CONSTRAINT nerv_measurement_setup_id_238aa14d_fk_nerv_setup_id FOREIGN KEY (setup_id) REFERENCES public.nerv_setup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_setup nerv_setup_area_id_7c9c71b5_fk_nerv_area_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_setup
    ADD CONSTRAINT nerv_setup_area_id_7c9c71b5_fk_nerv_area_id FOREIGN KEY (area_id) REFERENCES public.nerv_area(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_setup nerv_setup_device_id_a3478f3f_fk_nerv_device_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_setup
    ADD CONSTRAINT nerv_setup_device_id_a3478f3f_fk_nerv_device_id FOREIGN KEY (device_id) REFERENCES public.nerv_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nerv_temperaturemeasure nerv_temperaturemeas_measurement_id_a416507a_fk_nerv_meas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nerv_temperaturemeasure
    ADD CONSTRAINT nerv_temperaturemeas_measurement_id_a416507a_fk_nerv_meas FOREIGN KEY (measurement_id) REFERENCES public.nerv_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_setup organic_nodes_contro_area_id_72a5703b_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup
    ADD CONSTRAINT organic_nodes_contro_area_id_72a5703b_fk_organic_n FOREIGN KEY (area_id) REFERENCES public.organic_nodes_control_area(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_setup organic_nodes_contro_circuit_id_53306096_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup
    ADD CONSTRAINT organic_nodes_contro_circuit_id_53306096_fk_organic_n FOREIGN KEY (circuit_id) REFERENCES public.organic_nodes_control_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_area organic_nodes_contro_company_id_e261c32f_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_area
    ADD CONSTRAINT organic_nodes_contro_company_id_e261c32f_fk_core_regi FOREIGN KEY (company_id) REFERENCES public.core_registration_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_devicetype organic_nodes_contro_device_company_id_e5972836_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicetype
    ADD CONSTRAINT organic_nodes_contro_device_company_id_e5972836_fk_organic_n FOREIGN KEY (device_company_id) REFERENCES public.organic_nodes_control_devicecompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_devicecharacterizationlog organic_nodes_contro_device_id_330ad2a9_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecharacterizationlog
    ADD CONSTRAINT organic_nodes_contro_device_id_330ad2a9_fk_organic_n FOREIGN KEY (device_id) REFERENCES public.organic_nodes_control_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_loradevice organic_nodes_contro_device_id_6960ebb3_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_loradevice
    ADD CONSTRAINT organic_nodes_contro_device_id_6960ebb3_fk_organic_n FOREIGN KEY (device_id) REFERENCES public.organic_nodes_control_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_setup organic_nodes_contro_device_id_80b0f286_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup
    ADD CONSTRAINT organic_nodes_contro_device_id_80b0f286_fk_organic_n FOREIGN KEY (device_id) REFERENCES public.organic_nodes_control_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_mqttdevice organic_nodes_contro_device_id_d19ea05a_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_mqttdevice
    ADD CONSTRAINT organic_nodes_contro_device_id_d19ea05a_fk_organic_n FOREIGN KEY (device_id) REFERENCES public.organic_nodes_control_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_device organic_nodes_contro_device_setup_id_779054d7_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_device
    ADD CONSTRAINT organic_nodes_contro_device_setup_id_779054d7_fk_organic_n FOREIGN KEY (device_setup_id) REFERENCES public.organic_nodes_control_devicesetup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_devicecharacterizationlog organic_nodes_contro_device_setup_id_c1b9ab00_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecharacterizationlog
    ADD CONSTRAINT organic_nodes_contro_device_setup_id_c1b9ab00_fk_organic_n FOREIGN KEY (device_setup_id) REFERENCES public.organic_nodes_control_devicesetup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_device organic_nodes_contro_device_type_id_f3fc4562_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_device
    ADD CONSTRAINT organic_nodes_contro_device_type_id_f3fc4562_fk_organic_n FOREIGN KEY (device_type_id) REFERENCES public.organic_nodes_control_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_devicesetup organic_nodes_contro_firmware_id_34f2d7bb_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicesetup
    ADD CONSTRAINT organic_nodes_contro_firmware_id_34f2d7bb_fk_organic_n FOREIGN KEY (firmware_id) REFERENCES public.organic_nodes_control_firmware(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_fport organic_nodes_contro_firmware_id_7bb70261_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_fport
    ADD CONSTRAINT organic_nodes_contro_firmware_id_7bb70261_fk_organic_n FOREIGN KEY (firmware_id) REFERENCES public.organic_nodes_control_firmware(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_devicesetup organic_nodes_contro_hardware_id_dea82bb6_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicesetup
    ADD CONSTRAINT organic_nodes_contro_hardware_id_dea82bb6_fk_organic_n FOREIGN KEY (hardware_id) REFERENCES public.organic_nodes_control_hardware(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_loradevice organic_nodes_contro_lora_access_id_761c02c8_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_loradevice
    ADD CONSTRAINT organic_nodes_contro_lora_access_id_761c02c8_fk_organic_n FOREIGN KEY (lora_access_id) REFERENCES public.organic_nodes_control_loraaccess(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_powermeasure organic_nodes_contro_measurement_id_9236ae3d_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_powermeasure
    ADD CONSTRAINT organic_nodes_contro_measurement_id_9236ae3d_fk_organic_n FOREIGN KEY (measurement_id) REFERENCES public.organic_nodes_control_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_temperaturemeasurement organic_nodes_contro_measurement_id_98006bfb_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_temperaturemeasurement
    ADD CONSTRAINT organic_nodes_contro_measurement_id_98006bfb_fk_organic_n FOREIGN KEY (measurement_id) REFERENCES public.organic_nodes_control_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_networkmeasure organic_nodes_contro_measurement_id_c7b8a89a_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_networkmeasure
    ADD CONSTRAINT organic_nodes_contro_measurement_id_c7b8a89a_fk_organic_n FOREIGN KEY (measurement_id) REFERENCES public.organic_nodes_control_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_voltagelagmeasure organic_nodes_contro_measurement_id_cadacd54_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_voltagelagmeasure
    ADD CONSTRAINT organic_nodes_contro_measurement_id_cadacd54_fk_organic_n FOREIGN KEY (measurement_id) REFERENCES public.organic_nodes_control_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_frequencymeasure organic_nodes_contro_measurement_id_ce132604_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_frequencymeasure
    ADD CONSTRAINT organic_nodes_contro_measurement_id_ce132604_fk_organic_n FOREIGN KEY (measurement_id) REFERENCES public.organic_nodes_control_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_energymeasure organic_nodes_contro_measurement_id_e3628736_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_energymeasure
    ADD CONSTRAINT organic_nodes_contro_measurement_id_e3628736_fk_organic_n FOREIGN KEY (measurement_id) REFERENCES public.organic_nodes_control_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_setup organic_nodes_contro_monitored_device_id_3eff32e9_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup
    ADD CONSTRAINT organic_nodes_contro_monitored_device_id_3eff32e9_fk_organic_n FOREIGN KEY (monitored_device_id) REFERENCES public.organic_nodes_control_monitoreddevice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_mqttdevice organic_nodes_contro_mqtt_access_id_7539291d_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_mqttdevice
    ADD CONSTRAINT organic_nodes_contro_mqtt_access_id_7539291d_fk_organic_n FOREIGN KEY (mqtt_access_id) REFERENCES public.organic_nodes_control_mqttaccess(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_measurement organic_nodes_contro_setup_id_f472e67b_fk_organic_n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_measurement
    ADD CONSTRAINT organic_nodes_contro_setup_id_f472e67b_fk_organic_n FOREIGN KEY (setup_id) REFERENCES public.organic_nodes_control_setup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_devicecharacterizationlog organic_nodes_contro_user_id_4e27ecde_fk_core_acce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_devicecharacterizationlog
    ADD CONSTRAINT organic_nodes_contro_user_id_4e27ecde_fk_core_acce FOREIGN KEY (user_id) REFERENCES public.core_access_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_central organic_nodes_control_central_version_id_52950c08_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_central
    ADD CONSTRAINT organic_nodes_control_central_version_id_52950c08_fk FOREIGN KEY (version_id) REFERENCES public.organic_nodes_control_version(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_cpuassessment organic_nodes_control_cpuassessment_central_id_823e4543_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_cpuassessment
    ADD CONSTRAINT organic_nodes_control_cpuassessment_central_id_823e4543_fk FOREIGN KEY (central_id) REFERENCES public.organic_nodes_control_central(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_memoryassessment organic_nodes_control_memoryassessment_central_id_2d128542_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_memoryassessment
    ADD CONSTRAINT organic_nodes_control_memoryassessment_central_id_2d128542_fk FOREIGN KEY (central_id) REFERENCES public.organic_nodes_control_central(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organic_nodes_control_setup organic_nodes_control_setup_central_id_181089c0_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organic_nodes_control_setup
    ADD CONSTRAINT organic_nodes_control_setup_central_id_181089c0_fk FOREIGN KEY (central_id) REFERENCES public.organic_nodes_control_central(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_energy solar_energy_power_plant_id_9c007a3b_fk_solar_powerplant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_energy
    ADD CONSTRAINT solar_energy_power_plant_id_9c007a3b_fk_solar_powerplant_id FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_energydetail solar_energydetail_power_plant_id_62101fac_fk_solar_pow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_energydetail
    ADD CONSTRAINT solar_energydetail_power_plant_id_62101fac_fk_solar_pow FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_environmentbenefit solar_environmentben_power_plant_id_291ba18b_fk_solar_pow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_environmentbenefit
    ADD CONSTRAINT solar_environmentben_power_plant_id_291ba18b_fk_solar_pow FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_inverter solar_inverter_power_plant_id_13241ac2_fk_solar_powerplant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_inverter
    ADD CONSTRAINT solar_inverter_power_plant_id_13241ac2_fk_solar_powerplant_id FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_inverterdata solar_inverterdata_inverter_id_bf69c099_fk_solar_inverter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_inverterdata
    ADD CONSTRAINT solar_inverterdata_inverter_id_bf69c099_fk_solar_inverter_id FOREIGN KEY (inverter_id) REFERENCES public.solar_inverter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_module solar_module_string_id_6fd440da_fk_solar_string_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_module
    ADD CONSTRAINT solar_module_string_id_6fd440da_fk_solar_string_id FOREIGN KEY (string_id) REFERENCES public.solar_string(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_moduledata solar_moduledata_module_id_b9faa459_fk_solar_module_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduledata
    ADD CONSTRAINT solar_moduledata_module_id_b9faa459_fk_solar_module_id FOREIGN KEY (module_id) REFERENCES public.solar_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_moduleenergy solar_moduleenergy_module_id_ed315b7a_fk_solar_module_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleenergy
    ADD CONSTRAINT solar_moduleenergy_module_id_ed315b7a_fk_solar_module_id FOREIGN KEY (module_id) REFERENCES public.solar_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_moduleposition solar_moduleposition_module_id_1fbcf4cc_fk_solar_module_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_moduleposition
    ADD CONSTRAINT solar_moduleposition_module_id_1fbcf4cc_fk_solar_module_id FOREIGN KEY (module_id) REFERENCES public.solar_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_overview solar_overview_power_plant_id_406a7f66_fk_solar_powerplant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_overview
    ADD CONSTRAINT solar_overview_power_plant_id_406a7f66_fk_solar_powerplant_id FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_power solar_power_power_plant_id_9c027c1f_fk_solar_powerplant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_power
    ADD CONSTRAINT solar_power_power_plant_id_9c027c1f_fk_solar_powerplant_id FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_powerdetail solar_powerdetail_power_plant_id_81b11630_fk_solar_pow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerdetail
    ADD CONSTRAINT solar_powerdetail_power_plant_id_81b11630_fk_solar_pow FOREIGN KEY (power_plant_id) REFERENCES public.solar_powerplant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_powerplant solar_powerplant_city_id_8d7949db_fk_core_registration_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerplant
    ADD CONSTRAINT solar_powerplant_city_id_8d7949db_fk_core_registration_city_id FOREIGN KEY (city_id) REFERENCES public.core_registration_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_powerplant solar_powerplant_company_id_c532d7c3_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_powerplant
    ADD CONSTRAINT solar_powerplant_company_id_c532d7c3_fk_core_regi FOREIGN KEY (company_id) REFERENCES public.core_registration_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_predictionsenergyvalues solar_predictionsene_id_prediction_id_11016925_fk_solar_pre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_predictionsenergyvalues
    ADD CONSTRAINT solar_predictionsene_id_prediction_id_11016925_fk_solar_pre FOREIGN KEY (id_prediction_id) REFERENCES public.solar_predictionsenergy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: solar_string solar_string_inverter_id_7b5f4c3b_fk_solar_inverter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solar_string
    ADD CONSTRAINT solar_string_inverter_id_7b5f4c3b_fk_solar_inverter_id FOREIGN KEY (inverter_id) REFERENCES public.solar_inverter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_application wi_finder_applicatio_organization_id_06e9e532_fk_wi_finder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_application
    ADD CONSTRAINT wi_finder_applicatio_organization_id_06e9e532_fk_wi_finder FOREIGN KEY (organization_id) REFERENCES public.wi_finder_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_configuration wi_finder_configurat_application_id_75364485_fk_wi_finder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_configuration
    ADD CONSTRAINT wi_finder_configurat_application_id_75364485_fk_wi_finder FOREIGN KEY (application_id) REFERENCES public.wi_finder_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_configuration wi_finder_configuration_token_id_3d24b9f1_fk_wi_finder_token_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_configuration
    ADD CONSTRAINT wi_finder_configuration_token_id_3d24b9f1_fk_wi_finder_token_id FOREIGN KEY (token_id) REFERENCES public.wi_finder_token(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_device wi_finder_device_application_id_6999982b_fk_wi_finder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_device
    ADD CONSTRAINT wi_finder_device_application_id_6999982b_fk_wi_finder FOREIGN KEY (application_id) REFERENCES public.wi_finder_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_devicedata wi_finder_devicedata_device_id_99816c1f_fk_wi_finder_device_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_devicedata
    ADD CONSTRAINT wi_finder_devicedata_device_id_99816c1f_fk_wi_finder_device_id FOREIGN KEY (device_id) REFERENCES public.wi_finder_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_devicedata wi_finder_devicedata_gateway_id_549c2d91_fk_wi_finder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_devicedata
    ADD CONSTRAINT wi_finder_devicedata_gateway_id_549c2d91_fk_wi_finder FOREIGN KEY (gateway_id) REFERENCES public.wi_finder_gateway(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_gateway wi_finder_gateway_organization_id_ee98bb6d_fk_wi_finder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_gateway
    ADD CONSTRAINT wi_finder_gateway_organization_id_ee98bb6d_fk_wi_finder FOREIGN KEY (organization_id) REFERENCES public.wi_finder_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_organization wi_finder_organizati_company_id_3ccb84c4_fk_core_regi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_organization
    ADD CONSTRAINT wi_finder_organizati_company_id_3ccb84c4_fk_core_regi FOREIGN KEY (company_id) REFERENCES public.core_registration_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wi_finder_tokenutilization wi_finder_tokenutili_token_id_962d89f3_fk_wi_finder; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wi_finder_tokenutilization
    ADD CONSTRAINT wi_finder_tokenutili_token_id_962d89f3_fk_wi_finder FOREIGN KEY (token_id) REFERENCES public.wi_finder_token(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

