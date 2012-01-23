--
-- PostgreSQL database dump
--

-- Started on 2011-07-12 16:07:46 CDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 2481 (class 1262 OID 16392)
-- Dependencies: 2480
-- Name: link; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE link IS 'Primera base de datos en postgres.';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1675 (class 1259 OID 16393)
-- Dependencies: 6
-- Name: accion_reporte_abuso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accion_reporte_abuso (
    id_accion_reporte_abuso integer NOT NULL,
    nombre_accion_reporte_abuso character varying(15) NOT NULL,
    descripcion_accion_reporte_abuso character varying(150) NOT NULL
);


ALTER TABLE public.accion_reporte_abuso OWNER TO postgres;

--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 1675
-- Name: TABLE accion_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE accion_reporte_abuso IS 'Tabla que define la acción que se toma cuando un reporte_abuso es tratado.';


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 1675
-- Name: COLUMN accion_reporte_abuso.id_accion_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accion_reporte_abuso.id_accion_reporte_abuso IS 'Campo de tipo entero que indentifica a los registros de la tabla accion_reporte_abuso.';


--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 1675
-- Name: COLUMN accion_reporte_abuso.nombre_accion_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accion_reporte_abuso.nombre_accion_reporte_abuso IS 'Campo de tipo texto que da nombte a una accion_reporte_abuso.';


--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 1675
-- Name: COLUMN accion_reporte_abuso.descripcion_accion_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN accion_reporte_abuso.descripcion_accion_reporte_abuso IS 'Campo de tipo texto que define a detalle una accion_reporte_abuso.';


--
-- TOC entry 1676 (class 1259 OID 16396)
-- Dependencies: 6 1675
-- Name: accion_reporte_abuso_id_accion_reporte_abuso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accion_reporte_abuso_id_accion_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.accion_reporte_abuso_id_accion_reporte_abuso_seq OWNER TO postgres;

--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 1676
-- Name: accion_reporte_abuso_id_accion_reporte_abuso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accion_reporte_abuso_id_accion_reporte_abuso_seq OWNED BY accion_reporte_abuso.id_accion_reporte_abuso;


--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 1676
-- Name: accion_reporte_abuso_id_accion_reporte_abuso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accion_reporte_abuso_id_accion_reporte_abuso_seq', 1, false);


--
-- TOC entry 1677 (class 1259 OID 16398)
-- Dependencies: 6
-- Name: aviso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aviso (
    id_aviso integer NOT NULL,
    texto_aviso character varying(140) NOT NULL,
    fecha_creacion_aviso date NOT NULL,
    tipo_aviso_id integer NOT NULL,
    estatus_aviso_id integer NOT NULL,
    idea_id integer,
    usuario_id integer,
    pregunta_id integer,
    bitacora_id integer,
    canica_id integer,
    reporte_abuso_id integer,
    ticket_registro_id integer,
    envio_id integer
);


ALTER TABLE public.aviso OWNER TO postgres;

--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 1677
-- Name: TABLE aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE aviso IS 'Tabla que contendrá los avisos para los usuarios.';


--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.id_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.id_aviso IS 'Campo de tipo entero que identifica a las filas de la tabla aviso.';


--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.texto_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.texto_aviso IS 'Campo de tipo texto que define el texto que conformará el aviso.';


--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.fecha_creacion_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.fecha_creacion_aviso IS 'Campo de tipo date que define la fecha de creación del aviso.';


--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.tipo_aviso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.tipo_aviso_id IS 'Campo de tipo entero que define el tipo de aviso.';


--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.estatus_aviso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.estatus_aviso_id IS 'Campo de tipo entero que define el estatus del usuario.';


--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.idea_id IS 'Campo de tipo entero que define la idea con la que se relaciona el aviso.';


--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.usuario_id IS 'Campo de tipo entero que define el usuario con el que se relaciona el aviso.';


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.pregunta_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.pregunta_id IS 'Campo de tipo entero que define la pregunta con la que se relaciona el aviso.';


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.bitacora_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.bitacora_id IS 'Campo de tipo entero que define la bitácora con la que se relaciona el aviso.';


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.canica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.canica_id IS 'Campo de tipo entqeo que define la canica/participación con la que se relaciona el aviso.';


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.reporte_abuso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.reporte_abuso_id IS 'Campo que define el reporte de abuso con el que se relaciona el aviso.';


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.ticket_registro_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.ticket_registro_id IS 'Campo que define el ticket de registro con el que se relacione al aviso.';


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 1677
-- Name: COLUMN aviso.envio_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN aviso.envio_id IS 'Campo de tipo entero que describe a un registro de la tabla envío.';


--
-- TOC entry 1678 (class 1259 OID 16401)
-- Dependencies: 6 1677
-- Name: aviso_id_aviso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aviso_id_aviso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.aviso_id_aviso_seq OWNER TO postgres;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 1678
-- Name: aviso_id_aviso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aviso_id_aviso_seq OWNED BY aviso.id_aviso;


--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 1678
-- Name: aviso_id_aviso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aviso_id_aviso_seq', 1, false);


--
-- TOC entry 1679 (class 1259 OID 16403)
-- Dependencies: 6
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bitacora (
    id_bitacora integer NOT NULL,
    usuario_id integer NOT NULL,
    idea_id integer NOT NULL,
    titulo_bitacora character varying(100) NOT NULL,
    descripcion_bitacora character varying(400) NOT NULL,
    tipo_bitacora_id integer NOT NULL,
    fecha_bitacora date NOT NULL,
    estatus_bitacora_id integer NOT NULL
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 1679
-- Name: TABLE bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE bitacora IS 'Tabla que contendrá avisos sobre los principales acontecimientos ocurridos en la idea.';


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.id_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.id_bitacora IS 'Campo de tipo entero identificador de las filas de la tabla "bitacora".';


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.usuario_id IS 'Campo de tipo entero que describe el id de usuario autor de algún evento en bitacora.';


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.idea_id IS 'Campo de tipo entero que describe la idea a la cuál pertenece el nuevo elemento aregado a la bitácora.';


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.titulo_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.titulo_bitacora IS 'Campo de tipo texto "corto" que describe el contenido del nuevo elemento en bitácora.';


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.descripcion_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.descripcion_bitacora IS 'Campo de tipo texto que se refiere al texto largo que describe el contenido de la bitácora en su totalidad.';


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.tipo_bitacora_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.tipo_bitacora_id IS 'Campo de tipo que se refiere al tipo de contenido que tendrá la bitácora (pdf, texto, imagen). ';


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.fecha_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.fecha_bitacora IS 'Campo de tipo fecha que define el momento en el que esta biácora fue creada.';


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 1679
-- Name: COLUMN bitacora.estatus_bitacora_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN bitacora.estatus_bitacora_id IS 'Campo de tipo entero que define el estatus actual de una bitacora.';


--
-- TOC entry 1680 (class 1259 OID 16409)
-- Dependencies: 6 1679
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bitacora_id_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.bitacora_id_bitacora_seq OWNER TO postgres;

--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 1680
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bitacora_id_bitacora_seq OWNED BY bitacora.id_bitacora;


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 1680
-- Name: bitacora_id_bitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bitacora_id_bitacora_seq', 1, false);


--
-- TOC entry 1681 (class 1259 OID 16411)
-- Dependencies: 6
-- Name: canica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE canica (
    id_canica integer NOT NULL,
    necesidad_id integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_canica date NOT NULL,
    texto_aportado_canica character varying(200)
);


ALTER TABLE public.canica OWNER TO postgres;

--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 1681
-- Name: TABLE canica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE canica IS 'Tabla que define al integrante que llenó una necesidad, la fecha en que fue llenada y algún texto que este quiera aportar al momento de llenar la necesidad.';


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 1681
-- Name: COLUMN canica.id_canica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN canica.id_canica IS 'Campo que define el identificador de la cánica.';


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 1681
-- Name: COLUMN canica.necesidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN canica.necesidad_id IS 'Este campo describe la necesidad que cubre esta canica.
Puede haber muchas canicas que cubran la misma necesidad.';


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 1681
-- Name: COLUMN canica.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN canica.usuario_id IS 'Campo que define el usuario que ha llenado la necesidad.';


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 1681
-- Name: COLUMN canica.fecha_canica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN canica.fecha_canica IS 'Campo que describe en que momento la necesidad ha sido llenada.';


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 1681
-- Name: COLUMN canica.texto_aportado_canica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN canica.texto_aportado_canica IS 'Campo que describe un texto que el usuario quiera aportar al momento de proponerse como canica.';


--
-- TOC entry 1682 (class 1259 OID 16414)
-- Dependencies: 1681 6
-- Name: canica_id_canica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE canica_id_canica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.canica_id_canica_seq OWNER TO postgres;

--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 1682
-- Name: canica_id_canica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE canica_id_canica_seq OWNED BY canica.id_canica;


--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 1682
-- Name: canica_id_canica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('canica_id_canica_seq', 1, false);


--
-- TOC entry 1683 (class 1259 OID 16416)
-- Dependencies: 6
-- Name: clasificacion_idea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clasificacion_idea (
    idea_id integer NOT NULL,
    tipo_idea_id integer NOT NULL
);


ALTER TABLE public.clasificacion_idea OWNER TO postgres;

--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 1683
-- Name: TABLE clasificacion_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE clasificacion_idea IS 'Tabla que describe los diferentes tipos a los que pertenece una idea.';


--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 1683
-- Name: COLUMN clasificacion_idea.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN clasificacion_idea.idea_id IS 'Campo de tipo entero que forma parte de la llave primaria de clasificacion_columna. También describe la idea clasificada.';


--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 1683
-- Name: COLUMN clasificacion_idea.tipo_idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN clasificacion_idea.tipo_idea_id IS 'Campo de tipo entero que forma parte de la llave primaria de clasificacion_idea. También describe la clasificación de una idea.';


--
-- TOC entry 1684 (class 1259 OID 16419)
-- Dependencies: 6
-- Name: como_lograrlo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE como_lograrlo (
    id_como_lograrlo integer NOT NULL,
    descripcion_como_lograrlo character varying(5000) NOT NULL,
    fecha_como_lograrlo date,
    idea_id integer NOT NULL
);


ALTER TABLE public.como_lograrlo OWNER TO postgres;

--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 1684
-- Name: TABLE como_lograrlo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE como_lograrlo IS 'Tabla que contendrá uan explicación acerca de como lograr una idea.';


--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 1684
-- Name: COLUMN como_lograrlo.id_como_lograrlo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN como_lograrlo.id_como_lograrlo IS 'Campo de tipo entero que define el identifiador de las filas de la tabla como_lograrlo.';


--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 1684
-- Name: COLUMN como_lograrlo.descripcion_como_lograrlo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN como_lograrlo.descripcion_como_lograrlo IS 'Campo de tipo texto que define la descripcion de como lograr una idea.';


--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 1684
-- Name: COLUMN como_lograrlo.fecha_como_lograrlo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN como_lograrlo.fecha_como_lograrlo IS 'Campo de tipo fecha que define el momento en el que se creó una solución para cómo lograrlo.';


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 1684
-- Name: COLUMN como_lograrlo.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN como_lograrlo.idea_id IS 'Campo de tipo entero que define la relación entre una solución de como lograr una idea y la idea en si.';


--
-- TOC entry 1685 (class 1259 OID 16425)
-- Dependencies: 6 1684
-- Name: como_lograrlo_id_como_lograrlo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE como_lograrlo_id_como_lograrlo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.como_lograrlo_id_como_lograrlo_seq OWNER TO postgres;

--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 1685
-- Name: como_lograrlo_id_como_lograrlo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE como_lograrlo_id_como_lograrlo_seq OWNED BY como_lograrlo.id_como_lograrlo;


--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 1685
-- Name: como_lograrlo_id_como_lograrlo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('como_lograrlo_id_como_lograrlo_seq', 1, false);


--
-- TOC entry 1686 (class 1259 OID 16427)
-- Dependencies: 6
-- Name: comunidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comunidad (
    id_comunidad integer NOT NULL,
    nombre_comunidad character varying(100) NOT NULL,
    descripcion_comunidad character varying NOT NULL,
    estatus_comunidad_id integer NOT NULL,
    titulo_comunidad character varying(100) NOT NULL
);


ALTER TABLE public.comunidad OWNER TO postgres;

--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 1686
-- Name: TABLE comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE comunidad IS 'Esta tabla contendrá una lista con las comunidades de usuarios del sistema link.';


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 1686
-- Name: COLUMN comunidad.id_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comunidad.id_comunidad IS 'Campo de tipo entero que sirve de para identificar las filas de la tabla "comunidad".';


--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 1686
-- Name: COLUMN comunidad.nombre_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comunidad.nombre_comunidad IS 'Campo de tipo texto que define el nombre de una comunidad.';


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 1686
-- Name: COLUMN comunidad.descripcion_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comunidad.descripcion_comunidad IS 'Campo de tipo texto que describe los intereses de la comunidad.';


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 1686
-- Name: COLUMN comunidad.estatus_comunidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comunidad.estatus_comunidad_id IS 'Campo que describe la relación entre una comunidad y su estatus.';


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 1686
-- Name: COLUMN comunidad.titulo_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN comunidad.titulo_comunidad IS 'Campo de tipo texto  que define el título de una comunidad.';


--
-- TOC entry 1687 (class 1259 OID 16433)
-- Dependencies: 6
-- Name: configuracion_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_usuario (
    id_configuracion_usuario integer NOT NULL,
    envio_de_correos boolean NOT NULL,
    aviso_preguntas boolean NOT NULL,
    aviso_bitacoras boolean NOT NULL,
    aviso_participaciones boolean NOT NULL,
    aviso_ideas boolean NOT NULL,
    aviso_seguidores boolean NOT NULL,
    aviso_nuevo_lugar boolean NOT NULL,
    almacenar_posicion_geografica boolean NOT NULL
);


ALTER TABLE public.configuracion_usuario OWNER TO postgres;

--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 1687
-- Name: TABLE configuracion_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE configuracion_usuario IS 'Tabla que contendrá las preferencias de un usuario.';


--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.id_configuracion_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.id_configuracion_usuario IS 'Campo de tipo entero que define el identificador para los registros de la tabla configuracion_usuario.';


--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.envio_de_correos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.envio_de_correos IS 'Campo de tipo boolean que define si un usuario recibirá correos correspondientes a los eventos en el sistema, o no.';


--
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.aviso_preguntas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.aviso_preguntas IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con preguntas.';


--
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.aviso_bitacoras; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.aviso_bitacoras IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con bitácoras.';


--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.aviso_participaciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.aviso_participaciones IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con participaciones.';


--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.aviso_ideas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.aviso_ideas IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con ideas.';


--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.aviso_seguidores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.aviso_seguidores IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con seguidores.';


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.aviso_nuevo_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.aviso_nuevo_lugar IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con lugares.';


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 1687
-- Name: COLUMN configuracion_usuario.almacenar_posicion_geografica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN configuracion_usuario.almacenar_posicion_geografica IS 'Campo de tipo boolean que define si se debe almacenar la posición geográfica del usuario.';


--
-- TOC entry 1688 (class 1259 OID 16436)
-- Dependencies: 1687 6
-- Name: configuracion_usuario_id_configuracion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuracion_usuario_id_configuracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.configuracion_usuario_id_configuracion_seq OWNER TO postgres;

--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 1688
-- Name: configuracion_usuario_id_configuracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE configuracion_usuario_id_configuracion_seq OWNED BY configuracion_usuario.id_configuracion_usuario;


--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 1688
-- Name: configuracion_usuario_id_configuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuracion_usuario_id_configuracion_seq', 1, false);


--
-- TOC entry 1689 (class 1259 OID 16438)
-- Dependencies: 6
-- Name: contacto_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacto_usuario (
    id_contacto_usuario integer NOT NULL,
    usuario_id integer NOT NULL,
    texto_contacto_usuario character varying(100) NOT NULL,
    tipo_contacto_usuario_id integer NOT NULL,
    texto_complementario1 character varying(100),
    texto_complementario2 character varying(100),
    texto_complementario3 character varying
);


ALTER TABLE public.contacto_usuario OWNER TO postgres;

--
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 1689
-- Name: TABLE contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contacto_usuario IS 'Tabla que contendrá los diferentes medios por los cuales comunicarse con un usuario.';


--
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.id_contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.id_contacto_usuario IS 'Campo que define una manera de contactarse con un usuario.';


--
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.usuario_id IS 'Campo de tipo entero que define a que usuario pertenece el contacto.';


--
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.texto_contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.texto_contacto_usuario IS 'Texto que define el nombre de usuario o el twitname o cualquiera cosa que funcione como identificador del usuario en la manera que propuso para comunicarse con el.';


--
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.tipo_contacto_usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.tipo_contacto_usuario_id IS 'Campo que define el detalle del contacto.';


--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.texto_complementario1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.texto_complementario1 IS 'Texto que puede requerirse para almacenar información independiente de cada usuario pero correspondiente a cierto tipo_contacto_usuario.';


--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.texto_complementario2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.texto_complementario2 IS 'Texto que puede requerirse para almacenar información independiente de cada usuario pero correspondiente a cierto tipo_contacto_usuario.';


--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 1689
-- Name: COLUMN contacto_usuario.texto_complementario3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contacto_usuario.texto_complementario3 IS 'Texto que puede requerirse para almacenar información independiente de cada usuario pero correspondiente a cierto tipo_contacto_usuario.';


--
-- TOC entry 1690 (class 1259 OID 16444)
-- Dependencies: 1689 6
-- Name: contacto_usuario_id_contacto_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacto_usuario_id_contacto_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contacto_usuario_id_contacto_usuario_seq OWNER TO postgres;

--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 1690
-- Name: contacto_usuario_id_contacto_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacto_usuario_id_contacto_usuario_seq OWNED BY contacto_usuario.id_contacto_usuario;


--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 1690
-- Name: contacto_usuario_id_contacto_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacto_usuario_id_contacto_usuario_seq', 1, false);


--
-- TOC entry 1691 (class 1259 OID 16446)
-- Dependencies: 6
-- Name: critica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE critica (
    id_critica integer NOT NULL,
    texto_critica character varying(400),
    tipo_critica_id integer NOT NULL,
    usuario_id integer,
    fecha_critica date NOT NULL,
    estatus_critica_id integer NOT NULL
);


ALTER TABLE public.critica OWNER TO postgres;

--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 1691
-- Name: TABLE critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE critica IS 'Tabla que contendrá las críticas/comentarios hechas al sistema por los usuarios de Link.';


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 1691
-- Name: COLUMN critica.id_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN critica.id_critica IS 'Campo de tipo entero que describe las filas de la tabla "crítica".';


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 1691
-- Name: COLUMN critica.texto_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN critica.texto_critica IS 'Campo de tipo texto que describe el texto de la crítica.';


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 1691
-- Name: COLUMN critica.tipo_critica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN critica.tipo_critica_id IS 'Campo de tipo entero que define el tipo de crítica que hace un usuario.';


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 1691
-- Name: COLUMN critica.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN critica.usuario_id IS 'Campo de tipo entero que describe el usuario que realiza la crítica.';


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 1691
-- Name: COLUMN critica.fecha_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN critica.fecha_critica IS 'Campo de tipo fecha que define el momento en que fue creada una crítica.';


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 1691
-- Name: COLUMN critica.estatus_critica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN critica.estatus_critica_id IS 'Campo de tipo entero que indica el estatus de una crítica.';


--
-- TOC entry 1692 (class 1259 OID 16449)
-- Dependencies: 1691 6
-- Name: critica_id_critica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE critica_id_critica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.critica_id_critica_seq OWNER TO postgres;

--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 1692
-- Name: critica_id_critica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE critica_id_critica_seq OWNED BY critica.id_critica;


--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 1692
-- Name: critica_id_critica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('critica_id_critica_seq', 1, false);


--
-- TOC entry 1693 (class 1259 OID 16451)
-- Dependencies: 6
-- Name: envio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE envio (
    id_envio integer NOT NULL,
    fecha_registro_envio date NOT NULL,
    fecha_envio_envio date,
    numero_intentos_envio integer NOT NULL,
    estatus_envio_id integer NOT NULL,
    tipo_envio_id integer NOT NULL,
    comunidad_id integer,
    idea_id integer,
    bitacora_id integer,
    pregunta_id integer,
    usuario_id integer,
    canica_id integer,
    reporte_abuso_id integer,
    ticket_registro_id integer,
    aviso_id integer,
    invitacion_id integer
);


ALTER TABLE public.envio OWNER TO postgres;

--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 1693
-- Name: TABLE envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE envio IS 'Tabla que contendrá los registros de los envíos hechos (y no hechos) por el sistema.';


--
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.id_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.id_envio IS 'Campo de tipo serial que define el identificador de los registros en la tabla envío.';


--
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.fecha_registro_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.fecha_registro_envio IS 'Campo de tipo date que define la fecha en la que el envío fue registrado.';


--
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.fecha_envio_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.fecha_envio_envio IS 'Campo de tipo texto que define la fecha en la que el envío fue hecho.';


--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.numero_intentos_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.numero_intentos_envio IS 'Campo de tipo entero que define el número de intentos que se han hecho para hacer el envío.';


--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.estatus_envio_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.estatus_envio_id IS 'Campo de tipo entero que define el estatus del envío.';


--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.tipo_envio_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.tipo_envio_id IS 'Campo de tipo entero que define el tipo al que pertenece el envío.';


--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.comunidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.comunidad_id IS 'Campo de tipo entero que define la comunidad a la que se hará el envío.';


--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.idea_id IS 'Campo de tipo entero que define la idea de la que se tomarán los miembros para hacer el envío.';


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.bitacora_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.bitacora_id IS 'Campo de tipo entero que describe la relación entre un envío y una bitácora. Este caso se presenta cuando es necesario avisar a cierta comunidad(es) que una bitácora ha sido actualizada.';


--
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.pregunta_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.pregunta_id IS 'Campo de tipo entero que describe la relación entre un envío y una pregunta. Este caso se presenta cuando es necesario avisar a cierto usuario que su pregunta ha sido contestada.';


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.usuario_id IS 'Campo de tipo entero que se utiliza cuando el envío necesita referenciar la información de un usuario que pidió recuperación de password, o que se acaba de registrar.';


--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.canica_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.canica_id IS 'Campo de tipo entero que referencia a una participación en una idea por parte de un usuario.';


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.reporte_abuso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.reporte_abuso_id IS 'Campo de tipo entero que referencia a un reporte de abuso.';


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.ticket_registro_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.ticket_registro_id IS 'Campo de tipo entero que referencia a un ticket de registro que se enviará a un usuario para completar su registro.';


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.aviso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.aviso_id IS 'Aviso que se adjuntará al envío para determinados casos de uso.';


--
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 1693
-- Name: COLUMN envio.invitacion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN envio.invitacion_id IS 'Campo de tipo entero que define la invitación que será enviada.';


--
-- TOC entry 1694 (class 1259 OID 16454)
-- Dependencies: 6 1693
-- Name: envio_id_envio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE envio_id_envio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.envio_id_envio_seq OWNER TO postgres;

--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 1694
-- Name: envio_id_envio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE envio_id_envio_seq OWNED BY envio.id_envio;


--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 1694
-- Name: envio_id_envio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('envio_id_envio_seq', 1, false);


--
-- TOC entry 1695 (class 1259 OID 16456)
-- Dependencies: 6
-- Name: estatus_aviso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_aviso (
    id_estatus_aviso integer NOT NULL,
    nombre_estatus_aviso character varying(15) NOT NULL,
    definicion_estatus_aviso character varying(150) NOT NULL
);


ALTER TABLE public.estatus_aviso OWNER TO postgres;

--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 1695
-- Name: TABLE estatus_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_aviso IS 'Tabla que contendrá los registros que describen los estados que puede tomar un aviso.';


--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 1695
-- Name: COLUMN estatus_aviso.id_estatus_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_aviso.id_estatus_aviso IS 'Campo de tipo enero que identifica los registros en la tabla estatus aviso.';


--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 1695
-- Name: COLUMN estatus_aviso.nombre_estatus_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_aviso.nombre_estatus_aviso IS 'Campo de tipo texto que define el nombre del estatus de aviso.';


--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 1695
-- Name: COLUMN estatus_aviso.definicion_estatus_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_aviso.definicion_estatus_aviso IS 'Campo de tipo texto que describe a detalle el estatus de un aviso.';


--
-- TOC entry 1696 (class 1259 OID 16459)
-- Dependencies: 1695 6
-- Name: estatus_aviso_id_estatus_aviso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_aviso_id_estatus_aviso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_aviso_id_estatus_aviso_seq OWNER TO postgres;

--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 1696
-- Name: estatus_aviso_id_estatus_aviso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_aviso_id_estatus_aviso_seq OWNED BY estatus_aviso.id_estatus_aviso;


--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 1696
-- Name: estatus_aviso_id_estatus_aviso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_aviso_id_estatus_aviso_seq', 1, false);


--
-- TOC entry 1697 (class 1259 OID 16461)
-- Dependencies: 6
-- Name: estatus_ayuda_monetaria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_ayuda_monetaria (
    id_estatus_ayuda_monetaria integer NOT NULL,
    nombre_estatus_ayuda_monetaria character varying(15) NOT NULL,
    definicion_estatus_ayuda_monetaria character varying(150) NOT NULL
);


ALTER TABLE public.estatus_ayuda_monetaria OWNER TO postgres;

--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 1697
-- Name: TABLE estatus_ayuda_monetaria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_ayuda_monetaria IS 'Contendrá los posibles estatus monetarios que pudiese tener una idea(incluyendo INHABILITADO, PIDO y OFREZCO).';


--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 1697
-- Name: COLUMN estatus_ayuda_monetaria.id_estatus_ayuda_monetaria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ayuda_monetaria.id_estatus_ayuda_monetaria IS 'Campo de tipo entero que define el identificador de las filas de esta tabla.';


--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 1697
-- Name: COLUMN estatus_ayuda_monetaria.nombre_estatus_ayuda_monetaria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ayuda_monetaria.nombre_estatus_ayuda_monetaria IS 'Campo de tipo texto que describe el nombre de un estatus_ayuda_monetaria.';


--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 1697
-- Name: COLUMN estatus_ayuda_monetaria.definicion_estatus_ayuda_monetaria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ayuda_monetaria.definicion_estatus_ayuda_monetaria IS 'Campo de tipo texto que define al nombre_estatus_ayuda_monetaria.';


--
-- TOC entry 1698 (class 1259 OID 16464)
-- Dependencies: 6
-- Name: estatus_ayuda_recursos_humanos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_ayuda_recursos_humanos (
    id_estatus_ayuda_recursos_humanos integer NOT NULL,
    nombre_estatus_ayuda_recursos_humanos character varying(15) NOT NULL,
    definicion_estatus_ayuda_recursos_humanos character varying(150) NOT NULL
);


ALTER TABLE public.estatus_ayuda_recursos_humanos OWNER TO postgres;

--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 1698
-- Name: TABLE estatus_ayuda_recursos_humanos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_ayuda_recursos_humanos IS 'Esta tabla contendrá los posibles estados de ayuda relacionada con recursos humanos que pudiese tener una idea (incluyendo el inhabilitado).';


--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 1698
-- Name: COLUMN estatus_ayuda_recursos_humanos.id_estatus_ayuda_recursos_humanos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ayuda_recursos_humanos.id_estatus_ayuda_recursos_humanos IS 'Campo de tipo entero que define el estatus de la idea en cuanto a apoyo de recursos humanos se refiere.';


--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 1698
-- Name: COLUMN estatus_ayuda_recursos_humanos.nombre_estatus_ayuda_recursos_humanos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ayuda_recursos_humanos.nombre_estatus_ayuda_recursos_humanos IS 'Campo de tipo texto que define el nombre de un estatus de ayuda de recursos humanos.';


--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 1698
-- Name: COLUMN estatus_ayuda_recursos_humanos.definicion_estatus_ayuda_recursos_humanos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ayuda_recursos_humanos.definicion_estatus_ayuda_recursos_humanos IS 'Campo de tipo texto que define el estatus de ayuda para una idea en cuanto a recursos humanos serefiere.';


--
-- TOC entry 1699 (class 1259 OID 16467)
-- Dependencies: 6
-- Name: estatus_bitacora; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_bitacora (
    id_estatus_bitacora integer NOT NULL,
    nombre_estatus_bitacora character varying(15) NOT NULL,
    definicion_estatus_bitacora character varying(150) NOT NULL
);


ALTER TABLE public.estatus_bitacora OWNER TO postgres;

--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 1699
-- Name: TABLE estatus_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_bitacora IS 'Tabla que contendrá los diferentes estados que puede tomar una bitacora.';


--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 1699
-- Name: COLUMN estatus_bitacora.id_estatus_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_bitacora.id_estatus_bitacora IS 'Campo de tipo entero que define el identificador de las filas de la tabla estatus_bitacora.';


--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 1699
-- Name: COLUMN estatus_bitacora.nombre_estatus_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_bitacora.nombre_estatus_bitacora IS 'Campo de tipo texto que define el nombre de un estatus de una bitácora.';


--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 1699
-- Name: COLUMN estatus_bitacora.definicion_estatus_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_bitacora.definicion_estatus_bitacora IS 'Campo de tipo texto que describe el nombre de un estatus de una butácora.';


--
-- TOC entry 1700 (class 1259 OID 16470)
-- Dependencies: 6 1699
-- Name: estatus_bitacora_id_estatus_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_bitacora_id_estatus_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_bitacora_id_estatus_bitacora_seq OWNER TO postgres;

--
-- TOC entry 2609 (class 0 OID 0)
-- Dependencies: 1700
-- Name: estatus_bitacora_id_estatus_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_bitacora_id_estatus_bitacora_seq OWNED BY estatus_bitacora.id_estatus_bitacora;


--
-- TOC entry 2610 (class 0 OID 0)
-- Dependencies: 1700
-- Name: estatus_bitacora_id_estatus_bitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_bitacora_id_estatus_bitacora_seq', 1, false);


--
-- TOC entry 1701 (class 1259 OID 16472)
-- Dependencies: 6
-- Name: estatus_comunidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_comunidad (
    id_estatus_comunidad integer NOT NULL,
    nombre_estatus_comunidad character varying(15) NOT NULL,
    definicion_estatus_comunidad character varying(150) NOT NULL
);


ALTER TABLE public.estatus_comunidad OWNER TO postgres;

--
-- TOC entry 2611 (class 0 OID 0)
-- Dependencies: 1701
-- Name: TABLE estatus_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_comunidad IS 'Tabla que contendrá los diferentes estados que puede tener una comunidad.';


--
-- TOC entry 2612 (class 0 OID 0)
-- Dependencies: 1701
-- Name: COLUMN estatus_comunidad.id_estatus_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_comunidad.id_estatus_comunidad IS 'Campo de tipo entero que define el idenificador de estatus de una comunidad.';


--
-- TOC entry 2613 (class 0 OID 0)
-- Dependencies: 1701
-- Name: COLUMN estatus_comunidad.nombre_estatus_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_comunidad.nombre_estatus_comunidad IS 'Campo de tipo texto que define el nombre de un estatus de una comunidad.';


--
-- TOC entry 2614 (class 0 OID 0)
-- Dependencies: 1701
-- Name: COLUMN estatus_comunidad.definicion_estatus_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_comunidad.definicion_estatus_comunidad IS 'Campo de tipo texto que describe el estatus de una comunidad.';


--
-- TOC entry 1702 (class 1259 OID 16475)
-- Dependencies: 1701 6
-- Name: estatus_comunidad_id_estatus_comunidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_comunidad_id_estatus_comunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_comunidad_id_estatus_comunidad_seq OWNER TO postgres;

--
-- TOC entry 2615 (class 0 OID 0)
-- Dependencies: 1702
-- Name: estatus_comunidad_id_estatus_comunidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_comunidad_id_estatus_comunidad_seq OWNED BY estatus_comunidad.id_estatus_comunidad;


--
-- TOC entry 2616 (class 0 OID 0)
-- Dependencies: 1702
-- Name: estatus_comunidad_id_estatus_comunidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_comunidad_id_estatus_comunidad_seq', 1, false);


--
-- TOC entry 1703 (class 1259 OID 16477)
-- Dependencies: 6
-- Name: estatus_critica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_critica (
    id_estatus_critica integer NOT NULL,
    nombre_estatus_critica character varying(15) NOT NULL,
    definicion_estatus_critica character varying(150) NOT NULL
);


ALTER TABLE public.estatus_critica OWNER TO postgres;

--
-- TOC entry 2617 (class 0 OID 0)
-- Dependencies: 1703
-- Name: TABLE estatus_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_critica IS 'Tabla que definirá el estatus de una crítica hecha por un usuario acerca del sistema.';


--
-- TOC entry 2618 (class 0 OID 0)
-- Dependencies: 1703
-- Name: COLUMN estatus_critica.id_estatus_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_critica.id_estatus_critica IS 'Campo de tipo entero que define el identificador de las filas de la tabla estatus_critica';


--
-- TOC entry 2619 (class 0 OID 0)
-- Dependencies: 1703
-- Name: COLUMN estatus_critica.nombre_estatus_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_critica.nombre_estatus_critica IS 'Campo de tipo texto que define el nombre de un estatus de crítica.';


--
-- TOC entry 2620 (class 0 OID 0)
-- Dependencies: 1703
-- Name: COLUMN estatus_critica.definicion_estatus_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_critica.definicion_estatus_critica IS 'Campo de tipo texto que define el significado de un nombre de  estatus de una crítica.';


--
-- TOC entry 1704 (class 1259 OID 16480)
-- Dependencies: 1703 6
-- Name: estatus_critica_id_estatus_critica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_critica_id_estatus_critica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_critica_id_estatus_critica_seq OWNER TO postgres;

--
-- TOC entry 2621 (class 0 OID 0)
-- Dependencies: 1704
-- Name: estatus_critica_id_estatus_critica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_critica_id_estatus_critica_seq OWNED BY estatus_critica.id_estatus_critica;


--
-- TOC entry 2622 (class 0 OID 0)
-- Dependencies: 1704
-- Name: estatus_critica_id_estatus_critica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_critica_id_estatus_critica_seq', 1, false);


--
-- TOC entry 1705 (class 1259 OID 16482)
-- Dependencies: 6
-- Name: estatus_envio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_envio (
    id_estatus_envio integer NOT NULL,
    nombre_estatus_envio character varying(15) NOT NULL,
    definicion_estatus_envio character varying(150) NOT NULL
);


ALTER TABLE public.estatus_envio OWNER TO postgres;

--
-- TOC entry 2623 (class 0 OID 0)
-- Dependencies: 1705
-- Name: TABLE estatus_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_envio IS 'Tabla que contiene los registros relacionados con los diferentes estatus que puede tomar un envío.';


--
-- TOC entry 2624 (class 0 OID 0)
-- Dependencies: 1705
-- Name: COLUMN estatus_envio.id_estatus_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_envio.id_estatus_envio IS 'Campo de tipo entero que describe el identificador de los registros de la tabla estatus_envio.';


--
-- TOC entry 2625 (class 0 OID 0)
-- Dependencies: 1705
-- Name: COLUMN estatus_envio.nombre_estatus_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_envio.nombre_estatus_envio IS 'Campo de tipo texto que describe el nombre de un estatus de envío.';


--
-- TOC entry 2626 (class 0 OID 0)
-- Dependencies: 1705
-- Name: COLUMN estatus_envio.definicion_estatus_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_envio.definicion_estatus_envio IS 'Campo de tipo texto que define a detalle un estatus de envío.';


--
-- TOC entry 1706 (class 1259 OID 16485)
-- Dependencies: 6 1705
-- Name: estatus_envio_id_estatus_envio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_envio_id_estatus_envio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_envio_id_estatus_envio_seq OWNER TO postgres;

--
-- TOC entry 2627 (class 0 OID 0)
-- Dependencies: 1706
-- Name: estatus_envio_id_estatus_envio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_envio_id_estatus_envio_seq OWNED BY estatus_envio.id_estatus_envio;


--
-- TOC entry 2628 (class 0 OID 0)
-- Dependencies: 1706
-- Name: estatus_envio_id_estatus_envio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_envio_id_estatus_envio_seq', 1, false);


--
-- TOC entry 1707 (class 1259 OID 16487)
-- Dependencies: 6
-- Name: estatus_idea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_idea (
    id_estatus_idea integer NOT NULL,
    nombre_estatus_idea character varying(15) NOT NULL,
    definicion_estatus_idea character varying(150) NOT NULL
);


ALTER TABLE public.estatus_idea OWNER TO postgres;

--
-- TOC entry 2629 (class 0 OID 0)
-- Dependencies: 1707
-- Name: TABLE estatus_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_idea IS 'Tabla que contiene los diferentes estados que puede tomar una idea en determinado momento.';


--
-- TOC entry 2630 (class 0 OID 0)
-- Dependencies: 1707
-- Name: COLUMN estatus_idea.id_estatus_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_idea.id_estatus_idea IS 'Campo de tipo entero que describe el identificador de las filas de la tabla estatus_idea.';


--
-- TOC entry 2631 (class 0 OID 0)
-- Dependencies: 1707
-- Name: COLUMN estatus_idea.nombre_estatus_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_idea.nombre_estatus_idea IS 'Campo de tipo texto que describe el nombre de un estatus de idea.';


--
-- TOC entry 2632 (class 0 OID 0)
-- Dependencies: 1707
-- Name: COLUMN estatus_idea.definicion_estatus_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_idea.definicion_estatus_idea IS 'Campo de tipo texto que describe a detalle el estatus de la idea.';


--
-- TOC entry 1708 (class 1259 OID 16490)
-- Dependencies: 1707 6
-- Name: estatus_idea_id_estatus_idea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_idea_id_estatus_idea_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_idea_id_estatus_idea_seq OWNER TO postgres;

--
-- TOC entry 2633 (class 0 OID 0)
-- Dependencies: 1708
-- Name: estatus_idea_id_estatus_idea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_idea_id_estatus_idea_seq OWNED BY estatus_idea.id_estatus_idea;


--
-- TOC entry 2634 (class 0 OID 0)
-- Dependencies: 1708
-- Name: estatus_idea_id_estatus_idea_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_idea_id_estatus_idea_seq', 1, false);


--
-- TOC entry 1709 (class 1259 OID 16492)
-- Dependencies: 6
-- Name: estatus_integrante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_integrante (
    id_estatus_integrante integer NOT NULL,
    nombre_estatus_integrante character varying(15) NOT NULL,
    definicion_estatus_integrante character varying(150) NOT NULL
);


ALTER TABLE public.estatus_integrante OWNER TO postgres;

--
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 1709
-- Name: TABLE estatus_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_integrante IS 'Representa el estatus que puede tener el integrante de una idea en determinado momento.';


--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 1709
-- Name: COLUMN estatus_integrante.id_estatus_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_integrante.id_estatus_integrante IS 'Campo de tipo entero que define el identificador de las filas de la tabla estatus_integrante.';


--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 1709
-- Name: COLUMN estatus_integrante.nombre_estatus_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_integrante.nombre_estatus_integrante IS 'Campo de tipo texto que define el nombre de un estatus de integrante de una idea.';


--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 1709
-- Name: COLUMN estatus_integrante.definicion_estatus_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_integrante.definicion_estatus_integrante IS 'Campo de texto que define a detalle el estatus de un integrante de una idea.';


--
-- TOC entry 1710 (class 1259 OID 16495)
-- Dependencies: 1709 6
-- Name: estatus_integrante_id_estatus_integrante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_integrante_id_estatus_integrante_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_integrante_id_estatus_integrante_seq OWNER TO postgres;

--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 1710
-- Name: estatus_integrante_id_estatus_integrante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_integrante_id_estatus_integrante_seq OWNED BY estatus_integrante.id_estatus_integrante;


--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 1710
-- Name: estatus_integrante_id_estatus_integrante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_integrante_id_estatus_integrante_seq', 1, false);


--
-- TOC entry 1711 (class 1259 OID 16497)
-- Dependencies: 6
-- Name: estatus_invitacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_invitacion (
    id_estatus_invitacion integer NOT NULL,
    nombre_estatus_invitacion character varying(15) NOT NULL,
    descripcion_estatus_invitacion character varying(150) NOT NULL
);


ALTER TABLE public.estatus_invitacion OWNER TO postgres;

--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 1711
-- Name: TABLE estatus_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_invitacion IS 'Tabla que contendrá los diferentes estados que puede tener una invitación.';


--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 1711
-- Name: COLUMN estatus_invitacion.id_estatus_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_invitacion.id_estatus_invitacion IS 'Campo de tipo entero que identifica un estado de invitación.';


--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 1711
-- Name: COLUMN estatus_invitacion.nombre_estatus_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_invitacion.nombre_estatus_invitacion IS 'Campo de tipo texto que da nombre a un estatus de invitación.';


--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 1711
-- Name: COLUMN estatus_invitacion.descripcion_estatus_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_invitacion.descripcion_estatus_invitacion IS 'Campo de tipo texto que define a detalle un estatus de invitación.';


--
-- TOC entry 1712 (class 1259 OID 16500)
-- Dependencies: 6 1711
-- Name: estatus_invitacion_id_estatus_invitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_invitacion_id_estatus_invitacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_invitacion_id_estatus_invitacion_seq OWNER TO postgres;

--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 1712
-- Name: estatus_invitacion_id_estatus_invitacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_invitacion_id_estatus_invitacion_seq OWNED BY estatus_invitacion.id_estatus_invitacion;


--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 1712
-- Name: estatus_invitacion_id_estatus_invitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_invitacion_id_estatus_invitacion_seq', 1, false);


--
-- TOC entry 1713 (class 1259 OID 16502)
-- Dependencies: 6
-- Name: estatus_miembro_comunidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_miembro_comunidad (
    id_estatus_miembro_comunidad integer NOT NULL,
    nombre_estatus_miembro_comunidad character varying(15) NOT NULL,
    definicion_estatus_miembro_comunidad character varying(150) NOT NULL
);


ALTER TABLE public.estatus_miembro_comunidad OWNER TO postgres;

--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 1713
-- Name: TABLE estatus_miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_miembro_comunidad IS 'Tabla que describe los diferentes estados que puede tener un miembro de una comunidad.';


--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 1713
-- Name: COLUMN estatus_miembro_comunidad.id_estatus_miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_miembro_comunidad.id_estatus_miembro_comunidad IS 'Campo de tipo entero que se refiere al identificador de las filas en la tabla estatus_miembro_comunidad.';


--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 1713
-- Name: COLUMN estatus_miembro_comunidad.nombre_estatus_miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_miembro_comunidad.nombre_estatus_miembro_comunidad IS 'Campo de tipo texto que define el nombre de un estatus en la tabla estatus_miembro_comunidad.';


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 1713
-- Name: COLUMN estatus_miembro_comunidad.definicion_estatus_miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_miembro_comunidad.definicion_estatus_miembro_comunidad IS 'Campo de tipo texto que define el nombre_estatus_miembro_comunidad.';


--
-- TOC entry 1714 (class 1259 OID 16505)
-- Dependencies: 1713 6
-- Name: estatus_miembro_id_estatus_miembro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_miembro_id_estatus_miembro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_miembro_id_estatus_miembro_seq OWNER TO postgres;

--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 1714
-- Name: estatus_miembro_id_estatus_miembro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_miembro_id_estatus_miembro_seq OWNED BY estatus_miembro_comunidad.id_estatus_miembro_comunidad;


--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 1714
-- Name: estatus_miembro_id_estatus_miembro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_miembro_id_estatus_miembro_seq', 1, false);


--
-- TOC entry 1715 (class 1259 OID 16507)
-- Dependencies: 1697 6
-- Name: estatus_monetario_id_estatus_monetario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_monetario_id_estatus_monetario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_monetario_id_estatus_monetario_seq OWNER TO postgres;

--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 1715
-- Name: estatus_monetario_id_estatus_monetario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_monetario_id_estatus_monetario_seq OWNED BY estatus_ayuda_monetaria.id_estatus_ayuda_monetaria;


--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 1715
-- Name: estatus_monetario_id_estatus_monetario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_monetario_id_estatus_monetario_seq', 1, false);


--
-- TOC entry 1716 (class 1259 OID 16509)
-- Dependencies: 6
-- Name: estatus_necesidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_necesidad (
    id_estatus_necesidad integer NOT NULL,
    nombre_estatus_necesidad character varying(15) NOT NULL,
    definicion_estatus_necesidad character varying(150) NOT NULL
);


ALTER TABLE public.estatus_necesidad OWNER TO postgres;

--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 1716
-- Name: TABLE estatus_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_necesidad IS 'Tabla que contendrá los diferentes estatus que puede tener una necesidad.';


--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 1716
-- Name: COLUMN estatus_necesidad.id_estatus_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_necesidad.id_estatus_necesidad IS 'Campo de tipo entero que define el identificador de las columnas de esta tabla.';


--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 1716
-- Name: COLUMN estatus_necesidad.nombre_estatus_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_necesidad.nombre_estatus_necesidad IS 'Campo de tipo texto que define el nombre para un estatus de necesidad.';


--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 1716
-- Name: COLUMN estatus_necesidad.definicion_estatus_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_necesidad.definicion_estatus_necesidad IS 'Campo de tipo texto que define el significado del nombre de un estatus_necesidad.';


--
-- TOC entry 1717 (class 1259 OID 16512)
-- Dependencies: 1716 6
-- Name: estatus_necesidad_id_estatus_necesidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_necesidad_id_estatus_necesidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_necesidad_id_estatus_necesidad_seq OWNER TO postgres;

--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 1717
-- Name: estatus_necesidad_id_estatus_necesidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_necesidad_id_estatus_necesidad_seq OWNED BY estatus_necesidad.id_estatus_necesidad;


--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 1717
-- Name: estatus_necesidad_id_estatus_necesidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_necesidad_id_estatus_necesidad_seq', 1, false);


--
-- TOC entry 1718 (class 1259 OID 16514)
-- Dependencies: 6
-- Name: estatus_pregunta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_pregunta (
    id_estatus_pregunta integer NOT NULL,
    nombre_estatus_pregunta character varying(15) NOT NULL,
    definicion_estatus_pregunta character varying(150) NOT NULL
);


ALTER TABLE public.estatus_pregunta OWNER TO postgres;

--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 1718
-- Name: TABLE estatus_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_pregunta IS 'Contendrá los registros que representen todos los posibles estados que pueda tener una pregunta.';


--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 1718
-- Name: COLUMN estatus_pregunta.id_estatus_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_pregunta.id_estatus_pregunta IS 'Campo que define el identificador de las filas de la tabla estatus_pregunta';


--
-- TOC entry 2663 (class 0 OID 0)
-- Dependencies: 1718
-- Name: COLUMN estatus_pregunta.nombre_estatus_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_pregunta.nombre_estatus_pregunta IS 'Campo que define el nombre de un estatus en la tabla estatus_pregunta';


--
-- TOC entry 2664 (class 0 OID 0)
-- Dependencies: 1718
-- Name: COLUMN estatus_pregunta.definicion_estatus_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_pregunta.definicion_estatus_pregunta IS 'Campo que define un nombre de un registro en estatus_pregunta.';


--
-- TOC entry 1719 (class 1259 OID 16517)
-- Dependencies: 6 1718
-- Name: estatus_pregunta_id_estatus_pregunta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_pregunta_id_estatus_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_pregunta_id_estatus_pregunta_seq OWNER TO postgres;

--
-- TOC entry 2665 (class 0 OID 0)
-- Dependencies: 1719
-- Name: estatus_pregunta_id_estatus_pregunta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_pregunta_id_estatus_pregunta_seq OWNED BY estatus_pregunta.id_estatus_pregunta;


--
-- TOC entry 2666 (class 0 OID 0)
-- Dependencies: 1719
-- Name: estatus_pregunta_id_estatus_pregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_pregunta_id_estatus_pregunta_seq', 1, false);


--
-- TOC entry 1720 (class 1259 OID 16519)
-- Dependencies: 6 1698
-- Name: estatus_recursos_humanos_id_estatus_recursos_humanos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_recursos_humanos_id_estatus_recursos_humanos_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_recursos_humanos_id_estatus_recursos_humanos_seq OWNER TO postgres;

--
-- TOC entry 2667 (class 0 OID 0)
-- Dependencies: 1720
-- Name: estatus_recursos_humanos_id_estatus_recursos_humanos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_recursos_humanos_id_estatus_recursos_humanos_seq OWNED BY estatus_ayuda_recursos_humanos.id_estatus_ayuda_recursos_humanos;


--
-- TOC entry 2668 (class 0 OID 0)
-- Dependencies: 1720
-- Name: estatus_recursos_humanos_id_estatus_recursos_humanos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_recursos_humanos_id_estatus_recursos_humanos_seq', 1, false);


--
-- TOC entry 1721 (class 1259 OID 16521)
-- Dependencies: 6
-- Name: estatus_reporte_abuso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_reporte_abuso (
    id_estatus_reporte_abuso integer NOT NULL,
    nombre_estatus_reporte_abuso character varying(15) NOT NULL,
    definicion_estatus_reporte_abuso character varying(150) NOT NULL
);


ALTER TABLE public.estatus_reporte_abuso OWNER TO postgres;

--
-- TOC entry 2669 (class 0 OID 0)
-- Dependencies: 1721
-- Name: TABLE estatus_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_reporte_abuso IS 'Tabla que define el estatus de un reporte de abuso.';


--
-- TOC entry 2670 (class 0 OID 0)
-- Dependencies: 1721
-- Name: COLUMN estatus_reporte_abuso.id_estatus_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_reporte_abuso.id_estatus_reporte_abuso IS 'Campo que sirve de identificador para los registros de la tabla estatus_reporte_abuso';


--
-- TOC entry 2671 (class 0 OID 0)
-- Dependencies: 1721
-- Name: COLUMN estatus_reporte_abuso.nombre_estatus_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_reporte_abuso.nombre_estatus_reporte_abuso IS 'Campo de tipo texto que define el nombre de un estatus de reporte de abuso.';


--
-- TOC entry 2672 (class 0 OID 0)
-- Dependencies: 1721
-- Name: COLUMN estatus_reporte_abuso.definicion_estatus_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_reporte_abuso.definicion_estatus_reporte_abuso IS 'Campo de tipo texto que describe a detalle un estatus de reporte de abuso.';


--
-- TOC entry 1722 (class 1259 OID 16524)
-- Dependencies: 1721 6
-- Name: estatus_reporte_abuso_id_estatus_reporte_abuso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_reporte_abuso_id_estatus_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_reporte_abuso_id_estatus_reporte_abuso_seq OWNER TO postgres;

--
-- TOC entry 2673 (class 0 OID 0)
-- Dependencies: 1722
-- Name: estatus_reporte_abuso_id_estatus_reporte_abuso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_reporte_abuso_id_estatus_reporte_abuso_seq OWNED BY estatus_reporte_abuso.id_estatus_reporte_abuso;


--
-- TOC entry 2674 (class 0 OID 0)
-- Dependencies: 1722
-- Name: estatus_reporte_abuso_id_estatus_reporte_abuso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_reporte_abuso_id_estatus_reporte_abuso_seq', 1, false);


--
-- TOC entry 1723 (class 1259 OID 16526)
-- Dependencies: 6
-- Name: estatus_seguidor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_seguidor (
    id_estatus_seguidor integer NOT NULL,
    nombre_estatus_seguidor character varying(15) NOT NULL,
    definicion_estatus_seguidor character varying(150) NOT NULL
);


ALTER TABLE public.estatus_seguidor OWNER TO postgres;

--
-- TOC entry 2675 (class 0 OID 0)
-- Dependencies: 1723
-- Name: TABLE estatus_seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_seguidor IS 'Representa los diferentes estados que puede tener un follower/seguidor de alguna idea.';


--
-- TOC entry 2676 (class 0 OID 0)
-- Dependencies: 1723
-- Name: COLUMN estatus_seguidor.id_estatus_seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_seguidor.id_estatus_seguidor IS 'Campo de tipo entero que describe al identificador de las filas en la tabla estatus_seguidor.';


--
-- TOC entry 2677 (class 0 OID 0)
-- Dependencies: 1723
-- Name: COLUMN estatus_seguidor.nombre_estatus_seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_seguidor.nombre_estatus_seguidor IS 'Campo de tipo texto que define el nombre de un estatus que tiene un seguidor.';


--
-- TOC entry 2678 (class 0 OID 0)
-- Dependencies: 1723
-- Name: COLUMN estatus_seguidor.definicion_estatus_seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_seguidor.definicion_estatus_seguidor IS 'Campo de tipo texto que define un nombre de un estatus_seguidor.';


--
-- TOC entry 1724 (class 1259 OID 16529)
-- Dependencies: 6 1723
-- Name: estatus_seguidor_id_estatus_seguidor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_seguidor_id_estatus_seguidor_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_seguidor_id_estatus_seguidor_seq OWNER TO postgres;

--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 1724
-- Name: estatus_seguidor_id_estatus_seguidor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_seguidor_id_estatus_seguidor_seq OWNED BY estatus_seguidor.id_estatus_seguidor;


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 1724
-- Name: estatus_seguidor_id_estatus_seguidor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_seguidor_id_estatus_seguidor_seq', 1, false);


--
-- TOC entry 1725 (class 1259 OID 16531)
-- Dependencies: 6
-- Name: estatus_ticket_registro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_ticket_registro (
    id_estatus_ticket_registro integer NOT NULL,
    nombre_estatus_ticket_registro character varying(15) NOT NULL,
    definicion_estatus_ticket_registro character varying(150) NOT NULL
);


ALTER TABLE public.estatus_ticket_registro OWNER TO postgres;

--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 1725
-- Name: TABLE estatus_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_ticket_registro IS 'Tabla que describe los diferentes estados que puede tomar un ticket de registro de usuarios.';


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 1725
-- Name: COLUMN estatus_ticket_registro.id_estatus_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ticket_registro.id_estatus_ticket_registro IS 'Campo de tipo entero que identifica a las filas de latabla estatus_ticket_registro';


--
-- TOC entry 2683 (class 0 OID 0)
-- Dependencies: 1725
-- Name: COLUMN estatus_ticket_registro.nombre_estatus_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ticket_registro.nombre_estatus_ticket_registro IS 'Campo de tipo texto que define el nombre de un estatus de ticket de registro.';


--
-- TOC entry 2684 (class 0 OID 0)
-- Dependencies: 1725
-- Name: COLUMN estatus_ticket_registro.definicion_estatus_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_ticket_registro.definicion_estatus_ticket_registro IS 'Campo de tipo texto que define a detalle un estado que puede tomar un ticket de registro.';


--
-- TOC entry 1726 (class 1259 OID 16534)
-- Dependencies: 1725 6
-- Name: estatus_ticket_registro_id_estatus_ticket_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_ticket_registro_id_estatus_ticket_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_ticket_registro_id_estatus_ticket_registro_seq OWNER TO postgres;

--
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 1726
-- Name: estatus_ticket_registro_id_estatus_ticket_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_ticket_registro_id_estatus_ticket_registro_seq OWNED BY estatus_ticket_registro.id_estatus_ticket_registro;


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 1726
-- Name: estatus_ticket_registro_id_estatus_ticket_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_ticket_registro_id_estatus_ticket_registro_seq', 1, false);


--
-- TOC entry 1727 (class 1259 OID 16536)
-- Dependencies: 6
-- Name: estatus_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus_usuario (
    id_estatus_usuario integer NOT NULL,
    nombre_estatus_usuario character varying(15) NOT NULL,
    definicion_estatus_usuario character varying(150) NOT NULL
);


ALTER TABLE public.estatus_usuario OWNER TO postgres;

--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 1727
-- Name: TABLE estatus_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus_usuario IS 'Tabla que contendrá registros que describirán el estado de un usuario.';


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 1727
-- Name: COLUMN estatus_usuario.id_estatus_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_usuario.id_estatus_usuario IS 'Columna de tipo texto que define el identificador de las filas de la tabla estatus_usuario.';


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 1727
-- Name: COLUMN estatus_usuario.nombre_estatus_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_usuario.nombre_estatus_usuario IS 'Campo de tipo texto que define el nombre de un estatus de usuario.';


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 1727
-- Name: COLUMN estatus_usuario.definicion_estatus_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estatus_usuario.definicion_estatus_usuario IS 'Campo de tipo texto que describe con más detalle el significado de un estatus de usuario.';


--
-- TOC entry 1728 (class 1259 OID 16539)
-- Dependencies: 6 1727
-- Name: estatus_usuario_id_estatus_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_usuario_id_estatus_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_usuario_id_estatus_usuario_seq OWNER TO postgres;

--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 1728
-- Name: estatus_usuario_id_estatus_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_usuario_id_estatus_usuario_seq OWNED BY estatus_usuario.id_estatus_usuario;


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 1728
-- Name: estatus_usuario_id_estatus_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_usuario_id_estatus_usuario_seq', 1, false);


--
-- TOC entry 1788 (class 1259 OID 18155)
-- Dependencies: 6
-- Name: frase; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE frase (
    id_frase integer NOT NULL,
    texto_frase character varying(300) NOT NULL,
    autor_frase character varying(70) NOT NULL,
    ocupacion_autor_frase character varying(100),
    votos_positivos_frase integer NOT NULL,
    votos_negativos_frase integer NOT NULL,
    calificacion_frase real NOT NULL
);


ALTER TABLE public.frase OWNER TO postgres;

--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 1788
-- Name: TABLE frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE frase IS 'Tabla que contendrá las frases motivadoras para los emprendedores.';


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.id_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.id_frase IS 'Campo de tipo entero que identifica los campos de la tabla frase.';


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.texto_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.texto_frase IS 'Campo de tipo texto que describe el texto que compone la frase.';


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.autor_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.autor_frase IS 'Campo de tipo texto que describe el nombre del autor.';


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.ocupacion_autor_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.ocupacion_autor_frase IS 'Campo de tipo entero que describe la ocupación del autor.';


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.votos_positivos_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.votos_positivos_frase IS 'Campo de tipo entero que sirve de contador para los votos positivos de la frase.';


--
-- TOC entry 2699 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.votos_negativos_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.votos_negativos_frase IS 'Campo de tipo entero que sirve de contador para los votos negativos de la frase.';


--
-- TOC entry 2700 (class 0 OID 0)
-- Dependencies: 1788
-- Name: COLUMN frase.calificacion_frase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN frase.calificacion_frase IS 'Campo de tipo float que contiene la calificación de una frase.';


--
-- TOC entry 1789 (class 1259 OID 18175)
-- Dependencies: 1788 6
-- Name: frase_id_frase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE frase_id_frase_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.frase_id_frase_seq OWNER TO postgres;

--
-- TOC entry 2701 (class 0 OID 0)
-- Dependencies: 1789
-- Name: frase_id_frase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE frase_id_frase_seq OWNED BY frase.id_frase;


--
-- TOC entry 2702 (class 0 OID 0)
-- Dependencies: 1789
-- Name: frase_id_frase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('frase_id_frase_seq', 4, true);


--
-- TOC entry 1729 (class 1259 OID 16541)
-- Dependencies: 6
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 2703 (class 0 OID 0)
-- Dependencies: 1729
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 889, true);


--
-- TOC entry 1730 (class 1259 OID 16543)
-- Dependencies: 6
-- Name: idea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idea (
    id_idea integer NOT NULL,
    estatus_idea_id integer NOT NULL,
    estatus_ayuda_recursos_humanos_id integer NOT NULL,
    estatus_ayuda_monetaria_id integer NOT NULL,
    titulo_idea character varying(100) NOT NULL,
    fecha_creacion_idea date NOT NULL,
    resumen_idea character varying(500),
    nombre_imagen character varying(100),
    usuario_id integer NOT NULL,
    votos_positivos_idea integer NOT NULL,
    votos_negativos_idea integer NOT NULL,
    calificacion_idea double precision,
    contenido_idea character varying(20000) NOT NULL,
    lugar_id integer,
    activa boolean
);


ALTER TABLE public.idea OWNER TO postgres;

--
-- TOC entry 2704 (class 0 OID 0)
-- Dependencies: 1730
-- Name: TABLE idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE idea IS 'Contiene las ideas presentes en la aplicación.';


--
-- TOC entry 2705 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.id_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.id_idea IS 'Campo de tipo entero que funciona como identificador de las filas de la tabla idea.';


--
-- TOC entry 2706 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.estatus_idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.estatus_idea_id IS 'Campo de tipo entero que define el estatus de la idea.';


--
-- TOC entry 2707 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.estatus_ayuda_recursos_humanos_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.estatus_ayuda_recursos_humanos_id IS 'Campo de tipo entero que define el estatus de la ayuda de recursos humanos de una idea. También puede interpretarse como la necesidad de integrantes de una idea.';


--
-- TOC entry 2708 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.estatus_ayuda_monetaria_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.estatus_ayuda_monetaria_id IS 'Campo de tipo entero que define el estado de la ayuda monetaria en una idea. También puede interpretarse como la cantidad de dinero (en términos de poco, mucho, nada, etc) necesario para la ejecución y/o sovrevivencia de una idea.';


--
-- TOC entry 2709 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.titulo_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.titulo_idea IS 'Campo de tipo texto que define el título de una idea.';


--
-- TOC entry 2710 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.fecha_creacion_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.fecha_creacion_idea IS 'Campo de tipo date que define el momento en el que fue creada una idea.';


--
-- TOC entry 2711 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.resumen_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.resumen_idea IS 'Campo de tipo texto que define la idea principal de una idea.';


--
-- TOC entry 2712 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.nombre_imagen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.nombre_imagen IS 'Campo de tipo texto que define el nombre de la imagen.';


--
-- TOC entry 2713 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.usuario_id IS 'Campo de tipo entero que describe el id del usuario creador de la idea.';


--
-- TOC entry 2714 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.votos_positivos_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.votos_positivos_idea IS 'Campo de tipo entero que describe la cantidad de votos positivos que recibe una idea.';


--
-- TOC entry 2715 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.votos_negativos_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.votos_negativos_idea IS 'Campo de tipo entero que describe la cantidad de votos negativos que recibe una idea.';


--
-- TOC entry 2716 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.calificacion_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.calificacion_idea IS 'Campo de tipo entero que define la calificación de una idea.';


--
-- TOC entry 2717 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.contenido_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.contenido_idea IS 'Campo de tipo texto con una longitud de 20,000 caracteres que servirá como contenedor de la idea.';


--
-- TOC entry 2718 (class 0 OID 0)
-- Dependencies: 1730
-- Name: COLUMN idea.lugar_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN idea.lugar_id IS 'Campo que describe un posible lugar donde la idea puede desarrollarse.';


--
-- TOC entry 1731 (class 1259 OID 16549)
-- Dependencies: 6 1730
-- Name: idea_id_idea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idea_id_idea_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.idea_id_idea_seq OWNER TO postgres;

--
-- TOC entry 2719 (class 0 OID 0)
-- Dependencies: 1731
-- Name: idea_id_idea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idea_id_idea_seq OWNED BY idea.id_idea;


--
-- TOC entry 2720 (class 0 OID 0)
-- Dependencies: 1731
-- Name: idea_id_idea_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idea_id_idea_seq', 1, false);


--
-- TOC entry 1732 (class 1259 OID 16551)
-- Dependencies: 6
-- Name: imagen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE imagen (
    id_imagen integer NOT NULL,
    nombre_imagen character varying(15) NOT NULL,
    idea_id integer NOT NULL
);


ALTER TABLE public.imagen OWNER TO postgres;

--
-- TOC entry 2721 (class 0 OID 0)
-- Dependencies: 1732
-- Name: TABLE imagen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE imagen IS 'Tabla que contendrá registros de nombres de imágenes.';


--
-- TOC entry 2722 (class 0 OID 0)
-- Dependencies: 1732
-- Name: COLUMN imagen.id_imagen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN imagen.id_imagen IS 'Campo de tipo entero que define el identificador de una imagen.';


--
-- TOC entry 2723 (class 0 OID 0)
-- Dependencies: 1732
-- Name: COLUMN imagen.nombre_imagen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN imagen.nombre_imagen IS 'Campo de tipo texto que define el nombre de la imagen.';


--
-- TOC entry 2724 (class 0 OID 0)
-- Dependencies: 1732
-- Name: COLUMN imagen.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN imagen.idea_id IS 'Campo de tipo texto que describe la idea a la que pertenece una imagen.';


--
-- TOC entry 1733 (class 1259 OID 16554)
-- Dependencies: 1732 6
-- Name: imagen_id_imagen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE imagen_id_imagen_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.imagen_id_imagen_seq OWNER TO postgres;

--
-- TOC entry 2725 (class 0 OID 0)
-- Dependencies: 1733
-- Name: imagen_id_imagen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE imagen_id_imagen_seq OWNED BY imagen.id_imagen;


--
-- TOC entry 2726 (class 0 OID 0)
-- Dependencies: 1733
-- Name: imagen_id_imagen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('imagen_id_imagen_seq', 1, false);


--
-- TOC entry 1734 (class 1259 OID 16556)
-- Dependencies: 6
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institucion (
    id_institucion integer NOT NULL,
    nombre_institucion character varying(70) NOT NULL,
    descripcion_institucion character varying(1000) NOT NULL,
    url_institucion character varying(100),
    nombre_imagen_institucion character varying(100)
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- TOC entry 2727 (class 0 OID 0)
-- Dependencies: 1734
-- Name: TABLE institucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE institucion IS 'Tabla que contendrá la institución a la que pertenecerá el usuario.';


--
-- TOC entry 2728 (class 0 OID 0)
-- Dependencies: 1734
-- Name: COLUMN institucion.id_institucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN institucion.id_institucion IS 'Campo de tipo entero que define el identificador de las filas de la tabla institucion.';


--
-- TOC entry 2729 (class 0 OID 0)
-- Dependencies: 1734
-- Name: COLUMN institucion.nombre_institucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN institucion.nombre_institucion IS 'Campo de tipo texto que define el nombre de una institución.';


--
-- TOC entry 2730 (class 0 OID 0)
-- Dependencies: 1734
-- Name: COLUMN institucion.descripcion_institucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN institucion.descripcion_institucion IS 'Campo de texto que define la descripción de una institución a la que pertenece un usuario.';


--
-- TOC entry 2731 (class 0 OID 0)
-- Dependencies: 1734
-- Name: COLUMN institucion.url_institucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN institucion.url_institucion IS 'Campo de tipo texto que define la url de la página de internet de una institución.';


--
-- TOC entry 2732 (class 0 OID 0)
-- Dependencies: 1734
-- Name: COLUMN institucion.nombre_imagen_institucion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN institucion.nombre_imagen_institucion IS 'Campo de tipo texto que describe el nombre de la imagen (probablemente siglas) de la institución.';


--
-- TOC entry 1735 (class 1259 OID 16562)
-- Dependencies: 1734 6
-- Name: institucion_id_institucion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE institucion_id_institucion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.institucion_id_institucion_seq OWNER TO postgres;

--
-- TOC entry 2733 (class 0 OID 0)
-- Dependencies: 1735
-- Name: institucion_id_institucion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE institucion_id_institucion_seq OWNED BY institucion.id_institucion;


--
-- TOC entry 2734 (class 0 OID 0)
-- Dependencies: 1735
-- Name: institucion_id_institucion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('institucion_id_institucion_seq', 1, false);


--
-- TOC entry 1736 (class 1259 OID 16564)
-- Dependencies: 6
-- Name: integrante; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE integrante (
    usuario_id integer NOT NULL,
    idea_id integer NOT NULL,
    estatus_integrante_id integer NOT NULL,
    fecha_inicio_integrante date NOT NULL,
    fecha_fin_integrante date,
    eslider_integrante boolean NOT NULL,
    calificacion_integrante double precision
);


ALTER TABLE public.integrante OWNER TO postgres;

--
-- TOC entry 2735 (class 0 OID 0)
-- Dependencies: 1736
-- Name: TABLE integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE integrante IS 'Contiene los registros de un usuario preteneciente a las filas de alguna idea.';


--
-- TOC entry 2736 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.usuario_id IS 'Campo de tipoentero que define la relación entre un integrante de una idea y un usuario del sistema.';


--
-- TOC entry 2737 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.idea_id IS 'Campo de tipo entero que define la relación entre un integrante y la idea a la que pertenece.';


--
-- TOC entry 2738 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.estatus_integrante_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.estatus_integrante_id IS 'Campo de tipo entero que define la relación entre el integrante de una idea y un estatus de integrante.';


--
-- TOC entry 2739 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.fecha_inicio_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.fecha_inicio_integrante IS 'Campo de tipo date que define la fecha en que un usuario se volvió integrante de una idea.';


--
-- TOC entry 2740 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.fecha_fin_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.fecha_fin_integrante IS 'Campo de tipo fecha en que un usuario dejó de seguir una idea.';


--
-- TOC entry 2741 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.eslider_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.eslider_integrante IS 'Campo de tipo booleano que define si un integrante de una idea es líder (o creador) de esta.';


--
-- TOC entry 2742 (class 0 OID 0)
-- Dependencies: 1736
-- Name: COLUMN integrante.calificacion_integrante; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN integrante.calificacion_integrante IS 'Campo de tipo entero que define la calificación sobre la participación de un integrante en una idea.';


--
-- TOC entry 1737 (class 1259 OID 16567)
-- Dependencies: 6
-- Name: invitacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invitacion (
    id_invitacion integer NOT NULL,
    usuario_invitado_id integer,
    usuario_invitante_id integer,
    correo_usuario_invitacion character varying(100) NOT NULL,
    fecha_registro_invitacion date NOT NULL,
    fecha_usuario_registrado_invitacion date,
    texto_invitacion character varying(150) NOT NULL,
    estatus_invitacion_id integer NOT NULL,
    ticket_registro_id integer NOT NULL
);


ALTER TABLE public.invitacion OWNER TO postgres;

--
-- TOC entry 2743 (class 0 OID 0)
-- Dependencies: 1737
-- Name: TABLE invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE invitacion IS 'Tabla que contendrá las invitaciones de ingreso a linkuam hechas por usuarios.';


--
-- TOC entry 2744 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.id_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.id_invitacion IS 'Campo de tipo entero que identifica a los registros de la tabla invitacion.';


--
-- TOC entry 2745 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.usuario_invitado_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.usuario_invitado_id IS 'Campo de tipo entero que define el usuario que realiza la invitación.';


--
-- TOC entry 2746 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.usuario_invitante_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.usuario_invitante_id IS 'Campo de tipo entero que define al usuario que utiliza la invitación.';


--
-- TOC entry 2747 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.correo_usuario_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.correo_usuario_invitacion IS 'Campo de tipo texto que define el correo del usuario al que se enviará la invitación.';


--
-- TOC entry 2748 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.fecha_registro_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.fecha_registro_invitacion IS 'Campo de tipo fecha que define la fecha en que se registra una invitación.';


--
-- TOC entry 2749 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.fecha_usuario_registrado_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.fecha_usuario_registrado_invitacion IS 'Campo de tipo fecha que define cuando un usuario utilizó la invitación.';


--
-- TOC entry 2750 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.texto_invitacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.texto_invitacion IS 'Campo de tipo texto que define el contenido del texto de la invitación.';


--
-- TOC entry 2751 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.estatus_invitacion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.estatus_invitacion_id IS 'Campo de tipo entero que define el estado de una invitación.';


--
-- TOC entry 2752 (class 0 OID 0)
-- Dependencies: 1737
-- Name: COLUMN invitacion.ticket_registro_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN invitacion.ticket_registro_id IS 'Campo de tipo entero que define el ticket_registro utilizado para poder reconocer la invitación como válida.';


--
-- TOC entry 1738 (class 1259 OID 16570)
-- Dependencies: 6
-- Name: justificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE justificacion (
    id_justificacion integer NOT NULL,
    descripcion_justificacion character varying(500) NOT NULL,
    fecha_justificacion date,
    idea_id integer NOT NULL
);


ALTER TABLE public.justificacion OWNER TO postgres;

--
-- TOC entry 2753 (class 0 OID 0)
-- Dependencies: 1738
-- Name: TABLE justificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE justificacion IS 'Tabla que contendrá la justificación de una idea.';


--
-- TOC entry 2754 (class 0 OID 0)
-- Dependencies: 1738
-- Name: COLUMN justificacion.id_justificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN justificacion.id_justificacion IS 'Campo de tipo entero que define el identificador de las filas de la tabla justificacion.';


--
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 1738
-- Name: COLUMN justificacion.descripcion_justificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN justificacion.descripcion_justificacion IS 'Campo de tipo entero que define la descripcion de la justificacion.';


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 1738
-- Name: COLUMN justificacion.fecha_justificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN justificacion.fecha_justificacion IS 'Campo de tipo fecha que define el momento en que fue creada una justificacion.';


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 1738
-- Name: COLUMN justificacion.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN justificacion.idea_id IS 'Campo de tipo entero que describe la relación entre una justificación y su idea.';


--
-- TOC entry 1739 (class 1259 OID 16576)
-- Dependencies: 6 1738
-- Name: justificacion_id_justificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE justificacion_id_justificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.justificacion_id_justificacion_seq OWNER TO postgres;

--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 1739
-- Name: justificacion_id_justificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE justificacion_id_justificacion_seq OWNED BY justificacion.id_justificacion;


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 1739
-- Name: justificacion_id_justificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('justificacion_id_justificacion_seq', 1, true);


--
-- TOC entry 1740 (class 1259 OID 16578)
-- Dependencies: 6 1686
-- Name: lista_comunidad_id_lista_comunidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_comunidad_id_lista_comunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_comunidad_id_lista_comunidad_seq OWNER TO postgres;

--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 1740
-- Name: lista_comunidad_id_lista_comunidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_comunidad_id_lista_comunidad_seq OWNED BY comunidad.id_comunidad;


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 1740
-- Name: lista_comunidad_id_lista_comunidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lista_comunidad_id_lista_comunidad_seq', 1, false);


--
-- TOC entry 1741 (class 1259 OID 16580)
-- Dependencies: 6
-- Name: lugar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lugar (
    id_lugar integer NOT NULL,
    nombre_lugar character varying(100) NOT NULL,
    descripcion_lugar character varying(150) NOT NULL,
    usuario_id integer,
    tipo_lugar_id integer NOT NULL
);


ALTER TABLE public.lugar OWNER TO postgres;

--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 1741
-- Name: TABLE lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lugar IS 'Tabla que contiene los lugares disponibles para ser ocupados por las ideas.';


--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 1741
-- Name: COLUMN lugar.id_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lugar.id_lugar IS 'Campo de tipo entero que identifica los registros de la tabla lugar.';


--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 1741
-- Name: COLUMN lugar.nombre_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lugar.nombre_lugar IS 'Campo de tipo texto que define el nombre del lugar.';


--
-- TOC entry 2765 (class 0 OID 0)
-- Dependencies: 1741
-- Name: COLUMN lugar.descripcion_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lugar.descripcion_lugar IS 'Campo de tipo texto que describe a detalle un lugar.';


--
-- TOC entry 2766 (class 0 OID 0)
-- Dependencies: 1741
-- Name: COLUMN lugar.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lugar.usuario_id IS 'Campo de tipo entero que describe el usuario responsable de un lugar.';


--
-- TOC entry 2767 (class 0 OID 0)
-- Dependencies: 1741
-- Name: COLUMN lugar.tipo_lugar_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN lugar.tipo_lugar_id IS 'Campo de tipo entero que describe el tipo de lugar.';


--
-- TOC entry 1742 (class 1259 OID 16583)
-- Dependencies: 1741 6
-- Name: lugar_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lugar_id_lugar_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lugar_id_lugar_seq OWNER TO postgres;

--
-- TOC entry 2768 (class 0 OID 0)
-- Dependencies: 1742
-- Name: lugar_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lugar_id_lugar_seq OWNED BY lugar.id_lugar;


--
-- TOC entry 2769 (class 0 OID 0)
-- Dependencies: 1742
-- Name: lugar_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lugar_id_lugar_seq', 1, false);


--
-- TOC entry 1743 (class 1259 OID 16585)
-- Dependencies: 6
-- Name: miembro_comunidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE miembro_comunidad (
    usuario_id integer NOT NULL,
    comunidad_id integer NOT NULL,
    fecha_inicio_miembro_comunidad date NOT NULL,
    fecha_fin_miembro_comunidad date,
    estatus_miembro_comunidad_id integer NOT NULL
);


ALTER TABLE public.miembro_comunidad OWNER TO postgres;

--
-- TOC entry 2770 (class 0 OID 0)
-- Dependencies: 1743
-- Name: TABLE miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE miembro_comunidad IS 'Esta tabla contendrá una lista de todos los usuarios que se hayan inscrito a alguna comunidad, así como la comunidad a la que estos pertenecen.';


--
-- TOC entry 2771 (class 0 OID 0)
-- Dependencies: 1743
-- Name: COLUMN miembro_comunidad.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN miembro_comunidad.usuario_id IS 'Campo del tipo entero que describe el usuario que pertenece a cierta comunidad.';


--
-- TOC entry 2772 (class 0 OID 0)
-- Dependencies: 1743
-- Name: COLUMN miembro_comunidad.comunidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN miembro_comunidad.comunidad_id IS 'Campo de tipo entero que describe la comunidad a la que pertenece algún usuario. (miembro-comunidad).';


--
-- TOC entry 2773 (class 0 OID 0)
-- Dependencies: 1743
-- Name: COLUMN miembro_comunidad.fecha_inicio_miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN miembro_comunidad.fecha_inicio_miembro_comunidad IS 'Campo de tipo date que describe la fecha en la que cierto usuario comenzó a ser miembro de una comunidad.';


--
-- TOC entry 2774 (class 0 OID 0)
-- Dependencies: 1743
-- Name: COLUMN miembro_comunidad.fecha_fin_miembro_comunidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN miembro_comunidad.fecha_fin_miembro_comunidad IS 'Campo de tipo date que describe la fecha en la que un usuario deja de ser miembro de una comunidad. PUEDE SER NULO.';


--
-- TOC entry 2775 (class 0 OID 0)
-- Dependencies: 1743
-- Name: COLUMN miembro_comunidad.estatus_miembro_comunidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN miembro_comunidad.estatus_miembro_comunidad_id IS 'Campo de tipo entero que se relaciona con el estatus que tenga un usuario para con una comunidad.';


--
-- TOC entry 1744 (class 1259 OID 16588)
-- Dependencies: 6
-- Name: necesidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE necesidad (
    id_necesidad integer NOT NULL,
    descripcion_necesidad character varying(500) NOT NULL,
    fecha_necesidad date,
    idea_id integer NOT NULL,
    estatus_necesidad_id integer NOT NULL
);


ALTER TABLE public.necesidad OWNER TO postgres;

--
-- TOC entry 2776 (class 0 OID 0)
-- Dependencies: 1744
-- Name: TABLE necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE necesidad IS 'Tabla que contiene los registros de las necesidades que tiene una idea para realizarse.';


--
-- TOC entry 2777 (class 0 OID 0)
-- Dependencies: 1744
-- Name: COLUMN necesidad.id_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN necesidad.id_necesidad IS 'Campo de tipo entero que define el identificador de las filas de la tabla necesidad.';


--
-- TOC entry 2778 (class 0 OID 0)
-- Dependencies: 1744
-- Name: COLUMN necesidad.descripcion_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN necesidad.descripcion_necesidad IS 'Campo de tipo texto que detalla la necesidad.';


--
-- TOC entry 2779 (class 0 OID 0)
-- Dependencies: 1744
-- Name: COLUMN necesidad.fecha_necesidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN necesidad.fecha_necesidad IS 'Campo de tipo fecha que describe cuando fue creada una necesidad.';


--
-- TOC entry 2780 (class 0 OID 0)
-- Dependencies: 1744
-- Name: COLUMN necesidad.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN necesidad.idea_id IS 'Campo de tipo entero que describe la idea con la que esta necesidad está relacionada.';


--
-- TOC entry 2781 (class 0 OID 0)
-- Dependencies: 1744
-- Name: COLUMN necesidad.estatus_necesidad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN necesidad.estatus_necesidad_id IS 'Campo de tipo entero que define el estatus de una necesidad.';


--
-- TOC entry 1745 (class 1259 OID 16594)
-- Dependencies: 6 1744
-- Name: necesidad_id_necesidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE necesidad_id_necesidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.necesidad_id_necesidad_seq OWNER TO postgres;

--
-- TOC entry 2782 (class 0 OID 0)
-- Dependencies: 1745
-- Name: necesidad_id_necesidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE necesidad_id_necesidad_seq OWNED BY necesidad.id_necesidad;


--
-- TOC entry 2783 (class 0 OID 0)
-- Dependencies: 1745
-- Name: necesidad_id_necesidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('necesidad_id_necesidad_seq', 1, false);


--
-- TOC entry 1746 (class 1259 OID 16596)
-- Dependencies: 6
-- Name: objetivo_especifico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objetivo_especifico (
    id_objetivo_especifico integer NOT NULL,
    descripcion_objetivo_especifico character varying(250) NOT NULL,
    fecha_objetivo_especifico date,
    idea_id integer NOT NULL
);


ALTER TABLE public.objetivo_especifico OWNER TO postgres;

--
-- TOC entry 2784 (class 0 OID 0)
-- Dependencies: 1746
-- Name: TABLE objetivo_especifico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE objetivo_especifico IS 'Tabla que describirá los objetivos específicos de una idea.';


--
-- TOC entry 2785 (class 0 OID 0)
-- Dependencies: 1746
-- Name: COLUMN objetivo_especifico.id_objetivo_especifico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_especifico.id_objetivo_especifico IS 'Campo que describe el identificador de las filas de la tabla objetivo específico.';


--
-- TOC entry 2786 (class 0 OID 0)
-- Dependencies: 1746
-- Name: COLUMN objetivo_especifico.descripcion_objetivo_especifico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_especifico.descripcion_objetivo_especifico IS 'Campo de tipo texto que define la descripción de un objetivo especifico.';


--
-- TOC entry 2787 (class 0 OID 0)
-- Dependencies: 1746
-- Name: COLUMN objetivo_especifico.fecha_objetivo_especifico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_especifico.fecha_objetivo_especifico IS 'Campo de tipo fecha que describe el momento en que fue generado un objetivo específico.';


--
-- TOC entry 2788 (class 0 OID 0)
-- Dependencies: 1746
-- Name: COLUMN objetivo_especifico.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_especifico.idea_id IS 'Campo que define la idea a la que pertenece un objetivo específico.';


--
-- TOC entry 1747 (class 1259 OID 16599)
-- Dependencies: 1746 6
-- Name: objetivo_especifico_id_objetivo_especifico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE objetivo_especifico_id_objetivo_especifico_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.objetivo_especifico_id_objetivo_especifico_seq OWNER TO postgres;

--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 1747
-- Name: objetivo_especifico_id_objetivo_especifico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE objetivo_especifico_id_objetivo_especifico_seq OWNED BY objetivo_especifico.id_objetivo_especifico;


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 1747
-- Name: objetivo_especifico_id_objetivo_especifico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('objetivo_especifico_id_objetivo_especifico_seq', 1, false);


--
-- TOC entry 1748 (class 1259 OID 16601)
-- Dependencies: 6
-- Name: objetivo_general; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objetivo_general (
    id_objetivo_general integer NOT NULL,
    descripcion_objetivo_general character varying(250) NOT NULL,
    fecha_objetivo_general date,
    idea_id integer NOT NULL
);


ALTER TABLE public.objetivo_general OWNER TO postgres;

--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 1748
-- Name: TABLE objetivo_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE objetivo_general IS 'Tabla que describe el objetivo(s) general de una idea.';


--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 1748
-- Name: COLUMN objetivo_general.id_objetivo_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_general.id_objetivo_general IS 'Campo de tipo entero que describe el identificador de las filas de la tabla objetivo general.';


--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 1748
-- Name: COLUMN objetivo_general.descripcion_objetivo_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_general.descripcion_objetivo_general IS 'Campo de tipo texto que describe un objetivo general.';


--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 1748
-- Name: COLUMN objetivo_general.fecha_objetivo_general; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_general.fecha_objetivo_general IS 'Campo de tipo fecha que describe la fecha en que se generó un objetivo general.';


--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 1748
-- Name: COLUMN objetivo_general.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN objetivo_general.idea_id IS 'Campo que describe la relación entre un objetivo general y la idea a la que pertenece.';


--
-- TOC entry 1749 (class 1259 OID 16604)
-- Dependencies: 6 1748
-- Name: objetivo_general_id_objetivo_general_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE objetivo_general_id_objetivo_general_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.objetivo_general_id_objetivo_general_seq OWNER TO postgres;

--
-- TOC entry 2796 (class 0 OID 0)
-- Dependencies: 1749
-- Name: objetivo_general_id_objetivo_general_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE objetivo_general_id_objetivo_general_seq OWNED BY objetivo_general.id_objetivo_general;


--
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 1749
-- Name: objetivo_general_id_objetivo_general_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('objetivo_general_id_objetivo_general_seq', 1, false);


--
-- TOC entry 1750 (class 1259 OID 16606)
-- Dependencies: 6
-- Name: permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permiso (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE public.permiso OWNER TO postgres;

--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 1750
-- Name: TABLE permiso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE permiso IS 'Tabla que contendrá los permisos de un usuario. Cada permiso está integrado por una combinación Usuario-Rol.';


--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 1750
-- Name: COLUMN permiso.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN permiso.usuario_id IS 'Campo de tipo entero que define el usuario al que se le asignan privilegios.';


--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 1750
-- Name: COLUMN permiso.rol_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN permiso.rol_id IS 'Campo de tipo entero que define el tipo de permiso que se le asigna a un usuario.';


--
-- TOC entry 1751 (class 1259 OID 16609)
-- Dependencies: 6
-- Name: pregunta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pregunta (
    id_pregunta integer NOT NULL,
    pregunta_pregunta character varying(280) NOT NULL,
    respuesta_pregunta character varying(280),
    usuario_pregunta_id integer NOT NULL,
    idea_id integer NOT NULL,
    estatus_pregunta_id integer NOT NULL,
    fecha_creacion_pregunta date NOT NULL,
    fecha_fin_pregunta date,
    usuario_respuesta_id integer
);


ALTER TABLE public.pregunta OWNER TO postgres;

--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 1751
-- Name: TABLE pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE pregunta IS 'Tabla que contiene las preguntas hechas por los usuarios del sistema en las ideas en las que se encuentren interesados.';


--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.id_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.id_pregunta IS 'Campo de tipo entero que define el identificador de las filas en la tabla pregunta.';


--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.pregunta_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.pregunta_pregunta IS 'Campo de tipo texto que define la pregunta hecha por un usuario.';


--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.respuesta_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.respuesta_pregunta IS 'Campo de tipo texto que define la respuesta a una pregunta.';


--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.usuario_pregunta_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.usuario_pregunta_id IS 'Campo de tipo entero que define el usuario que hizo la pregunta.';


--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.idea_id IS 'Campo de tipo entero que define la relación entre una pregunta y la idea a la que esta pertenece.';


--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.estatus_pregunta_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.estatus_pregunta_id IS 'Campo de tipo entero que define el estatus de una pregunta.';


--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.fecha_creacion_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.fecha_creacion_pregunta IS 'Campo de tipo fecha que define la fecha en la que una pregunta fue realizada.';


--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.fecha_fin_pregunta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.fecha_fin_pregunta IS 'Campo de tipo fecha que define la fecha en la que una pregunta fue respondida.';


--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 1751
-- Name: COLUMN pregunta.usuario_respuesta_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pregunta.usuario_respuesta_id IS 'Campo de tipo entero que define al usuario que respondió una pregunta.';


--
-- TOC entry 1752 (class 1259 OID 16615)
-- Dependencies: 6 1751
-- Name: pregunta_id_pregunta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pregunta_id_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pregunta_id_pregunta_seq OWNER TO postgres;

--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 1752
-- Name: pregunta_id_pregunta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pregunta_id_pregunta_seq OWNED BY pregunta.id_pregunta;


--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 1752
-- Name: pregunta_id_pregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pregunta_id_pregunta_seq', 1, true);


--
-- TOC entry 1753 (class 1259 OID 16617)
-- Dependencies: 6
-- Name: reporte_abuso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporte_abuso (
    id_reporte_abuso integer NOT NULL,
    nota_reporte_abuso character varying(1000) NOT NULL,
    usuario_id integer,
    tipo_reporte_abuso_id integer NOT NULL,
    idea_id integer NOT NULL,
    fecha_reporte_abuso date NOT NULL,
    estatus_reporte_abuso_id integer NOT NULL,
    accion_reporte_abuso_id integer
);


ALTER TABLE public.reporte_abuso OWNER TO postgres;

--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 1753
-- Name: TABLE reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE reporte_abuso IS 'Tabla que contendrá reportes de información no apropiada dentro del sistema.';


--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.id_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.id_reporte_abuso IS 'Campo de tipo entero que describe el identificador de las filas de la tabla reporte_abuso.';


--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.nota_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.nota_reporte_abuso IS 'Campo de tipo texto que define la descripción de un reporte_abuso.';


--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.usuario_id IS 'Campo de tipo entero que describe al usuario que realizó el reporte_abuso. Es opcional.';


--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.tipo_reporte_abuso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.tipo_reporte_abuso_id IS 'Campo de tipo entero que describe el tipo de reporte_abuso.';


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.idea_id IS 'Campo de tipo entero que describe la idea que se está reportando.';


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.fecha_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.fecha_reporte_abuso IS 'Campo de tipo date que define la fecha en que fue registrado el reporte.';


--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.estatus_reporte_abuso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.estatus_reporte_abuso_id IS 'Campo de tipo entero que define el estado en el que se encuentra un reporte_abuso.';


--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 1753
-- Name: COLUMN reporte_abuso.accion_reporte_abuso_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reporte_abuso.accion_reporte_abuso_id IS 'Campo de tipo entero que define la acción tomada por el administrador para con un reporte_abuso.';


--
-- TOC entry 1754 (class 1259 OID 16623)
-- Dependencies: 1753 6
-- Name: reporte_abuso_id_reporte_abuso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporte_abuso_id_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.reporte_abuso_id_reporte_abuso_seq OWNER TO postgres;

--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 1754
-- Name: reporte_abuso_id_reporte_abuso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporte_abuso_id_reporte_abuso_seq OWNED BY reporte_abuso.id_reporte_abuso;


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 1754
-- Name: reporte_abuso_id_reporte_abuso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporte_abuso_id_reporte_abuso_seq', 1, false);


--
-- TOC entry 1755 (class 1259 OID 16625)
-- Dependencies: 6
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    id_rol integer NOT NULL,
    nombre_rol character varying(15) NOT NULL,
    definicion_rol character varying(150) NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 1755
-- Name: TABLE rol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE rol IS 'Tabla que contendrá los diferentes roles que puede tener un usuario.';


--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 1755
-- Name: COLUMN rol.id_rol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN rol.id_rol IS 'Campo de tipo entero que define el identificador de la tabla rol.';


--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 1755
-- Name: COLUMN rol.nombre_rol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN rol.nombre_rol IS 'Campo de tipo texto que define el nombre de un rol.';


--
-- TOC entry 2827 (class 0 OID 0)
-- Dependencies: 1755
-- Name: COLUMN rol.definicion_rol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN rol.definicion_rol IS 'Campo de texto que define de manera más amplia un rol.';


--
-- TOC entry 1756 (class 1259 OID 16628)
-- Dependencies: 6 1755
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rol_id_rol_seq OWNER TO postgres;

--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 1756
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_id_rol_seq OWNED BY rol.id_rol;


--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 1756
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_id_rol_seq', 1, false);


--
-- TOC entry 1757 (class 1259 OID 16630)
-- Dependencies: 6
-- Name: seguidor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE seguidor (
    usuario_id integer NOT NULL,
    idea_id integer NOT NULL,
    estatus_seguidor_id integer NOT NULL,
    fecha_inicio_seguidor date NOT NULL,
    fecha_fin_seguidor date
);


ALTER TABLE public.seguidor OWNER TO postgres;

--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 1757
-- Name: TABLE seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE seguidor IS 'Contendrá los registros de las ideas que siguen los usuarios.';


--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 1757
-- Name: COLUMN seguidor.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN seguidor.usuario_id IS 'Campo de tipo entero que define al usuario que sigue una idea.';


--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 1757
-- Name: COLUMN seguidor.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN seguidor.idea_id IS 'Campo de tipo entero que define la idea que está siendo seguida.';


--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 1757
-- Name: COLUMN seguidor.estatus_seguidor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN seguidor.estatus_seguidor_id IS 'Campo de tipo entero que define el estatus de un seguidor.';


--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 1757
-- Name: COLUMN seguidor.fecha_inicio_seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN seguidor.fecha_inicio_seguidor IS 'Campo de tipo fecha que describe el momento en el que un usuario comenzó a seguir a una idea.';


--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 1757
-- Name: COLUMN seguidor.fecha_fin_seguidor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN seguidor.fecha_fin_seguidor IS 'Campo de tipo fecha que describe el momento en el que un usuario dejó de seguir a una idea.';


--
-- TOC entry 1758 (class 1259 OID 16633)
-- Dependencies: 6
-- Name: ticket_registro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ticket_registro (
    id_ticket_registro integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_ticket_registro date NOT NULL,
    fecha_ticket_usado date,
    estatus_ticket_registro_id integer NOT NULL,
    texto_ticket_registro character varying(128) NOT NULL,
    tipo_ticket_registro_id integer NOT NULL
);


ALTER TABLE public.ticket_registro OWNER TO postgres;

--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 1758
-- Name: TABLE ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ticket_registro IS 'Tabla que contiene los tickets para activar un usuario.';


--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.id_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.id_ticket_registro IS 'Campo de tipo entero que identifica las filas de la tabla ticket_registro.';


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.usuario_id IS 'Campo de tipo entero que definirá el usuario que se activará al usar este ticket.';


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.fecha_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.fecha_ticket_registro IS 'Campo de tipo date que define la fecha en que fue creado el ticket.';


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.fecha_ticket_usado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.fecha_ticket_usado IS 'Campo de tipo date que define la fecha en que fue usado el ticket.';


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.estatus_ticket_registro_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.estatus_ticket_registro_id IS 'Campo de tipo entero que define el estado en que se encuentra el ticket.';


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.texto_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.texto_ticket_registro IS 'Campo que define el texto del ticket que servirá para activar al usuario.';


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 1758
-- Name: COLUMN ticket_registro.tipo_ticket_registro_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ticket_registro.tipo_ticket_registro_id IS 'Campo que define de que tipo es un ticket_registro.';


--
-- TOC entry 1759 (class 1259 OID 16636)
-- Dependencies: 6 1758
-- Name: ticket_registro_id_ticket_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ticket_registro_id_ticket_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ticket_registro_id_ticket_registro_seq OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 1759
-- Name: ticket_registro_id_ticket_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ticket_registro_id_ticket_registro_seq OWNED BY ticket_registro.id_ticket_registro;


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 1759
-- Name: ticket_registro_id_ticket_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ticket_registro_id_ticket_registro_seq', 1, false);


--
-- TOC entry 1760 (class 1259 OID 16638)
-- Dependencies: 2106 6
-- Name: tipo_aviso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_aviso (
    id_tipo_aviso integer NOT NULL,
    nombre_tipo_aviso character varying(15) NOT NULL,
    definicion_tipo_aviso character varying DEFAULT 150 NOT NULL
);


ALTER TABLE public.tipo_aviso OWNER TO postgres;

--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 1760
-- Name: TABLE tipo_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_aviso IS 'Tabla que contendrá los registros que describirán los tipos de aviso que puden existir.';


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 1760
-- Name: COLUMN tipo_aviso.id_tipo_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_aviso.id_tipo_aviso IS 'Campo de tipo entero que define el identificador de los tipos de aviso.';


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 1760
-- Name: COLUMN tipo_aviso.nombre_tipo_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_aviso.nombre_tipo_aviso IS 'Campo de tipo texto que define los nombres de los tipos de aviso.';


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 1760
-- Name: COLUMN tipo_aviso.definicion_tipo_aviso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_aviso.definicion_tipo_aviso IS 'Campo de tipo texto que define a detalle un tipo de aviso.';


--
-- TOC entry 1761 (class 1259 OID 16645)
-- Dependencies: 1760 6
-- Name: tipo_aviso_id_tipo_aviso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_aviso_id_tipo_aviso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_aviso_id_tipo_aviso_seq OWNER TO postgres;

--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 1761
-- Name: tipo_aviso_id_tipo_aviso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_aviso_id_tipo_aviso_seq OWNED BY tipo_aviso.id_tipo_aviso;


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 1761
-- Name: tipo_aviso_id_tipo_aviso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_aviso_id_tipo_aviso_seq', 1, false);


--
-- TOC entry 1762 (class 1259 OID 16647)
-- Dependencies: 6
-- Name: tipo_bitacora; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_bitacora (
    id_tipo_bitacora integer NOT NULL,
    nombre_tipo_bitacora character varying(15) NOT NULL,
    definicion_tipo_bitacora character varying(150) NOT NULL
);


ALTER TABLE public.tipo_bitacora OWNER TO postgres;

--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 1762
-- Name: TABLE tipo_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_bitacora IS 'Representa los tipos de mensajes que pueden existir como elementos de una bitácora.';


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 1762
-- Name: COLUMN tipo_bitacora.id_tipo_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_bitacora.id_tipo_bitacora IS 'Campo de tipo entero que define el identificador de las filas en la tabla tipo_bitacora.';


--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 1762
-- Name: COLUMN tipo_bitacora.nombre_tipo_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_bitacora.nombre_tipo_bitacora IS 'Campo de tipo texto que define el nombre de un tipo de bitacora.';


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 1762
-- Name: COLUMN tipo_bitacora.definicion_tipo_bitacora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_bitacora.definicion_tipo_bitacora IS 'Campo de tipo texto que define a detalle un tipo de bitacora.';


--
-- TOC entry 1763 (class 1259 OID 16650)
-- Dependencies: 1762 6
-- Name: tipo_bitacora_id_tipo_bitacora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_bitacora_id_tipo_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_bitacora_id_tipo_bitacora_seq OWNER TO postgres;

--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 1763
-- Name: tipo_bitacora_id_tipo_bitacora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_bitacora_id_tipo_bitacora_seq OWNED BY tipo_bitacora.id_tipo_bitacora;


--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 1763
-- Name: tipo_bitacora_id_tipo_bitacora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_bitacora_id_tipo_bitacora_seq', 1, false);


--
-- TOC entry 1764 (class 1259 OID 16652)
-- Dependencies: 6
-- Name: tipo_contacto_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_contacto_usuario (
    id_tipo_contacto_usuario integer NOT NULL,
    nombre_tipo_contacto_usuario character varying(15) NOT NULL,
    definicion_tipo_contacto_usuario character varying(150) NOT NULL,
    dato1 character varying(100),
    dato2 character varying(100),
    dato3 character varying(100),
    dato4 character varying(100)
);


ALTER TABLE public.tipo_contacto_usuario OWNER TO postgres;

--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 1764
-- Name: TABLE tipo_contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_contacto_usuario IS 'Tabla que contendrá los diferentes tipos de contacto que puede tener un usuario.';


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.id_tipo_contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.id_tipo_contacto_usuario IS 'Campo de tipo entero que define el identificador de las filas de la tabla tipo_contacto_usuario.';


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.nombre_tipo_contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.nombre_tipo_contacto_usuario IS 'Campo de tipo texto que define el nombre de un tipo de contacto de usuario.';


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.definicion_tipo_contacto_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.definicion_tipo_contacto_usuario IS 'Campo de tipo texto que define con más detalle el significado de un nombre de tipo_contacto_usuario.';


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.dato1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.dato1 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.dato2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.dato2 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.dato3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.dato3 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 1764
-- Name: COLUMN tipo_contacto_usuario.dato4; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_contacto_usuario.dato4 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';


--
-- TOC entry 1765 (class 1259 OID 16658)
-- Dependencies: 1764 6
-- Name: tipo_contacto_usuario_id_tipo_contacto_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_contacto_usuario_id_tipo_contacto_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_contacto_usuario_id_tipo_contacto_usuario_seq OWNER TO postgres;

--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 1765
-- Name: tipo_contacto_usuario_id_tipo_contacto_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_contacto_usuario_id_tipo_contacto_usuario_seq OWNED BY tipo_contacto_usuario.id_tipo_contacto_usuario;


--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 1765
-- Name: tipo_contacto_usuario_id_tipo_contacto_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_contacto_usuario_id_tipo_contacto_usuario_seq', 1, false);


--
-- TOC entry 1766 (class 1259 OID 16660)
-- Dependencies: 6
-- Name: tipo_critica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_critica (
    id_tipo_critica integer NOT NULL,
    nombre_tipo_critica character varying(15) NOT NULL,
    definicion_tipo_critica character varying(150) NOT NULL
);


ALTER TABLE public.tipo_critica OWNER TO postgres;

--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 1766
-- Name: TABLE tipo_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_critica IS 'Tabla que contendrá los tipos de crítica que el usuario puede hacer al sistema.';


--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 1766
-- Name: COLUMN tipo_critica.id_tipo_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_critica.id_tipo_critica IS 'Campo de tipo entero que define el identificador de las filas de la tabla tipo_critica.';


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 1766
-- Name: COLUMN tipo_critica.nombre_tipo_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_critica.nombre_tipo_critica IS 'Campo de tipo texto que le da nombre a un tipo de crítica.';


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 1766
-- Name: COLUMN tipo_critica.definicion_tipo_critica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_critica.definicion_tipo_critica IS 'Campo de tipo texto que define de manera más amplia la descripción de un tipo de crítica.';


--
-- TOC entry 1767 (class 1259 OID 16663)
-- Dependencies: 1766 6
-- Name: tipo_critica_id_tipo_critica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_critica_id_tipo_critica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_critica_id_tipo_critica_seq OWNER TO postgres;

--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 1767
-- Name: tipo_critica_id_tipo_critica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_critica_id_tipo_critica_seq OWNED BY tipo_critica.id_tipo_critica;


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 1767
-- Name: tipo_critica_id_tipo_critica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_critica_id_tipo_critica_seq', 1, false);


--
-- TOC entry 1768 (class 1259 OID 16665)
-- Dependencies: 6
-- Name: tipo_envio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_envio (
    id_tipo_envio integer NOT NULL,
    nombre_tipo_envio character varying(15) NOT NULL,
    definicion_tipo_envio character varying(150) NOT NULL,
    vista_tipo_envio character varying(100)
);


ALTER TABLE public.tipo_envio OWNER TO postgres;

--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 1768
-- Name: TABLE tipo_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_envio IS 'Tabla que contendrá los diferentes tipos de envío que el sistema puede manejar.';


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 1768
-- Name: COLUMN tipo_envio.id_tipo_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_envio.id_tipo_envio IS 'Campo de tipo serial que define el identificador de los registros de la tabla tipo_envio.';


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 1768
-- Name: COLUMN tipo_envio.nombre_tipo_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_envio.nombre_tipo_envio IS 'Campo de tipo texto que define el nombre de los tipos de envío.';


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 1768
-- Name: COLUMN tipo_envio.definicion_tipo_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_envio.definicion_tipo_envio IS 'Campo de tipo texto que define a detalle los tipos de envío.';


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 1768
-- Name: COLUMN tipo_envio.vista_tipo_envio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_envio.vista_tipo_envio IS 'Campo de tipo texto que define el nombre de la vista *.xhtml que se utilizará para enviar el correo.';


--
-- TOC entry 1769 (class 1259 OID 16668)
-- Dependencies: 6 1768
-- Name: tipo_envio_id_tipo_envio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_envio_id_tipo_envio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_envio_id_tipo_envio_seq OWNER TO postgres;

--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 1769
-- Name: tipo_envio_id_tipo_envio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_envio_id_tipo_envio_seq OWNED BY tipo_envio.id_tipo_envio;


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 1769
-- Name: tipo_envio_id_tipo_envio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_envio_id_tipo_envio_seq', 1, true);


--
-- TOC entry 1770 (class 1259 OID 16670)
-- Dependencies: 6
-- Name: tipo_idea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_idea (
    id_tipo_idea integer NOT NULL,
    nombre_tipo_idea character varying(15) NOT NULL,
    descripcion_tipo_idea character varying(150) NOT NULL
);


ALTER TABLE public.tipo_idea OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 1770
-- Name: TABLE tipo_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_idea IS 'Esta tabla representa los tipos de ideas a los que una idea puede pertenecer.';


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 1770
-- Name: COLUMN tipo_idea.id_tipo_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_idea.id_tipo_idea IS 'Campode tipo entero que representa el identificador de las filas de la tabla tipo_idea.';


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 1770
-- Name: COLUMN tipo_idea.nombre_tipo_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_idea.nombre_tipo_idea IS 'Campo de tipo texto que define el nombre de el tipo de una idea.';


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 1770
-- Name: COLUMN tipo_idea.descripcion_tipo_idea; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_idea.descripcion_tipo_idea IS 'Campo de tipo texto que define la descripción de un tipo de idea.';


--
-- TOC entry 1771 (class 1259 OID 16673)
-- Dependencies: 6 1770
-- Name: tipo_idea_id_tipo_idea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_idea_id_tipo_idea_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_idea_id_tipo_idea_seq OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 1771
-- Name: tipo_idea_id_tipo_idea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_idea_id_tipo_idea_seq OWNED BY tipo_idea.id_tipo_idea;


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 1771
-- Name: tipo_idea_id_tipo_idea_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_idea_id_tipo_idea_seq', 1, false);


--
-- TOC entry 1772 (class 1259 OID 16675)
-- Dependencies: 6
-- Name: tipo_lugar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_lugar (
    id_tipo_lugar integer NOT NULL,
    nombre_tipo_lugar character varying(50) NOT NULL,
    descripcion_tipo_lugar character varying(150) NOT NULL
);


ALTER TABLE public.tipo_lugar OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 1772
-- Name: TABLE tipo_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_lugar IS 'Tabla que contiene los tipos de lugares disponibles para ser ocupados por las ideas.';


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 1772
-- Name: COLUMN tipo_lugar.id_tipo_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_lugar.id_tipo_lugar IS 'Campo de tipo entero que identifica los registros en la tabla tipo_lugar.';


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 1772
-- Name: COLUMN tipo_lugar.nombre_tipo_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_lugar.nombre_tipo_lugar IS 'Campo de tipo texto que define el nombre de los registros de la tabla tipo_lugar.';


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 1772
-- Name: COLUMN tipo_lugar.descripcion_tipo_lugar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_lugar.descripcion_tipo_lugar IS 'Campo de tipo texto que define a detalle un tipo_lugar.';


--
-- TOC entry 1773 (class 1259 OID 16678)
-- Dependencies: 6 1772
-- Name: tipo_lugar_id_tipo_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_lugar_id_tipo_lugar_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_lugar_id_tipo_lugar_seq OWNER TO postgres;

--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 1773
-- Name: tipo_lugar_id_tipo_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_lugar_id_tipo_lugar_seq OWNED BY tipo_lugar.id_tipo_lugar;


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 1773
-- Name: tipo_lugar_id_tipo_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_lugar_id_tipo_lugar_seq', 1, false);


--
-- TOC entry 1774 (class 1259 OID 16680)
-- Dependencies: 6
-- Name: tipo_reporte_abuso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_reporte_abuso (
    id_tipo_reporte_abuso integer NOT NULL,
    nombre_tipo_reporte_abuso character varying(15) NOT NULL,
    definicion_tipo_reporte_abuso character varying(150) NOT NULL
);


ALTER TABLE public.tipo_reporte_abuso OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 1774
-- Name: TABLE tipo_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_reporte_abuso IS 'Tabla que contendrá los tipos de reporte que podrá hacer el usuario en caso de detectar información no adecuada dentro del sistema.';


--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 1774
-- Name: COLUMN tipo_reporte_abuso.id_tipo_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_reporte_abuso.id_tipo_reporte_abuso IS 'Campo de tipo entero que define el identificador de las filas en la tabla tipo_reporte_abuso.';


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 1774
-- Name: COLUMN tipo_reporte_abuso.nombre_tipo_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_reporte_abuso.nombre_tipo_reporte_abuso IS 'Campo de tipo texto que define el nombre de un tipo_reporte_abuso.';


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 1774
-- Name: COLUMN tipo_reporte_abuso.definicion_tipo_reporte_abuso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_reporte_abuso.definicion_tipo_reporte_abuso IS 'Campo de tipo texto que explica el significado de un nombre de un tipo_reporte_abuso.';


--
-- TOC entry 1775 (class 1259 OID 16683)
-- Dependencies: 6 1774
-- Name: tipo_reporte_abuso_id_tipo_reporte_abuso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_reporte_abuso_id_tipo_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_reporte_abuso_id_tipo_reporte_abuso_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 1775
-- Name: tipo_reporte_abuso_id_tipo_reporte_abuso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_reporte_abuso_id_tipo_reporte_abuso_seq OWNED BY tipo_reporte_abuso.id_tipo_reporte_abuso;


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 1775
-- Name: tipo_reporte_abuso_id_tipo_reporte_abuso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_reporte_abuso_id_tipo_reporte_abuso_seq', 1, false);


--
-- TOC entry 1776 (class 1259 OID 16685)
-- Dependencies: 6
-- Name: tipo_ticket_registro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_ticket_registro (
    id_tipo_ticket_registro integer NOT NULL,
    nombre_tipo_ticket_registro character varying(15) NOT NULL,
    descripcion_tipo_ticket_registro character varying(150) NOT NULL
);


ALTER TABLE public.tipo_ticket_registro OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 1776
-- Name: TABLE tipo_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_ticket_registro IS 'Tabla que contendrá los registros que describen los diferentes estatus que puede tomar un ticket de registro.';


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 1776
-- Name: COLUMN tipo_ticket_registro.id_tipo_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_ticket_registro.id_tipo_ticket_registro IS 'Campo de tipo entero que identifica a los registros de la tabla tipo_ticket_registro';


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 1776
-- Name: COLUMN tipo_ticket_registro.nombre_tipo_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_ticket_registro.nombre_tipo_ticket_registro IS 'Campo de tipo texto que da nombre a un tipo_ticket_registro';


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 1776
-- Name: COLUMN tipo_ticket_registro.descripcion_tipo_ticket_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_ticket_registro.descripcion_tipo_ticket_registro IS 'Campo de tipo texto que describe a detalle un tipo_ticket_registro';


--
-- TOC entry 1777 (class 1259 OID 16688)
-- Dependencies: 1776 6
-- Name: tipo_ticket_registro_id_tipo_ticket_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_ticket_registro_id_tipo_ticket_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_ticket_registro_id_tipo_ticket_registro_seq OWNER TO postgres;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 1777
-- Name: tipo_ticket_registro_id_tipo_ticket_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_ticket_registro_id_tipo_ticket_registro_seq OWNED BY tipo_ticket_registro.id_tipo_ticket_registro;


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 1777
-- Name: tipo_ticket_registro_id_tipo_ticket_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_ticket_registro_id_tipo_ticket_registro_seq', 1, false);


--
-- TOC entry 1778 (class 1259 OID 16690)
-- Dependencies: 6
-- Name: tipo_visita; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_visita (
    id_tipo_visita integer NOT NULL,
    nombre_tipo_visita character varying(15) NOT NULL,
    descripcion_tipo_visita character varying(150) NOT NULL
);


ALTER TABLE public.tipo_visita OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 1778
-- Name: TABLE tipo_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_visita IS 'Tabla que contendrá los tipos de visitas manejados por linkUam.';


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 1778
-- Name: COLUMN tipo_visita.id_tipo_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_visita.id_tipo_visita IS 'Campo de tipo entero que identifica a los registros de la tabla tipo_visita.';


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 1778
-- Name: COLUMN tipo_visita.nombre_tipo_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_visita.nombre_tipo_visita IS 'Campo de tipo texto que da nombre a los registros de la tabla tipo_visita.';


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 1778
-- Name: COLUMN tipo_visita.descripcion_tipo_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_visita.descripcion_tipo_visita IS 'Campo de tipo texto que describe a detalle los registros de la tabla tipo_visita.';


--
-- TOC entry 1779 (class 1259 OID 16693)
-- Dependencies: 6 1778
-- Name: tipo_visita_id_tipo_visita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_visita_id_tipo_visita_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_visita_id_tipo_visita_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 1779
-- Name: tipo_visita_id_tipo_visita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_visita_id_tipo_visita_seq OWNED BY tipo_visita.id_tipo_visita;


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 1779
-- Name: tipo_visita_id_tipo_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_visita_id_tipo_visita_seq', 1, false);


--
-- TOC entry 1784 (class 1259 OID 17707)
-- Dependencies: 6
-- Name: tipo_vista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_vista (
    nombre_tipo_vista character varying(15) NOT NULL,
    descripcion_tipo_vista character varying(150) NOT NULL,
    id_tipo_vista integer NOT NULL
);


ALTER TABLE public.tipo_vista OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 1784
-- Name: TABLE tipo_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_vista IS 'Tabla que contiene los tipos de vista existentes en el sistema.';


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 1784
-- Name: COLUMN tipo_vista.nombre_tipo_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_vista.nombre_tipo_vista IS 'Campo de tipo texto que da nombre a un tipo de vista.';


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 1784
-- Name: COLUMN tipo_vista.descripcion_tipo_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_vista.descripcion_tipo_vista IS 'Campo de tipo texto que describe un tipo de vista.';


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 1784
-- Name: COLUMN tipo_vista.id_tipo_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN tipo_vista.id_tipo_vista IS 'Campo que identifica los tipos de vista presentes en el sistema.';


--
-- TOC entry 1787 (class 1259 OID 17726)
-- Dependencies: 6 1784
-- Name: tipo_vista_id_tipo_vista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_vista_id_tipo_vista_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_vista_id_tipo_vista_seq OWNER TO postgres;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 1787
-- Name: tipo_vista_id_tipo_vista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_vista_id_tipo_vista_seq OWNED BY tipo_vista.id_tipo_vista;


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 1787
-- Name: tipo_vista_id_tipo_vista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_vista_id_tipo_vista_seq', 1, false);


--
-- TOC entry 1780 (class 1259 OID 16695)
-- Dependencies: 6
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(40) NOT NULL,
    fecha_ingreso_usuario date NOT NULL,
    institucion_id integer NOT NULL,
    fecha_fin_usuario date,
    apellido_paterno_usuario character varying(40) NOT NULL,
    apellido_materno_usuario character varying(40) NOT NULL,
    contrasena_usuario character varying(128) NOT NULL,
    calificacion_usuario double precision,
    estatus_usuario_id integer NOT NULL,
    nick_usuario character varying(20) NOT NULL,
    nombre_imagen_usuario character varying(100) NOT NULL,
    sexo_usuario character varying(1),
    fecha_nacimiento_usuario date,
    configuracion_usuario_id integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 1780
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE usuario IS 'Tabla que contendrá a los usuarios registrados en el sistema.';


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.id_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.id_usuario IS 'Campo de tipo texto que describe el identificador de las filas de la tabla Usuario.';


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.nombre_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.nombre_usuario IS 'Campo de tipo texto que describe el o los nombres del usuario.';


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.fecha_ingreso_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.fecha_ingreso_usuario IS 'Columna de tipo fecha que define la fecha de inscripción del usuario.';


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.institucion_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.institucion_id IS 'Campo de tipo entero que define la institución a la que pertenece el usuario.';


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.fecha_fin_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.fecha_fin_usuario IS 'Campo de tipo fecha que define la fecha en la que el usuario deja de ser miembro del sistema.';


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.apellido_paterno_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.apellido_paterno_usuario IS 'Campo que define el apellido paterno del usuario.';


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.apellido_materno_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.apellido_materno_usuario IS 'Campo que define el apellido materno del usuario.';


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.contrasena_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.contrasena_usuario IS 'Campo de tipo texto que almacena una cadena hasheada correspondiente al password del usuario.';


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.calificacion_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.calificacion_usuario IS 'Campo de tipo entero que define la calificación "global" de un usuario: promediando sus diferentes participaciones.';


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.estatus_usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.estatus_usuario_id IS 'Campo de tipo entero que define el estatus actual de un usuario.';


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.nick_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.nick_usuario IS 'Campo de tipo texto que define el nick de un usuario.';


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.nombre_imagen_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.nombre_imagen_usuario IS 'Campo de tipo texto que define el nombre de la imagen/foto/avatar de un usuario.';


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.sexo_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.sexo_usuario IS 'Campo de tipo texto con lenght=1 que define el sexo del usuario.';


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.fecha_nacimiento_usuario; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.fecha_nacimiento_usuario IS 'Campo de tipo date que define la fecha de nacimiento del usuario.';


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 1780
-- Name: COLUMN usuario.configuracion_usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usuario.configuracion_usuario_id IS 'Campo que define la configuración perteneciente al usuario.';


--
-- TOC entry 1781 (class 1259 OID 16698)
-- Dependencies: 1780 6
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 1781
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 1781
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, false);


--
-- TOC entry 1782 (class 1259 OID 16700)
-- Dependencies: 6
-- Name: visita; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visita (
    id_visita bigint NOT NULL,
    fecha_inicio_visita date NOT NULL,
    fecha_fin_visita date,
    direccion_ip_visita character varying(40) NOT NULL,
    coordenada_geografica_longitud_visita real,
    coordenada_geografica_latitud_visita real,
    usuario_id integer,
    tipo_visita_id integer NOT NULL,
    idea_id integer,
    sesionid character varying(100) NOT NULL,
    vista_id integer NOT NULL
);


ALTER TABLE public.visita OWNER TO postgres;

--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 1782
-- Name: TABLE visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE visita IS 'Tabla que contendrá los registros de las visitas al sitio.';


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.id_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.id_visita IS 'Campo de tipo entero que identifica a los registros de la tabla visita.';


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.fecha_inicio_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.fecha_inicio_visita IS 'Campo de tipo fecha que define cuando inicio la visita.';


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.fecha_fin_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.fecha_fin_visita IS 'Campo de tipo fecha que define cuando terminó la visita.';


--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.direccion_ip_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.direccion_ip_visita IS 'Campo de tipo texto que define la ip desde donde el usuario se está conectando.';


--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.coordenada_geografica_longitud_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.coordenada_geografica_longitud_visita IS 'Campo de tipo float/real que define la coordenada geográfica longitud desde la cual se está conectando el usuario.';


--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.coordenada_geografica_latitud_visita; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.coordenada_geografica_latitud_visita IS 'Campo de tipo float/real que define la coordenada latitud desde la cual se está conectando el usuario.';


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.usuario_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.usuario_id IS 'Campo de tipo entero que describe al usuario que realizó la visita.';


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.tipo_visita_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.tipo_visita_id IS 'Campo de tipo entero que define el tipo de visita.';


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.idea_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.idea_id IS 'Campo que describe una idea visitada.';


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.sesionid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.sesionid IS 'Campo que contiene el identificador de la sesión bajo la cual se está realizando la visita.';


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 1782
-- Name: COLUMN visita.vista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN visita.vista_id IS 'Campo que describe la página visitada por un usuario.';


--
-- TOC entry 1783 (class 1259 OID 16703)
-- Dependencies: 1782 6
-- Name: visita_id_visita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE visita_id_visita_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.visita_id_visita_seq OWNER TO postgres;

--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 1783
-- Name: visita_id_visita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE visita_id_visita_seq OWNED BY visita.id_visita;


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 1783
-- Name: visita_id_visita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('visita_id_visita_seq', 1, false);


--
-- TOC entry 1785 (class 1259 OID 17712)
-- Dependencies: 6
-- Name: vista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vista (
    descripcion_vista character varying(150) NOT NULL,
    nombre_vista character varying(200) NOT NULL,
    id_vista integer NOT NULL,
    tipo_vista_id integer NOT NULL
);


ALTER TABLE public.vista OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 1785
-- Name: TABLE vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE vista IS 'Tabla que contendrá la descripción de las vistas del sistema (.xhtml). Esto con el único objetivo de poder estadísticas de las visitas a una página en específico, así que no necesariamente estarán presentes todas las páginas del sistema.';


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 1785
-- Name: COLUMN vista.descripcion_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN vista.descripcion_vista IS 'Campo que describe a detalle una vista.';


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 1785
-- Name: COLUMN vista.nombre_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN vista.nombre_vista IS 'Campo que describe como se llama la vista y su extensión.';


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 1785
-- Name: COLUMN vista.id_vista; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN vista.id_vista IS 'Campo que identifica a los registros de la tabla vista.';


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 1785
-- Name: COLUMN vista.tipo_vista_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN vista.tipo_vista_id IS 'Campo que describe el tipo de vista al que pertenece.';


--
-- TOC entry 1786 (class 1259 OID 17720)
-- Dependencies: 6 1785
-- Name: vista_id_vista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vista_id_vista_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.vista_id_vista_seq OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 1786
-- Name: vista_id_vista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vista_id_vista_seq OWNED BY vista.id_vista;


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 1786
-- Name: vista_id_vista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vista_id_vista_seq', 8, true);


--
-- TOC entry 2067 (class 2604 OID 16705)
-- Dependencies: 1676 1675
-- Name: id_accion_reporte_abuso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE accion_reporte_abuso ALTER COLUMN id_accion_reporte_abuso SET DEFAULT nextval('accion_reporte_abuso_id_accion_reporte_abuso_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 16706)
-- Dependencies: 1678 1677
-- Name: id_aviso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE aviso ALTER COLUMN id_aviso SET DEFAULT nextval('aviso_id_aviso_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 16707)
-- Dependencies: 1680 1679
-- Name: id_bitacora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('bitacora_id_bitacora_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 16708)
-- Dependencies: 1682 1681
-- Name: id_canica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE canica ALTER COLUMN id_canica SET DEFAULT nextval('canica_id_canica_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 16709)
-- Dependencies: 1685 1684
-- Name: id_como_lograrlo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE como_lograrlo ALTER COLUMN id_como_lograrlo SET DEFAULT nextval('como_lograrlo_id_como_lograrlo_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 16710)
-- Dependencies: 1740 1686
-- Name: id_comunidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE comunidad ALTER COLUMN id_comunidad SET DEFAULT nextval('lista_comunidad_id_lista_comunidad_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 16711)
-- Dependencies: 1688 1687
-- Name: id_configuracion_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE configuracion_usuario ALTER COLUMN id_configuracion_usuario SET DEFAULT nextval('configuracion_usuario_id_configuracion_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 16712)
-- Dependencies: 1690 1689
-- Name: id_contacto_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contacto_usuario ALTER COLUMN id_contacto_usuario SET DEFAULT nextval('contacto_usuario_id_contacto_usuario_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 16713)
-- Dependencies: 1692 1691
-- Name: id_critica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE critica ALTER COLUMN id_critica SET DEFAULT nextval('critica_id_critica_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 16714)
-- Dependencies: 1694 1693
-- Name: id_envio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE envio ALTER COLUMN id_envio SET DEFAULT nextval('envio_id_envio_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 16715)
-- Dependencies: 1696 1695
-- Name: id_estatus_aviso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_aviso ALTER COLUMN id_estatus_aviso SET DEFAULT nextval('estatus_aviso_id_estatus_aviso_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 16716)
-- Dependencies: 1715 1697
-- Name: id_estatus_ayuda_monetaria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_ayuda_monetaria ALTER COLUMN id_estatus_ayuda_monetaria SET DEFAULT nextval('estatus_monetario_id_estatus_monetario_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 16717)
-- Dependencies: 1720 1698
-- Name: id_estatus_ayuda_recursos_humanos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_ayuda_recursos_humanos ALTER COLUMN id_estatus_ayuda_recursos_humanos SET DEFAULT nextval('estatus_recursos_humanos_id_estatus_recursos_humanos_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 16718)
-- Dependencies: 1700 1699
-- Name: id_estatus_bitacora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_bitacora ALTER COLUMN id_estatus_bitacora SET DEFAULT nextval('estatus_bitacora_id_estatus_bitacora_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 16719)
-- Dependencies: 1702 1701
-- Name: id_estatus_comunidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_comunidad ALTER COLUMN id_estatus_comunidad SET DEFAULT nextval('estatus_comunidad_id_estatus_comunidad_seq'::regclass);


--
-- TOC entry 2082 (class 2604 OID 16720)
-- Dependencies: 1704 1703
-- Name: id_estatus_critica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_critica ALTER COLUMN id_estatus_critica SET DEFAULT nextval('estatus_critica_id_estatus_critica_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 16721)
-- Dependencies: 1706 1705
-- Name: id_estatus_envio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_envio ALTER COLUMN id_estatus_envio SET DEFAULT nextval('estatus_envio_id_estatus_envio_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 16722)
-- Dependencies: 1708 1707
-- Name: id_estatus_idea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_idea ALTER COLUMN id_estatus_idea SET DEFAULT nextval('estatus_idea_id_estatus_idea_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 16723)
-- Dependencies: 1710 1709
-- Name: id_estatus_integrante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_integrante ALTER COLUMN id_estatus_integrante SET DEFAULT nextval('estatus_integrante_id_estatus_integrante_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 16724)
-- Dependencies: 1712 1711
-- Name: id_estatus_invitacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_invitacion ALTER COLUMN id_estatus_invitacion SET DEFAULT nextval('estatus_invitacion_id_estatus_invitacion_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 16725)
-- Dependencies: 1714 1713
-- Name: id_estatus_miembro_comunidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_miembro_comunidad ALTER COLUMN id_estatus_miembro_comunidad SET DEFAULT nextval('estatus_miembro_id_estatus_miembro_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 16726)
-- Dependencies: 1717 1716
-- Name: id_estatus_necesidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_necesidad ALTER COLUMN id_estatus_necesidad SET DEFAULT nextval('estatus_necesidad_id_estatus_necesidad_seq'::regclass);


--
-- TOC entry 2089 (class 2604 OID 16727)
-- Dependencies: 1719 1718
-- Name: id_estatus_pregunta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_pregunta ALTER COLUMN id_estatus_pregunta SET DEFAULT nextval('estatus_pregunta_id_estatus_pregunta_seq'::regclass);


--
-- TOC entry 2090 (class 2604 OID 16728)
-- Dependencies: 1722 1721
-- Name: id_estatus_reporte_abuso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_reporte_abuso ALTER COLUMN id_estatus_reporte_abuso SET DEFAULT nextval('estatus_reporte_abuso_id_estatus_reporte_abuso_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 16729)
-- Dependencies: 1724 1723
-- Name: id_estatus_seguidor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_seguidor ALTER COLUMN id_estatus_seguidor SET DEFAULT nextval('estatus_seguidor_id_estatus_seguidor_seq'::regclass);


--
-- TOC entry 2092 (class 2604 OID 16730)
-- Dependencies: 1726 1725
-- Name: id_estatus_ticket_registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_ticket_registro ALTER COLUMN id_estatus_ticket_registro SET DEFAULT nextval('estatus_ticket_registro_id_estatus_ticket_registro_seq'::regclass);


--
-- TOC entry 2093 (class 2604 OID 16731)
-- Dependencies: 1728 1727
-- Name: id_estatus_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus_usuario ALTER COLUMN id_estatus_usuario SET DEFAULT nextval('estatus_usuario_id_estatus_usuario_seq'::regclass);


--
-- TOC entry 2121 (class 2604 OID 18177)
-- Dependencies: 1789 1788
-- Name: id_frase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE frase ALTER COLUMN id_frase SET DEFAULT nextval('frase_id_frase_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 16732)
-- Dependencies: 1731 1730
-- Name: id_idea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE idea ALTER COLUMN id_idea SET DEFAULT nextval('idea_id_idea_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 16733)
-- Dependencies: 1733 1732
-- Name: id_imagen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE imagen ALTER COLUMN id_imagen SET DEFAULT nextval('imagen_id_imagen_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 16734)
-- Dependencies: 1735 1734
-- Name: id_institucion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE institucion ALTER COLUMN id_institucion SET DEFAULT nextval('institucion_id_institucion_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 16735)
-- Dependencies: 1739 1738
-- Name: id_justificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE justificacion ALTER COLUMN id_justificacion SET DEFAULT nextval('justificacion_id_justificacion_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 16736)
-- Dependencies: 1742 1741
-- Name: id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lugar ALTER COLUMN id_lugar SET DEFAULT nextval('lugar_id_lugar_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 16737)
-- Dependencies: 1745 1744
-- Name: id_necesidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE necesidad ALTER COLUMN id_necesidad SET DEFAULT nextval('necesidad_id_necesidad_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 16738)
-- Dependencies: 1747 1746
-- Name: id_objetivo_especifico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE objetivo_especifico ALTER COLUMN id_objetivo_especifico SET DEFAULT nextval('objetivo_especifico_id_objetivo_especifico_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 16739)
-- Dependencies: 1749 1748
-- Name: id_objetivo_general; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE objetivo_general ALTER COLUMN id_objetivo_general SET DEFAULT nextval('objetivo_general_id_objetivo_general_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 16740)
-- Dependencies: 1752 1751
-- Name: id_pregunta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pregunta ALTER COLUMN id_pregunta SET DEFAULT nextval('pregunta_id_pregunta_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 16741)
-- Dependencies: 1754 1753
-- Name: id_reporte_abuso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE reporte_abuso ALTER COLUMN id_reporte_abuso SET DEFAULT nextval('reporte_abuso_id_reporte_abuso_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 16742)
-- Dependencies: 1756 1755
-- Name: id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rol ALTER COLUMN id_rol SET DEFAULT nextval('rol_id_rol_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 16743)
-- Dependencies: 1759 1758
-- Name: id_ticket_registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ticket_registro ALTER COLUMN id_ticket_registro SET DEFAULT nextval('ticket_registro_id_ticket_registro_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 16744)
-- Dependencies: 1761 1760
-- Name: id_tipo_aviso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_aviso ALTER COLUMN id_tipo_aviso SET DEFAULT nextval('tipo_aviso_id_tipo_aviso_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 16745)
-- Dependencies: 1763 1762
-- Name: id_tipo_bitacora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_bitacora ALTER COLUMN id_tipo_bitacora SET DEFAULT nextval('tipo_bitacora_id_tipo_bitacora_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 16746)
-- Dependencies: 1765 1764
-- Name: id_tipo_contacto_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_contacto_usuario ALTER COLUMN id_tipo_contacto_usuario SET DEFAULT nextval('tipo_contacto_usuario_id_tipo_contacto_usuario_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 16747)
-- Dependencies: 1767 1766
-- Name: id_tipo_critica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_critica ALTER COLUMN id_tipo_critica SET DEFAULT nextval('tipo_critica_id_tipo_critica_seq'::regclass);


--
-- TOC entry 2111 (class 2604 OID 16748)
-- Dependencies: 1769 1768
-- Name: id_tipo_envio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_envio ALTER COLUMN id_tipo_envio SET DEFAULT nextval('tipo_envio_id_tipo_envio_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 16749)
-- Dependencies: 1771 1770
-- Name: id_tipo_idea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_idea ALTER COLUMN id_tipo_idea SET DEFAULT nextval('tipo_idea_id_tipo_idea_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 16750)
-- Dependencies: 1773 1772
-- Name: id_tipo_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_lugar ALTER COLUMN id_tipo_lugar SET DEFAULT nextval('tipo_lugar_id_tipo_lugar_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 16751)
-- Dependencies: 1775 1774
-- Name: id_tipo_reporte_abuso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_reporte_abuso ALTER COLUMN id_tipo_reporte_abuso SET DEFAULT nextval('tipo_reporte_abuso_id_tipo_reporte_abuso_seq'::regclass);


--
-- TOC entry 2115 (class 2604 OID 16752)
-- Dependencies: 1777 1776
-- Name: id_tipo_ticket_registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_ticket_registro ALTER COLUMN id_tipo_ticket_registro SET DEFAULT nextval('tipo_ticket_registro_id_tipo_ticket_registro_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 16753)
-- Dependencies: 1779 1778
-- Name: id_tipo_visita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_visita ALTER COLUMN id_tipo_visita SET DEFAULT nextval('tipo_visita_id_tipo_visita_seq'::regclass);


--
-- TOC entry 2119 (class 2604 OID 17728)
-- Dependencies: 1787 1784
-- Name: id_tipo_vista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_vista ALTER COLUMN id_tipo_vista SET DEFAULT nextval('tipo_vista_id_tipo_vista_seq'::regclass);


--
-- TOC entry 2117 (class 2604 OID 16754)
-- Dependencies: 1781 1780
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2118 (class 2604 OID 16755)
-- Dependencies: 1783 1782
-- Name: id_visita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE visita ALTER COLUMN id_visita SET DEFAULT nextval('visita_id_visita_seq'::regclass);


--
-- TOC entry 2120 (class 2604 OID 17722)
-- Dependencies: 1786 1785
-- Name: id_vista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE vista ALTER COLUMN id_vista SET DEFAULT nextval('vista_id_vista_seq'::regclass);


--
-- TOC entry 2418 (class 0 OID 16393)
-- Dependencies: 1675
-- Data for Name: accion_reporte_abuso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accion_reporte_abuso (id_accion_reporte_abuso, nombre_accion_reporte_abuso, descripcion_accion_reporte_abuso) FROM stdin;
0	SUSPENDER_USER	Esta acción es tomada cuando el administrador decide suspender al usuario.
1	SUSPENDER_IDEA	Esta acción es tomada cuando el administrador decide suspender la idea.
2	DESECHAR_REPORT	Esta acción es tomada cuando el administrador decide no darle importancia al reporte.
\.


--
-- TOC entry 2419 (class 0 OID 16398)
-- Dependencies: 1677
-- Data for Name: aviso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aviso (id_aviso, texto_aviso, fecha_creacion_aviso, tipo_aviso_id, estatus_aviso_id, idea_id, usuario_id, pregunta_id, bitacora_id, canica_id, reporte_abuso_id, ticket_registro_id, envio_id) FROM stdin;
7590	El usuario jorgwel solicitó una renovación de contraseña.	2011-06-21	6	0	\N	0	\N	\N	\N	\N	\N	\N
7610	El usuario jorgwel solicitó una renovación de contraseña.	2011-06-21	6	0	\N	0	\N	\N	\N	\N	\N	\N
7640	El usuario jorgwel solicitó una renovación de contraseña.	2011-06-21	6	0	\N	0	\N	\N	\N	\N	\N	\N
7670	El usuario suruck solicitó una renovación de contraseña.	2011-06-21	6	0	\N	2	\N	\N	\N	\N	\N	\N
7700	El usuario lizbeth solicitó una renovación de contraseña.	2011-06-21	6	0	\N	6240	\N	\N	\N	\N	\N	\N
7701	El usuario lizbeth solicitó una renovación de contraseña.	2011-06-21	6	0	\N	6240	\N	\N	\N	\N	\N	\N
7730	El usuario lizbeth solicitó una renovación de contraseña.	2011-06-21	6	0	\N	6240	\N	\N	\N	\N	\N	\N
7760	El usuario lizbeth solicitó una renovación de contraseña.	2011-06-21	6	0	\N	6240	\N	\N	\N	\N	\N	\N
7790	El usuario suruck solicitó una renovación de contraseña.	2011-06-21	6	0	\N	2	\N	\N	\N	\N	\N	\N
8000	El usuario lizbeth solicitó una renovación de contraseña.	2011-06-23	6	0	\N	6240	\N	\N	\N	\N	\N	\N
8090	Y porque no?	2011-06-24	11	0	\N	0	\N	\N	\N	\N	\N	\N
8110	No se permiten recopilaciones en link UAM. Lo siento.	2011-06-24	11	0	\N	0	\N	\N	\N	\N	\N	\N
8111	Jajajajaaj!!!! :P ... Vaticano...	2011-06-24	11	0	\N	0	\N	\N	\N	\N	\N	\N
8130	Lo que pasa es que el desorden no le gusta a nadie :)	2011-06-29	11	0	6771	5670	\N	\N	\N	\N	\N	\N
8220	Por que lalo no querrá hacerlo con esa descripción que ustedes manejan.	2011-07-01	11	0	1410	0	\N	\N	\N	\N	\N	\N
8330	El usuario martin solicitó una renovación de contraseña.	2011-07-03	6	0	\N	8300	\N	\N	\N	\N	\N	\N
8360	El usuario martin solicitó una renovación de contraseña.	2011-07-03	6	0	\N	8300	\N	\N	\N	\N	\N	\N
8460	El usuario rick solicitó una renovación de contraseña.	2011-07-03	6	0	\N	8430	\N	\N	\N	\N	\N	\N
8780	El usuario suruck solicitó una renovación de contraseña.	2011-07-12	6	0	\N	2	\N	\N	\N	\N	\N	\N
8880	Porque sí.	2011-07-12	11	0	8840	5670	\N	\N	\N	\N	\N	\N
8881	Prototipos, prototipos...solo la rechazo de prueba, pero la apruebo de corazón!!	2011-07-12	11	0	8841	5670	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2420 (class 0 OID 16403)
-- Dependencies: 1679
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bitacora (id_bitacora, usuario_id, idea_id, titulo_bitacora, descripcion_bitacora, tipo_bitacora_id, fecha_bitacora, estatus_bitacora_id) FROM stdin;
790	0	710	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-14	1
950	0	880	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-16	1
1051	0	991	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-18	1
1190	0	1150	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-25	1
1250	0	1210	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-25	1
1330	0	1290	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-27	1
1331	0	1291	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-27	1
1390	0	1350	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-27	1
1450	0	1410	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-28	1
1580	0	1540	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-28	1
1650	0	1610	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-28	1
1730	0	1690	Nueva idea creada el:Tue May 03 19:17:47 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-03	1
1780	0	1750	Nueva idea creada el:Tue May 03 20:08:21 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-03	1
1850	0	1820	Nueva idea creada el:Tue May 03 20:22:30 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-03	1
0	0	3	Nuevo miembro aceptado.	Esta idea cuenta con un nuevo elemento, se trata de Jorge Bautista. Nos ayudará a terminar el sistema de emprendimiento que ha quedado varado desde la llegada de Brambila.	0	2011-01-22	1
1	1	2	Los objetivos específicos han cambiado.	Ahora ya no trataremos de conquistar el mundo, solo necesitamos la ciudad de china y US.	0	2011-01-22	1
2	3	6	Cambio de fase.	Felizmente anunciamos que ahora nos encontramos en fase de ejecución!!, gracias a la comunidad por su apoyo.	0	2011-01-22	1
3	5	1	Apoyo económico recibido.	El usuario jorgwel ha donado la asombrosa cantidad de 2 pesos con 10 centavos.	0	2011-01-22	1
5	2	8	Miembro deja el proyecto.	El miembro inicial deja el proyecto. En hora buena jorwel. :P 	0	2011-01-22	1
1920	0	1890	Nueva idea creada el:Tue May 03 22:24:05 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-03	1
1990	0	1960	Nueva idea creada el:Wed May 04 00:40:57 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-04	1
7	0	0	Abrete abismo humano.	Para ver si no habrá muchos peces humanos que tengan que tirar de ese cebo.	0	2033-02-02	1
8	2	0	Hazte quien eres!!!	Así pues que los hombres suban ahora a mi lado.	0	2001-02-02	1
12	5	4	Ríete aquí ríete!!	Atrae con tu centelleo a los más hermosos peces humanos!!	0	2222-05-05	1
14	1	5	Os aconsejo yo el amor al prójimo??	Antes os aconsejo la huída de lo próximo!!	0	2333-04-04	1
17	4	7	Yo no hablo del prójimo sino del amigo.	Yo hos hablo del amigo y de su corazón exhuberante.	0	4321-02-02	1
16	3	7	No solo miente el que habla contra su consciencia.	Sino también el que habla contra su inconsciencia.	0	1234-02-02	1
6	1	8	Cambio de justificación.	Solo quité algunas malas palabras.	0	2011-01-22	1
380	0	330	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-10	1
480	0	400	¡Mi primer idea creada en forma!	En verdad tengo fe en que este sistema ayudará a unir lazos entre alumnos y universidades.	0	2011-04-10	1
2100	0	2080	Nueva idea creada el:Thu May 05 10:00:50 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2101	0	2081	Nueva idea creada el:Thu May 05 10:03:03 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2170	0	2140	Nueva idea creada el:Thu May 05 10:07:15 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2240	0	2210	Nueva idea creada el:Thu May 05 10:14:07 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2241	0	2211	Nueva idea creada el:Thu May 05 10:18:57 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2310	0	2280	Nueva idea creada el:Thu May 05 10:54:54 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2380	0	2350	Nueva idea creada el:Thu May 05 11:10:52 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2381	0	2351	Nueva idea creada el:Thu May 05 11:14:50 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2382	0	2352	Nueva idea creada el:Thu May 05 11:17:08 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2383	0	2353	Nueva idea creada el:Thu May 05 11:23:53 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2384	0	2354	Nueva idea creada el:Thu May 05 11:25:16 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
10	4	2	No es que amí me irritensemejantes coléricos.	Tan sólo me hacen reír.	0	2013-07-07	1
4	6	6	Cambio de fase.	Les comunicamos que nos encontramos en fase de evaluación, en verdad agradeceriamos sus críticas.	0	2011-01-22	1
11	4	3	¿Quién habrá de venir un día y no de pasada?	Nuestro gran azhar.	0	2111-06-06	1
2470	0	2440	Nueva idea creada el:Thu May 05 11:35:06 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2471	0	2441	Nueva idea creada el:Thu May 05 11:35:56 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2472	0	2442	Nueva idea creada el:Thu May 05 11:38:38 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2473	0	2443	Nueva idea creada el:Thu May 05 11:40:35 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2474	0	2444	Nueva idea creada el:Thu May 05 11:43:05 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2475	0	2445	Nueva idea creada el:Thu May 05 11:47:29 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2476	0	2446	Nueva idea creada el:Thu May 05 12:03:21 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2560	0	2530	Nueva idea creada el:Thu May 05 12:59:40 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2630	0	2600	Nueva idea creada el:Thu May 05 13:02:25 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2631	0	2601	Nueva idea creada el:Thu May 05 13:02:56 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2632	0	2602	Nueva idea creada el:Thu May 05 14:33:47 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
5560	5520	5540	Nueva idea creada el:Mon May 30 20:40:04 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-30	1
5621	5520	5601	Nueva idea creada el:Mon May 30 21:09:04 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-30	1
2840	0	2810	Nueva idea creada el:Thu May 05 16:53:27 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
2841	0	2811	Nueva idea creada el:Thu May 05 16:56:05 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
5830	5670	5810	Nueva idea creada el:Tue May 31 10:18:14 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-31	1
6170	1	4042	Bitácora actualizada en: Tue May 31 14:03:05 CDT 2011	Jajajaja!!! Seeeee	0	2011-05-31	1
3050	0	3020	Nueva idea creada el:Thu May 05 17:44:57 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
6360	0	5600	Bitácora actualizada en: Thu Jun 02 13:22:49 CDT 2011	uououoouo	0	2011-06-02	1
3970	0	3940	Nueva idea creada el:Wed May 11 01:18:27 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-11	1
4070	2	4040	Nueva idea creada el:Mon May 16 22:06:29 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-16	1
3260	0	3230	Nueva idea creada el:Thu May 05 20:37:27 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-05	1
3340	0	3310	Nueva idea creada el:Sat May 07 20:29:18 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-07	1
3410	0	3380	Nueva idea creada el:Sun May 08 16:22:36 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-08	1
3411	0	3381	Nueva idea creada el:Sun May 08 16:31:12 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-08	1
4071	2	4041	Nueva idea creada el:Mon May 16 22:10:51 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-16	1
4072	1	4042	Nueva idea creada el:Mon May 16 22:29:15 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-16	1
4450	0	4430	Nueva idea creada el:Tue May 17 20:37:52 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-17	1
4690	0	4430	Bitácora actualizada en:	Ya casi queda está "bitacorita". Al parecer se está haciendo del rogar.	0	2011-05-23	1
4710	0	4430	Bitácora actualizada en: Mon May 23 13:47:24 CDT 2011	El monto máximo de inversión es de 400mdd.	0	2011-05-23	1
4711	0	3940	Bitácora actualizada en: Mon May 23 13:51:54 CDT 2011	Ícono de Database Visualizer? xD	0	2011-05-23	1
4712	0	3381	Bitácora actualizada en: Mon May 23 13:52:32 CDT 2011	Rosa pastel como belanova? 	0	2011-05-23	1
4713	0	4430	Bitácora actualizada en: Mon May 23 14:04:08 CDT 2011	Vamos a darle la vuelta al mundo!!!\n\nDarle la vuelta al mundo!!!	0	2011-05-23	1
4714	0	4430	Bitácora actualizada en: Mon May 23 14:08:34 CDT 2011	Dame la mano y vamos a darle la vuelta al mundo!!! darle la vuelta al mundo\n!!! darle la vuelta al mundo!!!	0	2011-05-23	1
4715	0	4430	Bitácora actualizada en: Mon May 23 14:21:07 CDT 2011	Planear bien, en extremo los popups	0	2011-05-23	1
4716	0	4430	Bitácora actualizada en: Mon May 23 14:25:03 CDT 2011	Y es que tu sacas lo mejor de mí!!	0	2011-05-23	1
4717	0	3381	Bitácora actualizada en: Mon May 23 14:26:51 CDT 2011	Bonitos colores my man!!	0	2011-05-23	1
4718	0	4430	Bitácora actualizada en: Mon May 23 14:32:00 CDT 2011	En realidad crees que los botones deberían de ser naranjas??? No crees que es un color medio chillon??	0	2011-05-23	1
4719	0	3380	Bitácora actualizada en: Mon May 23 14:35:55 CDT 2011	Por mis polainas que si quedará!!	0	2011-05-23	1
4730	0	4430	Bitácora actualizada en: Mon May 23 14:41:26 CDT 2011	Me parece que ahora solo falta corregir la fuente!!	0	2011-05-23	1
4731	0	4430	Bitácora actualizada en: Mon May 23 14:42:09 CDT 2011	Y también corregir el contador de caracteres!!	0	2011-05-23	1
4732	0	4430	Bitácora actualizada en: Mon May 23 14:43:02 CDT 2011	Tal vez la falla sea el servidor de meta-datos que implementé.	0	2011-05-23	1
4733	0	4430	Bitácora actualizada en: Mon May 23 14:44:10 CDT 2011	Me parece que el botón ha quedado centrado!! xD	0	2011-05-23	1
4790	0	4770	Nueva idea creada el:Mon May 23 15:40:32 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-23	1
4791	0	4770	Bitácora actualizada en: Mon May 23 15:44:25 CDT 2011	Hemos conseguido un buen auto, pero no circula los martes. ¿Alguien con auto que escuche?	0	2011-05-23	1
4792	0	4770	Bitácora actualizada en: Mon May 23 15:51:36 CDT 2011	400 caracteres máximo	0	2011-05-23	1
4830	0	4770	Bitácora actualizada en: Mon May 23 17:14:43 CDT 2011	De nuevo la idea activa. Realmente necesito gente que apoye!!	0	2011-05-23	1
6361	0	5600	Bitácora actualizada en: Thu Jun 02 13:22:51 CDT 2011	uououoouo	0	2011-06-02	1
4850	0	4770	Bitácora actualizada en: Mon May 23 21:39:04 CDT 2011	Soy un libertino más-	0	2011-05-23	1
4930	0	4770	Bitácora actualizada en: Tue May 24 10:17:23 CDT 2011	Calle 13 ha sacado su último disco!!	0	2011-05-24	1
4980	0	4770	Bitácora actualizada en: Tue May 24 12:11:25 CDT 2011	Mostranso sistema	0	2011-05-24	1
5040	0	5010	Nueva idea creada el:Tue May 24 16:36:31 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-24	1
5041	0	4770	Bitácora actualizada en: Tue May 24 16:41:58 CDT 2011	Actualizando bitácora con la profesora.	0	2011-05-24	1
5620	0	5600	Nueva idea creada el:Mon May 30 21:07:44 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-30	1
5770	5730	5750	Nueva idea creada el:Tue May 31 00:40:45 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-31	1
6020	5970	6000	Nueva idea creada el:Tue May 31 13:18:35 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-31	1
6021	5970	6000	Bitácora actualizada en: Tue May 31 13:22:03 CDT 2011	Checar el id de usuario en la query	0	2011-05-31	1
6171	6190	6210	Nueva idea creada el:Tue May 31 14:17:35 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-31	1
6172	2	6211	Nueva idea creada el:Tue May 31 14:18:46 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-31	1
6173	2	6212	Nueva idea creada el:Tue May 31 14:20:20 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-05-31	1
6362	0	5600	Bitácora actualizada en: Thu Jun 02 13:23:24 CDT 2011	uououououo	0	2011-06-02	1
6363	0	5600	Bitácora actualizada en: Thu Jun 02 13:23:54 CDT 2011	eaeaeaea	0	2011-06-02	1
15	2	5	Pero le tienes miedo.	No os soportais a vosotros mismos y no os quereis bastante.	0	6666-03-03	1
13	6	4	Lejos! Lejos anzuelo mío!!	Escurre tu más dulce rocío!! ¿Cuántos mares alrededor de mí!?	0	3333-05-05	1
9	3	1	Ni paciente ni impaciente.	Sino más bien, como quien ha olvidado la paciencia, puesto que no padece ya.	0	2011-06-06	1
6600	2	6212	Bitácora actualizada en: Mon Jun 06 16:39:10 CDT 2011	Actualizando bitácora para que sea aprobada por el administrador.	0	2011-06-06	1
6630	5670	6610	Nueva idea creada el:Mon Jun 06 17:38:46 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-06	1
6631	2	6611	Nueva idea creada el:Mon Jun 06 17:39:42 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-06	1
6680	5670	6660	Nueva idea creada el:Mon Jun 06 18:29:35 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-06	1
6730	2	6710	Nueva idea creada el:Mon Jun 06 19:45:40 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-06	1
6790	0	6770	Nueva idea creada el:Tue Jun 07 18:00:59 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-07	1
6791	5670	6771	Nueva idea creada el:Tue Jun 07 18:01:48 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-07	1
6920	5670	6900	Nueva idea creada el:Thu Jun 09 01:25:00 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-09	1
6921	0	6901	Nueva idea creada el:Thu Jun 09 01:26:16 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-09	1
8571	0	6901	Bitácora actualizada en: Sun Jul 03 17:07:38 CDT 2011	Hemos conseguido las mariposas!!! :D	0	2011-07-03	1
6922	0	3380	Bitácora actualizada en: Thu Jun 09 01:31:59 CDT 2011	La suerte es mi oxígeno tus ojos son mi ventana.	0	2011-06-09	1
7040	0	6770	Bitácora actualizada en: Thu Jun 09 20:47:48 CDT 2011	Auuum!!	0	2011-06-09	1
7060	0	6770	Bitácora actualizada en: Thu Jun 09 22:26:15 CDT 2011	Nueva bitácora para probar.	0	2011-06-09	1
7061	0	6770	Bitácora actualizada en: Thu Jun 09 22:27:21 CDT 2011	Otra bitácora de ejemplo.	0	2011-06-09	3
7260	0	7240	Nueva idea creada el:Mon Jun 13 18:10:16 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-13	1
7330	0	7310	Nueva idea creada el:Mon Jun 13 18:41:47 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-13	1
7180	5670	6610	Bitácora actualizada en: Fri Jun 10 19:45:25 CDT 2011	Cómo te alejas de mi como compartes toda tu miel.	0	2011-06-10	1
7850	0	7830	Nueva idea creada el:Tue Jun 21 23:55:29 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-21	1
7890	0	7870	Nueva idea creada el:Thu Jun 23 00:21:31 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-06-23	1
8190	0	5600	Bitácora actualizada en: Fri Jul 01 16:02:10 CDT 2011	Bitácora de homero simpson actualizada.	0	2011-07-01	1
8210	0	7870	Bitácora actualizada en: Fri Jul 01 16:08:12 CDT 2011	Acauzilando bitácora de homero simpson.	0	2011-07-01	1
8260	0	8240	Nueva idea creada el:Sat Jul 02 08:30:08 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-02	1
8400	5670	8380	Nueva idea creada el:Sun Jul 03 14:12:13 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-03	1
8570	8430	8550	Nueva idea creada el:Sun Jul 03 17:00:36 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-03	1
8670	8430	8550	Bitácora actualizada en: Sun Jul 10 22:10:04 CDT 2011	Estamos probando la aprobación de bitácoras.	0	2011-07-10	1
8690	8430	8550	Bitácora actualizada en: Sun Jul 10 22:33:12 CDT 2011	Tell me where did you sleep last night!!	0	2011-07-10	1
8720	5670	8700	Nueva idea creada el:Sun Jul 10 22:53:19 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-10	1
8760	5670	8700	Bitácora actualizada en: Tue Jul 12 13:30:39 CDT 2011	Compré "The Best of MTV Unplugged" y ni una sola rola de nirvana!!! :O	0	2011-07-12	0
8761	5670	8700	Bitácora actualizada en: Tue Jul 12 13:38:22 CDT 2011	Mostrar dialogo de confirmación.	0	2011-07-12	0
8762	5670	8700	Bitácora actualizada en: Tue Jul 12 13:38:39 CDT 2011	Mostrar dialogo de confirmación.	0	2011-07-12	0
8763	5670	8700	Bitácora actualizada en: Tue Jul 12 13:39:44 CDT 2011	Muy buen unplugged (y)	0	2011-07-12	0
8820	2	8800	Nueva idea creada el:Tue Jul 12 15:20:29 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-12	1
8850	5670	8840	Nueva idea creada el:Tue Jul 12 15:44:09 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-12	1
8851	5670	8841	Nueva idea creada el:Tue Jul 12 15:53:38 CDT 2011	Esperamos tus comentarios críticas y preguntas. Gracias.	0	2011-07-12	1
\.


--
-- TOC entry 2421 (class 0 OID 16411)
-- Dependencies: 1681
-- Data for Name: canica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY canica (id_canica, necesidad_id, usuario_id, fecha_canica, texto_aportado_canica) FROM stdin;
0	363	0	2011-04-10	Con gusto me declaro líder de esta idea.
460	452	0	2011-04-10	Con gusto me declaro líder de esta idea.
980	930	0	2011-04-17	\N
1031	1022	0	2011-04-18	Con gusto me declaro líder de esta idea.
1032	1021	0	2011-04-18	\N
3330	3321	0	2011-05-07	Con gusto me declaro líder de esta idea.
3331	3320	0	2011-05-07	\N
3332	3240	0	2011-05-07	\N
3400	3391	0	2011-05-08	Con gusto me declaro líder de esta idea.
3401	3393	0	2011-05-08	Con gusto me declaro líder de esta idea.
3450	3390	0	2011-05-09	\N
4414	4441	2	2011-05-17	\N
4510	4050	0	2011-05-18	\N
4511	4441	0	2011-05-18	\N
4512	4056	0	2011-05-18	\N
4513	4058	0	2011-05-18	\N
3960	3952	0	2011-05-11	Con gusto me declaro líder de esta idea.
4030	3950	0	2011-05-16	\N
4060	4052	2	2011-05-16	Con gusto me declaro líder de esta idea.
4061	4057	2	2011-05-16	Con gusto me declaro líder de esta idea.
4062	4053	1	2011-05-16	\N
4063	4054	1	2011-05-16	\N
4064	4059	1	2011-05-16	Con gusto me declaro líder de esta idea.
4065	4058	1	2011-05-16	\N
4120	4058	2	2011-05-17	\N
4130	4051	3	2011-05-17	\N
4150	4053	0	2011-05-17	\N
4151	4054	0	2011-05-17	\N
1280	1220	0	2011-04-26	\N
1281	1221	0	2011-04-26	\N
1310	1303	0	2011-04-27	Con gusto me declaro líder de esta idea.
1311	1300	0	2011-04-27	\N
1312	1304	0	2011-04-27	Con gusto me declaro líder de esta idea.
1370	1361	0	2011-04-27	Con gusto me declaro líder de esta idea.
1371	1360	0	2011-04-27	\N
1430	1422	0	2011-04-28	Con gusto me declaro líder de esta idea.
1560	1553	0	2011-04-28	Con gusto me declaro líder de esta idea.
1561	1550	0	2011-04-28	\N
1630	1622	0	2011-04-28	Con gusto me declaro líder de esta idea.
1631	1620	0	2011-04-28	\N
4152	4055	0	2011-05-17	\N
4514	4440	2	2011-05-18	\N
4270	2614	0	2011-05-17	\N
4350	2614	1	2011-05-17	\N
4515	4442	2	2011-05-18	\N
4371	2615	1	2011-05-17	\N
4372	3390	1	2011-05-17	\N
4373	4059	2	2011-05-17	\N
652	450	0	2011-04-12	\N
681	451	0	2011-04-13	\N
686	361	0	2011-04-13	\N
700	360	0	2011-04-13	\N
4570	2615	0	2011-05-18	\N
4390	4051	2	2011-05-17	\N
4410	2822	2	2011-05-17	\N
4411	2610	0	2011-05-17	\N
4412	4443	0	2011-05-17	Con gusto me declaro líder de esta idea.
4413	4440	0	2011-05-17	\N
4620	1420	0	2011-05-21	\N
4740	3951	0	2011-05-23	\N
4741	4782	0	2011-05-23	Con gusto me declaro líder de esta idea.
4742	4781	1	2011-05-23	\N
4940	4780	0	2011-05-24	\N
850	760	0	2011-04-14	\N
860	761	0	2011-04-16	\N
861	934	0	2011-04-16	Con gusto me declaro líder de esta idea.
862	931	0	2011-04-16	\N
5030	5022	0	2011-05-24	Con gusto me declaro líder de esta idea.
5031	5020	0	2011-05-24	\N
5032	5021	1	2011-05-24	\N
5800	5760	5730	2011-05-31	\N
2070	1970	0	2011-05-05	\N
2071	2091	0	2011-05-05	Con gusto me declaro líder de esta idea.
2072	2094	0	2011-05-05	Con gusto me declaro líder de esta idea.
2160	2153	0	2011-05-05	Con gusto me declaro líder de esta idea.
2230	2222	0	2011-05-05	Con gusto me declaro líder de esta idea.
2231	2226	0	2011-05-05	Con gusto me declaro líder de esta idea.
2300	2292	0	2011-05-05	Con gusto me declaro líder de esta idea.
2370	2362	0	2011-05-05	Con gusto me declaro líder de esta idea.
2371	2364	0	2011-05-05	Con gusto me declaro líder de esta idea.
2372	2367	0	2011-05-05	Con gusto me declaro líder de esta idea.
2373	2420	0	2011-05-05	Con gusto me declaro líder de esta idea.
2374	2421	0	2011-05-05	Con gusto me declaro líder de esta idea.
2460	2451	0	2011-05-05	Con gusto me declaro líder de esta idea.
2461	2454	0	2011-05-05	Con gusto me declaro líder de esta idea.
2462	2456	0	2011-05-05	Con gusto me declaro líder de esta idea.
2463	2458	0	2011-05-05	Con gusto me declaro líder de esta idea.
2464	2510	0	2011-05-05	Con gusto me declaro líder de esta idea.
2465	2459	0	2011-05-05	\N
2466	2513	0	2011-05-05	Con gusto me declaro líder de esta idea.
2467	2515	0	2011-05-05	Con gusto me declaro líder de esta idea.
2550	2541	0	2011-05-05	Con gusto me declaro líder de esta idea.
2620	2611	0	2011-05-05	Con gusto me declaro líder de esta idea.
2621	2613	0	2011-05-05	Con gusto me declaro líder de esta idea.
2622	2616	0	2011-05-05	Con gusto me declaro líder de esta idea.
2623	1760	0	2011-05-05	\N
2624	1763	0	2011-05-05	\N
6110	6010	0	2011-05-31	\N
6111	6011	0	2011-05-31	\N
2830	2821	0	2011-05-05	Con gusto me declaro líder de esta idea.
2831	2823	0	2011-05-05	Con gusto me declaro líder de esta idea.
6140	6010	1	2011-05-31	\N
6141	6011	1	2011-05-31	\N
3040	3032	0	2011-05-05	Con gusto me declaro líder de esta idea.
3041	3030	0	2011-05-05	\N
6142	6010	5970	2011-05-31	\N
6400	5760	5670	2011-06-03	\N
3250	3241	0	2011-05-05	Con gusto me declaro líder de esta idea.
3300	3031	0	2011-05-06	\N
6970	6220	5670	2011-06-09	\N
7030	6780	0	2011-06-09	\N
7100	6224	0	2011-06-10	\N
7101	5611	0	2011-06-10	\N
7120	4781	0	2011-06-10	\N
7210	1830	0	2011-06-11	\N
7211	4442	0	2011-06-11	\N
7290	7250	0	2011-06-13	\N
7291	7251	0	2011-06-13	\N
7390	6720	7360	2011-06-13	\N
7391	6721	7360	2011-06-13	\N
7392	6722	7360	2011-06-13	\N
7450	6910	0	2011-06-15	\N
7451	6912	0	2011-06-15	\N
7452	6911	0	2011-06-15	\N
7470	5021	0	2011-06-16	\N
7920	7880	0	2011-06-23	\N
8540	7881	0	2011-07-03	\N
\.


--
-- TOC entry 2422 (class 0 OID 16416)
-- Dependencies: 1683
-- Data for Name: clasificacion_idea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clasificacion_idea (idea_id, tipo_idea_id) FROM stdin;
330	3
330	0
1210	3
1210	6
1290	3
1290	0
1350	8
1410	3
1410	4
1410	6
1540	0
1540	6
1610	3
1610	5
1750	0
1750	5
1750	7
1820	3
1820	0
1820	6
1890	1
1890	5
1960	1
1960	4
1960	5
1960	6
2080	0
2080	4
2081	0
2081	6
2140	4
2140	6
2210	4
2210	5
2211	0
2211	5
2280	0
2280	5
2350	4
2350	5
2350	6
2351	0
2351	6
2352	1
2352	0
2353	0
2353	5
2354	0
2354	4
2440	6
2440	7
2441	1
2441	5
2442	0
2442	6
2443	0
2443	5
2444	4
2444	6
2445	4
2445	5
2446	0
2446	5
2530	1
2530	6
2600	1
2600	0
2601	0
2601	5
2602	0
2602	6
2810	4
2810	5
2811	0
2811	4
3020	3
3020	4
3940	1
3940	5
4040	6
4041	1
3230	1
3230	5
3310	1
3310	0
3380	3
3380	4
3381	1
3381	4
4041	4
4042	0
4042	5
4430	3
4430	1
4430	5
4770	0
4770	5
5010	0
5540	1
5540	0
5600	1
5810	3
6000	3
6000	1
6210	3
6210	7
6211	3
6211	6
6212	3
6610	3
6610	1
6611	3
6611	1
6660	3
6660	1
6710	3
6710	1
6770	3
6770	1
6771	3
6771	1
6900	3
6900	1
6901	3
6901	1
7240	3
7240	1
7240	0
7310	3
7310	1
7830	3
7830	1
7870	3
7870	1
8240	0
8240	5
8380	1
8380	0
8550	3
8550	1
8700	3
8700	1
8800	5
8840	3
8840	1
8841	5
8841	6
\.


--
-- TOC entry 2423 (class 0 OID 16419)
-- Dependencies: 1684
-- Data for Name: como_lograrlo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY como_lograrlo (id_como_lograrlo, descripcion_como_lograrlo, fecha_como_lograrlo, idea_id) FROM stdin;
0	Se podría plantear una solución que involucre a alumnos, profesores y la escuela misma.	2011-01-01	0
1	Podemos vender hasta el último plato qu tengamos, dando el todo por el todo. También podríamos mandarle flores :)	2011-02-02	1
2	Promoviendo cursos gratuitos pagados por la universidad. Tal y como lo hacen los de escuelas de paga, solo que los de la UAM estamos más capacitados para aprovecharlos.	2011-03-03	2
3	Y lo manifestais con bellas palabras.	2011-03-03	3
4	Vuesto buen amor al prójimo es vuestro mal amor a vosotros mismos.	2012-01-01	4
5	Más alto aún que el amor al prójimo es el amor a lo más lejano.	2012-04-04	5
6	Ese fantasma que vuela alrededor de tí es más bello que tú.	2013-05-01	6
7	¿Por qué no le entregas tu piel y tus huesos?	2018-11-11	7
8	El trato con los hombres daña el caracter sobre todo cuando no se tiene.	2020-12-12	8
350	Comprar logos de la UAM, con recursos de los alumnos actuales de la UAM o con recursos brindados por algún departamento (como el de sistemas).	2011-04-10	330
351	Pedir permiso a la institución para poner esos logos en cada salón.	2011-04-10	330
440	Comenzar haciendo "sombra" simulada a diario	2011-04-10	400
441	Trabajar para conseguir dinero y ampliar la casa	2011-04-10	400
442	Poner un lugar en casa solo para hacer ejercicio.	2011-04-10	400
750	Comprar HIelo, muuuuucho hielo	2011-04-14	710
751	Contratar a unas modelos que est'en promocionando y toda la onda!!	2011-04-14	710
920	gfdgfdsgdfgsgs	2011-04-16	880
1080	rewqrewrewq	2011-04-18	991
\.


--
-- TOC entry 2424 (class 0 OID 16427)
-- Dependencies: 1686
-- Data for Name: comunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comunidad (id_comunidad, nombre_comunidad, descripcion_comunidad, estatus_comunidad_id, titulo_comunidad) FROM stdin;
5	OFREZCO_TRABAJO	Esta comunidad se conforma por personas que ofrecen trabajo de cualquier índole.	1	¿Quién quiere trabajo?
4	BUSCO_TRABAJO	Esta comunidad se conforma por personas o instituciones que buscan trabajo.	1	Yo quiero un trabajo
3	HOLGAZANES	Esta comunidad se conforma por holgazanes con ideas para holgazanear	1	Se sorprenderían de los beneficios que deja hacer nada
2	ORGANOS_ACADEMICOS_UAM	Esta comunidad se conforma de organos académicos presentes en la UAM Azcapotzalco	1	Organos académicos al servicio de buenas ideas
1	PROFESORES	Esta comunidad se conforma por profesores de cualquier institución académica.	1	Profesores educando con calidad
0	EMPRENDEDORES	Esta comunidad se encarg de manejar cosas de emprendedores.	1	Soy un emprendedor
6	FUERA_DE_REALIDAD	Esta comunidad se conforma por personas que proponen ideas...poco normales.	1	¿También piensan que estás loco?
7	INDUSTRIA	Esta comunidad se conforma por personas que tienen ideas relacionadas a la industria	1	¿En realidad crees que aprendiste todo en la escuela?
9	BUSCO_SERVICIO_SOCIAL	Esta comunidad se conforma por personas que buscan hacer su servicio social.	1	Quiero aprovechar mi servicio, no quiero que me regalen las horas.
10	DEPORTIVA	Esta comunidad se conforma por gente que ¡es partidaria de una vida sana!	1	El deporte es mi pasión
8	OFREZCO_SERVICIO_SOCIAL	Esta comunidad se conforma por personas que ofrecen servicio social.	1	¿Buscas aprovechar tus horas de servicio social?
\.


--
-- TOC entry 2425 (class 0 OID 16433)
-- Dependencies: 1687
-- Data for Name: configuracion_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY configuracion_usuario (id_configuracion_usuario, envio_de_correos, aviso_preguntas, aviso_bitacoras, aviso_participaciones, aviso_ideas, aviso_seguidores, aviso_nuevo_lugar, almacenar_posicion_geografica) FROM stdin;
0	t	t	t	t	t	t	t	t
1	t	t	t	t	t	t	t	t
2	t	t	t	t	t	t	t	t
3	t	t	t	t	t	t	t	t
4	t	t	t	t	t	t	t	t
5	t	t	t	t	t	t	t	t
6	t	t	t	t	t	t	t	t
7	t	t	t	t	t	t	t	t
8	t	t	t	t	t	t	t	t
9	t	t	t	t	t	t	t	t
10	t	t	t	t	t	t	t	t
11	t	t	t	t	t	t	t	t
12	t	t	t	t	t	t	t	t
13	t	t	t	t	t	t	t	t
14	t	t	t	t	t	t	t	t
15	t	t	t	t	t	t	t	t
16	t	t	t	t	t	t	t	t
17	t	t	t	t	t	t	t	t
18	t	t	t	t	t	t	t	t
19	t	t	t	t	t	t	t	t
20	t	t	t	t	t	t	t	t
8030	t	t	t	t	t	t	t	t
8290	t	t	t	t	t	t	t	t
8420	t	t	t	t	t	t	t	t
8480	t	t	t	t	t	t	t	t
\.


--
-- TOC entry 2426 (class 0 OID 16438)
-- Dependencies: 1689
-- Data for Name: contacto_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacto_usuario (id_contacto_usuario, usuario_id, texto_contacto_usuario, tipo_contacto_usuario_id, texto_complementario1, texto_complementario2, texto_complementario3) FROM stdin;
0	0	jorgwel@localhost	0	\N	\N	\N
1	1	flak@localhost	0	\N	\N	\N
2	2	suruck@localhost	0	\N	\N	\N
5	3	hectori18@localhost	0	\N	\N	\N
4	4	admin@localhost	0	\N	\N	\N
5680	5670	flaka@gmail.com	0	\N	\N	\N
5700	5690	hector@gmail.com	0	\N	\N	\N
5720	5710	sergioi@gmail.com	0	\N	\N	\N
5740	5730	gabi@omni	0	\N	\N	\N
5910	5900	koke@gmail.com	0	\N	\N	\N
5930	5920	jose@gmail	0	\N	\N	\N
5950	5940	uno@localhost	0	\N	\N	\N
5980	5970	dos@localhost	0	\N	\N	\N
6200	6190	olallo@local	0	\N	\N	\N
6250	6240	glizbeth@localhost	0	\N	\N	\N
6280	6270	akon@localhost	0	\N	\N	\N
7370	7360	jorgwel@gmail.com	0	\N	\N	\N
6	5	gabi2@omni	0	\N	\N	\N
7	6	mary2@localhost	0	\N	\N	\N
8	5520	surucko@localhost	0	\N	\N	\N
7820	7810	venus@localhost	0	\N	\N	\N
8050	8040	kick@localhost	0	\N	\N	\N
8310	8300	martin@localhost	0	\N	\N	\N
8440	8430	rick@localhost	0	\N	\N	\N
8500	8490	leon@localhost	0	\N	\N	\N
\.


--
-- TOC entry 2427 (class 0 OID 16446)
-- Dependencies: 1691
-- Data for Name: critica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY critica (id_critica, texto_critica, tipo_critica_id, usuario_id, fecha_critica, estatus_critica_id) FROM stdin;
0	Buenos gráficos, echale más ganas con la validación.	1	0	2011-03-30	0
1	Me encatntó la forma en que manejas el concepto.	0	1	2011-03-29	0
2	Hay que respaldar la base de datos e ir documentando los cambios.	2	2	2011-03-28	0
90	Fíjate que sí me está latiendo la navegación.	0	\N	2011-04-03	0
10		0	\N	2011-04-03	0
11	Por fin te quedo vato, jajaja.	2	\N	2011-04-03	0
20		1	\N	2011-04-03	0
30		1	\N	2011-04-03	0
31		0	\N	2011-04-03	0
32		2	\N	2011-04-03	0
40	Hola manito!!	1	\N	2011-04-03	0
41	Hola manito!!	1	\N	2011-04-03	0
42	Hola manito!!	1	\N	2011-04-03	0
50	Ok, seleccionado, y es bueno eh!	0	\N	2011-04-03	0
51	Ok, seleccionado, y es bueno eh!	0	\N	2011-04-03	0
52	Ok, seleccionado, y es bueno eh!	0	\N	2011-04-03	0
70		1	\N	2011-04-03	0
71		0	\N	2011-04-03	0
72	Muy feliz desarrollando mi sistema	0	\N	2011-04-03	0
80	Opinión positiva sobre LinkUAM	0	\N	2011-04-03	0
81		1	\N	2011-04-03	0
82	Grito ranchero!!	2	\N	2011-04-03	0
91	tretyfgu	0	\N	2011-04-03	0
92	khjgfds	1	\N	2011-04-03	0
100	Espero que ya funcione la crítica desde aquí. Saludos!!	0	\N	2011-04-03	0
101	What you say!!!	1	\N	2011-04-03	0
102	Ya casiiii!!	0	\N	2011-04-03	0
110	Creo que le hacen falta detalles a la interfaz gráfica...	1	\N	2011-04-03	0
120	Me gusta link por los cores que maneja.	0	\N	2011-04-04	0
130	Me gusta porque puedo comunicarme con otros.	0	\N	2011-04-04	0
131		0	\N	2011-04-04	0
140	Me gusta tu onda vato.	0	\N	2011-04-05	0
141	No me gusta el hecho de que ya toda mi música me aburre :S.	1	0	2011-04-05	0
150	La falla no me deja loguear cuando le doy enter.	3	0	2011-04-07	0
160	Rsatafari avanza!!	1	0	2011-04-07	0
170	No me gusta linkuam, me parece como para niños :P	1	\N	2011-04-08	0
190	Cambiar elttema naranja.	2	\N	2011-04-08	0
620	No me gusta que te tardes tanto...	1	\N	2011-04-12	0
870	Aún no se actualiza el botón	3	0	2011-04-16	0
970	bvcbxvcxbvc	1	\N	2011-04-17	0
1090	la critico de forma positiva :)	0	\N	2011-04-18	0
1091	dsadsdfdsfds	1	\N	2011-04-18	0
1092	dsaddsadsa	1	\N	2011-04-18	0
1093	She's got you high!!	0	\N	2011-04-18	0
1094	fdsafdsa	1	\N	2011-04-18	0
1095	Mensaje opcional	2	\N	2011-04-18	0
1096	Mensaje opcional	2	\N	2011-04-18	0
1097	Mensaje opcional	2	\N	2011-04-18	0
1098	ssssssssssssssssssssssssss	2	\N	2011-04-18	0
1099	fdsfdsaf	1	\N	2011-04-18	0
1100	fdsafdsfd	2	\N	2011-04-18	0
1101	fdsafdsafds	3	\N	2011-04-18	0
1102	fdsafdsfa	1	\N	2011-04-18	0
1103	FDSAFDSAFDSA	0	\N	2011-04-18	0
1104	FDSAFDSAFDSA	0	\N	2011-04-18	0
1105	fdsafdsa	2	\N	2011-04-18	0
1106	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2	\N	2011-04-18	0
1107	fdsafdsaf	3	\N	2011-04-18	0
1108	fdsafdsfdsa	1	\N	2011-04-18	0
1109	bvbvbvbbvbvbvb	1	\N	2011-04-18	0
1110	cvcvcvcvcvc	0	\N	2011-04-18	0
1111	gfdgfdgsfd	2	\N	2011-04-18	0
1112	fdsafdsfads	1	\N	2011-04-18	0
1120	rewrewq	1	\N	2011-04-18	0
1130	sssssssssssss	3	\N	2011-04-20	0
1131	sssssssssssss	1	\N	2011-04-20	0
1140	fsdafdsfdsaf	1	\N	2011-04-24	0
1680	Sí :)	0	0	2011-05-02	0
4550	Me gustaría ver el texto de los botones con un poco más de relieve	1	0	2011-05-18	0
4551	gfdsgfdsgfds	1	0	2011-05-18	0
4552	fdsfdsafdsfds	2	0	2011-05-18	0
4553	fdsfdsafdsfds	2	0	2011-05-18	0
4554	gfdsgfdsgfds	1	0	2011-05-18	0
4560	dsafdsafdsa	2	\N	2011-05-18	0
4561	dsafdsafdsagfdgfdghgfjghkhjnb nbvnbvcnbvcnb	0	\N	2011-05-18	0
4810	mi opinión es que aún le falta un poco a LinkUAM	2	\N	2011-05-23	0
5000	hdsjakdhskja	0	\N	2011-05-24	0
6300	Opinión personal.	0	\N	2011-06-01	0
7230	Me gusta link UAM :)	0	0	2011-06-11	0
7500	Botones verddes	2	0	2011-06-16	0
7501	Botones verddes	2	0	2011-06-16	0
\.


--
-- TOC entry 2428 (class 0 OID 16451)
-- Dependencies: 1693
-- Data for Name: envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY envio (id_envio, fecha_registro_envio, fecha_envio_envio, numero_intentos_envio, estatus_envio_id, tipo_envio_id, comunidad_id, idea_id, bitacora_id, pregunta_id, usuario_id, canica_id, reporte_abuso_id, ticket_registro_id, aviso_id, invitacion_id) FROM stdin;
2653	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
1802	2011-05-03	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
1	2011-04-27	\N	0	1	0	1	1291	\N	\N	\N	\N	\N	\N	\N	\N
3430	2011-05-08	\N	0	1	1	5	3380	\N	\N	\N	\N	\N	\N	\N	\N
3431	2011-05-08	\N	0	1	1	1	3380	\N	\N	\N	\N	\N	\N	\N	\N
3432	2011-05-08	\N	0	1	1	8	3380	\N	\N	\N	\N	\N	\N	\N	\N
2581	2011-05-05	\N	0	1	1	7	1350	\N	\N	\N	\N	\N	\N	\N	\N
2654	2011-05-05	\N	0	1	1	5	1350	\N	\N	\N	\N	\N	\N	\N	\N
2655	2011-05-05	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
2656	2011-05-05	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
2860	2011-05-05	\N	0	1	1	5	1350	\N	\N	\N	\N	\N	\N	\N	\N
2861	2011-05-05	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
2404	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
2408	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
2123	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
2496	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
2522	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
2524	2011-05-05	\N	0	1	1	0	1350	\N	\N	\N	\N	\N	\N	\N	\N
2651	2011-05-05	\N	0	1	1	4	1350	\N	\N	\N	\N	\N	\N	\N	\N
1602	2011-04-28	\N	0	1	1	6	1350	\N	\N	\N	\N	\N	\N	\N	\N
1671	2011-04-28	\N	0	1	1	6	1350	\N	\N	\N	\N	\N	\N	\N	\N
1800	2011-05-03	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
1801	2011-05-03	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
1871	2011-05-03	\N	0	1	1	6	1350	\N	\N	\N	\N	\N	\N	\N	\N
1942	2011-05-03	\N	0	1	1	9	1350	\N	\N	\N	\N	\N	\N	\N	\N
3433	2011-05-08	\N	0	1	1	0	3381	\N	\N	\N	\N	\N	\N	\N	\N
2010	2011-05-04	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
2012	2011-05-04	\N	0	1	1	6	1350	\N	\N	\N	\N	\N	\N	\N	\N
2013	2011-05-04	\N	0	1	1	7	1350	\N	\N	\N	\N	\N	\N	\N	\N
2122	2011-05-05	\N	0	1	1	4	1350	\N	\N	\N	\N	\N	\N	\N	\N
3360	2011-05-07	\N	0	1	1	4	1350	\N	\N	\N	\N	\N	\N	\N	\N
3361	2011-05-07	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
2580	2011-05-05	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
2652	2011-05-05	\N	0	1	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
1670	2011-04-28	\N	0	1	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N
1941	2011-05-03	\N	0	1	2	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
2011	2011-05-04	\N	0	1	2	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
1870	2011-05-03	\N	0	1	2	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
2191	2011-05-05	\N	0	1	2	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
2262	2011-05-05	\N	0	1	2	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
2490	2011-05-05	\N	0	1	2	6	\N	\N	\N	\N	\N	\N	\N	\N	\N
2520	2011-05-05	\N	0	1	2	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
2120	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
2121	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
2331	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
2403	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
2499	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
2650	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
3070	2011-05-05	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
1940	2011-05-03	\N	0	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
0	2011-04-28	\N	0	1	0	0	1290	\N	\N	\N	\N	\N	\N	\N	\N
3071	2011-05-05	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
3280	2011-05-05	\N	0	1	1	4	1350	\N	\N	\N	\N	\N	\N	\N	\N
3281	2011-05-05	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
2190	2011-05-05	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
2260	2011-05-05	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
2261	2011-05-05	\N	0	1	1	7	1350	\N	\N	\N	\N	\N	\N	\N	\N
2263	2011-05-05	\N	0	1	1	6	1350	\N	\N	\N	\N	\N	\N	\N	\N
2330	2011-05-05	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
2400	2011-05-05	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
2401	2011-05-05	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
2402	2011-05-05	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
2405	2011-05-05	\N	0	1	1	5	1350	\N	\N	\N	\N	\N	\N	\N	\N
2406	2011-05-05	\N	0	1	1	1	1350	\N	\N	\N	\N	\N	\N	\N	\N
2407	2011-05-05	\N	0	1	1	5	1350	\N	\N	\N	\N	\N	\N	\N	\N
2409	2011-05-05	\N	0	1	1	9	1350	\N	\N	\N	\N	\N	\N	\N	\N
2430	2011-05-05	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
2431	2011-05-05	\N	0	1	1	7	1350	\N	\N	\N	\N	\N	\N	\N	\N
2491	2011-05-05	\N	0	1	1	7	1350	\N	\N	\N	\N	\N	\N	\N	\N
2492	2011-05-05	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
2493	2011-05-05	\N	0	1	1	6	1350	\N	\N	\N	\N	\N	\N	\N	\N
2494	2011-05-05	\N	0	1	1	10	1350	\N	\N	\N	\N	\N	\N	\N	\N
2495	2011-05-05	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
2497	2011-05-05	\N	0	1	1	4	1350	\N	\N	\N	\N	\N	\N	\N	\N
2498	2011-05-05	\N	0	1	1	9	1350	\N	\N	\N	\N	\N	\N	\N	\N
2521	2011-05-05	\N	0	1	1	2	1350	\N	\N	\N	\N	\N	\N	\N	\N
2523	2011-05-05	\N	0	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
1601	2011-04-28	\N	1	1	2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2011-04-26	\N	1	1	0	\N	1350	\N	\N	\N	\N	\N	\N	\N	\N
1600	2011-04-28	\N	1	1	1	3	1350	\N	\N	\N	\N	\N	\N	\N	\N
4110	2011-05-17	\N	1	1	8	\N	4042	\N	\N	\N	\N	\N	\N	\N	\N
4091	2011-05-16	\N	1	1	1	6	4040	\N	\N	\N	\N	\N	\N	\N	\N
3562	2011-05-10	\N	2	1	4	\N	\N	\N	3570	\N	\N	\N	\N	\N	\N
3540	2011-05-09	\N	65	1	3	\N	\N	\N	3530	\N	\N	\N	\N	\N	\N
3560	2011-05-10	\N	1	1	3	\N	\N	\N	3550	\N	\N	\N	\N	\N	\N
4529	2011-05-18	\N	106	1	3	\N	\N	\N	4531	\N	\N	\N	\N	\N	\N
4528	2011-05-18	\N	120	1	3	\N	\N	\N	4530	\N	\N	\N	\N	\N	\N
5570	2011-05-30	\N	834	1	1	3	5540	\N	\N	\N	\N	\N	\N	\N	\N
5960	2011-05-31	\N	28	1	5	\N	\N	\N	\N	5940	\N	\N	\N	\N	\N
3561	2011-05-10	\N	11	1	4	\N	\N	\N	3550	\N	\N	\N	\N	\N	\N
4093	2011-05-16	\N	5	1	1	1	4041	\N	\N	\N	\N	\N	\N	\N	\N
3580	2011-05-10	\N	1	1	3	\N	\N	\N	3570	\N	\N	\N	\N	\N	\N
4092	2011-05-16	\N	6	1	1	5	4041	\N	\N	\N	\N	\N	\N	\N	\N
3991	2011-05-11	\N	11	1	1	6	3940	\N	\N	\N	\N	\N	\N	\N	\N
3990	2011-05-11	\N	8	1	1	3	3940	\N	\N	\N	\N	\N	\N	\N	\N
3992	2011-05-11	\N	14	1	1	7	3940	\N	\N	\N	\N	\N	\N	\N	\N
4095	2011-05-16	\N	1	1	1	6	4042	\N	\N	\N	\N	\N	\N	\N	\N
4020	2011-05-16	\N	13	1	3	\N	\N	\N	4010	\N	\N	\N	\N	\N	\N
4021	2011-05-16	\N	1	1	3	\N	\N	\N	4011	\N	\N	\N	\N	\N	\N
4090	2011-05-16	\N	9	1	1	1	4040	\N	\N	\N	\N	\N	\N	\N	\N
4111	2011-05-17	\N	44	1	10	\N	\N	\N	\N	\N	4120	\N	\N	\N	\N
4160	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4150	\N	\N	\N	\N
4141	2011-05-17	\N	23	1	10	\N	\N	\N	\N	\N	4130	\N	\N	\N	\N
4140	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4130	\N	\N	\N	\N
4094	2011-05-16	\N	477	1	1	2	4042	\N	\N	\N	\N	\N	\N	\N	\N
4161	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4150	\N	\N	\N	\N
4162	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4151	\N	\N	\N	\N
4163	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4151	\N	\N	\N	\N
4164	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4152	\N	\N	\N	\N
4165	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4152	\N	\N	\N	\N
4280	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4270	\N	\N	\N	\N
4281	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4270	\N	\N	\N	\N
4360	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4350	\N	\N	\N	\N
4361	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4350	\N	\N	\N	\N
4580	2011-05-18	\N	1	1	8	\N	\N	\N	\N	\N	4570	\N	\N	\N	\N
4382	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4371	\N	\N	\N	\N
4383	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4371	\N	\N	\N	\N
4384	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4372	\N	\N	\N	\N
4385	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4372	\N	\N	\N	\N
4386	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4373	\N	\N	\N	\N
4387	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4373	\N	\N	\N	\N
4582	2011-05-18	\N	1	1	3	\N	\N	\N	4590	\N	\N	\N	\N	\N	\N
4581	2011-05-18	\N	1	1	10	\N	\N	\N	\N	\N	4570	\N	\N	\N	\N
4400	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4390	\N	\N	\N	\N
4401	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4390	\N	\N	\N	\N
4420	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4410	\N	\N	\N	\N
4421	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4410	\N	\N	\N	\N
4422	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4411	\N	\N	\N	\N
4423	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4411	\N	\N	\N	\N
4424	2011-05-17	\N	1	1	1	5	4430	\N	\N	\N	\N	\N	\N	\N	\N
4425	2011-05-17	\N	1	1	1	2	4430	\N	\N	\N	\N	\N	\N	\N	\N
4426	2011-05-17	\N	1	1	1	6	4430	\N	\N	\N	\N	\N	\N	\N	\N
4427	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4413	\N	\N	\N	\N
4428	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4413	\N	\N	\N	\N
4429	2011-05-17	\N	1	1	8	\N	\N	\N	\N	\N	4414	\N	\N	\N	\N
4480	2011-05-17	\N	1	1	10	\N	\N	\N	\N	\N	4414	\N	\N	\N	\N
4500	2011-05-18	\N	1	1	3	\N	\N	\N	4490	\N	\N	\N	\N	\N	\N
4610	2011-05-18	\N	1	1	3	\N	\N	\N	4600	\N	\N	\N	\N	\N	\N
4900	2011-05-24	\N	1	1	3	\N	\N	\N	4890	\N	\N	\N	\N	\N	\N
4757	2011-05-23	\N	1	1	8	\N	\N	\N	\N	\N	4742	\N	\N	\N	\N
4901	2011-05-24	\N	1	1	3	\N	\N	\N	4891	\N	\N	\N	\N	\N	\N
4758	2011-05-23	\N	1	1	10	\N	\N	\N	\N	\N	4742	\N	\N	\N	\N
4902	2011-05-24	\N	1	1	4	\N	\N	\N	4891	\N	\N	\N	\N	\N	\N
4630	2011-05-21	\N	4	1	8	\N	\N	\N	\N	\N	4620	\N	\N	\N	\N
4631	2011-05-21	\N	4	1	10	\N	\N	\N	\N	\N	4620	\N	\N	\N	\N
4632	2011-05-21	\N	2	1	3	\N	\N	\N	4640	\N	\N	\N	\N	\N	\N
4650	2011-05-23	\N	1	1	0	\N	3940	\N	\N	\N	\N	\N	\N	\N	\N
4680	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4700	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4701	2011-05-23	\N	1	1	0	\N	3940	\N	\N	\N	\N	\N	\N	\N	\N
4702	2011-05-23	\N	1	1	0	\N	3381	\N	\N	\N	\N	\N	\N	\N	\N
4703	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4704	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4705	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4706	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4707	2011-05-23	\N	1	1	0	\N	3381	\N	\N	\N	\N	\N	\N	\N	\N
4708	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4709	2011-05-23	\N	1	1	0	\N	3380	\N	\N	\N	\N	\N	\N	\N	\N
4720	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4721	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4722	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4723	2011-05-23	\N	1	1	0	\N	4430	\N	\N	\N	\N	\N	\N	\N	\N
4750	2011-05-23	\N	1	1	8	\N	\N	\N	\N	\N	4740	\N	\N	\N	\N
4751	2011-05-23	\N	1	1	10	\N	\N	\N	\N	\N	4740	\N	\N	\N	\N
4752	2011-05-23	\N	1	1	3	\N	\N	\N	4760	\N	\N	\N	\N	\N	\N
4903	2011-05-24	\N	1	1	4	\N	\N	\N	4891	\N	\N	\N	\N	\N	\N
4544	2011-05-18	\N	2	1	3	\N	\N	\N	4536	\N	\N	\N	\N	\N	\N
4541	2011-05-18	\N	43	1	3	\N	\N	\N	4533	\N	\N	\N	\N	\N	\N
4540	2011-05-18	\N	91	1	3	\N	\N	\N	4532	\N	\N	\N	\N	\N	\N
4520	2011-05-18	\N	135	1	8	\N	\N	\N	\N	\N	4510	\N	\N	\N	\N
4521	2011-05-18	\N	135	1	10	\N	\N	\N	\N	\N	4510	\N	\N	\N	\N
4522	2011-05-18	\N	132	1	8	\N	\N	\N	\N	\N	4511	\N	\N	\N	\N
4523	2011-05-18	\N	132	1	10	\N	\N	\N	\N	\N	4511	\N	\N	\N	\N
4524	2011-05-18	\N	131	1	8	\N	\N	\N	\N	\N	4512	\N	\N	\N	\N
4525	2011-05-18	\N	131	1	10	\N	\N	\N	\N	\N	4512	\N	\N	\N	\N
4526	2011-05-18	\N	128	1	8	\N	\N	\N	\N	\N	4513	\N	\N	\N	\N
4527	2011-05-18	\N	128	1	10	\N	\N	\N	\N	\N	4513	\N	\N	\N	\N
4542	2011-05-18	\N	41	1	3	\N	\N	\N	4534	\N	\N	\N	\N	\N	\N
4543	2011-05-18	\N	41	1	3	\N	\N	\N	4535	\N	\N	\N	\N	\N	\N
4754	2011-05-23	\N	1	1	1	6	4770	\N	\N	\N	\N	\N	\N	\N	\N
4904	2011-05-24	\N	1	1	4	\N	\N	\N	4890	\N	\N	\N	\N	\N	\N
4545	2011-05-18	\N	1	1	8	\N	\N	\N	\N	\N	4514	\N	\N	\N	\N
4546	2011-05-18	\N	1	1	10	\N	\N	\N	\N	\N	4514	\N	\N	\N	\N
4905	2011-05-24	\N	1	1	4	\N	\N	\N	4890	\N	\N	\N	\N	\N	\N
4755	2011-05-23	\N	1	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
4547	2011-05-18	\N	1	1	8	\N	\N	\N	\N	\N	4515	\N	\N	\N	\N
4548	2011-05-18	\N	1	1	10	\N	\N	\N	\N	\N	4515	\N	\N	\N	\N
4906	2011-05-24	\N	1	1	4	\N	\N	\N	4490	\N	\N	\N	\N	\N	\N
4907	2011-05-24	\N	1	1	4	\N	\N	\N	4490	\N	\N	\N	\N	\N	\N
4549	2011-05-18	\N	1	1	3	\N	\N	\N	4537	\N	\N	\N	\N	\N	\N
4910	2011-05-24	\N	1	1	4	\N	\N	\N	4530	\N	\N	\N	\N	\N	\N
4756	2011-05-23	\N	1	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
4911	2011-05-24	\N	1	1	4	\N	\N	\N	4531	\N	\N	\N	\N	\N	\N
4912	2011-05-24	\N	1	1	4	\N	\N	\N	4532	\N	\N	\N	\N	\N	\N
4913	2011-05-24	\N	1	1	4	\N	\N	\N	4536	\N	\N	\N	\N	\N	\N
4920	2011-05-24	\N	1	1	4	\N	\N	\N	4537	\N	\N	\N	\N	\N	\N
4921	2011-05-24	\N	1	1	4	\N	\N	\N	4590	\N	\N	\N	\N	\N	\N
4753	2011-05-23	\N	79	1	1	4	4770	\N	\N	\N	\N	\N	\N	\N	\N
4820	2011-05-23	\N	1	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
4840	2011-05-23	\N	1	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
4871	2011-05-24	\N	1	1	4	\N	\N	\N	4760	\N	\N	\N	\N	\N	\N
4872	2011-05-24	\N	1	1	4	\N	\N	\N	4760	\N	\N	\N	\N	\N	\N
4922	2011-05-24	\N	1	1	4	\N	\N	\N	4600	\N	\N	\N	\N	\N	\N
4880	2011-05-24	\N	1	1	4	\N	\N	\N	4640	\N	\N	\N	\N	\N	\N
4881	2011-05-24	\N	1	1	4	\N	\N	\N	4640	\N	\N	\N	\N	\N	\N
4923	2011-05-24	\N	1	1	4	\N	\N	\N	4011	\N	\N	\N	\N	\N	\N
4924	2011-05-24	\N	1	1	4	\N	\N	\N	3550	\N	\N	\N	\N	\N	\N
4925	2011-05-24	\N	1	1	4	\N	\N	\N	3570	\N	\N	\N	\N	\N	\N
4926	2011-05-24	\N	1	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
4927	2011-05-24	\N	1	1	8	\N	\N	\N	\N	\N	4940	\N	\N	\N	\N
4928	2011-05-24	\N	1	1	10	\N	\N	\N	\N	\N	4940	\N	\N	\N	\N
4960	2011-05-24	\N	1	1	3	\N	\N	\N	4950	\N	\N	\N	\N	\N	\N
4961	2011-05-24	\N	1	1	3	\N	\N	\N	4951	\N	\N	\N	\N	\N	\N
4970	2011-05-24	\N	1	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
4971	2011-05-24	\N	1	1	3	\N	\N	\N	4990	\N	\N	\N	\N	\N	\N
4972	2011-05-24	\N	1	1	4	\N	\N	\N	4990	\N	\N	\N	\N	\N	\N
5060	2011-05-24	\N	1	1	1	2	5010	\N	\N	\N	\N	\N	\N	\N	\N
5061	2011-05-24	\N	1	1	1	1	5010	\N	\N	\N	\N	\N	\N	\N	\N
5062	2011-05-24	\N	1	1	1	0	5010	\N	\N	\N	\N	\N	\N	\N	\N
5063	2011-05-24	\N	1	1	1	7	5010	\N	\N	\N	\N	\N	\N	\N	\N
5065	2011-05-24	\N	1	1	3	\N	\N	\N	5051	\N	\N	\N	\N	\N	\N
5840	2011-05-31	\N	32	1	1	5	5810	\N	\N	\N	\N	\N	\N	\N	\N
5066	2011-05-24	\N	1	1	8	\N	\N	\N	\N	\N	5031	\N	\N	\N	\N
5067	2011-05-24	\N	1	1	10	\N	\N	\N	\N	\N	5031	\N	\N	\N	\N
5068	2011-05-24	\N	1	1	8	\N	\N	\N	\N	\N	5032	\N	\N	\N	\N
5069	2011-05-24	\N	1	1	10	\N	\N	\N	\N	\N	5032	\N	\N	\N	\N
5780	2011-05-31	\N	609	1	1	5	5750	\N	\N	\N	\N	\N	\N	\N	\N
5571	2011-05-30	\N	834	1	1	2	5540	\N	\N	\N	\N	\N	\N	\N	\N
5631	2011-05-30	\N	811	1	1	4	5600	\N	\N	\N	\N	\N	\N	\N	\N
5781	2011-05-31	\N	609	1	1	4	5750	\N	\N	\N	\N	\N	\N	\N	\N
5782	2011-05-31	\N	609	1	8	\N	\N	\N	\N	\N	5800	\N	\N	\N	\N
5990	2011-05-31	\N	1	1	5	\N	\N	\N	\N	5970	\N	\N	\N	\N	\N
5991	2011-05-31	\N	1	1	1	5	6000	\N	\N	\N	\N	\N	\N	\N	\N
5992	2011-05-31	\N	1	1	1	4	6000	\N	\N	\N	\N	\N	\N	\N	\N
5993	2011-05-31	\N	1	1	3	\N	\N	\N	6040	\N	\N	\N	\N	\N	\N
5994	2011-05-31	\N	1	1	0	\N	6000	\N	\N	\N	\N	\N	\N	\N	\N
6260	2011-05-31	\N	1	1	5	\N	\N	\N	\N	6240	\N	\N	\N	\N	\N
6050	2011-05-31	\N	1	1	4	\N	\N	\N	6040	\N	\N	\N	\N	\N	\N
6290	2011-06-01	\N	1	1	5	\N	\N	\N	\N	6270	\N	\N	\N	\N	\N
5783	2011-05-31	\N	609	1	10	\N	\N	\N	\N	\N	5800	\N	\N	\N	\N
5630	2011-05-30	\N	811	1	1	5	5600	\N	\N	\N	\N	\N	\N	\N	\N
5632	2011-05-30	\N	809	1	1	5	5601	\N	\N	\N	\N	\N	\N	\N	\N
5633	2011-05-30	\N	809	1	1	4	5601	\N	\N	\N	\N	\N	\N	\N	\N
5634	2011-05-30	\N	809	1	1	3	5601	\N	\N	\N	\N	\N	\N	\N	\N
7051	2011-06-09	\N	1	1	0	\N	6770	\N	\N	\N	\N	\N	\N	\N	\N
7052	2011-06-09	\N	1	1	3	\N	\N	\N	7070	\N	\N	\N	\N	\N	\N
7130	2011-06-10	\N	1	1	8	\N	\N	\N	\N	\N	7120	\N	\N	\N	\N
7131	2011-06-10	\N	1	1	10	\N	\N	\N	\N	\N	7120	\N	\N	\N	\N
7380	2011-06-13	\N	1	1	5	\N	\N	\N	\N	7360	\N	\N	\N	\N	\N
7381	2011-06-13	\N	1	1	8	\N	\N	\N	\N	\N	7390	\N	\N	\N	\N
7382	2011-06-13	\N	1	1	10	\N	\N	\N	\N	\N	7390	\N	\N	\N	\N
7383	2011-06-13	\N	1	1	8	\N	\N	\N	\N	\N	7391	\N	\N	\N	\N
7384	2011-06-13	\N	1	1	10	\N	\N	\N	\N	\N	7391	\N	\N	\N	\N
7385	2011-06-13	\N	1	1	8	\N	\N	\N	\N	\N	7392	\N	\N	\N	\N
7386	2011-06-13	\N	1	1	10	\N	\N	\N	\N	\N	7392	\N	\N	\N	\N
7680	2011-06-21	\N	1	1	6	\N	\N	\N	\N	2	\N	\N	7660	\N	\N
6120	2011-05-31	\N	1	1	8	\N	\N	\N	\N	\N	6110	\N	\N	\N	\N
6121	2011-05-31	\N	1	1	10	\N	\N	\N	\N	\N	6110	\N	\N	\N	\N
6122	2011-05-31	\N	1	1	8	\N	\N	\N	\N	\N	6111	\N	\N	\N	\N
6123	2011-05-31	\N	1	1	10	\N	\N	\N	\N	\N	6111	\N	\N	\N	\N
6150	2011-05-31	\N	1	1	8	\N	\N	\N	\N	\N	6140	\N	\N	\N	\N
6151	2011-05-31	\N	1	1	10	\N	\N	\N	\N	\N	6140	\N	\N	\N	\N
6152	2011-05-31	\N	1	1	8	\N	\N	\N	\N	\N	6141	\N	\N	\N	\N
6153	2011-05-31	\N	1	1	10	\N	\N	\N	\N	\N	6141	\N	\N	\N	\N
6154	2011-05-31	\N	1	1	3	\N	\N	\N	6160	\N	\N	\N	\N	\N	\N
6155	2011-05-31	\N	1	1	0	\N	4042	\N	\N	\N	\N	\N	\N	\N	\N
5064	2011-05-24	\N	4479	1	1	9	5010	\N	\N	\N	\N	\N	\N	\N	\N
6156	2011-05-31	\N	1	1	4	\N	\N	\N	6160	\N	\N	\N	\N	\N	\N
6157	2011-05-31	\N	1	1	8	\N	\N	\N	\N	\N	6142	\N	\N	\N	\N
6158	2011-05-31	\N	1	1	10	\N	\N	\N	\N	\N	6142	\N	\N	\N	\N
6159	2011-05-31	\N	1	1	3	\N	\N	\N	6161	\N	\N	\N	\N	\N	\N
6180	2011-05-31	\N	1	1	4	\N	\N	\N	6161	\N	\N	\N	\N	\N	\N
5081	2011-05-24	\N	4433	1	0	\N	4770	\N	\N	\N	\N	\N	\N	\N	\N
5080	2011-05-24	\N	4433	1	4	\N	\N	\N	4950	\N	\N	\N	\N	\N	\N
6181	2011-05-31	\N	1	1	5	\N	\N	\N	\N	6190	\N	\N	\N	\N	\N
6182	2011-05-31	\N	1	1	1	5	6210	\N	\N	\N	\N	\N	\N	\N	\N
6183	2011-05-31	\N	1	1	1	4	6210	\N	\N	\N	\N	\N	\N	\N	\N
6184	2011-05-31	\N	1	1	1	5	6211	\N	\N	\N	\N	\N	\N	\N	\N
6185	2011-05-31	\N	1	1	1	1	6211	\N	\N	\N	\N	\N	\N	\N	\N
6186	2011-05-31	\N	1	1	1	5	6212	\N	\N	\N	\N	\N	\N	\N	\N
7050	2011-06-09	\N	1	1	0	\N	6770	\N	\N	\N	\N	\N	\N	\N	\N
7270	2011-06-13	\N	1	1	1	5	7240	\N	\N	\N	\N	\N	\N	\N	\N
7271	2011-06-13	\N	1	1	1	4	7240	\N	\N	\N	\N	\N	\N	\N	\N
7272	2011-06-13	\N	1	1	8	\N	\N	\N	\N	\N	7290	\N	\N	\N	\N
7273	2011-06-13	\N	1	1	10	\N	\N	\N	\N	\N	7290	\N	\N	\N	\N
7274	2011-06-13	\N	1	1	8	\N	\N	\N	\N	\N	7291	\N	\N	\N	\N
7275	2011-06-13	\N	1	1	10	\N	\N	\N	\N	\N	7291	\N	\N	\N	\N
7410	2011-06-14	\N	1	1	3	\N	\N	\N	7400	\N	\N	\N	\N	\N	\N
7411	2011-06-14	\N	1	1	3	\N	\N	\N	7401	\N	\N	\N	\N	\N	\N
7412	2011-06-14	\N	1	1	3	\N	\N	\N	7402	\N	\N	\N	\N	\N	\N
7413	2011-06-14	\N	1	1	3	\N	\N	\N	7403	\N	\N	\N	\N	\N	\N
7414	2011-06-14	\N	1	1	3	\N	\N	\N	7404	\N	\N	\N	\N	\N	\N
7440	2011-06-15	\N	1	1	3	\N	\N	\N	7430	\N	\N	\N	\N	\N	\N
7480	2011-06-16	\N	1	1	8	\N	\N	\N	\N	\N	7470	\N	\N	\N	\N
7481	2011-06-16	\N	1	1	10	\N	\N	\N	\N	\N	7470	\N	\N	\N	\N
7482	2011-06-16	\N	1	1	3	\N	\N	\N	7490	\N	\N	\N	\N	\N	\N
6460	2011-06-06	\N	15	1	3	\N	\N	\N	6450	\N	\N	\N	\N	\N	\N
6410	2011-06-03	\N	24	1	8	\N	\N	\N	\N	\N	6400	\N	\N	\N	\N
6411	2011-06-03	\N	24	1	10	\N	\N	\N	\N	\N	6400	\N	\N	\N	\N
6440	2011-06-03	\N	24	1	3	\N	\N	\N	6430	\N	\N	\N	\N	\N	\N
6441	2011-06-03	\N	24	1	4	\N	\N	\N	6430	\N	\N	\N	\N	\N	\N
6320	2011-06-02	\N	29	1	4	\N	\N	\N	4951	\N	\N	\N	\N	\N	\N
6322	2011-06-02	\N	29	1	4	\N	\N	\N	3470	\N	\N	\N	\N	\N	\N
6325	2011-06-02	\N	29	1	4	\N	\N	\N	3481	\N	\N	\N	\N	\N	\N
6328	2011-06-02	\N	29	1	4	\N	\N	\N	3510	\N	\N	\N	\N	\N	\N
6329	2011-06-02	\N	29	1	4	\N	\N	\N	3500	\N	\N	\N	\N	\N	\N
6330	2011-06-02	\N	29	1	4	\N	\N	\N	3490	\N	\N	\N	\N	\N	\N
6331	2011-06-02	\N	29	1	4	\N	\N	\N	3520	\N	\N	\N	\N	\N	\N
6461	2011-06-06	\N	15	1	3	\N	\N	\N	6451	\N	\N	\N	\N	\N	\N
6540	2011-06-06	\N	15	1	3	\N	\N	\N	6530	\N	\N	\N	\N	\N	\N
6560	2011-06-06	\N	15	1	3	\N	\N	\N	6550	\N	\N	\N	\N	\N	\N
6561	2011-06-06	\N	15	1	4	\N	\N	\N	6550	\N	\N	\N	\N	\N	\N
6562	2011-06-06	\N	15	1	3	\N	\N	\N	6551	\N	\N	\N	\N	\N	\N
6563	2011-06-06	\N	15	1	3	\N	\N	\N	6552	\N	\N	\N	\N	\N	\N
6564	2011-06-06	\N	15	1	3	\N	\N	\N	6553	\N	\N	\N	\N	\N	\N
6567	2011-06-06	\N	15	1	4	\N	\N	\N	6553	\N	\N	\N	\N	\N	\N
6690	2011-06-06	\N	15	1	1	5	6660	\N	\N	\N	\N	\N	\N	\N	\N
6691	2011-06-06	\N	15	1	1	4	6660	\N	\N	\N	\N	\N	\N	\N	\N
6581	2011-06-06	\N	15	1	4	\N	\N	\N	6570	\N	\N	\N	\N	\N	\N
6321	2011-06-02	\N	29	1	4	\N	\N	\N	5051	\N	\N	\N	\N	\N	\N
6740	2011-06-06	\N	15	1	1	5	6710	\N	\N	\N	\N	\N	\N	\N	\N
6741	2011-06-06	\N	15	1	1	4	6710	\N	\N	\N	\N	\N	\N	\N	\N
6350	2011-06-02	\N	29	1	0	\N	5600	\N	\N	\N	\N	\N	\N	\N	\N
6351	2011-06-02	\N	29	1	0	\N	5600	\N	\N	\N	\N	\N	\N	\N	\N
6352	2011-06-02	\N	29	1	0	\N	5600	\N	\N	\N	\N	\N	\N	\N	\N
6353	2011-06-02	\N	29	1	0	\N	5600	\N	\N	\N	\N	\N	\N	\N	\N
6500	2011-06-06	\N	15	1	3	\N	\N	\N	6490	\N	\N	\N	\N	\N	\N
6565	2011-06-06	\N	15	1	4	\N	\N	\N	6551	\N	\N	\N	\N	\N	\N
6566	2011-06-06	\N	15	1	4	\N	\N	\N	6552	\N	\N	\N	\N	\N	\N
6590	2011-06-06	\N	15	1	0	\N	6212	\N	\N	\N	\N	\N	\N	\N	\N
6520	2011-06-06	\N	15	1	3	\N	\N	\N	6510	\N	\N	\N	\N	\N	\N
6640	2011-06-06	\N	15	1	1	5	6610	\N	\N	\N	\N	\N	\N	\N	\N
6641	2011-06-06	\N	15	1	1	4	6610	\N	\N	\N	\N	\N	\N	\N	\N
6642	2011-06-06	\N	15	1	1	5	6611	\N	\N	\N	\N	\N	\N	\N	\N
6643	2011-06-06	\N	15	1	1	4	6611	\N	\N	\N	\N	\N	\N	\N	\N
7053	2011-06-09	\N	1	1	4	\N	\N	\N	7070	\N	\N	\N	\N	\N	\N
7170	2011-06-10	\N	1	1	0	\N	6610	\N	\N	\N	\N	\N	\N	\N	\N
7171	2011-06-10	\N	1	1	3	\N	\N	\N	7190	\N	\N	\N	\N	\N	\N
7172	2011-06-10	\N	1	1	4	\N	\N	\N	7190	\N	\N	\N	\N	\N	\N
7173	2011-06-10	\N	1	1	3	\N	\N	\N	7191	\N	\N	\N	\N	\N	\N
7711	2011-06-21	\N	1	1	6	\N	\N	\N	\N	6240	\N	\N	7691	\N	\N
7770	2011-06-21	\N	1	1	6	\N	\N	\N	\N	6240	\N	\N	7750	\N	\N
7800	2011-06-21	\N	1	1	6	\N	\N	\N	\N	2	\N	\N	7780	\N	\N
7801	2011-06-21	\N	1	1	5	\N	\N	\N	\N	7810	\N	\N	\N	\N	\N
6380	2011-06-02	\N	61	1	3	\N	\N	\N	6370	\N	\N	\N	\N	\N	\N
7802	2011-06-21	\N	1	1	1	5	7830	\N	\N	\N	\N	\N	\N	\N	\N
7803	2011-06-21	\N	1	1	1	4	7830	\N	\N	\N	\N	\N	\N	\N	\N
8010	2011-06-23	\N	1	1	6	\N	\N	\N	\N	6240	\N	\N	7990	\N	\N
6323	2011-06-02	\N	29	1	4	\N	\N	\N	3480	\N	\N	\N	\N	\N	\N
7620	2011-06-21	\N	31	1	6	\N	\N	\N	\N	0	\N	\N	7600	\N	\N
6324	2011-06-02	\N	29	1	4	\N	\N	\N	4010	\N	\N	\N	\N	\N	\N
6326	2011-06-02	\N	29	1	4	\N	\N	\N	3491	\N	\N	\N	\N	\N	\N
6327	2011-06-02	\N	29	1	4	\N	\N	\N	3530	\N	\N	\N	\N	\N	\N
6480	2011-06-06	\N	15	1	3	\N	\N	\N	6470	\N	\N	\N	\N	\N	\N
6541	2011-06-06	\N	15	1	4	\N	\N	\N	6530	\N	\N	\N	\N	\N	\N
6580	2011-06-06	\N	15	1	3	\N	\N	\N	6570	\N	\N	\N	\N	\N	\N
7900	2011-06-23	\N	1	1	1	5	7870	\N	\N	\N	\N	\N	\N	\N	\N
7710	2011-06-21	\N	1	1	6	\N	\N	\N	\N	6240	\N	\N	7690	\N	\N
7901	2011-06-23	\N	1	1	1	4	7870	\N	\N	\N	\N	\N	\N	\N	\N
7902	2011-06-23	\N	1	1	8	\N	\N	\N	\N	\N	7920	\N	\N	\N	\N
7903	2011-06-23	\N	1	1	10	\N	\N	\N	\N	\N	7920	\N	\N	\N	\N
7904	2011-06-23	\N	1	1	3	\N	\N	\N	7930	\N	\N	\N	\N	\N	\N
8100	2011-06-24	\N	1	1	11	\N	\N	\N	\N	\N	\N	\N	\N	8090	\N
8200	2011-07-01	\N	1	1	0	\N	7870	\N	\N	\N	\N	\N	\N	\N	\N
8270	2011-07-02	\N	1	1	1	2	8240	\N	\N	\N	\N	\N	\N	\N	\N
8271	2011-07-02	\N	1	1	1	1	8240	\N	\N	\N	\N	\N	\N	\N	\N
8272	2011-07-02	\N	1	1	5	\N	\N	\N	\N	8300	\N	\N	\N	\N	\N
8370	2011-07-03	\N	1	1	6	\N	\N	\N	\N	8300	\N	\N	8350	\N	\N
8371	2011-07-03	\N	1	1	1	5	8380	\N	\N	\N	\N	\N	\N	\N	\N
8372	2011-07-03	\N	1	1	1	4	8380	\N	\N	\N	\N	\N	\N	\N	\N
8373	2011-07-03	\N	1	1	1	3	8380	\N	\N	\N	\N	\N	\N	\N	\N
8374	2011-07-03	\N	1	1	5	\N	\N	\N	\N	8430	\N	\N	\N	\N	\N
8510	2011-07-03	\N	1	1	5	\N	\N	\N	\N	8490	\N	\N	\N	\N	\N
8580	2011-07-03	\N	1	1	1	2	8550	\N	\N	\N	\N	\N	\N	\N	\N
8581	2011-07-03	\N	1	1	1	1	8550	\N	\N	\N	\N	\N	\N	\N	\N
8582	2011-07-03	\N	1	1	0	\N	6901	\N	\N	\N	\N	\N	\N	\N	\N
8583	2011-07-03	\N	1	1	3	\N	\N	\N	8600	\N	\N	\N	\N	\N	\N
8584	2011-07-03	\N	1	1	3	\N	\N	\N	8601	\N	\N	\N	\N	\N	\N
6863	2011-06-07	\N	15	1	4	\N	\N	\N	1400	\N	\N	\N	\N	\N	\N
6864	2011-06-07	\N	15	1	4	\N	\N	\N	1061	\N	\N	\N	\N	\N	\N
6865	2011-06-07	\N	15	1	4	\N	\N	\N	960	\N	\N	\N	\N	\N	\N
6866	2011-06-07	\N	15	1	4	\N	\N	\N	800	\N	\N	\N	\N	\N	\N
6867	2011-06-07	\N	15	1	4	\N	\N	\N	490	\N	\N	\N	\N	\N	\N
6868	2011-06-07	\N	15	1	4	\N	\N	\N	390	\N	\N	\N	\N	\N	\N
6869	2011-06-07	\N	15	1	4	\N	\N	\N	4	\N	\N	\N	\N	\N	\N
6870	2011-06-07	\N	15	1	4	\N	\N	\N	3	\N	\N	\N	\N	\N	\N
6871	2011-06-07	\N	15	1	4	\N	\N	\N	0	\N	\N	\N	\N	\N	\N
6872	2011-06-07	\N	15	1	4	\N	\N	\N	6470	\N	\N	\N	\N	\N	\N
6873	2011-06-07	\N	15	1	4	\N	\N	\N	6490	\N	\N	\N	\N	\N	\N
6930	2011-06-09	\N	15	1	1	5	6900	\N	\N	\N	\N	\N	\N	\N	\N
6931	2011-06-09	\N	15	1	1	4	6900	\N	\N	\N	\N	\N	\N	\N	\N
6934	2011-06-09	\N	15	1	3	\N	\N	\N	6960	\N	\N	\N	\N	\N	\N
6935	2011-06-09	\N	15	1	8	\N	\N	\N	\N	\N	6970	\N	\N	\N	\N
6932	2011-06-09	\N	59	1	1	10	6901	\N	\N	\N	\N	\N	\N	\N	\N
6933	2011-06-09	\N	59	1	1	8	6901	\N	\N	\N	\N	\N	\N	\N	\N
7650	2011-06-21	\N	1	1	6	\N	\N	\N	\N	0	\N	\N	7630	\N	\N
7740	2011-06-21	\N	1	1	6	\N	\N	\N	\N	6240	\N	\N	7720	\N	\N
7960	2011-06-23	\N	1	1	4	\N	\N	\N	7431	\N	\N	\N	\N	\N	\N
8060	2011-06-23	\N	1	1	5	\N	\N	\N	\N	8040	\N	\N	\N	\N	\N
8120	2011-06-24	\N	1	1	11	\N	\N	\N	\N	\N	\N	\N	\N	8110	\N
8121	2011-06-24	\N	1	1	11	\N	\N	\N	\N	\N	\N	\N	\N	8111	\N
8140	2011-06-29	\N	1	1	11	\N	\N	\N	\N	\N	\N	\N	\N	8130	\N
8170	2011-06-30	\N	1	1	3	\N	\N	\N	8160	\N	\N	\N	\N	\N	\N
6936	2011-06-09	\N	15	1	10	\N	\N	\N	\N	\N	6970	\N	\N	\N	\N
6937	2011-06-09	\N	15	1	3	\N	\N	\N	6961	\N	\N	\N	\N	\N	\N
6938	2011-06-09	\N	15	1	3	\N	\N	\N	6962	\N	\N	\N	\N	\N	\N
6939	2011-06-09	\N	15	1	0	\N	3380	\N	\N	\N	\N	\N	\N	\N	\N
6980	2011-06-09	\N	15	1	4	\N	\N	\N	6961	\N	\N	\N	\N	\N	\N
7010	2011-06-09	\N	14	1	3	\N	\N	\N	7000	\N	\N	\N	\N	\N	\N
7011	2011-06-09	\N	14	1	8	\N	\N	\N	\N	\N	7030	\N	\N	\N	\N
7012	2011-06-09	\N	14	1	10	\N	\N	\N	\N	\N	7030	\N	\N	\N	\N
7013	2011-06-09	\N	14	1	0	\N	6770	\N	\N	\N	\N	\N	\N	\N	\N
7014	2011-06-09	\N	14	1	4	\N	\N	\N	7000	\N	\N	\N	\N	\N	\N
6800	2011-06-07	\N	15	1	1	5	6770	\N	\N	\N	\N	\N	\N	\N	\N
6801	2011-06-07	\N	15	1	1	4	6770	\N	\N	\N	\N	\N	\N	\N	\N
6802	2011-06-07	\N	15	1	1	5	6771	\N	\N	\N	\N	\N	\N	\N	\N
6803	2011-06-07	\N	15	1	1	4	6771	\N	\N	\N	\N	\N	\N	\N	\N
6860	2011-06-07	\N	15	1	4	\N	\N	\N	1260	\N	\N	\N	\N	\N	\N
6861	2011-06-07	\N	15	1	4	\N	\N	\N	1340	\N	\N	\N	\N	\N	\N
6862	2011-06-07	\N	15	1	4	\N	\N	\N	1341	\N	\N	\N	\N	\N	\N
7110	2011-06-10	\N	1	1	8	\N	\N	\N	\N	\N	7100	\N	\N	\N	\N
7111	2011-06-10	\N	1	1	10	\N	\N	\N	\N	\N	7100	\N	\N	\N	\N
7112	2011-06-10	\N	1	1	8	\N	\N	\N	\N	\N	7101	\N	\N	\N	\N
7113	2011-06-10	\N	1	1	10	\N	\N	\N	\N	\N	7101	\N	\N	\N	\N
7220	2011-06-11	\N	1	1	8	\N	\N	\N	\N	\N	7210	\N	\N	\N	\N
7221	2011-06-11	\N	1	1	10	\N	\N	\N	\N	\N	7210	\N	\N	\N	\N
7222	2011-06-11	\N	0	1	8	\N	\N	\N	\N	\N	7211	\N	\N	\N	\N
7223	2011-06-11	\N	0	1	10	\N	\N	\N	\N	\N	7211	\N	\N	\N	\N
7340	2011-06-13	\N	1	1	1	5	7310	\N	\N	\N	\N	\N	\N	\N	\N
7341	2011-06-13	\N	1	1	1	4	7310	\N	\N	\N	\N	\N	\N	\N	\N
7342	2011-06-13	\N	1	1	1	2	7310	\N	\N	\N	\N	\N	\N	\N	\N
7441	2011-06-15	\N	1	1	8	\N	\N	\N	\N	\N	7450	\N	\N	\N	\N
7442	2011-06-15	\N	1	1	10	\N	\N	\N	\N	\N	7450	\N	\N	\N	\N
7443	2011-06-15	\N	1	1	8	\N	\N	\N	\N	\N	7451	\N	\N	\N	\N
7444	2011-06-15	\N	1	1	10	\N	\N	\N	\N	\N	7451	\N	\N	\N	\N
8180	2011-07-01	\N	1	1	0	\N	5600	\N	\N	\N	\N	\N	\N	\N	\N
8230	2011-07-01	\N	1	1	11	\N	\N	\N	\N	\N	\N	\N	\N	8220	\N
7445	2011-06-15	\N	1	1	8	\N	\N	\N	\N	\N	7452	\N	\N	\N	\N
8340	2011-07-03	\N	1	1	6	\N	\N	\N	\N	8300	\N	\N	8320	\N	\N
7446	2011-06-15	\N	1	1	10	\N	\N	\N	\N	\N	7452	\N	\N	\N	\N
8470	2011-07-03	\N	1	1	6	\N	\N	\N	\N	8430	\N	\N	8450	\N	\N
7447	2011-06-15	\N	1	1	3	\N	\N	\N	7431	\N	\N	\N	\N	\N	\N
8520	2011-07-03	\N	1	1	4	\N	\N	\N	7930	\N	\N	\N	\N	\N	\N
8521	2011-07-03	\N	1	1	3	\N	\N	\N	8530	\N	\N	\N	\N	\N	\N
8522	2011-07-03	\N	1	1	8	\N	\N	\N	\N	\N	8540	\N	\N	\N	\N
8523	2011-07-03	\N	1	1	10	\N	\N	\N	\N	\N	8540	\N	\N	\N	\N
8610	2011-07-04	\N	1	1	4	\N	\N	\N	8600	\N	\N	\N	\N	\N	\N
8630	2011-07-10	\N	1	1	3	\N	\N	\N	8620	\N	\N	\N	\N	\N	\N
8640	2011-07-10	\N	1	1	4	\N	\N	\N	8620	\N	\N	\N	\N	\N	\N
8660	2011-07-10	\N	1	1	0	\N	8550	\N	\N	\N	\N	\N	\N	\N	\N
8680	2011-07-10	\N	1	1	0	\N	8550	\N	\N	\N	\N	\N	\N	\N	\N
8730	2011-07-10	\N	1	1	1	5	8700	\N	\N	\N	\N	\N	\N	\N	\N
8731	2011-07-10	\N	1	1	1	2	8700	\N	\N	\N	\N	\N	\N	\N	\N
8732	2011-07-10	\N	1	1	1	6	8700	\N	\N	\N	\N	\N	\N	\N	\N
8750	2011-07-12	\N	1	1	0	\N	8700	\N	\N	\N	\N	\N	\N	\N	\N
8751	2011-07-12	\N	1	1	0	\N	8700	\N	\N	\N	\N	\N	\N	\N	\N
8752	2011-07-12	\N	1	1	0	\N	8700	\N	\N	\N	\N	\N	\N	\N	\N
8753	2011-07-12	\N	1	1	0	\N	8700	\N	\N	\N	\N	\N	\N	\N	\N
8790	2011-07-12	\N	1	1	6	\N	\N	\N	\N	2	\N	\N	8770	\N	\N
8791	2011-07-12	\N	1	1	1	0	8800	\N	\N	\N	\N	\N	\N	\N	\N
8860	2011-07-12	\N	0	0	1	1	8840	\N	\N	\N	\N	\N	\N	\N	\N
8861	2011-07-12	\N	0	0	1	0	8840	\N	\N	\N	\N	\N	\N	\N	\N
8862	2011-07-12	\N	0	0	1	6	8840	\N	\N	\N	\N	\N	\N	\N	\N
8863	2011-07-12	\N	0	0	11	\N	\N	\N	\N	\N	\N	\N	\N	8880	\N
8864	2011-07-12	\N	0	0	1	7	8841	\N	\N	\N	\N	\N	\N	\N	\N
8865	2011-07-12	\N	0	0	1	9	8841	\N	\N	\N	\N	\N	\N	\N	\N
8866	2011-07-12	\N	0	0	11	\N	\N	\N	\N	\N	\N	\N	\N	8881	\N
\.


--
-- TOC entry 2429 (class 0 OID 16456)
-- Dependencies: 1695
-- Data for Name: estatus_aviso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_aviso (id_estatus_aviso, nombre_estatus_aviso, definicion_estatus_aviso) FROM stdin;
0	SIN_LEER	Estatus que toma un aviso cuando no ha sido leído por su destinatario.
1	LEIDO	Estatus que toma un aviso cuando ya fue leído por el destinatario.
\.


--
-- TOC entry 2430 (class 0 OID 16461)
-- Dependencies: 1697
-- Data for Name: estatus_ayuda_monetaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_ayuda_monetaria (id_estatus_ayuda_monetaria, nombre_estatus_ayuda_monetaria, definicion_estatus_ayuda_monetaria) FROM stdin;
0	INACTIVO	Este estatus de ayudamonetaria es es adquirido cuando no se necesita ayuda monetaria.
1	MUCHA_AYUDA	Este estatus de ayudamonetaria es es adquirido cuando se necesita mucha ayuda.
2	POCA_AYUDA	Este estatus de ayudamonetaria es es adquirido cuando se necesita poca ayuda.
3	CERO_AYUDA	Este estatus de ayudamonetaria es es adquirido cuando se necesita cero ayuda.
4	OFREZCO_AYUDA	Este estatus de ayudamonetaria es es adquirido cuando se ofrece ayuda.
\.


--
-- TOC entry 2431 (class 0 OID 16464)
-- Dependencies: 1698
-- Data for Name: estatus_ayuda_recursos_humanos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_ayuda_recursos_humanos (id_estatus_ayuda_recursos_humanos, nombre_estatus_ayuda_recursos_humanos, definicion_estatus_ayuda_recursos_humanos) FROM stdin;
0	INACTIVO	Este estatus de ayudarecursoshumanos es es adquirido cuando ésta está inhabilitada.
1	MUCHA_AYUDA	Este estatus de ayudarecursoshumanos es es adquirido cuando se necesita mucha ayuda.
2	POCA_AYUDA	Este estatus de ayudarecursoshumanos es es adquirido cuando se necesita poca ayuda.
3	CERO_AYUDA	Este estatus de ayudarecursoshumanos es es adquirido cuando se necesita cero ayuda.
4	OFREZCO_AYUDA	Este estatus de ayudarecursoshumanos es es adquirido cuando se ofrece ayuda.
\.


--
-- TOC entry 2432 (class 0 OID 16467)
-- Dependencies: 1699
-- Data for Name: estatus_bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_bitacora (id_estatus_bitacora, nombre_estatus_bitacora, definicion_estatus_bitacora) FROM stdin;
0	INACTIVO	Este estatus se aplica cuando no se ha permitido la publicación de una bitacora.
1	ACTIVO	Este estatus se aplica cuando ya se permitió la publicación de una bitacora.
2	SUSPENDIDO	Este es el estatus que toma una bitácora cuando ha sido suspendida por un administrador.
3	ELIMINADA	Este estatus de la bitácora implica que está lista para ser eliminada.
\.


--
-- TOC entry 2433 (class 0 OID 16472)
-- Dependencies: 1701
-- Data for Name: estatus_comunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_comunidad (id_estatus_comunidad, nombre_estatus_comunidad, definicion_estatus_comunidad) FROM stdin;
0	INACTIVA	Se refiere a cuando una comunidad está inactiva.
1	ACTIVA	Se refiere a cuando una comunidad está activa.
\.


--
-- TOC entry 2434 (class 0 OID 16477)
-- Dependencies: 1703
-- Data for Name: estatus_critica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_critica (id_estatus_critica, nombre_estatus_critica, definicion_estatus_critica) FROM stdin;
0	NO_LEIDA	Cuando una crítica tiene este estatus, implica que no ha sido leída por un administrador.
1	LEIDA	Cuando una crítica tiene este estatus, implica que ya fue leída por un administrador.
2	PENDIENTE	Cuando una crítica tiene esta estatus, implica que ya fue leída pero aún se considera su contenido. 
\.


--
-- TOC entry 2435 (class 0 OID 16482)
-- Dependencies: 1705
-- Data for Name: estatus_envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_envio (id_estatus_envio, nombre_estatus_envio, definicion_estatus_envio) FROM stdin;
0	SIN_ENVIAR	Se refiere a cuando no se ha hecho ningún intento por hacer el envío
1	ENVIADO	Se refiere a cuando el envío se ha hecho correctamente
2	ENVIO_FALLIDO	Se refiere a cuando el sistema intentó hacer el envío, pero no lo logró.
\.


--
-- TOC entry 2436 (class 0 OID 16487)
-- Dependencies: 1707
-- Data for Name: estatus_idea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_idea (id_estatus_idea, nombre_estatus_idea, definicion_estatus_idea) FROM stdin;
0	INACTIVA	Estatus que describe a una idea que aún no se ha activado.
1	ACTIVA	Estatus que describe a una idea que ya se activó.
2	SUSPENDIDA	Estatus que describe a una idea que por alguna razón ha sido suspendida por un administrador.
3	CONCLUIDA	Estatus que describe a una idea que ha sido concluida o su autor ha decidido desactivarla.
4	NO_APROBADA	Estatus de una idea cuando aún no ha sido aprobada por un administrador.
5	EN_EDICION	Estatus que toma una idea cuando el administrador la desaprueba.
6	ELIMINADA	Estatus que toma una idea cuando esta se considera eliminada.
\.


--
-- TOC entry 2437 (class 0 OID 16492)
-- Dependencies: 1709
-- Data for Name: estatus_integrante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_integrante (id_estatus_integrante, nombre_estatus_integrante, definicion_estatus_integrante) FROM stdin;
0	INACTIVO	Un integrante adquiere este estatus cuando el mismo decidio dejar la idea.
1	ACTIVO	Un integrante adquiere este estatus cuando sigue a cierta idea.
2	SUSPENDIDO	Un integrante adquiere este estatus cuando ha sido suspendido por el lider de la idea.
3	IDEA_CONCLUIDA	Un integrante adquiere este estatus cuando la idea seguida ha concluido.
\.


--
-- TOC entry 2438 (class 0 OID 16497)
-- Dependencies: 1711
-- Data for Name: estatus_invitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_invitacion (id_estatus_invitacion, nombre_estatus_invitacion, descripcion_estatus_invitacion) FROM stdin;
\.


--
-- TOC entry 2439 (class 0 OID 16502)
-- Dependencies: 1713
-- Data for Name: estatus_miembro_comunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_miembro_comunidad (id_estatus_miembro_comunidad, nombre_estatus_miembro_comunidad, definicion_estatus_miembro_comunidad) FROM stdin;
1	ACTIVO	Estatus adquirido cuando el usuario es miembro de alguna comunidad.
0	INACTIVO	Estatus adquirido cuando el usuario no se encuentra activo en cierta comunidad.
\.


--
-- TOC entry 2440 (class 0 OID 16509)
-- Dependencies: 1716
-- Data for Name: estatus_necesidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_necesidad (id_estatus_necesidad, nombre_estatus_necesidad, definicion_estatus_necesidad) FROM stdin;
1	CUBIERTA	Cuando una necesidad tiene este estatus, implica que ha sido cubierta.
0	NO_CUBIERTA	Cuando una necesidad tiene este estatus, implica que no ha sido cubierta.
\.


--
-- TOC entry 2441 (class 0 OID 16514)
-- Dependencies: 1718
-- Data for Name: estatus_pregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_pregunta (id_estatus_pregunta, nombre_estatus_pregunta, definicion_estatus_pregunta) FROM stdin;
0	ABIERTA	Una pregunta tendrá este estatus cuando aún no haya sido respondida o cancelada.
1	CERRADA	Una pregunta tendrá este estatus cuando haya sido respondida.
3	NO_APROBADA	Una pregunta que no ha sido aprobada por un administrador.
4	ANS_NO_APROBADA	Una pregunta con uns respuesta que aún no ha sido aprobada.
2	SUSPENDIDA	Una pregunta tendrá este estatus cuando haya sido cancelada.
5	ANS_DESECHADA	Una pregunta toma este estatus cuando una respuesta no cumple con las polítcas de LinkUAM
6	QUE_DESECHADA	Una pregunta adquiere este estatus cuando su contenido no cumple con las políticas de LinkUAM
\.


--
-- TOC entry 2442 (class 0 OID 16521)
-- Dependencies: 1721
-- Data for Name: estatus_reporte_abuso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_reporte_abuso (id_estatus_reporte_abuso, nombre_estatus_reporte_abuso, definicion_estatus_reporte_abuso) FROM stdin;
0	NO_LEIDO	Estado que toma un reporte de abuso cuando no ha sido leído/tratado por un administrador.
1	LEIDO	Estado que toma un reporte de abuso cuando ya fue tratado/leído por un administrador.
\.


--
-- TOC entry 2443 (class 0 OID 16526)
-- Dependencies: 1723
-- Data for Name: estatus_seguidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_seguidor (id_estatus_seguidor, nombre_estatus_seguidor, definicion_estatus_seguidor) FROM stdin;
0	INACTIVO	Este estatus se refiere a una relación inactiva entre un usuario y una idea.
1	ACTIVO	Este estatus se refiere a una relación activa entre un usuario y una idea.
\.


--
-- TOC entry 2444 (class 0 OID 16531)
-- Dependencies: 1725
-- Data for Name: estatus_ticket_registro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_ticket_registro (id_estatus_ticket_registro, nombre_estatus_ticket_registro, definicion_estatus_ticket_registro) FROM stdin;
0	SIN_USAR	Estatus que adquiere un ticket de registro cuando no ha sido utilizado
1	USADO	Estatus que adquiere un ticket de registro cuando ha sido utilizado
2	CANCELADO	Estatus que adquiere un ticket de registro cuando ha sido cancelado
\.


--
-- TOC entry 2445 (class 0 OID 16536)
-- Dependencies: 1727
-- Data for Name: estatus_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus_usuario (id_estatus_usuario, nombre_estatus_usuario, definicion_estatus_usuario) FROM stdin;
1	ACTIVO	Implica que un usuario está activo en el sistema
0	INACTIVO	Implica que un usuario está inactivo en el sistema
2	SUSPENDIDO	Implica que un usuario tiene suspensión temporal
3	ELIMINADO	Implica que un usuario ha sido eliminado
4	NO_APROBADO	Este estatus lo adquiere un usuario cuando ya se registró el sistema pero no ha realizado la confirmación.
\.


--
-- TOC entry 2477 (class 0 OID 18155)
-- Dependencies: 1788
-- Data for Name: frase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY frase (id_frase, texto_frase, autor_frase, ocupacion_autor_frase, votos_positivos_frase, votos_negativos_frase, calificacion_frase) FROM stdin;
2	A veces la mejor y única forma de matar a una idea, es ponerla en práctica.	Sydney J. Harris	Escritor	0	0	0
3	Ahora es solo una noción, pero creo que puedo obtener el dinero para transformarla en un concepto, y después convertirla en una idea.	Woody Allen	Director de cine	0	0	0
6	Comienzo teniendo una idea, entonces, se vuelve algo más.	Pablo Picasso	Artista	0	0	0
8	Cuando compones música, cuando escribes o simplemente cuando creas, es imprescindible que tomes tu idea y tengas sexo salvaje con ella, sin protección.	Lady Gaga	Cantante	0	0	0
9	Cuando preguntas a gente creativa como hicieron algo, se sienten un poco culpables porque ellos no lo hicieron realmente, solo observaron algo. Algo que pareció obvio para ellos después de un tiempo. Eso es porque fueron capaces de conectar las experiencias que tenían y sintetizar nuevas cosas.	Steve Jobs	Inventor	0	0	0
10	Cuando tu futuro llegue, ¿culparás a tu pasado?	Robert Half	Escritor	0	0	0
11	Cuando uno enseña, dos aprenden.	Robert Half	Escritor	0	0	0
13	De muchas ideas nuestras no nos habríamos enterado jamás, si no hubiésemos sostenido largas conversaciones con otros.	Noel Clarasó	Escritor	0	0	0
14	Debes tener una idea de lo que vas a hacer, pero debe ser muy vaga.	Pablo Picasso	Artista	0	0	0
17	El fracaso derrota a los perdedores e inspira a los ganadores.	Robert T. Kiyosaki	Inversionista	0	0	0
21	El hombre salvaje no tiene más que sentimientos; el civilizado tiene sentimientos e ideas.	Honoré de Balzac 	Novelista	0	0	0
22	El humano al que se le ocurre una idea nueva es un chiflado, hasta que la idea tiene éxito	Mark Twain	Humorista	0	0	0
23	El valor de una idea recae en el uso que se le de.	Thomas Alva Edison	Inventor	0	0	0
24	En las batallas te das cuenta que los planes son inservibles, pero hacer planes indispensable.	Dwight E. Eisenhower)	Presidente de Estados Unidos (1953, 1961)	0	0	0
25	En tanto haya alguien que crea en la idea, la idea vive.	J. Ortega y Gasset 	Filósofo	0	0	0
27	Es necesario un compromiso apasionado para entender algo a profundidad, masticarlo, no solo tragarlo rápidamente. La mayoría de la gente no se toma el tiempo necesario para hacerlo.	Steve Jobs	Inventor	0	0	0
28	Es por actos y no por las ideas que las personas viven. 	Anatole France	Poeta	0	0	0
29	Es una bestia feroz quien no comprende que las ideas no pueden combatirse a cañonazos.	Catalina De Aragón 	Reina de inglaterra (1509–1533)	0	0	0
30	Esta es mi respuesta a la brecha entre las ideas y la acción.	Hortense Calisher	Escritor	0	0	0
32	Hay espíritus aventureros que no esperan ni reciben sus ideas, sino del azar.	Joseph Jourbet 	Ensayista	0	0	0
33	Hay sólo dos tipos de estudiosos; Aquellos que aman a las ideas y quienes las odian. 	Emile Chartier	Filósofo	0	0	0
35	Jamás podrás resolver un problema en el mismo nivel donde fue generado.	Albert Einstein	Considerado como el científico más importante del siglo XX	0	0	0
37	La emisión de las ideas por la prensa, debe ser tan libre, como es libre en el hombre la facultad de pensar.	Benito Juárez	Presidente de México (1958-1972)	0	0	0
38	La falta de dinero no es obstáculo. La falta de una idea es un obstáculo. 	Ken Hakuta	Inventor	0	0	0
39	La gente que ve hacia abajo a otras personas, jamás termina siendo mirada hacia arriba.	Robert Half	Escritor	0	0	0
40	La habilidad para expresar una idea es tan importante como la idea en si misma.	Bernard Baruch	Estadista y consejero presidencial	0	0	0
41	La humanidad aprende menos de las ideas acertadas que de las malas experiencias.	Hjalmar Schacht 	Economista	0	0	0
42	La mayor innovación es un servicio excelente.	Tom Peters	Escritor	0	0	0
43	La mejor manera de tener una buena idea es tener montones de ideas. 	Randall Jarrell	Poeta	0	0	0
44	La mente humana trata de una idea nueva del mismo modo que el cuerpo trata a una proteína extraña; la rechaza. 	P. B. Medawar	Biólogo	0	0	0
45	Las buenas ideas no se adoptan automáticamente. Deben ser impulsadas a la práctica con valerosa paciencia. 	Hyman Rickover	Almirante de la marina de los Estados Unidos 	0	0	0
16	El concepto puede ser interesante y bien formado, pero a fin de ganar una calificación decente, la idea debe ser factible. 	Autor desconocido	null	0	0	0
46	Las escuelas deberían equipar a los estudiantes con los medios para perseguir sus propios sueños, porque los sueños son importantes.	Emily Mccartan	Filósofa	0	0	0
34	Invertir en conocimientos produce siempre los mejores beneficios.	Benjamin Franklin	Científico	0	0	0
20	El genio es perseverancia: 90% transpiración, 10% inspiración.	Thomas Alva Edison	Inventor	0	0	0
19	El futuro tiene muchos nombres: para los débiles es lo inalcanzable, para los miedosos es lo desconocido, para los valientes es una oportunidad .	Víctor Marie Hugo 	Poeta	0	0	0
18	El futuro pertenece a aquellos quiénes creen en la belleza de sus sueños.	Eleanor Roosevelt	Primera dama de Estados Unidos (1933 to 1945)	0	0	0
12	Da igual si piensas que puedes o que no puedes, tienes razón .	Henry Ford	Fundador de “Ford Motor Company”	0	0	0
7	Creatividad es solo conectar cosas.	Steve Jobs	Inventor	0	0	0
4	Casi todo lo que realice será insignificante, pero es muy importante que lo haga.	Mahatma Gandhi	Líder político e ideológico de la India durante su movimiento de independencia.	0	0	0
26	Es maravilloso tener mente de principiante.	Steve Jobs	Inventor	0	0	0
15	El análisis de lo obvio exige una mente muy fuera de lo común.	Alfred North Whitehead	Filósofo	0	0	0
1	A una idea, como a los fantasmas, hay que hablarle un poco, antes de que se presente a si misma.	Charles Dickens	Novelista	0	0	0
31	Hacer algo al respecto. Si no funciona, haga otra cosa. Ninguna idea es demasiado loca. 	Jim Hightower	Escritor	0	0	0
5	Casi todos los que desarrollan una idea trabajan en ella hasta el punto donde esta parece imposible, entonces se desaniman. Mal lugar para desanimarse.	Thomas Alva Edison	Inventor	0	0	0
47	Las grandes ideas siempre reciben oposición violenta de mentes mediocres.	Albert Einstein	Considerado como el científico más importante del siglo XX	0	0	0
48	Las ideas deben compensarse, contrastarse, equilibrarse e incluso, destruirse recíprocamente.	Miguel de Unamuno	Filósofo	0	0	0
49	Las ideas envejecen más de prisa que los hombres	Gustavo Lebon	Psicólogo	0	0	0
50	Las ideas geniales son aquellas que nos sorprende que no se nos hayan ocurrido antes.	Noel Clarasó	Escritor	0	0	0
51	Las ideas no duran mucho. Hay que hacer algo con ellas.	Santiago Ramón y Cajal	Neurólogo	0	0	0
52	Las ideas no se guardan. Algo debe hacerse por ella. Cuando una idea es nueva, sus guardianes viven por ella, y de ser necesario, morirán por ella.	Alfred North Whitehead	Filósofo	0	0	0
53	Las ideas se encienden unas con otras como chispas eléctricas.	Johann Jakob Engel 	Filósofo	0	0	0
54	Las ideas son capitales que sólo ganan intereses entre las manos del talento.	Antoine de Rivarol	Escritor	0	0	0
55	Las ideas son como los conejos. Tienes un par, aprendes a manejarlos, y muy pronto tendrás una docena. 	John Steinbeck	Escritor	0	0	0
56	Las ideas son fuerzas.	Friedrich Nietzsche	Filósofo	0	0	0
57	Las ideas son grandes flechas pero debe de existir un arco.	Bill Moyers	Escritor	0	0	0
58	Las ideas, como las pulgas, saltan de un hombre a otro. Pero no pican a todo el mundo.	Stanislaw Lem	Escritor	0	0	0
59	Las mejores ideas son de propiedad común. 	Lucio Anneo Séneca	Filósofo	0	0	0
60	Las nuevas ideas fallan por ser nuevas y desconocidas. Las viejas ideas fallan por ser viejas y demasiado conocidas.	Ricardo Sosa	Investigador en el Instituto Tecnológico y de Estudios Superiores de Monterrey	0	0	0
63	Lo que es digno de hacerse, es digno de que se haga bien.	Conde de Chesterfield 	Político y escritor	0	0	0
64	Los factores más poderosos en el mundo son las ideas claras en la mente de los enérgicos hombres de buena voluntad. 	Arthur J. Thomson	Naturalista	0	0	0
66	Nadie ha tenido una idea vestido de traje. 	Sir Frederick G. Banting	Médico	0	0	0
67	Nadie realmente sabe nada. No hay expertos. Todos los expertos se han equivocado. Hay una tremenda posibilidad para todo. Posibilidad que no ha sido confinada, o definida, en demasiadas formas. Eso es maravilloso.	Steve Jobs	Inventor	0	0	0
70	No existe en el mundo nada más poderoso que una idea a la que le ha llegado su tiempo.	Víctor Marie Hugo 	Poeta	0	0	0
71	No hay nada más peligroso que una idea cuando es la única que tienes.	Emile Chartier	Filósofo	0	0	0
72	No hay una buena idea que no pueda ser mejorada.	Michael Eisner	Ejecutivo de “The Walt Disney Company”	0	0	0
73	No he fracasado. He encontrado 10 mil formas que no funcionan.	Thomas Alva Edison	Inventor	0	0	0
77	No tengo idea de lo que estoy escribiendo hasta que acabo. La creación artística es espontánea.	Eugene Ionesco	Dramaturgo y escritor	0	0	0
82	Pensar es fácil, actuar es dificil, poner nuestros propios pensamientos en acción es la cosa más dificil del mundo.	Johann Wolfgang Von Goethe	Escritor	0	0	0
83	Pon el argumento en una forma concreta, en una imagen, alguna frase fuerte, redonda y sólida como una pelota, algo que ellos puedan ver, manejar y llevar a casa. Entonces tu causa tendrá ya la mitad de la victoria.	Ralph Waldo Emerson	Poeta	0	0	0
84	Puedes matar una idea, pero no puedes matar una idea.	Medgar Evers	Activista	0	0	0
85	Quien le teme a la idea, acaba por perder también el concepto.	Johann Wolfgang Von Goethe	Escritor	0	0	0
86	Se oye sin buscar nada, se recibe sin preguntar lo que buscamos. Semejante a un relámpago, la idea brota absoluta, necesaria, sin dudas ni vacilación.	Friedrich Nietzsche	Filósofo	0	0	0
89	Si quieres matar a una idea, pon a un comité a trabajar en ella.	Charles Kettering	Inventor	0	0	0
90	Si robar ideas de una sola fuente, es el plagio, pero si robas ideas de más de una fuente, es investigación. 	Laurendo Almeida	Músico	0	0	0
91	Si ya sabes lo que tienes que hacer y no lo haces entonces estás peor que antes.	Confucio	Filósofo	0	0	0
92	Solamente aquel que construye el futuro tiene derecho a juzgar el pasado.	Friedrich Nietzsche	Filósofo	0	0	0
93	Sólo las ideas salvan las razas.	Ralph Waldo Emerson	Poeta	0	0	0
75	No nos atrevemos a muchas cosas porque son difíciles...pero son difíciles porque no nos atrevemos a hacerlas.	Lucio Anneo Séneca	Filósofo	0	0	0
62	Lo imposible es el fantasma de los tímidos y el refugio de los cobardes.	Napoleon	Militar y líder político en Francia.	0	0	0
87	Si quieres hacer triunfar una idea, envuélvela en una persona.	Ralph Johnson	Científico	0	0	0
80	Nunca dejes que tus recuerdos sean mejores que tus sueños .	Doug Ivester	Ejecutivo en Coca-Cola Company	0	0	0
79	Nunca andes por el camino trazado, pues te conducirá únicamente hacia donde los otros fueron.	Alexander Graham Bell	Científico, inventor.	0	0	0
78	Nuestra gloria más grande no consiste en no haberse caido nunca, sino en haberse levantado después de cada caída.	Confucio	Filósofo	0	0	0
69	No es cierto que la gente deje de perseguir sus sueños porque envejece, más bien envejece cuando deja de perseguir sus sueños.	Gabriel García Márquez	Novelista	0	0	0
68	No eres tu trabajo, no eres tu cuenta bancaria, no eres el coche que tienes, no eres el contenido de tu billetera, no eres tus malditos pantalones. ¡Eres la mierda cantante y danzante del mundo!	Película, Fight Club (1999)	\N	0	0	0
61	Las personas no son recordadas por el número de veces que fracasan, sino por el número de veces que tienen éxito.	Thomas Alva Edison	Inventor	0	0	0
76	No puedo entender por qué las personas tienen miedo de las nuevas ideas. Yo estoy asustado de las antigüas.	John Cage	Filósofo	0	0	0
65	Morir por una idea; Es, sin duda, noble. Pero, ¿cuánto más noble sería si los hombres muriesen por ideas que fueran ciertas! 	H. L. Mencken	Escritor	0	0	0
95	Todas las grandes ideas son peligrosas. 	Randall Jarrell	Poeta	0	0	0
97	Todo aquello que puedas hacer o sueñes que puedes hacer: ¡lánzate y hazlo! La osadía lleva consigo genio, poder y magia.	Johann Wolfgang Von Goethe	Escritor	0	0	0
98	Todo comienza con una idea.	Earl Nigthingale	Padre de la Superación personal	0	0	0
99	Todo compositor conoce la angustia y la desesperación ocasionada por olvidar ideas que uno no tiene tiempo para escribir. 	Hector Berlioz	Compositor musical	0	0	0
100	Todo el mundo es un genio, por lo menos una vez al año.	Georg Christoph Lichtenberg	Científico	0	0	0
101	Todos los que se bañan tienen ideas. Son solo aquellos que al terminar de bañarse, se secan y hacen algo con esa idea quienes harán la diferencia.	Nolan Bushnell	Emprendedor	0	0	0
102	Trabajar una buena idea es mejor que solo tenerla.	Robert Half	Escritor	0	0	0
103	Trincheras de ideas valen mucho más que trincheras de piedra.	José Martí	Filósofo	0	0	0
106	Tuve una idea monumental esta mañana, pero no me gustó. 	Samuel Goldwyn	Productor de cine	0	0	0
108	Una idea es la salvación de la imaginación. 	Frank Lloyd Wright	Arquitecto	0	0	0
109	Una idea es un meteoro.	Víctor Marie Hugo 	Poeta	0	0	0
110	Una idea es un pensamiento o un concepto que surge en la mente de una persona como resultado de pensar.	null	null	0	0	0
111	Una idea es un punto de partida, y nada más. 	Pablo Picasso	Artista	0	0	0
113	Una idea no es responsable de la gente que cree en ella.	Don Marquis	Humorista	0	0	0
114	Una idea poderosa comunica algo de su fuerza al que osa retarla.	Marcel Proust	Novelista	0	0	0
115	Una idea que no corre riesgos no merece ser llamada idea.	Oscar Wilde	Escritor	0	0	0
116	Una idea real se mantiene en constante cambio y aparece en muchos lugares.	Mason Cooley	Aforista	0	0	0
117	Una invasión de los ejércitos puede ser resistida, pero no una idea cuyo momento ha llegado. 	Víctor Marie Hugo 	Poeta	0	0	0
120	Uno de los mayores dolores de la naturaleza humana es el dolor de una nueva idea. 	Walter Bagehot	Economista	0	0	0
121	Usted me pregunta si sigo un bloc de notas para registrar mis grandes ideas. Sólo he tenido una.	Aristóteles	Filósofo	0	0	0
122	Y la razón por la que ellos fueron capaces de lograrlo es porque tenían más experiencias o aprendieron más de ellas que otras personas.	Steve Jobs	Inventor	0	0	0
0	A menudo reusamos aceptar una idea simplemente porque el tono de voz en el que ha sido expresada no nos simpatiza.	Friedrich Nietzsche	Filósofo	0	0	0
94	Sólo triunfa en el mundo quien busca a las circunstancias y las crea si no las encuentra.	George Bernard Shaw	Dramaturgo y escritor	0	0	0
81	Nunca he perfeccionado un invento en el que no pensara en términos de su utilidad para los demás… averiguo lo qué necesita el mundo, luego procedo a inventar .	Thomas Alva Edison	Inventor	0	0	0
123	Actua como si fuera imposible fracasar.	Dorothy Bryant	Escritora	0	0	0
118	Una persona que nunca cometió un error jamás probó nada nuevo.	Albert Einstein	Considerado como el científico más importante del siglo XX	0	0	0
119	Una vela no pierde su luz por compartirla con otra.	Película, Schindler's List (1993)	null	0	0	0
107	Un creador ejercita su mente en tratar de convertir en conocido lo extraño y extraño lo desconocido.	Teresa Amabile	Psicóloga	0	0	0
105	Tú tienes que estar con la obra, y la obra tiene que estar contigo. La obra te absorve totalmente, y tú la absorves totalmente.	Louise Nevelson	Artista	0	0	0
104	Tu tiempo está limitado. No lo desprecies viviendo el sueño de otra persona.	Steve Jobs	Inventor	0	0	0
96	Todas las ideas realmente buenas que he tenido en mi vida aparecieron mientras ordeñaba una vaca.	Grant Good	Pintor	0	0	0
36	La creatividad es muy importante en la vida: te da diversidad. Si eres creativo, pruebas diferentes maneras de hacer cosas y cometes muchos errores también. Pero si tienes valentía de continuar a pesar de tus errores, obtendrás la respuesta.	Bill Fitzpatrick	Pintor	0	0	0
124	Cada produccion de un genio, constituye el producto de su entusiasmo.	Benjamin Franklin	Científico	0	0	0
\.


--
-- TOC entry 2446 (class 0 OID 16543)
-- Dependencies: 1730
-- Data for Name: idea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY idea (id_idea, estatus_idea_id, estatus_ayuda_recursos_humanos_id, estatus_ayuda_monetaria_id, titulo_idea, fecha_creacion_idea, resumen_idea, nombre_imagen, usuario_id, votos_positivos_idea, votos_negativos_idea, calificacion_idea, contenido_idea, lugar_id, activa) FROM stdin;
7310	5	4	0	Hoy no te salva ni el vaticano	2011-06-13	\N	7310-0.png	0	0	0	0	<meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #444444; font-family: 'Trebuchet MS', Trebuchet, sans-serif; line-height: 19px; "><h2 class="underline-dotted" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-left: 0px; font-size: 15.6px; font-weight: bold; line-height: 21.8px; color: #000000; padding-bottom: 5px; border-bottom-width: 2px; border-bottom-style: dotted; border-bottom-color: #88dd00; ">En qué estamos</h2><div class="twitter-box" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 16px; padding-right: 18px; padding-bottom: 16px; padding-left: 18px; "><h3 style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; font-size: 14.4px; font-weight: bold; line-height: 18px; color: #000000; ">En Twitter</h3><ul class="twitter-feed" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 10px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-position: initial; list-style-image: initial; list-style-type: none; "><li style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "><img  class="rounded-corners-5 twitter-image" width="48" height="48" src="http://a2.twimg.com/profile_images/1097037454/moo_normal.png" alt="@overheardatmoo" style="border-top-width: 4px; border-right-width: 0px; border-bottom-width: 4px; border-left-width: 4px; border-style: initial; border-color: initial; border-top-left-radius: 5px 5px; border-top-right-radius: 5px 5px; border-bottom-right-radius: 5px 5px; border-bottom-left-radius: 5px 5px; position: absolute; display: block; margin-top: 5px; border-top-style: solid; border-top-color: #dddddd; border-bottom-style: solid; border-bottom-color: #dddddd; border-left-style: solid; border-left-color: #dddddd; "><div class="twitter-quote rounded-corners-5" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 50px; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; border-top-left-radius: 5px 5px; border-top-right-radius: 5px 5px; border-bottom-right-radius: 5px 5px; border-bottom-left-radius: 5px 5px; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: #dddddd; border-right-color: #dddddd; border-bottom-color: #dddddd; border-left-color: #dddddd; box-shadow: #cccccc 0px 0px 4px; -webkit-box-shadow: #cccccc 0px 0px 4px; "><img  src="http://uk.moo.com/images/about/community/twitter-speech.png" alt="" width="7" height="14" class="twitter-speech" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; position: absolute; margin-top: 16px; margin-right: -17px; margin-bottom: 16px; margin-left: -17px; z-index: 10; "><blockquote style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ">Here's some stunning architecture for you to 'Ooh' and 'Aah' over whilst you munch your lunch:<a rel="external" target="_blank" href="http://moo.com/link/h78s" style="text-decoration: none; color: #66aa00; ">http://moo.com/link/h78s</a></blockquote><p style="margin-top: 5px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ">12 hours ago</p></li><li style="margin-top: 0px; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "><img  class="rounded-corners-5 twitter-image" width="48" height="48" src="http://a2.twimg.com/profile_images/1097037454/moo_normal.png" alt="@overheardatmoo" style="border-top-width: 4px; border-right-width: 0px; border-bottom-width: 4px; border-left-width: 4px; border-style: initial; border-color: initial; border-top-left-radius: 5px 5px; border-top-right-radius: 5px 5px; border-bottom-right-radius: 5px 5px; border-bottom-left-radius: 5px 5px; position: absolute; display: block; margin-top: 5px; border-top-style: solid; border-top-color: #dddddd; border-bottom-style: solid; border-bottom-color: #dddddd; border-left-style: solid; border-left-color: #dddddd; "><div class="twitter-quote rounded-corners-5" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 50px; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; border-top-left-radius: 5px 5px; border-top-right-radius: 5px 5px; border-bottom-right-radius: 5px 5px; border-bottom-left-radius: 5px 5px; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: #dddddd; border-right-color: #dddddd; border-bottom-color: #dddddd; border-left-color: #dddddd; box-shadow: #cccccc 0px 0px 4px; -webkit-box-shadow: #cccccc 0px 0px 4px; "><img  src="http://uk.moo.com/images/about/community/twitter-speech.png" alt="" width="7" height="14" class="twitter-speech" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; position: absolute; margin-top: 16px; margin-right: -17px; margin-bottom: 16px; margin-left: -17px; z-index: 10; "><blockquote style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ">Another overcast Monday here at MOO HQ. Maybe some typography movie posters will cheer us up:<a rel="external" target="_blank" href="http://moo.com/link/h78r" style="text-decoration: none; color: #66aa00; ">http://moo.com/link/h78r</a></blockquote><p style="margin-top: 5px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ">13 hours ago</p></li></ul><p style="margin-top: 15px; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; "><img  class="twitter-t" src="http://uk.moo.com/images/icon-twitter-18x18.png" alt="" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; vertical-align: middle; margin-right: 5px; ">Más en<a href="http://twitter.com/overheardatmoo" class="twitter-link" style="text-decoration: underline; color: #66aa00; ">@overheardatMOO</a></p><div class="community-box" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 16px; padding-right: 18px; padding-bottom: 16px; padding-left: 18px; border-top-width: 2px; border-top-style: solid; border-top-color: #dddddd; "><h2 style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-left: 0px; font-size: 15.6px; font-weight: bold; line-height: 21.8px; color: #000000; padding-bottom: 5px; ">En nuestro blog</h2><a href="http://www.moo.com/blog/2010/05/05/maximum-impact-minimal-fuss/" class="large" style="text-decoration: none; color: #66aa00; font-size: 14.4px; line-height: 20px; ">Máximo impacto, sin complicaciones</a><p class="clearfix" style="margin-top: 15px; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; display: block; line-height: 1.4em; "><img  src="http://uk.moo.com/images/about/comunity/icon.jpg?q=1-2232128110396381691" width="120" height="100" alt="Sergeant Butterman, the little hand says it's time to rock and roll!" title="Sergeant Butterman, the little hand says it's time to rock and roll!" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; float: left; padding-top: 0px; padding-right: 10px; padding-bottom: 0px; padding-left: 0px; ">Fotógrafos que buscan una forma sencilla de ponerse en primera fila. La gama de productos de MOO ofrece un excelente medio para presentar tu trabajo.</p><p class="large rss" style="margin-top: 15px; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding-top: 4px; padding-right: 0px; padding-bottom: 4px; padding-left: 36px; font-size: 14.4px; line-height: 1.4em; background-image: url(http://uk.moo.com/images/about/community/rss.jpg?q=e5f6f065c23f7b46c522b1b2f52ddb3f); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: 0% 50%; background-repeat: no-repeat no-repeat; ">Última entrada del<a href="http://www.moo.com/feed/" style="text-decoration: underline; color: #66aa00; ">blog de MOO</a></p><div class="also-find" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 16px !important; padding-right: 0px !important; padding-bottom: 0px !important; padding-left: 0px !important; border-top-width: 2px; border-top-style: solid; border-top-color: #dddddd; "><h2 style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-left: 0px; font-size: 15.6px; font-weight: bold; line-height: 21.8px; color: #000000; padding-bottom: 5px; ">También estamos en:</h2><ul class="large community-sociallist" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-position: initial; list-style-image: initial; list-style-type: none; font-size: 14.4px; line-height: 20px; "><li class="delicious" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 8px; padding-right: 0px; padding-bottom: 8px; padding-left: 36px; background-image: url(http://uk.moo.com/images/about/community/delicious.png?q=e5f6f065c23f7b46c522b1b2f52ddb3f); background-position: 0% 50%; background-repeat: no-repeat no-repeat; "><a href="http://delicious.com/MooHQ" style="text-decoration: none; color: #66aa00; ">Delicious</a></li><li class="facebook" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 8px; padding-right: 0px; padding-bottom: 8px; padding-left: 36px; background-image: url(http://uk.moo.com/images/about/community/facebook.png?q=e5f6f065c23f7b46c522b1b2f52ddb3f); background-position: 0% 50%; background-repeat: no-repeat no-repeat; "><a href="http://www.facebook.com/pages/moocom/7525138134" style="text-decoration: none; color: #66aa00; ">Facebook</a></li><li class="livejournal" style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 8px; padding-right: 0px; padding-bottom: 8px; padding-left: 36px; background-image: url(http://uk.moo.com/images/about/community/livejournal.png?q=e5f6f065c23f7b46c522b1b2f52ddb3f); background-position: 0% 50%; background-repeat: no-repeat no-repeat; "><a href="http://moocards.livejournal.com/" style="text-decoration: none; color: #66aa00; ">Live Journal</a></li></ul></span>	\N	\N
6000	1	2	0	Pasar podcast a profesora	2011-05-31	Podcast!!	6000-0.png	5970	9	8	2.6499999999999999	<strong><font style="font-size: 26px; ">Podcast!!Podcast!!Podcast!!Podcast!!Podcast!!Podcast!!Podcast!!</font></strong>	\N	\N
5	1	4	2	Licitación. Doy servicio social. Gestión de contenido blog.	2011-02-17	El habla de un artículo periodístico es sencillo, puesto que no necesita que se explique a profundidad, sino que se exponga desde un punto de vista hacia los demás con fines de buscar su opinión sobre el tema.	143.jpg	5	52	8	3.6699999999999999	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
8	1	3	1	Escuchar a 2Pac, dicen que es bueno	2011-04-01	La verdad no me gusta mucho 2pac, pero ps que le vamos a hacer???	213.jpg	1	81	13	4.3099999999999996	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
6210	5	2	0	Idea de prueba 8	2011-05-31	ssadsdsafdsafdsa	6210-0.png	6190	1	0	5	fdsafdsafdsafdsafdsafdsa	\N	\N
6611	1	4	0	El camino del guerrero	2011-06-06	Pinches Hipsters!!	6611-0.png	2	1	0	5	<meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 903px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">Describe claramente las características de tu idea y con el mayor detalle posible</span></td><td><span id="form:wizart:counterInputContenidoIdea" style="font-size: 17pt; color: gray; ">100% de espacio libre para este contenido</span></td></tr></tbody></table></span>	\N	\N
8840	5	0	0	Conseguir un control para la 360	2011-07-12	\N	8840-0.png	5670	0	0	0	¿Trueque?	\N	f
5540	1	2	0	fdsadfsafdsafds	2011-05-30	fdsfdsafdsa	5540-0.png	5520	0	0	0	fdsafdsafdsafdsa	\N	\N
3380	1	4	0	Nueva idea	2011-05-08	Resumen de la nueva idea	3380-0.png	0	0	0	0	Esta ves fue buena decisión.	\N	t
3381	1	2	0	Rosa pastel	2011-05-08	xD	3381-0.png	0	0	0	0	fsdfgdafdsafdsafdsfds	\N	t
1960	1	0	0	José José patrimonio de la humanidad	2011-05-03	Escribe una breve descripción de tu idea. Recuerda que esta descripción será usada para mostrar una "versión corta" de esta cuando se requiera. La sección "Contenido de la idea" tendrás la oportunidad de extender más (mucho más) esta descripción.	1960-0.png	0	0	0	0	<strong style="font-size: 20px;">El plan es volver en el tiempo para rescatar al buen José José</strong><br><span style="color: #ff00ff; font-size: 16px;">Escribe una breve descripción de tu idea. Recuerda que esta descripción será usada para mostrar una "versión corta" de esta cuando se requiera. La sección "Contenido de la idea" tendrás la oportunidad de extender más (mucho más) esta descripción.</span>	\N	t
2210	1	3	0	ñlkjmnhbgvfdc	2011-05-03	hgytvfrdcsxgfdgdfsgdfgdfgdfgddfg	2210-0.png	0	0	0	0	ggdfgfdgfdgfdsgfdgfs	\N	t
0	1	4	2	Comprar y vender.	2011-02-17	Un artículo es un texto que presenta la postura personal de un periodista frente a un acontecimiento, un problema actual o de interés general. Mediante estos textos se pretende muchas veces influir en la opinión de los lectores. Para lograrlo el escritor emplea argumentos o razones que seducen al lector acercándolo a su postura, persuadiéndolo a un tema o hecho. superextráísimo	222.jpg	0	13	0	5	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
7	1	4	2	Experimento con pigmentos naturales. No peligroso. Servicio social.	2011-02-17	Esta página de discusión debe ser usada exclusivamente para proponer y debatir sobre mejoras del artículo Artículo periodístico.\nNo escribas reflexiones no enfocadas al desarrollo del artículo ya que Wikipedia no es un foro. 	256.jpg	0	24	12	1.6699999999999999	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
6610	1	3	0	Escuchar todos los podcast de Olallo Rubio	2011-06-06	alto por 299 pixeles de ancho.\r\nSOLO IMÁGENES CON UN TAMAÑO MENOR A 3MB	6610-0.png	5670	0	0	0	<meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 582px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">alto por 299 pixeles de ancho.</span></td></tr><tr><td><span style="width: 0px; font-weight: bold !important; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-style: initial; border-color: initial; border-top-style: outset; border-right-style: outset; border-bottom-style: outset; border-left-style: outset; ">SOLO IMÁGENES CON UN TAMAÑO MENOR A 3MB</span></td></tr></tbody></table></span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 582px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">alto por 299 pixeles de ancho.</span></td></tr><tr><td><span style="width: 0px; font-weight: bold !important; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-style: initial; border-color: initial; border-top-style: outset; border-right-style: outset; border-bottom-style: outset; border-left-style: outset; ">SOLO IMÁGENES CON UN TAMAÑO MENOR A 3MB</span></td></tr></tbody></table></span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 582px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">alto por 299 pixeles de ancho.</span></td></tr><tr><td><span style="width: 0px; font-weight: bold !important; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-style: initial; border-color: initial; border-top-style: outset; border-right-style: outset; border-bottom-style: outset; border-left-style: outset; ">SOLO IMÁGENES CON UN TAMAÑO MENOR A 3MB</span></td></tr></tbody></table></span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 582px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">alto por 299 pixeles de ancho.</span></td></tr><tr><td><span style="width: 0px; font-weight: bold !important; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-style: initial; border-color: initial; border-top-style: outset; border-right-style: outset; border-bottom-style: outset; border-left-style: outset; ">SOLO IMÁGENES CON UN TAMAÑO MENOR A 3MB</span></td></tr></tbody></table></span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 582px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">alto por 299 pixeles de ancho.</span></td></tr><tr><td><span style="width: 0px; font-weight: bold !important; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-style: initial; border-color: initial; border-top-style: outset; border-right-style: outset; border-bottom-style: outset; border-left-style: outset; ">SOLO IMÁGENES CON UN TAMAÑO MENOR A 3MB</span></td></tr></tbody></table></span>	\N	t
8841	5	0	0	Comenzar nuevos prototipos de ideas	2011-07-12	\N	8841-0.png	5670	0	0	0	Desarrollar!!<br>Desarrollar!!Desarrollar!!Desarrollar!!Desarrollar!!Desarrollar!!	\N	f
6710	1	4	0	Introduce un buen título para tu idea\t	2011-06-06	rlo es opcional. Tu imagen será escalad	6710-0.png	2	1	1	2.5	<meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; ">rlo es opcional. Tu imagen será escalad</span>	\N	\N
8550	1	1	0	Juntar a mis primos	2011-07-03	\N	8550-0.png	8430	0	0	0	Juntar a mis primos puesto que están bastante despegados unos de otros.	\N	\N
5810	3	1	0	zzzzzzzzzzzzzzzzzzzzzz	2011-05-31	yyyyyyyyyyyyyyyyyyyyyy	5810-0.png	5670	1	0	5	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	\N	\N
6211	1	4	0	Idea de prueba 88	2011-05-31	gfdsagfdgfdsgfdsgfdsgfds	6211-0.png	2	0	1	0	gfdsgfdsgfdsgfdsgfds	\N	\N
4041	1	2	0	Now you see it now you don't!!!	2011-05-16	Mi celular ya no suena como antes. Realmente necesitamos modificarlo para tener un buen despertador!!! :)	4041-0.png	2	9	2	4.0899999999999999	<font style="font-size: 31px; "><strong>Singing under the rain!!</strong><br><br><meta http-equiv="content-type" content="text/html; charset=utf-8"><div style="padding-top: 7px; padding-right: 7px; padding-bottom: 7px; padding-left: 7px; background-color: #ffffff; font: normal normal normal 13px/1.22 arial, helvetica, clean, sans-serif; line-height: normal; font-size: medium; "><font style="font-size: 21px; ">Singing under the rain!!</font><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 21px; ">Singing under the rain!!</span><span style="font-size: 13px; line-height: 15px; "><img  src="http://1.bp.blogspot.com/-DyKers8a3z8/TZYt4S1P5_I/AAAAAAAAHss/kMZBhgfBs1Q/s1600/Hermosa%2BBeach.jpg" class=" selected" style="width: 640px; height: 480px; " alt=""></span></font><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta http-equiv="content-type" content="text/html; charset=utf-8">	\N	\N
5750	1	3	0	Realizar una consola de admin para LinkUAM	2011-05-31	Será necesario por el tipo de sistema....	5750-0.png	5730	3	1	3.75	<strong><font style="font-size: 34px; ">Será necesario por el tipo de sistema....<br></font></strong><br><font style="font-size: 27px; ">Seeeeee, hagámosla.</font>	\N	\N
5600	1	2	0	eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee	2011-05-30	iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii	5600-0.png	0	5	0	5	ooooooooooooooooooooooooooooooooo	\N	t
3310	0	4	0	Si no lo interrumpe, yo soy felíz	2011-05-07	fdsafdsafdsafdsafdsafdsfdsfds	3310-0.png	0	5	4	2.7799999999999998	fdsfdsfdsafdsfdsafdsafdsafdsa	\N	f
8380	1	0	0	Nueva idea para comprobar nueva independencia de sistema.	2011-07-03	\N	8380-0.png	5670	0	0	0	Pues es solo para comprobar la funcionalidad de los nuevos cambios.	\N	t
4042	1	2	0	Cmoon	2011-05-16	I can see	4042-0.png	1	7	6	2.6899999999999999	fdsafdsafdsa	\N	\N
6212	1	2	0	Idea de prueba 77	2011-05-31	fdsfadsafdsaff	6212-0.png	2	4	6	2	fdsafdsafdsafds	\N	\N
3	1	4	2	Proyecto relacionado con minería de datos y desertación de las escuelas.	2011-02-17	Es un texto que expresa la opinión que redacta el mismo público al cual es dirigido, con la finalidad de encontrar en el lector la formación de la opinión y el conocimiento del tema.	12.jpg	3	44	46	-0.11	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
6770	1	3	0	Camo a portar mal!!Camo a portar mal!!	2011-06-07	Por eso aguantan cualquier clima!!	6770-0.png	0	1	1	2.5	Por eso aguantan cualquier clima!!Por eso aguantan cualquier clima!!Por eso aguantan cualquier clima!!Por eso aguantan cualquier clima!!Por eso aguantan cualquier clima!!Por eso aguantan cualquier clima!!Por eso aguantan cualquier clima!!	\N	t
5010	1	1	0	Una nueva propuesta de Maestría en Ingeniería de Sistemas de Información 	2011-05-24	Esta nueva maestría proporcionará a los Ingenieros en Computación habilidades para el análisis, diseño y construcción de Sistemas de Información de gran envergadura.	5010-0.png	0	2	1	3.3300000000000001	<div style="text-align: center;"><strong><font style="font-size: 22px; ">Planear...<br><br></font></strong><div>Definir un lugar estandar para la agregaci'on de mensajes<div>fffhhfjsfkjshf<br>Usar framework para ajax<div>Definir estrategia para ver que hacer cuando se termina la sesi'on<br><div>Cuando se trate de funcionalidades en una misma p'agina, sin salir de ella (AJAX), es mejor no depender de la instancia HOME que se est'a editando en ese momento. Es decir, si votamos por una idea y en nuestro backbean llenamos el campo "idea" con ideaHome actual, este objeto podr'ia arruinarse y ya no permitir otras funcionalidades.&nbsp;<div>Es mejor, hacer m'etodos que envien el id de la idea, que una NUEVA idea (que es copia de la actual) se obtenga en el backbean y operar sobre ella.<br><div>Averiguar como demonios funciona la parte de process y update de primefaces....a veces da demasiados problemas.<br><div>TODO lo relacionado con identidad y roles, manejarlo a través de Identity.<br><div>Utilizar TRAN-SACC-IONES, pensar en transacciones cuando "crea" que necesito una lista temporal...<br><div>Planificar un protocolo para trabajar con dialogos en AJAX<br><div>Seguir estos consejos para tratar lo del viewExpiredException<div>&nbsp;&nbsp;&nbsp;&nbsp;http://seamframework.org/Documentation/RedirectingBackToCurrentPageWhenSessionTimesOut<div>&nbsp;&nbsp;&nbsp;&nbsp;http://in.relation.to/Bloggers/ImplementingGracefulSessionTimeoutWithSeamJSFAndJQuery<br><div>Definir c'omo se clasificar'an los bundles, en que caso se pone un mensaje en uno o en otro.<br><div>Planear y hacer bien el análisis para usar plantillas!!!<br><div>Usar los mapeos de hibernate hacia enumerators!!! es lo mejor.<br><div>No pongas forms a lo idiota.<br><div>Para cada funcionalidad definir bien a que "Home" pertenece<br><div>Definir desde un inicio en que caso se utiliza cierto tipo de query	\N	t
4430	1	4	0	Toma la foto de tu vida	2011-05-17	Tomemos la foto de nuestras vidas. Concurso para obtener la mejor foto de una vida "cotidiana". Definitivamente si le entras a este concurso no serás para nada cotidiano, y cuando comiences a ver tus fotos te darás cuenta de ello.	4430-0.png	0	17	4	4.0499999999999998	<strong style="font-size: 25px;">Toma la foto de tu vida</strong><br><br><span style="font-size: 19px;">Mientras algunos se</span><img  alt="" style="width: 236px; height: 236px;" src="http://www.levoltz.com/wp-content/uploads/2009/07/nikon-digital-camera-selection11.jpeg" align="left"><span style="font-size: 19px;"> la pasan admirando las fotos de la vida de otros, no se dan cuenta de lo bella que es la de ellos.</span><br><br><span style="font-size: 14px;">En este concurso yo, Jorge Baut</span><span style="font-size: 14px;">ista, te invito a tomar clases gratuitas d</span><span style="font-size: 14px;">e fotografía y a aplicarlas en un concurso. El concurso lo ganará la mejor foto (obvio xD).</span><br><br><br><br><span style="font-size: 14px;">Saludos!!</span>	\N	t
3230	0	1	0	Preguntarás	2011-05-05	Preguntarás	3230-0.png	0	1	0	5	<font style="font-size: 43px; "><strong>Preguntarááááááás</strong></font>	\N	f
6771	5	4	0	Nos gusta el desorden	2011-06-07	Camo a portar mal!!Camo a portar mal!!	6771-0.png	5670	1	0	5	Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!Camo a portar mal!!	\N	f
6660	5	2	0	Hipster?? Qué es un hipster??	2011-06-06	Escribe una breve descripción de tu idea. Recuerda que esta descripción será usada para mostrar una "versión corta" de esta cuando se requiera. La sección "Contenido de la idea" tendrás la oportunidad de extender más (mucho más) esta descripción.\t	6660-0.png	5670	0	0	0	<meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 903px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">Describe claramente las características de tu idea y con el mayor detalle posible</span></td><td><span id="form:wizart:counterInputContenidoIdea" style="font-size: 17pt; color: gray; ">100% de espacio libre para este contenido</span></td></tr></tbody></table></span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 903px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">Describe claramente las características de tu idea y con el mayor detalle posible</span></td><td><span id="form:wizart:counterInputContenidoIdea" style="font-size: 17pt; color: gray; ">100% de espacio libre para este contenido</span></td></tr></tbody></table></span><meta http-equiv="content-type" content="text/html; charset=utf-8"><span style="color: #222222; font-family: Verdana, Arial, sans-serif; font-size: 16px; -webkit-border-horizontal-spacing: 2px; -webkit-border-vertical-spacing: 2px; line-height: normal; "><table style="width: 903px; border-top-style: none !important; border-right-style: none !important; border-bottom-style: none !important; border-left-style: none !important; border-width: initial !important; border-color: initial !important; "><tbody><tr><td><span style="width: 0px; ">Describe claramente las características de tu idea y con el mayor detalle posible</span></td><td><span id="form:wizart:counterInputContenidoIdea" style="font-size: 17pt; color: gray; ">100% de espacio libre para este contenido</span></td></tr></tbody></table></span>	\N	\N
7830	5	2	0	Buscar nueva música porque ya no logro encontrar nueva, buena. Caracteres extra para probar.	2011-06-21	\N	7830-0.png	0	0	0	0	Comenzar por buscar nombres al azhar!!!<br><br>O tal vez sea mejor buscar metal. Para evitar lo que dice nietzsche: si dejas tu vida a los accidentes, tu entera vida es un accidente.	\N	\N
7240	5	3	0	Crear recopilación de calle 13.	2011-06-13	\N	7240-0.png	0	0	0	0	Básicamente tomar todos los discos, sacar las mejores rolas y subirlas a la red.	\N	\N
2444	2	1	0	Sueño despierto	2011-05-03	Largo	2444-0.png	0	2	1	3.3300000000000001	<strong>Sueño largo</strong>	\N	\N
6900	1	4	0	Alcalde drogadicto con cara de idiota.	2011-06-09	Te prometo que te llevo a cuba y te pago la rehabilitación.	6900-0.png	5670	0	0	0	Te prometo que te llevo a cuba y te pago la rehabilitación.<br>Te prometo que te llevo a cuba y te pago la rehabilitación.<br>Te prometo que te llevo a cuba y te pago la rehabilitación.	\N	t
7870	1	3	0	Encontrar perro chewbaca	2011-06-23	\N	7870-0.png	0	0	0	0	Localizar fotos del perro chwebaca y verificar su parecido!!<br><br><img  src="http://l.yimg.com/bt/api/res/1.2/lF5wdjgFxFlA3XctfXzPmw--/YXBwaWQ9eW5ld3M7cT04NTt3PTMxMA--/http://media.zenfs.com/241/2011/06/22/Chewbacca-1_194730.jpg" style="width: 310px; " alt="">	\N	t
6901	1	1	0	jorgwel Te prometo que te llevo a cuba y te hago la rehabilitación.	2011-06-09	jorgwel Te prometo que te llevo a cuba y te pago la rehabilitación.	6901-0.png	0	0	0	0	Te prometo que te llevo a cuba y te pago la rehabilitación.<br>Te prometo que te llevo a cuba y te pago la rehabilitación.<br>Te prometo que te llevo a cuba y te pago la rehabilitación.	\N	t
2443	1	1	0	Esta noche no hay control	2011-05-03	Estás de madrugada pero no estás cansada	2443-0.png	0	0	0	0	<strong>Esta noche</strong><br><br>No hay control!!	\N	t
1410	5	1	1	Poner a lalo a hacer algo productivo	2011-04-28	Eduardo Pérez Guerra pasa demasiado tiempo en mi casa y solo se dedica a navegar internet. Propongamos ideas para que las haga en la computadora.	default.png	0	1	1	2.5	<strong><font style="font-size: 23px; ">Eduardo Pérez Guerra pasa demasiado tiempo en mi casa y solo se dedica a navegar internet. Propongamos ideas para que las haga en la computadora.</font></strong><br><br><font style="color: #ff007f; font-size: 17px; "><strong>Eduardo Pérez Guerra pasa demasiado tiempo en mi casa y solo se dedica a navegar internet. Propongamos ideas para que las haga en la computadora.</strong></font>	\N	\N
4040	1	4	0	Escuchar más tipos de música porque los que escucho actualmente...como que ya no rifan tanto.	2011-05-16	Escuchar música al azar en youtube me ha funcionado bastante bien.	4040-0.png	2	5	2	3.5699999999999998	<font style="font-size: 25px; "><strong>Escuchar música al azar en youtube me ha funcionado bastante bien.</strong></font><br><br><font style="font-size: 17px; ">Escuchar música al azar en youtube me ha funcionado bastante bien.<br>Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.Escuchar música al azar en youtube me ha funcionado bastante bien.</font>	\N	\N
2	1	4	2	Organizar a los alumnos para tomar fotos a los trabajadores huevones.	2011-02-17	El artículo es un género fundamental del periodismo que tiene como propósito dar a conocer los hechos de interés colectivo, ya sea social o político.	288.jpg	2	4	4	2.5	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
6	1	4	2	Observar nuevas tecnologías. Otorgo servicio social.	2011-02-17	Deberías considerar si es apropiado continuar editando esta página. El registro de borrados y traslados para esta página están provistos aquí por conveniencia: 	303.jpg	6	16	4	3	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
5601	1	4	0	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2011-05-30	eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee	5601-0.png	5520	1	1	2.5	iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii	\N	\N
1750	2	4	4	Primera imagen con inserción de imagen.	2011-05-02	El punto de esta idea es probar que funciona la inserción de imágenes.	1750-0.png	0	1	1	2.5	<font style="color: #ff80ff; "><strong><em>El punto de esta idea es probar que funciona la inserción de imágenes.</em></strong></font>	\N	\N
8700	1	0	0	Escuchar "My Girl" de Nirvana	2011-07-10	\N	8700-0.png	5670	0	0	0	<strong style="font-size: 21px;">Nirvana&nbsp; -&nbsp; My girl</strong><br><br>My girl, my girl, don't lie to me, <br>\r\nTell me where did you sleep last night? <br>\r\n<br>\r\nIn the pines, in the pines <br>\r\nWhere the sun will never shine <br>\r\nI would shiver the whole night through <br>\r\n<br>\r\nMy girl, my girl, where will you go? <br>\r\nI'm going where the cold wind blows <br>\r\n<br>\r\nIn the pines, in the pines <br>\r\nWhere the sun will never shine <br>\r\nI would shiver the whole night through <br>\r\n<br>\r\nHer husband, was a hard working man <br>\r\nJust about a mile from here <br>\r\nHis head was found in a driving wheel <br>\r\nBut his body never was found <br>\r\n<br>\r\nMy girl, my girl, don't lie to me, <br>\r\nTell me where did you sleep last night? <br>\r\n<br>\r\nIn the pines, in the pines <br>\r\nWhere the sun will never shine <br>\r\nI would shiver the whole night through <br>\r\n<br>\r\nMy girl, my girl, where will you go? <br>\r\nI'm going where the cold wind blows <br>\r\n<br>\r\nIn the pines, in the pines <br>\r\nWhere the will never shine <br>\r\nI would shiver the whole night through	\N	t
2440	1	4	0	Los gatos de san martín	2011-05-03	Ha trabajado mi linda música	2440-0.png	0	0	0	0	<font style="font-size: 19px; "><strong>Ha trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda música<br></strong></font><br><font style="color: #4040ff; font-size: 15px; ">Ha trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda músicaHa trabajado mi linda música</font>	\N	t
2442	1	1	0	Eres la carretera	2011-05-03	Actitud	2442-0.png	0	0	0	0	fdsafdsafdsafdsafdsafdsafdsafdsa	\N	t
4	1	4	2	Servicio social. Plantar 3000 árboles en 3 meses.	2011-02-17	No necesita de un vocabulario especializado ni preciso, sino algo que sea muy cotidiano y evidente, con sentido y que abra y aclare dudas al lector. Tampoco requiere de tener un nivel de argumentación largo, sino algo que abra las puertas de la imaginación de los lectores a seguir buscando información.	103.jpg	4	9	8	0.28999999999999998	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
1	1	4	2	Crear album fotografico de la UAM	2011-02-17	En el artículo, se parte del planteamiento de un problema o situación problemática, o sea, de opiniones encontradas u opuestas. Quien escribe un artículo no solo analiza los hechos, sino que al interpretarlos o dar su opinión, argumenta a favor o en contra de ellos. Todos estos factores hacen del artículo un texto argumentativo.	165.jpg	1	11	2	3.46	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	\N
8240	1	1	0	Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.	2011-07-02	\N	8240-0.png	0	0	0	0	Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.<br>Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.<br>Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.Probar el funcionamiento de la inserción de ideas cuando ya desacoplé el proyecto de rutas duras.	\N	t
4770	1	3	0	Escuchar todo el disco de Calle 13	2011-05-23	A penas me di cuenta de la calidad de música creada por calle 13...y acaban de sacar su último disco, así que es primordial que me de un tiempo y encuentre la oportunidad para ir a verlos en vivo!!	4770-0.png	0	1	0	5	<br><img  src="http://www.wikiton.net/wp-content/uploads/2008/08/calle-13.jpg" style="width: 150px; height: 110px; " alt=""><font style="font-size: 32px; ">Este es el logo del nuevo disco. ¿Quién se une para ir a verlos? Yo pongo una camioneta!!</font>	\N	t
3940	1	1	0	Crear una corriente de aire en el cuarto para eliminar el calor.	2011-05-11	Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.	3940-0.png	0	2	3	2	<font style="font-size: 25px; ">Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.</font><br><br>Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.Hay gobernantes y presidentes, hay agua fría y agua caliente. En el mundo siempre se mueve la tierra, hay tanques de oxígeno hay tanques de guerra.	\N	t
2811	0	4	0	aaaaaaaaaaa	2011-05-05	aaaaaaaaaaaaaaaaa	2811-0.png	0	2	0	5	ssssssssssssssssssssssssssss	\N	f
3020	1	1	0	Pa disfamás!!!	2011-05-05	Vamonoss!!!	3020-0.png	0	0	0	0	gfdsgfdsgfdsgfdsgfdgsfdgfdsgfdgfdsgfdsgfd gfdsgdfg gfdsgfdgfdgfdgfdgfdgfds	\N	t
2530	1	4	0	Me entrego a los latidos de tu corazón!	2011-05-04	Esta noche no hay control	2530-0.png	0	0	0	0	trewtrewtrewtew	\N	t
2601	1	1	0	gfdsgfdsgfdsgfdsgf	2011-05-04	gfdsgfdsgfdsgfdgfdsgfds	2601-0.png	0	0	0	0	gfdsgfdsgfdsgfdsgfds	\N	t
2446	1	0	0	Mirame bien	2011-05-04	En este eterno circo puedo ser	2446-0.png	0	0	0	0	<strong>En este eterno circo puedo ser</strong>	\N	t
2810	1	4	0	Hace tiempo te busco en la calle número 10	2011-05-04	Tenemos asuntos pendientes y urgentes que hacer.	2810-0.png	0	0	0	0	Y es que tengo un atraso y no puedo con el.	\N	t
2600	1	4	0	gfdsgfdsgfdsgfdsgfdsg	2011-05-04	gfdsgfdsgfdsgfdsgdf	2600-0.png	0	1	0	5	gfdgfdsgfdgfdgdfsg	\N	t
2445	1	3	0	Perdí la cuenta	2011-05-04	Aunque lo niegues yo se que vas a estar suplicando al fin	2445-0.png	0	0	0	0	Como siempre vas a estar	\N	t
2602	1	2	0	Mi chica de humo 	2011-05-04	Ver pelicula de capitán américa	2602-0.png	0	3	1	3.75	<strong>fdsfdsafdsfsdfdsfsdfsdfdsa<br><br><font style="color: #ff80bf; ">fdsafdsafdsafdsafsda<br>fds<br>fsd<br>fdsa<br>fds<br>af<br>dsaf<br>dsf<br>dsa</font></strong>	\N	t
1820	1	1	1	Iniciar un grupo de estudio para certificación como programador de Java (SCJP)	2011-05-03	Quiero comenzar un grupo de estudio para certificarse como programador de Java, pero requiero programadores comprometidos, no vedettes.	1820-0.png	0	0	0	0	Quiero comenzar un grupo de estudio para certificarse como programador de Java, pero requiero programadores comprometidos, no vedettes.<br><br>El cupo será solo de 10 alumnos. Este será el grupo piloto para estandarizar procedimientos y maneras de enseñanza.	\N	t
2350	1	2	0	Chiflidito!	2011-05-03	Chiflidito! Chiflidito!Chiflidito!Chiflidito!Chiflidito! Chiflidito!Chiflidito!Chiflidito! Chiflidito! Chiflidito!Chiflidito!Chiflidito!Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! 	2350-0.png	0	1	1	2.5	<strong>Chiflidito! Chiflidito!Chiflidito!Chiflidito!Chiflidito! Chiflidito!Chiflidito!Chiflidito! Chiflidito! Chiflidito!Chiflidito!Chiflidito!Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito!&nbsp;<br></strong><br>Chiflidito! Chiflidito!Chiflidito!Chiflidito!Chiflidito! Chiflidito!Chiflidito!Chiflidito! Chiflidito! Chiflidito!Chiflidito!Chiflidito!Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito! Chiflidito!&nbsp;	\N	t
2080	1	2	0	Soy mendigo de tus besos	2011-05-03	Quiero ser algo más que eso. Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.d	2080-0.png	0	0	0	0	<font style="font-size: 18px; ">Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.<br></font><br><br>Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.Quiero ser algo más que eso.	\N	t
2354	1	2	0	fdsafdsfdsa	2011-05-03	rewrqewqrewqrewq	2354-0.png	0	0	0	0	rewqrewqrewrewqrewqrewqrewqrewr<br><br>sdfdsafdsafdsafdsafa	\N	t
2441	1	2	0	Mirando el sol caer	2011-05-03	EL sol caer	2441-0.png	0	0	0	0	Mirando el sol caer	\N	t
2211	1	4	0	fdsfadshafjkhdslfjklsfljsak	2011-05-03	fdsfsdfdsfsdfdsfsdfsdfd	2211-0.png	0	0	0	0	fdsfdsfsdfsdfsdfdsfds	\N	t
2081	1	1	0	hytrytreytretr	2011-05-03	ytreytreytreytreyt	2081-0.png	0	0	0	0	ytreytreytreytreytreytreytreytrytrytr	\N	t
1290	1	2	4	Alimentando las principales armas humanas en mi país.	2011-05-03	Propongo abrir un "restaurante" donde podamos alimentar a las personas que podrían ayudar a más personas y/o a mejorar nuestro país de cualquier forma. Mi idea es alimentar a los estudiantes, pero no a cualquiér estudiante. Necesita ser solo a los que demuestren tener talento.  Tal vez puede llamarsele ornanización no lucrativa o algo así. 	default.png	0	1	0	5	<strong style="font-size: 25px;">Alimentando a nuestro México</strong><br><br><span style="font-size: 19px;">Propongo abrir un "restaurante" donde podamos alimentar a las personas que podrían ayudar a más personas y/o a mejorar nuestro país de cualquier forma. Mi idea es alimentar a los estudiantes, pero no a cualquiér estudiante. Necesita ser solo a los que demuestren tener talento.&nbsp; Tal vez puede llamarsele ornanización no lucrativa o algo así. </span>	\N	t
2352	1	2	0	Que los alumnos publiquen sus proyectos terminales en LinkUAM	2011-05-03	Actualmente los alumnos no cuentan con un lugar donde publicar sus proyectos terminales. Haganlo aquí.	2352-0.png	0	0	0	0	Publicar PTs de alumnos aquí.	\N	t
2351	1	0	0	gffdgfdsgfdgfdsgdgfdsgfd	2011-05-03	gfdsgfdsgfdsgfdsgfdsgfsd	2351-0.png	0	0	0	0	gfdsgfdsgfdsgfdsgfdsgfds	\N	t
2140	1	2	0	kjhgfdsakjhnbgvfdc	2011-05-03	fdsafdsafdsafdsafd	2140-0.png	0	0	0	0	fdsafdsafdsafdsafdsafdsaf	\N	t
2353	1	0	0	Escritorio desordenado	2011-05-03	fdsfdsafdsfdsfsdfdsfdsfd	2353-0.png	0	0	0	0	fdsfdsafdsfsdfsdfsfdfd	\N	t
2280	1	3	0	gfdsgdfsgfdsgfds	2011-05-03	Tomar fotografías!! Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomawr fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!	2280-0.png	0	1	0	5	<strong><font style="font-size: 19px; ">Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!vTomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!vTomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!<br></font></strong><br><br><font style="color: #0080ff; font-size: 15px; ">Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!Tomar fotografías!!</font>	\N	t
1690	1	0	0	Idea	2011-05-02	Para el ejemplo de	default.png	0	1	1	2.5	subir imagen	\N	t
1890	1	2	2	Cantar y bailar	2011-05-01	Llenando mis 5 caracteres máximo.	1890-0.png	0	0	0	0	<strong><span style="font-size: 19px;">Llenando mis 5 caracteres máximo.</span></strong><br><em><br><strong style="font-size: 17px;"><span style="font-size: 17px;">Llenando mis 5 caracteres máximo.</span></strong></em>	\N	t
250	1	0	0	aaaaaaaaaaaaaaaaaaa	2011-04-09	bbbbbbbbbbbbbbbbb	default.png	0	0	0	0	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
1540	1	2	2	Enseñarle a Beti como usar VUE	2011-04-28	Beti no entrega muy buenos trabajos a pesar de su edad y grado escolar. Hay que enseñarle como usar nuevo software para entregar mejores presentaciones.	default.png	0	0	0	0	<strong><span style="font-size: 24px; " style="font-family: 'Courier New';">Enseñarle a Beti como usar VUE</span></strong><br><br><font style="color: #ff007f; "><strong>Beti no entrega muy buenos trabajos a pesar de su edad y grado escolar. Hay que enseñarle como usar nuevo software para entregar mejores presentaciones.</strong></font>	\N	t
1610	1	3	0	¡Promocionar PrimeFaces en las UAM!	2011-04-28	En vista del auge que están teniendo estos frameworks (alias implementaciones de JSF) me gustaría dar especial promoción a esta biblioteca de clases que es en extremo buena y con un gran soporte y documentación. Personalmente no he probado RichFaces ni IceFaces pero he escuchado mucho mejores críticas de PrimeFaces.	default.png	0	0	0	0	<strong><font style="font-size: 29px; ">¡Promocionar PrimeFaces en las UAM!<br></font></strong><br><br><font style="color: #8b8b8b; font-size: 18px; ">En vista del auge que están teniendo estos frameworks (alias implementaciones de JSF) me gustaría dar especial promoción a esta biblioteca de clases que es en extremo buena y con un gran soporte y documentación. Personalmente no he probado RichFaces ni IceFaces pero he escuchado mucho mejores críticas de PrimeFaces.</font>	\N	t
1291	1	0	0	Café Internet y VIdeojuegos	2011-04-27	Tengo la idea de poner un café internet que tenga a un lado todas las consolas disponibles. Al menos 6 de cada una. 	default.png	0	0	0	0	Tengo la idea de poner un café internet que tenga a un lado todas las consolas disponibles. Al menos 6 de cada una.	\N	t
1350	1	4	4	Innovar en productos para venta en Winnies	2011-04-27	Los raspados están funcionando. Las ensaladas de verdura no se diga. Los chamukos también, pero esto no se da todo el año, hay temporadas en las que estos productos no se venden tanto debido a que no hace calor. Winnies no puede depender del calor para vender.\r\n\r\nNecesitamos innovar.	default.png	0	1	0	5	<div><strong><font style="font-size: 23px; ">Nuevos productos en Winnies</font></strong><br><br><font style="font-size: 19px; ">Los raspados están funcionando. Las ensaladas de verdura no se diga. Los chamukos también, pero esto no se da todo el año, hay temporadas en las que estos productos no se venden tanto debido a que no hace calor. Winnies no puede depender del calor para vender.</font><div><font style="font-size: 19px; "><br></font><div><font style="font-size: 19px; ">Necesitamos innovar.</font>	\N	t
1150	1	2	3	Título	2011-04-25	Resumen	default.png	0	1	1	2.5	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
1210	1	2	0	Certificación en Java	2011-04-25	Me acabo de certificar como Java Programmer junto con otro compañero. En realidad no fue dificil, solo hizo falta un poco de lectura diaria (30 pag diarias) y vernos los sábados o domingos durante un mes. El examen es sencillisimo y ahora quisieramos compartir nuestra experiencia e incluso iniciar un grupo de estudio que permitiese a otros alumnos certificarse. Lean el resto.	default.png	0	5	3	3.1200000000000001	<strong><span style="font-size: 17px;">CERTIFICACIÓN EN JAVA</span></strong><br><br>Lo que propongo es: <br><br>Vernos Lunes, Miercoles y Viernes en el SAI para hacer durante1 hora lo siguiente:<br><br><blockquote>- Platicar 10 min (no repasar) sobre lo que leimos por nuestro lado.<br>- Dedicar 40 minutos a la realización de preguntas y 15 min más a la corrección de estas.<br></blockquote><br><strong><span style="font-size: 14px;">¿Qué pedimos a cambio?</span></strong><br><br>Que las personas que puedan certificarse apoyen al siguiente grupo de estudio como nosotros lo hicimos con ustedes.<br><br><strong>Se firmará un papel para asegurar el cumplimiento de este compromiso.</strong><br><br>Esta idea estará abierta hasta el 13 de Julio de 2011.<br><br>Quedo de ustedes,<br><br><strong>Jorge "Yo quiero que el cangrejo salga de la cubeta, no es mi intención jalarlo hacia adentro"</strong> <strong>Bautista<br><br>Rodrigo "Chin chin al que no apoye al siguiente grupo de estudio" Bergara<br></strong>	\N	t
991	1	3	3	tretrew	2011-04-18	trewtrewtrewtr	default.png	0	4	0	5	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
880	1	2	4	Título genérico	2011-04-16	Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen Resumen	default.png	0	0	0	0	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
710	1	3	3	Melones de grosella	2011-04-14	Hace muuucho calor, unos meloncitos de grocella no le vendr'ian mal a nadie :)	default.png	0	5	5	2.5	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
400	1	0	0	Jorge boxeador amateur	2011-04-10	Mi idea es lograr que mi cuerpo se vaya acostumbrando a hacer ejercicio antes de forzarlo a hacerlo diario. Bueno, me gusta un chorro el box, entonces quisiera comenzar "boxeando" frente al espejo, ya después quiero irme a correr porque me gusta un chorro.	default.png	0	22	13	3.1400000000000001	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
330	1	1	1	Regalar sentido de pertenencia a los nuevos alumnos de la UAM	2011-04-10	En general los alumnos de la UAM tenemos poco sentido de pertenencia si nos comparamos con los del poli o los de la UNAM, así que propongo regalarles un poco más de sentido a los nuevos alumnos. ¿Cómo?	default.png	0	12	7	3.1600000000000001	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	t
251	0	4	2	Gabita vuelve a nardo!!	2011-04-09	El objetivo de esta idea es hacer que Gabita se cuide, que cuide su cuerpo, su salud, su persona...en verdad que me molesta mucho cuando Gabita dice que se importa pero no lo demuestra :(	default.png	0	6	2	3.75	A raíz de mi artículo <a href="http://bdsv.zoomblog.com/archivo/2005/08/30/necesito-10-millones-de-dolares-y-tu.html" target="_blank">Necesito 10 millones de dólares ¿y tú?</a>\n he recibido bastantes mensajes privados de lo más variado.	\N	f
8800	1	2	0	Buscar música de nirvana SIN VOCES	2011-07-12	\N	8800-0.png	2	0	0	0	La música de nirvana me gusta.	\N	t
\.


--
-- TOC entry 2447 (class 0 OID 16551)
-- Dependencies: 1732
-- Data for Name: imagen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY imagen (id_imagen, nombre_imagen, idea_id) FROM stdin;
0	222.jpg	0
1	123.jpg	0
3	311.jpg	0
2	145.jpg	0
4	231.jpg	1
5	167.jpg	1
6	278.jpg	1
7	121.jpg	1
8	21.jpg	2
9	12.jpg	2
10	11.jpg	2
11	130.jpg	2
13	13.jpg	3
12	300.jpg	3
14	14.jpg	3
15	15.jpg	3
16	16.jpg	4
17	17.jpg	4
18	18.jpg	4
19	19.jpg	4
20	20.jpg	8
22	22.jpg	8
25	23.jpg	8
1240	default.png	1210
23	24.jpg	5
24	24.jpg	5
26	25.jpg	5
27	27.jpg	6
28	28.jpg	6
1320	default.png	1290
29	29.jpg	6
30	30.jpg	7
1321	default.png	1291
32	32.jpg	7
1380	default.png	1350
31	31.jpg	7
21	21.jpg	8
260	default.png	250
261	default.png	251
370	default.png	330
470	default.png	400
780	default.png	710
940	default.png	880
1041	default.png	991
1180	default.png	1150
1440	default.png	1410
1570	default.png	1540
1640	default.png	1610
1720	default.png	1690
1810	1750-0.png	1750
1880	1820-0.png	1820
1950	1890-0.png	1890
2020	1960-0.png	1960
2130	2080-0.png	2080
2131	2081-0.png	2081
2200	2140-0.png	2140
2270	2210-0.png	2210
2271	2211-0.png	2211
2340	2280-0.png	2280
2410	2350-0.png	2350
2411	2351-0.png	2351
2412	2352-0.png	2352
2413	2353-0.png	2353
2414	2354-0.png	2354
2500	2440-0.png	2440
2501	2441-0.png	2441
2502	2442-0.png	2442
2503	2443-0.png	2443
2504	2444-0.png	2444
2505	2445-0.png	2445
2506	2446-0.png	2446
2590	2530-0.png	2530
2660	2600-0.png	2600
2661	2601-0.png	2601
2662	2602-0.png	2602
2870	2810-0.png	2810
2871	2811-0.png	2811
3080	3020-0.png	3020
4000	3940-0.png	3940
4100	4040-0.png	4040
3290	3230-0.png	3230
3370	3310-0.png	3310
3440	3380-0.png	3380
3441	3381-0.png	3381
4101	4041-0.png	4041
4102	4042-0.png	4042
4470	4430-0.png	4430
4800	4770-0.png	4770
5070	5010-0.png	5010
5580	5540-0.png	5540
5640	5600-0.png	5600
5641	5601-0.png	5601
5790	5750-0.png	5750
5850	5810-0.png	5810
6030	6000-0.png	6000
6230	6210-0.png	6210
6231	6211-0.png	6211
6232	6212-0.png	6212
6650	6610-0.png	6610
6651	6611-0.png	6611
6700	6660-0.png	6660
6750	6710-0.png	6710
6810	6770-0.png	6770
6811	6771-0.png	6771
6940	6900-0.png	6900
6941	6901-0.png	6901
7280	7240-0.png	7240
7350	7310-0.png	7310
7860	7830-0.png	7830
7910	7870-0.png	7870
8280	8240-0.png	8240
8410	8380-0.png	8380
8590	8550-0.png	8550
8740	8700-0.png	8700
8830	8800-0.png	8800
8870	8840-0.png	8840
8871	8841-0.png	8841
\.


--
-- TOC entry 2448 (class 0 OID 16556)
-- Dependencies: 1734
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY institucion (id_institucion, nombre_institucion, descripcion_institucion, url_institucion, nombre_imagen_institucion) FROM stdin;
2	UAM Iztapalapa	La Unidad Iztapalapa fue la primera en iniciar los trabajos de construcción de edificios e instalaciones, hoy por hoy se considera la unidad más completa, de acuerdo al diseño original de la misma, que a pesar de haberse modificado, ha conseguido adaptarse a las necesidades cambiantes de los nuevos acontecimientos científicos, sociales y culturales. Se seleccionó un predio de 177,955 metros cuadrados al oriente del Distrito Federal, en la Delegación Iztapalapa para iniciar los trabajos. Este lugar resultaba idóneo por su creciente urbanización y por el asentamiento de pequeñas y medianas empresas.	http://www.izt.uam.mx/	uamizt.png
3	UAM Cuajimalpa	El 26 de abril de 2005, el Colegio Académico de la Universidad Autónoma Metropolitana –de acuerdo con la Propuesta para el Establecimiento de la Unidad Cuajimalpa del Rector General de la UAM, doctor Luis Mier y Terán Casanueva– aprobó la creación de la cuarta unidad en el Acuerdo 264.3. Mensaje del Rector General de la UAM ante el Colegio Académico, Sesión 264.	http://www.cua.uam.mx/	uamcua.png
4	UAM Lerma	Promover y contribuir al desarrollo humano con equidad y sustentabilidad mediante la generación y socialización de los saberes que permitan: la formación integral de profesionales, científicos, humanistas y artistas de calidad con compromiso social; la organización y desarrollo de actividades de investigación multidisciplinaria que resuelva problemas locales, nacionales y globales; y la preservación y difusión del arte y la cultura.	http://www.uam-lerma.mx/	uamler.png
0	UAM Azcapotzalco	Esta Casa Abierta al Tiempo abrió sus puertas en noviembre de 1974, contando únicamente con los edificios “C”, “E”, “F” y “G”, espacios donde hoy se ubican Rectoría de la Unidad, Secretaría de la Unidad, el Auditorio Incalli Ixcahuicopa, la Galería del Tiempo, el Centro de Recursos de Lenguas Extranjeras, la Sala de Consejo Académico, albergando además áreas administrativas, servicios universitarios, aulas y laboratorios.	http://www.azc.uam.mx	uamazc.png
1	UAM Xochimilco	En 1973, la Asociación Nacional de Universidades e Institutos de Enseñanza Superior (ANUIES), entregó un documento al Presidente de la República Luis Echeverría Álvarez, en el que se presentaba la necesidad de establecer una nueva universidad en el área metropolitana considerando el incremento de la demanda estudiantil y la insuficiencia de las instituciones universitarias existentes. Se proponía además, tomar esta oportunidad para modernizar la educación superior como parte de una reforma integral de la educación en México. La ley para la creación de la Universidad Autónoma Metropolitana entró en vigor el día primero de enero de 1974. Nace como una institución descentralizada del Estado, autónoma, con personalidad jurídica y patrimonio propio.	http://www.xoc.uam.mx/	uamxoc.png
\.


--
-- TOC entry 2449 (class 0 OID 16564)
-- Dependencies: 1736
-- Data for Name: integrante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY integrante (usuario_id, idea_id, estatus_integrante_id, fecha_inicio_integrante, fecha_fin_integrante, eslider_integrante, calificacion_integrante) FROM stdin;
0	0	1	2011-01-01	2011-02-08	t	10
0	1	1	2011-02-02	\N	f	1
1	1	1	2011-01-01	2011-02-08	t	8
1	5	2	2011-01-01	2011-02-08	t	7
1	6	1	2011-01-01	2011-02-08	f	1
2	4	1	2011-01-01	2011-02-08	t	9
4	2	3	2011-01-01	2011-02-08	f	1
6	1	0	2011-01-01	2011-02-08	f	4
3	3	1	2011-01-01	\N	t	\N
4	4	2	2011-02-02	\N	f	1
5	5	1	2011-03-03	\N	f	\N
2	7	3	2011-04-04	2011-03-03	f	5
3	8	2	2011-05-05	\N	f	9
5	8	0	2011-06-06	\N	t	\N
0	330	1	2011-04-10	\N	t	0
0	400	1	2011-04-10	\N	t	0
0	710	1	2011-04-14	\N	t	0
0	880	1	2011-04-16	\N	t	0
0	991	1	2011-04-18	\N	t	0
0	1150	1	2011-04-25	\N	t	0
0	1210	1	2011-04-25	\N	t	0
0	1290	1	2011-04-27	\N	t	0
0	1291	1	2011-04-27	\N	t	0
0	1350	1	2011-04-27	\N	t	0
0	1410	1	2011-04-28	\N	t	0
0	1540	1	2011-04-28	\N	t	0
0	1610	1	2011-04-28	\N	t	0
0	1690	1	2011-05-03	\N	t	0
0	1750	1	2011-05-03	\N	t	0
0	1820	1	2011-05-03	\N	t	0
0	1890	1	2011-05-03	\N	t	0
0	1960	1	2011-05-04	\N	t	0
0	2080	1	2011-05-05	\N	t	0
0	2081	1	2011-05-05	\N	t	0
0	2140	1	2011-05-05	\N	t	0
0	2210	1	2011-05-05	\N	t	0
0	2211	1	2011-05-05	\N	t	0
0	2280	1	2011-05-05	\N	t	0
0	2350	1	2011-05-05	\N	t	0
0	2351	1	2011-05-05	\N	t	0
0	2352	1	2011-05-05	\N	t	0
0	2353	1	2011-05-05	\N	t	0
0	2354	1	2011-05-05	\N	t	0
0	2440	1	2011-05-05	\N	t	0
0	2441	1	2011-05-05	\N	t	0
0	2442	1	2011-05-05	\N	t	0
0	2443	1	2011-05-05	\N	t	0
0	2444	1	2011-05-05	\N	t	0
0	2445	1	2011-05-05	\N	t	0
0	2446	1	2011-05-05	\N	t	0
0	2530	1	2011-05-05	\N	t	0
0	2600	1	2011-05-05	\N	t	0
0	2601	1	2011-05-05	\N	t	0
0	2602	1	2011-05-05	\N	t	0
0	2810	1	2011-05-05	\N	t	0
0	2811	1	2011-05-05	\N	t	0
0	3020	1	2011-05-05	\N	t	0
0	3940	1	2011-05-11	\N	t	0
2	4040	1	2011-05-16	\N	t	0
0	3230	1	2011-05-05	\N	t	0
0	3310	1	2011-05-07	\N	t	0
0	3380	1	2011-05-08	\N	t	0
0	3381	1	2011-05-08	\N	t	0
2	4041	1	2011-05-16	\N	t	0
1	4042	1	2011-05-16	\N	t	0
1	2602	1	2011-05-17	\N	f	0
1	3380	1	2011-05-17	\N	f	0
2	4042	1	2011-05-17	\N	f	0
2	2811	1	2011-05-17	\N	f	0
0	4430	1	2011-05-17	\N	t	0
2	4430	1	2011-05-17	\N	f	0
0	4040	1	2011-05-18	\N	f	0
0	4041	1	2011-05-18	\N	f	0
0	4042	1	2011-05-18	\N	f	0
0	4770	1	2011-05-23	\N	t	0
1	4770	1	2011-05-23	\N	f	0
0	5010	1	2011-05-24	\N	t	0
1	5010	1	2011-05-24	\N	f	0
5520	5540	1	2011-05-30	\N	t	0
0	5600	1	2011-05-30	\N	t	0
5520	5601	1	2011-05-30	\N	t	0
5730	5750	1	2011-05-31	\N	t	0
5670	5810	1	2011-05-31	\N	t	0
5970	6000	1	2011-05-31	\N	t	0
0	6000	1	2011-05-31	\N	f	0
1	6000	1	2011-05-31	\N	f	0
6190	6210	1	2011-05-31	\N	t	0
2	6211	1	2011-05-31	\N	t	0
2	6212	1	2011-05-31	\N	t	0
5670	5750	1	2011-06-03	\N	f	0
5670	6610	1	2011-06-06	\N	t	0
2	6611	1	2011-06-06	\N	t	0
5670	6660	1	2011-06-06	\N	t	0
2	6710	1	2011-06-06	\N	t	0
0	6770	1	2011-06-07	\N	t	0
5670	6771	1	2011-06-07	\N	t	0
5670	6900	1	2011-06-09	\N	t	0
0	6901	1	2011-06-09	\N	t	0
5670	6210	1	2011-06-09	\N	f	0
0	6212	1	2011-06-10	\N	f	0
0	5601	1	2011-06-10	\N	f	0
0	7240	1	2011-06-13	\N	t	0
0	7310	1	2011-06-13	\N	t	0
7360	6710	1	2011-06-13	\N	f	0
0	6900	1	2011-06-15	\N	f	0
0	7830	1	2011-06-21	\N	t	0
0	7870	1	2011-06-23	\N	t	0
0	8240	1	2011-07-02	\N	t	0
5670	8380	1	2011-07-03	\N	t	0
8430	8550	1	2011-07-03	\N	t	0
5670	8700	1	2011-07-10	\N	t	0
2	8800	1	2011-07-12	\N	t	0
5670	8840	1	2011-07-12	\N	t	0
5670	8841	1	2011-07-12	\N	t	0
\.


--
-- TOC entry 2450 (class 0 OID 16567)
-- Dependencies: 1737
-- Data for Name: invitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY invitacion (id_invitacion, usuario_invitado_id, usuario_invitante_id, correo_usuario_invitacion, fecha_registro_invitacion, fecha_usuario_registrado_invitacion, texto_invitacion, estatus_invitacion_id, ticket_registro_id) FROM stdin;
\.


--
-- TOC entry 2451 (class 0 OID 16570)
-- Dependencies: 1738
-- Data for Name: justificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY justificacion (id_justificacion, descripcion_justificacion, fecha_justificacion, idea_id) FROM stdin;
0	Bien, el propósito de esta idea es manifestar nuestro descontento con las políticas de censura que la UAM aplica sobre nuestros compañeros de maringolandia.	2011-04-30	0
1	Otra cosa queme llevó a publicar esta idea, es que nosotros no tenemos ningún interés en nuestra escuela.	2011-04-22	0
2	A pesar de todos los esfuerzos, los compañeros de diseño no se acercan con los de ingeniería, ni visceversa.	2011-05-13	1
3	Tomando en cuenta todo lo que hemos pasado, me parece justo continuar la lucha.	2011-02-11	1
4	Demasiadas clases muertas.	2011-03-21	1
5	Sin tomar en cuenta la actitud apática de muchos profesores, me parece que los alumnos nos merecemos mucho más. No es sencillo llegar hasta aquí como para que una bola de huevones nos frieguen.	2010-05-01	2
6	Lo sabias ya?	2011-08-08	3
7	Ese no amaba bastante, sino, hubiese amado también a nosotros los risueños.	2011-09-09	3
8	Todo gran amor no quiere amor, quiere más.	2015-04-06	4
9	Todas las cosas buenas se acercan a su fin de una amnera tortuosa.	2007-05-05	4
10	El modo de andar de una persona revela ya si sigue su camino.	2008-08-08	5
11	El que se acerca a su fin, baila.	2006-07-07	5
12	Yo he canonizado mi risa.	2022-02-02	6
13	Haciendo señas a todas las aves.	2023-04-04	6
14	Elevad cada vez vuestros corazones y no olvideis las piernas.	2222-01-01	7
15	Aprender pues de mí la sabiduría.	3333-03-03	7
16	Olvidad la melancolía-	1111-11-11	8
17	Ese espíritu bueno e indómito que viene como un huracán.	4444-01-01	8
430	La principal justificación para hacer esto es mi salud.	2011-04-10	400
431	Después es mi salud sexual.	2011-04-10	400
432	Tal vez de las más importantes: mi amado cuerpo, ya está muy maltratado y lo quiero demasiado como para no realizar esta idea.	2011-04-10	400
740	La verdad es que no tengo otra raz'on m'as que quitarme este calor!!!, unque sea un par de grados :)	2011-04-14	710
910	fdsfdsfdsfda	2011-04-16	880
1011	rewrewrew	2011-04-18	991
\.


--
-- TOC entry 2452 (class 0 OID 16580)
-- Dependencies: 1741
-- Data for Name: lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lugar (id_lugar, nombre_lugar, descripcion_lugar, usuario_id, tipo_lugar_id) FROM stdin;
0	Salón Sun UAM Azcapotzalco	Salón que se encuentra en la UAM Azcapotzalco con proyector, mesas, computadoras y pizarrón.	\N	1
1	Salón HO 3er piso UAM Azcapotzalco	Salón que se encuentra en la UAM Azcapotzalco con proyector, mesas y sillas.	\N	3
\.


--
-- TOC entry 2453 (class 0 OID 16585)
-- Dependencies: 1743
-- Data for Name: miembro_comunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY miembro_comunidad (usuario_id, comunidad_id, fecha_inicio_miembro_comunidad, fecha_fin_miembro_comunidad, estatus_miembro_comunidad_id) FROM stdin;
0	0	2011-03-29	\N	1
0	3	2011-03-03	\N	1
0	6	2011-05-11	\N	1
0	7	2011-05-11	\N	1
0	1	2011-05-11	\N	1
1	5	2011-05-11	\N	1
2	2	2011-05-11	\N	1
3	4	2011-05-23	\N	1
5900	5	2011-05-31	\N	1
5900	4	2011-05-31	\N	1
5920	5	2011-05-31	\N	1
5920	4	2011-05-31	\N	1
0	9	2011-05-31	\N	1
5940	5	2011-05-31	\N	1
5940	4	2011-05-31	\N	1
5970	5	2011-05-31	\N	1
5970	4	2011-05-31	\N	1
6190	5	2011-05-31	\N	1
6190	4	2011-05-31	\N	1
6240	3	2011-05-31	\N	1
6240	1	2011-05-31	\N	1
6270	5	2011-06-01	\N	1
6270	4	2011-06-01	\N	1
7360	5	2011-06-13	\N	1
7360	4	2011-06-13	\N	1
5	10	2011-06-11	\N	1
4	8	2011-06-20	\N	1
7810	5	2011-06-21	\N	1
7810	4	2011-06-21	\N	1
8040	5	2011-06-23	\N	1
8040	4	2011-06-23	\N	1
8300	1	2011-07-02	\N	1
8300	0	2011-07-02	\N	1
8430	5	2011-07-03	\N	1
8430	4	2011-07-03	\N	1
8490	5	2011-07-03	\N	1
8490	4	2011-07-03	\N	1
\.


--
-- TOC entry 2454 (class 0 OID 16588)
-- Dependencies: 1744
-- Data for Name: necesidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY necesidad (id_necesidad, descripcion_necesidad, fecha_necesidad, idea_id, estatus_necesidad_id) FROM stdin;
360	Un diseñador gráfico	2011-04-10	330	1
361	Un ingeniero en sistemas	2011-04-10	330	1
362	Una sociologa	2011-04-10	330	1
363	Esta idea necesita un líder.	2011-04-10	330	1
450	Trabajar	2011-04-10	400	1
451	Buscar trabajos de medio tiempo o freelance.	2011-04-10	400	1
452	Esta idea necesita un líder.	2011-04-10	400	1
760	Disposisi'on se;ores, eso es lo 'unico necesario.	2011-04-14	710	1
761	Esta idea necesita un líder.	2011-04-14	710	1
930	gfdfdgsgs	2011-04-16	880	1
931	Un programador	2011-04-16	880	1
932	Un vendedor	2011-04-16	880	1
933	Una hostess	2011-04-16	880	1
934	Esta idea necesita un líder.	2011-04-16	880	1
1021	rewrewrew	2011-04-18	991	1
1022	Esta idea necesita un líder.	2011-04-18	991	1
1160	Ingenieros en computacion.	2011-04-25	1150	1
1161	Arquitectos de software.	2011-04-25	1150	1
1162	Esta idea necesita un líder.	2011-04-25	1150	1
1220	Al menos necesito 13 participantes para iniciar este grupo de estudio.	2011-04-25	1210	1
1221	Esta idea necesita un líder.	2011-04-25	1210	1
1300	$10,000 pesos, para poder convertirnos en Asociación y aprovechar algunos de los privilegios que esto conlleva.	2011-04-27	1290	1
1301	Facilitador de comida. Una persona que se encuentre en el negocio de la comida sería de gran ayuda para la causa.	2011-04-27	1290	1
1302	Un lugar para poner el restaurante. Necesita ser más o menos grande, que al menos quepan 100 estudiantes.	2011-04-27	1290	1
1303	Esta idea necesita un líder.	2011-04-27	1290	1
1304	Esta idea necesita un líder.	2011-04-27	1291	1
1360	Ideas	2011-04-27	1350	1
1361	Esta idea necesita un líder.	2011-04-27	1350	1
1420	Disposición de Eduardo Pérez	2011-04-28	1410	1
1421	Disposición de Jorge Bautista	2011-04-28	1410	1
1422	Esta idea necesita un líder.	2011-04-28	1410	1
1550	Disposición de Beti	2011-04-28	1540	1
1551	Disposición de Jorge	2011-04-28	1540	1
1552	Computadora con Java y VUE instalados.	2011-04-28	1540	1
1553	Esta idea necesita un líder.	2011-04-28	1540	1
1620	Al menos un alumno	2011-04-28	1610	1
1621	Una computadora con Java y Netbeans instalados.	2011-04-28	1610	1
1622	Esta idea necesita un líder.	2011-04-28	1610	1
1700	Esta idea necesita un líder.	2011-05-03	1690	1
1760	Necesito que la idea se inserte.	2011-05-03	1750	1
1761	Necesito que la imagen seleccionada se inserte.	2011-05-03	1750	1
1762	Necito poder ver los detalles de la idea.	2011-05-03	1750	1
1763	Esta idea necesita un líder.	2011-05-03	1750	1
1830	Programadores Java con al menos 1 año de experiencia.	2011-05-03	1820	1
1831	Un salón al menos con 10 computadoras.	2011-05-03	1820	1
1832	Esta idea necesita un líder.	2011-05-03	1820	1
1900	No me culpes porque!!	2011-05-03	1890	1
1901	Esta idea necesita un líder.	2011-05-03	1890	1
1970	Una máquina del tiempo	2011-05-04	1960	1
1971	Esta idea necesita un líder.	2011-05-04	1960	1
2090	cgdfgfdsgfdsgfd	2011-05-05	2080	1
2091	Esta idea necesita un líder.	2011-05-05	2080	1
2092	ytreytre	2011-05-05	2081	1
2093	ytreytrey	2011-05-05	2081	1
2094	Esta idea necesita un líder.	2011-05-05	2081	1
2150	fdsafdsafdsafds	2011-05-05	2140	1
2151	fsdafdsafdsafdsafds	2011-05-05	2140	1
2152	fdsafdsafds	2011-05-05	2140	1
2153	Esta idea necesita un líder.	2011-05-05	2140	1
2220	gfdsgfdsg	2011-05-05	2210	1
2221	fdsafdsfd	2011-05-05	2210	1
2222	Esta idea necesita un líder.	2011-05-05	2210	1
2223	fdsafdsfdsaf	2011-05-05	2211	1
2224	fdsafdsfdsaf	2011-05-05	2211	1
2225	fdsafdsafdsa	2011-05-05	2211	1
2226	Esta idea necesita un líder.	2011-05-05	2211	1
2290	Alumnos fotógrafos	2011-05-05	2280	1
2291	Cámaras fotográficas	2011-05-05	2280	1
2292	Esta idea necesita un líder.	2011-05-05	2280	1
2360	dsafdsfsda	2011-05-05	2350	1
2361	fdsafdsafdsa	2011-05-05	2350	1
2362	Esta idea necesita un líder.	2011-05-05	2350	1
2363	gfdsgfdsgf	2011-05-05	2351	1
2364	Esta idea necesita un líder.	2011-05-05	2351	1
2365	ffdsafdsfdsafds	2011-05-05	2352	1
2366	fdsafdsfdsafds	2011-05-05	2352	1
2367	Esta idea necesita un líder.	2011-05-05	2352	1
2368	fdsfdsfdsfdfsfdsad	2011-05-05	2353	1
2369	fdsfdsfdsfdsa	2011-05-05	2353	1
2420	Esta idea necesita un líder.	2011-05-05	2353	1
2421	Esta idea necesita un líder.	2011-05-05	2354	1
2450	Quiero pasarme la vida en tus brazos!!	2011-05-05	2440	1
2451	Esta idea necesita un líder.	2011-05-05	2440	1
2452	dsafsdfdsafds	2011-05-05	2441	1
2453	fdsafdsafdsfadsa	2011-05-05	2441	1
2454	Esta idea necesita un líder.	2011-05-05	2441	1
2455	fdsafdsafd	2011-05-05	2442	1
2456	Esta idea necesita un líder.	2011-05-05	2442	1
2457	hgfhgfdhgfdhg	2011-05-05	2443	1
2458	Esta idea necesita un líder.	2011-05-05	2443	1
2459	Somos culpables	2011-05-05	2444	1
2510	Esta idea necesita un líder.	2011-05-05	2444	1
2511	fdsfadsafsda	2011-05-05	2445	1
2512	fdsafdsafdsafdsfdsfdfds	2011-05-05	2445	1
2513	Esta idea necesita un líder.	2011-05-05	2445	1
2514	hgfhgfdhgfdhgfdhgfdhgfdhd	2011-05-05	2446	1
2515	Esta idea necesita un líder.	2011-05-05	2446	1
2540	eSTA NOCHE NO HAY CONTROL	2011-05-05	2530	1
2541	Esta idea necesita un líder.	2011-05-05	2530	1
2610	gfdsgfdsgfdg	2011-05-05	2600	1
2611	Esta idea necesita un líder.	2011-05-05	2600	1
2612	gfdsgfdsgfdgsd	2011-05-05	2601	1
2613	Esta idea necesita un líder.	2011-05-05	2601	1
2614	fdsafdsaf	2011-05-05	2602	1
2615	fdsfdsafdsfsdfsdfdsfsdfsd fdsafds	2011-05-05	2602	1
2616	Esta idea necesita un líder.	2011-05-05	2602	1
3320	fdsafdsafdsaf	2011-05-07	3310	1
3321	Esta idea necesita un líder.	2011-05-07	3310	1
5550	fdsafdsafd	2011-05-30	5540	1
5760	Será	2011-05-31	5750	1
2820	Pudieras pasar la mitad de lo que yo pasé.	2011-05-05	2810	1
2821	Esta idea necesita un líder.	2011-05-05	2810	1
2822	dddddddddddddddddddddddddd	2011-05-05	2811	1
2823	Esta idea necesita un líder.	2011-05-05	2811	1
3390	Fue culpa del calor.	2011-05-08	3380	1
3391	Esta idea necesita un líder.	2011-05-08	3380	1
3392	fgsdgfdsgfdgfdsg	2011-05-08	3381	1
3393	Esta idea necesita un líder.	2011-05-08	3381	1
5610	uuuuuuuu	2011-05-30	5600	1
5611	oooooooooooooooooooooooooooooooooooooo	2011-05-30	5601	1
3030	gfdsgfdsgfdsg	2011-05-05	3020	1
3031	fdsafdsafdsafdsa	2011-05-05	3020	1
3032	Esta idea necesita un líder.	2011-05-05	3020	1
5761	Necesario	2011-05-31	5750	1
5820	w	2011-05-31	5810	1
5821	u	2011-05-31	5810	1
6010	Podcast!!	2011-05-31	6000	1
6011	Podcast!!	2011-05-31	6000	1
6220	a	2011-05-31	6210	1
6221	b	2011-05-31	6210	1
6222	A	2011-05-31	6211	1
3240	Alumnos	2011-05-05	3230	1
3241	Esta idea necesita un líder.	2011-05-05	3230	1
6223	B	2011-05-31	6211	1
6224	a	2011-05-31	6212	1
3950	Un ingeniero de viento	2011-05-11	3940	1
3951	20 ventiladores	2011-05-11	3940	1
3952	Esta idea necesita un líder.	2011-05-11	3940	1
4050	Una computadora con procesador no menor a PIV con 3 GHZ	2011-05-16	4040	1
4051	Conexión a internet no menor a 2mb	2011-05-16	4040	1
4052	Esta idea necesita un líder.	2011-05-16	4040	1
4053		2011-05-16	4041	1
4054	Una hamaca!	2011-05-16	4041	1
4055	2 Six de cervezas	2011-05-16	4041	1
4056	Una buena vista y buena compañia...con la compañia basta.	2011-05-16	4041	1
4057	Esta idea necesita un líder.	2011-05-16	4041	1
4058	4	2011-05-16	4042	1
4059	Esta idea necesita un líder.	2011-05-16	4042	1
4440	Disposición de aprender	2011-05-17	4430	1
4441	Una cámara fotográfica, no importa lo chafa o lo profesional que esté.	2011-05-17	4430	1
4442	Sentido del humor	2011-05-17	4430	1
4443	Esta idea necesita un líder.	2011-05-17	4430	1
4780	Un auto (que circule los martes!!)	2011-05-23	4770	1
4781	Unos 1000 pesos para el boleto.	2011-05-23	4770	1
4782	Esta idea necesita un líder.	2011-05-23	4770	1
5020	Estudiantes de servicio social	2011-05-24	5010	1
5021	Apoyo técnico para administrar servidores	2011-05-24	5010	1
5022	Esta idea necesita un líder.	2011-05-24	5010	1
6620	Hipster 1	2011-06-06	6610	1
6621	Hipster 3	2011-06-06	6610	1
6622	Cel 1	2011-06-06	6611	1
6623	Cel 2	2011-06-06	6611	1
6670	Dice 1	2011-06-06	6660	1
6671	Dice 2	2011-06-06	6660	1
6720	fds	2011-06-06	6710	1
6721	fds	2011-06-06	6710	1
6722	rew	2011-06-06	6710	1
6780	vive	2011-06-07	6770	1
6781	muere	2011-06-07	6770	1
6782	uno	2011-06-07	6771	1
6783	dos	2011-06-07	6771	1
6910	Uno	2011-06-09	6900	1
6911	Dos	2011-06-09	6900	1
6912	Tres	2011-06-09	6900	1
6913	uno	2011-06-09	6901	1
6914	dos	2011-06-09	6901	1
6915	tres	2011-06-09	6901	1
7250	DIsco "que entren los que quieran entrar" de calle 13	2011-06-13	7240	1
7251	Disco "conmigo vienen los de atrás"	2011-06-13	7240	1
7252	Disco donde viene la canción de calle 13	2011-06-13	7240	1
7320	No necesitamos piano	2011-06-13	7310	1
7321	Sí necesitamos una cámara fotográfica	2011-06-13	7310	1
7840	Imaginación	2011-06-21	7830	1
7841	Nueva música	2011-06-21	7830	1
7880	Un perro chewbaca	2011-06-23	7870	1
7881	Cámara fotográfica	2011-06-23	7870	1
8250	Un navegador	2011-07-02	8240	1
8251	Unas palomitas de maíz.	2011-07-02	8240	1
8390	Disponibilidad	2011-07-03	8380	1
8560	Primos	2011-07-03	8550	1
8561	XBOX	2011-07-03	8550	1
8562	PS3	2011-07-03	8550	1
8563	Guitar Hero	2011-07-03	8550	1
8710	Disco de Nirvana o rola MP3	2011-07-10	8700	1
8711	Un buen equipo de sonido para no arruinar la canción.	2011-07-10	8700	1
8810	Conocidos fans de nirvana	2011-07-12	8800	1
8890	Pensar en ideas	2011-07-12	8841	1
8891	Trabajar en ideas	2011-07-12	8841	1
\.


--
-- TOC entry 2455 (class 0 OID 16596)
-- Dependencies: 1746
-- Data for Name: objetivo_especifico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY objetivo_especifico (id_objetivo_especifico, descripcion_objetivo_especifico, fecha_objetivo_especifico, idea_id) FROM stdin;
0	Sensibilizar a los alumnos sobre el futuro de sus carrera.	2011-01-01	0
1	Motivar a los egresados a retroalimentar su escuela con sus conocimientos.	2011-02-01	0
2	Tener la calma para mantener una buena conversación con SEAM	2011-03-03	1
3	Poner un muro para no dejar pasar a alumnos ni maestros huevones.	2011-03-04	1
4	Conquistar el terreno laboral de la UAM con elementos de primera calidad	2011-04-06	2
5	Llamar al presidente de la república para mentarle la madre.	2013-05-09	2
6	Guardaos de la piedad.	2002-03-21	3
7	Aquello que ama quiere aún crearlo.	2023-11-11	3
8	Todos vosotros sabios celebres.	2011-04-04	4
9	Aborrece como los perros al lobo.	2012-01-01	4
10	La verdad está donde está el pueblo?	2013-10-10	5
11	Yo he salido del publo que aí también me ha venid la luz de dios.	2014-03-03	5
12	Sufridos y astutos como el asno. Y más de un poderoso engancho delante de sus corceles un sabio célebre. 	2015-02-01	6
13	Amo por mi parte al que se va a los desiertos sin dios, abandonando su corazón reverente.	2016-03-07	6
14	Su sed no le decide a imitar. Sin dios, la voluntad león, libre de los deleites de los...	2017-04-04	7
15	Porque tiran siempre como burros del carro del pueblo, no pasan de servidores aunque lleven dorados arreos.	2018-01-01	7
16	El espíritu y la virtud de tu amo deben crecer por estar tú a su servicio.	2011-06-06	8
17	Pero seguid siendo pueblo aún en vuestras virtudes.	2012-05-05	8
420	Hacer peleas frente al espejo	2011-04-10	400
421	Caminar laaaramente con mi perrita	2011-04-10	400
422	Pedirle a pepe que me de entrenamiento básico de box	2011-04-10	400
423	Con el tiempo, poner un costal de box en casa...donde quiera que eso sea.	2011-04-10	400
730	El punto es que no necesitamos, a mi parecer, objetivos espec'ificos	2011-04-14	710
731	Me parece que el usuario se confundir'ia	2011-04-14	710
900	dsfdsafdsa	2011-04-16	880
1070	rewqrewq	2011-04-18	991
\.


--
-- TOC entry 2456 (class 0 OID 16601)
-- Dependencies: 1748
-- Data for Name: objetivo_general; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY objetivo_general (id_objetivo_general, descripcion_objetivo_general, fecha_objetivo_general, idea_id) FROM stdin;
0	Lograr una dieta balanceada en la cafetería de la UAM	2011-03-04	0
1	Mantener los mismos precios en la comida de la cafetería durante toda la generación.	2011-04-21	0
2	Incitar a tener un sentido de identidad en todos los alumnos de la UAM	2011-05-02	1
3	Inventar un nombre para la mascota de la UAM, la neta el que le pusieron está muy baboso.	2011-03-01	1
4	Motivar un conocimiento más amplio sobre los astros que rodean nuestra tierra.	2011-04-09	2
5	Tener bastantes argumentos como para determinar la validez de materias externas aunque no sean en otras UAMS.	2011-06-01	2
6	Terminar mi PT antes de exámenes de recuperación, cómo? Pues no saliendo de mi cuarto-cueva.	2011-07-09	8
7	Lograr que la profesora Lizbeth no se quede con una impresión de que soy bien huevón, porque no es así.	2011-04-03	8
8	Cuidar más mis plantas, en verdad soy descuidado con ellas :S	2011-05-09	7
9	Alimentar mejor a mi perra, las bolsitas de comida húmeda de pedigree resultaron bastante buenas.	2004-01-01	7
340	Mostrando logos de la UAM en cada salón de clases.	2011-04-10	330
410	Lograr darle salud a mi cuerpo	2011-04-10	400
411	Mantenerlo bien hasta la vejez	2011-04-10	400
720	Quitarme este cabrons'isimo calor!!	2011-04-14	710
721	Saborear rica grosella :)	2011-04-14	710
722	Mantener mi temperatra por debajo de los 30 grados C	2011-04-14	710
890	hdjskfhdsjka	2011-04-16	880
891	dsmafjdlsa	2011-04-16	880
1004	rewqreqr	2011-04-18	991
\.


--
-- TOC entry 2457 (class 0 OID 16606)
-- Dependencies: 1750
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permiso (usuario_id, rol_id) FROM stdin;
0	0
0	1
0	2
1	0
1	1
2	2
\.


--
-- TOC entry 2458 (class 0 OID 16609)
-- Dependencies: 1751
-- Data for Name: pregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pregunta (id_pregunta, pregunta_pregunta, respuesta_pregunta, usuario_pregunta_id, idea_id, estatus_pregunta_id, fecha_creacion_pregunta, fecha_fin_pregunta, usuario_respuesta_id) FROM stdin;
5	¿De quién me he reido?	De todossus pasados.	1	2	1	2011-01-01	2013-01-01	3
7	Volaba a medios dias más cálidos!	Cojear como los poetas!!	4	5	1	2044-01-01	\N	0
9	A concentrar y unir todo lo que el hombre	No es más que fragmento y enigma	0	5	1	2001-09-09	2014-06-06	6
11	El que no puede mandarse	Debe obedecer. Y ay quienes saben mandarse, pero no se saben obedecer.	6	8	1	1111-01-01	2222-02-02	4
1200	¿Esto será una pregunta señor?	\N	0	1150	1	2011-04-25	\N	\N
1460	¿Esto será una pregunta señor?	\N	0	1410	1	2011-04-28	\N	\N
1590	¿Esto será una pregunta señor?	\N	0	1540	1	2011-04-28	\N	\N
1660	¿Esto será una pregunta señor?	\N	0	1610	1	2011-04-28	\N	\N
1740	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	1690	1	2011-05-03	\N	\N
1790	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	1750	1	2011-05-03	\N	\N
1860	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	1820	1	2011-05-03	\N	\N
1930	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	1890	1	2011-05-03	\N	\N
2000	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	1960	1	2011-05-04	\N	\N
2110	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2080	1	2011-05-05	\N	\N
2111	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2081	1	2011-05-05	\N	\N
2180	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2140	1	2011-05-05	\N	\N
2250	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2210	1	2011-05-05	\N	\N
2251	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2211	1	2011-05-05	\N	\N
2320	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2280	1	2011-05-05	\N	\N
2390	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2350	1	2011-05-05	\N	\N
2391	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2351	1	2011-05-05	\N	\N
2392	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2352	1	2011-05-05	\N	\N
2393	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2353	1	2011-05-05	\N	\N
2394	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2354	1	2011-05-05	\N	\N
2480	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2440	1	2011-05-05	\N	\N
2481	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2441	1	2011-05-05	\N	\N
2482	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2442	1	2011-05-05	\N	\N
2483	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2443	1	2011-05-05	\N	\N
2484	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2444	1	2011-05-05	\N	\N
2485	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2445	1	2011-05-05	\N	\N
2486	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2446	1	2011-05-05	\N	\N
2570	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2530	1	2011-05-05	\N	\N
2640	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2600	1	2011-05-05	\N	\N
2641	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2601	1	2011-05-05	\N	\N
2642	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2602	1	2011-05-05	\N	\N
2850	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2810	1	2011-05-05	\N	\N
2851	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	2811	1	2011-05-05	\N	\N
3060	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	3020	1	2011-05-05	\N	\N
3270	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	3230	1	2011-05-05	\N	\N
3350	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	3310	1	2011-05-07	\N	\N
3420	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	3380	1	2011-05-08	\N	\N
3421	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	3381	1	2011-05-08	\N	\N
4760	El punto es demostrar que se puede preguntar en esta idea.	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	0	3940	1	2011-05-23	2011-05-24	0
4990	Acabas de hacer una publicación en la bitácora??	Sí, acabo de hacerla.	0	4770	1	2011-05-24	2011-05-24	0
4640	Uy que bueno que ya está funcionando. La verdad ya casi chillo!! jajaja	Tu quieres guerra??	0	1410	1	2011-05-21	2011-05-24	0
4891	Ok, Sroll deshabilitado	OKOK	0	1410	1	2011-05-24	2011-05-24	0
3980	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	3940	1	2011-05-11	\N	\N
4080	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	2	4040	1	2011-05-16	\N	\N
4081	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	2	4041	1	2011-05-16	\N	\N
4082	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	1	4042	1	2011-05-16	\N	\N
4460	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	4430	1	2011-05-17	\N	\N
4890	Hacer pregunta para que se habilite el scroll.	OK	0	1410	1	2011-05-24	2011-05-24	0
4761	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	Los versos escritos bajo la luz estrellada.	0	4770	1	2011-05-23	2011-05-23	5
4490	Escuchando charangas....ya termina este PT ... :-)	Wow!!!	0	251	1	2011-05-18	2011-05-24	0
4530	Preguntando, preguntando, sí?	Preguntando??	0	3310	1	2011-05-18	2011-05-24	0
4531	HOla	Respueeeesta!!!	0	3310	1	2011-05-18	2011-05-24	0
4532	Preguntando si los Rage Against The Machine son buenos o no...	Sí, de hecho son bastante buenos. No dejes de escuchar su disco "¿¿¿???"	0	3310	1	2011-05-18	2011-05-24	0
4536	Eso es una camara real?? xD	Así es, es una cámara bastante real.	0	4430	1	2011-05-18	2011-05-24	0
4537	Ahora sí, preguntemos,	Sí, pregguuuuuuntenme.	0	4430	1	2011-05-18	2011-05-24	0
4590	Porqué explotó dos veces? :O	Tal vez había un segundo tanque adentro!! :O	0	2602	1	2011-05-18	2011-05-24	0
4600	Talento musical.	Talento musical?? Ja!	0	4430	1	2011-05-18	2011-05-24	0
4011	Decía cosas raras??	Sí, balbuceaba mucho!!	0	3940	1	2011-05-16	2011-05-24	0
3550	Are you looking at me??	No, I'm looking at the mirror! :P	2	3380	1	2011-05-10	2011-05-24	0
3570	Dime.	Me	2	3381	1	2011-05-10	2011-05-24	0
5050	Esta es el área de preguntas, comentarios, críticas. Por favor no dudes en hacerlas, tus pensamientos son valiosos para nosotros.	\N	0	5010	1	2011-05-24	\N	\N
4950	Pregunta para comprobar el Ajax	Respuesta de la pregunta.	0	2080	1	2011-05-24	2011-05-24	1
6040	Que tipo de podcast son?	Pues solo puedo decirle que no son podcast normales :)	5970	6000	1	2011-05-31	2011-05-31	5970
6161	Y me pregunté a mi mismo...: mi mismo!!	Y me contesté!: Yo mismo!!	5970	6000	1	2011-05-31	2011-05-31	5970
4951	Ok, otra pregunta para comprobar!! xD	Comprobar qué??	0	2080	1	2011-05-24	2011-06-02	0
5051	Oiga, como que un nuevo plan de la Maestría??	Seeee, nueva maestría en la UAM	0	5010	1	2011-05-24	2011-06-02	0
3470	Marco a la deriva??	Ese Marquito ya nunca aparece por aquí!!	0	3380	1	2011-05-09	2011-06-02	0
3480	Están ustedes relacionados con los creadores de la religión?	Ehhh nop. La religión no es una creación, de ninguna manera lo es.	0	3380	1	2011-05-09	2011-06-02	0
4010	¿Cuál es la razón de que no siempres e presenten todas las imágenes?	Hmmm, tal vez sea la velocidad con la que se copian las imágenes del path real donde la aplicación está desplegada y el path virtual.	0	7	1	2011-05-16	2011-06-02	0
3481	Piensan responder alguna de mis preguntas?	Eso no es de mi incumbencia. No me pagan por responderte.	0	3380	1	2011-05-09	2011-06-02	0
3491	fsafdsafdsfsdfdsfadsfdsa	opopopfodogofogpfdogpfdogpofdpgfd	0	3380	1	2011-05-09	2011-06-02	0
3530	Preguntaré lo que siempre he querido preguntarle!!	Pues hazlo...a mí que...	0	3380	1	2011-05-09	2011-06-02	0
3510	Mi pregunta es esta.	ajam...	0	3380	1	2011-05-09	2011-06-02	0
3500	Es esta idea seguida por alquien de respeto?\n\nSaludos.	Espero que tú seas de respeto...ya que tú la sigues xD.	0	3380	1	2011-05-09	2011-06-02	0
3520	Ahora sí, hagamos la pregunta.	Ea ea ea!!	0	3380	1	2011-05-09	2011-06-02	0
6430	En verdad necesitas tanto el color naranja??	hmmm, pues me gusta más que el verde claro :P!!	5670	2280	1	2011-06-03	2011-06-03	0
3490	¿Es verdad que esta idea no es original? Es decir, que es solo un "remake" de "código fama"? De cualquier manera se me hace una buena idea. Les envío muchos saludos.	Claro que el concepto es parecido, sin embargo, en definitiva no es lo mismo. Por otro lado tiene conceptos originales que iremos presentando.	0	3380	1	2011-05-09	2011-06-02	0
6530	Porqué se elimina la barra de título del panel??	Necesito actualizar la versión de PrimeFaces a 3.0, pero Seam solo acepta hasta la 1.1	5670	4041	1	2011-06-06	2011-06-06	2
6550	Sonidito de pistola de juguete??	Buenas referencias de Calle 13.	5670	4040	1	2011-06-06	2011-06-06	2
6551	Cómo puede combatir un soldado el miedo a la muerte??	Con música.	5670	4040	1	2011-06-06	2011-06-06	2
6552	Combatiendo el miedo a la muerte en vietnam,	En serio con música...	5670	4040	1	2011-06-06	2011-06-06	2
6553	La música en vietnam formaba un papel importante en guerra.	Ps te estoy diciendo!! xD	5670	4040	1	2011-06-06	2011-06-06	2
6570	Pa cambiar el mundo, desnuda tu coraje!!	ooooodales, buena frase!!	5670	4040	1	2011-06-06	2011-06-06	2
800	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	710	1	2011-04-14	2011-06-07	0
490	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	400	1	2011-04-10	2011-06-07	0
390	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	330	1	2011-04-10	2011-06-07	0
4	¿Irás este viernes 4 de febrero al TelmexHub?	Sí, definitivamente tengo que estar ahí, hacer la disciplina de no faltar los viernes.	2	7	1	2011-02-17	2011-06-07	0
3	Cuál es tu fecha fuego? Es decir ¿cuándo crees que ya estarás desarrollando en forma con un ambiente de desarrollo armado?	1 semana, es decir 8 de febrero...demonios es lo de infotec...ni pedo, pero sí, el 8 de febrero.	2	7	1	2011-02-17	2011-06-07	0
0	Cómo piensas resolver la integración con maven?	Dedicandole un buen rato, el inicio será lo más complidado	2	7	1	2011-02-17	2011-06-07	0
1340	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	1290	1	2011-04-27	2011-06-07	0
1341	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	1291	1	2011-04-27	2011-06-07	0
1400	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	1350	1	2011-04-27	2011-06-07	0
1260	¿Esto será una pregunta señor?	Ya chole con lo del lider!!!	0	1210	1	2011-04-25	2011-06-07	0
1061	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	991	1	2011-04-18	2011-06-07	0
960	¿Esto será una pregunta señor?	Ya chole con lo del lider.!	0	880	1	2011-04-16	2011-06-07	0
6470	Osito bimbo!	Puerquito marinela!!	2	2080	1	2011-06-06	2011-06-07	0
6490	Javier Aguirre miente!!	Jajajaj pues claro que miente!!	2	2080	1	2011-06-06	2011-06-07	0
6961	Las ganas de conocer lo que hay después del mar!!	Seeee, bonitas ganas!!	2	5600	5	2011-06-09	2011-06-09	0
6962	Yo no creo en la iglesia, pero creo en tu mirada	\N	2	5600	6	2011-06-09	\N	\N
7000	A caray, ese es el palacio de bellas artes??	EEEEp, ese merol.	0	6770	1	2011-06-09	2011-06-09	0
7400	quiero preguntar sobre el precio de una cama king size.	\N	5670	0	6	2011-06-14	\N	\N
7070	Buenas rolas calle 13!!	Cuaderno amarillo.	0	6900	5	2011-06-09	2011-06-09	5670
7431	Directamente desde el infierno.	Pues más o menos xD	5670	6900	1	2011-06-15	2011-06-23	5670
7930	Momento, neta neta es el perro chewbaca??	Sí, en verdad es el primero de varios. Te maquillamos el tuyo :). Saludos.	0	7870	5	2011-06-23	2011-07-03	0
8530	LinkUAM: Porqué cancelaron mi respuesta?	\N	0	7870	6	2011-07-03	\N	\N
8600	Preguntando desde ephiphany.	Contestando para epiphany,	0	8380	1	2011-07-03	2011-07-04	5670
6	Me he sentado a orillas de su gran callede tumbas	Que pequeño es lo mejor de ellos	0	3	1	2011-03-03	\N	4
1	No crees que es mejor aprender RichFaces? Es más común.	No lo creo, rich faces no me da las corazonadas de primefaces.	3	4	1	2011-02-17	2011-02-18	\N
2	De verdad piensas terminar tu PT este trimestre?	Sino lo termino, dejaré de intentar terminar mi carrera. Tú dirás.	5	1	1	2011-02-17	2011-02-18	\N
4533	gfdsgfds	\N	0	4042	1	2011-05-18	\N	\N
4534	fdsfdsfdsfdsa	\N	0	4042	1	2011-05-18	\N	\N
4535	fdsfdsfdsfdsa	\N	0	4042	1	2011-05-18	\N	\N
6370	En que momento me volví un seguidor?	\N	0	6	1	2011-06-02	\N	\N
10	Y así, aún los más pobres pescadores	Reman entonces con dorados remos.	4	8	1	2222-02-02	3333-03-03	2
8	El hombre es una cosa que debe ser superada	Gozoso de su medio día y de su tarde	6	6	1	2033-02-02	\N	5
6160	Probanto pregunta sin transient!!	Así es, el tansient quedó controlado!!	1	6000	1	2011-05-31	2011-05-31	5970
6450	Nada será mágicamente resuelto por las instituciones??	\N	5670	4	1	2011-06-06	\N	\N
6451	Si las máquinas con perfectos el hombre no debe de ser perfecto??	\N	2	3	1	2011-06-06	\N	\N
6510	Futbol!	\N	0	3	1	2011-06-06	\N	\N
6960	Tu vendes porque tu mismo te compras tus propios discos!!!	\N	5670	6210	1	2011-06-09	\N	\N
7401	ghcjfghjfghj	\N	5670	6611	1	2011-06-14	\N	\N
7402	ghcjfghjfghj	\N	5670	6611	1	2011-06-14	\N	\N
8160	Y es que yo creo que me quiereeeee, sí!!!	\N	5670	6900	1	2011-06-30	\N	\N
8601	Preguntando desde ephiphany. 22222	\N	0	8380	1	2011-07-03	\N	\N
7191	Estás clavada en mí!!	\N	5670	1410	1	2011-06-10	\N	\N
7403	ghcjfghjfghj	\N	5670	6611	1	2011-06-14	\N	\N
7404	qwerty	\N	5670	6611	1	2011-06-14	\N	\N
7430	fghjghgj	\N	0	6900	1	2011-06-15	\N	\N
7490	Pero entonces cómo??	\N	0	5010	1	2011-06-16	\N	\N
7190	Y cuál será tu técnica para hacer algo productivo??	Pues en realidad pondré a lalito a ver videos de youtube con contenido deportivo!!  xD.	5670	1410	1	2011-06-10	2011-06-10	0
8620	Cómo le hago para participar?	Sólo compra 30 pesos de garabatos!! Y listo :)	0	8550	1	2011-07-10	2011-07-10	8430
\.


--
-- TOC entry 2459 (class 0 OID 16617)
-- Dependencies: 1753
-- Data for Name: reporte_abuso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporte_abuso (id_reporte_abuso, nota_reporte_abuso, usuario_id, tipo_reporte_abuso_id, idea_id, fecha_reporte_abuso, estatus_reporte_abuso_id, accion_reporte_abuso_id) FROM stdin;
7950	Ah no mams!! están publicando plantas!!	0	0	5010	2011-06-23	1	2
7980	Mucha luz.	5670	0	8	2011-06-23	1	1
8150	Marcado.	0	0	991	2011-06-30	1	1
7082	Cuidado que ahí viene una!	5670	0	6900	2011-06-09	1	2
6854	Veamos si se desactiva la idea : 2:1	5670	0	6212	2011-06-07	1	2
6855	Veamos si se desactiva la idea : 2:2	5670	0	6212	2011-06-07	1	2
6856	Veamos si se desactiva la idea : 3:1	5670	0	4040	2011-06-07	1	2
6852	Veamos si se desactiva la idea : 1:1	5670	0	6211	2011-06-07	1	2
6853	Veamos si se desactiva la idea : 1:2	5670	0	6211	2011-06-07	1	2
6880	Demasiados mounstros presenntes!!!	5670	3	6	2011-06-08	1	2
6881	Me ubicand entro de lo marginal pero en algún momento todos nos portamos mal.	5670	1	6	2011-06-08	1	2
6890	Reporte 1	5670	0	2811	2011-06-08	1	2
6991	Reporte 3	5670	0	6901	2011-06-09	1	2
6950	Lo que sientes tú, lo siento yo!!	5670	0	6210	2011-06-09	1	2
6990	Reportar idea de mariposas!	5670	0	6901	2011-06-09	1	2
6391	De nuez estoy seguro!! xD	5670	2	5750	2011-06-06	0	2
6421	Hola reporte!!	5670	0	2280	2011-06-06	0	2
6422	Nuevo reporte.	5670	0	2280	2011-06-06	0	2
6423	Reporte 14:44	5670	0	2280	2011-06-06	0	2
6424	Ya valiste main!	5670	0	2280	2011-06-06	0	2
6425	Pues solo porque no se me hace onda!! xD	5670	0	2280	2011-06-06	0	2
6426	Pues solo porque no se me hace onda 2!!	5670	0	2280	2011-06-06	0	2
7021	O sí???	0	0	6770	2011-06-09	1	2
0	Encontré frases que agreden a la gente negra dentro de esta idea: URL. Me parece que deberían de tener más cuidado con eso.	0	0	1	2011-06-06	1	2
1	En esta idea se está promocionando información sobre productos milagro, la cuál es falsa.	1	1	2	2011-06-06	1	2
3	Esta idea sirve para ligar. No me parece una mala idea :), pero creo que va contra las políticas de Link.	2	3	4	2011-06-06	1	2
6390	Y es que estoy seguro de que esta idea incita a la violencia!!. Saludos.	5670	0	5750	2011-06-06	1	2
6420	Me parece que un señor con sombrero no debería de estar en esta idea!! xD	5670	3	2280	2011-06-06	1	2
2	De manera figurada se maneja información sobre esclavismo en esta idea.	0	2	3	2011-06-06	1	2
6760	Por favor, suspendan mi idea :)	5670	0	6660	2011-06-06	1	2
6761	Soy cesarin, eliminen esta idea por favor :)	5670	0	6710	2011-06-06	1	2
6830	No me vengas a amenazar con la cia.	0	0	6771	2011-06-07	1	2
6840	Es el último disco de calle 13!!	5670	2	4770	2011-06-07	1	2
6841	Por eso tiene llena de plomo su panza!	5670	0	6770	2011-06-07	1	2
6842	Reporte de palacio de bellas artes: 1	5670	0	6770	2011-06-07	1	2
6843	Reporte de palacio de bellas artes: 2	5670	1	6770	2011-06-07	1	2
6844	Reporte de palacio de bellas artes: 3	5670	1	6770	2011-06-07	1	2
6850	Cuál guerrero?? :  1	5670	0	6611	2011-06-07	1	2
6851	Cuál guerrero?? :  2	5670	1	6611	2011-06-07	1	2
7020	Mentira, ese no es un palacio!!!	0	0	6770	2011-06-09	1	2
7022	Sin música el residente calle 13 no puede existir!!	5670	0	6770	2011-06-09	1	2
7023	Esto se está poniendo feo!! :O	5670	0	6770	2011-06-09	1	2
6857	Veamos si se desactiva la idea : 3:2	5670	0	4040	2011-06-07	1	2
7140	Levantando reporte para poder eliminar a un usuario.	0	0	6900	2011-06-10	1	2
7141	ahora sí, bye	0	0	6900	2011-06-10	1	2
7142	De nuevo	0	0	6900	2011-06-10	1	2
7090	Reportando.	0	0	6212	2011-06-10	1	2
7150	Reporte para poder eliminar una idea.	5670	0	1	2011-06-10	1	2
7151	Más.	5670	0	1	2011-06-10	1	2
7160	Reportando como prometimos.	5670	0	3381	2011-06-10	1	2
7161	Nuevo reporte.	5670	0	6771	2011-06-10	1	2
7024	Reportar!!	5670	0	6770	2011-06-09	1	2
7080	Reporte de ojos!!	5670	0	6900	2011-06-09	1	2
7081	Hay poco dinero pero hay muchas balas!!	5670	0	6900	2011-06-09	1	2
7162	Reportar.	5670	0	6770	2011-06-10	1	2
7163	Que no se mueran pronto para darles la pastilla!!	5670	0	6770	2011-06-10	1	2
7164	YO mir o y me invade un suspiro.	5670	0	1410	2011-06-10	1	2
7300	Me parece que este grupo es inmoral. :P	0	2	7240	2011-06-13	1	2
7301	Nuevo reporte.	0	0	7240	2011-06-13	1	2
7420	werty	5670	0	6611	2011-06-14	1	2
7201	Para poder suspender al usuario.	2	0	5540	2011-06-10	1	2
7200	Deja que me vaya por siempre cone l viento!!!	2	0	5540	2011-06-10	1	2
7460	No mames!!! Están publicando plantas!!	0	0	5010	2011-06-16	1	2
7970	Idea demasiado grande.	5710	0	6610	2011-06-23	1	0
8650	itzita :)	0	0	1750	2011-07-10	1	1
8651	Itzita :)	0	0	2444	2011-07-10	1	1
\.


--
-- TOC entry 2460 (class 0 OID 16625)
-- Dependencies: 1755
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol (id_rol, nombre_rol, definicion_rol) FROM stdin;
0	ADMINISTRADOR	Usuario que tiene permiso de hacer todo
2	USUARIO	Usuario normal, permisos normales
1	MODERADOR	Usuario que puede activar/desactivar contenidos
\.


--
-- TOC entry 2461 (class 0 OID 16630)
-- Dependencies: 1757
-- Data for Name: seguidor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY seguidor (usuario_id, idea_id, estatus_seguidor_id, fecha_inicio_seguidor, fecha_fin_seguidor) FROM stdin;
6	6	1	2011-02-17	2011-02-18
5	1	1	2011-02-17	2011-02-18
3	4	1	2011-02-17	2011-02-18
4	3	1	2011-02-17	2011-02-18
4	7	1	2011-02-17	2011-02-18
2	5	1	2011-02-17	2011-02-18
0	2811	1	2011-05-05	\N
1	2	0	2011-07-07	\N
5520	5540	1	2011-05-30	\N
0	5600	1	2011-05-30	\N
5520	5601	1	2011-05-30	\N
5730	5750	1	2011-05-31	\N
5670	5810	1	2011-05-31	\N
5970	6000	1	2011-05-31	\N
0	3230	1	2011-05-05	\N
0	3020	1	2011-05-06	\N
0	3310	1	2011-05-07	\N
0	3380	1	2011-05-08	\N
0	3381	1	2011-05-08	\N
0	6000	1	2011-05-31	\N
1	6000	1	2011-05-31	\N
6190	6210	1	2011-05-31	\N
2	6211	1	2011-05-31	\N
2	6212	1	2011-05-31	\N
0	3940	1	2011-05-11	\N
0	4	1	2011-05-11	\N
0	8	1	2011-05-16	\N
2	4040	1	2011-05-16	\N
2	4041	1	2011-05-16	\N
1	4041	1	2011-05-16	\N
1	4042	1	2011-05-16	\N
0	2600	1	2011-05-17	\N
0	4430	1	2011-05-17	\N
0	251	1	2011-05-18	\N
0	4042	1	2011-05-18	\N
2	4430	1	2011-05-18	\N
0	0	1	2011-05-18	\N
0	4041	1	2011-05-18	\N
1	4430	1	2011-05-20	\N
3	4430	1	2011-05-20	\N
4	4430	1	2011-05-20	\N
5	4430	1	2011-05-20	\N
0	1410	1	2011-05-21	\N
0	4770	1	2011-05-23	\N
1	4770	1	2011-05-23	\N
0	5010	1	2011-05-24	\N
1	5010	1	2011-05-24	\N
0	6	1	2011-06-02	\N
5670	6	1	2011-06-03	\N
5670	2811	1	2011-06-03	\N
5670	6000	1	2011-06-03	\N
5670	1410	1	2011-06-03	\N
5670	2080	1	2011-06-03	\N
5670	4770	1	2011-06-03	\N
5670	5750	1	2011-06-03	\N
5670	6610	1	2011-06-06	\N
2	6611	1	2011-06-06	\N
5670	6660	1	2011-06-06	\N
2	6710	1	2011-06-06	\N
0	6770	1	2011-06-07	\N
5670	6771	1	2011-06-07	\N
5670	6900	1	2011-06-09	\N
0	6901	1	2011-06-09	\N
5670	6210	1	2011-06-09	\N
0	6212	1	2011-06-10	\N
0	5601	1	2011-06-10	\N
0	4040	1	2011-06-11	\N
0	7240	1	2011-06-13	\N
0	7310	1	2011-06-13	\N
7360	6710	1	2011-06-13	\N
5670	0	1	2011-06-14	\N
5670	6611	1	2011-06-14	\N
0	6900	1	2011-06-15	\N
0	7830	1	2011-06-21	\N
0	7870	1	2011-06-23	\N
0	8240	1	2011-07-02	\N
5670	8380	1	2011-07-03	\N
8430	8550	1	2011-07-03	\N
5670	8700	1	2011-07-10	\N
2	8800	1	2011-07-12	\N
5670	8840	1	2011-07-12	\N
5670	8841	1	2011-07-12	\N
\.


--
-- TOC entry 2462 (class 0 OID 16633)
-- Dependencies: 1758
-- Data for Name: ticket_registro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ticket_registro (id_ticket_registro, usuario_id, fecha_ticket_registro, fecha_ticket_usado, estatus_ticket_registro_id, texto_ticket_registro, tipo_ticket_registro_id) FROM stdin;
7530	0	2011-06-20	\N	0	MqQFtSCQptJJfCHyYQ3TZeZVhAvTl8y3p9XfCJXgA072idfLGNG2voQjlAVhkuK9	0
7540	0	2011-06-21	\N	0	dxrdaQF8gpHo389beRadXQVWpGoZwgT2D1cDQ9AfgZMIU7KMj62n9Gn7OvHCTaTP	0
7560	0	2011-06-21	\N	0	nEFmOTEXX4lSIH4FVzDghUAYKXIZjk2hErDRwFmX1SGDH58iBezea8wg8TDEofua	0
7580	0	2011-06-21	\N	0	ITDH7Mx0elqFs3u6WdQLpgF6IlI1PZu3OHqXaKJucL6VxgMqAU6FBDiujeAlS4ZJ	0
7600	0	2011-06-21	\N	0	OyFyYdPEcVpdlWl9Kx8ZGfeJLKMrTehgkP2V1cTA9nNrcFO42xYMRP1rZw4hee9E	0
7630	0	2011-06-21	\N	0	et7rtSjkQoNU6DCailgJRdjVvorDPU0L8h2eqn9Lmx6LYxb2q8yrrNuq2oR5qwxr	0
7660	2	2011-06-21	\N	0	qcgjCUtWS7SDhwcKZJ89OXo89b5y0BEBmZw1Ra9c3wFWbaSS1WgjqmeLfGI2Dckx	0
7690	6240	2011-06-21	\N	0	gCNBb2wmFroC762bSkz36c21I7JoJFIwusnLoueJ47pVAZTTXxuUOJHbhjhSWPyf	0
7691	6240	2011-06-21	\N	0	rxfRC1BTGx1IzBVGeDG2g23mHNfieNjh9Vc2BWjm0eVKOcR8JR8RT9g0p9mfkRHr	0
7720	6240	2011-06-21	\N	0	Nf5jtx2MDX86fho3CvpL1ICDM54GqNn1GPAboMabhfDVYpUOvVRFwcohof07Lzh9	0
7750	6240	2011-06-21	\N	1	FpidygdwtnM9uAVZWnOXlQJZ9y1SYjiqa6wwxx13UiyA0yXRwu6HwpN7U1SP6E1R	0
7780	2	2011-06-21	\N	1	qookZ5eqqViwpMkSTYa41MMXmJvPQS3rNXHFyE3uGapUCKbrDhOvXORfeSo0aM4r	0
7990	6240	2011-06-23	\N	1	FuQi9jVViwvNLUZR9n5XTXrbogODqUOOipElF0X6btBSq2kiQ1bfossFWvgXcY5i	0
8320	8300	2011-07-03	\N	0	eQnlQK16ImilDSblGw7KayVymG9OAA39cDp4laNvHn14G9hHxu2ifTWTw6xw5dk5	0
8350	8300	2011-07-03	\N	1	JxvsiJaZ4y3QGOqkWOb5YoZTjlWI5jQHev8LeDrmPFvvwCjxzdHpTvCQIp2m98yP	0
8450	8430	2011-07-03	\N	1	4FSrHNFnGe2nZoOKuL2GCfo7toQL33K39LEK3Ev7Dp1oNTKa0iiSkfWkWJt14RWB	0
8770	2	2011-07-12	\N	1	7b9iRJlW38xWTQvwmuqZVZINYNtspkQ8fstbRzUtaJofbY1LXvacBq1ToJ4mZECB	0
\.


--
-- TOC entry 2463 (class 0 OID 16638)
-- Dependencies: 1760
-- Data for Name: tipo_aviso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_aviso (id_tipo_aviso, nombre_tipo_aviso, definicion_tipo_aviso) FROM stdin;
0	BITACORA	Tipo de aviso que se hará a todos los miembros de una idea cuando una bitácora sea actualizada
1	COMUNIDAD	Tipo de aviso que se hará a todos los miembros de una comunidad cuando una nueva idea sea creada
2	TODOS	Tipo de aviso que se hará a todos los miembros registrados del sistema
3	PREGUNTA	Tipo de aviso que se hará a un usuario autor de una idea cuando una pregunta sea realizada por algún usuario.
4	RESPUESTA	Tipo de aviso que se hará a un usuario avisándole que su pregunta ha sido contestada
5	USUARIO_NUEVO	Tipo de aviso que se hará a un usuario que acaba de registrarse
7	CHANGED_PASSWD	Tipo de aviso que se hará a un usuario que ha terminado el proceso de recuperación de password
8	PARTICIPA_AUTOR	Aviso que se realiza cuando una participación de usuario es realizada. En este caso se enviará un correo al autor de la idea.
9	INVITACION	Tipo de aviso que se realiza cuando un usuario invita a algún conocido a unirse a LinkUAM
10	FOR_PARTICIPANT	Tipo de aviso que se realiza cuando un usuario participa en una idea. En este caso se envian los datos del autor de la idea al usuario participante.
6	LOST_PASSWORD	Tipo de aviso que se hárá al administrador avisándole de que un usuario pidió recuperación de password
11	MANDAR_EDITAR	Tipo de aviso creado cuando una idea se manda a editar.
\.


--
-- TOC entry 2464 (class 0 OID 16647)
-- Dependencies: 1762
-- Data for Name: tipo_bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_bitacora (id_tipo_bitacora, nombre_tipo_bitacora, definicion_tipo_bitacora) FROM stdin;
0	TEXTO	Será el tipo de mensaje por default que podrá insertarse en una bitácora.
1	PDF	Este tipo de registro en bitácora se refiere a un archivo PDF.
2	IMAGEN	Este tipo de registro en bitácora se refiere a una imagen.
\.


--
-- TOC entry 2465 (class 0 OID 16652)
-- Dependencies: 1764
-- Data for Name: tipo_contacto_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_contacto_usuario (id_tipo_contacto_usuario, nombre_tipo_contacto_usuario, definicion_tipo_contacto_usuario, dato1, dato2, dato3, dato4) FROM stdin;
0	CORREO	El usuario puede localizarse a través del correo electrónico.	\N	\N	\N	\N
1	TWITTER	El usuario puede comunicarse a través de twitters.	\N	\N	\N	\N
\.


--
-- TOC entry 2466 (class 0 OID 16660)
-- Dependencies: 1766
-- Data for Name: tipo_critica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_critica (id_tipo_critica, nombre_tipo_critica, definicion_tipo_critica) FROM stdin;
0	GUSTAR	Cuando el comentario es una crítica positiva.
1	NO_GUSTAR	Cuando el comentario es una crítica negativa.
2	PROPUESTA	Cuando el comentario es una propuesta.
3	BUG_ENCONTRADO	Cuando el usuario encontró una falla en el sistema.
\.


--
-- TOC entry 2467 (class 0 OID 16665)
-- Dependencies: 1768
-- Data for Name: tipo_envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_envio (id_tipo_envio, nombre_tipo_envio, definicion_tipo_envio, vista_tipo_envio) FROM stdin;
0	BITACORA	Tipo de envío que se hará a todos los miembros de una idea cuando una bitácora sea actualizada	/email/bitacoraActualizada.xhtml
1	COMUNIDAD	Tipo de envío que se hará a todos los miembros de una comunidad cuando una nueva idea sea creada	/email/comunidadActualizada.xhtml
2	TODOS	Tipo de envío que se hará a todos los miembros registrados del sistema	/email/envioATodos.xhtml
3	PREGUNTA	Tipo de envío que se hará a un usuario autor de una idea cuando una pregunta sea realizada por algún usuario.	/email/preguntaRealizada.xhtml
4	RESPUESTA	Tipo de envío que se hará a un usuario avisándole que su pregunta ha sido contestada	/email/preguntaRespondida.xhtml
5	USUARIO_NUEVO	Tipo de envío que se hará a un usuario que acaba de registrarse	/email/usuarioNuevo.xhtml
7	CHANGED_PASSWD	Tipo de envío que se hará a un usuario que ha terminado el proceso de recuperación de password	/email/passwordCambiado.xhtml
9	INVITACION	Tipo de envío que se realiza cuando un usuario invita a algún conocido a unirse a LinkUAM	/email/invitacion.xhtml
8	PARTICIPA_AUTOR	Envío que se realiza cuando una participación de usuario es realizada. En este caso se enviará un correo al autor de la idea.	/email/participacionAAutor.xhtml
10	FOR_PARTICIPANT	Tipo de envío que se realiza cuando un usuario participa en una idea. En este caso se envian los datos del autor de la idea al usuario participante.	/email/participacionAParticipante.xhtml
6	LOST_PASSWORD	Tipo de envío que se hárá a un usuario que pidió recuperación de password	/email/recuperarPassword.xhtml
11	MANDAR_EDITAR	Tipo de envío que se realiza cuando una idea se manda a edición por parte del administrador.	/email/ideaAEdicion.xhtml
\.


--
-- TOC entry 2468 (class 0 OID 16670)
-- Dependencies: 1770
-- Data for Name: tipo_idea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_idea (id_tipo_idea, nombre_tipo_idea, descripcion_tipo_idea) FROM stdin;
3	ACCION_SOCIAL	Idea relacionada con acciones sociales.
1	PROY_TERMINAL	Idea relaciona con proyecto terminal.
0	SERVICIO_SOCIAL	Idea relacionada con servicio social.
4	DEPORTIVAS	Idea relacionada con actividades deportivas
5	DIVERSION	Idea relacionada con entretenimiento/diversión.
6	INDUSTRIA	Idea relacionada con la industria. Tal vez oferta de empleo.
7	INVERSION	Idea relacionada con inversionistas.
8	NEGOCIOS	Idea relacionada con negocios.
\.


--
-- TOC entry 2469 (class 0 OID 16675)
-- Dependencies: 1772
-- Data for Name: tipo_lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_lugar (id_tipo_lugar, nombre_tipo_lugar, descripcion_tipo_lugar) FROM stdin;
2	ABIERTO_1	Se refiere a lugares con espacio abierto CHICOS.
6	VENTAS_1	Se refiere a lugares para ventas CHICOS.
4	CONF_PROY_COM_2	Se refiere a lugares para conferencias con proyectores y computadoras MEDIANOS.
3	CONF_PROY_2	Se refiere a lugares para conferencias con proyector MEDIANOS.
0	CONF_PROY_1	Se refiere a lugares para conferencias con proyector CHICOS.
1	CONF_PROY_COM_1	Se refiere a lugares para conferencia con proyectores y computadoras CHICOS.
5	ABIERTO_2	Se refiere a lugares con espacio abierto MEDIANOS.
7	VENTAS_2	Se refiere a lugares para ventas MEDIANOS.
8	VENTAS_3	Se refiere a los lugares para ventas GRANDES.
9	CONF_PROY_3	Se refiere a lugares para conferencias con proyector GRANDES.
10	CONF_PROY_COM_3	Se refiere a lugares para conferencias com proyector y computadoras GRANDES.
11	ABIERTOS_3	Se refiere a lugares con espacio abierto GRANDES.
12	MIXTO_1	Se refiere a lugares con espacios de trabajo mixtos CHICOS.
13	MIXTO_2	Se refiere a lugares con espacios de trabajo mixtos MEDIANOS.
14	MIXTO_3	Se refiere a lugares con espacios de trabajo mixtos GRANDES.
\.


--
-- TOC entry 2470 (class 0 OID 16680)
-- Dependencies: 1774
-- Data for Name: tipo_reporte_abuso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_reporte_abuso (id_tipo_reporte_abuso, nombre_tipo_reporte_abuso, definicion_tipo_reporte_abuso) FROM stdin;
0	VIOLENCIA	Se está reportando información violenta dentro del sistema.
1	FALSO	Se está reportando información falsa dentro del sistema.
2	ILEGAL	Se está reportando información falsa dentro del sistema.
3	OTRO	Se está reportando un tipo de abuso no definido en la base de datos.
\.


--
-- TOC entry 2471 (class 0 OID 16685)
-- Dependencies: 1776
-- Data for Name: tipo_ticket_registro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_ticket_registro (id_tipo_ticket_registro, nombre_tipo_ticket_registro, descripcion_tipo_ticket_registro) FROM stdin;
0	RECUPERAR_PASSW	Tipo de ticket que se genera cuando un usuario solicita recuperar su password.
1	REGISTRAR_USER	Tipo de ticket que se genera cuando un usuario se registra pero requiere que el usuario compruebe que recibio el mail.
\.


--
-- TOC entry 2472 (class 0 OID 16690)
-- Dependencies: 1778
-- Data for Name: tipo_visita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_visita (id_tipo_visita, nombre_tipo_visita, descripcion_tipo_visita) FROM stdin;
0	DEFAULT	Tipo de visita por default.
\.


--
-- TOC entry 2475 (class 0 OID 17707)
-- Dependencies: 1784
-- Data for Name: tipo_vista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_vista (nombre_tipo_vista, descripcion_tipo_vista, id_tipo_vista) FROM stdin;
DEFAULT	Tipo de visita por default	0
\.


--
-- TOC entry 2473 (class 0 OID 16695)
-- Dependencies: 1780
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id_usuario, nombre_usuario, fecha_ingreso_usuario, institucion_id, fecha_fin_usuario, apellido_paterno_usuario, apellido_materno_usuario, contrasena_usuario, calificacion_usuario, estatus_usuario_id, nick_usuario, nombre_imagen_usuario, sexo_usuario, fecha_nacimiento_usuario, configuracion_usuario_id) FROM stdin;
7810	Venustiano	2011-06-21	0	\N	Carranza	Juarez	c8721b651877e875de2bb1e7a1f0988806e26562	0	1	venus	7810.png	\N	\N	20
0	Jorge	2011-02-01	0	\N	Bautista	Hernández	9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684	10	1	jorgwel	jorgeb.png	\N	\N	0
1	Cesar	2011-02-01	1	\N	Bautista	Hernández	9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684	2	1	flaka	cesarb.png	\N	\N	1
3	Aurelio	2011-02-01	3	\N	Hernández	Islas	9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684	7	1	hectori18	aureh.png	\N	\N	3
4	Ignacio	2011-02-01	4	\N	Bautista	Castro	9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684	1	1	nachillo	nachob.png	\N	\N	4
5	Gabriela	2011-02-01	0	\N	Hernández	Islas	9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684	1	1	gabis	gabih.png	\N	\N	5
6	María	2011-02-17	1	\N	Hernández	Islas	9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684	6	1	marya	aureh.png	\N	\N	6
5520	José Carlos	2011-05-30	4	\N	Bautista 	Hernández	523975471cdbc891c5762f7a746a3aade6f4700f	0	1	surucko	default.png	\N	\N	7
5690	Héctor	2011-05-31	4	\N	Hernández	Islas	45b28f8f5f4e287b5edc1da1400cd295bf86e5d4	0	1	hector	5690.png	\N	\N	9
5710	Ignacio Sergio	2011-05-31	1	\N	Bautista	Castro	24a7b50707ffd05c2ff01fa8b557ab54f11093bf	0	1	sergio	5710.png	\N	\N	10
5670	Julio Cesar	2011-05-30	3	\N	Bautista 	Hernández	0ac27fae668880620a07db5f4f0f6f84fe12ff74	0	1	cesarin	5670.png	\N	\N	8
5730	Gabriela	2011-05-31	1	\N	Hernández	Islas	4762879c0bb6ee868467790edaea10e23b1a8af8	0	1	gabita	5730.png	\N	\N	11
5900	Jorge Alberto	2011-05-31	1	\N	Bautista 	Hernández	bae6baf30dbb2614a9692e9758ffb0bde18f8cbe	0	1	jorge	5900.png	\N	\N	12
8040	Kick 	2011-06-23	2	\N	Bautista 	Buttwowsky	eac6136556a96e245d99e94e6f6c86b879857ccd	0	1	kick	8040.png	\N	\N	8030
5920	José José	2011-05-31	1	\N	Martínez	Jimenez	ffb4d43f2ee33e800caa88f3ea02ef8f81583ceb	0	1	pepepepe	5920.png	\N	\N	13
8300	Martín	2011-07-02	4	\N	Azo	Del Piero	b432d3699e22b8db3468790a1c40981f32e72399	0	1	martin	8300.png	\N	\N	8290
5940	Zedillito	2011-05-31	2	\N	Dónde 	Estás	82df27974a8830367807136052a80c9324d279cd	0	1	uno25	5940.png	\N	\N	14
5970	La Lombriz	2011-05-31	1	\N	Argen	Tini	90fee9fcd403205252b7e698e75c0260e38735d0	0	1	lalombriz	5970.png	\N	\N	15
6190	El Olallo	2011-05-31	4	\N	Rubio	Rubio	3ddf85a781e2918d5b92c2f29d53a61750110971	0	1	olallo	6190.png	\N	\N	16
6240	Lizbeth	2011-05-31	0	\N	Gallardo	López	33f927344e079e00d3fa45d8833b04e735223eec	0	1	lizbeth	6240.png	\N	\N	17
6270	Dan	2011-06-01	1	\N	Akon	Tenor	a138333cb31936e6e8c8a93ff35e3bcb14bc3c70	0	1	akon1	6270.png	\N	\N	18
7360	Jose Manuel	2011-06-13	0	\N	Alcantara	Villegas	974028427e0cb3fbd49c23e4b13668b7a53acf76	0	1	josema	7360.png	\N	\N	19
8430	Rick	2011-07-03	4	\N	Harrison	Control	b2ad9e8d1ad484042d9c95927f0c2f9f7f0fe563	0	1	rick	8430.png	\N	\N	8420
8490	Leonardo	2011-07-03	4	\N	Pérez	Hernández	497b3e42b9f1ad0ffb6d3a9ebd7e2d0d5a074ad2	0	1	leon	8490.png	\N	\N	8480
2	Pepe	2011-02-01	2	\N	Bautista	Hernández	2a42d69bdeff7d7c57cdba48837b2780b6d4a3e8	4	1	suruck	pepeb.png	\N	\N	2
\.


--
-- TOC entry 2474 (class 0 OID 16700)
-- Dependencies: 1782
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visita (id_visita, fecha_inicio_visita, fecha_fin_visita, direccion_ip_visita, coordenada_geografica_longitud_visita, coordenada_geografica_latitud_visita, usuario_id, tipo_visita_id, idea_id, sesionid, vista_id) FROM stdin;
\.


--
-- TOC entry 2476 (class 0 OID 17712)
-- Dependencies: 1785
-- Data for Name: vista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vista (descripcion_vista, nombre_vista, id_vista, tipo_vista_id) FROM stdin;
Vista inicial del sistema.	Home	0	0
Vista utilizada para ver los detalles de una idea.	IdeaDetalle	3	0
Vista utilizada para capturar un nuevo usuario.	UsuarioCrear	4	0
Vista utilizada para capturar una idea nueva.	IdeaCrear	2	0
Vista utilizada para autenticarse en el sistema.	Login	5	0
Vista utilizada para mostrar la visión y la misión de linkUAM.	VisionMision	6	0
Vista utilizada para desplegar la licencia de LinkUAM.	Licencia	7	0
Vista utilizada para desplegar las fotos de los miembros de linkUAM.	QuienEsLinkUAM	8	0
Vista utilizada para desplegar las estadísticas del sistema.	Estadisticas	9	0
Vista utilizada para desplegar las opiniones, críticas y aportaciones hacia linkUAM por parte de los usuarios.	Opiniones	10	0
Vista utilizada para realizar búsquedas en el sistema.	BuscarIdea	11	0
Vista utilizada para mostrar los seguidores de determinadas ideas en el sistema.	MostrarSeguidores	12	0
Vista utilizada para mostrar los participantes de una idea.	MostrarParticipaciones	13	0
Vista donde los usuarios configuran sus preferencias y administran sus ideas.	PanelControl	1	0
Vista utilizada para mostrar el formulario necesario al actualizar una bitácora.	ActualizarBitacora	14	0
Vista utilizada para mostrar al usuario la confirmación de actualización de su bitácora.	ActualizarBitacoraConfirmacion	15	0
Vista utilizada para mostrar los datos del usuario.	MostrarDatosUsuario	16	0
Vista utilizada para mostrar el formulario necesario al mandar una idea a edición.	CapturaMensajeMandarAEdicion	17	0
Vista utilizada para mostrar al administrador que una idea fue mandada a edición.	CapturaMensajeMandarAEdicionConfirmacion	18	0
Vista utilizada para mostrar el formulario necesario al contestar una pregunta.	ContestarPregunta	19	0
Vista utilizada para mostrar la confirmación de que una pregunta fue contestada.	ContestarPreguntaConfirmacion	20	0
\.


--
-- TOC entry 2123 (class 2606 OID 16759)
-- Dependencies: 1675 1675
-- Name: pk_accion_reporte_abuso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accion_reporte_abuso
    ADD CONSTRAINT pk_accion_reporte_abuso PRIMARY KEY (id_accion_reporte_abuso);


--
-- TOC entry 2125 (class 2606 OID 16761)
-- Dependencies: 1677 1677
-- Name: pk_aviso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT pk_aviso PRIMARY KEY (id_aviso);


--
-- TOC entry 2127 (class 2606 OID 16763)
-- Dependencies: 1679 1679
-- Name: pk_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT pk_bitacora PRIMARY KEY (id_bitacora);


--
-- TOC entry 2129 (class 2606 OID 16765)
-- Dependencies: 1681 1681
-- Name: pk_canica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY canica
    ADD CONSTRAINT pk_canica PRIMARY KEY (id_canica);


--
-- TOC entry 2133 (class 2606 OID 16767)
-- Dependencies: 1683 1683 1683
-- Name: pk_clasifiacion_idea; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT pk_clasifiacion_idea PRIMARY KEY (tipo_idea_id, idea_id);


--
-- TOC entry 2135 (class 2606 OID 16769)
-- Dependencies: 1684 1684
-- Name: pk_como_lograrlo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY como_lograrlo
    ADD CONSTRAINT pk_como_lograrlo PRIMARY KEY (id_como_lograrlo);


--
-- TOC entry 2137 (class 2606 OID 16771)
-- Dependencies: 1686 1686
-- Name: pk_comunidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comunidad
    ADD CONSTRAINT pk_comunidad PRIMARY KEY (id_comunidad);


--
-- TOC entry 2139 (class 2606 OID 16773)
-- Dependencies: 1687 1687
-- Name: pk_configuracion_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_usuario
    ADD CONSTRAINT pk_configuracion_usuario PRIMARY KEY (id_configuracion_usuario);


--
-- TOC entry 2141 (class 2606 OID 16775)
-- Dependencies: 1689 1689
-- Name: pk_contacto_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT pk_contacto_usuario PRIMARY KEY (id_contacto_usuario);


--
-- TOC entry 2145 (class 2606 OID 16777)
-- Dependencies: 1691 1691
-- Name: pk_critica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT pk_critica PRIMARY KEY (id_critica);


--
-- TOC entry 2147 (class 2606 OID 16779)
-- Dependencies: 1693 1693
-- Name: pk_envio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT pk_envio PRIMARY KEY (id_envio);


--
-- TOC entry 2149 (class 2606 OID 16781)
-- Dependencies: 1695 1695
-- Name: pk_estatus_aviso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_aviso
    ADD CONSTRAINT pk_estatus_aviso PRIMARY KEY (id_estatus_aviso);


--
-- TOC entry 2155 (class 2606 OID 16783)
-- Dependencies: 1699 1699
-- Name: pk_estatus_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_bitacora
    ADD CONSTRAINT pk_estatus_bitacora PRIMARY KEY (id_estatus_bitacora);


--
-- TOC entry 2157 (class 2606 OID 16785)
-- Dependencies: 1701 1701
-- Name: pk_estatus_comunidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_comunidad
    ADD CONSTRAINT pk_estatus_comunidad PRIMARY KEY (id_estatus_comunidad);


--
-- TOC entry 2159 (class 2606 OID 16787)
-- Dependencies: 1703 1703
-- Name: pk_estatus_critica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_critica
    ADD CONSTRAINT pk_estatus_critica PRIMARY KEY (id_estatus_critica);


--
-- TOC entry 2161 (class 2606 OID 16789)
-- Dependencies: 1705 1705
-- Name: pk_estatus_envio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_envio
    ADD CONSTRAINT pk_estatus_envio PRIMARY KEY (id_estatus_envio);


--
-- TOC entry 2163 (class 2606 OID 16791)
-- Dependencies: 1707 1707
-- Name: pk_estatus_idea; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_idea
    ADD CONSTRAINT pk_estatus_idea PRIMARY KEY (id_estatus_idea);


--
-- TOC entry 2165 (class 2606 OID 16793)
-- Dependencies: 1709 1709
-- Name: pk_estatus_integrante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_integrante
    ADD CONSTRAINT pk_estatus_integrante PRIMARY KEY (id_estatus_integrante);


--
-- TOC entry 2167 (class 2606 OID 16795)
-- Dependencies: 1711 1711
-- Name: pk_estatus_invitacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_invitacion
    ADD CONSTRAINT pk_estatus_invitacion PRIMARY KEY (id_estatus_invitacion);


--
-- TOC entry 2169 (class 2606 OID 16797)
-- Dependencies: 1713 1713
-- Name: pk_estatus_miembro_comunidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_miembro_comunidad
    ADD CONSTRAINT pk_estatus_miembro_comunidad PRIMARY KEY (id_estatus_miembro_comunidad);


--
-- TOC entry 2151 (class 2606 OID 16799)
-- Dependencies: 1697 1697
-- Name: pk_estatus_monetario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_ayuda_monetaria
    ADD CONSTRAINT pk_estatus_monetario PRIMARY KEY (id_estatus_ayuda_monetaria);


--
-- TOC entry 2171 (class 2606 OID 16801)
-- Dependencies: 1716 1716
-- Name: pk_estatus_necesidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_necesidad
    ADD CONSTRAINT pk_estatus_necesidad PRIMARY KEY (id_estatus_necesidad);


--
-- TOC entry 2173 (class 2606 OID 16803)
-- Dependencies: 1718 1718
-- Name: pk_estatus_pregunta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_pregunta
    ADD CONSTRAINT pk_estatus_pregunta PRIMARY KEY (id_estatus_pregunta);


--
-- TOC entry 2153 (class 2606 OID 16805)
-- Dependencies: 1698 1698
-- Name: pk_estatus_recursos_humanos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_ayuda_recursos_humanos
    ADD CONSTRAINT pk_estatus_recursos_humanos PRIMARY KEY (id_estatus_ayuda_recursos_humanos);


--
-- TOC entry 2175 (class 2606 OID 16807)
-- Dependencies: 1721 1721
-- Name: pk_estatus_reporte_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_reporte_abuso
    ADD CONSTRAINT pk_estatus_reporte_usuario PRIMARY KEY (id_estatus_reporte_abuso);


--
-- TOC entry 2177 (class 2606 OID 16809)
-- Dependencies: 1723 1723
-- Name: pk_estatus_seguidor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_seguidor
    ADD CONSTRAINT pk_estatus_seguidor PRIMARY KEY (id_estatus_seguidor);


--
-- TOC entry 2179 (class 2606 OID 16811)
-- Dependencies: 1725 1725
-- Name: pk_estatus_ticket_registro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_ticket_registro
    ADD CONSTRAINT pk_estatus_ticket_registro PRIMARY KEY (id_estatus_ticket_registro);


--
-- TOC entry 2181 (class 2606 OID 16813)
-- Dependencies: 1727 1727
-- Name: pk_estatus_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus_usuario
    ADD CONSTRAINT pk_estatus_usuario PRIMARY KEY (id_estatus_usuario);


--
-- TOC entry 2247 (class 2606 OID 18185)
-- Dependencies: 1788 1788
-- Name: pk_frase; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY frase
    ADD CONSTRAINT pk_frase PRIMARY KEY (id_frase);


--
-- TOC entry 2183 (class 2606 OID 16815)
-- Dependencies: 1730 1730
-- Name: pk_idea; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT pk_idea PRIMARY KEY (id_idea);


--
-- TOC entry 2185 (class 2606 OID 16817)
-- Dependencies: 1732 1732
-- Name: pk_imagen; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY imagen
    ADD CONSTRAINT pk_imagen PRIMARY KEY (id_imagen);


--
-- TOC entry 2187 (class 2606 OID 16819)
-- Dependencies: 1734 1734
-- Name: pk_institucion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institucion
    ADD CONSTRAINT pk_institucion PRIMARY KEY (id_institucion);


--
-- TOC entry 2189 (class 2606 OID 16821)
-- Dependencies: 1736 1736 1736
-- Name: pk_integrante; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT pk_integrante PRIMARY KEY (usuario_id, idea_id);


--
-- TOC entry 2191 (class 2606 OID 16823)
-- Dependencies: 1737 1737
-- Name: pk_invitacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT pk_invitacion PRIMARY KEY (id_invitacion);


--
-- TOC entry 2193 (class 2606 OID 16825)
-- Dependencies: 1738 1738
-- Name: pk_justificacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY justificacion
    ADD CONSTRAINT pk_justificacion PRIMARY KEY (id_justificacion);


--
-- TOC entry 2195 (class 2606 OID 16827)
-- Dependencies: 1741 1741
-- Name: pk_lugar; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT pk_lugar PRIMARY KEY (id_lugar);


--
-- TOC entry 2197 (class 2606 OID 16829)
-- Dependencies: 1743 1743 1743
-- Name: pk_miembro_comunidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT pk_miembro_comunidad PRIMARY KEY (usuario_id, comunidad_id);


--
-- TOC entry 2199 (class 2606 OID 16831)
-- Dependencies: 1744 1744
-- Name: pk_necesidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY necesidad
    ADD CONSTRAINT pk_necesidad PRIMARY KEY (id_necesidad);


--
-- TOC entry 2201 (class 2606 OID 16833)
-- Dependencies: 1746 1746
-- Name: pk_objetivo_especifico; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT pk_objetivo_especifico PRIMARY KEY (id_objetivo_especifico);


--
-- TOC entry 2203 (class 2606 OID 16835)
-- Dependencies: 1748 1748
-- Name: pk_objetivo_general; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objetivo_general
    ADD CONSTRAINT pk_objetivo_general PRIMARY KEY (id_objetivo_general);


--
-- TOC entry 2205 (class 2606 OID 16837)
-- Dependencies: 1750 1750 1750
-- Name: pk_permiso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT pk_permiso PRIMARY KEY (usuario_id, rol_id);


--
-- TOC entry 2207 (class 2606 OID 16839)
-- Dependencies: 1751 1751
-- Name: pk_pregunta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT pk_pregunta PRIMARY KEY (id_pregunta);


--
-- TOC entry 2209 (class 2606 OID 16841)
-- Dependencies: 1753 1753
-- Name: pk_reporte_abuso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT pk_reporte_abuso PRIMARY KEY (id_reporte_abuso);


--
-- TOC entry 2211 (class 2606 OID 16843)
-- Dependencies: 1755 1755
-- Name: pk_rol; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);


--
-- TOC entry 2213 (class 2606 OID 16845)
-- Dependencies: 1757 1757 1757
-- Name: pk_seguidor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT pk_seguidor PRIMARY KEY (usuario_id, idea_id);


--
-- TOC entry 2215 (class 2606 OID 16847)
-- Dependencies: 1758 1758
-- Name: pk_ticket_registro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT pk_ticket_registro PRIMARY KEY (id_ticket_registro);


--
-- TOC entry 2217 (class 2606 OID 16849)
-- Dependencies: 1760 1760
-- Name: pk_tipo_aviso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_aviso
    ADD CONSTRAINT pk_tipo_aviso PRIMARY KEY (id_tipo_aviso);


--
-- TOC entry 2219 (class 2606 OID 16851)
-- Dependencies: 1762 1762
-- Name: pk_tipo_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_bitacora
    ADD CONSTRAINT pk_tipo_bitacora PRIMARY KEY (id_tipo_bitacora);


--
-- TOC entry 2221 (class 2606 OID 16853)
-- Dependencies: 1764 1764
-- Name: pk_tipo_contacto_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_contacto_usuario
    ADD CONSTRAINT pk_tipo_contacto_usuario PRIMARY KEY (id_tipo_contacto_usuario);


--
-- TOC entry 2223 (class 2606 OID 16855)
-- Dependencies: 1766 1766
-- Name: pk_tipo_critica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_critica
    ADD CONSTRAINT pk_tipo_critica PRIMARY KEY (id_tipo_critica);


--
-- TOC entry 2225 (class 2606 OID 16857)
-- Dependencies: 1768 1768
-- Name: pk_tipo_envio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_envio
    ADD CONSTRAINT pk_tipo_envio PRIMARY KEY (id_tipo_envio);


--
-- TOC entry 2227 (class 2606 OID 16859)
-- Dependencies: 1770 1770
-- Name: pk_tipo_idea; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_idea
    ADD CONSTRAINT pk_tipo_idea PRIMARY KEY (id_tipo_idea);


--
-- TOC entry 2229 (class 2606 OID 16861)
-- Dependencies: 1772 1772
-- Name: pk_tipo_lugar; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_lugar
    ADD CONSTRAINT pk_tipo_lugar PRIMARY KEY (id_tipo_lugar);


--
-- TOC entry 2231 (class 2606 OID 16863)
-- Dependencies: 1774 1774
-- Name: pk_tipo_reporte_abuso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_reporte_abuso
    ADD CONSTRAINT pk_tipo_reporte_abuso PRIMARY KEY (id_tipo_reporte_abuso);


--
-- TOC entry 2233 (class 2606 OID 16865)
-- Dependencies: 1776 1776
-- Name: pk_tipo_ticket_registro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_ticket_registro
    ADD CONSTRAINT pk_tipo_ticket_registro PRIMARY KEY (id_tipo_ticket_registro);


--
-- TOC entry 2235 (class 2606 OID 16867)
-- Dependencies: 1778 1778
-- Name: pk_tipo_visita; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_visita
    ADD CONSTRAINT pk_tipo_visita PRIMARY KEY (id_tipo_visita);


--
-- TOC entry 2243 (class 2606 OID 17733)
-- Dependencies: 1784 1784
-- Name: pk_tipo_vista; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_vista
    ADD CONSTRAINT pk_tipo_vista PRIMARY KEY (id_tipo_vista);


--
-- TOC entry 2241 (class 2606 OID 16869)
-- Dependencies: 1782 1782
-- Name: pk_visita; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT pk_visita PRIMARY KEY (id_visita);


--
-- TOC entry 2245 (class 2606 OID 17735)
-- Dependencies: 1785 1785
-- Name: pk_vista; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vista
    ADD CONSTRAINT pk_vista PRIMARY KEY (id_vista);


--
-- TOC entry 2143 (class 2606 OID 16871)
-- Dependencies: 1689 1689 1689
-- Name: unique_contacto_usuario_tipo_contacto_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT unique_contacto_usuario_tipo_contacto_usuario UNIQUE (texto_contacto_usuario, tipo_contacto_usuario_id);


--
-- TOC entry 2131 (class 2606 OID 16873)
-- Dependencies: 1681 1681 1681
-- Name: unique_usuario_necesidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY canica
    ADD CONSTRAINT unique_usuario_necesidad UNIQUE (necesidad_id, usuario_id);


--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 2131
-- Name: CONSTRAINT unique_usuario_necesidad ON canica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT unique_usuario_necesidad ON canica IS 'Constraint que solo permitirá que un usuario participe solo una vez en una necesidad. Estos dos campos debieron de ser el id de la tabla.';


--
-- TOC entry 2237 (class 2606 OID 16875)
-- Dependencies: 1780 1780
-- Name: usuario_nick_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_nick_usuario_key UNIQUE (nick_usuario);


--
-- TOC entry 2239 (class 2606 OID 16877)
-- Dependencies: 1780 1780
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 2286 (class 2606 OID 16878)
-- Dependencies: 2156 1686 1701
-- Name: comunidad_estatus_comunidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comunidad
    ADD CONSTRAINT comunidad_estatus_comunidad_id_fkey FOREIGN KEY (estatus_comunidad_id) REFERENCES estatus_comunidad(id_estatus_comunidad);


--
-- TOC entry 2399 (class 2606 OID 18560)
-- Dependencies: 1758 1780 2238
-- Name: fk1b12a4067ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk1b12a4067ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2401 (class 2606 OID 18570)
-- Dependencies: 2232 1776 1758
-- Name: fk1b12a406c3cbc017; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk1b12a406c3cbc017 FOREIGN KEY (tipo_ticket_registro_id) REFERENCES tipo_ticket_registro(id_tipo_ticket_registro);


--
-- TOC entry 2400 (class 2606 OID 18565)
-- Dependencies: 1758 1725 2178
-- Name: fk1b12a406e4a5d0cd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk1b12a406e4a5d0cd FOREIGN KEY (estatus_ticket_registro_id) REFERENCES estatus_ticket_registro(id_estatus_ticket_registro);


--
-- TOC entry 2357 (class 2606 OID 18455)
-- Dependencies: 1780 1743 2238
-- Name: fk22dcde747ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk22dcde747ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2359 (class 2606 OID 18465)
-- Dependencies: 1743 2136 1686
-- Name: fk22dcde747d1e2795; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk22dcde747d1e2795 FOREIGN KEY (comunidad_id) REFERENCES comunidad(id_comunidad);


--
-- TOC entry 2358 (class 2606 OID 18460)
-- Dependencies: 2168 1743 1713
-- Name: fk22dcde74b27114fd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk22dcde74b27114fd FOREIGN KEY (estatus_miembro_comunidad_id) REFERENCES estatus_miembro_comunidad(id_estatus_miembro_comunidad);


--
-- TOC entry 2331 (class 2606 OID 18395)
-- Dependencies: 2162 1707 1730
-- Name: fk313ef74da0d604; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk313ef74da0d604 FOREIGN KEY (estatus_idea_id) REFERENCES estatus_idea(id_estatus_idea);


--
-- TOC entry 2330 (class 2606 OID 18390)
-- Dependencies: 2150 1730 1697
-- Name: fk313ef75045a0ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk313ef75045a0ff FOREIGN KEY (estatus_ayuda_monetaria_id) REFERENCES estatus_ayuda_monetaria(id_estatus_ayuda_monetaria);


--
-- TOC entry 2327 (class 2606 OID 18375)
-- Dependencies: 2238 1730 1780
-- Name: fk313ef77ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk313ef77ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2329 (class 2606 OID 18385)
-- Dependencies: 2152 1730 1698
-- Name: fk313ef7c98abc10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk313ef7c98abc10 FOREIGN KEY (estatus_ayuda_recursos_humanos_id) REFERENCES estatus_ayuda_recursos_humanos(id_estatus_ayuda_recursos_humanos);


--
-- TOC entry 2328 (class 2606 OID 18380)
-- Dependencies: 2194 1730 1741
-- Name: fk313ef7da4f79b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk313ef7da4f79b5 FOREIGN KEY (lugar_id) REFERENCES lugar(id_lugar);


--
-- TOC entry 2297 (class 2606 OID 18310)
-- Dependencies: 2222 1766 1691
-- Name: fk3d8f566d3b8604cc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT fk3d8f566d3b8604cc FOREIGN KEY (tipo_critica_id) REFERENCES tipo_critica(id_tipo_critica);


--
-- TOC entry 2296 (class 2606 OID 18305)
-- Dependencies: 1780 1691 2238
-- Name: fk3d8f566d7ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT fk3d8f566d7ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2295 (class 2606 OID 18300)
-- Dependencies: 1691 2158 1703
-- Name: fk3d8f566d89c6cab0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT fk3d8f566d89c6cab0 FOREIGN KEY (estatus_critica_id) REFERENCES estatus_critica(id_estatus_critica);


--
-- TOC entry 2394 (class 2606 OID 18550)
-- Dependencies: 1757 1730 2182
-- Name: fk3f61aefe19ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk3f61aefe19ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2393 (class 2606 OID 18545)
-- Dependencies: 1757 1780 2238
-- Name: fk3f61aefe7ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk3f61aefe7ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2395 (class 2606 OID 18555)
-- Dependencies: 1757 1723 2176
-- Name: fk3f61aefea2841fa4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk3f61aefea2841fa4 FOREIGN KEY (estatus_seguidor_id) REFERENCES estatus_seguidor(id_estatus_seguidor);


--
-- TOC entry 2274 (class 2606 OID 18250)
-- Dependencies: 1679 2182 1730
-- Name: fk42193a8f19ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk42193a8f19ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2273 (class 2606 OID 18245)
-- Dependencies: 1679 2218 1762
-- Name: fk42193a8f58be3368; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk42193a8f58be3368 FOREIGN KEY (tipo_bitacora_id) REFERENCES tipo_bitacora(id_tipo_bitacora);


--
-- TOC entry 2272 (class 2606 OID 18240)
-- Dependencies: 2238 1679 1780
-- Name: fk42193a8f7ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk42193a8f7ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2275 (class 2606 OID 18255)
-- Dependencies: 1699 1679 2154
-- Name: fk42193a8fd2962a04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk42193a8fd2962a04 FOREIGN KEY (estatus_bitacora_id) REFERENCES estatus_bitacora(id_estatus_bitacora);


--
-- TOC entry 2345 (class 2606 OID 18425)
-- Dependencies: 2238 1737 1780
-- Name: fk4737bd4a1c47c0a2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk4737bd4a1c47c0a2 FOREIGN KEY (usuario_invitado_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2346 (class 2606 OID 18430)
-- Dependencies: 2166 1711 1737
-- Name: fk4737bd4a43a0e9a4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk4737bd4a43a0e9a4 FOREIGN KEY (estatus_invitacion_id) REFERENCES estatus_invitacion(id_estatus_invitacion);


--
-- TOC entry 2347 (class 2606 OID 18435)
-- Dependencies: 1758 1737 2214
-- Name: fk4737bd4a4bd3758; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk4737bd4a4bd3758 FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);


--
-- TOC entry 2344 (class 2606 OID 18420)
-- Dependencies: 2238 1780 1737
-- Name: fk4737bd4abfa0017a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk4737bd4abfa0017a FOREIGN KEY (usuario_invitante_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2291 (class 2606 OID 18295)
-- Dependencies: 2220 1764 1689
-- Name: fk50903b3e114d9d57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT fk50903b3e114d9d57 FOREIGN KEY (tipo_contacto_usuario_id) REFERENCES tipo_contacto_usuario(id_tipo_contacto_usuario);


--
-- TOC entry 2290 (class 2606 OID 18290)
-- Dependencies: 1780 1689 2238
-- Name: fk50903b3e7ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT fk50903b3e7ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2260 (class 2606 OID 18200)
-- Dependencies: 1730 2182 1677
-- Name: fk58e243019ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e243019ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2267 (class 2606 OID 18235)
-- Dependencies: 1758 1677 2214
-- Name: fk58e24304bd3758; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e24304bd3758 FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);


--
-- TOC entry 2262 (class 2606 OID 18210)
-- Dependencies: 1677 2208 1753
-- Name: fk58e243054e3f49c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e243054e3f49c FOREIGN KEY (reporte_abuso_id) REFERENCES reporte_abuso(id_reporte_abuso);


--
-- TOC entry 2259 (class 2606 OID 18195)
-- Dependencies: 1677 2238 1780
-- Name: fk58e24307ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e24307ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2263 (class 2606 OID 18215)
-- Dependencies: 1677 2206 1751
-- Name: fk58e24307abf353f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e24307abf353f FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta);


--
-- TOC entry 2258 (class 2606 OID 18190)
-- Dependencies: 1677 1681 2128
-- Name: fk58e24308a4df35f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e24308a4df35f FOREIGN KEY (canica_id) REFERENCES canica(id_canica);


--
-- TOC entry 2266 (class 2606 OID 18230)
-- Dependencies: 2146 1677 1693
-- Name: fk58e2430aa7e1735; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e2430aa7e1735 FOREIGN KEY (envio_id) REFERENCES envio(id_envio);


--
-- TOC entry 2261 (class 2606 OID 18205)
-- Dependencies: 2126 1677 1679
-- Name: fk58e2430d89fd71f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e2430d89fd71f FOREIGN KEY (bitacora_id) REFERENCES bitacora(id_bitacora);


--
-- TOC entry 2264 (class 2606 OID 18220)
-- Dependencies: 2148 1695 1677
-- Name: fk58e2430e7105d50; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e2430e7105d50 FOREIGN KEY (estatus_aviso_id) REFERENCES estatus_aviso(id_estatus_aviso);


--
-- TOC entry 2265 (class 2606 OID 18225)
-- Dependencies: 2216 1760 1677
-- Name: fk58e2430ec4f6e6c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk58e2430ec4f6e6c FOREIGN KEY (tipo_aviso_id) REFERENCES tipo_aviso(id_tipo_aviso);


--
-- TOC entry 2314 (class 2606 OID 18335)
-- Dependencies: 1693 1730 2182
-- Name: fk5c30ed319ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed319ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2321 (class 2606 OID 18370)
-- Dependencies: 2214 1758 1693
-- Name: fk5c30ed34bd3758; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed34bd3758 FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);


--
-- TOC entry 2316 (class 2606 OID 18345)
-- Dependencies: 1693 1753 2208
-- Name: fk5c30ed354e3f49c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed354e3f49c FOREIGN KEY (reporte_abuso_id) REFERENCES reporte_abuso(id_reporte_abuso);


--
-- TOC entry 2311 (class 2606 OID 18320)
-- Dependencies: 2238 1693 1780
-- Name: fk5c30ed37ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed37ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2317 (class 2606 OID 18350)
-- Dependencies: 1751 1693 2206
-- Name: fk5c30ed37abf353f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed37abf353f FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta);


--
-- TOC entry 2318 (class 2606 OID 18355)
-- Dependencies: 1693 2136 1686
-- Name: fk5c30ed37d1e2795; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed37d1e2795 FOREIGN KEY (comunidad_id) REFERENCES comunidad(id_comunidad);


--
-- TOC entry 2310 (class 2606 OID 18315)
-- Dependencies: 2128 1681 1693
-- Name: fk5c30ed38a4df35f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed38a4df35f FOREIGN KEY (canica_id) REFERENCES canica(id_canica);


--
-- TOC entry 2312 (class 2606 OID 18325)
-- Dependencies: 1693 1677 2124
-- Name: fk5c30ed39c543e15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed39c543e15 FOREIGN KEY (aviso_id) REFERENCES aviso(id_aviso);


--
-- TOC entry 2315 (class 2606 OID 18340)
-- Dependencies: 1679 2126 1693
-- Name: fk5c30ed3d89fd71f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed3d89fd71f FOREIGN KEY (bitacora_id) REFERENCES bitacora(id_bitacora);


--
-- TOC entry 2313 (class 2606 OID 18330)
-- Dependencies: 1737 1693 2190
-- Name: fk5c30ed3edf3bbff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed3edf3bbff FOREIGN KEY (invitacion_id) REFERENCES invitacion(id_invitacion);


--
-- TOC entry 2320 (class 2606 OID 18365)
-- Dependencies: 2160 1705 1693
-- Name: fk5c30ed3f53a3670; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed3f53a3670 FOREIGN KEY (estatus_envio_id) REFERENCES estatus_envio(id_estatus_envio);


--
-- TOC entry 2319 (class 2606 OID 18360)
-- Dependencies: 1693 2224 1768
-- Name: fk5c30ed3fa79478c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk5c30ed3fa79478c FOREIGN KEY (tipo_envio_id) REFERENCES tipo_envio(id_tipo_envio);


--
-- TOC entry 2285 (class 2606 OID 18280)
-- Dependencies: 1730 2182 1684
-- Name: fk6259a23319ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY como_lograrlo
    ADD CONSTRAINT fk6259a23319ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2353 (class 2606 OID 18450)
-- Dependencies: 1772 1741 2228
-- Name: fk628a8af2a4aaa0c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk628a8af2a4aaa0c FOREIGN KEY (tipo_lugar_id) REFERENCES tipo_lugar(id_tipo_lugar);


--
-- TOC entry 2352 (class 2606 OID 18445)
-- Dependencies: 2238 1780 1741
-- Name: fk628a8af7ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk628a8af7ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2417 (class 2606 OID 18610)
-- Dependencies: 1785 2242 1784
-- Name: fk6b04e8dd451754c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vista
    ADD CONSTRAINT fk6b04e8dd451754c FOREIGN KEY (tipo_vista_id) REFERENCES tipo_vista(id_tipo_vista);


--
-- TOC entry 2349 (class 2606 OID 18440)
-- Dependencies: 1730 2182 1738
-- Name: fk6f21d0a319ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY justificacion
    ADD CONSTRAINT fk6f21d0a319ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2282 (class 2606 OID 18270)
-- Dependencies: 2182 1683 1730
-- Name: fk7cff144219ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT fk7cff144219ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2283 (class 2606 OID 18275)
-- Dependencies: 2226 1770 1683
-- Name: fk7cff1442d1ed3168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT fk7cff1442d1ed3168 FOREIGN KEY (tipo_idea_id) REFERENCES tipo_idea(id_tipo_idea);


--
-- TOC entry 2338 (class 2606 OID 18410)
-- Dependencies: 2182 1730 1736
-- Name: fk8e9c309f19ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk8e9c309f19ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2337 (class 2606 OID 18405)
-- Dependencies: 1736 2238 1780
-- Name: fk8e9c309f7ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk8e9c309f7ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2339 (class 2606 OID 18415)
-- Dependencies: 1709 2164 1736
-- Name: fk8e9c309f8d8ead84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk8e9c309f8d8ead84 FOREIGN KEY (estatus_integrante_id) REFERENCES estatus_integrante(id_estatus_integrante);


--
-- TOC entry 2248 (class 2606 OID 17173)
-- Dependencies: 2126 1679 1677
-- Name: fk_aviso_bitacora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_bitacora FOREIGN KEY (bitacora_id) REFERENCES bitacora(id_bitacora);


--
-- TOC entry 2249 (class 2606 OID 17178)
-- Dependencies: 2128 1681 1677
-- Name: fk_aviso_canica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_canica FOREIGN KEY (canica_id) REFERENCES canica(id_canica);


--
-- TOC entry 2250 (class 2606 OID 17183)
-- Dependencies: 1677 1693 2146
-- Name: fk_aviso_envio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_envio FOREIGN KEY (envio_id) REFERENCES envio(id_envio);


--
-- TOC entry 2251 (class 2606 OID 17188)
-- Dependencies: 1677 2148 1695
-- Name: fk_aviso_estatus_aviso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_estatus_aviso FOREIGN KEY (estatus_aviso_id) REFERENCES estatus_aviso(id_estatus_aviso);


--
-- TOC entry 2252 (class 2606 OID 17193)
-- Dependencies: 2182 1677 1730
-- Name: fk_aviso_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2253 (class 2606 OID 17198)
-- Dependencies: 2206 1677 1751
-- Name: fk_aviso_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta);


--
-- TOC entry 2254 (class 2606 OID 17203)
-- Dependencies: 1753 1677 2208
-- Name: fk_aviso_reporte_abuso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_reporte_abuso FOREIGN KEY (reporte_abuso_id) REFERENCES reporte_abuso(id_reporte_abuso);


--
-- TOC entry 2255 (class 2606 OID 17208)
-- Dependencies: 2214 1677 1758
-- Name: fk_aviso_ticket_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_ticket_registro FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);


--
-- TOC entry 2256 (class 2606 OID 17213)
-- Dependencies: 1677 2216 1760
-- Name: fk_aviso_tipo_aviso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_tipo_aviso FOREIGN KEY (tipo_aviso_id) REFERENCES tipo_aviso(id_tipo_aviso);


--
-- TOC entry 2257 (class 2606 OID 17218)
-- Dependencies: 1677 2238 1780
-- Name: fk_aviso_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2268 (class 2606 OID 17223)
-- Dependencies: 1699 1679 2154
-- Name: fk_bitacora_estatus_bitacora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_estatus_bitacora FOREIGN KEY (estatus_bitacora_id) REFERENCES estatus_bitacora(id_estatus_bitacora);


--
-- TOC entry 2269 (class 2606 OID 17228)
-- Dependencies: 1679 2182 1730
-- Name: fk_bitacora_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2270 (class 2606 OID 17233)
-- Dependencies: 1679 2218 1762
-- Name: fk_bitacora_tipo_bitacora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_tipo_bitacora FOREIGN KEY (tipo_bitacora_id) REFERENCES tipo_bitacora(id_tipo_bitacora);


--
-- TOC entry 2271 (class 2606 OID 17238)
-- Dependencies: 1679 2238 1780
-- Name: fk_bitacora_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2276 (class 2606 OID 17243)
-- Dependencies: 1744 1681 2198
-- Name: fk_canica_necesidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY canica
    ADD CONSTRAINT fk_canica_necesidad FOREIGN KEY (necesidad_id) REFERENCES necesidad(id_necesidad);


--
-- TOC entry 2280 (class 2606 OID 17248)
-- Dependencies: 2182 1730 1683
-- Name: fk_clasificacion_idea_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT fk_clasificacion_idea_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2281 (class 2606 OID 17253)
-- Dependencies: 1683 2226 1770
-- Name: fk_clasificacion_idea_tipo_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT fk_clasificacion_idea_tipo_idea FOREIGN KEY (tipo_idea_id) REFERENCES tipo_idea(id_tipo_idea);


--
-- TOC entry 2284 (class 2606 OID 17258)
-- Dependencies: 1730 1684 2182
-- Name: fk_como_lograrlo_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY como_lograrlo
    ADD CONSTRAINT fk_como_lograrlo_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2288 (class 2606 OID 17263)
-- Dependencies: 1764 2220 1689
-- Name: fk_contacto_usuario_tipo_contacto_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT fk_contacto_usuario_tipo_contacto_usuario FOREIGN KEY (tipo_contacto_usuario_id) REFERENCES tipo_contacto_usuario(id_tipo_contacto_usuario);


--
-- TOC entry 2289 (class 2606 OID 17268)
-- Dependencies: 2238 1689 1780
-- Name: fk_contacto_usuario_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT fk_contacto_usuario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2292 (class 2606 OID 17273)
-- Dependencies: 2158 1703 1691
-- Name: fk_critica_estatus_critica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT fk_critica_estatus_critica FOREIGN KEY (estatus_critica_id) REFERENCES estatus_critica(id_estatus_critica);


--
-- TOC entry 2293 (class 2606 OID 17278)
-- Dependencies: 1691 2222 1766
-- Name: fk_critica_tipo_critica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT fk_critica_tipo_critica FOREIGN KEY (tipo_critica_id) REFERENCES tipo_critica(id_tipo_critica);


--
-- TOC entry 2294 (class 2606 OID 17283)
-- Dependencies: 2238 1780 1691
-- Name: fk_critica_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY critica
    ADD CONSTRAINT fk_critica_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2298 (class 2606 OID 17288)
-- Dependencies: 1693 1677 2124
-- Name: fk_envio_aviso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_aviso FOREIGN KEY (aviso_id) REFERENCES aviso(id_aviso);


--
-- TOC entry 2299 (class 2606 OID 17293)
-- Dependencies: 1693 1679 2126
-- Name: fk_envio_bitacora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_bitacora FOREIGN KEY (bitacora_id) REFERENCES bitacora(id_bitacora);


--
-- TOC entry 2300 (class 2606 OID 17298)
-- Dependencies: 2128 1693 1681
-- Name: fk_envio_canica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_canica FOREIGN KEY (canica_id) REFERENCES canica(id_canica);


--
-- TOC entry 2301 (class 2606 OID 17303)
-- Dependencies: 1693 2136 1686
-- Name: fk_envio_comunidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id_comunidad);


--
-- TOC entry 2302 (class 2606 OID 17308)
-- Dependencies: 1693 2160 1705
-- Name: fk_envio_estatus_envio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_estatus_envio FOREIGN KEY (estatus_envio_id) REFERENCES estatus_envio(id_estatus_envio);


--
-- TOC entry 2303 (class 2606 OID 17313)
-- Dependencies: 1730 1693 2182
-- Name: fk_envio_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2304 (class 2606 OID 17318)
-- Dependencies: 1693 2190 1737
-- Name: fk_envio_invitacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_invitacion FOREIGN KEY (invitacion_id) REFERENCES invitacion(id_invitacion);


--
-- TOC entry 2305 (class 2606 OID 17323)
-- Dependencies: 1693 2206 1751
-- Name: fk_envio_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta);


--
-- TOC entry 2306 (class 2606 OID 17328)
-- Dependencies: 1693 2208 1753
-- Name: fk_envio_reporte_abuso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_reporte_abuso FOREIGN KEY (reporte_abuso_id) REFERENCES reporte_abuso(id_reporte_abuso);


--
-- TOC entry 2307 (class 2606 OID 17333)
-- Dependencies: 1758 1693 2214
-- Name: fk_envio_ticket_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_ticket_registro FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);


--
-- TOC entry 2308 (class 2606 OID 17338)
-- Dependencies: 1768 1693 2224
-- Name: fk_envio_tipo_envio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_tipo_envio FOREIGN KEY (tipo_envio_id) REFERENCES tipo_envio(id_tipo_envio);


--
-- TOC entry 2309 (class 2606 OID 17343)
-- Dependencies: 2238 1780 1693
-- Name: fk_envio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2322 (class 2606 OID 17348)
-- Dependencies: 1730 1697 2150
-- Name: fk_idea_estatus_ayuda_monetaria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_estatus_ayuda_monetaria FOREIGN KEY (estatus_ayuda_monetaria_id) REFERENCES estatus_ayuda_monetaria(id_estatus_ayuda_monetaria);


--
-- TOC entry 2323 (class 2606 OID 17353)
-- Dependencies: 1730 2152 1698
-- Name: fk_idea_estatus_ayuda_recursos_humanos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_estatus_ayuda_recursos_humanos FOREIGN KEY (estatus_ayuda_recursos_humanos_id) REFERENCES estatus_ayuda_recursos_humanos(id_estatus_ayuda_recursos_humanos);


--
-- TOC entry 2324 (class 2606 OID 17358)
-- Dependencies: 2162 1707 1730
-- Name: fk_idea_estatus_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_estatus_idea FOREIGN KEY (estatus_idea_id) REFERENCES estatus_idea(id_estatus_idea);


--
-- TOC entry 2325 (class 2606 OID 17363)
-- Dependencies: 2194 1741 1730
-- Name: fk_idea_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_lugar FOREIGN KEY (lugar_id) REFERENCES lugar(id_lugar);


--
-- TOC entry 2326 (class 2606 OID 17368)
-- Dependencies: 1730 2238 1780
-- Name: fk_idea_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2332 (class 2606 OID 17373)
-- Dependencies: 1730 2182 1732
-- Name: fk_imagen_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imagen
    ADD CONSTRAINT fk_imagen_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2334 (class 2606 OID 17378)
-- Dependencies: 1736 1709 2164
-- Name: fk_integrante_estatus_integrante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk_integrante_estatus_integrante FOREIGN KEY (estatus_integrante_id) REFERENCES estatus_integrante(id_estatus_integrante);


--
-- TOC entry 2335 (class 2606 OID 17383)
-- Dependencies: 1736 1730 2182
-- Name: fk_integrante_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk_integrante_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2336 (class 2606 OID 17388)
-- Dependencies: 1780 1736 2238
-- Name: fk_integrante_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk_integrante_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2340 (class 2606 OID 17393)
-- Dependencies: 1737 1711 2166
-- Name: fk_invitacion_estatus_invitacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_estatus_invitacion FOREIGN KEY (estatus_invitacion_id) REFERENCES estatus_invitacion(id_estatus_invitacion);


--
-- TOC entry 2341 (class 2606 OID 17398)
-- Dependencies: 1737 1758 2214
-- Name: fk_invitacion_ticket_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_ticket_registro FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);


--
-- TOC entry 2342 (class 2606 OID 17403)
-- Dependencies: 1737 1780 2238
-- Name: fk_invitacion_usuario_invitado_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_usuario_invitado_usuario FOREIGN KEY (usuario_invitado_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2343 (class 2606 OID 17408)
-- Dependencies: 1780 2238 1737
-- Name: fk_invitacion_usuario_invitante_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_usuario_invitante_usuario FOREIGN KEY (usuario_invitante_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2348 (class 2606 OID 17413)
-- Dependencies: 2182 1738 1730
-- Name: fk_justificacion_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY justificacion
    ADD CONSTRAINT fk_justificacion_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2350 (class 2606 OID 17418)
-- Dependencies: 2228 1772 1741
-- Name: fk_lugar_tipo_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk_lugar_tipo_lugar FOREIGN KEY (tipo_lugar_id) REFERENCES tipo_lugar(id_tipo_lugar);


--
-- TOC entry 2351 (class 2606 OID 17423)
-- Dependencies: 2238 1780 1741
-- Name: fk_lugar_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk_lugar_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2354 (class 2606 OID 17428)
-- Dependencies: 2136 1743 1686
-- Name: fk_miembro_comunidad_comunidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk_miembro_comunidad_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id_comunidad);


--
-- TOC entry 2355 (class 2606 OID 17433)
-- Dependencies: 2168 1743 1713
-- Name: fk_miembro_comunidad_estatus_miembro_comunidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk_miembro_comunidad_estatus_miembro_comunidad FOREIGN KEY (estatus_miembro_comunidad_id) REFERENCES estatus_miembro_comunidad(id_estatus_miembro_comunidad);


--
-- TOC entry 2356 (class 2606 OID 17438)
-- Dependencies: 1743 2238 1780
-- Name: fk_miembro_comunidad_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk_miembro_comunidad_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2360 (class 2606 OID 17443)
-- Dependencies: 1744 2170 1716
-- Name: fk_necesidad_estatus_necesidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY necesidad
    ADD CONSTRAINT fk_necesidad_estatus_necesidad FOREIGN KEY (estatus_necesidad_id) REFERENCES estatus_necesidad(id_estatus_necesidad);


--
-- TOC entry 2361 (class 2606 OID 17448)
-- Dependencies: 1730 2182 1744
-- Name: fk_necesidad_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY necesidad
    ADD CONSTRAINT fk_necesidad_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2277 (class 2606 OID 17453)
-- Dependencies: 1780 1681 2238
-- Name: fk_necesidad_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY canica
    ADD CONSTRAINT fk_necesidad_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2364 (class 2606 OID 17458)
-- Dependencies: 1746 2182 1730
-- Name: fk_objetivo_especifico_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT fk_objetivo_especifico_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2366 (class 2606 OID 17463)
-- Dependencies: 1730 2182 1748
-- Name: fk_objetivo_general_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo_general
    ADD CONSTRAINT fk_objetivo_general_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2368 (class 2606 OID 17468)
-- Dependencies: 1755 1750 2210
-- Name: fk_permiso_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_permiso_rol FOREIGN KEY (rol_id) REFERENCES rol(id_rol);


--
-- TOC entry 2369 (class 2606 OID 17473)
-- Dependencies: 2238 1750 1780
-- Name: fk_permiso_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_permiso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2372 (class 2606 OID 17478)
-- Dependencies: 1751 2172 1718
-- Name: fk_pregunta_estatus_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_estatus_pregunta FOREIGN KEY (estatus_pregunta_id) REFERENCES estatus_pregunta(id_estatus_pregunta);


--
-- TOC entry 2373 (class 2606 OID 17483)
-- Dependencies: 1751 2182 1730
-- Name: fk_pregunta_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2374 (class 2606 OID 17488)
-- Dependencies: 1780 2238 1751
-- Name: fk_pregunta_respuesta_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_respuesta_usuario FOREIGN KEY (usuario_respuesta_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2375 (class 2606 OID 17493)
-- Dependencies: 2238 1780 1751
-- Name: fk_pregunta_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_usuario FOREIGN KEY (usuario_pregunta_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2380 (class 2606 OID 17498)
-- Dependencies: 2122 1675 1753
-- Name: fk_reporte_abuso_accion_reporte_abuso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_accion_reporte_abuso FOREIGN KEY (accion_reporte_abuso_id) REFERENCES accion_reporte_abuso(id_accion_reporte_abuso);


--
-- TOC entry 2381 (class 2606 OID 17503)
-- Dependencies: 2174 1753 1721
-- Name: fk_reporte_abuso_estatus_reporte_abuso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_estatus_reporte_abuso FOREIGN KEY (estatus_reporte_abuso_id) REFERENCES estatus_reporte_abuso(id_estatus_reporte_abuso);


--
-- TOC entry 2382 (class 2606 OID 17508)
-- Dependencies: 1730 1753 2182
-- Name: fk_reporte_abuso_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2383 (class 2606 OID 17513)
-- Dependencies: 2230 1753 1774
-- Name: fk_reporte_abuso_tipo_reporte_abuso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_tipo_reporte_abuso FOREIGN KEY (tipo_reporte_abuso_id) REFERENCES tipo_reporte_abuso(id_tipo_reporte_abuso);


--
-- TOC entry 2384 (class 2606 OID 17518)
-- Dependencies: 1753 1780 2238
-- Name: fk_reporte_abuso_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2390 (class 2606 OID 17523)
-- Dependencies: 1757 1723 2176
-- Name: fk_seguidor_estatus_seguidor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor_estatus_seguidor FOREIGN KEY (estatus_seguidor_id) REFERENCES estatus_seguidor(id_estatus_seguidor);


--
-- TOC entry 2391 (class 2606 OID 17528)
-- Dependencies: 1757 1730 2182
-- Name: fk_seguidor_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2392 (class 2606 OID 17533)
-- Dependencies: 1757 1780 2238
-- Name: fk_seguidor_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2396 (class 2606 OID 17538)
-- Dependencies: 1758 1725 2178
-- Name: fk_ticket_registro_estatus_ticket_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk_ticket_registro_estatus_ticket_registro FOREIGN KEY (estatus_ticket_registro_id) REFERENCES estatus_ticket_registro(id_estatus_ticket_registro);


--
-- TOC entry 2397 (class 2606 OID 17543)
-- Dependencies: 1758 1776 2232
-- Name: fk_ticket_registro_tipo_ticket_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk_ticket_registro_tipo_ticket_registro FOREIGN KEY (tipo_ticket_registro_id) REFERENCES tipo_ticket_registro(id_tipo_ticket_registro);


--
-- TOC entry 2398 (class 2606 OID 17548)
-- Dependencies: 2238 1780 1758
-- Name: fk_ticket_registro_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk_ticket_registro_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2402 (class 2606 OID 17553)
-- Dependencies: 1780 1687 2138
-- Name: fk_usuario_configuracion_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_configuracion_usuario FOREIGN KEY (configuracion_usuario_id) REFERENCES configuracion_usuario(id_configuracion_usuario);


--
-- TOC entry 2403 (class 2606 OID 17558)
-- Dependencies: 2180 1727 1780
-- Name: fk_usuario_estatus_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_estatus_usuario FOREIGN KEY (estatus_usuario_id) REFERENCES estatus_usuario(id_estatus_usuario);


--
-- TOC entry 2404 (class 2606 OID 17563)
-- Dependencies: 1734 2186 1780
-- Name: fk_usuario_institucion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_institucion FOREIGN KEY (institucion_id) REFERENCES institucion(id_institucion);


--
-- TOC entry 2410 (class 2606 OID 18165)
-- Dependencies: 1782 2182 1730
-- Name: fk_visita_idea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2408 (class 2606 OID 17568)
-- Dependencies: 1782 2234 1778
-- Name: fk_visita_tipo_visita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_tipo_visita FOREIGN KEY (tipo_visita_id) REFERENCES tipo_visita(id_tipo_visita);


--
-- TOC entry 2409 (class 2606 OID 17573)
-- Dependencies: 1782 2238 1780
-- Name: fk_visita_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2411 (class 2606 OID 18170)
-- Dependencies: 2244 1785 1782
-- Name: fk_visita_vista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_vista FOREIGN KEY (vista_id) REFERENCES vista(id_vista);


--
-- TOC entry 2416 (class 2606 OID 18150)
-- Dependencies: 2242 1785 1784
-- Name: fk_vista_tipo_vista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vista
    ADD CONSTRAINT fk_vista_tipo_vista FOREIGN KEY (tipo_vista_id) REFERENCES tipo_vista(id_tipo_vista);


--
-- TOC entry 2279 (class 2606 OID 18265)
-- Dependencies: 2198 1681 1744
-- Name: fkae7a44b75d316b95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY canica
    ADD CONSTRAINT fkae7a44b75d316b95 FOREIGN KEY (necesidad_id) REFERENCES necesidad(id_necesidad);


--
-- TOC entry 2278 (class 2606 OID 18260)
-- Dependencies: 1681 1780 2238
-- Name: fkae7a44b77ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY canica
    ADD CONSTRAINT fkae7a44b77ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2365 (class 2606 OID 18480)
-- Dependencies: 1746 2182 1730
-- Name: fkb041279b19ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT fkb041279b19ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2376 (class 2606 OID 18500)
-- Dependencies: 1730 2182 1751
-- Name: fkb345caea19ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fkb345caea19ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2378 (class 2606 OID 18510)
-- Dependencies: 1780 1751 2238
-- Name: fkb345caea3dd7c234; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fkb345caea3dd7c234 FOREIGN KEY (usuario_respuesta_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2377 (class 2606 OID 18505)
-- Dependencies: 2172 1751 1718
-- Name: fkb345caea74b58824; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fkb345caea74b58824 FOREIGN KEY (estatus_pregunta_id) REFERENCES estatus_pregunta(id_estatus_pregunta);


--
-- TOC entry 2379 (class 2606 OID 18515)
-- Dependencies: 1751 1780 2238
-- Name: fkb345caeaa35105c8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fkb345caeaa35105c8 FOREIGN KEY (usuario_pregunta_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2287 (class 2606 OID 18285)
-- Dependencies: 2156 1701 1686
-- Name: fkb506f558c1f23150; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comunidad
    ADD CONSTRAINT fkb506f558c1f23150 FOREIGN KEY (estatus_comunidad_id) REFERENCES estatus_comunidad(id_estatus_comunidad);


--
-- TOC entry 2333 (class 2606 OID 18400)
-- Dependencies: 1732 2182 1730
-- Name: fkb95a827319ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imagen
    ADD CONSTRAINT fkb95a827319ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2367 (class 2606 OID 18485)
-- Dependencies: 1748 2182 1730
-- Name: fkcd6022e519ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo_general
    ADD CONSTRAINT fkcd6022e519ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2414 (class 2606 OID 18600)
-- Dependencies: 1730 2182 1782
-- Name: fkcf595c7619ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fkcf595c7619ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2412 (class 2606 OID 18590)
-- Dependencies: 1782 1780 2238
-- Name: fkcf595c767ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fkcf595c767ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2413 (class 2606 OID 18595)
-- Dependencies: 1785 2244 1782
-- Name: fkcf595c76845644f5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fkcf595c76845644f5 FOREIGN KEY (vista_id) REFERENCES vista(id_vista);


--
-- TOC entry 2415 (class 2606 OID 18605)
-- Dependencies: 1782 2234 1778
-- Name: fkcf595c76a4244188; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visita
    ADD CONSTRAINT fkcf595c76a4244188 FOREIGN KEY (tipo_visita_id) REFERENCES tipo_visita(id_tipo_visita);


--
-- TOC entry 2371 (class 2606 OID 18495)
-- Dependencies: 2238 1780 1750
-- Name: fkd78cff957ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fkd78cff957ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2370 (class 2606 OID 18490)
-- Dependencies: 1750 2210 1755
-- Name: fkd78cff95be394075; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT fkd78cff95be394075 FOREIGN KEY (rol_id) REFERENCES rol(id_rol);


--
-- TOC entry 2362 (class 2606 OID 18470)
-- Dependencies: 2182 1730 1744
-- Name: fkd92694b819ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY necesidad
    ADD CONSTRAINT fkd92694b819ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2363 (class 2606 OID 18475)
-- Dependencies: 1744 2170 1716
-- Name: fkd92694b8a2057550; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY necesidad
    ADD CONSTRAINT fkd92694b8a2057550 FOREIGN KEY (estatus_necesidad_id) REFERENCES estatus_necesidad(id_estatus_necesidad);


--
-- TOC entry 2386 (class 2606 OID 18525)
-- Dependencies: 1753 1730 2182
-- Name: fkee4e25c219ab489f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fkee4e25c219ab489f FOREIGN KEY (idea_id) REFERENCES idea(id_idea);


--
-- TOC entry 2387 (class 2606 OID 18530)
-- Dependencies: 1753 1721 2174
-- Name: fkee4e25c2799e6751; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fkee4e25c2799e6751 FOREIGN KEY (estatus_reporte_abuso_id) REFERENCES estatus_reporte_abuso(id_estatus_reporte_abuso);


--
-- TOC entry 2385 (class 2606 OID 18520)
-- Dependencies: 1753 1780 2238
-- Name: fkee4e25c27ab7ca95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fkee4e25c27ab7ca95 FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);


--
-- TOC entry 2388 (class 2606 OID 18535)
-- Dependencies: 1753 1774 2230
-- Name: fkee4e25c2872ba11b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fkee4e25c2872ba11b FOREIGN KEY (tipo_reporte_abuso_id) REFERENCES tipo_reporte_abuso(id_tipo_reporte_abuso);


--
-- TOC entry 2389 (class 2606 OID 18540)
-- Dependencies: 1753 1675 2122
-- Name: fkee4e25c2bde7abbb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fkee4e25c2bde7abbb FOREIGN KEY (accion_reporte_abuso_id) REFERENCES accion_reporte_abuso(id_accion_reporte_abuso);


--
-- TOC entry 2405 (class 2606 OID 18575)
-- Dependencies: 1780 2186 1734
-- Name: fkf814f32e3cd85735; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fkf814f32e3cd85735 FOREIGN KEY (institucion_id) REFERENCES institucion(id_institucion);


--
-- TOC entry 2406 (class 2606 OID 18580)
-- Dependencies: 1780 1687 2138
-- Name: fkf814f32e6c2dbf30; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fkf814f32e6c2dbf30 FOREIGN KEY (configuracion_usuario_id) REFERENCES configuracion_usuario(id_configuracion_usuario);


--
-- TOC entry 2407 (class 2606 OID 18585)
-- Dependencies: 1727 2180 1780
-- Name: fkf814f32e6e90710; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fkf814f32e6e90710 FOREIGN KEY (estatus_usuario_id) REFERENCES estatus_usuario(id_estatus_usuario);


--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-07-12 16:07:47 CDT

--
-- PostgreSQL database dump complete
--

