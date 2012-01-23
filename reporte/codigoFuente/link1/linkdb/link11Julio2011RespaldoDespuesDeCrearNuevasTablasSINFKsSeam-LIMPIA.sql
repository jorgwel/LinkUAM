PGDMP     ;                    o           link    8.4.8    8.4.8 Y   Y	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            Z	           0    0 
   STDSTRINGS 
   STDSTRINGS     )   SET standard_conforming_strings = 'off';
                       false            [	           1262    16392    link    DATABASE     v   CREATE DATABASE link WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_MX.UTF-8' LC_CTYPE = 'es_MX.UTF-8';
    DROP DATABASE link;
             postgres    false            \	           1262    16392    link    COMMENT     B   COMMENT ON DATABASE link IS 'Primera base de datos en postgres.';
                  postgres    false    2395                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ]	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            ^	           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �           1259    16393    accion_reporte_abuso    TABLE     �   CREATE TABLE accion_reporte_abuso (
    id_accion_reporte_abuso integer NOT NULL,
    nombre_accion_reporte_abuso character varying(15) NOT NULL,
    descripcion_accion_reporte_abuso character varying(150) NOT NULL
);
 (   DROP TABLE public.accion_reporte_abuso;
       public         postgres    false    6            _	           0    0    TABLE accion_reporte_abuso    COMMENT     x   COMMENT ON TABLE accion_reporte_abuso IS 'Tabla que define la acción que se toma cuando un reporte_abuso es tratado.';
            public       postgres    false    1675            `	           0    0 3   COLUMN accion_reporte_abuso.id_accion_reporte_abuso    COMMENT     �   COMMENT ON COLUMN accion_reporte_abuso.id_accion_reporte_abuso IS 'Campo de tipo entero que indentifica a los registros de la tabla accion_reporte_abuso.';
            public       postgres    false    1675            a	           0    0 7   COLUMN accion_reporte_abuso.nombre_accion_reporte_abuso    COMMENT     �   COMMENT ON COLUMN accion_reporte_abuso.nombre_accion_reporte_abuso IS 'Campo de tipo texto que da nombte a una accion_reporte_abuso.';
            public       postgres    false    1675            b	           0    0 <   COLUMN accion_reporte_abuso.descripcion_accion_reporte_abuso    COMMENT     �   COMMENT ON COLUMN accion_reporte_abuso.descripcion_accion_reporte_abuso IS 'Campo de tipo texto que define a detalle una accion_reporte_abuso.';
            public       postgres    false    1675            �           1259    16396 0   accion_reporte_abuso_id_accion_reporte_abuso_seq    SEQUENCE     �   CREATE SEQUENCE accion_reporte_abuso_id_accion_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 G   DROP SEQUENCE public.accion_reporte_abuso_id_accion_reporte_abuso_seq;
       public       postgres    false    6    1675            c	           0    0 0   accion_reporte_abuso_id_accion_reporte_abuso_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE accion_reporte_abuso_id_accion_reporte_abuso_seq OWNED BY accion_reporte_abuso.id_accion_reporte_abuso;
            public       postgres    false    1676            d	           0    0 0   accion_reporte_abuso_id_accion_reporte_abuso_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('accion_reporte_abuso_id_accion_reporte_abuso_seq', 1, false);
            public       postgres    false    1676            �           1259    16398    aviso    TABLE     �  CREATE TABLE aviso (
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
    DROP TABLE public.aviso;
       public         postgres    false    6            e	           0    0    TABLE aviso    COMMENT     P   COMMENT ON TABLE aviso IS 'Tabla que contendrá los avisos para los usuarios.';
            public       postgres    false    1677            f	           0    0    COLUMN aviso.id_aviso    COMMENT     j   COMMENT ON COLUMN aviso.id_aviso IS 'Campo de tipo entero que identifica a las filas de la tabla aviso.';
            public       postgres    false    1677            g	           0    0    COLUMN aviso.texto_aviso    COMMENT     l   COMMENT ON COLUMN aviso.texto_aviso IS 'Campo de tipo texto que define el texto que conformará el aviso.';
            public       postgres    false    1677            h	           0    0 !   COLUMN aviso.fecha_creacion_aviso    COMMENT     r   COMMENT ON COLUMN aviso.fecha_creacion_aviso IS 'Campo de tipo date que define la fecha de creación del aviso.';
            public       postgres    false    1677            i	           0    0    COLUMN aviso.tipo_aviso_id    COMMENT     ^   COMMENT ON COLUMN aviso.tipo_aviso_id IS 'Campo de tipo entero que define el tipo de aviso.';
            public       postgres    false    1677            j	           0    0    COLUMN aviso.estatus_aviso_id    COMMENT     g   COMMENT ON COLUMN aviso.estatus_aviso_id IS 'Campo de tipo entero que define el estatus del usuario.';
            public       postgres    false    1677            k	           0    0    COLUMN aviso.idea_id    COMMENT     p   COMMENT ON COLUMN aviso.idea_id IS 'Campo de tipo entero que define la idea con la que se relaciona el aviso.';
            public       postgres    false    1677            l	           0    0    COLUMN aviso.usuario_id    COMMENT     v   COMMENT ON COLUMN aviso.usuario_id IS 'Campo de tipo entero que define el usuario con el que se relaciona el aviso.';
            public       postgres    false    1677            m	           0    0    COLUMN aviso.pregunta_id    COMMENT     x   COMMENT ON COLUMN aviso.pregunta_id IS 'Campo de tipo entero que define la pregunta con la que se relaciona el aviso.';
            public       postgres    false    1677            n	           0    0    COLUMN aviso.bitacora_id    COMMENT     y   COMMENT ON COLUMN aviso.bitacora_id IS 'Campo de tipo entero que define la bitácora con la que se relaciona el aviso.';
            public       postgres    false    1677            o	           0    0    COLUMN aviso.canica_id    COMMENT     �   COMMENT ON COLUMN aviso.canica_id IS 'Campo de tipo entqeo que define la canica/participación con la que se relaciona el aviso.';
            public       postgres    false    1677            p	           0    0    COLUMN aviso.reporte_abuso_id    COMMENT     v   COMMENT ON COLUMN aviso.reporte_abuso_id IS 'Campo que define el reporte de abuso con el que se relaciona el aviso.';
            public       postgres    false    1677            q	           0    0    COLUMN aviso.ticket_registro_id    COMMENT     z   COMMENT ON COLUMN aviso.ticket_registro_id IS 'Campo que define el ticket de registro con el que se relacione al aviso.';
            public       postgres    false    1677            r	           0    0    COLUMN aviso.envio_id    COMMENT     k   COMMENT ON COLUMN aviso.envio_id IS 'Campo de tipo entero que describe a un registro de la tabla envío.';
            public       postgres    false    1677            �           1259    16401    aviso_id_aviso_seq    SEQUENCE     t   CREATE SEQUENCE aviso_id_aviso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.aviso_id_aviso_seq;
       public       postgres    false    1677    6            s	           0    0    aviso_id_aviso_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE aviso_id_aviso_seq OWNED BY aviso.id_aviso;
            public       postgres    false    1678            t	           0    0    aviso_id_aviso_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('aviso_id_aviso_seq', 1, false);
            public       postgres    false    1678            �           1259    16403    bitacora    TABLE     ]  CREATE TABLE bitacora (
    id_bitacora integer NOT NULL,
    usuario_id integer NOT NULL,
    idea_id integer NOT NULL,
    titulo_bitacora character varying(100) NOT NULL,
    descripcion_bitacora character varying(400) NOT NULL,
    tipo_bitacora_id integer NOT NULL,
    fecha_bitacora date NOT NULL,
    estatus_bitacora_id integer NOT NULL
);
    DROP TABLE public.bitacora;
       public         postgres    false    6            u	           0    0    TABLE bitacora    COMMENT     x   COMMENT ON TABLE bitacora IS 'Tabla que contendrá avisos sobre los principales acontecimientos ocurridos en la idea.';
            public       postgres    false    1679            v	           0    0    COLUMN bitacora.id_bitacora    COMMENT     u   COMMENT ON COLUMN bitacora.id_bitacora IS 'Campo de tipo entero identificador de las filas de la tabla "bitacora".';
            public       postgres    false    1679            w	           0    0    COLUMN bitacora.usuario_id    COMMENT     �   COMMENT ON COLUMN bitacora.usuario_id IS 'Campo de tipo entero que describe el id de usuario autor de algún evento en bitacora.';
            public       postgres    false    1679            x	           0    0    COLUMN bitacora.idea_id    COMMENT     �   COMMENT ON COLUMN bitacora.idea_id IS 'Campo de tipo entero que describe la idea a la cuál pertenece el nuevo elemento aregado a la bitácora.';
            public       postgres    false    1679            y	           0    0    COLUMN bitacora.titulo_bitacora    COMMENT     �   COMMENT ON COLUMN bitacora.titulo_bitacora IS 'Campo de tipo texto "corto" que describe el contenido del nuevo elemento en bitácora.';
            public       postgres    false    1679            z	           0    0 $   COLUMN bitacora.descripcion_bitacora    COMMENT     �   COMMENT ON COLUMN bitacora.descripcion_bitacora IS 'Campo de tipo texto que se refiere al texto largo que describe el contenido de la bitácora en su totalidad.';
            public       postgres    false    1679            {	           0    0     COLUMN bitacora.tipo_bitacora_id    COMMENT     �   COMMENT ON COLUMN bitacora.tipo_bitacora_id IS 'Campo de tipo que se refiere al tipo de contenido que tendrá la bitácora (pdf, texto, imagen). ';
            public       postgres    false    1679            |	           0    0    COLUMN bitacora.fecha_bitacora    COMMENT     ~   COMMENT ON COLUMN bitacora.fecha_bitacora IS 'Campo de tipo fecha que define el momento en el que esta biácora fue creada.';
            public       postgres    false    1679            }	           0    0 #   COLUMN bitacora.estatus_bitacora_id    COMMENT     x   COMMENT ON COLUMN bitacora.estatus_bitacora_id IS 'Campo de tipo entero que define el estatus actual de una bitacora.';
            public       postgres    false    1679            �           1259    16409    bitacora_id_bitacora_seq    SEQUENCE     z   CREATE SEQUENCE bitacora_id_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bitacora_id_bitacora_seq;
       public       postgres    false    1679    6            ~	           0    0    bitacora_id_bitacora_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bitacora_id_bitacora_seq OWNED BY bitacora.id_bitacora;
            public       postgres    false    1680            	           0    0    bitacora_id_bitacora_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('bitacora_id_bitacora_seq', 1, false);
            public       postgres    false    1680            �           1259    16411    canica    TABLE     �   CREATE TABLE canica (
    id_canica integer NOT NULL,
    necesidad_id integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_canica date NOT NULL,
    texto_aportado_canica character varying(200)
);
    DROP TABLE public.canica;
       public         postgres    false    6            �	           0    0    TABLE canica    COMMENT     �   COMMENT ON TABLE canica IS 'Tabla que define al integrante que llenó una necesidad, la fecha en que fue llenada y algún texto que este quiera aportar al momento de llenar la necesidad.';
            public       postgres    false    1681            �	           0    0    COLUMN canica.id_canica    COMMENT     Z   COMMENT ON COLUMN canica.id_canica IS 'Campo que define el identificador de la cánica.';
            public       postgres    false    1681            �	           0    0    COLUMN canica.necesidad_id    COMMENT     �   COMMENT ON COLUMN canica.necesidad_id IS 'Este campo describe la necesidad que cubre esta canica.
Puede haber muchas canicas que cubran la misma necesidad.';
            public       postgres    false    1681            �	           0    0    COLUMN canica.usuario_id    COMMENT     c   COMMENT ON COLUMN canica.usuario_id IS 'Campo que define el usuario que ha llenado la necesidad.';
            public       postgres    false    1681            �	           0    0    COLUMN canica.fecha_canica    COMMENT     l   COMMENT ON COLUMN canica.fecha_canica IS 'Campo que describe en que momento la necesidad ha sido llenada.';
            public       postgres    false    1681            �	           0    0 #   COLUMN canica.texto_aportado_canica    COMMENT     �   COMMENT ON COLUMN canica.texto_aportado_canica IS 'Campo que describe un texto que el usuario quiera aportar al momento de proponerse como canica.';
            public       postgres    false    1681            �           1259    16414    canica_id_canica_seq    SEQUENCE     v   CREATE SEQUENCE canica_id_canica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 +   DROP SEQUENCE public.canica_id_canica_seq;
       public       postgres    false    1681    6            �	           0    0    canica_id_canica_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE canica_id_canica_seq OWNED BY canica.id_canica;
            public       postgres    false    1682            �	           0    0    canica_id_canica_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('canica_id_canica_seq', 1, false);
            public       postgres    false    1682            �           1259    16416    clasificacion_idea    TABLE     e   CREATE TABLE clasificacion_idea (
    idea_id integer NOT NULL,
    tipo_idea_id integer NOT NULL
);
 &   DROP TABLE public.clasificacion_idea;
       public         postgres    false    6            �	           0    0    TABLE clasificacion_idea    COMMENT     p   COMMENT ON TABLE clasificacion_idea IS 'Tabla que describe los diferentes tipos a los que pertenece una idea.';
            public       postgres    false    1683            �	           0    0 !   COLUMN clasificacion_idea.idea_id    COMMENT     �   COMMENT ON COLUMN clasificacion_idea.idea_id IS 'Campo de tipo entero que forma parte de la llave primaria de clasificacion_columna. También describe la idea clasificada.';
            public       postgres    false    1683            �	           0    0 &   COLUMN clasificacion_idea.tipo_idea_id    COMMENT     �   COMMENT ON COLUMN clasificacion_idea.tipo_idea_id IS 'Campo de tipo entero que forma parte de la llave primaria de clasificacion_idea. También describe la clasificación de una idea.';
            public       postgres    false    1683            �           1259    16419    como_lograrlo    TABLE     �   CREATE TABLE como_lograrlo (
    id_como_lograrlo integer NOT NULL,
    descripcion_como_lograrlo character varying(5000) NOT NULL,
    fecha_como_lograrlo date,
    idea_id integer NOT NULL
);
 !   DROP TABLE public.como_lograrlo;
       public         postgres    false    6            �	           0    0    TABLE como_lograrlo    COMMENT     k   COMMENT ON TABLE como_lograrlo IS 'Tabla que contendrá uan explicación acerca de como lograr una idea.';
            public       postgres    false    1684            �	           0    0 %   COLUMN como_lograrlo.id_como_lograrlo    COMMENT     �   COMMENT ON COLUMN como_lograrlo.id_como_lograrlo IS 'Campo de tipo entero que define el identifiador de las filas de la tabla como_lograrlo.';
            public       postgres    false    1684            �	           0    0 .   COLUMN como_lograrlo.descripcion_como_lograrlo    COMMENT     �   COMMENT ON COLUMN como_lograrlo.descripcion_como_lograrlo IS 'Campo de tipo texto que define la descripcion de como lograr una idea.';
            public       postgres    false    1684            �	           0    0 (   COLUMN como_lograrlo.fecha_como_lograrlo    COMMENT     �   COMMENT ON COLUMN como_lograrlo.fecha_como_lograrlo IS 'Campo de tipo fecha que define el momento en el que se creó una solución para cómo lograrlo.';
            public       postgres    false    1684            �	           0    0    COLUMN como_lograrlo.idea_id    COMMENT     �   COMMENT ON COLUMN como_lograrlo.idea_id IS 'Campo de tipo entero que define la relación entre una solución de como lograr una idea y la idea en si.';
            public       postgres    false    1684            �           1259    16425 "   como_lograrlo_id_como_lograrlo_seq    SEQUENCE     �   CREATE SEQUENCE como_lograrlo_id_como_lograrlo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 9   DROP SEQUENCE public.como_lograrlo_id_como_lograrlo_seq;
       public       postgres    false    6    1684            �	           0    0 "   como_lograrlo_id_como_lograrlo_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE como_lograrlo_id_como_lograrlo_seq OWNED BY como_lograrlo.id_como_lograrlo;
            public       postgres    false    1685            �	           0    0 "   como_lograrlo_id_como_lograrlo_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('como_lograrlo_id_como_lograrlo_seq', 1, false);
            public       postgres    false    1685            �           1259    16427 	   comunidad    TABLE       CREATE TABLE comunidad (
    id_comunidad integer NOT NULL,
    nombre_comunidad character varying(100) NOT NULL,
    descripcion_comunidad character varying NOT NULL,
    estatus_comunidad_id integer NOT NULL,
    titulo_comunidad character varying(100) NOT NULL
);
    DROP TABLE public.comunidad;
       public         postgres    false    6            �	           0    0    TABLE comunidad    COMMENT     s   COMMENT ON TABLE comunidad IS 'Esta tabla contendrá una lista con las comunidades de usuarios del sistema link.';
            public       postgres    false    1686            �	           0    0    COLUMN comunidad.id_comunidad    COMMENT     �   COMMENT ON COLUMN comunidad.id_comunidad IS 'Campo de tipo entero que sirve de para identificar las filas de la tabla "comunidad".';
            public       postgres    false    1686            �	           0    0 !   COLUMN comunidad.nombre_comunidad    COMMENT     n   COMMENT ON COLUMN comunidad.nombre_comunidad IS 'Campo de tipo texto que define el nombre de una comunidad.';
            public       postgres    false    1686            �	           0    0 &   COLUMN comunidad.descripcion_comunidad    COMMENT     x   COMMENT ON COLUMN comunidad.descripcion_comunidad IS 'Campo de tipo texto que describe los intereses de la comunidad.';
            public       postgres    false    1686            �	           0    0 %   COLUMN comunidad.estatus_comunidad_id    COMMENT     y   COMMENT ON COLUMN comunidad.estatus_comunidad_id IS 'Campo que describe la relación entre una comunidad y su estatus.';
            public       postgres    false    1686            �	           0    0 !   COLUMN comunidad.titulo_comunidad    COMMENT     p   COMMENT ON COLUMN comunidad.titulo_comunidad IS 'Campo de tipo texto  que define el título de una comunidad.';
            public       postgres    false    1686            �           1259    16433    configuracion_usuario    TABLE     �  CREATE TABLE configuracion_usuario (
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
 )   DROP TABLE public.configuracion_usuario;
       public         postgres    false    6            �	           0    0    TABLE configuracion_usuario    COMMENT     b   COMMENT ON TABLE configuracion_usuario IS 'Tabla que contendrá las preferencias de un usuario.';
            public       postgres    false    1687            �	           0    0 5   COLUMN configuracion_usuario.id_configuracion_usuario    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.id_configuracion_usuario IS 'Campo de tipo entero que define el identificador para los registros de la tabla configuracion_usuario.';
            public       postgres    false    1687            �	           0    0 -   COLUMN configuracion_usuario.envio_de_correos    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.envio_de_correos IS 'Campo de tipo boolean que define si un usuario recibirá correos correspondientes a los eventos en el sistema, o no.';
            public       postgres    false    1687            �	           0    0 ,   COLUMN configuracion_usuario.aviso_preguntas    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.aviso_preguntas IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con preguntas.';
            public       postgres    false    1687            �	           0    0 ,   COLUMN configuracion_usuario.aviso_bitacoras    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.aviso_bitacoras IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con bitácoras.';
            public       postgres    false    1687            �	           0    0 2   COLUMN configuracion_usuario.aviso_participaciones    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.aviso_participaciones IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con participaciones.';
            public       postgres    false    1687            �	           0    0 (   COLUMN configuracion_usuario.aviso_ideas    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.aviso_ideas IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con ideas.';
            public       postgres    false    1687            �	           0    0 -   COLUMN configuracion_usuario.aviso_seguidores    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.aviso_seguidores IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con seguidores.';
            public       postgres    false    1687            �	           0    0 .   COLUMN configuracion_usuario.aviso_nuevo_lugar    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.aviso_nuevo_lugar IS 'Campo de tipo boolean que define si se le avisará a un usuario de eventos relacionados con lugares.';
            public       postgres    false    1687            �	           0    0 :   COLUMN configuracion_usuario.almacenar_posicion_geografica    COMMENT     �   COMMENT ON COLUMN configuracion_usuario.almacenar_posicion_geografica IS 'Campo de tipo boolean que define si se debe almacenar la posición geográfica del usuario.';
            public       postgres    false    1687            �           1259    16436 *   configuracion_usuario_id_configuracion_seq    SEQUENCE     �   CREATE SEQUENCE configuracion_usuario_id_configuracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 A   DROP SEQUENCE public.configuracion_usuario_id_configuracion_seq;
       public       postgres    false    1687    6            �	           0    0 *   configuracion_usuario_id_configuracion_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE configuracion_usuario_id_configuracion_seq OWNED BY configuracion_usuario.id_configuracion_usuario;
            public       postgres    false    1688            �	           0    0 *   configuracion_usuario_id_configuracion_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('configuracion_usuario_id_configuracion_seq', 1, false);
            public       postgres    false    1688            �           1259    16438    contacto_usuario    TABLE     i  CREATE TABLE contacto_usuario (
    id_contacto_usuario integer NOT NULL,
    usuario_id integer NOT NULL,
    texto_contacto_usuario character varying(100) NOT NULL,
    tipo_contacto_usuario_id integer NOT NULL,
    texto_complementario1 character varying(100),
    texto_complementario2 character varying(100),
    texto_complementario3 character varying
);
 $   DROP TABLE public.contacto_usuario;
       public         postgres    false    6            �	           0    0    TABLE contacto_usuario    COMMENT     ~   COMMENT ON TABLE contacto_usuario IS 'Tabla que contendrá los diferentes medios por los cuales comunicarse con un usuario.';
            public       postgres    false    1689            �	           0    0 +   COLUMN contacto_usuario.id_contacto_usuario    COMMENT     x   COMMENT ON COLUMN contacto_usuario.id_contacto_usuario IS 'Campo que define una manera de contactarse con un usuario.';
            public       postgres    false    1689            �	           0    0 "   COLUMN contacto_usuario.usuario_id    COMMENT     y   COMMENT ON COLUMN contacto_usuario.usuario_id IS 'Campo de tipo entero que define a que usuario pertenece el contacto.';
            public       postgres    false    1689            �	           0    0 .   COLUMN contacto_usuario.texto_contacto_usuario    COMMENT     �   COMMENT ON COLUMN contacto_usuario.texto_contacto_usuario IS 'Texto que define el nombre de usuario o el twitname o cualquiera cosa que funcione como identificador del usuario en la manera que propuso para comunicarse con el.';
            public       postgres    false    1689            �	           0    0 0   COLUMN contacto_usuario.tipo_contacto_usuario_id    COMMENT     l   COMMENT ON COLUMN contacto_usuario.tipo_contacto_usuario_id IS 'Campo que define el detalle del contacto.';
            public       postgres    false    1689            �	           0    0 -   COLUMN contacto_usuario.texto_complementario1    COMMENT     �   COMMENT ON COLUMN contacto_usuario.texto_complementario1 IS 'Texto que puede requerirse para almacenar información independiente de cada usuario pero correspondiente a cierto tipo_contacto_usuario.';
            public       postgres    false    1689            �	           0    0 -   COLUMN contacto_usuario.texto_complementario2    COMMENT     �   COMMENT ON COLUMN contacto_usuario.texto_complementario2 IS 'Texto que puede requerirse para almacenar información independiente de cada usuario pero correspondiente a cierto tipo_contacto_usuario.';
            public       postgres    false    1689            �	           0    0 -   COLUMN contacto_usuario.texto_complementario3    COMMENT     �   COMMENT ON COLUMN contacto_usuario.texto_complementario3 IS 'Texto que puede requerirse para almacenar información independiente de cada usuario pero correspondiente a cierto tipo_contacto_usuario.';
            public       postgres    false    1689            �           1259    16444 (   contacto_usuario_id_contacto_usuario_seq    SEQUENCE     �   CREATE SEQUENCE contacto_usuario_id_contacto_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.contacto_usuario_id_contacto_usuario_seq;
       public       postgres    false    1689    6            �	           0    0 (   contacto_usuario_id_contacto_usuario_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE contacto_usuario_id_contacto_usuario_seq OWNED BY contacto_usuario.id_contacto_usuario;
            public       postgres    false    1690            �	           0    0 (   contacto_usuario_id_contacto_usuario_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('contacto_usuario_id_contacto_usuario_seq', 1, false);
            public       postgres    false    1690            �           1259    16446    critica    TABLE     �   CREATE TABLE critica (
    id_critica integer NOT NULL,
    texto_critica character varying(400),
    tipo_critica_id integer NOT NULL,
    usuario_id integer,
    fecha_critica date NOT NULL,
    estatus_critica_id integer NOT NULL
);
    DROP TABLE public.critica;
       public         postgres    false    6            �	           0    0    TABLE critica    COMMENT     z   COMMENT ON TABLE critica IS 'Tabla que contendrá las críticas/comentarios hechas al sistema por los usuarios de Link.';
            public       postgres    false    1691            �	           0    0    COLUMN critica.id_critica    COMMENT     o   COMMENT ON COLUMN critica.id_critica IS 'Campo de tipo entero que describe las filas de la tabla "crítica".';
            public       postgres    false    1691            �	           0    0    COLUMN critica.texto_critica    COMMENT     h   COMMENT ON COLUMN critica.texto_critica IS 'Campo de tipo texto que describe el texto de la crítica.';
            public       postgres    false    1691            �	           0    0    COLUMN critica.tipo_critica_id    COMMENT     y   COMMENT ON COLUMN critica.tipo_critica_id IS 'Campo de tipo entero que define el tipo de crítica que hace un usuario.';
            public       postgres    false    1691            �	           0    0    COLUMN critica.usuario_id    COMMENT     q   COMMENT ON COLUMN critica.usuario_id IS 'Campo de tipo entero que describe el usuario que realiza la crítica.';
            public       postgres    false    1691            �	           0    0    COLUMN critica.fecha_critica    COMMENT     x   COMMENT ON COLUMN critica.fecha_critica IS 'Campo de tipo fecha que define el momento en que fue creada una crítica.';
            public       postgres    false    1691            �	           0    0 !   COLUMN critica.estatus_critica_id    COMMENT     o   COMMENT ON COLUMN critica.estatus_critica_id IS 'Campo de tipo entero que indica el estatus de una crítica.';
            public       postgres    false    1691            �           1259    16449    critica_id_critica_seq    SEQUENCE     x   CREATE SEQUENCE critica_id_critica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 -   DROP SEQUENCE public.critica_id_critica_seq;
       public       postgres    false    6    1691            �	           0    0    critica_id_critica_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE critica_id_critica_seq OWNED BY critica.id_critica;
            public       postgres    false    1692            �	           0    0    critica_id_critica_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('critica_id_critica_seq', 1, false);
            public       postgres    false    1692            �           1259    16451    envio    TABLE     �  CREATE TABLE envio (
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
    DROP TABLE public.envio;
       public         postgres    false    6            �	           0    0    TABLE envio    COMMENT     t   COMMENT ON TABLE envio IS 'Tabla que contendrá los registros de los envíos hechos (y no hechos) por el sistema.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.id_envio    COMMENT     }   COMMENT ON COLUMN envio.id_envio IS 'Campo de tipo serial que define el identificador de los registros en la tabla envío.';
            public       postgres    false    1693            �	           0    0 !   COLUMN envio.fecha_registro_envio    COMMENT     ~   COMMENT ON COLUMN envio.fecha_registro_envio IS 'Campo de tipo date que define la fecha en la que el envío fue registrado.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.fecha_envio_envio    COMMENT     w   COMMENT ON COLUMN envio.fecha_envio_envio IS 'Campo de tipo texto que define la fecha en la que el envío fue hecho.';
            public       postgres    false    1693            �	           0    0 "   COLUMN envio.numero_intentos_envio    COMMENT     �   COMMENT ON COLUMN envio.numero_intentos_envio IS 'Campo de tipo entero que define el número de intentos que se han hecho para hacer el envío.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.estatus_envio_id    COMMENT     f   COMMENT ON COLUMN envio.estatus_envio_id IS 'Campo de tipo entero que define el estatus del envío.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.tipo_envio_id    COMMENT     p   COMMENT ON COLUMN envio.tipo_envio_id IS 'Campo de tipo entero que define el tipo al que pertenece el envío.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.comunidad_id    COMMENT     u   COMMENT ON COLUMN envio.comunidad_id IS 'Campo de tipo entero que define la comunidad a la que se hará el envío.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.idea_id    COMMENT     �   COMMENT ON COLUMN envio.idea_id IS 'Campo de tipo entero que define la idea de la que se tomarán los miembros para hacer el envío.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.bitacora_id    COMMENT     �   COMMENT ON COLUMN envio.bitacora_id IS 'Campo de tipo entero que describe la relación entre un envío y una bitácora. Este caso se presenta cuando es necesario avisar a cierta comunidad(es) que una bitácora ha sido actualizada.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.pregunta_id    COMMENT     �   COMMENT ON COLUMN envio.pregunta_id IS 'Campo de tipo entero que describe la relación entre un envío y una pregunta. Este caso se presenta cuando es necesario avisar a cierto usuario que su pregunta ha sido contestada.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.usuario_id    COMMENT     �   COMMENT ON COLUMN envio.usuario_id IS 'Campo de tipo entero que se utiliza cuando el envío necesita referenciar la información de un usuario que pidió recuperación de password, o que se acaba de registrar.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.canica_id    COMMENT     �   COMMENT ON COLUMN envio.canica_id IS 'Campo de tipo entero que referencia a una participación en una idea por parte de un usuario.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.reporte_abuso_id    COMMENT     j   COMMENT ON COLUMN envio.reporte_abuso_id IS 'Campo de tipo entero que referencia a un reporte de abuso.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.ticket_registro_id    COMMENT     �   COMMENT ON COLUMN envio.ticket_registro_id IS 'Campo de tipo entero que referencia a un ticket de registro que se enviará a un usuario para completar su registro.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.aviso_id    COMMENT     i   COMMENT ON COLUMN envio.aviso_id IS 'Aviso que se adjuntará al envío para determinados casos de uso.';
            public       postgres    false    1693            �	           0    0    COLUMN envio.invitacion_id    COMMENT     n   COMMENT ON COLUMN envio.invitacion_id IS 'Campo de tipo entero que define la invitación que será enviada.';
            public       postgres    false    1693            �           1259    16454    envio_id_envio_seq    SEQUENCE     t   CREATE SEQUENCE envio_id_envio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.envio_id_envio_seq;
       public       postgres    false    6    1693            �	           0    0    envio_id_envio_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE envio_id_envio_seq OWNED BY envio.id_envio;
            public       postgres    false    1694            �	           0    0    envio_id_envio_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('envio_id_envio_seq', 1, false);
            public       postgres    false    1694            �           1259    16456    estatus_aviso    TABLE     �   CREATE TABLE estatus_aviso (
    id_estatus_aviso integer NOT NULL,
    nombre_estatus_aviso character varying(15) NOT NULL,
    definicion_estatus_aviso character varying(150) NOT NULL
);
 !   DROP TABLE public.estatus_aviso;
       public         postgres    false    6            �	           0    0    TABLE estatus_aviso    COMMENT     |   COMMENT ON TABLE estatus_aviso IS 'Tabla que contendrá los registros que describen los estados que puede tomar un aviso.';
            public       postgres    false    1695            �	           0    0 %   COLUMN estatus_aviso.id_estatus_aviso    COMMENT     �   COMMENT ON COLUMN estatus_aviso.id_estatus_aviso IS 'Campo de tipo enero que identifica los registros en la tabla estatus aviso.';
            public       postgres    false    1695            �	           0    0 )   COLUMN estatus_aviso.nombre_estatus_aviso    COMMENT     z   COMMENT ON COLUMN estatus_aviso.nombre_estatus_aviso IS 'Campo de tipo texto que define el nombre del estatus de aviso.';
            public       postgres    false    1695            �	           0    0 -   COLUMN estatus_aviso.definicion_estatus_aviso    COMMENT     �   COMMENT ON COLUMN estatus_aviso.definicion_estatus_aviso IS 'Campo de tipo texto que describe a detalle el estatus de un aviso.';
            public       postgres    false    1695            �           1259    16459 "   estatus_aviso_id_estatus_aviso_seq    SEQUENCE     �   CREATE SEQUENCE estatus_aviso_id_estatus_aviso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 9   DROP SEQUENCE public.estatus_aviso_id_estatus_aviso_seq;
       public       postgres    false    6    1695            �	           0    0 "   estatus_aviso_id_estatus_aviso_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE estatus_aviso_id_estatus_aviso_seq OWNED BY estatus_aviso.id_estatus_aviso;
            public       postgres    false    1696            �	           0    0 "   estatus_aviso_id_estatus_aviso_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('estatus_aviso_id_estatus_aviso_seq', 1, false);
            public       postgres    false    1696            �           1259    16461    estatus_ayuda_monetaria    TABLE     �   CREATE TABLE estatus_ayuda_monetaria (
    id_estatus_ayuda_monetaria integer NOT NULL,
    nombre_estatus_ayuda_monetaria character varying(15) NOT NULL,
    definicion_estatus_ayuda_monetaria character varying(150) NOT NULL
);
 +   DROP TABLE public.estatus_ayuda_monetaria;
       public         postgres    false    6            �	           0    0    TABLE estatus_ayuda_monetaria    COMMENT     �   COMMENT ON TABLE estatus_ayuda_monetaria IS 'Contendrá los posibles estatus monetarios que pudiese tener una idea(incluyendo INHABILITADO, PIDO y OFREZCO).';
            public       postgres    false    1697            �	           0    0 9   COLUMN estatus_ayuda_monetaria.id_estatus_ayuda_monetaria    COMMENT     �   COMMENT ON COLUMN estatus_ayuda_monetaria.id_estatus_ayuda_monetaria IS 'Campo de tipo entero que define el identificador de las filas de esta tabla.';
            public       postgres    false    1697            �	           0    0 =   COLUMN estatus_ayuda_monetaria.nombre_estatus_ayuda_monetaria    COMMENT     �   COMMENT ON COLUMN estatus_ayuda_monetaria.nombre_estatus_ayuda_monetaria IS 'Campo de tipo texto que describe el nombre de un estatus_ayuda_monetaria.';
            public       postgres    false    1697            �	           0    0 A   COLUMN estatus_ayuda_monetaria.definicion_estatus_ayuda_monetaria    COMMENT     �   COMMENT ON COLUMN estatus_ayuda_monetaria.definicion_estatus_ayuda_monetaria IS 'Campo de tipo texto que define al nombre_estatus_ayuda_monetaria.';
            public       postgres    false    1697            �           1259    16464    estatus_ayuda_recursos_humanos    TABLE       CREATE TABLE estatus_ayuda_recursos_humanos (
    id_estatus_ayuda_recursos_humanos integer NOT NULL,
    nombre_estatus_ayuda_recursos_humanos character varying(15) NOT NULL,
    definicion_estatus_ayuda_recursos_humanos character varying(150) NOT NULL
);
 2   DROP TABLE public.estatus_ayuda_recursos_humanos;
       public         postgres    false    6            �	           0    0 $   TABLE estatus_ayuda_recursos_humanos    COMMENT     �   COMMENT ON TABLE estatus_ayuda_recursos_humanos IS 'Esta tabla contendrá los posibles estados de ayuda relacionada con recursos humanos que pudiese tener una idea (incluyendo el inhabilitado).';
            public       postgres    false    1698            �	           0    0 G   COLUMN estatus_ayuda_recursos_humanos.id_estatus_ayuda_recursos_humanos    COMMENT     �   COMMENT ON COLUMN estatus_ayuda_recursos_humanos.id_estatus_ayuda_recursos_humanos IS 'Campo de tipo entero que define el estatus de la idea en cuanto a apoyo de recursos humanos se refiere.';
            public       postgres    false    1698            �	           0    0 K   COLUMN estatus_ayuda_recursos_humanos.nombre_estatus_ayuda_recursos_humanos    COMMENT     �   COMMENT ON COLUMN estatus_ayuda_recursos_humanos.nombre_estatus_ayuda_recursos_humanos IS 'Campo de tipo texto que define el nombre de un estatus de ayuda de recursos humanos.';
            public       postgres    false    1698            �	           0    0 O   COLUMN estatus_ayuda_recursos_humanos.definicion_estatus_ayuda_recursos_humanos    COMMENT     �   COMMENT ON COLUMN estatus_ayuda_recursos_humanos.definicion_estatus_ayuda_recursos_humanos IS 'Campo de tipo texto que define el estatus de ayuda para una idea en cuanto a recursos humanos serefiere.';
            public       postgres    false    1698            �           1259    16467    estatus_bitacora    TABLE     �   CREATE TABLE estatus_bitacora (
    id_estatus_bitacora integer NOT NULL,
    nombre_estatus_bitacora character varying(15) NOT NULL,
    definicion_estatus_bitacora character varying(150) NOT NULL
);
 $   DROP TABLE public.estatus_bitacora;
       public         postgres    false    6            �	           0    0    TABLE estatus_bitacora    COMMENT     r   COMMENT ON TABLE estatus_bitacora IS 'Tabla que contendrá los diferentes estados que puede tomar una bitacora.';
            public       postgres    false    1699            �	           0    0 +   COLUMN estatus_bitacora.id_estatus_bitacora    COMMENT     �   COMMENT ON COLUMN estatus_bitacora.id_estatus_bitacora IS 'Campo de tipo entero que define el identificador de las filas de la tabla estatus_bitacora.';
            public       postgres    false    1699            �	           0    0 /   COLUMN estatus_bitacora.nombre_estatus_bitacora    COMMENT     �   COMMENT ON COLUMN estatus_bitacora.nombre_estatus_bitacora IS 'Campo de tipo texto que define el nombre de un estatus de una bitácora.';
            public       postgres    false    1699            �	           0    0 3   COLUMN estatus_bitacora.definicion_estatus_bitacora    COMMENT     �   COMMENT ON COLUMN estatus_bitacora.definicion_estatus_bitacora IS 'Campo de tipo texto que describe el nombre de un estatus de una butácora.';
            public       postgres    false    1699            �           1259    16470 (   estatus_bitacora_id_estatus_bitacora_seq    SEQUENCE     �   CREATE SEQUENCE estatus_bitacora_id_estatus_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.estatus_bitacora_id_estatus_bitacora_seq;
       public       postgres    false    6    1699            �	           0    0 (   estatus_bitacora_id_estatus_bitacora_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE estatus_bitacora_id_estatus_bitacora_seq OWNED BY estatus_bitacora.id_estatus_bitacora;
            public       postgres    false    1700            �	           0    0 (   estatus_bitacora_id_estatus_bitacora_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('estatus_bitacora_id_estatus_bitacora_seq', 1, false);
            public       postgres    false    1700            �           1259    16472    estatus_comunidad    TABLE     �   CREATE TABLE estatus_comunidad (
    id_estatus_comunidad integer NOT NULL,
    nombre_estatus_comunidad character varying(15) NOT NULL,
    definicion_estatus_comunidad character varying(150) NOT NULL
);
 %   DROP TABLE public.estatus_comunidad;
       public         postgres    false    6            �	           0    0    TABLE estatus_comunidad    COMMENT     t   COMMENT ON TABLE estatus_comunidad IS 'Tabla que contendrá los diferentes estados que puede tener una comunidad.';
            public       postgres    false    1701            �	           0    0 -   COLUMN estatus_comunidad.id_estatus_comunidad    COMMENT     �   COMMENT ON COLUMN estatus_comunidad.id_estatus_comunidad IS 'Campo de tipo entero que define el idenificador de estatus de una comunidad.';
            public       postgres    false    1701            �	           0    0 1   COLUMN estatus_comunidad.nombre_estatus_comunidad    COMMENT     �   COMMENT ON COLUMN estatus_comunidad.nombre_estatus_comunidad IS 'Campo de tipo texto que define el nombre de un estatus de una comunidad.';
            public       postgres    false    1701            �	           0    0 5   COLUMN estatus_comunidad.definicion_estatus_comunidad    COMMENT     �   COMMENT ON COLUMN estatus_comunidad.definicion_estatus_comunidad IS 'Campo de tipo texto que describe el estatus de una comunidad.';
            public       postgres    false    1701            �           1259    16475 *   estatus_comunidad_id_estatus_comunidad_seq    SEQUENCE     �   CREATE SEQUENCE estatus_comunidad_id_estatus_comunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 A   DROP SEQUENCE public.estatus_comunidad_id_estatus_comunidad_seq;
       public       postgres    false    6    1701            �	           0    0 *   estatus_comunidad_id_estatus_comunidad_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE estatus_comunidad_id_estatus_comunidad_seq OWNED BY estatus_comunidad.id_estatus_comunidad;
            public       postgres    false    1702            �	           0    0 *   estatus_comunidad_id_estatus_comunidad_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('estatus_comunidad_id_estatus_comunidad_seq', 1, false);
            public       postgres    false    1702            �           1259    16477    estatus_critica    TABLE     �   CREATE TABLE estatus_critica (
    id_estatus_critica integer NOT NULL,
    nombre_estatus_critica character varying(15) NOT NULL,
    definicion_estatus_critica character varying(150) NOT NULL
);
 #   DROP TABLE public.estatus_critica;
       public         postgres    false    6            �	           0    0    TABLE estatus_critica    COMMENT        COMMENT ON TABLE estatus_critica IS 'Tabla que definirá el estatus de una crítica hecha por un usuario acerca del sistema.';
            public       postgres    false    1703            �	           0    0 )   COLUMN estatus_critica.id_estatus_critica    COMMENT     �   COMMENT ON COLUMN estatus_critica.id_estatus_critica IS 'Campo de tipo entero que define el identificador de las filas de la tabla estatus_critica';
            public       postgres    false    1703            �	           0    0 -   COLUMN estatus_critica.nombre_estatus_critica    COMMENT     �   COMMENT ON COLUMN estatus_critica.nombre_estatus_critica IS 'Campo de tipo texto que define el nombre de un estatus de crítica.';
            public       postgres    false    1703            �	           0    0 1   COLUMN estatus_critica.definicion_estatus_critica    COMMENT     �   COMMENT ON COLUMN estatus_critica.definicion_estatus_critica IS 'Campo de tipo texto que define el significado de un nombre de  estatus de una crítica.';
            public       postgres    false    1703            �           1259    16480 &   estatus_critica_id_estatus_critica_seq    SEQUENCE     �   CREATE SEQUENCE estatus_critica_id_estatus_critica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 =   DROP SEQUENCE public.estatus_critica_id_estatus_critica_seq;
       public       postgres    false    1703    6            �	           0    0 &   estatus_critica_id_estatus_critica_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE estatus_critica_id_estatus_critica_seq OWNED BY estatus_critica.id_estatus_critica;
            public       postgres    false    1704            �	           0    0 &   estatus_critica_id_estatus_critica_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('estatus_critica_id_estatus_critica_seq', 1, false);
            public       postgres    false    1704            �           1259    16482    estatus_envio    TABLE     �   CREATE TABLE estatus_envio (
    id_estatus_envio integer NOT NULL,
    nombre_estatus_envio character varying(15) NOT NULL,
    definicion_estatus_envio character varying(150) NOT NULL
);
 !   DROP TABLE public.estatus_envio;
       public         postgres    false    6            �	           0    0    TABLE estatus_envio    COMMENT     �   COMMENT ON TABLE estatus_envio IS 'Tabla que contiene los registros relacionados con los diferentes estatus que puede tomar un envío.';
            public       postgres    false    1705            �	           0    0 %   COLUMN estatus_envio.id_estatus_envio    COMMENT     �   COMMENT ON COLUMN estatus_envio.id_estatus_envio IS 'Campo de tipo entero que describe el identificador de los registros de la tabla estatus_envio.';
            public       postgres    false    1705            �	           0    0 )   COLUMN estatus_envio.nombre_estatus_envio    COMMENT        COMMENT ON COLUMN estatus_envio.nombre_estatus_envio IS 'Campo de tipo texto que describe el nombre de un estatus de envío.';
            public       postgres    false    1705            �	           0    0 -   COLUMN estatus_envio.definicion_estatus_envio    COMMENT     ~   COMMENT ON COLUMN estatus_envio.definicion_estatus_envio IS 'Campo de tipo texto que define a detalle un estatus de envío.';
            public       postgres    false    1705            �           1259    16485 "   estatus_envio_id_estatus_envio_seq    SEQUENCE     �   CREATE SEQUENCE estatus_envio_id_estatus_envio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 9   DROP SEQUENCE public.estatus_envio_id_estatus_envio_seq;
       public       postgres    false    6    1705            �	           0    0 "   estatus_envio_id_estatus_envio_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE estatus_envio_id_estatus_envio_seq OWNED BY estatus_envio.id_estatus_envio;
            public       postgres    false    1706            �	           0    0 "   estatus_envio_id_estatus_envio_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('estatus_envio_id_estatus_envio_seq', 1, false);
            public       postgres    false    1706            �           1259    16487    estatus_idea    TABLE     �   CREATE TABLE estatus_idea (
    id_estatus_idea integer NOT NULL,
    nombre_estatus_idea character varying(15) NOT NULL,
    definicion_estatus_idea character varying(150) NOT NULL
);
     DROP TABLE public.estatus_idea;
       public         postgres    false    6            �	           0    0    TABLE estatus_idea    COMMENT        COMMENT ON TABLE estatus_idea IS 'Tabla que contiene los diferentes estados que puede tomar una idea en determinado momento.';
            public       postgres    false    1707            �	           0    0 #   COLUMN estatus_idea.id_estatus_idea    COMMENT     �   COMMENT ON COLUMN estatus_idea.id_estatus_idea IS 'Campo de tipo entero que describe el identificador de las filas de la tabla estatus_idea.';
            public       postgres    false    1707            �	           0    0 '   COLUMN estatus_idea.nombre_estatus_idea    COMMENT     {   COMMENT ON COLUMN estatus_idea.nombre_estatus_idea IS 'Campo de tipo texto que describe el nombre de un estatus de idea.';
            public       postgres    false    1707            �	           0    0 +   COLUMN estatus_idea.definicion_estatus_idea    COMMENT        COMMENT ON COLUMN estatus_idea.definicion_estatus_idea IS 'Campo de tipo texto que describe a detalle el estatus de la idea.';
            public       postgres    false    1707            �           1259    16490     estatus_idea_id_estatus_idea_seq    SEQUENCE     �   CREATE SEQUENCE estatus_idea_id_estatus_idea_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 7   DROP SEQUENCE public.estatus_idea_id_estatus_idea_seq;
       public       postgres    false    6    1707            �	           0    0     estatus_idea_id_estatus_idea_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE estatus_idea_id_estatus_idea_seq OWNED BY estatus_idea.id_estatus_idea;
            public       postgres    false    1708            �	           0    0     estatus_idea_id_estatus_idea_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('estatus_idea_id_estatus_idea_seq', 1, false);
            public       postgres    false    1708            �           1259    16492    estatus_integrante    TABLE     �   CREATE TABLE estatus_integrante (
    id_estatus_integrante integer NOT NULL,
    nombre_estatus_integrante character varying(15) NOT NULL,
    definicion_estatus_integrante character varying(150) NOT NULL
);
 &   DROP TABLE public.estatus_integrante;
       public         postgres    false    6            �	           0    0    TABLE estatus_integrante    COMMENT     �   COMMENT ON TABLE estatus_integrante IS 'Representa el estatus que puede tener el integrante de una idea en determinado momento.';
            public       postgres    false    1709            �	           0    0 /   COLUMN estatus_integrante.id_estatus_integrante    COMMENT     �   COMMENT ON COLUMN estatus_integrante.id_estatus_integrante IS 'Campo de tipo entero que define el identificador de las filas de la tabla estatus_integrante.';
            public       postgres    false    1709            �	           0    0 3   COLUMN estatus_integrante.nombre_estatus_integrante    COMMENT     �   COMMENT ON COLUMN estatus_integrante.nombre_estatus_integrante IS 'Campo de tipo texto que define el nombre de un estatus de integrante de una idea.';
            public       postgres    false    1709            �	           0    0 7   COLUMN estatus_integrante.definicion_estatus_integrante    COMMENT     �   COMMENT ON COLUMN estatus_integrante.definicion_estatus_integrante IS 'Campo de texto que define a detalle el estatus de un integrante de una idea.';
            public       postgres    false    1709            �           1259    16495 ,   estatus_integrante_id_estatus_integrante_seq    SEQUENCE     �   CREATE SEQUENCE estatus_integrante_id_estatus_integrante_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 C   DROP SEQUENCE public.estatus_integrante_id_estatus_integrante_seq;
       public       postgres    false    6    1709            �	           0    0 ,   estatus_integrante_id_estatus_integrante_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE estatus_integrante_id_estatus_integrante_seq OWNED BY estatus_integrante.id_estatus_integrante;
            public       postgres    false    1710            �	           0    0 ,   estatus_integrante_id_estatus_integrante_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('estatus_integrante_id_estatus_integrante_seq', 1, false);
            public       postgres    false    1710            �           1259    16497    estatus_invitacion    TABLE     �   CREATE TABLE estatus_invitacion (
    id_estatus_invitacion integer NOT NULL,
    nombre_estatus_invitacion character varying(15) NOT NULL,
    descripcion_estatus_invitacion character varying(150) NOT NULL
);
 &   DROP TABLE public.estatus_invitacion;
       public         postgres    false    6            �	           0    0    TABLE estatus_invitacion    COMMENT     w   COMMENT ON TABLE estatus_invitacion IS 'Tabla que contendrá los diferentes estados que puede tener una invitación.';
            public       postgres    false    1711            �	           0    0 /   COLUMN estatus_invitacion.id_estatus_invitacion    COMMENT        COMMENT ON COLUMN estatus_invitacion.id_estatus_invitacion IS 'Campo de tipo entero que identifica un estado de invitación.';
            public       postgres    false    1711            �	           0    0 3   COLUMN estatus_invitacion.nombre_estatus_invitacion    COMMENT     �   COMMENT ON COLUMN estatus_invitacion.nombre_estatus_invitacion IS 'Campo de tipo texto que da nombre a un estatus de invitación.';
            public       postgres    false    1711            �	           0    0 8   COLUMN estatus_invitacion.descripcion_estatus_invitacion    COMMENT     �   COMMENT ON COLUMN estatus_invitacion.descripcion_estatus_invitacion IS 'Campo de tipo texto que define a detalle un estatus de invitación.';
            public       postgres    false    1711            �           1259    16500 ,   estatus_invitacion_id_estatus_invitacion_seq    SEQUENCE     �   CREATE SEQUENCE estatus_invitacion_id_estatus_invitacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 C   DROP SEQUENCE public.estatus_invitacion_id_estatus_invitacion_seq;
       public       postgres    false    6    1711             
           0    0 ,   estatus_invitacion_id_estatus_invitacion_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE estatus_invitacion_id_estatus_invitacion_seq OWNED BY estatus_invitacion.id_estatus_invitacion;
            public       postgres    false    1712            
           0    0 ,   estatus_invitacion_id_estatus_invitacion_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('estatus_invitacion_id_estatus_invitacion_seq', 1, false);
            public       postgres    false    1712            �           1259    16502    estatus_miembro_comunidad    TABLE     �   CREATE TABLE estatus_miembro_comunidad (
    id_estatus_miembro_comunidad integer NOT NULL,
    nombre_estatus_miembro_comunidad character varying(15) NOT NULL,
    definicion_estatus_miembro_comunidad character varying(150) NOT NULL
);
 -   DROP TABLE public.estatus_miembro_comunidad;
       public         postgres    false    6            
           0    0    TABLE estatus_miembro_comunidad    COMMENT     �   COMMENT ON TABLE estatus_miembro_comunidad IS 'Tabla que describe los diferentes estados que puede tener un miembro de una comunidad.';
            public       postgres    false    1713            
           0    0 =   COLUMN estatus_miembro_comunidad.id_estatus_miembro_comunidad    COMMENT     �   COMMENT ON COLUMN estatus_miembro_comunidad.id_estatus_miembro_comunidad IS 'Campo de tipo entero que se refiere al identificador de las filas en la tabla estatus_miembro_comunidad.';
            public       postgres    false    1713            
           0    0 A   COLUMN estatus_miembro_comunidad.nombre_estatus_miembro_comunidad    COMMENT     �   COMMENT ON COLUMN estatus_miembro_comunidad.nombre_estatus_miembro_comunidad IS 'Campo de tipo texto que define el nombre de un estatus en la tabla estatus_miembro_comunidad.';
            public       postgres    false    1713            
           0    0 E   COLUMN estatus_miembro_comunidad.definicion_estatus_miembro_comunidad    COMMENT     �   COMMENT ON COLUMN estatus_miembro_comunidad.definicion_estatus_miembro_comunidad IS 'Campo de tipo texto que define el nombre_estatus_miembro_comunidad.';
            public       postgres    false    1713            �           1259    16505 &   estatus_miembro_id_estatus_miembro_seq    SEQUENCE     �   CREATE SEQUENCE estatus_miembro_id_estatus_miembro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 =   DROP SEQUENCE public.estatus_miembro_id_estatus_miembro_seq;
       public       postgres    false    6    1713            
           0    0 &   estatus_miembro_id_estatus_miembro_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE estatus_miembro_id_estatus_miembro_seq OWNED BY estatus_miembro_comunidad.id_estatus_miembro_comunidad;
            public       postgres    false    1714            
           0    0 &   estatus_miembro_id_estatus_miembro_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('estatus_miembro_id_estatus_miembro_seq', 1, false);
            public       postgres    false    1714            �           1259    16507 *   estatus_monetario_id_estatus_monetario_seq    SEQUENCE     �   CREATE SEQUENCE estatus_monetario_id_estatus_monetario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 A   DROP SEQUENCE public.estatus_monetario_id_estatus_monetario_seq;
       public       postgres    false    6    1697            
           0    0 *   estatus_monetario_id_estatus_monetario_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE estatus_monetario_id_estatus_monetario_seq OWNED BY estatus_ayuda_monetaria.id_estatus_ayuda_monetaria;
            public       postgres    false    1715            	
           0    0 *   estatus_monetario_id_estatus_monetario_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('estatus_monetario_id_estatus_monetario_seq', 1, false);
            public       postgres    false    1715            �           1259    16509    estatus_necesidad    TABLE     �   CREATE TABLE estatus_necesidad (
    id_estatus_necesidad integer NOT NULL,
    nombre_estatus_necesidad character varying(15) NOT NULL,
    definicion_estatus_necesidad character varying(150) NOT NULL
);
 %   DROP TABLE public.estatus_necesidad;
       public         postgres    false    6            

           0    0    TABLE estatus_necesidad    COMMENT     t   COMMENT ON TABLE estatus_necesidad IS 'Tabla que contendrá los diferentes estatus que puede tener una necesidad.';
            public       postgres    false    1716            
           0    0 -   COLUMN estatus_necesidad.id_estatus_necesidad    COMMENT     �   COMMENT ON COLUMN estatus_necesidad.id_estatus_necesidad IS 'Campo de tipo entero que define el identificador de las columnas de esta tabla.';
            public       postgres    false    1716            
           0    0 1   COLUMN estatus_necesidad.nombre_estatus_necesidad    COMMENT     �   COMMENT ON COLUMN estatus_necesidad.nombre_estatus_necesidad IS 'Campo de tipo texto que define el nombre para un estatus de necesidad.';
            public       postgres    false    1716            
           0    0 5   COLUMN estatus_necesidad.definicion_estatus_necesidad    COMMENT     �   COMMENT ON COLUMN estatus_necesidad.definicion_estatus_necesidad IS 'Campo de tipo texto que define el significado del nombre de un estatus_necesidad.';
            public       postgres    false    1716            �           1259    16512 *   estatus_necesidad_id_estatus_necesidad_seq    SEQUENCE     �   CREATE SEQUENCE estatus_necesidad_id_estatus_necesidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 A   DROP SEQUENCE public.estatus_necesidad_id_estatus_necesidad_seq;
       public       postgres    false    1716    6            
           0    0 *   estatus_necesidad_id_estatus_necesidad_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE estatus_necesidad_id_estatus_necesidad_seq OWNED BY estatus_necesidad.id_estatus_necesidad;
            public       postgres    false    1717            
           0    0 *   estatus_necesidad_id_estatus_necesidad_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('estatus_necesidad_id_estatus_necesidad_seq', 1, false);
            public       postgres    false    1717            �           1259    16514    estatus_pregunta    TABLE     �   CREATE TABLE estatus_pregunta (
    id_estatus_pregunta integer NOT NULL,
    nombre_estatus_pregunta character varying(15) NOT NULL,
    definicion_estatus_pregunta character varying(150) NOT NULL
);
 $   DROP TABLE public.estatus_pregunta;
       public         postgres    false    6            
           0    0    TABLE estatus_pregunta    COMMENT     �   COMMENT ON TABLE estatus_pregunta IS 'Contendrá los registros que representen todos los posibles estados que pueda tener una pregunta.';
            public       postgres    false    1718            
           0    0 +   COLUMN estatus_pregunta.id_estatus_pregunta    COMMENT     �   COMMENT ON COLUMN estatus_pregunta.id_estatus_pregunta IS 'Campo que define el identificador de las filas de la tabla estatus_pregunta';
            public       postgres    false    1718            
           0    0 /   COLUMN estatus_pregunta.nombre_estatus_pregunta    COMMENT     �   COMMENT ON COLUMN estatus_pregunta.nombre_estatus_pregunta IS 'Campo que define el nombre de un estatus en la tabla estatus_pregunta';
            public       postgres    false    1718            
           0    0 3   COLUMN estatus_pregunta.definicion_estatus_pregunta    COMMENT     �   COMMENT ON COLUMN estatus_pregunta.definicion_estatus_pregunta IS 'Campo que define un nombre de un registro en estatus_pregunta.';
            public       postgres    false    1718            �           1259    16517 (   estatus_pregunta_id_estatus_pregunta_seq    SEQUENCE     �   CREATE SEQUENCE estatus_pregunta_id_estatus_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.estatus_pregunta_id_estatus_pregunta_seq;
       public       postgres    false    6    1718            
           0    0 (   estatus_pregunta_id_estatus_pregunta_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE estatus_pregunta_id_estatus_pregunta_seq OWNED BY estatus_pregunta.id_estatus_pregunta;
            public       postgres    false    1719            
           0    0 (   estatus_pregunta_id_estatus_pregunta_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('estatus_pregunta_id_estatus_pregunta_seq', 1, false);
            public       postgres    false    1719            �           1259    16519 8   estatus_recursos_humanos_id_estatus_recursos_humanos_seq    SEQUENCE     �   CREATE SEQUENCE estatus_recursos_humanos_id_estatus_recursos_humanos_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 O   DROP SEQUENCE public.estatus_recursos_humanos_id_estatus_recursos_humanos_seq;
       public       postgres    false    1698    6            
           0    0 8   estatus_recursos_humanos_id_estatus_recursos_humanos_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE estatus_recursos_humanos_id_estatus_recursos_humanos_seq OWNED BY estatus_ayuda_recursos_humanos.id_estatus_ayuda_recursos_humanos;
            public       postgres    false    1720            
           0    0 8   estatus_recursos_humanos_id_estatus_recursos_humanos_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('estatus_recursos_humanos_id_estatus_recursos_humanos_seq', 1, false);
            public       postgres    false    1720            �           1259    16521    estatus_reporte_abuso    TABLE     �   CREATE TABLE estatus_reporte_abuso (
    id_estatus_reporte_abuso integer NOT NULL,
    nombre_estatus_reporte_abuso character varying(15) NOT NULL,
    definicion_estatus_reporte_abuso character varying(150) NOT NULL
);
 )   DROP TABLE public.estatus_reporte_abuso;
       public         postgres    false    6            
           0    0    TABLE estatus_reporte_abuso    COMMENT     a   COMMENT ON TABLE estatus_reporte_abuso IS 'Tabla que define el estatus de un reporte de abuso.';
            public       postgres    false    1721            
           0    0 5   COLUMN estatus_reporte_abuso.id_estatus_reporte_abuso    COMMENT     �   COMMENT ON COLUMN estatus_reporte_abuso.id_estatus_reporte_abuso IS 'Campo que sirve de identificador para los registros de la tabla estatus_reporte_abuso';
            public       postgres    false    1721            
           0    0 9   COLUMN estatus_reporte_abuso.nombre_estatus_reporte_abuso    COMMENT     �   COMMENT ON COLUMN estatus_reporte_abuso.nombre_estatus_reporte_abuso IS 'Campo de tipo texto que define el nombre de un estatus de reporte de abuso.';
            public       postgres    false    1721            
           0    0 =   COLUMN estatus_reporte_abuso.definicion_estatus_reporte_abuso    COMMENT     �   COMMENT ON COLUMN estatus_reporte_abuso.definicion_estatus_reporte_abuso IS 'Campo de tipo texto que describe a detalle un estatus de reporte de abuso.';
            public       postgres    false    1721            �           1259    16524 2   estatus_reporte_abuso_id_estatus_reporte_abuso_seq    SEQUENCE     �   CREATE SEQUENCE estatus_reporte_abuso_id_estatus_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 I   DROP SEQUENCE public.estatus_reporte_abuso_id_estatus_reporte_abuso_seq;
       public       postgres    false    6    1721            
           0    0 2   estatus_reporte_abuso_id_estatus_reporte_abuso_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE estatus_reporte_abuso_id_estatus_reporte_abuso_seq OWNED BY estatus_reporte_abuso.id_estatus_reporte_abuso;
            public       postgres    false    1722            
           0    0 2   estatus_reporte_abuso_id_estatus_reporte_abuso_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('estatus_reporte_abuso_id_estatus_reporte_abuso_seq', 1, false);
            public       postgres    false    1722            �           1259    16526    estatus_seguidor    TABLE     �   CREATE TABLE estatus_seguidor (
    id_estatus_seguidor integer NOT NULL,
    nombre_estatus_seguidor character varying(15) NOT NULL,
    definicion_estatus_seguidor character varying(150) NOT NULL
);
 $   DROP TABLE public.estatus_seguidor;
       public         postgres    false    6            
           0    0    TABLE estatus_seguidor    COMMENT        COMMENT ON TABLE estatus_seguidor IS 'Representa los diferentes estados que puede tener un follower/seguidor de alguna idea.';
            public       postgres    false    1723            
           0    0 +   COLUMN estatus_seguidor.id_estatus_seguidor    COMMENT     �   COMMENT ON COLUMN estatus_seguidor.id_estatus_seguidor IS 'Campo de tipo entero que describe al identificador de las filas en la tabla estatus_seguidor.';
            public       postgres    false    1723             
           0    0 /   COLUMN estatus_seguidor.nombre_estatus_seguidor    COMMENT     �   COMMENT ON COLUMN estatus_seguidor.nombre_estatus_seguidor IS 'Campo de tipo texto que define el nombre de un estatus que tiene un seguidor.';
            public       postgres    false    1723            !
           0    0 3   COLUMN estatus_seguidor.definicion_estatus_seguidor    COMMENT     �   COMMENT ON COLUMN estatus_seguidor.definicion_estatus_seguidor IS 'Campo de tipo texto que define un nombre de un estatus_seguidor.';
            public       postgres    false    1723            �           1259    16529 (   estatus_seguidor_id_estatus_seguidor_seq    SEQUENCE     �   CREATE SEQUENCE estatus_seguidor_id_estatus_seguidor_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.estatus_seguidor_id_estatus_seguidor_seq;
       public       postgres    false    1723    6            "
           0    0 (   estatus_seguidor_id_estatus_seguidor_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE estatus_seguidor_id_estatus_seguidor_seq OWNED BY estatus_seguidor.id_estatus_seguidor;
            public       postgres    false    1724            #
           0    0 (   estatus_seguidor_id_estatus_seguidor_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('estatus_seguidor_id_estatus_seguidor_seq', 1, false);
            public       postgres    false    1724            �           1259    16531    estatus_ticket_registro    TABLE     �   CREATE TABLE estatus_ticket_registro (
    id_estatus_ticket_registro integer NOT NULL,
    nombre_estatus_ticket_registro character varying(15) NOT NULL,
    definicion_estatus_ticket_registro character varying(150) NOT NULL
);
 +   DROP TABLE public.estatus_ticket_registro;
       public         postgres    false    6            $
           0    0    TABLE estatus_ticket_registro    COMMENT     �   COMMENT ON TABLE estatus_ticket_registro IS 'Tabla que describe los diferentes estados que puede tomar un ticket de registro de usuarios.';
            public       postgres    false    1725            %
           0    0 9   COLUMN estatus_ticket_registro.id_estatus_ticket_registro    COMMENT     �   COMMENT ON COLUMN estatus_ticket_registro.id_estatus_ticket_registro IS 'Campo de tipo entero que identifica a las filas de latabla estatus_ticket_registro';
            public       postgres    false    1725            &
           0    0 =   COLUMN estatus_ticket_registro.nombre_estatus_ticket_registro    COMMENT     �   COMMENT ON COLUMN estatus_ticket_registro.nombre_estatus_ticket_registro IS 'Campo de tipo texto que define el nombre de un estatus de ticket de registro.';
            public       postgres    false    1725            '
           0    0 A   COLUMN estatus_ticket_registro.definicion_estatus_ticket_registro    COMMENT     �   COMMENT ON COLUMN estatus_ticket_registro.definicion_estatus_ticket_registro IS 'Campo de tipo texto que define a detalle un estado que puede tomar un ticket de registro.';
            public       postgres    false    1725            �           1259    16534 6   estatus_ticket_registro_id_estatus_ticket_registro_seq    SEQUENCE     �   CREATE SEQUENCE estatus_ticket_registro_id_estatus_ticket_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 M   DROP SEQUENCE public.estatus_ticket_registro_id_estatus_ticket_registro_seq;
       public       postgres    false    1725    6            (
           0    0 6   estatus_ticket_registro_id_estatus_ticket_registro_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE estatus_ticket_registro_id_estatus_ticket_registro_seq OWNED BY estatus_ticket_registro.id_estatus_ticket_registro;
            public       postgres    false    1726            )
           0    0 6   estatus_ticket_registro_id_estatus_ticket_registro_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('estatus_ticket_registro_id_estatus_ticket_registro_seq', 1, false);
            public       postgres    false    1726            �           1259    16536    estatus_usuario    TABLE     �   CREATE TABLE estatus_usuario (
    id_estatus_usuario integer NOT NULL,
    nombre_estatus_usuario character varying(15) NOT NULL,
    definicion_estatus_usuario character varying(150) NOT NULL
);
 #   DROP TABLE public.estatus_usuario;
       public         postgres    false    6            *
           0    0    TABLE estatus_usuario    COMMENT     p   COMMENT ON TABLE estatus_usuario IS 'Tabla que contendrá registros que describirán el estado de un usuario.';
            public       postgres    false    1727            +
           0    0 )   COLUMN estatus_usuario.id_estatus_usuario    COMMENT     �   COMMENT ON COLUMN estatus_usuario.id_estatus_usuario IS 'Columna de tipo texto que define el identificador de las filas de la tabla estatus_usuario.';
            public       postgres    false    1727            ,
           0    0 -   COLUMN estatus_usuario.nombre_estatus_usuario    COMMENT     �   COMMENT ON COLUMN estatus_usuario.nombre_estatus_usuario IS 'Campo de tipo texto que define el nombre de un estatus de usuario.';
            public       postgres    false    1727            -
           0    0 1   COLUMN estatus_usuario.definicion_estatus_usuario    COMMENT     �   COMMENT ON COLUMN estatus_usuario.definicion_estatus_usuario IS 'Campo de tipo texto que describe con más detalle el significado de un estatus de usuario.';
            public       postgres    false    1727            �           1259    16539 &   estatus_usuario_id_estatus_usuario_seq    SEQUENCE     �   CREATE SEQUENCE estatus_usuario_id_estatus_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 =   DROP SEQUENCE public.estatus_usuario_id_estatus_usuario_seq;
       public       postgres    false    6    1727            .
           0    0 &   estatus_usuario_id_estatus_usuario_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE estatus_usuario_id_estatus_usuario_seq OWNED BY estatus_usuario.id_estatus_usuario;
            public       postgres    false    1728            /
           0    0 &   estatus_usuario_id_estatus_usuario_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('estatus_usuario_id_estatus_usuario_seq', 1, false);
            public       postgres    false    1728            �           1259    18155    frase    TABLE     G  CREATE TABLE frase (
    id_frase integer NOT NULL,
    texto_frase character varying(300) NOT NULL,
    autor_frase character varying(70) NOT NULL,
    ocupacion_autor_frase character varying(100),
    votos_positivos_frase integer NOT NULL,
    votos_negativos_frase integer NOT NULL,
    calificacion_frase real NOT NULL
);
    DROP TABLE public.frase;
       public         postgres    false    6            0
           0    0    TABLE frase    COMMENT     a   COMMENT ON TABLE frase IS 'Tabla que contendrá las frases motivadoras para los emprendedores.';
            public       postgres    false    1788            1
           0    0    COLUMN frase.id_frase    COMMENT     i   COMMENT ON COLUMN frase.id_frase IS 'Campo de tipo entero que identifica los campos de la tabla frase.';
            public       postgres    false    1788            2
           0    0    COLUMN frase.texto_frase    COMMENT     j   COMMENT ON COLUMN frase.texto_frase IS 'Campo de tipo texto que describe el texto que compone la frase.';
            public       postgres    false    1788            3
           0    0    COLUMN frase.autor_frase    COMMENT     `   COMMENT ON COLUMN frase.autor_frase IS 'Campo de tipo texto que describe el nombre del autor.';
            public       postgres    false    1788            4
           0    0 "   COLUMN frase.ocupacion_autor_frase    COMMENT     o   COMMENT ON COLUMN frase.ocupacion_autor_frase IS 'Campo de tipo entero que describe la ocupación del autor.';
            public       postgres    false    1788            5
           0    0 "   COLUMN frase.votos_positivos_frase    COMMENT     �   COMMENT ON COLUMN frase.votos_positivos_frase IS 'Campo de tipo entero que sirve de contador para los votos positivos de la frase.';
            public       postgres    false    1788            6
           0    0 "   COLUMN frase.votos_negativos_frase    COMMENT     �   COMMENT ON COLUMN frase.votos_negativos_frase IS 'Campo de tipo entero que sirve de contador para los votos negativos de la frase.';
            public       postgres    false    1788            7
           0    0    COLUMN frase.calificacion_frase    COMMENT     q   COMMENT ON COLUMN frase.calificacion_frase IS 'Campo de tipo float que contiene la calificación de una frase.';
            public       postgres    false    1788            �           1259    18175    frase_id_frase_seq    SEQUENCE     t   CREATE SEQUENCE frase_id_frase_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.frase_id_frase_seq;
       public       postgres    false    6    1788            8
           0    0    frase_id_frase_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE frase_id_frase_seq OWNED BY frase.id_frase;
            public       postgres    false    1789            9
           0    0    frase_id_frase_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('frase_id_frase_seq', 1, false);
            public       postgres    false    1789            �           1259    16541    hibernate_sequence    SEQUENCE     t   CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       postgres    false    6            :
           0    0    hibernate_sequence    SEQUENCE SET     ;   SELECT pg_catalog.setval('hibernate_sequence', 874, true);
            public       postgres    false    1729            �           1259    16543    idea    TABLE     Y  CREATE TABLE idea (
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
    lugar_id integer
);
    DROP TABLE public.idea;
       public         postgres    false    6            ;
           0    0 
   TABLE idea    COMMENT     L   COMMENT ON TABLE idea IS 'Contiene las ideas presentes en la aplicación.';
            public       postgres    false    1730            <
           0    0    COLUMN idea.id_idea    COMMENT     y   COMMENT ON COLUMN idea.id_idea IS 'Campo de tipo entero que funciona como identificador de las filas de la tabla idea.';
            public       postgres    false    1730            =
           0    0    COLUMN idea.estatus_idea_id    COMMENT     d   COMMENT ON COLUMN idea.estatus_idea_id IS 'Campo de tipo entero que define el estatus de la idea.';
            public       postgres    false    1730            >
           0    0 -   COLUMN idea.estatus_ayuda_recursos_humanos_id    COMMENT     �   COMMENT ON COLUMN idea.estatus_ayuda_recursos_humanos_id IS 'Campo de tipo entero que define el estatus de la ayuda de recursos humanos de una idea. También puede interpretarse como la necesidad de integrantes de una idea.';
            public       postgres    false    1730            ?
           0    0 &   COLUMN idea.estatus_ayuda_monetaria_id    COMMENT     "  COMMENT ON COLUMN idea.estatus_ayuda_monetaria_id IS 'Campo de tipo entero que define el estado de la ayuda monetaria en una idea. También puede interpretarse como la cantidad de dinero (en términos de poco, mucho, nada, etc) necesario para la ejecución y/o sovrevivencia de una idea.';
            public       postgres    false    1730            @
           0    0    COLUMN idea.titulo_idea    COMMENT     `   COMMENT ON COLUMN idea.titulo_idea IS 'Campo de tipo texto que define el título de una idea.';
            public       postgres    false    1730            A
           0    0    COLUMN idea.fecha_creacion_idea    COMMENT     y   COMMENT ON COLUMN idea.fecha_creacion_idea IS 'Campo de tipo date que define el momento en el que fue creada una idea.';
            public       postgres    false    1730            B
           0    0    COLUMN idea.resumen_idea    COMMENT     h   COMMENT ON COLUMN idea.resumen_idea IS 'Campo de tipo texto que define la idea principal de una idea.';
            public       postgres    false    1730            C
           0    0    COLUMN idea.nombre_imagen    COMMENT     b   COMMENT ON COLUMN idea.nombre_imagen IS 'Campo de tipo texto que define el nombre de la imagen.';
            public       postgres    false    1730            D
           0    0    COLUMN idea.usuario_id    COMMENT     p   COMMENT ON COLUMN idea.usuario_id IS 'Campo de tipo entero que describe el id del usuario creador de la idea.';
            public       postgres    false    1730            E
           0    0     COLUMN idea.votos_positivos_idea    COMMENT     �   COMMENT ON COLUMN idea.votos_positivos_idea IS 'Campo de tipo entero que describe la cantidad de votos positivos que recibe una idea.';
            public       postgres    false    1730            F
           0    0     COLUMN idea.votos_negativos_idea    COMMENT     �   COMMENT ON COLUMN idea.votos_negativos_idea IS 'Campo de tipo entero que describe la cantidad de votos negativos que recibe una idea.';
            public       postgres    false    1730            G
           0    0    COLUMN idea.calificacion_idea    COMMENT     m   COMMENT ON COLUMN idea.calificacion_idea IS 'Campo de tipo entero que define la calificación de una idea.';
            public       postgres    false    1730            H
           0    0    COLUMN idea.contenido_idea    COMMENT     �   COMMENT ON COLUMN idea.contenido_idea IS 'Campo de tipo texto con una longitud de 20,000 caracteres que servirá como contenedor de la idea.';
            public       postgres    false    1730            I
           0    0    COLUMN idea.lugar_id    COMMENT     m   COMMENT ON COLUMN idea.lugar_id IS 'Campo que describe un posible lugar donde la idea puede desarrollarse.';
            public       postgres    false    1730            �           1259    16549    idea_id_idea_seq    SEQUENCE     r   CREATE SEQUENCE idea_id_idea_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 '   DROP SEQUENCE public.idea_id_idea_seq;
       public       postgres    false    6    1730            J
           0    0    idea_id_idea_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE idea_id_idea_seq OWNED BY idea.id_idea;
            public       postgres    false    1731            K
           0    0    idea_id_idea_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('idea_id_idea_seq', 1, false);
            public       postgres    false    1731            �           1259    16551    imagen    TABLE     �   CREATE TABLE imagen (
    id_imagen integer NOT NULL,
    nombre_imagen character varying(15) NOT NULL,
    idea_id integer NOT NULL
);
    DROP TABLE public.imagen;
       public         postgres    false    6            L
           0    0    TABLE imagen    COMMENT     V   COMMENT ON TABLE imagen IS 'Tabla que contendrá registros de nombres de imágenes.';
            public       postgres    false    1732            M
           0    0    COLUMN imagen.id_imagen    COMMENT     i   COMMENT ON COLUMN imagen.id_imagen IS 'Campo de tipo entero que define el identificador de una imagen.';
            public       postgres    false    1732            N
           0    0    COLUMN imagen.nombre_imagen    COMMENT     d   COMMENT ON COLUMN imagen.nombre_imagen IS 'Campo de tipo texto que define el nombre de la imagen.';
            public       postgres    false    1732            O
           0    0    COLUMN imagen.idea_id    COMMENT     o   COMMENT ON COLUMN imagen.idea_id IS 'Campo de tipo texto que describe la idea a la que pertenece una imagen.';
            public       postgres    false    1732            �           1259    16554    imagen_id_imagen_seq    SEQUENCE     v   CREATE SEQUENCE imagen_id_imagen_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 +   DROP SEQUENCE public.imagen_id_imagen_seq;
       public       postgres    false    6    1732            P
           0    0    imagen_id_imagen_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE imagen_id_imagen_seq OWNED BY imagen.id_imagen;
            public       postgres    false    1733            Q
           0    0    imagen_id_imagen_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('imagen_id_imagen_seq', 1, false);
            public       postgres    false    1733            �           1259    16556    institucion    TABLE       CREATE TABLE institucion (
    id_institucion integer NOT NULL,
    nombre_institucion character varying(70) NOT NULL,
    descripcion_institucion character varying(1000) NOT NULL,
    url_institucion character varying(100),
    nombre_imagen_institucion character varying(100)
);
    DROP TABLE public.institucion;
       public         postgres    false    6            R
           0    0    TABLE institucion    COMMENT     j   COMMENT ON TABLE institucion IS 'Tabla que contendrá la institución a la que pertenecerá el usuario.';
            public       postgres    false    1734            S
           0    0 !   COLUMN institucion.id_institucion    COMMENT     �   COMMENT ON COLUMN institucion.id_institucion IS 'Campo de tipo entero que define el identificador de las filas de la tabla institucion.';
            public       postgres    false    1734            T
           0    0 %   COLUMN institucion.nombre_institucion    COMMENT     u   COMMENT ON COLUMN institucion.nombre_institucion IS 'Campo de tipo texto que define el nombre de una institución.';
            public       postgres    false    1734            U
           0    0 *   COLUMN institucion.descripcion_institucion    COMMENT     �   COMMENT ON COLUMN institucion.descripcion_institucion IS 'Campo de texto que define la descripción de una institución a la que pertenece un usuario.';
            public       postgres    false    1734            V
           0    0 "   COLUMN institucion.url_institucion    COMMENT     �   COMMENT ON COLUMN institucion.url_institucion IS 'Campo de tipo texto que define la url de la página de internet de una institución.';
            public       postgres    false    1734            W
           0    0 ,   COLUMN institucion.nombre_imagen_institucion    COMMENT     �   COMMENT ON COLUMN institucion.nombre_imagen_institucion IS 'Campo de tipo texto que describe el nombre de la imagen (probablemente siglas) de la institución.';
            public       postgres    false    1734            �           1259    16562    institucion_id_institucion_seq    SEQUENCE     �   CREATE SEQUENCE institucion_id_institucion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 5   DROP SEQUENCE public.institucion_id_institucion_seq;
       public       postgres    false    1734    6            X
           0    0    institucion_id_institucion_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE institucion_id_institucion_seq OWNED BY institucion.id_institucion;
            public       postgres    false    1735            Y
           0    0    institucion_id_institucion_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('institucion_id_institucion_seq', 1, false);
            public       postgres    false    1735            �           1259    16564 
   integrante    TABLE     (  CREATE TABLE integrante (
    usuario_id integer NOT NULL,
    idea_id integer NOT NULL,
    estatus_integrante_id integer NOT NULL,
    fecha_inicio_integrante date NOT NULL,
    fecha_fin_integrante date,
    eslider_integrante boolean NOT NULL,
    calificacion_integrante double precision
);
    DROP TABLE public.integrante;
       public         postgres    false    6            Z
           0    0    TABLE integrante    COMMENT     q   COMMENT ON TABLE integrante IS 'Contiene los registros de un usuario preteneciente a las filas de alguna idea.';
            public       postgres    false    1736            [
           0    0    COLUMN integrante.usuario_id    COMMENT     �   COMMENT ON COLUMN integrante.usuario_id IS 'Campo de tipoentero que define la relación entre un integrante de una idea y un usuario del sistema.';
            public       postgres    false    1736            \
           0    0    COLUMN integrante.idea_id    COMMENT     �   COMMENT ON COLUMN integrante.idea_id IS 'Campo de tipo entero que define la relación entre un integrante y la idea a la que pertenece.';
            public       postgres    false    1736            ]
           0    0 '   COLUMN integrante.estatus_integrante_id    COMMENT     �   COMMENT ON COLUMN integrante.estatus_integrante_id IS 'Campo de tipo entero que define la relación entre el integrante de una idea y un estatus de integrante.';
            public       postgres    false    1736            ^
           0    0 )   COLUMN integrante.fecha_inicio_integrante    COMMENT     �   COMMENT ON COLUMN integrante.fecha_inicio_integrante IS 'Campo de tipo date que define la fecha en que un usuario se volvió integrante de una idea.';
            public       postgres    false    1736            _
           0    0 &   COLUMN integrante.fecha_fin_integrante    COMMENT     x   COMMENT ON COLUMN integrante.fecha_fin_integrante IS 'Campo de tipo fecha en que un usuario dejó de seguir una idea.';
            public       postgres    false    1736            `
           0    0 $   COLUMN integrante.eslider_integrante    COMMENT     �   COMMENT ON COLUMN integrante.eslider_integrante IS 'Campo de tipo booleano que define si un integrante de una idea es líder (o creador) de esta.';
            public       postgres    false    1736            a
           0    0 )   COLUMN integrante.calificacion_integrante    COMMENT     �   COMMENT ON COLUMN integrante.calificacion_integrante IS 'Campo de tipo entero que define la calificación sobre la participación de un integrante en una idea.';
            public       postgres    false    1736            �           1259    16567 
   invitacion    TABLE     �  CREATE TABLE invitacion (
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
    DROP TABLE public.invitacion;
       public         postgres    false    6            b
           0    0    TABLE invitacion    COMMENT     r   COMMENT ON TABLE invitacion IS 'Tabla que contendrá las invitaciones de ingreso a linkuam hechas por usuarios.';
            public       postgres    false    1737            c
           0    0    COLUMN invitacion.id_invitacion    COMMENT     }   COMMENT ON COLUMN invitacion.id_invitacion IS 'Campo de tipo entero que identifica a los registros de la tabla invitacion.';
            public       postgres    false    1737            d
           0    0 %   COLUMN invitacion.usuario_invitado_id    COMMENT     ~   COMMENT ON COLUMN invitacion.usuario_invitado_id IS 'Campo de tipo entero que define el usuario que realiza la invitación.';
            public       postgres    false    1737            e
           0    0 &   COLUMN invitacion.usuario_invitante_id    COMMENT        COMMENT ON COLUMN invitacion.usuario_invitante_id IS 'Campo de tipo entero que define al usuario que utiliza la invitación.';
            public       postgres    false    1737            f
           0    0 +   COLUMN invitacion.correo_usuario_invitacion    COMMENT     �   COMMENT ON COLUMN invitacion.correo_usuario_invitacion IS 'Campo de tipo texto que define el correo del usuario al que se enviará la invitación.';
            public       postgres    false    1737            g
           0    0 +   COLUMN invitacion.fecha_registro_invitacion    COMMENT     �   COMMENT ON COLUMN invitacion.fecha_registro_invitacion IS 'Campo de tipo fecha que define la fecha en que se registra una invitación.';
            public       postgres    false    1737            h
           0    0 5   COLUMN invitacion.fecha_usuario_registrado_invitacion    COMMENT     �   COMMENT ON COLUMN invitacion.fecha_usuario_registrado_invitacion IS 'Campo de tipo fecha que define cuando un usuario utilizó la invitación.';
            public       postgres    false    1737            i
           0    0 "   COLUMN invitacion.texto_invitacion    COMMENT     }   COMMENT ON COLUMN invitacion.texto_invitacion IS 'Campo de tipo texto que define el contenido del texto de la invitación.';
            public       postgres    false    1737            j
           0    0 '   COLUMN invitacion.estatus_invitacion_id    COMMENT     w   COMMENT ON COLUMN invitacion.estatus_invitacion_id IS 'Campo de tipo entero que define el estado de una invitación.';
            public       postgres    false    1737            k
           0    0 $   COLUMN invitacion.ticket_registro_id    COMMENT     �   COMMENT ON COLUMN invitacion.ticket_registro_id IS 'Campo de tipo entero que define el ticket_registro utilizado para poder reconocer la invitación como válida.';
            public       postgres    false    1737            �           1259    16570    justificacion    TABLE     �   CREATE TABLE justificacion (
    id_justificacion integer NOT NULL,
    descripcion_justificacion character varying(500) NOT NULL,
    fecha_justificacion date,
    idea_id integer NOT NULL
);
 !   DROP TABLE public.justificacion;
       public         postgres    false    6            l
           0    0    TABLE justificacion    COMMENT     Y   COMMENT ON TABLE justificacion IS 'Tabla que contendrá la justificación de una idea.';
            public       postgres    false    1738            m
           0    0 %   COLUMN justificacion.id_justificacion    COMMENT     �   COMMENT ON COLUMN justificacion.id_justificacion IS 'Campo de tipo entero que define el identificador de las filas de la tabla justificacion.';
            public       postgres    false    1738            n
           0    0 .   COLUMN justificacion.descripcion_justificacion    COMMENT     �   COMMENT ON COLUMN justificacion.descripcion_justificacion IS 'Campo de tipo entero que define la descripcion de la justificacion.';
            public       postgres    false    1738            o
           0    0 (   COLUMN justificacion.fecha_justificacion    COMMENT     �   COMMENT ON COLUMN justificacion.fecha_justificacion IS 'Campo de tipo fecha que define el momento en que fue creada una justificacion.';
            public       postgres    false    1738            p
           0    0    COLUMN justificacion.idea_id    COMMENT     �   COMMENT ON COLUMN justificacion.idea_id IS 'Campo de tipo entero que describe la relación entre una justificación y su idea.';
            public       postgres    false    1738            �           1259    16576 "   justificacion_id_justificacion_seq    SEQUENCE     �   CREATE SEQUENCE justificacion_id_justificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 9   DROP SEQUENCE public.justificacion_id_justificacion_seq;
       public       postgres    false    6    1738            q
           0    0 "   justificacion_id_justificacion_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE justificacion_id_justificacion_seq OWNED BY justificacion.id_justificacion;
            public       postgres    false    1739            r
           0    0 "   justificacion_id_justificacion_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('justificacion_id_justificacion_seq', 1, true);
            public       postgres    false    1739            �           1259    16578 &   lista_comunidad_id_lista_comunidad_seq    SEQUENCE     �   CREATE SEQUENCE lista_comunidad_id_lista_comunidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 =   DROP SEQUENCE public.lista_comunidad_id_lista_comunidad_seq;
       public       postgres    false    6    1686            s
           0    0 &   lista_comunidad_id_lista_comunidad_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE lista_comunidad_id_lista_comunidad_seq OWNED BY comunidad.id_comunidad;
            public       postgres    false    1740            t
           0    0 &   lista_comunidad_id_lista_comunidad_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('lista_comunidad_id_lista_comunidad_seq', 1, false);
            public       postgres    false    1740            �           1259    16580    lugar    TABLE     �   CREATE TABLE lugar (
    id_lugar integer NOT NULL,
    nombre_lugar character varying(100) NOT NULL,
    descripcion_lugar character varying(150) NOT NULL,
    usuario_id integer,
    tipo_lugar_id integer NOT NULL
);
    DROP TABLE public.lugar;
       public         postgres    false    6            u
           0    0    TABLE lugar    COMMENT     i   COMMENT ON TABLE lugar IS 'Tabla que contiene los lugares disponibles para ser ocupados por las ideas.';
            public       postgres    false    1741            v
           0    0    COLUMN lugar.id_lugar    COMMENT     l   COMMENT ON COLUMN lugar.id_lugar IS 'Campo de tipo entero que identifica los registros de la tabla lugar.';
            public       postgres    false    1741            w
           0    0    COLUMN lugar.nombre_lugar    COMMENT     _   COMMENT ON COLUMN lugar.nombre_lugar IS 'Campo de tipo texto que define el nombre del lugar.';
            public       postgres    false    1741            x
           0    0    COLUMN lugar.descripcion_lugar    COMMENT     e   COMMENT ON COLUMN lugar.descripcion_lugar IS 'Campo de tipo texto que describe a detalle un lugar.';
            public       postgres    false    1741            y
           0    0    COLUMN lugar.usuario_id    COMMENT     o   COMMENT ON COLUMN lugar.usuario_id IS 'Campo de tipo entero que describe el usuario responsable de un lugar.';
            public       postgres    false    1741            z
           0    0    COLUMN lugar.tipo_lugar_id    COMMENT     `   COMMENT ON COLUMN lugar.tipo_lugar_id IS 'Campo de tipo entero que describe el tipo de lugar.';
            public       postgres    false    1741            �           1259    16583    lugar_id_lugar_seq    SEQUENCE     t   CREATE SEQUENCE lugar_id_lugar_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.lugar_id_lugar_seq;
       public       postgres    false    6    1741            {
           0    0    lugar_id_lugar_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE lugar_id_lugar_seq OWNED BY lugar.id_lugar;
            public       postgres    false    1742            |
           0    0    lugar_id_lugar_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('lugar_id_lugar_seq', 1, false);
            public       postgres    false    1742            �           1259    16585    miembro_comunidad    TABLE     �   CREATE TABLE miembro_comunidad (
    usuario_id integer NOT NULL,
    comunidad_id integer NOT NULL,
    fecha_inicio_miembro_comunidad date NOT NULL,
    fecha_fin_miembro_comunidad date,
    estatus_miembro_comunidad_id integer NOT NULL
);
 %   DROP TABLE public.miembro_comunidad;
       public         postgres    false    6            }
           0    0    TABLE miembro_comunidad    COMMENT     �   COMMENT ON TABLE miembro_comunidad IS 'Esta tabla contendrá una lista de todos los usuarios que se hayan inscrito a alguna comunidad, así como la comunidad a la que estos pertenecen.';
            public       postgres    false    1743            ~
           0    0 #   COLUMN miembro_comunidad.usuario_id    COMMENT     �   COMMENT ON COLUMN miembro_comunidad.usuario_id IS 'Campo del tipo entero que describe el usuario que pertenece a cierta comunidad.';
            public       postgres    false    1743            
           0    0 %   COLUMN miembro_comunidad.comunidad_id    COMMENT     �   COMMENT ON COLUMN miembro_comunidad.comunidad_id IS 'Campo de tipo entero que describe la comunidad a la que pertenece algún usuario. (miembro-comunidad).';
            public       postgres    false    1743            �
           0    0 7   COLUMN miembro_comunidad.fecha_inicio_miembro_comunidad    COMMENT     �   COMMENT ON COLUMN miembro_comunidad.fecha_inicio_miembro_comunidad IS 'Campo de tipo date que describe la fecha en la que cierto usuario comenzó a ser miembro de una comunidad.';
            public       postgres    false    1743            �
           0    0 4   COLUMN miembro_comunidad.fecha_fin_miembro_comunidad    COMMENT     �   COMMENT ON COLUMN miembro_comunidad.fecha_fin_miembro_comunidad IS 'Campo de tipo date que describe la fecha en la que un usuario deja de ser miembro de una comunidad. PUEDE SER NULO.';
            public       postgres    false    1743            �
           0    0 5   COLUMN miembro_comunidad.estatus_miembro_comunidad_id    COMMENT     �   COMMENT ON COLUMN miembro_comunidad.estatus_miembro_comunidad_id IS 'Campo de tipo entero que se relaciona con el estatus que tenga un usuario para con una comunidad.';
            public       postgres    false    1743            �           1259    16588 	   necesidad    TABLE     �   CREATE TABLE necesidad (
    id_necesidad integer NOT NULL,
    descripcion_necesidad character varying(500) NOT NULL,
    fecha_necesidad date,
    idea_id integer NOT NULL,
    estatus_necesidad_id integer NOT NULL
);
    DROP TABLE public.necesidad;
       public         postgres    false    6            �
           0    0    TABLE necesidad    COMMENT     y   COMMENT ON TABLE necesidad IS 'Tabla que contiene los registros de las necesidades que tiene una idea para realizarse.';
            public       postgres    false    1744            �
           0    0    COLUMN necesidad.id_necesidad    COMMENT     �   COMMENT ON COLUMN necesidad.id_necesidad IS 'Campo de tipo entero que define el identificador de las filas de la tabla necesidad.';
            public       postgres    false    1744            �
           0    0 &   COLUMN necesidad.descripcion_necesidad    COMMENT     f   COMMENT ON COLUMN necesidad.descripcion_necesidad IS 'Campo de tipo texto que detalla la necesidad.';
            public       postgres    false    1744            �
           0    0     COLUMN necesidad.fecha_necesidad    COMMENT     t   COMMENT ON COLUMN necesidad.fecha_necesidad IS 'Campo de tipo fecha que describe cuando fue creada una necesidad.';
            public       postgres    false    1744            �
           0    0    COLUMN necesidad.idea_id    COMMENT     �   COMMENT ON COLUMN necesidad.idea_id IS 'Campo de tipo entero que describe la idea con la que esta necesidad está relacionada.';
            public       postgres    false    1744            �
           0    0 %   COLUMN necesidad.estatus_necesidad_id    COMMENT     t   COMMENT ON COLUMN necesidad.estatus_necesidad_id IS 'Campo de tipo entero que define el estatus de una necesidad.';
            public       postgres    false    1744            �           1259    16594    necesidad_id_necesidad_seq    SEQUENCE     |   CREATE SEQUENCE necesidad_id_necesidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 1   DROP SEQUENCE public.necesidad_id_necesidad_seq;
       public       postgres    false    6    1744            �
           0    0    necesidad_id_necesidad_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE necesidad_id_necesidad_seq OWNED BY necesidad.id_necesidad;
            public       postgres    false    1745            �
           0    0    necesidad_id_necesidad_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('necesidad_id_necesidad_seq', 1, false);
            public       postgres    false    1745            �           1259    16596    objetivo_especifico    TABLE     �   CREATE TABLE objetivo_especifico (
    id_objetivo_especifico integer NOT NULL,
    descripcion_objetivo_especifico character varying(250) NOT NULL,
    fecha_objetivo_especifico date,
    idea_id integer NOT NULL
);
 '   DROP TABLE public.objetivo_especifico;
       public         postgres    false    6            �
           0    0    TABLE objetivo_especifico    COMMENT     i   COMMENT ON TABLE objetivo_especifico IS 'Tabla que describirá los objetivos específicos de una idea.';
            public       postgres    false    1746            �
           0    0 1   COLUMN objetivo_especifico.id_objetivo_especifico    COMMENT     �   COMMENT ON COLUMN objetivo_especifico.id_objetivo_especifico IS 'Campo que describe el identificador de las filas de la tabla objetivo específico.';
            public       postgres    false    1746            �
           0    0 :   COLUMN objetivo_especifico.descripcion_objetivo_especifico    COMMENT     �   COMMENT ON COLUMN objetivo_especifico.descripcion_objetivo_especifico IS 'Campo de tipo texto que define la descripción de un objetivo especifico.';
            public       postgres    false    1746            �
           0    0 4   COLUMN objetivo_especifico.fecha_objetivo_especifico    COMMENT     �   COMMENT ON COLUMN objetivo_especifico.fecha_objetivo_especifico IS 'Campo de tipo fecha que describe el momento en que fue generado un objetivo específico.';
            public       postgres    false    1746            �
           0    0 "   COLUMN objetivo_especifico.idea_id    COMMENT     y   COMMENT ON COLUMN objetivo_especifico.idea_id IS 'Campo que define la idea a la que pertenece un objetivo específico.';
            public       postgres    false    1746            �           1259    16599 .   objetivo_especifico_id_objetivo_especifico_seq    SEQUENCE     �   CREATE SEQUENCE objetivo_especifico_id_objetivo_especifico_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 E   DROP SEQUENCE public.objetivo_especifico_id_objetivo_especifico_seq;
       public       postgres    false    6    1746            �
           0    0 .   objetivo_especifico_id_objetivo_especifico_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE objetivo_especifico_id_objetivo_especifico_seq OWNED BY objetivo_especifico.id_objetivo_especifico;
            public       postgres    false    1747            �
           0    0 .   objetivo_especifico_id_objetivo_especifico_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('objetivo_especifico_id_objetivo_especifico_seq', 1, false);
            public       postgres    false    1747            �           1259    16601    objetivo_general    TABLE     �   CREATE TABLE objetivo_general (
    id_objetivo_general integer NOT NULL,
    descripcion_objetivo_general character varying(250) NOT NULL,
    fecha_objetivo_general date,
    idea_id integer NOT NULL
);
 $   DROP TABLE public.objetivo_general;
       public         postgres    false    6            �
           0    0    TABLE objetivo_general    COMMENT     _   COMMENT ON TABLE objetivo_general IS 'Tabla que describe el objetivo(s) general de una idea.';
            public       postgres    false    1748            �
           0    0 +   COLUMN objetivo_general.id_objetivo_general    COMMENT     �   COMMENT ON COLUMN objetivo_general.id_objetivo_general IS 'Campo de tipo entero que describe el identificador de las filas de la tabla objetivo general.';
            public       postgres    false    1748            �
           0    0 4   COLUMN objetivo_general.descripcion_objetivo_general    COMMENT     |   COMMENT ON COLUMN objetivo_general.descripcion_objetivo_general IS 'Campo de tipo texto que describe un objetivo general.';
            public       postgres    false    1748            �
           0    0 .   COLUMN objetivo_general.fecha_objetivo_general    COMMENT     �   COMMENT ON COLUMN objetivo_general.fecha_objetivo_general IS 'Campo de tipo fecha que describe la fecha en que se generó un objetivo general.';
            public       postgres    false    1748            �
           0    0    COLUMN objetivo_general.idea_id    COMMENT     �   COMMENT ON COLUMN objetivo_general.idea_id IS 'Campo que describe la relación entre un objetivo general y la idea a la que pertenece.';
            public       postgres    false    1748            �           1259    16604 (   objetivo_general_id_objetivo_general_seq    SEQUENCE     �   CREATE SEQUENCE objetivo_general_id_objetivo_general_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.objetivo_general_id_objetivo_general_seq;
       public       postgres    false    1748    6            �
           0    0 (   objetivo_general_id_objetivo_general_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE objetivo_general_id_objetivo_general_seq OWNED BY objetivo_general.id_objetivo_general;
            public       postgres    false    1749            �
           0    0 (   objetivo_general_id_objetivo_general_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('objetivo_general_id_objetivo_general_seq', 1, false);
            public       postgres    false    1749            �           1259    16606    permiso    TABLE     W   CREATE TABLE permiso (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);
    DROP TABLE public.permiso;
       public         postgres    false    6            �
           0    0    TABLE permiso    COMMENT     �   COMMENT ON TABLE permiso IS 'Tabla que contendrá los permisos de un usuario. Cada permiso está integrado por una combinación Usuario-Rol.';
            public       postgres    false    1750            �
           0    0    COLUMN permiso.usuario_id    COMMENT     x   COMMENT ON COLUMN permiso.usuario_id IS 'Campo de tipo entero que define el usuario al que se le asignan privilegios.';
            public       postgres    false    1750            �
           0    0    COLUMN permiso.rol_id    COMMENT     y   COMMENT ON COLUMN permiso.rol_id IS 'Campo de tipo entero que define el tipo de permiso que se le asigna a un usuario.';
            public       postgres    false    1750            �           1259    16609    pregunta    TABLE     ~  CREATE TABLE pregunta (
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
    DROP TABLE public.pregunta;
       public         postgres    false    6            �
           0    0    TABLE pregunta    COMMENT     �   COMMENT ON TABLE pregunta IS 'Tabla que contiene las preguntas hechas por los usuarios del sistema en las ideas en las que se encuentren interesados.';
            public       postgres    false    1751            �
           0    0    COLUMN pregunta.id_pregunta    COMMENT     �   COMMENT ON COLUMN pregunta.id_pregunta IS 'Campo de tipo entero que define el identificador de las filas en la tabla pregunta.';
            public       postgres    false    1751            �
           0    0 !   COLUMN pregunta.pregunta_pregunta    COMMENT     t   COMMENT ON COLUMN pregunta.pregunta_pregunta IS 'Campo de tipo texto que define la pregunta hecha por un usuario.';
            public       postgres    false    1751            �
           0    0 "   COLUMN pregunta.respuesta_pregunta    COMMENT     p   COMMENT ON COLUMN pregunta.respuesta_pregunta IS 'Campo de tipo texto que define la respuesta a una pregunta.';
            public       postgres    false    1751            �
           0    0 #   COLUMN pregunta.usuario_pregunta_id    COMMENT     v   COMMENT ON COLUMN pregunta.usuario_pregunta_id IS 'Campo de tipo entero que define el usuario que hizo la pregunta.';
            public       postgres    false    1751            �
           0    0    COLUMN pregunta.idea_id    COMMENT     �   COMMENT ON COLUMN pregunta.idea_id IS 'Campo de tipo entero que define la relación entre una pregunta y la idea a la que esta pertenece.';
            public       postgres    false    1751            �
           0    0 #   COLUMN pregunta.estatus_pregunta_id    COMMENT     q   COMMENT ON COLUMN pregunta.estatus_pregunta_id IS 'Campo de tipo entero que define el estatus de una pregunta.';
            public       postgres    false    1751            �
           0    0 '   COLUMN pregunta.fecha_creacion_pregunta    COMMENT     �   COMMENT ON COLUMN pregunta.fecha_creacion_pregunta IS 'Campo de tipo fecha que define la fecha en la que una pregunta fue realizada.';
            public       postgres    false    1751            �
           0    0 "   COLUMN pregunta.fecha_fin_pregunta    COMMENT     �   COMMENT ON COLUMN pregunta.fecha_fin_pregunta IS 'Campo de tipo fecha que define la fecha en la que una pregunta fue respondida.';
            public       postgres    false    1751            �
           0    0 $   COLUMN pregunta.usuario_respuesta_id    COMMENT     ~   COMMENT ON COLUMN pregunta.usuario_respuesta_id IS 'Campo de tipo entero que define al usuario que respondió una pregunta.';
            public       postgres    false    1751            �           1259    16615    pregunta_id_pregunta_seq    SEQUENCE     z   CREATE SEQUENCE pregunta_id_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 /   DROP SEQUENCE public.pregunta_id_pregunta_seq;
       public       postgres    false    1751    6            �
           0    0    pregunta_id_pregunta_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE pregunta_id_pregunta_seq OWNED BY pregunta.id_pregunta;
            public       postgres    false    1752            �
           0    0    pregunta_id_pregunta_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pregunta_id_pregunta_seq', 1, true);
            public       postgres    false    1752            �           1259    16617    reporte_abuso    TABLE     \  CREATE TABLE reporte_abuso (
    id_reporte_abuso integer NOT NULL,
    nota_reporte_abuso character varying(1000) NOT NULL,
    usuario_id integer,
    tipo_reporte_abuso_id integer NOT NULL,
    idea_id integer NOT NULL,
    fecha_reporte_abuso date NOT NULL,
    estatus_reporte_abuso_id integer NOT NULL,
    accion_reporte_abuso_id integer
);
 !   DROP TABLE public.reporte_abuso;
       public         postgres    false    6            �
           0    0    TABLE reporte_abuso    COMMENT     t   COMMENT ON TABLE reporte_abuso IS 'Tabla que contendrá reportes de información no apropiada dentro del sistema.';
            public       postgres    false    1753            �
           0    0 %   COLUMN reporte_abuso.id_reporte_abuso    COMMENT     �   COMMENT ON COLUMN reporte_abuso.id_reporte_abuso IS 'Campo de tipo entero que describe el identificador de las filas de la tabla reporte_abuso.';
            public       postgres    false    1753            �
           0    0 '   COLUMN reporte_abuso.nota_reporte_abuso    COMMENT     }   COMMENT ON COLUMN reporte_abuso.nota_reporte_abuso IS 'Campo de tipo texto que define la descripción de un reporte_abuso.';
            public       postgres    false    1753            �
           0    0    COLUMN reporte_abuso.usuario_id    COMMENT     �   COMMENT ON COLUMN reporte_abuso.usuario_id IS 'Campo de tipo entero que describe al usuario que realizó el reporte_abuso. Es opcional.';
            public       postgres    false    1753            �
           0    0 *   COLUMN reporte_abuso.tipo_reporte_abuso_id    COMMENT     x   COMMENT ON COLUMN reporte_abuso.tipo_reporte_abuso_id IS 'Campo de tipo entero que describe el tipo de reporte_abuso.';
            public       postgres    false    1753            �
           0    0    COLUMN reporte_abuso.idea_id    COMMENT     q   COMMENT ON COLUMN reporte_abuso.idea_id IS 'Campo de tipo entero que describe la idea que se está reportando.';
            public       postgres    false    1753            �
           0    0 (   COLUMN reporte_abuso.fecha_reporte_abuso    COMMENT     �   COMMENT ON COLUMN reporte_abuso.fecha_reporte_abuso IS 'Campo de tipo date que define la fecha en que fue registrado el reporte.';
            public       postgres    false    1753            �
           0    0 -   COLUMN reporte_abuso.estatus_reporte_abuso_id    COMMENT     �   COMMENT ON COLUMN reporte_abuso.estatus_reporte_abuso_id IS 'Campo de tipo entero que define el estado en el que se encuentra un reporte_abuso.';
            public       postgres    false    1753            �
           0    0 ,   COLUMN reporte_abuso.accion_reporte_abuso_id    COMMENT     �   COMMENT ON COLUMN reporte_abuso.accion_reporte_abuso_id IS 'Campo de tipo entero que define la acción tomada por el administrador para con un reporte_abuso.';
            public       postgres    false    1753            �           1259    16623 "   reporte_abuso_id_reporte_abuso_seq    SEQUENCE     �   CREATE SEQUENCE reporte_abuso_id_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 9   DROP SEQUENCE public.reporte_abuso_id_reporte_abuso_seq;
       public       postgres    false    6    1753            �
           0    0 "   reporte_abuso_id_reporte_abuso_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE reporte_abuso_id_reporte_abuso_seq OWNED BY reporte_abuso.id_reporte_abuso;
            public       postgres    false    1754            �
           0    0 "   reporte_abuso_id_reporte_abuso_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('reporte_abuso_id_reporte_abuso_seq', 1, false);
            public       postgres    false    1754            �           1259    16625    rol    TABLE     �   CREATE TABLE rol (
    id_rol integer NOT NULL,
    nombre_rol character varying(15) NOT NULL,
    definicion_rol character varying(150) NOT NULL
);
    DROP TABLE public.rol;
       public         postgres    false    6            �
           0    0 	   TABLE rol    COMMENT     a   COMMENT ON TABLE rol IS 'Tabla que contendrá los diferentes roles que puede tener un usuario.';
            public       postgres    false    1755            �
           0    0    COLUMN rol.id_rol    COMMENT     e   COMMENT ON COLUMN rol.id_rol IS 'Campo de tipo entero que define el identificador de la tabla rol.';
            public       postgres    false    1755            �
           0    0    COLUMN rol.nombre_rol    COMMENT     [   COMMENT ON COLUMN rol.nombre_rol IS 'Campo de tipo texto que define el nombre de un rol.';
            public       postgres    false    1755            �
           0    0    COLUMN rol.definicion_rol    COMMENT     c   COMMENT ON COLUMN rol.definicion_rol IS 'Campo de texto que define de manera más amplia un rol.';
            public       postgres    false    1755            �           1259    16628    rol_id_rol_seq    SEQUENCE     p   CREATE SEQUENCE rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rol_id_rol_seq;
       public       postgres    false    6    1755            �
           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE rol_id_rol_seq OWNED BY rol.id_rol;
            public       postgres    false    1756            �
           0    0    rol_id_rol_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('rol_id_rol_seq', 1, false);
            public       postgres    false    1756            �           1259    16630    seguidor    TABLE     �   CREATE TABLE seguidor (
    usuario_id integer NOT NULL,
    idea_id integer NOT NULL,
    estatus_seguidor_id integer NOT NULL,
    fecha_inicio_seguidor date NOT NULL,
    fecha_fin_seguidor date
);
    DROP TABLE public.seguidor;
       public         postgres    false    6            �
           0    0    TABLE seguidor    COMMENT     _   COMMENT ON TABLE seguidor IS 'Contendrá los registros de las ideas que siguen los usuarios.';
            public       postgres    false    1757            �
           0    0    COLUMN seguidor.usuario_id    COMMENT     k   COMMENT ON COLUMN seguidor.usuario_id IS 'Campo de tipo entero que define al usuario que sigue una idea.';
            public       postgres    false    1757            �
           0    0    COLUMN seguidor.idea_id    COMMENT     k   COMMENT ON COLUMN seguidor.idea_id IS 'Campo de tipo entero que define la idea que está siendo seguida.';
            public       postgres    false    1757            �
           0    0 #   COLUMN seguidor.estatus_seguidor_id    COMMENT     p   COMMENT ON COLUMN seguidor.estatus_seguidor_id IS 'Campo de tipo entero que define el estatus de un seguidor.';
            public       postgres    false    1757            �
           0    0 %   COLUMN seguidor.fecha_inicio_seguidor    COMMENT     �   COMMENT ON COLUMN seguidor.fecha_inicio_seguidor IS 'Campo de tipo fecha que describe el momento en el que un usuario comenzó a seguir a una idea.';
            public       postgres    false    1757            �
           0    0 "   COLUMN seguidor.fecha_fin_seguidor    COMMENT     �   COMMENT ON COLUMN seguidor.fecha_fin_seguidor IS 'Campo de tipo fecha que describe el momento en el que un usuario dejó de seguir a una idea.';
            public       postgres    false    1757            �           1259    16633    ticket_registro    TABLE     K  CREATE TABLE ticket_registro (
    id_ticket_registro integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_ticket_registro date NOT NULL,
    fecha_ticket_usado date,
    estatus_ticket_registro_id integer NOT NULL,
    texto_ticket_registro character varying(128) NOT NULL,
    tipo_ticket_registro_id integer NOT NULL
);
 #   DROP TABLE public.ticket_registro;
       public         postgres    false    6            �
           0    0    TABLE ticket_registro    COMMENT     _   COMMENT ON TABLE ticket_registro IS 'Tabla que contiene los tickets para activar un usuario.';
            public       postgres    false    1758            �
           0    0 )   COLUMN ticket_registro.id_ticket_registro    COMMENT     �   COMMENT ON COLUMN ticket_registro.id_ticket_registro IS 'Campo de tipo entero que identifica las filas de la tabla ticket_registro.';
            public       postgres    false    1758            �
           0    0 !   COLUMN ticket_registro.usuario_id    COMMENT     �   COMMENT ON COLUMN ticket_registro.usuario_id IS 'Campo de tipo entero que definirá el usuario que se activará al usar este ticket.';
            public       postgres    false    1758            �
           0    0 ,   COLUMN ticket_registro.fecha_ticket_registro    COMMENT     �   COMMENT ON COLUMN ticket_registro.fecha_ticket_registro IS 'Campo de tipo date que define la fecha en que fue creado el ticket.';
            public       postgres    false    1758            �
           0    0 )   COLUMN ticket_registro.fecha_ticket_usado    COMMENT     ~   COMMENT ON COLUMN ticket_registro.fecha_ticket_usado IS 'Campo de tipo date que define la fecha en que fue usado el ticket.';
            public       postgres    false    1758            �
           0    0 1   COLUMN ticket_registro.estatus_ticket_registro_id    COMMENT     �   COMMENT ON COLUMN ticket_registro.estatus_ticket_registro_id IS 'Campo de tipo entero que define el estado en que se encuentra el ticket.';
            public       postgres    false    1758            �
           0    0 ,   COLUMN ticket_registro.texto_ticket_registro    COMMENT     �   COMMENT ON COLUMN ticket_registro.texto_ticket_registro IS 'Campo que define el texto del ticket que servirá para activar al usuario.';
            public       postgres    false    1758            �
           0    0 .   COLUMN ticket_registro.tipo_ticket_registro_id    COMMENT     t   COMMENT ON COLUMN ticket_registro.tipo_ticket_registro_id IS 'Campo que define de que tipo es un ticket_registro.';
            public       postgres    false    1758            �           1259    16636 &   ticket_registro_id_ticket_registro_seq    SEQUENCE     �   CREATE SEQUENCE ticket_registro_id_ticket_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 =   DROP SEQUENCE public.ticket_registro_id_ticket_registro_seq;
       public       postgres    false    1758    6            �
           0    0 &   ticket_registro_id_ticket_registro_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE ticket_registro_id_ticket_registro_seq OWNED BY ticket_registro.id_ticket_registro;
            public       postgres    false    1759            �
           0    0 &   ticket_registro_id_ticket_registro_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('ticket_registro_id_ticket_registro_seq', 1, false);
            public       postgres    false    1759            �           1259    16638 
   tipo_aviso    TABLE     �   CREATE TABLE tipo_aviso (
    id_tipo_aviso integer NOT NULL,
    nombre_tipo_aviso character varying(15) NOT NULL,
    definicion_tipo_aviso character varying DEFAULT 150 NOT NULL
);
    DROP TABLE public.tipo_aviso;
       public         postgres    false    2106    6            �
           0    0    TABLE tipo_aviso    COMMENT     |   COMMENT ON TABLE tipo_aviso IS 'Tabla que contendrá los registros que describirán los tipos de aviso que puden existir.';
            public       postgres    false    1760            �
           0    0    COLUMN tipo_aviso.id_tipo_aviso    COMMENT     y   COMMENT ON COLUMN tipo_aviso.id_tipo_aviso IS 'Campo de tipo entero que define el identificador de los tipos de aviso.';
            public       postgres    false    1760            �
           0    0 #   COLUMN tipo_aviso.nombre_tipo_aviso    COMMENT     w   COMMENT ON COLUMN tipo_aviso.nombre_tipo_aviso IS 'Campo de tipo texto que define los nombres de los tipos de aviso.';
            public       postgres    false    1760            �
           0    0 '   COLUMN tipo_aviso.definicion_tipo_aviso    COMMENT     t   COMMENT ON COLUMN tipo_aviso.definicion_tipo_aviso IS 'Campo de tipo texto que define a detalle un tipo de aviso.';
            public       postgres    false    1760            �           1259    16645    tipo_aviso_id_tipo_aviso_seq    SEQUENCE     ~   CREATE SEQUENCE tipo_aviso_id_tipo_aviso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tipo_aviso_id_tipo_aviso_seq;
       public       postgres    false    1760    6            �
           0    0    tipo_aviso_id_tipo_aviso_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE tipo_aviso_id_tipo_aviso_seq OWNED BY tipo_aviso.id_tipo_aviso;
            public       postgres    false    1761            �
           0    0    tipo_aviso_id_tipo_aviso_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('tipo_aviso_id_tipo_aviso_seq', 1, false);
            public       postgres    false    1761            �           1259    16647    tipo_bitacora    TABLE     �   CREATE TABLE tipo_bitacora (
    id_tipo_bitacora integer NOT NULL,
    nombre_tipo_bitacora character varying(15) NOT NULL,
    definicion_tipo_bitacora character varying(150) NOT NULL
);
 !   DROP TABLE public.tipo_bitacora;
       public         postgres    false    6            �
           0    0    TABLE tipo_bitacora    COMMENT     z   COMMENT ON TABLE tipo_bitacora IS 'Representa los tipos de mensajes que pueden existir como elementos de una bitácora.';
            public       postgres    false    1762            �
           0    0 %   COLUMN tipo_bitacora.id_tipo_bitacora    COMMENT     �   COMMENT ON COLUMN tipo_bitacora.id_tipo_bitacora IS 'Campo de tipo entero que define el identificador de las filas en la tabla tipo_bitacora.';
            public       postgres    false    1762            �
           0    0 )   COLUMN tipo_bitacora.nombre_tipo_bitacora    COMMENT     |   COMMENT ON COLUMN tipo_bitacora.nombre_tipo_bitacora IS 'Campo de tipo texto que define el nombre de un tipo de bitacora.';
            public       postgres    false    1762            �
           0    0 -   COLUMN tipo_bitacora.definicion_tipo_bitacora    COMMENT     }   COMMENT ON COLUMN tipo_bitacora.definicion_tipo_bitacora IS 'Campo de tipo texto que define a detalle un tipo de bitacora.';
            public       postgres    false    1762            �           1259    16650 "   tipo_bitacora_id_tipo_bitacora_seq    SEQUENCE     �   CREATE SEQUENCE tipo_bitacora_id_tipo_bitacora_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 9   DROP SEQUENCE public.tipo_bitacora_id_tipo_bitacora_seq;
       public       postgres    false    6    1762            �
           0    0 "   tipo_bitacora_id_tipo_bitacora_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE tipo_bitacora_id_tipo_bitacora_seq OWNED BY tipo_bitacora.id_tipo_bitacora;
            public       postgres    false    1763            �
           0    0 "   tipo_bitacora_id_tipo_bitacora_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('tipo_bitacora_id_tipo_bitacora_seq', 1, false);
            public       postgres    false    1763            �           1259    16652    tipo_contacto_usuario    TABLE     e  CREATE TABLE tipo_contacto_usuario (
    id_tipo_contacto_usuario integer NOT NULL,
    nombre_tipo_contacto_usuario character varying(15) NOT NULL,
    definicion_tipo_contacto_usuario character varying(150) NOT NULL,
    dato1 character varying(100),
    dato2 character varying(100),
    dato3 character varying(100),
    dato4 character varying(100)
);
 )   DROP TABLE public.tipo_contacto_usuario;
       public         postgres    false    6            �
           0    0    TABLE tipo_contacto_usuario    COMMENT        COMMENT ON TABLE tipo_contacto_usuario IS 'Tabla que contendrá los diferentes tipos de contacto que puede tener un usuario.';
            public       postgres    false    1764            �
           0    0 5   COLUMN tipo_contacto_usuario.id_tipo_contacto_usuario    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.id_tipo_contacto_usuario IS 'Campo de tipo entero que define el identificador de las filas de la tabla tipo_contacto_usuario.';
            public       postgres    false    1764            �
           0    0 9   COLUMN tipo_contacto_usuario.nombre_tipo_contacto_usuario    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.nombre_tipo_contacto_usuario IS 'Campo de tipo texto que define el nombre de un tipo de contacto de usuario.';
            public       postgres    false    1764            �
           0    0 =   COLUMN tipo_contacto_usuario.definicion_tipo_contacto_usuario    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.definicion_tipo_contacto_usuario IS 'Campo de tipo texto que define con más detalle el significado de un nombre de tipo_contacto_usuario.';
            public       postgres    false    1764            �
           0    0 "   COLUMN tipo_contacto_usuario.dato1    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.dato1 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';
            public       postgres    false    1764            �
           0    0 "   COLUMN tipo_contacto_usuario.dato2    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.dato2 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';
            public       postgres    false    1764            �
           0    0 "   COLUMN tipo_contacto_usuario.dato3    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.dato3 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';
            public       postgres    false    1764            �
           0    0 "   COLUMN tipo_contacto_usuario.dato4    COMMENT     �   COMMENT ON COLUMN tipo_contacto_usuario.dato4 IS 'Campo para almacenar correspondiente a cierto tipo de contacto. Por ejemplo, para interactuar con twitter puede ser necesario almacenar llaves públicas y otros datos.';
            public       postgres    false    1764            �           1259    16658 2   tipo_contacto_usuario_id_tipo_contacto_usuario_seq    SEQUENCE     �   CREATE SEQUENCE tipo_contacto_usuario_id_tipo_contacto_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 I   DROP SEQUENCE public.tipo_contacto_usuario_id_tipo_contacto_usuario_seq;
       public       postgres    false    6    1764            �
           0    0 2   tipo_contacto_usuario_id_tipo_contacto_usuario_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE tipo_contacto_usuario_id_tipo_contacto_usuario_seq OWNED BY tipo_contacto_usuario.id_tipo_contacto_usuario;
            public       postgres    false    1765            �
           0    0 2   tipo_contacto_usuario_id_tipo_contacto_usuario_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('tipo_contacto_usuario_id_tipo_contacto_usuario_seq', 1, false);
            public       postgres    false    1765            �           1259    16660    tipo_critica    TABLE     �   CREATE TABLE tipo_critica (
    id_tipo_critica integer NOT NULL,
    nombre_tipo_critica character varying(15) NOT NULL,
    definicion_tipo_critica character varying(150) NOT NULL
);
     DROP TABLE public.tipo_critica;
       public         postgres    false    6            �
           0    0    TABLE tipo_critica    COMMENT     v   COMMENT ON TABLE tipo_critica IS 'Tabla que contendrá los tipos de crítica que el usuario puede hacer al sistema.';
            public       postgres    false    1766            �
           0    0 #   COLUMN tipo_critica.id_tipo_critica    COMMENT     �   COMMENT ON COLUMN tipo_critica.id_tipo_critica IS 'Campo de tipo entero que define el identificador de las filas de la tabla tipo_critica.';
            public       postgres    false    1766            �
           0    0 '   COLUMN tipo_critica.nombre_tipo_critica    COMMENT     u   COMMENT ON COLUMN tipo_critica.nombre_tipo_critica IS 'Campo de tipo texto que le da nombre a un tipo de crítica.';
            public       postgres    false    1766            �
           0    0 +   COLUMN tipo_critica.definicion_tipo_critica    COMMENT     �   COMMENT ON COLUMN tipo_critica.definicion_tipo_critica IS 'Campo de tipo texto que define de manera más amplia la descripción de un tipo de crítica.';
            public       postgres    false    1766            �           1259    16663     tipo_critica_id_tipo_critica_seq    SEQUENCE     �   CREATE SEQUENCE tipo_critica_id_tipo_critica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 7   DROP SEQUENCE public.tipo_critica_id_tipo_critica_seq;
       public       postgres    false    6    1766            �
           0    0     tipo_critica_id_tipo_critica_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE tipo_critica_id_tipo_critica_seq OWNED BY tipo_critica.id_tipo_critica;
            public       postgres    false    1767            �
           0    0     tipo_critica_id_tipo_critica_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('tipo_critica_id_tipo_critica_seq', 1, false);
            public       postgres    false    1767            �           1259    16665 
   tipo_envio    TABLE     �   CREATE TABLE tipo_envio (
    id_tipo_envio integer NOT NULL,
    nombre_tipo_envio character varying(15) NOT NULL,
    definicion_tipo_envio character varying(150) NOT NULL,
    vista_tipo_envio character varying(100)
);
    DROP TABLE public.tipo_envio;
       public         postgres    false    6            �
           0    0    TABLE tipo_envio    COMMENT     t   COMMENT ON TABLE tipo_envio IS 'Tabla que contendrá los diferentes tipos de envío que el sistema puede manejar.';
            public       postgres    false    1768            �
           0    0    COLUMN tipo_envio.id_tipo_envio    COMMENT     �   COMMENT ON COLUMN tipo_envio.id_tipo_envio IS 'Campo de tipo serial que define el identificador de los registros de la tabla tipo_envio.';
            public       postgres    false    1768            �
           0    0 #   COLUMN tipo_envio.nombre_tipo_envio    COMMENT     v   COMMENT ON COLUMN tipo_envio.nombre_tipo_envio IS 'Campo de tipo texto que define el nombre de los tipos de envío.';
            public       postgres    false    1768            �
           0    0 '   COLUMN tipo_envio.definicion_tipo_envio    COMMENT     w   COMMENT ON COLUMN tipo_envio.definicion_tipo_envio IS 'Campo de tipo texto que define a detalle los tipos de envío.';
            public       postgres    false    1768            �
           0    0 "   COLUMN tipo_envio.vista_tipo_envio    COMMENT     �   COMMENT ON COLUMN tipo_envio.vista_tipo_envio IS 'Campo de tipo texto que define el nombre de la vista *.xhtml que se utilizará para enviar el correo.';
            public       postgres    false    1768            �           1259    16668    tipo_envio_id_tipo_envio_seq    SEQUENCE     ~   CREATE SEQUENCE tipo_envio_id_tipo_envio_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tipo_envio_id_tipo_envio_seq;
       public       postgres    false    1768    6            �
           0    0    tipo_envio_id_tipo_envio_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE tipo_envio_id_tipo_envio_seq OWNED BY tipo_envio.id_tipo_envio;
            public       postgres    false    1769            �
           0    0    tipo_envio_id_tipo_envio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('tipo_envio_id_tipo_envio_seq', 1, true);
            public       postgres    false    1769            �           1259    16670 	   tipo_idea    TABLE     �   CREATE TABLE tipo_idea (
    id_tipo_idea integer NOT NULL,
    nombre_tipo_idea character varying(15) NOT NULL,
    descripcion_tipo_idea character varying(150) NOT NULL
);
    DROP TABLE public.tipo_idea;
       public         postgres    false    6            �
           0    0    TABLE tipo_idea    COMMENT     o   COMMENT ON TABLE tipo_idea IS 'Esta tabla representa los tipos de ideas a los que una idea puede pertenecer.';
            public       postgres    false    1770            �
           0    0    COLUMN tipo_idea.id_tipo_idea    COMMENT     �   COMMENT ON COLUMN tipo_idea.id_tipo_idea IS 'Campode tipo entero que representa el identificador de las filas de la tabla tipo_idea.';
            public       postgres    false    1770            �
           0    0 !   COLUMN tipo_idea.nombre_tipo_idea    COMMENT     t   COMMENT ON COLUMN tipo_idea.nombre_tipo_idea IS 'Campo de tipo texto que define el nombre de el tipo de una idea.';
            public       postgres    false    1770            �
           0    0 &   COLUMN tipo_idea.descripcion_tipo_idea    COMMENT     {   COMMENT ON COLUMN tipo_idea.descripcion_tipo_idea IS 'Campo de tipo texto que define la descripción de un tipo de idea.';
            public       postgres    false    1770            �           1259    16673    tipo_idea_id_tipo_idea_seq    SEQUENCE     |   CREATE SEQUENCE tipo_idea_id_tipo_idea_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tipo_idea_id_tipo_idea_seq;
       public       postgres    false    6    1770            �
           0    0    tipo_idea_id_tipo_idea_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE tipo_idea_id_tipo_idea_seq OWNED BY tipo_idea.id_tipo_idea;
            public       postgres    false    1771            �
           0    0    tipo_idea_id_tipo_idea_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('tipo_idea_id_tipo_idea_seq', 1, false);
            public       postgres    false    1771            �           1259    16675 
   tipo_lugar    TABLE     �   CREATE TABLE tipo_lugar (
    id_tipo_lugar integer NOT NULL,
    nombre_tipo_lugar character varying(50) NOT NULL,
    descripcion_tipo_lugar character varying(150) NOT NULL
);
    DROP TABLE public.tipo_lugar;
       public         postgres    false    6            �
           0    0    TABLE tipo_lugar    COMMENT     w   COMMENT ON TABLE tipo_lugar IS 'Tabla que contiene los tipos de lugares disponibles para ser ocupados por las ideas.';
            public       postgres    false    1772            �
           0    0    COLUMN tipo_lugar.id_tipo_lugar    COMMENT     {   COMMENT ON COLUMN tipo_lugar.id_tipo_lugar IS 'Campo de tipo entero que identifica los registros en la tabla tipo_lugar.';
            public       postgres    false    1772            �
           0    0 #   COLUMN tipo_lugar.nombre_tipo_lugar    COMMENT     �   COMMENT ON COLUMN tipo_lugar.nombre_tipo_lugar IS 'Campo de tipo texto que define el nombre de los registros de la tabla tipo_lugar.';
            public       postgres    false    1772            �
           0    0 (   COLUMN tipo_lugar.descripcion_tipo_lugar    COMMENT     r   COMMENT ON COLUMN tipo_lugar.descripcion_tipo_lugar IS 'Campo de tipo texto que define a detalle un tipo_lugar.';
            public       postgres    false    1772            �           1259    16678    tipo_lugar_id_tipo_lugar_seq    SEQUENCE     ~   CREATE SEQUENCE tipo_lugar_id_tipo_lugar_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tipo_lugar_id_tipo_lugar_seq;
       public       postgres    false    6    1772            �
           0    0    tipo_lugar_id_tipo_lugar_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE tipo_lugar_id_tipo_lugar_seq OWNED BY tipo_lugar.id_tipo_lugar;
            public       postgres    false    1773            �
           0    0    tipo_lugar_id_tipo_lugar_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('tipo_lugar_id_tipo_lugar_seq', 1, false);
            public       postgres    false    1773            �           1259    16680    tipo_reporte_abuso    TABLE     �   CREATE TABLE tipo_reporte_abuso (
    id_tipo_reporte_abuso integer NOT NULL,
    nombre_tipo_reporte_abuso character varying(15) NOT NULL,
    definicion_tipo_reporte_abuso character varying(150) NOT NULL
);
 &   DROP TABLE public.tipo_reporte_abuso;
       public         postgres    false    6            �
           0    0    TABLE tipo_reporte_abuso    COMMENT     �   COMMENT ON TABLE tipo_reporte_abuso IS 'Tabla que contendrá los tipos de reporte que podrá hacer el usuario en caso de detectar información no adecuada dentro del sistema.';
            public       postgres    false    1774            �
           0    0 /   COLUMN tipo_reporte_abuso.id_tipo_reporte_abuso    COMMENT     �   COMMENT ON COLUMN tipo_reporte_abuso.id_tipo_reporte_abuso IS 'Campo de tipo entero que define el identificador de las filas en la tabla tipo_reporte_abuso.';
            public       postgres    false    1774            �
           0    0 3   COLUMN tipo_reporte_abuso.nombre_tipo_reporte_abuso    COMMENT     �   COMMENT ON COLUMN tipo_reporte_abuso.nombre_tipo_reporte_abuso IS 'Campo de tipo texto que define el nombre de un tipo_reporte_abuso.';
            public       postgres    false    1774            �
           0    0 7   COLUMN tipo_reporte_abuso.definicion_tipo_reporte_abuso    COMMENT     �   COMMENT ON COLUMN tipo_reporte_abuso.definicion_tipo_reporte_abuso IS 'Campo de tipo texto que explica el significado de un nombre de un tipo_reporte_abuso.';
            public       postgres    false    1774            �           1259    16683 ,   tipo_reporte_abuso_id_tipo_reporte_abuso_seq    SEQUENCE     �   CREATE SEQUENCE tipo_reporte_abuso_id_tipo_reporte_abuso_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 C   DROP SEQUENCE public.tipo_reporte_abuso_id_tipo_reporte_abuso_seq;
       public       postgres    false    1774    6            �
           0    0 ,   tipo_reporte_abuso_id_tipo_reporte_abuso_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE tipo_reporte_abuso_id_tipo_reporte_abuso_seq OWNED BY tipo_reporte_abuso.id_tipo_reporte_abuso;
            public       postgres    false    1775            �
           0    0 ,   tipo_reporte_abuso_id_tipo_reporte_abuso_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('tipo_reporte_abuso_id_tipo_reporte_abuso_seq', 1, false);
            public       postgres    false    1775            �           1259    16685    tipo_ticket_registro    TABLE     �   CREATE TABLE tipo_ticket_registro (
    id_tipo_ticket_registro integer NOT NULL,
    nombre_tipo_ticket_registro character varying(15) NOT NULL,
    descripcion_tipo_ticket_registro character varying(150) NOT NULL
);
 (   DROP TABLE public.tipo_ticket_registro;
       public         postgres    false    6            �
           0    0    TABLE tipo_ticket_registro    COMMENT     �   COMMENT ON TABLE tipo_ticket_registro IS 'Tabla que contendrá los registros que describen los diferentes estatus que puede tomar un ticket de registro.';
            public       postgres    false    1776            �
           0    0 3   COLUMN tipo_ticket_registro.id_tipo_ticket_registro    COMMENT     �   COMMENT ON COLUMN tipo_ticket_registro.id_tipo_ticket_registro IS 'Campo de tipo entero que identifica a los registros de la tabla tipo_ticket_registro';
            public       postgres    false    1776                        0    0 7   COLUMN tipo_ticket_registro.nombre_tipo_ticket_registro    COMMENT     �   COMMENT ON COLUMN tipo_ticket_registro.nombre_tipo_ticket_registro IS 'Campo de tipo texto que da nombre a un tipo_ticket_registro';
            public       postgres    false    1776                       0    0 <   COLUMN tipo_ticket_registro.descripcion_tipo_ticket_registro    COMMENT     �   COMMENT ON COLUMN tipo_ticket_registro.descripcion_tipo_ticket_registro IS 'Campo de tipo texto que describe a detalle un tipo_ticket_registro';
            public       postgres    false    1776            �           1259    16688 0   tipo_ticket_registro_id_tipo_ticket_registro_seq    SEQUENCE     �   CREATE SEQUENCE tipo_ticket_registro_id_tipo_ticket_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 G   DROP SEQUENCE public.tipo_ticket_registro_id_tipo_ticket_registro_seq;
       public       postgres    false    6    1776                       0    0 0   tipo_ticket_registro_id_tipo_ticket_registro_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE tipo_ticket_registro_id_tipo_ticket_registro_seq OWNED BY tipo_ticket_registro.id_tipo_ticket_registro;
            public       postgres    false    1777                       0    0 0   tipo_ticket_registro_id_tipo_ticket_registro_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('tipo_ticket_registro_id_tipo_ticket_registro_seq', 1, false);
            public       postgres    false    1777            �           1259    16690    tipo_visita    TABLE     �   CREATE TABLE tipo_visita (
    id_tipo_visita integer NOT NULL,
    nombre_tipo_visita character varying(15) NOT NULL,
    descripcion_tipo_visita character varying(150) NOT NULL
);
    DROP TABLE public.tipo_visita;
       public         postgres    false    6                       0    0    TABLE tipo_visita    COMMENT     d   COMMENT ON TABLE tipo_visita IS 'Tabla que contendrá los tipos de visitas manejados por linkUam.';
            public       postgres    false    1778                       0    0 !   COLUMN tipo_visita.id_tipo_visita    COMMENT     �   COMMENT ON COLUMN tipo_visita.id_tipo_visita IS 'Campo de tipo entero que identifica a los registros de la tabla tipo_visita.';
            public       postgres    false    1778                       0    0 %   COLUMN tipo_visita.nombre_tipo_visita    COMMENT     �   COMMENT ON COLUMN tipo_visita.nombre_tipo_visita IS 'Campo de tipo texto que da nombre a los registros de la tabla tipo_visita.';
            public       postgres    false    1778                       0    0 *   COLUMN tipo_visita.descripcion_tipo_visita    COMMENT     �   COMMENT ON COLUMN tipo_visita.descripcion_tipo_visita IS 'Campo de tipo texto que describe a detalle los registros de la tabla tipo_visita.';
            public       postgres    false    1778            �           1259    16693    tipo_visita_id_tipo_visita_seq    SEQUENCE     �   CREATE SEQUENCE tipo_visita_id_tipo_visita_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tipo_visita_id_tipo_visita_seq;
       public       postgres    false    1778    6                       0    0    tipo_visita_id_tipo_visita_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE tipo_visita_id_tipo_visita_seq OWNED BY tipo_visita.id_tipo_visita;
            public       postgres    false    1779            	           0    0    tipo_visita_id_tipo_visita_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('tipo_visita_id_tipo_visita_seq', 1, false);
            public       postgres    false    1779            �           1259    17707 
   tipo_vista    TABLE     �   CREATE TABLE tipo_vista (
    nombre_tipo_vista character varying(15) NOT NULL,
    descripcion_tipo_vista character varying(150) NOT NULL,
    id_tipo_vista integer NOT NULL
);
    DROP TABLE public.tipo_vista;
       public         postgres    false    6            
           0    0    TABLE tipo_vista    COMMENT     b   COMMENT ON TABLE tipo_vista IS 'Tabla que contiene los tipos de vista existentes en el sistema.';
            public       postgres    false    1784                       0    0 #   COLUMN tipo_vista.nombre_tipo_vista    COMMENT     k   COMMENT ON COLUMN tipo_vista.nombre_tipo_vista IS 'Campo de tipo texto que da nombre a un tipo de vista.';
            public       postgres    false    1784                       0    0 (   COLUMN tipo_vista.descripcion_tipo_vista    COMMENT     m   COMMENT ON COLUMN tipo_vista.descripcion_tipo_vista IS 'Campo de tipo texto que describe un tipo de vista.';
            public       postgres    false    1784                       0    0    COLUMN tipo_vista.id_tipo_vista    COMMENT     r   COMMENT ON COLUMN tipo_vista.id_tipo_vista IS 'Campo que identifica los tipos de vista presentes en el sistema.';
            public       postgres    false    1784            �           1259    17726    tipo_vista_id_tipo_vista_seq    SEQUENCE     ~   CREATE SEQUENCE tipo_vista_id_tipo_vista_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tipo_vista_id_tipo_vista_seq;
       public       postgres    false    1784    6                       0    0    tipo_vista_id_tipo_vista_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE tipo_vista_id_tipo_vista_seq OWNED BY tipo_vista.id_tipo_vista;
            public       postgres    false    1787                       0    0    tipo_vista_id_tipo_vista_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('tipo_vista_id_tipo_vista_seq', 1, false);
            public       postgres    false    1787            �           1259    16695    usuario    TABLE     �  CREATE TABLE usuario (
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
    DROP TABLE public.usuario;
       public         postgres    false    6                       0    0    TABLE usuario    COMMENT     ^   COMMENT ON TABLE usuario IS 'Tabla que contendrá a los usuarios registrados en el sistema.';
            public       postgres    false    1780                       0    0    COLUMN usuario.id_usuario    COMMENT        COMMENT ON COLUMN usuario.id_usuario IS 'Campo de tipo texto que describe el identificador de las filas de la tabla Usuario.';
            public       postgres    false    1780                       0    0    COLUMN usuario.nombre_usuario    COMMENT     n   COMMENT ON COLUMN usuario.nombre_usuario IS 'Campo de tipo texto que describe el o los nombres del usuario.';
            public       postgres    false    1780                       0    0 $   COLUMN usuario.fecha_ingreso_usuario    COMMENT     }   COMMENT ON COLUMN usuario.fecha_ingreso_usuario IS 'Columna de tipo fecha que define la fecha de inscripción del usuario.';
            public       postgres    false    1780                       0    0    COLUMN usuario.institucion_id    COMMENT     ~   COMMENT ON COLUMN usuario.institucion_id IS 'Campo de tipo entero que define la institución a la que pertenece el usuario.';
            public       postgres    false    1780                       0    0     COLUMN usuario.fecha_fin_usuario    COMMENT     �   COMMENT ON COLUMN usuario.fecha_fin_usuario IS 'Campo de tipo fecha que define la fecha en la que el usuario deja de ser miembro del sistema.';
            public       postgres    false    1780                       0    0 '   COLUMN usuario.apellido_paterno_usuario    COMMENT     k   COMMENT ON COLUMN usuario.apellido_paterno_usuario IS 'Campo que define el apellido paterno del usuario.';
            public       postgres    false    1780                       0    0 '   COLUMN usuario.apellido_materno_usuario    COMMENT     k   COMMENT ON COLUMN usuario.apellido_materno_usuario IS 'Campo que define el apellido materno del usuario.';
            public       postgres    false    1780                       0    0 !   COLUMN usuario.contrasena_usuario    COMMENT     �   COMMENT ON COLUMN usuario.contrasena_usuario IS 'Campo de tipo texto que almacena una cadena hasheada correspondiente al password del usuario.';
            public       postgres    false    1780                       0    0 #   COLUMN usuario.calificacion_usuario    COMMENT     �   COMMENT ON COLUMN usuario.calificacion_usuario IS 'Campo de tipo entero que define la calificación "global" de un usuario: promediando sus diferentes participaciones.';
            public       postgres    false    1780                       0    0 !   COLUMN usuario.estatus_usuario_id    COMMENT     t   COMMENT ON COLUMN usuario.estatus_usuario_id IS 'Campo de tipo entero que define el estatus actual de un usuario.';
            public       postgres    false    1780                       0    0    COLUMN usuario.nick_usuario    COMMENT     c   COMMENT ON COLUMN usuario.nick_usuario IS 'Campo de tipo texto que define el nick de un usuario.';
            public       postgres    false    1780                       0    0 $   COLUMN usuario.nombre_imagen_usuario    COMMENT     �   COMMENT ON COLUMN usuario.nombre_imagen_usuario IS 'Campo de tipo texto que define el nombre de la imagen/foto/avatar de un usuario.';
            public       postgres    false    1780                       0    0    COLUMN usuario.sexo_usuario    COMMENT     n   COMMENT ON COLUMN usuario.sexo_usuario IS 'Campo de tipo texto con lenght=1 que define el sexo del usuario.';
            public       postgres    false    1780                       0    0 '   COLUMN usuario.fecha_nacimiento_usuario    COMMENT     {   COMMENT ON COLUMN usuario.fecha_nacimiento_usuario IS 'Campo de tipo date que define la fecha de nacimiento del usuario.';
            public       postgres    false    1780                       0    0 '   COLUMN usuario.configuracion_usuario_id    COMMENT     v   COMMENT ON COLUMN usuario.configuracion_usuario_id IS 'Campo que define la configuración perteneciente al usuario.';
            public       postgres    false    1780            �           1259    16698    usuario_id_usuario_seq    SEQUENCE     x   CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public       postgres    false    1780    6                        0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;
            public       postgres    false    1781            !           0    0    usuario_id_usuario_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, false);
            public       postgres    false    1781            �           1259    16700    visita    TABLE     �  CREATE TABLE visita (
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
    DROP TABLE public.visita;
       public         postgres    false    6            "           0    0    TABLE visita    COMMENT     Z   COMMENT ON TABLE visita IS 'Tabla que contendrá los registros de las visitas al sitio.';
            public       postgres    false    1782            #           0    0    COLUMN visita.id_visita    COMMENT     q   COMMENT ON COLUMN visita.id_visita IS 'Campo de tipo entero que identifica a los registros de la tabla visita.';
            public       postgres    false    1782            $           0    0 !   COLUMN visita.fecha_inicio_visita    COMMENT     k   COMMENT ON COLUMN visita.fecha_inicio_visita IS 'Campo de tipo fecha que define cuando inicio la visita.';
            public       postgres    false    1782            %           0    0    COLUMN visita.fecha_fin_visita    COMMENT     j   COMMENT ON COLUMN visita.fecha_fin_visita IS 'Campo de tipo fecha que define cuando terminó la visita.';
            public       postgres    false    1782            &           0    0 !   COLUMN visita.direccion_ip_visita    COMMENT     �   COMMENT ON COLUMN visita.direccion_ip_visita IS 'Campo de tipo texto que define la ip desde donde el usuario se está conectando.';
            public       postgres    false    1782            '           0    0 3   COLUMN visita.coordenada_geografica_longitud_visita    COMMENT     �   COMMENT ON COLUMN visita.coordenada_geografica_longitud_visita IS 'Campo de tipo float/real que define la coordenada geográfica longitud desde la cual se está conectando el usuario.';
            public       postgres    false    1782            (           0    0 2   COLUMN visita.coordenada_geografica_latitud_visita    COMMENT     �   COMMENT ON COLUMN visita.coordenada_geografica_latitud_visita IS 'Campo de tipo float/real que define la coordenada latitud desde la cual se está conectando el usuario.';
            public       postgres    false    1782            )           0    0    COLUMN visita.usuario_id    COMMENT     o   COMMENT ON COLUMN visita.usuario_id IS 'Campo de tipo entero que describe al usuario que realizó la visita.';
            public       postgres    false    1782            *           0    0    COLUMN visita.tipo_visita_id    COMMENT     a   COMMENT ON COLUMN visita.tipo_visita_id IS 'Campo de tipo entero que define el tipo de visita.';
            public       postgres    false    1782            +           0    0    COLUMN visita.idea_id    COMMENT     M   COMMENT ON COLUMN visita.idea_id IS 'Campo que describe una idea visitada.';
            public       postgres    false    1782            ,           0    0    COLUMN visita.sesionid    COMMENT     �   COMMENT ON COLUMN visita.sesionid IS 'Campo que contiene el identificador de la sesión bajo la cual se está realizando la visita.';
            public       postgres    false    1782            -           0    0    COLUMN visita.vista_id    COMMENT     _   COMMENT ON COLUMN visita.vista_id IS 'Campo que describe la página visitada por un usuario.';
            public       postgres    false    1782            �           1259    16703    visita_id_visita_seq    SEQUENCE     v   CREATE SEQUENCE visita_id_visita_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 +   DROP SEQUENCE public.visita_id_visita_seq;
       public       postgres    false    6    1782            .           0    0    visita_id_visita_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE visita_id_visita_seq OWNED BY visita.id_visita;
            public       postgres    false    1783            /           0    0    visita_id_visita_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('visita_id_visita_seq', 1, false);
            public       postgres    false    1783            �           1259    17712    vista    TABLE     �   CREATE TABLE vista (
    descripcion_vista character varying(150) NOT NULL,
    nombre_vista character varying(200) NOT NULL,
    id_vista integer NOT NULL,
    tipo_vista_id integer NOT NULL
);
    DROP TABLE public.vista;
       public         postgres    false    6            0           0    0    TABLE vista    COMMENT       COMMENT ON TABLE vista IS 'Tabla que contendrá la descripción de las vistas del sistema (.xhtml). Esto con el único objetivo de poder estadísticas de las visitas a una página en específico, así que no necesariamente estarán presentes todas las páginas del sistema.';
            public       postgres    false    1785            1           0    0    COLUMN vista.descripcion_vista    COMMENT     X   COMMENT ON COLUMN vista.descripcion_vista IS 'Campo que describe a detalle una vista.';
            public       postgres    false    1785            2           0    0    COLUMN vista.nombre_vista    COMMENT     f   COMMENT ON COLUMN vista.nombre_vista IS 'Campo que describe como se llama la vista y su extensión.';
            public       postgres    false    1785            3           0    0    COLUMN vista.id_vista    COMMENT     _   COMMENT ON COLUMN vista.id_vista IS 'Campo que identifica a los registros de la tabla vista.';
            public       postgres    false    1785            4           0    0    COLUMN vista.tipo_vista_id    COMMENT     b   COMMENT ON COLUMN vista.tipo_vista_id IS 'Campo que describe el tipo de vista al que pertenece.';
            public       postgres    false    1785            �           1259    17720    vista_id_vista_seq    SEQUENCE     t   CREATE SEQUENCE vista_id_vista_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.vista_id_vista_seq;
       public       postgres    false    6    1785            5           0    0    vista_id_vista_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE vista_id_vista_seq OWNED BY vista.id_vista;
            public       postgres    false    1786            6           0    0    vista_id_vista_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('vista_id_vista_seq', 1, false);
            public       postgres    false    1786                       2604    16705    id_accion_reporte_abuso    DEFAULT     �   ALTER TABLE accion_reporte_abuso ALTER COLUMN id_accion_reporte_abuso SET DEFAULT nextval('accion_reporte_abuso_id_accion_reporte_abuso_seq'::regclass);
 [   ALTER TABLE public.accion_reporte_abuso ALTER COLUMN id_accion_reporte_abuso DROP DEFAULT;
       public       postgres    false    1676    1675                       2604    16706    id_aviso    DEFAULT     ]   ALTER TABLE aviso ALTER COLUMN id_aviso SET DEFAULT nextval('aviso_id_aviso_seq'::regclass);
 =   ALTER TABLE public.aviso ALTER COLUMN id_aviso DROP DEFAULT;
       public       postgres    false    1678    1677                       2604    16707    id_bitacora    DEFAULT     i   ALTER TABLE bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('bitacora_id_bitacora_seq'::regclass);
 C   ALTER TABLE public.bitacora ALTER COLUMN id_bitacora DROP DEFAULT;
       public       postgres    false    1680    1679                       2604    16708 	   id_canica    DEFAULT     a   ALTER TABLE canica ALTER COLUMN id_canica SET DEFAULT nextval('canica_id_canica_seq'::regclass);
 ?   ALTER TABLE public.canica ALTER COLUMN id_canica DROP DEFAULT;
       public       postgres    false    1682    1681                       2604    16709    id_como_lograrlo    DEFAULT     }   ALTER TABLE como_lograrlo ALTER COLUMN id_como_lograrlo SET DEFAULT nextval('como_lograrlo_id_como_lograrlo_seq'::regclass);
 M   ALTER TABLE public.como_lograrlo ALTER COLUMN id_como_lograrlo DROP DEFAULT;
       public       postgres    false    1685    1684                       2604    16710    id_comunidad    DEFAULT     y   ALTER TABLE comunidad ALTER COLUMN id_comunidad SET DEFAULT nextval('lista_comunidad_id_lista_comunidad_seq'::regclass);
 E   ALTER TABLE public.comunidad ALTER COLUMN id_comunidad DROP DEFAULT;
       public       postgres    false    1740    1686                       2604    16711    id_configuracion_usuario    DEFAULT     �   ALTER TABLE configuracion_usuario ALTER COLUMN id_configuracion_usuario SET DEFAULT nextval('configuracion_usuario_id_configuracion_seq'::regclass);
 ]   ALTER TABLE public.configuracion_usuario ALTER COLUMN id_configuracion_usuario DROP DEFAULT;
       public       postgres    false    1688    1687                       2604    16712    id_contacto_usuario    DEFAULT     �   ALTER TABLE contacto_usuario ALTER COLUMN id_contacto_usuario SET DEFAULT nextval('contacto_usuario_id_contacto_usuario_seq'::regclass);
 S   ALTER TABLE public.contacto_usuario ALTER COLUMN id_contacto_usuario DROP DEFAULT;
       public       postgres    false    1690    1689                       2604    16713 
   id_critica    DEFAULT     e   ALTER TABLE critica ALTER COLUMN id_critica SET DEFAULT nextval('critica_id_critica_seq'::regclass);
 A   ALTER TABLE public.critica ALTER COLUMN id_critica DROP DEFAULT;
       public       postgres    false    1692    1691                       2604    16714    id_envio    DEFAULT     ]   ALTER TABLE envio ALTER COLUMN id_envio SET DEFAULT nextval('envio_id_envio_seq'::regclass);
 =   ALTER TABLE public.envio ALTER COLUMN id_envio DROP DEFAULT;
       public       postgres    false    1694    1693                       2604    16715    id_estatus_aviso    DEFAULT     }   ALTER TABLE estatus_aviso ALTER COLUMN id_estatus_aviso SET DEFAULT nextval('estatus_aviso_id_estatus_aviso_seq'::regclass);
 M   ALTER TABLE public.estatus_aviso ALTER COLUMN id_estatus_aviso DROP DEFAULT;
       public       postgres    false    1696    1695                       2604    16716    id_estatus_ayuda_monetaria    DEFAULT     �   ALTER TABLE estatus_ayuda_monetaria ALTER COLUMN id_estatus_ayuda_monetaria SET DEFAULT nextval('estatus_monetario_id_estatus_monetario_seq'::regclass);
 a   ALTER TABLE public.estatus_ayuda_monetaria ALTER COLUMN id_estatus_ayuda_monetaria DROP DEFAULT;
       public       postgres    false    1715    1697                       2604    16717 !   id_estatus_ayuda_recursos_humanos    DEFAULT     �   ALTER TABLE estatus_ayuda_recursos_humanos ALTER COLUMN id_estatus_ayuda_recursos_humanos SET DEFAULT nextval('estatus_recursos_humanos_id_estatus_recursos_humanos_seq'::regclass);
 o   ALTER TABLE public.estatus_ayuda_recursos_humanos ALTER COLUMN id_estatus_ayuda_recursos_humanos DROP DEFAULT;
       public       postgres    false    1720    1698                        2604    16718    id_estatus_bitacora    DEFAULT     �   ALTER TABLE estatus_bitacora ALTER COLUMN id_estatus_bitacora SET DEFAULT nextval('estatus_bitacora_id_estatus_bitacora_seq'::regclass);
 S   ALTER TABLE public.estatus_bitacora ALTER COLUMN id_estatus_bitacora DROP DEFAULT;
       public       postgres    false    1700    1699            !           2604    16719    id_estatus_comunidad    DEFAULT     �   ALTER TABLE estatus_comunidad ALTER COLUMN id_estatus_comunidad SET DEFAULT nextval('estatus_comunidad_id_estatus_comunidad_seq'::regclass);
 U   ALTER TABLE public.estatus_comunidad ALTER COLUMN id_estatus_comunidad DROP DEFAULT;
       public       postgres    false    1702    1701            "           2604    16720    id_estatus_critica    DEFAULT     �   ALTER TABLE estatus_critica ALTER COLUMN id_estatus_critica SET DEFAULT nextval('estatus_critica_id_estatus_critica_seq'::regclass);
 Q   ALTER TABLE public.estatus_critica ALTER COLUMN id_estatus_critica DROP DEFAULT;
       public       postgres    false    1704    1703            #           2604    16721    id_estatus_envio    DEFAULT     }   ALTER TABLE estatus_envio ALTER COLUMN id_estatus_envio SET DEFAULT nextval('estatus_envio_id_estatus_envio_seq'::regclass);
 M   ALTER TABLE public.estatus_envio ALTER COLUMN id_estatus_envio DROP DEFAULT;
       public       postgres    false    1706    1705            $           2604    16722    id_estatus_idea    DEFAULT     y   ALTER TABLE estatus_idea ALTER COLUMN id_estatus_idea SET DEFAULT nextval('estatus_idea_id_estatus_idea_seq'::regclass);
 K   ALTER TABLE public.estatus_idea ALTER COLUMN id_estatus_idea DROP DEFAULT;
       public       postgres    false    1708    1707            %           2604    16723    id_estatus_integrante    DEFAULT     �   ALTER TABLE estatus_integrante ALTER COLUMN id_estatus_integrante SET DEFAULT nextval('estatus_integrante_id_estatus_integrante_seq'::regclass);
 W   ALTER TABLE public.estatus_integrante ALTER COLUMN id_estatus_integrante DROP DEFAULT;
       public       postgres    false    1710    1709            &           2604    16724    id_estatus_invitacion    DEFAULT     �   ALTER TABLE estatus_invitacion ALTER COLUMN id_estatus_invitacion SET DEFAULT nextval('estatus_invitacion_id_estatus_invitacion_seq'::regclass);
 W   ALTER TABLE public.estatus_invitacion ALTER COLUMN id_estatus_invitacion DROP DEFAULT;
       public       postgres    false    1712    1711            '           2604    16725    id_estatus_miembro_comunidad    DEFAULT     �   ALTER TABLE estatus_miembro_comunidad ALTER COLUMN id_estatus_miembro_comunidad SET DEFAULT nextval('estatus_miembro_id_estatus_miembro_seq'::regclass);
 e   ALTER TABLE public.estatus_miembro_comunidad ALTER COLUMN id_estatus_miembro_comunidad DROP DEFAULT;
       public       postgres    false    1714    1713            (           2604    16726    id_estatus_necesidad    DEFAULT     �   ALTER TABLE estatus_necesidad ALTER COLUMN id_estatus_necesidad SET DEFAULT nextval('estatus_necesidad_id_estatus_necesidad_seq'::regclass);
 U   ALTER TABLE public.estatus_necesidad ALTER COLUMN id_estatus_necesidad DROP DEFAULT;
       public       postgres    false    1717    1716            )           2604    16727    id_estatus_pregunta    DEFAULT     �   ALTER TABLE estatus_pregunta ALTER COLUMN id_estatus_pregunta SET DEFAULT nextval('estatus_pregunta_id_estatus_pregunta_seq'::regclass);
 S   ALTER TABLE public.estatus_pregunta ALTER COLUMN id_estatus_pregunta DROP DEFAULT;
       public       postgres    false    1719    1718            *           2604    16728    id_estatus_reporte_abuso    DEFAULT     �   ALTER TABLE estatus_reporte_abuso ALTER COLUMN id_estatus_reporte_abuso SET DEFAULT nextval('estatus_reporte_abuso_id_estatus_reporte_abuso_seq'::regclass);
 ]   ALTER TABLE public.estatus_reporte_abuso ALTER COLUMN id_estatus_reporte_abuso DROP DEFAULT;
       public       postgres    false    1722    1721            +           2604    16729    id_estatus_seguidor    DEFAULT     �   ALTER TABLE estatus_seguidor ALTER COLUMN id_estatus_seguidor SET DEFAULT nextval('estatus_seguidor_id_estatus_seguidor_seq'::regclass);
 S   ALTER TABLE public.estatus_seguidor ALTER COLUMN id_estatus_seguidor DROP DEFAULT;
       public       postgres    false    1724    1723            ,           2604    16730    id_estatus_ticket_registro    DEFAULT     �   ALTER TABLE estatus_ticket_registro ALTER COLUMN id_estatus_ticket_registro SET DEFAULT nextval('estatus_ticket_registro_id_estatus_ticket_registro_seq'::regclass);
 a   ALTER TABLE public.estatus_ticket_registro ALTER COLUMN id_estatus_ticket_registro DROP DEFAULT;
       public       postgres    false    1726    1725            -           2604    16731    id_estatus_usuario    DEFAULT     �   ALTER TABLE estatus_usuario ALTER COLUMN id_estatus_usuario SET DEFAULT nextval('estatus_usuario_id_estatus_usuario_seq'::regclass);
 Q   ALTER TABLE public.estatus_usuario ALTER COLUMN id_estatus_usuario DROP DEFAULT;
       public       postgres    false    1728    1727            I           2604    18177    id_frase    DEFAULT     ]   ALTER TABLE frase ALTER COLUMN id_frase SET DEFAULT nextval('frase_id_frase_seq'::regclass);
 =   ALTER TABLE public.frase ALTER COLUMN id_frase DROP DEFAULT;
       public       postgres    false    1789    1788            .           2604    16732    id_idea    DEFAULT     Y   ALTER TABLE idea ALTER COLUMN id_idea SET DEFAULT nextval('idea_id_idea_seq'::regclass);
 ;   ALTER TABLE public.idea ALTER COLUMN id_idea DROP DEFAULT;
       public       postgres    false    1731    1730            /           2604    16733 	   id_imagen    DEFAULT     a   ALTER TABLE imagen ALTER COLUMN id_imagen SET DEFAULT nextval('imagen_id_imagen_seq'::regclass);
 ?   ALTER TABLE public.imagen ALTER COLUMN id_imagen DROP DEFAULT;
       public       postgres    false    1733    1732            0           2604    16734    id_institucion    DEFAULT     u   ALTER TABLE institucion ALTER COLUMN id_institucion SET DEFAULT nextval('institucion_id_institucion_seq'::regclass);
 I   ALTER TABLE public.institucion ALTER COLUMN id_institucion DROP DEFAULT;
       public       postgres    false    1735    1734            1           2604    16735    id_justificacion    DEFAULT     }   ALTER TABLE justificacion ALTER COLUMN id_justificacion SET DEFAULT nextval('justificacion_id_justificacion_seq'::regclass);
 M   ALTER TABLE public.justificacion ALTER COLUMN id_justificacion DROP DEFAULT;
       public       postgres    false    1739    1738            2           2604    16736    id_lugar    DEFAULT     ]   ALTER TABLE lugar ALTER COLUMN id_lugar SET DEFAULT nextval('lugar_id_lugar_seq'::regclass);
 =   ALTER TABLE public.lugar ALTER COLUMN id_lugar DROP DEFAULT;
       public       postgres    false    1742    1741            3           2604    16737    id_necesidad    DEFAULT     m   ALTER TABLE necesidad ALTER COLUMN id_necesidad SET DEFAULT nextval('necesidad_id_necesidad_seq'::regclass);
 E   ALTER TABLE public.necesidad ALTER COLUMN id_necesidad DROP DEFAULT;
       public       postgres    false    1745    1744            4           2604    16738    id_objetivo_especifico    DEFAULT     �   ALTER TABLE objetivo_especifico ALTER COLUMN id_objetivo_especifico SET DEFAULT nextval('objetivo_especifico_id_objetivo_especifico_seq'::regclass);
 Y   ALTER TABLE public.objetivo_especifico ALTER COLUMN id_objetivo_especifico DROP DEFAULT;
       public       postgres    false    1747    1746            5           2604    16739    id_objetivo_general    DEFAULT     �   ALTER TABLE objetivo_general ALTER COLUMN id_objetivo_general SET DEFAULT nextval('objetivo_general_id_objetivo_general_seq'::regclass);
 S   ALTER TABLE public.objetivo_general ALTER COLUMN id_objetivo_general DROP DEFAULT;
       public       postgres    false    1749    1748            6           2604    16740    id_pregunta    DEFAULT     i   ALTER TABLE pregunta ALTER COLUMN id_pregunta SET DEFAULT nextval('pregunta_id_pregunta_seq'::regclass);
 C   ALTER TABLE public.pregunta ALTER COLUMN id_pregunta DROP DEFAULT;
       public       postgres    false    1752    1751            7           2604    16741    id_reporte_abuso    DEFAULT     }   ALTER TABLE reporte_abuso ALTER COLUMN id_reporte_abuso SET DEFAULT nextval('reporte_abuso_id_reporte_abuso_seq'::regclass);
 M   ALTER TABLE public.reporte_abuso ALTER COLUMN id_reporte_abuso DROP DEFAULT;
       public       postgres    false    1754    1753            8           2604    16742    id_rol    DEFAULT     U   ALTER TABLE rol ALTER COLUMN id_rol SET DEFAULT nextval('rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public       postgres    false    1756    1755            9           2604    16743    id_ticket_registro    DEFAULT     �   ALTER TABLE ticket_registro ALTER COLUMN id_ticket_registro SET DEFAULT nextval('ticket_registro_id_ticket_registro_seq'::regclass);
 Q   ALTER TABLE public.ticket_registro ALTER COLUMN id_ticket_registro DROP DEFAULT;
       public       postgres    false    1759    1758            ;           2604    16744    id_tipo_aviso    DEFAULT     q   ALTER TABLE tipo_aviso ALTER COLUMN id_tipo_aviso SET DEFAULT nextval('tipo_aviso_id_tipo_aviso_seq'::regclass);
 G   ALTER TABLE public.tipo_aviso ALTER COLUMN id_tipo_aviso DROP DEFAULT;
       public       postgres    false    1761    1760            <           2604    16745    id_tipo_bitacora    DEFAULT     }   ALTER TABLE tipo_bitacora ALTER COLUMN id_tipo_bitacora SET DEFAULT nextval('tipo_bitacora_id_tipo_bitacora_seq'::regclass);
 M   ALTER TABLE public.tipo_bitacora ALTER COLUMN id_tipo_bitacora DROP DEFAULT;
       public       postgres    false    1763    1762            =           2604    16746    id_tipo_contacto_usuario    DEFAULT     �   ALTER TABLE tipo_contacto_usuario ALTER COLUMN id_tipo_contacto_usuario SET DEFAULT nextval('tipo_contacto_usuario_id_tipo_contacto_usuario_seq'::regclass);
 ]   ALTER TABLE public.tipo_contacto_usuario ALTER COLUMN id_tipo_contacto_usuario DROP DEFAULT;
       public       postgres    false    1765    1764            >           2604    16747    id_tipo_critica    DEFAULT     y   ALTER TABLE tipo_critica ALTER COLUMN id_tipo_critica SET DEFAULT nextval('tipo_critica_id_tipo_critica_seq'::regclass);
 K   ALTER TABLE public.tipo_critica ALTER COLUMN id_tipo_critica DROP DEFAULT;
       public       postgres    false    1767    1766            ?           2604    16748    id_tipo_envio    DEFAULT     q   ALTER TABLE tipo_envio ALTER COLUMN id_tipo_envio SET DEFAULT nextval('tipo_envio_id_tipo_envio_seq'::regclass);
 G   ALTER TABLE public.tipo_envio ALTER COLUMN id_tipo_envio DROP DEFAULT;
       public       postgres    false    1769    1768            @           2604    16749    id_tipo_idea    DEFAULT     m   ALTER TABLE tipo_idea ALTER COLUMN id_tipo_idea SET DEFAULT nextval('tipo_idea_id_tipo_idea_seq'::regclass);
 E   ALTER TABLE public.tipo_idea ALTER COLUMN id_tipo_idea DROP DEFAULT;
       public       postgres    false    1771    1770            A           2604    16750    id_tipo_lugar    DEFAULT     q   ALTER TABLE tipo_lugar ALTER COLUMN id_tipo_lugar SET DEFAULT nextval('tipo_lugar_id_tipo_lugar_seq'::regclass);
 G   ALTER TABLE public.tipo_lugar ALTER COLUMN id_tipo_lugar DROP DEFAULT;
       public       postgres    false    1773    1772            B           2604    16751    id_tipo_reporte_abuso    DEFAULT     �   ALTER TABLE tipo_reporte_abuso ALTER COLUMN id_tipo_reporte_abuso SET DEFAULT nextval('tipo_reporte_abuso_id_tipo_reporte_abuso_seq'::regclass);
 W   ALTER TABLE public.tipo_reporte_abuso ALTER COLUMN id_tipo_reporte_abuso DROP DEFAULT;
       public       postgres    false    1775    1774            C           2604    16752    id_tipo_ticket_registro    DEFAULT     �   ALTER TABLE tipo_ticket_registro ALTER COLUMN id_tipo_ticket_registro SET DEFAULT nextval('tipo_ticket_registro_id_tipo_ticket_registro_seq'::regclass);
 [   ALTER TABLE public.tipo_ticket_registro ALTER COLUMN id_tipo_ticket_registro DROP DEFAULT;
       public       postgres    false    1777    1776            D           2604    16753    id_tipo_visita    DEFAULT     u   ALTER TABLE tipo_visita ALTER COLUMN id_tipo_visita SET DEFAULT nextval('tipo_visita_id_tipo_visita_seq'::regclass);
 I   ALTER TABLE public.tipo_visita ALTER COLUMN id_tipo_visita DROP DEFAULT;
       public       postgres    false    1779    1778            G           2604    17728    id_tipo_vista    DEFAULT     q   ALTER TABLE tipo_vista ALTER COLUMN id_tipo_vista SET DEFAULT nextval('tipo_vista_id_tipo_vista_seq'::regclass);
 G   ALTER TABLE public.tipo_vista ALTER COLUMN id_tipo_vista DROP DEFAULT;
       public       postgres    false    1787    1784            E           2604    16754 
   id_usuario    DEFAULT     e   ALTER TABLE usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    1781    1780            F           2604    16755 	   id_visita    DEFAULT     a   ALTER TABLE visita ALTER COLUMN id_visita SET DEFAULT nextval('visita_id_visita_seq'::regclass);
 ?   ALTER TABLE public.visita ALTER COLUMN id_visita DROP DEFAULT;
       public       postgres    false    1783    1782            H           2604    17722    id_vista    DEFAULT     ]   ALTER TABLE vista ALTER COLUMN id_vista SET DEFAULT nextval('vista_id_vista_seq'::regclass);
 =   ALTER TABLE public.vista ALTER COLUMN id_vista DROP DEFAULT;
       public       postgres    false    1786    1785            	          0    16393    accion_reporte_abuso 
   TABLE DATA                  COPY accion_reporte_abuso (id_accion_reporte_abuso, nombre_accion_reporte_abuso, descripcion_accion_reporte_abuso) FROM stdin;
    public       postgres    false    1675   �      	          0    16398    aviso 
   TABLE DATA               �   COPY aviso (id_aviso, texto_aviso, fecha_creacion_aviso, tipo_aviso_id, estatus_aviso_id, idea_id, usuario_id, pregunta_id, bitacora_id, canica_id, reporte_abuso_id, ticket_registro_id, envio_id) FROM stdin;
    public       postgres    false    1677   �      	          0    16403    bitacora 
   TABLE DATA               �   COPY bitacora (id_bitacora, usuario_id, idea_id, titulo_bitacora, descripcion_bitacora, tipo_bitacora_id, fecha_bitacora, estatus_bitacora_id) FROM stdin;
    public       postgres    false    1679   L       	          0    16411    canica 
   TABLE DATA               c   COPY canica (id_canica, necesidad_id, usuario_id, fecha_canica, texto_aportado_canica) FROM stdin;
    public       postgres    false    1681   �&      !	          0    16416    clasificacion_idea 
   TABLE DATA               <   COPY clasificacion_idea (idea_id, tipo_idea_id) FROM stdin;
    public       postgres    false    1683   W*      "	          0    16419    como_lograrlo 
   TABLE DATA               k   COPY como_lograrlo (id_como_lograrlo, descripcion_como_lograrlo, fecha_como_lograrlo, idea_id) FROM stdin;
    public       postgres    false    1684   �+      #	          0    16427 	   comunidad 
   TABLE DATA               {   COPY comunidad (id_comunidad, nombre_comunidad, descripcion_comunidad, estatus_comunidad_id, titulo_comunidad) FROM stdin;
    public       postgres    false    1686   /      $	          0    16433    configuracion_usuario 
   TABLE DATA               �   COPY configuracion_usuario (id_configuracion_usuario, envio_de_correos, aviso_preguntas, aviso_bitacoras, aviso_participaciones, aviso_ideas, aviso_seguidores, aviso_nuevo_lugar, almacenar_posicion_geografica) FROM stdin;
    public       postgres    false    1687   �1      %	          0    16438    contacto_usuario 
   TABLE DATA               �   COPY contacto_usuario (id_contacto_usuario, usuario_id, texto_contacto_usuario, tipo_contacto_usuario_id, texto_complementario1, texto_complementario2, texto_complementario3) FROM stdin;
    public       postgres    false    1689   .2      &	          0    16446    critica 
   TABLE DATA               u   COPY critica (id_critica, texto_critica, tipo_critica_id, usuario_id, fecha_critica, estatus_critica_id) FROM stdin;
    public       postgres    false    1691   k3      '	          0    16451    envio 
   TABLE DATA               
  COPY envio (id_envio, fecha_registro_envio, fecha_envio_envio, numero_intentos_envio, estatus_envio_id, tipo_envio_id, comunidad_id, idea_id, bitacora_id, pregunta_id, usuario_id, canica_id, reporte_abuso_id, ticket_registro_id, aviso_id, invitacion_id) FROM stdin;
    public       postgres    false    1693   c8      (	          0    16456    estatus_aviso 
   TABLE DATA               b   COPY estatus_aviso (id_estatus_aviso, nombre_estatus_aviso, definicion_estatus_aviso) FROM stdin;
    public       postgres    false    1695   E      )	          0    16461    estatus_ayuda_monetaria 
   TABLE DATA               �   COPY estatus_ayuda_monetaria (id_estatus_ayuda_monetaria, nombre_estatus_ayuda_monetaria, definicion_estatus_ayuda_monetaria) FROM stdin;
    public       postgres    false    1697   �E      *	          0    16464    estatus_ayuda_recursos_humanos 
   TABLE DATA               �   COPY estatus_ayuda_recursos_humanos (id_estatus_ayuda_recursos_humanos, nombre_estatus_ayuda_recursos_humanos, definicion_estatus_ayuda_recursos_humanos) FROM stdin;
    public       postgres    false    1698   PF      +	          0    16467    estatus_bitacora 
   TABLE DATA               n   COPY estatus_bitacora (id_estatus_bitacora, nombre_estatus_bitacora, definicion_estatus_bitacora) FROM stdin;
    public       postgres    false    1699   G      ,	          0    16472    estatus_comunidad 
   TABLE DATA               r   COPY estatus_comunidad (id_estatus_comunidad, nombre_estatus_comunidad, definicion_estatus_comunidad) FROM stdin;
    public       postgres    false    1701   �G      -	          0    16477    estatus_critica 
   TABLE DATA               j   COPY estatus_critica (id_estatus_critica, nombre_estatus_critica, definicion_estatus_critica) FROM stdin;
    public       postgres    false    1703   XH      .	          0    16482    estatus_envio 
   TABLE DATA               b   COPY estatus_envio (id_estatus_envio, nombre_estatus_envio, definicion_estatus_envio) FROM stdin;
    public       postgres    false    1705   I      /	          0    16487    estatus_idea 
   TABLE DATA               ^   COPY estatus_idea (id_estatus_idea, nombre_estatus_idea, definicion_estatus_idea) FROM stdin;
    public       postgres    false    1707   �I      0	          0    16492    estatus_integrante 
   TABLE DATA               v   COPY estatus_integrante (id_estatus_integrante, nombre_estatus_integrante, definicion_estatus_integrante) FROM stdin;
    public       postgres    false    1709   �J      1	          0    16497    estatus_invitacion 
   TABLE DATA               w   COPY estatus_invitacion (id_estatus_invitacion, nombre_estatus_invitacion, descripcion_estatus_invitacion) FROM stdin;
    public       postgres    false    1711   �K      2	          0    16502    estatus_miembro_comunidad 
   TABLE DATA               �   COPY estatus_miembro_comunidad (id_estatus_miembro_comunidad, nombre_estatus_miembro_comunidad, definicion_estatus_miembro_comunidad) FROM stdin;
    public       postgres    false    1713   �K      3	          0    16509    estatus_necesidad 
   TABLE DATA               r   COPY estatus_necesidad (id_estatus_necesidad, nombre_estatus_necesidad, definicion_estatus_necesidad) FROM stdin;
    public       postgres    false    1716   EL      4	          0    16514    estatus_pregunta 
   TABLE DATA               n   COPY estatus_pregunta (id_estatus_pregunta, nombre_estatus_pregunta, definicion_estatus_pregunta) FROM stdin;
    public       postgres    false    1718   �L      5	          0    16521    estatus_reporte_abuso 
   TABLE DATA               �   COPY estatus_reporte_abuso (id_estatus_reporte_abuso, nombre_estatus_reporte_abuso, definicion_estatus_reporte_abuso) FROM stdin;
    public       postgres    false    1721   �M      6	          0    16526    estatus_seguidor 
   TABLE DATA               n   COPY estatus_seguidor (id_estatus_seguidor, nombre_estatus_seguidor, definicion_estatus_seguidor) FROM stdin;
    public       postgres    false    1723   hN      7	          0    16531    estatus_ticket_registro 
   TABLE DATA               �   COPY estatus_ticket_registro (id_estatus_ticket_registro, nombre_estatus_ticket_registro, definicion_estatus_ticket_registro) FROM stdin;
    public       postgres    false    1725   �N      8	          0    16536    estatus_usuario 
   TABLE DATA               j   COPY estatus_usuario (id_estatus_usuario, nombre_estatus_usuario, definicion_estatus_usuario) FROM stdin;
    public       postgres    false    1727   iO      X	          0    18155    frase 
   TABLE DATA               �   COPY frase (id_frase, texto_frase, autor_frase, ocupacion_autor_frase, votos_positivos_frase, votos_negativos_frase, calificacion_frase) FROM stdin;
    public       postgres    false    1788   RP      9	          0    16543    idea 
   TABLE DATA                 COPY idea (id_idea, estatus_idea_id, estatus_ayuda_recursos_humanos_id, estatus_ayuda_monetaria_id, titulo_idea, fecha_creacion_idea, resumen_idea, nombre_imagen, usuario_id, votos_positivos_idea, votos_negativos_idea, calificacion_idea, contenido_idea, lugar_id) FROM stdin;
    public       postgres    false    1730   oP      :	          0    16551    imagen 
   TABLE DATA               <   COPY imagen (id_imagen, nombre_imagen, idea_id) FROM stdin;
    public       postgres    false    1732   ��      ;	          0    16556    institucion 
   TABLE DATA               �   COPY institucion (id_institucion, nombre_institucion, descripcion_institucion, url_institucion, nombre_imagen_institucion) FROM stdin;
    public       postgres    false    1734   o�      <	          0    16564 
   integrante 
   TABLE DATA               �   COPY integrante (usuario_id, idea_id, estatus_integrante_id, fecha_inicio_integrante, fecha_fin_integrante, eslider_integrante, calificacion_integrante) FROM stdin;
    public       postgres    false    1736   *�      =	          0    16567 
   invitacion 
   TABLE DATA               �   COPY invitacion (id_invitacion, usuario_invitado_id, usuario_invitante_id, correo_usuario_invitacion, fecha_registro_invitacion, fecha_usuario_registrado_invitacion, texto_invitacion, estatus_invitacion_id, ticket_registro_id) FROM stdin;
    public       postgres    false    1737   b�      >	          0    16570    justificacion 
   TABLE DATA               k   COPY justificacion (id_justificacion, descripcion_justificacion, fecha_justificacion, idea_id) FROM stdin;
    public       postgres    false    1738   �      ?	          0    16580    lugar 
   TABLE DATA               ^   COPY lugar (id_lugar, nombre_lugar, descripcion_lugar, usuario_id, tipo_lugar_id) FROM stdin;
    public       postgres    false    1741   ͐      @	          0    16585    miembro_comunidad 
   TABLE DATA               �   COPY miembro_comunidad (usuario_id, comunidad_id, fecha_inicio_miembro_comunidad, fecha_fin_miembro_comunidad, estatus_miembro_comunidad_id) FROM stdin;
    public       postgres    false    1743   k�      A	          0    16588 	   necesidad 
   TABLE DATA               q   COPY necesidad (id_necesidad, descripcion_necesidad, fecha_necesidad, idea_id, estatus_necesidad_id) FROM stdin;
    public       postgres    false    1744   (�      B	          0    16596    objetivo_especifico 
   TABLE DATA               �   COPY objetivo_especifico (id_objetivo_especifico, descripcion_objetivo_especifico, fecha_objetivo_especifico, idea_id) FROM stdin;
    public       postgres    false    1746   �      C	          0    16601    objetivo_general 
   TABLE DATA               w   COPY objetivo_general (id_objetivo_general, descripcion_objetivo_general, fecha_objetivo_general, idea_id) FROM stdin;
    public       postgres    false    1748   A�      D	          0    16606    permiso 
   TABLE DATA               .   COPY permiso (usuario_id, rol_id) FROM stdin;
    public       postgres    false    1750   _�      E	          0    16609    pregunta 
   TABLE DATA               �   COPY pregunta (id_pregunta, pregunta_pregunta, respuesta_pregunta, usuario_pregunta_id, idea_id, estatus_pregunta_id, fecha_creacion_pregunta, fecha_fin_pregunta, usuario_respuesta_id) FROM stdin;
    public       postgres    false    1751   ��      F	          0    16617    reporte_abuso 
   TABLE DATA               �   COPY reporte_abuso (id_reporte_abuso, nota_reporte_abuso, usuario_id, tipo_reporte_abuso_id, idea_id, fecha_reporte_abuso, estatus_reporte_abuso_id, accion_reporte_abuso_id) FROM stdin;
    public       postgres    false    1753   ��      G	          0    16625    rol 
   TABLE DATA               :   COPY rol (id_rol, nombre_rol, definicion_rol) FROM stdin;
    public       postgres    false    1755   ��      H	          0    16630    seguidor 
   TABLE DATA               p   COPY seguidor (usuario_id, idea_id, estatus_seguidor_id, fecha_inicio_seguidor, fecha_fin_seguidor) FROM stdin;
    public       postgres    false    1757   G�      I	          0    16633    ticket_registro 
   TABLE DATA               �   COPY ticket_registro (id_ticket_registro, usuario_id, fecha_ticket_registro, fecha_ticket_usado, estatus_ticket_registro_id, texto_ticket_registro, tipo_ticket_registro_id) FROM stdin;
    public       postgres    false    1758   ׼      J	          0    16638 
   tipo_aviso 
   TABLE DATA               V   COPY tipo_aviso (id_tipo_aviso, nombre_tipo_aviso, definicion_tipo_aviso) FROM stdin;
    public       postgres    false    1760   ��      K	          0    16647    tipo_bitacora 
   TABLE DATA               b   COPY tipo_bitacora (id_tipo_bitacora, nombre_tipo_bitacora, definicion_tipo_bitacora) FROM stdin;
    public       postgres    false    1762   ��      L	          0    16652    tipo_contacto_usuario 
   TABLE DATA               �   COPY tipo_contacto_usuario (id_tipo_contacto_usuario, nombre_tipo_contacto_usuario, definicion_tipo_contacto_usuario, dato1, dato2, dato3, dato4) FROM stdin;
    public       postgres    false    1764   s�      M	          0    16660    tipo_critica 
   TABLE DATA               ^   COPY tipo_critica (id_tipo_critica, nombre_tipo_critica, definicion_tipo_critica) FROM stdin;
    public       postgres    false    1766   ��      N	          0    16665 
   tipo_envio 
   TABLE DATA               h   COPY tipo_envio (id_tipo_envio, nombre_tipo_envio, definicion_tipo_envio, vista_tipo_envio) FROM stdin;
    public       postgres    false    1768   ��      O	          0    16670 	   tipo_idea 
   TABLE DATA               S   COPY tipo_idea (id_tipo_idea, nombre_tipo_idea, descripcion_tipo_idea) FROM stdin;
    public       postgres    false    1770   5�      P	          0    16675 
   tipo_lugar 
   TABLE DATA               W   COPY tipo_lugar (id_tipo_lugar, nombre_tipo_lugar, descripcion_tipo_lugar) FROM stdin;
    public       postgres    false    1772   B�      Q	          0    16680    tipo_reporte_abuso 
   TABLE DATA               v   COPY tipo_reporte_abuso (id_tipo_reporte_abuso, nombre_tipo_reporte_abuso, definicion_tipo_reporte_abuso) FROM stdin;
    public       postgres    false    1774   y�      R	          0    16685    tipo_ticket_registro 
   TABLE DATA                  COPY tipo_ticket_registro (id_tipo_ticket_registro, nombre_tipo_ticket_registro, descripcion_tipo_ticket_registro) FROM stdin;
    public       postgres    false    1776   &�      S	          0    16690    tipo_visita 
   TABLE DATA               [   COPY tipo_visita (id_tipo_visita, nombre_tipo_visita, descripcion_tipo_visita) FROM stdin;
    public       postgres    false    1778   ��      V	          0    17707 
   tipo_vista 
   TABLE DATA               W   COPY tipo_vista (nombre_tipo_vista, descripcion_tipo_vista, id_tipo_vista) FROM stdin;
    public       postgres    false    1784   �      T	          0    16695    usuario 
   TABLE DATA               I  COPY usuario (id_usuario, nombre_usuario, fecha_ingreso_usuario, institucion_id, fecha_fin_usuario, apellido_paterno_usuario, apellido_materno_usuario, contrasena_usuario, calificacion_usuario, estatus_usuario_id, nick_usuario, nombre_imagen_usuario, sexo_usuario, fecha_nacimiento_usuario, configuracion_usuario_id) FROM stdin;
    public       postgres    false    1780   1�      U	          0    16700    visita 
   TABLE DATA               �   COPY visita (id_visita, fecha_inicio_visita, fecha_fin_visita, direccion_ip_visita, coordenada_geografica_longitud_visita, coordenada_geografica_latitud_visita, usuario_id, tipo_visita_id, idea_id, sesionid, vista_id) FROM stdin;
    public       postgres    false    1782   s�      W	          0    17712    vista 
   TABLE DATA               R   COPY vista (descripcion_vista, nombre_vista, id_vista, tipo_vista_id) FROM stdin;
    public       postgres    false    1785   ��      K           2606    16759    pk_accion_reporte_abuso 
   CONSTRAINT     x   ALTER TABLE ONLY accion_reporte_abuso
    ADD CONSTRAINT pk_accion_reporte_abuso PRIMARY KEY (id_accion_reporte_abuso);
 V   ALTER TABLE ONLY public.accion_reporte_abuso DROP CONSTRAINT pk_accion_reporte_abuso;
       public         postgres    false    1675    1675            M           2606    16761    pk_aviso 
   CONSTRAINT     K   ALTER TABLE ONLY aviso
    ADD CONSTRAINT pk_aviso PRIMARY KEY (id_aviso);
 8   ALTER TABLE ONLY public.aviso DROP CONSTRAINT pk_aviso;
       public         postgres    false    1677    1677            O           2606    16763    pk_bitacora 
   CONSTRAINT     T   ALTER TABLE ONLY bitacora
    ADD CONSTRAINT pk_bitacora PRIMARY KEY (id_bitacora);
 >   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT pk_bitacora;
       public         postgres    false    1679    1679            Q           2606    16765 	   pk_canica 
   CONSTRAINT     N   ALTER TABLE ONLY canica
    ADD CONSTRAINT pk_canica PRIMARY KEY (id_canica);
 :   ALTER TABLE ONLY public.canica DROP CONSTRAINT pk_canica;
       public         postgres    false    1681    1681            U           2606    16767    pk_clasifiacion_idea 
   CONSTRAINT     q   ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT pk_clasifiacion_idea PRIMARY KEY (tipo_idea_id, idea_id);
 Q   ALTER TABLE ONLY public.clasificacion_idea DROP CONSTRAINT pk_clasifiacion_idea;
       public         postgres    false    1683    1683    1683            W           2606    16769    pk_como_lograrlo 
   CONSTRAINT     c   ALTER TABLE ONLY como_lograrlo
    ADD CONSTRAINT pk_como_lograrlo PRIMARY KEY (id_como_lograrlo);
 H   ALTER TABLE ONLY public.como_lograrlo DROP CONSTRAINT pk_como_lograrlo;
       public         postgres    false    1684    1684            Y           2606    16771    pk_comunidad 
   CONSTRAINT     W   ALTER TABLE ONLY comunidad
    ADD CONSTRAINT pk_comunidad PRIMARY KEY (id_comunidad);
 @   ALTER TABLE ONLY public.comunidad DROP CONSTRAINT pk_comunidad;
       public         postgres    false    1686    1686            [           2606    16773    pk_configuracion_usuario 
   CONSTRAINT     {   ALTER TABLE ONLY configuracion_usuario
    ADD CONSTRAINT pk_configuracion_usuario PRIMARY KEY (id_configuracion_usuario);
 X   ALTER TABLE ONLY public.configuracion_usuario DROP CONSTRAINT pk_configuracion_usuario;
       public         postgres    false    1687    1687            ]           2606    16775    pk_contacto_usuario 
   CONSTRAINT     l   ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT pk_contacto_usuario PRIMARY KEY (id_contacto_usuario);
 N   ALTER TABLE ONLY public.contacto_usuario DROP CONSTRAINT pk_contacto_usuario;
       public         postgres    false    1689    1689            a           2606    16777 
   pk_critica 
   CONSTRAINT     Q   ALTER TABLE ONLY critica
    ADD CONSTRAINT pk_critica PRIMARY KEY (id_critica);
 <   ALTER TABLE ONLY public.critica DROP CONSTRAINT pk_critica;
       public         postgres    false    1691    1691            c           2606    16779    pk_envio 
   CONSTRAINT     K   ALTER TABLE ONLY envio
    ADD CONSTRAINT pk_envio PRIMARY KEY (id_envio);
 8   ALTER TABLE ONLY public.envio DROP CONSTRAINT pk_envio;
       public         postgres    false    1693    1693            e           2606    16781    pk_estatus_aviso 
   CONSTRAINT     c   ALTER TABLE ONLY estatus_aviso
    ADD CONSTRAINT pk_estatus_aviso PRIMARY KEY (id_estatus_aviso);
 H   ALTER TABLE ONLY public.estatus_aviso DROP CONSTRAINT pk_estatus_aviso;
       public         postgres    false    1695    1695            k           2606    16783    pk_estatus_bitacora 
   CONSTRAINT     l   ALTER TABLE ONLY estatus_bitacora
    ADD CONSTRAINT pk_estatus_bitacora PRIMARY KEY (id_estatus_bitacora);
 N   ALTER TABLE ONLY public.estatus_bitacora DROP CONSTRAINT pk_estatus_bitacora;
       public         postgres    false    1699    1699            m           2606    16785    pk_estatus_comunidad 
   CONSTRAINT     o   ALTER TABLE ONLY estatus_comunidad
    ADD CONSTRAINT pk_estatus_comunidad PRIMARY KEY (id_estatus_comunidad);
 P   ALTER TABLE ONLY public.estatus_comunidad DROP CONSTRAINT pk_estatus_comunidad;
       public         postgres    false    1701    1701            o           2606    16787    pk_estatus_critica 
   CONSTRAINT     i   ALTER TABLE ONLY estatus_critica
    ADD CONSTRAINT pk_estatus_critica PRIMARY KEY (id_estatus_critica);
 L   ALTER TABLE ONLY public.estatus_critica DROP CONSTRAINT pk_estatus_critica;
       public         postgres    false    1703    1703            q           2606    16789    pk_estatus_envio 
   CONSTRAINT     c   ALTER TABLE ONLY estatus_envio
    ADD CONSTRAINT pk_estatus_envio PRIMARY KEY (id_estatus_envio);
 H   ALTER TABLE ONLY public.estatus_envio DROP CONSTRAINT pk_estatus_envio;
       public         postgres    false    1705    1705            s           2606    16791    pk_estatus_idea 
   CONSTRAINT     `   ALTER TABLE ONLY estatus_idea
    ADD CONSTRAINT pk_estatus_idea PRIMARY KEY (id_estatus_idea);
 F   ALTER TABLE ONLY public.estatus_idea DROP CONSTRAINT pk_estatus_idea;
       public         postgres    false    1707    1707            u           2606    16793    pk_estatus_integrante 
   CONSTRAINT     r   ALTER TABLE ONLY estatus_integrante
    ADD CONSTRAINT pk_estatus_integrante PRIMARY KEY (id_estatus_integrante);
 R   ALTER TABLE ONLY public.estatus_integrante DROP CONSTRAINT pk_estatus_integrante;
       public         postgres    false    1709    1709            w           2606    16795    pk_estatus_invitacion 
   CONSTRAINT     r   ALTER TABLE ONLY estatus_invitacion
    ADD CONSTRAINT pk_estatus_invitacion PRIMARY KEY (id_estatus_invitacion);
 R   ALTER TABLE ONLY public.estatus_invitacion DROP CONSTRAINT pk_estatus_invitacion;
       public         postgres    false    1711    1711            y           2606    16797    pk_estatus_miembro_comunidad 
   CONSTRAINT     �   ALTER TABLE ONLY estatus_miembro_comunidad
    ADD CONSTRAINT pk_estatus_miembro_comunidad PRIMARY KEY (id_estatus_miembro_comunidad);
 `   ALTER TABLE ONLY public.estatus_miembro_comunidad DROP CONSTRAINT pk_estatus_miembro_comunidad;
       public         postgres    false    1713    1713            g           2606    16799    pk_estatus_monetario 
   CONSTRAINT     {   ALTER TABLE ONLY estatus_ayuda_monetaria
    ADD CONSTRAINT pk_estatus_monetario PRIMARY KEY (id_estatus_ayuda_monetaria);
 V   ALTER TABLE ONLY public.estatus_ayuda_monetaria DROP CONSTRAINT pk_estatus_monetario;
       public         postgres    false    1697    1697            {           2606    16801    pk_estatus_necesidad 
   CONSTRAINT     o   ALTER TABLE ONLY estatus_necesidad
    ADD CONSTRAINT pk_estatus_necesidad PRIMARY KEY (id_estatus_necesidad);
 P   ALTER TABLE ONLY public.estatus_necesidad DROP CONSTRAINT pk_estatus_necesidad;
       public         postgres    false    1716    1716            }           2606    16803    pk_estatus_pregunta 
   CONSTRAINT     l   ALTER TABLE ONLY estatus_pregunta
    ADD CONSTRAINT pk_estatus_pregunta PRIMARY KEY (id_estatus_pregunta);
 N   ALTER TABLE ONLY public.estatus_pregunta DROP CONSTRAINT pk_estatus_pregunta;
       public         postgres    false    1718    1718            i           2606    16805    pk_estatus_recursos_humanos 
   CONSTRAINT     �   ALTER TABLE ONLY estatus_ayuda_recursos_humanos
    ADD CONSTRAINT pk_estatus_recursos_humanos PRIMARY KEY (id_estatus_ayuda_recursos_humanos);
 d   ALTER TABLE ONLY public.estatus_ayuda_recursos_humanos DROP CONSTRAINT pk_estatus_recursos_humanos;
       public         postgres    false    1698    1698                       2606    16807    pk_estatus_reporte_usuario 
   CONSTRAINT     }   ALTER TABLE ONLY estatus_reporte_abuso
    ADD CONSTRAINT pk_estatus_reporte_usuario PRIMARY KEY (id_estatus_reporte_abuso);
 Z   ALTER TABLE ONLY public.estatus_reporte_abuso DROP CONSTRAINT pk_estatus_reporte_usuario;
       public         postgres    false    1721    1721            �           2606    16809    pk_estatus_seguidor 
   CONSTRAINT     l   ALTER TABLE ONLY estatus_seguidor
    ADD CONSTRAINT pk_estatus_seguidor PRIMARY KEY (id_estatus_seguidor);
 N   ALTER TABLE ONLY public.estatus_seguidor DROP CONSTRAINT pk_estatus_seguidor;
       public         postgres    false    1723    1723            �           2606    16811    pk_estatus_ticket_registro 
   CONSTRAINT     �   ALTER TABLE ONLY estatus_ticket_registro
    ADD CONSTRAINT pk_estatus_ticket_registro PRIMARY KEY (id_estatus_ticket_registro);
 \   ALTER TABLE ONLY public.estatus_ticket_registro DROP CONSTRAINT pk_estatus_ticket_registro;
       public         postgres    false    1725    1725            �           2606    16813    pk_estatus_usuario 
   CONSTRAINT     i   ALTER TABLE ONLY estatus_usuario
    ADD CONSTRAINT pk_estatus_usuario PRIMARY KEY (id_estatus_usuario);
 L   ALTER TABLE ONLY public.estatus_usuario DROP CONSTRAINT pk_estatus_usuario;
       public         postgres    false    1727    1727            �           2606    18185    pk_frase 
   CONSTRAINT     K   ALTER TABLE ONLY frase
    ADD CONSTRAINT pk_frase PRIMARY KEY (id_frase);
 8   ALTER TABLE ONLY public.frase DROP CONSTRAINT pk_frase;
       public         postgres    false    1788    1788            �           2606    16815    pk_idea 
   CONSTRAINT     H   ALTER TABLE ONLY idea
    ADD CONSTRAINT pk_idea PRIMARY KEY (id_idea);
 6   ALTER TABLE ONLY public.idea DROP CONSTRAINT pk_idea;
       public         postgres    false    1730    1730            �           2606    16817 	   pk_imagen 
   CONSTRAINT     N   ALTER TABLE ONLY imagen
    ADD CONSTRAINT pk_imagen PRIMARY KEY (id_imagen);
 :   ALTER TABLE ONLY public.imagen DROP CONSTRAINT pk_imagen;
       public         postgres    false    1732    1732            �           2606    16819    pk_institucion 
   CONSTRAINT     ]   ALTER TABLE ONLY institucion
    ADD CONSTRAINT pk_institucion PRIMARY KEY (id_institucion);
 D   ALTER TABLE ONLY public.institucion DROP CONSTRAINT pk_institucion;
       public         postgres    false    1734    1734            �           2606    16821    pk_integrante 
   CONSTRAINT     `   ALTER TABLE ONLY integrante
    ADD CONSTRAINT pk_integrante PRIMARY KEY (usuario_id, idea_id);
 B   ALTER TABLE ONLY public.integrante DROP CONSTRAINT pk_integrante;
       public         postgres    false    1736    1736    1736            �           2606    16823    pk_invitacion 
   CONSTRAINT     Z   ALTER TABLE ONLY invitacion
    ADD CONSTRAINT pk_invitacion PRIMARY KEY (id_invitacion);
 B   ALTER TABLE ONLY public.invitacion DROP CONSTRAINT pk_invitacion;
       public         postgres    false    1737    1737            �           2606    16825    pk_justificacion 
   CONSTRAINT     c   ALTER TABLE ONLY justificacion
    ADD CONSTRAINT pk_justificacion PRIMARY KEY (id_justificacion);
 H   ALTER TABLE ONLY public.justificacion DROP CONSTRAINT pk_justificacion;
       public         postgres    false    1738    1738            �           2606    16827    pk_lugar 
   CONSTRAINT     K   ALTER TABLE ONLY lugar
    ADD CONSTRAINT pk_lugar PRIMARY KEY (id_lugar);
 8   ALTER TABLE ONLY public.lugar DROP CONSTRAINT pk_lugar;
       public         postgres    false    1741    1741            �           2606    16829    pk_miembro_comunidad 
   CONSTRAINT     s   ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT pk_miembro_comunidad PRIMARY KEY (usuario_id, comunidad_id);
 P   ALTER TABLE ONLY public.miembro_comunidad DROP CONSTRAINT pk_miembro_comunidad;
       public         postgres    false    1743    1743    1743            �           2606    16831    pk_necesidad 
   CONSTRAINT     W   ALTER TABLE ONLY necesidad
    ADD CONSTRAINT pk_necesidad PRIMARY KEY (id_necesidad);
 @   ALTER TABLE ONLY public.necesidad DROP CONSTRAINT pk_necesidad;
       public         postgres    false    1744    1744            �           2606    16833    pk_objetivo_especifico 
   CONSTRAINT     u   ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT pk_objetivo_especifico PRIMARY KEY (id_objetivo_especifico);
 T   ALTER TABLE ONLY public.objetivo_especifico DROP CONSTRAINT pk_objetivo_especifico;
       public         postgres    false    1746    1746            �           2606    16835    pk_objetivo_general 
   CONSTRAINT     l   ALTER TABLE ONLY objetivo_general
    ADD CONSTRAINT pk_objetivo_general PRIMARY KEY (id_objetivo_general);
 N   ALTER TABLE ONLY public.objetivo_general DROP CONSTRAINT pk_objetivo_general;
       public         postgres    false    1748    1748            �           2606    16837 
   pk_permiso 
   CONSTRAINT     Y   ALTER TABLE ONLY permiso
    ADD CONSTRAINT pk_permiso PRIMARY KEY (usuario_id, rol_id);
 <   ALTER TABLE ONLY public.permiso DROP CONSTRAINT pk_permiso;
       public         postgres    false    1750    1750    1750            �           2606    16839    pk_pregunta 
   CONSTRAINT     T   ALTER TABLE ONLY pregunta
    ADD CONSTRAINT pk_pregunta PRIMARY KEY (id_pregunta);
 >   ALTER TABLE ONLY public.pregunta DROP CONSTRAINT pk_pregunta;
       public         postgres    false    1751    1751            �           2606    16841    pk_reporte_abuso 
   CONSTRAINT     c   ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT pk_reporte_abuso PRIMARY KEY (id_reporte_abuso);
 H   ALTER TABLE ONLY public.reporte_abuso DROP CONSTRAINT pk_reporte_abuso;
       public         postgres    false    1753    1753            �           2606    16843    pk_rol 
   CONSTRAINT     E   ALTER TABLE ONLY rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);
 4   ALTER TABLE ONLY public.rol DROP CONSTRAINT pk_rol;
       public         postgres    false    1755    1755            �           2606    16845    pk_seguidor 
   CONSTRAINT     \   ALTER TABLE ONLY seguidor
    ADD CONSTRAINT pk_seguidor PRIMARY KEY (usuario_id, idea_id);
 >   ALTER TABLE ONLY public.seguidor DROP CONSTRAINT pk_seguidor;
       public         postgres    false    1757    1757    1757            �           2606    16847    pk_ticket_registro 
   CONSTRAINT     i   ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT pk_ticket_registro PRIMARY KEY (id_ticket_registro);
 L   ALTER TABLE ONLY public.ticket_registro DROP CONSTRAINT pk_ticket_registro;
       public         postgres    false    1758    1758            �           2606    16849    pk_tipo_aviso 
   CONSTRAINT     Z   ALTER TABLE ONLY tipo_aviso
    ADD CONSTRAINT pk_tipo_aviso PRIMARY KEY (id_tipo_aviso);
 B   ALTER TABLE ONLY public.tipo_aviso DROP CONSTRAINT pk_tipo_aviso;
       public         postgres    false    1760    1760            �           2606    16851    pk_tipo_bitacora 
   CONSTRAINT     c   ALTER TABLE ONLY tipo_bitacora
    ADD CONSTRAINT pk_tipo_bitacora PRIMARY KEY (id_tipo_bitacora);
 H   ALTER TABLE ONLY public.tipo_bitacora DROP CONSTRAINT pk_tipo_bitacora;
       public         postgres    false    1762    1762            �           2606    16853    pk_tipo_contacto_usuario 
   CONSTRAINT     {   ALTER TABLE ONLY tipo_contacto_usuario
    ADD CONSTRAINT pk_tipo_contacto_usuario PRIMARY KEY (id_tipo_contacto_usuario);
 X   ALTER TABLE ONLY public.tipo_contacto_usuario DROP CONSTRAINT pk_tipo_contacto_usuario;
       public         postgres    false    1764    1764            �           2606    16855    pk_tipo_critica 
   CONSTRAINT     `   ALTER TABLE ONLY tipo_critica
    ADD CONSTRAINT pk_tipo_critica PRIMARY KEY (id_tipo_critica);
 F   ALTER TABLE ONLY public.tipo_critica DROP CONSTRAINT pk_tipo_critica;
       public         postgres    false    1766    1766            �           2606    16857    pk_tipo_envio 
   CONSTRAINT     Z   ALTER TABLE ONLY tipo_envio
    ADD CONSTRAINT pk_tipo_envio PRIMARY KEY (id_tipo_envio);
 B   ALTER TABLE ONLY public.tipo_envio DROP CONSTRAINT pk_tipo_envio;
       public         postgres    false    1768    1768            �           2606    16859    pk_tipo_idea 
   CONSTRAINT     W   ALTER TABLE ONLY tipo_idea
    ADD CONSTRAINT pk_tipo_idea PRIMARY KEY (id_tipo_idea);
 @   ALTER TABLE ONLY public.tipo_idea DROP CONSTRAINT pk_tipo_idea;
       public         postgres    false    1770    1770            �           2606    16861    pk_tipo_lugar 
   CONSTRAINT     Z   ALTER TABLE ONLY tipo_lugar
    ADD CONSTRAINT pk_tipo_lugar PRIMARY KEY (id_tipo_lugar);
 B   ALTER TABLE ONLY public.tipo_lugar DROP CONSTRAINT pk_tipo_lugar;
       public         postgres    false    1772    1772            �           2606    16863    pk_tipo_reporte_abuso 
   CONSTRAINT     r   ALTER TABLE ONLY tipo_reporte_abuso
    ADD CONSTRAINT pk_tipo_reporte_abuso PRIMARY KEY (id_tipo_reporte_abuso);
 R   ALTER TABLE ONLY public.tipo_reporte_abuso DROP CONSTRAINT pk_tipo_reporte_abuso;
       public         postgres    false    1774    1774            �           2606    16865    pk_tipo_ticket_registro 
   CONSTRAINT     x   ALTER TABLE ONLY tipo_ticket_registro
    ADD CONSTRAINT pk_tipo_ticket_registro PRIMARY KEY (id_tipo_ticket_registro);
 V   ALTER TABLE ONLY public.tipo_ticket_registro DROP CONSTRAINT pk_tipo_ticket_registro;
       public         postgres    false    1776    1776            �           2606    16867    pk_tipo_visita 
   CONSTRAINT     ]   ALTER TABLE ONLY tipo_visita
    ADD CONSTRAINT pk_tipo_visita PRIMARY KEY (id_tipo_visita);
 D   ALTER TABLE ONLY public.tipo_visita DROP CONSTRAINT pk_tipo_visita;
       public         postgres    false    1778    1778            �           2606    17733    pk_tipo_vista 
   CONSTRAINT     Z   ALTER TABLE ONLY tipo_vista
    ADD CONSTRAINT pk_tipo_vista PRIMARY KEY (id_tipo_vista);
 B   ALTER TABLE ONLY public.tipo_vista DROP CONSTRAINT pk_tipo_vista;
       public         postgres    false    1784    1784            �           2606    16869 	   pk_visita 
   CONSTRAINT     N   ALTER TABLE ONLY visita
    ADD CONSTRAINT pk_visita PRIMARY KEY (id_visita);
 :   ALTER TABLE ONLY public.visita DROP CONSTRAINT pk_visita;
       public         postgres    false    1782    1782            �           2606    17735    pk_vista 
   CONSTRAINT     K   ALTER TABLE ONLY vista
    ADD CONSTRAINT pk_vista PRIMARY KEY (id_vista);
 8   ALTER TABLE ONLY public.vista DROP CONSTRAINT pk_vista;
       public         postgres    false    1785    1785            _           2606    16871 -   unique_contacto_usuario_tipo_contacto_usuario 
   CONSTRAINT     �   ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT unique_contacto_usuario_tipo_contacto_usuario UNIQUE (texto_contacto_usuario, tipo_contacto_usuario_id);
 h   ALTER TABLE ONLY public.contacto_usuario DROP CONSTRAINT unique_contacto_usuario_tipo_contacto_usuario;
       public         postgres    false    1689    1689    1689            S           2606    16873    unique_usuario_necesidad 
   CONSTRAINT     g   ALTER TABLE ONLY canica
    ADD CONSTRAINT unique_usuario_necesidad UNIQUE (necesidad_id, usuario_id);
 I   ALTER TABLE ONLY public.canica DROP CONSTRAINT unique_usuario_necesidad;
       public         postgres    false    1681    1681    1681            7           0    0 -   CONSTRAINT unique_usuario_necesidad ON canica    COMMENT     �   COMMENT ON CONSTRAINT unique_usuario_necesidad ON canica IS 'Constraint que solo permitirá que un usuario participe solo una vez en una necesidad. Estos dos campos debieron de ser el id de la tabla.';
            public       postgres    false    2131            �           2606    16875    usuario_nick_usuario_key 
   CONSTRAINT     \   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_nick_usuario_key UNIQUE (nick_usuario);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_nick_usuario_key;
       public         postgres    false    1780    1780            �           2606    16877    usuario_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    1780    1780            �           2606    16878 #   comunidad_estatus_comunidad_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY comunidad
    ADD CONSTRAINT comunidad_estatus_comunidad_id_fkey FOREIGN KEY (estatus_comunidad_id) REFERENCES estatus_comunidad(id_estatus_comunidad);
 W   ALTER TABLE ONLY public.comunidad DROP CONSTRAINT comunidad_estatus_comunidad_id_fkey;
       public       postgres    false    1686    2156    1701            �           2606    17173    fk_aviso_bitacora    FK CONSTRAINT     x   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_bitacora FOREIGN KEY (bitacora_id) REFERENCES bitacora(id_bitacora);
 A   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_bitacora;
       public       postgres    false    1677    2126    1679            �           2606    17178    fk_aviso_canica    FK CONSTRAINT     p   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_canica FOREIGN KEY (canica_id) REFERENCES canica(id_canica);
 ?   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_canica;
       public       postgres    false    1681    1677    2128            �           2606    17183    fk_aviso_envio    FK CONSTRAINT     l   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_envio FOREIGN KEY (envio_id) REFERENCES envio(id_envio);
 >   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_envio;
       public       postgres    false    1677    2146    1693            �           2606    17188    fk_aviso_estatus_aviso    FK CONSTRAINT     �   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_estatus_aviso FOREIGN KEY (estatus_aviso_id) REFERENCES estatus_aviso(id_estatus_aviso);
 F   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_estatus_aviso;
       public       postgres    false    1695    1677    2148            �           2606    17193    fk_aviso_idea    FK CONSTRAINT     h   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 =   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_idea;
       public       postgres    false    1730    1677    2182            �           2606    17198    fk_aviso_pregunta    FK CONSTRAINT     x   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta);
 A   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_pregunta;
       public       postgres    false    1677    1751    2206            �           2606    17203    fk_aviso_reporte_abuso    FK CONSTRAINT     �   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_reporte_abuso FOREIGN KEY (reporte_abuso_id) REFERENCES reporte_abuso(id_reporte_abuso);
 F   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_reporte_abuso;
       public       postgres    false    1677    1753    2208            �           2606    17208    fk_aviso_ticket_registro    FK CONSTRAINT     �   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_ticket_registro FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);
 H   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_ticket_registro;
       public       postgres    false    1758    2214    1677            �           2606    17213    fk_aviso_tipo_aviso    FK CONSTRAINT     �   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_tipo_aviso FOREIGN KEY (tipo_aviso_id) REFERENCES tipo_aviso(id_tipo_aviso);
 C   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_tipo_aviso;
       public       postgres    false    1677    2216    1760            �           2606    17218    fk_aviso_usuario    FK CONSTRAINT     t   ALTER TABLE ONLY aviso
    ADD CONSTRAINT fk_aviso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 @   ALTER TABLE ONLY public.aviso DROP CONSTRAINT fk_aviso_usuario;
       public       postgres    false    2238    1677    1780            �           2606    17223    fk_bitacora_estatus_bitacora    FK CONSTRAINT     �   ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_estatus_bitacora FOREIGN KEY (estatus_bitacora_id) REFERENCES estatus_bitacora(id_estatus_bitacora);
 O   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT fk_bitacora_estatus_bitacora;
       public       postgres    false    1679    1699    2154            �           2606    17228    fk_bitacora_idea    FK CONSTRAINT     n   ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 C   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT fk_bitacora_idea;
       public       postgres    false    2182    1679    1730            �           2606    17233    fk_bitacora_tipo_bitacora    FK CONSTRAINT     �   ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_tipo_bitacora FOREIGN KEY (tipo_bitacora_id) REFERENCES tipo_bitacora(id_tipo_bitacora);
 L   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT fk_bitacora_tipo_bitacora;
       public       postgres    false    1679    1762    2218            �           2606    17238    fk_bitacora_usuario    FK CONSTRAINT     z   ALTER TABLE ONLY bitacora
    ADD CONSTRAINT fk_bitacora_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 F   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT fk_bitacora_usuario;
       public       postgres    false    1679    1780    2238            �           2606    17243    fk_canica_necesidad    FK CONSTRAINT     ~   ALTER TABLE ONLY canica
    ADD CONSTRAINT fk_canica_necesidad FOREIGN KEY (necesidad_id) REFERENCES necesidad(id_necesidad);
 D   ALTER TABLE ONLY public.canica DROP CONSTRAINT fk_canica_necesidad;
       public       postgres    false    2198    1681    1744            �           2606    17248    fk_clasificacion_idea_idea    FK CONSTRAINT     �   ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT fk_clasificacion_idea_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 W   ALTER TABLE ONLY public.clasificacion_idea DROP CONSTRAINT fk_clasificacion_idea_idea;
       public       postgres    false    1730    1683    2182            �           2606    17253    fk_clasificacion_idea_tipo_idea    FK CONSTRAINT     �   ALTER TABLE ONLY clasificacion_idea
    ADD CONSTRAINT fk_clasificacion_idea_tipo_idea FOREIGN KEY (tipo_idea_id) REFERENCES tipo_idea(id_tipo_idea);
 \   ALTER TABLE ONLY public.clasificacion_idea DROP CONSTRAINT fk_clasificacion_idea_tipo_idea;
       public       postgres    false    1683    2226    1770            �           2606    17258    fk_como_lograrlo_idea    FK CONSTRAINT     x   ALTER TABLE ONLY como_lograrlo
    ADD CONSTRAINT fk_como_lograrlo_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 M   ALTER TABLE ONLY public.como_lograrlo DROP CONSTRAINT fk_como_lograrlo_idea;
       public       postgres    false    1730    2182    1684            �           2606    17263 )   fk_contacto_usuario_tipo_contacto_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT fk_contacto_usuario_tipo_contacto_usuario FOREIGN KEY (tipo_contacto_usuario_id) REFERENCES tipo_contacto_usuario(id_tipo_contacto_usuario);
 d   ALTER TABLE ONLY public.contacto_usuario DROP CONSTRAINT fk_contacto_usuario_tipo_contacto_usuario;
       public       postgres    false    1764    2220    1689            �           2606    17268    fk_contacto_usuario_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY contacto_usuario
    ADD CONSTRAINT fk_contacto_usuario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 V   ALTER TABLE ONLY public.contacto_usuario DROP CONSTRAINT fk_contacto_usuario_usuario;
       public       postgres    false    1780    1689    2238            �           2606    17273    fk_critica_estatus_critica    FK CONSTRAINT     �   ALTER TABLE ONLY critica
    ADD CONSTRAINT fk_critica_estatus_critica FOREIGN KEY (estatus_critica_id) REFERENCES estatus_critica(id_estatus_critica);
 L   ALTER TABLE ONLY public.critica DROP CONSTRAINT fk_critica_estatus_critica;
       public       postgres    false    1691    2158    1703            �           2606    17278    fk_critica_tipo_critica    FK CONSTRAINT     �   ALTER TABLE ONLY critica
    ADD CONSTRAINT fk_critica_tipo_critica FOREIGN KEY (tipo_critica_id) REFERENCES tipo_critica(id_tipo_critica);
 I   ALTER TABLE ONLY public.critica DROP CONSTRAINT fk_critica_tipo_critica;
       public       postgres    false    1766    2222    1691            �           2606    17283    fk_critica_usuario    FK CONSTRAINT     x   ALTER TABLE ONLY critica
    ADD CONSTRAINT fk_critica_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 D   ALTER TABLE ONLY public.critica DROP CONSTRAINT fk_critica_usuario;
       public       postgres    false    2238    1780    1691            �           2606    17288    fk_envio_aviso    FK CONSTRAINT     l   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_aviso FOREIGN KEY (aviso_id) REFERENCES aviso(id_aviso);
 >   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_aviso;
       public       postgres    false    1693    2124    1677            �           2606    17293    fk_envio_bitacora    FK CONSTRAINT     x   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_bitacora FOREIGN KEY (bitacora_id) REFERENCES bitacora(id_bitacora);
 A   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_bitacora;
       public       postgres    false    2126    1693    1679            �           2606    17298    fk_envio_canica    FK CONSTRAINT     p   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_canica FOREIGN KEY (canica_id) REFERENCES canica(id_canica);
 ?   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_canica;
       public       postgres    false    2128    1693    1681            �           2606    17303    fk_envio_comunidad    FK CONSTRAINT     |   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id_comunidad);
 B   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_comunidad;
       public       postgres    false    1693    2136    1686            �           2606    17308    fk_envio_estatus_envio    FK CONSTRAINT     �   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_estatus_envio FOREIGN KEY (estatus_envio_id) REFERENCES estatus_envio(id_estatus_envio);
 F   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_estatus_envio;
       public       postgres    false    2160    1705    1693            �           2606    17313    fk_envio_idea    FK CONSTRAINT     h   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 =   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_idea;
       public       postgres    false    1730    2182    1693            �           2606    17318    fk_envio_invitacion    FK CONSTRAINT     �   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_invitacion FOREIGN KEY (invitacion_id) REFERENCES invitacion(id_invitacion);
 C   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_invitacion;
       public       postgres    false    1737    2190    1693            �           2606    17323    fk_envio_pregunta    FK CONSTRAINT     x   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_pregunta FOREIGN KEY (pregunta_id) REFERENCES pregunta(id_pregunta);
 A   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_pregunta;
       public       postgres    false    1693    2206    1751            �           2606    17328    fk_envio_reporte_abuso    FK CONSTRAINT     �   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_reporte_abuso FOREIGN KEY (reporte_abuso_id) REFERENCES reporte_abuso(id_reporte_abuso);
 F   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_reporte_abuso;
       public       postgres    false    2208    1693    1753            �           2606    17333    fk_envio_ticket_registro    FK CONSTRAINT     �   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_ticket_registro FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);
 H   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_ticket_registro;
       public       postgres    false    1693    2214    1758            �           2606    17338    fk_envio_tipo_envio    FK CONSTRAINT     �   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_tipo_envio FOREIGN KEY (tipo_envio_id) REFERENCES tipo_envio(id_tipo_envio);
 C   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_tipo_envio;
       public       postgres    false    1693    2224    1768            �           2606    17343    fk_envio_usuario    FK CONSTRAINT     t   ALTER TABLE ONLY envio
    ADD CONSTRAINT fk_envio_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 @   ALTER TABLE ONLY public.envio DROP CONSTRAINT fk_envio_usuario;
       public       postgres    false    1693    1780    2238            �           2606    17348    fk_idea_estatus_ayuda_monetaria    FK CONSTRAINT     �   ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_estatus_ayuda_monetaria FOREIGN KEY (estatus_ayuda_monetaria_id) REFERENCES estatus_ayuda_monetaria(id_estatus_ayuda_monetaria);
 N   ALTER TABLE ONLY public.idea DROP CONSTRAINT fk_idea_estatus_ayuda_monetaria;
       public       postgres    false    1697    2150    1730            �           2606    17353 &   fk_idea_estatus_ayuda_recursos_humanos    FK CONSTRAINT     �   ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_estatus_ayuda_recursos_humanos FOREIGN KEY (estatus_ayuda_recursos_humanos_id) REFERENCES estatus_ayuda_recursos_humanos(id_estatus_ayuda_recursos_humanos);
 U   ALTER TABLE ONLY public.idea DROP CONSTRAINT fk_idea_estatus_ayuda_recursos_humanos;
       public       postgres    false    1730    1698    2152            �           2606    17358    fk_idea_estatus_idea    FK CONSTRAINT     �   ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_estatus_idea FOREIGN KEY (estatus_idea_id) REFERENCES estatus_idea(id_estatus_idea);
 C   ALTER TABLE ONLY public.idea DROP CONSTRAINT fk_idea_estatus_idea;
       public       postgres    false    1707    2162    1730            �           2606    17363    fk_idea_lugar    FK CONSTRAINT     j   ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_lugar FOREIGN KEY (lugar_id) REFERENCES lugar(id_lugar);
 <   ALTER TABLE ONLY public.idea DROP CONSTRAINT fk_idea_lugar;
       public       postgres    false    2194    1741    1730            �           2606    17368    fk_idea_usuario    FK CONSTRAINT     r   ALTER TABLE ONLY idea
    ADD CONSTRAINT fk_idea_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 >   ALTER TABLE ONLY public.idea DROP CONSTRAINT fk_idea_usuario;
       public       postgres    false    2238    1730    1780            �           2606    17373    fk_imagen_idea    FK CONSTRAINT     j   ALTER TABLE ONLY imagen
    ADD CONSTRAINT fk_imagen_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 ?   ALTER TABLE ONLY public.imagen DROP CONSTRAINT fk_imagen_idea;
       public       postgres    false    1730    1732    2182            �           2606    17378     fk_integrante_estatus_integrante    FK CONSTRAINT     �   ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk_integrante_estatus_integrante FOREIGN KEY (estatus_integrante_id) REFERENCES estatus_integrante(id_estatus_integrante);
 U   ALTER TABLE ONLY public.integrante DROP CONSTRAINT fk_integrante_estatus_integrante;
       public       postgres    false    1709    2164    1736            �           2606    17383    fk_integrante_idea    FK CONSTRAINT     r   ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk_integrante_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 G   ALTER TABLE ONLY public.integrante DROP CONSTRAINT fk_integrante_idea;
       public       postgres    false    1736    2182    1730            �           2606    17388    fk_integrante_usuario    FK CONSTRAINT     ~   ALTER TABLE ONLY integrante
    ADD CONSTRAINT fk_integrante_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 J   ALTER TABLE ONLY public.integrante DROP CONSTRAINT fk_integrante_usuario;
       public       postgres    false    2238    1780    1736            �           2606    17393     fk_invitacion_estatus_invitacion    FK CONSTRAINT     �   ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_estatus_invitacion FOREIGN KEY (estatus_invitacion_id) REFERENCES estatus_invitacion(id_estatus_invitacion);
 U   ALTER TABLE ONLY public.invitacion DROP CONSTRAINT fk_invitacion_estatus_invitacion;
       public       postgres    false    1711    2166    1737            �           2606    17398    fk_invitacion_ticket_registro    FK CONSTRAINT     �   ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_ticket_registro FOREIGN KEY (ticket_registro_id) REFERENCES ticket_registro(id_ticket_registro);
 R   ALTER TABLE ONLY public.invitacion DROP CONSTRAINT fk_invitacion_ticket_registro;
       public       postgres    false    1737    1758    2214            �           2606    17403 &   fk_invitacion_usuario_invitado_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_usuario_invitado_usuario FOREIGN KEY (usuario_invitado_id) REFERENCES usuario(id_usuario);
 [   ALTER TABLE ONLY public.invitacion DROP CONSTRAINT fk_invitacion_usuario_invitado_usuario;
       public       postgres    false    2238    1780    1737            �           2606    17408 '   fk_invitacion_usuario_invitante_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY invitacion
    ADD CONSTRAINT fk_invitacion_usuario_invitante_usuario FOREIGN KEY (usuario_invitante_id) REFERENCES usuario(id_usuario);
 \   ALTER TABLE ONLY public.invitacion DROP CONSTRAINT fk_invitacion_usuario_invitante_usuario;
       public       postgres    false    1737    1780    2238            �           2606    17413    fk_justificacion_idea    FK CONSTRAINT     x   ALTER TABLE ONLY justificacion
    ADD CONSTRAINT fk_justificacion_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 M   ALTER TABLE ONLY public.justificacion DROP CONSTRAINT fk_justificacion_idea;
       public       postgres    false    1738    1730    2182            �           2606    17418    fk_lugar_tipo_lugar    FK CONSTRAINT     �   ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk_lugar_tipo_lugar FOREIGN KEY (tipo_lugar_id) REFERENCES tipo_lugar(id_tipo_lugar);
 C   ALTER TABLE ONLY public.lugar DROP CONSTRAINT fk_lugar_tipo_lugar;
       public       postgres    false    1741    1772    2228            �           2606    17423    fk_lugar_usuario    FK CONSTRAINT     t   ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk_lugar_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 @   ALTER TABLE ONLY public.lugar DROP CONSTRAINT fk_lugar_usuario;
       public       postgres    false    1780    1741    2238            �           2606    17428    fk_miembro_comunidad_comunidad    FK CONSTRAINT     �   ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk_miembro_comunidad_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id_comunidad);
 Z   ALTER TABLE ONLY public.miembro_comunidad DROP CONSTRAINT fk_miembro_comunidad_comunidad;
       public       postgres    false    1743    1686    2136            �           2606    17433 .   fk_miembro_comunidad_estatus_miembro_comunidad    FK CONSTRAINT     �   ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk_miembro_comunidad_estatus_miembro_comunidad FOREIGN KEY (estatus_miembro_comunidad_id) REFERENCES estatus_miembro_comunidad(id_estatus_miembro_comunidad);
 j   ALTER TABLE ONLY public.miembro_comunidad DROP CONSTRAINT fk_miembro_comunidad_estatus_miembro_comunidad;
       public       postgres    false    1743    1713    2168            �           2606    17438    fk_miembro_comunidad_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY miembro_comunidad
    ADD CONSTRAINT fk_miembro_comunidad_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 X   ALTER TABLE ONLY public.miembro_comunidad DROP CONSTRAINT fk_miembro_comunidad_usuario;
       public       postgres    false    1743    1780    2238             	           2606    17443    fk_necesidad_estatus_necesidad    FK CONSTRAINT     �   ALTER TABLE ONLY necesidad
    ADD CONSTRAINT fk_necesidad_estatus_necesidad FOREIGN KEY (estatus_necesidad_id) REFERENCES estatus_necesidad(id_estatus_necesidad);
 R   ALTER TABLE ONLY public.necesidad DROP CONSTRAINT fk_necesidad_estatus_necesidad;
       public       postgres    false    1744    1716    2170            	           2606    17448    fk_necesidad_idea    FK CONSTRAINT     p   ALTER TABLE ONLY necesidad
    ADD CONSTRAINT fk_necesidad_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 E   ALTER TABLE ONLY public.necesidad DROP CONSTRAINT fk_necesidad_idea;
       public       postgres    false    1744    1730    2182            �           2606    17453    fk_necesidad_usuario    FK CONSTRAINT     y   ALTER TABLE ONLY canica
    ADD CONSTRAINT fk_necesidad_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 E   ALTER TABLE ONLY public.canica DROP CONSTRAINT fk_necesidad_usuario;
       public       postgres    false    1681    1780    2238            	           2606    17458    fk_objetivo_especifico_idea    FK CONSTRAINT     �   ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT fk_objetivo_especifico_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 Y   ALTER TABLE ONLY public.objetivo_especifico DROP CONSTRAINT fk_objetivo_especifico_idea;
       public       postgres    false    1746    1730    2182            	           2606    17463    fk_objetivo_general_idea    FK CONSTRAINT     ~   ALTER TABLE ONLY objetivo_general
    ADD CONSTRAINT fk_objetivo_general_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 S   ALTER TABLE ONLY public.objetivo_general DROP CONSTRAINT fk_objetivo_general_idea;
       public       postgres    false    1748    1730    2182            	           2606    17468    fk_permiso_rol    FK CONSTRAINT     h   ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_permiso_rol FOREIGN KEY (rol_id) REFERENCES rol(id_rol);
 @   ALTER TABLE ONLY public.permiso DROP CONSTRAINT fk_permiso_rol;
       public       postgres    false    1750    1755    2210            	           2606    17473    fk_permiso_usuario    FK CONSTRAINT     x   ALTER TABLE ONLY permiso
    ADD CONSTRAINT fk_permiso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 D   ALTER TABLE ONLY public.permiso DROP CONSTRAINT fk_permiso_usuario;
       public       postgres    false    1750    1780    2238            	           2606    17478    fk_pregunta_estatus_pregunta    FK CONSTRAINT     �   ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_estatus_pregunta FOREIGN KEY (estatus_pregunta_id) REFERENCES estatus_pregunta(id_estatus_pregunta);
 O   ALTER TABLE ONLY public.pregunta DROP CONSTRAINT fk_pregunta_estatus_pregunta;
       public       postgres    false    2172    1718    1751            	           2606    17483    fk_pregunta_idea    FK CONSTRAINT     n   ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 C   ALTER TABLE ONLY public.pregunta DROP CONSTRAINT fk_pregunta_idea;
       public       postgres    false    2182    1730    1751            	           2606    17488    fk_pregunta_respuesta_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_respuesta_usuario FOREIGN KEY (usuario_respuesta_id) REFERENCES usuario(id_usuario);
 P   ALTER TABLE ONLY public.pregunta DROP CONSTRAINT fk_pregunta_respuesta_usuario;
       public       postgres    false    1780    1751    2238            		           2606    17493    fk_pregunta_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY pregunta
    ADD CONSTRAINT fk_pregunta_usuario FOREIGN KEY (usuario_pregunta_id) REFERENCES usuario(id_usuario);
 F   ALTER TABLE ONLY public.pregunta DROP CONSTRAINT fk_pregunta_usuario;
       public       postgres    false    1751    2238    1780            
	           2606    17498 %   fk_reporte_abuso_accion_reporte_abuso    FK CONSTRAINT     �   ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_accion_reporte_abuso FOREIGN KEY (accion_reporte_abuso_id) REFERENCES accion_reporte_abuso(id_accion_reporte_abuso);
 ]   ALTER TABLE ONLY public.reporte_abuso DROP CONSTRAINT fk_reporte_abuso_accion_reporte_abuso;
       public       postgres    false    1675    1753    2122            	           2606    17503 &   fk_reporte_abuso_estatus_reporte_abuso    FK CONSTRAINT     �   ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_estatus_reporte_abuso FOREIGN KEY (estatus_reporte_abuso_id) REFERENCES estatus_reporte_abuso(id_estatus_reporte_abuso);
 ^   ALTER TABLE ONLY public.reporte_abuso DROP CONSTRAINT fk_reporte_abuso_estatus_reporte_abuso;
       public       postgres    false    1753    1721    2174            	           2606    17508    fk_reporte_abuso_idea    FK CONSTRAINT     x   ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 M   ALTER TABLE ONLY public.reporte_abuso DROP CONSTRAINT fk_reporte_abuso_idea;
       public       postgres    false    1753    1730    2182            	           2606    17513 #   fk_reporte_abuso_tipo_reporte_abuso    FK CONSTRAINT     �   ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_tipo_reporte_abuso FOREIGN KEY (tipo_reporte_abuso_id) REFERENCES tipo_reporte_abuso(id_tipo_reporte_abuso);
 [   ALTER TABLE ONLY public.reporte_abuso DROP CONSTRAINT fk_reporte_abuso_tipo_reporte_abuso;
       public       postgres    false    1753    1774    2230            	           2606    17518    fk_reporte_abuso_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY reporte_abuso
    ADD CONSTRAINT fk_reporte_abuso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 P   ALTER TABLE ONLY public.reporte_abuso DROP CONSTRAINT fk_reporte_abuso_usuario;
       public       postgres    false    1753    1780    2238            	           2606    17523    fk_seguidor_estatus_seguidor    FK CONSTRAINT     �   ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor_estatus_seguidor FOREIGN KEY (estatus_seguidor_id) REFERENCES estatus_seguidor(id_estatus_seguidor);
 O   ALTER TABLE ONLY public.seguidor DROP CONSTRAINT fk_seguidor_estatus_seguidor;
       public       postgres    false    1757    1723    2176            	           2606    17528    fk_seguidor_idea    FK CONSTRAINT     n   ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 C   ALTER TABLE ONLY public.seguidor DROP CONSTRAINT fk_seguidor_idea;
       public       postgres    false    1757    1730    2182            	           2606    17533    fk_seguidor_usuario    FK CONSTRAINT     z   ALTER TABLE ONLY seguidor
    ADD CONSTRAINT fk_seguidor_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 F   ALTER TABLE ONLY public.seguidor DROP CONSTRAINT fk_seguidor_usuario;
       public       postgres    false    1757    1780    2238            	           2606    17538 *   fk_ticket_registro_estatus_ticket_registro    FK CONSTRAINT     �   ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk_ticket_registro_estatus_ticket_registro FOREIGN KEY (estatus_ticket_registro_id) REFERENCES estatus_ticket_registro(id_estatus_ticket_registro);
 d   ALTER TABLE ONLY public.ticket_registro DROP CONSTRAINT fk_ticket_registro_estatus_ticket_registro;
       public       postgres    false    1725    1758    2178            	           2606    17543 '   fk_ticket_registro_tipo_ticket_registro    FK CONSTRAINT     �   ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk_ticket_registro_tipo_ticket_registro FOREIGN KEY (tipo_ticket_registro_id) REFERENCES tipo_ticket_registro(id_tipo_ticket_registro);
 a   ALTER TABLE ONLY public.ticket_registro DROP CONSTRAINT fk_ticket_registro_tipo_ticket_registro;
       public       postgres    false    1776    1758    2232            	           2606    17548    fk_ticket_registro_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY ticket_registro
    ADD CONSTRAINT fk_ticket_registro_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 T   ALTER TABLE ONLY public.ticket_registro DROP CONSTRAINT fk_ticket_registro_usuario;
       public       postgres    false    1758    1780    2238            	           2606    17553     fk_usuario_configuracion_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_configuracion_usuario FOREIGN KEY (configuracion_usuario_id) REFERENCES configuracion_usuario(id_configuracion_usuario);
 R   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_usuario_configuracion_usuario;
       public       postgres    false    1780    1687    2138            	           2606    17558    fk_usuario_estatus_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_estatus_usuario FOREIGN KEY (estatus_usuario_id) REFERENCES estatus_usuario(id_estatus_usuario);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_usuario_estatus_usuario;
       public       postgres    false    1727    1780    2180            	           2606    17563    fk_usuario_institucion    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_institucion FOREIGN KEY (institucion_id) REFERENCES institucion(id_institucion);
 H   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_usuario_institucion;
       public       postgres    false    1780    1734    2186            	           2606    18165    fk_visita_idea    FK CONSTRAINT     j   ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_idea FOREIGN KEY (idea_id) REFERENCES idea(id_idea);
 ?   ALTER TABLE ONLY public.visita DROP CONSTRAINT fk_visita_idea;
       public       postgres    false    1782    1730    2182            	           2606    17568    fk_visita_tipo_visita    FK CONSTRAINT     �   ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_tipo_visita FOREIGN KEY (tipo_visita_id) REFERENCES tipo_visita(id_tipo_visita);
 F   ALTER TABLE ONLY public.visita DROP CONSTRAINT fk_visita_tipo_visita;
       public       postgres    false    1778    2234    1782            	           2606    17573    fk_visita_usuario    FK CONSTRAINT     v   ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario);
 B   ALTER TABLE ONLY public.visita DROP CONSTRAINT fk_visita_usuario;
       public       postgres    false    2238    1782    1780            	           2606    18170    fk_visita_vista    FK CONSTRAINT     n   ALTER TABLE ONLY visita
    ADD CONSTRAINT fk_visita_vista FOREIGN KEY (vista_id) REFERENCES vista(id_vista);
 @   ALTER TABLE ONLY public.visita DROP CONSTRAINT fk_visita_vista;
       public       postgres    false    1785    1782    2244            	           2606    18150    fk_vista_tipo_vista    FK CONSTRAINT     �   ALTER TABLE ONLY vista
    ADD CONSTRAINT fk_vista_tipo_vista FOREIGN KEY (tipo_vista_id) REFERENCES tipo_vista(id_tipo_vista);
 C   ALTER TABLE ONLY public.vista DROP CONSTRAINT fk_vista_tipo_vista;
       public       postgres    false    2242    1785    1784            	   �   x��Ͻ�0��:��&��"r4٤C�N�+,9v��2�A:j(��x����Ɏx�̓E�a��m�@M1�k9� ^|��f━�y(��Y2P�Ve��:~�����@�	�թ���қ��x7�阀)��)W���~!�>E��VJ��f�      	   �  x����N�0���S�#�UI۵�.��. !�b:k��%%mA�mx�G؋�n��R���UdY�?���x0��*����iK��/�Aa3��r��� 82�S����֔ھ�'|�T_F}_�HH1��׋#�'�78E�tu�o�Ĳ����#���8��*���t�*�5�%�o-��(���r�*c/[C���ӑ(��1�� '��%�(���8'k� �dڬ���փ�U�)�wA�k\�^\���	x��X��e��Ѹ!9�Zf�'X�|q̨�n��.5��*J�3M0:?�{B�J�ۡ��RL����0�uP��۾�Sr��b<����|��&;a���h>��}��Z�\�VnМ�5�R��;�I_���uE
�$��0kN�q�^��� �w+e      	   8  x��\�n�H�^+OQ�u�`�x�6����A������A�)Q��R����Y�«��f�֋������X��8dȢ����oJ<�&�$���ϯ�2����T"[-�����mU�ɏ��6�B/Dc�K+>z����ƈ:�s���i�ZZ�eV�\��W6�:o��n�-Vg8��g��{R�z��&��4$XI�`E�%�P�oө|9��%Y�R�/�a~H�|��_��9`J9`�,v���rt��tL�$c`�ӱ�%�[e�0�0xi�"Ǳ��q,vVA�޷�ZoC�g�@����r:��,�ś���2��^�J�Ӵ�Hm���:��wM�jB���e�7�3�_�N3݃�z�a8����0|o�%3_F�Ĕ��`��LyG�A���L1��ЩY5za�@���j�(���(�z��k�M����lui�k�6�}&�TO}SY�+|�^��)S l�Ȁ'�.5��.Yq�+��¥�yn.�Mx�l�g�~�3y���������A�ίL�]�m���s���R�"��^,m�ō�u�Rb/(��o�^sі�c�[Q���Y�r �4kɐ�#K�"�?����h����Ϻ6g���<�%fʶ���L�f\%[�4N�d�� s�ʤm����''?�K'g0� Y�%k+[��zeo�#Hj��9��������I�y�j���nI����O��Yؒ�:���85(��:&�bej�H��DJ
!<"BL��]�|sE�ݵ7&m��ffe���_$�ǘQs�&� y&f�#�����x!�̼��?uw��f�`��f�7�v����Bq1�i�<�+�m�K�����̔�b��d�E�.AgE��]���v���*�&T45�N�:�|<@7�̽���-�¸�Φ2�����^߉Ukܡ9�))^���;{�P	hޢ;�ݜ,}hs0�e}Ƿ�{��*~A��|ؠ�7VHOb�X@�X1�'[��(��3�SLp��K�q�����'�J��毿]e�=?�\��P�R�����#����bGG�' �f�ɯ�AN�p:dS���"�7p�}��J�;��� R0��B�/�v4ba��#��x��:/�.�н9�<g�B�ȝX�)��z�M>��|���r�'�r�3����8*1x��x��M���ŁA��4�?�f�7T��9�Wx�W���Q�&x)�R3�*`X���`����o�>�l�g
��gpN�؉I�`HC���8
���!�a܈gr�p�0��aP�= �D�;\t0��1H(2?j1%7��h�ql���[I�`�!�C:�"I7�c�*����q`(C��Yx������g2:�I�T��K�t�|�0"����Fw�9?Im������l�	�V��F���72%T뻪;�I��0�2�����8�=��:�
�������]�Өe��*W�m��W{7�&���[�=�l�_��(Z�;��8_B�PC�$��AeZ�-o��ݣ��#<H���� g*�y�%`Hc��Fx$��1��U��q`(c���~RG��A8��<P�W������g��80"#z�O9��5�Fl��`��,�B=�#�~�y`@1|D����� ��0��7"�;�F0Sj��/�I7�Ч�}���-���
�፜=*���ȗ����#�3oz$~⊋dHq!_��G��W\$C�����K�D�H����z�Jve�[.�Z!T{"��j_g��kʭ��iu�ݺ�L��\���⟓���п�(����;��q=��qJ�H���Y>q���R9�'W�����ZK?xܟ����r���~�k�Rx��9�~K�t��O�|����y��A���ϜV�������X�R��������q0b�M!��aP��`�k%|l�PP����n��8������a(h�ح�ĩ�t*�L@r*J��8VQ��7�o ҍ�#���vPb<d�Y����5v4����5N~��[���)u�Q��e�5W��/g�"G�[QAM�Zwj�̔7*�쥮��}�T�|���H�W䙩��G�\�ƺ��+�9� �J�A�,�Ǭ����.�r㼇��V�o��Ժ���n�����j����ŗ�;h�kL��'�_h��u�B�V�M�K{���j�0#�[ݳ��i��U����䍦9ϫ�++��{��`P��{l�&F4h������[�Ի�ᇇ§��>@^FWbᶔ���N �
Wvծ�T����[��_7����&�M�+���b}��^�ôT�-��ږYã��Ҩ��!��$�z�
�L���V"��<io�;��-��<�.yf	oU�J�W�>??�m�S���Ƞ��Efi�"�my~��t�#ga/�| *�>��	���V믻إt��,���w�sڽe��~�9��T <��iE��D!F�M�Zy?Խ�Ȏ��=!V�BJ7�߁�?�"|��_�[�O��6����:�i��B7]�9+VnAi�ǎ����(}��O2���h�[[�Z\���d\X��g��rs��bCn`�DH�跪�ƛR��p�Bd���#tK�a ��iV�m��Z�1@��/�K������3�M�f�O�C�"��H3z���HJ�w�x�J��[��;���ٵ>����U�n̊K~���7;l���㾏�[nq��"P��V�GK["����]��GL�a�&�FI�d�=�����Y�G([݊�����Y��m�L79�.J����lK.k�Y���F�q9zϵ��xpTÍl��ּ�'�����,�ߟA�	M^U����Ǥ#���3��I��c�U��C
����ۭF.]��Zj!�����DE����T$��dX/�H?5}�4�ہ�x�s�jX1༪�L9���+��͕��%��8,��?�	ƾ��6�d�����Pƾ)�j|�<�r0T�N�VM��I�#��p�ޯ؍v?�-iW8�|��"�=SCC�ZEi@kve�FgTj^��6���Z���+�+��7���z��Υ�`�3��D�/��[����(����0�i�8�hs���M�m$6o��ײq�@�2�x��ι�UϮ#:����}��2u+�eFIl��ۮdb�&徂۞E8��u����g �x��˪��oT�����"W��Og,����t+#�9V�G̵%A s:�6�i=uQdeVs�\� ���D�>�чӾ������:���Dg�c��(0�{����#I�9:�C� ���C�n�#��ap���ȡ2���A۪�U"7F���rr��'"L���46H��FC�O-0�)ͻ�5�h�	墀��<�#y�����=�����+?�9�,�䴿�����y��V����1{(�cBp����m(���?Ӻ<
*nt��_�w�-s�^q�+�k�M��z슒�j��;�[zyѶm�+��O�<�g�<�S���G�jǍp�{�xk�����j�S�*��S�b7 ����De(�����V���K����6�@��0��!�~����V���u��_?�YC�B_��͕�y��<��$��(��L�����u)��aч�)�G��G��d��TH�ƛN	}E�%�JF��#�JI��	�L��D�&)[���l�u���RQs�X�O�t�wlāė�L:ٚW_��������G0v�f�L�Z&�0U_�0�y�<F��a�H�\����`��[�]�Aljb'�f�w��y�a�$�B�|��*���6�eZe��R~���"�����]DB���1(����L����?�(�"[�ۊ:7fEq�AUv�lz!qC=�$^��gd�� <����v��ի�(�V�       	   �  x���M�7��է��!��j�}N����08�v��S�b�
=R��ԛZ�D��J��,i�D�������_ׯ���~��v}�}���������n������������맋zZ�xv���e��n����/��J܁�� 0 �-�4���|  ����EXM8t�=s� ��M�V,�l�`�*���]�QP�`j�vOub(T�(�=~��uPd�,��I�P�L&)��P/�&/W��r~
�@~P"���葢P�^9u�U_h�T�!�$E�<K�
iT�^�Q!��M���f��B�"�oaE[���� �z@E3�Gg��� ���m�'��*vT2�' @���a�?a���;��ȝ�0l�*�)�9Z�pD���|S�]��f��HCHb��{$s���ԧ��~��\)��H���]���K�Ou=�UtiR����m��0����Mk�(^���r�4zRQ�U^���(��h�Adz�D���T𶡰�J�/��+'��� P��š�t�(�5���u�z3��s���n�-b�k�k֎A��_� �74H���5�p{��MJ�8�n�#lW@�G;ak ���N(lf���9 �ܹ�,� �i z�6o��?  检��� ��H�( 󙈯V{@ �;1*% �'v��Y@8�h>
#hX���B݁�����u�s �:l:`4��� J���f� �g�G�������B�A���S��/�BPhPx�2�̻jEQ]y�U1�V�`��V?*��z��  F�ơ\�1�����|�.�K*�0��y>m�E�t�2i8Lq|���nu"�kx;'�Je�6J\�*1y�/�C�T�Aa�h���]�:ÏJ̾���#�BPhT0/{32�A$��?"C�Cӿoԙb�BP�Ha(t��T�F)��,_�pԁv5-�Ǟ����O���?����      !	   L  x�=�A�!��c6@A���߱TU�^:#m��϶=_�X!���=���ϵH� )Lf%S����,�^k����0uw
a2�CRx�-��#Y ��`/k�O� f0���~)�v  �5-\�_� e�]R��X0e˶boy*V�R�(��j�y��<N�/
X2�w� Wr� @�v�b�I�I���F\e/�N�O� \M΀@��@K�l�A"�Y��fDY9��bK�q+]�.�m�aG�L42����iL� B��g�2[�hi����Q��x<d��JĈ��zs����K������uC��*d��l���1�?a̘8      "	   R  x�mTMo7=s�K�6v%ٖ{)�"@{`�i�����.�懊����CEn�������FIj��Ւ��ͼ7l�/��`������g���'��+��?x�XX[��ߑ5ire�!]�)�-�9�ڑ���s�i�+�h��ڦS����޳7��RF����v�=$ә�@�$0�M�39�9�xz�үi����?���):�[WI}���a���f��c�޲��%&�r�od�<��x�瘬!#�j��] ��=^�6|���ą�.ԮO ��^�`>М�J���z�	)�����
�Լ%�Z4K���E}v+(���;�;��M�σ��J�)8���,2G(���n�g/�Qp�q_�C
����G�����Z���J�������ϕ��9~ N�+,u�ܨ�	��x�T�}5�Ȇ��<��
#Uڛ秊�����Ms����!�e~�=�=�#hS.z�,2��������/ѵ�S��Z�����P�+��¸/���v�!V�a��qpf_�Q��d؋�ע�D��B���u�~�1\.綸��"�h�9ΘF�B��m>�Dן|Kn]�Sp���j[PF�)�H���,�ˮU�e�Q66�#��a�S��xT�N��z�ޱ��'��}�Z����I2��a��'i,=��8	'm,E��W��w�u�= �2@����ƂK��4N�R�۞}��ٯ�d-NV։�Zae����co{���=�م=��w�`�3�+u�ID�/�"�ܫ01�A���N�߀�$�R�j��b��� e�=��nѪak��`�Cҧ7j��eۮ[��G�����Z��u��WM�|���      #	   �  x��T�N�0]'_����
CS�dHf��*��8w��v�Ò�~ �̏�:��h�α��9>�ܼ҃�����(����i�mL��)Y@�,҇�iS��a5�Xv��A��5�p�YA��K'Ѱ�*t��`7X<�8��S�=�u�^�.���@��T���R+��L����i��P3���_ң��,��9�s]��<�3Y q�``{��rdV�ڠ*�,�I9Qj˦�p&Id'���
��QP@�&H��h�擨��8��r�M!k3E� �X�URК�-���R?J`�¢�nn��T�O\���͕�葧���C��`��<O�睪��!y@���`Ӧ��%ߝ��
�ZW��e��w~<�� ���`枰�N\��c���n߳��ڧ��~�!8�,��|���(���E�7ה�U.z�^��f����aմM~-QYP�E����R@��� ��|�%ы�\s3�%�Q�PQO}��*�m��VWT��ʄ���@녴�ir�KZ�n/��Μg�I?�E�O���\e�y�a�ZH(�I'݈�}�✺X�M�k�s=��BzȜ��R-��!��ݝ ��4%�Ϛ8�S�b-n�����(��]�'�V�+�Kڦk��V��Y?m~��c����-��}�}lL�VO�Z��~�a��s      $	   S   x�m��	�0�wTL�Ɋ-��2�?~��8X���L��HBȄ,HA6��j1[���r1]l���`}�h0v��ݳ��mf��l�      %	   -  x�u�Kn�0D��aF�ƿݜ '���q����D��ӞA�Ph��T�n>p�b�flC�qY�����U5���p>� a��e���]qN�;Gh <�41
�	�Ɗ�+µCʗ�dE����8JekK����Ú�)]��+�S:�=	hO����0�t���q�˜|�	�ܾ������9b$=�Ԕs�y:�c$�t9����sJ�pdda��2�r݀~�&�g���oy��@k*�uML)�a-�3NS��	
=$�.�"��?z��ݞkH�5�˙WҢ0����n���~���      &	   �  x��V�n�8]3_��$�(?�t�v��E_�`0��k���Ȥ+R�:��b�]���9���a�����!y��2/[m���f���2�Τ�J��\n�b�9�Y#k�k����j����H�Γ��0ɉ��&#o����,	C�s:2z.]3]�W�@��I�K���m��nEuN3��i��%��jY52�Y��Ɠɭ�1��rVY7)?=����x��[�ׁ�m��[u~��ҁ�������Kħ�;�������*��6��������6������I����*��0�Q"�XZWޞ�F�F�yH�,d��7g��ZgYe�8�������id�c�S�ҟ�u�"*�E*޵Y躺E�9j[�!���t��zI�yS����\YW�jM��Y������u�.6I�66M�Ԗ�����8��J�F�M1o#̗��)�"w�T����
̡6��ְ��3?k�w�ʈO�2����n ��ns�Nc��D��K�rc[�hs����Г�����^5��l���QP�y7���&�de�n
�����AlMT�h�:0Ԉb�taa*{ft\�#�=ܛ���^����5X��w�!Z߰��(eY�1�VZ�Sp�c�q +�޲Mux�f	_�l���y���������K��A�޷�5��XXv�@�C3o5\6k;'ŰEu��1�g�`�I"�t䩠���&sK!��8����9--�xdE��Xå忱�j�����Q4ٻ��;;��kϕ�F�<vV�O��uY+ز������F�\������ai�k(�-��mP~f��́j��9�u6��ξ���5Ȑ`���`Y�^����ů��W�n������G�cҀ	8�#��Կ��ۮP�j^Wa�	,Dœ\cd�q��Ү�ׇ�����.~7��O|ƥ�T�"vv��I�<F���K��c���#*���������$W���1ㇰD�:��'>����NT���F��g�E�߳��=$�Ph[�>��w����/�����S���iҁ�HE@����ϱ4X�W�k\3Cu��1>O�iF��C#@�E��m�/>X�*xzsw�n�z�7��u��z�u��)A�t�7
I�ˣ�4�� f��Rhut����eA9/��3�f�ƛu����)�H0�A���v-����ͺ�D/!���6�v�Z8C���䥻Y��j!��a��Ӎc�:���s�_*���,{��s�XY��ɐ�W�)>�P�yԧ�����C�%      '	   �  x���k�$�Fg�e����&�
f����дZ�Q�2�!�Rr���b����������w�n�7�����ͅu���?h��!8�[X���Oe,�qr��re�Q,*3ϕB)2��E��K��W�{�Β�^,y�^#k\y�yz�����"�K�^R����Ӧ�ٛ�
H��+�8��a׍�#�˘��Y�:�Z|	0��-���`C�^��,?r� g�!rV<��6�,_�_89+Ƃ�a/͏���F��x�EUF�I���Γ�����򻦍�,_QT�f]3���|_\щY�"a�����Y�� ��d��
X�;0�w�	.��# �A�tn���t��J�@��b�0��Vh��!�F�R�
�4(嬔@	�VV

���ؽ�;�?[Nyv��Kx��f������C��,u�ߞ���1LF+>?�^�;��Kxo��z>������8�KYa�>z0��ON��4!��I?d!%���_Y#{Q������Z��J���ne�tL7�*QY~��G~}(���d[����AAL��r��D*�r�;��C�-�=P��lZ4J�C��E9r|�>��D�����j����`�ݏ�T䵊�>�#'��a�f��lt���	$%0��b.�J���7��J�S`9�jq����`�a���%EwprA���X����	B3wU����OÎWa��H5�ü��MÈ��Yˤ0�:tQ��ȩ�~8�3��'�Z?Xl�Oa�
��";�E��HEʮf&����b;2,Z^�'Vϲ#Q��E�n�e�B�\4@�AȤ�E# dZ4�WE*2J�^'�H먉�@@ �;K�8NwY;p��:��D���E��\�X�^��Hd�{)��6�9h�[L78d�{b78d�H5A�eU5YE�a\�"�uҳ{V��uG �B"1���} ���LZ�7%�B+�$��D�-2�9	�`�ɤ+�$%7�
HR$�DUe���V���y�����dv�A�n�Y�gwto��o��LoA�K�A��$�N$�@zk94�Z����(@:�=�8בh�2v�4��]���*��h��@]
�n�c w��S]��� ��m �%�q/�+397�(�]{�+��z��B���ƇA��I��Pl�&��8$V���(�Y�J��*X����:dDd�(7�lF��WeNx;��fu]�ݡ���z���Zs翩v"wV0�d�`7omR�U�\��A�]e����w6��D��u~����sk��^J���z�����l4H*�l�`���Ǒ��� ד�k�L*�9�o�l�qP�l�㨪 4��X�8�J��8 +Y&7��W2b��Ҩ�XG�?�P�ZqdB���U��U�Pn֞L�t����!A��<2������`�����Fh�Q�Z�>�38��M9�|c�ó8d�B���3�2���(z?��\"r��£{&�D�ыB$�$�4XWE*2����O?y��!Fa��ku2���<�$ϫc�D�����j�Xm���[��Fy_}��zT��������m���ʋnɱ��	I�y��@&u$z�$��G$��R]���qC��0r��9M�w�����i��0X9�=�۽���$�$�0'���E�|t��,�5� (,/;Xd��_�tN�����`�=�yռOʡ+B7��_�����ݱ�ZEz�Ȏ��"I�iU�"�8�|�ٔ���~'�M���D��&��hI���[*"QhF"�Ql�"5	C%�z�qu�=��K�ֺ�˞D)H�.���Q�>j5�n���~�΋�&3�k�ؼ�X�`YUlGVS��pN���M�u}3o߆[i��ۘ�}�@��kF��JߵO��V���������)o���L}������7��|i,(��	�}1��P��jq(��9�t~���+�Y�D	��D��T${�U�g���ޛ ���	��kfL���������,�!Gٙe9x=����+�z ��$�V8�I��C�z���Fi;��	>>Iʄ6�#��e(��\x(��B�&	��mR���w�� �&���$ѓ��,Q&��j�0�,����s�d��p�m�PC�M��wT)�΂��)���
I�L��l��F�M�`��l���B��%EB��B��5���>��wZV;��mo�e�x�ǻ��!B�܉頩�p�K$�{KdxI�OS�� Ǡ��m�K6�=[�Q�*�ɎA8������	��� �]��I{���S�t�(���2�f45<�c����������	��S"�����FC11Z���c��y�D���o.���\�V����u[�!EG������ɤȽ�,������9W�(��c�^�[
���Y �M&��z��8!����.62���&��l��ZM6a�|��{������-W�:d	����"���/�eA�J�zNF�"�t�ɘ��[�*�d6� $RF�
�E���{�|���-t�Y\
�B��)��*�{��>e6p*����y�#�=�dB]�,A.t|X�/>n��&�̞՗ ��09��&ǀS���o��F��ܷ���v����9�QorH�G�R'��D*.U�۷"�>AʋlG�o����񰱑l�_8Y�C��[�"+{��Z������X-��@Ƽ��E�bc�l\�e6���ʩT�Ƚ���V������} #P������Sգ����$b�%�ih��N�����]t��/��b���DЅք�#�,1|�]U$��ҁ�Z:7���L���
�Kd8e
o�',�����~,/���r�&�ܤ���}eӯ��Z`4`s�Yvi'��2|Ѷ�] �W$٩_J���^?�+�v#��=��]�RW$��&�� }�5'"�l� � L(��Iԓ�z/q&+azV��?M,�J���F�=�g�Wp�-{��Y�\O���5�ZP���Aڏ�d�vb= ѕyO�"�@d�� @(R������@��&�>|\ؚ�9'�X�sp�~�N	��޻'âH��yU�,�'��B���N{�-6.���R�ܖ����sZU��+����.���>�\�2��2e�L��/N��Y<�+���%؝IQ_[�@8���d�S	�M�QϞ������%{I�@^ ݱ��@#��`�{�gRy�9xȑ��Ҝ�����?ך��      (	   s   x�3����qu�t-.I,)-V(,MU(��MT(�SH,�,�WH.M�K�W��W�HT(�2sR�R�E
ť
)��%�y�%�E��z\��>��.��ͫLTH�!����fV� n19$      )	   �   x���M
�0�ur�9A��!V�B#�
� C2bM4?ooE[\�0���ވUk!��N�2&�	S�`���Q�`��<�-�`���u�<DG��M�*��*����'�o��ˍρ6��{���Q���끞2Y��o���{z�Ԣ.�gݟC�����? 5^�V      *	   �   x���K
�0�ur�����@���J��"Ș�4`�c�q\z�^��X����#R������> C D�2xDet��&�`�O�~@ݣvZY&#���W����ɴiଯ:����ɪK~��z��2<2�}*fm�|���M)�nV��)yUHt��H���Ȱ����cF)}�w��      +	   �   x���;�0Dk�{���	I	��f�-��c
��8B.�Z|�;��H��l���+Q��A��1�7�"�	�r`]�N��Eb��#����fAiH�H[籐c���Y{r��o�Dlv�uՔu�f�6�s�]�����^q�!��!�^[E��g/���R��󅜊jQ/����.d>��=��\�W0La,�<�s7b2*�~(��w�3��      ,	   O   x�3���st�s�NU(JM�L-JUHTH.M�K�W(�2�sK�2SSR�K/T��KL.�,K��2�$Q+Lc� �)f      -	   �   x���M
�0���)���7�EA���͈�:��Yx�^�m/f����ax���֪=^��wj�I�GB�1����c�J9��C?g���;!����4Z��C� هS �C�7�Ƌp+k��N��Ӟ�2�~bp��-���K��P4�|$��[A_*��,�s	      .	   �   x�u��
�@��� !����)�e����q�:y�/�IE�\����g�i^m�C��$8[H��h>9bG����4�j�w&���N���Z_�ͩU4{��'��}�Ɖ�x�M*�z�j�dY������W�0~7YP�_h�SKcu��RuqVr      /	     x���MN�0F��)����da�8����Il���v���m.�8(�B��֞���7'Lȼ��9�C�5(Zo�"�qz��݂u4<!`;�T.���WL�)<�2~�V�ղ��(����v����۸��%EZ1��*�p�Pm�5a��3~ΊZ����fp�l���MK �@x�T�5*��a�/��7��ο-R��F�����`�]��_�Jn�R��{����/������������b�B����qF�l��j��7'ٌ?d�����W      0	   �   x����
�0���S����=�j=	�$K��I�����⹗���}�\�u`�m#���W��	(ď`LdB���E�Ł"��.���V�߳�̠�# s"�@6N��[�n�=0�
4���*��|�m2����G&ڮ�7Cߜ&��[z�4'���Jg���U�Vq����y�      1	      x������ � �      2	   u   x���11����<!�k�AT4ƶ���#���_ZJ��b4�t:���-]��$��fR�A>��5��QL˫U���w8�k	7!Y�!��?v^�����}g�`�6~��%�~�;�      3	   f   x�3�tu�t
q�t.M�K�W(�KT�KMN-�LILQ(�L�KUH-.�%��:
��9�ɉ
���
�
@��
ɥI��E%�z\�~�������=... e;	      4	     x���KN�0E��*�
"�s��D%HKBfHիm�Eb��X`L�1�tP�� &�e��s�;#l���##�A�z�& e���A���C� "i�O���!x�^��5RK�PJ��9Y�d��SЌ^�b�e�r�8���:�9La��.ɡ����6��Һ�^VT�Y��&���d#�X��#����/���:~����,�_ޞn̶8����1l�(b�5j,ҠO[h�� �M*���f��<�|N�r�rjR��@N݆�s6�K��QJ� �nإ      5	   |   x�3����q�t��t-.IL�W(,MU(��MT(�S(J-�/*IUHIUHL*-�WH.M����W�HT(�2sR�M��/)J��iLL����,����qr�lEe�BH�\}�58������ �G+      6	   h   x�3���st���t-.IUH-.I,)-V(NU(JM�L-JUHT(�K�r�3o�S��KL.�,KTH�+J��)��&e�+T�Uf��&�qr�h,1���qqq �?>      7	   y   x��̱
�0�9y��	���v�B�[A���Ò��n�魳�n����tnש]_��*VcP\M�0,A%<Y��R�d�3RƃPe��,���m���C�}\�]���/�on��om_TJ      8	   �   x���MN�@F�3��	*�.��,F*IE+$dM�4����=B.��
$*���}���,o��3n{�c%�5WL�r�>}�7=(@�\h@{a\���O���vۦ]��ف�$��$�tPt�	��6���i�y��*��xЈ>��v���}���FC�F,5C����2�_���ĻN$z��4�~�#��mK��?T�Gy�4����ia�����<      X	      x������ � �      9	      x��}KsG���+R��A(��e�R2m�#J�%��7ё�J EUUU �������NK/���]on�����,@P�Z��nM��<��y�Π�n�^�ݘ�#s��i�A���]~ 7:��A�9�&��n��{��15��?v�DG�BdZJ�̥�b�1�E�L�A��kཪ���TRL�bv�~*��g{��
��b����볽B]�i�&�T�F����`�wﮙ�L�b�(������=��I�����L�dqG�~��QNU!N���՟�4�����?�$���TœiqGG��?	�e�a"��l��"��C�.
���S�O��г;���܅�6U�4�7u�~-Qc��LFQ�MjM�+����ڋ<_�R4�~sP]:w��$ژa'h�_�6V������H�4yw��<��)�p���ah��i8�"��w�$?�˟�2�L��ۚv�ݍ�_��<����ů���`�r��E�����A�$��{��Zc��J�ٻ	�[!����"ںe��sc��#J��K�Ħ��{0�&.b��qF_d�v7N�Dm��u��b���f�@�Q��D�-�5(\Dh�g*7}�7�g�'�?��������g{ �wZ-�i�K��5��8N�_�u�
�G���a��k�Z�5�y*�
{B&���ʧJ�,�
j�9{�ӫ���Ѿ�V�_�l��W���������(.�5b���z��Fm�j�rdtR|Qlf��so���eF3��sS�W�h����?W����6��ƛ<����ͷ���?��X�K��~	L��&؊l�l������e��\�S[N�-w�8չ	��>�HW��B���� �&��|���Le���b���0A��t�2.�}Г�:-_6��1u�S�tY��BZZ�<:��R�FB+}�"�Aoo��{o ���'��+����vQ�c���Q� 8�v�.a�{��AL4��ɻ��Ғ��}ۻ�P��!�O1�2��	!�p*,�\?���.E����zz[�,��%}�!+Χqb
~�@*��[.|�sW�\%����L&{���ܵ��Q"��Y�W��A��ŗ����T`�� RD���M�yd��\�U-�m�{w[���ww�ms�7ۜ߈�
:bJ�i��軭M �w����q�;np���7����}��bJ<��PWw��H.hǉ���ӧ��7Mq*#e��b1ӓ\Φ��y���	��%ID8U�\iD9{Wf0o�`���v�1��2�b�����p��^{��8�4�t0��kD��3�>�^%2�'�iE��܍�]���k#TF��nҼ����*��Ǝ�ִE�1a�Ō��T��2��7� oŝZ���c�c;LV*S�l����6`����BT<�괃v��ǿT^�i��h7�aq�R�4v0.�iU����-A�blZ�h�B(�vz_�8���YB8Rʪf�'� �x;pXttS[7�5{*}k��r~ �ͳ���>:�n'����=t���(���Ӯ����������
q�MJe�/���E��Z##F��m#���&�+|�
�\'�-����~�@�q�%mZ�tl��>f�����Đ��?�J�Jʌ	M^*�QYH��x5���N1�isz(NdS<�b"S�L������0�z��PQ�B]�*Qq���bM�f��.��E)�\��n�2[�~���#\�׻����&��Fuҍd�r��o�-��^��T<�����z���錂Qg��DѨ;�t�/Y2����u�[��4�8�~/L��w6S�[+��G�o�q�f�f
��i�u����	�$p#�� ]ɛN��[�$_�S��6�F&F�IP�-�q�N"�Dж���۵>�ޯ�[��c|ށ�y!�Q��9�D�w,��rE��k���s�w�����Rnʍ�^�V��=&���N���bo�X�ˋe��;��j��Vߚ����$���`��Z?���)_�F,-uV(��c���/��7�O�w�S��`������~������F�Zݶ�I<Wg�������w�ml��#Ӭ
c��}L-��m�-fb.����=h�x��n<������X�^���n*?�n�xfoߺ����9�t�n5��Ns�;Z�4�B��M�����P;N:{rT�s_��&ff���:�ހ��ۍ�8�$7�b�ս�O��'�Jj-�8I�)U�Ir�h`��ܵ��7ׇ1h��r���>��+�샍al����]�����VM{����DV�#a��j�����z3D���M����ӓ��@�c��ϫu�V�O�wM*���P�",!!ֻ9.3H��Y�&�2b�ecv.�\Y.L�Z��U&$�fؑ��0�^�UJ�h�m��ݧDڦ��?-����W�8�J+*�r�י������t����c�_A�>���e"��"��{�S����=��۫������U�*��?�����[qax�xHd_X0�À�@C)��"���~��T�Z��5z�2FY�2��`��(�>�v����~�N����@�{��)TFpY��ph���>qB%MN~Џ�ǉt�	#3*��6wibN!��4�Jrg������6��
�T�p�|cû���M����¦^���7�G����>��n�2w�1x�+c�M�� �u,>��(#�kg_/Qɍt;�=oe$��1Bdf��D�t��PV����1�	�$�����L�W���x�k9����~�i}�ߔ1($���W7��׫:�'bJ��h×�#�P0f����� �s���m���n,�24�$� ̘+Z��*���D/�L��8eo�ču'�p��iN �ǘu�(Nq�h�<����XP�Q˿I��==�}��>���$��Bߪ�b���}������������%�Ep�b5WL�G�:�3�ٟ�O �c�*�*�^��G�����D[�I�f�$<'̧�R8B����ww7?ětBܔ�vQ��,v7�����8z���Ƹ�����x�q�=w<{�$�ډ����'u�S�~��6�y��_�Z]�ku]k?��|A��Y�G,>	$�A������ezkc��F�� p
"LPFf*�g/��I�Wb�ə�/�����V��Z�,m���O;%k{���E��?��bmB�����f��Z����g���i<&����jS|A|A��:a��M��K,�B���PH8cﾦ_� 8l�\6�#��ڴ�$��XG�_����!��P��� f$�e*T��ï�b���nM%񃑌�!Oמ!F����D�aC�<��Ymu���Ǚb�ݛ�zg<I�G�X*%�/�u�Y��7��ư�m��c���/��\צ�i�Ef�|�u�+J�u�ӆ���m��胠}�b�h��$����AQ6������'�U���U*Z�����_Q,��9L7?fb�H�o��Hu+q�F�їYϥ��'��If�kL���'&,��6��L��"�C�9�A��$<D
��c	�f�Flx�Ĥ�.�Ԅ��g���Ҟ
x�[����vG�����5���|�[2�pV$�G�r�w�I1�[܌!�VWr�=GF��ϼ�&�X�;�z�'��KS+b5l|�LI��Jx�g���bќ�7f�C�a�al�$q�'G�N.@J�f���x�Z�M&�2��2M�D��e�k���7���B����I�=�96,��t#� ����L]�	�!PdwE稨��Q,�,�ܑ�T�i�?Jj�w��6̞�&�yLN�?N��?T6�!��ZEN��M�M/,��!~�TK~Ӏ�uNk����1m:A�수Ø���P;J��\�/pN��fvaa2�G��W�#v�h��茷�O$�p>��9������i���\�:v�^Q��|���T��و��b��S�2���i�`p�b0�����f�դ�II�i-r�A�Kb�ĆT�M�`�@�'�1X�M��YB���t�	^^���s8*A�iȶ9b._���ZL�[�璉|��]^P�����s�	3��iV��5�I��	��8�L�>R��    m��6˟���LDukGq�e*3pKk,1����D��
4�.�BE�T�)�Ua�cڝ�\�*�-qdjHgt��m@�=:�����sv���6�k����Q�mu�A�]�Y`,{0�F9����,yf���{n��F����M�-�v�mn$�ڃ�aF;���+T�ܡ5w��i�C	���_��5k�ޭ����%+����q�Wݩh��]��Yh�	H��0��&��(^�~l2��S�����X4�Ώ���󧏟�G�����ɓ�����'�'�������<�'O�~+�E��~��~J��_;�d�?y$��^gDL��4$��#7�����S��D��Pa�M����sU��Sk^�6W{6$�U1��}�?�f�\�ׂ�zh=�����W=��|��=�ʰ��<�т~f����|�����m���vM��|���=&Qx��$�]�۷}���noܬo���w�ƨ|y�[nK[�ޯq��;�����w����n�p{��;�����w����n��v�^��[��,ͦ��|�u��t�(��<
ͅ/��?��Ʀ�w������3N��]?�bN��YKۤTy��5}Ⳙ �`�a<�|u_TgB�Ѩ�4����(���a"sgYN�A�a�c�45=�X�`6���T_�xaZ�5��:�#�5���9��;�.aQ|��ʢR�?b��7��YQ�Or��\����� P�i�a���5'����nw�=���f
j*��\|�KNU�^�PpNU�~�]�W#��X9Cx�,�؀7�b�߹*F��_:��s�z��̱'�2Cz0i��$�
V�l��v��;d�g	
%0�.`>œyY`��\o�><hwP�
�o,�o0د~�nv]|T]��m� ���*����x
�;�_
v1)vgƏE�oɭ�����xAO!���Ô�Ȩ�~j܌������.�NBݭ�n�v��[��j�Vk�Z��ڭ��Z�"T���>u�I��}�z��>���>�q�'����v�s�@�rq&Y��K
Qf�abc��*=
�BQj~�ϐ=Aj�R��I���]�]Zည~54w�(�VN��^C�u����Hcv�N�<�H�U֌a��G��z�}AB1�Dr�&�<^fփ\��h��G��.���O=@h������^���⚏���!���g����/���Z�d��2o��
�ݩ�r�<�����֭[���������x��DxS/B�
W�~"j�k�xHA��bX�q�p�����Ҏ(��$$!��N����0��_*�[;�q��������p�.s ���t�Y�#2��q6*�Fl�C���urQF���]=�h!0Æ2�UE���2a�p��)Nc��j�_�A�A����2��X��מh�'>�W�Ƈ$.}�R4��DA�bi
�B&b�^q�7��D���	�@��,~�2Q�I"���&�,��hDj,ˤ�Rװ����>{���TV�t���"�������fv��{���b{m��w��u���y�)-w飨�G�N����!�*O�ѕ�=�����n��I;CN�Ad�䌕[oh_�rB����� ���5�C9��꧒�����<f�|#�^X;��ڽa'��s2^'g���\����M��o�:���#l?Z�48�Qfg/���Z��)G����	�M�4H����q"k��A�1��%N�~eUC��-��\gGW�]���7^���4@��\EV���ս�����k^;o�4Nlr�<A<�}U�6e[����wRmw����H��p텍�6�D"�gPe~�
��È�[H@^X�e���Of��&��sY�m��%Ug�-m����l;�������~����:���7/��]�:9k�}8���`�u3E�5�m��=�Q�rlj^�3��w�B�U��e�N��
$w�Z4[z��k���F��\�Z��Vi;6#��B�A��:gIՠSs�h_�Zٓ��1�_ә�j��"6)Ѝ�5��[u<:�\V
�.'����d�8%	G���p��F|Bg.�#
7]�gT|��U��=$���<��p,ڴ�b�I�e�#7��i^8�� � ǆ�/��E����sPx�a��iC���g{�!�3�H��é]�,�B�@�(L�+G��X@�!ͥ�~X-�5UFp�}�&�U�"u#���ߺ��r����]��F~z�*��}��R"F�{�'�S����8I�J�L'F0<S��̳"t���cN�^�:��L+s*������v^ k)�(�|���*
r���n���@��zz��q6��F�.�e�!'�&D����!�UQ8�REa횯��v�VQ8�(��:���uW����4;!�fm���p�T���um[�a��Ei��V���:�ſz�-5�����u�"�^߽�{}��������A�����Q�\j6h�fM$�13]p�/��8Ρ��^��_����Y���Z���И�����?������	�v�ʉ���ܿ�d8E�������0,Ԫ������;��7��ڮ`x{�X���}��5�kb�Į�]�&�K��p��JZ�w�W.��n��Q,�4άngӘ���e�5B2�m0)�}�uo�K	}���Ev�s�R��slՍ��R;y�n�����}1���kb�Y׭�#o| �˟�#��3U����Q��Y�&��J�s��m�s�	_���[�}�8���(�
����f���[�Z@�i����Z"km�%#����	/��ԣ�e��KN��wϐ5�����,VkK�
t�$�2�fth��{Qi�ڃ���i�jF�9	F3N��$���T��KX�\jg�g_!���y�+�����Z�r�ܺS�;�6���81j&�k����g�Frf���y����߃]f��A�UkCW9�~�Դ��]�Mu��ʈ���ku�]�O�k�j6�����K�ݾ����ݸ��a�n���m�P�W�+��m��!O+�����Wx|��c{�wxy�j�Ս$�hw�$�`��%A�1@��M#�%���?jH�U�C�"�ɭ[[.����p�zbRJ�!S��I�J��S��J�]�޿�n�����e\�|�i��-��W����&/;t���ݥ���U1�rU��y�5{���Q9���U�E�8�����Y��ߕ�)���ҿ�E!^�z�b�1������'6Bɉ�]�f��H�LLaAh���|lJT�����_&ʕ��]�\��a�5��.�\�iT%a?��l�� Ǹ�nP�A���nP�A��/4(V5����ZW�U���T"��"��Q6��u�T�U�r��2�������JU��j�P�֙u�����֭�e�J綉�|1G-*��r!���$6�A�6��k�J]�a����1b!�*����':�f�Qc���v��OШ;B�@�4�����i�z�^�2����,�U�����7}��qfc�l�/oW��_N�Ʒ5O��U���x<�����噙���wp��\vm#�L^�u���������rֻq%�Zq�Q�h�M=X=��0�� T��A,�MJ�ܖ�f�%��g8n@%��'�_���}�J�3��nXi�\�"Z�>|zzRUX4�m�(�an��8:��w' �0�ѧ�k����rI��c�Б"�IĂgY*D-�=[>>����zp���m^9=:S��3�o�(G���+|��w�K�Rl�@	���r�d��'n��v���-(c�(汕c�ȯ�h�ob^O�;������Mꙍ6N|��O�zzdM��j��i�2��M� �w�� %&�[?�Hqe��t�֘�-<�=,g����T�ك�>���0<B����֘Y����O�<�U�>�0���Ȋ�F��:�M	���9Z4�O��O�U�������������=}r����X�	5@_C���c/�����R,}��N�x�GW��g��R+tXq�x^RB�X&zbi$Тj⹚�s���3o�"��%�8?��Ź�N.B5+h�܂���wZe�dZэ��'�/�s=�h}Kx������}���A��f�39Q?LU���    ��{A�k���M���&6�7ݺO3��ܴ���뫜�e\&��uY���4௟y�E_CgޢZ*O��ۀQc����zk��"�W4�����[䈬%aZ0mA����*�X:rhY�[vo8�	e��h�n�Z���M#l�3e��Ә��B��*����H�z���Ȅ�@PUufG�>m	/b�w��r� �7�إ��[������
BuiY�z��rln,ai�J�t�bxS�O�"V�#���z�S�cm3�%Ao�
��)�=e�5jҳ�I�D��q��TMqB{��׀�x��WɈe&���N��
h�I�(BCi�*i���V\?��ʰ��1������� l�h-J��@�,�b��/�ݺ3P7X��-���f��mvm��+���ާ�_�d�L����"��ᆃb�;�;(�?��<(��ϛ���x�v��ف�h��D����u�j������x#	Ä�7��7�g35��#qg��!����vV�p2�=�RWd;�~k�����S�W�ά�_�^#�[��T�h���떹��`�����*q_	��w�6�Cg�kP�G@���*₋2�L�7kO�z�kc'�9��D:��/�X�j�.i9�u��D��D'.������l��ˤ$Ơ��e�����<�t6"ښ�Nc�:�����Z���<�ک�g���:�7fn�{֝x\	wk�#ȳS�h�`�܌M�9����|�Mv���J|#�K.lV�E����9Y��uE���Ǫ��r�2+�cA\$i`��.��$4`!��xB݈��E�k�i�8ꌫ<�Cӕfe�U��]/�י�ui��q��m	�.Q�FoР���՜ޡ��	�V8���yT� M ���)��M�[Ke���*Y���B0�8���+����t�<Y��Z�:A���ٔc��wv9�������̴}EA��/�u.d'�l0���iZ���jA�&����.�9�ڳ� ���y���˝�4��.�)�C��l�/��~�5U,X�]��]��]���T�Ovx�Ó���d�'��M`K]�o.�JT������˺w�)�"r��a�v�<+Hn�Ѧ)q�g%$8�4-��T.�Fb�Cs�dE�A�ȿ��b���S�
1�I��3Z��dHx�G1�!�I�M���?��\@]T�f�z�B��Ij��=����װnC] 8�*R�&P�0DJ�Mp��7��)��S>b��PB~V�@dE.f��F[���L���FmB+u;;Y�j���y�55�Xsk萈Qo�#�I�6�Φq�r6�ۃ�o_<��у������8y"�>�����b���}�He��{�����SZ�V��}1N����U�Lw[^�v�I���;+�Q�×?��P��3X l,cg��(��O�!+��LT�̀���pV��/T�������,g$��6R���fN%��}�e~��je����LY�ڠk��������8��q~M����v��F^J�Y*�cրHș^@��2T2��.Z`d�c�	����r��sy���t� �X��ǰ1������Lg�J��	�����K3c5���YX�� �ut9U���/@�����ҫ��氭�u�/��*Xf�l��3����R�r��{eE	tL���쾟Ʉm�֎#a|��^5Q�ٓe�ȷ:��U��=%�
�?�����������}w �î�I�/MX�N��0�tc��	j]S���6WS<X�uD�.�d�����J� �4��Л<���W �ȍE���s�
���-o(���ȶ��U��ze�8��)l��y쬠��5i�bU�2�0�ĴHg�
�"�R`��~:t�}<��jj�l�����]'�qA�Gg����i>��p+��Q���T9�*�B8#�\D���������f�|Y5�.Mbi��-LV:'��G0U�#b'V�Ե�t�	N�u��h�!'�� F�ڰg�cGL	pU��zc��}$�]cu�h�Y�"�D��V�e�<:�|y�er��sX����Yz~p��˟���9R?���{z�h���(��^�^���i$���W*n��Z�e�=hu:�v�<���m� d�_���?xN�KH29����M�ڡ�M{o�����<�$�.�OLT��9��U�_0���_��֨�Ԯr�}L�AFԘ��Ɋ)Y��+�	,ͺ\�>��N���Z��C)�M㳑!Wv0U2ʜ����N'�bN#;B���K�X�t�X�W��k<DlmZ���縧}[�!�{a����o������»-C��`��X!�������Y}Vq�K��B.N!SY�2_�C�Q�]�KZ'LZ-Xwf6FZ.ധ��#�e�B�:C�F��v�����+�����%�/I����y����f|��r�ߦA������Zp�Q��YP�{b�3̲�wF`��D�J8�9��8��,垳�������4�[{r�G
K�^��*v?/��~Uu��c��q�w�s���lk	^\z����7����,a��[��wi�f*cJE�՝e���3zY��+��l.X}$��Z�G���I����������1)|Y��N���{y �ڴM����=+�ޖs�[����n��� �<~IА53U\��4���0������n�[we��e~�Y��2�F���i�y����o`׼L]����/ց�����<Au!��6���#���@��>�p�`�)�z.Y/:��VVYl���d����$k)�g9���Ԅ�����{ݛ�:��:��vr�O�Ok Ti�r;�Ċ|�a�|"|��&��}��{�?�L��i��vd��XߖX�4�"���¼D�df!rHa\��q�Xg�x����ǝ{�:�|{K�k���+h�=>����u��9e� ;�2�')t��t�����	.���*���N����'P '.N���n��.�В�����N�X�b�p��>��Q`�W�-"�2��$�j:D%�K<#yT�_q`{���-�ai{����V���6��t�59|ª�p�l.��ON�<�6�$�5�JNG//'MrŻo�1�Û�[�c�UV6.5W�q���\�8'M�����`����gc�{�P}���k����b��!�H�:�$&_~�֦�.x��t��]f����tɴ��J��l�b���]����*4�6;i"�R�rO���l�&\��d�)���ل�kӣzf�ݻf#�;7�kb�Ŀu�Ӣ�������3VU9��u�րco��Ȉ�S^\V�����+�MH�sN�X�*o�u��
��!�Bd��S����e#��.Sf>F���sZ���E�h�p):�ZA���!G$t8	�G����Ͻ%�paF,�d�B��:�ppݜ�vI�6�5���J��(�\�{��"���

�`7[�F�9������G�l��� 7���c�2U��3iR7(��WZ����\.�|G4�mV��G'o���X��?h��w[���� ��I�o[�=x�x���%nV���0[��^P�ٚ�X�hםe�ިU<���ʕ��JI�
r��ԣ�7$�RLЂU��D�]~��kUQ��}�qn�����I�:�N�8O8z�IL���}<�v���y,�!�5`_'ט+�{�~Sw�����Rk"�aV#x�gW4$�}�dL�S�CI�Bm�R3�?�Ƞ���z��~�q9�Y�.lq�����I\7t�z�L!��L��G�\�I��sW��|Jǉ���u9�^��9�)p?��D�F��vJ��y5(�����"A���|x3|H�NK3"�M�c�&�Y�/1�����%m�����q�S��ڋqtˈ���fE"4Q-�4����SSSz>�nV���ߌ��� ���c�3�V-[Vz�*�Z����xP�ln��.��_;�6����k~>����0�����M'ۮ�u�v�2<u�����������i���ߟoH��@F�|��8����.�g65OtU�عh�u(G�}��A�Ft�
"|#�"���Tq���֖��2���cn��m�	o��%��(��%��"���8���5�/��-�>   ؝�G�J�����>���3��8ޢD(��6��g�dp���91��	�ؓ�������B�H�5��F��٨u0�X5��H�)�Q�V��>5����j
mj.�F���˥�Klz.%Wa(6G��=*J�����-���B� d)�6�����J�Rm�����aU��ڎ!��w2c$�i�1�%VI�QH�Y�
KSV)R�W�J�5�s���evD�,E�Ժ1H�'H�񂬆V%��Z���s�g���b'���c�����?��      :	   �  x�]�A�1E��]�v����		!�����U1S��O��q�tof����{�M�/��[��f��*�t��g��/�s�d��䀾P{�[+��~�p�8�E�y����$n��q�D'Ql�nΦy3v>.���f�Y���v�=������_�������;��*x�W!6�c=n^(��SGϋ�����f��]EX��g����#��L�u7K��Ux�m~6��ԇ��c�;���F��/T�x�,����MC���"ϒ,���]c��g�d�z�x�Ěl��S��͐�ö�I��(��XT��%�u6QޒH�$-�h��H;�C:�gs�R����>Y7BaЪ�DDJ%iI�4��4J'yI��\�(�I	&?*���+IK*����Qr`��tJN�%ύ�%�r�fI�TH)|�D'����[)��%��HVy&�#�:�ב���� bD�C�ۆ(��cW�(���Iْ��E�n;y�8g�}�N�0�g�<����r#��Z��HV�dp�q;���N�֖@��H\�-���G�%8�Q�'R*IK�b��QcH�HL\T�2;��ܒ(�(kd��JҒJi$+i2'6BC���^@*IK���9+�>?_�9߻ɇeV鈔JҒX�O#ޢy�D�Ғ���|�e��DY�ﶪC�x���+�meJ�J"��Yk%��d5Q�Õ��(��<��(��D�F�b      ;	   �  x��V=o7��_�2.g[���� ���H�fvw�G�Kn��Y���i�¥�;��O�K�f�w�K� ���#w8�ޛ7<9z��0g��zr�;:'��ۆ���ef����vɰ7���R4.$3D��
�:�4�\�v���n�%�b��Qo��̬�;Ӈ��S��6G�C7~HX�z��$ՙc9�����`B����f���a�o�)sB�XXQ��tA�& �C��V"6�${$�d<ל$F
�U���Z��3��`��v����Z���pB@�) $��ޙ:�!Gy��W�z����Y�$���g���7Q�ej"�MR0
Et�6g�Z�l�`��`�f�
���-���	�~���Y&�t��B�4�`l� ���M�.g�X����B ҡ�U*(H=��3I�j#�G�Pg�4?ZC��֭�o���f�g�����#���޷�wU����lG�\:s�@PE�\�ܾ}&�����u���I
P����y@ơ#s!����Y�o��ؓ�Ɔ�Pkg %�܎�$�M���K���0�ݺ������g�̅�t^s?xsJ�DS�|�1TP>�k&y��]�s����?ypo~w��|�+��T�����͠Ϥ'J�}�p�>U�*T�S��9vtະ�¤3����ڬ҈18�*w��P��Ȑ!$TYW:_E3h��f�U\i���~L���4i������ˀ��V�x��D��KK��ѷ�!L��ˣ���$w�%TkS�Rz"ǅ���^�*���'Oi�����k��p����-i9ҕ���쐊u�۫�NӺP��<�]s⸾I�^�4a�,.�&k:�����-�xQ�o+ًMM}6��p$���5�
�� ~m��A�B�Fhև5����x�ޛ�Z�C��W�uj6ڍ2:vC���?O���k&���3<�<=ן8��������|����#�Ot��"z����+�a���F�ə�Κ��Vr�1k��9����_�	�D��ʘ<g�f`����+�;i�WpkY?��tuؕ��V1�~t2��MgE���.�$����(̊�);��*`��thǴ����MX������O9���]Mz��/*{1�Q��s_����o�<�^�7����X��a�����Տ2̆�m�0�ܩ�"��Q��4���܏_+n��.��X�b�my3��R�)qi�svs^�+����2��:���U�ˌ����E��!�noX�4������0ƴq/ʢo���lNzYZ�t���еU��n����I33`�E-�`-���q�;G1�(�s�뉽�%�doAY���Fzࡇ����5�:7�E:~WN���?sY �um�r�h��r	ULe,����E{\2��w��cS-un4�IŶ�H�Ԅdx$Q�&w���F�%�`�u��o��:���Q^�q~����A@      <	   (  x�}�[�� D��^�~��]�|g�M{p�n�e	E�O�����Z�p%���ؿ�W�P]6�r��_^�
�?�ù��;oP��s��uQw���^!�E\�����pc=�ǂ�z��|�.�H�>�o^�|�q��)\�p	��#A-"��Չ��ЊH�D�$c$�N���8	�E[@L�	��!1��<WLh
Qêھ�;��`����
[�u$d	B�P7�AC�1�4c�#EHqɪ0�*��
c�>�0�B&0|���*�k���2RɚV���d��E�,���r����Š��!貆��y��K��a@��=���*��{�;��.�;"��ޣ!KX�;4UV�~���[��̼��R~	/)�m�)̝h���g9Қ�`��]������5�C�1��7D�C��v�2v��{��2�ٶ0cD��Aa������vz�Nt�I�۵�-�B�O�lȴtm����}E u�hH�݅�Q�V�+C�q��,L7$"��GZOIF��[�&#�K=�1�v��{:��Fz���-��*:�      =	      x������ � �      >	   >  x�mUMo�6=S��9-
؁$f/E�.�ö{��P���4�Y����:�&�=��W����;hk(��o޼y3,���Ls�����9���5ǁ�i��-9������l��w;lǋ�(��w��`��aS �%1V�o�?k�;���w�_�"�۞�'�w�������е�˪�����TeQ�O 3�r���Y���N�Å�L�Kt�ϑ��`�V^c��Aa�5�F�q��{���V��� 9� �8��{g�習iM���K�Ț�I�ih�3����裉9�s�ռZ��X��uh�0?�,��r���VO�Z?�P����?S�J4�@��Rs8����R�Ȗ���kPM);(��\�kٹR���V�>S,5�R�*��\L�Z��?>p|K-;��%�ry�eIR�G����K-#��t�E�C�I��KEw/��ߒ#�����!��;������J��T]��G�vɟ�����xԢبQL�������h�>��a)���z �3�WG�m'9�8���oQV��Y$ΗCp�9{��u��+1d�V��F�����tD�;dF���lI�Q�v��� �	C���M�aĪT:m���l���`Kz|��� l�@K�А�m��۪���&�8:�AF3�X��������N���܋�ֈvyg]�]�Z���O�`t��X�����"9�U/�ZK9�>R������2��g��D�1?��C~������fST+u��������!�بM���j��4N��3k�I�A�,dt�LL��
�y~Զ�&�q��ǀ��eE`V�㳕-��=O�O.Ԍ0����b�����HmLO]f��l��즎9Hqdn�.���^�l�,K`U�Oy\^6� '��g�>#�H�rS\���a?i��^@���	=��$�w��'�� �iСb�iT�7m�SӼ���i��z`�J���\w(�LX��}G�*b���Jgv>\]]� �dm���S��r/���w�6UY� ����]��j��ņ�*�_�sYݪ�����(� 0��^      ?	   �   x���1�0C��>@UQ��X��b���P)��'C{-��ň�:1�Y���S3Qx�"�q/wOI�N�ˑ=�}ᘕ�B��:�D$��}m�����]S��%Æ��Zg�f�6��������&yRٶ�@�n�s�0Z�      @	   �   x�m��� E�o���0M��_G2�J��3�� ���B�L:���ˠ_뷵����cj��$��-�{�6�\ٱ%,y-Y�Ij���y=����ꋓZl�?��Iz�g<���ձn��x�0:��_���`?Vر>`?�:�Ȋ}�Q!��t��/���y=��|�R^S��A      A	   �	  x��Z͒�6>�O��*�U�� U{��8�S��d�Ie�����-��AR��m|��Wn��Ŷ��7T��y$��5�ݍF�y�璦Y%O_E�4����]�U�{�����#���ďb�r/�LjEeI���e!�)4����f*W{1��˪4K�����*�OMI�ӗT��cJz��_�����RF��j+4�HU4���i�h��⠨�;-e.ʭ\Mi��M��\�mV�"�F�O�ߕ��s*+�QEsE�iJp��'t�zj3����LY�K��t��}/I+6�:h�ע��Na0J�(�T^ �&����%�k���<Έ��o'O�zͬ|vZ�0�>�f���Uš��_�xH=�`�J�o�Znk�)������s��8��U)X���(��A�:�fQ�_��$� w%��a�
6��&��j��i��4=�i��=�<� G!S���Zy�`�.��p�O���
Ȧ�ܾ+E�oJ��tv�r�����Ƙ�PY�ˣ���kg#߁�L��� dY*V3� u��/*�@_�mdYk|Ge���b��8}�"�;H�����4��T�,1� o��\�%����\�Fc�V���`���TY.�ύ��n� ��l�hb}����p@�;�,���	ુз���.B=R��h���2m�N�;��姎�0�b�X?(���Z45,+b�5{v�0|l൬�6��Y�`Nnl���,,��(`����K��`i�j5͞���	@E�� #��T�������HQV�l�,�#�Pb����,�����B�D�f?	EIyq�x�1�{lOd.�� �t��jP���PMeK%�'��+5h���9 %���u+4�b⃁j����ծ�*fP
��		w�̒_�S�U�ژ�τ�}^��5��� �6��2��|�t^;�3$Ş�d���Z�X�s��u���u���hI܃���t�T�^,�������'q� +�Frf�~+��+�6 � ����)( cdW�b����=:�H�� ۱plsܠ����ى�'��V�3�0�	f`��1�"-i���{Ew�>�Ub��~�6�pq�9}.�w1X�q�z��,	�	H��6����h1K�nI~� ��YĒҒ p��rڇ|7���Aŋ,p��X��wgHGH�"�}�#�vbKlp�%%�C���ԘS���-ma��#����ME7Z|RU v`'<���ْ�ɿ*��B0��)�cO��%�Ғ�}���d��������7���F)Liv�5�Wv �4�41#�	fȖ�MK2��x�QA��b�x	�y�(x�d�hI��{��8F�%��F�$�Ay���޾�y������Eo�ܾ���МSaI�;vϽd���0K�$>P\�#��%�oIA��[@H�҉���`��N�喸d2Y���Q�Ӂb��f��l��0�S-"ڽY��{	o'd$��>�n��I�d���L���}�#�uy0�������T,	}K��y�g�`��$,���W���{ ۠oE���<�X��o��$�%�������m}K
q�5�gY;B�tj�ψmL�������g�Q b�Z)�q(G
�-2>Odg���a ��b�5x4�g�B�Y�y ����9 �~1��<�v3-��j$0�A�)��{��;R�ۃ��"���6�gz���Gحם�A��6���ƣ�:���67�)�Bo���&�����RSA�^�b�>��տ;u	��:�]�R~4'bxP]K]ʺ���i�l��$���g���^F�Bl��i�$z�}4��R��h ���M#K�\���	�&N_3�Z��1y�+���c��ʹ[�)!�H��`�H�!a�<>���;���D���!��;���1�YqP���i�N�U��h�R������5�Ú)�*�*�k
u���u�G�3�DS+�W4d�iX��<P-a�	3:�c���õ�Ğ�����Z��isӹ#��ݖ�/ �Edf���v%�X	=�X�\t�ۭ�?4���JHW�Q3,��mI0���p� �_Eg k�4��p�ͬ�7B>)�1{�rL��ޘY)��ƶ���5)��e'��P�u̎��� �����������=�?���$UՔh�0�{�5��v�\�w����"N�v����F��v�E!�kDY��"�u����z��+�\Ï��<@��k�����uiocn�<(37-�jl��Y,�B�[5���4�;n�J���{@Q�u���m­j�n�0;� k�w��/ps�fN��u!�Yi�Q[��a�Ak������� [�Rk����F�0b;`{8m]�M�mZJq�����_�~*��J0T�J`��nY���/�VSx��U��6Y���V������h�ɝΊ6�4���_���:-���ޟ���L���`S��.y$���Q���i��N+���ss�������f���K]U��Rh������	m�Y=y�����      B	     x�eU=o�8��_�.������a�"8W�f$��4(R&�͝�M���s���P�5� ��W⼙y�ͨT��i�5/4i�&�z�k�M`�VӘ��똢n)�PuYU��|TYT�Ώ�t���:�Ӂ��ɚ�݈1i�mbK��n��η�78�����k��-����
�{rc���&��`'�Zs��e����l�������(�KO�IoO�l���0��pD�Q?&>!�Z W \���='�3p52�����B
��p�b�}�Q���ܕ騛qW��F��Z}��K59�q<�ί�5테L���z��"Q����l��L:����`唰���+�,���U�׸h$��0,@�W�)����[TZI�N}�"��G�i��\Zt
�\�Z	[�b��%pˠ���)ˮï&�W�l�UQ��iȊr���]wޡ��>$n��cj�*�Q��}���nE^9�\Z;��#��9��X?Jg:aƦ�3�W�u�Y��tF��WS��� :E������3�0��;Fgx�ȵ���U�\��(�3o�=�ȼ-��^�3�)��: ����h&�D�'����O8HYѸ�Í��(�?2y�I/2���x*���mn%�
m����Rk�!�&[��+4�:y��=P� �-#;CL�˱lF����"���n�������{x}�I���l���"���&��2�NfӔ��Y�������j�fc!�F}�p�p�̘��tc:��%g���-v���y���+�i����F�wWT[����C��З�??MPOI6�9�<+u�5@Vu�>RNq���Q6?��h��D@��Soɲ$,�>���`Π��Q5�팬,8۪�*"IiZ̺��M�_���w���¼EH�4\vm���������,�5C9-Ga���o���5$�J�Y��A������y6D��'�I^E`�}g�(=�������s�T��)b[)D�;&v��5v_����.�|ߞ�;��m�{���Ý����EQ�|Ac9      C	     x�eT�n�0���`��@H��Y� S�H�t�BIg��H*����|@�l]�c}'ɕ�L�}�{�޽c*n��+/�U���*Y�ZْT�$YY+Y����o�A��ϫ[��Y6I��t&�$�ʶd���it08O��9TqFW�
�%��\�:DZsU���=Pf�<J.��R� �d�d[]9����[U��r�f6�������|��"K���Cb�����d�|GƨP����S>-�D�|���c�䝕���4�4,\pg�J�f�ֵz��κRd'��<MSk'�c��z��]E
�" ���W�<�R�ɹx�D)�Ǌ��_G� ��w}Wo���S5d{��B@+��*Z� ��P�=����-O. >T5Z�=Ȟ����$�pDl�=���ݸo�mu( C�&��Q��M�H���ι�E2?ض���܊�C{7���vӓ�0jA���������S�ì�)7 �(5�=��a�v���q�1��N�֥U��ّg�qيB�7��S]C����|K1O��֦w���ck����V�pu��;������W��J�=��!֨���e	Sd�L>�A͓�,��E,t��Ǜ�-����ĠR	F�TL�i2�9� b`	���=�w�1K9c|%j7��T;Җ^>f��T�����x�@F�0|�A�Υ��?9�fb�qZ&��@��O
ֈ���_?_�Ƿ�[2�O^28j���r����w��c��2�jW�*l����3Q�V۪��&$<�~�����B,�Y��,I�Ǌ��      D	      x�3�4�2�4b#.C ��6�c���� 3oe      E	      x��[�r�ƶC_���V�dA�/OT��������ι�L�@���<��a��,�T�?v����L�L%ȒL�޻�c�G7���?1��:����̨�Q�Ib{��rec[�u�6���8�|oğ��?���cp6��mS��Jc�8���]�l��T��C�y�sﱽ6�P�ͬJ1fcM���s/��2y63����ͽ+��#�W�Uu����F�T�m�(���*���e�W��x���*�ް�As|s 7��79�}�i*��Vmj��<�Ei ��Qv�k�)�ҷ���A���wC/���S����=�M������p�o/<��T��p����j�)̪�+�K���ťs���2�1/����'���s��9��������	>&��1�ܘAS����Ca��Z�i�t���(��$��@���Z���&�:��Zk�!�s�����hsu�S�C�ԅƃ��
~��|����0踜�����8��I�����s9z��q��M���|r�e�r��=�r4�p9�q���K�8��>����r4��#�>.��q�Q.�Q�dy��}�=�`|�}�x0�G��Q����e�+.�{�{�ex�˰W�ރ��O��ǽ'���{�����>yO��p�'�	���g�+.��p9����\��}B�qp�&}��G��}\�	/'��x9	�����q�������SQ�zUQ̎W��O�`8:*�`�'$
FǑ(�d�Aph�Ӗ˰O5d֐��=�p��2��{R������d��Mv�K�t�[�2b��$6z�'|��� 	���7<稷�"��d�-�5��E
�D��SNʩV���~�l�//��ۏJ�9�=����N���;�q��%.j��-�[�
��e�G��uہz�Ս)b�>���h���=?Wך��7��Y�ު6�pvg t�;,�P����B�.l���r�I�T:�����ב)�"���κ�b�o-l�.G^8<�r��7�*\��pٛ��'���\�}��(4�F����
�t�g�|�{�;�Nh�I�)^	D�%=�% �, �����Ѵ~O�+L���(b��ЩtD�:Z�� ���4� ��)�$ 5�������o�������K�s`ѳ;Bci����%�ۏ���`�G���o_���ޔb��R3_t�ON�����^u��I^V��ڨ�� 7��#��5�B�����Р�WMā�_0j]K̥�(�B����2��������僓8f9.�q3����^^�wO�+�7/��2�c�CG��sBS�j��K�tjb�p���+�Z�p=��I�º`�?��_�y�Im���b1�Ȕ���K�N��{�����"� �`�Y�4�2FV{}F�e.攓Y]���; ����	���XdKd1H�t�f(�.���G-[g���0����_�Jl�?%�J�Je���O�����1K��X�+Đ;y�?�;?��IB�<7n�����a�*���.7�>�`�=	�6�]0qM�յ~���������۩���M�=�/l�J6�rnl�%V� U�ԊM�)ޏ�"5������"�����7�xML�]���#G�M|ĕ�<N�0W�=%�.3BΣ�ؗ�,<����[��;� ��2TH^߉��T�m@�ǝ������Ir�39bO�<Y�wf�2�K絹��R�7�y���W�%b������MY����q@5��� �j>�"���OK�9�'�&�* �4�
���
����M�8,��wi�|w�!W5�!�qVKEAH�V$�D���S�u��X耝�z�H��]����g�(��x5ӹ�rR|�Ӑ�������CʉɃ~OB��h��ci�!����R%��Ê��.�o�,�/7(]��Im��x�Uw�Ud7��� Uԡ�ZK,��N.z�WJ}�nR�B��3h�C7IQ�.�M���N=��*!�� TnH�ME�<���;P����7�1,ɣ:[�Z"8�Q�t.F��W���(��^��,c�����n�oic��K��,���]ƛ�2>��~VU /��}�Ry.	����S#$[��)qv���֜@F�<��m�$��T�N�B����aE�S9 HuPܦ��?�?�uZ�iʧ��:��o4�ro��Vۛ��2Yq���h�����x$>�A�)���S�b´�i�6r&;	̎)�1)%e�d�}M�Z��1~��V5E��4���J5D���~2�s�a�W{�ݡ����3[ �r�D�i�B�E3��<����d�'��~m?���"�g���z�j���* A��6j̋���z&I����u)��6
~,�k�+�X7�u%h�H�� *2ģ�[Y&yR�ŤM4t�	S(��$��v��m�����n���:A��Mr[��DJ%��tQ�TH���6���I��������GxH-ʤ�W�@~%�Y06�d_�9�h�CC�T&�����������H��y�&:IYY��꺆�TLC��
ct[�BQ<��N������4�2%�{����g��,t����4�Z �q��� ��S��oL�O&6b�B&�gb�Mb�\gt�i%~��'S�g�}lo^�d���*f�7�"ɀm��0�Fx����Ua$<���4��J��E�ଖz4���U��I�&�[~�4����(aL!_�5;��[0���ir 1�_�Ӄ���^�6��_�()� ����� \K��P0�	�6K�(�H}ޘ43ﾭ�m��/X@��l��k��ˢ�&e� ir�LNN9�IgCr��o�%��;��e������0�ڬ����G#͠�4 �Z�Z�#��4�
�Z�^���M�bb���c_��!oD	}�2/қ�I	.ȍ�<��SR���L�{9�#]$JTb5�t0�W0l1I2Eb����7۫��H���r|��M���!����Q4���#�o�nJ�ۯ���_�M4�7���4�����%�߀~0��:F'�"q/�"�G�/O��N������J��_[�P���hrHa�r����$[XI��"8�E�<�i�谘?7�;MlQW�ԋ���O'�d�.g��ܭ������3� �,�a`�V��M�ַR"�rEdƾD�.X %��i�7f�oO����Bo何��f��B�BdLt)��c�(Dݾ��<ٟ����l�\!���f�.�FK_�kZ��4	��O�qC3��v�ߢ���)}K��r)�Nh19Rm�XI�L�i�I��g�;�q�M�,ٌ��|\kX�Ŗ37F���DLB�6�'H����jPalT.�0�ԡ��,��^oS!�������
!�w^�KK����j$���旅���dӕb�(�ׅ�F���f��m�����E���@u%(R��t��n��\3�ϒ����?Rmm��:H�FCѶ)���d���<N93���fE#��:٬u~;`��6�ܔ�ٸ[D���e�+�|�E9�K�@JI�-��\��Ba���L�五���9Rm�e�Qj����0U���j�3�o��	�r����J���$ZK�#�HD���>�:ϼP�!�aa�K�&��lb���}8ǽ�W��Nx, ���<�w7�h��fӫ �z�r��Srg&��&i���a$W��W��*> 7A��f��8fQy��|�� �V˸�O��yg_�;�1Bo)��e�d����?	���xw�G�� q�~l7lP���'N��l�L���ViI�4�*I��yC �FA����=3DE29� ��c�:} ��н�A|5����_�K�]_Ֆ�;��T�]8�� �?��-mc��&���~�m.A����ܪHfԬj��=}�.�����	"��d,��6�Rv��2������O�e
'��Ȓ^�G��Y��:���j��[�.l^VIU�I-��a`n�f�ȃ�h�k'�
�B倱-7}(��	�∌�``�������Mϛ�%G�1GzS�/s��7R�r����F]�{L�ݸ��K�i^���~���á����r�������!t�����6ު��jr�!Ӝ+r�L���=�# J�/ �   �E9�~���2|�j��k�ohF|[�@ZBLX�v2���B��_LQݞ0K嬫���ϒ�v(���w ������6�dw���J")��������Q�>��PWm�tE�q�<�Ē���3Z*;��B��R\a;�a�xl��[[W��%�c�'�56�0������="����b2jהy�	��U���Lt>1L�_�`H@u|�0r�r��ޢ�`����x�o$Q�8�:�~������B       F	     x��XMo�F=ӿbu,�
\�"%_�"1� N�&h� �����)���j��c>���?�7K��,Zv�I���{3�l1��n�6���L�t���f���P��K�օЕ�oA��Y�� 
9�1L���I�����:�����,�Ht�/�O�������zm����e�<
��j	!�g-���>���Z�Z��N{�{Gw$�ϒ�7)J�S�I��N���3��R
vƢ3�)�x�+�vJf�Q��$}YI�{��I8�$zY	���(�_�$:�~+K���Xij�*����Nj]I4H[�8H����y�G�}S1�q���Ϯ�[K|���b�}԰QB̰ʐEM���|�(�.�c�a�I��d]j��0�V��o'�4���G�VD���>����ݰ;3�Rx؛��-a��#~���^G��p��d����Ps�:�j�����$��VS
�$M"�lPh���;E�1�(�Pˍ��O_��T'gI�t|l#
�*�]闼�W5r�3�p����V���,<�(}�"OO"���>���{K���ap�s����n�p0�yle�ڛ`��bZ�,��(m��3���)b��JxG
��Z���$Z�-+���[��Mhh��}'�8��P��`S�\��^�cK����ɺ���u^�T� �)����T�Q81%���6��7��Ƈ���J�)�`(�m��v����~8m� ��A��甲GLPl*p��\\*���� y��_X[�!t�`��5�t����Q��xGoM�gQ��
O�ƛ��z�Ƞ��c���3%�	��t�����u��9>hC�� ؍B0b�J����J�b�\i�,Q�Pڞƒ�ap�o���S�j���8Y����U��"Ky���1i�ҧL�Tzh�@��*����9��U6R�Pq��A܋&�ԌJLwp�]��>��cQ)�`�\� E�w���dН��t��o"8�}�������~�����:���hw ��eAm-��;��3Z�Wi��	9�%y���� �g�U--���9��A��F�GO�����t��@C9���5P�:?iW�1N��(�����Gޠn�梖��wm@*׵$T~ÈRv�LA;���̀M�F�Ho$糏��#�k���ؒ�q|��Z��p;��]�%�D�>�EP�jW���ۢy���qkp��]��c�Q��l��Ra����6w�f��6����ڔ�X51���Cw�"�0�AI������Y�̆�G>]�Q�m}/u�<B�|5nr���X���Dt��x�c�K��9vp����Q��t��>�8��ߝ _L��6`_���P��] T�LԽF,�1Y,�M4��F,������+��Cq�t�J�.W�^{�P�D+Svv��]@�㝒����QY��I[ݍ�O)�W}�3O��t�h��%�AE!ݷ0�)}���m��s�������3߳������tGc�������@�5w����0u?m��'�O�)ପ{Z�0�}	��)k\�$ƃw{bQ�$O�~�����85V      G	   �   x�e�=!Fk�s ��H��XIX�lL"���2���b��{��wT��jǛ��yd��0.+a/T	gjS�L���v�gƠ�u�G�6�����6��I�\���J�hL��b;d�1q�TKf�� �ټ7�      H	   �  x�}�a�� ���tP�\bO���c�J��3�i�=yA�p�B��z�\u�<i��G���E�G�JԠ��N���7{/�L�9X�����
�b�a�#�WE�K1������(�)��U�R�²�@�������1�i&�c��(�sL�F�P~t��3��� �_�_0-ؚ%� zU[�����wk��n�:c���s��߅5�-�=�FZ8X���H��3ɰ�<D�6V����m�Ϲ	��8LxPB�%l*��>(akA	�3���Hø`�4@[}KI.|P�X�ݭv�� �4`a~�uUb��h�9�B{�H�Ke��R���EY��~����]4����:g/s��|يw����ʈ��Q��϶m��E�      I	   �  x�u�G��8 ��������`2����I����=l����W�ޓD�8v�N�F�����<�->\��Z��q�q/���V�c|d��W���hX�]2%�"�鸠j�=a4I�G��>�[d�QF8æ���#;G	�[�Ad��rE�OkFC����Ze�K��K����E�-�ED�*2!_BY��M���iau�g��� �L}ο��J�.�X��̼�O�ic��n?�
�>�"�t
��n�S�h��T������x�ɹ�%b��La�d����zɂ�ޅ��L,��k���U�^a 2�cs�D����p�`�7��s���wr���۴62}J���+U��+�����L�i`�~��۞9��\&�r���%?{���)+��.�
Ֆi�ʰV��[�v���xN�f�&�i� ,����BR����Kf���K�<�p���4S��©�V�**��9�h�U�.��h_|K�Ӫ���zp������ٓv�|�)$XB��͢�ͦb��æ��@�2�Q���پh��	�'�Y��c��1TQ!�_G(�`��4���\��$�
!������e�BF�_�����[�ı��}{�pAV��j���5��P۶� ��Î��J�F���{�.�y���5�iB���|��z���n	#���j��lF�x\�EJF���Y��5��"w�ī�ۚ��؋]�M�WS�c��ȋ���0��U��N�"*}��	���}~��ZFٍ��8�?gp�_����o�=t�(��;�M;i����^b-���L�.1Wy ��V����Bo������'�����g�&1q�dMmh���^Ӆ
��r�2z.��U\׍o���<z+o+#�Y���M1�o�����β)R�YڢC�/�@��������0dzZ�յ�a�@8����������q��      J	   !  x��TKn�0\S��	���.YKMĒ�O�)`<�DBT"URt���g�[]�O�q��B �ϛy3C^�I��Y�H�ZC���Q��o^R'�=�~K�vFGk�%���n��(����ת��X��@�wj�32�U�D,�_0n�� q�����x����)�(+��d�r�1����l xI�y|]��JyM��`���;c/��"����)O"�O@}��:�	�W$��e����~�`��v�#�=�*������^���X�d���o��V����{鬓�[2����8Z-YQ|~��H���Q]��Ak��Lܷ�W�O=L���wcE��,Y^&�d�V�*���S���, �)��c�=	鎖�4�8�I��a)�7j$��1�V�����z2;ޓ$��W������h�À^>�6��Pa�(��b�`vE>f���~Z>���vH���x_t�r���ţ��0xCn�����"�o�L`a�	��E� �b��iJ��I�lF,�X��#�$?s��{B�|���a�%��7��&      K	   �   x�����0Ek{�;�l�D@|$RP�<��`����f�̒ň�@yt�=+U��n,����Q3zv�ތ�ˌ�.�2�ٴ.�D��`��O���BF��u�WE���[��l/&B� 9��e����:�����G�`{j��0Z��;P-      L	   y   x�3�t�
r��t�Q(-.M,��W((MMIU��ON�ɬJ,*NUHT()J,;��X!%5G!9��(5_!5'5�������|=�?8�2�	�	q�459?���T���̒�ԢbT�b���� q�7�      M	   �   x���M� �5��4���֦��`ٙ4/������r�z1�n\����|�!�<�� Mw�L[���B4%%�0�,�d�ܡ�[�����V�#���l��IC�!넅��AvS�7�E}�_.��"��ø<?�
�B�ދd깼�+J�\�R�      N	   �  x���Kn�0���)x'�K�VS�$�n
c�H�J�JJi��� ]u׭.֡�r��I� �3�o���S�.��*N�Um��T��_ZI��7`��a-񩔬�_0��@��@yZ���V5ݎ�x�B��� r"+P�	�_g����MS��3��/�(\���pS�Z	�L������V�L����<^���a��V�� �`%u���ƒ��2,�yC��$I��"�D�i�Z��Phc���F�V7}��o��1���״�r�3R��/HdIdOb�U��!L)��v&�A(����F��`3���jbxI��`io�"����W��|�8��Xq��� f����>��<Xo�e��b�\#m�4Ξ��kk�t�/��ZZ�������j����WPm�@oI]�c���a��&&�VC�a�:�n�Wߓ+T_.��\���O����IX���0aV�qJ�WG��mW���$�l�%4�h$��}[j/l�Q��Z�N/{�Ϟ��͘�S�>N7x�?Y�is̘��d�?�����%�]������0�o������d�ue���-k%p[p�ɰ0�yF.Y�f�&X��Ǌ9ݺ��?އR�����|ײL���L;��Y�3&3~Z.��-�q�      O	   �   x�}P�J�0}N�"_��e[$��ւ ,C3�@��$����q���}�3̙s��fc�v�wS=�TB� ����aV9N��bk�����G����YK�8��
��x-�E��Ѱ�I��i%^��iy%�f����U�b��8v�p��!dy-j36�焇yJ�f�1�9Z1e��
Z���O�`Mu��AQp�$��j�O_1`
��c���tAa����h�{.�;�6�7��EK) c��      P	   '  x���_O�0ş�S�O��0�="C�0�ML��F()�q��.m�����=礖���^��Rb$8��S@�8�!�5d�ZW��p+�����Q�0/�'/�8�9m�ᓖ�N�2�(�K��%u� �F�r�^�Y�?�8;�L�Ӎ�<)����rxk�	Olm���l���\��Z��|&n�x���<cz�Ie���r,��K��nUvO��A�}�kO
o�0�ڙ�v,��%�`�{�*>i���s$[�������j�Q��ΠȿS��L�;�Q��U�63�|�.L��mg�      Q	   �   x���K
�@D�3��H>'�`�0(ĐU6mla`��1��r/�YdSUPţv�^֮�Nen�4�!�(1!w�{�>��axy	�	�[4�b�k�3�7��5�oJ�A�S�ⒻGS߮�/&���u�N*�k�=��$��Т��w�D3�Ȭ�_ŵh�      R	   �   x����
�0���S�	�>!�F��E��#�-]����{L�/ߟCe��е����q�Z�&�B�vA�3n�<��� H��!�B����A�2	�@�9?9M�9j����w��Z���<S.���uڅ0���x�Ip����U`����Vc^\�R�      S	   1   x�3�tqus�	��,�WHIU(�,�,IT(�/��KsJ��b���� ��      V	      x������ � �      T	   2  x���Kn9���S��or�<��83Af�� �"Y�5nw-i��6Yf�U���M��ĭx�2��]_�ſ~�	���v��(Hy�LI����N�(^�p�[��W29+���-�R��QV�!p��u�����VWxF<x7\�r����b�.�Sgp�=��v�٢xFӰ�8�bH�ҩ���0�N&���O%G����著�T�xD��P����k��Q�V|I����݉J�# "Ze�YT&��e�dS��%�Jc(�� X���]����:-�w��q���������?W�xEy;Nk�#׿Z0ug����)Ӝ�|���4������Z��8�2Mg�SLӚz�����A/1�7�u��vN��i��'��;���N�^K]g�j��Z�����ȵgN[�Z��U:zk��%�e�ީ���Kh�B�P��<xh�*����;�"�g�Om����U�'�ؤB�VC*�d�dYP�\T��G��{p�h�2v���������o~������2<�ZجjY1$k=ώ�RB���P�q�3
,�s�w<4�e>̽�?�5�L���ܜy
�
WS��L%ɯ���hX����������4�g�1CJ��6r�G�����$�a�6s�b)Xv6�1W�}�i��N�HN�6a�PRRN�.*bǅZ�B�]���9L���p�0 ~Z����N�Ocq%�������A����Z�#�Y�-1R4le��K܍`}�e�^s]��&��5��j�����X���;k2�誈���^F�jBP�n��)�����#h)XwAs���X�	r����Q<�~�jM��d�*ڱ@�R(I�� e6��ʪy�8#9;�l�V~�VŦ�{�;������}~����O6���?R�����A;�s��*��V�����QY� K��ȑ��W����^����m=�E�Jk.�b�Uɓ���͠�^�3���X��Le�)��_���ԏ�r��.����,�A�T���9*���褷Т�˙9��K���^�om���y�y��TFq�����u��kc|$��+�{��:�!���&��Ǣ��dzfrc��mZ��ZίGn(�(5W�9i�#G!��Vmy��I��u���"?'E+������Kv|��
�� ��8lqB�E�m��T0�0��b"�T�$���#w7W����$�.��mt���>n5|�\oX�q���ERX"�"��`��s��x9c�{%����40'��/d�\�8���=���S;�.��D�X�J�28\Ѽ���I(���`9y{�+��{��뺿 W�w      U	      x������ � �      W	      x������ � �     