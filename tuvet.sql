--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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
-- Name: administradores; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.administradores (
    admin_id integer NOT NULL,
    admin_nombre character varying(50),
    admin_iniciales character varying(10),
    admin_passwd character varying(25),
    admin_confpasswd character varying(25),
    creadapor character varying(50),
    fecha_creacion date,
    modificada_por character varying(50),
    fecha_modificacion date,
    activosn smallint,
    id_solicitud integer
);


ALTER TABLE public.administradores OWNER TO adolfo;

--
-- Name: administradores_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.administradores_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administradores_admin_id_seq OWNER TO adolfo;

--
-- Name: administradores_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.administradores_admin_id_seq OWNED BY public.administradores.admin_id;


--
-- Name: analisis; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.analisis (
    id integer NOT NULL,
    nombre_analisis character varying(50),
    creado_por character varying(50),
    fecha_creacion date
);


ALTER TABLE public.analisis OWNER TO adolfo;

--
-- Name: analisis_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.analisis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analisis_id_seq OWNER TO adolfo;

--
-- Name: analisis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.analisis_id_seq OWNED BY public.analisis.id;


--
-- Name: analisis_mascota; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.analisis_mascota (
    id integer NOT NULL,
    historial_id integer,
    analisis_id integer
);


ALTER TABLE public.analisis_mascota OWNER TO adolfo;

--
-- Name: analisis_mascota_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.analisis_mascota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analisis_mascota_id_seq OWNER TO adolfo;

--
-- Name: analisis_mascota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.analisis_mascota_id_seq OWNED BY public.analisis_mascota.id;


--
-- Name: atencioncliente; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.atencioncliente (
    atn_id integer NOT NULL,
    atn_nombre character varying(50),
    atn_iniciales character varying(10),
    atn_passwd character varying(25),
    atn_confpasswd character varying(25),
    atnsucursal_asignada integer,
    creadapor character varying(50),
    fecha_creacion date,
    modificada_por character varying(50),
    fecha_modificacion date,
    activosn smallint,
    id_solicitud integer
);


ALTER TABLE public.atencioncliente OWNER TO adolfo;

--
-- Name: atencioncliente_atn_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.atencioncliente_atn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atencioncliente_atn_id_seq OWNER TO adolfo;

--
-- Name: atencioncliente_atn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.atencioncliente_atn_id_seq OWNED BY public.atencioncliente.atn_id;


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    cat_nombre character varying(100),
    cat_descripcion character varying(100),
    creada_por character varying(50),
    fecha_creacion date,
    activosn smallint,
    sucursal character varying(50),
    usuario_modifica character varying(50),
    fecha_modificacion date
);


ALTER TABLE public.categorias OWNER TO adolfo;

--
-- Name: categorias_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.categorias_cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_cat_id_seq OWNER TO adolfo;

--
-- Name: categorias_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.categorias_cat_id_seq OWNED BY public.categorias.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    cliente_nombre character varying(100),
    cliente_tipodoc character varying(50),
    cliente_nodoc character varying(50),
    cliente_giro character varying(100),
    cliente_dir1 character varying(100),
    cliente_dir2 character varying(100),
    cliente_tel character varying(20),
    cliente_correo character varying(50),
    esempresasn integer,
    darcreditosn integer,
    creado_por character varying(50),
    fecha_creacion date,
    usuario_modifica character varying(50),
    fecha_modificacion date,
    cliente_saldos numeric(8,2)
);


ALTER TABLE public.clientes OWNER TO adolfo;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.clientes_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_cliente_id_seq OWNER TO adolfo;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.clientes_cliente_id_seq OWNED BY public.clientes.id;


--
-- Name: componentes; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.componentes (
    id integer NOT NULL,
    componente character varying(50),
    indicaciones character varying(100),
    creadapor character varying(50),
    fecha_creacion date,
    activosn smallint
);


ALTER TABLE public.componentes OWNER TO adolfo;

--
-- Name: componentes_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.componentes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.componentes_id_seq OWNER TO adolfo;

--
-- Name: componentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.componentes_id_seq OWNED BY public.componentes.id;


--
-- Name: comprasdetalle; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.comprasdetalle (
    id integer NOT NULL,
    compra_id integer,
    producto_codbarra character varying(25),
    producto_cantidad integer,
    producto_bonificacion integer,
    producto_cantidadtotal integer,
    producto_costo numeric(8,2),
    producto_subtotal numeric(8,2),
    producto_porciva numeric(8,2),
    producto_totallinea numeric(8,2),
    producto_costopromedio numeric(8,2)
);


ALTER TABLE public.comprasdetalle OWNER TO adolfo;

--
-- Name: comprasdetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.comprasdetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprasdetalle_id_seq OWNER TO adolfo;

--
-- Name: comprasdetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.comprasdetalle_id_seq OWNED BY public.comprasdetalle.id;


--
-- Name: comprasproductos; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.comprasproductos (
    id integer NOT NULL,
    proveedor_id integer NOT NULL,
    compra_condicion character varying(50),
    compra_fecha date,
    compra_nodoc character varying(50),
    compra_subtotal numeric(8,2),
    compra_montoiva numeric(8,2),
    compra_montoretencion numeric(8,2),
    compra_total numeric(8,2)
);


ALTER TABLE public.comprasproductos OWNER TO adolfo;

--
-- Name: comprasproductos_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.comprasproductos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comprasproductos_id_seq OWNER TO adolfo;

--
-- Name: comprasproductos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.comprasproductos_id_seq OWNED BY public.comprasproductos.id;


--
-- Name: contador; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.contador (
    id integer NOT NULL,
    nombre character varying(50),
    iniciales character varying(50),
    passwd character varying(50),
    confpasswd character varying(50),
    fecha_creacion date,
    activosn integer,
    creadapor character varying(50),
    modificada_por character varying(50),
    fecha_modificacion date,
    id_solicitud integer
);


ALTER TABLE public.contador OWNER TO adolfo;

--
-- Name: contador_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.contador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contador_id_seq OWNER TO adolfo;

--
-- Name: contador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.contador_id_seq OWNED BY public.contador.id;


--
-- Name: dfacturas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.dfacturas (
    id integer NOT NULL,
    fecha date,
    id_hfactura integer,
    cod_barra character varying(50),
    cantidad numeric(8,2),
    precio numeric(8,2),
    subtotal numeric(8,2),
    iva numeric(8,2),
    descuento integer DEFAULT 0,
    total_linea numeric(8,2),
    validado_sn integer,
    monto_descuento numeric(8,2) DEFAULT 0,
    monto_costo numeric(8,2),
    suma_nogravado numeric(8,2),
    suma_gravado numeric(8,2),
    anulada_sn integer,
    CONSTRAINT check_cod_barra_not_null CHECK ((cod_barra IS NOT NULL)),
    CONSTRAINT check_id_hfactura_not_null CHECK ((id_hfactura IS NOT NULL))
);


ALTER TABLE public.dfacturas OWNER TO adolfo;

--
-- Name: dfacturas_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.dfacturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dfacturas_id_seq OWNER TO adolfo;

--
-- Name: dfacturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.dfacturas_id_seq OWNED BY public.dfacturas.id;


--
-- Name: dtraslados; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.dtraslados (
    id integer NOT NULL,
    id_traslado integer,
    cod_barra character varying(50),
    cantidad integer,
    status character varying(50)
);


ALTER TABLE public.dtraslados OWNER TO adolfo;

--
-- Name: dtraslados_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.dtraslados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dtraslados_id_seq OWNER TO adolfo;

--
-- Name: dtraslados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.dtraslados_id_seq OWNED BY public.dtraslados.id;


--
-- Name: errores; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.errores (
    error_id integer NOT NULL,
    descripcion character varying(100),
    fecha date
);


ALTER TABLE public.errores OWNER TO adolfo;

--
-- Name: errores_error_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.errores_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.errores_error_id_seq OWNER TO adolfo;

--
-- Name: errores_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.errores_error_id_seq OWNED BY public.errores.error_id;


--
-- Name: existencias; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.existencias (
    id integer NOT NULL,
    id_sucursal integer,
    codbarra character varying(50),
    existencia integer,
    anaquel character varying(25),
    CONSTRAINT ck_cantidad_positiva CHECK ((existencia >= 0))
);


ALTER TABLE public.existencias OWNER TO adolfo;

--
-- Name: existencias_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.existencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.existencias_id_seq OWNER TO adolfo;

--
-- Name: existencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.existencias_id_seq OWNED BY public.existencias.id;


--
-- Name: extractosclientes; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.extractosclientes (
    id integer NOT NULL,
    cliente_id integer,
    doc_numero character varying(50),
    fecha date,
    cargo numeric(8,2),
    abono numeric(8,2),
    saldo numeric(8,2),
    usuario character varying(50),
    sucursal integer,
    nombre_cliente character varying(100)
);


ALTER TABLE public.extractosclientes OWNER TO adolfo;

--
-- Name: extractosclientes_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.extractosclientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extractosclientes_id_seq OWNER TO adolfo;

--
-- Name: extractosclientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.extractosclientes_id_seq OWNED BY public.extractosclientes.id;


--
-- Name: extractosproveedores; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.extractosproveedores (
    id integer NOT NULL,
    prov_id integer,
    doc_numero character varying(50),
    fecha date,
    cargo numeric(8,2),
    abono numeric(8,2),
    saldo numeric(8,2),
    usuario character varying(50),
    sucursal integer
);


ALTER TABLE public.extractosproveedores OWNER TO adolfo;

--
-- Name: extractosproveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.extractosproveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extractosproveedores_id_seq OWNER TO adolfo;

--
-- Name: extractosproveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.extractosproveedores_id_seq OWNED BY public.extractosproveedores.id;


--
-- Name: gerentes; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.gerentes (
    gerente_id integer NOT NULL,
    gerente_nombre character varying(50),
    gerente_iniciales character varying(10),
    gerente_passwd character varying(25),
    gerente_confpasswd character varying(25),
    creada_por character varying(50),
    fecha_creacion date,
    modificada_por character varying(50),
    fecha_modificacion date,
    gtesucursal_asignada integer,
    activosn smallint,
    id_solicitud integer
);


ALTER TABLE public.gerentes OWNER TO adolfo;

--
-- Name: gerentes_gerente_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.gerentes_gerente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gerentes_gerente_id_seq OWNER TO adolfo;

--
-- Name: gerentes_gerente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.gerentes_gerente_id_seq OWNED BY public.gerentes.gerente_id;


--
-- Name: hfacturas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.hfacturas (
    id integer NOT NULL,
    fecha_creacion date,
    numero_impreso character varying(50),
    id_cliente integer,
    id_sucursal integer,
    id_promo integer,
    subtotal numeric(8,2),
    monto_gravado numeric(8,2),
    impuesto numeric(8,2),
    monto_nogravado numeric(8,2),
    total_linea numeric(8,2),
    descuentos numeric(8,2) DEFAULT 0,
    costo numeric(8,2),
    pago_efectivo numeric(8,2) DEFAULT 0,
    pago_tarjeta numeric(8,2) DEFAULT 0,
    pago_credito numeric(8,2) DEFAULT 0,
    numero_autorizacion character varying(50),
    pagada_sn integer DEFAULT 0,
    creada_por character varying(50),
    cobrada_por character varying(50),
    anulada integer DEFAULT 0,
    anulada_por character varying(50),
    fecha_cobro date,
    fecha_anulacion date,
    nombre_cliente character varying(100),
    condicion_pago character varying(100),
    lineas_factura integer,
    hora_inicio time without time zone,
    hora_final time without time zone
);


ALTER TABLE public.hfacturas OWNER TO adolfo;

--
-- Name: hfacturas_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.hfacturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hfacturas_id_seq OWNER TO adolfo;

--
-- Name: hfacturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.hfacturas_id_seq OWNED BY public.hfacturas.id;


--
-- Name: historial_mascotas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.historial_mascotas (
    id integer NOT NULL,
    mascota_id integer,
    fecha_visita date,
    motivo_visita character varying(50),
    temperatura_mascota character varying(50),
    peso_mascota character varying(50),
    sintomas_mascota character varying(100),
    diagnostico character varying(100),
    proxima_cita date,
    medico_atendio character varying(50),
    sucursal_atendio integer
);


ALTER TABLE public.historial_mascotas OWNER TO adolfo;

--
-- Name: historial_mascotas_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.historial_mascotas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_mascotas_id_seq OWNER TO adolfo;

--
-- Name: historial_mascotas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.historial_mascotas_id_seq OWNED BY public.historial_mascotas.id;


--
-- Name: htraslado; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.htraslado (
    id integer NOT NULL,
    fecha_enviado date,
    fecha_recibido date,
    suc_origen character varying(50),
    suc_destino character varying(50),
    usuario_crea character varying(100),
    usuario_recibe character varying(100),
    estado character varying(50),
    usuario_autoriza character varying(50)
);


ALTER TABLE public.htraslado OWNER TO adolfo;

--
-- Name: htraslado_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.htraslado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.htraslado_id_seq OWNER TO adolfo;

--
-- Name: htraslado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.htraslado_id_seq OWNED BY public.htraslado.id;


--
-- Name: impuestos; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.impuestos (
    imp_id integer NOT NULL,
    imp_nombre character varying(50),
    imp_porc numeric(8,2),
    creado_por character varying(100),
    fecha_creacion date,
    activosn integer,
    modificado_por character varying(100)
);


ALTER TABLE public.impuestos OWNER TO adolfo;

--
-- Name: impuestos_imp_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.impuestos_imp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impuestos_imp_id_seq OWNER TO adolfo;

--
-- Name: impuestos_imp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.impuestos_imp_id_seq OWNED BY public.impuestos.imp_id;


--
-- Name: ippermitidas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.ippermitidas (
    ip_id integer NOT NULL,
    id_sucursal integer,
    ip_asignada character varying(20),
    creada_por character varying(50),
    fecha_creacion date
);


ALTER TABLE public.ippermitidas OWNER TO adolfo;

--
-- Name: ippermitidas_ip_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.ippermitidas_ip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ippermitidas_ip_id_seq OWNER TO adolfo;

--
-- Name: ippermitidas_ip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.ippermitidas_ip_id_seq OWNED BY public.ippermitidas.ip_id;


--
-- Name: kardex; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.kardex (
    id integer NOT NULL,
    sucursal_id integer,
    codbarra character varying(25),
    doc_no character varying(50),
    cant_ingreso integer,
    cant_salio integer,
    anulada integer DEFAULT 0,
    id_hfactura integer,
    fecha_transaccion date
);


ALTER TABLE public.kardex OWNER TO adolfo;

--
-- Name: kardex_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.kardex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kardex_id_seq OWNER TO adolfo;

--
-- Name: kardex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.kardex_id_seq OWNED BY public.kardex.id;


--
-- Name: marcas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.marcas (
    id integer NOT NULL,
    marca_nombre character varying(50),
    marca_paisorigen character varying(25),
    proveedor_id integer,
    creadapor character varying(50),
    fecha_creacion date,
    activosn smallint,
    sucursal_crea character varying(50),
    modificada_por character varying(50),
    fecha_modificacion date
);


ALTER TABLE public.marcas OWNER TO adolfo;

--
-- Name: marcas_marca_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.marcas_marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marcas_marca_id_seq OWNER TO adolfo;

--
-- Name: marcas_marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.marcas_marca_id_seq OWNED BY public.marcas.id;


--
-- Name: mascotas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.mascotas (
    id integer NOT NULL,
    nombre_mascota character varying(50),
    propietario_id integer,
    especie character varying(50),
    raza_id integer,
    edad character varying(50),
    sexo character varying(50),
    tipo_pelo character varying(50),
    color character varying(50),
    tamanio character varying(50),
    caracteristicas character varying(100),
    estado_reproductivo character varying(50),
    chip character varying(50),
    habitat character varying(50),
    dieta character varying(100),
    activa_sn integer,
    usuario_crea character varying(50),
    fecha_creacion date,
    usuario_modifica character varying(50),
    fecha_modificacion date,
    sucursal_crea character varying(50)
);


ALTER TABLE public.mascotas OWNER TO adolfo;

--
-- Name: mascotas_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.mascotas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mascotas_id_seq OWNER TO adolfo;

--
-- Name: mascotas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.mascotas_id_seq OWNED BY public.mascotas.id;


--
-- Name: mvz; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.mvz (
    mvz_id integer NOT NULL,
    mvz_nombre character varying(50),
    mvz_iniciales character varying(10),
    mvz_passwd character varying(25),
    mvz_confpasswd character varying(25),
    mvzsucursal_asignada integer,
    fecha_creacion date,
    creada_por character varying(50),
    modificada_por character varying(50),
    fecha_modificacion date,
    activosn smallint,
    id_solicitud integer
);


ALTER TABLE public.mvz OWNER TO adolfo;

--
-- Name: mvz_mvz_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.mvz_mvz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mvz_mvz_id_seq OWNER TO adolfo;

--
-- Name: mvz_mvz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.mvz_mvz_id_seq OWNED BY public.mvz.mvz_id;


--
-- Name: paises; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.paises (
    id integer NOT NULL,
    nombre_pais character varying(100)
);


ALTER TABLE public.paises OWNER TO adolfo;

--
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.paises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paises_id_seq OWNER TO adolfo;

--
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    prod_codbarra character varying(50),
    prod_nombre character varying(150),
    prod_univenta character varying(30),
    id_marca integer,
    id_categorias integer,
    id_subcategoria integer,
    prod_compraminima integer DEFAULT 0,
    prod_distminima integer DEFAULT 0,
    prod_esgravadosn integer,
    prod_costopromedio numeric(8,2) DEFAULT 0,
    prod_markup numeric(8,2) DEFAULT 0,
    prod_preciopublico numeric(8,2) DEFAULT 0,
    prod_porcdescuento numeric(4,2),
    descuento_unidad numeric(8,2) DEFAULT 0,
    creado_por character varying(50),
    fecha_creacion date,
    foto bytea,
    prod_esinventariosn integer,
    prod_ultimocosto numeric(8,2) DEFAULT 0,
    escalas character varying(100),
    activosn integer,
    codigo_impuesto integer,
    porcentaje_impuesto numeric(8,2),
    prod_ventaminima integer,
    modificada_por character varying(50),
    fecha_modificacion date,
    sucursal_crea character varying(50)
);


ALTER TABLE public.productos OWNER TO adolfo;

--
-- Name: productos_prod_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.productos_prod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_prod_id_seq OWNER TO adolfo;

--
-- Name: productos_prod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.productos_prod_id_seq OWNED BY public.productos.id;


--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.proveedores (
    id integer NOT NULL,
    prov_nombre character varying(100),
    prov_nit character varying(20),
    prov_nrc character varying(20),
    prov_nombrecheque character varying(50),
    prov_ldireccion1 character varying(100),
    prov_ldireccion2 character varying(100),
    prov_telefono character varying(15),
    prov_correo character varying(100),
    prov_nombrecontacto character varying(50),
    creadapor character varying(50),
    fecha_creacion date,
    modificada_por character varying(50),
    fecha_modificacion date,
    activosn smallint,
    sucursal_crea character varying(50),
    saldo numeric(8,2)
);


ALTER TABLE public.proveedores OWNER TO adolfo;

--
-- Name: proveedores_prov_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.proveedores_prov_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedores_prov_id_seq OWNER TO adolfo;

--
-- Name: proveedores_prov_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.proveedores_prov_id_seq OWNED BY public.proveedores.id;


--
-- Name: puntosdereorden; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.puntosdereorden (
    id integer NOT NULL,
    id_sucursal integer,
    codbarra character varying(50),
    ptoreorden integer,
    creadopor character varying(50),
    fecha_creacion date,
    modificadopor character varying(50),
    fecha_modificacion date,
    id_producto integer
);


ALTER TABLE public.puntosdereorden OWNER TO adolfo;

--
-- Name: puntosdereorden_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.puntosdereorden_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puntosdereorden_id_seq OWNER TO adolfo;

--
-- Name: puntosdereorden_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.puntosdereorden_id_seq OWNED BY public.puntosdereorden.id;


--
-- Name: razas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.razas (
    id integer NOT NULL,
    nombre_raza character varying(50),
    nombre_especie character varying(50),
    usuario_crea character varying(50),
    fecha_creacion date,
    sucursal_crea character varying(50)
);


ALTER TABLE public.razas OWNER TO adolfo;

--
-- Name: razas_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.razas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.razas_id_seq OWNER TO adolfo;

--
-- Name: razas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.razas_id_seq OWNED BY public.razas.id;


--
-- Name: recetas; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.recetas (
    id integer NOT NULL,
    historial_id integer,
    medicamento character varying(50),
    dosis character varying(50)
);


ALTER TABLE public.recetas OWNER TO adolfo;

--
-- Name: recetas_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.recetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recetas_id_seq OWNER TO adolfo;

--
-- Name: recetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.recetas_id_seq OWNED BY public.recetas.id;


--
-- Name: solicitudcontrasenia; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.solicitudcontrasenia (
    id integer NOT NULL,
    nombreusuario character varying(50),
    correousuario character varying(50),
    rolusuario character varying(50),
    ipsolicitud character varying(20),
    fecha_solicitud date,
    iniciales character varying(50),
    procesadosn integer,
    passwd character varying(50),
    confpasswd character varying(50)
);


ALTER TABLE public.solicitudcontrasenia OWNER TO adolfo;

--
-- Name: solicitudcontrasenia_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.solicitudcontrasenia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitudcontrasenia_id_seq OWNER TO adolfo;

--
-- Name: solicitudcontrasenia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.solicitudcontrasenia_id_seq OWNED BY public.solicitudcontrasenia.id;


--
-- Name: subcategorias; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.subcategorias (
    sub_id integer NOT NULL,
    sub_nombre character varying(30),
    categoria_id integer,
    creada_por character varying(50),
    fecha_creacion date,
    activosn smallint
);


ALTER TABLE public.subcategorias OWNER TO adolfo;

--
-- Name: subcategorias_sub_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.subcategorias_sub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategorias_sub_id_seq OWNER TO adolfo;

--
-- Name: subcategorias_sub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.subcategorias_sub_id_seq OWNED BY public.subcategorias.sub_id;


--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: adolfo
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    sucursal_nombre character varying(30),
    sucursal_direccion character varying(150),
    sucursal_tel character varying(15),
    sucursal_cel character varying(15),
    creada_por character varying(50),
    fecha_creacion date,
    fecha_modificacion date,
    modificado_por character varying(50)
);


ALTER TABLE public.sucursales OWNER TO adolfo;

--
-- Name: sucursales_sucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: adolfo
--

CREATE SEQUENCE public.sucursales_sucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursales_sucursal_id_seq OWNER TO adolfo;

--
-- Name: sucursales_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adolfo
--

ALTER SEQUENCE public.sucursales_sucursal_id_seq OWNED BY public.sucursales.id;


--
-- Name: administradores admin_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.administradores ALTER COLUMN admin_id SET DEFAULT nextval('public.administradores_admin_id_seq'::regclass);


--
-- Name: analisis id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.analisis ALTER COLUMN id SET DEFAULT nextval('public.analisis_id_seq'::regclass);


--
-- Name: analisis_mascota id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.analisis_mascota ALTER COLUMN id SET DEFAULT nextval('public.analisis_mascota_id_seq'::regclass);


--
-- Name: atencioncliente atn_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.atencioncliente ALTER COLUMN atn_id SET DEFAULT nextval('public.atencioncliente_atn_id_seq'::regclass);


--
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_cat_id_seq'::regclass);


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_cliente_id_seq'::regclass);


--
-- Name: componentes id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.componentes ALTER COLUMN id SET DEFAULT nextval('public.componentes_id_seq'::regclass);


--
-- Name: comprasdetalle id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasdetalle ALTER COLUMN id SET DEFAULT nextval('public.comprasdetalle_id_seq'::regclass);


--
-- Name: comprasproductos id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasproductos ALTER COLUMN id SET DEFAULT nextval('public.comprasproductos_id_seq'::regclass);


--
-- Name: contador id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.contador ALTER COLUMN id SET DEFAULT nextval('public.contador_id_seq'::regclass);


--
-- Name: dfacturas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dfacturas ALTER COLUMN id SET DEFAULT nextval('public.dfacturas_id_seq'::regclass);


--
-- Name: dtraslados id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dtraslados ALTER COLUMN id SET DEFAULT nextval('public.dtraslados_id_seq'::regclass);


--
-- Name: errores error_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.errores ALTER COLUMN error_id SET DEFAULT nextval('public.errores_error_id_seq'::regclass);


--
-- Name: existencias id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.existencias ALTER COLUMN id SET DEFAULT nextval('public.existencias_id_seq'::regclass);


--
-- Name: extractosclientes id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.extractosclientes ALTER COLUMN id SET DEFAULT nextval('public.extractosclientes_id_seq'::regclass);


--
-- Name: extractosproveedores id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.extractosproveedores ALTER COLUMN id SET DEFAULT nextval('public.extractosproveedores_id_seq'::regclass);


--
-- Name: gerentes gerente_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.gerentes ALTER COLUMN gerente_id SET DEFAULT nextval('public.gerentes_gerente_id_seq'::regclass);


--
-- Name: hfacturas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.hfacturas ALTER COLUMN id SET DEFAULT nextval('public.hfacturas_id_seq'::regclass);


--
-- Name: historial_mascotas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.historial_mascotas ALTER COLUMN id SET DEFAULT nextval('public.historial_mascotas_id_seq'::regclass);


--
-- Name: htraslado id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.htraslado ALTER COLUMN id SET DEFAULT nextval('public.htraslado_id_seq'::regclass);


--
-- Name: impuestos imp_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.impuestos ALTER COLUMN imp_id SET DEFAULT nextval('public.impuestos_imp_id_seq'::regclass);


--
-- Name: ippermitidas ip_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.ippermitidas ALTER COLUMN ip_id SET DEFAULT nextval('public.ippermitidas_ip_id_seq'::regclass);


--
-- Name: kardex id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.kardex ALTER COLUMN id SET DEFAULT nextval('public.kardex_id_seq'::regclass);


--
-- Name: marcas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.marcas ALTER COLUMN id SET DEFAULT nextval('public.marcas_marca_id_seq'::regclass);


--
-- Name: mascotas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mascotas ALTER COLUMN id SET DEFAULT nextval('public.mascotas_id_seq'::regclass);


--
-- Name: mvz mvz_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mvz ALTER COLUMN mvz_id SET DEFAULT nextval('public.mvz_mvz_id_seq'::regclass);


--
-- Name: paises id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_prod_id_seq'::regclass);


--
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_prov_id_seq'::regclass);


--
-- Name: puntosdereorden id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.puntosdereorden ALTER COLUMN id SET DEFAULT nextval('public.puntosdereorden_id_seq'::regclass);


--
-- Name: razas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.razas ALTER COLUMN id SET DEFAULT nextval('public.razas_id_seq'::regclass);


--
-- Name: recetas id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.recetas ALTER COLUMN id SET DEFAULT nextval('public.recetas_id_seq'::regclass);


--
-- Name: solicitudcontrasenia id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.solicitudcontrasenia ALTER COLUMN id SET DEFAULT nextval('public.solicitudcontrasenia_id_seq'::regclass);


--
-- Name: subcategorias sub_id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.subcategorias ALTER COLUMN sub_id SET DEFAULT nextval('public.subcategorias_sub_id_seq'::regclass);


--
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_sucursal_id_seq'::regclass);


--
-- Data for Name: administradores; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.administradores (admin_id, admin_nombre, admin_iniciales, admin_passwd, admin_confpasswd, creadapor, fecha_creacion, modificada_por, fecha_modificacion, activosn, id_solicitud) FROM stdin;
1	Admin	Admin	7uv372023	7uv372023	Script BD	2023-10-25	\N	\N	1	\N
\.


--
-- Data for Name: analisis; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.analisis (id, nombre_analisis, creado_por, fecha_creacion) FROM stdin;
\.


--
-- Data for Name: analisis_mascota; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.analisis_mascota (id, historial_id, analisis_id) FROM stdin;
\.


--
-- Data for Name: atencioncliente; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.atencioncliente (atn_id, atn_nombre, atn_iniciales, atn_passwd, atn_confpasswd, atnsucursal_asignada, creadapor, fecha_creacion, modificada_por, fecha_modificacion, activosn, id_solicitud) FROM stdin;
\.


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.categorias (id, cat_nombre, cat_descripcion, creada_por, fecha_creacion, activosn, sucursal, usuario_modifica, fecha_modificacion) FROM stdin;
2	Accesorios para mascota	\N	Admin	2023-10-23	1	1	\N	\N
28	Alimento Conejos	\N	Admin	2023-10-23	1	1	\N	\N
37	Alimento en Pouch	\N	Admin	2023-10-23	1	1	\N	\N
27	Alimento Pajaros	\N	Admin	2023-10-23	1	1	\N	\N
1	Alimento Premium	\N	Admin	2023-10-23	1	1	\N	\N
8	Alimento Varios	\N	Admin	2023-10-23	1	1	\N	\N
30	Alimentos enlatados	\N	Admin	2023-10-23	1	1	\N	\N
10	Antiparasitarios Externos	\N	Admin	2023-10-23	1	1	\N	\N
7	Aplicaciones de Medicamentos	\N	Admin	2023-10-23	1	1	\N	\N
6	Biologicos	Vacunas	Admin	2023-10-23	1	1	\N	\N
25	Camas	\N	Admin	2023-10-23	1	1	\N	\N
20	Cirugias	\N	Admin	2023-10-23	1	1	\N	\N
23	Collares y Arneses	\N	Admin	2023-10-23	1	1	\N	\N
3	Cosmeticos Medicados	jabones y ondas asi	Admin	2023-10-23	1	1	\N	\N
34	Desparasitantes externos	\N	Admin	2023-10-23	1	1	\N	\N
35	Dispensadores de Alimento y Agua	\N	Admin	2023-10-23	1	1	\N	\N
24	Higiene Mascotas	\N	Admin	2023-10-23	1	1	\N	\N
14	Imágenes	\N	Admin	2023-10-23	1	1	\N	\N
4	Insecticidas	soluciones para fumigar	Admin	2023-10-23	1	1	\N	\N
31	Isabelinos	\N	Admin	2023-10-23	1	1	\N	\N
26	Jaulas	\N	Admin	2023-10-23	1	1	\N	\N
32	Jaulas y Kennel	\N	Admin	2023-10-23	1	1	\N	\N
22	Juguetes	\N	Admin	2023-10-23	1	1	\N	\N
12	Laboratorio Clinico	\N	Admin	2023-10-23	1	1	\N	\N
21	Laboratorio de Patologia	\N	Admin	2023-10-23	1	1	\N	\N
5	Medicamentos	\N	Admin	2023-10-23	1	1	\N	\N
33	Pipetas Desparasitantes	\N	Admin	2023-10-23	1	1	\N	\N
29	Premios Mascota	\N	Admin	2023-10-23	1	1	\N	\N
19	Promociones	Promocion entre Analiza-TuVet; de ser necesario solamente parta TuVet	Admin	2023-10-23	1	1	\N	\N
13	Rayos X	\N	Admin	2023-10-23	1	1	\N	\N
15	Ropa	Accesorios para mascotas, ropa, vestidos	Admin	2023-10-23	1	1	\N	\N
16	Servicio a domicilio	\N	Admin	2023-10-23	1	1	\N	\N
11	Servicios	\N	Admin	2023-10-23	1	1	\N	\N
18	Servicios Peluqueria	baño, corte, uñas	Admin	2023-10-23	1	1	\N	\N
17	Servicios Veterinarios	consultas, procedimientos	Admin	2023-10-23	1	1	\N	\N
36	Vacunas	\N	Admin	2023-10-23	1	1	\N	\N
9	Varios	\N	Admin	2023-10-23	1	1	\N	\N
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.clientes (id, cliente_nombre, cliente_tipodoc, cliente_nodoc, cliente_giro, cliente_dir1, cliente_dir2, cliente_tel, cliente_correo, esempresasn, darcreditosn, creado_por, fecha_creacion, usuario_modifica, fecha_modificacion, cliente_saldos) FROM stdin;
1	Consumidor Final	DUI	00000000-0	no	San Salvador	El Salvador	(503)00000000	correo@yaju.com	0	0	Admin	2023-10-26	\N	\N	0.00
\.


--
-- Data for Name: componentes; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.componentes (id, componente, indicaciones, creadapor, fecha_creacion, activosn) FROM stdin;
\.


--
-- Data for Name: comprasdetalle; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.comprasdetalle (id, compra_id, producto_codbarra, producto_cantidad, producto_bonificacion, producto_cantidadtotal, producto_costo, producto_subtotal, producto_porciva, producto_totallinea, producto_costopromedio) FROM stdin;
\.


--
-- Data for Name: comprasproductos; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.comprasproductos (id, proveedor_id, compra_condicion, compra_fecha, compra_nodoc, compra_subtotal, compra_montoiva, compra_montoretencion, compra_total) FROM stdin;
\.


--
-- Data for Name: contador; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.contador (id, nombre, iniciales, passwd, confpasswd, fecha_creacion, activosn, creadapor, modificada_por, fecha_modificacion, id_solicitud) FROM stdin;
\.


--
-- Data for Name: dfacturas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.dfacturas (id, fecha, id_hfactura, cod_barra, cantidad, precio, subtotal, iva, descuento, total_linea, validado_sn, monto_descuento, monto_costo, suma_nogravado, suma_gravado, anulada_sn) FROM stdin;
1	2023-10-26	1	017800142731	1.00	2.64	2.64	0.34	0	2.98	0	0.00	2.22	0.00	2.64	\N
2	2023-10-26	1	100	1.00	0.00	0.00	0.00	0	0.00	0	0.00	0.00	0.00	0.00	\N
3	2023-10-26	1	052742040141	1.00	45.00	45.00	5.85	0	50.85	0	0.00	34.61	0.00	45.00	\N
4	2023-10-26	1	K9-L	1.00	18.34	18.34	2.38	0	20.72	0	0.00	0.00	0.00	18.34	\N
\.


--
-- Data for Name: dtraslados; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.dtraslados (id, id_traslado, cod_barra, cantidad, status) FROM stdin;
\.


--
-- Data for Name: errores; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.errores (error_id, descripcion, fecha) FROM stdin;
\.


--
-- Data for Name: existencias; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.existencias (id, id_sucursal, codbarra, existencia, anaquel) FROM stdin;
2	1	01	0	ninguno
3	1	017800142731	3	ninguno
4	1	017800156424	1	ninguno
5	1	017800156448	8	ninguno
6	1	017800165426	2	ninguno
7	1	017800174152	3	ninguno
8	1	017800174220	4	ninguno
9	1	017800176262	0	ninguno
10	1	018065055583	3	ninguno
11	1	018065057655	3	ninguno
12	1	018065057686	2	ninguno
13	1	018065057792	2	ninguno
14	1	018214812784	1	ninguno
15	1	018214812791	0	ninguno
16	1	018214816218	2	ninguno
17	1	018214846307	1	ninguno
18	1	020279991335	2	ninguno
19	1	020279992998	1	ninguno
20	1	020279995173	2	ninguno
21	1	020279995227	1	ninguno
22	1	020531	0	ninguno
23	1	030172013829	1	ninguno
24	1	030172013850	2	ninguno
25	1	034846730012	0	ninguno
26	1	034846730029	2	ninguno
27	1	034846730104	3	ninguno
28	1	034846730111	0	ninguno
29	1	034846730227	1	ninguno
30	1	034846730319	0	ninguno
31	1	034846730326	2	ninguno
32	1	034846730401	2	ninguno
33	1	034846730418	0	ninguno
34	1	034846730500	0	ninguno
35	1	034846730517	0	ninguno
36	1	034846730609	0	ninguno
37	1	034846730708	0	ninguno
38	1	034846730715	0	ninguno
39	1	034846730814	1	ninguno
40	1	034846730821	3	ninguno
41	1	034846730937	0	ninguno
42	1	035585034003	0	ninguno
43	1	035585111117	0	ninguno
44	1	035585111216	0	ninguno
45	1	035585111315	1	ninguno
46	1	038100001306	8	ninguno
47	1	038100171207	9	ninguno
48	1	045663970062	1	ninguno
49	1	045663970079	2	ninguno
50	1	045663970086	1	ninguno
51	1	045663970093	3	ninguno
52	1	045663970109	0	ninguno
53	1	045663976170	0	ninguno
54	1	045663976194	0	ninguno
55	1	052742001135	1	ninguno
56	1	052742001197	1	ninguno
57	1	052742001746	6	ninguno
58	1	052742005188	9	ninguno
59	1	052742005355	10	ninguno
60	1	052742009971	0	ninguno
61	1	052742012032	1	ninguno
62	1	052742014296	6	ninguno
63	1	052742014531	1	ninguno
64	1	052742014555	5	ninguno
65	1	052742020419	2	ninguno
66	1	052742020488	5	ninguno
67	1	052742024530	1	ninguno
68	1	052742040141	1	ninguno
69	1	052742187501	5	ninguno
70	1	052742187907	9	ninguno
71	1	052742195704	6	ninguno
72	1	052742297200	2	ninguno
73	1	052742335902	1	ninguno
74	1	052742339009	14	ninguno
75	1	052742453606	3	ninguno
76	1	052742462806	19	ninguno
77	1	052742567006	24	ninguno
78	1	052742623801	11	ninguno
79	1	052742624709	8	ninguno
80	1	052742648606	5	ninguno
81	1	052742679709	11	ninguno
82	1	052742700106	10	ninguno
83	1	052742700809	26	ninguno
84	1	052742701004	12	ninguno
85	1	052742701103	2	ninguno
86	1	052742701608	4	ninguno
87	1	052742701806	13	ninguno
88	1	052742703602	3	ninguno
89	1	052742703701	12	ninguno
90	1	052742705507	5	ninguno
91	1	052742710402	2	ninguno
92	1	052742712307	6	ninguno
93	1	052742713304	1	ninguno
94	1	052742713908	9	ninguno
95	1	052742715605	6	ninguno
96	1	052742790107	0	ninguno
97	1	052742818306	0	ninguno
98	1	052742855509	0	ninguno
99	1	052742861807	4	ninguno
100	1	052742862101	2	ninguno
101	1	052742862309	1	ninguno
102	1	052742862408	6	ninguno
103	1	052742867106	6	ninguno
104	1	052742867601	1	ninguno
105	1	052742909400	2	ninguno
106	1	052742909608	4	ninguno
107	1	052742909806	2	ninguno
108	1	052742910000	1	ninguno
109	1	052742930107	1	ninguno
110	1	052742936802	3	ninguno
111	1	070230107107	9	ninguno
112	1	070230117168	2	ninguno
113	1	073893212546	1	ninguno
114	1	073893212553	3	ninguno
115	1	073893223009	0	ninguno
116	1	073893260035	2	ninguno
117	1	073893260042	5	ninguno
118	1	073893260066	1	ninguno
119	1	073893263036	1	ninguno
120	1	073893264026	2	ninguno
121	1	073893265030	2	ninguno
122	1	073893280002	1	ninguno
123	1	074198612239	0	ninguno
124	1	074198612277	6	ninguno
125	1	074198612314	0	ninguno
126	1	074198612345	0	ninguno
127	1	074198612383	0	ninguno
128	1	074198612413	3	ninguno
129	1	074198612451	4	ninguno
130	1	074198612499	5	ninguno
131	1	074198613311	7	ninguno
132	1	074198613359	1	ninguno
133	1	074198614233	0	ninguno
134	1	074198614240	0	ninguno
135	1	074198614257	0	ninguno
136	1	074198614264	1	ninguno
137	1	074198615117	2	ninguno
138	1	074198615131	3	ninguno
139	1	074198615179	4	ninguno
140	1	074198615261	4	ninguno
141	1	074198615308	3	ninguno
142	1	074198615391	1	ninguno
143	1	074198615476	3	ninguno
144	1	074198615513	4	ninguno
145	1	07419861561	0	ninguno
146	1	074198615612	2	ninguno
147	1	074198615636	3	ninguno
148	1	077627101182	0	ninguno
149	1	077627101229	6	ninguno
150	1	077627101274	0	ninguno
151	1	077627101342	0	ninguno
152	1	077627200991	0	ninguno
153	1	077627201028	0	ninguno
154	1	077627201066	0	ninguno
155	1	077627201349	0	ninguno
156	1	077627201356	0	ninguno
157	1	077627302015	0	ninguno
158	1	08003330160	18	ninguno
159	1	087219111529	1	ninguno
160	1	087219113776	3	ninguno
161	1	087219116012	11	ninguno
162	1	087219117439	19	ninguno
163	1	087219120873	3	ninguno
164	1	1	0	ninguno
165	1	10	137	ninguno
166	1	100	0	ninguno
167	1	101	0	ninguno
168	1	102	0	ninguno
169	1	103	0	ninguno
170	1	104	0	ninguno
171	1	105	0	ninguno
172	1	106	0	ninguno
173	1	107	0	ninguno
174	1	108	0	ninguno
175	1	109	0	ninguno
176	1	11	99	ninguno
177	1	110	0	ninguno
178	1	111	0	ninguno
179	1	112	0	ninguno
180	1	113	0	ninguno
181	1	114	0	ninguno
182	1	115	0	ninguno
183	1	116	0	ninguno
184	1	117	0	ninguno
185	1	118	0	ninguno
186	1	119	0	ninguno
187	1	120	0	ninguno
188	1	121	0	ninguno
189	1	122	0	ninguno
190	1	123	0	ninguno
191	1	1234567890128	0	ninguno
192	1	124	0	ninguno
193	1	125	0	ninguno
194	1	126	0	ninguno
195	1	127	0	ninguno
196	1	128	0	ninguno
197	1	129	0	ninguno
198	1	130	0	ninguno
199	1	131	0	ninguno
200	1	132	0	ninguno
201	1	133	0	ninguno
202	1	134	0	ninguno
203	1	135	0	ninguno
204	1	136	0	ninguno
205	1	137	0	ninguno
206	1	138	0	ninguno
207	1	139	0	ninguno
208	1	140	0	ninguno
209	1	141	0	ninguno
210	1	142	0	ninguno
211	1	1421	21	ninguno
212	1	143	0	ninguno
213	1	144	0	ninguno
214	1	145	0	ninguno
215	1	146	0	ninguno
216	1	147	0	ninguno
217	1	148	0	ninguno
218	1	149	0	ninguno
219	1	150	0	ninguno
220	1	151	0	ninguno
221	1	152	0	ninguno
222	1	153	0	ninguno
223	1	154	0	ninguno
224	1	155	0	ninguno
225	1	156	0	ninguno
226	1	157	0	ninguno
227	1	158	0	ninguno
228	1	159	0	ninguno
229	1	160	0	ninguno
230	1	161	0	ninguno
231	1	16182	0	ninguno
232	1	162	0	ninguno
233	1	163	0	ninguno
234	1	164	0	ninguno
235	1	166	0	ninguno
236	1	167	0	ninguno
237	1	170	99	ninguno
238	1	178988989	0	ninguno
239	1	181	0	ninguno
240	1	182	10	ninguno
241	1	18214816218	0	ninguno
242	1	183	0	ninguno
243	1	184	0	ninguno
244	1	185	0	ninguno
245	1	186	0	ninguno
246	1	187	0	ninguno
247	1	188	0	ninguno
248	1	189	0	ninguno
249	1	190	0	ninguno
250	1	191	0	ninguno
251	1	192	0	ninguno
252	1	194	0	ninguno
253	1	195	0	ninguno
254	1	196	0	ninguno
255	1	20	57	ninguno
256	1	200	0	ninguno
257	1	2009073936	2	ninguno
258	1	208400	1	ninguno
259	1	21	0	ninguno
260	1	22	0	ninguno
261	1	22095	0	ninguno
262	1	22108	0	ninguno
263	1	22109	0	ninguno
264	1	23	0	ninguno
265	1	25026	226	ninguno
266	1	25027	42	ninguno
267	1	27003	5	ninguno
268	1	30	0	ninguno
269	1	300	0	ninguno
270	1	301	0	ninguno
271	1	302	0	ninguno
272	1	303	0	ninguno
273	1	304	0	ninguno
274	1	305	0	ninguno
275	1	306	0	ninguno
276	1	307	0	ninguno
277	1	308	0	ninguno
278	1	309	0	ninguno
279	1	31	0	ninguno
280	1	310	0	ninguno
281	1	311	0	ninguno
282	1	312	0	ninguno
283	1	313	0	ninguno
284	1	314	0	ninguno
285	1	315	0	ninguno
286	1	316	0	ninguno
287	1	317	0	ninguno
288	1	318	0	ninguno
289	1	3182550402132	1	ninguno
290	1	3182550402149	2	ninguno
291	1	3182550402170	10	ninguno
292	1	3182550402224	2	ninguno
293	1	3182550402439	1	ninguno
294	1	3182550702201	3	ninguno
295	1	3182550702225	1	ninguno
296	1	3182550702423	3	ninguno
297	1	3182550702447	2	ninguno
298	1	3182550702614	1	ninguno
299	1	3182550708180	4	ninguno
300	1	3182550708197	1	ninguno
301	1	3182550708203	2	ninguno
302	1	3182550710923	3	ninguno
303	1	3182550710992	1	ninguno
304	1	3182550711036	3	ninguno
305	1	3182550711050	3	ninguno
306	1	3182550711142	1	ninguno
307	1	3182550711159	1	ninguno
308	1	3182550711333	1	ninguno
309	1	3182550711395	1	ninguno
310	1	3182550716857	1	ninguno
311	1	3182550716888	1	ninguno
312	1	3182550716925	1	ninguno
313	1	3182550717687	1	ninguno
314	1	3182550718813	6	ninguno
315	1	3182550727822	7	ninguno
316	1	3182550728102	1	ninguno
317	1	3182550730587	2	ninguno
318	1	3182550731355	2	ninguno
319	1	3182550732055	1	ninguno
320	1	3182550732154	3	ninguno
321	1	3182550743433	1	ninguno
322	1	3182550743440	0	ninguno
323	1	3182550768474	2	ninguno
324	1	3182550771054	2	ninguno
325	1	3182550771061	1	ninguno
326	1	3182550771719	1	ninguno
327	1	3182550771733	1	ninguno
328	1	3182550775267	0	ninguno
329	1	3182550778657	2	ninguno
330	1	3182550778671	0	ninguno
331	1	3182550793001	3	ninguno
332	1	3182550793032	2	ninguno
333	1	3182550793049	3	ninguno
334	1	3182550798945	3	ninguno
335	1	3182550799768	2	ninguno
336	1	3182550831086	1	ninguno
337	1	3182550831383	1	ninguno
338	1	3182550831390	2	ninguno
339	1	319	0	ninguno
340	1	32	0	ninguno
341	1	320	0	ninguno
342	1	321	0	ninguno
343	1	322	0	ninguno
344	1	323	0	ninguno
345	1	33	0	ninguno
346	1	33015	2	ninguno
347	1	33016	2	ninguno
348	1	33059	2	ninguno
349	1	3411112261956	2	ninguno
350	1	350	0	ninguno
351	1	3552793078300	2	ninguno
352	1	3552793078324	0	ninguno
353	1	40	0	ninguno
354	1	400	0	ninguno
355	1	4007221039112	2	ninguno
356	1	4007221039129	3	ninguno
357	1	4007221043218	194	ninguno
358	1	4007221052180	15	ninguno
359	1	4007221054221	2	ninguno
360	1	401	431	ninguno
361	1	402	0	ninguno
362	1	403	0	ninguno
363	1	404	0	ninguno
364	1	41	0	ninguno
365	1	41006	0	ninguno
366	1	41013	2	ninguno
367	1	41019	0	ninguno
368	1	412	0	ninguno
369	1	415	0	ninguno
370	1	416	0	ninguno
371	1	42	0	ninguno
372	1	4260448120210	0	ninguno
373	1	43	0	ninguno
374	1	45	65	ninguno
375	1	4894158096291	0	ninguno
376	1	50	398	ninguno
377	1	51	0	ninguno
378	1	52	0	ninguno
379	1	53	0	ninguno
380	1	5414736039282	2	ninguno
381	1	5414736047911	2	ninguno
382	1	5414736047928	1	ninguno
383	1	5414736047935	0	ninguno
384	1	5414736047942	1	ninguno
385	1	5414736048253	0	ninguno
386	1	5415341001961	1	ninguno
387	1	5420043705338	2	ninguno
388	1	5420043705345	4	ninguno
389	1	6	0	ninguno
390	1	60	0	ninguno
391	1	61	0	ninguno
392	1	62	0	ninguno
393	1	63	0	ninguno
394	1	645095002166	2	ninguno
395	1	659525114701	1	ninguno
396	1	662858207224	18	ninguno
397	1	662858226003	1	ninguno
398	1	682500939518	0	ninguno
399	1	682500939679	0	ninguno
400	1	6828949660383	0	ninguno
401	1	6920190048764	2	ninguno
402	1	6953182709244	2	ninguno
403	1	6953182710585	2	ninguno
404	1	6953182710820	1	ninguno
405	1	6953182714576	0	ninguno
406	1	6953182714972	0	ninguno
407	1	6953182718062	0	ninguno
408	1	6953182719458	1	ninguno
409	1	6953182719571	0	ninguno
410	1	6953182720072	2	ninguno
411	1	6953182721161	0	ninguno
412	1	6953182731450	0	ninguno
413	1	6953182731481	0	ninguno
414	1	6953182732365	0	ninguno
415	1	6953182732372	0	ninguno
416	1	6953182732389	0	ninguno
417	1	6953182732440	2	ninguno
418	1	6953182735083	2	ninguno
419	1	6972170629975	1	ninguno
420	1	6995654545424	2	ninguno
421	1	70	0	ninguno
422	1	71	0	ninguno
423	1	711604200290	0	ninguno
424	1	711604203734	0	ninguno
425	1	714193509102	1	ninguno
426	1	714193600724	5	ninguno
427	1	714193600823	1	ninguno
428	1	714193600861	5	ninguno
429	1	714193600984	5	ninguno
430	1	714193610934	0	ninguno
431	1	714193699728	2	ninguno
432	1	7191600000507	0	ninguno
433	1	72	0	ninguno
434	1	73	0	ninguno
435	1	73000101	0	ninguno
436	1	73008199IO	1	ninguno
437	1	73033333	2	ninguno
438	1	736990012050	1	ninguno
439	1	736990012104	0	ninguno
440	1	736990012159	3	ninguno
441	1	736990012203	1	ninguno
442	1	736990012258	2	ninguno
443	1	736990013002	2	ninguno
444	1	736990013309	1	ninguno
445	1	736990040114	5	ninguno
446	1	74 6203100578	0	ninguno
447	1	7404000315615	0	ninguno
448	1	7404000315622	1	ninguno
449	1	7404000315639	2	ninguno
450	1	7404000315646	1	ninguno
451	1	7406160004224	1	ninguno
452	1	7410000115322	2	ninguno
453	1	7410032780024	10	ninguno
454	1	7410032780031	4	ninguno
455	1	7414400200596	1	ninguno
456	1	7414400201012	2	ninguno
457	1	7414400201050	0	ninguno
458	1	7414400201067	3	ninguno
459	1	7414400201074	2	ninguno
460	1	7414400201081	1	ninguno
461	1	7414400201111	4	ninguno
462	1	7414400201128	1	ninguno
463	1	7414400201210	3	ninguno
464	1	7414400201227	2	ninguno
465	1	7414400201234	4	ninguno
466	1	7414400201296	3	ninguno
467	1	7414400201302	3	ninguno
468	1	7414400201364	3	ninguno
469	1	7414400201432	2	ninguno
470	1	7414400201449	3	ninguno
471	1	7414400201456	1	ninguno
472	1	7414400201470	2	ninguno
473	1	7414400201487	0	ninguno
474	1	7414400201494	3	ninguno
475	1	7414400201609	3	ninguno
476	1	7414400201616	2	ninguno
477	1	7414400201623	4	ninguno
478	1	7414400202088	2	ninguno
479	1	7414400202095	3	ninguno
480	1	7414400202101	3	ninguno
481	1	7414400202149	5	ninguno
482	1	7416203100264	0	ninguno
483	1	7416203100271	0	ninguno
484	1	7416203100288	0	ninguno
485	1	7416203100295	0	ninguno
486	1	7416203100301	0	ninguno
487	1	7416203100318	2	ninguno
488	1	7416203100578	10	ninguno
489	1	7416203100585	1	ninguno
490	1	7416203100592	2	ninguno
491	1	7416203100608	2	ninguno
492	1	7416203100615	2	ninguno
493	1	7416203100622	2	ninguno
494	1	7416203100639	1	ninguno
495	1	7416203100646	5	ninguno
496	1	7416203100653	4	ninguno
497	1	7416203100660	2	ninguno
498	1	7416203100677	2	ninguno
499	1	7416203100684	0	ninguno
500	1	7416203100844	1	ninguno
501	1	7416203101179	0	ninguno
502	1	7416203101209	0	ninguno
503	1	7416203101247	2	ninguno
504	1	7416203101254	2	ninguno
505	1	7416203101261	1	ninguno
506	1	7416203101278	0	ninguno
507	1	7416203101438	0	ninguno
508	1	7416203101445	1	ninguno
509	1	7416203101469	2	ninguno
510	1	7416203101520	0	ninguno
511	1	7416203101544	0	ninguno
512	1	7416203101551	0	ninguno
513	1	7416203101667	1	ninguno
514	1	7416203101797	2	ninguno
515	1	7416203101827	1	ninguno
516	1	7416203101834	0	ninguno
517	1	7416203101902	1	ninguno
518	1	7416203101926	2	ninguno
519	1	7416203101964	0	ninguno
520	1	7416203102183	0	ninguno
521	1	7416203102213	0	ninguno
522	1	7416203102220	0	ninguno
523	1	7416203102237	1	ninguno
524	1	7416203102244	0	ninguno
525	1	7416203102916	0	ninguno
526	1	7416203102923	0	ninguno
527	1	7416203102930	1	ninguno
528	1	7416203103326	2	ninguno
529	1	7416203103333	2	ninguno
530	1	7416203103340	2	ninguno
531	1	7416203103357	4	ninguno
532	1	7416203103364	1	ninguno
533	1	7416203103371	0	ninguno
534	1	7416203103388	0	ninguno
535	1	7416203103395	1	ninguno
536	1	7416203103401	0	ninguno
537	1	7416203103418	2	ninguno
538	1	7416203103425	2	ninguno
539	1	7416203103685	1	ninguno
540	1	7416203103692	0	ninguno
541	1	7416203103708	0	ninguno
542	1	7416203103722	2	ninguno
543	1	7416203103739	1	ninguno
544	1	7416203103753	0	ninguno
545	1	7416203103760	1	ninguno
546	1	7420615480007-7.5	0	ninguno
547	1	742061548007-10	1	ninguno
548	1	742061548007-12.5	1	ninguno
549	1	742061548007-15	1	ninguno
550	1	742061548007-20	0	ninguno
551	1	742061548007-25	0	ninguno
552	1	742061548007-30	0	ninguno
553	1	742061548007-7.5	0	ninguno
554	1	7441003121935	17	ninguno
555	1	7441003121942	3	ninguno
556	1	7441007802434	3	ninguno
557	1	7441031336950	9	ninguno
558	1	7453105056978	0	ninguno
559	1	7501	0	ninguno
560	1	7501051100020	0	ninguno
561	1	7501051100037	2	ninguno
562	1	7501051186963	2	ninguno
563	1	7501072204462	2	ninguno
564	1	7501072204479	3	ninguno
565	1	7501072204561	3	ninguno
566	1	7501072204578	1	ninguno
567	1	7501072204592	6	ninguno
568	1	7501072204615	2	ninguno
569	1	7501072206299	2	ninguno
570	1	7501072206305	0	ninguno
571	1	7501072207234	1	ninguno
572	1	7501072207258	3	ninguno
573	1	7501072207265	8	ninguno
574	1	7501072208231	3	ninguno
575	1	7501072208248	3	ninguno
576	1	7501072208262	8	ninguno
577	1	7501072208279	5	ninguno
578	1	7501072208293	5	ninguno
579	1	7501072208743	2	ninguno
580	1	7501072208767	0	ninguno
581	1	7501072208781	5	ninguno
582	1	7501072208798	2	ninguno
583	1	7501072208927	0	ninguno
584	1	7501072208958	8	ninguno
585	1	7501072208972	6	ninguno
586	1	7501072210609	2	ninguno
587	1	7501072210616	2	ninguno
588	1	7501072210623	11	ninguno
589	1	7501072210630	2	ninguno
590	1	7501072210661	5	ninguno
591	1	7501072210678	2	ninguno
592	1	7501072210685	5	ninguno
593	1	7501072210692	1	ninguno
594	1	7501072210715	3	ninguno
595	1	7501072210722	2	ninguno
596	1	7501072210739	2	ninguno
597	1	7501072214485	30	ninguno
598	1	7501072214492	8	ninguno
599	1	7501072214508	10	ninguno
600	1	7501072214515	12	ninguno
601	1	7501072214522	3	ninguno
602	1	7501072214539	13	ninguno
603	1	7501072214546	4	ninguno
604	1	7501072214560	19	ninguno
605	1	7502010420043	15	ninguno
606	1	7502010421118	50	ninguno
607	1	7502010421125	18	ninguno
608	1	7502010421132	0	ninguno
609	1	7502010421187	4	ninguno
610	1	7502010421194	0	ninguno
611	1	7502010423969	100	ninguno
612	1	7502010429701	186	ninguno
613	1	7502262630023	29	ninguno
614	1	7502262630740	200	ninguno
615	1	7502262630795	44	ninguno
616	1	7503008553002	4	ninguno
617	1	7503008553040	9	ninguno
618	1	7503008553057	0	ninguno
619	1	7503008553071	3	ninguno
620	1	7503008553200	4	ninguno
621	1	7503008553231	4	ninguno
622	1	7503008553248	17	ninguno
623	1	7503008553255	3	ninguno
624	1	7503008553279	1	ninguno
625	1	7503008553965	1	ninguno
626	1	7503008553972	2	ninguno
627	1	7503019166604	15	ninguno
628	1	7503020053085	3	ninguno
629	1	7503020053290	10	ninguno
630	1	7503020053306	7	ninguno
631	1	7503020053313	11	ninguno
632	1	7503020053320	3	ninguno
633	1	7503020053382	1	ninguno
634	1	7503020053849	2	ninguno
635	1	7503026084113	7	ninguno
636	1	7503026084144	2	ninguno
637	1	7503026470107	2	ninguno
638	1	7503027959472	47	ninguno
639	1	7506267903489	0	ninguno
640	1	7506267907340	0	ninguno
641	1	7506267907357	1	ninguno
642	1	7506267907371	0	ninguno
643	1	7506343800015	27	ninguno
644	1	7506343800022	29	ninguno
645	1	7506343800039	27	ninguno
646	1	7506343800176	11	ninguno
647	1	7506343800190	21	ninguno
648	1	7506343800794	0	ninguno
649	1	7506343801784	5	ninguno
650	1	7506343802668	5	ninguno
651	1	7506343802675	4	ninguno
652	1	7506343802798	1	ninguno
653	1	7506396700645	17	ninguno
654	1	7506407400328	163	ninguno
655	1	7506407400618	2	ninguno
656	1	7506407400625	2	ninguno
657	1	7506407400977	45	ninguno
658	1	7506407401691	0	ninguno
659	1	7506407402094	1	ninguno
660	1	7506407402124	65	ninguno
661	1	7506407402193	46	ninguno
662	1	7506407402216	33	ninguno
663	1	7506407402247	45	ninguno
664	1	7506407402469	2	ninguno
665	1	7593990010041	1	ninguno
666	1	7593990010058	1	ninguno
667	1	7593990012953	0	ninguno
668	1	7593990050511	0	ninguno
669	1	769229001167	1	ninguno
670	1	769229002430	1	ninguno
671	1	769229002683	6	ninguno
672	1	769229003611	40	ninguno
673	1	769229003710	4	ninguno
674	1	769229003734	4	ninguno
675	1	769229003741	3	ninguno
676	1	769229003758	2	ninguno
677	1	769229049510	75	ninguno
678	1	769229124217	66	ninguno
679	1	769229131413	1	ninguno
680	1	769229131512	4	ninguno
681	1	769229131918	2	ninguno
682	1	7707007404604	3	ninguno
683	1	7707007405663	2	ninguno
684	1	7707115301161	4	ninguno
685	1	7707115301222	1	ninguno
686	1	7707115301468	17	ninguno
687	1	7707115301611	31	ninguno
688	1	7707214570659	1	ninguno
689	1	7707214570833	5	ninguno
690	1	7707214570918	3	ninguno
691	1	7707214570949	3	ninguno
692	1	7707214573001	9	ninguno
693	1	7707274710316	16	ninguno
694	1	7707274714215	35	ninguno
695	1	7707274715014	3	ninguno
696	1	7707274717001	0	ninguno
697	1	7707274718060	11	ninguno
698	1	7730952032677	96	ninguno
699	1	7730952032899	0	ninguno
700	1	7730997410614	3	ninguno
701	1	7730997410621	3	ninguno
702	1	7730997410638	4	ninguno
703	1	7730997410645	3	ninguno
704	1	7756654000363	2	ninguno
705	1	7756654000370	1	ninguno
706	1	7756654000387	1	ninguno
707	1	7756654000400	2	ninguno
708	1	7756654000424	1	ninguno
709	1	7756654000448	1	ninguno
710	1	7756654015220	100	ninguno
711	1	7756654020156	2	ninguno
712	1	7756654020293	4	ninguno
713	1	7756654027926	4	ninguno
714	1	7756654027933	4	ninguno
715	1	7756654027940	8	ninguno
716	1	7759433000059	46	ninguno
717	1	7759433000882	21	ninguno
718	1	7759433000998	4	ninguno
719	1	7759433001193	1	ninguno
720	1	7759433001933	5	ninguno
721	1	7759433001940	3	ninguno
722	1	7792716421868	0	ninguno
723	1	7797600000174	4	ninguno
724	1	7797600000501	9	ninguno
725	1	7797600000518	4	ninguno
726	1	7797600000761	65	ninguno
727	1	7797600000785	2	ninguno
728	1	7797600001805	3	ninguno
729	1	7797600001812	2	ninguno
730	1	7797600002895	20	ninguno
731	1	7797600002901	12	ninguno
732	1	7798042360055	3	ninguno
733	1	7798042360093	4	ninguno
734	1	7798042360109	3	ninguno
735	1	7798042360178	3	ninguno
736	1	7798042360185	88	ninguno
737	1	7798042360260	6	ninguno
738	1	7798042360468	0	ninguno
739	1	7798042360581	1	ninguno
740	1	7798042361311	27	ninguno
741	1	7798042361335	150	ninguno
742	1	7798042361359	2	ninguno
743	1	7798042361380	2	ninguno
744	1	7798042361533	2	ninguno
745	1	7798042364800	336	ninguno
746	1	7798042364961	0	ninguno
747	1	7798042365685	4	ninguno
748	1	7798042365692	2	ninguno
749	1	7798042365708	19	ninguno
750	1	7798042365715	50	ninguno
751	1	7798042365722	22	ninguno
752	1	7798042365739	1	ninguno
753	1	7798042365975	0	ninguno
754	1	7798042366170	1	ninguno
755	1	7798042366187	7	ninguno
756	1	7798042366200	1	ninguno
757	1	7798042366217	2	ninguno
758	1	7798042366224	3	ninguno
759	1	7798042366231	33	ninguno
760	1	7798042366255	60	ninguno
761	1	7798042366262	20	ninguno
762	1	7798144990860	39	ninguno
763	1	7798144993663	33	ninguno
764	1	7798156460054	35	ninguno
765	1	7798156460061	0	ninguno
766	1	7798156460290	60	ninguno
767	1	7798156460429	75	ninguno
768	1	7798156460498	56	ninguno
769	1	7798156460740	0	ninguno
770	1	7798156461051	40	ninguno
771	1	7798156461808	2	ninguno
772	1	7798156461815	1	ninguno
773	1	7798156461853	2	ninguno
774	1	7798156461884	178	ninguno
775	1	7798156462928	53	ninguno
776	1	7798156463185	1	ninguno
777	1	7798166871895	14	ninguno
778	1	7798166871901	0	ninguno
779	1	7798166873134	1	ninguno
780	1	7798166873141	1	ninguno
781	1	7798166873158	1	ninguno
782	1	7798166873165	0	ninguno
783	1	7798166873172	3	ninguno
784	1	7798176420403	5	ninguno
785	1	7798176420410	9	ninguno
786	1	7798176420434	1	ninguno
787	1	7798176420458	1	ninguno
788	1	7798176420465	1	ninguno
789	1	7798176421073	0	ninguno
790	1	7798176421080	0	ninguno
791	1	7798176421097	0	ninguno
792	1	7798176421103	0	ninguno
793	1	7798176421110	0	ninguno
794	1	7798176421196	1	ninguno
795	1	7798176421202	1	ninguno
796	1	7798176421219	0	ninguno
797	1	7798176421264	3	ninguno
798	1	7798176421745	3	ninguno
799	1	7798176421752	2	ninguno
800	1	7798176421769	2	ninguno
801	1	7798176421776	1	ninguno
802	1	7798176421868	0	ninguno
803	1	7798176421875	0	ninguno
804	1	7798176421882	0	ninguno
805	1	7798176421899	0	ninguno
806	1	7798176421905	0	ninguno
807	1	7798176422926	2	ninguno
808	1	7798359710017	1	ninguno
809	1	7800006000232	1	ninguno
810	1	7800006002038	9	ninguno
811	1	7800006002700	23	ninguno
812	1	7800006002724	1	ninguno
813	1	7800006003370	27	ninguno
814	1	7800006003561	0	ninguno
815	1	7800006003646	2	ninguno
816	1	7800006005169	1	ninguno
817	1	7800019000014	5	ninguno
818	1	784369477115	0	ninguno
819	1	784369477122	0	ninguno
820	1	7898049715480	16	ninguno
821	1	7898049719273	6	ninguno
822	1	7898416700040	36	ninguno
823	1	7898416700521	100	ninguno
824	1	7898416700743	0	ninguno
825	1	7898416701344	2	ninguno
826	1	7898416701955	1	ninguno
827	1	7898416701979	8	ninguno
828	1	7898597991329	30	ninguno
829	1	80	0	ninguno
830	1	8010690010908	0	ninguno
831	1	8010690010915	1	ninguno
832	1	8010690010946	0	ninguno
833	1	8010690010991	0	ninguno
834	1	8010690011080	2	ninguno
835	1	8010690011295	2	ninguno
836	1	8010690011301	0	ninguno
837	1	8010690011349	0	ninguno
838	1	8010690011394	1	ninguno
839	1	8010690011547	0	ninguno
840	1	8010690011745	0	ninguno
841	1	8010690011769	0	ninguno
842	1	8010690011790	2	ninguno
843	1	8010690011936	1	ninguno
844	1	8010690011967	0	ninguno
845	1	8010690012186	0	ninguno
846	1	8010690012209	1	ninguno
847	1	8010690012308	1	ninguno
848	1	8010690012360	2	ninguno
849	1	8010690012476	0	ninguno
850	1	8010690012674	2	ninguno
851	1	8010690012698	5	ninguno
852	1	8010690014043	0	ninguno
853	1	8010690025919	2	ninguno
854	1	8010690025926	2	ninguno
855	1	8010690025940	1	ninguno
856	1	8010690025988	0	ninguno
857	1	8010690026015	1	ninguno
858	1	8010690026053	2	ninguno
859	1	8010690026060	1	ninguno
860	1	8010690026084	2	ninguno
861	1	8010690026121	2	ninguno
862	1	8010690026138	2	ninguno
863	1	8010690026152	1	ninguno
864	1	8010690029214	0	ninguno
865	1	8010690029566	0	ninguno
866	1	8010690029986	0	ninguno
867	1	8010690029993	0	ninguno
868	1	8010690030005	0	ninguno
869	1	8010690030029	0	ninguno
870	1	8010690037363	0	ninguno
871	1	8010690041926	1	ninguno
872	1	8010690041933	1	ninguno
873	1	8010690041940	1	ninguno
874	1	8010690042084	1	ninguno
875	1	8010690042091	2	ninguno
876	1	8010690042114	4	ninguno
877	1	8010690042121	0	ninguno
878	1	8010690042145	0	ninguno
879	1	8010690042152	0	ninguno
880	1	8010690047775	0	ninguno
881	1	8010690050072	0	ninguno
882	1	8010690050089	2	ninguno
883	1	8010690050096	1	ninguno
884	1	8010690053677	2	ninguno
885	1	8010690053691	0	ninguno
886	1	8010690053714	0	ninguno
887	1	8010690053738	1	ninguno
888	1	8010690053752	0	ninguno
889	1	8010690053776	0	ninguno
890	1	8010690055381	1	ninguno
891	1	8010690055398	2	ninguno
892	1	8010690055404	1	ninguno
893	1	8010690055411	1	ninguno
894	1	8010690055428	1	ninguno
895	1	8010690055435	2	ninguno
896	1	8010690055442	0	ninguno
897	1	8010690055459	0	ninguno
898	1	8010690055466	2	ninguno
899	1	8010690056135	2	ninguno
900	1	8010690056142	2	ninguno
901	1	8010690056159	1	ninguno
902	1	8010690056548	0	ninguno
903	1	8010690056555	1	ninguno
904	1	8010690056562	0	ninguno
905	1	8010690056579	0	ninguno
906	1	8010690056586	0	ninguno
907	1	8010690056616	2	ninguno
908	1	8010690056630	0	ninguno
909	1	8010690056647	0	ninguno
910	1	8010690056654	3	ninguno
911	1	8010690056661	2	ninguno
912	1	8010690057552	2	ninguno
913	1	8010690057569	1	ninguno
914	1	8010690058160	2	ninguno
915	1	8010690059082	2	ninguno
916	1	8010690061696	0	ninguno
917	1	8010690061702	1	ninguno
918	1	8010690062853	0	ninguno
919	1	8010690067339	1	ninguno
920	1	8010690068121	2	ninguno
921	1	8010690068138	2	ninguno
922	1	8010690080017	1	ninguno
923	1	8010690080024	1	ninguno
924	1	8010690080031	2	ninguno
925	1	8010690088365	1	ninguno
926	1	8010690088457	0	ninguno
927	1	8010690088563	0	ninguno
928	1	8010690091471	0	ninguno
929	1	8010690092898	1	ninguno
930	1	8010690093604	1	ninguno
931	1	8010690099552	1	ninguno
932	1	8010690101491	0	ninguno
933	1	8010690101507	1	ninguno
934	1	8010690105796	1	ninguno
935	1	8010690105802	0	ninguno
936	1	8010690105819	2	ninguno
937	1	8010690105826	0	ninguno
938	1	8010690105833	0	ninguno
939	1	8010690105840	0	ninguno
940	1	8010690105857	0	ninguno
941	1	8010690105864	0	ninguno
942	1	8010690105871	0	ninguno
943	1	8010690105888	0	ninguno
944	1	8010690106571	0	ninguno
945	1	8010690107028	1	ninguno
946	1	8010690107134	1	ninguno
947	1	8010690115924	0	ninguno
948	1	8010690122946	0	ninguno
949	1	8010690122953	0	ninguno
950	1	8010690122977	0	ninguno
951	1	8010690122991	0	ninguno
952	1	8010690123004	0	ninguno
953	1	8010690123011	0	ninguno
954	1	8010690123035	0	ninguno
955	1	8010690123059	2	ninguno
956	1	8010690123066	1	ninguno
957	1	8010690123073	0	ninguno
958	1	8010690123097	1	ninguno
959	1	8010690123110	0	ninguno
960	1	8010690123141	1	ninguno
961	1	8010690123158	0	ninguno
962	1	8010690123172	1	ninguno
963	1	8010690123196	0	ninguno
964	1	8010690123202	1	ninguno
965	1	8010690123219	1	ninguno
966	1	8010690123233	2	ninguno
967	1	8010690123257	2	ninguno
968	1	8010690133362	1	ninguno
969	1	8010690140346	2	ninguno
970	1	8010690140360	1	ninguno
971	1	8010690140377	1	ninguno
972	1	8010690140384	1	ninguno
973	1	8010690148977	2	ninguno
974	1	8010690149004	2	ninguno
975	1	8010690149011	1	ninguno
976	1	8010690149028	0	ninguno
977	1	8010690149059	1	ninguno
978	1	8010690149066	0	ninguno
979	1	8010690149073	1	ninguno
980	1	8010690149097	2	ninguno
981	1	8010690149103	2	ninguno
982	1	8010690153100	1	ninguno
983	1	8010690153124	0	ninguno
984	1	8010690153568	0	ninguno
985	1	8010690153582	1	ninguno
986	1	8010690156156	0	ninguno
987	1	8010690156163	0	ninguno
988	1	8010690159270	0	ninguno
989	1	8010690159782	2	ninguno
990	1	8010690159867	1	ninguno
991	1	8010690160443	0	ninguno
992	1	8010690160474	2	ninguno
993	1	8010690160481	2	ninguno
994	1	8010690160498	0	ninguno
995	1	8010690160511	0	ninguno
996	1	8010690164670	1	ninguno
997	1	8010690166308	2	ninguno
998	1	8010690166315	0	ninguno
999	1	8010690166322	1	ninguno
1000	1	8010690166339	1	ninguno
1001	1	8010690166346	1	ninguno
1002	1	8010690166353	1	ninguno
1003	1	8010690166360	0	ninguno
1004	1	8010690166377	0	ninguno
1005	1	8010690168821	2	ninguno
1006	1	8010690172033	2	ninguno
1007	1	8010690175331	0	ninguno
1008	1	8010690175355	0	ninguno
1009	1	8010690175362	1	ninguno
1010	1	8010690175379	2	ninguno
1011	1	8010690175386	1	ninguno
1012	1	8010690175409	1	ninguno
1013	1	8010690175416	1	ninguno
1014	1	8010690175423	0	ninguno
1015	1	8010690175454	0	ninguno
1016	1	8010690175478	2	ninguno
1017	1	8010690175485	1	ninguno
1018	1	8010690175492	0	ninguno
1019	1	8010690175508	2	ninguno
1020	1	8010690175515	0	ninguno
1021	1	8010690175522	1	ninguno
1022	1	8010690175546	0	ninguno
1023	1	8010690175553	1	ninguno
1024	1	8010690175577	1	ninguno
1025	1	8010690175584	1	ninguno
1026	1	8010690176161	1	ninguno
1027	1	8010690176178	2	ninguno
1028	1	8010690176208	2	ninguno
1029	1	8010690176215	1	ninguno
1030	1	8010690176222	2	ninguno
1031	1	8010690176260	2	ninguno
1032	1	8010690176277	0	ninguno
1033	1	8010690176307	2	ninguno
1034	1	8010690179445	0	ninguno
1035	1	8010690180076	1	ninguno
1036	1	8010690180106	1	ninguno
1037	1	8010690180137	1	ninguno
1038	1	8010690180168	2	ninguno
1039	1	8010690180182	1	ninguno
1040	1	8010690180755	0	ninguno
1041	1	8010690191065	0	ninguno
1042	1	8010690191089	0	ninguno
1043	1	81	0	ninguno
1044	1	811794010850	0	ninguno
1045	1	811794010898	1	ninguno
1046	1	82	0	ninguno
1047	1	83	0	ninguno
1048	1	84	0	ninguno
1049	1	8410650150130	3	ninguno
1050	1	8410650150147	0	ninguno
1051	1	8410650150185	1	ninguno
1052	1	8410650150192	2	ninguno
1053	1	8410650150253	4	ninguno
1054	1	8410650151892	6	ninguno
1055	1	8410650151946	1	ninguno
1056	1	8410650152264	3	ninguno
1057	1	8410650152288	1	ninguno
1058	1	8410650152301	3	ninguno
1059	1	8410650152325	3	ninguno
1060	1	8410650152363	2	ninguno
1061	1	8410650152400	1	ninguno
1062	1	8410650152448	5	ninguno
1063	1	8410650160474	2	ninguno
1064	1	8410650167817	1	ninguno
1065	1	8410650168104	2	ninguno
1066	1	8410650168128	1	ninguno
1067	1	8410650170695	8	ninguno
1068	1	8410650170718	4	ninguno
1069	1	8410650218649	5	ninguno
1070	1	8410650239132	6	ninguno
1071	1	842704100095	0	ninguno
1072	1	842704100743	5	ninguno
1073	1	8433042001582	0	ninguno
1074	1	8436001971605	0	ninguno
1075	1	8436001971612	2	ninguno
1076	1	8436001971643	0	ninguno
1077	1	8436001971650	1	ninguno
1078	1	8436001971681	3	ninguno
1079	1	8436001971704	2	ninguno
1080	1	8436001971728	6	ninguno
1081	1	8436532730030	7	ninguno
1082	1	8436532730047	5	ninguno
1083	1	8436532730122	1	ninguno
1084	1	8436532730139	0	ninguno
1085	1	8436532730146	7	ninguno
1086	1	8436532730252	56	ninguno
1087	1	8436532730412	9	ninguno
1088	1	8436532730665	1	ninguno
1089	1	8470000397516	1	ninguno
1090	1	8470000491269	2	ninguno
1091	1	8470000493195	1	ninguno
1092	1	8470000647512	2	ninguno
1093	1	8470000957512	2	ninguno
1094	1	847922021016	0	ninguno
1095	1	847922021115	0	ninguno
1096	1	847922021191	1	ninguno
1097	1	847922021559	2	ninguno
1098	1	847922021580	1	ninguno
1099	1	847922021610	2	ninguno
1100	1	847922024031	1	ninguno
1101	1	847922024048	0	ninguno
1102	1	847922027438	0	ninguno
1103	1	847922028084	1	ninguno
1104	1	847922075613	0	ninguno
1105	1	8699245857306	2	ninguno
1106	1	8699245857313	3	ninguno
1107	1	8699245857337	2	ninguno
1108	1	8699245857351	1	ninguno
1109	1	8699245857399	2	ninguno
1110	1	8699245857405	2	ninguno
1111	1	8699245857429	1	ninguno
1112	1	8699245857443	0	ninguno
1113	1	8713184080653	1	ninguno
1114	1	8713184134349	6	ninguno
1115	1	8713184135278	12	ninguno
1116	1	8713184135285	9	ninguno
1117	1	8713184135292	21	ninguno
1118	1	8713184141408	4	ninguno
1119	1	8886467510229	0	ninguno
1120	1	8886467510236	1	ninguno
1121	1	8886467510250	0	ninguno
1122	1	8886467510267	0	ninguno
1123	1	8886467510281	0	ninguno
1124	1	8886467510311	0	ninguno
1125	1	8886467510328	1	ninguno
1126	1	8886467510335	1	ninguno
1127	1	8886467510410	0	ninguno
1128	1	8886467510427	0	ninguno
1129	1	8886467510434	1	ninguno
1130	1	8886467510441	0	ninguno
1131	1	8886467510458	0	ninguno
1132	1	8886467510465	0	ninguno
1133	1	8886467510588	0	ninguno
1134	1	8886467510724	0	ninguno
1135	1	8886467510755	0	ninguno
1136	1	8886467510830	0	ninguno
1137	1	8886467514210	0	ninguno
1138	1	8886467514401	0	ninguno
1139	1	8886467514418	0	ninguno
1140	1	8886467514425	0	ninguno
1141	1	8886467514463	0	ninguno
1142	1	8886467514470	0	ninguno
1143	1	8886467514487	0	ninguno
1144	1	8886467514494	0	ninguno
1145	1	8886467514579	2	ninguno
1146	1	8886467514616	0	ninguno
1147	1	8886467514623	0	ninguno
1148	1	8886467514630	2	ninguno
1149	1	8886467514647	1	ninguno
1150	1	8886467514654	2	ninguno
1151	1	8886467514661	1	ninguno
1152	1	8886467514678	2	ninguno
1153	1	8886467514685	0	ninguno
1154	1	8886467514692	2	ninguno
1155	1	8886467514715	1	ninguno
1156	1	8886467514722	2	ninguno
1157	1	8886467514739	2	ninguno
1158	1	8886467514746	2	ninguno
1159	1	8886467514760	0	ninguno
1160	1	8886467514814	0	ninguno
1161	1	8886467514821	0	ninguno
1162	1	8886467514906	2	ninguno
1163	1	8886467514920	0	ninguno
1164	1	8886467515521	2	ninguno
1165	1	8886467515644	0	ninguno
1166	1	8886467515811	1	ninguno
1167	1	8886467515866	1	ninguno
1168	1	8886467515897	1	ninguno
1169	1	8886467515927	1	ninguno
1170	1	8886467515934	1	ninguno
1171	1	8886467515965	4	ninguno
1172	1	8886467520112	0	ninguno
1173	1	8886467520129	2	ninguno
1174	1	8886467520136	2	ninguno
1175	1	88864675201368886467520136	0	ninguno
1176	1	8886467520143	0	ninguno
1177	1	8886467520150	2	ninguno
1178	1	8886467523212	1	ninguno
1179	1	8886467523229	1	ninguno
1180	1	8886467523236	1	ninguno
1181	1	8886467523243	1	ninguno
1182	1	8886467523250	0	ninguno
1183	1	8886467523267	0	ninguno
1184	1	8886467523274	1	ninguno
1185	1	8886467523298	0	ninguno
1186	1	8886467523311	1	ninguno
1187	1	8886467523328	1	ninguno
1188	1	8886467523335	0	ninguno
1189	1	8886467523342	0	ninguno
1190	1	8886467523356	0	ninguno
1191	1	8886467523359	0	ninguno
1192	1	8886467523366	1	ninguno
1193	1	8886467523373	0	ninguno
1194	1	8886467523380	0	ninguno
1195	1	8886467523397	0	ninguno
1196	1	8886467523410	1	ninguno
1197	1	8886467523427	1	ninguno
1198	1	8886467523434	1	ninguno
1199	1	8886467523441	0	ninguno
1200	1	8886467523458	0	ninguno
1201	1	8886467523465	1	ninguno
1202	1	8886467523472	0	ninguno
1203	1	8886467523489	0	ninguno
1204	1	8886467523496	0	ninguno
1205	1	8886467523625	0	ninguno
1206	1	8886467523632	0	ninguno
1207	1	8886467523649	0	ninguno
1208	1	8886467523823	2	ninguno
1209	1	8886467523830	2	ninguno
1210	1	8886467523847	0	ninguno
1211	1	8886467525018	1	ninguno
1212	1	8886467525049	0	ninguno
1213	1	8886467525117	1	ninguno
1214	1	8886467525124	0	ninguno
1215	1	8886467525322	0	ninguno
1216	1	8886467525339	0	ninguno
1217	1	8886467525346	0	ninguno
1218	1	8886467525353	0	ninguno
1219	1	8886467525711	0	ninguno
1220	1	8886467525735	0	ninguno
1221	1	8886467525742	0	ninguno
1222	1	8886467525759	0	ninguno
1223	1	8886467529719	0	ninguno
1224	1	8886467529726	0	ninguno
1225	1	8886467529733	0	ninguno
1226	1	8886467529740	0	ninguno
1227	1	8886467530067	0	ninguno
1228	1	8886467530128	0	ninguno
1229	1	8886467530135	0	ninguno
1230	1	8886467530142	1	ninguno
1231	1	8886467530159	2	ninguno
1232	1	8886467530302	2	ninguno
1233	1	8886467530319	0	ninguno
1234	1	8886467530326	0	ninguno
1235	1	8886467530333	0	ninguno
1236	1	8886467530340	0	ninguno
1237	1	8886467530364	0	ninguno
1238	1	8886467530371	0	ninguno
1239	1	8886467530388	0	ninguno
1240	1	8886467530500	0	ninguno
1241	1	8886467531019	0	ninguno
1242	1	8886467531026	0	ninguno
1243	1	8886467531033	0	ninguno
1244	1	8886467531040	0	ninguno
1245	1	8886467532115	0	ninguno
1246	1	8886467532122	0	ninguno
1247	1	8886467532139	0	ninguno
1248	1	8886467532160	1	ninguno
1249	1	8886467532177	1	ninguno
1250	1	8886467532214	0	ninguno
1251	1	8886467532221	0	ninguno
1252	1	8886467532238	0	ninguno
1253	1	8886467532269	0	ninguno
1254	1	8886467532276	1	ninguno
1255	1	8886467532313	0	ninguno
1256	1	8886467532320	0	ninguno
1257	1	8886467532337	0	ninguno
1258	1	8886467532368	0	ninguno
1259	1	8886467532375	0	ninguno
1260	1	8886467532412	0	ninguno
1261	1	8886467532429	1	ninguno
1262	1	8886467532436	0	ninguno
1263	1	8886467532450	4	ninguno
1264	1	8886467532467	1	ninguno
1265	1	8886467532474	2	ninguno
1266	1	8886467532511	0	ninguno
1267	1	8886467532528	0	ninguno
1268	1	8886467532535	2	ninguno
1269	1	8886467532559	1	ninguno
1270	1	8886467532566	1	ninguno
1271	1	8886467532573	1	ninguno
1272	1	8886467532634	2	ninguno
1273	1	8886467535222	2	ninguno
1274	1	8886467535239	1	ninguno
1275	1	8886467535246	2	ninguno
1276	1	8886467535321	1	ninguno
1277	1	8886467535413	3	ninguno
1278	1	8886467535420	1	ninguno
1279	1	8886467535437	2	ninguno
1280	1	8886467535536	1	ninguno
1281	1	8886467535543	1	ninguno
1282	1	8886467535611	2	ninguno
1283	1	8886467535628	1	ninguno
1284	1	8886467535635	0	ninguno
1285	1	8886467535642	0	ninguno
1286	1	8886467541018	0	ninguno
1287	1	8886467541025	0	ninguno
1288	1	8886467541032	0	ninguno
1289	1	8886467541117	1	ninguno
1290	1	8886467541124	2	ninguno
1291	1	8886467541131	0	ninguno
1292	1	8886467541148	0	ninguno
1293	1	8886467544712	2	ninguno
1294	1	8886467545030	0	ninguno
1295	1	8886467545047	0	ninguno
1296	1	8886467545054	0	ninguno
1297	1	8886467545061	0	ninguno
1298	1	8886467545078	0	ninguno
1299	1	8886467545085	0	ninguno
1300	1	8886467545399	2	ninguno
1301	1	8886467545412	0	ninguno
1302	1	8886467545467	0	ninguno
1303	1	8886467545542	1	ninguno
1304	1	8886467545702	2	ninguno
1305	1	8886467545719	1	ninguno
1306	1	8886467545726	0	ninguno
1307	1	8886467546013	0	ninguno
1308	1	8886467546037	0	ninguno
1309	1	8886467546044	0	ninguno
1310	1	8886467546198	1	ninguno
1311	1	8886467546211	3	ninguno
1312	1	8886467546327	0	ninguno
1313	1	8886467546334	0	ninguno
1314	1	8886467546341	1	ninguno
1315	1	8886467546617	0	ninguno
1316	1	8886467546648	0	ninguno
1317	1	8886467546655	0	ninguno
1318	1	8886467546662	2	ninguno
1319	1	8886467546969	0	ninguno
1320	1	8886467547546	0	ninguno
1321	1	8886467548512	0	ninguno
1322	1	8886467548536	0	ninguno
1323	1	8886467548710	2	ninguno
1324	1	8886467548772	0	ninguno
1325	1	8886467548789	0	ninguno
1326	1	8886467548796	0	ninguno
1327	1	8886467548826	0	ninguno
1328	1	8886467548840	0	ninguno
1329	1	8886467548864	0	ninguno
1330	1	8886467548888	0	ninguno
1331	1	8886467548925	0	ninguno
1332	1	8886467548932	0	ninguno
1333	1	8886467548949	0	ninguno
1334	1	8886467580000	0	ninguno
1335	1	8886467580017	0	ninguno
1336	1	8886467580024	0	ninguno
1337	1	8886467580062	1	ninguno
1338	1	8886467580079	0	ninguno
1339	1	8886467580086	0	ninguno
1340	1	8886467580093	0	ninguno
1341	1	8886467580109	0	ninguno
1342	1	8886467580116	0	ninguno
1343	1	8886467580147	1	ninguno
1344	1	8886467580161	1	ninguno
1345	1	8886467580178	0	ninguno
1346	1	8886467580185	1	ninguno
1347	1	8886467580208	0	ninguno
1348	1	8886467580215	1	ninguno
1349	1	8886467580222	0	ninguno
1350	1	8886467580413	0	ninguno
1351	1	8886467581465	0	ninguno
1352	1	8886467582059	2	ninguno
1353	1	8886467584954	0	ninguno
1354	1	8886467584961	0	ninguno
1355	1	8886467585814	0	ninguno
1356	1	8886467585913	0	ninguno
1357	1	8886467586347	0	ninguno
1358	1	8886467589010	1	ninguno
1359	1	8886467589317	0	ninguno
1360	1	8886467589478	0	ninguno
1361	1	8886467589485	2	ninguno
1362	1	8900950297173	1	ninguno
1363	1	8900950297180	0	ninguno
1364	1	8901138501242	1	ninguno
1365	1	8901138501297	6	ninguno
1366	1	8901138511333	5	ninguno
1367	1	8901138511340	5	ninguno
1368	1	90	0	ninguno
1369	1	9003579000519	7	ninguno
1370	1	9003579000748	8	ninguno
1371	1	9003579001172	11	ninguno
1372	1	9003579013557	8	ninguno
1373	1	9003579018514	6	ninguno
1374	1	9003579018866	16	ninguno
1375	1	9003579018941	17	ninguno
1376	1	9003579307717	13	ninguno
1377	1	9003579308936	11	ninguno
1378	1	9003579308943	10	ninguno
1379	1	9003579309445	10	ninguno
1380	1	9003579309469	16	ninguno
1381	1	9003579310632	3	ninguno
1382	1	9003579311004	7	ninguno
1383	1	9003579311462	8	ninguno
1384	1	9003579311851	5	ninguno
1385	1	91009	2	ninguno
1386	1	91012	4	ninguno
1387	1	91013	2	ninguno
1388	1	91015	4	ninguno
1389	1	911emergencia	0	ninguno
1390	1	9333527021861	0	ninguno
1391	1	9333527230447	0	ninguno
1392	1	9333527329240	1	ninguno
1393	1	9333527329257	0	ninguno
1394	1	9333527341037	0	ninguno
1395	1	9333527377852	0	ninguno
1396	1	9333527426642	1	ninguno
1397	1	9333527443670	2	ninguno
1398	1	9333527586469	0	ninguno
1399	1	9505903	1	ninguno
1400	1	9505904	2	ninguno
1401	1	9505905	0	ninguno
1402	1	99-26191	18	ninguno
1403	1	A1014	1	ninguno
1404	1	AB01S	1	ninguno
1405	1	AB02M	1	ninguno
1406	1	AB03L	0	ninguno
1407	1	AC01	2	ninguno
1408	1	AC01S	0	ninguno
1409	1	AC02M	1	ninguno
1410	1	AF001S	0	ninguno
1411	1	ALP001	0	ninguno
1412	1	AMOXITABS250	0	ninguno
1413	1	ANXIVET	0	ninguno
1414	1	ARTROVET	0	ninguno
1415	1	Atropina01	13	ninguno
1416	1	AUMENTA	0	ninguno
1417	1	BAEP00	2	ninguno
1418	1	BAN0	0	ninguno
1419	1	BC1050032021	0	ninguno
1420	1	BCTH2101C	1	ninguno
1421	1	BHL001	6	ninguno
1422	1	BHM001	1	ninguno
1423	1	BHS001	4	ninguno
1424	1	BHXS001	2	ninguno
1425	1	BL01-S	0	ninguno
1426	1	BL-02	0	ninguno
1427	1	BL02-M	2	ninguno
1428	1	BL03-L	1	ninguno
1429	1	BL04-XL	1	ninguno
1430	1	BOSAL#0	0	ninguno
1431	1	BROADLINE	2	ninguno
1432	1	BVL001	4	ninguno
1433	1	BVM001	6	ninguno
1434	1	BVS001	5	ninguno
1435	1	C20-M	2	ninguno
1436	1	C20-S	1	ninguno
1437	1	C20-XL	0	ninguno
1438	1	C21-L	2	ninguno
1439	1	C21-M	2	ninguno
1440	1	C21-S	1	ninguno
1441	1	C21-XL	2	ninguno
1442	1	C22-1	4	ninguno
1443	1	C22-2	2	ninguno
1444	1	C22-3	2	ninguno
1445	1	CAM2030	1	ninguno
1446	1	CAM2435	0	ninguno
1447	1	CAM2840	2	ninguno
1448	1	cardiovet	4	ninguno
1449	1	CARPRODYL100	40	ninguno
1450	1	CARPRODYL25	40	ninguno
1451	1	CD02M	1	ninguno
1452	1	CD03L	1	ninguno
1453	1	CefaCure	31	ninguno
1454	1	CIPROTABS250	44	ninguno
1455	1	CORTA3807	2	ninguno
1456	1	DE013-M	1	ninguno
1457	1	doramectina	60	ninguno
1458	1	Dufamox15	76	ninguno
1459	1	FARM044	1	ninguno
1460	1	FARM046	3	ninguno
1461	1	FARM141	348	ninguno
1462	1	FC088	1	ninguno
1463	1	FG01-S	0	ninguno
1464	1	FG02-M	1	ninguno
1465	1	FG03-L	1	ninguno
1466	1	FG04XL	1	ninguno
1467	1	FGEZ1002	0	ninguno
1468	1	G003	2	ninguno
1469	1	G0M3101S	0	ninguno
1470	1	G0M3102M	0	ninguno
1471	1	gentamicina	55	ninguno
1472	1	H2-S	1	ninguno
1473	1	H3-L	0	ninguno
1474	1	H3-M	2	ninguno
1475	1	H3-S	0	ninguno
1476	1	H3-XL	2	ninguno
1477	1	H4-L	0	ninguno
1478	1	H4-M	1	ninguno
1479	1	H4-XL	0	ninguno
1480	1	HEARTGARDL	0	ninguno
1481	1	HEARTGARDM	7	ninguno
1482	1	HEARTGARDS	11	ninguno
1483	1	HEMOVITB12	1	ninguno
1484	1	HEPATOVET	2	ninguno
1485	1	HI01S	0	ninguno
1486	1	HI02M	1	ninguno
1487	1	HI03L	1	ninguno
1488	1	HTB031-2	1	ninguno
1489	1	HTGC019	0	ninguno
1490	1	ij-02	1	ninguno
1491	1	IJ03	0	ninguno
1492	1	IP001ML	14	ninguno
1493	1	JD01	1	ninguno
1494	1	JD02	1	ninguno
1495	1	JHP951	1	ninguno
1496	1	JK901L	0	ninguno
1497	1	JK901M	1	ninguno
1498	1	JK901S	2	ninguno
1499	1	K002	0	ninguno
1500	1	K9-L	1	ninguno
1501	1	KD01	0	ninguno
1502	1	KETOVET	79	ninguno
1503	1	KL01XS	1	ninguno
1504	1	KL02S	2	ninguno
1505	1	KL03M	1	ninguno
1506	1	KL04L	0	ninguno
1507	1	KL05XL	0	ninguno
1508	1	KM0110MM	3	ninguno
1509	1	KM0212MM	1	ninguno
1510	1	KN0110MM	1	ninguno
1511	1	KN0212MM	2	ninguno
1512	1	KN0315MM	2	ninguno
1513	1	KP01S	0	ninguno
1514	1	KR01	1	ninguno
1515	1	kS15MM	1	ninguno
1516	1	KT01XXS	1	ninguno
1517	1	KT02XS	0	ninguno
1518	1	KT03S	1	ninguno
1519	1	KU01XXS	1	ninguno
1520	1	KU02XS	0	ninguno
1521	1	KV01XXS	0	ninguno
1522	1	KV03S	0	ninguno
1523	1	KW01XXS	1	ninguno
1524	1	KW02XS	1	ninguno
1525	1	KW03S	1	ninguno
1526	1	KW04M	0	ninguno
1527	1	L1003	2	ninguno
1528	1	LM-01	1	ninguno
1529	1	LM-02	2	ninguno
1530	1	LM-03	0	ninguno
1531	1	LM-902-L	0	ninguno
1532	1	LM902M	0	ninguno
1533	1	LM902S	0	ninguno
1534	1	M610	2	ninguno
1535	1	M9D228135	1	ninguno
1536	1	M9D22826	0	ninguno
1537	1	M9D22838-L	1	ninguno
1538	1	M9D22838-M	1	ninguno
1539	1	M9D22838-S	1	ninguno
1540	1	M9D22838-XL	2	ninguno
1541	1	M9D22868	0	ninguno
1542	1	Metronidazole	0	ninguno
1543	1	MN03	0	ninguno
1544	1	MN05-XL	3	ninguno
1545	1	MP1831	2	ninguno
1546	1	MP1855	0	ninguno
1547	1	MU01	1	ninguno
1548	1	MU01S	1	ninguno
1549	1	MU02	1	ninguno
1550	1	MU02M	1	ninguno
1551	1	N026I21	3	ninguno
1552	1	NO02-S	2	ninguno
1553	1	NO03-M	0	ninguno
1554	1	NO04-L	1	ninguno
1555	1	no05xl	1	ninguno
1556	1	OMPASTA-01	4	ninguno
1557	1	OP01S	1	ninguno
1558	1	OP02M	0	ninguno
1559	1	OPTIVET	2	ninguno
1560	1	OV115	2	ninguno
1561	1	P002L	7	ninguno
1562	1	P1089	1	ninguno
1563	1	P1118-PP-B7	0	ninguno
1564	1	P518	0	ninguno
1565	1	P518-1	0	ninguno
1566	1	P519	2	ninguno
1567	1	P520	2	ninguno
1568	1	P521	3	ninguno
1569	1	P522	0	ninguno
1570	1	P523	1	ninguno
1571	1	P924	0	ninguno
1572	1	P935	2	ninguno
1573	1	PALETAS	250	ninguno
1574	1	PEC001	3	ninguno
1575	1	PECH273	4	ninguno
1576	1	PH2088	0	ninguno
1577	1	PL01	0	ninguno
1578	1	QR01	1	ninguno
1579	1	QR01XS	1	ninguno
1580	1	QR02	0	ninguno
1581	1	QR02S	1	ninguno
1582	1	quino-01	4	ninguno
1583	1	RANITIDINVET	175	ninguno
1584	1	RAR2002	0	ninguno
1585	1	RS02	1	ninguno
1586	1	RS02S	2	ninguno
1587	1	RS03L	1	ninguno
1588	1	RS03-L	0	ninguno
1589	1	ST0101	230	ninguno
1590	1	ST01XS	1	ninguno
1591	1	ST02S	0	ninguno
1592	1	ST03M	3	ninguno
1593	1	ST04L	1	ninguno
1594	1	ST05XL	0	ninguno
1595	1	stickerzone01	0	ninguno
1596	1	STOMORGYL10	24	ninguno
1597	1	SU01	0	ninguno
1598	1	SU02	2	ninguno
1599	1	sy-b024	0	ninguno
1600	1	TORT001	3	ninguno
1601	1	TU01	0	ninguno
1602	1	TU02	1	ninguno
1603	1	TU03	0	ninguno
1604	1	TU04	0	ninguno
1605	1	UNGÜENTO	0	ninguno
1606	1	URIVET	1	ninguno
1607	1	UT01XS	2	ninguno
1608	1	UT02S	1	ninguno
1609	1	UT03M	1	ninguno
1610	1	UT04L	1	ninguno
1611	1	UT05XL	2	ninguno
1612	1	UV01S	2	ninguno
1613	1	UV02M	2	ninguno
1614	1	UV03L	0	ninguno
1615	1	UY0110MM	1	ninguno
1616	1	UY0212MM	0	ninguno
1617	1	VDECA0008	2	ninguno
1618	1	VDECA0009	1	ninguno
1619	1	VDECA007	2	ninguno
1620	1	VDEFE0001	2	ninguno
1621	1	VE2022115917	41	ninguno
1622	1	VHL001	4	ninguno
1623	1	VHM001	8	ninguno
1624	1	VHS001	9	ninguno
1625	1	VHTL001	3	ninguno
1626	1	VHTM001	6	ninguno
1627	1	VHTS001	2	ninguno
1628	1	VT-01	2	ninguno
1629	1	VT-02	1	ninguno
1630	1	VVL001	5	ninguno
1631	1	VVM001	2	ninguno
1632	1	VVS001	5	ninguno
1633	1	W4UNID	1	ninguno
1634	1	WV04L	2	ninguno
1635	1	X001	2	ninguno
1636	1	X002	3	ninguno
1637	1	XW01S	3	ninguno
1638	1	XW02M	0	ninguno
1639	1	XW03L	1	ninguno
1640	1	XW04XL	1	ninguno
1641	1	ZY01S	1	ninguno
1642	1	ZY02M	3	ninguno
1643	1	ZY02-M	0	ninguno
1644	1	ZY03L	0	ninguno
1645	1	ZY04XL	1	ninguno
1647	2	01	0	ninguno
1648	2	017800142731	2	ninguno
1649	2	017800156424	3	ninguno
1650	2	017800156448	3	ninguno
1651	2	017800165426	2	ninguno
1652	2	017800174152	10	ninguno
1653	2	017800174220	5	ninguno
1654	2	017800176262	1	ninguno
1655	2	018065055583	2	ninguno
1656	2	018065057655	2	ninguno
1657	2	018065057686	2	ninguno
1658	2	018065057792	1	ninguno
1659	2	018214812784	0	ninguno
1660	2	018214812791	0	ninguno
1661	2	018214816218	1	ninguno
1662	2	018214846307	0	ninguno
1663	2	020279991335	3	ninguno
1664	2	020279992998	2	ninguno
1665	2	020279995173	1	ninguno
1666	2	020279995227	1	ninguno
1667	2	020531	0	ninguno
1668	2	030172013829	1	ninguno
1669	2	030172013850	0	ninguno
1670	2	034846730012	0	ninguno
1671	2	034846730029	2	ninguno
1672	2	034846730104	2	ninguno
1673	2	034846730111	0	ninguno
1674	2	034846730227	2	ninguno
1675	2	034846730319	0	ninguno
1676	2	034846730326	1	ninguno
1677	2	034846730401	1	ninguno
1678	2	034846730418	0	ninguno
1679	2	034846730500	0	ninguno
1680	2	034846730517	0	ninguno
1681	2	034846730609	1	ninguno
1682	2	034846730708	0	ninguno
1683	2	034846730715	0	ninguno
1684	2	034846730814	2	ninguno
1685	2	034846730821	1	ninguno
1686	2	034846730937	0	ninguno
1687	2	035585034003	2	ninguno
1688	2	035585111117	0	ninguno
1689	2	035585111216	1	ninguno
1690	2	035585111315	2	ninguno
1691	2	038100001306	2	ninguno
1692	2	038100171207	6	ninguno
1693	2	045663970062	0	ninguno
1694	2	045663970079	3	ninguno
1695	2	045663970086	0	ninguno
1696	2	045663970093	1	ninguno
1697	2	045663970109	0	ninguno
1698	2	045663976170	1	ninguno
1699	2	045663976194	2	ninguno
1700	2	052742001135	2	ninguno
1701	2	052742001197	2	ninguno
1702	2	052742001746	3	ninguno
1703	2	052742005188	4	ninguno
1704	2	052742005355	2	ninguno
1705	2	052742009971	0	ninguno
1706	2	052742012032	1	ninguno
1707	2	052742014296	2	ninguno
1708	2	052742014531	1	ninguno
1709	2	052742014555	2	ninguno
1710	2	052742020419	3	ninguno
1711	2	052742020488	3	ninguno
1712	2	052742024530	0	ninguno
1713	2	052742040141	0	ninguno
1714	2	052742187501	2	ninguno
1715	2	052742187907	2	ninguno
1716	2	052742195704	4	ninguno
1717	2	052742297200	1	ninguno
1718	2	052742335902	4	ninguno
1719	2	052742339009	4	ninguno
1720	2	052742453606	0	ninguno
1721	2	052742462806	5	ninguno
1722	2	052742567006	6	ninguno
1723	2	052742623801	5	ninguno
1724	2	052742624709	2	ninguno
1725	2	052742648606	2	ninguno
1726	2	052742679709	2	ninguno
1727	2	052742700106	12	ninguno
1728	2	052742700809	5	ninguno
1729	2	052742701004	6	ninguno
1730	2	052742701103	1	ninguno
1731	2	052742701608	3	ninguno
1732	2	052742701806	5	ninguno
1733	2	052742703602	2	ninguno
1734	2	052742703701	8	ninguno
1735	2	052742705507	2	ninguno
1736	2	052742710402	2	ninguno
1737	2	052742712307	2	ninguno
1738	2	052742713304	1	ninguno
1739	2	052742713908	4	ninguno
1740	2	052742715605	2	ninguno
1741	2	052742790107	0	ninguno
1742	2	052742818306	0	ninguno
1743	2	052742855509	1	ninguno
1744	2	052742861807	2	ninguno
1745	2	052742862101	1	ninguno
1746	2	052742862309	1	ninguno
1747	2	052742862408	2	ninguno
1748	2	052742867106	2	ninguno
1749	2	052742867601	1	ninguno
1750	2	052742909400	3	ninguno
1751	2	052742909608	2	ninguno
1752	2	052742909806	1	ninguno
1753	2	052742910000	1	ninguno
1754	2	052742930107	1	ninguno
1755	2	052742936802	1	ninguno
1756	2	070230107107	2	ninguno
1757	2	070230117168	1	ninguno
1758	2	073893212546	0	ninguno
1759	2	073893212553	2	ninguno
1760	2	073893223009	5	ninguno
1761	2	073893260035	2	ninguno
1762	2	073893260042	2	ninguno
1763	2	073893260066	1	ninguno
1764	2	073893263036	1	ninguno
1765	2	073893264026	1	ninguno
1766	2	073893265030	2	ninguno
1767	2	073893280002	1	ninguno
1768	2	074198612239	0	ninguno
1769	2	074198612277	3	ninguno
1770	2	074198612314	0	ninguno
1771	2	074198612345	0	ninguno
1772	2	074198612383	0	ninguno
1773	2	074198612413	4	ninguno
1774	2	074198612451	2	ninguno
1775	2	074198612499	2	ninguno
1776	2	074198613311	2	ninguno
1777	2	074198613359	2	ninguno
1778	2	074198614233	0	ninguno
1779	2	074198614240	0	ninguno
1780	2	074198614257	1	ninguno
1781	2	074198614264	2	ninguno
1782	2	074198615117	2	ninguno
1783	2	074198615131	3	ninguno
1784	2	074198615179	1	ninguno
1785	2	074198615261	2	ninguno
1786	2	074198615308	2	ninguno
1787	2	074198615391	1	ninguno
1788	2	074198615476	2	ninguno
1789	2	074198615513	1	ninguno
1790	2	07419861561	0	ninguno
1791	2	074198615612	2	ninguno
1792	2	074198615636	2	ninguno
1793	2	077627101182	0	ninguno
1794	2	077627101229	9	ninguno
1795	2	077627101274	0	ninguno
1796	2	077627101342	0	ninguno
1797	2	077627200991	0	ninguno
1798	2	077627201028	0	ninguno
1799	2	077627201066	0	ninguno
1800	2	077627201349	0	ninguno
1801	2	077627201356	0	ninguno
1802	2	077627302015	0	ninguno
1803	2	08003330160	16	ninguno
1804	2	087219111529	1	ninguno
1805	2	087219113776	8	ninguno
1806	2	087219116012	5	ninguno
1807	2	087219117439	0	ninguno
1808	2	087219120873	7	ninguno
1809	2	1	0	ninguno
1810	2	10	0	ninguno
1811	2	100	0	ninguno
1812	2	101	0	ninguno
1813	2	102	0	ninguno
1814	2	103	0	ninguno
1815	2	104	0	ninguno
1816	2	105	0	ninguno
1817	2	106	0	ninguno
1818	2	107	0	ninguno
1819	2	108	0	ninguno
1820	2	109	0	ninguno
1821	2	11	0	ninguno
1822	2	110	0	ninguno
1823	2	111	0	ninguno
1824	2	112	0	ninguno
1825	2	113	0	ninguno
1826	2	114	0	ninguno
1827	2	115	0	ninguno
1828	2	116	0	ninguno
1829	2	117	0	ninguno
1830	2	118	0	ninguno
1831	2	119	0	ninguno
1832	2	120	0	ninguno
1833	2	121	0	ninguno
1834	2	122	0	ninguno
1835	2	123	0	ninguno
1836	2	1234567890128	0	ninguno
1837	2	124	0	ninguno
1838	2	125	0	ninguno
1839	2	126	0	ninguno
1840	2	127	0	ninguno
1841	2	128	0	ninguno
1842	2	129	0	ninguno
1843	2	130	0	ninguno
1844	2	131	0	ninguno
1845	2	132	0	ninguno
1846	2	133	0	ninguno
1847	2	134	0	ninguno
1848	2	135	0	ninguno
1849	2	136	0	ninguno
1850	2	137	0	ninguno
1851	2	138	0	ninguno
1852	2	139	0	ninguno
1853	2	140	0	ninguno
1854	2	141	0	ninguno
1855	2	142	0	ninguno
1856	2	1421	0	ninguno
1857	2	143	0	ninguno
1858	2	144	0	ninguno
1859	2	145	0	ninguno
1860	2	146	0	ninguno
1861	2	147	0	ninguno
1862	2	148	0	ninguno
1863	2	149	0	ninguno
1864	2	150	0	ninguno
1865	2	151	0	ninguno
1866	2	152	0	ninguno
1867	2	153	0	ninguno
1868	2	154	0	ninguno
1869	2	155	0	ninguno
1870	2	156	0	ninguno
1871	2	157	0	ninguno
1872	2	158	0	ninguno
1873	2	159	0	ninguno
1874	2	160	0	ninguno
1875	2	161	0	ninguno
1876	2	16182	0	ninguno
1877	2	162	0	ninguno
1878	2	163	0	ninguno
1879	2	164	0	ninguno
1880	2	166	0	ninguno
1881	2	167	0	ninguno
1882	2	170	0	ninguno
1883	2	178988989	0	ninguno
1884	2	181	0	ninguno
1885	2	182	0	ninguno
1886	2	18214816218	0	ninguno
1887	2	183	0	ninguno
1888	2	184	0	ninguno
1889	2	185	0	ninguno
1890	2	186	0	ninguno
1891	2	187	0	ninguno
1892	2	188	0	ninguno
1893	2	189	0	ninguno
1894	2	190	0	ninguno
1895	2	191	0	ninguno
1896	2	192	0	ninguno
1897	2	194	0	ninguno
1898	2	195	0	ninguno
1899	2	196	0	ninguno
1900	2	20	0	ninguno
1901	2	200	0	ninguno
1902	2	2009073936	4	ninguno
1903	2	208400	0	ninguno
1904	2	21	0	ninguno
1905	2	22	0	ninguno
1906	2	22095	60	ninguno
1907	2	22108	60	ninguno
1908	2	22109	60	ninguno
1909	2	23	0	ninguno
1910	2	25026	27	ninguno
1911	2	25027	20	ninguno
1912	2	27003	0	ninguno
1913	2	30	0	ninguno
1914	2	300	0	ninguno
1915	2	301	0	ninguno
1916	2	302	0	ninguno
1917	2	303	0	ninguno
1918	2	304	0	ninguno
1919	2	305	0	ninguno
1920	2	306	0	ninguno
1921	2	307	0	ninguno
1922	2	308	0	ninguno
1923	2	309	0	ninguno
1924	2	31	0	ninguno
1925	2	310	0	ninguno
1926	2	311	0	ninguno
1927	2	312	0	ninguno
1928	2	313	0	ninguno
1929	2	314	0	ninguno
1930	2	315	0	ninguno
1931	2	316	0	ninguno
1932	2	317	0	ninguno
1933	2	318	0	ninguno
1934	2	3182550402132	1	ninguno
1935	2	3182550402149	1	ninguno
1936	2	3182550402170	1	ninguno
1937	2	3182550402224	1	ninguno
1938	2	3182550402439	1	ninguno
1939	2	3182550702201	1	ninguno
1940	2	3182550702225	1	ninguno
1941	2	3182550702423	1	ninguno
1942	2	3182550702447	2	ninguno
1943	2	3182550702614	1	ninguno
1944	2	3182550708180	1	ninguno
1945	2	3182550708197	0	ninguno
1946	2	3182550708203	2	ninguno
1947	2	3182550710923	1	ninguno
1948	2	3182550710992	1	ninguno
1949	2	3182550711036	2	ninguno
1950	2	3182550711050	1	ninguno
1951	2	3182550711142	1	ninguno
1952	2	3182550711159	2	ninguno
1953	2	3182550711333	0	ninguno
1954	2	3182550711395	1	ninguno
1955	2	3182550716857	1	ninguno
1956	2	3182550716888	2	ninguno
1957	2	3182550716925	1	ninguno
1958	2	3182550717687	1	ninguno
1959	2	3182550718813	2	ninguno
1960	2	3182550727822	2	ninguno
1961	2	3182550728102	1	ninguno
1962	2	3182550730587	1	ninguno
1963	2	3182550731355	0	ninguno
1964	2	3182550732055	1	ninguno
1965	2	3182550732154	1	ninguno
1966	2	3182550743433	1	ninguno
1967	2	3182550743440	1	ninguno
1968	2	3182550768474	1	ninguno
1969	2	3182550771054	2	ninguno
1970	2	3182550771061	0	ninguno
1971	2	3182550771719	1	ninguno
1972	2	3182550771733	2	ninguno
1973	2	3182550775267	1	ninguno
1974	2	3182550778657	2	ninguno
1975	2	3182550778671	0	ninguno
1976	2	3182550793001	2	ninguno
1977	2	3182550793032	2	ninguno
1978	2	3182550793049	1	ninguno
1979	2	3182550798945	2	ninguno
1980	2	3182550799768	2	ninguno
1981	2	3182550831086	0	ninguno
1982	2	3182550831383	1	ninguno
1983	2	3182550831390	2	ninguno
1984	2	319	0	ninguno
1985	2	32	0	ninguno
1986	2	320	0	ninguno
1987	2	321	0	ninguno
1988	2	322	0	ninguno
1989	2	323	0	ninguno
1990	2	33	0	ninguno
1991	2	33015	1	ninguno
1992	2	33016	1	ninguno
1993	2	33059	2	ninguno
1994	2	3411112261956	2	ninguno
1995	2	350	0	ninguno
1996	2	3552793078300	0	ninguno
1997	2	3552793078324	0	ninguno
1998	2	40	0	ninguno
1999	2	400	0	ninguno
2000	2	4007221039112	1	ninguno
2001	2	4007221039129	2	ninguno
2002	2	4007221043218	1	ninguno
2003	2	4007221052180	23	ninguno
2004	2	4007221054221	10	ninguno
2005	2	401	0	ninguno
2006	2	402	0	ninguno
2007	2	403	0	ninguno
2008	2	404	0	ninguno
2009	2	41	0	ninguno
2010	2	41006	0	ninguno
2011	2	41013	4	ninguno
2012	2	41019	10	ninguno
2013	2	412	0	ninguno
2014	2	415	0	ninguno
2015	2	416	0	ninguno
2016	2	42	0	ninguno
2017	2	4260448120210	0	ninguno
2018	2	43	0	ninguno
2019	2	45	0	ninguno
2020	2	4894158096291	0	ninguno
2021	2	50	0	ninguno
2022	2	51	0	ninguno
2023	2	52	0	ninguno
2024	2	53	0	ninguno
2025	2	5414736039282	2	ninguno
2026	2	5414736047911	2	ninguno
2027	2	5414736047928	0	ninguno
2028	2	5414736047935	1	ninguno
2029	2	5414736047942	3	ninguno
2030	2	5414736048253	20	ninguno
2031	2	5415341001961	0	ninguno
2032	2	5420043705338	1	ninguno
2033	2	5420043705345	2	ninguno
2034	2	6	0	ninguno
2035	2	60	0	ninguno
2036	2	61	0	ninguno
2037	2	62	0	ninguno
2038	2	63	0	ninguno
2039	2	645095002166	2	ninguno
2040	2	659525114701	0	ninguno
2041	2	662858207224	5	ninguno
2042	2	662858226003	10	ninguno
2043	2	682500939518	0	ninguno
2044	2	682500939679	0	ninguno
2045	2	6828949660383	1	ninguno
2046	2	6920190048764	0	ninguno
2047	2	6953182709244	0	ninguno
2048	2	6953182710585	0	ninguno
2049	2	6953182710820	0	ninguno
2050	2	6953182714576	0	ninguno
2051	2	6953182714972	0	ninguno
2052	2	6953182718062	0	ninguno
2053	2	6953182719458	1	ninguno
2054	2	6953182719571	0	ninguno
2055	2	6953182720072	0	ninguno
2056	2	6953182721161	0	ninguno
2057	2	6953182731450	0	ninguno
2058	2	6953182731481	0	ninguno
2059	2	6953182732365	0	ninguno
2060	2	6953182732372	0	ninguno
2061	2	6953182732389	0	ninguno
2062	2	6953182732440	1	ninguno
2063	2	6953182735083	0	ninguno
2064	2	6972170629975	1	ninguno
2065	2	6995654545424	1	ninguno
2066	2	70	0	ninguno
2067	2	71	0	ninguno
2068	2	711604200290	1	ninguno
2069	2	711604203734	0	ninguno
2070	2	714193509102	1	ninguno
2071	2	714193600724	2	ninguno
2072	2	714193600823	2	ninguno
2073	2	714193600861	1	ninguno
2074	2	714193600984	2	ninguno
2075	2	714193610934	4	ninguno
2076	2	714193699728	1	ninguno
2077	2	7191600000507	0	ninguno
2078	2	72	0	ninguno
2079	2	73	0	ninguno
2080	2	73000101	0	ninguno
2081	2	73008199IO	0	ninguno
2082	2	73033333	0	ninguno
2083	2	736990012050	1	ninguno
2084	2	736990012104	1	ninguno
2085	2	736990012159	2	ninguno
2086	2	736990012203	1	ninguno
2087	2	736990012258	2	ninguno
2088	2	736990013002	1	ninguno
2089	2	736990013309	1	ninguno
2090	2	736990040114	4	ninguno
2091	2	74 6203100578	0	ninguno
2092	2	7404000315615	0	ninguno
2093	2	7404000315622	2	ninguno
2094	2	7404000315639	2	ninguno
2095	2	7404000315646	0	ninguno
2096	2	7406160004224	0	ninguno
2097	2	7410000115322	3	ninguno
2098	2	7410032780024	3	ninguno
2099	2	7410032780031	2	ninguno
2100	2	7414400200596	4	ninguno
2101	2	7414400201012	2	ninguno
2102	2	7414400201050	0	ninguno
2103	2	7414400201067	1	ninguno
2104	2	7414400201074	1	ninguno
2105	2	7414400201081	1	ninguno
2106	2	7414400201111	2	ninguno
2107	2	7414400201128	1	ninguno
2108	2	7414400201210	3	ninguno
2109	2	7414400201227	2	ninguno
2110	2	7414400201234	2	ninguno
2111	2	7414400201296	3	ninguno
2112	2	7414400201302	2	ninguno
2113	2	7414400201364	2	ninguno
2114	2	7414400201432	4	ninguno
2115	2	7414400201449	3	ninguno
2116	2	7414400201456	4	ninguno
2117	2	7414400201470	1	ninguno
2118	2	7414400201487	5	ninguno
2119	2	7414400201494	8	ninguno
2120	2	7414400201609	4	ninguno
2121	2	7414400201616	5	ninguno
2122	2	7414400201623	2	ninguno
2123	2	7414400202088	3	ninguno
2124	2	7414400202095	2	ninguno
2125	2	7414400202101	3	ninguno
2126	2	7414400202149	2	ninguno
2127	2	7416203100264	1	ninguno
2128	2	7416203100271	1	ninguno
2129	2	7416203100288	2	ninguno
2130	2	7416203100295	1	ninguno
2131	2	7416203100301	2	ninguno
2132	2	7416203100318	2	ninguno
2133	2	7416203100578	2	ninguno
2134	2	7416203100585	0	ninguno
2135	2	7416203100592	2	ninguno
2136	2	7416203100608	3	ninguno
2137	2	7416203100615	3	ninguno
2138	2	7416203100622	2	ninguno
2139	2	7416203100639	2	ninguno
2140	2	7416203100646	3	ninguno
2141	2	7416203100653	2	ninguno
2142	2	7416203100660	2	ninguno
2143	2	7416203100677	2	ninguno
2144	2	7416203100684	0	ninguno
2145	2	7416203100844	2	ninguno
2146	2	7416203101179	1	ninguno
2147	2	7416203101209	0	ninguno
2148	2	7416203101247	1	ninguno
2149	2	7416203101254	2	ninguno
2150	2	7416203101261	2	ninguno
2151	2	7416203101278	1	ninguno
2152	2	7416203101438	0	ninguno
2153	2	7416203101445	2	ninguno
2154	2	7416203101469	0	ninguno
2155	2	7416203101520	1	ninguno
2156	2	7416203101544	0	ninguno
2157	2	7416203101551	0	ninguno
2158	2	7416203101667	2	ninguno
2159	2	7416203101797	0	ninguno
2160	2	7416203101827	0	ninguno
2161	2	7416203101834	0	ninguno
2162	2	7416203101902	1	ninguno
2163	2	7416203101926	0	ninguno
2164	2	7416203101964	0	ninguno
2165	2	7416203102183	1	ninguno
2166	2	7416203102213	0	ninguno
2167	2	7416203102220	2	ninguno
2168	2	7416203102237	1	ninguno
2169	2	7416203102244	0	ninguno
2170	2	7416203102916	0	ninguno
2171	2	7416203102923	0	ninguno
2172	2	7416203102930	2	ninguno
2173	2	7416203103326	0	ninguno
2174	2	7416203103333	0	ninguno
2175	2	7416203103340	0	ninguno
2176	2	7416203103357	3	ninguno
2177	2	7416203103364	2	ninguno
2178	2	7416203103371	2	ninguno
2179	2	7416203103388	1	ninguno
2180	2	7416203103395	2	ninguno
2181	2	7416203103401	2	ninguno
2182	2	7416203103418	0	ninguno
2183	2	7416203103425	0	ninguno
2184	2	7416203103685	0	ninguno
2185	2	7416203103692	0	ninguno
2186	2	7416203103708	1	ninguno
2187	2	7416203103722	0	ninguno
2188	2	7416203103739	0	ninguno
2189	2	7416203103753	1	ninguno
2190	2	7416203103760	2	ninguno
2191	2	7420615480007-7.5	0	ninguno
2192	2	742061548007-10	2	ninguno
2193	2	742061548007-12.5	2	ninguno
2194	2	742061548007-15	0	ninguno
2195	2	742061548007-20	0	ninguno
2196	2	742061548007-25	1	ninguno
2197	2	742061548007-30	0	ninguno
2198	2	742061548007-7.5	2	ninguno
2199	2	7441003121935	20	ninguno
2200	2	7441003121942	10	ninguno
2201	2	7441007802434	3	ninguno
2202	2	7441031336950	0	ninguno
2203	2	7453105056978	0	ninguno
2204	2	7501	0	ninguno
2205	2	7501051100020	2	ninguno
2206	2	7501051100037	1	ninguno
2207	2	7501051186963	1	ninguno
2208	2	7501072204462	2	ninguno
2209	2	7501072204479	1	ninguno
2210	2	7501072204561	2	ninguno
2211	2	7501072204578	3	ninguno
2212	2	7501072204592	1	ninguno
2213	2	7501072204615	2	ninguno
2214	2	7501072206299	2	ninguno
2215	2	7501072206305	0	ninguno
2216	2	7501072207234	2	ninguno
2217	2	7501072207258	16	ninguno
2218	2	7501072207265	3	ninguno
2219	2	7501072208231	2	ninguno
2220	2	7501072208248	4	ninguno
2221	2	7501072208262	1	ninguno
2222	2	7501072208279	2	ninguno
2223	2	7501072208293	1	ninguno
2224	2	7501072208743	0	ninguno
2225	2	7501072208767	2	ninguno
2226	2	7501072208781	5	ninguno
2227	2	7501072208798	3	ninguno
2228	2	7501072208927	1	ninguno
2229	2	7501072208958	2	ninguno
2230	2	7501072208972	2	ninguno
2231	2	7501072210609	1	ninguno
2232	2	7501072210616	1	ninguno
2233	2	7501072210623	4	ninguno
2234	2	7501072210630	1	ninguno
2235	2	7501072210661	2	ninguno
2236	2	7501072210678	2	ninguno
2237	2	7501072210685	1	ninguno
2238	2	7501072210692	1	ninguno
2239	2	7501072210715	1	ninguno
2240	2	7501072210722	1	ninguno
2241	2	7501072210739	2	ninguno
2242	2	7501072214485	7	ninguno
2243	2	7501072214492	11	ninguno
2244	2	7501072214508	9	ninguno
2245	2	7501072214515	27	ninguno
2246	2	7501072214522	2	ninguno
2247	2	7501072214539	3	ninguno
2248	2	7501072214546	3	ninguno
2249	2	7501072214560	10	ninguno
2250	2	7502010420043	0	ninguno
2251	2	7502010421118	24	ninguno
2252	2	7502010421125	17	ninguno
2253	2	7502010421132	18	ninguno
2254	2	7502010421187	12	ninguno
2255	2	7502010421194	9	ninguno
2256	2	7502010423969	0	ninguno
2257	2	7502010429701	394	ninguno
2258	2	7502262630023	64	ninguno
2259	2	7502262630740	1	ninguno
2260	2	7502262630795	2	ninguno
2261	2	7503008553002	2	ninguno
2262	2	7503008553040	2	ninguno
2263	2	7503008553057	1	ninguno
2264	2	7503008553071	3	ninguno
2265	2	7503008553200	2	ninguno
2266	2	7503008553231	2	ninguno
2267	2	7503008553248	2	ninguno
2268	2	7503008553255	2	ninguno
2269	2	7503008553279	2	ninguno
2270	2	7503008553965	1	ninguno
2271	2	7503008553972	0	ninguno
2272	2	7503019166604	0	ninguno
2273	2	7503020053085	1	ninguno
2274	2	7503020053290	6	ninguno
2275	2	7503020053306	3	ninguno
2276	2	7503020053313	20	ninguno
2277	2	7503020053320	2	ninguno
2278	2	7503020053382	1	ninguno
2279	2	7503020053849	4	ninguno
2280	2	7503026084113	2	ninguno
2281	2	7503026084144	1	ninguno
2282	2	7503026470107	3	ninguno
2283	2	7503027959472	0	ninguno
2284	2	7506267903489	0	ninguno
2285	2	7506267907340	0	ninguno
2286	2	7506267907357	0	ninguno
2287	2	7506267907371	0	ninguno
2288	2	7506343800015	29	ninguno
2289	2	7506343800022	28	ninguno
2290	2	7506343800039	22	ninguno
2291	2	7506343800176	30	ninguno
2292	2	7506343800190	14	ninguno
2293	2	7506343800794	1	ninguno
2294	2	7506343801784	3	ninguno
2295	2	7506343802668	2	ninguno
2296	2	7506343802675	2	ninguno
2297	2	7506343802798	1	ninguno
2298	2	7506396700645	0	ninguno
2299	2	7506407400328	0	ninguno
2300	2	7506407400618	0	ninguno
2301	2	7506407400625	0	ninguno
2302	2	7506407400977	5	ninguno
2303	2	7506407401691	0	ninguno
2304	2	7506407402094	0	ninguno
2305	2	7506407402124	1	ninguno
2306	2	7506407402193	40	ninguno
2307	2	7506407402216	1	ninguno
2308	2	7506407402247	1	ninguno
2309	2	7506407402469	5	ninguno
2310	2	7593990010041	0	ninguno
2311	2	7593990010058	0	ninguno
2312	2	7593990012953	0	ninguno
2313	2	7593990050511	0	ninguno
2314	2	769229001167	2	ninguno
2315	2	769229002430	2	ninguno
2316	2	769229002683	17	ninguno
2317	2	769229003611	96	ninguno
2318	2	769229003710	5	ninguno
2319	2	769229003734	2	ninguno
2320	2	769229003741	3	ninguno
2321	2	769229003758	2	ninguno
2322	2	769229049510	65	ninguno
2323	2	769229124217	0	ninguno
2324	2	769229131413	2	ninguno
2325	2	769229131512	2	ninguno
2326	2	769229131918	1	ninguno
2327	2	7707007404604	2	ninguno
2328	2	7707007405663	2	ninguno
2329	2	7707115301161	2	ninguno
2330	2	7707115301222	4	ninguno
2331	2	7707115301468	30	ninguno
2332	2	7707115301611	0	ninguno
2333	2	7707214570659	1	ninguno
2334	2	7707214570833	4	ninguno
2335	2	7707214570918	1	ninguno
2336	2	7707214570949	1	ninguno
2337	2	7707214573001	2	ninguno
2338	2	7707274710316	0	ninguno
2339	2	7707274714215	20	ninguno
2340	2	7707274715014	3	ninguno
2341	2	7707274717001	1	ninguno
2342	2	7707274718060	3	ninguno
2343	2	7730952032677	0	ninguno
2344	2	7730952032899	198	ninguno
2345	2	7730997410614	2	ninguno
2346	2	7730997410621	2	ninguno
2347	2	7730997410638	3	ninguno
2348	2	7730997410645	1	ninguno
2349	2	7756654000363	1	ninguno
2350	2	7756654000370	1	ninguno
2351	2	7756654000387	0	ninguno
2352	2	7756654000400	1	ninguno
2353	2	7756654000424	0	ninguno
2354	2	7756654000448	1	ninguno
2355	2	7756654015220	0	ninguno
2356	2	7756654020156	1	ninguno
2357	2	7756654020293	1	ninguno
2358	2	7756654027926	2	ninguno
2359	2	7756654027933	3	ninguno
2360	2	7756654027940	3	ninguno
2361	2	7759433000059	0	ninguno
2362	2	7759433000882	20	ninguno
2363	2	7759433000998	4	ninguno
2364	2	7759433001193	1	ninguno
2365	2	7759433001933	4	ninguno
2366	2	7759433001940	3	ninguno
2367	2	7792716421868	0	ninguno
2368	2	7797600000174	2	ninguno
2369	2	7797600000501	4	ninguno
2370	2	7797600000518	2	ninguno
2371	2	7797600000761	36	ninguno
2372	2	7797600000785	2	ninguno
2373	2	7797600001805	2	ninguno
2374	2	7797600001812	2	ninguno
2375	2	7797600002895	20	ninguno
2376	2	7797600002901	20	ninguno
2377	2	7798042360055	3	ninguno
2378	2	7798042360093	2	ninguno
2379	2	7798042360109	2	ninguno
2380	2	7798042360178	3	ninguno
2381	2	7798042360185	0	ninguno
2382	2	7798042360260	5	ninguno
2383	2	7798042360468	4	ninguno
2384	2	7798042360581	2	ninguno
2385	2	7798042361311	66	ninguno
2386	2	7798042361335	0	ninguno
2387	2	7798042361359	2	ninguno
2388	2	7798042361380	2	ninguno
2389	2	7798042361533	2	ninguno
2390	2	7798042364800	40	ninguno
2391	2	7798042364961	29	ninguno
2392	2	7798042365685	2	ninguno
2393	2	7798042365692	2	ninguno
2394	2	7798042365708	16	ninguno
2395	2	7798042365715	60	ninguno
2396	2	7798042365722	60	ninguno
2397	2	7798042365739	2	ninguno
2398	2	7798042365975	3	ninguno
2399	2	7798042366170	3	ninguno
2400	2	7798042366187	2	ninguno
2401	2	7798042366200	1	ninguno
2402	2	7798042366217	1	ninguno
2403	2	7798042366224	2	ninguno
2404	2	7798042366231	0	ninguno
2405	2	7798042366255	7	ninguno
2406	2	7798042366262	12	ninguno
2407	2	7798144990860	0	ninguno
2408	2	7798144993663	0	ninguno
2409	2	7798156460054	1	ninguno
2410	2	7798156460061	400	ninguno
2411	2	7798156460290	0	ninguno
2412	2	7798156460429	4	ninguno
2413	2	7798156460498	200	ninguno
2414	2	7798156460740	149	ninguno
2415	2	7798156461051	20	ninguno
2416	2	7798156461808	0	ninguno
2417	2	7798156461815	2	ninguno
2418	2	7798156461853	2	ninguno
2419	2	7798156461884	20	ninguno
2420	2	7798156462928	33	ninguno
2421	2	7798156463185	2	ninguno
2422	2	7798166871895	5	ninguno
2423	2	7798166871901	2	ninguno
2424	2	7798166873134	0	ninguno
2425	2	7798166873141	0	ninguno
2426	2	7798166873158	0	ninguno
2427	2	7798166873165	0	ninguno
2428	2	7798166873172	1	ninguno
2429	2	7798176420403	1	ninguno
2430	2	7798176420410	2	ninguno
2431	2	7798176420434	1	ninguno
2432	2	7798176420458	1	ninguno
2433	2	7798176420465	3	ninguno
2434	2	7798176421073	1	ninguno
2435	2	7798176421080	0	ninguno
2436	2	7798176421097	0	ninguno
2437	2	7798176421103	1	ninguno
2438	2	7798176421110	1	ninguno
2439	2	7798176421196	1	ninguno
2440	2	7798176421202	2	ninguno
2441	2	7798176421219	1	ninguno
2442	2	7798176421264	2	ninguno
2443	2	7798176421745	2	ninguno
2444	2	7798176421752	1	ninguno
2445	2	7798176421769	1	ninguno
2446	2	7798176421776	1	ninguno
2447	2	7798176421868	2	ninguno
2448	2	7798176421875	1	ninguno
2449	2	7798176421882	2	ninguno
2450	2	7798176421899	0	ninguno
2451	2	7798176421905	0	ninguno
2452	2	7798176422926	1	ninguno
2453	2	7798359710017	3	ninguno
2454	2	7800006000232	3	ninguno
2455	2	7800006002038	0	ninguno
2456	2	7800006002700	20	ninguno
2457	2	7800006002724	0	ninguno
2458	2	7800006003370	1	ninguno
2459	2	7800006003561	3	ninguno
2460	2	7800006003646	2	ninguno
2461	2	7800006005169	2	ninguno
2462	2	7800019000014	16	ninguno
2463	2	784369477115	2	ninguno
2464	2	784369477122	2	ninguno
2465	2	7898049715480	8	ninguno
2466	2	7898049719273	0	ninguno
2467	2	7898416700040	3	ninguno
2468	2	7898416700521	1	ninguno
2469	2	7898416700743	1	ninguno
2470	2	7898416701344	1	ninguno
2471	2	7898416701955	1	ninguno
2472	2	7898416701979	2	ninguno
2473	2	7898597991329	44	ninguno
2474	2	80	0	ninguno
2475	2	8010690010908	2	ninguno
2476	2	8010690010915	2	ninguno
2477	2	8010690010946	2	ninguno
2478	2	8010690010991	0	ninguno
2479	2	8010690011080	2	ninguno
2480	2	8010690011295	2	ninguno
2481	2	8010690011301	1	ninguno
2482	2	8010690011349	2	ninguno
2483	2	8010690011394	0	ninguno
2484	2	8010690011547	0	ninguno
2485	2	8010690011745	0	ninguno
2486	2	8010690011769	2	ninguno
2487	2	8010690011790	2	ninguno
2488	2	8010690011936	1	ninguno
2489	2	8010690011967	2	ninguno
2490	2	8010690012186	2	ninguno
2491	2	8010690012209	1	ninguno
2492	2	8010690012308	2	ninguno
2493	2	8010690012360	2	ninguno
2494	2	8010690012476	0	ninguno
2495	2	8010690012674	2	ninguno
2496	2	8010690012698	2	ninguno
2497	2	8010690014043	2	ninguno
2498	2	8010690025919	2	ninguno
2499	2	8010690025926	2	ninguno
2500	2	8010690025940	1	ninguno
2501	2	8010690025988	2	ninguno
2502	2	8010690026015	2	ninguno
2503	2	8010690026053	2	ninguno
2504	2	8010690026060	2	ninguno
2505	2	8010690026084	2	ninguno
2506	2	8010690026121	2	ninguno
2507	2	8010690026138	0	ninguno
2508	2	8010690026152	2	ninguno
2509	2	8010690029214	2	ninguno
2510	2	8010690029566	2	ninguno
2511	2	8010690029986	2	ninguno
2512	2	8010690029993	2	ninguno
2513	2	8010690030005	2	ninguno
2514	2	8010690030029	2	ninguno
2515	2	8010690037363	0	ninguno
2516	2	8010690041926	0	ninguno
2517	2	8010690041933	2	ninguno
2518	2	8010690041940	1	ninguno
2519	2	8010690042084	2	ninguno
2520	2	8010690042091	0	ninguno
2521	2	8010690042114	2	ninguno
2522	2	8010690042121	3	ninguno
2523	2	8010690042145	0	ninguno
2524	2	8010690042152	0	ninguno
2525	2	8010690047775	0	ninguno
2526	2	8010690050072	2	ninguno
2527	2	8010690050089	2	ninguno
2528	2	8010690050096	0	ninguno
2529	2	8010690053677	2	ninguno
2530	2	8010690053691	2	ninguno
2531	2	8010690053714	2	ninguno
2532	2	8010690053738	1	ninguno
2533	2	8010690053752	2	ninguno
2534	2	8010690053776	2	ninguno
2535	2	8010690055381	2	ninguno
2536	2	8010690055398	2	ninguno
2537	2	8010690055404	2	ninguno
2538	2	8010690055411	2	ninguno
2539	2	8010690055428	2	ninguno
2540	2	8010690055435	2	ninguno
2541	2	8010690055442	0	ninguno
2542	2	8010690055459	2	ninguno
2543	2	8010690055466	2	ninguno
2544	2	8010690056135	2	ninguno
2545	2	8010690056142	2	ninguno
2546	2	8010690056159	2	ninguno
2547	2	8010690056548	1	ninguno
2548	2	8010690056555	2	ninguno
2549	2	8010690056562	0	ninguno
2550	2	8010690056579	2	ninguno
2551	2	8010690056586	0	ninguno
2552	2	8010690056616	2	ninguno
2553	2	8010690056630	1	ninguno
2554	2	8010690056647	0	ninguno
2555	2	8010690056654	1	ninguno
2556	2	8010690056661	2	ninguno
2557	2	8010690057552	2	ninguno
2558	2	8010690057569	2	ninguno
2559	2	8010690058160	1	ninguno
2560	2	8010690059082	2	ninguno
2561	2	8010690061696	0	ninguno
2562	2	8010690061702	0	ninguno
2563	2	8010690062853	1	ninguno
2564	2	8010690067339	1	ninguno
2565	2	8010690068121	0	ninguno
2566	2	8010690068138	0	ninguno
2567	2	8010690080017	2	ninguno
2568	2	8010690080024	0	ninguno
2569	2	8010690080031	2	ninguno
2570	2	8010690088365	5	ninguno
2571	2	8010690088457	2	ninguno
2572	2	8010690088563	0	ninguno
2573	2	8010690091471	0	ninguno
2574	2	8010690092898	2	ninguno
2575	2	8010690093604	2	ninguno
2576	2	8010690099552	0	ninguno
2577	2	8010690101491	0	ninguno
2578	2	8010690101507	2	ninguno
2579	2	8010690105796	1	ninguno
2580	2	8010690105802	2	ninguno
2581	2	8010690105819	0	ninguno
2582	2	8010690105826	0	ninguno
2583	2	8010690105833	1	ninguno
2584	2	8010690105840	2	ninguno
2585	2	8010690105857	2	ninguno
2586	2	8010690105864	2	ninguno
2587	2	8010690105871	2	ninguno
2588	2	8010690105888	2	ninguno
2589	2	8010690106571	1	ninguno
2590	2	8010690107028	0	ninguno
2591	2	8010690107134	0	ninguno
2592	2	8010690115924	0	ninguno
2593	2	8010690122946	0	ninguno
2594	2	8010690122953	0	ninguno
2595	2	8010690122977	0	ninguno
2596	2	8010690122991	0	ninguno
2597	2	8010690123004	0	ninguno
2598	2	8010690123011	0	ninguno
2599	2	8010690123035	0	ninguno
2600	2	8010690123059	0	ninguno
2601	2	8010690123066	0	ninguno
2602	2	8010690123073	0	ninguno
2603	2	8010690123097	0	ninguno
2604	2	8010690123110	0	ninguno
2605	2	8010690123141	0	ninguno
2606	2	8010690123158	0	ninguno
2607	2	8010690123172	0	ninguno
2608	2	8010690123196	0	ninguno
2609	2	8010690123202	0	ninguno
2610	2	8010690123219	2	ninguno
2611	2	8010690123233	0	ninguno
2612	2	8010690123257	0	ninguno
2613	2	8010690133362	2	ninguno
2614	2	8010690140346	2	ninguno
2615	2	8010690140360	2	ninguno
2616	2	8010690140377	0	ninguno
2617	2	8010690140384	2	ninguno
2618	2	8010690148977	0	ninguno
2619	2	8010690149004	0	ninguno
2620	2	8010690149011	0	ninguno
2621	2	8010690149028	0	ninguno
2622	2	8010690149059	0	ninguno
2623	2	8010690149066	0	ninguno
2624	2	8010690149073	0	ninguno
2625	2	8010690149097	0	ninguno
2626	2	8010690149103	0	ninguno
2627	2	8010690153100	2	ninguno
2628	2	8010690153124	0	ninguno
2629	2	8010690153568	1	ninguno
2630	2	8010690153582	1	ninguno
2631	2	8010690156156	2	ninguno
2632	2	8010690156163	0	ninguno
2633	2	8010690159270	1	ninguno
2634	2	8010690159782	0	ninguno
2635	2	8010690159867	0	ninguno
2636	2	8010690160443	0	ninguno
2637	2	8010690160474	0	ninguno
2638	2	8010690160481	0	ninguno
2639	2	8010690160498	0	ninguno
2640	2	8010690160511	0	ninguno
2641	2	8010690164670	4	ninguno
2642	2	8010690166308	2	ninguno
2643	2	8010690166315	2	ninguno
2644	2	8010690166322	2	ninguno
2645	2	8010690166339	1	ninguno
2646	2	8010690166346	2	ninguno
2647	2	8010690166353	2	ninguno
2648	2	8010690166360	1	ninguno
2649	2	8010690166377	2	ninguno
2650	2	8010690168821	0	ninguno
2651	2	8010690172033	1	ninguno
2652	2	8010690175331	2	ninguno
2653	2	8010690175355	0	ninguno
2654	2	8010690175362	2	ninguno
2655	2	8010690175379	2	ninguno
2656	2	8010690175386	2	ninguno
2657	2	8010690175409	1	ninguno
2658	2	8010690175416	2	ninguno
2659	2	8010690175423	0	ninguno
2660	2	8010690175454	2	ninguno
2661	2	8010690175478	2	ninguno
2662	2	8010690175485	0	ninguno
2663	2	8010690175492	2	ninguno
2664	2	8010690175508	2	ninguno
2665	2	8010690175515	2	ninguno
2666	2	8010690175522	1	ninguno
2667	2	8010690175546	1	ninguno
2668	2	8010690175553	2	ninguno
2669	2	8010690175577	2	ninguno
2670	2	8010690175584	0	ninguno
2671	2	8010690176161	0	ninguno
2672	2	8010690176178	0	ninguno
2673	2	8010690176208	2	ninguno
2674	2	8010690176215	2	ninguno
2675	2	8010690176222	2	ninguno
2676	2	8010690176260	0	ninguno
2677	2	8010690176277	0	ninguno
2678	2	8010690176307	0	ninguno
2679	2	8010690179445	2	ninguno
2680	2	8010690180076	2	ninguno
2681	2	8010690180106	1	ninguno
2682	2	8010690180137	1	ninguno
2683	2	8010690180168	1	ninguno
2684	2	8010690180182	0	ninguno
2685	2	8010690180755	2	ninguno
2686	2	8010690191065	2	ninguno
2687	2	8010690191089	2	ninguno
2688	2	81	0	ninguno
2689	2	811794010850	0	ninguno
2690	2	811794010898	0	ninguno
2691	2	82	0	ninguno
2692	2	83	0	ninguno
2693	2	84	0	ninguno
2694	2	8410650150130	2	ninguno
2695	2	8410650150147	0	ninguno
2696	2	8410650150185	1	ninguno
2697	2	8410650150192	2	ninguno
2698	2	8410650150253	2	ninguno
2699	2	8410650151892	2	ninguno
2700	2	8410650151946	0	ninguno
2701	2	8410650152264	2	ninguno
2702	2	8410650152288	2	ninguno
2703	2	8410650152301	2	ninguno
2704	2	8410650152325	2	ninguno
2705	2	8410650152363	1	ninguno
2706	2	8410650152400	2	ninguno
2707	2	8410650152448	2	ninguno
2708	2	8410650160474	2	ninguno
2709	2	8410650167817	1	ninguno
2710	2	8410650168104	2	ninguno
2711	2	8410650168128	1	ninguno
2712	2	8410650170695	3	ninguno
2713	2	8410650170718	1	ninguno
2714	2	8410650218649	2	ninguno
2715	2	8410650239132	1	ninguno
2716	2	842704100095	0	ninguno
2717	2	842704100743	6	ninguno
2718	2	8433042001582	0	ninguno
2719	2	8436001971605	0	ninguno
2720	2	8436001971612	1	ninguno
2721	2	8436001971643	0	ninguno
2722	2	8436001971650	1	ninguno
2723	2	8436001971681	2	ninguno
2724	2	8436001971704	0	ninguno
2725	2	8436001971728	2	ninguno
2726	2	8436532730030	10	ninguno
2727	2	8436532730047	0	ninguno
2728	2	8436532730122	5	ninguno
2729	2	8436532730139	3	ninguno
2730	2	8436532730146	0	ninguno
2731	2	8436532730252	2	ninguno
2732	2	8436532730412	0	ninguno
2733	2	8436532730665	2	ninguno
2734	2	8470000397516	0	ninguno
2735	2	8470000491269	0	ninguno
2736	2	8470000493195	0	ninguno
2737	2	8470000647512	0	ninguno
2738	2	8470000957512	0	ninguno
2739	2	847922021016	0	ninguno
2740	2	847922021115	1	ninguno
2741	2	847922021191	1	ninguno
2742	2	847922021559	2	ninguno
2743	2	847922021580	0	ninguno
2744	2	847922021610	2	ninguno
2745	2	847922024031	1	ninguno
2746	2	847922024048	1	ninguno
2747	2	847922027438	1	ninguno
2748	2	847922028084	2	ninguno
2749	2	847922075613	0	ninguno
2750	2	8699245857306	2	ninguno
2751	2	8699245857313	2	ninguno
2752	2	8699245857337	1	ninguno
2753	2	8699245857351	2	ninguno
2754	2	8699245857399	2	ninguno
2755	2	8699245857405	1	ninguno
2756	2	8699245857429	2	ninguno
2757	2	8699245857443	1	ninguno
2758	2	8713184080653	31	ninguno
2759	2	8713184134349	4	ninguno
2760	2	8713184135278	4	ninguno
2761	2	8713184135285	5	ninguno
2762	2	8713184135292	4	ninguno
2763	2	8713184141408	2	ninguno
2764	2	8886467510229	1	ninguno
2765	2	8886467510236	2	ninguno
2766	2	8886467510250	0	ninguno
2767	2	8886467510267	0	ninguno
2768	2	8886467510281	2	ninguno
2769	2	8886467510311	2	ninguno
2770	2	8886467510328	1	ninguno
2771	2	8886467510335	2	ninguno
2772	2	8886467510410	1	ninguno
2773	2	8886467510427	2	ninguno
2774	2	8886467510434	2	ninguno
2775	2	8886467510441	0	ninguno
2776	2	8886467510458	0	ninguno
2777	2	8886467510465	0	ninguno
2778	2	8886467510588	0	ninguno
2779	2	8886467510724	0	ninguno
2780	2	8886467510755	0	ninguno
2781	2	8886467510830	0	ninguno
2782	2	8886467514210	0	ninguno
2783	2	8886467514401	0	ninguno
2784	2	8886467514418	0	ninguno
2785	2	8886467514425	0	ninguno
2786	2	8886467514463	0	ninguno
2787	2	8886467514470	0	ninguno
2788	2	8886467514487	0	ninguno
2789	2	8886467514494	0	ninguno
2790	2	8886467514579	0	ninguno
2791	2	8886467514616	0	ninguno
2792	2	8886467514623	0	ninguno
2793	2	8886467514630	0	ninguno
2794	2	8886467514647	0	ninguno
2795	2	8886467514654	0	ninguno
2796	2	8886467514661	0	ninguno
2797	2	8886467514678	2	ninguno
2798	2	8886467514685	0	ninguno
2799	2	8886467514692	2	ninguno
2800	2	8886467514715	0	ninguno
2801	2	8886467514722	0	ninguno
2802	2	8886467514739	0	ninguno
2803	2	8886467514746	0	ninguno
2804	2	8886467514760	0	ninguno
2805	2	8886467514814	0	ninguno
2806	2	8886467514821	0	ninguno
2807	2	8886467514906	1	ninguno
2808	2	8886467514920	0	ninguno
2809	2	8886467515521	3	ninguno
2810	2	8886467515644	0	ninguno
2811	2	8886467515811	1	ninguno
2812	2	8886467515866	0	ninguno
2813	2	8886467515897	0	ninguno
2814	2	8886467515927	0	ninguno
2815	2	8886467515934	0	ninguno
2816	2	8886467515965	5	ninguno
2817	2	8886467520112	2	ninguno
2818	2	8886467520129	2	ninguno
2819	2	8886467520136	2	ninguno
2820	2	88864675201368886467520136	0	ninguno
2821	2	8886467520143	0	ninguno
2822	2	8886467520150	2	ninguno
2823	2	8886467523212	1	ninguno
2824	2	8886467523229	1	ninguno
2825	2	8886467523236	1	ninguno
2826	2	8886467523243	1	ninguno
2827	2	8886467523250	1	ninguno
2828	2	8886467523267	1	ninguno
2829	2	8886467523274	1	ninguno
2830	2	8886467523298	1	ninguno
2831	2	8886467523311	1	ninguno
2832	2	8886467523328	1	ninguno
2833	2	8886467523335	1	ninguno
2834	2	8886467523342	1	ninguno
2835	2	8886467523356	0	ninguno
2836	2	8886467523359	1	ninguno
2837	2	8886467523366	1	ninguno
2838	2	8886467523373	1	ninguno
2839	2	8886467523380	1	ninguno
2840	2	8886467523397	0	ninguno
2841	2	8886467523410	1	ninguno
2842	2	8886467523427	1	ninguno
2843	2	8886467523434	1	ninguno
2844	2	8886467523441	1	ninguno
2845	2	8886467523458	1	ninguno
2846	2	8886467523465	1	ninguno
2847	2	8886467523472	0	ninguno
2848	2	8886467523489	0	ninguno
2849	2	8886467523496	0	ninguno
2850	2	8886467523625	0	ninguno
2851	2	8886467523632	1	ninguno
2852	2	8886467523649	1	ninguno
2853	2	8886467523823	2	ninguno
2854	2	8886467523830	2	ninguno
2855	2	8886467523847	2	ninguno
2856	2	8886467525018	2	ninguno
2857	2	8886467525049	2	ninguno
2858	2	8886467525117	3	ninguno
2859	2	8886467525124	1	ninguno
2860	2	8886467525322	0	ninguno
2861	2	8886467525339	0	ninguno
2862	2	8886467525346	0	ninguno
2863	2	8886467525353	1	ninguno
2864	2	8886467525711	0	ninguno
2865	2	8886467525735	0	ninguno
2866	2	8886467525742	0	ninguno
2867	2	8886467525759	0	ninguno
2868	2	8886467529719	0	ninguno
2869	2	8886467529726	0	ninguno
2870	2	8886467529733	0	ninguno
2871	2	8886467529740	0	ninguno
2872	2	8886467530067	0	ninguno
2873	2	8886467530128	0	ninguno
2874	2	8886467530135	0	ninguno
2875	2	8886467530142	0	ninguno
2876	2	8886467530159	0	ninguno
2877	2	8886467530302	0	ninguno
2878	2	8886467530319	0	ninguno
2879	2	8886467530326	0	ninguno
2880	2	8886467530333	0	ninguno
2881	2	8886467530340	0	ninguno
2882	2	8886467530364	0	ninguno
2883	2	8886467530371	0	ninguno
2884	2	8886467530388	0	ninguno
2885	2	8886467530500	1	ninguno
2886	2	8886467531019	0	ninguno
2887	2	8886467531026	0	ninguno
2888	2	8886467531033	0	ninguno
2889	2	8886467531040	0	ninguno
2890	2	8886467532115	2	ninguno
2891	2	8886467532122	1	ninguno
2892	2	8886467532139	2	ninguno
2893	2	8886467532160	2	ninguno
2894	2	8886467532177	2	ninguno
2895	2	8886467532214	2	ninguno
2896	2	8886467532221	2	ninguno
2897	2	8886467532238	2	ninguno
2898	2	8886467532269	2	ninguno
2899	2	8886467532276	2	ninguno
2900	2	8886467532313	0	ninguno
2901	2	8886467532320	0	ninguno
2902	2	8886467532337	0	ninguno
2903	2	8886467532368	0	ninguno
2904	2	8886467532375	0	ninguno
2905	2	8886467532412	2	ninguno
2906	2	8886467532429	2	ninguno
2907	2	8886467532436	2	ninguno
2908	2	8886467532450	2	ninguno
2909	2	8886467532467	2	ninguno
2910	2	8886467532474	2	ninguno
2911	2	8886467532511	2	ninguno
2912	2	8886467532528	1	ninguno
2913	2	8886467532535	2	ninguno
2914	2	8886467532559	2	ninguno
2915	2	8886467532566	2	ninguno
2916	2	8886467532573	2	ninguno
2917	2	8886467532634	2	ninguno
2918	2	8886467535222	0	ninguno
2919	2	8886467535239	2	ninguno
2920	2	8886467535246	2	ninguno
2921	2	8886467535321	2	ninguno
2922	2	8886467535413	2	ninguno
2923	2	8886467535420	0	ninguno
2924	2	8886467535437	0	ninguno
2925	2	8886467535536	2	ninguno
2926	2	8886467535543	2	ninguno
2927	2	8886467535611	2	ninguno
2928	2	8886467535628	2	ninguno
2929	2	8886467535635	0	ninguno
2930	2	8886467535642	0	ninguno
2931	2	8886467541018	0	ninguno
2932	2	8886467541025	0	ninguno
2933	2	8886467541032	0	ninguno
2934	2	8886467541117	2	ninguno
2935	2	8886467541124	2	ninguno
2936	2	8886467541131	1	ninguno
2937	2	8886467541148	0	ninguno
2938	2	8886467544712	1	ninguno
2939	2	8886467545030	0	ninguno
2940	2	8886467545047	0	ninguno
2941	2	8886467545054	2	ninguno
2942	2	8886467545061	0	ninguno
2943	2	8886467545078	2	ninguno
2944	2	8886467545085	2	ninguno
2945	2	8886467545399	2	ninguno
2946	2	8886467545412	2	ninguno
2947	2	8886467545467	1	ninguno
2948	2	8886467545542	2	ninguno
2949	2	8886467545702	0	ninguno
2950	2	8886467545719	0	ninguno
2951	2	8886467545726	0	ninguno
2952	2	8886467546013	0	ninguno
2953	2	8886467546037	0	ninguno
2954	2	8886467546044	0	ninguno
2955	2	8886467546198	2	ninguno
2956	2	8886467546211	2	ninguno
2957	2	8886467546327	0	ninguno
2958	2	8886467546334	0	ninguno
2959	2	8886467546341	0	ninguno
2960	2	8886467546617	0	ninguno
2961	2	8886467546648	0	ninguno
2962	2	8886467546655	1	ninguno
2963	2	8886467546662	1	ninguno
2964	2	8886467546969	0	ninguno
2965	2	8886467547546	0	ninguno
2966	2	8886467548512	2	ninguno
2967	2	8886467548536	0	ninguno
2968	2	8886467548710	2	ninguno
2969	2	8886467548772	0	ninguno
2970	2	8886467548789	0	ninguno
2971	2	8886467548796	2	ninguno
2972	2	8886467548826	0	ninguno
2973	2	8886467548840	0	ninguno
2974	2	8886467548864	0	ninguno
2975	2	8886467548888	0	ninguno
2976	2	8886467548925	0	ninguno
2977	2	8886467548932	0	ninguno
2978	2	8886467548949	0	ninguno
2979	2	8886467580000	0	ninguno
2980	2	8886467580017	2	ninguno
2981	2	8886467580024	0	ninguno
2982	2	8886467580062	0	ninguno
2983	2	8886467580079	0	ninguno
2984	2	8886467580086	0	ninguno
2985	2	8886467580093	0	ninguno
2986	2	8886467580109	2	ninguno
2987	2	8886467580116	2	ninguno
2988	2	8886467580147	1	ninguno
2989	2	8886467580161	2	ninguno
2990	2	8886467580178	2	ninguno
2991	2	8886467580185	0	ninguno
2992	2	8886467580208	0	ninguno
2993	2	8886467580215	2	ninguno
2994	2	8886467580222	0	ninguno
2995	2	8886467580413	0	ninguno
2996	2	8886467581465	1	ninguno
2997	2	8886467582059	0	ninguno
2998	2	8886467584954	0	ninguno
2999	2	8886467584961	0	ninguno
3000	2	8886467585814	0	ninguno
3001	2	8886467585913	0	ninguno
3002	2	8886467586347	0	ninguno
3003	2	8886467589010	0	ninguno
3004	2	8886467589317	0	ninguno
3005	2	8886467589478	0	ninguno
3006	2	8886467589485	0	ninguno
3007	2	8900950297173	0	ninguno
3008	2	8900950297180	0	ninguno
3009	2	8901138501242	2	ninguno
3010	2	8901138501297	2	ninguno
3011	2	8901138511333	2	ninguno
3012	2	8901138511340	0	ninguno
3013	2	90	0	ninguno
3014	2	9003579000519	23	ninguno
3015	2	9003579000748	0	ninguno
3016	2	9003579001172	12	ninguno
3017	2	9003579013557	4	ninguno
3018	2	9003579018514	17	ninguno
3019	2	9003579018866	11	ninguno
3020	2	9003579018941	17	ninguno
3021	2	9003579307717	6	ninguno
3022	2	9003579308936	12	ninguno
3023	2	9003579308943	8	ninguno
3024	2	9003579309445	3	ninguno
3025	2	9003579309469	10	ninguno
3026	2	9003579310632	5	ninguno
3027	2	9003579311004	6	ninguno
3028	2	9003579311462	5	ninguno
3029	2	9003579311851	8	ninguno
3030	2	91009	1	ninguno
3031	2	91012	2	ninguno
3032	2	91013	2	ninguno
3033	2	91015	3	ninguno
3034	2	911emergencia	0	ninguno
3035	2	9333527021861	0	ninguno
3036	2	9333527230447	0	ninguno
3037	2	9333527329240	0	ninguno
3038	2	9333527329257	0	ninguno
3039	2	9333527341037	0	ninguno
3040	2	9333527377852	0	ninguno
3041	2	9333527426642	0	ninguno
3042	2	9333527443670	0	ninguno
3043	2	9333527586469	0	ninguno
3044	2	9505903	2	ninguno
3045	2	9505904	1	ninguno
3046	2	9505905	5	ninguno
3047	2	99-26191	2	ninguno
3048	2	A1014	1	ninguno
3049	2	AB01S	0	ninguno
3050	2	AB02M	0	ninguno
3051	2	AB03L	0	ninguno
3052	2	AC01	0	ninguno
3053	2	AC01S	0	ninguno
3054	2	AC02M	0	ninguno
3055	2	AF001S	0	ninguno
3056	2	ALP001	2	ninguno
3057	2	AMOXITABS250	0	ninguno
3058	2	ANXIVET	0	ninguno
3059	2	ARTROVET	0	ninguno
3060	2	Atropina01	0	ninguno
3061	2	AUMENTA	0	ninguno
3062	2	BAEP00	0	ninguno
3063	2	BAN0	2	ninguno
3064	2	BC1050032021	0	ninguno
3065	2	BCTH2101C	1	ninguno
3066	2	BHL001	3	ninguno
3067	2	BHM001	2	ninguno
3068	2	BHS001	3	ninguno
3069	2	BHXS001	3	ninguno
3070	2	BL01-S	0	ninguno
3071	2	BL-02	0	ninguno
3072	2	BL02-M	0	ninguno
3073	2	BL03-L	0	ninguno
3074	2	BL04-XL	0	ninguno
3075	2	BOSAL#0	0	ninguno
3076	2	BROADLINE	3	ninguno
3077	2	BVL001	1	ninguno
3078	2	BVM001	0	ninguno
3079	2	BVS001	3	ninguno
3080	2	C20-M	0	ninguno
3081	2	C20-S	0	ninguno
3082	2	C20-XL	0	ninguno
3083	2	C21-L	0	ninguno
3084	2	C21-M	1	ninguno
3085	2	C21-S	2	ninguno
3086	2	C21-XL	1	ninguno
3087	2	C22-1	2	ninguno
3088	2	C22-2	2	ninguno
3089	2	C22-3	2	ninguno
3090	2	CAM2030	1	ninguno
3091	2	CAM2435	2	ninguno
3092	2	CAM2840	1	ninguno
3093	2	cardiovet	2	ninguno
3094	2	CARPRODYL100	20	ninguno
3095	2	CARPRODYL25	40	ninguno
3096	2	CD02M	0	ninguno
3097	2	CD03L	0	ninguno
3098	2	CefaCure	100	ninguno
3099	2	CIPROTABS250	30	ninguno
3100	2	CORTA3807	1	ninguno
3101	2	DE013-M	2	ninguno
3102	2	doramectina	0	ninguno
3103	2	Dufamox15	0	ninguno
3104	2	FARM044	1	ninguno
3105	2	FARM046	2	ninguno
3106	2	FARM141	0	ninguno
3107	2	FC088	0	ninguno
3108	2	FG01-S	0	ninguno
3109	2	FG02-M	0	ninguno
3110	2	FG03-L	0	ninguno
3111	2	FG04XL	0	ninguno
3112	2	FGEZ1002	1	ninguno
3113	2	G003	1	ninguno
3114	2	G0M3101S	1	ninguno
3115	2	G0M3102M	1	ninguno
3116	2	gentamicina	0	ninguno
3117	2	H2-S	2	ninguno
3118	2	H3-L	1	ninguno
3119	2	H3-M	1	ninguno
3120	2	H3-S	1	ninguno
3121	2	H3-XL	0	ninguno
3122	2	H4-L	0	ninguno
3123	2	H4-M	2	ninguno
3124	2	H4-XL	0	ninguno
3125	2	HEARTGARDL	0	ninguno
3126	2	HEARTGARDM	7	ninguno
3127	2	HEARTGARDS	2	ninguno
3128	2	HEMOVITB12	0	ninguno
3129	2	HEPATOVET	2	ninguno
3130	2	HI01S	0	ninguno
3131	2	HI02M	0	ninguno
3132	2	HI03L	0	ninguno
3133	2	HTB031-2	2	ninguno
3134	2	HTGC019	0	ninguno
3135	2	ij-02	1	ninguno
3136	2	IJ03	1	ninguno
3137	2	IP001ML	2	ninguno
3138	2	JD01	1	ninguno
3139	2	JD02	1	ninguno
3140	2	JHP951	0	ninguno
3141	2	JK901L	0	ninguno
3142	2	JK901M	0	ninguno
3143	2	JK901S	0	ninguno
3144	2	K002	0	ninguno
3145	2	K9-L	0	ninguno
3146	2	KD01	0	ninguno
3147	2	KETOVET	300	ninguno
3148	2	KL01XS	0	ninguno
3149	2	KL02S	2	ninguno
3150	2	KL03M	0	ninguno
3151	2	KL04L	0	ninguno
3152	2	KL05XL	1	ninguno
3153	2	KM0110MM	1	ninguno
3154	2	KM0212MM	1	ninguno
3155	2	KN0110MM	0	ninguno
3156	2	KN0212MM	0	ninguno
3157	2	KN0315MM	1	ninguno
3158	2	KP01S	0	ninguno
3159	2	KR01	1	ninguno
3160	2	kS15MM	1	ninguno
3161	2	KT01XXS	1	ninguno
3162	2	KT02XS	0	ninguno
3163	2	KT03S	0	ninguno
3164	2	KU01XXS	0	ninguno
3165	2	KU02XS	0	ninguno
3166	2	KV01XXS	1	ninguno
3167	2	KV03S	0	ninguno
3168	2	KW01XXS	0	ninguno
3169	2	KW02XS	0	ninguno
3170	2	KW03S	0	ninguno
3171	2	KW04M	0	ninguno
3172	2	L1003	1	ninguno
3173	2	LM-01	0	ninguno
3174	2	LM-02	0	ninguno
3175	2	LM-03	0	ninguno
3176	2	LM-902-L	0	ninguno
3177	2	LM902M	0	ninguno
3178	2	LM902S	0	ninguno
3179	2	M610	0	ninguno
3180	2	M9D228135	0	ninguno
3181	2	M9D22826	0	ninguno
3182	2	M9D22838-L	2	ninguno
3183	2	M9D22838-M	0	ninguno
3184	2	M9D22838-S	2	ninguno
3185	2	M9D22838-XL	0	ninguno
3186	2	M9D22868	0	ninguno
3187	2	Metronidazole	0	ninguno
3188	2	MN03	0	ninguno
3189	2	MN05-XL	2	ninguno
3190	2	MP1831	0	ninguno
3191	2	MP1855	0	ninguno
3192	2	MU01	0	ninguno
3193	2	MU01S	0	ninguno
3194	2	MU02	0	ninguno
3195	2	MU02M	1	ninguno
3196	2	N026I21	0	ninguno
3197	2	NO02-S	0	ninguno
3198	2	NO03-M	0	ninguno
3199	2	NO04-L	0	ninguno
3200	2	no05xl	0	ninguno
3201	2	OMPASTA-01	2	ninguno
3202	2	OP01S	0	ninguno
3203	2	OP02M	0	ninguno
3204	2	OPTIVET	2	ninguno
3205	2	OV115	2	ninguno
3206	2	P002L	1	ninguno
3207	2	P1089	0	ninguno
3208	2	P1118-PP-B7	1	ninguno
3209	2	P518	0	ninguno
3210	2	P518-1	0	ninguno
3211	2	P519	0	ninguno
3212	2	P520	0	ninguno
3213	2	P521	0	ninguno
3214	2	P522	0	ninguno
3215	2	P523	0	ninguno
3216	2	P924	1	ninguno
3217	2	P935	1	ninguno
3218	2	PALETAS	100	ninguno
3219	2	PEC001	2	ninguno
3220	2	PECH273	4	ninguno
3221	2	PH2088	0	ninguno
3222	2	PL01	1	ninguno
3223	2	QR01	0	ninguno
3224	2	QR01XS	0	ninguno
3225	2	QR02	0	ninguno
3226	2	QR02S	2	ninguno
3227	2	quino-01	2	ninguno
3228	2	RANITIDINVET	478	ninguno
3229	2	RAR2002	1	ninguno
3230	2	RS02	0	ninguno
3231	2	RS02S	2	ninguno
3232	2	RS03L	0	ninguno
3233	2	RS03-L	0	ninguno
3234	2	ST0101	205	ninguno
3235	2	ST01XS	0	ninguno
3236	2	ST02S	0	ninguno
3237	2	ST03M	0	ninguno
3238	2	ST04L	0	ninguno
3239	2	ST05XL	0	ninguno
3240	2	stickerzone01	0	ninguno
3241	2	STOMORGYL10	100	ninguno
3242	2	SU01	0	ninguno
3243	2	SU02	0	ninguno
3244	2	sy-b024	0	ninguno
3245	2	TORT001	2	ninguno
3246	2	TU01	0	ninguno
3247	2	TU02	0	ninguno
3248	2	TU03	0	ninguno
3249	2	TU04	0	ninguno
3250	2	UNGÜENTO	0	ninguno
3251	2	URIVET	0	ninguno
3252	2	UT01XS	1	ninguno
3253	2	UT02S	0	ninguno
3254	2	UT03M	0	ninguno
3255	2	UT04L	0	ninguno
3256	2	UT05XL	0	ninguno
3257	2	UV01S	0	ninguno
3258	2	UV02M	0	ninguno
3259	2	UV03L	1	ninguno
3260	2	UY0110MM	2	ninguno
3261	2	UY0212MM	2	ninguno
3262	2	VDECA0008	2	ninguno
3263	2	VDECA0009	3	ninguno
3264	2	VDECA007	2	ninguno
3265	2	VDEFE0001	3	ninguno
3266	2	VE2022115917	5	ninguno
3267	2	VHL001	3	ninguno
3268	2	VHM001	3	ninguno
3269	2	VHS001	3	ninguno
3270	2	VHTL001	3	ninguno
3271	2	VHTM001	3	ninguno
3272	2	VHTS001	3	ninguno
3273	2	VT-01	0	ninguno
3274	2	VT-02	0	ninguno
3275	2	VVL001	3	ninguno
3276	2	VVM001	2	ninguno
3277	2	VVS001	3	ninguno
3278	2	W4UNID	0	ninguno
3279	2	WV04L	0	ninguno
3280	2	X001	3	ninguno
3281	2	X002	2	ninguno
3282	2	XW01S	0	ninguno
3283	2	XW02M	1	ninguno
3284	2	XW03L	0	ninguno
3285	2	XW04XL	0	ninguno
3286	2	ZY01S	0	ninguno
3287	2	ZY02M	0	ninguno
3288	2	ZY02-M	2	ninguno
3289	2	ZY03L	1	ninguno
3290	2	ZY04XL	1	ninguno
3292	3	01	0	ninguno
3293	3	017800142731	1	ninguno
3294	3	017800156424	0	ninguno
3295	3	017800156448	2	ninguno
3296	3	017800165426	1	ninguno
3297	3	017800174152	2	ninguno
3298	3	017800174220	0	ninguno
3299	3	017800176262	0	ninguno
3300	3	018065055583	2	ninguno
3301	3	018065057655	2	ninguno
3302	3	018065057686	2	ninguno
3303	3	018065057792	2	ninguno
3304	3	018214812784	0	ninguno
3305	3	018214812791	0	ninguno
3306	3	018214816218	0	ninguno
3307	3	018214846307	0	ninguno
3308	3	020279991335	1	ninguno
3309	3	020279992998	0	ninguno
3310	3	020279995173	1	ninguno
3311	3	020279995227	1	ninguno
3312	3	020531	0	ninguno
3313	3	030172013829	0	ninguno
3314	3	030172013850	1	ninguno
3315	3	034846730012	0	ninguno
3316	3	034846730029	3	ninguno
3317	3	034846730104	1	ninguno
3318	3	034846730111	0	ninguno
3319	3	034846730227	2	ninguno
3320	3	034846730319	0	ninguno
3321	3	034846730326	2	ninguno
3322	3	034846730401	1	ninguno
3323	3	034846730418	0	ninguno
3324	3	034846730500	0	ninguno
3325	3	034846730517	0	ninguno
3326	3	034846730609	2	ninguno
3327	3	034846730708	0	ninguno
3328	3	034846730715	0	ninguno
3329	3	034846730814	0	ninguno
3330	3	034846730821	2	ninguno
3331	3	034846730937	0	ninguno
3332	3	035585034003	1	ninguno
3333	3	035585111117	0	ninguno
3334	3	035585111216	1	ninguno
3335	3	035585111315	2	ninguno
3336	3	038100001306	3	ninguno
3337	3	038100171207	5	ninguno
3338	3	045663970062	0	ninguno
3339	3	045663970079	0	ninguno
3340	3	045663970086	0	ninguno
3341	3	045663970093	0	ninguno
3342	3	045663970109	0	ninguno
3343	3	045663976170	0	ninguno
3344	3	045663976194	0	ninguno
3345	3	052742001135	1	ninguno
3346	3	052742001197	2	ninguno
3347	3	052742001746	2	ninguno
3348	3	052742005188	2	ninguno
3349	3	052742005355	2	ninguno
3350	3	052742009971	0	ninguno
3351	3	052742012032	0	ninguno
3352	3	052742014296	2	ninguno
3353	3	052742014531	2	ninguno
3354	3	052742014555	5	ninguno
3355	3	052742020419	2	ninguno
3356	3	052742020488	2	ninguno
3357	3	052742024530	0	ninguno
3358	3	052742040141	0	ninguno
3359	3	052742187501	2	ninguno
3360	3	052742187907	2	ninguno
3361	3	052742195704	2	ninguno
3362	3	052742297200	1	ninguno
3363	3	052742335902	3	ninguno
3364	3	052742339009	4	ninguno
3365	3	052742453606	4	ninguno
3366	3	052742462806	6	ninguno
3367	3	052742567006	1	ninguno
3368	3	052742623801	5	ninguno
3369	3	052742624709	2	ninguno
3370	3	052742648606	2	ninguno
3371	3	052742679709	2	ninguno
3372	3	052742700106	3	ninguno
3373	3	052742700809	5	ninguno
3374	3	052742701004	3	ninguno
3375	3	052742701103	0	ninguno
3376	3	052742701608	3	ninguno
3377	3	052742701806	6	ninguno
3378	3	052742703602	0	ninguno
3379	3	052742703701	2	ninguno
3380	3	052742705507	2	ninguno
3381	3	052742710402	2	ninguno
3382	3	052742712307	2	ninguno
3383	3	052742713304	1	ninguno
3384	3	052742713908	2	ninguno
3385	3	052742715605	3	ninguno
3386	3	052742790107	0	ninguno
3387	3	052742818306	0	ninguno
3388	3	052742855509	0	ninguno
3389	3	052742861807	2	ninguno
3390	3	052742862101	1	ninguno
3391	3	052742862309	1	ninguno
3392	3	052742862408	1	ninguno
3393	3	052742867106	2	ninguno
3394	3	052742867601	1	ninguno
3395	3	052742909400	2	ninguno
3396	3	052742909608	2	ninguno
3397	3	052742909806	2	ninguno
3398	3	052742910000	0	ninguno
3399	3	052742930107	0	ninguno
3400	3	052742936802	2	ninguno
3401	3	070230107107	2	ninguno
3402	3	070230117168	0	ninguno
3403	3	073893212546	0	ninguno
3404	3	073893212553	2	ninguno
3405	3	073893223009	0	ninguno
3406	3	073893260035	0	ninguno
3407	3	073893260042	2	ninguno
3408	3	073893260066	1	ninguno
3409	3	073893263036	2	ninguno
3410	3	073893264026	0	ninguno
3411	3	073893265030	2	ninguno
3412	3	073893280002	0	ninguno
3413	3	074198612239	0	ninguno
3414	3	074198612277	3	ninguno
3415	3	074198612314	0	ninguno
3416	3	074198612345	0	ninguno
3417	3	074198612383	2	ninguno
3418	3	074198612413	3	ninguno
3419	3	074198612451	3	ninguno
3420	3	074198612499	3	ninguno
3421	3	074198613311	3	ninguno
3422	3	074198613359	0	ninguno
3423	3	074198614233	0	ninguno
3424	3	074198614240	0	ninguno
3425	3	074198614257	0	ninguno
3426	3	074198614264	0	ninguno
3427	3	074198615117	2	ninguno
3428	3	074198615131	4	ninguno
3429	3	074198615179	2	ninguno
3430	3	074198615261	2	ninguno
3431	3	074198615308	2	ninguno
3432	3	074198615391	0	ninguno
3433	3	074198615476	4	ninguno
3434	3	074198615513	3	ninguno
3435	3	07419861561	0	ninguno
3436	3	074198615612	2	ninguno
3437	3	074198615636	4	ninguno
3438	3	077627101182	0	ninguno
3439	3	077627101229	7	ninguno
3440	3	077627101274	0	ninguno
3441	3	077627101342	0	ninguno
3442	3	077627200991	0	ninguno
3443	3	077627201028	0	ninguno
3444	3	077627201066	0	ninguno
3445	3	077627201349	0	ninguno
3446	3	077627201356	0	ninguno
3447	3	077627302015	0	ninguno
3448	3	08003330160	0	ninguno
3449	3	087219111529	0	ninguno
3450	3	087219113776	0	ninguno
3451	3	087219116012	0	ninguno
3452	3	087219117439	0	ninguno
3453	3	087219120873	0	ninguno
3454	3	1	0	ninguno
3455	3	10	0	ninguno
3456	3	100	0	ninguno
3457	3	101	0	ninguno
3458	3	102	0	ninguno
3459	3	103	0	ninguno
3460	3	104	0	ninguno
3461	3	105	0	ninguno
3462	3	106	0	ninguno
3463	3	107	0	ninguno
3464	3	108	0	ninguno
3465	3	109	0	ninguno
3466	3	11	0	ninguno
3467	3	110	0	ninguno
3468	3	111	0	ninguno
3469	3	112	0	ninguno
3470	3	113	0	ninguno
3471	3	114	0	ninguno
3472	3	115	0	ninguno
3473	3	116	0	ninguno
3474	3	117	0	ninguno
3475	3	118	0	ninguno
3476	3	119	0	ninguno
3477	3	120	0	ninguno
3478	3	121	0	ninguno
3479	3	122	0	ninguno
3480	3	123	0	ninguno
3481	3	1234567890128	0	ninguno
3482	3	124	0	ninguno
3483	3	125	0	ninguno
3484	3	126	0	ninguno
3485	3	127	0	ninguno
3486	3	128	0	ninguno
3487	3	129	0	ninguno
3488	3	130	0	ninguno
3489	3	131	0	ninguno
3490	3	132	0	ninguno
3491	3	133	0	ninguno
3492	3	134	0	ninguno
3493	3	135	0	ninguno
3494	3	136	0	ninguno
3495	3	137	0	ninguno
3496	3	138	0	ninguno
3497	3	139	0	ninguno
3498	3	140	0	ninguno
3499	3	141	0	ninguno
3500	3	142	0	ninguno
3501	3	1421	0	ninguno
3502	3	143	0	ninguno
3503	3	144	0	ninguno
3504	3	145	0	ninguno
3505	3	146	0	ninguno
3506	3	147	0	ninguno
3507	3	148	0	ninguno
3508	3	149	0	ninguno
3509	3	150	0	ninguno
3510	3	151	0	ninguno
3511	3	152	0	ninguno
3512	3	153	0	ninguno
3513	3	154	0	ninguno
3514	3	155	0	ninguno
3515	3	156	0	ninguno
3516	3	157	0	ninguno
3517	3	158	0	ninguno
3518	3	159	0	ninguno
3519	3	160	0	ninguno
3520	3	161	0	ninguno
3521	3	16182	0	ninguno
3522	3	162	0	ninguno
3523	3	163	0	ninguno
3524	3	164	0	ninguno
3525	3	166	0	ninguno
3526	3	167	0	ninguno
3527	3	170	0	ninguno
3528	3	178988989	0	ninguno
3529	3	181	0	ninguno
3530	3	182	0	ninguno
3531	3	18214816218	0	ninguno
3532	3	183	0	ninguno
3533	3	184	0	ninguno
3534	3	185	0	ninguno
3535	3	186	0	ninguno
3536	3	187	0	ninguno
3537	3	188	0	ninguno
3538	3	189	0	ninguno
3539	3	190	0	ninguno
3540	3	191	0	ninguno
3541	3	192	0	ninguno
3542	3	194	0	ninguno
3543	3	195	0	ninguno
3544	3	196	0	ninguno
3545	3	20	0	ninguno
3546	3	200	0	ninguno
3547	3	2009073936	2	ninguno
3548	3	208400	0	ninguno
3549	3	21	0	ninguno
3550	3	22	0	ninguno
3551	3	22095	0	ninguno
3552	3	22108	0	ninguno
3553	3	22109	0	ninguno
3554	3	23	0	ninguno
3555	3	25026	1	ninguno
3556	3	25027	0	ninguno
3557	3	27003	0	ninguno
3558	3	30	0	ninguno
3559	3	300	0	ninguno
3560	3	301	0	ninguno
3561	3	302	0	ninguno
3562	3	303	0	ninguno
3563	3	304	0	ninguno
3564	3	305	0	ninguno
3565	3	306	0	ninguno
3566	3	307	0	ninguno
3567	3	308	0	ninguno
3568	3	309	0	ninguno
3569	3	31	0	ninguno
3570	3	310	0	ninguno
3571	3	311	0	ninguno
3572	3	312	0	ninguno
3573	3	313	0	ninguno
3574	3	314	0	ninguno
3575	3	315	0	ninguno
3576	3	316	0	ninguno
3577	3	317	0	ninguno
3578	3	318	0	ninguno
3579	3	3182550402132	0	ninguno
3580	3	3182550402149	0	ninguno
3581	3	3182550402170	1	ninguno
3582	3	3182550402224	2	ninguno
3583	3	3182550402439	1	ninguno
3584	3	3182550702201	2	ninguno
3585	3	3182550702225	2	ninguno
3586	3	3182550702423	2	ninguno
3587	3	3182550702447	2	ninguno
3588	3	3182550702614	1	ninguno
3589	3	3182550708180	1	ninguno
3590	3	3182550708197	0	ninguno
3591	3	3182550708203	0	ninguno
3592	3	3182550710923	0	ninguno
3593	3	3182550710992	1	ninguno
3594	3	3182550711036	2	ninguno
3595	3	3182550711050	1	ninguno
3596	3	3182550711142	0	ninguno
3597	3	3182550711159	0	ninguno
3598	3	3182550711333	0	ninguno
3599	3	3182550711395	0	ninguno
3600	3	3182550716857	0	ninguno
3601	3	3182550716888	0	ninguno
3602	3	3182550716925	0	ninguno
3603	3	3182550717687	0	ninguno
3604	3	3182550718813	1	ninguno
3605	3	3182550727822	1	ninguno
3606	3	3182550728102	2	ninguno
3607	3	3182550730587	0	ninguno
3608	3	3182550731355	1	ninguno
3609	3	3182550732055	0	ninguno
3610	3	3182550732154	2	ninguno
3611	3	3182550743433	1	ninguno
3612	3	3182550743440	0	ninguno
3613	3	3182550768474	0	ninguno
3614	3	3182550771054	1	ninguno
3615	3	3182550771061	0	ninguno
3616	3	3182550771719	1	ninguno
3617	3	3182550771733	1	ninguno
3618	3	3182550775267	0	ninguno
3619	3	3182550778657	1	ninguno
3620	3	3182550778671	0	ninguno
3621	3	3182550793001	1	ninguno
3622	3	3182550793032	1	ninguno
3623	3	3182550793049	0	ninguno
3624	3	3182550798945	0	ninguno
3625	3	3182550799768	1	ninguno
3626	3	3182550831086	0	ninguno
3627	3	3182550831383	0	ninguno
3628	3	3182550831390	0	ninguno
3629	3	319	0	ninguno
3630	3	32	0	ninguno
3631	3	320	0	ninguno
3632	3	321	0	ninguno
3633	3	322	0	ninguno
3634	3	323	0	ninguno
3635	3	33	0	ninguno
3636	3	33015	0	ninguno
3637	3	33016	0	ninguno
3638	3	33059	1	ninguno
3639	3	3411112261956	1	ninguno
3640	3	350	0	ninguno
3641	3	3552793078300	0	ninguno
3642	3	3552793078324	0	ninguno
3643	3	40	0	ninguno
3644	3	400	0	ninguno
3645	3	4007221039112	1	ninguno
3646	3	4007221039129	1	ninguno
3647	3	4007221043218	0	ninguno
3648	3	4007221052180	0	ninguno
3649	3	4007221054221	0	ninguno
3650	3	401	0	ninguno
3651	3	402	0	ninguno
3652	3	403	0	ninguno
3653	3	404	0	ninguno
3654	3	41	0	ninguno
3655	3	41006	0	ninguno
3656	3	41013	0	ninguno
3657	3	41019	0	ninguno
3658	3	412	0	ninguno
3659	3	415	0	ninguno
3660	3	416	0	ninguno
3661	3	42	0	ninguno
3662	3	4260448120210	0	ninguno
3663	3	43	0	ninguno
3664	3	45	0	ninguno
3665	3	4894158096291	0	ninguno
3666	3	50	0	ninguno
3667	3	51	0	ninguno
3668	3	52	0	ninguno
3669	3	53	0	ninguno
3670	3	5414736039282	1	ninguno
3671	3	5414736047911	2	ninguno
3672	3	5414736047928	0	ninguno
3673	3	5414736047935	1	ninguno
3674	3	5414736047942	0	ninguno
3675	3	5414736048253	0	ninguno
3676	3	5415341001961	0	ninguno
3677	3	5420043705338	2	ninguno
3678	3	5420043705345	2	ninguno
3679	3	6	0	ninguno
3680	3	60	0	ninguno
3681	3	61	0	ninguno
3682	3	62	0	ninguno
3683	3	63	0	ninguno
3684	3	645095002166	1	ninguno
3685	3	659525114701	0	ninguno
3686	3	662858207224	0	ninguno
3687	3	662858226003	0	ninguno
3688	3	682500939518	0	ninguno
3689	3	682500939679	0	ninguno
3690	3	6828949660383	0	ninguno
3691	3	6920190048764	0	ninguno
3692	3	6953182709244	0	ninguno
3693	3	6953182710585	0	ninguno
3694	3	6953182710820	1	ninguno
3695	3	6953182714576	0	ninguno
3696	3	6953182714972	0	ninguno
3697	3	6953182718062	0	ninguno
3698	3	6953182719458	0	ninguno
3699	3	6953182719571	0	ninguno
3700	3	6953182720072	1	ninguno
3701	3	6953182721161	0	ninguno
3702	3	6953182731450	0	ninguno
3703	3	6953182731481	0	ninguno
3704	3	6953182732365	0	ninguno
3705	3	6953182732372	0	ninguno
3706	3	6953182732389	0	ninguno
3707	3	6953182732440	0	ninguno
3708	3	6953182735083	0	ninguno
3709	3	6972170629975	0	ninguno
3710	3	6995654545424	0	ninguno
3711	3	70	0	ninguno
3712	3	71	0	ninguno
3713	3	711604200290	1	ninguno
3714	3	711604203734	0	ninguno
3715	3	714193509102	1	ninguno
3716	3	714193600724	2	ninguno
3717	3	714193600823	1	ninguno
3718	3	714193600861	1	ninguno
3719	3	714193600984	0	ninguno
3720	3	714193610934	0	ninguno
3721	3	714193699728	2	ninguno
3722	3	7191600000507	0	ninguno
3723	3	72	0	ninguno
3724	3	73	0	ninguno
3725	3	73000101	0	ninguno
3726	3	73008199IO	0	ninguno
3727	3	73033333	0	ninguno
3728	3	736990012050	1	ninguno
3729	3	736990012104	1	ninguno
3730	3	736990012159	2	ninguno
3731	3	736990012203	1	ninguno
3732	3	736990012258	1	ninguno
3733	3	736990013002	1	ninguno
3734	3	736990013309	1	ninguno
3735	3	736990040114	2	ninguno
3736	3	74 6203100578	0	ninguno
3737	3	7404000315615	0	ninguno
3738	3	7404000315622	0	ninguno
3739	3	7404000315639	0	ninguno
3740	3	7404000315646	0	ninguno
3741	3	7406160004224	0	ninguno
3742	3	7410000115322	0	ninguno
3743	3	7410032780024	3	ninguno
3744	3	7410032780031	1	ninguno
3745	3	7414400200596	0	ninguno
3746	3	7414400201012	2	ninguno
3747	3	7414400201050	0	ninguno
3748	3	7414400201067	0	ninguno
3749	3	7414400201074	0	ninguno
3750	3	7414400201081	0	ninguno
3751	3	7414400201111	0	ninguno
3752	3	7414400201128	0	ninguno
3753	3	7414400201210	2	ninguno
3754	3	7414400201227	1	ninguno
3755	3	7414400201234	2	ninguno
3756	3	7414400201296	2	ninguno
3757	3	7414400201302	2	ninguno
3758	3	7414400201364	2	ninguno
3759	3	7414400201432	2	ninguno
3760	3	7414400201449	2	ninguno
3761	3	7414400201456	0	ninguno
3762	3	7414400201470	4	ninguno
3763	3	7414400201487	0	ninguno
3764	3	7414400201494	0	ninguno
3765	3	7414400201609	2	ninguno
3766	3	7414400201616	0	ninguno
3767	3	7414400201623	3	ninguno
3768	3	7414400202088	1	ninguno
3769	3	7414400202095	2	ninguno
3770	3	7414400202101	2	ninguno
3771	3	7414400202149	3	ninguno
3772	3	7416203100264	0	ninguno
3773	3	7416203100271	0	ninguno
3774	3	7416203100288	0	ninguno
3775	3	7416203100295	0	ninguno
3776	3	7416203100301	0	ninguno
3777	3	7416203100318	0	ninguno
3778	3	7416203100578	1	ninguno
3779	3	7416203100585	0	ninguno
3780	3	7416203100592	2	ninguno
3781	3	7416203100608	2	ninguno
3782	3	7416203100615	0	ninguno
3783	3	7416203100622	0	ninguno
3784	3	7416203100639	2	ninguno
3785	3	7416203100646	1	ninguno
3786	3	7416203100653	0	ninguno
3787	3	7416203100660	2	ninguno
3788	3	7416203100677	1	ninguno
3789	3	7416203100684	0	ninguno
3790	3	7416203100844	0	ninguno
3791	3	7416203101179	0	ninguno
3792	3	7416203101209	0	ninguno
3793	3	7416203101247	0	ninguno
3794	3	7416203101254	3	ninguno
3795	3	7416203101261	0	ninguno
3796	3	7416203101278	0	ninguno
3797	3	7416203101438	0	ninguno
3798	3	7416203101445	0	ninguno
3799	3	7416203101469	0	ninguno
3800	3	7416203101520	0	ninguno
3801	3	7416203101544	0	ninguno
3802	3	7416203101551	0	ninguno
3803	3	7416203101667	0	ninguno
3804	3	7416203101797	0	ninguno
3805	3	7416203101827	0	ninguno
3806	3	7416203101834	0	ninguno
3807	3	7416203101902	0	ninguno
3808	3	7416203101926	0	ninguno
3809	3	7416203101964	0	ninguno
3810	3	7416203102183	0	ninguno
3811	3	7416203102213	0	ninguno
3812	3	7416203102220	1	ninguno
3813	3	7416203102237	0	ninguno
3814	3	7416203102244	0	ninguno
3815	3	7416203102916	0	ninguno
3816	3	7416203102923	0	ninguno
3817	3	7416203102930	0	ninguno
3818	3	7416203103326	1	ninguno
3819	3	7416203103333	0	ninguno
3820	3	7416203103340	0	ninguno
3821	3	7416203103357	1	ninguno
3822	3	7416203103364	2	ninguno
3823	3	7416203103371	0	ninguno
3824	3	7416203103388	0	ninguno
3825	3	7416203103395	0	ninguno
3826	3	7416203103401	1	ninguno
3827	3	7416203103418	0	ninguno
3828	3	7416203103425	1	ninguno
3829	3	7416203103685	0	ninguno
3830	3	7416203103692	0	ninguno
3831	3	7416203103708	0	ninguno
3832	3	7416203103722	1	ninguno
3833	3	7416203103739	0	ninguno
3834	3	7416203103753	0	ninguno
3835	3	7416203103760	1	ninguno
3836	3	7420615480007-7.5	0	ninguno
3837	3	742061548007-10	0	ninguno
3838	3	742061548007-12.5	0	ninguno
3839	3	742061548007-15	0	ninguno
3840	3	742061548007-20	0	ninguno
3841	3	742061548007-25	0	ninguno
3842	3	742061548007-30	0	ninguno
3843	3	742061548007-7.5	0	ninguno
3844	3	7441003121935	0	ninguno
3845	3	7441003121942	0	ninguno
3846	3	7441007802434	2	ninguno
3847	3	7441031336950	0	ninguno
3848	3	7453105056978	0	ninguno
3849	3	7501	0	ninguno
3850	3	7501051100020	2	ninguno
3851	3	7501051100037	2	ninguno
3852	3	7501051186963	2	ninguno
3853	3	7501072204462	2	ninguno
3854	3	7501072204479	2	ninguno
3855	3	7501072204561	2	ninguno
3856	3	7501072204578	2	ninguno
3857	3	7501072204592	2	ninguno
3858	3	7501072204615	0	ninguno
3859	3	7501072206299	0	ninguno
3860	3	7501072206305	0	ninguno
3861	3	7501072207234	0	ninguno
3862	3	7501072207258	0	ninguno
3863	3	7501072207265	0	ninguno
3864	3	7501072208231	2	ninguno
3865	3	7501072208248	2	ninguno
3866	3	7501072208262	2	ninguno
3867	3	7501072208279	2	ninguno
3868	3	7501072208293	2	ninguno
3869	3	7501072208743	2	ninguno
3870	3	7501072208767	2	ninguno
3871	3	7501072208781	2	ninguno
3872	3	7501072208798	1	ninguno
3873	3	7501072208927	1	ninguno
3874	3	7501072208958	2	ninguno
3875	3	7501072208972	1	ninguno
3876	3	7501072210609	1	ninguno
3877	3	7501072210616	2	ninguno
3878	3	7501072210623	2	ninguno
3879	3	7501072210630	0	ninguno
3880	3	7501072210661	2	ninguno
3881	3	7501072210678	2	ninguno
3882	3	7501072210685	0	ninguno
3883	3	7501072210692	2	ninguno
3884	3	7501072210715	2	ninguno
3885	3	7501072210722	0	ninguno
3886	3	7501072210739	0	ninguno
3887	3	7501072214485	6	ninguno
3888	3	7501072214492	6	ninguno
3889	3	7501072214508	3	ninguno
3890	3	7501072214515	8	ninguno
3891	3	7501072214522	5	ninguno
3892	3	7501072214539	7	ninguno
3893	3	7501072214546	3	ninguno
3894	3	7501072214560	4	ninguno
3895	3	7502010420043	0	ninguno
3896	3	7502010421118	0	ninguno
3897	3	7502010421125	0	ninguno
3898	3	7502010421132	0	ninguno
3899	3	7502010421187	0	ninguno
3900	3	7502010421194	0	ninguno
3901	3	7502010423969	0	ninguno
3902	3	7502010429701	0	ninguno
3903	3	7502262630023	0	ninguno
3904	3	7502262630740	0	ninguno
3905	3	7502262630795	0	ninguno
3906	3	7503008553002	4	ninguno
3907	3	7503008553040	4	ninguno
3908	3	7503008553057	2	ninguno
3909	3	7503008553071	3	ninguno
3910	3	7503008553200	4	ninguno
3911	3	7503008553231	2	ninguno
3912	3	7503008553248	4	ninguno
3913	3	7503008553255	2	ninguno
3914	3	7503008553279	2	ninguno
3915	3	7503008553965	2	ninguno
3916	3	7503008553972	1	ninguno
3917	3	7503019166604	0	ninguno
3918	3	7503020053085	2	ninguno
3919	3	7503020053290	0	ninguno
3920	3	7503020053306	5	ninguno
3921	3	7503020053313	5	ninguno
3922	3	7503020053320	5	ninguno
3923	3	7503020053382	1	ninguno
3924	3	7503020053849	2	ninguno
3925	3	7503026084113	2	ninguno
3926	3	7503026084144	1	ninguno
3927	3	7503026470107	0	ninguno
3928	3	7503027959472	0	ninguno
3929	3	7506267903489	0	ninguno
3930	3	7506267907340	0	ninguno
3931	3	7506267907357	0	ninguno
3932	3	7506267907371	0	ninguno
3933	3	7506343800015	1	ninguno
3934	3	7506343800022	1	ninguno
3935	3	7506343800039	1	ninguno
3936	3	7506343800176	2	ninguno
3937	3	7506343800190	1	ninguno
3938	3	7506343800794	1	ninguno
3939	3	7506343801784	2	ninguno
3940	3	7506343802668	0	ninguno
3941	3	7506343802675	2	ninguno
3942	3	7506343802798	2	ninguno
3943	3	7506396700645	0	ninguno
3944	3	7506407400328	0	ninguno
3945	3	7506407400618	0	ninguno
3946	3	7506407400625	0	ninguno
3947	3	7506407400977	0	ninguno
3948	3	7506407401691	0	ninguno
3949	3	7506407402094	0	ninguno
3950	3	7506407402124	0	ninguno
3951	3	7506407402193	1	ninguno
3952	3	7506407402216	0	ninguno
3953	3	7506407402247	0	ninguno
3954	3	7506407402469	2	ninguno
3955	3	7593990010041	0	ninguno
3956	3	7593990010058	0	ninguno
3957	3	7593990012953	0	ninguno
3958	3	7593990050511	0	ninguno
3959	3	769229001167	3	ninguno
3960	3	769229002430	0	ninguno
3961	3	769229002683	2	ninguno
3962	3	769229003611	0	ninguno
3963	3	769229003710	0	ninguno
3964	3	769229003734	0	ninguno
3965	3	769229003741	2	ninguno
3966	3	769229003758	2	ninguno
3967	3	769229049510	50	ninguno
3968	3	769229124217	0	ninguno
3969	3	769229131413	0	ninguno
3970	3	769229131512	2	ninguno
3971	3	769229131918	0	ninguno
3972	3	7707007404604	2	ninguno
3973	3	7707007405663	2	ninguno
3974	3	7707115301161	2	ninguno
3975	3	7707115301222	0	ninguno
3976	3	7707115301468	1	ninguno
3977	3	7707115301611	0	ninguno
3978	3	7707214570659	0	ninguno
3979	3	7707214570833	2	ninguno
3980	3	7707214570918	1	ninguno
3981	3	7707214570949	1	ninguno
3982	3	7707214573001	1	ninguno
3983	3	7707274710316	0	ninguno
3984	3	7707274714215	2	ninguno
3985	3	7707274715014	2	ninguno
3986	3	7707274717001	1	ninguno
3987	3	7707274718060	0	ninguno
3988	3	7730952032677	0	ninguno
3989	3	7730952032899	0	ninguno
3990	3	7730997410614	2	ninguno
3991	3	7730997410621	2	ninguno
3992	3	7730997410638	2	ninguno
3993	3	7730997410645	2	ninguno
3994	3	7756654000363	1	ninguno
3995	3	7756654000370	1	ninguno
3996	3	7756654000387	0	ninguno
3997	3	7756654000400	1	ninguno
3998	3	7756654000424	0	ninguno
3999	3	7756654000448	2	ninguno
4000	3	7756654015220	0	ninguno
4001	3	7756654020156	2	ninguno
4002	3	7756654020293	2	ninguno
4003	3	7756654027926	3	ninguno
4004	3	7756654027933	4	ninguno
4005	3	7756654027940	4	ninguno
4006	3	7759433000059	0	ninguno
4007	3	7759433000882	0	ninguno
4008	3	7759433000998	2	ninguno
4009	3	7759433001193	2	ninguno
4010	3	7759433001933	1	ninguno
4011	3	7759433001940	2	ninguno
4012	3	7792716421868	0	ninguno
4013	3	7797600000174	1	ninguno
4014	3	7797600000501	0	ninguno
4015	3	7797600000518	0	ninguno
4016	3	7797600000761	1	ninguno
4017	3	7797600000785	2	ninguno
4018	3	7797600001805	0	ninguno
4019	3	7797600001812	0	ninguno
4020	3	7797600002895	0	ninguno
4021	3	7797600002901	1	ninguno
4022	3	7798042360055	2	ninguno
4023	3	7798042360093	2	ninguno
4024	3	7798042360109	2	ninguno
4025	3	7798042360178	2	ninguno
4026	3	7798042360185	0	ninguno
4027	3	7798042360260	3	ninguno
4028	3	7798042360468	2	ninguno
4029	3	7798042360581	0	ninguno
4030	3	7798042361311	0	ninguno
4031	3	7798042361335	0	ninguno
4032	3	7798042361359	2	ninguno
4033	3	7798042361380	2	ninguno
4034	3	7798042361533	2	ninguno
4035	3	7798042364800	0	ninguno
4036	3	7798042364961	1	ninguno
4037	3	7798042365685	2	ninguno
4038	3	7798042365692	2	ninguno
4039	3	7798042365708	0	ninguno
4040	3	7798042365715	0	ninguno
4041	3	7798042365722	0	ninguno
4042	3	7798042365739	0	ninguno
4043	3	7798042365975	2	ninguno
4044	3	7798042366170	2	ninguno
4045	3	7798042366187	2	ninguno
4046	3	7798042366200	0	ninguno
4047	3	7798042366217	0	ninguno
4048	3	7798042366224	2	ninguno
4049	3	7798042366231	0	ninguno
4050	3	7798042366255	1	ninguno
4051	3	7798042366262	2	ninguno
4052	3	7798144990860	0	ninguno
4053	3	7798144993663	0	ninguno
4054	3	7798156460054	0	ninguno
4055	3	7798156460061	0	ninguno
4056	3	7798156460290	0	ninguno
4057	3	7798156460429	0	ninguno
4058	3	7798156460498	0	ninguno
4059	3	7798156460740	0	ninguno
4060	3	7798156461051	0	ninguno
4061	3	7798156461808	0	ninguno
4062	3	7798156461815	0	ninguno
4063	3	7798156461853	0	ninguno
4064	3	7798156461884	2	ninguno
4065	3	7798156462928	0	ninguno
4066	3	7798156463185	1	ninguno
4067	3	7798166871895	0	ninguno
4068	3	7798166871901	0	ninguno
4069	3	7798166873134	1	ninguno
4070	3	7798166873141	0	ninguno
4071	3	7798166873158	0	ninguno
4072	3	7798166873165	0	ninguno
4073	3	7798166873172	1	ninguno
4074	3	7798176420403	0	ninguno
4075	3	7798176420410	2	ninguno
4076	3	7798176420434	1	ninguno
4077	3	7798176420458	0	ninguno
4078	3	7798176420465	2	ninguno
4079	3	7798176421073	0	ninguno
4080	3	7798176421080	0	ninguno
4081	3	7798176421097	0	ninguno
4082	3	7798176421103	0	ninguno
4083	3	7798176421110	0	ninguno
4084	3	7798176421196	0	ninguno
4085	3	7798176421202	1	ninguno
4086	3	7798176421219	0	ninguno
4087	3	7798176421264	2	ninguno
4088	3	7798176421745	1	ninguno
4089	3	7798176421752	0	ninguno
4090	3	7798176421769	1	ninguno
4091	3	7798176421776	1	ninguno
4092	3	7798176421868	0	ninguno
4093	3	7798176421875	0	ninguno
4094	3	7798176421882	0	ninguno
4095	3	7798176421899	0	ninguno
4096	3	7798176421905	0	ninguno
4097	3	7798176422926	0	ninguno
4098	3	7798359710017	2	ninguno
4099	3	7800006000232	2	ninguno
4100	3	7800006002038	0	ninguno
4101	3	7800006002700	0	ninguno
4102	3	7800006002724	0	ninguno
4103	3	7800006003370	0	ninguno
4104	3	7800006003561	0	ninguno
4105	3	7800006003646	2	ninguno
4106	3	7800006005169	2	ninguno
4107	3	7800019000014	0	ninguno
4108	3	784369477115	0	ninguno
4109	3	784369477122	0	ninguno
4110	3	7898049715480	0	ninguno
4111	3	7898049719273	0	ninguno
4112	3	7898416700040	0	ninguno
4113	3	7898416700521	0	ninguno
4114	3	7898416700743	0	ninguno
4115	3	7898416701344	0	ninguno
4116	3	7898416701955	0	ninguno
4117	3	7898416701979	0	ninguno
4118	3	7898597991329	0	ninguno
4119	3	80	0	ninguno
4120	3	8010690010908	0	ninguno
4121	3	8010690010915	0	ninguno
4122	3	8010690010946	0	ninguno
4123	3	8010690010991	0	ninguno
4124	3	8010690011080	0	ninguno
4125	3	8010690011295	0	ninguno
4126	3	8010690011301	0	ninguno
4127	3	8010690011349	0	ninguno
4128	3	8010690011394	0	ninguno
4129	3	8010690011547	0	ninguno
4130	3	8010690011745	0	ninguno
4131	3	8010690011769	0	ninguno
4132	3	8010690011790	0	ninguno
4133	3	8010690011936	0	ninguno
4134	3	8010690011967	0	ninguno
4135	3	8010690012186	0	ninguno
4136	3	8010690012209	0	ninguno
4137	3	8010690012308	0	ninguno
4138	3	8010690012360	0	ninguno
4139	3	8010690012476	0	ninguno
4140	3	8010690012674	0	ninguno
4141	3	8010690012698	0	ninguno
4142	3	8010690014043	0	ninguno
4143	3	8010690025919	0	ninguno
4144	3	8010690025926	0	ninguno
4145	3	8010690025940	0	ninguno
4146	3	8010690025988	0	ninguno
4147	3	8010690026015	0	ninguno
4148	3	8010690026053	0	ninguno
4149	3	8010690026060	0	ninguno
4150	3	8010690026084	0	ninguno
4151	3	8010690026121	0	ninguno
4152	3	8010690026138	0	ninguno
4153	3	8010690026152	0	ninguno
4154	3	8010690029214	0	ninguno
4155	3	8010690029566	0	ninguno
4156	3	8010690029986	0	ninguno
4157	3	8010690029993	0	ninguno
4158	3	8010690030005	0	ninguno
4159	3	8010690030029	0	ninguno
4160	3	8010690037363	0	ninguno
4161	3	8010690041926	0	ninguno
4162	3	8010690041933	0	ninguno
4163	3	8010690041940	0	ninguno
4164	3	8010690042084	0	ninguno
4165	3	8010690042091	0	ninguno
4166	3	8010690042114	2	ninguno
4167	3	8010690042121	0	ninguno
4168	3	8010690042145	0	ninguno
4169	3	8010690042152	0	ninguno
4170	3	8010690047775	0	ninguno
4171	3	8010690050072	0	ninguno
4172	3	8010690050089	0	ninguno
4173	3	8010690050096	0	ninguno
4174	3	8010690053677	0	ninguno
4175	3	8010690053691	0	ninguno
4176	3	8010690053714	0	ninguno
4177	3	8010690053738	0	ninguno
4178	3	8010690053752	0	ninguno
4179	3	8010690053776	0	ninguno
4180	3	8010690055381	0	ninguno
4181	3	8010690055398	0	ninguno
4182	3	8010690055404	0	ninguno
4183	3	8010690055411	0	ninguno
4184	3	8010690055428	0	ninguno
4185	3	8010690055435	0	ninguno
4186	3	8010690055442	0	ninguno
4187	3	8010690055459	0	ninguno
4188	3	8010690055466	0	ninguno
4189	3	8010690056135	0	ninguno
4190	3	8010690056142	0	ninguno
4191	3	8010690056159	0	ninguno
4192	3	8010690056548	0	ninguno
4193	3	8010690056555	0	ninguno
4194	3	8010690056562	0	ninguno
4195	3	8010690056579	0	ninguno
4196	3	8010690056586	0	ninguno
4197	3	8010690056616	0	ninguno
4198	3	8010690056630	0	ninguno
4199	3	8010690056647	0	ninguno
4200	3	8010690056654	0	ninguno
4201	3	8010690056661	0	ninguno
4202	3	8010690057552	0	ninguno
4203	3	8010690057569	0	ninguno
4204	3	8010690058160	1	ninguno
4205	3	8010690059082	0	ninguno
4206	3	8010690061696	2	ninguno
4207	3	8010690061702	1	ninguno
4208	3	8010690062853	2	ninguno
4209	3	8010690067339	0	ninguno
4210	3	8010690068121	0	ninguno
4211	3	8010690068138	0	ninguno
4212	3	8010690080017	0	ninguno
4213	3	8010690080024	0	ninguno
4214	3	8010690080031	0	ninguno
4215	3	8010690088365	1	ninguno
4216	3	8010690088457	0	ninguno
4217	3	8010690088563	0	ninguno
4218	3	8010690091471	0	ninguno
4219	3	8010690092898	0	ninguno
4220	3	8010690093604	0	ninguno
4221	3	8010690099552	0	ninguno
4222	3	8010690101491	0	ninguno
4223	3	8010690101507	0	ninguno
4224	3	8010690105796	0	ninguno
4225	3	8010690105802	0	ninguno
4226	3	8010690105819	0	ninguno
4227	3	8010690105826	0	ninguno
4228	3	8010690105833	0	ninguno
4229	3	8010690105840	0	ninguno
4230	3	8010690105857	0	ninguno
4231	3	8010690105864	0	ninguno
4232	3	8010690105871	0	ninguno
4233	3	8010690105888	0	ninguno
4234	3	8010690106571	0	ninguno
4235	3	8010690107028	0	ninguno
4236	3	8010690107134	0	ninguno
4237	3	8010690115924	0	ninguno
4238	3	8010690122946	0	ninguno
4239	3	8010690122953	0	ninguno
4240	3	8010690122977	0	ninguno
4241	3	8010690122991	0	ninguno
4242	3	8010690123004	0	ninguno
4243	3	8010690123011	0	ninguno
4244	3	8010690123035	0	ninguno
4245	3	8010690123059	0	ninguno
4246	3	8010690123066	0	ninguno
4247	3	8010690123073	0	ninguno
4248	3	8010690123097	0	ninguno
4249	3	8010690123110	0	ninguno
4250	3	8010690123141	0	ninguno
4251	3	8010690123158	0	ninguno
4252	3	8010690123172	0	ninguno
4253	3	8010690123196	0	ninguno
4254	3	8010690123202	0	ninguno
4255	3	8010690123219	0	ninguno
4256	3	8010690123233	0	ninguno
4257	3	8010690123257	0	ninguno
4258	3	8010690133362	0	ninguno
4259	3	8010690140346	0	ninguno
4260	3	8010690140360	0	ninguno
4261	3	8010690140377	0	ninguno
4262	3	8010690140384	0	ninguno
4263	3	8010690148977	0	ninguno
4264	3	8010690149004	0	ninguno
4265	3	8010690149011	0	ninguno
4266	3	8010690149028	0	ninguno
4267	3	8010690149059	0	ninguno
4268	3	8010690149066	0	ninguno
4269	3	8010690149073	0	ninguno
4270	3	8010690149097	0	ninguno
4271	3	8010690149103	0	ninguno
4272	3	8010690153100	0	ninguno
4273	3	8010690153124	0	ninguno
4274	3	8010690153568	1	ninguno
4275	3	8010690153582	1	ninguno
4276	3	8010690156156	0	ninguno
4277	3	8010690156163	0	ninguno
4278	3	8010690159270	1	ninguno
4279	3	8010690159782	0	ninguno
4280	3	8010690159867	0	ninguno
4281	3	8010690160443	0	ninguno
4282	3	8010690160474	0	ninguno
4283	3	8010690160481	0	ninguno
4284	3	8010690160498	0	ninguno
4285	3	8010690160511	0	ninguno
4286	3	8010690164670	0	ninguno
4287	3	8010690166308	0	ninguno
4288	3	8010690166315	0	ninguno
4289	3	8010690166322	0	ninguno
4290	3	8010690166339	0	ninguno
4291	3	8010690166346	0	ninguno
4292	3	8010690166353	0	ninguno
4293	3	8010690166360	0	ninguno
4294	3	8010690166377	0	ninguno
4295	3	8010690168821	0	ninguno
4296	3	8010690172033	0	ninguno
4297	3	8010690175331	0	ninguno
4298	3	8010690175355	0	ninguno
4299	3	8010690175362	0	ninguno
4300	3	8010690175379	0	ninguno
4301	3	8010690175386	0	ninguno
4302	3	8010690175409	0	ninguno
4303	3	8010690175416	0	ninguno
4304	3	8010690175423	0	ninguno
4305	3	8010690175454	0	ninguno
4306	3	8010690175478	0	ninguno
4307	3	8010690175485	0	ninguno
4308	3	8010690175492	0	ninguno
4309	3	8010690175508	0	ninguno
4310	3	8010690175515	0	ninguno
4311	3	8010690175522	0	ninguno
4312	3	8010690175546	0	ninguno
4313	3	8010690175553	0	ninguno
4314	3	8010690175577	0	ninguno
4315	3	8010690175584	0	ninguno
4316	3	8010690176161	0	ninguno
4317	3	8010690176178	0	ninguno
4318	3	8010690176208	0	ninguno
4319	3	8010690176215	0	ninguno
4320	3	8010690176222	0	ninguno
4321	3	8010690176260	0	ninguno
4322	3	8010690176277	0	ninguno
4323	3	8010690176307	0	ninguno
4324	3	8010690179445	0	ninguno
4325	3	8010690180076	0	ninguno
4326	3	8010690180106	0	ninguno
4327	3	8010690180137	0	ninguno
4328	3	8010690180168	0	ninguno
4329	3	8010690180182	0	ninguno
4330	3	8010690180755	0	ninguno
4331	3	8010690191065	0	ninguno
4332	3	8010690191089	0	ninguno
4333	3	81	0	ninguno
4334	3	811794010850	0	ninguno
4335	3	811794010898	0	ninguno
4336	3	82	0	ninguno
4337	3	83	0	ninguno
4338	3	84	0	ninguno
4339	3	8410650150130	1	ninguno
4340	3	8410650150147	0	ninguno
4341	3	8410650150185	0	ninguno
4342	3	8410650150192	2	ninguno
4343	3	8410650150253	5	ninguno
4344	3	8410650151892	2	ninguno
4345	3	8410650151946	2	ninguno
4346	3	8410650152264	2	ninguno
4347	3	8410650152288	2	ninguno
4348	3	8410650152301	2	ninguno
4349	3	8410650152325	1	ninguno
4350	3	8410650152363	1	ninguno
4351	3	8410650152400	2	ninguno
4352	3	8410650152448	2	ninguno
4353	3	8410650160474	1	ninguno
4354	3	8410650167817	2	ninguno
4355	3	8410650168104	1	ninguno
4356	3	8410650168128	2	ninguno
4357	3	8410650170695	2	ninguno
4358	3	8410650170718	2	ninguno
4359	3	8410650218649	2	ninguno
4360	3	8410650239132	2	ninguno
4361	3	842704100095	0	ninguno
4362	3	842704100743	0	ninguno
4363	3	8433042001582	0	ninguno
4364	3	8436001971605	0	ninguno
4365	3	8436001971612	1	ninguno
4366	3	8436001971643	0	ninguno
4367	3	8436001971650	3	ninguno
4368	3	8436001971681	2	ninguno
4369	3	8436001971704	2	ninguno
4370	3	8436001971728	3	ninguno
4371	3	8436532730030	0	ninguno
4372	3	8436532730047	0	ninguno
4373	3	8436532730122	2	ninguno
4374	3	8436532730139	2	ninguno
4375	3	8436532730146	0	ninguno
4376	3	8436532730252	0	ninguno
4377	3	8436532730412	0	ninguno
4378	3	8436532730665	0	ninguno
4379	3	8470000397516	2	ninguno
4380	3	8470000491269	1	ninguno
4381	3	8470000493195	1	ninguno
4382	3	8470000647512	2	ninguno
4383	3	8470000957512	1	ninguno
4384	3	847922021016	0	ninguno
4385	3	847922021115	0	ninguno
4386	3	847922021191	0	ninguno
4387	3	847922021559	0	ninguno
4388	3	847922021580	0	ninguno
4389	3	847922021610	0	ninguno
4390	3	847922024031	0	ninguno
4391	3	847922024048	0	ninguno
4392	3	847922027438	0	ninguno
4393	3	847922028084	0	ninguno
4394	3	847922075613	0	ninguno
4395	3	8699245857306	0	ninguno
4396	3	8699245857313	2	ninguno
4397	3	8699245857337	2	ninguno
4398	3	8699245857351	2	ninguno
4399	3	8699245857399	2	ninguno
4400	3	8699245857405	1	ninguno
4401	3	8699245857429	2	ninguno
4402	3	8699245857443	2	ninguno
4403	3	8713184080653	0	ninguno
4404	3	8713184134349	3	ninguno
4405	3	8713184135278	3	ninguno
4406	3	8713184135285	3	ninguno
4407	3	8713184135292	3	ninguno
4408	3	8713184141408	2	ninguno
4409	3	8886467510229	0	ninguno
4410	3	8886467510236	0	ninguno
4411	3	8886467510250	0	ninguno
4412	3	8886467510267	0	ninguno
4413	3	8886467510281	0	ninguno
4414	3	8886467510311	0	ninguno
4415	3	8886467510328	0	ninguno
4416	3	8886467510335	0	ninguno
4417	3	8886467510410	0	ninguno
4418	3	8886467510427	0	ninguno
4419	3	8886467510434	0	ninguno
4420	3	8886467510441	0	ninguno
4421	3	8886467510458	0	ninguno
4422	3	8886467510465	0	ninguno
4423	3	8886467510588	0	ninguno
4424	3	8886467510724	0	ninguno
4425	3	8886467510755	0	ninguno
4426	3	8886467510830	0	ninguno
4427	3	8886467514210	0	ninguno
4428	3	8886467514401	0	ninguno
4429	3	8886467514418	0	ninguno
4430	3	8886467514425	0	ninguno
4431	3	8886467514463	0	ninguno
4432	3	8886467514470	0	ninguno
4433	3	8886467514487	0	ninguno
4434	3	8886467514494	0	ninguno
4435	3	8886467514579	0	ninguno
4436	3	8886467514616	0	ninguno
4437	3	8886467514623	0	ninguno
4438	3	8886467514630	1	ninguno
4439	3	8886467514647	0	ninguno
4440	3	8886467514654	0	ninguno
4441	3	8886467514661	0	ninguno
4442	3	8886467514678	1	ninguno
4443	3	8886467514685	0	ninguno
4444	3	8886467514692	0	ninguno
4445	3	8886467514715	0	ninguno
4446	3	8886467514722	0	ninguno
4447	3	8886467514739	0	ninguno
4448	3	8886467514746	0	ninguno
4449	3	8886467514760	0	ninguno
4450	3	8886467514814	0	ninguno
4451	3	8886467514821	0	ninguno
4452	3	8886467514906	0	ninguno
4453	3	8886467514920	0	ninguno
4454	3	8886467515521	0	ninguno
4455	3	8886467515644	0	ninguno
4456	3	8886467515811	0	ninguno
4457	3	8886467515866	0	ninguno
4458	3	8886467515897	0	ninguno
4459	3	8886467515927	1	ninguno
4460	3	8886467515934	0	ninguno
4461	3	8886467515965	2	ninguno
4462	3	8886467520112	0	ninguno
4463	3	8886467520129	0	ninguno
4464	3	8886467520136	0	ninguno
4465	3	88864675201368886467520136	0	ninguno
4466	3	8886467520143	0	ninguno
4467	3	8886467520150	0	ninguno
4468	3	8886467523212	0	ninguno
4469	3	8886467523229	0	ninguno
4470	3	8886467523236	0	ninguno
4471	3	8886467523243	0	ninguno
4472	3	8886467523250	0	ninguno
4473	3	8886467523267	0	ninguno
4474	3	8886467523274	0	ninguno
4475	3	8886467523298	0	ninguno
4476	3	8886467523311	0	ninguno
4477	3	8886467523328	0	ninguno
4478	3	8886467523335	0	ninguno
4479	3	8886467523342	0	ninguno
4480	3	8886467523356	0	ninguno
4481	3	8886467523359	0	ninguno
4482	3	8886467523366	0	ninguno
4483	3	8886467523373	0	ninguno
4484	3	8886467523380	0	ninguno
4485	3	8886467523397	0	ninguno
4486	3	8886467523410	0	ninguno
4487	3	8886467523427	0	ninguno
4488	3	8886467523434	0	ninguno
4489	3	8886467523441	0	ninguno
4490	3	8886467523458	0	ninguno
4491	3	8886467523465	0	ninguno
4492	3	8886467523472	0	ninguno
4493	3	8886467523489	0	ninguno
4494	3	8886467523496	0	ninguno
4495	3	8886467523625	0	ninguno
4496	3	8886467523632	0	ninguno
4497	3	8886467523649	0	ninguno
4498	3	8886467523823	0	ninguno
4499	3	8886467523830	0	ninguno
4500	3	8886467523847	0	ninguno
4501	3	8886467525018	0	ninguno
4502	3	8886467525049	0	ninguno
4503	3	8886467525117	0	ninguno
4504	3	8886467525124	0	ninguno
4505	3	8886467525322	0	ninguno
4506	3	8886467525339	0	ninguno
4507	3	8886467525346	0	ninguno
4508	3	8886467525353	0	ninguno
4509	3	8886467525711	0	ninguno
4510	3	8886467525735	0	ninguno
4511	3	8886467525742	0	ninguno
4512	3	8886467525759	0	ninguno
4513	3	8886467529719	0	ninguno
4514	3	8886467529726	0	ninguno
4515	3	8886467529733	0	ninguno
4516	3	8886467529740	0	ninguno
4517	3	8886467530067	0	ninguno
4518	3	8886467530128	0	ninguno
4519	3	8886467530135	0	ninguno
4520	3	8886467530142	0	ninguno
4521	3	8886467530159	0	ninguno
4522	3	8886467530302	0	ninguno
4523	3	8886467530319	0	ninguno
4524	3	8886467530326	0	ninguno
4525	3	8886467530333	0	ninguno
4526	3	8886467530340	0	ninguno
4527	3	8886467530364	0	ninguno
4528	3	8886467530371	0	ninguno
4529	3	8886467530388	0	ninguno
4530	3	8886467530500	0	ninguno
4531	3	8886467531019	0	ninguno
4532	3	8886467531026	0	ninguno
4533	3	8886467531033	0	ninguno
4534	3	8886467531040	0	ninguno
4535	3	8886467532115	0	ninguno
4536	3	8886467532122	0	ninguno
4537	3	8886467532139	0	ninguno
4538	3	8886467532160	0	ninguno
4539	3	8886467532177	0	ninguno
4540	3	8886467532214	0	ninguno
4541	3	8886467532221	0	ninguno
4542	3	8886467532238	0	ninguno
4543	3	8886467532269	0	ninguno
4544	3	8886467532276	0	ninguno
4545	3	8886467532313	0	ninguno
4546	3	8886467532320	0	ninguno
4547	3	8886467532337	0	ninguno
4548	3	8886467532368	0	ninguno
4549	3	8886467532375	0	ninguno
4550	3	8886467532412	0	ninguno
4551	3	8886467532429	0	ninguno
4552	3	8886467532436	0	ninguno
4553	3	8886467532450	0	ninguno
4554	3	8886467532467	0	ninguno
4555	3	8886467532474	0	ninguno
4556	3	8886467532511	0	ninguno
4557	3	8886467532528	0	ninguno
4558	3	8886467532535	0	ninguno
4559	3	8886467532559	0	ninguno
4560	3	8886467532566	0	ninguno
4561	3	8886467532573	0	ninguno
4562	3	8886467532634	0	ninguno
4563	3	8886467535222	0	ninguno
4564	3	8886467535239	0	ninguno
4565	3	8886467535246	0	ninguno
4566	3	8886467535321	0	ninguno
4567	3	8886467535413	0	ninguno
4568	3	8886467535420	0	ninguno
4569	3	8886467535437	0	ninguno
4570	3	8886467535536	0	ninguno
4571	3	8886467535543	0	ninguno
4572	3	8886467535611	0	ninguno
4573	3	8886467535628	0	ninguno
4574	3	8886467535635	0	ninguno
4575	3	8886467535642	0	ninguno
4576	3	8886467541018	0	ninguno
4577	3	8886467541025	0	ninguno
4578	3	8886467541032	0	ninguno
4579	3	8886467541117	0	ninguno
4580	3	8886467541124	0	ninguno
4581	3	8886467541131	0	ninguno
4582	3	8886467541148	0	ninguno
4583	3	8886467544712	0	ninguno
4584	3	8886467545030	0	ninguno
4585	3	8886467545047	0	ninguno
4586	3	8886467545054	0	ninguno
4587	3	8886467545061	0	ninguno
4588	3	8886467545078	0	ninguno
4589	3	8886467545085	1	ninguno
4590	3	8886467545399	0	ninguno
4591	3	8886467545412	0	ninguno
4592	3	8886467545467	0	ninguno
4593	3	8886467545542	0	ninguno
4594	3	8886467545702	0	ninguno
4595	3	8886467545719	0	ninguno
4596	3	8886467545726	0	ninguno
4597	3	8886467546013	0	ninguno
4598	3	8886467546037	0	ninguno
4599	3	8886467546044	0	ninguno
4600	3	8886467546198	0	ninguno
4601	3	8886467546211	0	ninguno
4602	3	8886467546327	0	ninguno
4603	3	8886467546334	0	ninguno
4604	3	8886467546341	0	ninguno
4605	3	8886467546617	0	ninguno
4606	3	8886467546648	0	ninguno
4607	3	8886467546655	0	ninguno
4608	3	8886467546662	0	ninguno
4609	3	8886467546969	0	ninguno
4610	3	8886467547546	0	ninguno
4611	3	8886467548512	0	ninguno
4612	3	8886467548536	0	ninguno
4613	3	8886467548710	0	ninguno
4614	3	8886467548772	0	ninguno
4615	3	8886467548789	0	ninguno
4616	3	8886467548796	0	ninguno
4617	3	8886467548826	0	ninguno
4618	3	8886467548840	0	ninguno
4619	3	8886467548864	0	ninguno
4620	3	8886467548888	0	ninguno
4621	3	8886467548925	0	ninguno
4622	3	8886467548932	0	ninguno
4623	3	8886467548949	0	ninguno
4624	3	8886467580000	0	ninguno
4625	3	8886467580017	0	ninguno
4626	3	8886467580024	0	ninguno
4627	3	8886467580062	0	ninguno
4628	3	8886467580079	0	ninguno
4629	3	8886467580086	0	ninguno
4630	3	8886467580093	0	ninguno
4631	3	8886467580109	0	ninguno
4632	3	8886467580116	0	ninguno
4633	3	8886467580147	0	ninguno
4634	3	8886467580161	0	ninguno
4635	3	8886467580178	0	ninguno
4636	3	8886467580185	0	ninguno
4637	3	8886467580208	0	ninguno
4638	3	8886467580215	0	ninguno
4639	3	8886467580222	0	ninguno
4640	3	8886467580413	0	ninguno
4641	3	8886467581465	0	ninguno
4642	3	8886467582059	0	ninguno
4643	3	8886467584954	0	ninguno
4644	3	8886467584961	0	ninguno
4645	3	8886467585814	0	ninguno
4646	3	8886467585913	0	ninguno
4647	3	8886467586347	0	ninguno
4648	3	8886467589010	0	ninguno
4649	3	8886467589317	0	ninguno
4650	3	8886467589478	0	ninguno
4651	3	8886467589485	0	ninguno
4652	3	8900950297173	0	ninguno
4653	3	8900950297180	0	ninguno
4654	3	8901138501242	2	ninguno
4655	3	8901138501297	2	ninguno
4656	3	8901138511333	2	ninguno
4657	3	8901138511340	2	ninguno
4658	3	90	0	ninguno
4659	3	9003579000519	0	ninguno
4660	3	9003579000748	3	ninguno
4661	3	9003579001172	3	ninguno
4662	3	9003579013557	0	ninguno
4663	3	9003579018514	5	ninguno
4664	3	9003579018866	8	ninguno
4665	3	9003579018941	4	ninguno
4666	3	9003579307717	6	ninguno
4667	3	9003579308936	6	ninguno
4668	3	9003579308943	10	ninguno
4669	3	9003579309445	3	ninguno
4670	3	9003579309469	6	ninguno
4671	3	9003579310632	3	ninguno
4672	3	9003579311004	4	ninguno
4673	3	9003579311462	4	ninguno
4674	3	9003579311851	3	ninguno
4675	3	91009	0	ninguno
4676	3	91012	0	ninguno
4677	3	91013	0	ninguno
4678	3	91015	0	ninguno
4679	3	911emergencia	0	ninguno
4680	3	9333527021861	0	ninguno
4681	3	9333527230447	0	ninguno
4682	3	9333527329240	0	ninguno
4683	3	9333527329257	0	ninguno
4684	3	9333527341037	0	ninguno
4685	3	9333527377852	0	ninguno
4686	3	9333527426642	0	ninguno
4687	3	9333527443670	0	ninguno
4688	3	9333527586469	0	ninguno
4689	3	9505903	1	ninguno
4690	3	9505904	0	ninguno
4691	3	9505905	0	ninguno
4692	3	99-26191	0	ninguno
4693	3	A1014	0	ninguno
4694	3	AB01S	0	ninguno
4695	3	AB02M	0	ninguno
4696	3	AB03L	0	ninguno
4697	3	AC01	0	ninguno
4698	3	AC01S	0	ninguno
4699	3	AC02M	0	ninguno
4700	3	AF001S	0	ninguno
4701	3	ALP001	0	ninguno
4702	3	AMOXITABS250	0	ninguno
4703	3	ANXIVET	0	ninguno
4704	3	ARTROVET	0	ninguno
4705	3	Atropina01	0	ninguno
4706	3	AUMENTA	0	ninguno
4707	3	BAEP00	1	ninguno
4708	3	BAN0	0	ninguno
4709	3	BC1050032021	0	ninguno
4710	3	BCTH2101C	0	ninguno
4711	3	BHL001	2	ninguno
4712	3	BHM001	1	ninguno
4713	3	BHS001	1	ninguno
4714	3	BHXS001	2	ninguno
4715	3	BL01-S	0	ninguno
4716	3	BL-02	0	ninguno
4717	3	BL02-M	0	ninguno
4718	3	BL03-L	0	ninguno
4719	3	BL04-XL	0	ninguno
4720	3	BOSAL#0	0	ninguno
4721	3	BROADLINE	2	ninguno
4722	3	BVL001	2	ninguno
4723	3	BVM001	2	ninguno
4724	3	BVS001	2	ninguno
4725	3	C20-M	0	ninguno
4726	3	C20-S	0	ninguno
4727	3	C20-XL	0	ninguno
4728	3	C21-L	0	ninguno
4729	3	C21-M	2	ninguno
4730	3	C21-S	0	ninguno
4731	3	C21-XL	0	ninguno
4732	3	C22-1	2	ninguno
4733	3	C22-2	2	ninguno
4734	3	C22-3	2	ninguno
4735	3	CAM2030	0	ninguno
4736	3	CAM2435	0	ninguno
4737	3	CAM2840	0	ninguno
4738	3	cardiovet	0	ninguno
4739	3	CARPRODYL100	1	ninguno
4740	3	CARPRODYL25	0	ninguno
4741	3	CD02M	0	ninguno
4742	3	CD03L	0	ninguno
4743	3	CefaCure	0	ninguno
4744	3	CIPROTABS250	0	ninguno
4745	3	CORTA3807	0	ninguno
4746	3	DE013-M	0	ninguno
4747	3	doramectina	0	ninguno
4748	3	Dufamox15	0	ninguno
4749	3	FARM044	0	ninguno
4750	3	FARM046	0	ninguno
4751	3	FARM141	0	ninguno
4752	3	FC088	0	ninguno
4753	3	FG01-S	0	ninguno
4754	3	FG02-M	0	ninguno
4755	3	FG03-L	0	ninguno
4756	3	FG04XL	0	ninguno
4757	3	FGEZ1002	0	ninguno
4758	3	G003	0	ninguno
4759	3	G0M3101S	0	ninguno
4760	3	G0M3102M	0	ninguno
4761	3	gentamicina	0	ninguno
4762	3	H2-S	0	ninguno
4763	3	H3-L	0	ninguno
4764	3	H3-M	0	ninguno
4765	3	H3-S	0	ninguno
4766	3	H3-XL	0	ninguno
4767	3	H4-L	0	ninguno
4768	3	H4-M	2	ninguno
4769	3	H4-XL	0	ninguno
4770	3	HEARTGARDL	4	ninguno
4771	3	HEARTGARDM	6	ninguno
4772	3	HEARTGARDS	0	ninguno
4773	3	HEMOVITB12	0	ninguno
4774	3	HEPATOVET	0	ninguno
4775	3	HI01S	0	ninguno
4776	3	HI02M	0	ninguno
4777	3	HI03L	0	ninguno
4778	3	HTB031-2	1	ninguno
4779	3	HTGC019	0	ninguno
4780	3	ij-02	0	ninguno
4781	3	IJ03	0	ninguno
4782	3	IP001ML	0	ninguno
4783	3	JD01	0	ninguno
4784	3	JD02	0	ninguno
4785	3	JHP951	0	ninguno
4786	3	JK901L	0	ninguno
4787	3	JK901M	0	ninguno
4788	3	JK901S	0	ninguno
4789	3	K002	0	ninguno
4790	3	K9-L	0	ninguno
4791	3	KD01	0	ninguno
4792	3	KETOVET	0	ninguno
4793	3	KL01XS	0	ninguno
4794	3	KL02S	0	ninguno
4795	3	KL03M	0	ninguno
4796	3	KL04L	0	ninguno
4797	3	KL05XL	0	ninguno
4798	3	KM0110MM	0	ninguno
4799	3	KM0212MM	0	ninguno
4800	3	KN0110MM	0	ninguno
4801	3	KN0212MM	0	ninguno
4802	3	KN0315MM	1	ninguno
4803	3	KP01S	0	ninguno
4804	3	KR01	0	ninguno
4805	3	kS15MM	0	ninguno
4806	3	KT01XXS	0	ninguno
4807	3	KT02XS	0	ninguno
4808	3	KT03S	0	ninguno
4809	3	KU01XXS	0	ninguno
4810	3	KU02XS	0	ninguno
4811	3	KV01XXS	0	ninguno
4812	3	KV03S	0	ninguno
4813	3	KW01XXS	0	ninguno
4814	3	KW02XS	0	ninguno
4815	3	KW03S	0	ninguno
4816	3	KW04M	0	ninguno
4817	3	L1003	0	ninguno
4818	3	LM-01	0	ninguno
4819	3	LM-02	1	ninguno
4820	3	LM-03	0	ninguno
4821	3	LM-902-L	0	ninguno
4822	3	LM902M	0	ninguno
4823	3	LM902S	0	ninguno
4824	3	M610	1	ninguno
4825	3	M9D228135	0	ninguno
4826	3	M9D22826	0	ninguno
4827	3	M9D22838-L	0	ninguno
4828	3	M9D22838-M	0	ninguno
4829	3	M9D22838-S	0	ninguno
4830	3	M9D22838-XL	0	ninguno
4831	3	M9D22868	0	ninguno
4832	3	Metronidazole	0	ninguno
4833	3	MN03	0	ninguno
4834	3	MN05-XL	2	ninguno
4835	3	MP1831	0	ninguno
4836	3	MP1855	0	ninguno
4837	3	MU01	0	ninguno
4838	3	MU01S	0	ninguno
4839	3	MU02	0	ninguno
4840	3	MU02M	0	ninguno
4841	3	N026I21	0	ninguno
4842	3	NO02-S	0	ninguno
4843	3	NO03-M	0	ninguno
4844	3	NO04-L	0	ninguno
4845	3	no05xl	0	ninguno
4846	3	OMPASTA-01	0	ninguno
4847	3	OP01S	0	ninguno
4848	3	OP02M	0	ninguno
4849	3	OPTIVET	0	ninguno
4850	3	OV115	0	ninguno
4851	3	P002L	4	ninguno
4852	3	P1089	0	ninguno
4853	3	P1118-PP-B7	0	ninguno
4854	3	P518	0	ninguno
4855	3	P518-1	0	ninguno
4856	3	P519	0	ninguno
4857	3	P520	0	ninguno
4858	3	P521	0	ninguno
4859	3	P522	0	ninguno
4860	3	P523	0	ninguno
4861	3	P924	0	ninguno
4862	3	P935	0	ninguno
4863	3	PALETAS	0	ninguno
4864	3	PEC001	0	ninguno
4865	3	PECH273	0	ninguno
4866	3	PH2088	0	ninguno
4867	3	PL01	0	ninguno
4868	3	QR01	0	ninguno
4869	3	QR01XS	0	ninguno
4870	3	QR02	0	ninguno
4871	3	QR02S	0	ninguno
4872	3	quino-01	0	ninguno
4873	3	RANITIDINVET	2	ninguno
4874	3	RAR2002	0	ninguno
4875	3	RS02	0	ninguno
4876	3	RS02S	0	ninguno
4877	3	RS03L	0	ninguno
4878	3	RS03-L	0	ninguno
4879	3	ST0101	0	ninguno
4880	3	ST01XS	0	ninguno
4881	3	ST02S	0	ninguno
4882	3	ST03M	0	ninguno
4883	3	ST04L	1	ninguno
4884	3	ST05XL	0	ninguno
4885	3	stickerzone01	0	ninguno
4886	3	STOMORGYL10	0	ninguno
4887	3	SU01	0	ninguno
4888	3	SU02	0	ninguno
4889	3	sy-b024	0	ninguno
4890	3	TORT001	0	ninguno
4891	3	TU01	0	ninguno
4892	3	TU02	0	ninguno
4893	3	TU03	0	ninguno
4894	3	TU04	0	ninguno
4895	3	UNGÜENTO	0	ninguno
4896	3	URIVET	0	ninguno
4897	3	UT01XS	0	ninguno
4898	3	UT02S	0	ninguno
4899	3	UT03M	0	ninguno
4900	3	UT04L	0	ninguno
4901	3	UT05XL	0	ninguno
4902	3	UV01S	0	ninguno
4903	3	UV02M	0	ninguno
4904	3	UV03L	0	ninguno
4905	3	UY0110MM	0	ninguno
4906	3	UY0212MM	0	ninguno
4907	3	VDECA0008	2	ninguno
4908	3	VDECA0009	0	ninguno
4909	3	VDECA007	1	ninguno
4910	3	VDEFE0001	3	ninguno
4911	3	VE2022115917	0	ninguno
4912	3	VHL001	2	ninguno
4913	3	VHM001	2	ninguno
4914	3	VHS001	2	ninguno
4915	3	VHTL001	2	ninguno
4916	3	VHTM001	1	ninguno
4917	3	VHTS001	2	ninguno
4918	3	VT-01	0	ninguno
4919	3	VT-02	0	ninguno
4920	3	VVL001	1	ninguno
4921	3	VVM001	2	ninguno
4922	3	VVS001	2	ninguno
4923	3	W4UNID	1	ninguno
4924	3	WV04L	0	ninguno
4925	3	X001	0	ninguno
4926	3	X002	0	ninguno
4927	3	XW01S	0	ninguno
4928	3	XW02M	0	ninguno
4929	3	XW03L	0	ninguno
4930	3	XW04XL	0	ninguno
4931	3	ZY01S	0	ninguno
4932	3	ZY02M	2	ninguno
4933	3	ZY02-M	0	ninguno
4934	3	ZY03L	0	ninguno
4935	3	ZY04XL	0	ninguno
4937	4	01	0	ninguno
4938	4	017800142731	0	ninguno
4939	4	017800156424	0	ninguno
4940	4	017800156448	0	ninguno
4941	4	017800165426	0	ninguno
4942	4	017800174152	0	ninguno
4943	4	017800174220	0	ninguno
4944	4	017800176262	0	ninguno
4945	4	018065055583	0	ninguno
4946	4	018065057655	0	ninguno
4947	4	018065057686	0	ninguno
4948	4	018065057792	0	ninguno
4949	4	018214812784	0	ninguno
4950	4	018214812791	0	ninguno
4951	4	018214816218	0	ninguno
4952	4	018214846307	0	ninguno
4953	4	020279991335	0	ninguno
4954	4	020279992998	0	ninguno
4955	4	020279995173	0	ninguno
4956	4	020279995227	0	ninguno
4957	4	020531	0	ninguno
4958	4	030172013829	0	ninguno
4959	4	030172013850	0	ninguno
4960	4	034846730012	0	ninguno
4961	4	034846730029	0	ninguno
4962	4	034846730104	0	ninguno
4963	4	034846730111	0	ninguno
4964	4	034846730227	0	ninguno
4965	4	034846730319	0	ninguno
4966	4	034846730326	0	ninguno
4967	4	034846730401	0	ninguno
4968	4	034846730418	0	ninguno
4969	4	034846730500	0	ninguno
4970	4	034846730517	0	ninguno
4971	4	034846730609	0	ninguno
4972	4	034846730708	0	ninguno
4973	4	034846730715	0	ninguno
4974	4	034846730814	0	ninguno
4975	4	034846730821	0	ninguno
4976	4	034846730937	0	ninguno
4977	4	035585034003	0	ninguno
4978	4	035585111117	0	ninguno
4979	4	035585111216	0	ninguno
4980	4	035585111315	0	ninguno
4981	4	038100001306	0	ninguno
4982	4	038100171207	0	ninguno
4983	4	045663970062	0	ninguno
4984	4	045663970079	0	ninguno
4985	4	045663970086	0	ninguno
4986	4	045663970093	0	ninguno
4987	4	045663970109	0	ninguno
4988	4	045663976170	0	ninguno
4989	4	045663976194	0	ninguno
4990	4	052742001135	0	ninguno
4991	4	052742001197	0	ninguno
4992	4	052742001746	0	ninguno
4993	4	052742005188	0	ninguno
4994	4	052742005355	0	ninguno
4995	4	052742009971	0	ninguno
4996	4	052742012032	0	ninguno
4997	4	052742014296	0	ninguno
4998	4	052742014531	0	ninguno
4999	4	052742014555	0	ninguno
5000	4	052742020419	0	ninguno
5001	4	052742020488	0	ninguno
5002	4	052742024530	0	ninguno
5003	4	052742040141	0	ninguno
5004	4	052742187501	0	ninguno
5005	4	052742187907	0	ninguno
5006	4	052742195704	0	ninguno
5007	4	052742297200	0	ninguno
5008	4	052742335902	0	ninguno
5009	4	052742339009	0	ninguno
5010	4	052742453606	0	ninguno
5011	4	052742462806	0	ninguno
5012	4	052742567006	0	ninguno
5013	4	052742623801	0	ninguno
5014	4	052742624709	0	ninguno
5015	4	052742648606	0	ninguno
5016	4	052742679709	0	ninguno
5017	4	052742700106	0	ninguno
5018	4	052742700809	0	ninguno
5019	4	052742701004	0	ninguno
5020	4	052742701103	0	ninguno
5021	4	052742701608	0	ninguno
5022	4	052742701806	0	ninguno
5023	4	052742703602	0	ninguno
5024	4	052742703701	0	ninguno
5025	4	052742705507	0	ninguno
5026	4	052742710402	0	ninguno
5027	4	052742712307	0	ninguno
5028	4	052742713304	0	ninguno
5029	4	052742713908	0	ninguno
5030	4	052742715605	0	ninguno
5031	4	052742790107	0	ninguno
5032	4	052742818306	0	ninguno
5033	4	052742855509	0	ninguno
5034	4	052742861807	0	ninguno
5035	4	052742862101	0	ninguno
5036	4	052742862309	0	ninguno
5037	4	052742862408	0	ninguno
5038	4	052742867106	0	ninguno
5039	4	052742867601	0	ninguno
5040	4	052742909400	0	ninguno
5041	4	052742909608	0	ninguno
5042	4	052742909806	0	ninguno
5043	4	052742910000	0	ninguno
5044	4	052742930107	0	ninguno
5045	4	052742936802	0	ninguno
5046	4	070230107107	0	ninguno
5047	4	070230117168	0	ninguno
5048	4	073893212546	0	ninguno
5049	4	073893212553	0	ninguno
5050	4	073893223009	0	ninguno
5051	4	073893260035	0	ninguno
5052	4	073893260042	0	ninguno
5053	4	073893260066	0	ninguno
5054	4	073893263036	0	ninguno
5055	4	073893264026	0	ninguno
5056	4	073893265030	0	ninguno
5057	4	073893280002	0	ninguno
5058	4	074198612239	0	ninguno
5059	4	074198612277	0	ninguno
5060	4	074198612314	0	ninguno
5061	4	074198612345	0	ninguno
5062	4	074198612383	0	ninguno
5063	4	074198612413	0	ninguno
5064	4	074198612451	0	ninguno
5065	4	074198612499	0	ninguno
5066	4	074198613311	0	ninguno
5067	4	074198613359	0	ninguno
5068	4	074198614233	0	ninguno
5069	4	074198614240	0	ninguno
5070	4	074198614257	0	ninguno
5071	4	074198614264	0	ninguno
5072	4	074198615117	0	ninguno
5073	4	074198615131	0	ninguno
5074	4	074198615179	0	ninguno
5075	4	074198615261	0	ninguno
5076	4	074198615308	0	ninguno
5077	4	074198615391	0	ninguno
5078	4	074198615476	0	ninguno
5079	4	074198615513	0	ninguno
5080	4	07419861561	0	ninguno
5081	4	074198615612	0	ninguno
5082	4	074198615636	0	ninguno
5083	4	077627101182	0	ninguno
5084	4	077627101229	0	ninguno
5085	4	077627101274	0	ninguno
5086	4	077627101342	0	ninguno
5087	4	077627200991	0	ninguno
5088	4	077627201028	0	ninguno
5089	4	077627201066	0	ninguno
5090	4	077627201349	0	ninguno
5091	4	077627201356	0	ninguno
5092	4	077627302015	0	ninguno
5093	4	08003330160	0	ninguno
5094	4	087219111529	0	ninguno
5095	4	087219113776	0	ninguno
5096	4	087219116012	0	ninguno
5097	4	087219117439	0	ninguno
5098	4	087219120873	0	ninguno
5099	4	1	0	ninguno
5100	4	10	0	ninguno
5101	4	100	0	ninguno
5102	4	101	0	ninguno
5103	4	102	0	ninguno
5104	4	103	0	ninguno
5105	4	104	0	ninguno
5106	4	105	0	ninguno
5107	4	106	0	ninguno
5108	4	107	0	ninguno
5109	4	108	0	ninguno
5110	4	109	0	ninguno
5111	4	11	0	ninguno
5112	4	110	0	ninguno
5113	4	111	0	ninguno
5114	4	112	0	ninguno
5115	4	113	0	ninguno
5116	4	114	0	ninguno
5117	4	115	0	ninguno
5118	4	116	0	ninguno
5119	4	117	0	ninguno
5120	4	118	0	ninguno
5121	4	119	0	ninguno
5122	4	120	0	ninguno
5123	4	121	0	ninguno
5124	4	122	0	ninguno
5125	4	123	0	ninguno
5126	4	1234567890128	0	ninguno
5127	4	124	0	ninguno
5128	4	125	0	ninguno
5129	4	126	0	ninguno
5130	4	127	0	ninguno
5131	4	128	0	ninguno
5132	4	129	0	ninguno
5133	4	130	0	ninguno
5134	4	131	0	ninguno
5135	4	132	0	ninguno
5136	4	133	0	ninguno
5137	4	134	0	ninguno
5138	4	135	0	ninguno
5139	4	136	0	ninguno
5140	4	137	0	ninguno
5141	4	138	0	ninguno
5142	4	139	0	ninguno
5143	4	140	0	ninguno
5144	4	141	0	ninguno
5145	4	142	0	ninguno
5146	4	1421	0	ninguno
5147	4	143	0	ninguno
5148	4	144	0	ninguno
5149	4	145	0	ninguno
5150	4	146	0	ninguno
5151	4	147	0	ninguno
5152	4	148	0	ninguno
5153	4	149	0	ninguno
5154	4	150	0	ninguno
5155	4	151	0	ninguno
5156	4	152	0	ninguno
5157	4	153	0	ninguno
5158	4	154	0	ninguno
5159	4	155	0	ninguno
5160	4	156	0	ninguno
5161	4	157	0	ninguno
5162	4	158	0	ninguno
5163	4	159	0	ninguno
5164	4	160	0	ninguno
5165	4	161	0	ninguno
5166	4	16182	0	ninguno
5167	4	162	0	ninguno
5168	4	163	0	ninguno
5169	4	164	0	ninguno
5170	4	166	0	ninguno
5171	4	167	0	ninguno
5172	4	170	0	ninguno
5173	4	178988989	0	ninguno
5174	4	181	0	ninguno
5175	4	182	0	ninguno
5176	4	18214816218	0	ninguno
5177	4	183	0	ninguno
5178	4	184	0	ninguno
5179	4	185	0	ninguno
5180	4	186	0	ninguno
5181	4	187	0	ninguno
5182	4	188	0	ninguno
5183	4	189	0	ninguno
5184	4	190	0	ninguno
5185	4	191	0	ninguno
5186	4	192	0	ninguno
5187	4	194	0	ninguno
5188	4	195	0	ninguno
5189	4	196	0	ninguno
5190	4	20	0	ninguno
5191	4	200	0	ninguno
5192	4	2009073936	0	ninguno
5193	4	208400	0	ninguno
5194	4	21	0	ninguno
5195	4	22	0	ninguno
5196	4	22095	0	ninguno
5197	4	22108	0	ninguno
5198	4	22109	0	ninguno
5199	4	23	0	ninguno
5200	4	25026	0	ninguno
5201	4	25027	0	ninguno
5202	4	27003	0	ninguno
5203	4	30	0	ninguno
5204	4	300	0	ninguno
5205	4	301	0	ninguno
5206	4	302	0	ninguno
5207	4	303	0	ninguno
5208	4	304	0	ninguno
5209	4	305	0	ninguno
5210	4	306	0	ninguno
5211	4	307	0	ninguno
5212	4	308	0	ninguno
5213	4	309	0	ninguno
5214	4	31	0	ninguno
5215	4	310	0	ninguno
5216	4	311	0	ninguno
5217	4	312	0	ninguno
5218	4	313	0	ninguno
5219	4	314	0	ninguno
5220	4	315	0	ninguno
5221	4	316	0	ninguno
5222	4	317	0	ninguno
5223	4	318	0	ninguno
5224	4	3182550402132	0	ninguno
5225	4	3182550402149	0	ninguno
5226	4	3182550402170	0	ninguno
5227	4	3182550402224	0	ninguno
5228	4	3182550402439	0	ninguno
5229	4	3182550702201	0	ninguno
5230	4	3182550702225	0	ninguno
5231	4	3182550702423	0	ninguno
5232	4	3182550702447	0	ninguno
5233	4	3182550702614	0	ninguno
5234	4	3182550708180	0	ninguno
5235	4	3182550708197	0	ninguno
5236	4	3182550708203	0	ninguno
5237	4	3182550710923	0	ninguno
5238	4	3182550710992	0	ninguno
5239	4	3182550711036	0	ninguno
5240	4	3182550711050	0	ninguno
5241	4	3182550711142	0	ninguno
5242	4	3182550711159	0	ninguno
5243	4	3182550711333	0	ninguno
5244	4	3182550711395	0	ninguno
5245	4	3182550716857	0	ninguno
5246	4	3182550716888	0	ninguno
5247	4	3182550716925	0	ninguno
5248	4	3182550717687	0	ninguno
5249	4	3182550718813	0	ninguno
5250	4	3182550727822	0	ninguno
5251	4	3182550728102	0	ninguno
5252	4	3182550730587	0	ninguno
5253	4	3182550731355	0	ninguno
5254	4	3182550732055	0	ninguno
5255	4	3182550732154	0	ninguno
5256	4	3182550743433	0	ninguno
5257	4	3182550743440	0	ninguno
5258	4	3182550768474	0	ninguno
5259	4	3182550771054	0	ninguno
5260	4	3182550771061	0	ninguno
5261	4	3182550771719	0	ninguno
5262	4	3182550771733	0	ninguno
5263	4	3182550775267	0	ninguno
5264	4	3182550778657	0	ninguno
5265	4	3182550778671	0	ninguno
5266	4	3182550793001	0	ninguno
5267	4	3182550793032	0	ninguno
5268	4	3182550793049	0	ninguno
5269	4	3182550798945	0	ninguno
5270	4	3182550799768	0	ninguno
5271	4	3182550831086	0	ninguno
5272	4	3182550831383	0	ninguno
5273	4	3182550831390	0	ninguno
5274	4	319	0	ninguno
5275	4	32	0	ninguno
5276	4	320	0	ninguno
5277	4	321	0	ninguno
5278	4	322	0	ninguno
5279	4	323	0	ninguno
5280	4	33	0	ninguno
5281	4	33015	0	ninguno
5282	4	33016	0	ninguno
5283	4	33059	0	ninguno
5284	4	3411112261956	0	ninguno
5285	4	350	0	ninguno
5286	4	3552793078300	0	ninguno
5287	4	3552793078324	0	ninguno
5288	4	40	0	ninguno
5289	4	400	0	ninguno
5290	4	4007221039112	0	ninguno
5291	4	4007221039129	0	ninguno
5292	4	4007221043218	0	ninguno
5293	4	4007221052180	0	ninguno
5294	4	4007221054221	0	ninguno
5295	4	401	0	ninguno
5296	4	402	0	ninguno
5297	4	403	0	ninguno
5298	4	404	0	ninguno
5299	4	41	0	ninguno
5300	4	41006	0	ninguno
5301	4	41013	0	ninguno
5302	4	41019	0	ninguno
5303	4	412	0	ninguno
5304	4	415	0	ninguno
5305	4	416	0	ninguno
5306	4	42	0	ninguno
5307	4	4260448120210	0	ninguno
5308	4	43	0	ninguno
5309	4	45	0	ninguno
5310	4	4894158096291	0	ninguno
5311	4	50	0	ninguno
5312	4	51	0	ninguno
5313	4	52	0	ninguno
5314	4	53	0	ninguno
5315	4	5414736039282	0	ninguno
5316	4	5414736047911	0	ninguno
5317	4	5414736047928	0	ninguno
5318	4	5414736047935	0	ninguno
5319	4	5414736047942	0	ninguno
5320	4	5414736048253	0	ninguno
5321	4	5415341001961	0	ninguno
5322	4	5420043705338	0	ninguno
5323	4	5420043705345	0	ninguno
5324	4	6	0	ninguno
5325	4	60	0	ninguno
5326	4	61	0	ninguno
5327	4	62	0	ninguno
5328	4	63	0	ninguno
5329	4	645095002166	0	ninguno
5330	4	659525114701	0	ninguno
5331	4	662858207224	0	ninguno
5332	4	662858226003	0	ninguno
5333	4	682500939518	0	ninguno
5334	4	682500939679	0	ninguno
5335	4	6828949660383	0	ninguno
5336	4	6920190048764	0	ninguno
5337	4	6953182709244	0	ninguno
5338	4	6953182710585	0	ninguno
5339	4	6953182710820	0	ninguno
5340	4	6953182714576	0	ninguno
5341	4	6953182714972	0	ninguno
5342	4	6953182718062	0	ninguno
5343	4	6953182719458	0	ninguno
5344	4	6953182719571	0	ninguno
5345	4	6953182720072	0	ninguno
5346	4	6953182721161	0	ninguno
5347	4	6953182731450	0	ninguno
5348	4	6953182731481	0	ninguno
5349	4	6953182732365	0	ninguno
5350	4	6953182732372	0	ninguno
5351	4	6953182732389	0	ninguno
5352	4	6953182732440	0	ninguno
5353	4	6953182735083	0	ninguno
5354	4	6972170629975	0	ninguno
5355	4	6995654545424	0	ninguno
5356	4	70	0	ninguno
5357	4	71	0	ninguno
5358	4	711604200290	0	ninguno
5359	4	711604203734	0	ninguno
5360	4	714193509102	0	ninguno
5361	4	714193600724	0	ninguno
5362	4	714193600823	0	ninguno
5363	4	714193600861	0	ninguno
5364	4	714193600984	0	ninguno
5365	4	714193610934	0	ninguno
5366	4	714193699728	0	ninguno
5367	4	7191600000507	0	ninguno
5368	4	72	0	ninguno
5369	4	73	0	ninguno
5370	4	73000101	0	ninguno
5371	4	73008199IO	0	ninguno
5372	4	73033333	0	ninguno
5373	4	736990012050	0	ninguno
5374	4	736990012104	0	ninguno
5375	4	736990012159	0	ninguno
5376	4	736990012203	0	ninguno
5377	4	736990012258	0	ninguno
5378	4	736990013002	0	ninguno
5379	4	736990013309	0	ninguno
5380	4	736990040114	0	ninguno
5381	4	74 6203100578	0	ninguno
5382	4	7404000315615	0	ninguno
5383	4	7404000315622	0	ninguno
5384	4	7404000315639	0	ninguno
5385	4	7404000315646	0	ninguno
5386	4	7406160004224	0	ninguno
5387	4	7410000115322	0	ninguno
5388	4	7410032780024	0	ninguno
5389	4	7410032780031	0	ninguno
5390	4	7414400200596	0	ninguno
5391	4	7414400201012	0	ninguno
5392	4	7414400201050	0	ninguno
5393	4	7414400201067	0	ninguno
5394	4	7414400201074	0	ninguno
5395	4	7414400201081	0	ninguno
5396	4	7414400201111	0	ninguno
5397	4	7414400201128	0	ninguno
5398	4	7414400201210	0	ninguno
5399	4	7414400201227	0	ninguno
5400	4	7414400201234	0	ninguno
5401	4	7414400201296	0	ninguno
5402	4	7414400201302	0	ninguno
5403	4	7414400201364	0	ninguno
5404	4	7414400201432	0	ninguno
5405	4	7414400201449	0	ninguno
5406	4	7414400201456	0	ninguno
5407	4	7414400201470	0	ninguno
5408	4	7414400201487	0	ninguno
5409	4	7414400201494	0	ninguno
5410	4	7414400201609	0	ninguno
5411	4	7414400201616	0	ninguno
5412	4	7414400201623	0	ninguno
5413	4	7414400202088	0	ninguno
5414	4	7414400202095	0	ninguno
5415	4	7414400202101	0	ninguno
5416	4	7414400202149	0	ninguno
5417	4	7416203100264	0	ninguno
5418	4	7416203100271	0	ninguno
5419	4	7416203100288	0	ninguno
5420	4	7416203100295	0	ninguno
5421	4	7416203100301	0	ninguno
5422	4	7416203100318	0	ninguno
5423	4	7416203100578	0	ninguno
5424	4	7416203100585	0	ninguno
5425	4	7416203100592	0	ninguno
5426	4	7416203100608	0	ninguno
5427	4	7416203100615	0	ninguno
5428	4	7416203100622	0	ninguno
5429	4	7416203100639	0	ninguno
5430	4	7416203100646	0	ninguno
5431	4	7416203100653	0	ninguno
5432	4	7416203100660	0	ninguno
5433	4	7416203100677	0	ninguno
5434	4	7416203100684	0	ninguno
5435	4	7416203100844	0	ninguno
5436	4	7416203101179	0	ninguno
5437	4	7416203101209	0	ninguno
5438	4	7416203101247	0	ninguno
5439	4	7416203101254	0	ninguno
5440	4	7416203101261	0	ninguno
5441	4	7416203101278	0	ninguno
5442	4	7416203101438	0	ninguno
5443	4	7416203101445	0	ninguno
5444	4	7416203101469	0	ninguno
5445	4	7416203101520	0	ninguno
5446	4	7416203101544	0	ninguno
5447	4	7416203101551	0	ninguno
5448	4	7416203101667	0	ninguno
5449	4	7416203101797	0	ninguno
5450	4	7416203101827	0	ninguno
5451	4	7416203101834	0	ninguno
5452	4	7416203101902	0	ninguno
5453	4	7416203101926	0	ninguno
5454	4	7416203101964	0	ninguno
5455	4	7416203102183	0	ninguno
5456	4	7416203102213	0	ninguno
5457	4	7416203102220	0	ninguno
5458	4	7416203102237	0	ninguno
5459	4	7416203102244	0	ninguno
5460	4	7416203102916	0	ninguno
5461	4	7416203102923	0	ninguno
5462	4	7416203102930	0	ninguno
5463	4	7416203103326	0	ninguno
5464	4	7416203103333	0	ninguno
5465	4	7416203103340	0	ninguno
5466	4	7416203103357	0	ninguno
5467	4	7416203103364	0	ninguno
5468	4	7416203103371	0	ninguno
5469	4	7416203103388	0	ninguno
5470	4	7416203103395	0	ninguno
5471	4	7416203103401	0	ninguno
5472	4	7416203103418	0	ninguno
5473	4	7416203103425	0	ninguno
5474	4	7416203103685	0	ninguno
5475	4	7416203103692	0	ninguno
5476	4	7416203103708	0	ninguno
5477	4	7416203103722	0	ninguno
5478	4	7416203103739	0	ninguno
5479	4	7416203103753	0	ninguno
5480	4	7416203103760	0	ninguno
5481	4	7420615480007-7.5	0	ninguno
5482	4	742061548007-10	0	ninguno
5483	4	742061548007-12.5	0	ninguno
5484	4	742061548007-15	0	ninguno
5485	4	742061548007-20	0	ninguno
5486	4	742061548007-25	0	ninguno
5487	4	742061548007-30	0	ninguno
5488	4	742061548007-7.5	0	ninguno
5489	4	7441003121935	0	ninguno
5490	4	7441003121942	0	ninguno
5491	4	7441007802434	0	ninguno
5492	4	7441031336950	0	ninguno
5493	4	7453105056978	0	ninguno
5494	4	7501	0	ninguno
5495	4	7501051100020	0	ninguno
5496	4	7501051100037	0	ninguno
5497	4	7501051186963	0	ninguno
5498	4	7501072204462	0	ninguno
5499	4	7501072204479	0	ninguno
5500	4	7501072204561	0	ninguno
5501	4	7501072204578	0	ninguno
5502	4	7501072204592	0	ninguno
5503	4	7501072204615	0	ninguno
5504	4	7501072206299	0	ninguno
5505	4	7501072206305	0	ninguno
5506	4	7501072207234	0	ninguno
5507	4	7501072207258	0	ninguno
5508	4	7501072207265	0	ninguno
5509	4	7501072208231	0	ninguno
5510	4	7501072208248	0	ninguno
5511	4	7501072208262	0	ninguno
5512	4	7501072208279	0	ninguno
5513	4	7501072208293	0	ninguno
5514	4	7501072208743	0	ninguno
5515	4	7501072208767	0	ninguno
5516	4	7501072208781	0	ninguno
5517	4	7501072208798	0	ninguno
5518	4	7501072208927	0	ninguno
5519	4	7501072208958	0	ninguno
5520	4	7501072208972	0	ninguno
5521	4	7501072210609	0	ninguno
5522	4	7501072210616	0	ninguno
5523	4	7501072210623	0	ninguno
5524	4	7501072210630	0	ninguno
5525	4	7501072210661	0	ninguno
5526	4	7501072210678	0	ninguno
5527	4	7501072210685	0	ninguno
5528	4	7501072210692	0	ninguno
5529	4	7501072210715	0	ninguno
5530	4	7501072210722	0	ninguno
5531	4	7501072210739	0	ninguno
5532	4	7501072214485	0	ninguno
5533	4	7501072214492	0	ninguno
5534	4	7501072214508	0	ninguno
5535	4	7501072214515	0	ninguno
5536	4	7501072214522	0	ninguno
5537	4	7501072214539	0	ninguno
5538	4	7501072214546	0	ninguno
5539	4	7501072214560	0	ninguno
5540	4	7502010420043	0	ninguno
5541	4	7502010421118	0	ninguno
5542	4	7502010421125	0	ninguno
5543	4	7502010421132	0	ninguno
5544	4	7502010421187	0	ninguno
5545	4	7502010421194	0	ninguno
5546	4	7502010423969	0	ninguno
5547	4	7502010429701	0	ninguno
5548	4	7502262630023	0	ninguno
5549	4	7502262630740	0	ninguno
5550	4	7502262630795	0	ninguno
5551	4	7503008553002	0	ninguno
5552	4	7503008553040	0	ninguno
5553	4	7503008553057	0	ninguno
5554	4	7503008553071	0	ninguno
5555	4	7503008553200	0	ninguno
5556	4	7503008553231	0	ninguno
5557	4	7503008553248	0	ninguno
5558	4	7503008553255	0	ninguno
5559	4	7503008553279	0	ninguno
5560	4	7503008553965	0	ninguno
5561	4	7503008553972	0	ninguno
5562	4	7503019166604	0	ninguno
5563	4	7503020053085	0	ninguno
5564	4	7503020053290	0	ninguno
5565	4	7503020053306	0	ninguno
5566	4	7503020053313	0	ninguno
5567	4	7503020053320	0	ninguno
5568	4	7503020053382	0	ninguno
5569	4	7503020053849	0	ninguno
5570	4	7503026084113	0	ninguno
5571	4	7503026084144	0	ninguno
5572	4	7503026470107	0	ninguno
5573	4	7503027959472	0	ninguno
5574	4	7506267903489	0	ninguno
5575	4	7506267907340	0	ninguno
5576	4	7506267907357	0	ninguno
5577	4	7506267907371	0	ninguno
5578	4	7506343800015	0	ninguno
5579	4	7506343800022	0	ninguno
5580	4	7506343800039	0	ninguno
5581	4	7506343800176	0	ninguno
5582	4	7506343800190	0	ninguno
5583	4	7506343800794	0	ninguno
5584	4	7506343801784	0	ninguno
5585	4	7506343802668	0	ninguno
5586	4	7506343802675	0	ninguno
5587	4	7506343802798	0	ninguno
5588	4	7506396700645	0	ninguno
5589	4	7506407400328	0	ninguno
5590	4	7506407400618	0	ninguno
5591	4	7506407400625	0	ninguno
5592	4	7506407400977	0	ninguno
5593	4	7506407401691	0	ninguno
5594	4	7506407402094	0	ninguno
5595	4	7506407402124	0	ninguno
5596	4	7506407402193	0	ninguno
5597	4	7506407402216	0	ninguno
5598	4	7506407402247	0	ninguno
5599	4	7506407402469	0	ninguno
5600	4	7593990010041	0	ninguno
5601	4	7593990010058	0	ninguno
5602	4	7593990012953	0	ninguno
5603	4	7593990050511	0	ninguno
5604	4	769229001167	0	ninguno
5605	4	769229002430	0	ninguno
5606	4	769229002683	0	ninguno
5607	4	769229003611	0	ninguno
5608	4	769229003710	0	ninguno
5609	4	769229003734	0	ninguno
5610	4	769229003741	0	ninguno
5611	4	769229003758	0	ninguno
5612	4	769229049510	0	ninguno
5613	4	769229124217	0	ninguno
5614	4	769229131413	0	ninguno
5615	4	769229131512	0	ninguno
5616	4	769229131918	0	ninguno
5617	4	7707007404604	0	ninguno
5618	4	7707007405663	0	ninguno
5619	4	7707115301161	0	ninguno
5620	4	7707115301222	0	ninguno
5621	4	7707115301468	0	ninguno
5622	4	7707115301611	0	ninguno
5623	4	7707214570659	0	ninguno
5624	4	7707214570833	0	ninguno
5625	4	7707214570918	0	ninguno
5626	4	7707214570949	0	ninguno
5627	4	7707214573001	0	ninguno
5628	4	7707274710316	0	ninguno
5629	4	7707274714215	0	ninguno
5630	4	7707274715014	0	ninguno
5631	4	7707274717001	0	ninguno
5632	4	7707274718060	0	ninguno
5633	4	7730952032677	0	ninguno
5634	4	7730952032899	0	ninguno
5635	4	7730997410614	0	ninguno
5636	4	7730997410621	0	ninguno
5637	4	7730997410638	0	ninguno
5638	4	7730997410645	0	ninguno
5639	4	7756654000363	0	ninguno
5640	4	7756654000370	0	ninguno
5641	4	7756654000387	0	ninguno
5642	4	7756654000400	0	ninguno
5643	4	7756654000424	0	ninguno
5644	4	7756654000448	0	ninguno
5645	4	7756654015220	0	ninguno
5646	4	7756654020156	0	ninguno
5647	4	7756654020293	0	ninguno
5648	4	7756654027926	0	ninguno
5649	4	7756654027933	0	ninguno
5650	4	7756654027940	0	ninguno
5651	4	7759433000059	0	ninguno
5652	4	7759433000882	0	ninguno
5653	4	7759433000998	0	ninguno
5654	4	7759433001193	0	ninguno
5655	4	7759433001933	0	ninguno
5656	4	7759433001940	0	ninguno
5657	4	7792716421868	0	ninguno
5658	4	7797600000174	0	ninguno
5659	4	7797600000501	0	ninguno
5660	4	7797600000518	0	ninguno
5661	4	7797600000761	0	ninguno
5662	4	7797600000785	0	ninguno
5663	4	7797600001805	0	ninguno
5664	4	7797600001812	0	ninguno
5665	4	7797600002895	0	ninguno
5666	4	7797600002901	0	ninguno
5667	4	7798042360055	0	ninguno
5668	4	7798042360093	0	ninguno
5669	4	7798042360109	0	ninguno
5670	4	7798042360178	0	ninguno
5671	4	7798042360185	0	ninguno
5672	4	7798042360260	0	ninguno
5673	4	7798042360468	0	ninguno
5674	4	7798042360581	0	ninguno
5675	4	7798042361311	0	ninguno
5676	4	7798042361335	0	ninguno
5677	4	7798042361359	0	ninguno
5678	4	7798042361380	0	ninguno
5679	4	7798042361533	0	ninguno
5680	4	7798042364800	0	ninguno
5681	4	7798042364961	0	ninguno
5682	4	7798042365685	0	ninguno
5683	4	7798042365692	0	ninguno
5684	4	7798042365708	0	ninguno
5685	4	7798042365715	0	ninguno
5686	4	7798042365722	0	ninguno
5687	4	7798042365739	0	ninguno
5688	4	7798042365975	0	ninguno
5689	4	7798042366170	0	ninguno
5690	4	7798042366187	0	ninguno
5691	4	7798042366200	0	ninguno
5692	4	7798042366217	0	ninguno
5693	4	7798042366224	0	ninguno
5694	4	7798042366231	0	ninguno
5695	4	7798042366255	0	ninguno
5696	4	7798042366262	0	ninguno
5697	4	7798144990860	0	ninguno
5698	4	7798144993663	0	ninguno
5699	4	7798156460054	0	ninguno
5700	4	7798156460061	0	ninguno
5701	4	7798156460290	0	ninguno
5702	4	7798156460429	0	ninguno
5703	4	7798156460498	0	ninguno
5704	4	7798156460740	0	ninguno
5705	4	7798156461051	0	ninguno
5706	4	7798156461808	0	ninguno
5707	4	7798156461815	0	ninguno
5708	4	7798156461853	0	ninguno
5709	4	7798156461884	0	ninguno
5710	4	7798156462928	0	ninguno
5711	4	7798156463185	0	ninguno
5712	4	7798166871895	0	ninguno
5713	4	7798166871901	0	ninguno
5714	4	7798166873134	0	ninguno
5715	4	7798166873141	0	ninguno
5716	4	7798166873158	0	ninguno
5717	4	7798166873165	0	ninguno
5718	4	7798166873172	0	ninguno
5719	4	7798176420403	0	ninguno
5720	4	7798176420410	0	ninguno
5721	4	7798176420434	0	ninguno
5722	4	7798176420458	0	ninguno
5723	4	7798176420465	0	ninguno
5724	4	7798176421073	0	ninguno
5725	4	7798176421080	0	ninguno
5726	4	7798176421097	0	ninguno
5727	4	7798176421103	0	ninguno
5728	4	7798176421110	0	ninguno
5729	4	7798176421196	0	ninguno
5730	4	7798176421202	0	ninguno
5731	4	7798176421219	0	ninguno
5732	4	7798176421264	0	ninguno
5733	4	7798176421745	0	ninguno
5734	4	7798176421752	0	ninguno
5735	4	7798176421769	0	ninguno
5736	4	7798176421776	0	ninguno
5737	4	7798176421868	0	ninguno
5738	4	7798176421875	0	ninguno
5739	4	7798176421882	0	ninguno
5740	4	7798176421899	0	ninguno
5741	4	7798176421905	0	ninguno
5742	4	7798176422926	0	ninguno
5743	4	7798359710017	0	ninguno
5744	4	7800006000232	0	ninguno
5745	4	7800006002038	0	ninguno
5746	4	7800006002700	0	ninguno
5747	4	7800006002724	0	ninguno
5748	4	7800006003370	0	ninguno
5749	4	7800006003561	0	ninguno
5750	4	7800006003646	0	ninguno
5751	4	7800006005169	0	ninguno
5752	4	7800019000014	0	ninguno
5753	4	784369477115	0	ninguno
5754	4	784369477122	0	ninguno
5755	4	7898049715480	0	ninguno
5756	4	7898049719273	0	ninguno
5757	4	7898416700040	0	ninguno
5758	4	7898416700521	0	ninguno
5759	4	7898416700743	0	ninguno
5760	4	7898416701344	0	ninguno
5761	4	7898416701955	0	ninguno
5762	4	7898416701979	0	ninguno
5763	4	7898597991329	0	ninguno
5764	4	80	0	ninguno
5765	4	8010690010908	0	ninguno
5766	4	8010690010915	0	ninguno
5767	4	8010690010946	0	ninguno
5768	4	8010690010991	0	ninguno
5769	4	8010690011080	0	ninguno
5770	4	8010690011295	0	ninguno
5771	4	8010690011301	0	ninguno
5772	4	8010690011349	0	ninguno
5773	4	8010690011394	0	ninguno
5774	4	8010690011547	0	ninguno
5775	4	8010690011745	0	ninguno
5776	4	8010690011769	0	ninguno
5777	4	8010690011790	0	ninguno
5778	4	8010690011936	0	ninguno
5779	4	8010690011967	0	ninguno
5780	4	8010690012186	0	ninguno
5781	4	8010690012209	0	ninguno
5782	4	8010690012308	0	ninguno
5783	4	8010690012360	0	ninguno
5784	4	8010690012476	0	ninguno
5785	4	8010690012674	0	ninguno
5786	4	8010690012698	0	ninguno
5787	4	8010690014043	0	ninguno
5788	4	8010690025919	0	ninguno
5789	4	8010690025926	0	ninguno
5790	4	8010690025940	0	ninguno
5791	4	8010690025988	0	ninguno
5792	4	8010690026015	0	ninguno
5793	4	8010690026053	0	ninguno
5794	4	8010690026060	0	ninguno
5795	4	8010690026084	0	ninguno
5796	4	8010690026121	0	ninguno
5797	4	8010690026138	0	ninguno
5798	4	8010690026152	0	ninguno
5799	4	8010690029214	0	ninguno
5800	4	8010690029566	0	ninguno
5801	4	8010690029986	0	ninguno
5802	4	8010690029993	0	ninguno
5803	4	8010690030005	0	ninguno
5804	4	8010690030029	0	ninguno
5805	4	8010690037363	0	ninguno
5806	4	8010690041926	0	ninguno
5807	4	8010690041933	0	ninguno
5808	4	8010690041940	0	ninguno
5809	4	8010690042084	0	ninguno
5810	4	8010690042091	0	ninguno
5811	4	8010690042114	0	ninguno
5812	4	8010690042121	0	ninguno
5813	4	8010690042145	0	ninguno
5814	4	8010690042152	0	ninguno
5815	4	8010690047775	0	ninguno
5816	4	8010690050072	0	ninguno
5817	4	8010690050089	0	ninguno
5818	4	8010690050096	0	ninguno
5819	4	8010690053677	0	ninguno
5820	4	8010690053691	0	ninguno
5821	4	8010690053714	0	ninguno
5822	4	8010690053738	0	ninguno
5823	4	8010690053752	0	ninguno
5824	4	8010690053776	0	ninguno
5825	4	8010690055381	0	ninguno
5826	4	8010690055398	0	ninguno
5827	4	8010690055404	0	ninguno
5828	4	8010690055411	0	ninguno
5829	4	8010690055428	0	ninguno
5830	4	8010690055435	0	ninguno
5831	4	8010690055442	0	ninguno
5832	4	8010690055459	0	ninguno
5833	4	8010690055466	0	ninguno
5834	4	8010690056135	0	ninguno
5835	4	8010690056142	0	ninguno
5836	4	8010690056159	0	ninguno
5837	4	8010690056548	0	ninguno
5838	4	8010690056555	0	ninguno
5839	4	8010690056562	0	ninguno
5840	4	8010690056579	0	ninguno
5841	4	8010690056586	0	ninguno
5842	4	8010690056616	0	ninguno
5843	4	8010690056630	0	ninguno
5844	4	8010690056647	0	ninguno
5845	4	8010690056654	0	ninguno
5846	4	8010690056661	0	ninguno
5847	4	8010690057552	0	ninguno
5848	4	8010690057569	0	ninguno
5849	4	8010690058160	0	ninguno
5850	4	8010690059082	0	ninguno
5851	4	8010690061696	0	ninguno
5852	4	8010690061702	0	ninguno
5853	4	8010690062853	0	ninguno
5854	4	8010690067339	0	ninguno
5855	4	8010690068121	0	ninguno
5856	4	8010690068138	0	ninguno
5857	4	8010690080017	0	ninguno
5858	4	8010690080024	0	ninguno
5859	4	8010690080031	0	ninguno
5860	4	8010690088365	0	ninguno
5861	4	8010690088457	0	ninguno
5862	4	8010690088563	0	ninguno
5863	4	8010690091471	0	ninguno
5864	4	8010690092898	0	ninguno
5865	4	8010690093604	0	ninguno
5866	4	8010690099552	0	ninguno
5867	4	8010690101491	0	ninguno
5868	4	8010690101507	0	ninguno
5869	4	8010690105796	0	ninguno
5870	4	8010690105802	0	ninguno
5871	4	8010690105819	0	ninguno
5872	4	8010690105826	0	ninguno
5873	4	8010690105833	0	ninguno
5874	4	8010690105840	0	ninguno
5875	4	8010690105857	0	ninguno
5876	4	8010690105864	0	ninguno
5877	4	8010690105871	0	ninguno
5878	4	8010690105888	0	ninguno
5879	4	8010690106571	0	ninguno
5880	4	8010690107028	0	ninguno
5881	4	8010690107134	0	ninguno
5882	4	8010690115924	0	ninguno
5883	4	8010690122946	0	ninguno
5884	4	8010690122953	0	ninguno
5885	4	8010690122977	0	ninguno
5886	4	8010690122991	0	ninguno
5887	4	8010690123004	0	ninguno
5888	4	8010690123011	0	ninguno
5889	4	8010690123035	0	ninguno
5890	4	8010690123059	0	ninguno
5891	4	8010690123066	0	ninguno
5892	4	8010690123073	0	ninguno
5893	4	8010690123097	0	ninguno
5894	4	8010690123110	0	ninguno
5895	4	8010690123141	0	ninguno
5896	4	8010690123158	0	ninguno
5897	4	8010690123172	0	ninguno
5898	4	8010690123196	0	ninguno
5899	4	8010690123202	0	ninguno
5900	4	8010690123219	0	ninguno
5901	4	8010690123233	0	ninguno
5902	4	8010690123257	0	ninguno
5903	4	8010690133362	0	ninguno
5904	4	8010690140346	0	ninguno
5905	4	8010690140360	0	ninguno
5906	4	8010690140377	0	ninguno
5907	4	8010690140384	0	ninguno
5908	4	8010690148977	0	ninguno
5909	4	8010690149004	0	ninguno
5910	4	8010690149011	0	ninguno
5911	4	8010690149028	0	ninguno
5912	4	8010690149059	0	ninguno
5913	4	8010690149066	0	ninguno
5914	4	8010690149073	0	ninguno
5915	4	8010690149097	0	ninguno
5916	4	8010690149103	0	ninguno
5917	4	8010690153100	0	ninguno
5918	4	8010690153124	0	ninguno
5919	4	8010690153568	0	ninguno
5920	4	8010690153582	0	ninguno
5921	4	8010690156156	0	ninguno
5922	4	8010690156163	0	ninguno
5923	4	8010690159270	0	ninguno
5924	4	8010690159782	0	ninguno
5925	4	8010690159867	0	ninguno
5926	4	8010690160443	0	ninguno
5927	4	8010690160474	0	ninguno
5928	4	8010690160481	0	ninguno
5929	4	8010690160498	0	ninguno
5930	4	8010690160511	0	ninguno
5931	4	8010690164670	0	ninguno
5932	4	8010690166308	0	ninguno
5933	4	8010690166315	0	ninguno
5934	4	8010690166322	0	ninguno
5935	4	8010690166339	0	ninguno
5936	4	8010690166346	0	ninguno
5937	4	8010690166353	0	ninguno
5938	4	8010690166360	0	ninguno
5939	4	8010690166377	0	ninguno
5940	4	8010690168821	0	ninguno
5941	4	8010690172033	0	ninguno
5942	4	8010690175331	0	ninguno
5943	4	8010690175355	0	ninguno
5944	4	8010690175362	0	ninguno
5945	4	8010690175379	0	ninguno
5946	4	8010690175386	0	ninguno
5947	4	8010690175409	0	ninguno
5948	4	8010690175416	0	ninguno
5949	4	8010690175423	0	ninguno
5950	4	8010690175454	0	ninguno
5951	4	8010690175478	0	ninguno
5952	4	8010690175485	0	ninguno
5953	4	8010690175492	0	ninguno
5954	4	8010690175508	0	ninguno
5955	4	8010690175515	0	ninguno
5956	4	8010690175522	0	ninguno
5957	4	8010690175546	0	ninguno
5958	4	8010690175553	0	ninguno
5959	4	8010690175577	0	ninguno
5960	4	8010690175584	0	ninguno
5961	4	8010690176161	0	ninguno
5962	4	8010690176178	0	ninguno
5963	4	8010690176208	0	ninguno
5964	4	8010690176215	0	ninguno
5965	4	8010690176222	0	ninguno
5966	4	8010690176260	0	ninguno
5967	4	8010690176277	0	ninguno
5968	4	8010690176307	0	ninguno
5969	4	8010690179445	0	ninguno
5970	4	8010690180076	0	ninguno
5971	4	8010690180106	0	ninguno
5972	4	8010690180137	0	ninguno
5973	4	8010690180168	0	ninguno
5974	4	8010690180182	0	ninguno
5975	4	8010690180755	0	ninguno
5976	4	8010690191065	0	ninguno
5977	4	8010690191089	0	ninguno
5978	4	81	0	ninguno
5979	4	811794010850	0	ninguno
5980	4	811794010898	0	ninguno
5981	4	82	0	ninguno
5982	4	83	0	ninguno
5983	4	84	0	ninguno
5984	4	8410650150130	0	ninguno
5985	4	8410650150147	0	ninguno
5986	4	8410650150185	0	ninguno
5987	4	8410650150192	0	ninguno
5988	4	8410650150253	0	ninguno
5989	4	8410650151892	0	ninguno
5990	4	8410650151946	0	ninguno
5991	4	8410650152264	0	ninguno
5992	4	8410650152288	0	ninguno
5993	4	8410650152301	0	ninguno
5994	4	8410650152325	0	ninguno
5995	4	8410650152363	0	ninguno
5996	4	8410650152400	0	ninguno
5997	4	8410650152448	0	ninguno
5998	4	8410650160474	0	ninguno
5999	4	8410650167817	0	ninguno
6000	4	8410650168104	0	ninguno
6001	4	8410650168128	0	ninguno
6002	4	8410650170695	0	ninguno
6003	4	8410650170718	0	ninguno
6004	4	8410650218649	0	ninguno
6005	4	8410650239132	0	ninguno
6006	4	842704100095	0	ninguno
6007	4	842704100743	0	ninguno
6008	4	8433042001582	0	ninguno
6009	4	8436001971605	0	ninguno
6010	4	8436001971612	0	ninguno
6011	4	8436001971643	0	ninguno
6012	4	8436001971650	0	ninguno
6013	4	8436001971681	0	ninguno
6014	4	8436001971704	0	ninguno
6015	4	8436001971728	0	ninguno
6016	4	8436532730030	0	ninguno
6017	4	8436532730047	0	ninguno
6018	4	8436532730122	0	ninguno
6019	4	8436532730139	0	ninguno
6020	4	8436532730146	0	ninguno
6021	4	8436532730252	0	ninguno
6022	4	8436532730412	0	ninguno
6023	4	8436532730665	0	ninguno
6024	4	8470000397516	0	ninguno
6025	4	8470000491269	0	ninguno
6026	4	8470000493195	0	ninguno
6027	4	8470000647512	0	ninguno
6028	4	8470000957512	0	ninguno
6029	4	847922021016	0	ninguno
6030	4	847922021115	0	ninguno
6031	4	847922021191	0	ninguno
6032	4	847922021559	0	ninguno
6033	4	847922021580	0	ninguno
6034	4	847922021610	0	ninguno
6035	4	847922024031	0	ninguno
6036	4	847922024048	0	ninguno
6037	4	847922027438	0	ninguno
6038	4	847922028084	0	ninguno
6039	4	847922075613	0	ninguno
6040	4	8699245857306	0	ninguno
6041	4	8699245857313	0	ninguno
6042	4	8699245857337	0	ninguno
6043	4	8699245857351	0	ninguno
6044	4	8699245857399	0	ninguno
6045	4	8699245857405	0	ninguno
6046	4	8699245857429	0	ninguno
6047	4	8699245857443	0	ninguno
6048	4	8713184080653	0	ninguno
6049	4	8713184134349	0	ninguno
6050	4	8713184135278	0	ninguno
6051	4	8713184135285	0	ninguno
6052	4	8713184135292	0	ninguno
6053	4	8713184141408	0	ninguno
6054	4	8886467510229	0	ninguno
6055	4	8886467510236	0	ninguno
6056	4	8886467510250	0	ninguno
6057	4	8886467510267	0	ninguno
6058	4	8886467510281	0	ninguno
6059	4	8886467510311	0	ninguno
6060	4	8886467510328	0	ninguno
6061	4	8886467510335	0	ninguno
6062	4	8886467510410	0	ninguno
6063	4	8886467510427	0	ninguno
6064	4	8886467510434	0	ninguno
6065	4	8886467510441	0	ninguno
6066	4	8886467510458	0	ninguno
6067	4	8886467510465	0	ninguno
6068	4	8886467510588	0	ninguno
6069	4	8886467510724	0	ninguno
6070	4	8886467510755	0	ninguno
6071	4	8886467510830	0	ninguno
6072	4	8886467514210	0	ninguno
6073	4	8886467514401	0	ninguno
6074	4	8886467514418	0	ninguno
6075	4	8886467514425	0	ninguno
6076	4	8886467514463	0	ninguno
6077	4	8886467514470	0	ninguno
6078	4	8886467514487	0	ninguno
6079	4	8886467514494	0	ninguno
6080	4	8886467514579	0	ninguno
6081	4	8886467514616	0	ninguno
6082	4	8886467514623	0	ninguno
6083	4	8886467514630	0	ninguno
6084	4	8886467514647	0	ninguno
6085	4	8886467514654	0	ninguno
6086	4	8886467514661	0	ninguno
6087	4	8886467514678	0	ninguno
6088	4	8886467514685	0	ninguno
6089	4	8886467514692	0	ninguno
6090	4	8886467514715	0	ninguno
6091	4	8886467514722	0	ninguno
6092	4	8886467514739	0	ninguno
6093	4	8886467514746	0	ninguno
6094	4	8886467514760	0	ninguno
6095	4	8886467514814	0	ninguno
6096	4	8886467514821	0	ninguno
6097	4	8886467514906	0	ninguno
6098	4	8886467514920	0	ninguno
6099	4	8886467515521	0	ninguno
6100	4	8886467515644	0	ninguno
6101	4	8886467515811	0	ninguno
6102	4	8886467515866	0	ninguno
6103	4	8886467515897	0	ninguno
6104	4	8886467515927	0	ninguno
6105	4	8886467515934	0	ninguno
6106	4	8886467515965	0	ninguno
6107	4	8886467520112	0	ninguno
6108	4	8886467520129	0	ninguno
6109	4	8886467520136	0	ninguno
6110	4	88864675201368886467520136	0	ninguno
6111	4	8886467520143	0	ninguno
6112	4	8886467520150	0	ninguno
6113	4	8886467523212	0	ninguno
6114	4	8886467523229	0	ninguno
6115	4	8886467523236	0	ninguno
6116	4	8886467523243	0	ninguno
6117	4	8886467523250	0	ninguno
6118	4	8886467523267	0	ninguno
6119	4	8886467523274	0	ninguno
6120	4	8886467523298	0	ninguno
6121	4	8886467523311	0	ninguno
6122	4	8886467523328	0	ninguno
6123	4	8886467523335	0	ninguno
6124	4	8886467523342	0	ninguno
6125	4	8886467523356	0	ninguno
6126	4	8886467523359	0	ninguno
6127	4	8886467523366	0	ninguno
6128	4	8886467523373	0	ninguno
6129	4	8886467523380	0	ninguno
6130	4	8886467523397	0	ninguno
6131	4	8886467523410	0	ninguno
6132	4	8886467523427	0	ninguno
6133	4	8886467523434	0	ninguno
6134	4	8886467523441	0	ninguno
6135	4	8886467523458	0	ninguno
6136	4	8886467523465	0	ninguno
6137	4	8886467523472	0	ninguno
6138	4	8886467523489	0	ninguno
6139	4	8886467523496	0	ninguno
6140	4	8886467523625	0	ninguno
6141	4	8886467523632	0	ninguno
6142	4	8886467523649	0	ninguno
6143	4	8886467523823	0	ninguno
6144	4	8886467523830	0	ninguno
6145	4	8886467523847	0	ninguno
6146	4	8886467525018	0	ninguno
6147	4	8886467525049	0	ninguno
6148	4	8886467525117	0	ninguno
6149	4	8886467525124	0	ninguno
6150	4	8886467525322	0	ninguno
6151	4	8886467525339	0	ninguno
6152	4	8886467525346	0	ninguno
6153	4	8886467525353	0	ninguno
6154	4	8886467525711	0	ninguno
6155	4	8886467525735	0	ninguno
6156	4	8886467525742	0	ninguno
6157	4	8886467525759	0	ninguno
6158	4	8886467529719	0	ninguno
6159	4	8886467529726	0	ninguno
6160	4	8886467529733	0	ninguno
6161	4	8886467529740	0	ninguno
6162	4	8886467530067	0	ninguno
6163	4	8886467530128	0	ninguno
6164	4	8886467530135	0	ninguno
6165	4	8886467530142	0	ninguno
6166	4	8886467530159	0	ninguno
6167	4	8886467530302	0	ninguno
6168	4	8886467530319	0	ninguno
6169	4	8886467530326	0	ninguno
6170	4	8886467530333	0	ninguno
6171	4	8886467530340	0	ninguno
6172	4	8886467530364	0	ninguno
6173	4	8886467530371	0	ninguno
6174	4	8886467530388	0	ninguno
6175	4	8886467530500	0	ninguno
6176	4	8886467531019	0	ninguno
6177	4	8886467531026	0	ninguno
6178	4	8886467531033	0	ninguno
6179	4	8886467531040	0	ninguno
6180	4	8886467532115	0	ninguno
6181	4	8886467532122	0	ninguno
6182	4	8886467532139	0	ninguno
6183	4	8886467532160	0	ninguno
6184	4	8886467532177	0	ninguno
6185	4	8886467532214	0	ninguno
6186	4	8886467532221	0	ninguno
6187	4	8886467532238	0	ninguno
6188	4	8886467532269	0	ninguno
6189	4	8886467532276	0	ninguno
6190	4	8886467532313	0	ninguno
6191	4	8886467532320	0	ninguno
6192	4	8886467532337	0	ninguno
6193	4	8886467532368	0	ninguno
6194	4	8886467532375	0	ninguno
6195	4	8886467532412	0	ninguno
6196	4	8886467532429	0	ninguno
6197	4	8886467532436	0	ninguno
6198	4	8886467532450	0	ninguno
6199	4	8886467532467	0	ninguno
6200	4	8886467532474	0	ninguno
6201	4	8886467532511	0	ninguno
6202	4	8886467532528	0	ninguno
6203	4	8886467532535	0	ninguno
6204	4	8886467532559	0	ninguno
6205	4	8886467532566	0	ninguno
6206	4	8886467532573	0	ninguno
6207	4	8886467532634	0	ninguno
6208	4	8886467535222	0	ninguno
6209	4	8886467535239	0	ninguno
6210	4	8886467535246	0	ninguno
6211	4	8886467535321	0	ninguno
6212	4	8886467535413	0	ninguno
6213	4	8886467535420	0	ninguno
6214	4	8886467535437	0	ninguno
6215	4	8886467535536	0	ninguno
6216	4	8886467535543	0	ninguno
6217	4	8886467535611	0	ninguno
6218	4	8886467535628	0	ninguno
6219	4	8886467535635	0	ninguno
6220	4	8886467535642	0	ninguno
6221	4	8886467541018	0	ninguno
6222	4	8886467541025	0	ninguno
6223	4	8886467541032	0	ninguno
6224	4	8886467541117	0	ninguno
6225	4	8886467541124	0	ninguno
6226	4	8886467541131	0	ninguno
6227	4	8886467541148	0	ninguno
6228	4	8886467544712	0	ninguno
6229	4	8886467545030	0	ninguno
6230	4	8886467545047	0	ninguno
6231	4	8886467545054	0	ninguno
6232	4	8886467545061	0	ninguno
6233	4	8886467545078	0	ninguno
6234	4	8886467545085	0	ninguno
6235	4	8886467545399	0	ninguno
6236	4	8886467545412	0	ninguno
6237	4	8886467545467	0	ninguno
6238	4	8886467545542	0	ninguno
6239	4	8886467545702	0	ninguno
6240	4	8886467545719	0	ninguno
6241	4	8886467545726	0	ninguno
6242	4	8886467546013	0	ninguno
6243	4	8886467546037	0	ninguno
6244	4	8886467546044	0	ninguno
6245	4	8886467546198	0	ninguno
6246	4	8886467546211	0	ninguno
6247	4	8886467546327	0	ninguno
6248	4	8886467546334	0	ninguno
6249	4	8886467546341	0	ninguno
6250	4	8886467546617	0	ninguno
6251	4	8886467546648	0	ninguno
6252	4	8886467546655	0	ninguno
6253	4	8886467546662	0	ninguno
6254	4	8886467546969	0	ninguno
6255	4	8886467547546	0	ninguno
6256	4	8886467548512	0	ninguno
6257	4	8886467548536	0	ninguno
6258	4	8886467548710	0	ninguno
6259	4	8886467548772	0	ninguno
6260	4	8886467548789	0	ninguno
6261	4	8886467548796	0	ninguno
6262	4	8886467548826	0	ninguno
6263	4	8886467548840	0	ninguno
6264	4	8886467548864	0	ninguno
6265	4	8886467548888	0	ninguno
6266	4	8886467548925	0	ninguno
6267	4	8886467548932	0	ninguno
6268	4	8886467548949	0	ninguno
6269	4	8886467580000	0	ninguno
6270	4	8886467580017	0	ninguno
6271	4	8886467580024	0	ninguno
6272	4	8886467580062	0	ninguno
6273	4	8886467580079	0	ninguno
6274	4	8886467580086	0	ninguno
6275	4	8886467580093	0	ninguno
6276	4	8886467580109	0	ninguno
6277	4	8886467580116	0	ninguno
6278	4	8886467580147	0	ninguno
6279	4	8886467580161	0	ninguno
6280	4	8886467580178	0	ninguno
6281	4	8886467580185	0	ninguno
6282	4	8886467580208	0	ninguno
6283	4	8886467580215	0	ninguno
6284	4	8886467580222	0	ninguno
6285	4	8886467580413	0	ninguno
6286	4	8886467581465	0	ninguno
6287	4	8886467582059	0	ninguno
6288	4	8886467584954	0	ninguno
6289	4	8886467584961	0	ninguno
6290	4	8886467585814	0	ninguno
6291	4	8886467585913	0	ninguno
6292	4	8886467586347	0	ninguno
6293	4	8886467589010	0	ninguno
6294	4	8886467589317	0	ninguno
6295	4	8886467589478	0	ninguno
6296	4	8886467589485	0	ninguno
6297	4	8900950297173	0	ninguno
6298	4	8900950297180	0	ninguno
6299	4	8901138501242	0	ninguno
6300	4	8901138501297	0	ninguno
6301	4	8901138511333	0	ninguno
6302	4	8901138511340	0	ninguno
6303	4	90	0	ninguno
6304	4	9003579000519	0	ninguno
6305	4	9003579000748	0	ninguno
6306	4	9003579001172	0	ninguno
6307	4	9003579013557	0	ninguno
6308	4	9003579018514	0	ninguno
6309	4	9003579018866	0	ninguno
6310	4	9003579018941	0	ninguno
6311	4	9003579307717	0	ninguno
6312	4	9003579308936	0	ninguno
6313	4	9003579308943	0	ninguno
6314	4	9003579309445	0	ninguno
6315	4	9003579309469	0	ninguno
6316	4	9003579310632	0	ninguno
6317	4	9003579311004	0	ninguno
6318	4	9003579311462	0	ninguno
6319	4	9003579311851	0	ninguno
6320	4	91009	0	ninguno
6321	4	91012	0	ninguno
6322	4	91013	0	ninguno
6323	4	91015	0	ninguno
6324	4	911emergencia	0	ninguno
6325	4	9333527021861	0	ninguno
6326	4	9333527230447	0	ninguno
6327	4	9333527329240	0	ninguno
6328	4	9333527329257	0	ninguno
6329	4	9333527341037	0	ninguno
6330	4	9333527377852	0	ninguno
6331	4	9333527426642	0	ninguno
6332	4	9333527443670	0	ninguno
6333	4	9333527586469	0	ninguno
6334	4	9505903	0	ninguno
6335	4	9505904	0	ninguno
6336	4	9505905	0	ninguno
6337	4	99-26191	0	ninguno
6338	4	A1014	0	ninguno
6339	4	AB01S	0	ninguno
6340	4	AB02M	0	ninguno
6341	4	AB03L	0	ninguno
6342	4	AC01	0	ninguno
6343	4	AC01S	0	ninguno
6344	4	AC02M	0	ninguno
6345	4	AF001S	0	ninguno
6346	4	ALP001	0	ninguno
6347	4	AMOXITABS250	0	ninguno
6348	4	ANXIVET	0	ninguno
6349	4	ARTROVET	0	ninguno
6350	4	Atropina01	0	ninguno
6351	4	AUMENTA	0	ninguno
6352	4	BAEP00	0	ninguno
6353	4	BAN0	0	ninguno
6354	4	BC1050032021	0	ninguno
6355	4	BCTH2101C	0	ninguno
6356	4	BHL001	0	ninguno
6357	4	BHM001	0	ninguno
6358	4	BHS001	0	ninguno
6359	4	BHXS001	0	ninguno
6360	4	BL01-S	0	ninguno
6361	4	BL-02	0	ninguno
6362	4	BL02-M	0	ninguno
6363	4	BL03-L	0	ninguno
6364	4	BL04-XL	0	ninguno
6365	4	BOSAL#0	0	ninguno
6366	4	BROADLINE	0	ninguno
6367	4	BVL001	0	ninguno
6368	4	BVM001	0	ninguno
6369	4	BVS001	0	ninguno
6370	4	C20-M	0	ninguno
6371	4	C20-S	0	ninguno
6372	4	C20-XL	0	ninguno
6373	4	C21-L	0	ninguno
6374	4	C21-M	0	ninguno
6375	4	C21-S	0	ninguno
6376	4	C21-XL	0	ninguno
6377	4	C22-1	0	ninguno
6378	4	C22-2	0	ninguno
6379	4	C22-3	0	ninguno
6380	4	CAM2030	0	ninguno
6381	4	CAM2435	0	ninguno
6382	4	CAM2840	0	ninguno
6383	4	cardiovet	0	ninguno
6384	4	CARPRODYL100	0	ninguno
6385	4	CARPRODYL25	0	ninguno
6386	4	CD02M	0	ninguno
6387	4	CD03L	0	ninguno
6388	4	CefaCure	0	ninguno
6389	4	CIPROTABS250	0	ninguno
6390	4	CORTA3807	0	ninguno
6391	4	DE013-M	0	ninguno
6392	4	doramectina	0	ninguno
6393	4	Dufamox15	0	ninguno
6394	4	FARM044	0	ninguno
6395	4	FARM046	0	ninguno
6396	4	FARM141	0	ninguno
6397	4	FC088	0	ninguno
6398	4	FG01-S	0	ninguno
6399	4	FG02-M	0	ninguno
6400	4	FG03-L	0	ninguno
6401	4	FG04XL	0	ninguno
6402	4	FGEZ1002	0	ninguno
6403	4	G003	0	ninguno
6404	4	G0M3101S	0	ninguno
6405	4	G0M3102M	0	ninguno
6406	4	gentamicina	0	ninguno
6407	4	H2-S	0	ninguno
6408	4	H3-L	0	ninguno
6409	4	H3-M	0	ninguno
6410	4	H3-S	0	ninguno
6411	4	H3-XL	0	ninguno
6412	4	H4-L	0	ninguno
6413	4	H4-M	0	ninguno
6414	4	H4-XL	0	ninguno
6415	4	HEARTGARDL	0	ninguno
6416	4	HEARTGARDM	0	ninguno
6417	4	HEARTGARDS	0	ninguno
6418	4	HEMOVITB12	0	ninguno
6419	4	HEPATOVET	0	ninguno
6420	4	HI01S	0	ninguno
6421	4	HI02M	0	ninguno
6422	4	HI03L	0	ninguno
6423	4	HTB031-2	0	ninguno
6424	4	HTGC019	0	ninguno
6425	4	ij-02	0	ninguno
6426	4	IJ03	0	ninguno
6427	4	IP001ML	0	ninguno
6428	4	JD01	0	ninguno
6429	4	JD02	0	ninguno
6430	4	JHP951	0	ninguno
6431	4	JK901L	0	ninguno
6432	4	JK901M	0	ninguno
6433	4	JK901S	0	ninguno
6434	4	K002	0	ninguno
6435	4	K9-L	0	ninguno
6436	4	KD01	0	ninguno
6437	4	KETOVET	0	ninguno
6438	4	KL01XS	0	ninguno
6439	4	KL02S	0	ninguno
6440	4	KL03M	0	ninguno
6441	4	KL04L	0	ninguno
6442	4	KL05XL	0	ninguno
6443	4	KM0110MM	0	ninguno
6444	4	KM0212MM	0	ninguno
6445	4	KN0110MM	0	ninguno
6446	4	KN0212MM	0	ninguno
6447	4	KN0315MM	0	ninguno
6448	4	KP01S	0	ninguno
6449	4	KR01	0	ninguno
6450	4	kS15MM	0	ninguno
6451	4	KT01XXS	0	ninguno
6452	4	KT02XS	0	ninguno
6453	4	KT03S	0	ninguno
6454	4	KU01XXS	0	ninguno
6455	4	KU02XS	0	ninguno
6456	4	KV01XXS	0	ninguno
6457	4	KV03S	0	ninguno
6458	4	KW01XXS	0	ninguno
6459	4	KW02XS	0	ninguno
6460	4	KW03S	0	ninguno
6461	4	KW04M	0	ninguno
6462	4	L1003	0	ninguno
6463	4	LM-01	0	ninguno
6464	4	LM-02	0	ninguno
6465	4	LM-03	0	ninguno
6466	4	LM-902-L	0	ninguno
6467	4	LM902M	0	ninguno
6468	4	LM902S	0	ninguno
6469	4	M610	0	ninguno
6470	4	M9D228135	0	ninguno
6471	4	M9D22826	0	ninguno
6472	4	M9D22838-L	0	ninguno
6473	4	M9D22838-M	0	ninguno
6474	4	M9D22838-S	0	ninguno
6475	4	M9D22838-XL	0	ninguno
6476	4	M9D22868	0	ninguno
6477	4	Metronidazole	0	ninguno
6478	4	MN03	0	ninguno
6479	4	MN05-XL	0	ninguno
6480	4	MP1831	0	ninguno
6481	4	MP1855	0	ninguno
6482	4	MU01	0	ninguno
6483	4	MU01S	0	ninguno
6484	4	MU02	0	ninguno
6485	4	MU02M	0	ninguno
6486	4	N026I21	0	ninguno
6487	4	NO02-S	0	ninguno
6488	4	NO03-M	0	ninguno
6489	4	NO04-L	0	ninguno
6490	4	no05xl	0	ninguno
6491	4	OMPASTA-01	0	ninguno
6492	4	OP01S	0	ninguno
6493	4	OP02M	0	ninguno
6494	4	OPTIVET	0	ninguno
6495	4	OV115	0	ninguno
6496	4	P002L	0	ninguno
6497	4	P1089	0	ninguno
6498	4	P1118-PP-B7	0	ninguno
6499	4	P518	0	ninguno
6500	4	P518-1	0	ninguno
6501	4	P519	0	ninguno
6502	4	P520	0	ninguno
6503	4	P521	0	ninguno
6504	4	P522	0	ninguno
6505	4	P523	0	ninguno
6506	4	P924	0	ninguno
6507	4	P935	0	ninguno
6508	4	PALETAS	0	ninguno
6509	4	PEC001	0	ninguno
6510	4	PECH273	0	ninguno
6511	4	PH2088	0	ninguno
6512	4	PL01	0	ninguno
6513	4	QR01	0	ninguno
6514	4	QR01XS	0	ninguno
6515	4	QR02	0	ninguno
6516	4	QR02S	0	ninguno
6517	4	quino-01	0	ninguno
6518	4	RANITIDINVET	0	ninguno
6519	4	RAR2002	0	ninguno
6520	4	RS02	0	ninguno
6521	4	RS02S	0	ninguno
6522	4	RS03L	0	ninguno
6523	4	RS03-L	0	ninguno
6524	4	ST0101	0	ninguno
6525	4	ST01XS	0	ninguno
6526	4	ST02S	0	ninguno
6527	4	ST03M	0	ninguno
6528	4	ST04L	0	ninguno
6529	4	ST05XL	0	ninguno
6530	4	stickerzone01	0	ninguno
6531	4	STOMORGYL10	0	ninguno
6532	4	SU01	0	ninguno
6533	4	SU02	0	ninguno
6534	4	sy-b024	0	ninguno
6535	4	TORT001	0	ninguno
6536	4	TU01	0	ninguno
6537	4	TU02	0	ninguno
6538	4	TU03	0	ninguno
6539	4	TU04	0	ninguno
6540	4	UNGÜENTO	0	ninguno
6541	4	URIVET	0	ninguno
6542	4	UT01XS	0	ninguno
6543	4	UT02S	0	ninguno
6544	4	UT03M	0	ninguno
6545	4	UT04L	0	ninguno
6546	4	UT05XL	0	ninguno
6547	4	UV01S	0	ninguno
6548	4	UV02M	0	ninguno
6549	4	UV03L	0	ninguno
6550	4	UY0110MM	0	ninguno
6551	4	UY0212MM	0	ninguno
6552	4	VDECA0008	0	ninguno
6553	4	VDECA0009	0	ninguno
6554	4	VDECA007	0	ninguno
6555	4	VDEFE0001	0	ninguno
6556	4	VE2022115917	0	ninguno
6557	4	VHL001	0	ninguno
6558	4	VHM001	0	ninguno
6559	4	VHS001	0	ninguno
6560	4	VHTL001	0	ninguno
6561	4	VHTM001	0	ninguno
6562	4	VHTS001	0	ninguno
6563	4	VT-01	0	ninguno
6564	4	VT-02	0	ninguno
6565	4	VVL001	0	ninguno
6566	4	VVM001	0	ninguno
6567	4	VVS001	0	ninguno
6568	4	W4UNID	0	ninguno
6569	4	WV04L	0	ninguno
6570	4	X001	0	ninguno
6571	4	X002	0	ninguno
6572	4	XW01S	0	ninguno
6573	4	XW02M	0	ninguno
6574	4	XW03L	0	ninguno
6575	4	XW04XL	0	ninguno
6576	4	ZY01S	0	ninguno
6577	4	ZY02M	0	ninguno
6578	4	ZY02-M	0	ninguno
6579	4	ZY03L	0	ninguno
6580	4	ZY04XL	0	ninguno
\.


--
-- Data for Name: extractosclientes; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.extractosclientes (id, cliente_id, doc_numero, fecha, cargo, abono, saldo, usuario, sucursal, nombre_cliente) FROM stdin;
\.


--
-- Data for Name: extractosproveedores; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.extractosproveedores (id, prov_id, doc_numero, fecha, cargo, abono, saldo, usuario, sucursal) FROM stdin;
\.


--
-- Data for Name: gerentes; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.gerentes (gerente_id, gerente_nombre, gerente_iniciales, gerente_passwd, gerente_confpasswd, creada_por, fecha_creacion, modificada_por, fecha_modificacion, gtesucursal_asignada, activosn, id_solicitud) FROM stdin;
\.


--
-- Data for Name: hfacturas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.hfacturas (id, fecha_creacion, numero_impreso, id_cliente, id_sucursal, id_promo, subtotal, monto_gravado, impuesto, monto_nogravado, total_linea, descuentos, costo, pago_efectivo, pago_tarjeta, pago_credito, numero_autorizacion, pagada_sn, creada_por, cobrada_por, anulada, anulada_por, fecha_cobro, fecha_anulacion, nombre_cliente, condicion_pago, lineas_factura, hora_inicio, hora_final) FROM stdin;
1	2023-10-26	\N	1	1	\N	65.98	65.98	8.57	0.00	74.55	0.00	36.83	0.00	0.00	0.00	\N	0	Admin	\N	0	\N	\N	\N	Consumidor Final	Contado	4	21:44:37	\N
2	2023-10-27	\N	1	1	\N	\N	\N	\N	\N	\N	0.00	\N	0.00	0.00	0.00	\N	0	Admin	\N	0	\N	\N	\N	Consumidor Final	Contado	\N	14:07:17	\N
\.


--
-- Data for Name: historial_mascotas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.historial_mascotas (id, mascota_id, fecha_visita, motivo_visita, temperatura_mascota, peso_mascota, sintomas_mascota, diagnostico, proxima_cita, medico_atendio, sucursal_atendio) FROM stdin;
\.


--
-- Data for Name: htraslado; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.htraslado (id, fecha_enviado, fecha_recibido, suc_origen, suc_destino, usuario_crea, usuario_recibe, estado, usuario_autoriza) FROM stdin;
\.


--
-- Data for Name: impuestos; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.impuestos (imp_id, imp_nombre, imp_porc, creado_por, fecha_creacion, activosn, modificado_por) FROM stdin;
1	IVA	0.13	Admin	2023-10-26	1	\N
\.


--
-- Data for Name: ippermitidas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.ippermitidas (ip_id, id_sucursal, ip_asignada, creada_por, fecha_creacion) FROM stdin;
1	1	127.0.0.1	Admin	2023-10-25
2	1	172.19.0.1	Admin	2023-10-27
\.


--
-- Data for Name: kardex; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.kardex (id, sucursal_id, codbarra, doc_no, cant_ingreso, cant_salio, anulada, id_hfactura, fecha_transaccion) FROM stdin;
\.


--
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.marcas (id, marca_nombre, marca_paisorigen, proveedor_id, creadapor, fecha_creacion, activosn, sucursal_crea, modificada_por, fecha_modificacion) FROM stdin;
1	Hills	Estados Unidos	5	Admin	2023-10-23	1	1	\N	\N
2	Pawise	Estados Unidos	6	Admin	2023-10-23	1	1	\N	\N
3	Ferplast	\N	6	Admin	2023-10-23	1	1	\N	\N
4	GoodBites	\N	6	Admin	2023-10-23	1	1	\N	\N
5	Nylabone	\N	6	Admin	2023-10-23	1	1	\N	\N
6	Royal Canin	Union Europea	6	Admin	2023-10-23	1	1	\N	\N
7	Hiking Harness	China	7	Admin	2023-10-23	1	1	\N	\N
8	Cat Collar	China	7	Admin	2023-10-23	1	1	\N	\N
9	PetLife	El Salvador	7	Admin	2023-10-23	1	1	\N	\N
10	Laboratorios Kyrovet	Colombia	8	Admin	2023-10-23	1	1	\N	\N
11	Laboratorio California	Colombia	8	Admin	2023-10-23	1	1	\N	\N
12	Grupo Mallo	El Salvador	10	Admin	2023-10-23	1	1	\N	\N
13	Zoetis	Estados Unidos	10	Admin	2023-10-23	1	1	\N	\N
14	VIYO	Bélgica	10	Admin	2023-10-23	1	1	\N	\N
15	Nestlé	México	11	Admin	2023-10-23	1	1	\N	\N
16	Virbac	Brasil	12	Admin	2023-10-23	1	1	\N	\N
17	Over	Argentina	12	Admin	2023-10-23	1	1	\N	\N
18	Holliday	Argentina	13	Admin	2023-10-23	1	1	\N	\N
19	Kyrovet	Colombia	8	Admin	2023-10-23	1	1	\N	\N
20	BioFarm	Brasil	14	Admin	2023-10-23	1	1	\N	\N
21	Biozoo	Mexico	13	Admin	2023-10-23	1	1	\N	\N
22	RiverFarma	Mexico	15	Admin	2023-10-23	1	1	\N	\N
24	Bayer	USA	17	Admin	2023-10-23	1	1	\N	\N
25	DutchFarm	Holanda	18	Admin	2023-10-23	1	1	\N	\N
26	Microsules	Uruguay	12	Admin	2023-10-23	1	1	\N	\N
27	Sanfer	Mexico	10	Admin	2023-10-23	1	1	\N	\N
28	Dechra-Brovel	Mexico	13	Admin	2023-10-23	1	1	\N	\N
29	Genética	El Salvador	12	Admin	2023-10-23	1	1	\N	\N
30	Saone	Bélgica	7	Admin	2023-10-23	1	1	\N	\N
31	M-Pets	Bélgica	7	Admin	2023-10-23	1	1	\N	\N
32	Multipet	China	7	Admin	2023-10-23	1	1	\N	\N
33	Zoovet	Argentina	13	Admin	2023-10-23	1	1	\N	\N
34	PetsPharma	Mexico	38	Admin	2023-10-23	1	1	\N	\N
35	Wellco Corporation, S.A.	Guatemala	38	Admin	2023-10-23	1	1	\N	\N
36	Calox	Costa Rica	17	Admin	2023-10-23	1	1	\N	\N
37	MSD	Italia	17	Admin	2023-10-23	1	1	\N	\N
38	Propac	USA	19	Admin	2023-10-23	1	1	\N	\N
39	Advance	USA	19	Admin	2023-10-23	1	1	\N	\N
40	Evangers	USA	19	Admin	2023-10-23	1	1	\N	\N
41	Happy Cat	El Salvador	19	Admin	2023-10-23	1	1	\N	\N
42	Magic Coat	USA	19	Admin	2023-10-23	1	1	\N	\N
43	Pharmapec	El Salvador	19	Admin	2023-10-23	1	1	\N	\N
45	Himalaya	India	19	Admin	2023-10-23	1	1	\N	\N
46	Interfarma	USA	19	Admin	2023-10-23	1	1	\N	\N
47	BirdFood	El Salvador	19	Admin	2023-10-23	1	1	\N	\N
48	Natures Miracle	USA	19	Admin	2023-10-23	1	1	\N	\N
49	NUPEC	México	20	Admin	2023-10-23	1	1	\N	\N
50	Boehringer Ingelheim	\N	13	Admin	2023-10-23	1	1	\N	\N
51	Unimark Pet food	Spain	21	Admin	2023-10-23	1	1	\N	\N
52	Ceva Salud Animal	Francia	21	Admin	2023-10-23	1	1	\N	\N
53	Finish Line Pets	USA	22	Admin	2023-10-23	1	1	\N	\N
54	Tuffys Pet Food	USA	22	Admin	2023-10-23	1	1	\N	\N
55	URANO	España	23	Admin	2023-10-23	1	1	\N	\N
56	Kong Company	USA	5	Admin	2023-10-23	1	1	\N	\N
57	Zona Sticker	El Salvador	24	Admin	2023-10-23	1	1	\N	\N
58	Bbraun	Alemania	39	Admin	2023-10-23	1	1	\N	\N
59	LABYES	ARGENTINA	5	Admin	2023-10-23	1	1	\N	\N
60	PetAg	U.S.A	5	Admin	2023-10-23	1	1	\N	\N
61	SynergyLabs	U.S.A	5	Admin	2023-10-23	1	1	\N	\N
62	Otro	\N	5	Admin	2023-10-23	1	1	\N	\N
63	Van Cat	Turquia	20	Admin	2023-10-23	1	1	\N	\N
64	DragPharma	Chile	25	Admin	2023-10-23	1	1	\N	\N
66	INVET	Colombia	26	Admin	2023-10-23	1	1	\N	\N
67	PureLuxe Pet Food	USA	27	Admin	2023-10-23	1	1	\N	\N
68	AFP (All For Paws)	China	6	Admin	2023-10-23	1	1	\N	\N
69	Tropical Clean	USA	6	Admin	2023-10-23	1	1	\N	\N
70	Diamond Pet Foods	USA	20	Admin	2023-10-23	1	1	\N	\N
71	Nutrovet	China	28	Admin	2023-10-23	1	1	\N	\N
72	Agrovet Market S.A.	Canada	28	Admin	2023-10-23	1	1	\N	\N
74	Maxcotas	USA	29	Admin	2023-10-23	1	1	\N	\N
75	UBL	China	29	Admin	2023-10-23	1	1	\N	\N
76	Funamei	China	29	Admin	2023-10-23	1	1	\N	\N
77	Intervet	USA	17	Admin	2023-10-23	1	1	\N	\N
78	DIGAVET	Belgica	30	Admin	2023-10-23	1	1	\N	\N
79	Richmond	Argentina	30	Admin	2023-10-23	1	1	\N	\N
80	Furacao Pet	Brasil	7	Admin	2023-10-23	1	1	\N	\N
81	IDEXX	Brasil	6	Admin	2023-10-23	1	1	\N	\N
82	Brouwer	Argentina	32	Admin	2023-10-23	1	1	\N	\N
83	Laboratorios Decno	Colombia	32	Admin	2023-10-23	1	1	\N	\N
84	Biomont	Peru	32	Admin	2023-10-23	1	1	\N	\N
85	Laboratorios Arsal	El Salvador	32	Admin	2023-10-23	1	1	\N	\N
86	Vijosa	El Salvador	36	Admin	2023-10-23	1	1	\N	\N
87	Peluqueria	El Salvador	40	Admin	2023-10-23	1	1	\N	\N
88	Veterinario	el Salvador	40	Admin	2023-10-23	1	1	\N	\N
89	Laboratorio	El Salvador	40	Admin	2023-10-23	1	1	\N	\N
90	Imágenes	el Salvador	40	Admin	2023-10-23	1	1	\N	\N
91	Transporte	El Salvador	40	Admin	2023-10-23	1	1	\N	\N
92	Gamma Laboratories	Peru	34	Admin	2023-10-23	1	1	\N	\N
93	Alcames	Costa Rica	34	Admin	2023-10-23	1	1	\N	\N
94	Sanicat	Argentina	20	Admin	2023-10-23	1	1	\N	\N
95	Purina	USA	11	Admin	2023-10-23	1	1	\N	\N
96	Blue Bandanas	El Salvador	35	Admin	2023-10-23	1	1	\N	\N
97	IDS	China	29	Admin	2023-10-23	1	1	\N	\N
98	Dong da	China	29	Admin	2023-10-23	1	1	\N	\N
100	SAIMED	India	36	Admin	2023-10-23	1	1	\N	\N
101	Animal Planet	Mexico	27	Admin	2023-10-23	1	1	\N	\N
102	NutraPet	USA	6	Admin	2023-10-23	1	1	\N	\N
103	Senasa	\N	\N	Admin	2023-10-23	1	1	\N	\N
104	Tuvet	el Salvador	40	Admin	2023-10-23	1	1	\N	\N
105	Patologia Dra Artiga	El Salvador	40	Admin	2023-10-23	1	1	\N	\N
106	Kaytee Productw Inc	Estados Unidos	42	Admin	2023-10-23	1	1	\N	\N
107	Catalysis	España	32	Admin	2023-10-23	1	1	\N	\N
109	ofice depot	mexico	\N	Admin	2023-10-23	1	1	\N	\N
110	Petmedica	EE UU	11	Admin	2023-10-23	1	1	\N	\N
111	Nora	\N	6	Admin	2023-10-23	1	1	\N	\N
112	Elanco	Chile	17	Admin	2023-10-23	1	1	\N	\N
114	Grupos Coris	Costa rica	45	Admin	2023-10-23	1	1	\N	\N
116	Diamond Pet Foods, Inc	Estados Unidos	20	Admin	2023-10-23	1	1	\N	\N
117	Cunatex	Chile	40	Admin	2023-10-23	1	1	\N	\N
23	M1	NA	40	Admin	2023-10-24	0	1	\N	\N
44	M2	NA	40	Admin	2023-10-25	0	1	\N	\N
65	M3	NA	40	Admin	2023-10-26	0	1	\N	\N
73	M4	NA	40	Admin	2023-10-27	0	1	\N	\N
99	M5	NA	40	Admin	2023-10-28	0	1	\N	\N
108	M6	NA	40	Admin	2023-10-29	0	1	\N	\N
113	M7	NA	40	Admin	2023-10-30	0	1	\N	\N
115	M8	NA	40	Admin	2023-10-31	0	1	\N	\N
\.


--
-- Data for Name: mascotas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.mascotas (id, nombre_mascota, propietario_id, especie, raza_id, edad, sexo, tipo_pelo, color, tamanio, caracteristicas, estado_reproductivo, chip, habitat, dieta, activa_sn, usuario_crea, fecha_creacion, usuario_modifica, fecha_modificacion, sucursal_crea) FROM stdin;
\.


--
-- Data for Name: mvz; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.mvz (mvz_id, mvz_nombre, mvz_iniciales, mvz_passwd, mvz_confpasswd, mvzsucursal_asignada, fecha_creacion, creada_por, modificada_por, fecha_modificacion, activosn, id_solicitud) FROM stdin;
\.


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.paises (id, nombre_pais) FROM stdin;
1	AFGANISTAN
2	ALBANIA
3	ALEMANIA
4	ANDORRA
5	ANGOLA
6	ANGUILLA
7	ANTIGUA Y BARBUDA
8	ANTILLAS HOLANDESAS
9	ARABIA SAUDI
10	ARGELIA
11	ARGENTINA
12	ARMENIA
13	ARUBA
14	AUSTRALIA
15	AUSTRIA
16	AZERBAIYAN
17	BAHAMAS
18	BAHREIN
19	BANGLADESH
20	BARBADOS
21	BELARUS
22	BELGICA
23	BELICE
24	BENIN
25	BERMUDAS
26	BHUTÁN
27	BOLIVIA
28	BOSNIA Y HERZEGOVINA
29	BOTSWANA
30	BRASIL
31	BRUNEI
32	BULGARIA
33	BURKINA FASO
34	BURUNDI
35	CABO VERDE
36	CAMBOYA
37	CAMERUN
38	CANADA
39	CHAD
40	CHILE
41	CHINA
42	CHIPRE
43	COLOMBIA
44	COMORES
45	CONGO
46	COREA
47	COREA DEL NORTE 
48	COSTA DE MARFIL
49	COSTA RICA
50	CROACIA
51	CUBA
52	DINAMARCA
53	DJIBOUTI
54	DOMINICA
55	ECUADOR
56	EGIPTO
57	EL SALVADOR
58	EMIRATOS ARABES UNIDOS
59	ERITREA
60	ESLOVENIA
61	ESPAÑA
62	ESTADOS UNIDOS DE AMERICA
63	ESTONIA
64	ETIOPIA
65	FIJI
66	FILIPINAS
67	FINLANDIA
68	FRANCIA
69	GABON
70	GAMBIA
71	GEORGIA
72	GHANA
73	GIBRALTAR
74	GRANADA
75	GRECIA
76	GROENLANDIA
77	GUADALUPE
78	GUAM
79	GUATEMALA
80	GUAYANA FRANCESA
81	GUERNESEY
82	GUINEA
83	GUINEA ECUATORIAL
84	GUINEA-BISSAU
85	GUYANA
86	HAITI
87	HONDURAS
88	HONG KONG
89	HUNGRIA
90	INDIA
91	INDONESIA
92	IRAN
93	IRAQ
94	IRLANDA
95	ISLA DE MAN
96	ISLA NORFOLK
97	ISLANDIA
98	ISLAS ALAND
99	ISLAS CAIMÁN
100	ISLAS COOK
101	ISLAS DEL CANAL
102	ISLAS FEROE
103	ISLAS MALVINAS
104	ISLAS MARIANAS DEL NORTE
105	ISLAS MARSHALL
106	ISLAS PITCAIRN
107	ISLAS SALOMON
108	ISLAS TURCAS Y CAICOS
109	ISLAS VIRGENES BRITANICAS
110	ISLAS VÍRGENES DE LOS ESTADOS UNIDOS
111	ISRAEL
112	ITALIA
113	JAMAICA
114	JAPON
115	JERSEY
116	JORDANIA
117	KAZAJSTAN
118	KENIA
119	KIRGUISTAN
120	KIRIBATI
121	KUWAIT
122	LAOS
123	LESOTHO
124	LETONIA
125	LIBANO
126	LIBERIA
127	LIBIA
128	LIECHTENSTEIN
129	LITUANIA
130	LUXEMBURGO
131	MACAO
132	MACEDONIA 
133	MADAGASCAR
134	MALASIA
135	MALAWI
136	MALDIVAS
137	MALI
138	MALTA
139	MARRUECOS
140	MARTINICA
141	MAURICIO
142	MAURITANIA
143	MAYOTTE
144	MEXICO
145	MICRONESIA
146	MOLDAVIA
147	MONACO
148	MONGOLIA
149	MONTENEGRO
150	MONTSERRAT
151	MOZAMBIQUE
152	MYANMAR
153	NAMIBIA
154	NAURU
155	NEPAL
156	NICARAGUA
157	NIGER
158	NIGERIA
159	NIUE
160	NORUEGA
161	NUEVA CALEDONIA
162	NUEVA ZELANDA
163	OMAN
164	OTROS PAISES  O TERRITORIOS DE AMERICA DEL NORTE
165	OTROS PAISES O TERRITORIOS  DE SUDAMERICA
166	OTROS PAISES O TERRITORIOS DE AFRICA
167	OTROS PAISES O TERRITORIOS DE ASIA
168	OTROS PAISES O TERRITORIOS DE LA UNION EUROPEA
169	OTROS PAISES O TERRITORIOS DE OCEANIA
170	OTROS PAISES O TERRITORIOS DEL CARIBE Y AMERICA CENTRAL
171	OTROS PAISES O TERRITORIOS DEL RESTO DE EUROPA
172	PAISES BAJOS
173	PAKISTAN
174	PALAOS
175	PALESTINA
176	PANAMA
177	PAPUA NUEVA GUINEA
178	PARAGUAY
179	PERU
180	POLINESIA FRANCESA
181	POLONIA
182	PORTUGAL
183	PUERTO RICO
184	QATAR
185	REINO UNIDO
186	REP.DEMOCRATICA DEL CONGO
187	REPUBLICA CENTROAFRICANA
188	REPUBLICA CHECA
189	REPUBLICA DOMINICANA
190	REPUBLICA ESLOVACA
191	REUNION
192	RUANDA
193	RUMANIA
194	RUSIA
195	SAHARA OCCIDENTAL
196	SAMOA
197	SAMOA AMERICANA
198	SAN BARTOLOME
199	SAN CRISTOBAL Y NIEVES
200	SAN MARINO
201	SAN MARTIN (PARTE FRANCESA)
202	SAN PEDRO Y MIQUELON 
203	SAN VICENTE Y LAS GRANADINAS
204	SANTA HELENA
205	SANTA LUCIA
206	SANTA SEDE
207	SANTO TOME Y PRINCIPE
208	SENEGAL
209	SERBIA
210	SEYCHELLES
211	SIERRA LEONA
212	SINGAPUR
213	SIRIA
214	SOMALIA
215	SRI LANKA
216	SUDAFRICA
217	SUDAN
218	SUECIA
219	SUIZA
220	SURINAM
221	SVALBARD Y JAN MAYEN
222	SWAZILANDIA
223	TADYIKISTAN
224	TAILANDIA
225	TANZANIA
226	TIMOR ORIENTAL
227	TOGO
228	TOKELAU
229	TONGA
230	TRINIDAD Y TOBAGO
231	TUNEZ
232	TURKMENISTAN
233	TURQUIA
234	TUVALU
235	UCRANIA
236	UGANDA
237	URUGUAY
238	UZBEKISTAN
239	VANUATU
240	VENEZUELA
241	VIETNAM
242	WALLIS Y FORTUNA
243	YEMEN
244	ZAMBIA
245	ZIMBABWE
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.productos (id, prod_codbarra, prod_nombre, prod_univenta, id_marca, id_categorias, id_subcategoria, prod_compraminima, prod_distminima, prod_esgravadosn, prod_costopromedio, prod_markup, prod_preciopublico, prod_porcdescuento, descuento_unidad, creado_por, fecha_creacion, foto, prod_esinventariosn, prod_ultimocosto, escalas, activosn, codigo_impuesto, porcentaje_impuesto, prod_ventaminima, modificada_por, fecha_modificacion, sucursal_crea) FROM stdin;
1	052742701004	PD Kidney Care k/d  Lata 13 oz	\N	1	30	\N	1	1	1	2.99	0.25	3.94	0.10	0.39	Admin	2022-12-07	\N	1	2.99	\N	1	1	0.13	1	\N	\N	\N
2	052742701103	PD Liver Care l/d  Lata 13 oz	\N	1	30	\N	1	1	1	3.15	0.25	3.94	0.10	0.39	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
3	052742867106	PD Multi-Benefit w/d  Bolsa 8.5 lbs	\N	1	1	\N	1	1	1	26.17	0.25	32.71	0.10	3.27	Admin	2022-12-07	\N	1	26.17	\N	1	1	0.13	1	\N	\N	\N
4	052742701806	PD Food Sensitives z/d  Lata 13 Oz	\N	1	30	\N	1	1	1	3.32	0.25	4.15	0.10	0.41	Admin	2022-12-07	\N	1	3.32	\N	1	1	0.13	1	\N	\N	\N
5	052742195704	PD Metabolic  Lata 13 oz	\N	1	30	\N	1	1	1	3.50	0.25	4.15	0.10	0.42	Admin	2022-12-07	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
6	052742187907	Natural Training Soft & Chewy Treats  Sobre 3 oz	\N	1	29	\N	1	1	1	4.28	0.25	5.35	0.05	0.27	Admin	2022-12-07	\N	1	4.28	\N	1	1	0.13	1	\N	\N	\N
7	052742713908	SD Puppy Small Bites Chicken & Barley Recipe  Bolsa 4.5 lbs	\N	1	1	\N	1	1	1	15.76	0.33	20.35	0.10	2.04	Admin	2022-12-07	\N	1	16.22	\N	1	1	0.13	1	\N	\N	\N
8	052742818306	SD Adult Small Bites 1-6 Chicken & Barley Recipe  Bolsa 5 lbs	\N	1	1	\N	1	1	1	0.00	0.45	19.20	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
9	052742679709	SD Feline Adult 1-6 Chicken Recipe  Bolsa 4 lbs	\N	1	1	\N	1	1	1	15.58	0.25	19.47	0.05	0.97	Admin	2022-12-07	\N	1	15.58	\N	1	1	0.13	1	\N	\N	\N
10	052742710402	SD Feline Adult 7+ Chicken Recipe  Bolsa 4 lb	\N	1	1	\N	1	1	1	18.66	0.25	22.64	0.10	2.26	Admin	2022-12-07	\N	1	18.12	\N	1	1	0.13	1	\N	\N	\N
11	052742861807	PD Digestive Care i/d  Bolsa 8.5 lbs	\N	1	1	\N	1	1	1	28.20	0.34	36.53	0.10	3.65	Admin	2022-12-07	\N	1	29.03	\N	1	1	0.13	1	\N	\N	\N
12	052742001746	PD Urinary Care c/d  Bolsa 8.5 lbs	\N	1	1	\N	1	1	1	29.27	0.25	36.59	0.50	18.30	Admin	2022-12-07	\N	1	29.27	\N	1	1	0.13	1	\N	\N	\N
13	052742862408	PD Weight Loss r/d  Bolsa 8.5 lbs	\N	1	1	\N	1	1	1	29.64	0.25	36.33	0.10	3.63	Admin	2022-12-07	\N	1	29.06	\N	1	1	0.13	1	\N	\N	\N
14	052742790107	PD Food Sensitive z/d  Bolsa 8 lbs	\N	1	1	\N	1	1	1	38.90	0.25	48.63	0.10	4.86	Admin	2022-12-07	\N	1	38.90	\N	1	1	0.13	1	\N	\N	\N
15	052742703602	SD Puppy Chicken & Barley Entree  Lata 13 oz	\N	1	1	\N	1	1	1	3.74	0.25	4.67	0.10	0.47	Admin	2022-12-07	\N	1	3.74	\N	1	1	0.13	1	\N	\N	\N
16	052742703701	SD Adult 1-6 Chicken & Barley Entree  Lata 13 oz	\N	1	30	\N	1	1	1	3.54	0.25	4.67	0.10	0.47	Admin	2022-12-07	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
17	052742705507	SD Adult 7+ Chicken & Barley Entree  Lata 13 oz	\N	1	30	\N	1	1	1	3.74	0.25	4.67	0.10	0.47	Admin	2022-12-07	\N	1	3.74	\N	1	1	0.13	1	\N	\N	\N
18	052742700809	PD Digestive Care i/d  Lata 13 oz	\N	1	30	\N	1	1	1	2.99	0.55	4.63	0.10	0.46	Admin	2022-12-07	\N	1	2.99	\N	1	1	0.13	1	\N	\N	\N
19	8886467510755	Dispensador Duo Pawise  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	20.90	0.10	2.09	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
20	8010690037363	Jaula Ave Reckord  Unidad	\N	3	32	\N	1	1	1	27.16	0.60	43.46	0.15	6.52	Admin	2022-12-07	\N	1	27.16	\N	1	1	0.13	1	\N	\N	\N
21	8010690133362	Bebedero Drinky Dog  Unidad	\N	3	2	\N	1	1	1	17.36	0.60	27.78	0.15	4.17	Admin	2022-12-07	\N	1	17.36	\N	1	1	0.13	1	\N	\N	\N
22	8010690115924	Arenero con tapa L  Unidad	\N	3	24	\N	1	1	1	0.00	0.60	31.89	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
23	8010690159270	Kennel Atlas 5  Unidad	\N	3	32	\N	1	1	1	12.18	0.60	19.49	0.10	1.95	Admin	2022-12-07	\N	1	12.18	\N	1	1	0.13	1	\N	\N	\N
24	8010690062853	Kennel Atlas 10 El  Unidad	\N	3	32	\N	1	1	1	17.01	0.60	27.22	0.15	4.08	Admin	2022-12-07	\N	1	17.01	\N	1	1	0.13	1	\N	\N	\N
25	8010690061702	Kennek Atlas 20  Unidad	\N	3	32	\N	1	1	1	22.80	0.60	36.48	0.00	0.00	Admin	2022-12-07	\N	1	22.80	\N	1	1	0.13	1	\N	\N	\N
26	8010690153568	Kennel Trendy 10 V1  Unidad	\N	3	32	\N	1	1	1	23.66	0.60	37.86	0.00	0.00	Admin	2022-12-07	\N	1	23.66	\N	1	1	0.13	1	\N	\N	\N
27	8010690153582	Kennel Trendy 20 V2  Unidad	\N	3	32	\N	1	1	1	30.15	0.60	48.24	0.00	0.00	Admin	2022-12-07	\N	1	30.15	\N	1	1	0.13	1	\N	\N	\N
28	8010690057552	Kennel Deluxe 10  Unidad	\N	3	32	\N	1	1	1	29.54	0.60	47.26	0.15	7.09	Admin	2022-12-07	\N	1	29.54	\N	1	1	0.13	1	\N	\N	\N
29	8010690057569	Kennel Deluxe 20  Unidad	\N	3	32	\N	1	1	1	34.77	0.60	55.63	0.00	0.00	Admin	2022-12-07	\N	1	34.77	\N	1	1	0.13	1	\N	\N	\N
30	8010690180755	Kennel Gato-Perro  Unidad	\N	3	32	\N	1	1	1	11.74	0.60	18.80	0.10	1.88	Admin	2022-12-07	\N	1	11.74	\N	1	1	0.13	1	\N	\N	\N
31	8010690107028	Mueble Rascador Gris  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	79.47	0.10	7.95	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
32	8010690107134	Gym Rascador  Unidad	\N	3	2	\N	1	1	1	0.00	0.60	210.26	0.10	21.03	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
33	8010690175355	Collar Reflex Azul  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	13.70	0.15	2.05	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
34	8010690175362	Collar Reflex C20-56  Unidad	\N	3	23	\N	1	1	1	9.24	0.60	14.78	0.15	2.22	Admin	2022-12-07	\N	1	9.24	\N	1	1	0.13	1	\N	\N	\N
35	8010690175379	Collar Reflex Rojo  Unidad	\N	3	23	\N	1	1	1	9.24	0.60	14.78	0.15	2.22	Admin	2022-12-07	\N	1	9.24	\N	1	1	0.13	1	\N	\N	\N
36	8010690175386	Collar Reflex Azul  Unidad	\N	3	23	\N	1	1	1	9.24	0.60	14.78	0.00	0.00	Admin	2022-12-07	\N	1	9.24	\N	1	1	0.13	1	\N	\N	\N
37	8010690175409	Collar Reflex C25-70  Unidad	\N	3	23	\N	1	1	1	11.50	0.60	18.40	0.15	2.76	Admin	2022-12-07	\N	1	11.50	\N	1	1	0.13	1	\N	\N	\N
38	8010690175416	Collar Reflex C25-70  Unidad	\N	3	23	\N	1	1	1	11.50	0.60	18.40	0.20	3.68	Admin	2022-12-07	\N	1	11.50	\N	1	1	0.13	1	\N	\N	\N
39	8010690175485	Correa Rflex G25-120  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	13.17	0.10	1.32	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
40	8010690175508	Correa Rflex G25-120  Unidad	\N	3	23	\N	1	1	1	8.26	0.60	13.22	0.00	0.00	Admin	2022-12-07	\N	1	8.26	\N	1	1	0.13	1	\N	\N	\N
41	8010690105864	Collar Club Rosa  Unidad	\N	3	23	\N	1	1	1	2.07	0.60	3.31	0.15	0.50	Admin	2022-12-07	\N	1	2.07	\N	1	1	0.13	1	\N	\N	\N
42	8010690010915	Collar Negro C10-32  Unidad	\N	3	23	\N	1	1	1	2.03	0.60	3.25	0.15	0.49	Admin	2022-12-07	\N	1	2.03	\N	1	1	0.13	1	\N	\N	\N
43	8010690010908	Collar Rojo C10-32  Unidad	\N	3	23	\N	1	1	1	2.03	0.60	3.25	0.15	0.49	Admin	2022-12-07	\N	1	2.03	\N	1	1	0.13	1	\N	\N	\N
44	8010690010946	Collar Azul C10-32  Unidad	\N	3	23	\N	1	1	1	2.07	0.60	3.31	0.15	0.50	Admin	2022-12-07	\N	1	2.07	\N	1	1	0.13	1	\N	\N	\N
45	8010690105871	Collar Rosa C15-44  Unidad	\N	3	23	\N	1	1	1	2.89	0.60	4.62	0.15	0.69	Admin	2022-12-07	\N	1	2.89	\N	1	1	0.13	1	\N	\N	\N
46	8010690010991	Collar Negro C15-44  Unidad	\N	3	23	\N	1	1	1	2.91	0.60	4.66	0.10	0.47	Admin	2022-12-07	\N	1	2.91	\N	1	1	0.13	1	\N	\N	\N
47	8010690011080	Collar Rojo C15-44  Unidad	\N	3	23	\N	1	1	1	2.89	0.60	4.62	0.15	0.69	Admin	2022-12-07	\N	1	2.89	\N	1	1	0.13	1	\N	\N	\N
48	8010690011295	Collar Azul C15-44  Unidad	\N	3	23	\N	1	1	1	2.91	0.60	4.66	0.15	0.70	Admin	2022-12-07	\N	1	2.91	\N	1	1	0.13	1	\N	\N	\N
49	8010690105888	Collar Rosa C20-56  Unidad	\N	3	23	\N	1	1	1	3.31	0.60	5.30	0.15	0.79	Admin	2022-12-07	\N	1	3.31	\N	1	1	0.13	1	\N	\N	\N
50	8010690011301	Collar Negro C20-56  Unidad	\N	3	23	\N	1	1	1	3.31	0.60	5.30	0.15	0.79	Admin	2022-12-07	\N	1	3.31	\N	1	1	0.13	1	\N	\N	\N
51	8010690011394	Collar Negro C25-70  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	6.50	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
52	8010690011547	Collar Rojo C25-70  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	7.01	0.15	1.05	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
53	8010690011745	Collar Azul C25-70  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	7.01	0.15	1.05	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
54	8010690050072	Correa Dayt Negra C  Unidad	\N	3	23	\N	1	1	1	5.81	0.60	9.30	0.15	1.39	Admin	2022-12-07	\N	1	5.81	\N	1	1	0.13	1	\N	\N	\N
55	8010690050089	Correa Dayt Roja D  Unidad	\N	3	23	\N	1	1	1	5.92	0.60	9.47	0.00	0.00	Admin	2022-12-07	\N	1	5.92	\N	1	1	0.13	1	\N	\N	\N
56	8010690159782	Correa Dayt Verde A  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	9.47	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
57	8010690042091	Correa Dayt Negra  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	11.20	0.10	1.12	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
58	8010690041926	Correa Dayt Roja A  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	11.20	0.10	1.12	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
59	8010690042121	Correa Dayt Negra A  Unidad	\N	3	23	\N	1	1	1	7.23	0.60	11.57	0.10	1.16	Admin	2022-12-07	\N	1	7.23	\N	1	1	0.13	1	\N	\N	\N
60	8010690041933	Correa Dayt Roja B  Unidad	\N	3	23	\N	1	1	1	7.35	0.60	11.76	0.10	1.18	Admin	2022-12-07	\N	1	7.35	\N	1	1	0.13	1	\N	\N	\N
61	8010690042114	Correa Dayt Azul A  Unidad	\N	3	23	\N	1	1	1	6.77	0.60	10.83	0.10	1.08	Admin	2022-12-07	\N	1	6.77	\N	1	1	0.13	1	\N	\N	\N
62	8010690042152	Correa Dayt Negra B  Unidad	\N	3	23	\N	1	1	1	8.24	0.60	13.18	0.10	1.32	Admin	2022-12-07	\N	1	8.24	\N	1	1	0.13	1	\N	\N	\N
63	8010690041940	Correa Dayt Roja C  Unidad	\N	3	23	\N	1	1	1	8.24	0.60	13.18	0.10	1.32	Admin	2022-12-07	\N	1	8.24	\N	1	1	0.13	1	\N	\N	\N
64	8010690159867	Correa Dayt Verde  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	13.63	0.10	1.36	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
65	8010690042145	Correa Dayt Azul  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	13.18	0.10	1.32	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
66	8010690105833	Correa Rosa G10-12  Unidad	\N	3	23	\N	1	1	1	2.68	0.60	4.29	0.10	0.43	Admin	2022-12-07	\N	1	2.68	\N	1	1	0.13	1	\N	\N	\N
67	8010690011790	Correa Rojo G10-12  Unidad	\N	3	23	\N	1	1	1	2.61	0.60	4.18	0.10	0.42	Admin	2022-12-07	\N	1	2.61	\N	1	1	0.13	1	\N	\N	\N
68	8010690011936	Correa Azul G10-12  Unidad	\N	3	23	\N	1	1	1	2.61	0.60	4.18	0.15	0.63	Admin	2022-12-07	\N	1	2.61	\N	1	1	0.13	1	\N	\N	\N
69	8010690105840	Correa Rosa G15-12  Unidad	\N	3	23	\N	1	1	1	3.69	0.60	5.90	0.10	0.59	Admin	2022-12-07	\N	1	3.69	\N	1	1	0.13	1	\N	\N	\N
70	8010690011967	Correa Negro G15-12  Unidad	\N	3	23	\N	1	1	1	3.69	0.60	5.90	0.10	0.59	Admin	2022-12-07	\N	1	3.69	\N	1	1	0.13	1	\N	\N	\N
71	8010690105857	Correa Rosa G20-12  Unidad	\N	3	23	\N	1	1	1	4.64	0.60	7.42	0.10	0.74	Admin	2022-12-07	\N	1	4.64	\N	1	1	0.13	1	\N	\N	\N
72	8010690012209	Correa Negro G20-12  Unidad	\N	3	23	\N	1	1	1	5.06	0.60	8.10	0.10	0.81	Admin	2022-12-07	\N	1	5.06	\N	1	1	0.13	1	\N	\N	\N
73	8010690012360	Correa Azul G20-12  Unidad	\N	3	23	\N	1	1	1	4.64	0.60	7.42	0.00	0.00	Admin	2022-12-07	\N	1	4.64	\N	1	1	0.13	1	\N	\N	\N
74	8010690012476	Correa Negr G25-12  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	9.36	0.10	0.94	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
75	8010690012698	Correa Azul G25-12  Unidad	\N	3	23	\N	1	1	1	5.85	0.60	9.36	0.00	0.00	Admin	2022-12-07	\N	1	5.85	\N	1	1	0.13	1	\N	\N	\N
76	8010690166308	Arnes Nikita Negro X  Unidad	\N	3	23	\N	1	1	1	9.73	0.60	15.57	0.15	2.34	Admin	2022-12-07	\N	1	9.73	\N	1	1	0.13	1	\N	\N	\N
77	8010690166315	Arnes Nikita Rojo Xs  Unidad	\N	3	23	\N	1	1	1	10.12	0.60	16.19	0.15	2.43	Admin	2022-12-07	\N	1	10.12	\N	1	1	0.13	1	\N	\N	\N
78	8010690166322	Arnes Nikita Blue Xs  Unidad	\N	3	23	\N	1	1	1	10.12	0.60	16.19	0.15	2.43	Admin	2022-12-07	\N	1	10.12	\N	1	1	0.13	1	\N	\N	\N
79	8010690166339	Arnes Nikita Negro S  Unidad	\N	3	23	\N	1	1	1	12.57	0.60	20.11	0.15	3.02	Admin	2022-12-07	\N	1	12.57	\N	1	1	0.13	1	\N	\N	\N
80	8010690166346	Arnes Nikita Rojo S  Unidad	\N	3	23	\N	1	1	1	12.57	0.60	20.11	0.15	3.02	Admin	2022-12-07	\N	1	12.57	\N	1	1	0.13	1	\N	\N	\N
81	8010690166353	Arnes Nikita Blue S  Unidad	\N	3	23	\N	1	1	1	12.57	0.60	20.11	0.15	3.02	Admin	2022-12-07	\N	1	12.57	\N	1	1	0.13	1	\N	\N	\N
82	8010690166360	Arnes Nikita Negro M  Unidad	\N	3	23	\N	1	1	1	13.77	0.60	22.03	0.15	3.30	Admin	2022-12-07	\N	1	13.77	\N	1	1	0.13	1	\N	\N	\N
83	8010690166377	Arnes Nikita Rojo M  Unidad	\N	3	23	\N	1	1	1	13.77	0.60	22.03	0.15	3.30	Admin	2022-12-07	\N	1	13.77	\N	1	1	0.13	1	\N	\N	\N
84	8010690175515	Arnes Nikita Xs  Unidad	\N	3	23	\N	1	1	1	9.73	0.60	15.57	0.15	2.34	Admin	2022-12-07	\N	1	9.73	\N	1	1	0.13	1	\N	\N	\N
85	8010690175522	Arnes Nikita Xs  Unidad	\N	3	23	\N	1	1	1	9.78	0.60	15.65	0.10	1.56	Admin	2022-12-07	\N	1	9.78	\N	1	1	0.13	1	\N	\N	\N
86	8010690175553	Arnes Nikita S  Unidad	\N	3	23	\N	1	1	1	13.93	0.60	22.29	0.15	3.34	Admin	2022-12-07	\N	1	13.93	\N	1	1	0.13	1	\N	\N	\N
87	8010690175577	Arnes Nikita Gris M  Unidad	\N	3	23	\N	1	1	1	15.19	0.60	24.30	0.15	3.65	Admin	2022-12-07	\N	1	15.19	\N	1	1	0.13	1	\N	\N	\N
88	8010690175584	Arnes Nikita Verde M  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	24.75	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
89	8010690105796	Arnes Easy Rosa Xs  Unidad	\N	3	23	\N	1	1	1	3.94	0.60	6.30	0.15	0.95	Admin	2022-12-07	\N	1	3.94	\N	1	1	0.13	1	\N	\N	\N
90	8010690080017	Arnes Easy Negro Xs  Unidad	\N	3	23	\N	1	1	1	3.97	0.60	6.35	0.15	0.95	Admin	2022-12-07	\N	1	3.97	\N	1	1	0.13	1	\N	\N	\N
91	8010690080024	Arnes Easy Rojo Xs  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	6.35	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
92	8010690080031	Arnes Easy Azul Xs  Unidad	\N	3	23	\N	1	1	1	3.97	0.60	6.35	0.15	0.95	Admin	2022-12-07	\N	1	3.97	\N	1	1	0.13	1	\N	\N	\N
93	8010690105802	Arnes Easy Rosa S  Unidad	\N	3	23	\N	1	1	1	4.04	0.60	6.46	0.15	0.97	Admin	2022-12-07	\N	1	4.04	\N	1	1	0.13	1	\N	\N	\N
94	8010690025919	Arnes Easy Negro S  Unidad	\N	3	23	\N	1	1	1	4.04	0.60	6.46	0.15	0.97	Admin	2022-12-07	\N	1	4.04	\N	1	1	0.13	1	\N	\N	\N
95	8010690025926	Arnes Easy Rojo S  Unidad	\N	3	23	\N	1	1	1	3.78	0.60	6.05	0.15	0.91	Admin	2022-12-07	\N	1	3.78	\N	1	1	0.13	1	\N	\N	\N
96	8010690025940	Arnes Easy Azul S  Unidad	\N	3	23	\N	1	1	1	3.78	0.60	6.05	0.15	0.91	Admin	2022-12-07	\N	1	3.78	\N	1	1	0.13	1	\N	\N	\N
97	8010690105819	Arnes Easy Rosa M  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	9.60	0.10	0.96	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
98	8010690025988	Arnes Easy Negro M  Unidad	\N	3	23	\N	1	1	1	5.88	0.60	9.41	0.15	1.41	Admin	2022-12-07	\N	1	5.88	\N	1	1	0.13	1	\N	\N	\N
99	8010690026015	Arnes Easy Azul M  Unidad	\N	3	23	\N	1	1	1	6.00	0.60	9.60	0.15	1.44	Admin	2022-12-07	\N	1	6.00	\N	1	1	0.13	1	\N	\N	\N
100	8010690105826	Arnes Easy Rosa L  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	13.36	0.10	1.34	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
101	8010690026053	Arnes Easy Negro L  Unidad	\N	3	23	\N	1	1	1	8.35	0.60	13.36	0.15	2.00	Admin	2022-12-07	\N	1	8.35	\N	1	1	0.13	1	\N	\N	\N
102	8010690026060	Arnes Easy Rojo L  Unidad	\N	3	23	\N	1	1	1	7.82	0.60	12.51	0.15	1.88	Admin	2022-12-07	\N	1	7.82	\N	1	1	0.13	1	\N	\N	\N
103	8010690026084	Arnes Easy Azul L  Unidad	\N	3	23	\N	1	1	1	8.35	0.60	13.36	0.15	2.00	Admin	2022-12-07	\N	1	8.35	\N	1	1	0.13	1	\N	\N	\N
104	8010690026121	Arnes Easy Negro Xl  Unidad	\N	3	23	\N	1	1	1	11.73	0.60	18.77	0.15	2.82	Admin	2022-12-07	\N	1	11.73	\N	1	1	0.13	1	\N	\N	\N
105	8010690026138	Arnes Easy Rojo Xl  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	17.47	0.00	0.00	Admin	2022-12-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
106	8010690026152	Arnes Easy Azul Xl  Unidad	\N	3	23	\N	1	1	1	11.81	0.60	18.90	0.15	2.83	Admin	2022-12-07	\N	1	11.81	\N	1	1	0.13	1	\N	\N	\N
107	8010690055381	Arnes Dayt Negra S  Unidad	\N	3	23	\N	1	1	1	7.81	0.60	12.50	0.15	1.87	Admin	2022-12-08	\N	1	7.81	\N	1	1	0.13	1	\N	\N	\N
108	8010690055398	Arnes Dayt Rojo S  Unidad	\N	3	23	\N	1	1	1	7.81	0.60	12.50	0.15	1.87	Admin	2022-12-08	\N	1	7.81	\N	1	1	0.13	1	\N	\N	\N
109	8010690055404	Arnes Dayt Azul S  Unidad	\N	3	23	\N	1	1	1	8.33	0.60	13.33	0.15	2.00	Admin	2022-12-08	\N	1	8.33	\N	1	1	0.13	1	\N	\N	\N
110	8010690055411	Arnes Dayt Negra M  Unidad	\N	3	23	\N	1	1	1	11.13	0.60	17.81	0.15	2.67	Admin	2022-12-08	\N	1	11.13	\N	1	1	0.13	1	\N	\N	\N
111	8010690055428	Arnes Dayt Rojo M  Unidad	\N	3	23	\N	1	1	1	11.13	0.60	17.81	0.15	2.67	Admin	2022-12-08	\N	1	11.13	\N	1	1	0.13	1	\N	\N	\N
112	8010690055435	Arnes Dayt Azul M  Unidad	\N	3	23	\N	1	1	1	11.13	0.60	17.81	0.15	2.67	Admin	2022-12-08	\N	1	11.13	\N	1	1	0.13	1	\N	\N	\N
113	8010690055442	Arnes Dayt Negra L  Unidad	\N	3	23	\N	1	1	1	15.03	0.60	24.05	0.10	2.40	Admin	2022-12-08	\N	1	15.03	\N	1	1	0.13	1	\N	\N	\N
114	8010690055459	Arnes Dayt Rojo L  Unidad	\N	3	23	\N	1	1	1	14.07	0.60	22.51	0.15	3.38	Admin	2022-12-08	\N	1	14.07	\N	1	1	0.13	1	\N	\N	\N
115	8010690055466	Arnes Dayt Azul L  Unidad	\N	3	23	\N	1	1	1	15.03	0.60	24.05	0.15	3.61	Admin	2022-12-08	\N	1	15.03	\N	1	1	0.13	1	\N	\N	\N
116	8010690056135	Arnes Dayt Negra XL  Unidad	\N	3	23	\N	1	1	1	18.22	0.60	29.15	0.15	4.37	Admin	2022-12-08	\N	1	18.22	\N	1	1	0.13	1	\N	\N	\N
117	8010690056142	Arnes Dayt Rojo XL  Unidad	\N	3	23	\N	1	1	1	19.01	0.60	30.42	0.15	4.56	Admin	2022-12-08	\N	1	19.01	\N	1	1	0.13	1	\N	\N	\N
118	8010690056159	Arnes Dayt Azul XL  Unidad	\N	3	23	\N	1	1	1	18.22	0.60	29.15	0.15	4.37	Admin	2022-12-08	\N	1	18.22	\N	1	1	0.13	1	\N	\N	\N
119	8010690176161	Collar Evol Cf16-37  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	6.86	0.15	1.03	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
120	8010690176178	Collar Evol Cf16-37  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	7.31	0.00	0.00	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
121	8010690176208	Collar Evol Cf16-37  Unidad	\N	3	23	\N	1	1	1	4.29	0.60	6.86	0.00	0.00	Admin	2022-12-08	\N	1	4.29	\N	1	1	0.13	1	\N	\N	\N
122	8010690176215	Collar Evol Cf25-45  Unidad	\N	3	23	\N	1	1	1	6.49	0.60	10.38	0.15	1.56	Admin	2022-12-08	\N	1	6.49	\N	1	1	0.13	1	\N	\N	\N
123	8010690176222	Collar Evol Cf25-45  Unidad	\N	3	23	\N	1	1	1	6.49	0.60	10.38	0.00	0.00	Admin	2022-12-08	\N	1	6.49	\N	1	1	0.13	1	\N	\N	\N
124	8010690176260	Collar Evol Cf25-53  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	10.67	0.10	1.07	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
125	8010690176277	Collar Evol Cf25-53  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	10.94	0.10	1.09	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
126	8010690176307	Collar Evol Cf25-53  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	10.67	0.00	0.00	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
127	8010690101491	Carpeta Entren. M  Unidad	\N	3	24	\N	1	1	1	0.00	0.60	12.94	0.10	1.29	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
128	8010690101507	Carpeta Entren. L  Unidad	\N	3	24	\N	1	1	1	11.99	0.60	19.18	0.10	1.92	Admin	2022-12-08	\N	1	11.99	\N	1	1	0.13	1	\N	\N	\N
129	8010690056548	Cepillo Doble S  Unidad	\N	3	24	\N	1	1	1	4.55	0.60	7.28	0.15	1.09	Admin	2022-12-08	\N	1	4.55	\N	1	1	0.13	1	\N	\N	\N
130	8010690056555	Cepillo Doble M  Unidad	\N	3	24	\N	1	1	1	5.74	0.60	9.18	0.15	1.38	Admin	2022-12-08	\N	1	5.74	\N	1	1	0.13	1	\N	\N	\N
131	8010690047775	Cepillo Masajeador  Unidad	\N	3	24	\N	1	1	1	0.00	0.60	8.43	0.15	1.26	Admin	2022-12-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
132	8010690088365	Cepillo Dental S  Unidad	\N	3	24	\N	1	1	1	1.35	0.60	2.16	0.15	0.32	Admin	2022-12-08	\N	1	1.35	\N	1	1	0.13	1	\N	\N	\N
133	8010690093604	Cepillo Doble D-Goma  Unidad	\N	3	24	\N	1	1	1	6.97	0.60	11.15	0.15	1.67	Admin	2022-12-09	\N	1	6.97	\N	1	1	0.13	1	\N	\N	\N
134	8010690056562	Rastrillo S  Unidad	\N	3	24	\N	1	1	1	0.00	0.60	6.77	0.10	0.68	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
135	8010690056579	Rastrillo M  Unidad	\N	3	24	\N	1	1	1	4.52	0.60	7.23	0.10	0.72	Admin	2022-12-09	\N	1	4.52	\N	1	1	0.13	1	\N	\N	\N
136	8010690029214	Cepillo Doble Funcion  Unidad	\N	3	24	\N	1	1	1	5.60	0.60	8.96	0.15	1.34	Admin	2022-12-09	\N	1	5.60	\N	1	1	0.13	1	\N	\N	\N
137	8010690056647	Cortauña Gillotina  Unidad	\N	3	24	\N	1	1	1	0.00	0.60	6.98	0.10	0.70	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
138	8010690056661	Alicate P/Uña M  Unidad	\N	3	24	\N	1	1	1	6.79	0.60	10.86	0.15	1.63	Admin	2022-12-09	\N	1	6.79	\N	1	1	0.13	1	\N	\N	\N
139	8010690122946	Goodbite Chicken Xs  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	2.86	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
140	8010690122953	Goodbite Beef Xs  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	3.06	0.10	0.31	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
141	8010690122977	Goodbite Ham Xs  Unidad	\N	4	22	\N	1	1	1	0.00	0.60	3.06	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
142	8010690122991	Goodbite Lamb Xs  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	2.86	0.10	0.29	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
143	8010690123004	Goodbite Chicken S  Unidad	\N	4	22	\N	1	1	1	0.00	0.60	3.42	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
144	8010690123011	Goodbite Beef S  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	3.42	0.10	0.34	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
145	8010690123035	Goodbite Ham S  Unidad	\N	4	22	\N	1	1	1	0.00	0.60	3.02	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
146	8010690123059	Goodbite Salmon Sº  Unidad	\N	2	22	\N	0	0	1	0.00	0.60	3.42	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
147	8010690123066	Goodbite Chicken M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.78	0.10	0.48	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
148	8010690123073	Goodbite Beef M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.78	0.10	0.48	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
149	8010690123110	Goodbite Salmon M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.45	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
150	8010690123141	Goodbite Chicken S  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	3.73	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
151	8010690123158	Goodbite Beef S  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	3.73	0.35	1.30	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
152	8010690123172	Goodbite Ham S  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	3.47	0.10	0.35	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
153	8010690123196	Goodbite Salmon S  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	3.70	0.10	0.37	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
154	8010690123202	Goodbite Chicken M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.11	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
155	8010690123219	Goodbite Beef M  Unidad	\N	3	22	\N	1	1	1	2.78	0.60	4.45	0.10	0.45	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
156	8010690123233	Goodbite Ham M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.45	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
157	8010690123257	Goodbite Salmon M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.45	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
158	73000101	Hueso Masticabl Peti  Unidad	\N	5	22	\N	1	1	1	0.00	0.60	4.06	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
159	73033333	Hueso Masticable 3Pk  Unidad	\N	5	22	\N	1	1	1	0.00	0.60	12.54	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
160	18214816218	Hueso Tocino Petite  Unidad	\N	5	22	\N	1	1	1	0.00	0.60	4.00	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
161	847922075613	Toallas Limpiadoras  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	4.00	0.10	0.40	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
162	8886467546327	Cuerda Dental S  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	3.63	0.10	0.36	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
163	8886467546341	Cuerda Dental L  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	6.33	0.00	0.00	Admin	2022-12-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
164	8010690123097	Goodbite Ham M  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.78	0.00	0.00	Admin	\N	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
165	8886467510229	Plato Acero C750 ml  Unidad	\N	2	35	\N	1	1	1	3.95	0.60	5.82	0.10	0.58	Admin	2022-12-10	\N	1	3.95	\N	1	1	0.13	1	\N	\N	\N
166	8886467510236	Plato Acero C 1750 ml  Unidad	\N	2	35	\N	1	1	1	5.45	0.60	8.10	0.00	0.00	Admin	2022-12-10	\N	1	5.45	\N	1	1	0.13	1	\N	\N	\N
167	8886467510250	Plato Blanco M  Unidad	\N	2	35	\N	1	1	1	0.00	0.60	4.40	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
168	8886467510267	Plato Blanco L  Unidad	\N	2	35	\N	1	1	1	0.00	0.60	5.86	0.15	0.88	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
169	8886467510281	Plato Silicon S  Unidad	\N	2	35	\N	1	1	1	2.87	0.60	4.51	0.10	0.45	Admin	2022-12-10	\N	1	2.87	\N	1	1	0.13	1	\N	\N	\N
170	8886467510311	Plato Melanie S  Unidad	\N	2	35	\N	1	1	1	3.68	0.60	5.57	0.10	0.56	Admin	2022-12-10	\N	1	3.68	\N	1	1	0.13	1	\N	\N	\N
171	8886467510328	Plato Melanie M  Unidad	\N	2	35	\N	1	1	1	5.15	0.60	8.24	0.15	1.24	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
172	8886467510335	Plato Melanie L  Unidad	\N	2	35	\N	1	1	1	7.18	0.60	11.76	0.00	0.00	Admin	2022-12-10	\N	1	7.18	\N	1	1	0.13	1	\N	\N	\N
173	8886467510410	Plato Flores 300 ml  Unidad	\N	2	35	\N	1	1	1	1.17	0.60	1.87	0.10	0.19	Admin	2022-12-10	\N	1	1.17	\N	1	1	0.13	1	\N	\N	\N
174	8886467510427	Plato Flor 700 ml  Unidad	\N	2	35	\N	1	1	1	2.15	0.60	3.44	0.10	0.34	Admin	2022-12-10	\N	1	2.15	\N	1	1	0.13	1	\N	\N	\N
175	8886467510434	Plato Flores 1250 ml  Unidad	\N	2	35	\N	1	1	1	2.56	0.60	4.10	0.10	0.41	Admin	2022-12-10	\N	1	2.56	\N	1	1	0.13	1	\N	\N	\N
176	8886467510441	Plato Antidesliza S  Unidad	\N	2	35	\N	1	1	1	0.00	0.60	2.83	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
177	8886467510458	Plato Antidesliza M  Unidad	\N	2	35	\N	1	1	1	0.00	0.60	3.81	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
178	8886467510465	Plato Antidesliza L  Unidad	\N	2	35	\N	1	1	1	0.00	0.60	4.54	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
179	8886467510588	Dispensa.Agua-Comida  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	16.86	0.15	2.53	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
180	8886467510724	Dispensador Comida  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	8.70	0.15	1.31	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
181	8886467510830	Bebedero P-Botella  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	5.33	0.15	0.80	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
182	8886467514210	Clicker Entrenamient  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	2.77	0.10	0.28	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
183	8886467514401	Carpeta Entrena 100p  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	24.08	0.10	2.41	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
184	8886467514418	Carpeta Entrena 14Pk  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	6.00	0.10	0.60	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
185	8886467514425	Carpeta Entrena 50Pk  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	21.60	0.10	2.16	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
186	8886467514470	Pad Entrenamiento M  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	20.13	0.15	3.02	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
187	8886467514487	Grama Entrenamiento  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	37.33	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
188	8886467514494	Grama Verde Replace  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	14.93	0.15	2.24	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
189	8886467514579	Alicate P-Uña L  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	10.14	0.15	1.52	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
190	8886467514616	Cepillo S  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.66	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
191	8886467514623	Cepillo Suave Perro  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.88	0.15	0.73	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
192	8886467514630	Cepillo Pin 23.5X6.5  Unidad	\N	2	24	\N	1	1	1	3.15	0.60	5.04	0.10	0.50	Admin	2022-12-10	\N	1	3.15	\N	1	1	0.13	1	\N	\N	\N
193	8886467514647	Cepillo Combinado  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	7.54	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
194	8886467514654	Peine 21X3.5Cm  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.37	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
195	8886467514661	Rastrillo S 15X7.5 cm  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.88	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
196	8886467514678	Rastrillo L 15X11 cm  Unidad	\N	2	24	\N	1	1	1	3.85	0.60	6.16	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
197	8886467514463	Pad Entrenamiento S	\N	2	24	\N	1	1	1	0.00	0.60	11.36	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
198	8886467514685	Alicate P/Uña 15 cm  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	6.00	0.00	0.00	Admin	2022-12-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
199	8886467514692	Cepillo de Palma  Unidad	\N	2	24	\N	1	1	1	2.36	0.60	3.54	0.15	0.53	Admin	2022-12-12	\N	1	2.36	\N	1	1	0.13	1	\N	\N	\N
200	8886467514715	Peine 21 Pins  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	5.01	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
201	8886467514739	Peine 31 Pins  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	5.55	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
202	8886467514746	Peine 77 Pins  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	5.94	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
203	8886467514760	Peine Slicker M  Unidad	\N	2	24	\N	\N	1	1	0.00	0.60	8.48	0.10	0.85	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
204	8886467514814	Grooming Combo Brush  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	6.30	0.15	0.95	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
205	8886467514821	Grooming Combo Brush  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	8.21	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
206	8886467514906	Pinza P-Garrapata  Unidad	\N	2	2	\N	1	1	1	1.03	0.60	1.65	0.00	0.00	Admin	2022-12-12	\N	1	1.03	\N	1	1	0.13	1	\N	\N	\N
207	8886467514920	Guante P- Baño  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	7.81	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
208	8886467515644	Rodillo Quita Pelusa  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	2.88	0.10	0.29	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
209	8886467515811	Poo Bag Agranel  Unidad	\N	2	24	\N	1	1	1	0.39	0.60	0.62	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
210	8886467515866	Bolsa P-Desechos  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	5.71	0.15	0.86	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
211	8886467515897	Dispensador Bolsa  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	5.22	0.10	0.52	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
212	8886467515927	Dispensador Bolsa  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	2.99	0.10	0.30	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
213	8886467515934	Pala Mecan. Negra  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	13.18	0.15	1.98	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
214	8886467515965	Bolsa P-Desechos  Unidad	\N	2	24	\N	1	1	1	1.31	0.60	2.10	0.10	0.21	Admin	2022-12-12	\N	1	1.31	\N	1	1	0.13	1	\N	\N	\N
215	8886467520112	Arnés Seguridad XS  Unidad	\N	2	23	\N	1	1	1	9.70	0.60	14.64	0.15	2.20	Admin	2022-12-12	\N	1	9.70	\N	1	1	0.13	1	\N	\N	\N
216	8886467520129	Arnés Seguridad S  Unidad	\N	2	23	\N	1	1	1	10.22	0.60	15.18	0.15	2.28	Admin	2022-12-12	\N	1	10.22	\N	1	1	0.13	1	\N	\N	\N
217	8886467520136	Arnés Seguridad M  Unidad	\N	2	23	\N	1	1	1	9.70	0.60	15.52	0.15	2.33	Admin	2022-12-12	\N	1	9.70	\N	1	1	0.13	1	\N	\N	\N
218	8886467520143	Arnés Seguridad L  Unidad	\N	2	23	\N	1	1	1	10.26	0.60	15.94	0.10	1.59	Admin	2022-12-12	\N	1	10.26	\N	1	1	0.13	1	\N	\N	\N
219	8886467520150	Arnés Seguridad XL  Unidad	\N	2	23	\N	1	1	1	10.10	0.60	16.16	0.15	2.42	Admin	2022-12-12	\N	1	10.10	\N	1	1	0.13	1	\N	\N	\N
220	8886467523212	Cama Cuadrada 19 Café  Unidad	\N	2	25	\N	1	1	1	8.42	0.60	13.47	0.15	2.02	Admin	2022-12-12	\N	1	8.42	\N	1	1	0.13	1	\N	\N	\N
221	8886467523229	Cama Cuadrada 19 Vino  Unidad	\N	2	25	\N	1	1	1	7.79	0.60	12.46	0.15	1.87	Admin	2022-12-12	\N	1	7.79	\N	1	1	0.13	1	\N	\N	\N
222	8886467523236	Cama Cuadrada 19 Azul  Unidad	\N	2	25	\N	1	1	1	7.79	0.60	12.46	0.15	1.87	Admin	2022-12-12	\N	1	7.79	\N	1	1	0.13	1	\N	\N	\N
223	8886467523243	Cama Cuadrada 22 Café  Unidad	\N	2	25	\N	1	1	1	9.59	0.60	15.34	0.15	2.30	Admin	2022-12-12	\N	1	9.59	\N	1	1	0.13	1	\N	\N	\N
224	8886467523250	Cama Cuadrada 22 Vino  Unidad	\N	2	25	\N	1	1	1	9.59	0.60	15.34	0.15	2.30	Admin	2022-12-12	\N	1	9.59	\N	1	1	0.13	1	\N	\N	\N
225	8886467523267	Cama Cuadrada 22 Azul  Unidad	\N	2	25	\N	1	1	1	9.59	0.60	15.34	0.15	2.30	Admin	2022-12-12	\N	1	9.59	\N	1	1	0.13	1	\N	\N	\N
226	8886467523274	Cama Cuadrada 25 Café  Unidad	\N	2	25	\N	1	1	1	12.78	0.60	20.46	0.15	3.07	Admin	2022-12-12	\N	1	12.78	\N	1	1	0.13	1	\N	\N	\N
227	8886467523311	Cama Cuadrada 25 Vino  Unidad	\N	2	25	\N	1	1	1	7.23	0.60	11.57	0.15	1.74	Admin	2022-12-12	\N	1	7.23	\N	1	1	0.13	1	\N	\N	\N
228	8886467523298	Cama Cuadrada 25 Azul  Unidad	\N	2	25	\N	1	1	1	12.36	0.60	19.78	0.15	2.97	Admin	2022-12-12	\N	1	12.36	\N	1	1	0.13	1	\N	\N	\N
229	8886467523328	Cama Redonda 16 Roja  Unidad	\N	2	25	\N	1	1	1	7.23	0.60	11.57	0.15	1.74	Admin	2022-12-12	\N	1	7.23	\N	1	1	0.13	1	\N	\N	\N
230	8886467523335	Cama Redonda 16 Azul  Unidad	\N	2	25	\N	1	1	1	7.23	0.60	11.57	0.15	1.74	Admin	2022-12-12	\N	1	7.23	\N	1	1	0.13	1	\N	\N	\N
231	8886467523342	Cama Redonda 22 Verde  Unidad	\N	2	25	\N	1	1	1	9.08	0.60	14.53	0.15	2.18	Admin	2022-12-12	\N	1	9.08	\N	1	1	0.13	1	\N	\N	\N
232	8886467523359	Cama Redonda 22 Roja  Unidad	\N	2	25	\N	1	1	1	9.61	0.60	15.38	0.15	2.31	Admin	2022-12-12	\N	1	9.61	\N	1	1	0.13	1	\N	\N	\N
233	8886467523366	Cama Redonda 22 Azul  Unidad	\N	2	25	\N	1	1	1	9.61	0.60	15.38	0.15	2.31	Admin	2022-12-12	\N	1	9.61	\N	1	1	0.13	1	\N	\N	\N
234	8886467523373	Cama Redonda 25 Verde  Unidad	\N	2	25	\N	1	1	1	12.92	0.60	20.67	0.15	3.10	Admin	2022-12-12	\N	1	12.92	\N	1	1	0.13	1	\N	\N	\N
235	8886467523380	Cama Redonda 25 Roja  Unidad	\N	2	25	\N	1	1	1	12.72	0.60	19.15	0.15	2.87	Admin	2022-12-12	\N	1	12.72	\N	1	1	0.13	1	\N	\N	\N
236	8886467523397	Cama Redonda 25 Azul  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	19.15	0.10	1.92	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
237	8886467523410	Cama Pillow 22 Verde  Unidad	\N	2	25	\N	1	1	1	9.43	0.60	15.09	0.15	2.26	Admin	2022-12-12	\N	1	9.43	\N	1	1	0.13	1	\N	\N	\N
238	8886467523427	Cama Redonda 25 Azul  Unidad	\N	2	25	\N	1	1	1	10.83	0.60	17.33	0.15	2.60	Admin	2022-12-12	\N	1	10.83	\N	1	1	0.13	1	\N	\N	\N
239	8886467523434	Cama Pillow 22 Azul  Unidad	\N	2	25	\N	1	1	1	9.43	0.60	15.09	0.15	2.26	Admin	2022-12-12	\N	1	9.43	\N	1	1	0.13	1	\N	\N	\N
240	8886467523441	Cama Pillow 27 Verde  Unidad	\N	2	25	\N	1	1	1	11.15	0.60	17.84	0.15	2.68	Admin	2022-12-12	\N	1	11.15	\N	1	1	0.13	1	\N	\N	\N
241	8886467523458	Cama Pillow 27 Rojo  Unidad	\N	2	25	\N	1	1	1	11.88	0.60	19.01	0.15	2.85	Admin	2022-12-12	\N	1	11.88	\N	1	1	0.13	1	\N	\N	\N
242	8886467523465	Cama Pillow 27 Azul  Unidad	\N	2	25	\N	1	1	1	12.79	0.60	20.46	0.15	3.07	Admin	2022-12-12	\N	1	12.79	\N	1	1	0.13	1	\N	\N	\N
243	8886467523472	Cama Pillow 31 Verde  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	25.12	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
244	8886467523489	Cama Pillow 31 Roja  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	25.12	0.15	3.77	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
245	8886467523496	Cama Pillow 31 Azul  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	23.30	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
246	8886467523625	Cama Deluxe S  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	19.63	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
247	8886467523632	Cama Deluxe M  Unidad	\N	2	25	\N	1	1	1	16.10	0.60	25.76	0.15	3.86	Admin	2022-12-12	\N	1	16.10	\N	1	1	0.13	1	\N	\N	\N
248	8886467523649	Cama Deluxe L  Unidad	\N	2	25	\N	1	1	1	20.34	0.60	32.54	0.15	4.88	Admin	2022-12-12	\N	1	20.34	\N	1	1	0.13	1	\N	\N	\N
249	8886467525018	Bolsa De Viaje S  Unidad	\N	2	2	\N	1	1	1	27.85	0.60	39.57	0.15	5.94	Admin	2022-12-12	\N	1	27.85	\N	1	1	0.13	1	\N	\N	\N
250	8886467525049	Bolso De Viaje L  Unidad	\N	2	2	\N	1	1	1	31.59	0.60	48.00	0.15	7.20	Admin	2022-12-12	\N	1	31.59	\N	1	1	0.13	1	\N	\N	\N
251	8886467525117	Cobertor De Viaje  Unidad	\N	2	2	\N	1	1	1	15.70	0.60	25.12	0.15	3.77	Admin	2022-12-12	\N	1	15.70	\N	1	1	0.13	1	\N	\N	\N
252	8886467525124	Cobertor de Asiento  Unidad	\N	2	2	\N	1	1	1	11.80	0.60	18.99	0.15	2.85	Admin	2022-12-12	\N	1	11.80	\N	1	1	0.13	1	\N	\N	\N
253	8886467525322	Jaula 78X48X55 cm  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	72.50	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
254	8886467525339	Jaula 92X57X63 cm  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	90.45	0.15	13.57	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
255	8886467525346	Jaula 107.5X71.5X79 cm  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	118.75	0.15	17.81	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
256	8886467525353	Jaula 122X76X84 cm  Unidad	\N	2	32	\N	1	1	1	90.98	0.60	147.68	0.10	14.77	Admin	2022-12-12	\N	1	90.98	\N	1	1	0.13	1	\N	\N	\N
257	8886467525711	Kennel Travel Verde  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	26.05	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
258	8886467525735	Kennel Travel Rosa  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	26.05	0.10	2.60	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
259	8886467525742	Kennel Travel Green  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	32.93	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
260	8886467525759	Kennel Travel Naranja  Unidad	\N	2	32	\N	1	1	1	0.00	0.60	32.93	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
261	8886467529719	Pañal Desechable S  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	5.66	0.10	0.57	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
262	8886467529726	Pañal Desechable M  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	6.98	0.15	1.05	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
263	8886467529733	Pañal Desechable L  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	7.90	0.15	1.19	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
264	8886467529740	Pañal Desechable XL  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	8.10	0.10	0.81	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
265	8886467530067	Collar Inflable S  Unidad	\N	2	31	\N	1	1	1	0.00	0.60	13.97	0.15	2.10	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
266	8886467530128	Bosal Ajustable S  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.09	0.10	0.31	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
267	8886467530135	Bosal Ajustable M  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.39	0.15	0.51	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
268	8886467530142	Bosal Ajustable L  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.50	0.10	0.35	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
269	8886467530159	Bosal Ajustable XL  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.58	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
270	8886467530302	Pañal Reusable XS  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	3.81	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
271	8886467530319	Pañal Reusable S  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	3.70	0.10	0.37	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
272	8886467530326	Pañal Reusable M  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.29	0.15	0.64	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
273	8886467530333	Pañal Reusable L  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.18	0.10	0.42	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
274	8886467530340	Pañal Reusable XL  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	4.51	0.15	0.68	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
275	8886467530364	Toalla Sanitaria S  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	2.08	0.10	0.21	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
276	8886467530371	Toalla Sanitaria M  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	2.02	0.15	0.30	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
277	8886467530388	Toalla Sanitaria L  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	2.10	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
278	8886467530500	Cinturon de Seguridad  Unidad	\N	2	2	\N	1	1	1	3.33	0.60	5.33	0.15	0.80	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
279	8886467531019	Correa Retractil 3 m  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	9.89	0.10	0.99	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
280	8886467531026	Correa Retractil 4 m  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	11.49	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
281	8886467531033	Correa Retractil 5 m  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	14.00	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
282	8886467531040	Correa Retractil 5 m  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	16.75	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
283	8886467532115	Collar Azul XS  Unidad	\N	2	23	\N	1	1	1	1.61	0.60	2.46	0.15	0.37	Admin	2022-12-12	\N	1	1.61	\N	1	1	0.13	1	\N	\N	\N
284	8886467532139	Collar Azul M  Unidad	\N	2	23	\N	1	1	1	2.68	0.60	4.29	0.15	0.64	Admin	2022-12-12	\N	1	2.68	\N	1	1	0.13	1	\N	\N	\N
285	8886467532160	Correa Azul S  Unidad	\N	2	23	\N	1	1	1	3.89	0.60	6.22	0.10	0.62	Admin	2022-12-12	\N	1	3.89	\N	1	1	0.13	1	\N	\N	\N
286	8886467532177	Correa Azul M  Unidad	\N	2	23	\N	1	1	1	4.53	0.60	7.25	0.00	0.00	Admin	2022-12-12	\N	1	4.53	\N	1	1	0.13	1	\N	\N	\N
287	8886467532214	Collar Rojo XS  Unidad	\N	2	23	\N	1	1	1	1.54	0.60	2.46	0.15	0.37	Admin	2022-12-12	\N	1	1.54	\N	1	1	0.13	1	\N	\N	\N
288	8886467532221	Collar Rojo S  Unidad	\N	2	23	\N	1	1	1	2.05	0.60	3.28	0.10	0.33	Admin	2022-12-12	\N	1	2.05	\N	1	1	0.13	1	\N	\N	\N
289	8886467532238	Collar Rojo M  Unidad	\N	2	23	\N	1	1	1	2.68	0.60	4.29	0.15	0.64	Admin	2022-12-12	\N	1	2.68	\N	1	1	0.13	1	\N	\N	\N
290	8886467532269	Correa Roja S  Unidad	\N	2	23	\N	1	1	1	3.66	0.60	5.86	0.10	0.59	Admin	2022-12-12	\N	1	3.66	\N	1	1	0.13	1	\N	\N	\N
291	8886467532276	Correa Roja M  Unidad	\N	2	23	\N	1	1	1	4.73	0.60	7.57	0.10	0.76	Admin	2022-12-12	\N	1	4.73	\N	1	1	0.13	1	\N	\N	\N
292	8886467532313	Collar Rosado XS  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	2.64	0.15	0.40	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
293	8886467532320	Collar Rosado S  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.54	0.10	0.35	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
294	8886467532337	Collar Rosado M  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	4.59	0.10	0.46	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
295	8886467532368	Correa Rosada S  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	6.46	0.15	0.97	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
296	8886467532375	Correa Rosada M  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	7.57	0.10	0.76	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
297	8886467532412	Collar Refle Rojo S  Unidad	\N	2	23	\N	1	1	1	2.01	0.60	3.22	0.15	0.48	Admin	2022-12-12	\N	1	2.01	\N	1	1	0.13	1	\N	\N	\N
298	8886467532429	Collar Refle Rojo M  Unidad	\N	2	23	\N	1	1	1	2.54	0.60	4.06	0.15	0.61	Admin	2022-12-12	\N	1	2.54	\N	1	1	0.13	1	\N	\N	\N
299	8886467532436	Collar Refle Rojo L  Unidad	\N	2	23	\N	1	1	1	2.82	0.60	4.51	0.15	0.68	Admin	2022-12-12	\N	1	2.82	\N	1	1	0.13	1	\N	\N	\N
300	8886467532450	Correa Refle Roja S  Unidad	\N	2	23	\N	1	1	1	3.33	0.60	5.33	0.10	0.53	Admin	2022-12-12	\N	1	3.33	\N	1	1	0.13	1	\N	\N	\N
301	8886467532467	Correa Refle Roja M  Unidad	\N	2	23	\N	1	1	1	3.62	0.60	5.79	0.10	0.58	Admin	2022-12-12	\N	1	3.62	\N	1	1	0.13	1	\N	\N	\N
302	8886467532474	Correa Refle Roja L  Unidad	\N	2	23	\N	1	1	1	4.78	0.60	7.65	0.10	0.76	Admin	2022-12-12	\N	1	4.78	\N	1	1	0.13	1	\N	\N	\N
303	8886467532511	Collar Refle Azul S  Unidad	\N	2	23	\N	1	1	1	1.98	0.60	3.33	0.10	0.33	Admin	2022-12-12	\N	1	1.98	\N	1	1	0.13	1	\N	\N	\N
304	8886467532528	Collar Refle Azul M  Unidad	\N	2	23	\N	1	1	1	2.54	0.60	4.06	0.10	0.41	Admin	2022-12-12	\N	1	2.54	\N	1	1	0.13	1	\N	\N	\N
305	8886467532535	Collar Refle Azul L  Unidad	\N	2	23	\N	1	1	1	2.85	0.60	4.56	0.15	0.68	Admin	2022-12-12	\N	1	2.85	\N	1	1	0.13	1	\N	\N	\N
306	8886467532559	Correa Refle Azul S  Unidad	\N	2	23	\N	1	1	1	3.12	0.60	4.99	0.10	0.50	Admin	2022-12-12	\N	1	3.12	\N	1	1	0.13	1	\N	\N	\N
307	8886467532566	Correa Refle Azul M  Unidad	\N	2	23	\N	1	1	1	4.17	0.60	6.67	0.10	0.67	Admin	2022-12-12	\N	1	4.17	\N	1	1	0.13	1	\N	\N	\N
308	8886467532573	Correa Refle Azul L  Unidad	\N	2	23	\N	1	1	1	4.36	0.60	6.98	0.10	0.70	Admin	2022-12-12	\N	1	4.36	\N	1	1	0.13	1	\N	\N	\N
309	8886467532634	Collar Refle Verde L  Unidad	\N	2	23	\N	1	1	1	3.34	0.60	5.34	0.15	0.80	Admin	2022-12-12	\N	1	3.34	\N	1	1	0.13	1	\N	\N	\N
310	8886467535222	Arnes Training S  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	8.59	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
311	8886467535239	Arnes Training M  Unidad	\N	2	23	\N	1	1	1	5.27	0.60	8.43	0.15	1.26	Admin	2022-12-12	\N	1	5.27	\N	1	1	0.13	1	\N	\N	\N
312	8886467535246	Arnes Training XS  Unidad	\N	2	23	\N	1	1	1	6.18	0.60	9.89	0.15	1.48	Admin	2022-12-12	\N	1	6.18	\N	1	1	0.13	1	\N	\N	\N
313	8886467535321	Correa Multifuncion M  Unidad	\N	2	23	\N	1	1	1	5.15	0.60	8.24	0.10	0.82	Admin	2022-12-12	\N	1	5.15	\N	1	1	0.13	1	\N	\N	\N
314	8886467535413	Correa Refle Roja S  Unidad	\N	2	23	\N	1	1	1	4.11	0.60	6.58	0.00	0.00	Admin	2022-12-12	\N	1	4.11	\N	1	1	0.13	1	\N	\N	\N
315	8886467535420	Correa Refle Roja L  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	7.62	0.10	0.76	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
316	8886467535437	Correa Refle Negra S  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	7.01	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
317	8886467535536	Correa Reflectiva M  Unidad	\N	2	23	\N	1	1	1	4.34	0.60	6.94	0.10	0.69	Admin	2022-12-12	\N	1	4.34	\N	1	1	0.13	1	\N	\N	\N
318	8886467535543	Correa Reflectiva  Unidad	\N	2	23	\N	1	1	1	4.34	0.60	6.94	0.10	0.69	Admin	2022-12-12	\N	1	4.34	\N	1	1	0.13	1	\N	\N	\N
319	8886467535611	Arnes Comfort Refl XS  Unidad	\N	2	23	\N	1	1	1	6.09	0.60	9.74	0.15	1.46	Admin	2022-12-12	\N	1	6.09	\N	1	1	0.13	1	\N	\N	\N
320	8886467535628	Arnes Comfort Refl S  Unidad	\N	2	23	\N	1	1	1	6.20	0.60	10.48	0.15	1.57	Admin	2022-12-12	\N	1	6.20	\N	1	1	0.13	1	\N	\N	\N
321	8886467535635	Arnes Comfort Refl M  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	10.90	0.10	1.09	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
322	8886467535642	Arnes Comfort Refl L  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	12.21	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
323	8886467541018	Pelota Giggle 2.8  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	2.88	0.15	0.43	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
324	8886467541025	Pelota Giggle 3.5  Unidad	\N	2	22	\N	1	1	1	0.00	0.59	3.76	0.15	0.56	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
325	8886467541032	Pelota Giggle 4.5  Unidad	\N	2	22	\N	1	1	1	4.13	0.61	6.64	0.15	1.00	Admin	2022-12-12	\N	1	4.13	\N	1	1	0.13	1	\N	\N	\N
326	8886467541124	Lengua Divertida  Unidad	\N	2	22	\N	1	1	1	1.95	0.60	2.43	0.00	0.00	Admin	2022-12-12	\N	1	1.95	\N	1	1	0.13	1	\N	\N	\N
327	8886467541148	Pelota Luminus S  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	2.13	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
328	8886467544712	Juguete Chewy S  Unidad	\N	2	22	\N	1	1	1	1.70	0.61	2.74	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
329	8886467545030	Pelota Chillona 2.6  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	3.45	0.10	0.35	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
330	8886467545047	Pelota Chillona 3  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	4.07	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
331	8886467545054	Palito Chillon 18 cm  Unidad	\N	2	22	\N	1	1	1	3.08	0.60	4.93	0.10	0.49	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
332	8886467545061	Palito Chillon 28 cm  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	8.14	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
333	8886467545078	Hueso Chillon 3.9  Unidad	\N	2	22	\N	1	1	1	2.52	0.60	3.85	0.38	1.44	Admin	2022-12-12	\N	1	2.52	\N	1	1	0.13	1	\N	\N	\N
334	8886467545085	Hueso Chillon 4.3  Unidad	\N	2	22	\N	1	1	1	2.98	0.60	4.56	0.10	0.46	Admin	2022-12-12	\N	1	2.98	\N	1	1	0.13	1	\N	\N	\N
335	8886467545399	Hueso Jugueton  Unidad	\N	2	22	\N	1	1	1	3.95	0.60	12.64	0.15	1.90	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
336	8886467545467	Bola/ Cuerda Tpr  Unidad	\N	2	22	\N	1	1	1	3.50	0.60	5.60	0.15	0.84	Admin	2022-12-12	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
337	8886467545702	Palito Doble Lanza  Unidad	\N	2	22	\N	1	1	1	0.00	0.59	5.31	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
338	8886467545719	Pelota Flexible 2.8  Unidad	\N	2	22	\N	1	1	1	0.00	0.59	4.20	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
339	8886467545726	Pelota Flexible 3.5  Unidad	\N	2	22	\N	1	1	1	0.00	0.59	5.53	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
340	8886467546013	Dura Chew Bacon  Unidad	\N	2	29	\N	1	1	1	0.00	0.60	4.06	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
341	8886467546037	Dura Chew Chicken  Unidad	\N	2	29	\N	1	1	1	0.00	0.60	4.06	0.10	0.41	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
342	8886467546044	Dura Chew Chicken L  Unidad	\N	2	29	\N	1	1	1	0.00	0.60	5.15	0.37	1.93	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
343	8886467546198	Mastica Divertido 2  Unidad	\N	2	22	\N	1	1	1	2.45	0.63	3.98	0.15	0.60	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
344	8886467546211	Bola Lanzamiento  Unidad	\N	2	22	\N	1	1	1	3.13	0.60	5.02	0.15	0.75	Admin	2022-12-12	\N	1	3.13	\N	1	1	0.13	1	\N	\N	\N
345	8886467546334	Cuerda Dental M  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	5.00	0.10	0.50	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
346	8886467546617	Anillo Arcoiris S  Unidad	\N	2	22	\N	1	1	1	0.00	0.62	1.99	0.10	0.20	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
347	8886467547546	Pelota Tenis 2.5  Unidad	\N	2	22	\N	1	1	1	0.00	0.62	4.42	0.38	1.66	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
348	8886467548512	Hueso Hilos 2 Nudos  Unidad	\N	2	22	\N	1	1	1	1.60	0.60	2.56	0.10	0.26	Admin	2022-12-12	\N	1	1.60	\N	1	1	0.13	1	\N	\N	\N
349	8886467548536	Hueso Hilos 3 Nudos  Unidad	\N	2	22	\N	1	1	1	2.08	0.62	3.36	0.15	0.50	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
350	8886467548710	Bola De Cuerda Twns  Unidad	\N	2	22	\N	1	1	1	3.30	0.59	5.25	0.15	0.79	Admin	2022-12-12	\N	1	3.30	\N	1	1	0.13	1	\N	\N	\N
351	8886467548772	Soga C/Bola 7.8  Unidad	\N	2	2	\N	1	1	1	0.00	0.59	1.86	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
352	8886467548789	Soga C/Bola 10  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	3.14	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
353	8886467548796	Hueso Trensado  Unidad	\N	2	22	\N	1	1	1	0.91	0.60	1.46	0.10	0.15	Admin	2022-12-12	\N	1	0.91	\N	1	1	0.13	1	\N	\N	\N
354	8886467548826	Hueso Rope W/2 Knots  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	1.23	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
355	8886467548840	Hueso Rope W/2 Knots  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	2.48	0.10	0.25	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
356	8886467548864	Hueso Rope W/2 Knot  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	3.10	0.10	0.31	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
357	8886467548888	Hueso Rope W/2 Knots  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	4.56	0.10	0.46	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
358	8886467548925	Rope Bone W/3 8´´  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	2.21	0.15	0.33	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
359	8886467548932	Rope Bone W/3 13´´  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	4.12	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
360	8886467548949	Rope Bone W/3 18´´  Unidad	\N	2	22	\N	1	1	1	0.00	0.61	8.41	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
361	8886467580000	Arnes/ Correa Kitten  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	6.86	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
362	8886467580017	Arnes/ Correa Basica  Unidad	\N	2	23	\N	1	1	1	4.29	0.63	6.99	0.15	1.05	Admin	2022-12-12	\N	1	4.29	\N	1	1	0.13	1	\N	\N	\N
363	8886467580024	Arnes/Correa Diseño  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	7.47	0.00	0.00	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
364	8886467580062	Collar Negro  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	2.58	0.10	0.26	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
365	8886467580079	Collar Azul  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	2.58	0.15	0.39	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
366	8886467580086	Collar Rosa  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	2.98	0.10	0.30	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
367	8886467580093	Collar Verde  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	2.58	0.15	0.39	Admin	2022-12-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
368	8886467580109	Collar Ripple Blue  Unidad	\N	2	23	\N	1	1	1	1.45	0.60	2.32	0.15	0.35	Admin	2022-12-12	\N	1	1.45	\N	1	1	0.13	1	\N	\N	\N
369	8886467580116	Collar Diamant Rosa  Unidad	\N	2	23	\N	1	1	1	2.57	0.60	4.11	0.15	0.62	Admin	2022-12-12	\N	1	2.57	\N	1	1	0.13	1	\N	\N	\N
370	8886467580147	Collar Lineas Azul  Unidad	\N	2	23	\N	1	1	1	1.56	0.60	2.50	0.15	0.37	Admin	2022-12-12	\N	1	1.56	\N	1	1	0.13	1	\N	\N	\N
371	8886467580161	Collar Corazon Amari  Unidad	\N	2	23	\N	1	1	1	1.49	0.60	2.38	0.15	0.36	Admin	2022-12-12	\N	1	1.49	\N	1	1	0.13	1	\N	\N	\N
372	8886467580178	Collar Espina de Pez  Unidad	\N	2	23	\N	1	1	1	1.98	0.60	3.17	0.15	0.48	Admin	2022-12-13	\N	1	1.98	\N	1	1	0.13	1	\N	\N	\N
373	8886467580185	Collar Butterfly  Unidad	\N	2	23	\N	1	1	1	1.66	0.60	2.66	0.15	0.40	Admin	2022-12-13	\N	1	1.66	\N	1	1	0.13	1	\N	\N	\N
374	8886467580208	Collar Chonga Rosa  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.54	0.10	0.35	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
375	8886467580215	Collar Chonga Rojo  Unidad	\N	2	23	\N	1	1	1	2.21	0.60	3.54	0.15	0.53	Admin	2022-12-13	\N	1	2.21	\N	1	1	0.13	1	\N	\N	\N
376	8886467580222	Collar Chonga Azul  Unidad	\N	2	23	\N	1	1	1	0.00	0.60	3.54	0.10	0.35	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
377	8886467580413	Juguete Laser  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	2.64	0.15	0.40	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
378	8886467582059	Juguetes Gato 4Pk  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	2.92	0.15	0.44	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
379	8886467584954	Rasgador Estrecho  Unidad	\N	2	2	\N	1	1	1	2.25	0.56	3.50	0.15	0.52	Admin	2022-12-13	\N	1	2.25	\N	1	1	0.13	1	\N	\N	\N
380	8886467584961	Rasgador Amplio  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	5.12	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
381	8886467585814	Cama Iglú Café  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	19.71	0.15	2.96	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
382	8886467585913	Cama Iglu Gris  Unidad	\N	2	25	\N	1	1	1	0.00	0.60	19.71	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
383	8886467586347	Rascador Mutitarima  Unidad	\N	2	2	\N	1	1	1	0.00	0.60	133.12	0.15	19.97	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
384	8886467589010	Pala P /Arena  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	1.04	0.15	0.16	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
385	8886467589317	Arenero Bandeja L  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	13.66	0.15	2.05	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
386	8886467589478	Kit Cajap/Arena Azul  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	13.33	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
387	8886467589485	Kit Cajap/Arena  Rosada  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	13.33	0.15	2.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
388	73008199IO	Kennel Neon 20  Unidad	\N	3	32	\N	1	1	1	0.00	0.60	36.48	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
389	8010690061696	Kennel Atlas 30 EL  Unidad	\N	3	32	\N	1	1	1	28.79	0.60	46.06	0.00	0.00	Admin	2022-12-13	\N	1	28.79	\N	1	1	0.13	1	\N	\N	\N
390	3182550731355	Satiety Weight Management  Bolsa 1.5 kg	\N	6	1	\N	1	1	1	16.46	0.31	21.56	0.10	2.16	Admin	2022-12-13	\N	1	16.46	\N	1	1	0.13	1	\N	\N	\N
391	3182550831086	Satiety Weight Management  Bolsa 6 kg	\N	6	1	\N	1	1	1	0.00	0.28	74.24	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
392	9003579000519	Renal With Fish  Sobre 85 gr	\N	6	37	\N	12	1	1	1.75	0.34	1.76	0.10	0.18	Admin	2022-12-13	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
393	3182550711142	Renal Gato  Bolsa 2 kg	\N	6	1	\N	1	1	1	25.75	0.28	32.96	0.50	16.48	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
394	3182550710923	Hypoallergenic Perro  Bolsa 2 kg	\N	6	1	\N	1	1	1	27.86	0.30	34.47	0.10	3.45	Admin	2022-12-13	\N	1	27.86	\N	1	1	0.13	1	\N	\N	\N
395	3182550711333	Hypoallergenic Perro  Bolsa 7 kg	\N	6	1	\N	1	1	1	0.00	0.28	92.16	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
396	3182550771054	Gastrointestinal Perro  Bolsa 2 kg	\N	6	1	\N	1	1	1	18.00	0.27	31.10	0.10	3.11	Admin	2022-12-13	\N	1	23.75	\N	1	1	0.13	1	\N	\N	\N
397	3182550771061	Gastrointestinal Perro  Sobre 7.5 kg	\N	6	37	\N	1	1	1	0.00	0.28	90.88	0.00	0.00	Admin	2022-12-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
398	3182550771719	Hepatic Perro  Bolsa 1.5 kg	\N	6	1	\N	1	1	1	18.36	0.30	23.00	0.10	2.30	Admin	2022-12-13	\N	1	18.36	\N	1	1	0.13	1	\N	\N	\N
399	3182550771733	Hepatic Perro  Bolsa 6 kg	\N	6	1	\N	1	1	1	56.19	0.28	71.92	0.10	7.19	Admin	2022-12-13	\N	1	56.19	\N	1	1	0.13	1	\N	\N	\N
400	9003579309469	Hepatic Perro  Lata 420 gr	\N	6	30	\N	1	1	1	4.12	0.34	5.36	0.10	0.54	Admin	2022-12-13	\N	1	4.12	unidad $4.25, Caja de 12 Unidades $4.00	1	1	0.13	1	\N	\N	\N
401	3182550402149	Maxi Puppy Adult Weight 26-44 kg  Bolsa 4 kg	\N	6	1	\N	1	1	1	27.95	0.27	34.29	0.10	3.43	Admin	2022-12-13	\N	1	27.95	\N	1	1	0.13	1	\N	\N	\N
402	3182550732055	Maxi Puppy Adult Weight 26-44 kg  Bolsa 15 kg	\N	6	1	\N	1	1	1	83.43	0.28	98.56	0.10	9.86	Admin	2022-12-13	\N	1	83.43	\N	1	1	0.13	1	\N	\N	\N
403	3182550778671	Mini Starter Adult  10 kg  Bolsa 3 kg	\N	6	1	\N	1	1	1	30.00	0.27	38.10	0.10	3.81	Admin	2022-12-13	\N	1	30.00	\N	1	1	0.13	1	\N	\N	\N
404	9003579310632	Urinary S/O Perro  Lata 410 gr	\N	6	30	\N	1	1	1	6.98	0.34	5.36	0.10	0.54	Admin	2022-12-13	\N	1	8.00	unidad $4.25, Caja de 12 Unidades $4.00	1	1	0.13	1	\N	\N	\N
405	3182550793001	Mini Puppy Adult Weight 10 kg Perro  Bolsa 2 kg	\N	6	1	\N	1	1	1	16.10	0.27	20.00	0.10	2.00	Admin	2022-12-13	\N	1	16.07	\N	1	1	0.13	1	\N	\N	\N
406	3182550793032	Mini Puppy 2-10 Months Perro  Bolsa 4 kg	\N	6	1	\N	1	1	1	29.53	0.27	37.00	0.10	3.70	Admin	2022-12-13	\N	1	29.00	\N	1	1	0.13	1	\N	\N	\N
407	3182550793049	Mini Puppy 2-10 Months Perro  Bolsa 8 kg	\N	6	1	\N	1	1	1	56.18	0.28	64.00	0.10	6.40	Admin	2022-12-13	\N	1	56.18	\N	1	1	0.13	1	\N	\N	\N
408	3182550402439	Medium Puppy 12 meses	\N	6	1	\N	1	1	1	7.30	0.27	9.27	0.10	0.93	Admin	2022-12-13	\N	1	7.30	\N	1	1	0.13	1	\N	\N	\N
409	3182550708180	Medium Puppy 2-12 Months Perro  Bolsa 4 kg	\N	6	1	\N	1	1	1	28.16	0.27	35.76	0.10	3.58	Admin	2022-12-14	\N	1	28.16	\N	1	1	0.13	1	\N	\N	\N
410	3182550402132	Medium Puppy 2-12 Months Perro  Bolsa 15 kg	\N	6	1	\N	1	1	1	75.00	0.30	97.50	0.10	9.75	Admin	2022-12-14	\N	1	75.00	\N	1	1	0.13	1	\N	\N	\N
411	3182550708197	Medium Adult Perro  Bolsa 4 kg	\N	6	1	\N	1	1	1	25.71	0.33	31.53	0.50	15.77	Admin	2022-12-14	\N	1	25.71	\N	1	1	0.13	1	\N	\N	\N
412	3182550708203	Medium Adult 7+  Bolsa 4 kg	\N	6	1	\N	1	1	1	23.75	0.31	32.00	0.10	3.20	Admin	2022-12-14	\N	1	23.75	\N	1	1	0.13	1	\N	\N	\N
413	3182550402224	Maxi Adult Perro  Bolsa 4 kg	\N	6	1	\N	1	1	1	25.99	0.28	31.36	0.05	1.57	Admin	2022-12-14	\N	1	25.99	\N	1	1	0.13	1	\N	\N	\N
414	3182550711036	Urinary S/O Perro  Bolsa 2 kg	\N	6	1	\N	1	1	1	22.25	0.27	29.00	0.10	2.90	Admin	2022-12-14	\N	1	22.25	\N	1	1	0.13	1	\N	\N	\N
415	3182550717687	Urinary S/O Perro  Bolsa 7.5 Kg	\N	6	1	\N	1	1	1	64.86	0.26	79.00	0.10	7.90	Admin	2022-12-14	\N	1	64.86	\N	1	1	0.13	1	\N	\N	\N
416	208400	Babydog Milk 0-2 Months  400 gr	\N	6	1	\N	1	1	1	0.00	0.69	35.49	0.10	3.55	Admin	2022-12-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
417	3182550710992	Renal Perro  Bolsa 2 kg	\N	6	1	\N	1	1	1	24.56	0.26	28.98	0.10	2.90	Admin	2022-12-14	\N	1	24.56	\N	1	1	0.13	1	\N	\N	\N
418	3182550711395	Renal Perro  Bolsa 7 kg	\N	6	1	\N	1	1	1	69.45	0.26	87.51	0.00	0.00	Admin	2022-12-14	\N	1	69.45	\N	1	1	0.13	1	\N	\N	\N
419	9003579000748	Renal Perro  Lata 410 gr	\N	6	30	\N	1	1	1	4.00	0.34	5.36	0.10	0.54	Admin	2022-12-14	\N	1	4.00	unidad $4.25, Caja de 12 Unidades $4.00	1	1	0.13	1	\N	\N	\N
420	3182550702201	Regular Fit 32 Gato	\N	6	1	\N	1	1	1	18.50	0.29	22.25	0.10	2.23	Admin	2022-12-14	\N	1	18.50	\N	1	1	0.13	1	\N	\N	\N
421	3182550702225	Regular Fit 23 Gato  Bolsa 4 kg	\N	6	1	\N	1	1	1	33.86	0.29	39.99	0.05	2.00	Admin	2022-12-14	\N	1	33.86	\N	1	1	0.13	1	\N	\N	\N
422	9003579311462	Starter Mother & Babydog 1-2 Months  Lata 195 gr	\N	6	1	\N	1	1	1	2.55	0.40	3.57	0.10	0.36	Admin	2022-12-14	\N	1	2.55	unidad $2.80, Caja de 12 Unidades $2.55	1	1	0.13	1	\N	\N	\N
423	9003579307717	Recovery Gato-Perro  Lata 195 gr	\N	6	30	\N	1	1	1	3.04	0.35	3.98	0.10	0.40	Admin	2022-12-14	\N	1	3.04	unidad $3.15, Caja de 12 Unidades $2.95	1	1	0.13	1	\N	\N	\N
424	9003579308943	Kitten Gato  Sobre 85 gr	\N	6	37	\N	12	1	1	1.70	0.22	2.07	0.10	0.21	Admin	2022-12-14	\N	1	1.70	\N	1	1	0.13	1	\N	\N	\N
425	3182550702423	Kitten Gato  Bolsa 2 kg	\N	6	1	\N	1	1	1	20.79	0.32	25.07	0.05	1.25	Admin	2022-12-14	\N	1	20.79	\N	1	1	0.13	1	\N	\N	\N
426	3182550702447	Kitten Second Age Gato  Bolsa 4 kg	\N	6	1	\N	1	1	1	38.12	0.31	45.20	0.05	2.26	Admin	2022-12-14	\N	1	38.12	\N	1	1	0.13	1	\N	\N	\N
427	3182550831390	Mini Adult 8+  Bolsa 4 kg	\N	6	1	\N	1	1	1	29.43	0.27	34.61	0.10	3.46	Admin	2022-12-14	\N	1	29.43	\N	1	1	0.13	1	\N	\N	\N
428	3182550831383	Mini Adult 8+  Bolsa 2 kg	\N	6	1	\N	1	1	1	15.77	0.27	20.03	0.10	2.00	Admin	2022-12-14	\N	1	15.77	\N	1	1	0.13	1	\N	\N	\N
429	9003579309445	Gastrointestinal Perro  Lata 400 gr	\N	6	30	\N	1	1	1	4.00	0.34	5.36	0.10	0.54	Admin	2022-12-14	\N	1	4.00	unidad $4.25, Caja de 12 Unidades $4.00	1	1	0.13	1	\N	\N	\N
430	3182550778657	Mini Starter 1-2 Months Perro  Bolsa 1 kg	\N	6	1	\N	1	1	1	11.20	0.27	13.78	0.10	1.38	Admin	2022-12-14	\N	1	10.85	\N	1	1	0.13	1	\N	\N	\N
431	3182550743433	Adult Golden Retriever  Bolsa 3 kg	\N	6	1	\N	1	1	1	12.95	0.34	33.50	0.10	3.35	Admin	2022-12-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
432	3182550730587	Adult Miniature Schnauzer  Bolsa 3 kg	\N	6	1	\N	1	1	1	28.83	0.29	36.82	0.10	3.68	Admin	2022-12-14	\N	1	29.11	\N	1	1	0.13	1	\N	\N	\N
433	3182550711050	Urinary S/O Gato  Bolsa 3.5 kg	\N	6	1	\N	1	1	1	38.00	0.29	49.02	0.10	4.90	Admin	2022-12-14	\N	1	38.00	\N	1	1	0.13	1	\N	\N	\N
434	3182550711159	Urinary S/O Gato  Bolsa 1.5 kg	\N	6	1	\N	1	1	1	16.69	0.29	21.53	0.10	2.15	Admin	2022-12-14	\N	1	16.69	\N	1	1	0.13	1	\N	\N	\N
435	9003579311851	Satiety Weight Management Perro  Lata 410 gr	\N	6	30	\N	1	1	1	4.12	0.34	5.36	0.10	0.54	Admin	2022-12-14	\N	1	4.12	unidad $4.25, Caja de 12 Unidades $4.00	1	1	0.13	1	\N	\N	\N
436	1	prueba  unidad	\N	\N	\N	\N	1	1	1	0.00	0.50	0.00	0.00	0.00	Admin	2022-12-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
437	6953182732365	Arnes Hiking Talla S  Unidad	\N	7	23	\N	1	1	1	0.00	0.60	27.21	0.00	0.00	Admin	2022-12-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
438	6953182732372	Arnes Hikng Talla M  Unidad	\N	7	23	\N	1	1	1	0.00	0.60	29.60	0.00	0.00	Admin	2022-12-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
439	6953182732389	Arnes Hiking Talla L  Unidad	\N	7	23	\N	1	1	1	0.00	0.60	31.90	0.37	11.95	Admin	2022-12-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
440	6953182732440	Arnes Hiking Triangular Talla L  Unidad	\N	7	23	\N	1	1	1	18.00	0.60	28.81	0.15	4.32	Admin	2022-12-16	\N	1	18.00	\N	1	1	0.13	1	\N	\N	\N
441	6953182719458	Collar P/Gato Escarchado  Unidad	\N	8	23	\N	1	1	1	2.75	0.59	4.38	0.10	0.44	Admin	2022-12-16	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
442	7416203101520	Collar/Correa de Lazo 12 mm  Unidad	\N	9	23	\N	1	1	1	3.75	0.60	6.02	0.15	0.90	Admin	2022-12-16	\N	1	3.75	\N	1	1	0.13	1	\N	\N	\N
443	7416203101667	Collar/Correa de Lazo 8 mm  Unidad	\N	9	23	\N	1	1	1	2.75	0.59	4.38	0.15	0.66	Admin	2022-12-16	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
444	9003579311004	RC HipoAlergenico  Lata 400g	\N	6	30	\N	1	1	1	4.12	0.34	5.36	0.10	0.54	Admin	2022-12-17	\N	1	4.12	unidad $4.25, Caja de 12 Unidades $4.00	1	1	0.13	1	\N	\N	\N
445	3182550402170	 RC Mini Adulto  Bolsa 2kg	\N	6	1	\N	1	1	1	15.36	0.29	19.84	0.10	1.98	Admin	2022-12-17	\N	1	15.36	\N	1	1	0.13	1	\N	\N	\N
446	3182550775267	RC Club Pro Adulto  Bolsa 20kg	\N	6	1	\N	1	1	1	68.82	0.38	85.00	0.28	23.52	Admin	2022-12-17	\N	1	68.82	\N	1	1	0.13	1	\N	\N	\N
447	3182550727822	RC Mini Adulto  Bolsa 4 kg	\N	6	1	\N	1	1	1	28.17	0.27	35.69	0.10	3.57	Admin	2022-12-17	\N	1	28.04	\N	1	1	0.13	1	\N	\N	\N
448	3182550716888	RC Mini Adulto  Bolsa 8kg	\N	6	1	\N	1	1	1	49.11	0.27	63.95	0.10	6.40	Admin	2022-12-17	\N	1	50.23	\N	1	1	0.13	1	\N	\N	\N
449	3182550716857	RC Yorkshire Adulto  Bolsa 1.5Kg	\N	6	1	\N	1	1	1	17.05	0.40	22.74	0.10	2.27	Admin	2022-12-17	\N	1	17.05	\N	1	1	0.13	1	\N	\N	\N
450	3182550799768	RC Yorkshire Adulto  Bolsa 3Kg	\N	6	1	\N	1	1	1	30.32	0.39	39.82	0.10	3.98	Admin	2022-12-17	\N	1	30.32	\N	1	1	0.13	1	\N	\N	\N
451	3182550716925	RC Yorkshire Adulto  Bolsa 7.5Kg	\N	6	1	\N	1	1	1	56.70	0.39	78.81	0.00	0.00	Admin	2022-12-17	\N	1	56.70	\N	1	1	0.13	1	\N	\N	\N
452	3182550798945	RC Diabetico Canino  Bolsa 1.5Kg	\N	6	1	\N	1	1	1	8.25	0.34	22.00	0.00	0.00	Admin	2022-12-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
453	7707274718060	Pulvican Jabon EP  Barra 90g	\N	10	24	\N	1	1	1	3.69	0.47	5.42	0.00	0.00	Admin	2022-12-17	\N	1	3.69	\N	1	1	0.13	1	\N	\N	\N
454	7707274715014	Brimax Shampoo Antiseptico  Frasco 250ml	\N	10	24	\N	1	1	1	4.37	0.47	6.43	0.10	0.64	Admin	2022-12-17	\N	1	4.37	\N	1	1	0.13	1	\N	\N	\N
455	7707115301222	Bañol EC  Frasco 35ml	\N	10	24	\N	1	1	1	3.00	0.47	4.41	0.10	0.44	Admin	2022-12-17	\N	1	3.00	\N	1	1	0.13	1	\N	\N	\N
456	quino-01	Quinocalf 10%  Gotero 10ml	\N	11	5	\N	1	1	1	4.22	0.47	6.20	0.00	0.00	Admin	2022-12-17	\N	1	4.22	\N	1	1	0.13	1	\N	\N	\N
457	7707115301468	Descensor Vet (Doxiciclina 200mg)  1 de 10 Tabletas	\N	11	5	\N	1	1	1	1.54	0.80	1.73	0.10	0.17	Admin	2022-12-17	\N	1	1.54	\N	1	1	0.13	1	\N	\N	\N
458	7707115301161	Saniderm Crema topica  Tubo 40G	\N	11	5	\N	1	1	1	5.57	0.70	9.47	0.10	0.95	Admin	2022-12-17	\N	1	5.57	\N	1	1	0.13	1	\N	\N	\N
459	7707274717001	Ankofen Gotas  Frasco 10ml	\N	10	5	\N	1	1	1	2.20	0.70	6.41	0.10	0.64	Admin	2022-12-17	\N	1	2.20	\N	1	1	0.13	1	\N	\N	\N
460	7707274714215	Ankofen Tabletas  1 de 10 Tabletas	\N	10	5	\N	10	10	1	0.24	2.11	0.76	0.10	0.08	Admin	2022-12-17	\N	1	0.24	\N	1	1	0.13	1	\N	\N	\N
461	33016	VEC Shampoo Antiparasitario y Antiseborreico  Frasco 500 ml	\N	12	24	\N	1	1	1	11.25	0.35	15.19	0.00	0.00	Admin	2022-12-19	\N	1	11.25	\N	1	1	0.13	1	\N	\N	\N
462	33059	VEC Shampoo Clorhexidina  Frasco 500 ml	\N	12	24	\N	1	1	1	12.79	0.35	17.26	0.00	0.00	Admin	2022-12-19	\N	1	12.79	\N	1	1	0.13	1	\N	\N	\N
463	087219111529	Pet-Tabs Plus  Frasco 60 Tabletas	\N	13	5	\N	1	1	1	16.15	0.45	19.16	0.10	1.92	Admin	2022-12-19	\N	1	16.15	\N	1	1	0.13	1	\N	\N	\N
464	5420043705338	Viyo Fortalece Perro  Caja 7 sobres	\N	14	5	\N	1	1	1	15.28	0.30	13.68	0.10	1.37	Admin	2022-12-19	\N	1	15.28	\N	1	1	0.13	1	\N	\N	\N
465	5420043705345	Viyo Fortalece Gato  Caja 7 sobres	\N	14	5	\N	1	1	1	11.56	1.60	19.87	0.10	1.99	Admin	2022-12-19	\N	1	11.56	\N	1	1	0.13	1	\N	\N	\N
466	5414736047911	Simparica 10 mg  Caja 1 Tableta	\N	13	5	\N	1	1	1	12.21	0.33	16.12	0.15	2.42	Admin	2022-12-19	\N	1	12.12	\N	1	1	0.13	1	\N	\N	\N
467	5414736047928	Simparica 20 mg  Caja 1 Tableta	\N	13	5	\N	1	1	1	14.56	0.33	19.48	0.15	2.92	Admin	2022-12-19	\N	1	14.56	\N	1	1	0.13	1	\N	\N	\N
468	5414736047935	Simparica 40 mg  Caja 1 Tableta	\N	13	5	\N	1	1	1	16.37	0.33	22.96	0.10	2.30	Admin	2022-12-19	\N	1	16.37	\N	1	1	0.13	1	\N	\N	\N
469	5414736047942	Simparica 80 mg  Caja 1 Tableta	\N	13	5	\N	1	1	1	22.32	0.33	28.76	0.10	2.88	Admin	2022-12-19	\N	1	22.11	\N	1	1	0.13	1	\N	\N	\N
470	25026	Rimadyl 25 mg tabletas masticables  1 de 60 Tabletas	\N	13	5	\N	60	60	1	0.71	0.50	1.21	0.10	0.12	Admin	2022-12-19	\N	1	0.71	\N	1	1	0.13	1	\N	\N	\N
471	25027	Rimadyl 100 mg tabletas masticables  1 de 60 Tabletas	\N	13	5	\N	60	60	1	1.77	0.50	2.65	0.10	0.27	Admin	2022-12-19	\N	1	1.77	\N	1	1	0.13	1	\N	\N	\N
472	27003	Clorfe-Vet 8 mg (Clorfeniramina)  1 de 60 Tabletas	\N	12	5	\N	60	60	1	0.14	2.16	0.44	0.10	0.04	Admin	2022-12-19	\N	1	0.14	\N	1	1	0.13	1	\N	\N	\N
473	33015	VEC Shampoo Antifungico y Antiseptico  Frasco 500 ml	\N	12	24	\N	1	1	1	11.90	0.43	17.02	0.10	1.70	Admin	2022-12-19	\N	1	11.90	\N	1	1	0.13	1	\N	\N	\N
474	7416203103371	Collar Reflectivo Talla 10  Unidad	\N	9	23	\N	1	1	1	3.00	0.59	4.78	0.15	0.72	Admin	2022-12-19	\N	1	3.00	\N	1	1	0.13	1	\N	\N	\N
475	7416203103388	Collar Reflectivo Talla 14  Unidad	\N	9	23	\N	1	1	1	3.25	0.61	5.22	0.15	0.78	Admin	2022-12-19	\N	1	3.25	\N	1	1	0.13	1	\N	\N	\N
476	7416203103395	Collar Reflectivo Talla 16  Unidad	\N	9	23	\N	1	1	1	3.50	0.61	5.62	0.15	0.84	Admin	2022-12-19	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
477	7416203103401	Collar Reflectivo Talla 20  Unidad	\N	9	23	\N	1	1	1	3.75	0.60	6.02	0.15	0.90	Admin	2022-12-19	\N	1	3.75	\N	1	1	0.13	1	\N	\N	\N
478	7416203103418	Collar + Correa Premium Talla  8  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	8.81	0.00	0.00	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
479	7416203103326	Collar + Correa Premium Talla 10  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.00	0.00	0.00	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
480	7416203103333	Collar + Correa Premium Talla 12  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.00	0.00	0.00	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
481	7416203103340	Collar + Correa Premium Talla 14  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.00	0.00	0.00	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
482	7416203103425	Collar + Correa Premium Talla 16  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.40	0.00	0.00	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
483	7416203101964	Correa De Lazo   4 X12 mm  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	6.02	0.00	0.00	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
484	7416203101445	Correa de Lazo 4X8 mm  Unidad	\N	9	23	\N	1	1	1	2.75	0.59	4.38	0.10	0.44	Admin	2022-12-19	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
485	7501072207234	Pro Plan Optifit Reduced Calories Gato  Bolsa de 3 Kg	\N	15	1	\N	1	1	1	26.13	0.30	33.97	0.10	3.40	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
486	7501072208248	Pro Plan Optiage 7+ Razas Medianas y Grandes  Bolsa 7.5 Kg	\N	15	1	\N	1	1	1	47.30	0.30	61.64	0.10	6.16	Admin	2022-12-19	\N	1	47.30	\N	1	1	0.13	1	\N	\N	\N
487	7501072210692	Pro Plan Cachorro Raza Pequeña Optistart  Bolsa 3.5 Kg	\N	15	1	\N	1	1	1	23.13	0.30	30.07	0.10	3.01	Admin	2022-12-19	\N	1	23.13	\N	1	1	0.13	1	\N	\N	\N
488	7501072204561	Pro Plan Cachorro Raza Mediana Optistart  Bolsa 3 Kg	\N	15	1	\N	1	1	1	19.84	0.29	25.65	0.10	2.57	Admin	2022-12-19	\N	1	19.84	\N	1	1	0.13	1	\N	\N	\N
489	7501072208293	Pro Plan Adulto Raza Mediana y Grande Reduced Calories Optifit  Bolsa 3 kg	\N	15	1	\N	1	1	1	20.45	0.30	26.59	0.13	3.46	Admin	2022-12-19	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
490	7501072208958	Pro Plan Adulto Raza Pequeña Sensitive Skin Optiderma  Bolsa 3 Kg	\N	15	1	\N	1	1	1	20.45	0.33	27.20	0.10	2.72	Admin	2022-12-19	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
491	7501072206299	Pro Plan Adult Optiprebio Gatos 7+  Bolsa 3 Kg	\N	15	1	\N	1	1	1	23.70	0.30	30.81	0.05	1.54	Admin	2022-12-19	\N	1	23.70	\N	1	1	0.13	1	\N	\N	\N
492	7501072207265	Pro Plan Adult 7+ Optiage Gatos  Bolsa 3 Kg	\N	15	1	\N	1	1	1	8.71	0.30	33.97	0.05	1.70	Admin	2022-12-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
493	7501072207258	Pro Plan Sterilized Gatos Castrados Optirenal  Bolsa 3 Kg	\N	15	1	\N	1	1	1	26.13	0.33	34.64	0.05	1.73	Admin	2022-12-19	\N	1	26.13	\N	1	1	0.13	1	\N	\N	\N
494	017800176262	Dentalife Mini 24 Chews  Bolsa 193 gr	\N	15	1	\N	1	1	1	4.68	0.30	6.11	0.10	0.61	Admin	2022-12-19	\N	1	4.68	\N	1	1	0.13	1	\N	\N	\N
495	017800174220	Dentalife Small/Medium 10 Chews  Bolsa 198 gr	\N	15	1	\N	1	1	1	4.68	0.30	6.08	0.10	0.61	Admin	2022-12-19	\N	1	4.68	\N	1	1	0.13	1	\N	\N	\N
496	017800174152	Dentalife Large 7 Chews  Bolsa 221 gr	\N	15	1	\N	1	1	1	4.87	0.30	6.08	0.10	0.61	Admin	2022-12-19	\N	1	4.68	\N	1	1	0.13	1	\N	\N	\N
497	7501072210623	Pro Plan Adult Raza Pequeña con Spirulina Optihealth  Bolsa 3.5 Kg	\N	15	1	\N	1	1	1	21.89	0.30	28.50	0.10	2.85	Admin	2022-12-19	\N	1	21.89	\N	1	1	0.13	1	\N	\N	\N
498	7501072208781	Pro Plan Raza Mediana Adult con Spirulina Optihealth  Bolsa 3 Kg	\N	15	1	\N	1	1	1	18.77	0.29	24.12	0.10	2.41	Admin	2022-12-19	\N	1	18.77	\N	1	1	0.13	1	\N	\N	\N
499	7501072208231	Pro Plan Raza Mediana y Grande Active Mind Optiage  Bolsa 3 Kg	\N	15	1	\N	1	1	1	20.45	0.30	26.59	0.05	1.33	Admin	2022-12-19	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
500	7501072208279	Pro Plan Raza Pequeña Active Mind Optiage  Bolsa 3 Kg	\N	15	1	\N	1	1	1	11.36	0.30	26.59	0.10	2.66	Admin	2022-12-19	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
501	7502010421132	Endogard 30kg Desparasitacion  1 de 24 Tabletas	\N	16	5	\N	24	24	1	2.75	2.02	6.64	0.10	0.66	Admin	2022-12-19	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
502	7502010421125	Endogard 10 kg Desparasitacion  1 de 24 Tabletas	\N	16	5	\N	24	24	1	1.71	2.89	6.19	0.10	0.62	Admin	2022-12-19	\N	1	1.71	\N	1	1	0.13	1	\N	\N	\N
503	7502010421118	Endogard 2.5 Kg Desparasitacion  1 de 24 Tabletas	\N	16	5	\N	24	24	1	1.06	4.20	5.16	0.10	0.52	Admin	2022-12-19	\N	1	1.06	\N	1	1	0.13	1	\N	\N	\N
504	OMPASTA-01	Overmix Pasta  Jeringa 3 g	\N	17	5	\N	1	1	1	2.97	0.78	5.29	0.10	0.53	Admin	2022-12-19	\N	1	2.97	\N	1	1	0.13	1	\N	\N	\N
505	41006	Vacuna Giardavax  aplicación	\N	13	36	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2022-12-20	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
506	7898049715480	Vacuna Giardavax  Aplicación	\N	13	36	\N	1	1	1	8.05	1.06	12.39	0.20	2.48	Admin	2022-12-20	\N	1	8.05	\N	1	1	0.13	1	\N	\N	\N
507	087219113776	Vacuna Bronchicine  Aplicación	\N	13	36	\N	1	1	1	6.11	1.71	12.39	0.20	2.48	Admin	2022-12-20	\N	1	6.11	\N	1	1	0.13	1	\N	\N	\N
508	087219117439	Leukocell 2 Gatos Vacuna  Aplicación	\N	13	36	\N	1	1	1	0.00	2.01	17.69	0.00	0.00	Admin	2022-12-20	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
509	087219116012	Felocell 3 Vacuna Gatos  Aplicación	\N	13	36	\N	1	1	1	8.84	1.58	15.93	0.20	3.19	Admin	2022-12-20	\N	1	8.84	\N	1	1	0.13	1	\N	\N	\N
510	087219120873	Defensor 1 vacuna Antirrabica  Aplicación	\N	13	36	\N	1	1	1	3.02	1.93	8.85	0.20	1.77	Admin	2022-12-20	\N	1	3.02	\N	1	1	0.13	1	\N	\N	\N
511	41013	Vanguard Plus Parvovirus Vacuna  Aplicación	\N	13	36	\N	1	1	1	3.77	1.88	12.39	0.15	1.86	Admin	2022-12-20	\N	1	3.77	\N	1	1	0.13	1	\N	\N	\N
512	41019	Vanguard Plus Vacuna Quintuple  Aplciacion	\N	13	36	\N	1	1	1	5.19	2.08	15.93	0.15	2.39	Admin	2022-12-20	\N	1	5.19	\N	1	1	0.13	1	\N	\N	\N
513	7502010421187	Canigen MHA Puppy Vacuna  Aplicación	\N	16	36	\N	1	1	1	3.16	4.04	15.93	0.20	3.19	Admin	2022-12-20	\N	1	3.16	\N	1	1	0.13	1	\N	\N	\N
514	7798042364800	Atriben Inyectable  Dosis	\N	18	7	\N	1	1	1	0.39	65.54	5.31	0.10	0.53	Admin	2022-12-21	\N	1	0.39	\N	1	1	0.13	1	\N	\N	\N
515	7707274710316	Ankofen (Ketoprofeno 10%)  Dosis	\N	19	7	\N	1	1	1	0.00	18.13	5.36	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
516	Atropina01	Atropina 1%  Dosis	\N	17	7	\N	1	1	1	0.00	8.97	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
517	7898416700040	Biodex (Dexametasona)  Dosis	\N	20	7	\N	1	1	1	0.24	21.35	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
518	7502262630740	Biodipirona (Metamizol)  Dosis	\N	21	7	\N	1	1	1	0.08	65.29	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
519	7506407400328	Bronquivet NF  Dosis	\N	22	7	\N	1	1	1	0.00	63.13	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
520	7503019166604	Cerenia (Maropitant)  Dosis	\N	13	7	\N	1	1	1	0.00	2.00	11.06	0.10	1.11	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
521	7798156460054	Cefalexina 200  Dosis	\N	17	7	\N	1	1	1	0.71	6.49	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
522	4007221043218	Catosal B12  Dosis	\N	24	7	\N	1	1	1	0.20	25.16	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
523	7506407402216	Calcioaminovit  Dosis	\N	22	7	\N	1	1	1	0.49	9.93	5.31	0.10	0.53	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
524	Dufamox15	Dufamox 15% L.A.  Dosis	\N	25	7	\N	1	1	1	0.00	12.33	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
525	7898597991329	Dectomax  Dosis	\N	13	7	\N	1	1	1	1.00	3.72	6.64	0.10	0.66	Admin	2022-12-21	\N	1	1.00	\N	1	1	0.13	1	\N	\N	\N
526	7730952032677	Dipirona Microsules  Dosis	\N	26	7	\N	1	1	1	0.00	86.91	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
527	7503027959472	Enrofloxacina 10%  Dosis	\N	27	7	\N	1	1	1	0.00	21.14	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
528	7506407402247	Endovet Inyectable  Dosis	\N	22	7	\N	1	1	1	0.50	9.62	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.50	\N	1	1	0.13	1	\N	\N	\N
529	7798156460290	Flumeg Inyectable  Dosis	\N	17	7	\N	1	1	1	0.00	27.36	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
530	7502010423969	Fortius LA (Enrofloxacino)  Dosis	\N	16	7	\N	1	1	1	0.00	20.07	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
531	7798042366231	Floxaday Inyectable  Dosis	\N	18	7	\N	1	1	1	0.00	4.27	6.64	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
532	7506396700645	Hepacom B12  Dosis	\N	28	7	\N	1	1	1	0.00	4.77	6.64	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
533	7798156460498	Lidocaina Over 2 %  Dosis	\N	17	7	\N	1	1	1	0.05	38.33	1.77	0.00	0.00	Admin	2022-12-21	\N	1	0.05	\N	1	1	0.13	1	\N	\N	\N
534	7798156461884	Overxicam Iny  Dosis	\N	17	7	\N	1	1	1	0.41	11.81	5.31	0.92	4.90	Admin	2022-12-21	\N	1	0.41	\N	1	1	0.13	1	\N	\N	\N
535	7798042360185	Pileran Iny  Dosis	\N	18	7	\N	1	1	1	0.00	17.95	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
536	7707115301611	Quercetol Vet  Dosis	\N	11	7	\N	1	1	1	0.00	3.29	6.64	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
537	7502010429701	Shotapen Iny  Dosis	\N	16	7	\N	1	1	1	0.18	28.50	5.31	0.10	0.53	Admin	2022-12-21	\N	1	0.18	\N	1	1	0.13	1	\N	\N	\N
538	7506407402124	Sulfatrim Iny  Dosis	\N	22	7	\N	1	1	1	0.19	26.95	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
539	7798156461051	Triamcinolona Iny  Dosis	\N	17	7	\N	1	1	1	0.28	17.86	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
540	7798042361335	Viviram-V Iny  Dosis	\N	18	7	\N	1	1	1	0.00	5.98	5.31	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
541	7798156462928	Ketoprofeno Over 20 mg  1 de 50 Tabletas	\N	17	5	\N	50	50	1	0.43	2.72	1.59	0.10	0.16	Admin	2022-12-21	\N	1	0.43	\N	1	1	0.13	1	\N	\N	\N
542	OV115	Hidramax Over  Tubo 50 ml	\N	17	5	\N	1	1	1	2.48	1.50	6.19	0.00	0.00	Admin	2022-12-21	\N	1	2.48	\N	1	1	0.13	1	\N	\N	\N
543	7798156463185	Crema dérmica Over  Tubo 200 gr	\N	17	3	\N	1	1	1	6.30	1.11	13.27	0.10	1.33	Admin	2022-12-21	\N	1	6.30	\N	1	1	0.13	1	\N	\N	\N
544	7798156460429	Ketoprofeno Over 5 mg  1 de 50 Tabletas	\N	17	5	\N	50	50	1	0.30	1.98	0.89	0.10	0.09	Admin	2022-12-21	\N	1	0.30	\N	1	1	0.13	1	\N	\N	\N
545	7798156461853	Overxicam suspensión oral  Frasco 10 ml	\N	17	5	\N	1	1	1	5.40	0.64	8.85	0.10	0.88	Admin	2022-12-21	\N	1	5.40	\N	1	1	0.13	1	\N	\N	\N
546	IP001ML	Inmuno PRO Pets  Bolsa 1/2 libra	\N	29	5	\N	1	1	1	4.95	0.79	8.85	0.10	0.88	Admin	2022-12-21	\N	1	4.95	\N	1	1	0.13	1	\N	\N	\N
547	3552793078324	Ferula de Aluminio 5.5 cm  Unidad	\N	\N	5	\N	0	0	1	0.00	0.47	11.80	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
548	3552793078300	Ferula 4.5cm  Unidad	\N	29	5	\N	1	1	1	0.00	0.44	12.94	0.00	0.00	Admin	2022-12-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
549	7416203101902	Plato Reforzado de 2 Depósitos  Unidad	\N	9	35	\N	1	1	1	2.75	0.59	4.38	0.10	0.44	Admin	2022-12-23	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
550	6953182710585	Plato Cuadrado Laberinto 25x25x5.8 cm  Unidad	\N	9	35	\N	1	1	1	0.00	0.60	12.39	0.00	0.00	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
551	P935	Plato Doble Mediano  Unidad	\N	9	35	\N	1	1	1	2.50	0.59	3.98	0.15	0.60	Admin	2022-12-23	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
552	01	prueba  unidad	\N	21	4	\N	1	1	1	1.00	0.25	1.50	0.00	0.00	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
553	7416203100844	Correa Retractable  5 mts  Unidad	\N	9	23	\N	1	1	1	2.61	0.64	4.90	0.10	0.49	Admin	2022-12-23	\N	1	2.61	\N	1	1	0.13	1	\N	\N	\N
554	P924	Plato Doble Grande  Unidad	\N	9	35	\N	1	1	1	2.52	0.63	4.11	0.10	0.41	Admin	2022-12-23	\N	1	2.52	\N	1	1	0.13	1	\N	\N	\N
555	6953182731450	Dispensador de Comida 6 Litros  Unidad	\N	30	2	\N	1	1	1	0.00	0.60	23.94	0.10	2.39	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
556	6953182731481	Dispensador de Agua 6 Litros  Unidad	\N	30	2	\N	1	1	1	0.00	0.60	23.94	0.00	0.00	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
557	HTGC019	Dispensador Agua y Comida  Unidad	\N	9	2	\N	1	1	1	0.00	0.60	15.62	0.10	1.56	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
558	BAEP00	Bosal Americano Extra Pequeño  Unidad	\N	9	23	\N	1	1	1	0.00	0.59	3.58	0.00	0.00	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
559	BAN0	Bosal Americano  #0  Unidad	\N	9	23	\N	1	1	1	2.50	0.59	3.98	0.15	0.60	Admin	2022-12-23	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
560	7416203100264	Bosal Americano #1  Unidad	\N	9	23	\N	1	1	1	2.50	0.59	3.98	0.15	0.60	Admin	2022-12-23	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
561	7416203100271	Bosal Americano #2  Unidad	\N	9	23	\N	1	1	1	2.50	0.59	3.98	0.15	0.60	Admin	2022-12-23	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
562	7416203100288	Bosal Americano  #3  Unidad	\N	9	23	\N	1	1	1	2.75	0.59	4.38	0.15	0.66	Admin	2022-12-23	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
563	7416203100295	Bosal Americano #4  Unidad	\N	9	23	\N	1	1	1	2.75	0.59	4.38	0.15	0.66	Admin	2022-12-23	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
564	7416203100301	Bosal Americano #5  Unidad	\N	9	23	\N	1	1	1	3.00	0.59	4.78	0.15	0.72	Admin	2022-12-23	\N	1	3.00	\N	1	1	0.13	1	\N	\N	\N
565	7416203100318	Bosal Americano 6  Unidad	\N	9	23	\N	1	1	1	3.00	0.59	4.78	0.15	0.72	Admin	2022-12-23	\N	1	3.00	\N	1	1	0.13	1	\N	\N	\N
566	7416203101247	Collar Ahorcador/Metalico # 16"X2.0  Unidad	\N	9	23	\N	1	1	1	1.60	0.60	2.57	0.15	0.38	Admin	2022-12-23	\N	1	1.60	\N	1	1	0.13	1	\N	\N	\N
567	7416203101254	Collar Ahorcador/Metalico #18"X3.0  Unidad	\N	9	23	\N	1	1	1	1.65	0.61	2.65	0.15	0.40	Admin	2022-12-23	\N	1	1.65	\N	1	1	0.13	1	\N	\N	\N
568	CAM2030	Collar Ahorcador/Metalico # 20"X3.0  Unidad	\N	9	23	\N	1	1	1	1.75	0.59	2.79	0.15	0.42	Admin	2022-12-23	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
569	7416203101261	Collar Ahorcador/Metalico #22"X3.5  Unidad	\N	9	23	\N	1	1	1	1.90	0.61	3.05	0.15	0.46	Admin	2022-12-23	\N	1	1.90	\N	1	1	0.13	1	\N	\N	\N
570	CAM2435	Collar Ahorcador / Metalico #24"X3.5  Unidad	\N	9	23	\N	1	1	1	2.00	0.59	3.19	0.15	0.48	Admin	2022-12-23	\N	1	2.00	\N	1	1	0.13	1	\N	\N	\N
571	7416203101278	Collar Ahorcador / Metalico #26"X 3.5  Unidad	\N	9	23	\N	1	1	1	2.10	0.60	3.36	0.15	0.50	Admin	2022-12-23	\N	1	2.10	\N	1	1	0.13	1	\N	\N	\N
572	CAM2840	Collar Ahorcador/Metalico #28"X4.0  Unidad	\N	9	23	\N	1	1	1	2.40	0.60	3.85	0.15	0.58	Admin	2022-12-23	\N	1	2.40	\N	1	1	0.13	1	\N	\N	\N
573	7416203101469	Collar Ahorcador/Metalico #30"X4.5  Unidad	\N	9	23	\N	1	1	1	0.00	0.61	4.34	0.15	0.65	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
574	P518-1	Collar Isabelino 6'-8' #7  Unidad	\N	9	31	\N	1	1	1	0.00	0.61	5.62	0.15	0.84	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
575	P518	Collar Isabelino 8'-10' # 6  Unidad	\N	9	31	\N	1	1	1	0.00	0.30	5.14	0.15	0.77	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
576	P519	Collar Isabelino 10'-12' #5  Unidad	\N	9	31	\N	1	1	1	0.00	0.34	6.63	0.10	0.66	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
577	P520	Collar Isabelino 12'-14' #4  Unidad	\N	9	31	\N	1	1	1	0.00	0.60	8.81	0.15	1.32	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
578	P521	Collar Isabelino 14'-16' #3  Unidad	\N	9	31	\N	1	1	1	0.00	0.60	9.51	0.10	0.95	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
579	P522	Collar Isabelino 16'-18' #2  Unidad	\N	9	31	\N	1	1	1	0.00	0.61	13.72	0.10	1.37	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
580	P523	Collar Isabelino 18'-20' #1  Unidad	\N	9	31	\N	1	1	1	0.00	0.63	14.55	0.15	2.18	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
581	7416203102916	Plato de Acero 16 Onz  Unidad	\N	9	35	\N	1	1	1	0.00	0.60	5.27	0.00	0.00	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
582	7416203102923	Plato de Acero 24 Onz  Unidad	\N	9	35	\N	1	1	1	0.00	0.60	6.15	0.00	0.00	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
583	7416203102930	Plato de Acero 32 Onz  Unidad	\N	9	35	\N	1	1	1	4.40	0.60	7.04	0.10	0.70	Admin	2022-12-23	\N	1	4.40	\N	1	1	0.13	1	\N	\N	\N
584	7416203101209	Sliker Plastico  Unidad	\N	9	2	\N	1	1	1	0.00	0.59	4.38	0.15	0.66	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
585	6953182721161	Double Ended Toothbrush  Unidad	\N	31	2	\N	1	1	1	0.00	0.60	4.73	0.10	0.47	Admin	2022-12-23	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
586	HTB031-2	Cepillo De Dientes P/Mascotas  Unidad	\N	9	24	\N	1	1	1	2.61	0.60	4.19	0.15	0.63	Admin	2022-12-27	\N	1	2.61	\N	1	1	0.13	1	\N	\N	\N
587	6953182709244	Juguete Waldo P/Perro  Unidad	\N	31	22	\N	1	1	1	0.00	0.60	7.74	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
588	784369477115	Juguete Loofa 6"  Unidad	\N	32	22	\N	1	1	1	4.40	0.60	7.04	0.10	0.70	Admin	2022-12-27	\N	1	4.40	\N	1	1	0.13	1	\N	\N	\N
589	784369477122	Juguete Loofa 12"  Unidad	\N	32	22	\N	1	1	1	5.40	0.60	8.63	0.10	0.86	Admin	2022-12-27	\N	1	5.40	\N	1	1	0.13	1	\N	\N	\N
590	7416203101834	Pet Toy Pelota Vinyl C/Puntas  Unidad	\N	9	22	\N	1	1	1	1.50	0.59	2.39	0.10	0.24	Admin	2022-12-27	\N	1	1.50	\N	1	1	0.13	1	\N	\N	\N
591	7416203103692	Pet Toy Pelota Vinyl Perrito  Unidad	\N	9	22	\N	1	1	1	1.75	0.59	2.79	0.10	0.28	Admin	2022-12-27	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
592	7416203103708	Pet Toy Pelota Vinyl C/Dientes  Unidad	\N	9	22	\N	1	1	1	1.75	0.59	2.79	0.10	0.28	Admin	2022-12-27	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
593	7416203103753	Pet Toy Hamburgueza  Unidad	\N	9	22	\N	1	1	1	1.73	0.59	4.38	0.10	0.44	Admin	2022-12-27	\N	1	1.73	\N	1	1	0.13	1	\N	\N	\N
594	7416203103760	Pet Toy Dona Vinyl  Unidad	\N	9	22	\N	1	1	1	1.72	0.59	4.38	0.10	0.44	Admin	2022-12-27	\N	1	1.72	\N	1	1	0.13	1	\N	\N	\N
595	DE013-M	Pet Toy Pato C/Sonido  Unidad	\N	9	22	\N	1	1	1	2.61	0.59	4.16	0.15	0.62	Admin	2022-12-27	\N	1	2.61	\N	1	1	0.13	1	\N	\N	\N
596	5415341001961	Transportador Pirata S  57x38x33 cm  Unidad	\N	31	32	\N	1	1	1	0.00	0.60	57.61	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
597	M610	Transportador M 61x41x39 cm  Unidad	\N	9	32	\N	1	1	1	0.00	0.60	62.39	0.10	6.24	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
598	L1003	Transportador L 66x47x45.8 cm  Unidad	\N	9	32	\N	1	1	1	55.00	0.60	88.01	0.10	8.80	Admin	2022-12-27	\N	1	55.00	\N	1	1	0.13	1	\N	\N	\N
599	7406160004224	Dog Kennel #2D 84x63x63 cm  Unidad	\N	9	32	\N	1	1	1	0.00	0.60	67.21	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
600	7416203101797	Pet Frisbee  Unidad	\N	9	22	\N	1	1	1	0.00	0.59	3.58	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
601	C20-S	Arnes Chaleco + Correa C20-S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.80	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
602	C20-M	Arnes Chaleco + Correa C20-M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.70	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
603	C20-XL	Arnes Chaleco + Correa C20-XL  Unidad	\N	9	23	\N	1	1	1	7.92	0.60	12.39	0.15	1.86	Admin	2022-12-27	\N	1	7.92	\N	1	1	0.13	1	\N	\N	\N
604	C21-S	Arnes Chaleco + Correa C21-S  Unidad	\N	9	23	\N	1	1	1	5.00	0.60	8.01	0.15	1.20	Admin	2022-12-27	\N	1	5.00	\N	1	1	0.13	1	\N	\N	\N
605	C21-M	Arnes Chaleco + Correa C21-M  Unidad	\N	9	23	\N	1	1	1	5.97	0.60	8.41	0.15	1.26	Admin	2022-12-27	\N	1	5.97	\N	1	1	0.13	1	\N	\N	\N
606	C21-L	Arnes Chaleco + Correa C21-L  Unidad	\N	9	23	\N	1	1	1	5.97	0.60	9.56	0.15	1.43	Admin	2022-12-27	\N	1	5.97	\N	1	1	0.13	1	\N	\N	\N
607	C21-XL	Arnes Chaleco + Correa C21-XL  Unidad	\N	9	23	\N	1	1	1	7.92	0.60	9.60	0.15	1.44	Admin	2022-12-27	\N	1	7.92	\N	1	1	0.13	1	\N	\N	\N
608	H2-S	Arnes Ajustable H2- S  Unidad	\N	9	23	\N	1	1	1	4.85	0.60	13.58	0.15	2.04	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
609	H3-S	Arnes Ajustable H3-S  Unidad	\N	9	23	\N	1	1	1	15.00	0.60	20.80	0.15	3.12	Admin	2022-12-27	\N	1	15.00	\N	1	1	0.13	1	\N	\N	\N
610	H3-M	Arnes Ajustable H3-M  Unidad	\N	9	23	\N	1	1	1	15.00	0.60	23.99	0.15	3.60	Admin	2022-12-27	\N	1	15.00	\N	1	1	0.13	1	\N	\N	\N
611	H3-L	Arnes Ajustable H3-L  Unidad	\N	9	23	\N	1	1	1	15.00	0.60	21.99	0.15	3.30	Admin	2022-12-27	\N	1	15.00	\N	1	1	0.13	1	\N	\N	\N
612	H3-XL	Arnes Ajustable H3-XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	22.30	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
613	H4-M	Arnes Comndo H4-M  Unidad	\N	9	23	\N	1	1	1	19.42	0.60	31.15	0.15	4.67	Admin	2022-12-27	\N	1	19.42	\N	1	1	0.13	1	\N	\N	\N
614	H4-L	Arnes Comndo H4-L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	28.72	0.10	2.87	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
615	H4-XL	Arnes Comndo H4-XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	29.60	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
616	7416203101551	Rollos de Carnaza  Unidad	\N	9	2	\N	1	1	1	0.00	0.59	1.90	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
617	7416203101544	Costilla de Carnaza  Unidad	\N	9	29	\N	1	1	1	0.00	0.61	1.77	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
618	7416203102244	Huezo P/Perro  Unidad	\N	9	22	\N	1	1	1	2.75	0.59	4.38	0.10	0.44	Admin	2022-12-27	\N	1	2.75	\N	1	1	0.13	1	\N	\N	\N
619	7416203101438	Pierna de Pollo Carnaza Natural  Unidad	\N	9	29	\N	1	1	1	0.00	0.61	2.65	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
620	7416203102220	Huezo P/Perro 4 Unidades Sabor Ternera  Unidad	\N	9	22	\N	1	1	1	3.50	0.61	5.62	0.10	0.56	Admin	2022-12-27	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
621	7416203102213	Palitos Para Perro Sabor Natural  Unidad	\N	9	22	\N	1	1	1	2.50	0.59	3.98	0.10	0.40	Admin	2022-12-27	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
622	7416203102237	Hueso Para Perro Pequeño 8 Unidades  Unidad	\N	9	22	\N	1	1	1	3.50	0.61	5.62	0.10	0.56	Admin	2022-12-27	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
623	7416203103739	Pet Toy Roca C/Cuerda  Unidad	\N	9	22	\N	1	1	1	0.00	0.59	3.98	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
624	7416203103722	Pet Toy Chuleta Vinyl  Unidad	\N	9	22	\N	1	1	1	1.73	0.64	2.83	0.10	0.28	Admin	2022-12-27	\N	1	1.73	\N	1	1	0.13	1	\N	\N	\N
625	A1014	Pet Toy Estimulante Buho C/Cuerda  Unidad	\N	9	22	\N	1	1	1	2.43	0.60	3.89	0.10	0.39	Admin	2022-12-27	\N	1	2.43	\N	1	1	0.13	1	\N	\N	\N
626	7416203101827	Pet Toy Atomo de colores 6.9 cm  Unidad	\N	9	22	\N	1	1	1	0.00	0.77	3.10	0.10	0.31	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
627	W4UNID	Waffles 4 Unid  Unidad	\N	9	2	\N	1	1	1	0.00	0.61	2.17	0.15	0.33	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
628	BC1050032021	Bocadillo de Carnaza  Unidad	\N	9	29	\N	1	1	1	0.00	0.59	1.99	0.00	0.00	Admin	2022-12-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
629	7798166871895	Cefalong Comprimidos 1000 mg  1 de 80 Tabletas	\N	33	5	\N	80	80	1	0.81	1.72	2.21	0.10	0.22	Admin	2022-12-27	\N	1	0.81	\N	1	1	0.13	1	\N	\N	\N
630	7506343802668	Dermatryl jabón dermatológico  Barra de 100 gr	\N	34	24	\N	1	1	1	4.96	0.43	6.67	0.10	0.67	Admin	2022-12-27	\N	1	4.96	\N	1	1	0.13	1	\N	\N	\N
631	7506343800794	Gentanazol  Spray 60 ml	\N	34	5	\N	1	1	1	7.23	0.31	9.48	0.15	1.42	Admin	2022-12-27	\N	1	7.23	\N	1	1	0.13	1	\N	\N	\N
632	7798166871901	Cefalong Comprimidos 500 mg  1 de 80 Tabletas	\N	33	5	\N	80	80	1	0.43	1.55	1.11	0.00	0.00	Admin	2022-12-27	\N	1	0.43	\N	1	1	0.13	1	\N	\N	\N
633	7798166873165	Spinomax de 18 a 36 kg  Caja 2 Tabletas de 2000 mg	\N	33	5	\N	1	1	1	0.00	0.32	17.70	0.10	1.77	Admin	2022-12-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
634	7798166873134	Spinomax de 2 a 4 kg  Caja de 1 Tableta de 500 mg	\N	33	5	\N	1	1	1	0.00	0.32	11.06	0.10	1.11	Admin	2022-12-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
635	7798166873141	Spinomax 4 a 9 kg  Caja de 1 Tableta 1000 mg	\N	33	5	\N	1	1	1	0.00	0.27	11.95	0.00	0.00	Admin	2022-12-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
636	7798166873158	Spinomax 9 a 18 kg  Caja 1 Tableta 2000 mg	\N	33	5	\N	1	1	1	0.00	0.32	13.27	0.10	1.33	Admin	2022-12-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
637	7798166873172	Spinomax 36 a 70 kg  Caja 4 Tabletas de 2000 mg	\N	33	5	\N	1	1	1	19.34	0.30	25.22	0.23	5.80	Admin	2022-12-28	\N	1	19.34	\N	1	1	0.13	1	\N	\N	\N
638	7404000315615	Lazzio gato pipeta  Envase 0.5 ml	\N	35	33	\N	1	1	1	0.00	0.30	11.06	0.00	0.00	Admin	2022-12-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
639	7404000315622	Lazzio perro pipeta  Envase 0.67 ml	\N	35	33	\N	1	1	1	6.65	0.60	10.62	0.10	1.06	Admin	2022-12-28	\N	1	6.65	\N	1	1	0.13	1	\N	\N	\N
640	7404000315639	Lazzio perro pipeta  Envase 0.67 ml	\N	35	33	\N	1	1	1	7.65	0.62	12.39	0.00	0.00	Admin	2022-12-28	\N	1	7.65	\N	1	1	0.13	1	\N	\N	\N
641	7404000315646	Lazzio perro pipeta  Envase 2.68 ml	\N	35	33	\N	1	1	1	0.00	0.67	14.16	0.00	0.00	Admin	2022-12-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
642	7506343800176	Amoxipet Plus 250 mg  1 de 30 Tabletas	\N	34	5	\N	1	1	1	0.59	0.91	1.05	0.10	0.11	Admin	2022-12-28	\N	1	0.59	\N	1	1	0.13	1	\N	\N	\N
806	22	Baño normal Raza Grande  U	\N	87	18	\N	1	1	1	0.00	9.62	10.62	0.15	1.59	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
643	7506343800190	Amoxipet Plus 500 mg  1 de 14 Tabletas	\N	34	5	\N	1	1	1	1.07	0.65	1.77	0.10	0.18	Admin	2022-12-28	\N	1	1.07	\N	1	1	0.13	1	\N	\N	\N
644	7506343800015	Meloxivet 1 mg  1 de 30 Tabletas	\N	34	5	\N	30	30	1	0.45	0.68	0.84	0.10	0.08	Admin	2022-12-28	\N	1	0.40	\N	1	1	0.13	1	\N	\N	\N
645	7506343800022	Meloxivet 2.5 mg  1 de 30 Tabletas	\N	34	5	\N	30	30	1	0.79	0.67	1.46	0.10	0.15	Admin	2022-12-28	\N	1	0.70	\N	1	1	0.13	1	\N	\N	\N
646	7506343800039	Meloxivet 4 mg  1 de 30 Tabletas	\N	34	5	\N	30	30	1	0.89	0.79	1.77	0.10	0.18	Admin	2022-12-28	\N	1	0.79	\N	1	1	0.13	1	\N	\N	\N
647	7506343801784	Omega Tabs  Frasco 30 Tabletas	\N	34	5	\N	1	1	1	7.05	0.73	13.27	0.15	1.99	Admin	2022-12-28	\N	1	7.05	\N	1	1	0.13	1	\N	\N	\N
648	7506343802798	Clorexivet Plus Shampoo  Envase 350 ml	\N	34	24	\N	1	1	1	10.76	0.32	16.38	0.15	2.46	Admin	2022-12-28	\N	1	10.76	\N	1	1	0.13	1	\N	\N	\N
649	7506343802675	Dermatryl Medicado Shampoo  Envase 350 ml	\N	34	24	\N	1	1	1	12.42	0.36	14.43	0.15	2.16	Admin	2022-12-28	\N	1	12.42	\N	1	1	0.13	1	\N	\N	\N
650	769229124217	Loratadina 10 mg  1 de 100 Tabletas	\N	36	5	\N	100	100	1	0.32	0.90	0.53	0.10	0.05	Admin	2022-12-28	\N	1	0.32	\N	1	1	0.13	1	\N	\N	\N
651	769229001167	Crema Cicatrizante  Tubo 15 gr	\N	36	5	\N	1	1	1	2.76	0.46	4.18	0.15	0.63	Admin	2022-12-28	\N	1	2.76	\N	1	1	0.13	1	\N	\N	\N
652	769229131512	Multivitaminas perros y gatos en crecimiento  Frasco 60 Tabletas	\N	36	5	\N	1	1	1	10.14	0.49	14.16	0.33	4.67	Admin	2022-12-28	\N	1	10.14	\N	1	1	0.13	1	\N	\N	\N
653	769229131413	Multivitaminas perros y gatos adultos  Frasco 60 Tabletas	\N	36	5	\N	1	1	1	11.02	0.54	15.93	0.10	1.59	Admin	2022-12-29	\N	1	11.02	\N	1	1	0.13	1	\N	\N	\N
654	769229131918	Multivitaminas perros y gatos geriátricos  Frasco 60 Tabletas	\N	36	5	\N	1	1	1	13.28	0.47	19.47	0.10	1.95	Admin	2022-12-29	\N	1	13.28	\N	1	1	0.13	1	\N	\N	\N
655	769229049510	Doxiciclina 100 mg  1 de 500 Tabletas	\N	36	5	\N	500	500	1	0.23	2.46	0.80	0.10	0.08	Admin	2022-12-29	\N	1	0.23	\N	1	1	0.13	1	\N	\N	\N
656	769229003741	Limpiador de oídos  Spray 60 ml	\N	36	5	\N	1	1	1	5.06	0.49	7.52	0.10	0.75	Admin	2022-12-29	\N	1	5.06	\N	1	1	0.13	1	\N	\N	\N
657	769229003758	Limpiador bucal  Spray 60 ml	\N	36	5	\N	1	1	1	5.85	0.49	7.52	0.10	0.75	Admin	2022-12-29	\N	1	5.53	\N	1	1	0.13	1	\N	\N	\N
658	769229003611	Meloxicam 2 mg  1 de 100 Tabletas	\N	36	5	\N	100	100	1	0.41	0.69	0.66	0.15	0.10	Admin	2022-12-29	\N	1	0.41	\N	1	1	0.13	1	\N	\N	\N
659	CefaCure	Cefa-Cure 200 mg  1 de 60 Tabletas	\N	37	5	\N	60	60	1	0.79	0.49	1.64	0.10	0.16	Admin	2022-12-29	\N	1	0.79	\N	1	1	0.13	1	\N	\N	\N
660	7501051100037	Asuntol jabón  Barra 100 g	\N	24	24	\N	1	1	1	2.65	0.50	4.84	0.10	0.48	Admin	2022-12-29	\N	1	2.65	\N	1	1	0.13	1	\N	\N	\N
661	7441003121942	Baytril flarour 50 mg  1 de 90 Tabletas	\N	24	5	\N	90	90	1	0.81	0.65	1.33	0.10	0.13	Admin	2022-12-29	\N	1	0.81	\N	1	1	0.13	1	\N	\N	\N
662	7441003121935	Baytril flarour 150 mg  1 de 60 Tabletas	\N	24	5	\N	60	60	1	0.57	0.49	2.21	0.10	0.22	Admin	2022-12-29	\N	1	0.57	\N	1	1	0.13	1	\N	\N	\N
663	769229002430	Albendazol Prazicuantel  Suspensión oral 10 ml	\N	36	5	\N	1	1	1	3.51	0.26	4.42	0.10	0.44	Admin	2022-12-29	\N	1	3.51	\N	1	1	0.13	1	\N	\N	\N
664	769229003734	Antialérgico  Frasco 60 Tabletas	\N	36	5	\N	1	1	1	12.70	0.74	22.12	0.10	2.21	Admin	2022-12-29	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
665	8713184134349	Bravecto 2- 4.5 kg  Tableta 112.5 mg	\N	37	5	\N	1	1	1	22.72	0.49	30.97	0.10	3.10	Admin	2022-12-29	\N	1	22.72	\N	1	1	0.13	1	\N	\N	\N
666	8713184135278	Bravecto 4.5-10 kg  Tableta 250 mg	\N	37	5	\N	1	1	1	22.93	0.49	33.63	0.10	3.36	Admin	2022-12-29	\N	1	22.92	\N	1	1	0.13	1	\N	\N	\N
667	8713184135285	Bravecto 10-20 kg  Tableta 500 mg	\N	37	5	\N	1	1	1	24.50	0.49	36.28	0.10	3.63	Admin	2022-12-29	\N	1	24.50	\N	1	1	0.13	1	\N	\N	\N
668	8713184135292	Bravecto 20-40 kg  Tableta 1000 mg	\N	37	5	\N	1	1	1	26.13	0.47	38.05	0.10	3.81	Admin	2022-12-29	\N	1	26.21	\N	1	1	0.13	1	\N	\N	\N
669	8713184141408	Bravecto 40-56 kg  Tableta 1400 mg	\N	37	5	\N	1	1	1	29.44	0.46	38.94	0.10	3.89	Admin	2022-12-29	\N	1	29.44	\N	1	1	0.13	1	\N	\N	\N
670	4007221039112	Seresto perros grandes y medianos  Collar de 70 cm	\N	24	5	\N	6	6	1	34.22	0.48	50.96	0.00	0.00	Admin	2022-12-30	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
671	4007221039129	Seresto perros pequeños y gatos  Collar de 38 cm	\N	24	5	\N	6	6	1	31.70	0.48	46.02	0.10	4.60	Admin	2022-12-30	\N	1	31.70	\N	1	1	0.13	1	\N	\N	\N
672	769229002683	Prednisona 50 mg  1 de 72 Tabletas	\N	36	5	\N	72	72	1	0.58	0.36	0.87	0.10	0.09	Admin	2022-12-30	\N	1	0.58	\N	1	1	0.13	1	\N	\N	\N
673	769229003710	Tranquilizante  Frasco 45 Tabletas	\N	36	5	\N	1	1	1	10.99	0.93	21.24	0.10	2.12	Admin	2022-12-30	\N	1	10.99	\N	1	1	0.13	1	\N	\N	\N
674	034846730500	Propac Heartland Choice  Bolsa 12 kg	\N	38	1	\N	1	1	1	0.00	0.25	87.61	0.10	8.76	Admin	2022-12-30	\N	1	0.00	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
675	034846730517	Propac Heartland Choice  Bolsa 2.5 kg	\N	38	1	\N	1	1	1	0.00	0.32	25.66	0.10	2.57	Admin	2022-12-30	\N	1	0.00	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
676	034846730609	Propac Bayside Select  Bolsa 12 kg	\N	38	1	\N	1	1	1	70.09	0.25	87.61	0.10	8.76	Admin	2022-12-30	\N	1	70.09	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
677	034846730401	Propac Meadow Prime  Bolsa 12 kg	\N	38	1	\N	1	1	1	70.08	0.63	87.61	0.10	8.76	Admin	2022-12-30	\N	1	70.08	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
678	034846730937	Propac Deep Sea Select  Bolsa 2 Kg	\N	38	1	\N	1	1	1	15.58	0.32	19.47	0.10	1.95	Admin	2022-12-30	\N	1	15.58	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
679	034846730029	Propac Chicken Meal and Rice  Bolsa 20 Kg	\N	38	1	\N	1	1	1	40.71	0.25	101.77	0.10	10.18	Admin	2022-12-30	\N	1	0.00	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
680	034846730012	Propac Chicken Meal and Rice  Bolsa 2.5 Kg	\N	38	1	\N	1	1	1	0.00	0.32	22.12	0.10	2.21	Admin	2022-12-30	\N	1	0.00	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
681	034846730326	Propac Puppy Chicken and Brown Rice Formula  Bolsa 20 Kg	\N	38	1	\N	1	1	1	81.42	0.25	101.77	0.10	10.18	Admin	2022-12-30	\N	1	81.42	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
682	034846730319	Propac Puppy Chicken and Brown Rice Formula  Bolsa 2.5 Kg	\N	38	1	\N	1	1	1	17.70	0.32	23.28	0.10	2.33	Admin	2022-12-30	\N	1	17.70	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
683	034846730104	Propac Lamb and Brown Rice Formula  Bolsa 12 Kg	\N	38	1	\N	1	1	1	58.80	0.25	74.34	0.10	7.43	Admin	2022-12-30	\N	1	57.47	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
807	23	Baño normal Raza gigante  U	\N	87	18	\N	1	1	1	0.00	12.27	13.27	0.15	1.99	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
684	034846730111	Propac Lamb and Brown Rice Formula  Bolsa 2.5 Kg	\N	38	1	\N	1	1	1	0.00	0.28	21.44	0.10	2.14	Admin	2022-12-30	\N	1	0.00	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
685	034846730227	Propac Large Breed Adult Chicken Meal and Rice  Bolsa 20 Kg	\N	38	1	\N	1	1	1	81.42	0.25	101.77	0.10	10.18	Admin	2022-12-30	\N	1	81.42	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
686	034846730821	Propac Large Breed Puppy Chicken Meal and Rice  Bolsa 20 Kg	\N	38	1	\N	1	1	1	81.42	0.25	101.77	0.10	10.18	Admin	2022-12-30	\N	1	81.42	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
687	034846730814	Propac Large Breed Puppy Chicken Meal and Rice  Bolsa 2.5 Kg	\N	38	1	\N	1	1	1	17.70	0.32	22.12	0.10	2.21	Admin	2022-12-30	\N	1	17.70	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
688	034846730708	Propac Mature Chicken Meal and Rice  Bolsa 12 Kg	\N	38	1	\N	1	1	1	0.00	0.25	74.34	0.10	7.43	Admin	2022-12-30	\N	1	0.00	5 bolsas 5%, 15+1	1	1	0.13	1	\N	\N	\N
689	034846730715	Mature chicken Meal & brown rice  Bolsa 2.5 Kg	\N	38	1	\N	1	1	1	0.00	0.32	22.12	0.10	2.21	Admin	2022-12-30	\N	1	0.00	5 bolsas 5% Descuento, 15+1	1	1	0.13	1	\N	\N	\N
690	8410650150147	Puppy Mini 2-10 Months  Bolsa 7.5 Kg	\N	39	1	\N	1	1	1	0.00	0.25	53.54	0.10	5.35	Admin	2022-12-30	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
691	8410650150192	Advance Mini Adult 1-10 Kg  Bolsa 7.5 Kg	\N	39	1	\N	1	1	1	42.48	0.25	53.10	0.10	5.31	Admin	2022-12-30	\N	1	42.48	\N	1	1	0.13	1	\N	\N	\N
692	8410650170695	Advance Atopic Medium-Maxi  Bolsa 3 Kg	\N	39	1	\N	1	1	1	20.88	0.27	26.55	0.10	2.65	Admin	2022-12-30	\N	1	20.88	\N	1	1	0.13	1	\N	\N	\N
693	8410650152264	Advance Gastroenteric  Bolsa 3 Kg	\N	39	1	\N	1	1	1	20.88	0.27	26.55	0.10	2.65	Admin	2022-12-30	\N	1	20.88	8410650152264	1	1	0.13	1	\N	\N	\N
694	8410650167817	Advance Gastroenteric  Bolsa 12 Kg	\N	39	1	\N	1	1	1	75.40	0.25	94.25	0.10	9.42	Admin	2022-12-30	\N	1	75.40	\N	1	1	0.13	1	\N	\N	\N
695	8410650152325	Advance Urinary Perros  Bolsa 3 Kg	\N	39	1	\N	1	1	1	20.88	0.27	26.55	0.10	2.65	Admin	2022-12-30	\N	1	20.88	\N	1	1	0.13	1	\N	\N	\N
696	8410650218649	Advance Hairball Sterilized Gatos  Bolsa 1.5 Kg	\N	39	1	\N	1	1	1	8.07	0.25	20.18	0.10	2.02	Admin	2022-12-30	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
697	8410650239132	Advance Gatos Weight Balance  Bolsa 1.5 Kg	\N	39	1	\N	1	1	1	14.65	0.25	18.32	0.10	1.83	Admin	2022-12-30	\N	1	14.65	\N	1	1	0.13	1	\N	\N	\N
698	8410650152448	Advance Gatos Renal  Bolsa 1.5 Kg	\N	39	1	\N	1	1	1	14.65	0.25	18.32	0.10	1.83	Admin	2022-12-30	\N	1	14.65	\N	1	1	0.13	1	\N	\N	\N
699	8410650152400	Advance Gatos Urinary  Bolsa 1.5 Kg	\N	39	1	\N	1	1	1	14.65	0.25	18.32	0.10	1.83	Admin	2022-12-30	\N	1	14.65	\N	1	1	0.13	1	\N	\N	\N
700	077627101182	Chicken and Rice Dinner  Lata 12.8 Oz	\N	40	30	\N	1	1	1	2.73	0.32	3.41	0.10	0.34	Admin	2022-12-30	\N	1	2.73	unidad $2.73, caja de 12 $2.59	1	1	0.13	1	\N	\N	\N
701	077627101229	Puppy and Underweight Dogs  Lata 12.5 Oz	\N	40	30	\N	1	1	1	2.73	0.35	3.50	0.10	0.35	Admin	2022-12-30	\N	1	2.73	unidad $2.73, caja de 12 $2.59	1	1	0.13	1	\N	\N	\N
702	077627101274	Senior and Weight Management Dinner  Lata 12.5 Oz	\N	40	30	\N	1	1	1	2.73	0.35	3.50	0.10	0.35	Admin	2022-12-30	\N	1	2.73	unidad $2.73, caja de 12 $2.59	1	1	0.13	1	\N	\N	\N
703	077627101342	Lamb and Rice Dinner  Lata 12.5 Oz	\N	40	30	\N	1	1	1	2.72	0.32	3.41	0.10	0.34	Admin	2022-12-30	\N	1	2.59	unidad $2.73 caja de 12 $2.59	1	1	0.13	1	\N	\N	\N
704	077627201028	Duck & Sweet Potato Dinner Super Premium  Lata 12.5 Oz	\N	40	30	\N	1	1	1	3.08	0.36	3.98	0.10	0.40	Admin	2022-12-30	\N	1	3.08	unidad $3.49, caja de 12 $2.93	1	1	0.13	1	\N	\N	\N
705	077627201066	Chicken Dinner Super Premium  Lata 12.5 Oz	\N	40	30	\N	1	1	1	2.93	0.36	3.98	0.10	0.40	Admin	2022-12-30	\N	1	2.93	unidad $3.49, caja de 12 $2.93	1	1	0.13	1	\N	\N	\N
706	077627201349	Lamb and Rice Dinner Super Premium  Lata 12.5 Oz	\N	40	30	\N	1	1	1	3.08	0.36	3.98	0.10	0.40	Admin	2022-12-30	\N	1	3.08	unidad $3.09, caja de 12 $2.93	1	1	0.13	1	\N	\N	\N
707	077627200991	Chicken Complements  Lata 12.5 Oz	\N	40	30	\N	1	1	1	3.68	0.39	4.87	0.10	0.49	Admin	2022-12-30	\N	1	3.68	unidad $3.68, caja de 12 $3.50	1	1	0.13	1	\N	\N	\N
708	077627201356	Salmon Complements  Lata 12.5 Oz	\N	40	30	\N	1	1	1	3.50	0.39	4.87	0.10	0.49	Admin	2022-12-30	\N	1	0.00	unidad $3.68, caja de 12 $3.50	1	1	0.13	1	\N	\N	\N
709	077627302015	Rabbit Complements  Lata 12.5 Oz	\N	40	30	\N	1	1	1	0.00	0.39	4.87	0.10	0.49	Admin	2022-12-30	\N	1	0.00	unidad $3.68, caja de 12 $3.50	1	1	0.13	1	\N	\N	\N
710	7410032780024	Happy Cat Aroma a Lavanda  Bolsa 10 lbs	\N	41	24	\N	1	1	1	4.60	0.32	6.06	0.10	0.61	Admin	2023-01-03	\N	1	4.60	\N	1	1	0.13	1	\N	\N	\N
711	7410032780031	Happy Cat Sin Aroma  Bolsa 10 lbs	\N	41	24	\N	1	1	1	4.10	0.35	5.53	0.10	0.55	Admin	2023-01-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
712	045663970109	Hypoallergenic with Oatmeal  Bote 473 ml	\N	42	24	\N	1	1	1	7.43	0.31	9.73	0.10	0.97	Admin	2023-01-03	\N	1	0.00	12+1, 25+3	1	1	0.13	1	\N	\N	\N
713	045663970086	Cleans & Conditions with Enriched Protein  Bote 473 ml	\N	42	24	\N	1	1	1	7.43	0.31	9.73	0.10	0.97	Admin	2023-01-03	\N	1	0.00	12+1, 25+3	1	1	0.13	1	\N	\N	\N
714	045663970079	Bright White with Natriance-Brightener  Bote 473ml	\N	42	24	\N	1	1	1	7.44	0.31	9.73	0.10	0.97	Admin	2023-01-03	\N	1	7.44	12+1, 25+3	1	1	0.13	1	\N	\N	\N
715	7414400201470	Astral Antimicótico & Ectoparasitida  Frasco 30 ml	\N	43	5	\N	1	1	1	7.79	0.25	9.73	0.10	0.97	Admin	2023-01-03	\N	1	0.00	12+1, 25+3 se puede combinar	1	1	0.13	1	\N	\N	\N
716	7414400201494	Astral Antibacteriana  Frasco 30 ml	\N	43	5	\N	1	1	1	7.40	0.25	9.73	0.10	0.97	Admin	2023-01-03	\N	1	7.40	12+1, 25+3 se puede combinar	1	1	0.13	1	\N	\N	\N
717	7414400201487	Astral Astringente  Frasco 30 ml	\N	43	5	\N	1	1	1	5.97	0.25	7.96	0.10	0.80	Admin	2023-01-03	\N	1	5.97	12+1, 25+3 se puede combinar	1	1	0.13	1	\N	\N	\N
718	018214812784	Dental Chew Bone Chicken Pettite  Unidad	\N	5	29	\N	1	1	1	3.90	0.30	5.09	0.10	0.51	Admin	2023-01-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
719	018214846307	Puppy Chew Ring Peanut Butter  Unidad	\N	5	22	\N	1	1	1	0.00	0.30	10.71	0.10	1.07	Admin	2023-01-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
720	018214812791	Dental Chew Bone Chicken Regular  Unidad	\N	5	29	\N	1	1	1	0.00	0.31	7.43	0.10	0.74	Admin	2023-01-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
721	8901138511333	Anxocare  Frasco 100 ml	\N	45	5	\N	1	1	1	7.73	0.43	11.06	0.10	1.11	Admin	2023-01-03	\N	1	7.73	12+1	1	1	0.13	1	\N	\N	\N
722	8901138511340	Immunol  Frasco 100 ml	\N	45	5	\N	1	1	1	8.50	0.35	11.50	0.10	1.15	Admin	2023-01-03	\N	1	8.50	12+1	1	1	0.13	1	\N	\N	\N
723	8901138501242	Liv. 52  Frasco 110 ml	\N	45	5	\N	1	1	1	7.08	0.31	9.29	0.10	0.93	Admin	2023-01-03	\N	1	7.08	12+1	1	1	0.13	1	\N	\N	\N
724	8901138501297	Nefrotec Tabs  Frasco 60 Tabletas	\N	45	5	\N	1	1	1	8.19	0.51	12.39	0.10	1.24	Admin	2023-01-03	\N	1	8.19	12+1	1	1	0.13	1	\N	\N	\N
725	714193699728	Artri-Tabs Complete  Frasco 60 Tabletas	\N	46	5	\N	1	1	1	21.81	0.32	28.81	0.10	2.88	Admin	2023-01-03	\N	1	21.81	12+1	1	1	0.13	1	\N	\N	\N
726	714193600861	PetaVit  Frasco 60 Tabletas	\N	46	5	\N	1	1	1	11.68	0.25	14.60	0.10	1.46	Admin	2023-01-03	\N	1	11.68	12+1	1	1	0.13	1	\N	\N	\N
727	714193600823	Calciphos  Frasco 60 Tabletas	\N	46	5	\N	1	1	1	10.90	0.34	14.60	0.15	2.19	Admin	2023-01-03	\N	1	10.90	12+1	1	1	0.13	1	\N	\N	\N
728	714193600984	Hemovit B12  Gotero 2 Oz	\N	46	5	\N	1	1	1	10.12	0.31	13.27	0.10	1.33	Admin	2023-01-03	\N	1	10.12	12+1	1	1	0.13	1	\N	\N	\N
729	HEMOVITB12	Hemovit- B12  Gotero 2 Oz.	\N	46	5	\N	1	1	1	0.00	0.31	13.27	0.00	0.00	Admin	2023-01-03	\N	1	0.00	12+1	1	1	0.13	1	\N	\N	\N
730	X002	Xanté Jabón Triclosán  Barra 100 g	\N	43	24	\N	1	1	1	3.00	0.25	3.76	0.00	0.00	Admin	2023-01-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
731	X001	Xanté Jabón con Azufre y Ácido Salicílico  Barra 100 g	\N	43	24	\N	1	1	1	3.00	0.25	3.76	0.10	0.38	Admin	2023-01-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
732	7414400201012	Puppy Lact  Sobre 115 gr	\N	43	37	\N	1	1	1	7.07	0.31	10.40	0.10	1.04	Admin	2023-01-03	\N	1	7.07	\N	1	1	0.13	1	\N	\N	\N
733	7414400201302	Fulminex Defense  Spray 100 ml	\N	43	5	\N	1	1	1	11.68	0.31	15.27	0.10	1.53	Admin	2023-01-03	\N	1	11.68	\N	1	1	0.13	1	\N	\N	\N
734	7414400201296	Fulminex Defense  Spray 250 ml	\N	43	5	\N	1	1	1	20.53	0.31	26.99	0.10	2.70	Admin	2023-01-03	\N	1	20.53	\N	1	1	0.13	1	\N	\N	\N
735	7414400201111	Bird Food Loras y Guacamayas  Bolsa 400 g	\N	47	27	\N	1	1	1	1.41	0.32	1.86	0.10	0.19	Admin	2023-01-04	\N	1	1.41	\N	1	1	0.13	1	\N	\N	\N
736	7414400201128	Bird Food Loras y Guacamayas  Bolsa 800 g	\N	47	27	\N	1	1	1	2.62	0.27	3.32	0.10	0.33	Admin	2023-01-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
737	7414400201074	Bird Food Canarios  Bolsa 400 g	\N	47	27	\N	1	1	1	1.05	0.47	1.55	0.10	0.15	Admin	2023-01-04	\N	1	1.05	\N	1	1	0.13	1	\N	\N	\N
738	7414400201081	Bird Food Canarios  Bolsa 800 g	\N	47	27	\N	1	1	1	1.90	0.86	3.54	0.10	0.35	Admin	2023-01-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
739	7414400201050	Bird Food Alpiste Puro  Bolsa 400 g	\N	47	27	\N	1	1	1	0.00	0.26	1.33	0.00	0.00	Admin	2023-01-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
740	7414400201067	Bird Food Alpiste Puro  Bolsa 800 g	\N	47	27	\N	1	1	1	2.03	0.74	3.54	0.10	0.35	Admin	2023-01-04	\N	1	2.03	\N	1	1	0.13	1	\N	\N	\N
741	ALP001	Bird Food Alpiste Vitaminado  Bolsa 1 lb	\N	47	27	\N	1	1	1	0.66	1.68	1.77	0.10	0.18	Admin	2023-01-04	\N	1	0.66	\N	1	1	0.13	1	\N	\N	\N
742	PEC001	Alimento para peces  Bolsa 1 lb	\N	47	30	\N	1	1	1	12.17	0.29	13.72	0.10	1.37	Admin	2023-01-04	\N	1	13.72	\N	1	1	0.13	1	\N	\N	\N
743	TORT001	Alimento para tortuga  Bolsa 1 lb	\N	47	8	\N	1	1	1	5.09	0.39	7.08	0.10	0.71	Admin	2023-01-04	\N	1	5.09	\N	1	1	0.13	1	\N	\N	\N
744	018065057655	House Breaking  Spray 236 ml	\N	48	24	\N	1	1	1	6.02	0.32	7.96	0.10	0.80	Admin	2023-01-04	\N	1	6.02	\N	1	1	0.13	1	\N	\N	\N
745	018065057686	Pet Block Repellent  Spray 473 ml	\N	48	24	\N	1	1	1	9.56	0.39	13.27	0.15	1.99	Admin	2023-01-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
746	018065055583	No More Marking  Spray 709 ml	\N	48	24	\N	1	1	1	12.04	0.32	15.93	0.15	2.39	Admin	2023-01-04	\N	1	12.04	\N	1	1	0.13	1	\N	\N	\N
747	018065057792	Pet Block Cat  Spray 236 ml	\N	48	24	\N	1	1	1	7.08	0.31	9.29	0.10	0.93	Admin	2023-01-04	\N	1	7.08	\N	1	1	0.13	1	\N	\N	\N
748	045663970062	Gentle Tearless Shampoo  Bote 473 ml	\N	42	3	\N	1	1	1	0.00	0.31	9.73	0.00	0.00	Admin	2023-01-04	\N	1	0.00	12+1, 25+3	1	1	0.13	1	\N	\N	\N
749	045663970093	Reduce Odor Shampoo  Bote 473 ml	\N	42	24	\N	1	1	1	7.43	0.31	9.73	0.00	0.00	Admin	2023-01-04	\N	1	0.00	12+1, 25+3	1	1	0.13	1	\N	\N	\N
750	7503008553200	NUPEC Adulto  Bolsa 2 Kg	\N	49	1	\N	1	1	1	10.90	0.40	15.09	0.10	1.51	Admin	2023-01-04	\N	1	10.78	\N	1	1	0.13	1	\N	\N	\N
751	7503008553248	NUPEC Adulto Raza Pequeña  Bolsa 2 Kg	\N	49	1	\N	1	1	1	11.95	0.56	17.70	0.10	1.77	Admin	2023-01-04	\N	1	12.26	\N	1	1	0.13	1	\N	\N	\N
752	7503008553040	NUPEC Cachorro Raza Pequeña  Bolsa 2 Kg	\N	49	1	\N	1	1	1	12.31	0.42	18.78	0.10	1.88	Admin	2023-01-04	\N	1	13.27	\N	1	1	0.13	1	\N	\N	\N
753	7503008553002	NUPEC Cachorro  Bolsa 2 Kg	\N	49	1	\N	1	1	1	12.36	0.40	17.25	0.10	1.73	Admin	2023-01-04	\N	1	12.29	\N	1	1	0.13	1	\N	\N	\N
754	7503020053290	NUPEC Dental Care Treats  Bolsa 180 gr	\N	49	1	\N	1	1	1	2.21	0.30	5.75	0.10	0.58	Admin	2023-01-04	\N	1	2.21	\N	1	1	0.13	1	\N	\N	\N
755	7503026084144	NUPEC Felino Adult Indoor  Bolsa 3 Kg	\N	49	1	\N	1	1	1	9.41	0.39	23.01	0.05	1.15	Admin	2023-01-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
756	7503026084113	NUPEC Felino Kitten  Bolsa 1.5 Kg	\N	49	1	\N	1	1	1	10.62	0.39	14.81	0.05	0.74	Admin	2023-01-04	\N	1	10.62	\N	1	1	0.13	1	\N	\N	\N
757	7503020053306	NUPEC Joint Care Treats  Bolsa 180 gr	\N	49	1	\N	1	1	1	4.76	0.30	7.48	0.10	0.75	Admin	2023-01-04	\N	1	5.75	\N	1	1	0.13	1	\N	\N	\N
758	7503020053313	NUPEC Relax Treats  Bolsa 180 gr	\N	49	1	\N	1	1	1	4.39	0.30	5.75	0.10	0.58	Admin	2023-01-04	\N	1	4.38	\N	1	1	0.13	1	\N	\N	\N
759	7730997410621	NexGard Tableta 4.1 - 10 Kg  Caja 1 tableta	\N	50	34	\N	1	1	1	14.66	0.39	26.55	0.10	2.66	Admin	2023-01-04	\N	1	14.66	unidad $19.13, 6+1 $16.40, 10+2 $15.94, 15+3 $15.94, 20+5 $15.30	1	1	0.13	1	\N	\N	\N
760	7730997410614	NexGard Tableta Masticable 2-4 kg  Caja 1 Tableta	\N	50	34	\N	1	1	1	15.27	0.42	25.22	0.10	2.52	Admin	2023-01-05	\N	1	15.27	unidad $17.81, 6+1 $15.27,  10+2 $14.84, 15+3 $14.84,  20+5 $14.25	1	1	0.13	1	\N	\N	\N
761	7730997410638	NexGard Tableta Masticable 10.1-25 kg  Caja 1 Tableta	\N	50	34	\N	1	1	1	17.55	0.37	30.22	0.10	3.02	Admin	2023-01-05	\N	1	18.29	unidad $22.13, 6+1 $18.97, 10+2 $18.44, 15+3 $18.44, 20+5 $17.70	1	1	0.13	1	\N	\N	\N
762	7730997410645	NexGard Tableta Masticable 25-50kg  Caja 1 Tableta	\N	50	34	\N	1	1	1	20.73	0.44	36.15	0.10	3.62	Admin	2023-01-05	\N	1	21.54	unidad $25.13, 6+1 $21.54, 10+2 $20.94, 15+3 $20.94, 20+5 $20.10	1	1	0.13	1	\N	\N	\N
763	7502262630023	One Tableta,  1 de 30 Tabletas	\N	21	5	\N	30	30	1	1.17	2.24	4.17	0.10	0.42	Admin	2023-01-05	\N	1	1.17	(6+1 $1.17), (10+2 $1.14)	1	1	0.13	1	\N	\N	\N
764	7798042360468	Total Full  Frasco 15 ml	\N	18	5	\N	1	1	1	2.08	0.42	16.37	0.10	1.64	Admin	2023-01-05	\N	1	2.08	unidad $14.00, 6+1 $12, 10+2 $11.67, 10+3 $10.77,	1	1	0.13	1	\N	\N	\N
765	7798042365975	Total Full CG Perros y Gatos  Frasco 15 ml	\N	18	5	\N	1	1	1	2.57	0.33	18.58	0.10	1.86	Admin	2023-01-05	\N	1	2.57	\N	1	1	0.13	1	\N	\N	\N
766	7798042360178	TotalFull Gatos  Caja 2 Tabletas	\N	18	5	\N	1	1	1	6.21	0.15	7.96	0.10	0.80	Admin	2023-01-05	\N	1	6.21	unidad $6.90, 6+1 $5.92, 10+2 $5.75, 15+3 $5.75, 25+7 $5.39	1	1	0.13	1	\N	\N	\N
767	7798042360055	TotalFull Perros Chicos  Caja 2 Tabletas	\N	18	5	\N	1	1	1	5.57	0.27	7.96	0.10	0.80	Admin	2023-01-05	\N	1	5.57	unidad $6.25, 6+1 $5.36, 10+2 $5.21, 15+3 $5.21, 25+7 $4.88	1	1	0.13	1	\N	\N	\N
768	7798042360109	TotalFull Perros Medianos  Caja 2 Tabletas	\N	18	5	\N	1	1	1	6.56	0.52	9.47	0.10	0.95	Admin	2023-01-05	\N	1	6.56	unidad $7.25, 6+1 $6.21, 10+2 $6.04, 15+3 $6.04, 25+7 $5.66	1	1	0.13	1	\N	\N	\N
769	7798042360093	TotalFull Perro Grande  Caja 3 Tabletas	\N	18	5	\N	1	1	1	10.50	0.05	12.83	0.10	1.28	Admin	2023-01-05	\N	1	10.50	unidad $12.25, 6+1 $10.50, 10+2 $10.21, 15+3 $10.21, 25+7 $9.57	1	1	0.13	1	\N	\N	\N
770	7798042360260	Gel Antiplaca Antiséptico Bucal  Tubo 20 ml	\N	18	3	\N	1	1	1	7.29	0.64	11.92	0.10	1.19	Admin	2023-01-05	\N	1	7.29	\N	1	1	0.13	1	\N	\N	\N
771	7798042360581	Clorhexidina Gotas óticas  Gotas 15 ml	\N	18	5	\N	1	1	1	7.50	0.38	10.35	0.10	1.04	Admin	2023-01-05	\N	1	7.50	\N	1	1	0.13	1	\N	\N	\N
772	7798042364961	Relay C Tabletas 100 mcg   1 de 10 Tabletas	\N	18	5	\N	10	10	1	3.04	0.44	4.38	0.10	0.44	Admin	2023-01-05	\N	1	3.04	\N	1	1	0.13	1	\N	\N	\N
773	7798042361359	Pileran Gotas  Frasco 20 ml	\N	18	5	\N	1	1	1	7.08	0.35	9.56	0.10	0.96	Admin	2023-01-05	\N	1	7.08	\N	1	1	0.13	1	\N	\N	\N
774	7798042361380	Ofloxacina  Frasco 5 ml	\N	18	5	\N	1	1	1	14.57	0.52	22.12	0.00	0.00	Admin	2023-01-05	\N	1	14.57	\N	1	1	0.13	1	\N	\N	\N
775	7798042366255	Floxaday 200 mg  1 de 10 Tabletas	\N	18	5	\N	10	10	1	1.29	0.55	2.00	0.10	0.20	Admin	2023-01-05	\N	1	1.29	\N	1	1	0.13	1	\N	\N	\N
776	7798042366262	Floxaday 400 mg  1 de 10 Tabletas	\N	18	5	\N	1	1	1	1.97	0.53	3.01	0.10	0.30	Admin	2023-01-05	\N	1	1.97	\N	1	1	0.13	1	\N	\N	\N
777	BROADLINE	Broadline 2.5-7.5 kg  Jeringa 0.9 ml	\N	50	5	\N	1	1	1	21.75	0.29	28.32	0.10	2.83	Admin	2023-01-05	\N	1	21.75	\N	1	1	0.13	1	\N	\N	\N
778	7798042366200	ECTHOL para Perros Chicos  Collar 40 cm	\N	18	4	\N	1	1	1	10.71	0.45	15.53	0.10	1.55	Admin	2023-01-05	\N	1	10.71	unidad 12.50, 6+1 $10.71, 10+2 $10.42, 15+3 $10.42, 25+7 $9.77	1	1	0.13	1	\N	\N	\N
779	7798042366217	ECTHOL para Perros Medianos y Grandes  Collar 63 cm	\N	18	4	\N	1	1	1	11.57	0.48	17.12	0.10	1.71	Admin	2023-01-05	\N	1	11.57	unidad $13.50, 6+1 $11.57, 10+2 $11.25, 15+3 $11.25, 25+7 $10.55	1	1	0.13	1	\N	\N	\N
780	7798042361533	Cardial 5 mg  Caja 3 blister	\N	18	5	\N	1	1	1	25.51	0.43	31.19	0.10	3.12	Admin	2023-01-05	\N	1	25.51	unidad $25.00, 6+1 $21.43,  10+2 $20.83, 15+3 $20.83, 25+7 $19.53,	1	1	0.13	1	\N	\N	\N
781	7798042365685	Cardial B5 20 mg  Caja 2 Blister	\N	18	5	\N	1	1	1	34.50	0.43	42.27	0.10	4.23	Admin	2023-01-05	\N	1	34.50	\N	1	1	0.13	1	\N	\N	\N
782	7798042365692	Cardial B10 40 mg  Caja 2 Blister	\N	18	5	\N	1	1	1	43.71	0.41	61.73	0.10	6.17	Admin	2023-01-05	\N	1	43.71	unidad $51, 6+1 $43.71, 10+2 $42.50, 15+3 $42.50, 25+7 $39.84	1	1	0.13	1	\N	\N	\N
783	7798042366170	PimoCard 2.5  Caja 2 Blister	\N	18	5	\N	1	1	1	19.62	0.31	25.71	0.10	2.57	Admin	2023-01-05	\N	1	19.69	\N	1	1	0.13	1	\N	\N	\N
784	7798042366187	PimoCard 5  Caja 2 Blister	\N	18	5	\N	1	1	1	25.71	0.30	33.42	0.10	3.34	Admin	2023-01-05	\N	1	25.71	\N	1	1	0.13	1	\N	\N	\N
785	7798042361311	Cefalexina 500 mg  1 de 300 Tabletas	\N	18	5	\N	300	300	1	0.80	0.27	1.02	0.15	0.15	Admin	2023-01-05	\N	1	0.80	\N	1	1	0.13	1	\N	\N	\N
786	HEARTGARDS	Heartgard Plus S  1 de 6 Tabletas	\N	50	5	\N	6	6	1	3.56	0.13	3.81	0.10	0.38	Admin	2023-01-06	\N	1	3.56	\N	1	1	0.13	1	\N	\N	\N
787	HEARTGARDM	Heartgard Plus M  1 de 6 Tabletas	\N	50	5	\N	6	6	1	5.00	0.19	5.97	0.00	0.00	Admin	2023-01-06	\N	1	5.00	\N	1	1	0.13	1	\N	\N	\N
788	HEARTGARDL	Heartgard Plus L  1 de 6 Tabletas	\N	50	5	\N	6	6	1	0.00	0.14	7.57	0.10	0.76	Admin	2023-01-06	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
789	STOMORGYL10	Stomorgyl 10 mg  1 de 200 Tabletas	\N	50	5	\N	200	200	1	1.49	0.46	2.39	0.10	0.24	Admin	2023-01-06	\N	1	1.49	unidad $1.65, 9+1 $1.49,	1	1	0.13	1	\N	\N	\N
790	7798042366224	Ecthol Collar Gatos  Collar 40 cm	\N	18	4	\N	1	1	1	9.86	0.48	14.56	0.10	1.46	Admin	2023-01-06	\N	1	9.86	unidad $11.50, 6+1 $9.86, $9.58, 15+3 $9.58, 25+7 $8.98	1	1	0.13	1	\N	\N	\N
791	8436001971643	Summit 10 Adult Small Breeds Chicken Rice  Bolsa 3 Kg	\N	51	1	\N	1	1	1	13.17	0.34	17.70	0.10	1.77	Admin	2023-01-09	\N	1	13.17	\N	1	1	0.13	1	\N	\N	\N
792	8436001971681	Summit 10 Adult Complete Gato  Bolsa 1.5kg	\N	51	1	\N	1	1	1	8.84	0.38	12.50	0.10	1.25	Admin	2023-01-09	\N	1	8.84	\N	1	1	0.13	1	\N	\N	\N
793	8436001971605	Summit 10 Adult All Breeds  Bolsa 3 kg	\N	51	1	\N	1	1	1	0.00	0.39	20.00	0.10	2.00	Admin	2023-01-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
794	8436001971650	Summit 10 Puppy All Breed  Bolsa 3 kg	\N	51	1	\N	1	1	1	14.16	0.34	19.03	0.10	1.90	Admin	2023-01-09	\N	1	14.16	\N	1	1	0.13	1	\N	\N	\N
795	8436001971728	Summit 10 Kitten Complete  Bolsa 2 kg	\N	51	1	\N	1	1	1	13.30	0.40	18.67	0.10	1.87	Admin	2023-01-09	\N	1	13.30	\N	1	1	0.13	1	\N	\N	\N
796	8436001971704	Summit 10 Cat Light Sterilised  Bolsa 1.5 kg	\N	51	1	\N	1	1	1	10.56	0.35	12.00	0.10	1.20	Admin	2023-01-09	\N	1	10.56	\N	1	1	0.13	1	\N	\N	\N
797	3411112261956	Feliway Classic  Spray 60 ml	\N	52	24	\N	1	1	1	41.58	0.15	54.00	0.00	0.00	Admin	2023-01-09	\N	1	41.58	\N	1	1	0.13	1	\N	\N	\N
798	7503020053849	Nupec 1st Care  Bolsa 2 kg	\N	49	1	\N	1	1	1	16.16	0.33	18.84	0.10	1.88	Admin	2023-01-09	\N	1	16.16	\N	1	1	0.13	1	\N	\N	\N
799	7503008553965	Nupec Senior  Bolsa 2 kg	\N	49	1	\N	1	1	1	15.80	0.32	20.97	0.10	2.10	Admin	2023-01-09	\N	1	15.80	\N	1	1	0.13	1	\N	\N	\N
800	7798156461808	Overdog Pipeta 4-10 kg  Unidad	\N	17	33	\N	1	1	1	0.00	0.30	5.97	0.10	0.60	Admin	2023-01-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
801	7798156461815	Overdog pipeta 10-25  Unidad	\N	17	33	\N	1	1	1	4.51	0.30	5.56	0.10	0.56	Admin	2023-01-09	\N	1	4.28	\N	1	1	0.13	1	\N	\N	\N
802	100	producto de prueba  unidad	\N	48	5	\N	1	1	1	0.00	1.00	0.00	0.00	0.00	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
803	10	Consulta Veterinaria  U	\N	88	17	\N	1	1	1	0.00	14.93	13.27	0.10	1.33	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
804	20	Baño normal Raza Pequeña  U	\N	87	18	\N	1	1	1	0.00	6.08	7.08	0.15	1.06	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
805	21	Baño Normal Raza Mediana Canjeé c.f  u	\N	87	18	\N	1	1	1	0.00	7.85	8.85	0.15	1.33	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
808	30	Baño Medicado Raza Pequeña  U	\N	87	18	\N	1	1	1	0.00	7.85	8.85	0.15	1.33	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
809	31	Baño Medicado Raza Mediana  U	\N	87	18	\N	1	1	1	0.00	9.62	10.62	0.15	1.59	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
810	32	Baño Medicado Raza Grande  U	\N	87	18	\N	1	1	1	0.00	0.11	12.39	0.15	1.86	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
811	33	Baño Medicado Gigante  U	\N	87	18	\N	1	1	1	0.00	14.04	15.04	0.15	2.26	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
812	40	Baño Antipulgas Pequeño  U	\N	87	18	\N	1	1	1	0.00	7.85	8.85	0.15	1.33	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
813	41	Baño Antipulgas Mediano  U	\N	87	18	\N	1	1	1	0.00	9.62	10.62	0.15	1.59	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
814	42	Baño Antipulgas Gigante  U	\N	87	18	\N	1	1	1	0.00	11.39	12.39	0.15	1.86	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
815	43	Baño Antipulgas Gigante  U	\N	87	18	\N	1	1	1	0.00	14.04	15.04	0.15	2.26	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
816	50	Corte y Baño Normal Raza Pequeña  U	\N	87	18	\N	1	1	1	0.00	9.62	10.62	0.15	1.59	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
817	51	Corte y Baño Normal Raza Mediana  U	\N	87	18	\N	1	1	1	0.00	11.39	12.39	0.15	1.86	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
818	52	Corte y Baño Normal Raza Grande  U	\N	87	18	\N	1	1	1	0.00	13.16	14.16	0.15	2.12	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
819	53	Corte y Baño Normal Raza Gigante  U	\N	87	18	\N	1	1	1	0.00	14.93	15.93	0.15	2.39	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
820	60	Corte y Baño Medicado Pequeño  U	\N	87	18	\N	1	1	1	0.00	11.39	12.39	0.15	1.86	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
821	61	Corte y Baño Medicado Raza Mediana  U	\N	87	18	\N	1	1	1	0.00	13.16	14.16	0.15	2.12	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
822	62	Corte y Baño Medicado Raza Grande  U	\N	87	18	\N	1	1	1	0.00	14.93	15.93	0.15	2.39	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
823	63	Corte y Baño Medicado Raza Gigante  U	\N	87	18	\N	1	1	1	0.00	16.70	17.70	0.15	2.65	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
824	70	Corte y Baño Antipulgas Raza Pequeña  U	\N	87	18	\N	1	1	1	0.00	11.39	12.39	0.15	1.86	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
825	71	Corte y Baño Antipulgas Raza Mediana  U	\N	87	18	\N	1	1	1	0.00	13.16	14.16	0.15	2.12	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
826	72	Corte y Baño Antipulgas Raza Grande  U	\N	87	18	\N	1	1	1	0.00	14.93	15.93	0.15	2.39	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
827	73	Corte y Baño Antipulgas Raza Gigante  U	\N	87	18	\N	1	1	1	0.00	16.70	17.70	0.15	2.65	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
828	80	Arreglo de cara  U	\N	87	18	\N	1	1	1	0.00	3.42	4.42	0.15	0.66	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
829	81	Seccion de nudos  U	\N	87	18	\N	1	1	1	0.00	4.31	5.31	0.15	0.80	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
830	82	Corte de uñas  U	\N	87	18	\N	1	1	1	0.00	1.65	2.65	0.25	0.66	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
831	83	Cepillado Dental  U	\N	87	18	\N	1	1	1	0.00	3.42	4.42	0.40	1.77	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
832	84	Deslanado  U	\N	87	18	\N	1	1	1	0.00	7.85	8.85	0.20	1.77	Admin	2023-01-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
833	842704100743	Vet Worthy Vitaminas Adulto  Frasco 60 Tabletas	\N	53	5	\N	1	1	1	9.83	0.52	14.16	0.10	1.42	Admin	2023-01-11	\N	1	10.50	\N	1	1	0.13	1	\N	\N	\N
834	842704100095	Kit Pacha Vet Worthy  Unidad	\N	53	2	\N	1	1	1	4.15	0.65	5.97	0.10	0.60	Admin	2023-01-11	\N	1	4.15	\N	1	1	0.13	1	\N	\N	\N
835	073893223009	NutriSource Gato y Gatito  Bolsa de 6.6 lb	\N	54	1	\N	1	1	1	18.00	0.35	24.34	0.10	2.43	Admin	2023-01-11	\N	1	18.00	\N	1	1	0.13	1	\N	\N	\N
836	073893280002	NutriSource Gato y Gatito  Bolsa de 16 Lb	\N	54	1	\N	1	1	1	42.00	0.35	56.64	0.10	5.66	Admin	2023-01-11	\N	1	42.00	\N	1	1	0.13	1	\N	\N	\N
837	073893264026	NutriSource Cachorro Raza Grande  Bolsa 15 lb	\N	54	1	\N	1	1	1	35.00	0.35	47.25	0.00	0.00	Admin	2023-01-11	\N	1	35.00	\N	1	1	0.13	1	\N	\N	\N
838	073893263036	NutriSource Cachorro Raza Peq y Mediana  Bolsa 5 lb	\N	54	1	\N	1	1	1	13.00	0.36	17.69	0.10	1.77	Admin	2023-01-11	\N	1	13.00	\N	1	1	0.13	1	\N	\N	\N
839	073893265030	NutriSource Senior  Bolsa 5 lb	\N	54	1	\N	1	1	1	12.00	0.36	16.37	0.10	1.64	Admin	2023-01-11	\N	1	12.00	\N	1	1	0.13	1	\N	\N	\N
840	073893260066	Nutrisource Small Bites Adulto  Bolsa 15 lb	\N	54	1	\N	1	1	1	32.00	0.36	43.36	0.10	4.34	Admin	2023-01-11	\N	1	32.00	\N	1	1	0.13	1	\N	\N	\N
841	073893260035	NutriSource Adulto Chicken / Rice  Bolsa 15 lb	\N	54	1	\N	1	1	1	32.00	0.36	43.36	0.10	4.34	Admin	2023-01-11	\N	1	32.00	\N	1	1	0.13	1	\N	\N	\N
842	073893212546	NutriSource Weight Management  Bolsa 15 lb	\N	54	1	\N	1	1	1	0.00	0.36	43.36	0.10	4.34	Admin	2023-01-11	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
843	101	General de Orina  Unidad	\N	89	12	\N	0	0	1	0.00	4.31	5.31	0.10	0.53	Admin	2023-01-12	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
844	102	Urocultivo  Unidad	\N	89	12	\N	0	0	1	0.00	12.27	13.27	0.07	0.88	Admin	2023-01-12	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
845	103	General de Heces  U	\N	89	12	\N	0	0	1	0.00	4.31	5.31	0.15	0.80	Admin	2023-01-13	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
846	7503026470107	Revolution Plus Hasta 2.5 Kg 0.25 ml c/u  1 de 3 Tubos	\N	13	33	\N	3	3	1	12.78	0.29	15.93	0.10	1.59	Admin	2023-01-14	\N	1	12.78	\N	1	1	0.13	1	\N	\N	\N
847	KETOVET	Keto-Vet 200 mg  1 de 600 Tabletas	\N	12	5	\N	600	600	1	0.17	1.36	0.40	0.10	0.04	Admin	2023-01-14	\N	1	0.17	\N	1	1	0.13	1	\N	\N	\N
848	104	Directo KOH  U	\N	89	12	\N	0	0	1	0.00	8.29	9.29	0.15	1.39	Admin	2023-01-14	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
849	RANITIDINVET	Ranitidin-Vet 40 mg  1 de 1140	\N	12	5	\N	1140	1140	1	0.14	1.38	0.40	0.10	0.04	Admin	2023-01-14	\N	1	0.14	\N	1	1	0.13	1	\N	\N	\N
850	7414400201616	MV Derma Shampoo Antimicotico y Antiseptico  Frasco 500 ml	\N	43	24	\N	1	1	1	10.94	0.28	14.56	0.15	2.18	Admin	2023-01-14	\N	1	10.62	12+1, 25+3 se puede combinar	1	1	0.13	1	\N	\N	\N
851	7414400201609	MV Derma Shampoo Piel Sensible  Bote 500 ml	\N	43	24	\N	1	1	1	10.71	0.12	11.98	0.15	1.80	Admin	2023-01-16	\N	1	10.66	12+1, 25+3 se puede combinar	1	1	0.13	1	\N	\N	\N
852	7414400201623	MV Derma Shampoo Antiseborreico y Queratolitico  Bote 500 ml	\N	43	24	\N	1	1	1	12.81	0.15	14.73	0.10	1.47	Admin	2023-01-16	\N	1	12.81	12+1, 25+3 se puede combinar	1	1	0.13	1	\N	\N	\N
853	8436532730030	FeLV-FIV  1 de 10 Tests	\N	55	12	\N	10	10	1	0.00	1.84	37.61	0.15	5.64	Admin	2023-01-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
854	8436532730047	Parvo-Corona  1 de 5 Tests	\N	55	12	\N	5	5	1	0.00	2.33	35.40	0.20	7.08	Admin	2023-01-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
855	8436532730665	Ehrlichia-Anaplasma  1 de 10 Tests	\N	55	12	\N	10	10	1	11.81	2.39	39.99	0.10	4.00	Admin	2023-01-16	\N	1	11.81	\N	1	1	0.13	1	\N	\N	\N
856	035585111315	Kong Classic Small/Petit  Unidad	\N	56	22	\N	1	1	1	6.83	0.33	9.07	0.10	0.91	Admin	2023-01-16	\N	1	6.83	\N	1	1	0.13	1	\N	\N	\N
857	035585111216	Kong Classic Medium/Moyen  Unidad	\N	56	22	\N	1	1	1	9.27	0.34	12.39	0.10	1.24	Admin	2023-01-16	\N	1	9.27	\N	1	1	0.13	1	\N	\N	\N
858	035585111117	Kong Classic Large/Grand  Unidad	\N	56	22	\N	1	1	1	11.22	0.33	14.87	0.10	1.49	Admin	2023-01-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
859	035585034003	Kong Wobbler Large/Grand  Unidad	\N	56	22	\N	1	1	1	18.44	0.16	21.46	0.10	2.15	Admin	2023-01-16	\N	1	18.44	\N	1	1	0.13	1	\N	\N	\N
860	stickerzone01	Sticker vinil mascotas  Unidad	\N	57	9	\N	100	100	1	0.00	0.01	0.00	0.00	0.00	Admin	2023-01-16	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
861	Metronidazole	Metronidazole 100 ml  Dosis	\N	59	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-01-17	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
862	ST0101	Pet Sticker  Unidad	\N	57	2	\N	1	1	1	1.00	0.77	1.77	0.15	0.27	Admin	2023-01-17	\N	1	1.00	\N	1	1	0.13	1	\N	\N	\N
863	7798176421073	Pipeta Protech 1-4 kg  Unidad	\N	59	33	\N	3	3	1	9.92	0.62	12.83	0.00	0.00	Admin	2023-01-17	\N	1	9.92	\N	1	1	0.13	1	\N	\N	\N
864	7798176421080	Pipeta Protech 5-10 kg  Unidad	\N	59	33	\N	3	3	1	9.27	0.58	14.61	0.00	0.00	Admin	2023-01-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
865	7798176421097	Pipeta Protech 11-25 kg  Unidad	\N	59	33	\N	3	3	1	12.84	0.59	16.37	0.10	1.64	Admin	2023-01-17	\N	1	12.84	\N	1	1	0.13	1	\N	\N	\N
866	7798176421103	pipeta Protech 26-40 kg  Unidad	\N	59	33	\N	3	3	1	14.33	0.54	17.65	0.00	0.00	Admin	2023-01-17	\N	1	14.33	\N	1	1	0.13	1	\N	\N	\N
867	7798176421110	Pipeta Protech +40 kg  Unidad	\N	59	33	\N	3	3	1	16.87	0.51	25.38	0.10	2.54	Admin	2023-01-17	\N	1	16.87	\N	1	1	0.13	1	\N	\N	\N
868	7798176421868	Pipeta Canis Full Spot 1-4 kg  Unidad	\N	59	33	\N	3	3	1	12.08	0.50	18.14	0.10	1.81	Admin	2023-01-17	\N	1	12.08	\N	1	1	0.13	1	\N	\N	\N
869	7798176421875	Pipeta Canis Full Spot  Unidad	\N	59	33	\N	3	3	1	13.01	0.56	20.31	0.10	2.03	Admin	2023-01-17	\N	1	13.01	\N	1	1	0.13	1	\N	\N	\N
870	7798176421882	Pipeta Canis Full Spot  Unidad	\N	59	33	\N	3	3	1	13.93	0.59	22.13	0.10	2.21	Admin	2023-01-17	\N	1	13.93	\N	1	1	0.13	1	\N	\N	\N
871	7798176421899	Pipeta Canis Full Spot 26-40 kg  unidad	\N	59	33	\N	3	3	1	14.87	0.61	23.89	0.00	0.00	Admin	2023-01-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
872	7798176421905	Pipeta Canis Full Spot 41-60 Kg  Unidad	\N	59	33	\N	3	3	1	15.79	0.63	25.66	0.00	0.00	Admin	2023-01-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
873	052742567006	A/D Canine-Feline 5.5 onz  Unidad	\N	1	30	\N	3	3	1	2.78	0.44	4.01	0.05	0.20	Admin	2023-01-17	\N	1	2.78	\N	1	1	0.13	1	\N	\N	\N
874	052742339009	I/D Cuidado Digestivo canino 5.5 onz  Unidad	\N	1	30	\N	3	3	1	2.67	0.50	4.01	0.10	0.40	Admin	2023-01-17	\N	1	2.67	\N	1	1	0.13	1	\N	\N	\N
875	052742462806	I/D Cuidado Digestivo Felino 5.5 onz  Unidad	\N	1	30	\N	3	3	1	2.78	0.42	3.94	0.10	0.39	Admin	2023-01-17	\N	1	2.78	\N	1	1	0.13	1	\N	\N	\N
876	052742623801	C/D Cuidado urinario Felino  Unidad	\N	1	1	\N	3	3	1	2.99	0.31	3.80	0.10	0.38	Admin	2023-01-17	\N	1	2.89	\N	1	1	0.13	1	\N	\N	\N
877	052742701608	U/D Cuidado urinario Canino Pollo 13 onz  Unidad	\N	1	1	\N	1	1	1	3.15	0.44	4.29	0.10	0.43	Admin	2023-01-17	\N	1	3.15	\N	1	1	0.13	1	\N	\N	\N
878	052742014296	I/D Cuidado Digestivo Small Bites 3.3 Lb  Unidad	\N	1	1	\N	1	1	1	13.22	0.34	17.72	0.10	1.77	Admin	2023-01-17	\N	1	13.22	\N	1	1	0.13	1	\N	\N	\N
879	052742024530	Gastrointestinal BIOME 8 Lb  Unidad	\N	1	1	\N	1	1	1	34.64	0.39	48.15	0.10	4.81	Admin	2023-01-17	\N	1	34.64	\N	1	1	0.13	1	\N	\N	\N
880	052742624709	Urinary care C/D 4 Lb  Unidad	\N	1	1	\N	1	1	1	18.47	0.34	24.77	0.10	2.48	Admin	2023-01-17	\N	1	18.47	\N	1	1	0.13	1	\N	\N	\N
881	052742001135	Urinary care C/D 3.3 Lb  Unidad	\N	1	1	\N	1	1	1	13.40	0.34	17.96	0.10	1.80	Admin	2023-01-17	\N	1	13.40	\N	1	1	0.13	1	\N	\N	\N
882	020279992998	PetLac 10.5 onz  Unidad	\N	60	8	\N	1	1	1	10.24	0.39	14.18	0.10	1.42	Admin	2023-01-18	\N	1	10.24	\N	1	1	0.13	1	\N	\N	\N
883	736990040114	Groomers Herbal Shampoo 544 ml  Unidad	\N	61	24	\N	1	1	1	7.43	0.38	10.26	0.10	1.03	Admin	2023-01-18	\N	1	7.43	\N	1	1	0.13	1	\N	\N	\N
884	736990013002	VETERINARY FORMULA HYPOALLERGENIC SHAMPOO 473ML  Unidad	\N	61	24	\N	1	1	1	12.08	0.36	16.37	0.10	1.64	Admin	2023-01-18	\N	1	12.08	\N	1	1	0.13	1	\N	\N	\N
885	736990013309	VETERINARY FORMULA HOT SPOT ITCH RELIEF 473ML  Unidad	\N	61	24	\N	1	1	1	13.93	0.39	19.29	0.10	1.93	Admin	2023-01-18	\N	1	13.93	\N	1	1	0.13	1	\N	\N	\N
886	736990012104	VETERINARY FORMULA ULTRA OATMEAL SHAMPOO 503ML  Unidad	\N	61	24	\N	1	1	1	10.22	0.26	12.88	0.10	1.29	Admin	2023-01-18	\N	1	10.22	\N	1	1	0.13	1	\N	\N	\N
887	736990012050	VF PUPPY LOVE 503 ML  Unidad	\N	61	24	\N	1	1	1	10.22	0.26	12.88	0.10	1.29	Admin	2023-01-18	\N	1	10.22	\N	1	1	0.13	1	\N	\N	\N
888	736990012159	VF TRIPLE STRENGTH 503 ML  Unidad	\N	61	24	\N	1	1	1	10.22	0.26	12.88	0.10	1.29	Admin	2023-01-18	\N	1	10.22	\N	1	1	0.13	1	\N	\N	\N
889	736990012203	VF SNOW WHITE 503 ML  Unidad	\N	61	24	\N	1	1	1	10.22	0.26	12.88	0.10	1.29	Admin	2023-01-18	\N	1	10.22	\N	1	1	0.13	1	\N	\N	\N
890	736990012258	VF SOOTHING & DEODORIZING 503 ML  Unidad	\N	61	24	\N	1	1	1	10.22	0.26	12.88	0.10	1.29	Admin	2023-01-18	\N	1	10.22	\N	1	1	0.13	1	\N	\N	\N
891	742061548007-7.5	Collar Isabelino Betsy #7.5  Unidad	\N	62	31	\N	1	1	1	3.41	0.40	4.77	0.15	0.72	Admin	2023-01-18	\N	1	3.41	\N	1	1	0.13	1	\N	\N	\N
892	742061548007-10	Collar Isabelino Betsy #10  Unidad	\N	62	31	\N	1	1	1	3.89	0.40	6.00	0.15	0.90	Admin	2023-01-18	\N	1	3.89	\N	1	1	0.13	1	\N	\N	\N
893	742061548007-12.5	Collar Isabelino Betsy #12.5  Unidad	\N	62	31	\N	1	1	1	4.76	0.39	7.00	0.15	1.05	Admin	2023-01-18	\N	1	4.76	\N	1	1	0.13	1	\N	\N	\N
894	742061548007-15	Collar Isabelino Betsy #15  Unidad	\N	62	31	\N	1	1	1	5.87	0.47	9.00	0.10	0.90	Admin	2023-01-18	\N	1	5.87	\N	1	1	0.13	1	\N	\N	\N
895	742061548007-20	Collar Isabelino Betsy #20  Unidad	\N	62	31	\N	1	1	1	0.00	0.50	9.29	0.00	0.00	Admin	2023-01-18	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
896	742061548007-25	Collar Isabelino Betsy #25  Unidad	\N	62	31	\N	1	1	1	8.20	0.46	12.00	0.15	1.80	Admin	2023-01-18	\N	1	8.20	\N	1	1	0.13	1	\N	\N	\N
897	742061548007-30	Collar Isabelino Betsy #30  Unidad	\N	62	31	\N	1	1	1	10.92	0.38	15.02	0.15	2.25	Admin	2023-01-18	\N	1	10.92	\N	1	1	0.13	1	\N	\N	\N
898	VDEFE0001	Pipeta Frontline Gato 0.5 ml  Unidad	\N	50	33	\N	1	1	1	11.55	0.49	17.23	0.10	1.72	Admin	2023-01-18	\N	1	11.55	ea $13.50, 5+1 $11.25, 10+3 $10.38, 15+5 $10.13,	1	1	0.13	1	\N	\N	\N
899	VDECA007	Pipeta Frontline Perro 10 kg 0.67 ml  Unidad	\N	50	33	\N	1	1	1	10.00	0.58	14.62	0.10	1.46	Admin	2023-01-18	\N	1	10.00	(5+1 $10), (10+3 $9.25), (15+5 $9),(20+8 $8.57)	1	1	0.13	1	\N	\N	\N
900	VDECA0008	Pipeta Frontline 10-20 kg 1.34 ml  Unidad	\N	50	33	\N	1	1	1	11.55	0.45	15.49	0.10	1.55	Admin	2023-01-18	\N	1	11.55	(5+1 $11.57), (10+3 $10.67), (15+5 $10.41),(20+8 $9.91)	1	1	0.13	1	\N	\N	\N
901	VDECA0009	Pipeta Frontline 20-40 kg 2.68 ml  Unidad	\N	50	33	\N	1	1	1	12.50	0.46	17.70	0.10	1.77	Admin	2023-01-18	\N	1	12.50	(5+1 $13.13), (10+3 $12.12), (15+5 $11.81),(20+8 $11.25)	1	1	0.13	1	\N	\N	\N
902	7798042365722	Total Full LC Perro Chico Hasta 10 kg caja hospitalaria  1 de 60 Tabletas	\N	18	5	\N	60	60	1	1.92	1.53	4.42	0.10	0.44	Admin	2023-01-18	\N	1	1.92	$105 caja, 5+1 $87.50, 10+2 $87.50,	1	1	0.13	1	\N	\N	\N
903	7798042365715	Total Full LC Perros Medianos hasta 20 kg Caja Hospitalaria  1 de 60 Tabletas	\N	18	5	\N	60	60	1	2.42	0.70	3.97	0.10	0.40	Admin	2023-01-18	\N	1	2.42	unidad $140.00, 5+1 y 10+2 $116.67	1	1	0.13	1	\N	\N	\N
904	018214816218	Hueso Tocino Petite Power Chew  Unidad	\N	5	22	\N	1	1	1	2.50	0.59	3.98	0.10	0.40	Admin	2023-01-18	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
905	8886467514722	Dog Comb  Unidad	\N	2	24	\N	1	1	1	0.00	0.60	5.00	0.00	0.00	Admin	2023-01-18	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
906	8886467532122	Dog Collar Collier de Chien  Unidad	\N	2	23	\N	1	1	1	2.17	0.60	3.54	0.10	0.35	Admin	2023-01-18	\N	1	2.17	\N	1	1	0.13	1	\N	\N	\N
907	8699245857337	Cat Litter Lavender Perfumed  Bolsa 5 kg	\N	63	24	\N	1	1	1	5.58	0.43	7.96	0.10	0.80	Admin	2023-01-18	\N	1	5.58	\N	1	1	0.13	1	\N	\N	\N
908	8699245857313	Van Cat Litter Baby Powder Perfumed  Bolsa 5 kg	\N	63	24	\N	1	1	1	5.58	0.43	7.96	0.25	1.99	Admin	2023-01-18	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
909	8699245857405	Cat Litter Baby Powder Perfumed  Bolsa 10 kg	\N	63	24	\N	1	1	1	10.62	0.37	14.60	0.10	1.46	Admin	2023-01-18	\N	1	10.62	\N	1	1	0.13	1	\N	\N	\N
910	8699245857429	Cat Litter Lavender Perfumed  Bolsa 10 kg	\N	63	24	\N	1	1	1	10.62	0.37	14.60	0.00	0.00	Admin	2023-01-18	\N	1	10.62	\N	1	1	0.13	1	\N	\N	\N
911	7800006002724	Apetipet Jarabe  Frasco 100 ml	\N	64	5	\N	1	1	1	8.31	0.47	13.85	0.10	1.39	Admin	2023-01-18	\N	1	8.31	\N	1	1	0.13	1	\N	\N	\N
912	7800006002038	Canifort comprimidos  1 de 50 comprimidos	\N	64	5	\N	50	50	1	1.00	1.65	2.65	0.10	0.27	Admin	2023-01-18	\N	1	1.00	\N	1	1	0.13	1	\N	\N	\N
913	7800006000232	Heprotec Jarabe  Frasco 180 ml	\N	64	5	\N	1	1	1	8.31	0.47	13.85	0.10	1.39	Admin	2023-01-18	\N	1	8.31	\N	1	1	0.13	1	\N	\N	\N
914	7800006003561	MamiStop Perros  Bote 125 gr	\N	64	5	\N	1	1	1	7.00	0.52	10.62	0.00	0.00	Admin	2023-01-18	\N	1	7.00	\N	1	1	0.13	1	\N	\N	\N
915	7800006003370	Naxpet Raza Grande  1 de 50 Tabletas	\N	64	5	\N	50	50	1	0.70	1.53	1.77	0.00	0.00	Admin	2023-01-18	\N	1	0.70	\N	1	1	0.13	1	\N	\N	\N
916	7800006005169	Regepipel Plus Shampoo antiseptico y antimicotico  Frasco 150 ml	\N	64	24	\N	1	1	1	10.00	0.37	13.72	0.00	0.00	Admin	2023-01-18	\N	1	10.00	\N	1	1	0.13	1	\N	\N	\N
917	7800006003646	Rostrum Plus  Frasco 15 ml	\N	64	5	\N	1	1	1	7.00	0.52	10.62	0.00	0.00	Admin	2023-01-18	\N	1	7.00	\N	1	1	0.13	1	\N	\N	\N
918	7800006002700	Rostrum Raza Grande comprimido 150 mg  1 de 50 comprimidos	\N	64	5	\N	50	50	1	1.20	1.21	2.65	0.00	0.00	Admin	2023-01-18	\N	1	1.20	\N	1	1	0.13	1	\N	\N	\N
919	7501072214508	Puppy cachorro pollo en salsa optigrowt  Bolsa 85 gr	\N	15	1	\N	1	1	1	1.58	0.35	1.77	0.10	0.18	Admin	2023-01-19	\N	1	1.77	\N	1	1	0.13	1	\N	\N	\N
920	7501072214560	Kitten gatitos pollo en salsa optigrowt  Bolsa 85 gr	\N	15	1	\N	1	1	1	1.57	0.35	1.77	0.10	0.18	Admin	2023-01-19	\N	1	1.77	\N	1	1	0.13	1	\N	\N	\N
921	7501072214539	Adult gatos adultos salmon en salsa optiprebio  Bolas 85 gr	\N	15	1	\N	1	1	1	1.28	0.38	1.77	0.10	0.18	Admin	2023-01-19	\N	1	1.28	\N	1	1	0.13	1	\N	\N	\N
922	7501072214546	Urinary gatos adultos pollo en salsa optiplus  Bolsa 85 gr	\N	15	1	\N	1	1	1	1.61	0.35	1.77	0.10	0.18	Admin	2023-01-19	\N	1	1.77	\N	1	1	0.13	1	\N	\N	\N
923	7501072214522	Adult gatos adultos pollo en salsa optiprebio  Bolsa 85 gr	\N	15	1	\N	1	1	1	1.77	0.35	1.77	0.10	0.18	Admin	2023-01-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
924	7501072214485	Adult pollo en salsa optihealth  Bolsa 85 gr	\N	15	1	\N	1	1	1	1.39	0.35	1.77	0.10	0.18	Admin	2023-01-19	\N	1	1.42	\N	1	1	0.13	1	\N	\N	\N
925	7798042365739	TotalFull LC Gatos  1 de 60 Tabletas	\N	18	5	\N	60	60	1	2.25	0.77	3.98	0.10	0.40	Admin	2023-01-19	\N	1	2.25	\N	1	1	0.13	1	\N	\N	\N
926	7501072214515	Adult carne en salsa optihealth  Sobre 85 gr	\N	15	37	\N	1	1	1	1.74	0.39	2.39	0.10	0.24	Admin	2023-01-19	\N	1	1.77	\N	1	1	0.13	1	\N	\N	\N
927	7501072214492	Active mind pollo en salsa optiage  Bolsa 85 gr	\N	15	1	\N	1	1	1	1.61	0.35	1.92	0.10	0.19	Admin	2023-01-19	\N	1	1.42	\N	1	1	0.13	1	\N	\N	\N
928	7798042365708	TotalFull Perros Grandes  1 de 72 Tabletas	\N	18	5	\N	72	72	1	3.26	0.59	4.86	0.10	0.49	Admin	2023-01-19	\N	1	3.26	unidad $120.00, 5+1 y 10+2 $183.33	1	1	0.13	1	\N	\N	\N
929	7898416701344	Biothon Perros  Caja de 100 Tabletas	\N	20	5	\N	1	1	1	13.77	0.61	22.13	0.10	2.21	Admin	2023-01-19	\N	1	13.77	unidad $17.70, 7+2 $13.77	1	1	0.13	1	\N	\N	\N
930	7898416701955	Carvobet antidiarreico  Blister de 10	\N	20	5	\N	2	2	1	4.80	0.56	8.19	0.10	0.82	Admin	2023-01-19	\N	1	4.80	Escala caja de 20, 4+1 unidad $5.24	1	1	0.13	1	\N	\N	\N
931	7898416701979	Cortisol  1 de 2 Blister	\N	20	5	\N	1	1	1	2.82	0.56	4.40	0.00	0.00	Admin	2023-01-19	\N	1	2.82	\N	1	1	0.13	1	\N	\N	\N
932	7898416700521	Biofen 10%  Dosis iny	\N	20	5	\N	1	1	1	0.22	18.84	4.42	0.00	0.00	Admin	2023-01-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
933	7898416700743	Biotox  Frasco 40ml	\N	20	24	\N	1	1	1	2.24	0.56	3.50	0.00	0.00	Admin	2023-01-19	\N	1	2.24	\N	1	1	0.13	1	\N	\N	\N
934	105	Hemograma	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.15	1.59	Admin	2023-01-20	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
935	8886467541117	Funny Face  Unidad	\N	2	22	\N	1	1	1	1.82	0.56	2.65	0.10	0.27	Admin	2023-01-21	\N	1	1.82	\N	1	1	0.13	1	\N	\N	\N
936	200	Profilaxis Dental  Unidad	\N	88	17	\N	1	1	1	0.00	47.67	48.67	0.00	0.00	Admin	2023-01-21	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
937	7707214570918	Geri-Form  Frasco 50 Tabletas	\N	66	5	\N	1	1	1	21.21	0.67	35.40	0.10	3.54	Admin	2023-01-23	\N	1	21.21	\N	1	1	0.13	1	\N	\N	\N
938	7707214570949	Feli-Form  Frasco 60 Tabletas	\N	66	5	\N	1	1	1	12.72	0.39	17.70	0.10	1.77	Admin	2023-01-23	\N	1	12.72	\N	1	1	0.13	1	\N	\N	\N
939	7707214573001	Ceruline  Frasco 120 ml	\N	66	5	\N	1	1	1	7.02	0.89	13.27	0.10	1.33	Admin	2023-01-23	\N	1	7.02	\N	1	1	0.13	1	\N	\N	\N
940	7707214570659	Keracleen Shampoo Queratolitico  Frasco 240 ml	\N	66	24	\N	1	1	1	9.50	0.40	13.27	0.10	1.33	Admin	2023-01-23	\N	1	9.50	\N	1	1	0.13	1	\N	\N	\N
941	7707214570833	Mometax  Tubo 15 ml	\N	66	5	\N	1	1	1	9.45	0.87	17.70	0.10	1.77	Admin	2023-01-23	\N	1	9.45	\N	1	1	0.13	1	\N	\N	\N
942	682500939518	PureLuxe Turkey & Salmon  Bolsa de 4 lbs.	\N	67	1	\N	1	1	1	0.00	0.25	18.58	0.10	1.86	Admin	2023-01-24	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
943	682500939679	PureLuxe Small Breed Dogs  Bolsa 4lbs.	\N	67	1	\N	1	1	1	0.00	0.25	18.58	0.10	1.86	Admin	2023-01-24	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
944	45	Total Full suspension  Dosis	\N	18	10	\N	0	0	1	0.00	2.00	5.00	0.00	0.00	Admin	2023-01-24	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
945	90	Total Full Suspension  Dosis	\N	18	5	\N	1	1	1	0.00	2.00	5.00	0.10	0.50	Admin	2023-01-24	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
946	7798176420465	Crema 6A  Tubo 15 g	\N	59	5	\N	1	1	1	6.06	0.39	8.41	0.10	0.84	Admin	2023-01-24	\N	1	6.06	\N	1	1	0.13	1	\N	\N	\N
947	7798176422926	Gerioox  Caja de 30 comprimidos	\N	59	5	\N	1	1	1	31.43	0.27	39.83	0.10	3.98	Admin	2023-01-24	\N	1	31.43	\N	1	1	0.13	1	\N	\N	\N
948	7798176421264	Trihepat  Frasco 100 ml	\N	59	5	\N	1	1	1	12.12	0.31	15.93	0.10	1.59	Admin	2023-01-24	\N	1	12.12	\N	1	1	0.13	1	\N	\N	\N
949	7798176421196	Ciprovet  Frasco 5 ml	\N	59	5	\N	1	1	1	13.24	0.34	17.70	0.10	1.77	Admin	2023-01-24	\N	1	13.24	\N	1	1	0.13	1	\N	\N	\N
950	7798176420458	Tobramax  Frasco 5 ml	\N	59	5	\N	1	1	1	12.12	0.39	16.81	0.10	1.68	Admin	2023-01-24	\N	1	12.12	\N	1	1	0.13	1	\N	\N	\N
951	7798176421202	Tears lagrimas  Frasco 8 ml	\N	59	5	\N	1	1	1	10.24	0.64	16.81	0.10	1.68	Admin	2023-01-24	\N	1	10.24	\N	1	1	0.13	1	\N	\N	\N
952	7798176420410	Otiflex C  Frasco 25 ml	\N	59	5	\N	1	1	1	10.24	0.65	16.86	0.10	1.69	Admin	2023-01-24	\N	1	10.24	\N	1	1	0.13	1	\N	\N	\N
953	7798176420434	Otiflex Limpiador  Frasco 25 ml	\N	59	5	\N	1	1	1	8.78	0.51	13.28	0.10	1.33	Admin	2023-01-24	\N	1	8.78	\N	1	1	0.13	1	\N	\N	\N
954	106	Perfil Prequirurgico  Unidad	\N	89	12	\N	1	1	1	0.00	0.39	0.00	0.00	0.00	Admin	2023-01-24	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
955	107	Perfil Prequirurgico  Unidad	\N	89	12	\N	1	1	1	0.00	38.82	39.82	0.00	0.00	Admin	2023-01-24	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
956	108	Perfil Pre-Quirurgico  Unidad	\N	89	12	\N	1	1	1	0.00	38.82	39.82	0.00	0.00	Admin	2023-01-24	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
957	052742712307	SD Kitten  Bolsa 3.5 lbs	\N	1	1	\N	1	1	1	15.79	0.25	19.74	0.10	1.97	Admin	2023-01-25	\N	1	15.79	\N	1	1	0.13	1	\N	\N	\N
958	052742715605	Hairball Control  Bolsa 3.5 lbs	\N	1	1	\N	1	1	1	15.51	0.40	21.77	0.10	2.18	Admin	2023-01-25	\N	1	15.51	\N	1	1	0.13	1	\N	\N	\N
959	052742187501	Jerky Mini Strips with Real Chicken  Bolsa 7.1 Oz.	\N	1	1	\N	1	1	1	8.27	0.25	10.35	0.10	1.04	Admin	2023-01-25	\N	1	8.27	\N	1	1	0.13	1	\N	\N	\N
960	052742014555	Hypo Treats para perro  Bolsa 12 Oz	\N	1	29	\N	1	1	1	9.41	0.25	11.77	0.10	1.18	Admin	2023-01-25	\N	1	9.41	\N	1	1	0.13	1	\N	\N	\N
961	052742009971	Hypo Treats para Gato  Bolsa 2.5 Oz	\N	1	29	\N	1	1	1	0.00	0.25	6.37	0.10	0.64	Admin	2023-01-25	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
962	052742014531	Metabolic Treats  Bolsa 12 oz	\N	1	1	\N	1	1	1	7.96	0.25	9.95	0.10	1.00	Admin	2023-01-25	\N	1	7.96	\N	1	1	0.13	1	\N	\N	\N
963	052742335902	Natural Soft Savories Beef and Cheddar  Bolsa 8 oz	\N	1	1	\N	1	1	1	8.77	0.33	11.62	0.10	1.16	Admin	2023-01-25	\N	1	8.77	\N	1	1	0.13	1	\N	\N	\N
964	052742005355	SD Adult 7+ Small Bites  Bolsa 4.4 lbs	\N	1	1	\N	1	1	1	15.59	0.31	21.48	0.10	2.15	Admin	2023-01-25	\N	1	15.43	\N	1	1	0.13	1	\N	\N	\N
965	7506407402094	Diuravet  Frasco 10 ml	\N	22	5	\N	1	1	1	0.00	0.43	6.77	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
966	7506407402469	Endovet crema  Tubo 50 gr	\N	22	5	\N	1	1	1	7.38	0.34	9.91	0.10	0.99	Admin	2023-01-26	\N	1	7.38	\N	1	1	0.13	1	\N	\N	\N
967	7506407401691	Imidofin Inyectable  Frasco 10 ml	\N	22	5	\N	1	1	1	0.00	0.34	10.71	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
968	7506407400977	Micofin Tabletas  Sobre 4 Tabletas	\N	22	5	\N	1	1	1	1.86	0.67	3.10	0.10	0.31	Admin	2023-01-26	\N	1	1.86	\N	1	1	0.13	1	\N	\N	\N
969	7506407400618	Dolo-Vet Otico  Gotero 10 ml	\N	22	5	\N	1	1	1	4.15	0.81	7.52	0.10	0.75	Admin	2023-01-26	\N	1	4.15	\N	1	1	0.13	1	\N	\N	\N
970	7506407400625	Dolo-Vet Oftalmico  Gotero 10 ml	\N	22	5	\N	1	1	1	0.00	0.68	6.19	0.10	0.62	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
971	7506407402193	Endovet CES Caja 20 Tabletas  1 de 20 Tabletas	\N	22	5	\N	20	20	1	0.64	0.58	1.02	0.10	0.10	Admin	2023-01-26	\N	1	0.64	\N	1	1	0.13	1	\N	\N	\N
972	8886467581465	Pawise Nature First Cat Wand  Unidad	\N	2	22	\N	1	1	1	2.70	0.61	4.33	0.15	0.65	Admin	2023-01-26	\N	1	2.70	\N	1	1	0.13	1	\N	\N	\N
973	8886467546662	Pawise Rainbow World Gear L  Unidad	\N	2	22	\N	1	1	1	2.15	0.61	3.45	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
974	8886467546655	Pawise Rainbow World Gear M  Unidad	\N	2	22	\N	1	1	1	1.70	0.59	2.70	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
975	8886467546969	Pawise Diamond Life  Unidad	\N	2	22	\N	1	1	1	0.00	0.60	4.64	0.10	0.46	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
976	847922024031	AFP Cat Bowl Blue  Unidad	\N	68	2	\N	1	1	1	2.68	0.60	4.29	0.15	0.64	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
977	847922024048	AFP Cat Bowl Pink  Unidad	\N	68	2	\N	1	1	1	0.00	0.60	4.29	0.15	0.64	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
978	847922027438	AFP Kitty Dome Hut  Unidad	\N	68	22	\N	1	1	1	15.75	0.60	25.20	0.15	3.78	Admin	2023-01-26	\N	1	15.75	\N	1	1	0.13	1	\N	\N	\N
979	847922028084	AFP Fliffer Wand Pink  Unidad	\N	68	22	\N	1	1	1	2.25	0.59	3.59	0.15	0.54	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
980	8010690168821	Ferplast Combination Brush L  Unidad	\N	3	24	\N	1	1	1	0.00	0.60	10.88	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
981	8010690056586	Ferplast Slicker Brush L  Unidad	\N	3	24	\N	1	1	1	0.00	0.61	6.90	0.10	0.69	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
982	8010690091471	Ferplast Slicker Brush Auto S  Unidad	\N	3	24	\N	1	1	1	0.00	0.58	12.83	0.10	1.28	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
983	645095002166	Triple Flex Toothbrush L  Unidad	\N	69	24	\N	1	1	1	3.88	0.60	6.19	0.10	0.62	Admin	2023-01-26	\N	1	3.88	\N	1	1	0.13	1	\N	\N	\N
984	8010690160498	Ferplast Desco Wood 03  Unidad	\N	3	2	\N	1	1	1	0.00	0.59	24.25	0.10	2.42	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
985	8010690058160	Ferplast Kennel Atlas 40 Profesional  Unidad	\N	3	32	\N	1	1	1	56.98	0.59	90.60	0.15	13.59	Admin	2023-01-26	\N	1	56.98	\N	1	1	0.13	1	\N	\N	\N
986	8010690175423	Ferplast Club Correa Reflex G15/120  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	7.02	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
987	6	\N	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
988	8010690175454	Ferplast Club Correa Reflex G20/120  Unidad	\N	3	23	\N	1	1	1	5.40	0.60	8.61	0.15	1.29	Admin	2023-01-26	\N	1	5.40	\N	1	1	0.13	1	\N	\N	\N
989	8010690175478	Ferplast Club Correa Reflex Azul G20/120  Unidad	\N	3	25	\N	1	1	1	5.40	0.60	8.61	0.15	1.29	Admin	2023-01-26	\N	1	5.40	\N	1	1	0.13	1	\N	\N	\N
990	8010690175492	Ferplast Club Correa Reflex G25/120 Rojo  Unidad	\N	3	23	\N	1	1	1	6.60	0.60	10.53	0.15	1.58	Admin	2023-01-26	\N	1	6.60	\N	1	1	0.13	1	\N	\N	\N
991	8010690050096	Ferplast Correa Daytona G15/120 azul  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	7.38	0.10	0.74	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
992	8886467523823	Pawise CozyTime Mat S  Unidad	\N	2	22	\N	1	1	1	11.18	0.59	18.59	0.10	1.86	Admin	2023-01-26	\N	1	11.18	\N	1	1	0.13	1	\N	\N	\N
993	8886467523830	pawise CozyTime Mat M  Unidad	\N	2	22	\N	1	1	1	15.95	0.60	25.44	0.15	3.82	Admin	2023-01-26	\N	1	15.95	\N	1	1	0.13	1	\N	\N	\N
994	8886467523847	Pawise CozyTime Mat L  Unidad	\N	2	22	\N	1	1	1	18.64	0.61	31.24	0.15	4.69	Admin	2023-01-26	\N	1	18.64	\N	1	1	0.13	1	\N	\N	\N
995	8886467545542	Pawise Flash Ball  unidad	\N	2	22	\N	1	1	1	3.50	0.59	5.58	0.10	0.56	Admin	2023-01-26	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
996	8886467546648	Pawise Rainbow world Gear S  Unidad	\N	2	22	\N	1	1	1	0.00	0.58	2.21	0.10	0.22	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
997	8010690053738	Ferplast Cama Dandy 80 Cus Blue  Unidad	\N	3	25	\N	1	1	1	37.30	0.58	58.93	0.15	8.84	Admin	2023-01-26	\N	1	37.30	\N	1	1	0.13	1	\N	\N	\N
998	8010690180076	Ferplast  Cama Chester 50 Cuccia  Beige  Unidad	\N	2	25	\N	1	1	1	14.15	0.59	45.00	0.15	6.75	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
999	8010690180106	Ferplast Cama Chester 60 Cuccia Beige  Unidad	\N	3	25	\N	1	1	1	34.65	0.60	55.44	0.15	8.32	Admin	2023-01-26	\N	1	34.65	\N	1	1	0.13	1	\N	\N	\N
1000	8010690180137	Ferplast Cama Chester 80 cuccia Beige  Unidad	\N	3	25	\N	1	1	1	55.20	0.60	88.32	0.15	13.25	Admin	2023-01-26	\N	1	55.20	\N	1	1	0.13	1	\N	\N	\N
1001	8010690180168	Ferplast Cama Harris 50 Cuccia Beige  Unidad	\N	3	25	\N	1	1	1	24.15	0.60	38.58	0.15	5.79	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1002	8010690180182	Ferplas Cama Harris 65 Cuccia Beige  Unidad	\N	3	25	\N	1	1	1	0.00	0.60	59.21	0.15	8.88	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1003	847922021016	AFP Wooly Mouse  Unidad	\N	68	22	\N	1	1	1	0.00	0.59	3.10	0.15	0.46	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1004	847922021559	AFP Feather Balls  Unidad	\N	68	22	\N	1	1	1	2.65	0.57	4.16	0.15	0.62	Admin	2023-01-26	\N	1	2.65	\N	1	1	0.13	1	\N	\N	\N
1005	847922021580	AFP Fluffy Wand  Unidad	\N	68	22	\N	1	1	1	0.00	0.57	3.81	0.00	0.00	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1006	847922021610	AFP Magic Wing Wand  Unidad	\N	68	22	\N	1	1	1	2.50	0.58	3.94	0.10	0.39	Admin	2023-01-26	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
1007	8010690042084	Ferplast Correa Daytona GM25/45 Blue  Unidad	\N	3	23	\N	1	1	1	5.50	0.61	8.83	0.15	1.32	Admin	2023-01-26	\N	1	5.50	\N	1	1	0.13	1	\N	\N	\N
1008	8010690012308	Ferplast Correa Club G20/120 rojo  Unidad	\N	3	23	\N	1	1	1	4.05	0.58	6.40	0.15	0.96	Admin	2023-01-26	\N	1	4.05	\N	1	1	0.13	1	\N	\N	\N
1009	8010690012674	Ferplast Correa Club G25/120  Unidad	\N	3	23	\N	1	1	1	5.05	0.58	7.98	0.15	1.20	Admin	2023-01-26	\N	1	5.05	\N	1	1	0.13	1	\N	\N	\N
1010	8010690140346	Ferplast Arnes Agila Fluo 3  Unidad	\N	3	23	\N	1	1	1	12.30	0.60	19.69	0.15	2.95	Admin	2023-01-26	\N	1	12.30	\N	1	1	0.13	1	\N	\N	\N
1011	8010690140360	Ferplast Arness Agila Fluo 5  Unidad	\N	3	23	\N	1	1	1	13.50	0.60	21.54	0.15	3.23	Admin	2023-01-26	\N	1	13.50	\N	1	1	0.13	1	\N	\N	\N
1012	8010690140377	Ferplast Arnes Agila Fluo 6  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	23.85	0.10	2.38	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1013	8010690140384	Ferplast Arnes Agila Fluo 7  Unidad	\N	3	23	\N	1	1	1	15.45	0.58	24.47	0.15	3.67	Admin	2023-01-26	\N	1	15.45	\N	1	1	0.13	1	\N	\N	\N
1014	8010690172033	Ferplast Colchon Oscar 120 Cuscino Grigio  Unidad	\N	3	25	\N	1	1	1	79.30	0.59	126.32	0.15	18.95	Admin	2023-01-26	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1015	8010690053677	Ferplast Cama Dandy 45 Cus  Unidad	\N	3	25	\N	1	1	1	12.75	0.60	20.40	0.15	3.06	Admin	2023-01-26	\N	1	12.75	\N	1	1	0.13	1	\N	\N	\N
1016	8010690053714	Ferplast Cama Dandy 65 cus  Unidad	\N	3	25	\N	1	1	1	23.25	0.57	36.50	0.15	5.48	Admin	2023-01-26	\N	1	23.25	\N	1	1	0.13	1	\N	\N	\N
1017	109	Sangre Oculta en heces  Unidad	\N	89	12	\N	1	1	1	0.00	4.31	5.31	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1018	110	Glucosa  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1019	111	Albumina  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.10	1.06	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1020	112	Proteina Serica  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1021	113	Colesterol  Unidad	\N	89	12	\N	1	1	1	0.00	26.31	9.56	0.15	1.43	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1022	114	Colesterol HDL  Unidad	\N	89	12	\N	1	1	1	0.00	28.50	10.62	0.15	1.59	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1023	115	Colesterol LDL  Unidad	\N	89	12	\N	1	1	1	0.00	28.50	10.62	0.15	1.59	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1024	116	Trigliceridos  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.15	1.19	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1025	117	Acido Urico  Unidad	\N	89	12	\N	1	1	1	0.00	7.85	8.85	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1026	118	Creatinina  Unidad	\N	89	12	\N	1	1	1	0.00	38.82	9.56	0.10	0.96	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1027	119	Bilirrubina Total  Unidad	\N	89	12	\N	1	1	1	0.00	2.98	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1028	120	Bilirrubina Directa  Unidad	\N	89	12	\N	1	1	1	0.00	1.65	2.65	0.15	0.40	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1029	121	Bilirrubina Indirecta  Unidad	\N	89	12	\N	1	1	1	0.00	0.42	3.54	0.15	0.53	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1030	122	PCR  Unidad	\N	89	12	\N	1	1	1	0.00	14.93	15.93	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1031	123	TGO / ALT  Unidad	\N	89	12	\N	1	1	1	0.00	16.70	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1032	124	TGP / AST  Unidad	\N	89	12	\N	1	1	1	0.00	16.70	7.96	0.10	0.80	Admin	2023-01-27	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1033	125	Amilasa  Unidad	\N	89	12	\N	1	1	1	0.00	8.56	9.56	0.10	0.96	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1034	126	Lipasa  Unidad	\N	89	12	\N	1	1	1	0.00	11.74	12.74	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1035	127	Globulina  Unidad	\N	89	12	\N	1	1	1	0.00	1.65	2.65	0.15	0.40	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1036	128	Relacion A/G  Unidad	\N	89	12	\N	1	1	1	0.00	0.33	1.33	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1037	129	Urea  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.15	1.19	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1038	130	Leucograma  Unidad	\N	89	12	\N	1	1	1	0.00	3.65	4.65	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1039	131	Reticulocitos  Unidad	\N	89	12	\N	1	1	1	0.00	4.31	5.31	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1040	132	Frotis de sangre periferica  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.15	1.19	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1041	133	Gota gruesa  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.15	1.59	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1042	134	Nitrogeno Ureico  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1043	135	GGT  Unidad	\N	89	12	\N	1	1	1	0.00	0.33	7.96	0.15	1.19	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1044	136	Fosfatasa Alcalina  Unidad	\N	89	12	\N	1	1	1	0.00	16.69	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1045	137	Ferritina  Unidad	\N	89	12	\N	1	1	1	0.00	29.97	30.97	0.15	4.65	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1046	138	Sodio  Unidad	\N	89	12	\N	1	1	1	0.00	2.19	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1047	139	Potasio  Unidad	\N	89	12	\N	1	1	1	0.00	2.19	7.96	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1048	140	Cloro  Unidad	\N	89	12	\N	1	1	1	0.00	6.96	7.96	0.15	1.19	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1049	141	Calcio  Unidad	\N	89	12	\N	1	1	1	0.00	2.19	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1050	142	Dimero D  Unidad	\N	89	12	\N	1	1	1	0.00	65.37	66.37	0.15	9.96	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1051	143	Magnesio  Unidad	\N	89	12	\N	1	1	1	0.00	2.19	7.96	0.10	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1052	144	Fosforo  Unidad	\N	89	12	\N	1	1	1	0.00	2.19	7.96	0.15	1.19	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1053	145	Tiempo de protrombina  Unidad	\N	89	12	\N	1	1	1	0.00	4.31	5.31	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1054	146	Tiempo de tromboplastina  Unidad	\N	89	12	\N	1	1	1	0.00	4.31	5.31	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1055	147	Flotacion  Unidad	\N	89	12	\N	1	1	1	0.00	5.64	6.64	0.15	1.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1056	148	Prueba Azul de Metileno  Unidad	\N	89	12	\N	1	1	1	0.00	4.31	5.31	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1057	149	Conteo de huevos  Unidad	\N	89	12	\N	1	1	1	0.00	5.64	6.64	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1058	150	Helicobacter Pilory en heces  Unidad	\N	89	12	\N	1	1	1	0.00	21.12	22.12	0.15	3.32	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1059	151	T3 Total  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1060	152	T4 Total  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1061	153	TSH  Unidad	\N	89	12	\N	1	1	1	0.00	14.93	15.93	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1062	154	T3 Libre  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1063	155	T4 Libre  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.00	0.00	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1064	156	Leucemia Felina  Unidad	\N	89	12	\N	1	1	1	0.00	29.97	30.97	0.15	4.65	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1065	157	Coloracion de Gram  Unidad	\N	89	12	\N	1	1	1	0.00	4.31	5.31	0.15	0.80	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1066	158	Cultivo y Antibiograma  Unidad	\N	89	12	\N	1	1	1	0.00	12.27	13.27	0.15	1.99	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1067	159	Coprocultivo  Unidad	\N	89	12	\N	1	1	1	0.00	12.27	13.27	0.15	1.99	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1068	160	Cultivo de Hongo + KOH  Unidad	\N	89	12	\N	1	1	1	0.00	29.97	30.97	0.15	4.65	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1069	161	Hemocultivo  Unidad	\N	89	12	\N	1	1	1	0.00	29.97	30.97	0.15	4.65	Admin	2023-01-27	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1070	074198612277	Taste of the Wild canine formula with Bison and Roasted 2 kg  Unidad	\N	70	1	\N	1	1	1	11.95	0.33	15.93	0.10	1.59	Admin	2023-01-28	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1071	074198612413	Taste of the Wild Puppy Formula Bison and Roasted 2 kg  Unidad	\N	70	1	\N	1	1	1	11.83	0.33	15.93	0.10	1.59	Admin	2023-01-28	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1072	074198613311	Taste Of The Wild Canine formula With Venison and Legumes  Unidad	\N	70	1	\N	1	1	1	11.95	0.31	15.67	0.10	1.57	Admin	2023-01-28	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1073	074198612345	Taste of the Wilde Sierra Montain Canine formula With Roasted Lamb Grain Free  Unidad	\N	70	1	\N	1	1	1	11.92	0.35	16.13	0.10	1.61	Admin	2023-01-28	\N	1	11.81	\N	1	1	0.13	1	\N	\N	\N
1074	074198612499	taste of the Wild Sounthwest Canyon Canine Formula With Wild Board 2 kg  Unidad	\N	70	1	\N	1	1	1	11.66	0.42	15.93	0.10	1.59	Admin	2023-01-28	\N	1	11.87	\N	1	1	0.13	1	\N	\N	\N
1075	8886467523356	\N	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-01-30	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1076	7501072210685	Proplan Puppy Razas Medianas 17.5 kg  Unidad	\N	15	1	\N	1	1	1	90.12	0.35	121.59	0.10	12.16	Admin	2023-01-30	\N	1	90.12	\N	1	1	0.13	1	\N	\N	\N
1077	020279995227	Bene-Bac Plus  4 pack 1 gramo	\N	60	5	\N	1	1	1	3.28	0.25	4.12	0.10	0.41	Admin	2023-01-30	\N	1	3.28	\N	1	1	0.13	1	\N	\N	\N
1078	020279995173	Bene-Bac Plus  Gel 15 gr	\N	60	5	\N	1	1	1	6.97	0.27	8.85	0.10	0.88	Admin	2023-01-30	\N	1	6.97	\N	1	1	0.13	1	\N	\N	\N
1259	178988989	jarabe para la tos  frasco 100 ml	\N	24	5	\N	1	1	1	0.00	0.50	0.00	0.10	0.00	Admin	2023-02-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1079	FARM044	Cani Tabs Daily Multi Puppy  Frasco 100 Tabletas	\N	71	5	\N	1	1	1	8.34	0.59	13.27	0.10	1.33	Admin	2023-01-30	\N	1	8.34	\N	1	1	0.13	1	\N	\N	\N
1080	FARM046	Cani Tabs Daily Multi Senior  Frasco 100 Tabletas	\N	71	5	\N	1	1	1	8.56	0.60	13.72	0.10	1.37	Admin	2023-01-31	\N	1	8.56	\N	1	1	0.13	1	\N	\N	\N
1081	FARM141	Diuride 500 50 ml  Dosis	\N	72	5	\N	50	50	1	0.00	40.12	4.42	0.00	0.00	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1082	7593990010041	Cat Playing Happy Circle  Unidad	\N	74	22	\N	1	1	1	0.00	0.55	6.51	0.15	0.98	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1083	9003579001172	Adult Persian  Pouch 85 gr	\N	6	37	\N	12	12	1	1.75	0.47	2.57	0.10	0.26	Admin	2023-01-31	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
1084	9333527377852	Microfibre Pet Towel 92x46 cm  unidad	\N	75	24	\N	1	1	1	0.00	0.50	4.65	0.10	0.46	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1085	9333527329240	Cozy Fleece Mat 75x50 cm  Unidad	\N	75	25	\N	1	1	1	0.00	0.50	15.27	0.00	0.00	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1086	6920190048764	Dog Leash  Unidad	\N	74	2	\N	1	1	1	0.00	0.54	9.34	0.00	0.00	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1087	811794010850	DeShedding Small Dog  Unidad	\N	76	2	\N	1	1	1	0.00	0.50	10.44	0.15	1.57	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1088	3182550702614	Persian Adult  Bolsa 2 kg	\N	6	1	\N	1	1	1	26.75	0.36	36.50	0.05	1.83	Admin	2023-01-31	\N	1	26.75	\N	1	1	0.13	1	\N	\N	\N
1089	9333527443670	cat Play Sack  Unidad	\N	75	2	\N	1	1	1	0.00	0.55	17.52	0.15	2.63	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1090	9003579308936	Instinctive  Pouch 85 gr	\N	6	37	\N	12	12	1	1.70	0.38	2.35	0.10	0.23	Admin	2023-01-31	\N	1	1.70	\N	1	1	0.13	1	\N	\N	\N
1091	3182550768474	Satiety Weight Management Gato  Bolsa 1.5 kg	\N	6	1	\N	1	1	1	22.00	0.35	29.65	0.10	2.97	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1092	9333527426642	Cozy Pet Bed 45x56 cm  Unidad	\N	75	25	\N	1	1	1	0.00	0.50	26.24	0.15	3.94	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1093	9333527230447	Cozy Fleece Bed 55x15 cm  Unidad	\N	75	25	\N	1	1	1	0.00	0.50	25.09	0.10	2.51	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1094	9333527329257	Cozy Fleece Mat 90x60 cm  Unidad	\N	75	25	\N	1	1	1	0.00	0.50	20.58	0.15	3.09	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1095	9333527586469	Plush Pet Bed  Unidad	\N	75	25	\N	1	1	1	0.00	0.50	33.85	0.15	5.08	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1096	1234567890128	Dog Leash with Arness  Unidad	\N	74	23	\N	1	1	1	0.00	0.55	9.96	0.10	1.00	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1097	9003579018514	Sensory Smell  Pouch 85 gr	\N	6	37	\N	12	12	1	1.70	0.38	2.35	0.10	0.23	Admin	2023-01-31	\N	1	1.70	\N	1	1	0.13	1	\N	\N	\N
1098	7453105056978	cat Brush  Unidad	\N	75	24	\N	1	1	1	0.00	0.56	3.10	0.00	0.00	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1099	9003579013557	Gastrointestinal Gato  Pouch 85 gr	\N	6	37	\N	12	12	1	1.75	0.47	2.57	0.10	0.26	Admin	2023-01-31	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
1100	300	Placa Rayos X  Unidad	\N	90	13	\N	1	1	1	0.00	21.12	22.12	0.15	3.32	Admin	2023-01-31	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1101	301	Placa Rayos X Doble  Unidad	\N	90	13	\N	1	1	1	0.00	34.40	35.40	0.25	8.85	Admin	2023-01-31	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1102	302	Ultrasonografia  Unidad	\N	90	14	\N	1	1	1	0.00	29.97	30.97	0.15	4.65	Admin	2023-01-31	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1103	7593990050511	Dog leashes  and Harness  Unidad	\N	74	23	\N	1	1	1	0.00	0.50	7.83	0.15	1.17	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1104	7593990012953	Bolsa Higienica Maxcotas  unidad	\N	74	24	\N	1	1	1	0.00	0.51	2.87	0.15	0.43	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1105	7593990010058	Cat Playing Happy Circle 2  Unidad	\N	74	22	\N	1	1	1	0.00	0.51	6.33	0.10	0.63	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1106	4894158096291	Cat Little tray With Scoop  Unidad	\N	75	24	\N	1	1	1	0.00	0.50	26.24	0.10	2.62	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1107	9333527341037	Pet Blanket 100x70 cm  Unidad	\N	75	24	\N	1	1	1	0.00	0.50	2.65	0.10	0.27	Admin	2023-01-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1108	M9D22838-S	Ropa para Mascota talla s  Unidad	\N	74	15	\N	1	1	1	2.57	0.50	3.85	0.10	0.39	Admin	2023-02-01	\N	1	2.57	\N	1	1	0.13	1	\N	\N	\N
1109	M9D22838-M	Ropa para mascota talla M  Unidad	\N	74	15	\N	1	1	1	0.00	0.55	3.98	0.10	0.40	Admin	2023-02-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1110	M9D22838-L	Ropa para mascotas talla L  Unidad	\N	74	15	\N	1	1	1	2.57	0.61	4.12	0.10	0.41	Admin	2023-02-01	\N	1	2.57	\N	1	1	0.13	1	\N	\N	\N
1111	M9D22838-XL	Ropa para mascotas talla XL  Unidad	\N	74	15	\N	1	1	1	0.00	0.66	4.25	0.10	0.42	Admin	2023-02-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1112	M9D22868	Dispensador para agua 2.5 lt  unidad	\N	74	2	\N	1	1	1	0.00	0.50	10.44	0.10	1.04	Admin	2023-02-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1113	M9D22826	Dispensador de agua grande 2.5 lt  Unidad	\N	74	2	\N	1	1	1	0.00	0.50	14.29	0.15	2.14	Admin	2023-02-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1114	M9D228135	Plato de acero con dispensador de agua para gatos  Unidad	\N	74	35	\N	1	1	1	0.00	0.56	8.05	0.15	1.21	Admin	2023-02-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1115	7416203101926	Dispensador de agua para mascotas pequeño  Unidad	\N	9	2	\N	1	1	1	0.00	0.61	6.02	0.10	0.60	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1116	6953182714972	Water Dispenser Cylinder 3.5 lt  Unidad	\N	9	2	\N	1	1	1	0.00	0.60	19.12	0.15	2.87	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1117	6953182719571	play Dog Toy Cerdito  Unidad	\N	31	22	\N	1	1	1	0.00	0.60	7.52	0.10	0.75	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1118	6953182720072	Tasty Treet Dispenser  Unidad	\N	31	2	\N	1	1	1	0.00	0.60	6.88	0.00	0.00	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1119	6953182718062	Cat Scratcher Build it big Ben  Unidad	\N	31	22	\N	1	1	1	0.00	0.60	0.00	0.00	0.00	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1120	7416203102183	Hueso de Vinyle  Unidad	\N	9	22	\N	1	1	1	1.95	0.60	3.12	0.10	0.31	Admin	2023-02-02	\N	1	1.95	\N	1	1	0.13	1	\N	\N	\N
1121	7416203100684	Camisa petlife talla 10  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	8.00	0.15	1.20	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1122	7416203100677	Camisa Petlife talla 8  Unidad	\N	9	25	\N	1	1	1	5.00	0.60	8.00	0.15	1.20	Admin	2023-02-02	\N	1	5.00	\N	1	1	0.13	1	\N	\N	\N
1123	7416203100660	Camisa Petlife talla 6  Unidad	\N	9	25	\N	1	1	1	4.75	0.60	7.60	0.15	1.14	Admin	2023-02-02	\N	1	4.75	\N	1	1	0.13	1	\N	\N	\N
1124	7416203100653	Camisa petlife talla 4  Unidad	\N	9	25	\N	1	1	1	4.75	0.60	7.60	0.15	1.14	Admin	2023-02-02	\N	1	4.75	\N	1	1	0.13	1	\N	\N	\N
1125	7416203100646	Camisa petlife talla 2  Unidad	\N	9	25	\N	1	1	1	4.50	0.60	7.20	0.15	1.08	Admin	2023-02-02	\N	1	4.50	\N	1	1	0.13	1	\N	\N	\N
1126	7416203100639	Camisa Petlife Talla 0  Unidad	\N	9	25	\N	1	1	1	4.50	0.60	7.20	0.15	1.08	Admin	2023-02-02	\N	1	4.50	\N	1	1	0.13	1	\N	\N	\N
1127	7416203103357	Camisa Petlife talla Extra pequeña  Unidad	\N	9	25	\N	1	1	1	4.50	0.60	7.20	0.15	1.08	Admin	2023-02-02	\N	1	4.50	\N	1	1	0.13	1	\N	\N	\N
1128	6953182710820	tasty Treet dispenser Hueso  Unidad	\N	31	2	\N	1	1	1	0.00	0.60	6.32	0.00	0.00	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1129	7416203101179	Pet Grooming Tools cortauñas  Unidad	\N	9	24	\N	1	1	1	4.00	0.85	7.39	0.10	0.74	Admin	2023-02-02	\N	1	4.00	\N	1	1	0.13	1	\N	\N	\N
1130	030172013850	Plato para hamster  Unidad	\N	9	35	\N	1	1	1	0.00	0.60	2.85	0.10	0.28	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1131	7416203100615	Vestido Petlife talla 8  Unidad	\N	9	2	\N	1	1	1	5.00	0.60	8.00	0.10	0.80	Admin	2023-02-02	\N	1	5.00	\N	1	1	0.13	1	\N	\N	\N
1132	74 6203100578	Vestido Petlife talla 0  Unidad	\N	9	15	\N	1	1	1	0.00	0.60	0.00	0.00	0.00	Admin	2023-02-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1133	7416203103364	Vestido Petlife talla Extra Pequeña  Unidad	\N	9	2	\N	1	1	1	4.50	0.60	7.20	0.10	0.72	Admin	2023-02-03	\N	1	4.50	\N	1	1	0.13	1	\N	\N	\N
1134	7416203100608	Vestido Petlife talla 6  Unidad	\N	9	2	\N	1	1	1	4.75	0.60	7.60	0.10	0.76	Admin	2023-02-03	\N	1	4.75	\N	1	1	0.13	1	\N	\N	\N
1135	7416203100592	Vestido Petlife talla 4  Unidad	\N	9	2	\N	1	1	1	4.75	0.60	7.60	0.10	0.76	Admin	2023-02-03	\N	1	4.75	\N	1	1	0.13	1	\N	\N	\N
1136	7416203100585	vestido Petlife talla 2  Unidad	\N	9	2	\N	1	1	1	0.00	0.60	7.20	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1137	7416203100622	Vestido Petlife talla 10  Unidad	\N	9	2	\N	1	1	1	5.00	0.60	8.00	0.00	0.00	Admin	2023-02-03	\N	1	5.00	\N	1	1	0.13	1	\N	\N	\N
1138	8010690067339	Rekord 2 Bianca gabbia Jaula pajaro  Unidad	\N	3	32	\N	1	1	1	32.41	0.60	51.86	0.25	12.96	Admin	2023-02-03	\N	1	32.41	\N	1	1	0.13	1	\N	\N	\N
1139	847922021191	AFP Octopus Wand  Unidad	\N	68	22	\N	1	1	1	2.80	0.60	4.47	0.10	0.45	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1140	8886467545412	TPR Ball with Rope Pawise  Unidad	\N	2	2	\N	1	1	1	2.25	0.61	3.63	0.10	0.36	Admin	2023-02-03	\N	1	2.25	\N	1	1	0.13	1	\N	\N	\N
1141	8010690056630	Nails Cutter Pequeño Ferplast  Unidad	\N	3	24	\N	1	1	1	2.82	0.60	4.51	0.10	0.45	Admin	2023-02-03	\N	1	2.82	\N	1	1	0.13	1	\N	\N	\N
1142	8010690056654	nails Cutter Ferplast  Unidad	\N	3	24	\N	1	1	1	5.60	0.60	8.98	0.10	0.90	Admin	2023-02-03	\N	1	5.60	\N	1	1	0.13	1	\N	\N	\N
1143	8010690160474	Glam Extra Small Red Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.06	0.15	0.61	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1144	8010690160443	Glam Extra Small Ligth Blue Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.06	0.15	0.61	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1145	8010690160481	Glam Extra Small Acid Green Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.06	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1146	8010690148977	Glam Small Light Blue Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.99	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1147	8010690149004	Glam Small Red Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.99	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1148	8010690149011	Glam Small Acid Green Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	4.99	0.15	0.75	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1149	8010690149059	Glam Medium Red Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.64	6.19	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1150	8010690149066	Glam medium Acid Green Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	6.59	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1151	8010690149028	Glam Medium light Blue Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.64	6.64	0.15	1.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1152	8010690149103	Glam large Acid Green Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	8.62	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1153	8010690149073	Glam Large Light Blue Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	8.62	0.10	0.86	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1154	8010690149097	Glam Large Red Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	8.62	0.00	0.00	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1155	8010690059082	Pelota deportiva Ferplast  Unidad	\N	3	22	\N	1	1	1	4.55	0.60	7.30	0.10	0.73	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1156	8886467541131	Funy Face Pawise  Unidad	\N	2	22	\N	1	1	1	1.66	0.62	2.52	0.10	0.25	Admin	2023-02-03	\N	1	1.66	\N	1	1	0.13	1	\N	\N	\N
1157	8010690153124	Magnus Slow Large Ciotola Ferplast  Unidad	\N	3	22	\N	1	1	1	0.00	0.60	12.24	0.10	1.22	Admin	2023-02-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1158	8010690153100	Magnus Slow Small Ciotola Ferplast  Unidad	\N	3	22	\N	1	1	1	4.20	0.60	6.72	0.15	1.01	Admin	2023-02-03	\N	1	4.20	\N	1	1	0.13	1	\N	\N	\N
1159	8010690088457	Hairpins Ferplast  Unidad	\N	3	2	\N	1	1	1	2.65	0.60	4.25	0.10	0.43	Admin	2023-02-03	\N	1	2.65	\N	1	1	0.13	1	\N	\N	\N
1160	8010690068121	Correa Twin 10/36  Unidad	\N	3	23	\N	1	1	1	2.90	0.60	4.64	0.00	0.00	Admin	2023-02-04	\N	1	2.90	\N	1	1	0.13	1	\N	\N	\N
1161	8010690068138	Correa Twin 15/42  Unidad	\N	3	23	\N	1	1	1	0.00	0.60	6.80	0.00	0.00	Admin	2023-02-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1162	7416203100578	Vestido Petlife talla 0  Unidad	\N	9	15	\N	1	1	1	4.50	0.60	7.20	0.10	0.72	Admin	2023-02-06	\N	1	4.50	\N	1	1	0.13	1	\N	\N	\N
1163	5414736039282	Revolution 6% Cachorros  pipeta 1 de 3	\N	13	33	\N	3	3	1	11.11	0.35	12.66	0.10	1.27	Admin	2023-02-06	\N	1	11.11	\N	1	1	0.13	1	\N	\N	\N
1164	662858226003	Vacuna Quintuple Canina NOVIVAC Dappv+L4  Unidad	\N	77	36	\N	1	1	1	3.41	3.67	15.93	0.00	0.00	Admin	2023-02-06	\N	1	3.41	\N	1	1	0.13	1	\N	\N	\N
1165	400	Traslado de mascota  Zona de Santa Tecla	\N	91	16	\N	1	1	1	0.00	0.77	1.77	0.00	0.00	Admin	2023-02-06	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1166	401	Traslado de mascota  Zona fuera de Santa Tecla	\N	91	16	\N	1	1	1	0.00	5.19	2.66	0.50	1.33	Admin	2023-02-06	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1167	URIVET	Urivet Bladder y PH  Caja 30 Tabletas	\N	78	5	\N	1	1	1	9.65	0.38	13.27	0.10	1.33	Admin	2023-02-07	\N	1	9.65	\N	1	1	0.13	1	\N	\N	\N
1168	ARTROVET	Artrovet Joint y Mobility  Caja 30 Tabletas	\N	78	5	\N	1	1	1	0.00	0.32	21.24	0.10	2.12	Admin	2023-02-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1169	OPTIVET	Optivet Multivitaminas  Caja 30 Tabletas	\N	78	5	\N	1	1	1	6.25	0.49	9.29	0.10	0.93	Admin	2023-02-07	\N	1	6.25	\N	1	1	0.13	1	\N	\N	\N
1170	ANXIVET	Anxivet Estres y Ansiedad  Caja 30 Tabletas	\N	78	5	\N	1	1	1	0.00	0.62	13.27	0.10	1.33	Admin	2023-02-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1171	cardiovet	CARDIOVET Cardiotonico y Energia  Frasco 30 tabletas	\N	78	5	\N	1	1	1	9.65	0.65	15.93	0.10	1.59	Admin	2023-02-07	\N	1	9.65	\N	1	1	0.13	1	\N	\N	\N
1172	HEPATOVET	Hepatovet Digestion y Pancreas  Caja 30 Tabletas	\N	78	5	\N	1	1	1	8.57	0.55	13.27	0.10	1.33	Admin	2023-02-07	\N	1	8.57	\N	1	1	0.13	1	\N	\N	\N
1173	7798144993663	APRAX Razas Medianas 10 kg de peso  1 de 60 Tabletas	\N	79	5	\N	60	60	1	0.00	2.05	3.54	0.10	0.35	Admin	2023-02-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1174	doramectina	Doramectina 1% Dosis  Frasco 50 ml	\N	78	5	\N	90	90	1	0.00	18.27	3.54	0.00	0.00	Admin	2023-02-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1175	gentamicina	Gentamicina 5% Dosis  Frasco 100 ml	\N	78	5	\N	55	55	1	0.00	28.82	4.43	0.00	0.00	Admin	2023-02-07	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1176	9003579018941	Sensory Feel  Pouch 85 gr	\N	6	37	\N	12	12	1	1.70	0.38	2.35	0.10	0.23	Admin	2023-02-07	\N	1	1.70	\N	1	1	0.13	1	\N	\N	\N
1177	9003579018866	Sensory Taste  Pouch 85 gr	\N	6	37	\N	12	12	1	1.70	0.38	2.35	0.10	0.23	Admin	2023-02-07	\N	1	1.70	\N	1	1	0.13	1	\N	\N	\N
1178	662858207224	Vacuna Quintuple gatos novibac HCPCH+ FELIV  Unidad	\N	77	36	\N	1	1	1	7.81	1.04	15.93	0.20	3.19	Admin	2023-02-08	\N	1	7.81	\N	1	1	0.13	1	\N	\N	\N
1179	8010690156156	Rascador Pequeño  Unidad	\N	3	2	\N	1	1	1	3.48	0.40	4.87	0.15	0.73	Admin	2023-02-09	\N	1	3.48	\N	1	1	0.13	1	\N	\N	\N
1180	8010690156163	Rascador Mediano  Unidad	\N	3	2	\N	1	1	1	0.00	0.37	7.52	0.15	1.13	Admin	2023-02-09	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1181	ij-02	Arnes damasco reflect IJ02 M  Unidad	\N	9	23	\N	1	1	1	12.35	0.60	19.76	0.15	2.96	Admin	2023-02-10	\N	1	12.35	\N	1	1	0.13	1	\N	\N	\N
1182	BL-02	Arnes Ajustable mas  correa BL02 M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.03	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1183	VT-02	Arnes Reflect c/ bolsa UT02 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.67	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1184	VT-01	Arnes Reflect c/bolsa UT01 XS  Unidad	\N	9	23	\N	1	1	1	0.00	0.61	12.74	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1185	LM-01	Arnes Chaleco Cuadros LM01 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1186	LM-02	Arnes Chaleco Cuadros ML02 M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1187	LM-03	Arnes chaleco cuadros ML03 L  Unidad	\N	9	23	\N	1	1	1	7.04	0.60	11.26	0.10	1.13	Admin	2023-02-10	\N	1	7.04	\N	1	1	0.13	1	\N	\N	\N
1188	TU01	Arnes Ajust+correa c/rayas tu01  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	5.31	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1189	SU02	Arnes + correa c/cuadros SU02 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	7.79	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1190	KD01	Correa de lazo multicolor KD01  unidad	\N	9	23	\N	1	1	1	0.00	0.60	3.54	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1191	KP01S	Collar+correa multicolor KP01 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	4.18	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1192	AC01	Arnes ajust+correa Confort AC01 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	8.43	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1193	MN03	Arnes Ajustable service Dog MN05 XL  Unidad	\N	9	23	\N	1	1	1	11.46	0.60	16.93	0.15	2.54	Admin	2023-02-10	\N	1	11.46	\N	1	1	0.13	1	\N	\N	\N
1194	QR01	Arnes Chal+correa c/figura QR01 XS  Unidas	\N	9	23	\N	1	1	1	0.00	0.60	7.01	0.00	0.00	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1195	KR01	Correa de Lazo c/resorte KR01 12 MM  Unidad	\N	9	23	\N	1	1	1	3.10	0.60	4.96	0.10	0.50	Admin	2023-02-10	\N	1	3.10	\N	1	1	0.13	1	\N	\N	\N
1196	P1118-PP-B7	Plato estampado pequeño  Unidad	\N	9	35	\N	1	1	1	2.48	0.61	3.98	0.15	0.60	Admin	2023-02-10	\N	1	2.48	\N	1	1	0.13	1	\N	\N	\N
1197	FC088	Caja para gato  Unidad	\N	80	22	\N	1	1	1	0.00	0.33	19.91	0.15	2.99	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1198	052742005188	Adult 1-6 Small Bites Hills SD  Unidad	\N	1	1	\N	1	1	1	15.76	0.33	19.46	0.10	1.95	Admin	2023-02-10	\N	1	16.60	\N	1	1	0.13	1	\N	\N	\N
1199	8410650168104	Advance urinary 12 kg  Unidad	\N	39	1	\N	1	1	1	75.40	0.24	93.81	0.10	9.38	Admin	2023-02-10	\N	1	75.40	\N	1	1	0.13	1	\N	\N	\N
1200	8410650152288	Advance Renal Dog 3 kg  Unidad	\N	39	1	\N	1	1	1	20.88	0.31	27.26	0.10	2.73	Admin	2023-02-10	\N	1	20.88	\N	1	1	0.13	1	\N	\N	\N
1201	8410650168128	Advance Renal Dog 12 kg  Unidad	\N	39	1	\N	1	1	1	75.40	0.24	93.81	0.10	9.38	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1202	8410650170718	Advance Atopic Dog 12 kg  Unidad	\N	39	1	\N	1	1	1	75.40	0.24	93.81	0.10	9.38	Admin	2023-02-10	\N	1	75.40	\N	1	1	0.13	1	\N	\N	\N
1203	8410650152363	Advance Hipoalergenic Dog 3 kg  Unidad	\N	39	1	\N	1	1	1	20.88	0.27	26.55	0.10	2.65	Admin	2023-02-10	\N	1	20.88	\N	1	1	0.13	1	\N	\N	\N
1204	8410650152301	Advance Weight Balance Dog 3 kg  Unidad	\N	39	1	\N	1	1	1	20.88	0.27	26.55	0.10	2.65	Admin	2023-02-10	\N	1	20.88	\N	1	1	0.13	1	\N	\N	\N
1205	8410650150253	Advance Senior mini  +8 years 1-10 kg 3 kg  Unidad	\N	39	1	\N	1	1	1	21.24	0.34	28.37	0.50	14.18	Admin	2023-02-10	\N	1	21.24	\N	1	1	0.13	1	\N	\N	\N
1206	8410650151892	Advance Kitten 1.5 kg  Unidad	\N	39	1	\N	1	1	1	13.17	0.25	16.46	0.10	1.65	Admin	2023-02-10	\N	1	13.17	\N	1	1	0.13	1	\N	\N	\N
1207	8410650151946	Advance Adult 1-10 years 1.5 kg  Unidad	\N	39	1	\N	1	1	1	13.17	0.25	16.46	0.10	1.65	Admin	2023-02-10	\N	1	13.17	\N	1	1	0.13	1	\N	\N	\N
1208	7414400202149	MV Derma Shampoo Antipruriginoso 16 onz  Unidad	\N	43	24	\N	1	1	1	6.20	0.15	14.25	0.10	1.43	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1209	7414400202095	Collie Shampoo Extra Fuerte 500 Ml  Unidad	\N	43	24	\N	1	1	1	3.54	0.65	5.84	0.10	0.58	Admin	2023-02-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1210	7414400200596	Collie Solucion desenredante 250 ml  Unidad	\N	43	24	\N	1	1	1	3.47	0.53	5.31	0.10	0.53	Admin	2023-02-10	\N	1	3.47	\N	1	1	0.13	1	\N	\N	\N
1211	7414400202101	Collie Acondicionador avena y miel 500 ml  Unidad	\N	43	24	\N	1	1	1	3.54	0.65	5.84	0.15	0.88	Admin	2023-02-10	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
1212	7414400201456	Collie Shampoo Pelo Blanco 500 ml  Unidad	\N	43	24	\N	1	1	1	5.27	0.65	9.64	0.10	0.96	Admin	2023-02-10	\N	1	5.84	\N	1	1	0.13	1	\N	\N	\N
1213	7414400201449	Collie Shampoo Derma 500 ml  Unidad	\N	43	24	\N	1	1	1	3.54	0.65	5.84	0.10	0.58	Admin	2023-02-10	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
1485	167	LDH  Unidad	\N	104	12	\N	1	1	1	0.00	7.85	8.85	0.00	0.00	Admin	2023-05-04	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1214	7414400202088	Collie Shampo para cachorros  Unidad	\N	43	24	\N	1	1	1	3.54	0.65	5.84	0.15	0.88	Admin	2023-02-10	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
1215	7414400201432	Collie Shampo Avena y Miel 500 ml  Unidad	\N	43	24	\N	1	1	1	3.54	0.79	5.84	0.15	0.88	Admin	2023-02-10	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
1216	714193509102	HepatoCan Forte  Frasco 60 tabletas	\N	46	5	\N	1	1	1	21.03	0.21	25.35	0.10	2.54	Admin	2023-02-10	\N	1	21.03	\N	1	1	0.13	1	\N	\N	\N
1217	714193600724	Hemofer B12  Frasco 60 tabletas	\N	46	5	\N	1	1	1	18.30	0.21	22.08	0.10	2.21	Admin	2023-02-10	\N	1	18.30	\N	1	1	0.13	1	\N	\N	\N
1218	7501072204615	Proplan Puppy Small bread (Optistart) 7,5 kg  Unidad	\N	15	1	\N	1	1	1	47.53	0.30	61.55	0.10	6.16	Admin	2023-02-10	\N	1	47.53	\N	1	1	0.13	1	\N	\N	\N
1219	7501072206305	Proplan Urinary gatos Adultos 3 kg  Unidad	\N	15	1	\N	1	1	1	26.13	0.33	34.78	0.10	3.48	Admin	2023-02-10	\N	1	26.13	\N	1	1	0.13	1	\N	\N	\N
1220	7501072210616	Adult Raza Mediana Optihealth  Bolsa 17.5 Kg	\N	15	1	\N	1	1	1	90.12	0.34	120.85	0.10	12.09	Admin	2023-02-11	\N	1	90.12	\N	1	1	0.13	1	\N	\N	\N
1221	7501072208798	Adult Raza Mediana Optihealth  Bolsa 7.5 kg	\N	15	1	\N	1	1	1	45.89	0.33	60.05	0.10	6.01	Admin	2023-02-11	\N	1	47.40	\N	1	1	0.13	1	\N	\N	\N
1222	7501072210715	Reduced Calorie Raza medianas y grandes Optifil  Bolsa 13 Kg	\N	15	1	\N	1	1	1	75.05	0.29	96.59	0.10	9.66	Admin	2023-02-11	\N	1	75.05	\N	1	1	0.13	1	\N	\N	\N
1223	7501072204578	Proplan Puppy Razas Medianas 7,5 kg  Unidad	\N	15	1	\N	1	1	1	46.66	0.29	59.96	0.10	6.00	Admin	2023-02-11	\N	1	46.66	\N	1	1	0.13	1	\N	\N	\N
1224	7501072208767	Proplan Adulto Razas Pequeñas  con espirulina 7,5 kg  Unidad	\N	15	1	\N	1	1	1	45.14	0.29	58.23	0.10	5.82	Admin	2023-02-11	\N	1	45.14	\N	1	1	0.13	1	\N	\N	\N
1225	MN05-XL	Arnes ajustable service dog MN05 XL  Unidad	\N	9	23	\N	1	1	1	11.46	0.60	18.34	0.10	1.83	Admin	2023-02-13	\N	1	11.46	\N	1	1	0.13	1	\N	\N	\N
1226	RS03-L	Arnes Tactico RS03 L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	19.76	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1227	CORTA3807	Corta Uña pequeño HINC0015 3807  Unidad	\N	9	24	\N	1	1	1	3.75	0.61	6.02	0.15	0.90	Admin	2023-02-13	\N	1	3.75	\N	1	1	0.13	1	\N	\N	\N
1228	MU02	Arnes + correa Multicolor MU02 M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.03	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1229	MU01	Arnes + correa multicolor MU01 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	8.43	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1230	AC02M	Arnes ajust+correa confort AC02 M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1231	KV01XXS	Arnes ajustable liso+correa KV01 XXS  Unidad	\N	9	23	\N	1	1	1	3.10	0.60	4.96	0.15	0.74	Admin	2023-02-13	\N	1	3.10	\N	1	1	0.13	1	\N	\N	\N
1232	BOSAL#0	\N	\N	\N	\N	\N	0	0	1	0.00	0.00	2.50	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1233	SU01	Arnes+correa c/cuadros SU01 XS  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	7.01	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1234	TU04	Arnes Ajust+correa C/rayas T L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	9.55	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1235	K002	Correa Multicolor KO02  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	4.96	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1236	TU02	Arnes Ajust+correa c/rayas TU02 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	5.66	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1237	TU03	Arnes ajust+correa c/rayas TU03 M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	8.14	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1238	QR02	Arnes Chal+correa c/figuras QR02  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	7.79	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1239	kS15MM	Correa de lazo trenzada ks 15mm  Unidad	\N	9	23	\N	1	1	1	3.50	0.60	5.60	0.10	0.56	Admin	2023-02-13	\N	1	3.50	\N	1	1	0.13	1	\N	\N	\N
1240	K9-L	Arnes ajust Police K9 L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	18.34	0.00	0.00	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1241	IJ03	Arnes damasco Reflect IJ03 L  Unidad	\N	9	23	\N	1	1	1	12.35	0.60	19.76	0.15	2.96	Admin	2023-02-13	\N	1	12.35	\N	1	1	0.13	1	\N	\N	\N
1242	ZY02-M	Arnes ajust Reflectivo ZY02 M  Unidad	\N	9	23	\N	1	1	1	15.88	0.61	25.49	0.15	3.82	Admin	2023-02-13	\N	1	15.88	\N	1	1	0.13	1	\N	\N	\N
1243	RS02	Arnes tactico RS02 S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	19.76	0.10	1.98	Admin	2023-02-13	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1244	99-26191	Snap 4 DX Plus  Unidad	\N	81	12	\N	1	1	1	18.82	1.21	37.61	0.15	5.64	Admin	2023-02-13	\N	1	18.82	\N	1	1	0.13	1	\N	\N	\N
1245	7501051100020	Vetriderm Jabon Dermatologico  Unidad	\N	24	24	\N	1	1	1	5.39	0.31	6.19	0.10	0.62	Admin	2023-02-13	\N	1	5.39	\N	1	1	0.13	1	\N	\N	\N
1246	162	Cultivo de Secrecion  Unidad	\N	89	12	\N	1	1	1	0.00	14.93	15.93	0.10	1.59	Admin	2023-02-13	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1247	7501051186963	Vetriderm Shampoo  Bote 350 ml	\N	24	24	\N	1	1	1	8.97	0.39	12.49	0.10	1.25	Admin	2023-02-13	\N	1	8.97	\N	1	1	0.13	1	\N	\N	\N
1248	C22-1	Arnes chalecho + correa C22-1  Unidad	\N	9	23	\N	1	1	1	10.40	0.60	16.64	0.15	2.50	Admin	2023-02-14	\N	1	10.40	\N	1	1	0.13	1	\N	\N	\N
1249	C22-2	Arnes Chaleco+correa C22-2  Unidad	\N	9	23	\N	1	1	1	10.40	0.60	16.64	0.15	2.50	Admin	2023-02-14	\N	1	10.40	\N	1	1	0.13	1	\N	\N	\N
1250	C22-3	Arnes Chaleco+correa C22-3  Unidad	\N	9	23	\N	1	1	1	10.40	0.60	16.64	0.15	2.50	Admin	2023-02-14	\N	1	10.40	\N	1	1	0.13	1	\N	\N	\N
1251	11	Enema Rectal	\N	88	17	\N	1	1	1	0.00	7.84	8.84	0.00	0.00	Admin	2023-02-14	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1252	7797600001805	Pipeta Power Ultra de 2-4 kg  Unidad	\N	82	33	\N	1	1	1	5.42	0.55	8.41	0.10	0.84	Admin	2023-02-14	\N	1	5.42	\N	1	1	0.13	1	\N	\N	\N
1253	7797600000518	Pipeta Power Ultra 21-40 kg  Unidad	\N	82	33	\N	1	1	1	9.60	0.38	11.06	0.15	1.66	Admin	2023-02-14	\N	1	9.60	\N	1	1	0.13	1	\N	\N	\N
1254	7191600000507	Pipeta Power ultra 11-20 kg  Unidad	\N	82	33	\N	1	1	1	0.00	0.30	0.00	0.00	0.00	Admin	2023-02-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1255	7797600001812	Pipeta Power ultra 5 a 10 kg  Unidad	\N	82	33	\N	1	1	1	7.94	0.46	9.29	0.10	0.93	Admin	2023-02-14	\N	1	7.94	\N	1	1	0.13	1	\N	\N	\N
1256	7707007404604	Fungiderm Gel  Unidad	\N	83	5	\N	1	1	1	4.44	0.48	7.08	0.10	0.71	Admin	2023-02-14	\N	1	4.44	\N	1	1	0.13	1	\N	\N	\N
1257	7797600000761	Desparacitante Meltra Plus hasta 60 kg  1 de 6 Comprimidos	\N	82	5	\N	1	1	1	1.02	1.65	2.66	0.10	0.27	Admin	2023-02-14	\N	1	1.14	\N	1	1	0.13	1	\N	\N	\N
1258	7707007405663	Fortipet emulsion oral  Frasco 120 ml	\N	83	5	\N	1	1	1	6.40	0.59	10.62	0.10	1.06	Admin	2023-02-17	\N	1	6.40	\N	1	1	0.13	1	\N	\N	\N
1260	7797600000174	Artrin  Caja 30 comprimidos	\N	82	5	\N	1	1	1	12.49	0.42	17.70	0.15	2.65	Admin	2023-02-17	\N	1	12.49	\N	1	1	0.13	1	\N	\N	\N
1261	7797600000785	Laxavet 40 gr  Unidad	\N	82	5	\N	1	1	1	6.00	0.35	8.10	0.10	0.81	Admin	2023-02-17	\N	1	6.00	\N	1	1	0.13	1	\N	\N	\N
1262	7410000115322	Shapoo Toffy Pulgicida y Garrapaticida 450 ml  Unidad	\N	85	24	\N	1	1	1	3.43	0.69	5.31	0.15	0.80	Admin	2023-02-17	\N	1	4.41	\N	1	1	0.13	1	\N	\N	\N
1263	2009073936	Metoclovet Solucion Gotas 50mg  Unidad	\N	85	5	\N	1	1	1	2.67	0.72	4.42	0.10	0.44	Admin	2023-02-17	\N	1	2.92	\N	1	1	0.13	1	\N	\N	\N
1264	7759433000998	Ectobull 30 ml  Unidad	\N	84	5	\N	1	1	1	2.84	0.45	4.11	0.10	0.41	Admin	2023-02-17	\N	1	2.84	\N	1	1	0.13	1	\N	\N	\N
1265	9505905	Histamicin Antihistaminico Solucion inyectable Dosis  Frasco 20 ml	\N	85	5	\N	1	1	1	0.33	0.57	0.51	0.00	0.00	Admin	2023-02-17	\N	1	0.33	\N	1	1	0.13	1	\N	\N	\N
1266	9505904	Ungüento veterinario  Tarro 60 gr	\N	85	5	\N	1	1	1	2.95	0.35	3.98	0.10	0.40	Admin	2023-02-17	\N	1	2.95	\N	1	1	0.13	1	\N	\N	\N
1267	402	Traslado zona Santa Elena  Unidad	\N	88	16	\N	1	1	1	0.00	0.65	2.66	0.50	1.33	Admin	2023-02-18	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1268	9505903	colirio Veterinario  frasco 10 ml	\N	85	5	\N	1	1	1	1.81	0.47	2.65	0.10	0.27	Admin	2023-02-18	\N	1	1.81	\N	1	1	0.13	1	\N	\N	\N
1269	7797600000501	Pipeta power Ultra de 11 a 20 kg  Unidad	\N	82	33	\N	1	1	1	8.66	0.41	9.77	0.10	0.98	Admin	2023-02-18	\N	1	8.66	\N	1	1	0.13	1	\N	\N	\N
1270	163	Perfil Hepático  Unidad	\N	89	12	\N	1	1	1	0.00	21.12	22.12	0.00	0.00	Admin	2023-02-22	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1271	164	Perfil Renal  Unidad	\N	89	12	\N	1	1	1	0.00	21.12	22.12	0.00	0.00	Admin	2023-02-22	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1272	303	Hospitalizacion  Unidad	\N	88	11	\N	1	1	1	0.00	9.62	10.62	0.00	0.00	Admin	2023-02-22	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1273	304	Fluidoterapia  Unidad	\N	88	17	\N	1	1	1	0.00	12.27	13.27	0.10	1.33	Admin	2023-02-22	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1274	7759433000882	Hepatin Dosis  Frasco 20 ml	\N	84	5	\N	7	7	1	0.64	4.79	5.33	0.00	0.00	Admin	2023-02-22	\N	1	0.64	\N	1	1	0.13	1	\N	\N	\N
1275	7502262630795	Aminotonic Dosis  Frasco 500 ml	\N	21	7	\N	50	50	1	0.19	26.96	5.31	0.10	0.53	Admin	2023-02-22	\N	1	0.19	\N	1	1	0.13	1	\N	\N	\N
1276	1421	Midazolam Dosis  Ampolla 3 ml	\N	86	5	\N	10	10	1	0.00	20.60	5.31	0.00	0.00	Admin	2023-02-22	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1277	JHP951	Jaula para Hamster Pequeña 951  Unidad	\N	9	32	\N	1	1	1	0.00	0.60	52.86	0.10	5.29	Admin	2023-02-24	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1278	6953182735083	Juguete Ecologico Leif M-Pets  Unidad	\N	31	22	\N	1	1	1	0.00	0.60	15.92	0.00	0.00	Admin	2023-02-24	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1279	8436532730122	Uvita Perro  Barra 50 gr	\N	55	5	\N	1	1	1	8.05	0.65	13.28	0.10	1.33	Admin	2023-02-25	\N	1	8.05	\N	1	1	0.13	1	\N	\N	\N
1280	8436532730146	Uvita Gato  Barra 50 gr	\N	55	5	\N	1	1	1	0.00	0.61	11.06	0.10	1.11	Admin	2023-02-25	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1281	8436532730252	U-derm Omega Blister  1 de 26 Blister	\N	55	5	\N	26	26	1	2.32	0.53	3.55	0.10	0.35	Admin	2023-02-25	\N	1	2.32	\N	1	1	0.13	1	\N	\N	\N
1282	7501072210678	Puppy Raza Mediana Optistart  Bolsa 13 Kg	\N	15	1	\N	1	1	1	36.32	0.77	128.21	0.10	12.82	Admin	2023-02-25	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1283	7502010420043	Vacuna Quintuple Caningen  Unidad	\N	11	36	\N	1	1	1	0.00	2.97	15.93	0.10	1.59	Admin	2023-02-25	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1284	711604200290	Mineravit Fuerte Jarabe  Frasco 120 ml	\N	92	5	\N	1	1	1	1.93	0.61	3.10	0.10	0.31	Admin	2023-02-28	\N	1	1.93	\N	1	1	0.13	1	\N	\N	\N
1285	711604203734	Omega 3 Pets  Frasco 125 ml	\N	92	5	\N	1	1	1	0.00	0.75	8.41	0.10	0.84	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1286	7441031336950	Vitamina K1 Dosis  Frasco 20 ml	\N	93	5	\N	10	10	1	0.00	12.27	5.31	0.00	0.00	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1287	no05xl	Arnes chal Ref+ correa mesh ÑO05  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.98	0.10	1.10	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1288	WV04L	Arnes Chaleco reflect+correa WV04L  Unidad	\N	9	23	\N	1	1	1	0.00	0.61	18.14	0.10	1.81	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1289	UT03M	Arnes Reflect c/bolsa UT03M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.70	0.10	1.27	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1290	UT04L	Arnes reflect c/bolsa UT04L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.70	0.10	1.27	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1291	UT05XL	Arnes reflect c/bolsa UT05XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.70	0.10	1.27	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1292	XW01S	Arnes Reflectivo +correa XW01S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	14.86	0.10	1.49	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1293	XW02M	Arnes Reflectivo +correa XW02M  Unidad	\N	9	23	\N	1	1	1	9.29	0.60	14.86	0.15	2.23	Admin	2023-02-28	\N	1	9.29	\N	1	1	0.13	1	\N	\N	\N
1294	XW03L	Arnes Reflectivo +correa XW03L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	14.86	0.10	1.49	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1295	XW04XL	Arnes Reflectivo +correa XW04XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	14.86	0.10	1.49	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1296	AB01S	Cama p/mascota AB01S 40 CM  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	33.81	0.10	3.38	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1297	AB02M	Cama p/mascota AB02M 50 cm  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	39.47	0.10	3.95	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1298	AB03L	Cama p/mascota AB03L 60 cm.  unidad	\N	9	25	\N	1	1	1	0.00	0.59	46.50	0.10	4.65	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1299	KM0212MM	Correa de Lazo c/cuero mezcal KM02  Unidad	\N	9	23	\N	1	1	1	5.27	0.60	8.45	0.10	0.84	Admin	2023-02-28	\N	1	5.27	\N	1	1	0.13	1	\N	\N	\N
1300	UY0110MM	Correa de lazo UY01 10 mm  Unidad	\N	9	23	\N	1	1	1	3.10	0.60	4.96	0.10	0.50	Admin	2023-02-28	\N	1	3.10	\N	1	1	0.13	1	\N	\N	\N
1301	UY0212MM	Correa de Lazo UY02 12 mm  Unidad	\N	9	23	\N	1	1	1	3.54	0.60	5.66	0.10	0.57	Admin	2023-02-28	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
1302	KM0110MM	Correa de Lazo c/cuero Mezcal KM01  Unidad	\N	9	23	\N	1	1	1	3.76	0.60	6.02	0.10	0.60	Admin	2023-02-28	\N	1	3.76	\N	1	1	0.13	1	\N	\N	\N
1303	8900950297180	Peine corta nudo p/mascota  Unidad	\N	9	24	\N	1	1	1	0.00	0.86	12.57	0.10	1.26	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1304	8900950297173	Peine rastrillo p/mascotas 7173  Unidad	\N	9	24	\N	1	1	1	0.00	0.65	7.30	0.10	0.73	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1305	UV01S	Set arnes collar correa bolso UV01S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	20.89	0.10	2.09	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1306	UV02M	Set Arnes collar correa bolso UV02M  Unidad	\N	9	23	\N	1	1	1	0.00	0.65	21.55	0.10	2.15	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1307	UV03L	Set Arnes collar correa bolso UV03L  Unidad	\N	9	23	\N	1	1	1	13.05	0.70	22.21	0.10	2.22	Admin	2023-02-28	\N	1	13.05	\N	1	1	0.13	1	\N	\N	\N
1308	CD02M	Cama P/Perro CD02M  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	42.48	0.10	4.25	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1309	CD03L	Cama p/perro CD03L  Unidad	\N	9	25	\N	1	1	1	0.00	0.59	56.37	0.10	5.64	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1310	KL01XS	arnes Ajust Ref c/etiqueta KL01  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	28.19	0.10	2.82	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1311	KL02S	Arnes Ajust Ref C/etiqueta KL02S  Unidad	\N	9	23	\N	1	1	1	17.65	0.60	28.23	0.15	4.23	Admin	2023-02-28	\N	1	17.65	\N	1	1	0.13	1	\N	\N	\N
1312	KL03M	Arnes Ajust Ref c/etiqueta KL03M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	28.24	0.10	2.82	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1313	KL04L	Arnes ajust ref c/etiqueta KL04L  unidad	\N	9	23	\N	1	1	1	0.00	0.60	28.24	0.10	2.82	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1314	KL05XL	Arnes ajust c/etiqueta KL05XL  Unidad	\N	9	23	\N	1	1	1	17.65	0.60	28.24	0.15	4.24	Admin	2023-02-28	\N	1	17.65	\N	1	1	0.13	1	\N	\N	\N
1315	ST01XS	Arnes Ajust Refl c/Moemoe ST01XS  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.10	1.13	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1316	ST02S	Arnes Ajust Refl c/Moemoe ST02S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.10	1.13	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1317	ST03M	Arnes Ajust Refl c/Moemoe ST03M  Unidad	\N	9	23	\N	1	1	1	7.04	0.61	11.33	0.10	1.13	Admin	2023-02-28	\N	1	7.04	\N	1	1	0.13	1	\N	\N	\N
1318	ST04L	Arnes Ajust Refl c/Moemoe ST04L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.10	1.13	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1319	ST05XL	Arnes Ajust Refl c/Moemoe ST05XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	11.26	0.10	1.13	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1320	AC01S	Arnes ajust+correa Confort AC01S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	8.43	0.10	0.84	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1321	QR01XS	Arnes Chal+correa c/figura QR01 XS  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	7.01	0.10	0.70	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1322	QR02S	Arnes Chal+correa c/figuras QR02S  Unidad	\N	9	23	\N	1	1	1	4.87	0.60	7.79	0.15	1.17	Admin	2023-02-28	\N	1	4.87	\N	1	1	0.13	1	\N	\N	\N
1323	KT03S	Arnes huellas+correa KT03S  Unidad	\N	9	23	\N	1	1	1	3.76	0.60	6.02	0.15	0.90	Admin	2023-02-28	\N	1	3.76	\N	1	1	0.13	1	\N	\N	\N
1324	HI01S	Arnes Osford Reflect HI01S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	33.90	0.10	3.39	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1325	HI02M	Arnes Osford Reflect HI02M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	33.90	0.10	3.39	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1326	HI03L	Arnes Osford Reflect HI03L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	33.90	0.10	3.39	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1327	UT02S	Arnes Reflect C/bolsa UT02S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.67	0.10	1.27	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1328	UT01XS	Arnes Reflect C/bolsa UT01XS  Unidad	\N	9	23	\N	1	1	1	7.92	0.60	12.67	0.15	1.90	Admin	2023-02-28	\N	1	7.92	\N	1	1	0.13	1	\N	\N	\N
1329	RS02S	Arnes Tactico RS02S  Unidad	\N	9	23	\N	1	1	1	12.35	0.62	19.95	0.15	2.99	Admin	2023-02-28	\N	1	12.35	\N	1	1	0.13	1	\N	\N	\N
1330	RS03L	Arnes tactico RS03L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	19.76	0.10	1.98	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1331	OP01S	Arnes +correa linea Reflect OP01S  Unidad	\N	9	23	\N	1	1	1	3.54	0.60	5.66	0.10	0.57	Admin	2023-02-28	\N	1	3.54	\N	1	1	0.13	1	\N	\N	\N
1332	OP02M	Arnes +correa Linea Reflect OP02M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	6.72	0.10	0.67	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1333	KW02XS	Collar ajust liso +correa KW02XS  Unidad	\N	9	23	\N	1	1	1	0.00	60.00	148.23	10.00	1482.30	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1334	KW03S	Collar ajust liso+correa KW03S  Unidad	\N	9	23	\N	1	1	1	0.00	60.00	159.21	0.10	15.92	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1335	KW04M	Collar ajust liso+correa KW04M  Unidad	\N	9	23	\N	1	1	1	0.00	60.00	213.50	0.10	21.35	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1336	KW01XXS	Collar ajust liso+correa KW01XXS  Unidad	\N	9	23	\N	1	1	1	0.00	60.00	134.81	0.10	13.48	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1337	KU02XS	Collar Huellasd+correa KU02XS  Unidad	\N	9	23	\N	1	1	1	0.00	60.00	148.23	0.10	14.82	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1338	KU01XXS	Collar huella+correa KU01xxs  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	3.54	0.10	0.35	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1339	KV03S	Collar huella+correa KU03S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	4.18	0.10	0.42	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1340	KN0212MM	Correa de Lazo Reflect KÑ02 12 mm  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	5.31	0.10	0.53	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1341	KN0315MM	Correa de Lazo Reflect KÑ03 15 mm  Unidad	\N	9	23	\N	1	1	1	3.98	0.60	6.37	0.10	0.64	Admin	2023-02-28	\N	1	3.98	\N	1	1	0.13	1	\N	\N	\N
1342	KN0110MM	Correa de Lazo Reflect KÑ01 10 mm  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	4.61	0.10	0.46	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1343	911emergencia	Servicio de emergencia  Unidad	\N	62	17	\N	1	1	1	0.00	100.00	26.50	0.10	2.65	Admin	2023-02-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1344	305	Atencion Emergencia  Unidad	\N	88	17	\N	1	1	1	0.00	25.55	26.55	0.00	0.00	Admin	2023-03-01	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1345	306	Curacion  Unidad	\N	88	17	\N	1	1	1	0.00	4.31	5.31	0.50	2.65	Admin	2023-03-01	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1346	BL01-S	Arnes ajust+correa BL01S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.67	0.10	1.27	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1347	BL02-M	Arnes ajust+correa BL02M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.67	0.10	1.27	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1348	BL03-L	Arnes ajust+correa BL03L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.03	0.10	1.20	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1349	BL04-XL	Arnes ajust+correa BL04XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	12.67	0.10	1.27	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1350	FG01-S	Arnes ajust+correa FG01S  Unidad	\N	9	23	\N	1	1	1	11.46	0.60	18.34	0.10	1.83	Admin	2023-03-01	\N	1	11.46	\N	1	1	0.13	1	\N	\N	\N
1351	FG02-M	Arnes ajust+correa FG02M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	18.34	0.10	1.83	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1352	FG03-L	Arnes ajust+correa FG03L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	18.34	0.10	1.83	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1353	FG04XL	Arnes ajust+correa FG04XL  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	18.34	0.10	1.83	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1354	7501072210722	Proplan Gato Adulto Optiprebio  Bolsa 7.5 Kg	\N	15	1	\N	1	1	1	53.48	0.24	66.37	0.10	6.64	Admin	2023-03-01	\N	1	53.48	\N	1	1	0.13	1	\N	\N	\N
1355	ZY01S	Arnes ajust reflectivo ZY01S  Unidad	\N	9	23	\N	1	1	1	15.88	0.60	25.41	0.10	2.54	Admin	2023-03-01	\N	1	15.88	\N	1	1	0.13	1	\N	\N	\N
1356	ZY02M	Arnes ajust Reflectivo ZY02M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	25.41	0.15	3.81	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1357	ZY03L	Arnes ajust Reflectivo ZY03L  Unidad	\N	9	23	\N	1	1	1	15.88	0.60	25.41	0.15	3.81	Admin	2023-03-01	\N	1	15.88	\N	1	1	0.13	1	\N	\N	\N
1358	ZY04XL	Arnes ajust Reflectivo ZY04XL  Unidad	\N	9	23	\N	1	1	1	15.88	0.60	25.41	0.15	3.81	Admin	2023-03-01	\N	1	15.88	\N	1	1	0.13	1	\N	\N	\N
1359	NO02-S	Arnes chal ref+correa MESH ÑO02S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.98	0.10	1.10	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1360	NO03-M	Arnes chal ref+correa MESH ÑO03M  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.98	0.10	1.10	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1361	NO04-L	Arnes chal ref+correa MESH ÑO04L  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	10.98	0.10	1.10	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1362	KT01XXS	Arnes Huellas +correa KT01XXS  Unidad	\N	9	23	\N	1	1	1	3.10	0.60	4.96	0.15	0.74	Admin	2023-03-01	\N	1	3.10	\N	1	1	0.13	1	\N	\N	\N
1363	KT02XS	Arnes Huellas +correa KT02XS  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	5.60	0.10	0.56	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1364	MU01S	Arnes +correa multicolor MU01S  Unidad	\N	9	23	\N	1	1	1	0.00	0.60	8.43	0.10	0.84	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1365	MU02M	Arnes +correa multicolor MU02M  Unidad	\N	9	23	\N	1	1	1	7.52	0.60	12.03	0.15	1.80	Admin	2023-03-01	\N	1	7.52	\N	1	1	0.13	1	\N	\N	\N
1366	LM-902-L	Cama Premium LM902L  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	40.35	0.10	4.04	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1367	LM902M	Cama Premium LM902M  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	35.04	0.10	3.50	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1368	LM902S	Cama Premium LM902S  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	26.83	0.10	2.68	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1369	JK901L	Cama Redonda JK901L  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	30.80	0.15	4.62	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1370	JK901M	Cama Redonda JK901M  Unidad	\N	9	25	\N	1	1	1	0.00	0.60	23.01	0.10	2.30	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1371	JK901S	Cama Redonda JK901S  Unidad	\N	9	25	\N	1	1	1	0.00	0.61	16.99	0.10	1.70	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1372	6953182714576	Dog Toy pato MP4576  Unidad	\N	9	22	\N	1	1	1	0.00	0.60	10.00	0.10	1.00	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1373	P1089	Pet Toy panal de Hule con sonido  Unidad	\N	9	22	\N	1	1	1	0.00	0.60	4.60	0.10	0.46	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1374	7416203103685	Pet Toy Pelota Vinil 3685  Unidad	\N	9	22	\N	1	1	1	0.00	0.60	2.80	0.10	0.28	Admin	2023-03-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1375	403	Promocion Analiza-TuVet	\N	88	19	\N	1	1	1	0.00	43.25	44.25	0.00	0.00	Admin	2023-03-01	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1376	307	Curacion mayor  Unidad	\N	88	17	\N	1	1	1	0.00	12.27	13.27	0.30	3.98	Admin	2023-03-01	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1377	308	Aposito curacion  Unidad	\N	88	20	\N	1	1	1	0.00	10.06	11.06	0.10	1.11	Admin	2023-03-01	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1378	8699245857399	Arena p/gato VAN CAT Natural 10 kg  Unidad	\N	63	24	\N	1	1	1	10.62	0.37	14.60	0.15	2.19	Admin	2023-03-01	\N	1	10.62	\N	1	1	0.13	1	\N	\N	\N
1379	8699245857306	Arena p/gato VAN CAT  natural 5 kg  Unidad	\N	9	24	\N	1	1	1	5.58	0.43	7.96	0.15	1.19	Admin	2023-03-01	\N	1	5.58	\N	1	1	0.13	1	\N	\N	\N
1380	8699245857351	Arena p/gato VAN CAT Fresh 5 kg  Unidad	\N	63	24	\N	1	1	1	5.58	0.43	7.96	0.15	1.19	Admin	2023-03-01	\N	1	5.58	\N	1	1	0.13	1	\N	\N	\N
1381	8699245857443	Arena p/gato Van Cat Fresh  Bolsa 10 kg	\N	63	24	\N	1	1	1	10.72	0.37	14.60	0.15	2.19	Admin	2023-03-01	\N	1	10.72	\N	1	1	0.13	1	\N	\N	\N
1382	7798359710017	Arena p/gato SANICAT  Caja 7 kg	\N	94	24	\N	1	1	1	6.06	0.40	9.07	0.50	4.54	Admin	2023-03-01	\N	1	5.54	\N	1	1	0.13	1	\N	\N	\N
1383	073893260042	Nutrisource Adult Chicken and Rice Recipe 2.26 kg  Unidad	\N	54	1	\N	1	1	1	12.00	0.36	16.37	0.10	1.64	Admin	2023-03-01	\N	1	12.00	\N	1	1	0.13	1	\N	\N	\N
1384	sy-b024	Bolso Transportador para Gato SY-B024  Unidad	\N	9	2	\N	1	1	1	0.00	0.59	31.86	0.10	3.19	Admin	2023-03-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1385	8886467515521	Pawise Finger brush  Unidad	\N	2	22	\N	1	1	1	1.31	0.60	2.08	0.10	0.21	Admin	2023-03-02	\N	1	1.31	\N	1	1	0.13	1	\N	\N	\N
1386	017800165426	Beneful Baked Delights  Bolsa 9.5 oz	\N	95	1	\N	1	1	1	4.55	0.30	5.93	0.10	0.59	Admin	2023-03-02	\N	1	4.55	\N	1	1	0.13	1	\N	\N	\N
1387	038100171207	Beggin Fun Siza Bacon and Cheese  Bolsa 6 Oz	\N	95	1	\N	1	1	1	2.61	0.18	2.97	0.10	0.30	Admin	2023-03-02	\N	1	2.52	\N	1	1	0.13	1	\N	\N	\N
1388	038100001306	Beggin Original Bacon  Bolsa 3 Oz	\N	95	29	\N	1	1	1	2.29	0.43	3.27	0.10	0.33	Admin	2023-03-02	\N	1	2.29	\N	1	1	0.13	1	\N	\N	\N
1389	7501072208743	ProPlan Adulto Razas Pequeñas Optihealth  Bolsa 1 Kg	\N	15	1	\N	1	1	1	6.69	0.30	8.72	0.05	0.44	Admin	2023-03-02	\N	1	6.69	\N	1	1	0.13	1	\N	\N	\N
1390	7501072210609	ProPlan Adulto Razas Medianas Optihealth  Bolsa 13 Kg	\N	15	1	\N	1	1	1	68.90	0.30	89.60	0.10	8.96	Admin	2023-03-02	\N	1	68.90	\N	1	1	0.13	1	\N	\N	\N
1391	7501072204592	ProPlan Razas Pequeñas Optistart  Bolsa 1 Kg	\N	15	1	\N	1	1	1	7.06	0.30	9.21	0.05	0.46	Admin	2023-03-02	\N	1	7.06	\N	1	1	0.13	1	\N	\N	\N
1392	7501072210661	ProPlan Puppy Raza Grandes Optistart  Bolsa 13 Kg	\N	15	1	\N	1	1	1	72.64	0.30	94.42	0.10	9.44	Admin	2023-03-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1393	7503020053085	Nupec Senior Razas Pequeñas 2 kg  Unidad	\N	49	1	\N	1	1	1	11.27	0.33	22.53	0.10	2.25	Admin	2023-03-06	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1394	7503008553972	Nupec Senior 8 kg  Unidad	\N	49	1	\N	1	1	1	51.89	0.33	67.60	0.10	6.76	Admin	2023-03-06	\N	1	51.89	\N	1	1	0.13	1	\N	\N	\N
1395	7503008553255	Nupec Adulto Raza Grande 8 kg  Unidad	\N	49	1	\N	1	1	1	40.35	0.37	55.44	0.10	5.54	Admin	2023-03-06	\N	1	40.35	\N	1	1	0.13	1	\N	\N	\N
1396	7503008553231	Nupec Adulto Razas Grandes 20 kg  Unidad	\N	49	1	\N	1	1	1	76.06	0.30	97.99	0.10	9.80	Admin	2023-03-06	\N	1	75.50	\N	1	1	0.13	1	\N	\N	\N
1397	7503020053320	Nupec Treats Digestive Care 180 gr  Unidad	\N	49	1	\N	1	1	1	4.42	0.30	5.17	0.10	0.52	Admin	2023-03-06	\N	1	4.42	\N	1	1	0.13	1	\N	\N	\N
1398	404	Certificado de salud  Unidad	\N	88	17	\N	1	1	1	0.00	43.25	26.55	0.00	0.00	Admin	2023-03-07	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1399	309	Aplicacion Albendazol Praziquantel  Dosis	\N	36	5	\N	1	1	1	0.00	0.77	1.77	0.00	0.00	Admin	2023-03-10	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1400	8010690160511	Palto desco`  unidad	\N	3	22	\N	1	1	1	0.00	0.30	21.82	0.15	3.27	Admin	2023-03-11	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1401	052742855509	Hills SD Adult 1-6 small bites 4.5 lb  Unidad	\N	1	1	\N	1	1	1	18.22	0.30	23.71	0.50	11.86	Admin	2023-03-14	\N	1	18.22	\N	1	1	0.13	1	\N	\N	\N
1402	052742648606	Hills SD Adult 1-6 6.6 lb  Unidad	\N	1	1	\N	1	1	1	20.22	0.46	28.68	0.10	2.87	Admin	2023-03-14	\N	1	20.81	\N	1	1	0.13	1	\N	\N	\N
1403	052742930107	Hills SD Light Small Bites Adult 1-6 5 lb  Unidad	\N	1	1	\N	1	1	1	15.50	0.30	25.77	0.10	2.58	Admin	2023-03-14	\N	1	15.50	\N	1	1	0.13	1	\N	\N	\N
1404	052742909400	Hills SD Small Paws Puppy 4.5 lb  Unidad	\N	1	1	\N	1	1	1	20.43	0.30	26.55	0.10	2.66	Admin	2023-03-14	\N	1	20.43	\N	1	1	0.13	1	\N	\N	\N
1405	052742713304	Hills SD Puppy 4.5 lb  Unidad	\N	1	1	\N	1	1	1	12.75	0.30	19.95	0.10	2.00	Admin	2023-03-14	\N	1	15.30	\N	1	1	0.13	1	\N	\N	\N
1406	052742909608	Hills SD Small Paws adult 1-6 4.5 lb  Unidad	\N	1	1	\N	1	1	1	20.74	0.30	26.59	0.10	2.66	Admin	2023-03-14	\N	1	20.43	\N	1	1	0.13	1	\N	\N	\N
1407	052742040141	Hills PD Derm Complete 6.5 lb  Unidad	\N	1	1	\N	1	1	1	34.61	0.30	45.00	0.10	4.50	Admin	2023-03-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1408	052742012032	Hills SD Senior Vitality Small And Mini Adult 7+  Unidad	\N	1	1	\N	1	1	1	21.20	0.30	27.57	0.10	2.76	Admin	2023-03-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1409	052742909806	Hills SD Small Paws Adult 7+ up to 25 lb  Bolsa 4.5 lb	\N	1	1	\N	1	1	1	20.43	0.30	26.59	0.10	2.66	Admin	2023-03-14	\N	1	20.43	\N	1	1	0.13	1	\N	\N	\N
1410	052742910000	Hills SD Small Paws Light adult 1-6 Up To 25 LB  Bolsa 4.5 lb	\N	1	1	\N	1	1	1	20.43	0.30	26.59	0.10	2.66	Admin	2023-03-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1411	052742297200	Hills SD Perfect Weight Adult 4 LB  Unidad	\N	1	1	\N	1	1	1	17.69	0.30	23.00	0.50	11.50	Admin	2023-03-14	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1412	VVL001	Vestido p/mascota Macho talla L  Unidad	\N	96	15	\N	1	1	1	3.83	0.56	5.97	0.10	0.60	Admin	2023-03-14	\N	1	3.83	\N	1	1	0.13	1	\N	\N	\N
1413	VVM001	Vestido p/mascota Macho talla M  Unidad	\N	96	15	\N	1	1	1	3.83	0.42	5.44	0.15	0.82	Admin	2023-03-14	\N	1	3.83	\N	1	1	0.13	1	\N	\N	\N
1414	VVS001	Vestido p/mascota Macho talla S  Unidad	\N	96	15	\N	1	1	1	3.83	0.35	5.17	0.10	0.52	Admin	2023-03-14	\N	1	3.83	\N	1	1	0.13	1	\N	\N	\N
1415	VHM001	Vestido p/mascota Hembra talla M  Unidad	\N	96	15	\N	1	1	1	4.83	0.46	7.03	0.10	0.70	Admin	2023-03-14	\N	1	4.83	\N	1	1	0.13	1	\N	\N	\N
1416	VHL001	Vestido p/mascota Hembra talla L  Unidad	\N	96	15	\N	1	1	1	4.83	0.56	7.51	0.10	0.75	Admin	2023-03-14	\N	1	4.83	\N	1	1	0.13	1	\N	\N	\N
1417	VHS001	Vestido p/mascota Hembra talla S  Unidad	\N	96	15	\N	1	1	1	4.83	0.40	6.76	0.10	0.68	Admin	2023-03-14	\N	1	4.83	\N	1	1	0.13	1	\N	\N	\N
1418	VHTL001	Vestido p/mascota Hembra c/tutu talla L  Unidad	\N	96	15	\N	1	1	1	3.83	0.58	6.06	0.10	0.61	Admin	2023-03-14	\N	1	3.83	\N	1	1	0.13	1	\N	\N	\N
1419	VHTS001	Vestido p/mascota Hembra c/tutu talla S  Unidad	\N	96	15	\N	1	1	1	3.83	0.35	5.17	0.10	0.52	Admin	2023-03-14	\N	1	3.83	\N	1	1	0.13	1	\N	\N	\N
1420	VHTM001	Vestido p/mascota Hembra c/tutu talla M  Unidad	\N	96	15	\N	1	1	1	3.83	0.44	5.53	0.10	0.55	Admin	2023-03-14	\N	1	3.83	\N	1	1	0.13	1	\N	\N	\N
1421	BHL001	Bandanas p/ mascota Hembra talla L  unidad	\N	96	15	\N	1	1	1	3.33	0.46	4.86	0.15	0.73	Admin	2023-03-15	\N	1	3.33	\N	1	1	0.13	1	\N	\N	\N
1422	BHM001	Bandanas p/ mascota Hembra talla L  Unidad	\N	96	15	\N	1	1	1	3.33	0.42	4.73	0.10	0.47	Admin	2023-03-15	\N	1	3.33	\N	1	1	0.13	1	\N	\N	\N
1423	BHS001	Bandanas p/ mascota Hembra talla S  Unidad	\N	96	15	\N	1	1	1	3.33	0.38	4.60	0.15	0.69	Admin	2023-03-15	\N	1	3.33	\N	1	1	0.13	1	\N	\N	\N
1424	BHXS001	Bandanas p/ mascota Hembra talla XS  Unidad	\N	96	15	\N	1	1	1	3.33	0.35	4.51	0.15	0.68	Admin	2023-03-15	\N	1	3.33	\N	1	1	0.13	1	\N	\N	\N
1425	BVL001	Bandanas p/mascota Macho talla L  Unidad	\N	96	15	\N	1	1	1	4.83	0.46	7.03	0.15	1.05	Admin	2023-03-15	\N	1	4.83	\N	1	1	0.13	1	\N	\N	\N
1426	BVM001	Bandanas p/mascota Macho talla M  Unidad	\N	96	15	\N	1	1	1	0.00	0.42	6.86	0.10	0.69	Admin	2023-03-15	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1427	BVS001	Bandanas p/mascota Macho talla S  Unidad	\N	96	15	\N	1	1	1	4.83	0.38	6.68	0.15	1.00	Admin	2023-03-15	\N	1	4.83	\N	1	1	0.13	1	\N	\N	\N
1428	7503008553279	Nupec Adulto Raza Pequeña Bolsa 8 Kg  Unidad	\N	49	1	\N	1	1	1	42.01	0.34	54.61	0.10	5.46	Admin	2023-03-17	\N	1	43.36	\N	1	1	0.13	1	\N	\N	\N
1429	310	Cirugia  Unidad	\N	88	11	\N	1	1	1	0.00	43.25	44.25	0.00	0.00	Admin	2023-03-20	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1430	16182	Botelle Mediana para Mascotas  Unidad	\N	97	2	\N	1	1	1	0.00	1.14	2.65	0.10	0.27	Admin	2023-03-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1431	PH2088	Lentes de Moda para mascotas  Unidad	\N	98	22	\N	1	1	1	0.00	0.78	3.54	0.10	0.35	Admin	2023-03-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1432	811794010898	Funamei Cepillo deslanador  Unidad	\N	76	24	\N	1	1	1	0.00	0.58	15.05	0.00	0.00	Admin	2023-03-21	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1433	N026I21	Omeprazol Saimed  Frasco 1 Vial 40mg	\N	100	5	\N	1	1	1	0.00	5.61	5.31	0.10	0.53	Admin	2023-03-22	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1434	074198614264	Taste of the Wild Canine Bison and Roasted Venison  Bolsa 12.2 kg	\N	70	1	\N	1	1	1	52.21	0.35	70.31	0.10	7.03	Admin	2023-03-23	\N	1	52.21	\N	1	1	0.13	1	\N	\N	\N
1435	074198614240	Taste of the Wild Canine Smoked Salmon  Bolsa 12.2 Kg	\N	70	1	\N	1	1	1	52.21	0.35	67.52	0.10	6.75	Admin	2023-03-23	\N	1	52.21	\N	1	1	0.13	1	\N	\N	\N
1436	074198613359	Taste of the Wild Venison and Garbanzo Beans  Bolsa 2 Kg	\N	70	1	\N	1	1	1	11.95	0.39	16.62	0.10	1.66	Admin	2023-03-23	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1437	170	Helicobacter Pylori  Unidad	\N	62	12	\N	0	0	1	0.00	0.23	22.12	0.00	0.00	Admin	2023-03-23	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
1438	7506267903489	Animal Planet Removedor de Manchas y Olores  Bote 1.1 lt	\N	101	24	\N	1	1	1	0.00	0.41	6.42	0.10	0.64	Admin	2023-03-24	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1439	4260448120210	Nutra Pro K9  Sobre 1 gr	\N	102	5	\N	1	1	1	0.00	0.19	2.83	0.10	0.28	Admin	2023-03-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1440	7506267907371	Animal Planet Shampoo Antipulgas  Bote 300 ml	\N	101	3	\N	1	1	1	0.00	0.40	6.46	0.00	0.00	Admin	2023-03-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1441	7506267907357	Animal Planet Liquido Atrayente  Bote 550 ml	\N	101	24	\N	1	1	1	0.00	0.40	8.85	0.10	0.88	Admin	2023-03-28	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1442	7506267907340	Animal Planet Liquido Repelente  Bote 550 ml	\N	101	24	\N	1	1	1	0.00	0.40	8.85	0.10	0.88	Admin	2023-03-29	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1443	166	Hemoglobina Glicosilada  Unidad	\N	89	12	\N	1	1	1	0.00	9.62	10.62	0.00	0.00	Admin	2023-03-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1444	7502010421194	Rabigen Mono Dosis Rabia  Unidad	\N	16	36	\N	1	1	1	2.01	3.40	8.85	0.20	1.77	Admin	2023-03-29	\N	1	2.01	\N	1	1	0.13	1	\N	\N	\N
1445	8713184080653	Vacuna Rabia Novibac  unidad	\N	37	36	\N	1	1	1	2.15	3.11	8.85	0.20	1.77	Admin	2023-03-30	\N	1	2.15	\N	1	1	0.13	0	\N	\N	\N
1446	7800019000014	Vacuna novibac Sextuple  unidad	\N	37	36	\N	0	0	1	3.70	3.78	17.70	0.20	3.54	Admin	2023-03-30	\N	1	3.70	\N	1	1	0.13	0	\N	\N	\N
1447	311	Orquiectomia  Unidad	\N	88	20	\N	1	1	1	0.00	87.50	88.50	0.10	8.85	Admin	2023-03-31	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1448	312	Ovariohisterectomia  Unidad	\N	88	20	\N	1	1	1	0.00	131.74	132.74	0.15	19.91	Admin	2023-03-31	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1449	034846730418	Propac Ultimates Meadow Prime 2.5 kg  Unidad	\N	38	1	\N	1	1	1	0.00	0.33	27.30	0.10	2.73	Admin	2023-04-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1450	8433042001582	Nucleo C.M.P. Forte  1 de 3 ampollas disolvente	\N	24	5	\N	3	3	1	0.00	0.35	6.01	0.10	0.60	Admin	2023-04-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1451	020531	Carbon Activo 1  Bote	\N	24	5	\N	1	1	1	0.00	4.99	5.31	0.10	0.53	Admin	2023-04-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1452	350	Sedacion  Unidad	\N	88	17	\N	1	1	1	0.00	27.25	28.25	0.00	0.00	Admin	2023-04-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1453	7798144990860	Algen LD  Dosis	\N	79	7	\N	1	1	1	0.00	3.36	5.31	0.00	0.00	Admin	2023-04-03	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1454	313	Sedacion Servicio  Unidad	\N	88	17	\N	1	1	1	0.00	21.12	22.12	0.00	0.00	Admin	2023-04-03	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1455	8436532730139	Uvita Gel Gato  Tubo 50 g	\N	55	5	\N	1	1	1	8.05	0.53	12.34	0.10	1.23	Admin	2023-04-04	\N	1	8.05	\N	1	1	0.13	1	\N	\N	\N
1456	8436532730412	Prueba de Moquillo Adenovirus  Unidad	\N	55	12	\N	1	1	1	0.00	1.23	35.40	0.10	3.54	Admin	2023-04-04	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1457	314	Eutanasia Servicio  Unidad	\N	88	17	\N	1	1	1	0.00	34.40	35.40	0.15	5.31	Admin	2023-04-05	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1458	7414400201364	Clotrimavet Locion MV Derma  Spray 60ml	\N	43	24	\N	1	1	1	6.21	0.25	8.41	0.10	0.84	Admin	2023-04-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1459	315	Estudio de CAAF  Unidad	\N	88	17	\N	1	1	1	0.00	1.00	35.40	0.15	5.31	Admin	2023-04-18	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1460	7501072210630	Proplan Sentive Skin Razas medianas y grandes 13 kg  Unidad	\N	15	1	\N	1	1	1	74.99	0.33	99.74	0.10	9.97	Admin	2023-04-18	\N	1	74.99	\N	1	1	0.13	1	\N	\N	\N
1461	7501072208927	Proplan Sesitive Skin Puppy 3 kg  Unidad	\N	15	1	\N	1	1	1	20.45	0.33	27.26	0.10	2.73	Admin	2023-04-18	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
1462	074198612383	Taste of the Wild Canyon/R Feline F  Bolsa 2Kg	\N	70	1	\N	1	1	1	10.18	0.36	13.80	0.10	1.38	Admin	2023-04-18	\N	1	10.18	\N	1	1	0.13	1	\N	\N	\N
1463	074198612239	Taste of the Wild Pacific Canine Form  Bolsa 2 kg	\N	70	1	\N	1	1	1	11.53	0.41	15.93	0.10	1.59	Admin	2023-04-18	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1464	074198612314	Taste of the wild rocky Mountain Feline Form  bolsa 2 Kg	\N	70	1	\N	1	1	1	10.53	0.54	16.20	0.15	2.38	Admin	2023-04-18	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1465	074198612451	Taste of the Wild Pacific Stream Puppy  Bolsa 2 kg	\N	70	1	\N	1	1	1	11.95	0.33	15.93	0.10	1.59	Admin	2023-04-18	\N	1	11.95	\N	1	1	0.13	1	\N	\N	\N
1466	074198614257	Taste of the Wild High Prairie Canine  Bolsa 5.6 kg	\N	70	1	\N	1	1	1	30.97	0.30	40.26	0.10	4.03	Admin	2023-04-18	\N	1	30.97	\N	1	1	0.13	1	\N	\N	\N
1467	074198614233	Taste of the wild Pacific Stream Canine  Bolsa 5.6 kg	\N	70	1	\N	1	1	1	30.97	0.30	40.26	0.15	6.04	Admin	2023-04-18	\N	1	30.97	\N	1	1	0.13	1	\N	\N	\N
1468	052742020419	Hills SD Adult 1-6 6.8 kg  Unidad	\N	1	1	\N	1	1	1	38.99	0.30	50.95	0.10	5.10	Admin	2023-04-19	\N	1	38.99	\N	1	1	0.13	1	\N	\N	\N
1469	052742700106	Lata C/D urinary care 13oz  lata 13 oz	\N	1	30	\N	1	1	1	3.24	0.47	5.00	0.10	0.50	Admin	2023-04-24	\N	1	3.24	\N	1	1	0.13	1	\N	\N	\N
1470	052742001197	Hills PD Kidney Care k/d  Bolsa 1.5 kg	\N	1	1	\N	1	1	1	12.84	0.33	17.08	0.10	1.71	Admin	2023-04-25	\N	1	12.84	\N	1	1	0.13	1	\N	\N	\N
1471	052742862101	Hills PD Kidney Care k/d  Bolsa 3.85 kg	\N	1	1	\N	1	1	1	27.81	0.33	36.99	0.10	3.70	Admin	2023-04-25	\N	1	27.81	\N	1	1	0.13	1	\N	\N	\N
1472	7798176421745	Labyderm Premium Cover  1 ampolla de 2 ml	\N	59	5	\N	1	1	1	5.27	0.33	7.01	0.10	0.70	Admin	2023-04-25	\N	1	5.27	\N	1	1	0.13	1	\N	\N	\N
1473	7798176421752	Labyderm Premium cover 1 ampolla  4 ml	\N	59	5	\N	1	1	1	7.33	0.33	9.74	0.10	0.97	Admin	2023-04-25	\N	1	7.33	\N	1	1	0.13	1	\N	\N	\N
1474	7798176421776	Labyderm Bioforce emulsion en Spray  Frasco 100 ml	\N	59	5	\N	1	1	1	10.57	0.33	14.06	0.10	1.41	Admin	2023-04-25	\N	1	10.57	\N	1	1	0.13	1	\N	\N	\N
1475	7759433000059	Aplicacion Aumenta ATP  Dosis	\N	84	5	\N	1	1	1	0.00	22.34	5.31	0.10	0.53	Admin	2023-04-25	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1476	073893212553	Nutrisource Weigth Management  Bolsa 2.26 kg	\N	54	1	\N	1	1	1	12.00	0.33	15.96	0.10	1.60	Admin	2023-04-27	\N	1	12.00	\N	1	1	0.13	1	\N	\N	\N
1477	7414400201234	Perfume Petite Puppy  Frasco 130 ml	\N	43	24	\N	1	1	1	2.41	0.84	4.42	0.10	0.44	Admin	2023-04-29	\N	1	2.41	\N	1	1	0.13	1	\N	\N	\N
1478	7414400201227	Perfume Petite Sport  Frasco 130 ml	\N	43	24	\N	1	1	1	2.41	0.84	4.42	0.10	0.44	Admin	2023-04-29	\N	1	2.41	\N	1	1	0.13	1	\N	\N	\N
1479	7414400201210	Perfume Petite Magic  Frasco 130 ml	\N	43	24	\N	1	1	1	2.41	0.84	4.42	0.10	0.44	Admin	2023-04-29	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1480	8410650150130	Advance Puppy Mini 2-10 meses  Bolsa 3 kg	\N	39	1	\N	1	1	1	10.62	0.35	28.67	0.10	2.87	Admin	2023-04-29	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1481	9333527021861	Bolsa higienica aromatizada  Paquete 120 bolsas	\N	75	24	\N	1	1	1	0.00	0.60	2.12	0.10	0.21	Admin	2023-05-02	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1482	316	Biopsia hasta 3 cm  Unidad	\N	88	21	\N	1	1	1	0.00	0.80	39.82	0.10	3.98	Admin	2023-05-04	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1483	317	Biopsia Mediana mayor a 3 cm  Unidad	\N	88	21	\N	1	1	1	0.00	0.63	57.52	0.10	5.75	Admin	2023-05-04	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1484	318	Biopsia tejidos grandes y organos  Unidad	\N	88	21	\N	1	1	1	0.00	0.33	106.19	0.10	10.62	Admin	2023-05-04	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1486	MP1831	Transportador XL 91.5x61x66 cm  Unidad	\N	9	32	\N	1	1	1	0.00	0.60	184.07	0.10	18.41	Admin	2023-05-05	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1487	MP1855	Transportador XXL Extra 102x71x76 cm  Unidad	\N	9	32	\N	1	1	1	0.00	0.60	240.70	0.10	24.07	Admin	2023-05-05	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1488	91009	Viruta de Alamo Kit  Bolsa 1/2 libra	\N	106	2	\N	1	1	1	1.41	0.60	2.26	0.10	0.23	Admin	2023-05-07	\N	1	1.41	\N	1	1	0.13	1	\N	\N	\N
1489	91015	Viruta  de Pino Kit  Bolsa 1/2 libra	\N	106	2	\N	1	1	1	1.57	0.60	2.51	0.10	0.25	Admin	2023-05-07	\N	1	1.57	\N	1	1	0.13	1	\N	\N	\N
1490	91012	Sustrato de papel natural Kaytee  Bolsa 1/2 libra	\N	106	2	\N	1	1	1	2.82	0.60	4.51	0.10	0.45	Admin	2023-05-07	\N	1	2.82	\N	1	1	0.13	1	\N	\N	\N
1491	91013	Sustrato papel blanco Kaytee  Bolsa 1/2 libra	\N	106	2	\N	1	1	1	2.82	0.60	4.51	0.10	0.45	Admin	2023-05-07	\N	1	2.82	\N	1	1	0.13	1	\N	\N	\N
1492	7501072204462	Proplan Exigenr Raza Pequeña  Bolsa de 1 kg	\N	15	1	\N	1	1	1	7.55	0.33	10.04	0.05	0.50	Admin	2023-05-08	\N	1	7.55	\N	1	1	0.13	1	\N	\N	\N
1493	7501072204479	Proplan Exigent Raza Pequeña 3 kg  Unidad	\N	15	1	\N	1	1	1	20.45	0.33	27.21	0.10	2.72	Admin	2023-05-08	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
1494	070230107107	Purina Tidy Cats 24/7 convencional  Bolsa 4.5 kg	\N	15	24	\N	1	1	1	4.70	0.30	6.11	0.10	0.61	Admin	2023-05-08	\N	1	4.69	\N	1	1	0.13	1	\N	\N	\N
1495	070230117168	Purina Tidy Cats Scoop Accion Instantanea  Bote 6.3 kg	\N	15	24	\N	1	1	1	15.60	0.33	20.75	0.10	2.08	Admin	2023-05-08	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1496	7501072208262	Proplan Senior Active Mind Razas pequeñas Optiage  Bolsa 1 kg	\N	15	1	\N	1	1	1	7.35	0.33	9.78	0.05	0.49	Admin	2023-05-08	\N	1	7.35	\N	1	1	0.13	1	\N	\N	\N
1497	319	Consulta Vacuna  Unidad	\N	104	17	\N	1	1	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-05-11	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1498	320	Consulta Desparasitacion  Unidad	\N	104	17	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-05-11	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1499	321	Consulta Control  Unidad	\N	104	17	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-05-11	\N	0	0.00	\N	1	1	0.13	0	\N	\N	\N
1500	8470000647512	Ocoxin Pets  Frasco 150 ml	\N	107	5	\N	1	1	1	0.00	0.25	26.55	0.00	0.00	Admin	2023-05-11	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1501	322	Orquiectomia perro grande  Unidad	\N	104	20	\N	1	1	1	0.00	131.74	132.74	0.00	0.00	Admin	2023-05-11	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1502	323	Ovariohisterectomia perro grande  Unidad	\N	104	20	\N	1	1	1	0.00	158.29	159.29	0.00	0.00	Admin	2023-05-11	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1503	052742020488	Hills SD Adulto Small Bites  Bolsa 15 libras	\N	1	1	\N	1	1	1	43.98	0.33	57.17	0.15	8.58	Admin	2023-05-17	\N	1	42.97	\N	1	1	0.13	1	\N	\N	\N
1504	7756654015220	Aminoplex ligth Dosis  Unidad	\N	72	7	\N	1	1	1	0.00	0.03	0.20	0.00	0.00	Admin	2023-05-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1505	7756654000424	Cani Tabs Daily Multi Puppy  Frasco 60 tabletas	\N	72	5	\N	1	1	1	0.00	0.35	17.54	0.10	1.75	Admin	2023-05-17	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1506	CARPRODYL25	Carprodyl 25 frasco 40 tabs  Unidad	\N	72	5	\N	1	1	1	0.84	0.50	1.27	0.10	0.13	Admin	2023-05-19	\N	1	0.84	\N	1	1	0.13	1	\N	\N	\N
1507	CIPROTABS250	Cipro-Tabs 250 frasco 30 tabs  Unidad	\N	110	5	\N	1	1	1	0.64	0.50	0.95	0.10	0.10	Admin	2023-05-19	\N	1	0.64	\N	1	1	0.13	1	\N	\N	\N
1508	7756654000370	Cani-Tabs UT Support  Frasco 60 tabs	\N	110	5	\N	1	1	1	16.53	0.33	21.98	0.10	2.20	Admin	2023-05-19	\N	1	16.53	\N	1	1	0.13	1	\N	\N	\N
1509	7756654000363	Cani-Tabs Healthy Bones Ca+P  Frasco 60 tabs	\N	110	5	\N	1	1	1	14.95	0.33	19.88	0.10	1.99	Admin	2023-05-19	\N	1	14.95	\N	1	1	0.13	1	\N	\N	\N
1510	7756654000448	Cani-Tabs Daily Multi Senior  Frasco 60 tabs	\N	110	5	\N	1	1	1	17.95	0.33	23.87	0.10	2.39	Admin	2023-05-19	\N	1	17.95	\N	1	1	0.13	1	\N	\N	\N
1511	7756654020293	Oxantel Gel 5 ml  Unidad	\N	110	5	\N	1	1	1	3.39	0.33	4.51	0.10	0.45	Admin	2023-05-19	\N	1	3.39	\N	1	1	0.13	1	\N	\N	\N
1512	7756654000387	Cani-Tabs Skin + Coat  Frasco 60 tabs	\N	110	5	\N	1	1	1	0.00	0.33	22.84	0.10	2.28	Admin	2023-05-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1513	AMOXITABS250	Amoxi-tabs C 250 caja 10 tab  Unidad	\N	110	5	\N	1	1	1	0.00	0.33	0.82	0.10	0.08	Admin	2023-05-19	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1514	7756654020156	Oxantel Gel  frasco 50 ml	\N	110	5	\N	1	1	1	15.09	0.33	20.07	0.10	2.01	Admin	2023-05-19	\N	1	15.09	\N	1	1	0.13	1	\N	\N	\N
1515	CARPRODYL100	Carprodyl 100 frasco 20 tabs  Unidad	\N	110	5	\N	1	1	1	1.63	0.60	2.61	0.10	0.26	Admin	2023-05-19	\N	1	1.63	\N	1	1	0.13	1	\N	\N	\N
1516	7756654000400	Cani-Tabs Daily Multi Adult  Frasco 60 tabs	\N	110	5	\N	1	1	1	15.05	0.33	20.02	0.10	2.00	Admin	2023-05-19	\N	1	15.05	\N	1	1	0.13	1	\N	\N	\N
1517	412	Imidofin Inyectable aplicación  Unidad	\N	22	7	\N	1	1	1	0.00	4.30	5.30	0.00	0.00	Admin	2023-05-19	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1518	030172013829	Plato para Hamster Large  Unidad	\N	9	2	\N	1	1	1	2.50	0.61	4.02	0.10	0.40	Admin	2023-05-20	\N	1	2.50	\N	1	1	0.13	1	\N	\N	\N
1519	7797600002901	Driptol carprofeno 100 mg  Unidad	\N	82	5	\N	20	1	1	1.37	0.91	2.61	0.10	0.26	Admin	2023-05-20	\N	1	1.37	\N	1	1	0.13	1	\N	\N	\N
1520	415	Inyeccion Aplicación  Unidad	\N	88	17	\N	1	1	1	0.00	0.05	0.00	0.10	0.00	Admin	2023-05-23	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1521	416	Inyeccion servicio aplicación  Unidad	\N	88	17	\N	1	1	1	0.00	0.77	1.77	0.00	0.00	Admin	2023-05-23	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1522	052742453606	Hills S/D Adult Salmon Entree Felino  Lata 5.5 oz	\N	1	30	\N	1	1	1	2.59	0.41	3.65	0.10	0.37	Admin	2023-05-25	\N	1	2.59	\N	1	1	0.13	1	\N	\N	\N
1523	7792716421868	\N	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-05-25	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1524	7798156460061	Cefalexina 200 Over Iny  1 de 200 dosis	\N	17	5	\N	1	1	1	0.16	33.00	5.47	0.00	0.00	Admin	2023-05-26	\N	1	0.16	\N	1	1	0.13	1	\N	\N	\N
1525	7730952032899	Dipirona 100 ml Iny  1 de 100 dosis	\N	26	5	\N	1	1	1	0.06	0.93	5.31	0.00	0.00	Admin	2023-05-26	\N	1	0.06	\N	1	1	0.13	1	\N	\N	\N
1526	7798156460740	Overxicam 10 ml Iny,  1 de 50 dosis	\N	17	5	\N	1	1	1	0.21	11.81	2.69	0.00	0.00	Admin	2023-05-26	\N	1	0.21	\N	1	1	0.13	1	\N	\N	\N
1527	8010690191065	Arenero Nora 2  Unidad	\N	111	24	\N	1	1	1	4.86	0.35	6.56	0.15	0.98	Admin	2023-05-26	\N	1	4.86	\N	1	1	0.13	1	\N	\N	\N
1528	8010690191089	Arenero Nora 3  unidad	\N	111	24	\N	1	1	1	8.06	0.35	10.88	0.15	1.63	Admin	2023-05-26	\N	1	8.06	\N	1	1	0.13	1	\N	\N	\N
1529	8010690088563	Bola de cuerda Pawise  Unidad	\N	2	22	\N	1	1	1	1.75	0.35	2.36	0.10	0.24	Admin	2023-05-27	\N	1	1.75	\N	1	1	0.13	1	\N	\N	\N
1530	8010690053752	Cama Dandy 95 Cush  Unidad	\N	3	25	\N	1	1	1	51.65	0.35	69.73	0.15	10.46	Admin	2023-05-27	\N	1	51.65	\N	1	1	0.13	1	\N	\N	\N
1531	8010690053776	Cama Dandy 110 Cush  Unidad	\N	3	25	\N	1	1	1	67.20	0.35	90.72	0.15	13.61	Admin	2023-05-27	\N	1	67.20	\N	1	1	0.13	1	\N	\N	\N
1532	8010690029566	Bebedero para jaula animales pequeños  Unidad	\N	3	2	\N	1	1	1	3.55	0.35	4.79	0.15	0.72	Admin	2023-05-27	\N	1	3.55	\N	1	1	0.13	1	\N	\N	\N
1533	8010690056616	Rastrillo p/nudos  Unidad	\N	3	2	\N	1	1	1	4.65	0.35	6.28	0.00	0.00	Admin	2023-05-27	\N	1	4.65	\N	1	1	0.13	1	\N	\N	\N
1534	8010690106571	Colchon Oscar 120 Cuscino  Unidad	\N	3	25	\N	1	1	1	79.30	0.35	107.06	0.15	16.06	Admin	2023-05-27	\N	1	79.30	\N	1	1	0.13	1	\N	\N	\N
1535	8010690053691	Cama Dandy 55  unidad	\N	3	25	\N	1	1	1	18.15	0.35	24.50	0.15	3.68	Admin	2023-05-27	\N	1	18.15	\N	1	1	0.13	1	\N	\N	\N
1536	8010690179445	Collar Cuadros  unidad	\N	3	23	\N	1	1	1	1.90	0.35	2.57	0.15	0.38	Admin	2023-05-27	\N	1	1.90	\N	1	1	0.13	1	\N	\N	\N
1537	8010690175546	Arnes Nikita Camuflajeado azul Talla S  Unidad	\N	3	23	\N	1	1	1	10.88	0.35	14.69	0.15	2.20	Admin	2023-05-27	\N	1	10.88	\N	1	1	0.13	1	\N	\N	\N
1538	8010690012186	Correa Azul G15-12  Unidad	\N	3	2	\N	1	1	1	3.00	0.35	4.05	0.00	0.00	Admin	2023-05-28	\N	1	3.00	\N	1	1	0.13	1	\N	\N	\N
1539	8010690092898	Dispensador Agua-Comida 1.5L  unidad	\N	3	35	\N	1	1	1	6.95	0.35	9.38	0.10	0.94	Admin	2023-05-28	\N	1	6.95	\N	1	1	0.13	1	\N	\N	\N
1540	8010690014043	Plato acero 1500ml  unidad	\N	3	35	\N	1	1	1	5.85	0.35	7.90	0.10	0.79	Admin	2023-05-28	\N	1	5.85	\N	1	1	0.13	1	\N	\N	\N
1541	8010690029986	Plato Party 2  unidad	\N	3	35	\N	1	1	1	1.65	0.35	2.23	0.10	0.22	Admin	2023-05-28	\N	1	1.65	\N	1	1	0.13	1	\N	\N	\N
1542	8010690029993	Plato Party 4  Unidad	\N	3	35	\N	1	1	1	1.66	0.35	2.24	0.10	0.22	Admin	2023-05-28	\N	1	1.66	\N	1	1	0.13	1	\N	\N	\N
1543	8010690030005	Plato Party 6  Unidad	\N	3	35	\N	1	1	1	2.03	0.35	2.74	0.10	0.27	Admin	2023-05-28	\N	1	2.03	\N	1	1	0.13	1	\N	\N	\N
1544	8010690030029	Plato Party 10  Unidad	\N	3	35	\N	1	1	1	5.27	0.35	7.11	0.10	0.71	Admin	2023-05-28	\N	1	5.27	\N	1	1	0.13	1	\N	\N	\N
1545	8010690164670	Dispensador Agua y comida  unidad	\N	3	35	\N	1	1	1	9.31	0.35	12.57	0.10	1.26	Admin	2023-05-28	\N	1	9.31	\N	1	1	0.13	1	\N	\N	\N
1546	8010690099552	Arenero bandeja XL  unidad	\N	3	24	\N	1	1	1	10.80	0.35	14.58	0.10	1.46	Admin	2023-05-28	\N	1	10.80	\N	1	1	0.13	1	\N	\N	\N
1547	7797600002895	Driptol Carprofeno 25 mg  1 de 20 tabletas	\N	82	5	\N	20	20	1	0.65	0.91	1.24	0.10	0.12	Admin	2023-05-30	\N	1	0.65	\N	1	1	0.13	1	\N	\N	\N
1548	UNGÜENTO	Ungüento Veterinario Oxido de Zinc  Tarro 60	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-05-30	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1549	22109	Clinpet Plus 50 mg  1 de 60 tabletas	\N	12	5	\N	60	60	1	0.00	3980.50	0.80	0.00	0.00	Admin	2023-05-31	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1550	22108	Clinpet Plus 150 mg  1 de 60 tabletas	\N	12	5	\N	60	60	1	0.00	5839.71	0.97	0.00	0.00	Admin	2023-06-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1551	22095	Enromax 50 mg  1 de 60 tabletas	\N	12	5	\N	60	60	1	0.00	3981.30	0.80	0.00	0.00	Admin	2023-06-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1552	8010690175331	Collar Reflex C15/44 Negro  Unidad	\N	3	23	\N	1	1	1	6.75	0.35	9.11	0.15	1.37	Admin	2023-06-05	\N	1	6.75	\N	1	1	0.13	1	\N	\N	\N
1553	8010690011769	Correa Negro G10/12  Unidad	\N	3	2	\N	1	1	1	2.68	0.35	4.29	0.10	0.43	Admin	2023-06-05	\N	1	2.68	\N	1	1	0.13	1	\N	\N	\N
1554	8010690011349	Collar Club 20/56 Rojo  Unidad	\N	3	23	\N	1	1	1	2.65	0.35	3.58	0.15	0.54	Admin	2023-06-05	\N	1	2.65	\N	1	1	0.13	1	\N	\N	\N
1555	4007221052180	Drontal Plus Tabletas  1 de 24 tabletas	\N	24	5	\N	24	24	1	1.78	0.74	3.10	0.15	0.46	Admin	2023-06-13	\N	1	1.78	\N	1	1	0.13	1	\N	\N	\N
1556	4007221054221	Drontal Puppy Frasco 20 ml  1 de 20 dosis	\N	112	5	\N	20	20	1	0.42	7.43	3.54	0.10	0.35	Admin	2023-06-13	\N	1	0.42	\N	1	1	0.13	1	\N	\N	\N
1557	8410650160474	Advance Sterilized Adult 1-10  Unidad	\N	39	1	\N	1	1	1	13.52	0.33	18.00	0.10	1.80	Admin	2023-06-13	\N	1	13.52	\N	1	1	0.13	1	\N	\N	\N
1558	AUMENTA	Estimulante Inmunológico  Dosis	\N	104	5	\N	1	1	1	1.00	4.31	5.31	0.00	0.00	Admin	2023-06-15	\N	1	1.00	\N	1	1	0.13	1	\N	\N	\N
1559	181	Perfil pancreatico basico  Unidad	\N	104	12	\N	1	1	1	5.41	3.09	22.12	0.00	0.00	Admin	2023-06-29	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1560	182	Perfil renal basico  Unidad	\N	104	12	\N	1	1	1	7.24	2.67	26.55	0.00	0.00	Admin	2023-06-29	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1561	183	Perfil renal plus  Unidad	\N	104	12	\N	1	1	1	17.22	2.34	57.52	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1562	184	 Perfil pancreatico plus  Unidad	\N	104	12	\N	1	1	1	14.91	1.97	44.25	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1563	185	Perfil hepatico basico  Unidad	\N	104	12	\N	1	1	1	7.12	3.35	30.97	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1564	186	Perfil hepatico plus  Unidad	\N	104	12	\N	1	1	1	21.37	1.90	61.95	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1565	187	Perfil geriatrico basico  Unidad	\N	104	12	\N	1	1	1	17.15	2.35	57.52	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1566	188	Perfil geriatrico plus  Unidad	\N	104	12	\N	1	1	1	26.62	1.99	79.65	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1567	189	Perfil cardiaco basico  Unidad	\N	104	12	\N	1	1	1	9.19	1.41	22.12	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1568	190	Perfil cardiaco plus  Unidad	\N	104	12	\N	1	1	1	14.29	1.79	39.82	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1569	191	Electrolitos  Unidad	\N	104	12	\N	1	1	1	5.36	1.97	15.93	0.10	1.59	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1570	192	Perfil Rutinario basico  Unidad	\N	104	12	\N	1	1	1	12.03	2.68	44.25	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1571	194	Perfil Lipidico  Unidad	\N	104	12	\N	1	1	1	10.01	1.65	26.55	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1572	195	Perfil gastroenterico  Unidad	\N	104	12	\N	1	1	1	1.00	11.39	12.39	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1573	196	Perfil prenatal  Unidad	\N	104	12	\N	1	1	1	9.53	2.25	30.97	0.00	0.00	Admin	2023-06-29	\N	0	0.00	\N	1	1	0.13	1	\N	\N	\N
1574	7441007802434	Crupis meat balls  Frasco 550gr	\N	114	29	\N	1	1	1	5.92	0.25	7.40	0.10	0.74	Admin	2023-06-30	\N	1	5.92	\N	1	1	0.13	1	\N	\N	\N
1575	017800142731	Purina Dog Chow Cordero y Arroz  Lata 374 gr	\N	95	30	\N	1	1	1	2.22	0.19	2.64	0.10	0.26	Admin	2023-07-04	\N	1	2.22	\N	1	1	0.13	1	\N	\N	\N
1576	017800156448	Purina Dog Chow Estofado de Res  Lata 374 gr	\N	95	30	\N	1	1	1	2.22	0.33	2.64	0.10	0.26	Admin	2023-07-04	\N	1	2.22	\N	1	1	0.13	1	\N	\N	\N
1577	017800156424	Purina Dog Chow Festival con trozos de carne  Lata 374 gr	\N	95	30	\N	1	1	1	2.50	0.33	2.65	0.10	0.27	Admin	2023-07-04	\N	1	2.64	\N	1	1	0.13	1	\N	\N	\N
1578	020279991335	High Calorie Gel 5oz  Tubo 5oz (141 gr)	\N	60	5	\N	1	1	1	8.05	0.33	10.71	0.10	1.07	Admin	2023-07-08	\N	1	8.05	\N	1	1	0.13	1	\N	\N	\N
1579	08003330160	Dexametasona L.A. Over Dosis Unidad  Frasco 10ml	\N	17	7	\N	10	10	1	0.21	24.30	5.31	0.00	0.00	Admin	2023-07-08	\N	1	0.21	\N	1	1	0.13	1	\N	\N	\N
1580	074198615131	Diamond Naturals Adult Dog Rich in Lamb & Rice 2Kg  Unidad	\N	70	1	\N	1	1	1	8.85	0.33	11.77	0.10	1.18	Admin	2023-07-12	\N	1	8.85	\N	1	1	0.13	1	\N	\N	\N
1581	074198615117	Diamond Naturals Adult Dog, Rich in Lamb & Rice 15Kg  Unidad	\N	70	1	\N	1	1	1	49.26	0.33	65.52	0.10	6.55	Admin	2023-07-12	\N	1	49.26	\N	1	1	0.13	1	\N	\N	\N
1582	074198615476	Diamond Naturals Small Breed Adult Dog, Rich in Chiken & Rice 2Kg  Unidad	\N	70	1	\N	1	1	1	8.12	0.33	10.80	0.10	1.08	Admin	2023-07-12	\N	1	8.12	\N	1	1	0.13	1	\N	\N	\N
1583	074198615513	Diamond Naturals Small Breed Adult Dog, Rich in lamb & Rice 2Kg  Unidad	\N	70	1	\N	1	1	1	8.85	0.33	11.77	0.10	1.18	Admin	2023-07-12	\N	1	8.85	\N	1	1	0.13	1	\N	\N	\N
1584	074198615636	Diamond Naturals Skin & Coat, All Life Stages Dog Formula 2Kg  Unidad	\N	70	1	\N	1	1	1	9.30	0.33	12.37	0.10	1.24	Admin	2023-07-12	\N	1	9.30	\N	1	1	0.13	1	\N	\N	\N
1585	07419861561	Diamond Naturals Skin & Coat, All Life StagesDog Formula 15Kg  Unidad	\N	70	1	\N	1	1	1	0.00	0.33	0.00	0.00	0.00	Admin	2023-07-12	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1586	074198615261	Diamond Naturals Indoor Cat, Rich in Chiken With Rice 3Kg  Unidad	\N	70	1	\N	1	1	1	13.54	0.33	18.01	0.10	1.80	Admin	2023-07-12	\N	1	13.54	\N	1	1	0.13	1	\N	\N	\N
1587	074198615308	Diamond Naturals, Kitten Rich in Chicken With Rice 3Kg  Unidad	\N	70	1	\N	1	1	1	13.72	0.33	18.25	0.10	1.82	Admin	2023-07-12	\N	1	13.72	\N	1	1	0.13	1	\N	\N	\N
1588	074198615612	Diamond Naturals Skin & Coat, All Life Stages Dog Formula 15Kg  Unidad  Unidad	\N	70	1	\N	1	1	1	50.44	0.33	67.09	0.10	6.71	Admin	2023-07-13	\N	1	50.44	\N	1	1	0.13	1	\N	\N	\N
1589	7503008553071	Nupec Cachorro Razas Pequeñas 8kg  Unidad	\N	49	1	\N	1	1	1	44.86	0.33	59.67	0.00	0.00	Admin	2023-07-13	\N	1	44.86	\N	1	1	0.13	1	\N	\N	\N
1590	7503020053382	Nupec Sensitives Razas Pequeñas  Unidad	\N	49	1	\N	1	1	1	16.37	0.33	21.78	0.10	2.18	Admin	2023-07-13	\N	1	16.37	\N	1	1	0.13	1	\N	\N	\N
1591	052742936802	SD Puppy SMALL BITES 15 lb  Bolsa 15 lb	\N	1	1	\N	1	1	1	47.56	0.33	63.25	0.10	6.33	Admin	2023-07-21	\N	1	47.56	\N	1	1	0.13	1	\N	\N	\N
1592	8410650150185	Advance mini adulto Bolsa 3 kg  Bolsa 3 kg	\N	39	1	\N	1	1	1	21.24	0.33	31.94	0.10	3.19	Admin	2023-07-21	\N	1	21.24	\N	1	1	0.13	0	\N	\N	\N
1593	7503008553057	Nupec Cachorro raza grande 8 kg Unidad  Bolsa 8 kg	\N	49	1	\N	1	1	1	45.13	0.32	59.69	0.10	5.97	Admin	2023-07-22	\N	1	45.13	\N	1	1	0.13	1	\N	\N	\N
1594	7420615480007-7.5	Collar Isabelino Betsy #7.5 Unidad	\N	62	31	\N	1	1	1	0.00	0.40	0.00	0.10	0.00	Admin	2023-07-22	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1595	PECH273	Pechera para perro perqueño CyberKompras Unidad	\N	62	23	\N	1	1	1	11.50	0.60	18.40	0.15	2.76	Admin	2023-07-22	\N	1	11.50	\N	1	1	0.13	1	\N	\N	\N
1596	052742867601	Hills Z/D Food Sensities Bolsa 17.6 lb  Bolsa 17.6 lb	\N	1	1	\N	1	1	1	83.12	0.33	110.55	0.00	0.00	Admin	2023-07-22	\N	1	83.12	\N	1	1	0.13	1	\N	\N	\N
1597	JD02	Dispensador con sonido para perro Unidad	\N	62	2	\N	1	1	1	9.73	0.61	15.62	0.10	1.56	Admin	2023-07-22	\N	1	9.73	\N	1	1	0.13	1	\N	\N	\N
1598	3182550718813	RC Chihuahua adult 500 gr unidad  Bolsa 500 gr	\N	6	1	\N	1	1	1	5.94	0.33	7.90	0.10	0.79	Admin	2023-07-22	\N	1	5.94	\N	1	1	0.13	1	\N	\N	\N
1599	6995654545424	Plato de Goma Plegable Unidad	\N	62	35	\N	1	1	1	11.50	0.60	18.41	0.10	1.84	Admin	2023-07-22	\N	1	11.50	\N	1	1	0.13	1	\N	\N	\N
1600	G0M3101S	Plato de Doma 3 en 1 Talla S Unidad	\N	62	35	\N	1	1	1	15.92	0.46	23.19	0.10	2.32	Admin	2023-07-22	\N	1	15.92	\N	1	1	0.13	1	\N	\N	\N
1601	PL01	Peina Limpia facil pequeño de mano Unidad	\N	62	2	\N	1	1	1	7.96	0.61	12.78	0.10	1.28	Admin	2023-07-22	\N	1	7.96	\N	1	1	0.13	1	\N	\N	\N
1602	6828949660383	Set de plato y fuente de agua Unidad	\N	62	35	\N	1	1	1	16.81	0.01	16.90	0.10	1.69	Admin	2023-07-22	\N	1	16.81	\N	1	1	0.13	1	\N	\N	\N
1603	AF001S	Alfrombra Frias talla S Unidad	\N	62	2	\N	1	1	1	6.19	0.00	6.19	0.10	0.62	Admin	2023-07-22	\N	1	6.19	\N	1	1	0.13	1	\N	\N	\N
1604	JD01	Juguete Balancin Dispensador Unidad	\N	62	22	\N	1	1	1	8.84	0.60	14.14	0.10	1.41	Admin	2023-07-22	\N	1	8.84	\N	1	1	0.13	1	\N	\N	\N
1605	G003	Juguete Cactus limpia dientes Unidad	\N	62	22	\N	1	1	1	10.61	0.60	16.98	0.10	1.70	Admin	2023-07-22	\N	1	10.61	\N	1	1	0.13	1	\N	\N	\N
1606	BCTH2101C	Juguete Balancin Con Pluma y Pelota Unidad	\N	62	22	\N	1	1	1	10.61	0.60	16.99	0.15	2.55	Admin	2023-07-22	\N	1	10.61	\N	1	1	0.13	1	\N	\N	\N
1607	RAR2002	Rascador Redondo con Pelotas Unidad	\N	62	22	\N	1	1	1	13.27	0.60	21.25	0.10	2.13	Admin	2023-07-22	\N	1	13.27	\N	1	1	0.13	1	\N	\N	\N
1608	FGEZ1002	Fuente de agua automatica Unidad	\N	62	22	\N	1	1	1	17.69	0.75	30.98	0.15	4.65	Admin	2023-07-22	\N	1	17.69	\N	1	1	0.13	1	\N	\N	\N
1609	G0M3102M	Plato de Goma 3 en 1 talla M Unidad	\N	62	35	\N	1	1	1	20.35	0.60	32.57	0.10	3.26	Admin	2023-07-22	\N	1	20.35	\N	1	1	0.13	1	\N	\N	\N
1610	6972170629975	Comedero con dispensador de agua elevado Unidad	\N	62	35	\N	1	1	1	17.69	0.60	28.31	10.00	283.13	Admin	2023-07-22	\N	1	17.69	\N	1	1	0.13	1	\N	\N	\N
1611	7501	\N	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-07-22	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1612	7798176421769	Laby Derm Skin Soldier Shampo Nutritivo  Frasco de 220 ml	\N	59	24	\N	1	1	1	17.10	0.33	22.74	0.10	2.27	Admin	2023-07-26	\N	1	17.10	\N	1	1	0.13	1	\N	\N	\N
1613	052742862309	Hills Liver Care I/D 17.6LBS  Bolsa de 17.6 lb	\N	1	1	\N	1	1	1	60.16	0.33	80.01	0.10	8.00	Admin	2023-07-26	\N	1	60.16	\N	1	1	0.13	1	\N	\N	\N
1614	88864675201368886467520136	\N	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-07-27	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1615	3182550732154	RC Maxi adulto Bolsa 15 kg  Unidad	\N	6	1	\N	1	1	1	78.77	0.33	104.76	0.10	10.48	Admin	2023-08-01	\N	1	78.77	\N	1	1	0.13	1	\N	\N	\N
1616	7756654027940	Atrevia XR Large 20 a 40kg caja 1 tableta 1000 mg  Unidad	\N	110	34	\N	1	1	1	21.10	0.40	35.40	0.15	5.31	Admin	2023-08-01	\N	1	21.10	\N	1	1	0.13	1	\N	\N	\N
1617	7756654027933	Atrevia XR Medium 10 a 20 kg Caja 1 Tableta por 500mg  Unidad	\N	110	34	\N	1	1	1	19.84	0.39	33.41	0.15	5.01	Admin	2023-08-01	\N	1	19.84	\N	1	1	0.13	1	\N	\N	\N
1618	7756654027926	Atrevia XR Small 4.5 a 10 kg Caja 1 tableta por 250 mg  Unidad	\N	110	34	\N	1	1	1	19.07	0.64	31.20	0.10	3.12	Admin	2023-08-01	\N	1	19.07	\N	1	1	0.13	1	\N	\N	\N
1619	8470000491269	Alzer alimento complementario Frasco 150 ml  Unidad	\N	64	5	\N	1	1	1	17.73	0.40	24.82	0.10	2.48	Admin	2023-08-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1620	8470000493195	Carminal Alimento Complementario Frasco por 150ml  Unidad	\N	64	5	\N	1	1	1	19.94	0.40	27.92	0.10	2.79	Admin	2023-08-01	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1621	7798176420403	Osteocart Plus Caja por 30 comprimidos  Unidad	\N	59	5	\N	1	1	1	20.49	0.30	26.64	0.10	2.66	Admin	2023-08-01	\N	1	20.49	\N	1	1	0.13	1	\N	\N	\N
1622	659525114701	Body Cunatex gato talla 3  Unidad	\N	\N	\N	\N	0	0	1	0.00	0.00	0.00	0.00	0.00	Admin	2023-08-01	\N	1	0.00	\N	1	1	0.13	0	\N	\N	\N
1623	714193610934	Super Cal D3  60 ml	\N	46	5	\N	1	1	1	10.91	0.32	13.27	0.10	1.33	Admin	2023-08-03	\N	1	13.27	\N	1	1	0.13	1	\N	\N	\N
1624	074198615179	Diamond Naturals, All Life Stages Dog, Rich in chiken & rice  Bolsa 2 kg	\N	70	1	\N	1	1	1	8.32	0.33	11.07	0.10	1.11	Admin	2023-08-10	\N	1	8.32	\N	1	1	0.13	1	\N	\N	\N
1625	VE2022115917	Complejo B Electrolitos  Sobre 10 gr	\N	84	5	\N	1	1	1	0.70	0.89	1.32	0.10	0.13	Admin	2023-08-10	\N	1	0.70	\N	1	1	0.13	1	\N	\N	\N
1626	8470000957512	Renalof solucion oral Frasco de 10 ml	\N	107	5	\N	1	1	1	19.09	0.39	26.54	0.10	2.65	Admin	2023-08-10	\N	1	19.09	\N	1	1	0.13	1	\N	\N	\N
1627	8470000397516	Viusid alimento complementario solucion oral  Frasco 150 ml	\N	107	5	\N	1	1	1	19.76	0.39	27.44	0.10	2.74	Admin	2023-08-10	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1628	7759433001933	Pipeta Rivolta 6%  Unidad 0.25 ml  unidad	\N	84	33	\N	1	1	1	5.82	0.33	9.29	0.10	0.93	Admin	2023-08-14	\N	1	5.82	\N	1	1	0.13	1	\N	\N	\N
1629	7759433001940	Pipeta Rivolta 6% 0.75 ml  Unidad	\N	84	33	\N	1	1	1	7.40	0.55	11.46	0.10	1.15	Admin	2023-08-14	\N	1	7.40	\N	1	1	0.13	1	\N	\N	\N
1630	847922021115	AFP Flying Mouse  Unidad	\N	68	22	\N	1	1	1	2.30	0.62	3.71	0.15	0.56	Admin	2023-08-16	\N	1	2.30	\N	1	1	0.13	1	\N	\N	\N
1631	7501072208972	Proplan Sentive Skin razas medianas y grandes 3kg	\N	15	1	\N	1	1	1	20.45	0.33	27.26	0.00	0.00	Admin	2023-08-30	\N	1	20.45	\N	1	1	0.13	1	\N	\N	\N
1632	3182550743440	RC Adult Golden Retriever Bolsa 12KG  UNIDAD	\N	6	1	\N	1	1	1	75.19	0.45	109.07	0.10	10.91	Admin	2023-08-31	\N	1	75.19	\N	1	1	0.13	1	\N	\N	\N
1633	7759433001193	Potenza suplemento energetico gel oral	\N	84	5	\N	1	1	1	8.00	0.55	12.39	0.10	1.24	Admin	2023-09-05	\N	1	8.00	\N	1	1	0.13	1	\N	\N	\N
1634	7501072210739	Proplan kitten hasta 12 meses bolsa 3kg	\N	15	1	\N	1	1	1	29.03	0.33	33.14	0.10	3.31	Admin	2023-09-12	\N	1	33.14	\N	1	1	0.13	1	\N	\N	\N
1635	8436001971612	Summit 10 adult All Breeds Chicken y Rice 15kg	\N	51	1	\N	1	1	1	60.16	0.33	80.01	0.00	0.00	Admin	2023-09-12	\N	1	60.16	\N	1	1	0.13	1	\N	\N	\N
1636	P002L	Inmuno PRO Pets bolsa 1 lbr	\N	29	5	\N	1	1	1	7.65	0.33	10.17	0.10	1.02	Admin	2023-09-12	\N	1	7.65	\N	1	1	0.13	1	\N	\N	\N
1637	074198615391	Diamond Naturals Large Breed Adult Dog Rich in Lamb meal & Rice 2 kg  Unidad	\N	70	1	\N	1	1	1	8.32	0.33	11.07	0.10	1.11	Admin	2023-09-12	\N	1	8.32	\N	1	1	0.13	1	\N	\N	\N
1638	7798176421219	Tobramax Gotas 5 ml	\N	59	5	\N	1	1	1	12.12	0.39	16.81	0.00	0.00	Admin	2023-09-18	\N	1	12.12	\N	1	1	0.13	1	\N	\N	\N
1639	3182550728102	RC Chihuahua Adult 1.5k	\N	6	1	\N	1	1	1	20.09	0.33	26.72	0.10	2.67	Admin	2023-09-18	\N	1	20.09	\N	1	1	0.13	1	\N	\N	\N
1640	PALETAS	Paletas comestibles para mascota unidad	\N	62	29	\N	1	1	1	0.75	0.48	1.11	0.00	0.00	Admin	2023-10-10	\N	1	0.75	\N	1	1	0.13	1	\N	\N	\N
1641	045663976194	Champú Hipoalergénico - Bote 473 ml	\N	42	24	\N	1	1	1	7.43	0.33	9.88	0.10	0.99	Admin	2023-10-16	\N	1	7.43	\N	1	1	0.13	1	\N	\N	\N
1642	045663976170	Champú y acondicionador 2 en 1 - Bote 473ml	\N	42	24	\N	1	1	1	7.43	0.00	7.43	0.10	0.74	Admin	2023-10-16	\N	1	7.43	\N	1	1	0.13	1	\N	\N	\N
1643	7898049719273	Apoquel de 5.4 mg 1 de 20 tabletas	\N	13	5	\N	1	1	1	0.00	0.33	0.00	0.10	0.00	Admin	2023-10-18	\N	1	0.00	\N	1	1	0.13	1	\N	\N	\N
1644	5414736048253	Apoquel 5.4mg 1 de 20 tabletas	\N	13	5	\N	1	1	1	2.14	0.33	2.85	0.10	0.28	Admin	2023-10-18	\N	1	2.14	\N	1	1	0.13	1	\N	\N	\N
\.


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.proveedores (id, prov_nombre, prov_nit, prov_nrc, prov_nombrecheque, prov_ldireccion1, prov_ldireccion2, prov_telefono, prov_correo, prov_nombrecontacto, creadapor, fecha_creacion, modificada_por, fecha_modificacion, activosn, sucursal_crea, saldo) FROM stdin;
2	relleno	0	41	\N	\N	333333	3333333	cooreo@vr.com	dddd	Admin	2023-10-23	acape	\N	0	1	0.00
3	Distribuidora General	0506-1984-025895	1	\N	San Pedro Sula	San Pedro Sula	+(504)7895-6456	fre@dg.com	Frederic	Admin	2023-10-23	acape	\N	1	1	0.00
4	Importadora Medicinas S.A.	0801-9589-569878	2	\N	Comayagua	Comayagua	+(504)2772-4568	alf@impo.com	Alf Acosta	Admin	2023-10-23	acape	\N	1	1	0.00
5	Nevinter	0113-9678-100000	3	Rodolfo Sergio Guardado Gomez	Santa Elena I	Antiguo Cuscatlan	+(503)2228-5518	nevinter.elsalvador@gmail.com	Katia Rivera	Admin	2023-10-23	admin	\N	1	1	748.10
6	Mundo de Mascota S.A. de C.V.	0614-0312-131038	4	Mundo de Mascota S.A. de C.V.	Canton Joya Galana	Apopa	+(503)2263-3840	\N	Yesenia	Admin	2023-10-23	admin	\N	1	1	732.87
7	Industrias Pet Life de El Salvador	0618-1509-721013	5	Marlon Vladimir Erroa siliezar	Col. Vista Hermosa, Av. Los Almendros y Calle Los Amates, #405.	San Salvador	+(503)2242-2376	petlifeelsalvador@hotmail.com	Marlon Vladimir Erroa Siliezar	Admin	2023-10-23	admin	\N	1	1	932.88
8	AgrocentroAmerica S.A de CV	0614-0802-061054	6	agrocentroamerica del el salvador s.a. de c.v	Colonia Jardines de Merliot ciudad Merliot	Santa Tecla	+(503)2269-4647	agrocentroelsalvador@gmail.com	\N	Admin	2023-10-23	ADMIN	\N	1	1	0.00
9	sin nombre	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	Grupo Mallo S.A. de C.V.	0614-1911-921060	7	Grupo Mallo S.A. de C.V.	Lomas de San Francisco tercera etapa.	San Salvador	+(503)2207-7210	ventas@grupomallo.com	Arrbeth Monge	Admin	2023-10-23	admin	\N	1	1	0.00
11	Biological International, S.A. de C.V.	0614-0412-031057	8	Biological International, S.A. de C.V.	Calle Principal, Col. La Chacra	San Salvador	+(503)2293-9135	atencionalcliente@biologicalint.com	Blanca Rivera	Admin	2023-10-23	admin	\N	1	1	5689.30
12	Genetica Ganadera SA de CV	0614-1111-881035	9	Genetica Ganadera SA de CV	65 Avenida norte colonia Escalon	San Salvador	+(503)2510-2400	info@genetica.sv	Alison Palacios	Admin	2023-10-23	admin	\N	1	1	0.00
13	Servicios Agricolas Salvadoreños SA de CV Sagrisa	0614-0104-680029	10	Sagrisa	Edificio Sagrisa Blv del Ejercito km 3	San Salvador	+(503)2205-2700	\N	\N	Admin	2023-10-23	admin	\N	1	1	0.00
14	Ronasa SA de CV	0614-1901-770025	11	\N	Urbanizacion Industrial Santa Elena	Antiguo Cuscatlan	+(503)2278-6464	ventas@distribuidoraronasa.com	\N	Admin	2023-10-23	admin	\N	1	1	0.00
15	Agropecuaria El Éxito SA de CV	0315-0204-510012	12	Agropecuaria El Éxito SA de CV	Final Blv Sur 25-2	Santa Tecla	+(503)7986-2399	\N	\N	Admin	2023-10-23	admin	\N	1	1	19.89
16	proveedor de reelno 3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	Comercial Agropecuaria S.A. de C.V.	0614-2007-730017	13	Comercial Agropecuaria S. A DE C V	67 A. Sur Col. Escalón #142	San Salvador	+(503)2510-8400	servicioalcliente@coagro.com	\N	Admin	2023-10-23	admin	\N	1	1	0.00
18	Representaciones Veterinarias S.A. de C.V.	0501-1507-221025	14	\N	Antigua Calle Villa Ferrocarril y Av. Las Palmeras	Antiguo Cuscatlán	+(503)2243-4242	hrfg_flores@hotmail.com	\N	Admin	2023-10-23	admin	\N	1	1	0.00
19	Distribuidora Los Héroes S.A. de C.V.	0614-1212-011066	15	Distribuidora Los Héroes S.A. de C.V.	Jardines La Libertad, Blvd. Merliot, Ciudad Merliot	Santa Tecla	+(503)2529-6700	ventas@losheroes.com.sv	Ann Jess	Admin	2023-10-23	admin	\N	1	1	2971.70
20	A & M Inversiones, S.A. de C.V.	0614-3108-011030	16	A & M Inversiones, S.A. de C.V.	Av. Manuel Gallardo No. 4-2	Santa Tecla	+(503)2266-6281	\N	Luis Cruz	Admin	2023-10-23	admin	\N	1	1	2877.55
21	Distribuidora Provecsa SA de CV	0614-0504-171033	17	Distribuidora Provecsa SA de CV	Lomas de San Francisco San Salvador	\N	+(503)2207-7201	\N	\N	Admin	2023-10-23	admin	\N	1	1	0.00
22	Avencor	0614-1212-881028	18	Avencor SA de CV	Boulevard Los Heroes 1160	San Salvador	+(503)2268-5858	\N	Ligia Sibrian	Admin	2023-10-23	admin	\N	1	1	0.00
23	Clinica Veterinaria Narices Frias	0603-0412-791019	19	Delia Margarita Turcios Aguilar	Reparto Sta. Leonor, Pasaje Monaco, Block D, No. 3 Colonia Miralvalle	San Salvador	+(503)2274-8950	\N	Dra Delia Margarita Turcios	Admin	2023-10-23	admin	\N	1	1	0.00
24	Zona Sticker	0614-2004-631080	20	\N	Res Altos de San Francisco Calle A Pasaje 2 Block C #99	San Salvador	+(503)6422-1110	\N	Francisco Boanerges	Admin	2023-10-23	admin	\N	1	1	374.06
25	Rafael Alfredo Alfaro Castillo	0315-2006-400029	21	\N	8a Calle Poniente y Psje Moreno #112, Col. Flor Blanca	San Salvador	+(503)2298-1479	\N	Rafael Alfredo Alfaro Castillo	Admin	2023-10-23	oc	\N	1	1	0.00
26	Servicios Agropecuarios Integrales S.A. de C.V. SEAGRI	0614-1006-131063	22	\N	15 Calle Poniente Local B #208, Centro de Gobierno	San Salvador	+(503)2207-2707	seagri@live.com	SEAGRI	Admin	2023-10-23	yabz	\N	1	1	0.00
27	SH Imports SA de CV	0614-1211-201066	23	\N	Santa Tecla	Santa Tecla	+(503)2288-1777	\N	\N	Admin	2023-10-23	admin	\N	1	1	0.00
28	Innovaciones Pecuarias S.A. de C.V.	0614-0302-091020	24	Innovaciones Pecuarias S.A. de C.V.	Carretera al Puerto de La Libertad Km 22 1/2, Canton San Francisco, Zaragoza	Zaragoza	+(503)2399-3700	innovaciones.pecuarias@gmail.com	Innovaciones Pecuarias	Admin	2023-10-23	nc	\N	1	1	0.00
29	Ferreteria Versailles	0511-1707-791023	25	RICARDO VINICIO PALMA ESCOBAR	Ciudad versalles Villa Paris Pol 16 casa 12 Canton Chanmico la Libertad	La Libertad	+(503)7315-6561	\N	Mauricio	Admin	2023-10-23	YABZ	\N	1	1	579.22
30	Agriveter S.A. de C.V.	0614-2207-961044	26	Agriveter S.A. de C.V	Calle Mayor Jorge A. Dominguez Pol. G#8, Col. Manuel Jose Arce	San Salvador	+(503)2279-4290	\N	Agriveter	Admin	2023-10-23	oc	\N	1	1	0.00
31	Soluciones Diagnosticas Veterinarias S.A. de C.V.	0614-1410-151043	27	Sodivet SA de CV	Antigua Calle Via Ferrocarril y Av. Las Palmeras, Col. La Sultana Casa No. 9-B	Antiguo Cuscatlan	+(503)2243-4242	servicio@sodivet.com	Rodrigo Rivas	Admin	2023-10-23	acape	\N	1	1	0.00
32	Incofa S.A. de C.V.	0614-2609-031027	28	Incofa S.A. de C.V.	Calle Libertad, col Jardines de la Libertad Casa B pol O Ciudad Merliot	Merliot	+(503)2278-6955	\N	Javier Escobar	Admin	2023-10-23	oc	\N	1	1	80.03
33	REDIFAR S.A. DE C.V.	0614-0506-141077	29	\N	San Salvador	San Salvador	+(503)2264-8043	redifar@hotmail.com	REDIFAR	Admin	2023-10-23	MM	\N	1	1	0.00
34	Drogueria Herlett S.A. de C.V.	0614-0209-850026	30	Drogueria Herlett S.A. de C.V.	Blvd. Vijosa, Edif. 36, Zona Industrial	Ciudad Merliot	+(503)2121-4300	\N	Silvia Elias	Admin	2023-10-23	oc	\N	1	1	0.00
35	Distribuidora Martins	9363-2602-801013	31	\N	17 av Polig E-3 Res Campos verdes	Lourdes Colon	+(503)6970-8579	\N	Blue bandanas	Admin	2023-10-23	oc	\N	1	1	0.00
36	Farmacia La Buena Comercializadora Vasquez Portillo S.A. de C.V.	1217-1412-051020	32	\N	Local 206, Centro Comercial Plaza Merliot, Nivel 2	Santa Tecla	+(503)2609-9000	\N	Farmacia La Buena	Admin	2023-10-23	KD	\N	1	1	0.00
37	Casa del Agricultor	0715-2112-490015	33	Maria Irma Vda de Mercado	79 Av. Sur Calle La Mascota a la par de Vidreria La Roca	San Salvador	+(503)6193-4930	vcsa@agrivet.tienda	Casa del Agricultor	Admin	2023-10-23	mm	\N	1	1	0.00
38	Sagrivet SA de CV Servicios Agricolas y Veterinarios	0614-2605-061070	34	Sagrivet SA de CV	Antiguo Cuscatlan	Antiguo Cuscatlan	+(503)2248-1459	\N	\N	Admin	2023-10-23	acape	\N	1	1	0.00
39	IQ Suplementos	12321232123220	35	\N	\N	San Salvador	\N	\N	\N	Admin	2023-10-23	\N	\N	1	1	0.00
40	Veterinarias Centroamericanas	6140606221019	36	\N	\N	Santa Tecla	\N	\N	\N	Admin	2023-10-23	\N	\N	1	1	733.95
41	provveedor de reelono 4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	Disatyr S. A. de C. V.	0614-2811-911039	37	\N	Blv Constitucion N322, Colonia Escalon	San Salvador	+(503)2240-2700	\N	Kenia Turcios	Admin	2023-10-23	ds	\N	1	1	0.00
43	Drog Pharma S.A. de C.V.	1217-1109-131010	38	\N	Av. Manuel Gallardo Pol. A, Res. Montesion, #15	Santa Tecla	+(503)2263-6200	drogpharma@gmail.com	Drog Pharma	Admin	2023-10-23	FP	\N	1	1	0.00
44	\N	0614-0606-221019	39	\N	\N	\N	\N	\N	\N	Admin	2023-10-23	la	\N	1	1	0.00
45	PriceSmart	0614-1603-991030	40	\N	Calle corte blanco, av. El pepeto, Boulevard Santa Elena	San Salvador	+(503)2246-7400	\N	-	\N	2023-10-23	\N	\N	\N	\N	0.00
\.


--
-- Data for Name: puntosdereorden; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.puntosdereorden (id, id_sucursal, codbarra, ptoreorden, creadopor, fecha_creacion, modificadopor, fecha_modificacion, id_producto) FROM stdin;
1	2	01	1	Admin	2023-10-24	\N	\N	552
2	2	017800142731	3	Admin	2023-10-24	\N	\N	1575
3	2	017800156424	3	Admin	2023-10-24	\N	\N	1577
4	2	017800156448	3	Admin	2023-10-24	\N	\N	1576
5	2	017800165426	1	Admin	2023-10-24	\N	\N	1386
6	2	017800174152	1	Admin	2023-10-24	\N	\N	496
7	2	017800174220	1	Admin	2023-10-24	\N	\N	495
8	2	017800176262	1	Admin	2023-10-24	\N	\N	494
9	2	018065055583	1	Admin	2023-10-24	\N	\N	746
10	2	018065057655	0	Admin	2023-10-24	\N	\N	744
11	2	018065057686	1	Admin	2023-10-24	\N	\N	745
12	2	018065057792	1	Admin	2023-10-24	\N	\N	747
13	2	018214812784	1	Admin	2023-10-24	\N	\N	718
14	2	018214812791	1	Admin	2023-10-24	\N	\N	720
15	2	018214816218	0	Admin	2023-10-24	\N	\N	904
16	2	018214846307	1	Admin	2023-10-24	\N	\N	719
17	2	020279991335	3	Admin	2023-10-24	\N	\N	1578
18	2	020279992998	1	Admin	2023-10-24	\N	\N	882
19	2	020279995173	1	Admin	2023-10-24	\N	\N	1078
20	2	020279995227	1	Admin	2023-10-24	\N	\N	1077
21	2	020531	1	Admin	2023-10-24	\N	\N	1451
22	2	030172013829	1	Admin	2023-10-24	\N	\N	1518
23	2	030172013850	1	Admin	2023-10-24	\N	\N	1130
24	2	034846730012	1	Admin	2023-10-24	\N	\N	680
25	2	034846730029	1	Admin	2023-10-24	\N	\N	679
26	2	034846730104	1	Admin	2023-10-24	\N	\N	683
27	2	034846730111	1	Admin	2023-10-24	\N	\N	684
28	2	034846730227	1	Admin	2023-10-24	\N	\N	685
29	2	034846730319	1	Admin	2023-10-24	\N	\N	682
30	2	034846730326	1	Admin	2023-10-24	\N	\N	681
31	2	034846730401	1	Admin	2023-10-24	\N	\N	677
32	2	034846730418	1	Admin	2023-10-24	\N	\N	1449
33	2	034846730500	1	Admin	2023-10-24	\N	\N	674
34	2	034846730517	1	Admin	2023-10-24	\N	\N	675
35	2	034846730609	1	Admin	2023-10-24	\N	\N	676
36	2	034846730708	1	Admin	2023-10-24	\N	\N	688
37	2	034846730715	1	Admin	2023-10-24	\N	\N	689
38	2	034846730814	1	Admin	2023-10-24	\N	\N	687
39	2	034846730821	1	Admin	2023-10-24	\N	\N	686
40	2	034846730937	1	Admin	2023-10-24	\N	\N	678
41	2	035585034003	1	Admin	2023-10-24	\N	\N	859
42	2	035585111117	0	Admin	2023-10-24	\N	\N	858
43	2	035585111216	1	Admin	2023-10-24	\N	\N	857
44	2	035585111315	1	Admin	2023-10-24	\N	\N	856
45	2	038100001306	1	Admin	2023-10-24	\N	\N	1388
46	2	038100171207	1	Admin	2023-10-24	\N	\N	1387
47	2	045663970062	1	Admin	2023-10-24	\N	\N	748
48	2	045663970079	1	Admin	2023-10-24	\N	\N	714
49	2	045663970086	1	Admin	2023-10-24	\N	\N	713
50	2	045663970093	1	Admin	2023-10-24	\N	\N	749
51	2	045663970109	1	Admin	2023-10-24	\N	\N	712
52	2	045663976170	1	Admin	2023-10-24	\N	\N	1642
53	2	045663976194	1	Admin	2023-10-24	\N	\N	1641
54	2	052742001135	1	Admin	2023-10-24	\N	\N	881
55	2	052742001197	1	Admin	2023-10-24	\N	\N	1470
56	2	052742001746	1	Admin	2023-10-24	\N	\N	12
57	2	052742005188	1	Admin	2023-10-24	\N	\N	1198
58	2	052742005355	1	Admin	2023-10-24	\N	\N	964
59	2	052742009971	3	Admin	2023-10-24	\N	\N	961
60	2	052742012032	2	Admin	2023-10-24	\N	\N	1408
61	2	052742014296	1	Admin	2023-10-24	\N	\N	878
62	2	052742014531	1	Admin	2023-10-24	\N	\N	962
63	2	052742014555	1	Admin	2023-10-24	\N	\N	960
64	2	052742020419	1	Admin	2023-10-24	\N	\N	1468
65	2	052742020488	1	Admin	2023-10-24	\N	\N	1503
66	2	052742024530	2	Admin	2023-10-24	\N	\N	879
67	2	052742040141	1	Admin	2023-10-24	\N	\N	1407
68	2	052742187501	1	Admin	2023-10-24	\N	\N	959
69	2	052742187907	1	Admin	2023-10-24	\N	\N	6
70	2	052742195704	1	Admin	2023-10-24	\N	\N	5
71	2	052742297200	2	Admin	2023-10-24	\N	\N	1411
72	2	052742335902	0	Admin	2023-10-24	\N	\N	963
73	2	052742339009	3	Admin	2023-10-24	\N	\N	874
74	2	052742453606	1	Admin	2023-10-24	\N	\N	1522
75	2	052742462806	3	Admin	2023-10-24	\N	\N	875
76	2	052742567006	3	Admin	2023-10-24	\N	\N	873
77	2	052742623801	3	Admin	2023-10-24	\N	\N	876
78	2	052742624709	1	Admin	2023-10-24	\N	\N	880
79	2	052742648606	1	Admin	2023-10-24	\N	\N	1402
80	2	052742679709	1	Admin	2023-10-24	\N	\N	9
81	2	052742700106	1	Admin	2023-10-24	\N	\N	1469
82	2	052742700809	1	Admin	2023-10-24	\N	\N	18
83	2	052742701004	1	Admin	2023-10-24	\N	\N	1
84	2	052742701103	1	Admin	2023-10-24	\N	\N	2
85	2	052742701608	1	Admin	2023-10-24	\N	\N	877
86	2	052742701806	1	Admin	2023-10-24	\N	\N	4
87	2	052742703602	1	Admin	2023-10-24	\N	\N	15
88	2	052742703701	1	Admin	2023-10-24	\N	\N	16
89	2	052742705507	1	Admin	2023-10-24	\N	\N	17
90	2	052742710402	1	Admin	2023-10-24	\N	\N	10
91	2	052742712307	1	Admin	2023-10-24	\N	\N	957
92	2	052742713304	2	Admin	2023-10-24	\N	\N	1405
93	2	052742713908	1	Admin	2023-10-24	\N	\N	7
94	2	052742715605	2	Admin	2023-10-24	\N	\N	958
95	2	052742790107	1	Admin	2023-10-24	\N	\N	14
96	2	052742818306	3	Admin	2023-10-24	\N	\N	8
97	2	052742855509	1	Admin	2023-10-24	\N	\N	1401
98	2	052742861807	1	Admin	2023-10-24	\N	\N	11
99	2	052742862101	1	Admin	2023-10-24	\N	\N	1471
100	2	052742862309	1	Admin	2023-10-24	\N	\N	1613
101	2	052742862408	1	Admin	2023-10-24	\N	\N	13
102	2	052742867106	1	Admin	2023-10-24	\N	\N	3
103	2	052742867601	1	Admin	2023-10-24	\N	\N	1596
104	2	052742909400	1	Admin	2023-10-24	\N	\N	1404
105	2	052742909608	1	Admin	2023-10-24	\N	\N	1406
106	2	052742909806	2	Admin	2023-10-24	\N	\N	1409
107	2	052742910000	2	Admin	2023-10-24	\N	\N	1410
108	2	052742930107	2	Admin	2023-10-24	\N	\N	1403
109	2	052742936802	1	Admin	2023-10-24	\N	\N	1591
110	2	070230107107	1	Admin	2023-10-24	\N	\N	1494
111	2	070230117168	1	Admin	2023-10-24	\N	\N	1495
112	2	073893212546	1	Admin	2023-10-24	\N	\N	842
113	2	073893212553	1	Admin	2023-10-24	\N	\N	1476
114	2	073893223009	1	Admin	2023-10-24	\N	\N	835
115	2	073893260035	1	Admin	2023-10-24	\N	\N	841
116	2	073893260042	1	Admin	2023-10-24	\N	\N	1383
117	2	073893260066	1	Admin	2023-10-24	\N	\N	840
118	2	073893263036	1	Admin	2023-10-24	\N	\N	838
119	2	073893264026	1	Admin	2023-10-24	\N	\N	837
120	2	073893265030	1	Admin	2023-10-24	\N	\N	839
121	2	073893280002	1	Admin	2023-10-24	\N	\N	836
122	2	074198612239	1	Admin	2023-10-24	\N	\N	1463
123	2	074198612277	1	Admin	2023-10-24	\N	\N	1070
124	2	074198612314	1	Admin	2023-10-24	\N	\N	1464
125	2	074198612345	1	Admin	2023-10-24	\N	\N	1073
126	2	074198612383	1	Admin	2023-10-24	\N	\N	1462
127	2	074198612413	1	Admin	2023-10-24	\N	\N	1071
128	2	074198612451	1	Admin	2023-10-24	\N	\N	1465
129	2	074198612499	1	Admin	2023-10-24	\N	\N	1074
130	2	074198613311	1	Admin	2023-10-24	\N	\N	1072
131	2	074198613359	1	Admin	2023-10-24	\N	\N	1436
132	2	074198614233	1	Admin	2023-10-24	\N	\N	1467
133	2	074198614240	1	Admin	2023-10-24	\N	\N	1435
134	2	074198614257	1	Admin	2023-10-24	\N	\N	1466
135	2	074198614264	1	Admin	2023-10-24	\N	\N	1434
136	2	074198615117	0	Admin	2023-10-24	\N	\N	1581
137	2	074198615131	1	Admin	2023-10-24	\N	\N	1580
138	2	074198615179	1	Admin	2023-10-24	\N	\N	1624
139	2	074198615261	0	Admin	2023-10-24	\N	\N	1586
140	2	074198615308	0	Admin	2023-10-24	\N	\N	1587
141	2	074198615391	1	Admin	2023-10-24	\N	\N	1637
142	2	074198615476	0	Admin	2023-10-24	\N	\N	1582
143	2	074198615513	0	Admin	2023-10-24	\N	\N	1583
144	2	07419861561	0	Admin	2023-10-24	\N	\N	1585
145	2	074198615612	0	Admin	2023-10-24	\N	\N	1588
146	2	074198615636	0	Admin	2023-10-24	\N	\N	1584
147	2	077627101182	1	Admin	2023-10-24	\N	\N	700
148	2	077627101229	1	Admin	2023-10-24	\N	\N	701
149	2	077627101274	1	Admin	2023-10-24	\N	\N	702
150	2	077627101342	1	Admin	2023-10-24	\N	\N	703
151	2	077627200991	1	Admin	2023-10-24	\N	\N	707
152	2	077627201028	1	Admin	2023-10-24	\N	\N	704
153	2	077627201066	1	Admin	2023-10-24	\N	\N	705
154	2	077627201349	1	Admin	2023-10-24	\N	\N	706
155	2	077627201356	0	Admin	2023-10-24	\N	\N	708
156	2	077627302015	1	Admin	2023-10-24	\N	\N	709
157	2	08003330160	1	Admin	2023-10-24	\N	\N	1579
158	2	087219111529	1	Admin	2023-10-24	\N	\N	463
159	2	087219113776	1	Admin	2023-10-24	\N	\N	507
160	2	087219116012	1	Admin	2023-10-24	\N	\N	509
161	2	087219117439	1	Admin	2023-10-24	\N	\N	508
162	2	087219120873	5	Admin	2023-10-24	\N	\N	510
163	2	1	0	Admin	2023-10-24	\N	\N	436
164	2	10	1	Admin	2023-10-24	\N	\N	803
165	2	100	1	Admin	2023-10-24	\N	\N	802
166	2	101	0	Admin	2023-10-24	\N	\N	843
167	2	102	0	Admin	2023-10-24	\N	\N	844
168	2	103	0	Admin	2023-10-24	\N	\N	845
169	2	104	0	Admin	2023-10-24	\N	\N	848
170	2	105	0	Admin	2023-10-24	\N	\N	934
171	2	106	0	Admin	2023-10-24	\N	\N	954
172	2	107	0	Admin	2023-10-24	\N	\N	955
173	2	108	0	Admin	2023-10-24	\N	\N	956
174	2	109	0	Admin	2023-10-24	\N	\N	1017
175	2	11	0	Admin	2023-10-24	\N	\N	1251
176	2	110	0	Admin	2023-10-24	\N	\N	1018
177	2	111	0	Admin	2023-10-24	\N	\N	1019
178	2	112	0	Admin	2023-10-24	\N	\N	1020
179	2	113	1	Admin	2023-10-24	\N	\N	1021
180	2	114	0	Admin	2023-10-24	\N	\N	1022
181	2	115	0	Admin	2023-10-24	\N	\N	1023
182	2	116	1	Admin	2023-10-24	\N	\N	1024
183	2	117	0	Admin	2023-10-24	\N	\N	1025
184	2	118	0	Admin	2023-10-24	\N	\N	1026
185	2	119	0	Admin	2023-10-24	\N	\N	1027
186	2	120	0	Admin	2023-10-24	\N	\N	1028
187	2	121	0	Admin	2023-10-24	\N	\N	1029
188	2	122	0	Admin	2023-10-24	\N	\N	1030
189	2	123	1	Admin	2023-10-24	\N	\N	1031
190	2	1234567890128	1	Admin	2023-10-24	\N	\N	1096
191	2	124	0	Admin	2023-10-24	\N	\N	1032
192	2	125	0	Admin	2023-10-24	\N	\N	1033
193	2	126	0	Admin	2023-10-24	\N	\N	1034
194	2	127	0	Admin	2023-10-24	\N	\N	1035
195	2	128	0	Admin	2023-10-24	\N	\N	1036
196	2	129	0	Admin	2023-10-24	\N	\N	1037
197	2	130	0	Admin	2023-10-24	\N	\N	1038
198	2	131	0	Admin	2023-10-24	\N	\N	1039
199	2	132	0	Admin	2023-10-24	\N	\N	1040
200	2	133	0	Admin	2023-10-24	\N	\N	1041
201	2	134	0	Admin	2023-10-24	\N	\N	1042
202	2	135	0	Admin	2023-10-24	\N	\N	1043
203	2	136	0	Admin	2023-10-24	\N	\N	1044
204	2	137	0	Admin	2023-10-24	\N	\N	1045
205	2	138	0	Admin	2023-10-24	\N	\N	1046
206	2	139	0	Admin	2023-10-24	\N	\N	1047
207	2	140	0	Admin	2023-10-24	\N	\N	1048
208	2	141	0	Admin	2023-10-24	\N	\N	1049
209	2	142	0	Admin	2023-10-24	\N	\N	1050
210	2	1421	10	Admin	2023-10-24	\N	\N	1276
211	2	143	0	Admin	2023-10-24	\N	\N	1051
212	2	144	0	Admin	2023-10-24	\N	\N	1052
213	2	145	0	Admin	2023-10-24	\N	\N	1053
214	2	146	0	Admin	2023-10-24	\N	\N	1054
215	2	147	0	Admin	2023-10-24	\N	\N	1055
216	2	148	0	Admin	2023-10-24	\N	\N	1056
217	2	149	0	Admin	2023-10-24	\N	\N	1057
218	2	150	0	Admin	2023-10-24	\N	\N	1058
219	2	151	0	Admin	2023-10-24	\N	\N	1059
220	2	152	0	Admin	2023-10-24	\N	\N	1060
221	2	153	0	Admin	2023-10-24	\N	\N	1061
222	2	154	0	Admin	2023-10-24	\N	\N	1062
223	2	155	0	Admin	2023-10-24	\N	\N	1063
224	2	156	1	Admin	2023-10-24	\N	\N	1064
225	2	157	0	Admin	2023-10-24	\N	\N	1065
226	2	158	0	Admin	2023-10-24	\N	\N	1066
227	2	159	0	Admin	2023-10-24	\N	\N	1067
228	2	160	0	Admin	2023-10-24	\N	\N	1068
229	2	161	0	Admin	2023-10-24	\N	\N	1069
230	2	16182	1	Admin	2023-10-24	\N	\N	1430
231	2	162	0	Admin	2023-10-24	\N	\N	1246
232	2	163	0	Admin	2023-10-24	\N	\N	1270
233	2	164	0	Admin	2023-10-24	\N	\N	1271
234	2	166	0	Admin	2023-10-24	\N	\N	1443
235	2	167	0	Admin	2023-10-24	\N	\N	1485
236	2	170	0	Admin	2023-10-24	\N	\N	1437
237	2	178988989	1	Admin	2023-10-24	\N	\N	1259
238	2	181	1	Admin	2023-10-24	\N	\N	1559
239	2	182	1	Admin	2023-10-24	\N	\N	1560
240	2	18214816218	0	Admin	2023-10-24	\N	\N	160
241	2	183	1	Admin	2023-10-24	\N	\N	1561
242	2	184	1	Admin	2023-10-24	\N	\N	1562
243	2	185	1	Admin	2023-10-24	\N	\N	1563
244	2	186	1	Admin	2023-10-24	\N	\N	1564
245	2	187	1	Admin	2023-10-24	\N	\N	1565
246	2	188	1	Admin	2023-10-24	\N	\N	1566
247	2	189	1	Admin	2023-10-24	\N	\N	1567
248	2	190	1	Admin	2023-10-24	\N	\N	1568
249	2	191	1	Admin	2023-10-24	\N	\N	1569
250	2	192	1	Admin	2023-10-24	\N	\N	1570
251	2	194	1	Admin	2023-10-24	\N	\N	1571
252	2	195	1	Admin	2023-10-24	\N	\N	1572
253	2	196	1	Admin	2023-10-24	\N	\N	1573
254	2	20	1	Admin	2023-10-24	\N	\N	804
255	2	200	1	Admin	2023-10-24	\N	\N	936
256	2	2009073936	1	Admin	2023-10-24	\N	\N	1263
257	2	208400	1	Admin	2023-10-24	\N	\N	416
258	2	21	1	Admin	2023-10-24	\N	\N	805
259	2	22	1	Admin	2023-10-24	\N	\N	806
260	2	22095	60	Admin	2023-10-24	\N	\N	1551
261	2	22108	60	Admin	2023-10-24	\N	\N	1550
262	2	22109	60	Admin	2023-10-24	\N	\N	1549
263	2	23	1	Admin	2023-10-24	\N	\N	807
264	2	25026	1	Admin	2023-10-24	\N	\N	470
265	2	25027	30	Admin	2023-10-24	\N	\N	471
266	2	27003	30	Admin	2023-10-24	\N	\N	472
267	2	30	1	Admin	2023-10-24	\N	\N	808
268	2	300	0	Admin	2023-10-24	\N	\N	1100
269	2	301	0	Admin	2023-10-24	\N	\N	1101
270	2	302	0	Admin	2023-10-24	\N	\N	1102
271	2	303	0	Admin	2023-10-24	\N	\N	1272
272	2	304	0	Admin	2023-10-24	\N	\N	1273
273	2	305	0	Admin	2023-10-24	\N	\N	1344
274	2	306	0	Admin	2023-10-24	\N	\N	1345
275	2	307	0	Admin	2023-10-24	\N	\N	1376
276	2	308	0	Admin	2023-10-24	\N	\N	1377
277	2	309	1	Admin	2023-10-24	\N	\N	1399
278	2	31	1	Admin	2023-10-24	\N	\N	809
279	2	310	0	Admin	2023-10-24	\N	\N	1429
280	2	311	1	Admin	2023-10-24	\N	\N	1447
281	2	312	1	Admin	2023-10-24	\N	\N	1448
282	2	313	0	Admin	2023-10-24	\N	\N	1454
283	2	314	0	Admin	2023-10-24	\N	\N	1457
284	2	315	0	Admin	2023-10-24	\N	\N	1459
285	2	316	0	Admin	2023-10-24	\N	\N	1482
286	2	317	0	Admin	2023-10-24	\N	\N	1483
287	2	318	0	Admin	2023-10-24	\N	\N	1484
288	2	3182550402132	1	Admin	2023-10-24	\N	\N	410
289	2	3182550402149	1	Admin	2023-10-24	\N	\N	401
290	2	3182550402170	1	Admin	2023-10-24	\N	\N	445
291	2	3182550402224	1	Admin	2023-10-24	\N	\N	413
292	2	3182550402439	1	Admin	2023-10-24	\N	\N	408
293	2	3182550702201	1	Admin	2023-10-24	\N	\N	420
294	2	3182550702225	1	Admin	2023-10-24	\N	\N	421
295	2	3182550702423	1	Admin	2023-10-24	\N	\N	425
296	2	3182550702447	1	Admin	2023-10-24	\N	\N	426
297	2	3182550702614	1	Admin	2023-10-24	\N	\N	1088
298	2	3182550708180	1	Admin	2023-10-24	\N	\N	409
299	2	3182550708197	1	Admin	2023-10-24	\N	\N	411
300	2	3182550708203	1	Admin	2023-10-24	\N	\N	412
301	2	3182550710923	1	Admin	2023-10-24	\N	\N	394
302	2	3182550710992	1	Admin	2023-10-24	\N	\N	417
303	2	3182550711036	1	Admin	2023-10-24	\N	\N	414
304	2	3182550711050	1	Admin	2023-10-24	\N	\N	433
305	2	3182550711142	1	Admin	2023-10-24	\N	\N	393
306	2	3182550711159	1	Admin	2023-10-24	\N	\N	434
307	2	3182550711333	1	Admin	2023-10-24	\N	\N	395
308	2	3182550711395	1	Admin	2023-10-24	\N	\N	418
309	2	3182550716857	1	Admin	2023-10-24	\N	\N	449
310	2	3182550716888	1	Admin	2023-10-24	\N	\N	448
311	2	3182550716925	1	Admin	2023-10-24	\N	\N	451
312	2	3182550717687	1	Admin	2023-10-24	\N	\N	415
313	2	3182550718813	1	Admin	2023-10-24	\N	\N	1598
314	2	3182550727822	1	Admin	2023-10-24	\N	\N	447
315	2	3182550728102	1	Admin	2023-10-24	\N	\N	1639
316	2	3182550730587	1	Admin	2023-10-24	\N	\N	432
317	2	3182550731355	1	Admin	2023-10-24	\N	\N	390
318	2	3182550732055	1	Admin	2023-10-24	\N	\N	402
319	2	3182550732154	1	Admin	2023-10-24	\N	\N	1615
320	2	3182550743433	1	Admin	2023-10-24	\N	\N	431
321	2	3182550743440	1	Admin	2023-10-24	\N	\N	1632
322	2	3182550768474	1	Admin	2023-10-24	\N	\N	1091
323	2	3182550771054	1	Admin	2023-10-24	\N	\N	396
324	2	3182550771061	1	Admin	2023-10-24	\N	\N	397
325	2	3182550771719	1	Admin	2023-10-24	\N	\N	398
326	2	3182550771733	1	Admin	2023-10-24	\N	\N	399
327	2	3182550775267	1	Admin	2023-10-24	\N	\N	446
328	2	3182550778657	1	Admin	2023-10-24	\N	\N	430
329	2	3182550778671	1	Admin	2023-10-24	\N	\N	403
330	2	3182550793001	1	Admin	2023-10-24	\N	\N	405
331	2	3182550793032	1	Admin	2023-10-24	\N	\N	406
332	2	3182550793049	1	Admin	2023-10-24	\N	\N	407
333	2	3182550798945	1	Admin	2023-10-24	\N	\N	452
334	2	3182550799768	1	Admin	2023-10-24	\N	\N	450
335	2	3182550831086	1	Admin	2023-10-24	\N	\N	391
336	2	3182550831383	1	Admin	2023-10-24	\N	\N	428
337	2	3182550831390	1	Admin	2023-10-24	\N	\N	427
338	2	319	1	Admin	2023-10-24	\N	\N	1497
339	2	32	1	Admin	2023-10-24	\N	\N	810
340	2	320	0	Admin	2023-10-24	\N	\N	1498
341	2	321	0	Admin	2023-10-24	\N	\N	1499
342	2	322	1	Admin	2023-10-24	\N	\N	1501
343	2	323	1	Admin	2023-10-24	\N	\N	1502
344	2	33	1	Admin	2023-10-24	\N	\N	811
345	2	33015	1	Admin	2023-10-24	\N	\N	473
346	2	33016	1	Admin	2023-10-24	\N	\N	461
347	2	33059	1	Admin	2023-10-24	\N	\N	462
348	2	3411112261956	1	Admin	2023-10-24	\N	\N	797
349	2	350	0	Admin	2023-10-24	\N	\N	1452
350	2	3552793078300	5	Admin	2023-10-24	\N	\N	548
351	2	3552793078324	5	Admin	2023-10-24	\N	\N	547
352	2	40	1	Admin	2023-10-24	\N	\N	812
353	2	400	0	Admin	2023-10-24	\N	\N	1165
354	2	4007221039112	2	Admin	2023-10-24	\N	\N	670
355	2	4007221039129	6	Admin	2023-10-24	\N	\N	671
356	2	4007221043218	1	Admin	2023-10-24	\N	\N	522
357	2	4007221052180	24	Admin	2023-10-24	\N	\N	1555
358	2	4007221054221	20	Admin	2023-10-24	\N	\N	1556
359	2	401	1	Admin	2023-10-24	\N	\N	1166
360	2	402	1	Admin	2023-10-24	\N	\N	1267
361	2	403	0	Admin	2023-10-24	\N	\N	1375
362	2	404	0	Admin	2023-10-24	\N	\N	1398
363	2	41	1	Admin	2023-10-24	\N	\N	813
364	2	41006	0	Admin	2023-10-24	\N	\N	505
365	2	41013	0	Admin	2023-10-24	\N	\N	511
366	2	41019	1	Admin	2023-10-24	\N	\N	512
367	2	412	1	Admin	2023-10-24	\N	\N	1517
368	2	415	1	Admin	2023-10-24	\N	\N	1520
369	2	416	1	Admin	2023-10-24	\N	\N	1521
370	2	42	1	Admin	2023-10-24	\N	\N	814
371	2	4260448120210	10	Admin	2023-10-24	\N	\N	1439
372	2	43	0	Admin	2023-10-24	\N	\N	815
373	2	45	1	Admin	2023-10-24	\N	\N	944
374	2	4894158096291	1	Admin	2023-10-24	\N	\N	1106
375	2	50	1	Admin	2023-10-24	\N	\N	816
376	2	51	1	Admin	2023-10-24	\N	\N	817
377	2	52	1	Admin	2023-10-24	\N	\N	818
378	2	53	1	Admin	2023-10-24	\N	\N	819
379	2	5414736039282	2	Admin	2023-10-24	\N	\N	1163
380	2	5414736047911	1	Admin	2023-10-24	\N	\N	466
381	2	5414736047928	1	Admin	2023-10-24	\N	\N	467
382	2	5414736047935	1	Admin	2023-10-24	\N	\N	468
383	2	5414736047942	1	Admin	2023-10-24	\N	\N	469
384	2	5414736048253	1	Admin	2023-10-24	\N	\N	1644
385	2	5415341001961	1	Admin	2023-10-24	\N	\N	596
386	2	5420043705338	1	Admin	2023-10-24	\N	\N	464
387	2	5420043705345	1	Admin	2023-10-24	\N	\N	465
388	2	6	0	Admin	2023-10-24	\N	\N	987
389	2	60	1	Admin	2023-10-24	\N	\N	820
390	2	61	1	Admin	2023-10-24	\N	\N	821
391	2	62	1	Admin	2023-10-24	\N	\N	822
392	2	63	1	Admin	2023-10-24	\N	\N	823
393	2	645095002166	1	Admin	2023-10-24	\N	\N	983
394	2	659525114701	0	Admin	2023-10-24	\N	\N	1622
395	2	662858207224	1	Admin	2023-10-24	\N	\N	1178
396	2	662858226003	10	Admin	2023-10-24	\N	\N	1164
397	2	682500939518	0	Admin	2023-10-24	\N	\N	942
398	2	682500939679	1	Admin	2023-10-24	\N	\N	943
399	2	6828949660383	1	Admin	2023-10-24	\N	\N	1602
400	2	6920190048764	1	Admin	2023-10-24	\N	\N	1086
401	2	6953182709244	1	Admin	2023-10-24	\N	\N	587
402	2	6953182710585	1	Admin	2023-10-24	\N	\N	550
403	2	6953182710820	1	Admin	2023-10-24	\N	\N	1128
404	2	6953182714576	1	Admin	2023-10-24	\N	\N	1372
405	2	6953182714972	1	Admin	2023-10-24	\N	\N	1116
406	2	6953182718062	1	Admin	2023-10-24	\N	\N	1119
407	2	6953182719458	1	Admin	2023-10-24	\N	\N	441
408	2	6953182719571	1	Admin	2023-10-24	\N	\N	1117
409	2	6953182720072	1	Admin	2023-10-24	\N	\N	1118
410	2	6953182721161	1	Admin	2023-10-24	\N	\N	585
411	2	6953182731450	1	Admin	2023-10-24	\N	\N	555
412	2	6953182731481	1	Admin	2023-10-24	\N	\N	556
413	2	6953182732365	0	Admin	2023-10-24	\N	\N	437
414	2	6953182732372	1	Admin	2023-10-24	\N	\N	438
415	2	6953182732389	1	Admin	2023-10-24	\N	\N	439
416	2	6953182732440	1	Admin	2023-10-24	\N	\N	440
417	2	6953182735083	1	Admin	2023-10-24	\N	\N	1278
418	2	6972170629975	1	Admin	2023-10-24	\N	\N	1610
419	2	6995654545424	1	Admin	2023-10-24	\N	\N	1599
420	2	70	1	Admin	2023-10-24	\N	\N	824
421	2	71	1	Admin	2023-10-24	\N	\N	825
422	2	711604200290	1	Admin	2023-10-24	\N	\N	1284
423	2	711604203734	3	Admin	2023-10-24	\N	\N	1285
424	2	714193509102	1	Admin	2023-10-24	\N	\N	1216
425	2	714193600724	2	Admin	2023-10-24	\N	\N	1217
426	2	714193600823	1	Admin	2023-10-24	\N	\N	727
427	2	714193600861	1	Admin	2023-10-24	\N	\N	726
428	2	714193600984	1	Admin	2023-10-24	\N	\N	728
429	2	714193610934	1	Admin	2023-10-24	\N	\N	1623
430	2	714193699728	1	Admin	2023-10-24	\N	\N	725
431	2	7191600000507	1	Admin	2023-10-24	\N	\N	1254
432	2	72	1	Admin	2023-10-24	\N	\N	826
433	2	73	1	Admin	2023-10-24	\N	\N	827
434	2	73000101	0	Admin	2023-10-24	\N	\N	158
435	2	73008199IO	0	Admin	2023-10-24	\N	\N	388
436	2	73033333	0	Admin	2023-10-24	\N	\N	159
437	2	736990012050	1	Admin	2023-10-24	\N	\N	887
438	2	736990012104	1	Admin	2023-10-24	\N	\N	886
439	2	736990012159	1	Admin	2023-10-24	\N	\N	888
440	2	736990012203	1	Admin	2023-10-24	\N	\N	889
441	2	736990012258	1	Admin	2023-10-24	\N	\N	890
442	2	736990013002	1	Admin	2023-10-24	\N	\N	884
443	2	736990013309	1	Admin	2023-10-24	\N	\N	885
444	2	736990040114	1	Admin	2023-10-24	\N	\N	883
445	2	74 6203100578	1	Admin	2023-10-24	\N	\N	1132
446	2	7404000315615	1	Admin	2023-10-24	\N	\N	638
447	2	7404000315622	1	Admin	2023-10-24	\N	\N	639
448	2	7404000315639	1	Admin	2023-10-24	\N	\N	640
449	2	7404000315646	1	Admin	2023-10-24	\N	\N	641
450	2	7406160004224	1	Admin	2023-10-24	\N	\N	599
451	2	7410000115322	1	Admin	2023-10-24	\N	\N	1262
452	2	7410032780024	1	Admin	2023-10-24	\N	\N	710
453	2	7410032780031	0	Admin	2023-10-24	\N	\N	711
454	2	7414400200596	1	Admin	2023-10-24	\N	\N	1210
455	2	7414400201012	1	Admin	2023-10-24	\N	\N	732
456	2	7414400201050	1	Admin	2023-10-24	\N	\N	739
457	2	7414400201067	1	Admin	2023-10-24	\N	\N	740
458	2	7414400201074	1	Admin	2023-10-24	\N	\N	737
459	2	7414400201081	1	Admin	2023-10-24	\N	\N	738
460	2	7414400201111	1	Admin	2023-10-24	\N	\N	735
461	2	7414400201128	1	Admin	2023-10-24	\N	\N	736
462	2	7414400201210	1	Admin	2023-10-24	\N	\N	1479
463	2	7414400201227	1	Admin	2023-10-24	\N	\N	1478
464	2	7414400201234	1	Admin	2023-10-24	\N	\N	1477
465	2	7414400201296	1	Admin	2023-10-24	\N	\N	734
466	2	7414400201302	1	Admin	2023-10-24	\N	\N	733
467	2	7414400201364	1	Admin	2023-10-24	\N	\N	1458
468	2	7414400201432	1	Admin	2023-10-24	\N	\N	1215
469	2	7414400201449	1	Admin	2023-10-24	\N	\N	1213
470	2	7414400201456	0	Admin	2023-10-24	\N	\N	1212
471	2	7414400201470	1	Admin	2023-10-24	\N	\N	715
472	2	7414400201487	1	Admin	2023-10-24	\N	\N	717
473	2	7414400201494	1	Admin	2023-10-24	\N	\N	716
474	2	7414400201609	1	Admin	2023-10-24	\N	\N	851
475	2	7414400201616	1	Admin	2023-10-24	\N	\N	850
476	2	7414400201623	1	Admin	2023-10-24	\N	\N	852
477	2	7414400202088	1	Admin	2023-10-24	\N	\N	1214
478	2	7414400202095	1	Admin	2023-10-24	\N	\N	1209
479	2	7414400202101	1	Admin	2023-10-24	\N	\N	1211
480	2	7414400202149	1	Admin	2023-10-24	\N	\N	1208
481	2	7416203100264	1	Admin	2023-10-24	\N	\N	560
482	2	7416203100271	1	Admin	2023-10-24	\N	\N	561
483	2	7416203100288	1	Admin	2023-10-24	\N	\N	562
484	2	7416203100295	1	Admin	2023-10-24	\N	\N	563
485	2	7416203100301	1	Admin	2023-10-24	\N	\N	564
486	2	7416203100318	1	Admin	2023-10-24	\N	\N	565
487	2	7416203100578	0	Admin	2023-10-24	\N	\N	1162
488	2	7416203100585	1	Admin	2023-10-24	\N	\N	1136
489	2	7416203100592	1	Admin	2023-10-24	\N	\N	1135
490	2	7416203100608	1	Admin	2023-10-24	\N	\N	1134
491	2	7416203100615	1	Admin	2023-10-24	\N	\N	1131
492	2	7416203100622	1	Admin	2023-10-24	\N	\N	1137
493	2	7416203100639	1	Admin	2023-10-24	\N	\N	1126
494	2	7416203100646	1	Admin	2023-10-24	\N	\N	1125
495	2	7416203100653	1	Admin	2023-10-24	\N	\N	1124
496	2	7416203100660	1	Admin	2023-10-24	\N	\N	1123
497	2	7416203100677	1	Admin	2023-10-24	\N	\N	1122
498	2	7416203100684	1	Admin	2023-10-24	\N	\N	1121
499	2	7416203100844	1	Admin	2023-10-24	\N	\N	553
500	2	7416203101179	1	Admin	2023-10-24	\N	\N	1129
501	2	7416203101209	1	Admin	2023-10-24	\N	\N	584
502	2	7416203101247	1	Admin	2023-10-24	\N	\N	566
503	2	7416203101254	1	Admin	2023-10-24	\N	\N	567
504	2	7416203101261	1	Admin	2023-10-24	\N	\N	569
505	2	7416203101278	1	Admin	2023-10-24	\N	\N	571
506	2	7416203101438	1	Admin	2023-10-24	\N	\N	619
507	2	7416203101445	1	Admin	2023-10-24	\N	\N	484
508	2	7416203101469	1	Admin	2023-10-24	\N	\N	573
509	2	7416203101520	1	Admin	2023-10-24	\N	\N	442
510	2	7416203101544	1	Admin	2023-10-24	\N	\N	617
511	2	7416203101551	1	Admin	2023-10-24	\N	\N	616
512	2	7416203101667	1	Admin	2023-10-24	\N	\N	443
513	2	7416203101797	0	Admin	2023-10-24	\N	\N	600
514	2	7416203101827	1	Admin	2023-10-24	\N	\N	626
515	2	7416203101834	1	Admin	2023-10-24	\N	\N	590
516	2	7416203101902	1	Admin	2023-10-24	\N	\N	549
517	2	7416203101926	1	Admin	2023-10-24	\N	\N	1115
518	2	7416203101964	1	Admin	2023-10-24	\N	\N	483
519	2	7416203102183	1	Admin	2023-10-24	\N	\N	1120
520	2	7416203102213	1	Admin	2023-10-24	\N	\N	621
521	2	7416203102220	1	Admin	2023-10-24	\N	\N	620
522	2	7416203102237	1	Admin	2023-10-24	\N	\N	622
523	2	7416203102244	1	Admin	2023-10-24	\N	\N	618
524	2	7416203102916	1	Admin	2023-10-24	\N	\N	581
525	2	7416203102923	1	Admin	2023-10-24	\N	\N	582
526	2	7416203102930	1	Admin	2023-10-24	\N	\N	583
527	2	7416203103326	1	Admin	2023-10-24	\N	\N	479
528	2	7416203103333	1	Admin	2023-10-24	\N	\N	480
529	2	7416203103340	1	Admin	2023-10-24	\N	\N	481
530	2	7416203103357	1	Admin	2023-10-24	\N	\N	1127
531	2	7416203103364	1	Admin	2023-10-24	\N	\N	1133
532	2	7416203103371	1	Admin	2023-10-24	\N	\N	474
533	2	7416203103388	1	Admin	2023-10-24	\N	\N	475
534	2	7416203103395	1	Admin	2023-10-24	\N	\N	476
535	2	7416203103401	1	Admin	2023-10-24	\N	\N	477
536	2	7416203103418	1	Admin	2023-10-24	\N	\N	478
537	2	7416203103425	1	Admin	2023-10-24	\N	\N	482
538	2	7416203103685	1	Admin	2023-10-24	\N	\N	1374
539	2	7416203103692	1	Admin	2023-10-24	\N	\N	591
540	2	7416203103708	1	Admin	2023-10-24	\N	\N	592
541	2	7416203103722	1	Admin	2023-10-24	\N	\N	624
542	2	7416203103739	1	Admin	2023-10-24	\N	\N	623
543	2	7416203103753	1	Admin	2023-10-24	\N	\N	593
544	2	7416203103760	1	Admin	2023-10-24	\N	\N	594
545	2	7420615480007-7.5	1	Admin	2023-10-24	\N	\N	1594
546	2	742061548007-10	1	Admin	2023-10-24	\N	\N	892
547	2	742061548007-12.5	1	Admin	2023-10-24	\N	\N	893
548	2	742061548007-15	1	Admin	2023-10-24	\N	\N	894
549	2	742061548007-20	1	Admin	2023-10-24	\N	\N	895
550	2	742061548007-25	1	Admin	2023-10-24	\N	\N	896
551	2	742061548007-30	1	Admin	2023-10-24	\N	\N	897
552	2	742061548007-7.5	1	Admin	2023-10-24	\N	\N	891
553	2	7441003121935	60	Admin	2023-10-24	\N	\N	662
554	2	7441003121942	90	Admin	2023-10-24	\N	\N	661
555	2	7441007802434	3	Admin	2023-10-24	\N	\N	1574
556	2	7441031336950	1	Admin	2023-10-24	\N	\N	1286
557	2	7453105056978	1	Admin	2023-10-24	\N	\N	1098
558	2	7501	0	Admin	2023-10-24	\N	\N	1611
559	2	7501051100020	1	Admin	2023-10-24	\N	\N	1245
560	2	7501051100037	1	Admin	2023-10-24	\N	\N	660
561	2	7501051186963	1	Admin	2023-10-24	\N	\N	1247
562	2	7501072204462	1	Admin	2023-10-24	\N	\N	1492
563	2	7501072204479	1	Admin	2023-10-24	\N	\N	1493
564	2	7501072204561	1	Admin	2023-10-24	\N	\N	488
565	2	7501072204578	1	Admin	2023-10-24	\N	\N	1223
566	2	7501072204592	1	Admin	2023-10-24	\N	\N	1391
567	2	7501072204615	1	Admin	2023-10-24	\N	\N	1218
568	2	7501072206299	1	Admin	2023-10-24	\N	\N	491
569	2	7501072206305	1	Admin	2023-10-24	\N	\N	1219
570	2	7501072207234	1	Admin	2023-10-24	\N	\N	485
571	2	7501072207258	1	Admin	2023-10-24	\N	\N	493
572	2	7501072207265	1	Admin	2023-10-24	\N	\N	492
573	2	7501072208231	1	Admin	2023-10-24	\N	\N	499
574	2	7501072208248	1	Admin	2023-10-24	\N	\N	486
575	2	7501072208262	1	Admin	2023-10-24	\N	\N	1496
576	2	7501072208279	1	Admin	2023-10-24	\N	\N	500
577	2	7501072208293	1	Admin	2023-10-24	\N	\N	489
578	2	7501072208743	1	Admin	2023-10-24	\N	\N	1389
579	2	7501072208767	1	Admin	2023-10-24	\N	\N	1224
580	2	7501072208781	1	Admin	2023-10-24	\N	\N	498
581	2	7501072208798	1	Admin	2023-10-24	\N	\N	1221
582	2	7501072208927	1	Admin	2023-10-24	\N	\N	1461
583	2	7501072208958	1	Admin	2023-10-24	\N	\N	490
584	2	7501072208972	1	Admin	2023-10-24	\N	\N	1631
585	2	7501072210609	1	Admin	2023-10-24	\N	\N	1390
586	2	7501072210616	1	Admin	2023-10-24	\N	\N	1220
587	2	7501072210623	1	Admin	2023-10-24	\N	\N	497
588	2	7501072210630	1	Admin	2023-10-24	\N	\N	1460
589	2	7501072210661	1	Admin	2023-10-24	\N	\N	1392
590	2	7501072210678	1	Admin	2023-10-24	\N	\N	1282
591	2	7501072210685	1	Admin	2023-10-24	\N	\N	1076
592	2	7501072210692	1	Admin	2023-10-24	\N	\N	487
593	2	7501072210715	4	Admin	2023-10-24	\N	\N	1222
594	2	7501072210722	1	Admin	2023-10-24	\N	\N	1354
595	2	7501072210739	1	Admin	2023-10-24	\N	\N	1634
596	2	7501072214485	1	Admin	2023-10-24	\N	\N	924
597	2	7501072214492	1	Admin	2023-10-24	\N	\N	927
598	2	7501072214508	1	Admin	2023-10-24	\N	\N	919
599	2	7501072214515	1	Admin	2023-10-24	\N	\N	926
600	2	7501072214522	0	Admin	2023-10-24	\N	\N	923
601	2	7501072214539	1	Admin	2023-10-24	\N	\N	921
602	2	7501072214546	1	Admin	2023-10-24	\N	\N	922
603	2	7501072214560	1	Admin	2023-10-24	\N	\N	920
604	2	7502010420043	1	Admin	2023-10-24	\N	\N	1283
605	2	7502010421118	24	Admin	2023-10-24	\N	\N	503
606	2	7502010421125	1	Admin	2023-10-24	\N	\N	502
607	2	7502010421132	24	Admin	2023-10-24	\N	\N	501
608	2	7502010421187	1	Admin	2023-10-24	\N	\N	513
609	2	7502010421194	1	Admin	2023-10-24	\N	\N	1444
610	2	7502010423969	1	Admin	2023-10-24	\N	\N	530
611	2	7502010429701	2	Admin	2023-10-24	\N	\N	537
612	2	7502262630023	30	Admin	2023-10-24	\N	\N	763
613	2	7502262630740	1	Admin	2023-10-24	\N	\N	518
614	2	7502262630795	1	Admin	2023-10-24	\N	\N	1275
615	2	7503008553002	1	Admin	2023-10-24	\N	\N	753
616	2	7503008553040	1	Admin	2023-10-24	\N	\N	752
617	2	7503008553057	1	Admin	2023-10-24	\N	\N	1593
618	2	7503008553071	0	Admin	2023-10-24	\N	\N	1589
619	2	7503008553200	1	Admin	2023-10-24	\N	\N	750
620	2	7503008553231	1	Admin	2023-10-24	\N	\N	1396
621	2	7503008553248	1	Admin	2023-10-24	\N	\N	751
622	2	7503008553255	1	Admin	2023-10-24	\N	\N	1395
623	2	7503008553279	1	Admin	2023-10-24	\N	\N	1428
624	2	7503008553965	1	Admin	2023-10-24	\N	\N	799
625	2	7503008553972	1	Admin	2023-10-24	\N	\N	1394
626	2	7503019166604	1	Admin	2023-10-24	\N	\N	520
627	2	7503020053085	1	Admin	2023-10-24	\N	\N	1393
628	2	7503020053290	1	Admin	2023-10-24	\N	\N	754
629	2	7503020053306	1	Admin	2023-10-24	\N	\N	757
630	2	7503020053313	1	Admin	2023-10-24	\N	\N	758
631	2	7503020053320	1	Admin	2023-10-24	\N	\N	1397
632	2	7503020053382	1	Admin	2023-10-24	\N	\N	1590
633	2	7503020053849	1	Admin	2023-10-24	\N	\N	798
634	2	7503026084113	1	Admin	2023-10-24	\N	\N	756
635	2	7503026084144	1	Admin	2023-10-24	\N	\N	755
636	2	7503026470107	3	Admin	2023-10-24	\N	\N	846
637	2	7503027959472	1	Admin	2023-10-24	\N	\N	527
638	2	7506267903489	1	Admin	2023-10-24	\N	\N	1438
639	2	7506267907340	1	Admin	2023-10-24	\N	\N	1442
640	2	7506267907357	0	Admin	2023-10-24	\N	\N	1441
641	2	7506267907371	1	Admin	2023-10-24	\N	\N	1440
642	2	7506343800015	30	Admin	2023-10-24	\N	\N	644
643	2	7506343800022	30	Admin	2023-10-24	\N	\N	645
644	2	7506343800039	30	Admin	2023-10-24	\N	\N	646
645	2	7506343800176	1	Admin	2023-10-24	\N	\N	642
646	2	7506343800190	1	Admin	2023-10-24	\N	\N	643
647	2	7506343800794	5	Admin	2023-10-24	\N	\N	631
648	2	7506343801784	1	Admin	2023-10-24	\N	\N	647
649	2	7506343802668	1	Admin	2023-10-24	\N	\N	630
650	2	7506343802675	1	Admin	2023-10-24	\N	\N	649
651	2	7506343802798	6	Admin	2023-10-24	\N	\N	648
652	2	7506396700645	1	Admin	2023-10-24	\N	\N	532
653	2	7506407400328	1	Admin	2023-10-24	\N	\N	519
654	2	7506407400618	6	Admin	2023-10-24	\N	\N	969
655	2	7506407400625	6	Admin	2023-10-24	\N	\N	970
656	2	7506407400977	2	Admin	2023-10-24	\N	\N	968
657	2	7506407401691	1	Admin	2023-10-24	\N	\N	967
658	2	7506407402094	1	Admin	2023-10-24	\N	\N	965
659	2	7506407402124	1	Admin	2023-10-24	\N	\N	538
660	2	7506407402193	20	Admin	2023-10-24	\N	\N	971
661	2	7506407402216	1	Admin	2023-10-24	\N	\N	523
662	2	7506407402247	1	Admin	2023-10-24	\N	\N	528
663	2	7506407402469	1	Admin	2023-10-24	\N	\N	966
664	2	7593990010041	1	Admin	2023-10-24	\N	\N	1082
665	2	7593990010058	1	Admin	2023-10-24	\N	\N	1105
666	2	7593990012953	1	Admin	2023-10-24	\N	\N	1104
667	2	7593990050511	1	Admin	2023-10-24	\N	\N	1103
668	2	769229001167	6	Admin	2023-10-24	\N	\N	651
669	2	769229002430	1	Admin	2023-10-24	\N	\N	663
670	2	769229002683	72	Admin	2023-10-24	\N	\N	672
671	2	769229003611	100	Admin	2023-10-24	\N	\N	658
672	2	769229003710	1	Admin	2023-10-24	\N	\N	673
673	2	769229003734	1	Admin	2023-10-24	\N	\N	664
674	2	769229003741	1	Admin	2023-10-24	\N	\N	656
675	2	769229003758	1	Admin	2023-10-24	\N	\N	657
676	2	769229049510	500	Admin	2023-10-24	\N	\N	655
677	2	769229124217	100	Admin	2023-10-24	\N	\N	650
678	2	769229131413	1	Admin	2023-10-24	\N	\N	653
679	2	769229131512	1	Admin	2023-10-24	\N	\N	652
680	2	769229131918	1	Admin	2023-10-24	\N	\N	654
681	2	7707007404604	1	Admin	2023-10-24	\N	\N	1256
682	2	7707007405663	1	Admin	2023-10-24	\N	\N	1258
683	2	7707115301161	1	Admin	2023-10-24	\N	\N	458
684	2	7707115301222	1	Admin	2023-10-24	\N	\N	455
685	2	7707115301468	1	Admin	2023-10-24	\N	\N	457
686	2	7707115301611	2	Admin	2023-10-24	\N	\N	536
687	2	7707214570659	6	Admin	2023-10-24	\N	\N	940
688	2	7707214570833	1	Admin	2023-10-24	\N	\N	941
689	2	7707214570918	3	Admin	2023-10-24	\N	\N	937
690	2	7707214570949	3	Admin	2023-10-24	\N	\N	938
691	2	7707214573001	3	Admin	2023-10-24	\N	\N	939
692	2	7707274710316	1	Admin	2023-10-24	\N	\N	515
693	2	7707274714215	10	Admin	2023-10-24	\N	\N	460
694	2	7707274715014	1	Admin	2023-10-24	\N	\N	454
695	2	7707274717001	1	Admin	2023-10-24	\N	\N	459
696	2	7707274718060	1	Admin	2023-10-24	\N	\N	453
697	2	7730952032677	1	Admin	2023-10-24	\N	\N	526
698	2	7730952032899	1	Admin	2023-10-24	\N	\N	1525
699	2	7730997410614	1	Admin	2023-10-24	\N	\N	760
700	2	7730997410621	1	Admin	2023-10-24	\N	\N	759
701	2	7730997410638	1	Admin	2023-10-24	\N	\N	761
702	2	7730997410645	1	Admin	2023-10-24	\N	\N	762
703	2	7756654000363	1	Admin	2023-10-24	\N	\N	1509
704	2	7756654000370	1	Admin	2023-10-24	\N	\N	1508
705	2	7756654000387	1	Admin	2023-10-24	\N	\N	1512
706	2	7756654000400	2	Admin	2023-10-24	\N	\N	1516
707	2	7756654000424	1	Admin	2023-10-24	\N	\N	1505
708	2	7756654000448	2	Admin	2023-10-24	\N	\N	1510
709	2	7756654015220	1	Admin	2023-10-24	\N	\N	1504
710	2	7756654020156	1	Admin	2023-10-24	\N	\N	1514
711	2	7756654020293	1	Admin	2023-10-24	\N	\N	1511
712	2	7756654027926	1	Admin	2023-10-24	\N	\N	1618
713	2	7756654027933	1	Admin	2023-10-24	\N	\N	1617
714	2	7756654027940	1	Admin	2023-10-24	\N	\N	1616
715	2	7759433000059	1	Admin	2023-10-24	\N	\N	1475
716	2	7759433000882	7	Admin	2023-10-24	\N	\N	1274
717	2	7759433000998	1	Admin	2023-10-24	\N	\N	1264
718	2	7759433001193	1	Admin	2023-10-24	\N	\N	1633
719	2	7759433001933	1	Admin	2023-10-24	\N	\N	1628
720	2	7759433001940	1	Admin	2023-10-24	\N	\N	1629
721	2	7792716421868	0	Admin	2023-10-24	\N	\N	1523
722	2	7797600000174	1	Admin	2023-10-24	\N	\N	1260
723	2	7797600000501	1	Admin	2023-10-24	\N	\N	1269
724	2	7797600000518	1	Admin	2023-10-24	\N	\N	1253
725	2	7797600000761	1	Admin	2023-10-24	\N	\N	1257
726	2	7797600000785	6	Admin	2023-10-24	\N	\N	1261
727	2	7797600001805	1	Admin	2023-10-24	\N	\N	1252
728	2	7797600001812	1	Admin	2023-10-24	\N	\N	1255
729	2	7797600002895	20	Admin	2023-10-24	\N	\N	1547
730	2	7797600002901	20	Admin	2023-10-24	\N	\N	1519
731	2	7798042360055	1	Admin	2023-10-24	\N	\N	767
732	2	7798042360093	1	Admin	2023-10-24	\N	\N	769
733	2	7798042360109	1	Admin	2023-10-24	\N	\N	768
734	2	7798042360178	6	Admin	2023-10-24	\N	\N	766
735	2	7798042360185	1	Admin	2023-10-24	\N	\N	535
736	2	7798042360260	1	Admin	2023-10-24	\N	\N	770
737	2	7798042360468	12	Admin	2023-10-24	\N	\N	764
738	2	7798042360581	1	Admin	2023-10-24	\N	\N	771
739	2	7798042361311	100	Admin	2023-10-24	\N	\N	785
740	2	7798042361335	1	Admin	2023-10-24	\N	\N	540
741	2	7798042361359	3	Admin	2023-10-24	\N	\N	773
742	2	7798042361380	2	Admin	2023-10-24	\N	\N	774
743	2	7798042361533	2	Admin	2023-10-24	\N	\N	780
744	2	7798042364800	1	Admin	2023-10-24	\N	\N	514
745	2	7798042364961	10	Admin	2023-10-24	\N	\N	772
746	2	7798042365685	3	Admin	2023-10-24	\N	\N	781
747	2	7798042365692	1	Admin	2023-10-24	\N	\N	782
748	2	7798042365708	1	Admin	2023-10-24	\N	\N	928
749	2	7798042365715	1	Admin	2023-10-24	\N	\N	903
750	2	7798042365722	12	Admin	2023-10-24	\N	\N	902
751	2	7798042365739	1	Admin	2023-10-24	\N	\N	925
752	2	7798042365975	12	Admin	2023-10-24	\N	\N	765
753	2	7798042366170	2	Admin	2023-10-24	\N	\N	783
754	2	7798042366187	1	Admin	2023-10-24	\N	\N	784
755	2	7798042366200	1	Admin	2023-10-24	\N	\N	778
756	2	7798042366217	1	Admin	2023-10-24	\N	\N	779
757	2	7798042366224	1	Admin	2023-10-24	\N	\N	790
758	2	7798042366231	1	Admin	2023-10-24	\N	\N	531
759	2	7798042366255	10	Admin	2023-10-24	\N	\N	775
760	2	7798042366262	1	Admin	2023-10-24	\N	\N	776
761	2	7798144990860	1	Admin	2023-10-24	\N	\N	1453
762	2	7798144993663	1	Admin	2023-10-24	\N	\N	1173
763	2	7798156460054	1	Admin	2023-10-24	\N	\N	521
764	2	7798156460061	1	Admin	2023-10-24	\N	\N	1524
765	2	7798156460290	1	Admin	2023-10-24	\N	\N	529
766	2	7798156460429	1	Admin	2023-10-24	\N	\N	544
767	2	7798156460498	1	Admin	2023-10-24	\N	\N	533
768	2	7798156460740	1	Admin	2023-10-24	\N	\N	1526
769	2	7798156461051	1	Admin	2023-10-24	\N	\N	539
770	2	7798156461808	1	Admin	2023-10-24	\N	\N	800
771	2	7798156461815	1	Admin	2023-10-24	\N	\N	801
772	2	7798156461853	1	Admin	2023-10-24	\N	\N	545
773	2	7798156461884	1	Admin	2023-10-24	\N	\N	534
774	2	7798156462928	50	Admin	2023-10-24	\N	\N	541
775	2	7798156463185	1	Admin	2023-10-24	\N	\N	543
776	2	7798166871895	2	Admin	2023-10-24	\N	\N	629
777	2	7798166871901	2	Admin	2023-10-24	\N	\N	632
778	2	7798166873134	1	Admin	2023-10-24	\N	\N	634
779	2	7798166873141	1	Admin	2023-10-24	\N	\N	635
780	2	7798166873158	1	Admin	2023-10-24	\N	\N	636
781	2	7798166873165	1	Admin	2023-10-24	\N	\N	633
782	2	7798166873172	1	Admin	2023-10-24	\N	\N	637
783	2	7798176420403	1	Admin	2023-10-24	\N	\N	1621
784	2	7798176420410	4	Admin	2023-10-24	\N	\N	952
785	2	7798176420434	1	Admin	2023-10-24	\N	\N	953
786	2	7798176420458	1	Admin	2023-10-24	\N	\N	950
787	2	7798176420465	2	Admin	2023-10-24	\N	\N	946
788	2	7798176421073	3	Admin	2023-10-24	\N	\N	863
789	2	7798176421080	3	Admin	2023-10-24	\N	\N	864
790	2	7798176421097	3	Admin	2023-10-24	\N	\N	865
791	2	7798176421103	3	Admin	2023-10-24	\N	\N	866
792	2	7798176421110	3	Admin	2023-10-24	\N	\N	867
793	2	7798176421196	2	Admin	2023-10-24	\N	\N	949
794	2	7798176421202	1	Admin	2023-10-24	\N	\N	951
795	2	7798176421219	1	Admin	2023-10-24	\N	\N	1638
796	2	7798176421264	1	Admin	2023-10-24	\N	\N	948
797	2	7798176421745	1	Admin	2023-10-24	\N	\N	1472
798	2	7798176421752	2	Admin	2023-10-24	\N	\N	1473
799	2	7798176421769	1	Admin	2023-10-24	\N	\N	1612
800	2	7798176421776	1	Admin	2023-10-24	\N	\N	1474
801	2	7798176421868	3	Admin	2023-10-24	\N	\N	868
802	2	7798176421875	3	Admin	2023-10-24	\N	\N	869
803	2	7798176421882	3	Admin	2023-10-24	\N	\N	870
804	2	7798176421899	3	Admin	2023-10-24	\N	\N	871
805	2	7798176421905	3	Admin	2023-10-24	\N	\N	872
806	2	7798176422926	4	Admin	2023-10-24	\N	\N	947
807	2	7798359710017	1	Admin	2023-10-24	\N	\N	1382
808	2	7800006000232	1	Admin	2023-10-24	\N	\N	913
809	2	7800006002038	1	Admin	2023-10-24	\N	\N	912
810	2	7800006002700	50	Admin	2023-10-24	\N	\N	918
811	2	7800006002724	3	Admin	2023-10-24	\N	\N	911
812	2	7800006003370	1	Admin	2023-10-24	\N	\N	915
813	2	7800006003561	1	Admin	2023-10-24	\N	\N	914
814	2	7800006003646	3	Admin	2023-10-24	\N	\N	917
815	2	7800006005169	1	Admin	2023-10-24	\N	\N	916
816	2	7800019000014	4	Admin	2023-10-24	\N	\N	1446
817	2	784369477115	1	Admin	2023-10-24	\N	\N	588
818	2	784369477122	1	Admin	2023-10-24	\N	\N	589
819	2	7898049715480	1	Admin	2023-10-24	\N	\N	506
820	2	7898049719273	1	Admin	2023-10-24	\N	\N	1643
821	2	7898416700040	1	Admin	2023-10-24	\N	\N	517
822	2	7898416700521	1	Admin	2023-10-24	\N	\N	932
823	2	7898416700743	0	Admin	2023-10-24	\N	\N	933
824	2	7898416701344	1	Admin	2023-10-24	\N	\N	929
825	2	7898416701955	4	Admin	2023-10-24	\N	\N	930
826	2	7898416701979	1	Admin	2023-10-24	\N	\N	931
827	2	7898597991329	1	Admin	2023-10-24	\N	\N	525
828	2	80	1	Admin	2023-10-24	\N	\N	828
829	2	8010690010908	1	Admin	2023-10-24	\N	\N	43
830	2	8010690010915	1	Admin	2023-10-24	\N	\N	42
831	2	8010690010946	1	Admin	2023-10-24	\N	\N	44
832	2	8010690010991	1	Admin	2023-10-24	\N	\N	46
833	2	8010690011080	1	Admin	2023-10-24	\N	\N	47
834	2	8010690011295	1	Admin	2023-10-24	\N	\N	48
835	2	8010690011301	1	Admin	2023-10-24	\N	\N	50
836	2	8010690011349	1	Admin	2023-10-24	\N	\N	1554
837	2	8010690011394	1	Admin	2023-10-24	\N	\N	51
838	2	8010690011547	1	Admin	2023-10-24	\N	\N	52
839	2	8010690011745	1	Admin	2023-10-24	\N	\N	53
840	2	8010690011769	1	Admin	2023-10-24	\N	\N	1553
841	2	8010690011790	1	Admin	2023-10-24	\N	\N	67
842	2	8010690011936	1	Admin	2023-10-24	\N	\N	68
843	2	8010690011967	1	Admin	2023-10-24	\N	\N	70
844	2	8010690012186	1	Admin	2023-10-24	\N	\N	1538
845	2	8010690012209	1	Admin	2023-10-24	\N	\N	72
846	2	8010690012308	1	Admin	2023-10-24	\N	\N	1008
847	2	8010690012360	1	Admin	2023-10-24	\N	\N	73
848	2	8010690012476	1	Admin	2023-10-24	\N	\N	74
849	2	8010690012674	1	Admin	2023-10-24	\N	\N	1009
850	2	8010690012698	1	Admin	2023-10-24	\N	\N	75
851	2	8010690014043	1	Admin	2023-10-24	\N	\N	1540
852	2	8010690025919	1	Admin	2023-10-24	\N	\N	94
853	2	8010690025926	1	Admin	2023-10-24	\N	\N	95
854	2	8010690025940	1	Admin	2023-10-24	\N	\N	96
855	2	8010690025988	1	Admin	2023-10-24	\N	\N	98
856	2	8010690026015	1	Admin	2023-10-24	\N	\N	99
857	2	8010690026053	1	Admin	2023-10-24	\N	\N	101
858	2	8010690026060	1	Admin	2023-10-24	\N	\N	102
859	2	8010690026084	1	Admin	2023-10-24	\N	\N	103
860	2	8010690026121	1	Admin	2023-10-24	\N	\N	104
861	2	8010690026138	0	Admin	2023-10-24	\N	\N	105
862	2	8010690026152	1	Admin	2023-10-24	\N	\N	106
863	2	8010690029214	1	Admin	2023-10-24	\N	\N	136
864	2	8010690029566	1	Admin	2023-10-24	\N	\N	1532
865	2	8010690029986	1	Admin	2023-10-24	\N	\N	1541
866	2	8010690029993	1	Admin	2023-10-24	\N	\N	1542
867	2	8010690030005	1	Admin	2023-10-24	\N	\N	1543
868	2	8010690030029	1	Admin	2023-10-24	\N	\N	1544
869	2	8010690037363	1	Admin	2023-10-24	\N	\N	20
870	2	8010690041926	1	Admin	2023-10-24	\N	\N	58
871	2	8010690041933	1	Admin	2023-10-24	\N	\N	60
872	2	8010690041940	1	Admin	2023-10-24	\N	\N	63
873	2	8010690042084	1	Admin	2023-10-24	\N	\N	1007
874	2	8010690042091	1	Admin	2023-10-24	\N	\N	57
875	2	8010690042114	1	Admin	2023-10-24	\N	\N	61
876	2	8010690042121	1	Admin	2023-10-24	\N	\N	59
877	2	8010690042145	0	Admin	2023-10-24	\N	\N	65
878	2	8010690042152	1	Admin	2023-10-24	\N	\N	62
879	2	8010690047775	0	Admin	2023-10-24	\N	\N	131
880	2	8010690050072	1	Admin	2023-10-24	\N	\N	54
881	2	8010690050089	1	Admin	2023-10-24	\N	\N	55
882	2	8010690050096	1	Admin	2023-10-24	\N	\N	991
883	2	8010690053677	1	Admin	2023-10-24	\N	\N	1015
884	2	8010690053691	1	Admin	2023-10-24	\N	\N	1535
885	2	8010690053714	1	Admin	2023-10-24	\N	\N	1016
886	2	8010690053738	1	Admin	2023-10-24	\N	\N	997
887	2	8010690053752	1	Admin	2023-10-24	\N	\N	1530
888	2	8010690053776	1	Admin	2023-10-24	\N	\N	1531
889	2	8010690055381	1	Admin	2023-10-24	\N	\N	107
890	2	8010690055398	1	Admin	2023-10-24	\N	\N	108
891	2	8010690055404	1	Admin	2023-10-24	\N	\N	109
892	2	8010690055411	1	Admin	2023-10-24	\N	\N	110
893	2	8010690055428	1	Admin	2023-10-24	\N	\N	111
894	2	8010690055435	1	Admin	2023-10-24	\N	\N	112
895	2	8010690055442	1	Admin	2023-10-24	\N	\N	113
896	2	8010690055459	1	Admin	2023-10-24	\N	\N	114
897	2	8010690055466	1	Admin	2023-10-24	\N	\N	115
898	2	8010690056135	1	Admin	2023-10-24	\N	\N	116
899	2	8010690056142	1	Admin	2023-10-24	\N	\N	117
900	2	8010690056159	1	Admin	2023-10-24	\N	\N	118
901	2	8010690056548	1	Admin	2023-10-24	\N	\N	129
902	2	8010690056555	1	Admin	2023-10-24	\N	\N	130
903	2	8010690056562	1	Admin	2023-10-24	\N	\N	134
904	2	8010690056579	1	Admin	2023-10-24	\N	\N	135
905	2	8010690056586	1	Admin	2023-10-24	\N	\N	981
906	2	8010690056616	1	Admin	2023-10-24	\N	\N	1533
907	2	8010690056630	1	Admin	2023-10-24	\N	\N	1141
908	2	8010690056647	1	Admin	2023-10-24	\N	\N	137
909	2	8010690056654	1	Admin	2023-10-24	\N	\N	1142
910	2	8010690056661	1	Admin	2023-10-24	\N	\N	138
911	2	8010690057552	1	Admin	2023-10-24	\N	\N	28
912	2	8010690057569	1	Admin	2023-10-24	\N	\N	29
913	2	8010690058160	1	Admin	2023-10-24	\N	\N	985
914	2	8010690059082	3	Admin	2023-10-24	\N	\N	1155
915	2	8010690061696	1	Admin	2023-10-24	\N	\N	389
916	2	8010690061702	1	Admin	2023-10-24	\N	\N	25
917	2	8010690062853	1	Admin	2023-10-24	\N	\N	24
918	2	8010690067339	1	Admin	2023-10-24	\N	\N	1138
919	2	8010690068121	1	Admin	2023-10-24	\N	\N	1160
920	2	8010690068138	1	Admin	2023-10-24	\N	\N	1161
921	2	8010690080017	1	Admin	2023-10-24	\N	\N	90
922	2	8010690080024	0	Admin	2023-10-24	\N	\N	91
923	2	8010690080031	1	Admin	2023-10-24	\N	\N	92
924	2	8010690088365	1	Admin	2023-10-24	\N	\N	132
925	2	8010690088457	1	Admin	2023-10-24	\N	\N	1159
926	2	8010690088563	1	Admin	2023-10-24	\N	\N	1529
927	2	8010690091471	1	Admin	2023-10-24	\N	\N	982
928	2	8010690092898	1	Admin	2023-10-24	\N	\N	1539
929	2	8010690093604	1	Admin	2023-10-24	\N	\N	133
930	2	8010690099552	1	Admin	2023-10-24	\N	\N	1546
931	2	8010690101491	0	Admin	2023-10-24	\N	\N	127
932	2	8010690101507	1	Admin	2023-10-24	\N	\N	128
933	2	8010690105796	1	Admin	2023-10-24	\N	\N	89
934	2	8010690105802	1	Admin	2023-10-24	\N	\N	93
935	2	8010690105819	0	Admin	2023-10-24	\N	\N	97
936	2	8010690105826	0	Admin	2023-10-24	\N	\N	100
937	2	8010690105833	1	Admin	2023-10-24	\N	\N	66
938	2	8010690105840	1	Admin	2023-10-24	\N	\N	69
939	2	8010690105857	1	Admin	2023-10-24	\N	\N	71
940	2	8010690105864	1	Admin	2023-10-24	\N	\N	41
941	2	8010690105871	1	Admin	2023-10-24	\N	\N	45
942	2	8010690105888	1	Admin	2023-10-24	\N	\N	49
943	2	8010690106571	1	Admin	2023-10-24	\N	\N	1534
944	2	8010690107028	1	Admin	2023-10-24	\N	\N	31
945	2	8010690107134	0	Admin	2023-10-24	\N	\N	32
946	2	8010690115924	1	Admin	2023-10-24	\N	\N	22
947	2	8010690122946	0	Admin	2023-10-24	\N	\N	139
948	2	8010690122953	0	Admin	2023-10-24	\N	\N	140
949	2	8010690122977	1	Admin	2023-10-24	\N	\N	141
950	2	8010690122991	0	Admin	2023-10-24	\N	\N	142
951	2	8010690123004	1	Admin	2023-10-24	\N	\N	143
952	2	8010690123011	0	Admin	2023-10-24	\N	\N	144
953	2	8010690123035	1	Admin	2023-10-24	\N	\N	145
954	2	8010690123059	1	Admin	2023-10-24	\N	\N	146
955	2	8010690123066	0	Admin	2023-10-24	\N	\N	147
956	2	8010690123073	0	Admin	2023-10-24	\N	\N	148
957	2	8010690123097	0	Admin	2023-10-24	\N	\N	164
958	2	8010690123110	0	Admin	2023-10-24	\N	\N	149
959	2	8010690123141	0	Admin	2023-10-24	\N	\N	150
960	2	8010690123158	0	Admin	2023-10-24	\N	\N	151
961	2	8010690123172	0	Admin	2023-10-24	\N	\N	152
962	2	8010690123196	0	Admin	2023-10-24	\N	\N	153
963	2	8010690123202	0	Admin	2023-10-24	\N	\N	154
964	2	8010690123219	0	Admin	2023-10-24	\N	\N	155
965	2	8010690123233	0	Admin	2023-10-24	\N	\N	156
966	2	8010690123257	0	Admin	2023-10-24	\N	\N	157
967	2	8010690133362	1	Admin	2023-10-24	\N	\N	21
968	2	8010690140346	1	Admin	2023-10-24	\N	\N	1010
969	2	8010690140360	1	Admin	2023-10-24	\N	\N	1011
970	2	8010690140377	1	Admin	2023-10-24	\N	\N	1012
971	2	8010690140384	1	Admin	2023-10-24	\N	\N	1013
972	2	8010690148977	0	Admin	2023-10-24	\N	\N	1146
973	2	8010690149004	0	Admin	2023-10-24	\N	\N	1147
974	2	8010690149011	0	Admin	2023-10-24	\N	\N	1148
975	2	8010690149028	0	Admin	2023-10-24	\N	\N	1151
976	2	8010690149059	0	Admin	2023-10-24	\N	\N	1149
977	2	8010690149066	0	Admin	2023-10-24	\N	\N	1150
978	2	8010690149073	1	Admin	2023-10-24	\N	\N	1153
979	2	8010690149097	0	Admin	2023-10-24	\N	\N	1154
980	2	8010690149103	1	Admin	2023-10-24	\N	\N	1152
981	2	8010690153100	1	Admin	2023-10-24	\N	\N	1158
982	2	8010690153124	3	Admin	2023-10-24	\N	\N	1157
983	2	8010690153568	1	Admin	2023-10-24	\N	\N	26
984	2	8010690153582	1	Admin	2023-10-24	\N	\N	27
985	2	8010690156156	1	Admin	2023-10-24	\N	\N	1179
986	2	8010690156163	1	Admin	2023-10-24	\N	\N	1180
987	2	8010690159270	1	Admin	2023-10-24	\N	\N	23
988	2	8010690159782	1	Admin	2023-10-24	\N	\N	56
989	2	8010690159867	0	Admin	2023-10-24	\N	\N	64
990	2	8010690160443	1	Admin	2023-10-24	\N	\N	1144
991	2	8010690160474	1	Admin	2023-10-24	\N	\N	1143
992	2	8010690160481	1	Admin	2023-10-24	\N	\N	1145
993	2	8010690160498	1	Admin	2023-10-24	\N	\N	984
994	2	8010690160511	0	Admin	2023-10-24	\N	\N	1400
995	2	8010690164670	1	Admin	2023-10-24	\N	\N	1545
996	2	8010690166308	1	Admin	2023-10-24	\N	\N	76
997	2	8010690166315	1	Admin	2023-10-24	\N	\N	77
998	2	8010690166322	1	Admin	2023-10-24	\N	\N	78
999	2	8010690166339	1	Admin	2023-10-24	\N	\N	79
1000	2	8010690166346	1	Admin	2023-10-24	\N	\N	80
1001	2	8010690166353	1	Admin	2023-10-24	\N	\N	81
1002	2	8010690166360	1	Admin	2023-10-24	\N	\N	82
1003	2	8010690166377	1	Admin	2023-10-24	\N	\N	83
1004	2	8010690168821	1	Admin	2023-10-24	\N	\N	980
1005	2	8010690172033	1	Admin	2023-10-24	\N	\N	1014
1006	2	8010690175331	1	Admin	2023-10-24	\N	\N	1552
1007	2	8010690175355	1	Admin	2023-10-24	\N	\N	33
1008	2	8010690175362	1	Admin	2023-10-24	\N	\N	34
1009	2	8010690175379	1	Admin	2023-10-24	\N	\N	35
1010	2	8010690175386	1	Admin	2023-10-24	\N	\N	36
1011	2	8010690175409	1	Admin	2023-10-24	\N	\N	37
1012	2	8010690175416	1	Admin	2023-10-24	\N	\N	38
1013	2	8010690175423	1	Admin	2023-10-24	\N	\N	986
1014	2	8010690175454	1	Admin	2023-10-24	\N	\N	988
1015	2	8010690175478	1	Admin	2023-10-24	\N	\N	989
1016	2	8010690175485	1	Admin	2023-10-24	\N	\N	39
1017	2	8010690175492	1	Admin	2023-10-24	\N	\N	990
1018	2	8010690175508	1	Admin	2023-10-24	\N	\N	40
1019	2	8010690175515	1	Admin	2023-10-24	\N	\N	84
1020	2	8010690175522	1	Admin	2023-10-24	\N	\N	85
1021	2	8010690175546	1	Admin	2023-10-24	\N	\N	1537
1022	2	8010690175553	1	Admin	2023-10-24	\N	\N	86
1023	2	8010690175577	1	Admin	2023-10-24	\N	\N	87
1024	2	8010690175584	1	Admin	2023-10-24	\N	\N	88
1025	2	8010690176161	0	Admin	2023-10-24	\N	\N	119
1026	2	8010690176178	0	Admin	2023-10-24	\N	\N	120
1027	2	8010690176208	1	Admin	2023-10-24	\N	\N	121
1028	2	8010690176215	1	Admin	2023-10-24	\N	\N	122
1029	2	8010690176222	0	Admin	2023-10-24	\N	\N	123
1030	2	8010690176260	0	Admin	2023-10-24	\N	\N	124
1031	2	8010690176277	0	Admin	2023-10-24	\N	\N	125
1032	2	8010690176307	0	Admin	2023-10-24	\N	\N	126
1033	2	8010690179445	1	Admin	2023-10-24	\N	\N	1536
1034	2	8010690180076	1	Admin	2023-10-24	\N	\N	998
1035	2	8010690180106	1	Admin	2023-10-24	\N	\N	999
1036	2	8010690180137	1	Admin	2023-10-24	\N	\N	1000
1037	2	8010690180168	1	Admin	2023-10-24	\N	\N	1001
1038	2	8010690180182	0	Admin	2023-10-24	\N	\N	1002
1039	2	8010690180755	1	Admin	2023-10-24	\N	\N	30
1040	2	8010690191065	1	Admin	2023-10-24	\N	\N	1527
1041	2	8010690191089	1	Admin	2023-10-24	\N	\N	1528
1042	2	81	1	Admin	2023-10-24	\N	\N	829
1043	2	811794010850	1	Admin	2023-10-24	\N	\N	1087
1044	2	811794010898	1	Admin	2023-10-24	\N	\N	1432
1045	2	82	1	Admin	2023-10-24	\N	\N	830
1046	2	83	1	Admin	2023-10-24	\N	\N	831
1047	2	84	1	Admin	2023-10-24	\N	\N	832
1048	2	8410650150130	1	Admin	2023-10-24	\N	\N	1480
1049	2	8410650150147	1	Admin	2023-10-24	\N	\N	690
1050	2	8410650150185	1	Admin	2023-10-24	\N	\N	1592
1051	2	8410650150192	1	Admin	2023-10-24	\N	\N	691
1052	2	8410650150253	1	Admin	2023-10-24	\N	\N	1205
1053	2	8410650151892	1	Admin	2023-10-24	\N	\N	1206
1054	2	8410650151946	3	Admin	2023-10-24	\N	\N	1207
1055	2	8410650152264	2	Admin	2023-10-24	\N	\N	693
1056	2	8410650152288	1	Admin	2023-10-24	\N	\N	1200
1057	2	8410650152301	1	Admin	2023-10-24	\N	\N	1204
1058	2	8410650152325	1	Admin	2023-10-24	\N	\N	695
1059	2	8410650152363	1	Admin	2023-10-24	\N	\N	1203
1060	2	8410650152400	1	Admin	2023-10-24	\N	\N	699
1061	2	8410650152448	1	Admin	2023-10-24	\N	\N	698
1062	2	8410650160474	1	Admin	2023-10-24	\N	\N	1557
1063	2	8410650167817	1	Admin	2023-10-24	\N	\N	694
1064	2	8410650168104	1	Admin	2023-10-24	\N	\N	1199
1065	2	8410650168128	1	Admin	2023-10-24	\N	\N	1201
1066	2	8410650170695	1	Admin	2023-10-24	\N	\N	692
1067	2	8410650170718	6	Admin	2023-10-24	\N	\N	1202
1068	2	8410650218649	1	Admin	2023-10-24	\N	\N	696
1069	2	8410650239132	1	Admin	2023-10-24	\N	\N	697
1070	2	842704100095	1	Admin	2023-10-24	\N	\N	834
1071	2	842704100743	1	Admin	2023-10-24	\N	\N	833
1072	2	8433042001582	1	Admin	2023-10-24	\N	\N	1450
1073	2	8436001971605	1	Admin	2023-10-24	\N	\N	793
1074	2	8436001971612	1	Admin	2023-10-24	\N	\N	1635
1075	2	8436001971643	1	Admin	2023-10-24	\N	\N	791
1076	2	8436001971650	1	Admin	2023-10-24	\N	\N	794
1077	2	8436001971681	1	Admin	2023-10-24	\N	\N	792
1078	2	8436001971704	1	Admin	2023-10-24	\N	\N	796
1079	2	8436001971728	1	Admin	2023-10-24	\N	\N	795
1080	2	8436532730030	1	Admin	2023-10-24	\N	\N	853
1081	2	8436532730047	1	Admin	2023-10-24	\N	\N	854
1082	2	8436532730122	1	Admin	2023-10-24	\N	\N	1279
1083	2	8436532730139	1	Admin	2023-10-24	\N	\N	1455
1084	2	8436532730146	5	Admin	2023-10-24	\N	\N	1280
1085	2	8436532730252	1	Admin	2023-10-24	\N	\N	1281
1086	2	8436532730412	1	Admin	2023-10-24	\N	\N	1456
1087	2	8436532730665	1	Admin	2023-10-24	\N	\N	855
1088	2	8470000397516	1	Admin	2023-10-24	\N	\N	1627
1089	2	8470000491269	1	Admin	2023-10-24	\N	\N	1619
1090	2	8470000493195	1	Admin	2023-10-24	\N	\N	1620
1091	2	8470000647512	1	Admin	2023-10-24	\N	\N	1500
1092	2	8470000957512	1	Admin	2023-10-24	\N	\N	1626
1093	2	847922021016	1	Admin	2023-10-24	\N	\N	1003
1094	2	847922021115	1	Admin	2023-10-24	\N	\N	1630
1095	2	847922021191	1	Admin	2023-10-24	\N	\N	1139
1096	2	847922021559	1	Admin	2023-10-24	\N	\N	1004
1097	2	847922021580	1	Admin	2023-10-24	\N	\N	1005
1098	2	847922021610	1	Admin	2023-10-24	\N	\N	1006
1099	2	847922024031	1	Admin	2023-10-24	\N	\N	976
1100	2	847922024048	1	Admin	2023-10-24	\N	\N	977
1101	2	847922027438	1	Admin	2023-10-24	\N	\N	978
1102	2	847922028084	1	Admin	2023-10-24	\N	\N	979
1103	2	847922075613	1	Admin	2023-10-24	\N	\N	161
1104	2	8699245857306	1	Admin	2023-10-24	\N	\N	1379
1105	2	8699245857313	1	Admin	2023-10-24	\N	\N	908
1106	2	8699245857337	1	Admin	2023-10-24	\N	\N	907
1107	2	8699245857351	1	Admin	2023-10-24	\N	\N	1380
1108	2	8699245857399	1	Admin	2023-10-24	\N	\N	1378
1109	2	8699245857405	1	Admin	2023-10-24	\N	\N	909
1110	2	8699245857429	1	Admin	2023-10-24	\N	\N	910
1111	2	8699245857443	1	Admin	2023-10-24	\N	\N	1381
1112	2	8713184080653	1	Admin	2023-10-24	\N	\N	1445
1113	2	8713184134349	1	Admin	2023-10-24	\N	\N	665
1114	2	8713184135278	5	Admin	2023-10-24	\N	\N	666
1115	2	8713184135285	5	Admin	2023-10-24	\N	\N	667
1116	2	8713184135292	1	Admin	2023-10-24	\N	\N	668
1117	2	8713184141408	1	Admin	2023-10-24	\N	\N	669
1118	2	8886467510229	1	Admin	2023-10-24	\N	\N	165
1119	2	8886467510236	1	Admin	2023-10-24	\N	\N	166
1120	2	8886467510250	1	Admin	2023-10-24	\N	\N	167
1121	2	8886467510267	1	Admin	2023-10-24	\N	\N	168
1122	2	8886467510281	1	Admin	2023-10-24	\N	\N	169
1123	2	8886467510311	1	Admin	2023-10-24	\N	\N	170
1124	2	8886467510328	1	Admin	2023-10-24	\N	\N	171
1125	2	8886467510335	1	Admin	2023-10-24	\N	\N	172
1126	2	8886467510410	1	Admin	2023-10-24	\N	\N	173
1127	2	8886467510427	1	Admin	2023-10-24	\N	\N	174
1128	2	8886467510434	1	Admin	2023-10-24	\N	\N	175
1129	2	8886467510441	1	Admin	2023-10-24	\N	\N	176
1130	2	8886467510458	1	Admin	2023-10-24	\N	\N	177
1131	2	8886467510465	1	Admin	2023-10-24	\N	\N	178
1132	2	8886467510588	1	Admin	2023-10-24	\N	\N	179
1133	2	8886467510724	1	Admin	2023-10-24	\N	\N	180
1134	2	8886467510755	1	Admin	2023-10-24	\N	\N	19
1135	2	8886467510830	1	Admin	2023-10-24	\N	\N	181
1136	2	8886467514210	1	Admin	2023-10-24	\N	\N	182
1137	2	8886467514401	0	Admin	2023-10-24	\N	\N	183
1138	2	8886467514418	0	Admin	2023-10-24	\N	\N	184
1139	2	8886467514425	0	Admin	2023-10-24	\N	\N	185
1140	2	8886467514463	1	Admin	2023-10-24	\N	\N	197
1141	2	8886467514470	1	Admin	2023-10-24	\N	\N	186
1142	2	8886467514487	1	Admin	2023-10-24	\N	\N	187
1143	2	8886467514494	1	Admin	2023-10-24	\N	\N	188
1144	2	8886467514579	1	Admin	2023-10-24	\N	\N	189
1145	2	8886467514616	1	Admin	2023-10-24	\N	\N	190
1146	2	8886467514623	1	Admin	2023-10-24	\N	\N	191
1147	2	8886467514630	1	Admin	2023-10-24	\N	\N	192
1148	2	8886467514647	1	Admin	2023-10-24	\N	\N	193
1149	2	8886467514654	1	Admin	2023-10-24	\N	\N	194
1150	2	8886467514661	1	Admin	2023-10-24	\N	\N	195
1151	2	8886467514678	1	Admin	2023-10-24	\N	\N	196
1152	2	8886467514685	1	Admin	2023-10-24	\N	\N	198
1153	2	8886467514692	1	Admin	2023-10-24	\N	\N	199
1154	2	8886467514715	1	Admin	2023-10-24	\N	\N	200
1155	2	8886467514722	1	Admin	2023-10-24	\N	\N	905
1156	2	8886467514739	1	Admin	2023-10-24	\N	\N	201
1157	2	8886467514746	1	Admin	2023-10-24	\N	\N	202
1158	2	8886467514760	1	Admin	2023-10-24	\N	\N	203
1159	2	8886467514814	1	Admin	2023-10-24	\N	\N	204
1160	2	8886467514821	0	Admin	2023-10-24	\N	\N	205
1161	2	8886467514906	1	Admin	2023-10-24	\N	\N	206
1162	2	8886467514920	1	Admin	2023-10-24	\N	\N	207
1163	2	8886467515521	1	Admin	2023-10-24	\N	\N	1385
1164	2	8886467515644	1	Admin	2023-10-24	\N	\N	208
1165	2	8886467515811	1	Admin	2023-10-24	\N	\N	209
1166	2	8886467515866	0	Admin	2023-10-24	\N	\N	210
1167	2	8886467515897	1	Admin	2023-10-24	\N	\N	211
1168	2	8886467515927	1	Admin	2023-10-24	\N	\N	212
1169	2	8886467515934	1	Admin	2023-10-24	\N	\N	213
1170	2	8886467515965	1	Admin	2023-10-24	\N	\N	214
1171	2	8886467520112	1	Admin	2023-10-24	\N	\N	215
1172	2	8886467520129	1	Admin	2023-10-24	\N	\N	216
1173	2	8886467520136	2	Admin	2023-10-24	\N	\N	217
1174	2	88864675201368886467520136	0	Admin	2023-10-24	\N	\N	1614
1175	2	8886467520143	1	Admin	2023-10-24	\N	\N	218
1176	2	8886467520150	1	Admin	2023-10-24	\N	\N	219
1177	2	8886467523212	1	Admin	2023-10-24	\N	\N	220
1178	2	8886467523229	1	Admin	2023-10-24	\N	\N	221
1179	2	8886467523236	1	Admin	2023-10-24	\N	\N	222
1180	2	8886467523243	1	Admin	2023-10-24	\N	\N	223
1181	2	8886467523250	1	Admin	2023-10-24	\N	\N	224
1182	2	8886467523267	1	Admin	2023-10-24	\N	\N	225
1183	2	8886467523274	0	Admin	2023-10-24	\N	\N	226
1184	2	8886467523298	0	Admin	2023-10-24	\N	\N	228
1185	2	8886467523311	1	Admin	2023-10-24	\N	\N	227
1186	2	8886467523328	1	Admin	2023-10-24	\N	\N	229
1187	2	8886467523335	1	Admin	2023-10-24	\N	\N	230
1188	2	8886467523342	1	Admin	2023-10-24	\N	\N	231
1189	2	8886467523356	0	Admin	2023-10-24	\N	\N	1075
1190	2	8886467523359	1	Admin	2023-10-24	\N	\N	232
1191	2	8886467523366	1	Admin	2023-10-24	\N	\N	233
1192	2	8886467523373	1	Admin	2023-10-24	\N	\N	234
1193	2	8886467523380	1	Admin	2023-10-24	\N	\N	235
1194	2	8886467523397	0	Admin	2023-10-24	\N	\N	236
1195	2	8886467523410	0	Admin	2023-10-24	\N	\N	237
1196	2	8886467523427	0	Admin	2023-10-24	\N	\N	238
1197	2	8886467523434	0	Admin	2023-10-24	\N	\N	239
1198	2	8886467523441	0	Admin	2023-10-24	\N	\N	240
1199	2	8886467523458	0	Admin	2023-10-24	\N	\N	241
1200	2	8886467523465	0	Admin	2023-10-24	\N	\N	242
1201	2	8886467523472	0	Admin	2023-10-24	\N	\N	243
1202	2	8886467523489	0	Admin	2023-10-24	\N	\N	244
1203	2	8886467523496	0	Admin	2023-10-24	\N	\N	245
1204	2	8886467523625	0	Admin	2023-10-24	\N	\N	246
1205	2	8886467523632	0	Admin	2023-10-24	\N	\N	247
1206	2	8886467523649	0	Admin	2023-10-24	\N	\N	248
1207	2	8886467523823	1	Admin	2023-10-24	\N	\N	992
1208	2	8886467523830	1	Admin	2023-10-24	\N	\N	993
1209	2	8886467523847	1	Admin	2023-10-24	\N	\N	994
1210	2	8886467525018	1	Admin	2023-10-24	\N	\N	249
1211	2	8886467525049	1	Admin	2023-10-24	\N	\N	250
1212	2	8886467525117	1	Admin	2023-10-24	\N	\N	251
1213	2	8886467525124	1	Admin	2023-10-24	\N	\N	252
1214	2	8886467525322	1	Admin	2023-10-24	\N	\N	253
1215	2	8886467525339	1	Admin	2023-10-24	\N	\N	254
1216	2	8886467525346	1	Admin	2023-10-24	\N	\N	255
1217	2	8886467525353	1	Admin	2023-10-24	\N	\N	256
1218	2	8886467525711	1	Admin	2023-10-24	\N	\N	257
1219	2	8886467525735	1	Admin	2023-10-24	\N	\N	258
1220	2	8886467525742	1	Admin	2023-10-24	\N	\N	259
1221	2	8886467525759	1	Admin	2023-10-24	\N	\N	260
1222	2	8886467529719	1	Admin	2023-10-24	\N	\N	261
1223	2	8886467529726	1	Admin	2023-10-24	\N	\N	262
1224	2	8886467529733	1	Admin	2023-10-24	\N	\N	263
1225	2	8886467529740	1	Admin	2023-10-24	\N	\N	264
1226	2	8886467530067	0	Admin	2023-10-24	\N	\N	265
1227	2	8886467530128	1	Admin	2023-10-24	\N	\N	266
1228	2	8886467530135	1	Admin	2023-10-24	\N	\N	267
1229	2	8886467530142	1	Admin	2023-10-24	\N	\N	268
1230	2	8886467530159	1	Admin	2023-10-24	\N	\N	269
1231	2	8886467530302	1	Admin	2023-10-24	\N	\N	270
1232	2	8886467530319	1	Admin	2023-10-24	\N	\N	271
1233	2	8886467530326	1	Admin	2023-10-24	\N	\N	272
1234	2	8886467530333	1	Admin	2023-10-24	\N	\N	273
1235	2	8886467530340	1	Admin	2023-10-24	\N	\N	274
1236	2	8886467530364	1	Admin	2023-10-24	\N	\N	275
1237	2	8886467530371	1	Admin	2023-10-24	\N	\N	276
1238	2	8886467530388	1	Admin	2023-10-24	\N	\N	277
1239	2	8886467530500	1	Admin	2023-10-24	\N	\N	278
1240	2	8886467531019	1	Admin	2023-10-24	\N	\N	279
1241	2	8886467531026	1	Admin	2023-10-24	\N	\N	280
1242	2	8886467531033	1	Admin	2023-10-24	\N	\N	281
1243	2	8886467531040	1	Admin	2023-10-24	\N	\N	282
1244	2	8886467532115	1	Admin	2023-10-24	\N	\N	283
1245	2	8886467532122	1	Admin	2023-10-24	\N	\N	906
1246	2	8886467532139	1	Admin	2023-10-24	\N	\N	284
1247	2	8886467532160	1	Admin	2023-10-24	\N	\N	285
1248	2	8886467532177	1	Admin	2023-10-24	\N	\N	286
1249	2	8886467532214	1	Admin	2023-10-24	\N	\N	287
1250	2	8886467532221	1	Admin	2023-10-24	\N	\N	288
1251	2	8886467532238	1	Admin	2023-10-24	\N	\N	289
1252	2	8886467532269	1	Admin	2023-10-24	\N	\N	290
1253	2	8886467532276	1	Admin	2023-10-24	\N	\N	291
1254	2	8886467532313	0	Admin	2023-10-24	\N	\N	292
1255	2	8886467532320	1	Admin	2023-10-24	\N	\N	293
1256	2	8886467532337	0	Admin	2023-10-24	\N	\N	294
1257	2	8886467532368	1	Admin	2023-10-24	\N	\N	295
1258	2	8886467532375	1	Admin	2023-10-24	\N	\N	296
1259	2	8886467532412	1	Admin	2023-10-24	\N	\N	297
1260	2	8886467532429	1	Admin	2023-10-24	\N	\N	298
1261	2	8886467532436	1	Admin	2023-10-24	\N	\N	299
1262	2	8886467532450	1	Admin	2023-10-24	\N	\N	300
1263	2	8886467532467	1	Admin	2023-10-24	\N	\N	301
1264	2	8886467532474	\N	Admin	2023-10-24	\N	\N	302
1265	2	8886467532511	1	Admin	2023-10-24	\N	\N	303
1266	2	8886467532528	1	Admin	2023-10-24	\N	\N	304
1267	2	8886467532535	1	Admin	2023-10-24	\N	\N	305
1268	2	8886467532559	1	Admin	2023-10-24	\N	\N	306
1269	2	8886467532566	1	Admin	2023-10-24	\N	\N	307
1270	2	8886467532573	1	Admin	2023-10-24	\N	\N	308
1271	2	8886467532634	1	Admin	2023-10-24	\N	\N	309
1272	2	8886467535222	1	Admin	2023-10-24	\N	\N	310
1273	2	8886467535239	1	Admin	2023-10-24	\N	\N	311
1274	2	8886467535246	1	Admin	2023-10-24	\N	\N	312
1275	2	8886467535321	1	Admin	2023-10-24	\N	\N	313
1276	2	8886467535413	1	Admin	2023-10-24	\N	\N	314
1277	2	8886467535420	0	Admin	2023-10-24	\N	\N	315
1278	2	8886467535437	1	Admin	2023-10-24	\N	\N	316
1279	2	8886467535536	1	Admin	2023-10-24	\N	\N	317
1280	2	8886467535543	1	Admin	2023-10-24	\N	\N	318
1281	2	8886467535611	1	Admin	2023-10-24	\N	\N	319
1282	2	8886467535628	1	Admin	2023-10-24	\N	\N	320
1283	2	8886467535635	1	Admin	2023-10-24	\N	\N	321
1284	2	8886467535642	1	Admin	2023-10-24	\N	\N	322
1285	2	8886467541018	1	Admin	2023-10-24	\N	\N	323
1286	2	8886467541025	1	Admin	2023-10-24	\N	\N	324
1287	2	8886467541032	1	Admin	2023-10-24	\N	\N	325
1288	2	8886467541117	1	Admin	2023-10-24	\N	\N	935
1289	2	8886467541124	1	Admin	2023-10-24	\N	\N	326
1290	2	8886467541131	1	Admin	2023-10-24	\N	\N	1156
1291	2	8886467541148	1	Admin	2023-10-24	\N	\N	327
1292	2	8886467544712	1	Admin	2023-10-24	\N	\N	328
1293	2	8886467545030	1	Admin	2023-10-24	\N	\N	329
1294	2	8886467545047	1	Admin	2023-10-24	\N	\N	330
1295	2	8886467545054	1	Admin	2023-10-24	\N	\N	331
1296	2	8886467545061	1	Admin	2023-10-24	\N	\N	332
1297	2	8886467545078	1	Admin	2023-10-24	\N	\N	333
1298	2	8886467545085	1	Admin	2023-10-24	\N	\N	334
1299	2	8886467545399	1	Admin	2023-10-24	\N	\N	335
1300	2	8886467545412	1	Admin	2023-10-24	\N	\N	1140
1301	2	8886467545467	1	Admin	2023-10-24	\N	\N	336
1302	2	8886467545542	1	Admin	2023-10-24	\N	\N	995
1303	2	8886467545702	1	Admin	2023-10-24	\N	\N	337
1304	2	8886467545719	1	Admin	2023-10-24	\N	\N	338
1305	2	8886467545726	1	Admin	2023-10-24	\N	\N	339
1306	2	8886467546013	1	Admin	2023-10-24	\N	\N	340
1307	2	8886467546037	1	Admin	2023-10-24	\N	\N	341
1308	2	8886467546044	1	Admin	2023-10-24	\N	\N	342
1309	2	8886467546198	1	Admin	2023-10-24	\N	\N	343
1310	2	8886467546211	1	Admin	2023-10-24	\N	\N	344
1311	2	8886467546327	1	Admin	2023-10-24	\N	\N	162
1312	2	8886467546334	1	Admin	2023-10-24	\N	\N	345
1313	2	8886467546341	1	Admin	2023-10-24	\N	\N	163
1314	2	8886467546617	1	Admin	2023-10-24	\N	\N	346
1315	2	8886467546648	1	Admin	2023-10-24	\N	\N	996
1316	2	8886467546655	1	Admin	2023-10-24	\N	\N	974
1317	2	8886467546662	1	Admin	2023-10-24	\N	\N	973
1318	2	8886467546969	1	Admin	2023-10-24	\N	\N	975
1319	2	8886467547546	1	Admin	2023-10-24	\N	\N	347
1320	2	8886467548512	1	Admin	2023-10-24	\N	\N	348
1321	2	8886467548536	1	Admin	2023-10-24	\N	\N	349
1322	2	8886467548710	1	Admin	2023-10-24	\N	\N	350
1323	2	8886467548772	1	Admin	2023-10-24	\N	\N	351
1324	2	8886467548789	1	Admin	2023-10-24	\N	\N	352
1325	2	8886467548796	1	Admin	2023-10-24	\N	\N	353
1326	2	8886467548826	1	Admin	2023-10-24	\N	\N	354
1327	2	8886467548840	1	Admin	2023-10-24	\N	\N	355
1328	2	8886467548864	1	Admin	2023-10-24	\N	\N	356
1329	2	8886467548888	1	Admin	2023-10-24	\N	\N	357
1330	2	8886467548925	1	Admin	2023-10-24	\N	\N	358
1331	2	8886467548932	1	Admin	2023-10-24	\N	\N	359
1332	2	8886467548949	1	Admin	2023-10-24	\N	\N	360
1333	2	8886467580000	1	Admin	2023-10-24	\N	\N	361
1334	2	8886467580017	1	Admin	2023-10-24	\N	\N	362
1335	2	8886467580024	1	Admin	2023-10-24	\N	\N	363
1336	2	8886467580062	1	Admin	2023-10-24	\N	\N	364
1337	2	8886467580079	1	Admin	2023-10-24	\N	\N	365
1338	2	8886467580086	1	Admin	2023-10-24	\N	\N	366
1339	2	8886467580093	1	Admin	2023-10-24	\N	\N	367
1340	2	8886467580109	1	Admin	2023-10-24	\N	\N	368
1341	2	8886467580116	1	Admin	2023-10-24	\N	\N	369
1342	2	8886467580147	1	Admin	2023-10-24	\N	\N	370
1343	2	8886467580161	1	Admin	2023-10-24	\N	\N	371
1344	2	8886467580178	1	Admin	2023-10-24	\N	\N	372
1345	2	8886467580185	1	Admin	2023-10-24	\N	\N	373
1346	2	8886467580208	1	Admin	2023-10-24	\N	\N	374
1347	2	8886467580215	1	Admin	2023-10-24	\N	\N	375
1348	2	8886467580222	1	Admin	2023-10-24	\N	\N	376
1349	2	8886467580413	1	Admin	2023-10-24	\N	\N	377
1350	2	8886467581465	1	Admin	2023-10-24	\N	\N	972
1351	2	8886467582059	1	Admin	2023-10-24	\N	\N	378
1352	2	8886467584954	1	Admin	2023-10-24	\N	\N	379
1353	2	8886467584961	1	Admin	2023-10-24	\N	\N	380
1354	2	8886467585814	0	Admin	2023-10-24	\N	\N	381
1355	2	8886467585913	0	Admin	2023-10-24	\N	\N	382
1356	2	8886467586347	1	Admin	2023-10-24	\N	\N	383
1357	2	8886467589010	1	Admin	2023-10-24	\N	\N	384
1358	2	8886467589317	2	Admin	2023-10-24	\N	\N	385
1359	2	8886467589478	1	Admin	2023-10-24	\N	\N	386
1360	2	8886467589485	1	Admin	2023-10-24	\N	\N	387
1361	2	8900950297173	1	Admin	2023-10-24	\N	\N	1304
1362	2	8900950297180	1	Admin	2023-10-24	\N	\N	1303
1363	2	8901138501242	1	Admin	2023-10-24	\N	\N	723
1364	2	8901138501297	1	Admin	2023-10-24	\N	\N	724
1365	2	8901138511333	1	Admin	2023-10-24	\N	\N	721
1366	2	8901138511340	1	Admin	2023-10-24	\N	\N	722
1367	2	90	0	Admin	2023-10-24	\N	\N	945
1368	2	9003579000519	12	Admin	2023-10-24	\N	\N	392
1369	2	9003579000748	1	Admin	2023-10-24	\N	\N	419
1370	2	9003579001172	12	Admin	2023-10-24	\N	\N	1083
1371	2	9003579013557	12	Admin	2023-10-24	\N	\N	1099
1372	2	9003579018514	12	Admin	2023-10-24	\N	\N	1097
1373	2	9003579018866	24	Admin	2023-10-24	\N	\N	1177
1374	2	9003579018941	24	Admin	2023-10-24	\N	\N	1176
1375	2	9003579307717	1	Admin	2023-10-24	\N	\N	423
1376	2	9003579308936	12	Admin	2023-10-24	\N	\N	1090
1377	2	9003579308943	1	Admin	2023-10-24	\N	\N	424
1378	2	9003579309445	1	Admin	2023-10-24	\N	\N	429
1379	2	9003579309469	1	Admin	2023-10-24	\N	\N	400
1380	2	9003579310632	1	Admin	2023-10-24	\N	\N	404
1381	2	9003579311004	1	Admin	2023-10-24	\N	\N	444
1382	2	9003579311462	1	Admin	2023-10-24	\N	\N	422
1383	2	9003579311851	1	Admin	2023-10-24	\N	\N	435
1384	2	91009	0	Admin	2023-10-24	\N	\N	1488
1385	2	91012	1	Admin	2023-10-24	\N	\N	1490
1386	2	91013	1	Admin	2023-10-24	\N	\N	1491
1387	2	91015	0	Admin	2023-10-24	\N	\N	1489
1388	2	911emergencia	0	Admin	2023-10-24	\N	\N	1343
1917	1	304	2	Admin	2023-10-24	\N	\N	1273
1389	2	9333527021861	1	Admin	2023-10-24	\N	\N	1481
1390	2	9333527230447	1	Admin	2023-10-24	\N	\N	1093
1391	2	9333527329240	1	Admin	2023-10-24	\N	\N	1085
1392	2	9333527329257	1	Admin	2023-10-24	\N	\N	1094
1393	2	9333527341037	1	Admin	2023-10-24	\N	\N	1107
1394	2	9333527377852	1	Admin	2023-10-24	\N	\N	1084
1395	2	9333527426642	1	Admin	2023-10-24	\N	\N	1092
1396	2	9333527443670	1	Admin	2023-10-24	\N	\N	1089
1397	2	9333527586469	1	Admin	2023-10-24	\N	\N	1095
1398	2	9505903	1	Admin	2023-10-24	\N	\N	1268
1399	2	9505904	1	Admin	2023-10-24	\N	\N	1266
1400	2	9505905	1	Admin	2023-10-24	\N	\N	1265
1401	2	99-26191	1	Admin	2023-10-24	\N	\N	1244
1402	2	A1014	1	Admin	2023-10-24	\N	\N	625
1403	2	AB01S	1	Admin	2023-10-24	\N	\N	1296
1404	2	AB02M	1	Admin	2023-10-24	\N	\N	1297
1405	2	AB03L	1	Admin	2023-10-24	\N	\N	1298
1406	2	AC01	0	Admin	2023-10-24	\N	\N	1192
1407	2	AC01S	1	Admin	2023-10-24	\N	\N	1320
1408	2	AC02M	1	Admin	2023-10-24	\N	\N	1230
1409	2	AF001S	1	Admin	2023-10-24	\N	\N	1603
1410	2	ALP001	1	Admin	2023-10-24	\N	\N	741
1411	2	AMOXITABS250	1	Admin	2023-10-24	\N	\N	1513
1412	2	ANXIVET	1	Admin	2023-10-24	\N	\N	1170
1413	2	ARTROVET	1	Admin	2023-10-24	\N	\N	1168
1414	2	Atropina01	1	Admin	2023-10-24	\N	\N	516
1415	2	AUMENTA	1	Admin	2023-10-24	\N	\N	1558
1416	2	BAEP00	1	Admin	2023-10-24	\N	\N	558
1417	2	BAN0	1	Admin	2023-10-24	\N	\N	559
1418	2	BC1050032021	0	Admin	2023-10-24	\N	\N	628
1419	2	BCTH2101C	1	Admin	2023-10-24	\N	\N	1606
1420	2	BHL001	1	Admin	2023-10-24	\N	\N	1421
1421	2	BHM001	0	Admin	2023-10-24	\N	\N	1422
1422	2	BHS001	1	Admin	2023-10-24	\N	\N	1423
1423	2	BHXS001	1	Admin	2023-10-24	\N	\N	1424
1424	2	BL01-S	1	Admin	2023-10-24	\N	\N	1346
1425	2	BL-02	1	Admin	2023-10-24	\N	\N	1182
1426	2	BL02-M	1	Admin	2023-10-24	\N	\N	1347
1427	2	BL03-L	1	Admin	2023-10-24	\N	\N	1348
1428	2	BL04-XL	1	Admin	2023-10-24	\N	\N	1349
1429	2	BOSAL#0	0	Admin	2023-10-24	\N	\N	1232
1430	2	BROADLINE	1	Admin	2023-10-24	\N	\N	777
1431	2	BVL001	1	Admin	2023-10-24	\N	\N	1425
1432	2	BVM001	1	Admin	2023-10-24	\N	\N	1426
1433	2	BVS001	1	Admin	2023-10-24	\N	\N	1427
1434	2	C20-M	1	Admin	2023-10-24	\N	\N	602
1435	2	C20-S	1	Admin	2023-10-24	\N	\N	601
1436	2	C20-XL	1	Admin	2023-10-24	\N	\N	603
1437	2	C21-L	1	Admin	2023-10-24	\N	\N	606
1438	2	C21-M	1	Admin	2023-10-24	\N	\N	605
1439	2	C21-S	1	Admin	2023-10-24	\N	\N	604
1440	2	C21-XL	1	Admin	2023-10-24	\N	\N	607
1441	2	C22-1	1	Admin	2023-10-24	\N	\N	1248
1442	2	C22-2	1	Admin	2023-10-24	\N	\N	1249
1443	2	C22-3	1	Admin	2023-10-24	\N	\N	1250
1444	2	CAM2030	1	Admin	2023-10-24	\N	\N	568
1445	2	CAM2435	1	Admin	2023-10-24	\N	\N	570
1446	2	CAM2840	1	Admin	2023-10-24	\N	\N	572
1447	2	cardiovet	2	Admin	2023-10-24	\N	\N	1171
1448	2	CARPRODYL100	3	Admin	2023-10-24	\N	\N	1515
1449	2	CARPRODYL25	3	Admin	2023-10-24	\N	\N	1506
1450	2	CD02M	1	Admin	2023-10-24	\N	\N	1308
1451	2	CD03L	1	Admin	2023-10-24	\N	\N	1309
1452	2	CefaCure	60	Admin	2023-10-24	\N	\N	659
1453	2	CIPROTABS250	1	Admin	2023-10-24	\N	\N	1507
1454	2	CORTA3807	1	Admin	2023-10-24	\N	\N	1227
1455	2	DE013-M	1	Admin	2023-10-24	\N	\N	595
1456	2	doramectina	1	Admin	2023-10-24	\N	\N	1174
1457	2	Dufamox15	1	Admin	2023-10-24	\N	\N	524
1458	2	FARM044	2	Admin	2023-10-24	\N	\N	1079
1459	2	FARM046	1	Admin	2023-10-24	\N	\N	1080
1460	2	FARM141	1	Admin	2023-10-24	\N	\N	1081
1461	2	FC088	1	Admin	2023-10-24	\N	\N	1197
1462	2	FG01-S	1	Admin	2023-10-24	\N	\N	1350
1463	2	FG02-M	1	Admin	2023-10-24	\N	\N	1351
1464	2	FG03-L	1	Admin	2023-10-24	\N	\N	1352
1465	2	FG04XL	1	Admin	2023-10-24	\N	\N	1353
1466	2	FGEZ1002	1	Admin	2023-10-24	\N	\N	1608
1467	2	G003	1	Admin	2023-10-24	\N	\N	1605
1468	2	G0M3101S	1	Admin	2023-10-24	\N	\N	1600
1469	2	G0M3102M	1	Admin	2023-10-24	\N	\N	1609
1470	2	gentamicina	1	Admin	2023-10-24	\N	\N	1175
1471	2	H2-S	1	Admin	2023-10-24	\N	\N	608
1472	2	H3-L	1	Admin	2023-10-24	\N	\N	611
1473	2	H3-M	1	Admin	2023-10-24	\N	\N	610
1474	2	H3-S	1	Admin	2023-10-24	\N	\N	609
1475	2	H3-XL	1	Admin	2023-10-24	\N	\N	612
1476	2	H4-L	1	Admin	2023-10-24	\N	\N	614
1477	2	H4-M	1	Admin	2023-10-24	\N	\N	613
1478	2	H4-XL	1	Admin	2023-10-24	\N	\N	615
1479	2	HEARTGARDL	1	Admin	2023-10-24	\N	\N	788
1480	2	HEARTGARDM	1	Admin	2023-10-24	\N	\N	787
1481	2	HEARTGARDS	1	Admin	2023-10-24	\N	\N	786
1482	2	HEMOVITB12	1	Admin	2023-10-24	\N	\N	729
1483	2	HEPATOVET	1	Admin	2023-10-24	\N	\N	1172
1484	2	HI01S	1	Admin	2023-10-24	\N	\N	1324
1485	2	HI02M	1	Admin	2023-10-24	\N	\N	1325
1486	2	HI03L	1	Admin	2023-10-24	\N	\N	1326
1487	2	HTB031-2	1	Admin	2023-10-24	\N	\N	586
1488	2	HTGC019	1	Admin	2023-10-24	\N	\N	557
1489	2	ij-02	1	Admin	2023-10-24	\N	\N	1181
1490	2	IJ03	1	Admin	2023-10-24	\N	\N	1241
1491	2	IP001ML	1	Admin	2023-10-24	\N	\N	546
1492	2	JD01	1	Admin	2023-10-24	\N	\N	1604
1493	2	JD02	1	Admin	2023-10-24	\N	\N	1597
1494	2	JHP951	1	Admin	2023-10-24	\N	\N	1277
1495	2	JK901L	1	Admin	2023-10-24	\N	\N	1369
1496	2	JK901M	1	Admin	2023-10-24	\N	\N	1370
1497	2	JK901S	1	Admin	2023-10-24	\N	\N	1371
1498	2	K002	1	Admin	2023-10-24	\N	\N	1235
1499	2	K9-L	1	Admin	2023-10-24	\N	\N	1240
1500	2	KD01	1	Admin	2023-10-24	\N	\N	1190
1501	2	KETOVET	600	Admin	2023-10-24	\N	\N	847
1502	2	KL01XS	1	Admin	2023-10-24	\N	\N	1310
1503	2	KL02S	1	Admin	2023-10-24	\N	\N	1311
1504	2	KL03M	1	Admin	2023-10-24	\N	\N	1312
1505	2	KL04L	1	Admin	2023-10-24	\N	\N	1313
1506	2	KL05XL	1	Admin	2023-10-24	\N	\N	1314
1507	2	KM0110MM	1	Admin	2023-10-24	\N	\N	1302
1508	2	KM0212MM	1	Admin	2023-10-24	\N	\N	1299
1509	2	KN0110MM	1	Admin	2023-10-24	\N	\N	1342
1510	2	KN0212MM	1	Admin	2023-10-24	\N	\N	1340
1511	2	KN0315MM	1	Admin	2023-10-24	\N	\N	1341
1512	2	KP01S	1	Admin	2023-10-24	\N	\N	1191
1513	2	KR01	1	Admin	2023-10-24	\N	\N	1195
1514	2	kS15MM	1	Admin	2023-10-24	\N	\N	1239
1515	2	KT01XXS	1	Admin	2023-10-24	\N	\N	1362
1516	2	KT02XS	1	Admin	2023-10-24	\N	\N	1363
1517	2	KT03S	1	Admin	2023-10-24	\N	\N	1323
1518	2	KU01XXS	1	Admin	2023-10-24	\N	\N	1338
1519	2	KU02XS	1	Admin	2023-10-24	\N	\N	1337
1520	2	KV01XXS	1	Admin	2023-10-24	\N	\N	1231
1521	2	KV03S	1	Admin	2023-10-24	\N	\N	1339
1522	2	KW01XXS	1	Admin	2023-10-24	\N	\N	1336
1523	2	KW02XS	1	Admin	2023-10-24	\N	\N	1333
1524	2	KW03S	1	Admin	2023-10-24	\N	\N	1334
1525	2	KW04M	1	Admin	2023-10-24	\N	\N	1335
1526	2	L1003	1	Admin	2023-10-24	\N	\N	598
1527	2	LM-01	1	Admin	2023-10-24	\N	\N	1185
1528	2	LM-02	1	Admin	2023-10-24	\N	\N	1186
1529	2	LM-03	1	Admin	2023-10-24	\N	\N	1187
1530	2	LM-902-L	1	Admin	2023-10-24	\N	\N	1366
1531	2	LM902M	1	Admin	2023-10-24	\N	\N	1367
1532	2	LM902S	1	Admin	2023-10-24	\N	\N	1368
1533	2	M610	1	Admin	2023-10-24	\N	\N	597
1534	2	M9D228135	1	Admin	2023-10-24	\N	\N	1114
1535	2	M9D22826	1	Admin	2023-10-24	\N	\N	1113
1536	2	M9D22838-L	1	Admin	2023-10-24	\N	\N	1110
1537	2	M9D22838-M	1	Admin	2023-10-24	\N	\N	1109
1538	2	M9D22838-S	0	Admin	2023-10-24	\N	\N	1108
1539	2	M9D22838-XL	1	Admin	2023-10-24	\N	\N	1111
1540	2	M9D22868	1	Admin	2023-10-24	\N	\N	1112
1541	2	Metronidazole	0	Admin	2023-10-24	\N	\N	861
1542	2	MN03	1	Admin	2023-10-24	\N	\N	1193
1543	2	MN05-XL	0	Admin	2023-10-24	\N	\N	1225
1544	2	MP1831	1	Admin	2023-10-24	\N	\N	1486
1545	2	MP1855	1	Admin	2023-10-24	\N	\N	1487
1546	2	MU01	0	Admin	2023-10-24	\N	\N	1229
1547	2	MU01S	1	Admin	2023-10-24	\N	\N	1364
1548	2	MU02	1	Admin	2023-10-24	\N	\N	1228
1549	2	MU02M	1	Admin	2023-10-24	\N	\N	1365
1550	2	N026I21	1	Admin	2023-10-24	\N	\N	1433
1551	2	NO02-S	1	Admin	2023-10-24	\N	\N	1359
1552	2	NO03-M	1	Admin	2023-10-24	\N	\N	1360
1553	2	NO04-L	1	Admin	2023-10-24	\N	\N	1361
1554	2	no05xl	1	Admin	2023-10-24	\N	\N	1287
1555	2	OMPASTA-01	1	Admin	2023-10-24	\N	\N	504
1556	2	OP01S	1	Admin	2023-10-24	\N	\N	1331
1557	2	OP02M	1	Admin	2023-10-24	\N	\N	1332
1558	2	OPTIVET	1	Admin	2023-10-24	\N	\N	1169
1559	2	OV115	1	Admin	2023-10-24	\N	\N	542
1560	2	P002L	1	Admin	2023-10-24	\N	\N	1636
1561	2	P1089	1	Admin	2023-10-24	\N	\N	1373
1562	2	P1118-PP-B7	1	Admin	2023-10-24	\N	\N	1196
1563	2	P518	1	Admin	2023-10-24	\N	\N	575
1564	2	P518-1	1	Admin	2023-10-24	\N	\N	574
1565	2	P519	1	Admin	2023-10-24	\N	\N	576
1566	2	P520	1	Admin	2023-10-24	\N	\N	577
1567	2	P521	1	Admin	2023-10-24	\N	\N	578
1568	2	P522	1	Admin	2023-10-24	\N	\N	579
1569	2	P523	0	Admin	2023-10-24	\N	\N	580
1570	2	P924	1	Admin	2023-10-24	\N	\N	554
1571	2	P935	1	Admin	2023-10-24	\N	\N	551
1572	2	PALETAS	1	Admin	2023-10-24	\N	\N	1640
1573	2	PEC001	1	Admin	2023-10-24	\N	\N	742
1574	2	PECH273	1	Admin	2023-10-24	\N	\N	1595
1575	2	PH2088	1	Admin	2023-10-24	\N	\N	1431
1576	2	PL01	1	Admin	2023-10-24	\N	\N	1601
1577	2	QR01	1	Admin	2023-10-24	\N	\N	1194
1578	2	QR01XS	1	Admin	2023-10-24	\N	\N	1321
1579	2	QR02	1	Admin	2023-10-24	\N	\N	1238
1580	2	QR02S	1	Admin	2023-10-24	\N	\N	1322
1581	2	quino-01	1	Admin	2023-10-24	\N	\N	456
1582	2	RANITIDINVET	1140	Admin	2023-10-24	\N	\N	849
1583	2	RAR2002	1	Admin	2023-10-24	\N	\N	1607
1584	2	RS02	1	Admin	2023-10-24	\N	\N	1243
1585	2	RS02S	1	Admin	2023-10-24	\N	\N	1329
1586	2	RS03L	1	Admin	2023-10-24	\N	\N	1330
1587	2	RS03-L	1	Admin	2023-10-24	\N	\N	1226
1588	2	ST0101	0	Admin	2023-10-24	\N	\N	862
1589	2	ST01XS	1	Admin	2023-10-24	\N	\N	1315
1590	2	ST02S	1	Admin	2023-10-24	\N	\N	1316
1591	2	ST03M	1	Admin	2023-10-24	\N	\N	1317
1592	2	ST04L	1	Admin	2023-10-24	\N	\N	1318
1593	2	ST05XL	1	Admin	2023-10-24	\N	\N	1319
1594	2	stickerzone01	1	Admin	2023-10-24	\N	\N	860
1595	2	STOMORGYL10	200	Admin	2023-10-24	\N	\N	789
1596	2	SU01	1	Admin	2023-10-24	\N	\N	1233
1597	2	SU02	1	Admin	2023-10-24	\N	\N	1189
1598	2	sy-b024	1	Admin	2023-10-24	\N	\N	1384
1599	2	TORT001	1	Admin	2023-10-24	\N	\N	743
1600	2	TU01	1	Admin	2023-10-24	\N	\N	1188
1601	2	TU02	1	Admin	2023-10-24	\N	\N	1236
1602	2	TU03	1	Admin	2023-10-24	\N	\N	1237
1603	2	TU04	1	Admin	2023-10-24	\N	\N	1234
1604	2	UNGÜENTO	0	Admin	2023-10-24	\N	\N	1548
1605	2	URIVET	1	Admin	2023-10-24	\N	\N	1167
1606	2	UT01XS	1	Admin	2023-10-24	\N	\N	1328
1607	2	UT02S	1	Admin	2023-10-24	\N	\N	1327
1608	2	UT03M	1	Admin	2023-10-24	\N	\N	1289
1609	2	UT04L	1	Admin	2023-10-24	\N	\N	1290
1610	2	UT05XL	1	Admin	2023-10-24	\N	\N	1291
1611	2	UV01S	1	Admin	2023-10-24	\N	\N	1305
1612	2	UV02M	1	Admin	2023-10-24	\N	\N	1306
1613	2	UV03L	1	Admin	2023-10-24	\N	\N	1307
1614	2	UY0110MM	1	Admin	2023-10-24	\N	\N	1300
1615	2	UY0212MM	1	Admin	2023-10-24	\N	\N	1301
1616	2	VDECA0008	0	Admin	2023-10-24	\N	\N	900
1617	2	VDECA0009	0	Admin	2023-10-24	\N	\N	901
1618	2	VDECA007	1	Admin	2023-10-24	\N	\N	899
1619	2	VDEFE0001	0	Admin	2023-10-24	\N	\N	898
1620	2	VE2022115917	1	Admin	2023-10-24	\N	\N	1625
1621	2	VHL001	1	Admin	2023-10-24	\N	\N	1416
1622	2	VHM001	1	Admin	2023-10-24	\N	\N	1415
1623	2	VHS001	1	Admin	2023-10-24	\N	\N	1417
1624	2	VHTL001	1	Admin	2023-10-24	\N	\N	1418
1625	2	VHTM001	1	Admin	2023-10-24	\N	\N	1420
1626	2	VHTS001	1	Admin	2023-10-24	\N	\N	1419
1627	2	VT-01	1	Admin	2023-10-24	\N	\N	1184
1628	2	VT-02	1	Admin	2023-10-24	\N	\N	1183
1629	2	VVL001	1	Admin	2023-10-24	\N	\N	1412
1630	2	VVM001	1	Admin	2023-10-24	\N	\N	1413
1631	2	VVS001	1	Admin	2023-10-24	\N	\N	1414
1632	2	W4UNID	1	Admin	2023-10-24	\N	\N	627
1633	2	WV04L	1	Admin	2023-10-24	\N	\N	1288
1634	2	X001	1	Admin	2023-10-24	\N	\N	731
1635	2	X002	1	Admin	2023-10-24	\N	\N	730
1636	2	XW01S	1	Admin	2023-10-24	\N	\N	1292
1637	2	XW02M	1	Admin	2023-10-24	\N	\N	1293
1638	2	XW03L	1	Admin	2023-10-24	\N	\N	1294
1639	2	XW04XL	1	Admin	2023-10-24	\N	\N	1295
1640	2	ZY01S	1	Admin	2023-10-24	\N	\N	1355
1641	2	ZY02M	1	Admin	2023-10-24	\N	\N	1356
1642	2	ZY02-M	1	Admin	2023-10-24	\N	\N	1242
1643	2	ZY03L	1	Admin	2023-10-24	\N	\N	1357
1644	2	ZY04XL	1	Admin	2023-10-24	\N	\N	1358
1646	1	01	0	Admin	2023-10-24	\N	\N	552
1647	1	017800142731	1	Admin	2023-10-24	\N	\N	1575
1648	1	017800156424	1	Admin	2023-10-24	\N	\N	1577
1649	1	017800156448	1	Admin	2023-10-24	\N	\N	1576
1650	1	017800165426	3	Admin	2023-10-24	\N	\N	1386
1651	1	017800174152	3	Admin	2023-10-24	\N	\N	496
1652	1	017800174220	2	Admin	2023-10-24	\N	\N	495
1653	1	017800176262	2	Admin	2023-10-24	\N	\N	494
1654	1	018065055583	1	Admin	2023-10-24	\N	\N	746
1655	1	018065057655	1	Admin	2023-10-24	\N	\N	744
1656	1	018065057686	2	Admin	2023-10-24	\N	\N	745
1657	1	018065057792	1	Admin	2023-10-24	\N	\N	747
1658	1	018214812784	0	Admin	2023-10-24	\N	\N	718
1659	1	018214812791	0	Admin	2023-10-24	\N	\N	720
1660	1	018214816218	0	Admin	2023-10-24	\N	\N	904
1661	1	018214846307	0	Admin	2023-10-24	\N	\N	719
1662	1	020279991335	1	Admin	2023-10-24	\N	\N	1578
1663	1	020279992998	0	Admin	2023-10-24	\N	\N	882
1664	1	020279995173	0	Admin	2023-10-24	\N	\N	1078
1665	1	020279995227	1	Admin	2023-10-24	\N	\N	1077
1666	1	020531	0	Admin	2023-10-24	\N	\N	1451
1667	1	030172013829	0	Admin	2023-10-24	\N	\N	1518
1668	1	030172013850	0	Admin	2023-10-24	\N	\N	1130
1669	1	034846730012	1	Admin	2023-10-24	\N	\N	680
1670	1	034846730029	1	Admin	2023-10-24	\N	\N	679
1671	1	034846730104	2	Admin	2023-10-24	\N	\N	683
1672	1	034846730111	2	Admin	2023-10-24	\N	\N	684
1673	1	034846730227	2	Admin	2023-10-24	\N	\N	685
1674	1	034846730319	2	Admin	2023-10-24	\N	\N	682
1675	1	034846730326	1	Admin	2023-10-24	\N	\N	681
1676	1	034846730401	0	Admin	2023-10-24	\N	\N	677
1677	1	034846730418	1	Admin	2023-10-24	\N	\N	1449
1678	1	034846730500	0	Admin	2023-10-24	\N	\N	674
1679	1	034846730517	0	Admin	2023-10-24	\N	\N	675
1680	1	034846730609	3	Admin	2023-10-24	\N	\N	676
1681	1	034846730708	0	Admin	2023-10-24	\N	\N	688
1682	1	034846730715	1	Admin	2023-10-24	\N	\N	689
1683	1	034846730814	1	Admin	2023-10-24	\N	\N	687
1684	1	034846730821	1	Admin	2023-10-24	\N	\N	686
1685	1	034846730937	1	Admin	2023-10-24	\N	\N	678
1686	1	035585034003	0	Admin	2023-10-24	\N	\N	859
1687	1	035585111117	0	Admin	2023-10-24	\N	\N	858
1688	1	035585111216	0	Admin	2023-10-24	\N	\N	857
1689	1	035585111315	0	Admin	2023-10-24	\N	\N	856
1690	1	038100001306	4	Admin	2023-10-24	\N	\N	1388
1691	1	038100171207	5	Admin	2023-10-24	\N	\N	1387
1692	1	045663970062	0	Admin	2023-10-24	\N	\N	748
1693	1	045663970079	0	Admin	2023-10-24	\N	\N	714
1694	1	045663970086	0	Admin	2023-10-24	\N	\N	713
1695	1	045663970093	0	Admin	2023-10-24	\N	\N	749
1696	1	045663970109	0	Admin	2023-10-24	\N	\N	712
1697	1	045663976170	0	Admin	2023-10-24	\N	\N	1642
1698	1	045663976194	0	Admin	2023-10-24	\N	\N	1641
1699	1	052742001135	1	Admin	2023-10-24	\N	\N	881
1700	1	052742001197	1	Admin	2023-10-24	\N	\N	1470
1701	1	052742001746	3	Admin	2023-10-24	\N	\N	12
1702	1	052742005188	4	Admin	2023-10-24	\N	\N	1198
1703	1	052742005355	4	Admin	2023-10-24	\N	\N	964
1704	1	052742009971	2	Admin	2023-10-24	\N	\N	961
1705	1	052742012032	0	Admin	2023-10-24	\N	\N	1408
1706	1	052742014296	2	Admin	2023-10-24	\N	\N	878
1707	1	052742014531	0	Admin	2023-10-24	\N	\N	962
1708	1	052742014555	1	Admin	2023-10-24	\N	\N	960
1709	1	052742020419	1	Admin	2023-10-24	\N	\N	1468
1710	1	052742020488	0	Admin	2023-10-24	\N	\N	1503
1711	1	052742024530	0	Admin	2023-10-24	\N	\N	879
1712	1	052742040141	0	Admin	2023-10-24	\N	\N	1407
1713	1	052742187501	2	Admin	2023-10-24	\N	\N	959
1714	1	052742187907	7	Admin	2023-10-24	\N	\N	6
1715	1	052742195704	0	Admin	2023-10-24	\N	\N	5
1716	1	052742297200	0	Admin	2023-10-24	\N	\N	1411
1717	1	052742335902	2	Admin	2023-10-24	\N	\N	963
1718	1	052742339009	7	Admin	2023-10-24	\N	\N	874
1719	1	052742453606	1	Admin	2023-10-24	\N	\N	1522
1720	1	052742462806	14	Admin	2023-10-24	\N	\N	875
1721	1	052742567006	36	Admin	2023-10-24	\N	\N	873
1722	1	052742623801	4	Admin	2023-10-24	\N	\N	876
1723	1	052742624709	2	Admin	2023-10-24	\N	\N	880
1724	1	052742648606	2	Admin	2023-10-24	\N	\N	1402
1725	1	052742679709	1	Admin	2023-10-24	\N	\N	9
1726	1	052742700106	1	Admin	2023-10-24	\N	\N	1469
1727	1	052742700809	20	Admin	2023-10-24	\N	\N	18
1728	1	052742701004	0	Admin	2023-10-24	\N	\N	1
1729	1	052742701103	0	Admin	2023-10-24	\N	\N	2
1730	1	052742701608	3	Admin	2023-10-24	\N	\N	877
1731	1	052742701806	0	Admin	2023-10-24	\N	\N	4
1732	1	052742703602	3	Admin	2023-10-24	\N	\N	15
1733	1	052742703701	0	Admin	2023-10-24	\N	\N	16
1734	1	052742705507	0	Admin	2023-10-24	\N	\N	17
1735	1	052742710402	0	Admin	2023-10-24	\N	\N	10
1736	1	052742712307	1	Admin	2023-10-24	\N	\N	957
1737	1	052742713304	1	Admin	2023-10-24	\N	\N	1405
1738	1	052742713908	3	Admin	2023-10-24	\N	\N	7
1739	1	052742715605	3	Admin	2023-10-24	\N	\N	958
1740	1	052742790107	1	Admin	2023-10-24	\N	\N	14
1741	1	052742818306	0	Admin	2023-10-24	\N	\N	8
1742	1	052742855509	2	Admin	2023-10-24	\N	\N	1401
1743	1	052742861807	2	Admin	2023-10-24	\N	\N	11
1744	1	052742862101	0	Admin	2023-10-24	\N	\N	1471
1745	1	052742862309	1	Admin	2023-10-24	\N	\N	1613
1746	1	052742862408	3	Admin	2023-10-24	\N	\N	13
1747	1	052742867106	3	Admin	2023-10-24	\N	\N	3
1748	1	052742867601	0	Admin	2023-10-24	\N	\N	1596
1749	1	052742909400	1	Admin	2023-10-24	\N	\N	1404
1750	1	052742909608	1	Admin	2023-10-24	\N	\N	1406
1751	1	052742909806	0	Admin	2023-10-24	\N	\N	1409
1752	1	052742910000	0	Admin	2023-10-24	\N	\N	1410
1753	1	052742930107	0	Admin	2023-10-24	\N	\N	1403
1754	1	052742936802	1	Admin	2023-10-24	\N	\N	1591
1755	1	070230107107	0	Admin	2023-10-24	\N	\N	1494
1756	1	070230117168	0	Admin	2023-10-24	\N	\N	1495
1757	1	073893212546	0	Admin	2023-10-24	\N	\N	842
1758	1	073893212553	0	Admin	2023-10-24	\N	\N	1476
1759	1	073893223009	0	Admin	2023-10-24	\N	\N	835
1760	1	073893260035	0	Admin	2023-10-24	\N	\N	841
1761	1	073893260042	1	Admin	2023-10-24	\N	\N	1383
1762	1	073893260066	1	Admin	2023-10-24	\N	\N	840
1763	1	073893263036	0	Admin	2023-10-24	\N	\N	838
1764	1	073893264026	1	Admin	2023-10-24	\N	\N	837
1765	1	073893265030	2	Admin	2023-10-24	\N	\N	839
1766	1	073893280002	0	Admin	2023-10-24	\N	\N	836
1767	1	074198612239	1	Admin	2023-10-24	\N	\N	1463
1768	1	074198612277	1	Admin	2023-10-24	\N	\N	1070
1769	1	074198612314	1	Admin	2023-10-24	\N	\N	1464
1770	1	074198612345	1	Admin	2023-10-24	\N	\N	1073
1771	1	074198612383	2	Admin	2023-10-24	\N	\N	1462
1772	1	074198612413	1	Admin	2023-10-24	\N	\N	1071
1773	1	074198612451	2	Admin	2023-10-24	\N	\N	1465
1774	1	074198612499	5	Admin	2023-10-24	\N	\N	1074
1775	1	074198613311	2	Admin	2023-10-24	\N	\N	1072
1776	1	074198613359	2	Admin	2023-10-24	\N	\N	1436
1777	1	074198614233	0	Admin	2023-10-24	\N	\N	1467
1778	1	074198614240	1	Admin	2023-10-24	\N	\N	1435
1779	1	074198614257	0	Admin	2023-10-24	\N	\N	1466
1780	1	074198614264	3	Admin	2023-10-24	\N	\N	1434
1781	1	074198615117	1	Admin	2023-10-24	\N	\N	1581
1782	1	074198615131	1	Admin	2023-10-24	\N	\N	1580
1783	1	074198615179	1	Admin	2023-10-24	\N	\N	1624
1784	1	074198615261	1	Admin	2023-10-24	\N	\N	1586
1785	1	074198615308	1	Admin	2023-10-24	\N	\N	1587
1786	1	074198615391	1	Admin	2023-10-24	\N	\N	1637
1787	1	074198615476	1	Admin	2023-10-24	\N	\N	1582
1788	1	074198615513	1	Admin	2023-10-24	\N	\N	1583
1789	1	07419861561	0	Admin	2023-10-24	\N	\N	1585
1790	1	074198615612	1	Admin	2023-10-24	\N	\N	1588
1791	1	074198615636	1	Admin	2023-10-24	\N	\N	1584
1792	1	077627101182	12	Admin	2023-10-24	\N	\N	700
1793	1	077627101229	8	Admin	2023-10-24	\N	\N	701
1794	1	077627101274	11	Admin	2023-10-24	\N	\N	702
1795	1	077627101342	14	Admin	2023-10-24	\N	\N	703
1796	1	077627200991	3	Admin	2023-10-24	\N	\N	707
1797	1	077627201028	1	Admin	2023-10-24	\N	\N	704
1798	1	077627201066	1	Admin	2023-10-24	\N	\N	705
1799	1	077627201349	5	Admin	2023-10-24	\N	\N	706
1800	1	077627201356	3	Admin	2023-10-24	\N	\N	708
1801	1	077627302015	2	Admin	2023-10-24	\N	\N	709
1802	1	08003330160	1	Admin	2023-10-24	\N	\N	1579
1803	1	087219111529	1	Admin	2023-10-24	\N	\N	463
1804	1	087219113776	6	Admin	2023-10-24	\N	\N	507
1805	1	087219116012	1	Admin	2023-10-24	\N	\N	509
1806	1	087219117439	0	Admin	2023-10-24	\N	\N	508
1807	1	087219120873	4	Admin	2023-10-24	\N	\N	510
1808	1	1	0	Admin	2023-10-24	\N	\N	436
1809	1	10	40	Admin	2023-10-24	\N	\N	803
1810	1	100	0	Admin	2023-10-24	\N	\N	802
1811	1	101	1	Admin	2023-10-24	\N	\N	843
1812	1	102	0	Admin	2023-10-24	\N	\N	844
1813	1	103	27	Admin	2023-10-24	\N	\N	845
1814	1	104	4	Admin	2023-10-24	\N	\N	848
1815	1	105	38	Admin	2023-10-24	\N	\N	934
1816	1	106	0	Admin	2023-10-24	\N	\N	954
1817	1	107	0	Admin	2023-10-24	\N	\N	955
1818	1	108	2	Admin	2023-10-24	\N	\N	956
1819	1	109	0	Admin	2023-10-24	\N	\N	1017
1820	1	11	0	Admin	2023-10-24	\N	\N	1251
1821	1	110	1	Admin	2023-10-24	\N	\N	1018
1822	1	111	0	Admin	2023-10-24	\N	\N	1019
1823	1	112	0	Admin	2023-10-24	\N	\N	1020
1824	1	113	0	Admin	2023-10-24	\N	\N	1021
1825	1	114	0	Admin	2023-10-24	\N	\N	1022
1826	1	115	0	Admin	2023-10-24	\N	\N	1023
1827	1	116	0	Admin	2023-10-24	\N	\N	1024
1828	1	117	0	Admin	2023-10-24	\N	\N	1025
1829	1	118	7	Admin	2023-10-24	\N	\N	1026
1830	1	119	0	Admin	2023-10-24	\N	\N	1027
1831	1	120	0	Admin	2023-10-24	\N	\N	1028
1832	1	121	0	Admin	2023-10-24	\N	\N	1029
1833	1	122	0	Admin	2023-10-24	\N	\N	1030
1834	1	123	4	Admin	2023-10-24	\N	\N	1031
1835	1	1234567890128	0	Admin	2023-10-24	\N	\N	1096
1836	1	124	4	Admin	2023-10-24	\N	\N	1032
1837	1	125	0	Admin	2023-10-24	\N	\N	1033
1838	1	126	0	Admin	2023-10-24	\N	\N	1034
1839	1	127	0	Admin	2023-10-24	\N	\N	1035
1840	1	128	0	Admin	2023-10-24	\N	\N	1036
1841	1	129	2	Admin	2023-10-24	\N	\N	1037
1842	1	130	0	Admin	2023-10-24	\N	\N	1038
1843	1	131	0	Admin	2023-10-24	\N	\N	1039
1844	1	132	3	Admin	2023-10-24	\N	\N	1040
1845	1	133	0	Admin	2023-10-24	\N	\N	1041
1846	1	134	6	Admin	2023-10-24	\N	\N	1042
1847	1	135	0	Admin	2023-10-24	\N	\N	1043
1848	1	136	0	Admin	2023-10-24	\N	\N	1044
1849	1	137	0	Admin	2023-10-24	\N	\N	1045
1850	1	138	0	Admin	2023-10-24	\N	\N	1046
1851	1	139	0	Admin	2023-10-24	\N	\N	1047
1852	1	140	0	Admin	2023-10-24	\N	\N	1048
1853	1	141	0	Admin	2023-10-24	\N	\N	1049
1854	1	142	0	Admin	2023-10-24	\N	\N	1050
1855	1	1421	0	Admin	2023-10-24	\N	\N	1276
1856	1	143	0	Admin	2023-10-24	\N	\N	1051
1857	1	144	0	Admin	2023-10-24	\N	\N	1052
1858	1	145	0	Admin	2023-10-24	\N	\N	1053
1859	1	146	0	Admin	2023-10-24	\N	\N	1054
1860	1	147	0	Admin	2023-10-24	\N	\N	1055
1861	1	148	0	Admin	2023-10-24	\N	\N	1056
1862	1	149	0	Admin	2023-10-24	\N	\N	1057
1863	1	150	0	Admin	2023-10-24	\N	\N	1058
1864	1	151	0	Admin	2023-10-24	\N	\N	1059
1865	1	152	0	Admin	2023-10-24	\N	\N	1060
1866	1	153	0	Admin	2023-10-24	\N	\N	1061
1867	1	154	0	Admin	2023-10-24	\N	\N	1062
1868	1	155	0	Admin	2023-10-24	\N	\N	1063
1869	1	156	0	Admin	2023-10-24	\N	\N	1064
1870	1	157	0	Admin	2023-10-24	\N	\N	1065
1871	1	158	0	Admin	2023-10-24	\N	\N	1066
1872	1	159	0	Admin	2023-10-24	\N	\N	1067
1873	1	160	0	Admin	2023-10-24	\N	\N	1068
1874	1	161	0	Admin	2023-10-24	\N	\N	1069
1875	1	16182	2	Admin	2023-10-24	\N	\N	1430
1876	1	162	1	Admin	2023-10-24	\N	\N	1246
1877	1	163	0	Admin	2023-10-24	\N	\N	1270
1878	1	164	1	Admin	2023-10-24	\N	\N	1271
1879	1	166	0	Admin	2023-10-24	\N	\N	1443
1880	1	167	0	Admin	2023-10-24	\N	\N	1485
1881	1	170	0	Admin	2023-10-24	\N	\N	1437
1882	1	178988989	0	Admin	2023-10-24	\N	\N	1259
1883	1	181	0	Admin	2023-10-24	\N	\N	1559
1884	1	182	1	Admin	2023-10-24	\N	\N	1560
1885	1	18214816218	0	Admin	2023-10-24	\N	\N	160
1886	1	183	0	Admin	2023-10-24	\N	\N	1561
1887	1	184	0	Admin	2023-10-24	\N	\N	1562
1888	1	185	0	Admin	2023-10-24	\N	\N	1563
1889	1	186	0	Admin	2023-10-24	\N	\N	1564
1890	1	187	0	Admin	2023-10-24	\N	\N	1565
1891	1	188	0	Admin	2023-10-24	\N	\N	1566
1892	1	189	0	Admin	2023-10-24	\N	\N	1567
1893	1	190	0	Admin	2023-10-24	\N	\N	1568
1894	1	191	0	Admin	2023-10-24	\N	\N	1569
1895	1	192	0	Admin	2023-10-24	\N	\N	1570
1896	1	194	0	Admin	2023-10-24	\N	\N	1571
1897	1	195	0	Admin	2023-10-24	\N	\N	1572
1898	1	196	0	Admin	2023-10-24	\N	\N	1573
1899	1	20	102	Admin	2023-10-24	\N	\N	804
1900	1	200	0	Admin	2023-10-24	\N	\N	936
1901	1	2009073936	1	Admin	2023-10-24	\N	\N	1263
1902	1	208400	1	Admin	2023-10-24	\N	\N	416
1903	1	21	22	Admin	2023-10-24	\N	\N	805
1904	1	22	27	Admin	2023-10-24	\N	\N	806
1905	1	22095	0	Admin	2023-10-24	\N	\N	1551
1906	1	22108	0	Admin	2023-10-24	\N	\N	1550
1907	1	22109	0	Admin	2023-10-24	\N	\N	1549
1908	1	23	1	Admin	2023-10-24	\N	\N	807
1909	1	25026	8	Admin	2023-10-24	\N	\N	470
1910	1	25027	21	Admin	2023-10-24	\N	\N	471
1911	1	27003	10	Admin	2023-10-24	\N	\N	472
1912	1	30	14	Admin	2023-10-24	\N	\N	808
1913	1	300	4	Admin	2023-10-24	\N	\N	1100
1914	1	301	0	Admin	2023-10-24	\N	\N	1101
1915	1	302	2	Admin	2023-10-24	\N	\N	1102
1916	1	303	0	Admin	2023-10-24	\N	\N	1272
1918	1	305	0	Admin	2023-10-24	\N	\N	1344
1919	1	306	6	Admin	2023-10-24	\N	\N	1345
1920	1	307	1	Admin	2023-10-24	\N	\N	1376
1921	1	308	0	Admin	2023-10-24	\N	\N	1377
1922	1	309	0	Admin	2023-10-24	\N	\N	1399
1923	1	31	0	Admin	2023-10-24	\N	\N	809
1924	1	310	0	Admin	2023-10-24	\N	\N	1429
1925	1	311	1	Admin	2023-10-24	\N	\N	1447
1926	1	312	0	Admin	2023-10-24	\N	\N	1448
1927	1	313	0	Admin	2023-10-24	\N	\N	1454
1928	1	314	0	Admin	2023-10-24	\N	\N	1457
1929	1	315	1	Admin	2023-10-24	\N	\N	1459
1930	1	316	0	Admin	2023-10-24	\N	\N	1482
1931	1	317	0	Admin	2023-10-24	\N	\N	1483
1932	1	318	0	Admin	2023-10-24	\N	\N	1484
1933	1	3182550402132	0	Admin	2023-10-24	\N	\N	410
1934	1	3182550402149	0	Admin	2023-10-24	\N	\N	401
1935	1	3182550402170	2	Admin	2023-10-24	\N	\N	445
1936	1	3182550402224	0	Admin	2023-10-24	\N	\N	413
1937	1	3182550402439	0	Admin	2023-10-24	\N	\N	408
1938	1	3182550702201	1	Admin	2023-10-24	\N	\N	420
1939	1	3182550702225	0	Admin	2023-10-24	\N	\N	421
1940	1	3182550702423	3	Admin	2023-10-24	\N	\N	425
1941	1	3182550702447	0	Admin	2023-10-24	\N	\N	426
1942	1	3182550702614	0	Admin	2023-10-24	\N	\N	1088
1943	1	3182550708180	1	Admin	2023-10-24	\N	\N	409
1944	1	3182550708197	0	Admin	2023-10-24	\N	\N	411
1945	1	3182550708203	0	Admin	2023-10-24	\N	\N	412
1946	1	3182550710923	1	Admin	2023-10-24	\N	\N	394
1947	1	3182550710992	1	Admin	2023-10-24	\N	\N	417
1948	1	3182550711036	0	Admin	2023-10-24	\N	\N	414
1949	1	3182550711050	0	Admin	2023-10-24	\N	\N	433
1950	1	3182550711142	0	Admin	2023-10-24	\N	\N	393
1951	1	3182550711159	0	Admin	2023-10-24	\N	\N	434
1952	1	3182550711333	0	Admin	2023-10-24	\N	\N	395
1953	1	3182550711395	0	Admin	2023-10-24	\N	\N	418
1954	1	3182550716857	0	Admin	2023-10-24	\N	\N	449
1955	1	3182550716888	0	Admin	2023-10-24	\N	\N	448
1956	1	3182550716925	0	Admin	2023-10-24	\N	\N	451
1957	1	3182550717687	0	Admin	2023-10-24	\N	\N	415
1958	1	3182550718813	1	Admin	2023-10-24	\N	\N	1598
1959	1	3182550727822	0	Admin	2023-10-24	\N	\N	447
1960	1	3182550728102	1	Admin	2023-10-24	\N	\N	1639
1961	1	3182550730587	0	Admin	2023-10-24	\N	\N	432
1962	1	3182550731355	1	Admin	2023-10-24	\N	\N	390
1963	1	3182550732055	1	Admin	2023-10-24	\N	\N	402
1964	1	3182550732154	1	Admin	2023-10-24	\N	\N	1615
1965	1	3182550743433	0	Admin	2023-10-24	\N	\N	431
1966	1	3182550743440	0	Admin	2023-10-24	\N	\N	1632
1967	1	3182550768474	0	Admin	2023-10-24	\N	\N	1091
1968	1	3182550771054	0	Admin	2023-10-24	\N	\N	396
1969	1	3182550771061	0	Admin	2023-10-24	\N	\N	397
1970	1	3182550771719	1	Admin	2023-10-24	\N	\N	398
1971	1	3182550771733	1	Admin	2023-10-24	\N	\N	399
1972	1	3182550775267	0	Admin	2023-10-24	\N	\N	446
1973	1	3182550778657	0	Admin	2023-10-24	\N	\N	430
1974	1	3182550778671	1	Admin	2023-10-24	\N	\N	403
1975	1	3182550793001	2	Admin	2023-10-24	\N	\N	405
1976	1	3182550793032	0	Admin	2023-10-24	\N	\N	406
1977	1	3182550793049	0	Admin	2023-10-24	\N	\N	407
1978	1	3182550798945	0	Admin	2023-10-24	\N	\N	452
1979	1	3182550799768	1	Admin	2023-10-24	\N	\N	450
1980	1	3182550831086	0	Admin	2023-10-24	\N	\N	391
1981	1	3182550831383	0	Admin	2023-10-24	\N	\N	428
1982	1	3182550831390	0	Admin	2023-10-24	\N	\N	427
1983	1	319	1	Admin	2023-10-24	\N	\N	1497
1984	1	32	4	Admin	2023-10-24	\N	\N	810
1985	1	320	0	Admin	2023-10-24	\N	\N	1498
1986	1	321	6	Admin	2023-10-24	\N	\N	1499
1987	1	322	0	Admin	2023-10-24	\N	\N	1501
1988	1	323	0	Admin	2023-10-24	\N	\N	1502
1989	1	33	0	Admin	2023-10-24	\N	\N	811
1990	1	33015	0	Admin	2023-10-24	\N	\N	473
1991	1	33016	0	Admin	2023-10-24	\N	\N	461
1992	1	33059	0	Admin	2023-10-24	\N	\N	462
1993	1	3411112261956	0	Admin	2023-10-24	\N	\N	797
1994	1	350	0	Admin	2023-10-24	\N	\N	1452
1995	1	3552793078300	0	Admin	2023-10-24	\N	\N	548
1996	1	3552793078324	0	Admin	2023-10-24	\N	\N	547
1997	1	40	6	Admin	2023-10-24	\N	\N	812
1998	1	400	0	Admin	2023-10-24	\N	\N	1165
1999	1	4007221039112	1	Admin	2023-10-24	\N	\N	670
2000	1	4007221039129	1	Admin	2023-10-24	\N	\N	671
2001	1	4007221043218	0	Admin	2023-10-24	\N	\N	522
2002	1	4007221052180	0	Admin	2023-10-24	\N	\N	1555
2003	1	4007221054221	0	Admin	2023-10-24	\N	\N	1556
2004	1	401	12	Admin	2023-10-24	\N	\N	1166
2005	1	402	12	Admin	2023-10-24	\N	\N	1267
2006	1	403	0	Admin	2023-10-24	\N	\N	1375
2007	1	404	1	Admin	2023-10-24	\N	\N	1398
2008	1	41	4	Admin	2023-10-24	\N	\N	813
2009	1	41006	0	Admin	2023-10-24	\N	\N	505
2010	1	41013	4	Admin	2023-10-24	\N	\N	511
2011	1	41019	0	Admin	2023-10-24	\N	\N	512
2012	1	412	0	Admin	2023-10-24	\N	\N	1517
2013	1	415	0	Admin	2023-10-24	\N	\N	1520
2014	1	416	1	Admin	2023-10-24	\N	\N	1521
2015	1	42	1	Admin	2023-10-24	\N	\N	814
2016	1	4260448120210	10	Admin	2023-10-24	\N	\N	1439
2017	1	43	0	Admin	2023-10-24	\N	\N	815
2018	1	45	0	Admin	2023-10-24	\N	\N	944
2019	1	4894158096291	0	Admin	2023-10-24	\N	\N	1106
2020	1	50	63	Admin	2023-10-24	\N	\N	816
2021	1	51	5	Admin	2023-10-24	\N	\N	817
2022	1	52	3	Admin	2023-10-24	\N	\N	818
2023	1	53	0	Admin	2023-10-24	\N	\N	819
2024	1	5414736039282	0	Admin	2023-10-24	\N	\N	1163
2025	1	5414736047911	1	Admin	2023-10-24	\N	\N	466
2026	1	5414736047928	3	Admin	2023-10-24	\N	\N	467
2027	1	5414736047935	4	Admin	2023-10-24	\N	\N	468
2028	1	5414736047942	2	Admin	2023-10-24	\N	\N	469
2029	1	5414736048253	0	Admin	2023-10-24	\N	\N	1644
2030	1	5415341001961	0	Admin	2023-10-24	\N	\N	596
2031	1	5420043705338	6	Admin	2023-10-24	\N	\N	464
2032	1	5420043705345	1	Admin	2023-10-24	\N	\N	465
2033	1	6	0	Admin	2023-10-24	\N	\N	987
2034	1	60	6	Admin	2023-10-24	\N	\N	820
2035	1	61	2	Admin	2023-10-24	\N	\N	821
2036	1	62	0	Admin	2023-10-24	\N	\N	822
2037	1	63	0	Admin	2023-10-24	\N	\N	823
2038	1	645095002166	0	Admin	2023-10-24	\N	\N	983
2039	1	659525114701	1	Admin	2023-10-24	\N	\N	1622
2040	1	662858207224	5	Admin	2023-10-24	\N	\N	1178
2041	1	662858226003	1	Admin	2023-10-24	\N	\N	1164
2042	1	682500939518	0	Admin	2023-10-24	\N	\N	942
2043	1	682500939679	0	Admin	2023-10-24	\N	\N	943
2044	1	6828949660383	0	Admin	2023-10-24	\N	\N	1602
2045	1	6920190048764	0	Admin	2023-10-24	\N	\N	1086
2046	1	6953182709244	0	Admin	2023-10-24	\N	\N	587
2047	1	6953182710585	0	Admin	2023-10-24	\N	\N	550
2048	1	6953182710820	0	Admin	2023-10-24	\N	\N	1128
2049	1	6953182714576	0	Admin	2023-10-24	\N	\N	1372
2050	1	6953182714972	0	Admin	2023-10-24	\N	\N	1116
2051	1	6953182718062	1	Admin	2023-10-24	\N	\N	1119
2052	1	6953182719458	0	Admin	2023-10-24	\N	\N	441
2053	1	6953182719571	0	Admin	2023-10-24	\N	\N	1117
2054	1	6953182720072	0	Admin	2023-10-24	\N	\N	1118
2055	1	6953182721161	0	Admin	2023-10-24	\N	\N	585
2056	1	6953182731450	0	Admin	2023-10-24	\N	\N	555
2057	1	6953182731481	0	Admin	2023-10-24	\N	\N	556
2058	1	6953182732365	0	Admin	2023-10-24	\N	\N	437
2059	1	6953182732372	0	Admin	2023-10-24	\N	\N	438
2060	1	6953182732389	0	Admin	2023-10-24	\N	\N	439
2061	1	6953182732440	0	Admin	2023-10-24	\N	\N	440
2062	1	6953182735083	0	Admin	2023-10-24	\N	\N	1278
2063	1	6972170629975	0	Admin	2023-10-24	\N	\N	1610
2064	1	6995654545424	0	Admin	2023-10-24	\N	\N	1599
2065	1	70	2	Admin	2023-10-24	\N	\N	824
2066	1	71	0	Admin	2023-10-24	\N	\N	825
2067	1	711604200290	2	Admin	2023-10-24	\N	\N	1284
2068	1	711604203734	2	Admin	2023-10-24	\N	\N	1285
2069	1	714193509102	1	Admin	2023-10-24	\N	\N	1216
2070	1	714193600724	4	Admin	2023-10-24	\N	\N	1217
2071	1	714193600823	1	Admin	2023-10-24	\N	\N	727
2072	1	714193600861	1	Admin	2023-10-24	\N	\N	726
2073	1	714193600984	0	Admin	2023-10-24	\N	\N	728
2074	1	714193610934	0	Admin	2023-10-24	\N	\N	1623
2075	1	714193699728	5	Admin	2023-10-24	\N	\N	725
2076	1	7191600000507	0	Admin	2023-10-24	\N	\N	1254
2077	1	72	0	Admin	2023-10-24	\N	\N	826
2078	1	73	0	Admin	2023-10-24	\N	\N	827
2079	1	73000101	0	Admin	2023-10-24	\N	\N	158
2080	1	73008199IO	0	Admin	2023-10-24	\N	\N	388
2081	1	73033333	0	Admin	2023-10-24	\N	\N	159
2082	1	736990012050	1	Admin	2023-10-24	\N	\N	887
2083	1	736990012104	1	Admin	2023-10-24	\N	\N	886
2084	1	736990012159	0	Admin	2023-10-24	\N	\N	888
2085	1	736990012203	1	Admin	2023-10-24	\N	\N	889
2086	1	736990012258	0	Admin	2023-10-24	\N	\N	890
2087	1	736990013002	0	Admin	2023-10-24	\N	\N	884
2088	1	736990013309	0	Admin	2023-10-24	\N	\N	885
2089	1	736990040114	1	Admin	2023-10-24	\N	\N	883
2090	1	74 6203100578	0	Admin	2023-10-24	\N	\N	1132
2091	1	7404000315615	0	Admin	2023-10-24	\N	\N	638
2092	1	7404000315622	0	Admin	2023-10-24	\N	\N	639
2093	1	7404000315639	0	Admin	2023-10-24	\N	\N	640
2094	1	7404000315646	0	Admin	2023-10-24	\N	\N	641
2095	1	7406160004224	0	Admin	2023-10-24	\N	\N	599
2096	1	7410000115322	0	Admin	2023-10-24	\N	\N	1262
2097	1	7410032780024	5	Admin	2023-10-24	\N	\N	710
2098	1	7410032780031	0	Admin	2023-10-24	\N	\N	711
2099	1	7414400200596	2	Admin	2023-10-24	\N	\N	1210
2100	1	7414400201012	1	Admin	2023-10-24	\N	\N	732
2101	1	7414400201050	0	Admin	2023-10-24	\N	\N	739
2102	1	7414400201067	0	Admin	2023-10-24	\N	\N	740
2103	1	7414400201074	2	Admin	2023-10-24	\N	\N	737
2104	1	7414400201081	0	Admin	2023-10-24	\N	\N	738
2105	1	7414400201111	1	Admin	2023-10-24	\N	\N	735
2106	1	7414400201128	0	Admin	2023-10-24	\N	\N	736
2107	1	7414400201210	1	Admin	2023-10-24	\N	\N	1479
2108	1	7414400201227	1	Admin	2023-10-24	\N	\N	1478
2109	1	7414400201234	1	Admin	2023-10-24	\N	\N	1477
2110	1	7414400201296	0	Admin	2023-10-24	\N	\N	734
2111	1	7414400201302	0	Admin	2023-10-24	\N	\N	733
2112	1	7414400201364	2	Admin	2023-10-24	\N	\N	1458
2113	1	7414400201432	4	Admin	2023-10-24	\N	\N	1215
2114	1	7414400201449	0	Admin	2023-10-24	\N	\N	1213
2115	1	7414400201456	0	Admin	2023-10-24	\N	\N	1212
2116	1	7414400201470	0	Admin	2023-10-24	\N	\N	715
2117	1	7414400201487	2	Admin	2023-10-24	\N	\N	717
2118	1	7414400201494	2	Admin	2023-10-24	\N	\N	716
2119	1	7414400201609	3	Admin	2023-10-24	\N	\N	851
2120	1	7414400201616	3	Admin	2023-10-24	\N	\N	850
2121	1	7414400201623	0	Admin	2023-10-24	\N	\N	852
2122	1	7414400202088	0	Admin	2023-10-24	\N	\N	1214
2123	1	7414400202095	0	Admin	2023-10-24	\N	\N	1209
2124	1	7414400202101	1	Admin	2023-10-24	\N	\N	1211
2125	1	7414400202149	0	Admin	2023-10-24	\N	\N	1208
2126	1	7416203100264	0	Admin	2023-10-24	\N	\N	560
2127	1	7416203100271	1	Admin	2023-10-24	\N	\N	561
2128	1	7416203100288	2	Admin	2023-10-24	\N	\N	562
2129	1	7416203100295	1	Admin	2023-10-24	\N	\N	563
2130	1	7416203100301	0	Admin	2023-10-24	\N	\N	564
2131	1	7416203100318	1	Admin	2023-10-24	\N	\N	565
2132	1	7416203100578	0	Admin	2023-10-24	\N	\N	1162
2133	1	7416203100585	0	Admin	2023-10-24	\N	\N	1136
2134	1	7416203100592	0	Admin	2023-10-24	\N	\N	1135
2135	1	7416203100608	0	Admin	2023-10-24	\N	\N	1134
2136	1	7416203100615	0	Admin	2023-10-24	\N	\N	1131
2137	1	7416203100622	0	Admin	2023-10-24	\N	\N	1137
2138	1	7416203100639	0	Admin	2023-10-24	\N	\N	1126
2139	1	7416203100646	1	Admin	2023-10-24	\N	\N	1125
2140	1	7416203100653	0	Admin	2023-10-24	\N	\N	1124
2141	1	7416203100660	2	Admin	2023-10-24	\N	\N	1123
2142	1	7416203100677	1	Admin	2023-10-24	\N	\N	1122
2143	1	7416203100684	0	Admin	2023-10-24	\N	\N	1121
2144	1	7416203100844	0	Admin	2023-10-24	\N	\N	553
2145	1	7416203101179	0	Admin	2023-10-24	\N	\N	1129
2146	1	7416203101209	0	Admin	2023-10-24	\N	\N	584
2147	1	7416203101247	0	Admin	2023-10-24	\N	\N	566
2148	1	7416203101254	0	Admin	2023-10-24	\N	\N	567
2149	1	7416203101261	0	Admin	2023-10-24	\N	\N	569
2150	1	7416203101278	0	Admin	2023-10-24	\N	\N	571
2151	1	7416203101438	0	Admin	2023-10-24	\N	\N	619
2152	1	7416203101445	0	Admin	2023-10-24	\N	\N	484
2153	1	7416203101469	0	Admin	2023-10-24	\N	\N	573
2154	1	7416203101520	0	Admin	2023-10-24	\N	\N	442
2155	1	7416203101544	0	Admin	2023-10-24	\N	\N	617
2156	1	7416203101551	0	Admin	2023-10-24	\N	\N	616
2157	1	7416203101667	0	Admin	2023-10-24	\N	\N	443
2158	1	7416203101797	0	Admin	2023-10-24	\N	\N	600
2159	1	7416203101827	0	Admin	2023-10-24	\N	\N	626
2160	1	7416203101834	1	Admin	2023-10-24	\N	\N	590
2161	1	7416203101902	1	Admin	2023-10-24	\N	\N	549
2162	1	7416203101926	1	Admin	2023-10-24	\N	\N	1115
2163	1	7416203101964	0	Admin	2023-10-24	\N	\N	483
2164	1	7416203102183	1	Admin	2023-10-24	\N	\N	1120
2165	1	7416203102213	2	Admin	2023-10-24	\N	\N	621
2166	1	7416203102220	1	Admin	2023-10-24	\N	\N	620
2167	1	7416203102237	0	Admin	2023-10-24	\N	\N	622
2168	1	7416203102244	0	Admin	2023-10-24	\N	\N	618
2169	1	7416203102916	0	Admin	2023-10-24	\N	\N	581
2170	1	7416203102923	0	Admin	2023-10-24	\N	\N	582
2171	1	7416203102930	0	Admin	2023-10-24	\N	\N	583
2172	1	7416203103326	0	Admin	2023-10-24	\N	\N	479
2173	1	7416203103333	0	Admin	2023-10-24	\N	\N	480
2174	1	7416203103340	0	Admin	2023-10-24	\N	\N	481
2175	1	7416203103357	1	Admin	2023-10-24	\N	\N	1127
2176	1	7416203103364	0	Admin	2023-10-24	\N	\N	1133
2177	1	7416203103371	0	Admin	2023-10-24	\N	\N	474
2178	1	7416203103388	0	Admin	2023-10-24	\N	\N	475
2179	1	7416203103395	1	Admin	2023-10-24	\N	\N	476
2180	1	7416203103401	1	Admin	2023-10-24	\N	\N	477
2181	1	7416203103418	0	Admin	2023-10-24	\N	\N	478
2182	1	7416203103425	0	Admin	2023-10-24	\N	\N	482
2183	1	7416203103685	0	Admin	2023-10-24	\N	\N	1374
2184	1	7416203103692	0	Admin	2023-10-24	\N	\N	591
2185	1	7416203103708	0	Admin	2023-10-24	\N	\N	592
2186	1	7416203103722	0	Admin	2023-10-24	\N	\N	624
2187	1	7416203103739	0	Admin	2023-10-24	\N	\N	623
2188	1	7416203103753	0	Admin	2023-10-24	\N	\N	593
2189	1	7416203103760	0	Admin	2023-10-24	\N	\N	594
2190	1	7420615480007-7.5	0	Admin	2023-10-24	\N	\N	1594
2191	1	742061548007-10	1	Admin	2023-10-24	\N	\N	892
2192	1	742061548007-12.5	0	Admin	2023-10-24	\N	\N	893
2193	1	742061548007-15	0	Admin	2023-10-24	\N	\N	894
2194	1	742061548007-20	0	Admin	2023-10-24	\N	\N	895
2195	1	742061548007-25	1	Admin	2023-10-24	\N	\N	896
2196	1	742061548007-30	0	Admin	2023-10-24	\N	\N	897
2197	1	742061548007-7.5	0	Admin	2023-10-24	\N	\N	891
2198	1	7441003121935	8	Admin	2023-10-24	\N	\N	662
2199	1	7441003121942	1	Admin	2023-10-24	\N	\N	661
2200	1	7441007802434	1	Admin	2023-10-24	\N	\N	1574
2201	1	7441031336950	0	Admin	2023-10-24	\N	\N	1286
2202	1	7453105056978	0	Admin	2023-10-24	\N	\N	1098
2203	1	7501	0	Admin	2023-10-24	\N	\N	1611
2204	1	7501051100020	2	Admin	2023-10-24	\N	\N	1245
2205	1	7501051100037	0	Admin	2023-10-24	\N	\N	660
2206	1	7501051186963	1	Admin	2023-10-24	\N	\N	1247
2207	1	7501072204462	1	Admin	2023-10-24	\N	\N	1492
2208	1	7501072204479	0	Admin	2023-10-24	\N	\N	1493
2209	1	7501072204561	2	Admin	2023-10-24	\N	\N	488
2210	1	7501072204578	1	Admin	2023-10-24	\N	\N	1223
2211	1	7501072204592	3	Admin	2023-10-24	\N	\N	1391
2212	1	7501072204615	1	Admin	2023-10-24	\N	\N	1218
2213	1	7501072206299	2	Admin	2023-10-24	\N	\N	491
2214	1	7501072206305	0	Admin	2023-10-24	\N	\N	1219
2215	1	7501072207234	0	Admin	2023-10-24	\N	\N	485
2216	1	7501072207258	5	Admin	2023-10-24	\N	\N	493
2217	1	7501072207265	0	Admin	2023-10-24	\N	\N	492
2218	1	7501072208231	0	Admin	2023-10-24	\N	\N	499
2219	1	7501072208248	1	Admin	2023-10-24	\N	\N	486
2220	1	7501072208262	0	Admin	2023-10-24	\N	\N	1496
2221	1	7501072208279	4	Admin	2023-10-24	\N	\N	500
2222	1	7501072208293	2	Admin	2023-10-24	\N	\N	489
2223	1	7501072208743	1	Admin	2023-10-24	\N	\N	1389
2224	1	7501072208767	1	Admin	2023-10-24	\N	\N	1224
2225	1	7501072208781	4	Admin	2023-10-24	\N	\N	498
2226	1	7501072208798	0	Admin	2023-10-24	\N	\N	1221
2227	1	7501072208927	1	Admin	2023-10-24	\N	\N	1461
2228	1	7501072208958	5	Admin	2023-10-24	\N	\N	490
2229	1	7501072208972	1	Admin	2023-10-24	\N	\N	1631
2230	1	7501072210609	1	Admin	2023-10-24	\N	\N	1390
2231	1	7501072210616	1	Admin	2023-10-24	\N	\N	1220
2232	1	7501072210623	5	Admin	2023-10-24	\N	\N	497
2233	1	7501072210630	0	Admin	2023-10-24	\N	\N	1460
2234	1	7501072210661	0	Admin	2023-10-24	\N	\N	1392
2235	1	7501072210678	0	Admin	2023-10-24	\N	\N	1282
2236	1	7501072210685	2	Admin	2023-10-24	\N	\N	1076
2237	1	7501072210692	3	Admin	2023-10-24	\N	\N	487
2238	1	7501072210715	1	Admin	2023-10-24	\N	\N	1222
2239	1	7501072210722	0	Admin	2023-10-24	\N	\N	1354
2240	1	7501072210739	1	Admin	2023-10-24	\N	\N	1634
2241	1	7501072214485	1	Admin	2023-10-24	\N	\N	924
2242	1	7501072214492	0	Admin	2023-10-24	\N	\N	927
2243	1	7501072214508	0	Admin	2023-10-24	\N	\N	919
2244	1	7501072214515	0	Admin	2023-10-24	\N	\N	926
2245	1	7501072214522	0	Admin	2023-10-24	\N	\N	923
2246	1	7501072214539	3	Admin	2023-10-24	\N	\N	921
2247	1	7501072214546	2	Admin	2023-10-24	\N	\N	922
2248	1	7501072214560	1	Admin	2023-10-24	\N	\N	920
2249	1	7502010420043	22	Admin	2023-10-24	\N	\N	1283
2250	1	7502010421118	1	Admin	2023-10-24	\N	\N	503
2251	1	7502010421125	4	Admin	2023-10-24	\N	\N	502
2252	1	7502010421132	6	Admin	2023-10-24	\N	\N	501
2253	1	7502010421187	0	Admin	2023-10-24	\N	\N	513
2254	1	7502010421194	4	Admin	2023-10-24	\N	\N	1444
2255	1	7502010423969	0	Admin	2023-10-24	\N	\N	530
2256	1	7502010429701	1	Admin	2023-10-24	\N	\N	537
2257	1	7502262630023	13	Admin	2023-10-24	\N	\N	763
2258	1	7502262630740	0	Admin	2023-10-24	\N	\N	518
2259	1	7502262630795	1	Admin	2023-10-24	\N	\N	1275
2260	1	7503008553002	2	Admin	2023-10-24	\N	\N	753
2261	1	7503008553040	5	Admin	2023-10-24	\N	\N	752
2262	1	7503008553057	1	Admin	2023-10-24	\N	\N	1593
2263	1	7503008553071	1	Admin	2023-10-24	\N	\N	1589
2264	1	7503008553200	4	Admin	2023-10-24	\N	\N	750
2265	1	7503008553231	1	Admin	2023-10-24	\N	\N	1396
2266	1	7503008553248	6	Admin	2023-10-24	\N	\N	751
2267	1	7503008553255	1	Admin	2023-10-24	\N	\N	1395
2268	1	7503008553279	2	Admin	2023-10-24	\N	\N	1428
2269	1	7503008553965	0	Admin	2023-10-24	\N	\N	799
2270	1	7503008553972	0	Admin	2023-10-24	\N	\N	1394
2271	1	7503019166604	1	Admin	2023-10-24	\N	\N	520
2272	1	7503020053085	3	Admin	2023-10-24	\N	\N	1393
2273	1	7503020053290	1	Admin	2023-10-24	\N	\N	754
2274	1	7503020053306	3	Admin	2023-10-24	\N	\N	757
2275	1	7503020053313	9	Admin	2023-10-24	\N	\N	758
2276	1	7503020053320	6	Admin	2023-10-24	\N	\N	1397
2277	1	7503020053382	1	Admin	2023-10-24	\N	\N	1590
2278	1	7503020053849	0	Admin	2023-10-24	\N	\N	798
2279	1	7503026084113	1	Admin	2023-10-24	\N	\N	756
2280	1	7503026084144	0	Admin	2023-10-24	\N	\N	755
2281	1	7503026470107	1	Admin	2023-10-24	\N	\N	846
2282	1	7503027959472	0	Admin	2023-10-24	\N	\N	527
2283	1	7506267903489	0	Admin	2023-10-24	\N	\N	1438
2284	1	7506267907340	0	Admin	2023-10-24	\N	\N	1442
2285	1	7506267907357	0	Admin	2023-10-24	\N	\N	1441
2286	1	7506267907371	0	Admin	2023-10-24	\N	\N	1440
2287	1	7506343800015	12	Admin	2023-10-24	\N	\N	644
2288	1	7506343800022	14	Admin	2023-10-24	\N	\N	645
2289	1	7506343800039	9	Admin	2023-10-24	\N	\N	646
2290	1	7506343800176	57	Admin	2023-10-24	\N	\N	642
2291	1	7506343800190	19	Admin	2023-10-24	\N	\N	643
2292	1	7506343800794	3	Admin	2023-10-24	\N	\N	631
2293	1	7506343801784	5	Admin	2023-10-24	\N	\N	647
2294	1	7506343802668	2	Admin	2023-10-24	\N	\N	630
2295	1	7506343802675	0	Admin	2023-10-24	\N	\N	649
2296	1	7506343802798	5	Admin	2023-10-24	\N	\N	648
2297	1	7506396700645	0	Admin	2023-10-24	\N	\N	532
2298	1	7506407400328	0	Admin	2023-10-24	\N	\N	519
2299	1	7506407400618	1	Admin	2023-10-24	\N	\N	969
2300	1	7506407400625	2	Admin	2023-10-24	\N	\N	970
2301	1	7506407400977	6	Admin	2023-10-24	\N	\N	968
2302	1	7506407401691	0	Admin	2023-10-24	\N	\N	967
2303	1	7506407402094	0	Admin	2023-10-24	\N	\N	965
2304	1	7506407402124	2	Admin	2023-10-24	\N	\N	538
2305	1	7506407402193	2	Admin	2023-10-24	\N	\N	971
2306	1	7506407402216	0	Admin	2023-10-24	\N	\N	523
2307	1	7506407402247	0	Admin	2023-10-24	\N	\N	528
2308	1	7506407402469	0	Admin	2023-10-24	\N	\N	966
2309	1	7593990010041	0	Admin	2023-10-24	\N	\N	1082
2310	1	7593990010058	1	Admin	2023-10-24	\N	\N	1105
2311	1	7593990012953	0	Admin	2023-10-24	\N	\N	1104
2312	1	7593990050511	0	Admin	2023-10-24	\N	\N	1103
2313	1	769229001167	0	Admin	2023-10-24	\N	\N	651
2314	1	769229002430	0	Admin	2023-10-24	\N	\N	663
2315	1	769229002683	1	Admin	2023-10-24	\N	\N	672
2316	1	769229003611	4	Admin	2023-10-24	\N	\N	658
2317	1	769229003710	0	Admin	2023-10-24	\N	\N	673
2318	1	769229003734	0	Admin	2023-10-24	\N	\N	664
2319	1	769229003741	0	Admin	2023-10-24	\N	\N	656
2320	1	769229003758	1	Admin	2023-10-24	\N	\N	657
2321	1	769229049510	39	Admin	2023-10-24	\N	\N	655
2322	1	769229124217	3	Admin	2023-10-24	\N	\N	650
2323	1	769229131413	1	Admin	2023-10-24	\N	\N	653
2324	1	769229131512	1	Admin	2023-10-24	\N	\N	652
2325	1	769229131918	1	Admin	2023-10-24	\N	\N	654
2326	1	7707007404604	3	Admin	2023-10-24	\N	\N	1256
2327	1	7707007405663	4	Admin	2023-10-24	\N	\N	1258
2328	1	7707115301161	8	Admin	2023-10-24	\N	\N	458
2329	1	7707115301222	0	Admin	2023-10-24	\N	\N	455
2330	1	7707115301468	6	Admin	2023-10-24	\N	\N	457
2331	1	7707115301611	1	Admin	2023-10-24	\N	\N	536
2332	1	7707214570659	1	Admin	2023-10-24	\N	\N	940
2333	1	7707214570833	0	Admin	2023-10-24	\N	\N	941
2334	1	7707214570918	0	Admin	2023-10-24	\N	\N	937
2335	1	7707214570949	0	Admin	2023-10-24	\N	\N	938
2336	1	7707214573001	0	Admin	2023-10-24	\N	\N	939
2337	1	7707274710316	4	Admin	2023-10-24	\N	\N	515
2338	1	7707274714215	0	Admin	2023-10-24	\N	\N	460
2339	1	7707274715014	0	Admin	2023-10-24	\N	\N	454
2340	1	7707274717001	0	Admin	2023-10-24	\N	\N	459
2341	1	7707274718060	0	Admin	2023-10-24	\N	\N	453
2342	1	7730952032677	0	Admin	2023-10-24	\N	\N	526
2343	1	7730952032899	0	Admin	2023-10-24	\N	\N	1525
2344	1	7730997410614	0	Admin	2023-10-24	\N	\N	760
2345	1	7730997410621	1	Admin	2023-10-24	\N	\N	759
2346	1	7730997410638	7	Admin	2023-10-24	\N	\N	761
2347	1	7730997410645	1	Admin	2023-10-24	\N	\N	762
2348	1	7756654000363	0	Admin	2023-10-24	\N	\N	1509
2349	1	7756654000370	0	Admin	2023-10-24	\N	\N	1508
2350	1	7756654000387	0	Admin	2023-10-24	\N	\N	1512
2351	1	7756654000400	0	Admin	2023-10-24	\N	\N	1516
2352	1	7756654000424	0	Admin	2023-10-24	\N	\N	1505
2353	1	7756654000448	0	Admin	2023-10-24	\N	\N	1510
2354	1	7756654015220	0	Admin	2023-10-24	\N	\N	1504
2355	1	7756654020156	0	Admin	2023-10-24	\N	\N	1514
2356	1	7756654020293	0	Admin	2023-10-24	\N	\N	1511
2357	1	7756654027926	1	Admin	2023-10-24	\N	\N	1618
2358	1	7756654027933	1	Admin	2023-10-24	\N	\N	1617
2359	1	7756654027940	1	Admin	2023-10-24	\N	\N	1616
2360	1	7759433000059	0	Admin	2023-10-24	\N	\N	1475
2361	1	7759433000882	0	Admin	2023-10-24	\N	\N	1274
2362	1	7759433000998	0	Admin	2023-10-24	\N	\N	1264
2363	1	7759433001193	1	Admin	2023-10-24	\N	\N	1633
2364	1	7759433001933	0	Admin	2023-10-24	\N	\N	1628
2365	1	7759433001940	1	Admin	2023-10-24	\N	\N	1629
2366	1	7792716421868	0	Admin	2023-10-24	\N	\N	1523
2367	1	7797600000174	4	Admin	2023-10-24	\N	\N	1260
2368	1	7797600000501	2	Admin	2023-10-24	\N	\N	1269
2369	1	7797600000518	1	Admin	2023-10-24	\N	\N	1253
2370	1	7797600000761	3	Admin	2023-10-24	\N	\N	1257
2371	1	7797600000785	0	Admin	2023-10-24	\N	\N	1261
2372	1	7797600001805	0	Admin	2023-10-24	\N	\N	1252
2373	1	7797600001812	4	Admin	2023-10-24	\N	\N	1255
2374	1	7797600002895	0	Admin	2023-10-24	\N	\N	1547
2375	1	7797600002901	13	Admin	2023-10-24	\N	\N	1519
2376	1	7798042360055	0	Admin	2023-10-24	\N	\N	767
2377	1	7798042360093	2	Admin	2023-10-24	\N	\N	769
2378	1	7798042360109	1	Admin	2023-10-24	\N	\N	768
2379	1	7798042360178	0	Admin	2023-10-24	\N	\N	766
2380	1	7798042360185	0	Admin	2023-10-24	\N	\N	535
2381	1	7798042360260	5	Admin	2023-10-24	\N	\N	770
2382	1	7798042360468	1	Admin	2023-10-24	\N	\N	764
2383	1	7798042360581	0	Admin	2023-10-24	\N	\N	771
2384	1	7798042361311	7	Admin	2023-10-24	\N	\N	785
2385	1	7798042361335	0	Admin	2023-10-24	\N	\N	540
2386	1	7798042361359	1	Admin	2023-10-24	\N	\N	773
2387	1	7798042361380	0	Admin	2023-10-24	\N	\N	774
2388	1	7798042361533	1	Admin	2023-10-24	\N	\N	780
2389	1	7798042364800	4	Admin	2023-10-24	\N	\N	514
2390	1	7798042364961	5	Admin	2023-10-24	\N	\N	772
2391	1	7798042365685	1	Admin	2023-10-24	\N	\N	781
2392	1	7798042365692	0	Admin	2023-10-24	\N	\N	782
2393	1	7798042365708	17	Admin	2023-10-24	\N	\N	928
2394	1	7798042365715	12	Admin	2023-10-24	\N	\N	903
2395	1	7798042365722	12	Admin	2023-10-24	\N	\N	902
2396	1	7798042365739	7	Admin	2023-10-24	\N	\N	925
2397	1	7798042365975	1	Admin	2023-10-24	\N	\N	765
2398	1	7798042366170	2	Admin	2023-10-24	\N	\N	783
2399	1	7798042366187	0	Admin	2023-10-24	\N	\N	784
2400	1	7798042366200	0	Admin	2023-10-24	\N	\N	778
2401	1	7798042366217	0	Admin	2023-10-24	\N	\N	779
2402	1	7798042366224	1	Admin	2023-10-24	\N	\N	790
2403	1	7798042366231	0	Admin	2023-10-24	\N	\N	531
2404	1	7798042366255	0	Admin	2023-10-24	\N	\N	775
2405	1	7798042366262	0	Admin	2023-10-24	\N	\N	776
2406	1	7798144990860	0	Admin	2023-10-24	\N	\N	1453
2407	1	7798144993663	0	Admin	2023-10-24	\N	\N	1173
2408	1	7798156460054	0	Admin	2023-10-24	\N	\N	521
2409	1	7798156460061	0	Admin	2023-10-24	\N	\N	1524
2410	1	7798156460290	0	Admin	2023-10-24	\N	\N	529
2411	1	7798156460429	1	Admin	2023-10-24	\N	\N	544
2412	1	7798156460498	3	Admin	2023-10-24	\N	\N	533
2413	1	7798156460740	0	Admin	2023-10-24	\N	\N	1526
2414	1	7798156461051	0	Admin	2023-10-24	\N	\N	539
2415	1	7798156461808	0	Admin	2023-10-24	\N	\N	800
2416	1	7798156461815	0	Admin	2023-10-24	\N	\N	801
2417	1	7798156461853	0	Admin	2023-10-24	\N	\N	545
2418	1	7798156461884	2	Admin	2023-10-24	\N	\N	534
2419	1	7798156462928	7	Admin	2023-10-24	\N	\N	541
2420	1	7798156463185	0	Admin	2023-10-24	\N	\N	543
2421	1	7798166871895	3	Admin	2023-10-24	\N	\N	629
2422	1	7798166871901	5	Admin	2023-10-24	\N	\N	632
2423	1	7798166873134	0	Admin	2023-10-24	\N	\N	634
2424	1	7798166873141	0	Admin	2023-10-24	\N	\N	635
2425	1	7798166873158	0	Admin	2023-10-24	\N	\N	636
2426	1	7798166873165	0	Admin	2023-10-24	\N	\N	633
2427	1	7798166873172	0	Admin	2023-10-24	\N	\N	637
2428	1	7798176420403	1	Admin	2023-10-24	\N	\N	1621
2429	1	7798176420410	3	Admin	2023-10-24	\N	\N	952
2430	1	7798176420434	0	Admin	2023-10-24	\N	\N	953
2431	1	7798176420458	1	Admin	2023-10-24	\N	\N	950
2432	1	7798176420465	1	Admin	2023-10-24	\N	\N	946
2433	1	7798176421073	0	Admin	2023-10-24	\N	\N	863
2434	1	7798176421080	0	Admin	2023-10-24	\N	\N	864
2435	1	7798176421097	0	Admin	2023-10-24	\N	\N	865
2436	1	7798176421103	0	Admin	2023-10-24	\N	\N	866
2437	1	7798176421110	0	Admin	2023-10-24	\N	\N	867
2438	1	7798176421196	2	Admin	2023-10-24	\N	\N	949
2439	1	7798176421202	1	Admin	2023-10-24	\N	\N	951
2440	1	7798176421219	0	Admin	2023-10-24	\N	\N	1638
2441	1	7798176421264	2	Admin	2023-10-24	\N	\N	948
2442	1	7798176421745	0	Admin	2023-10-24	\N	\N	1472
2443	1	7798176421752	0	Admin	2023-10-24	\N	\N	1473
2444	1	7798176421769	1	Admin	2023-10-24	\N	\N	1612
2445	1	7798176421776	1	Admin	2023-10-24	\N	\N	1474
2446	1	7798176421868	0	Admin	2023-10-24	\N	\N	868
2447	1	7798176421875	0	Admin	2023-10-24	\N	\N	869
2448	1	7798176421882	0	Admin	2023-10-24	\N	\N	870
2449	1	7798176421899	0	Admin	2023-10-24	\N	\N	871
2450	1	7798176421905	0	Admin	2023-10-24	\N	\N	872
2451	1	7798176422926	0	Admin	2023-10-24	\N	\N	947
2452	1	7798359710017	2	Admin	2023-10-24	\N	\N	1382
2453	1	7800006000232	0	Admin	2023-10-24	\N	\N	913
2454	1	7800006002038	5	Admin	2023-10-24	\N	\N	912
2455	1	7800006002700	0	Admin	2023-10-24	\N	\N	918
2456	1	7800006002724	3	Admin	2023-10-24	\N	\N	911
2457	1	7800006003370	1	Admin	2023-10-24	\N	\N	915
2458	1	7800006003561	0	Admin	2023-10-24	\N	\N	914
2459	1	7800006003646	0	Admin	2023-10-24	\N	\N	917
2460	1	7800006005169	0	Admin	2023-10-24	\N	\N	916
2461	1	7800019000014	0	Admin	2023-10-24	\N	\N	1446
2462	1	784369477115	1	Admin	2023-10-24	\N	\N	588
2463	1	784369477122	1	Admin	2023-10-24	\N	\N	589
2464	1	7898049715480	1	Admin	2023-10-24	\N	\N	506
2465	1	7898049719273	1	Admin	2023-10-24	\N	\N	1643
2466	1	7898416700040	0	Admin	2023-10-24	\N	\N	517
2467	1	7898416700521	0	Admin	2023-10-24	\N	\N	932
2468	1	7898416700743	0	Admin	2023-10-24	\N	\N	933
2469	1	7898416701344	0	Admin	2023-10-24	\N	\N	929
2470	1	7898416701955	2	Admin	2023-10-24	\N	\N	930
2471	1	7898416701979	0	Admin	2023-10-24	\N	\N	931
2472	1	7898597991329	0	Admin	2023-10-24	\N	\N	525
2473	1	80	0	Admin	2023-10-24	\N	\N	828
2474	1	8010690010908	0	Admin	2023-10-24	\N	\N	43
2475	1	8010690010915	0	Admin	2023-10-24	\N	\N	42
2476	1	8010690010946	0	Admin	2023-10-24	\N	\N	44
2477	1	8010690010991	0	Admin	2023-10-24	\N	\N	46
2478	1	8010690011080	0	Admin	2023-10-24	\N	\N	47
2479	1	8010690011295	0	Admin	2023-10-24	\N	\N	48
2480	1	8010690011301	0	Admin	2023-10-24	\N	\N	50
2481	1	8010690011349	0	Admin	2023-10-24	\N	\N	1554
2482	1	8010690011394	0	Admin	2023-10-24	\N	\N	51
2483	1	8010690011547	0	Admin	2023-10-24	\N	\N	52
2484	1	8010690011745	0	Admin	2023-10-24	\N	\N	53
2485	1	8010690011769	0	Admin	2023-10-24	\N	\N	1553
2486	1	8010690011790	0	Admin	2023-10-24	\N	\N	67
2487	1	8010690011936	0	Admin	2023-10-24	\N	\N	68
2488	1	8010690011967	0	Admin	2023-10-24	\N	\N	70
2489	1	8010690012186	0	Admin	2023-10-24	\N	\N	1538
2490	1	8010690012209	0	Admin	2023-10-24	\N	\N	72
2491	1	8010690012308	0	Admin	2023-10-24	\N	\N	1008
2492	1	8010690012360	0	Admin	2023-10-24	\N	\N	73
2493	1	8010690012476	1	Admin	2023-10-24	\N	\N	74
2494	1	8010690012674	0	Admin	2023-10-24	\N	\N	1009
2495	1	8010690012698	0	Admin	2023-10-24	\N	\N	75
2496	1	8010690014043	0	Admin	2023-10-24	\N	\N	1540
2497	1	8010690025919	0	Admin	2023-10-24	\N	\N	94
2498	1	8010690025926	0	Admin	2023-10-24	\N	\N	95
2499	1	8010690025940	0	Admin	2023-10-24	\N	\N	96
2500	1	8010690025988	0	Admin	2023-10-24	\N	\N	98
2501	1	8010690026015	0	Admin	2023-10-24	\N	\N	99
2502	1	8010690026053	0	Admin	2023-10-24	\N	\N	101
2503	1	8010690026060	0	Admin	2023-10-24	\N	\N	102
2504	1	8010690026084	0	Admin	2023-10-24	\N	\N	103
2505	1	8010690026121	0	Admin	2023-10-24	\N	\N	104
2506	1	8010690026138	0	Admin	2023-10-24	\N	\N	105
2507	1	8010690026152	0	Admin	2023-10-24	\N	\N	106
2508	1	8010690029214	0	Admin	2023-10-24	\N	\N	136
2509	1	8010690029566	0	Admin	2023-10-24	\N	\N	1532
2510	1	8010690029986	0	Admin	2023-10-24	\N	\N	1541
2511	1	8010690029993	0	Admin	2023-10-24	\N	\N	1542
2512	1	8010690030005	0	Admin	2023-10-24	\N	\N	1543
2513	1	8010690030029	0	Admin	2023-10-24	\N	\N	1544
2514	1	8010690037363	0	Admin	2023-10-24	\N	\N	20
2515	1	8010690041926	0	Admin	2023-10-24	\N	\N	58
2516	1	8010690041933	0	Admin	2023-10-24	\N	\N	60
2517	1	8010690041940	0	Admin	2023-10-24	\N	\N	63
2518	1	8010690042084	0	Admin	2023-10-24	\N	\N	1007
2519	1	8010690042091	0	Admin	2023-10-24	\N	\N	57
2520	1	8010690042114	0	Admin	2023-10-24	\N	\N	61
2521	1	8010690042121	0	Admin	2023-10-24	\N	\N	59
2522	1	8010690042145	0	Admin	2023-10-24	\N	\N	65
2523	1	8010690042152	0	Admin	2023-10-24	\N	\N	62
2524	1	8010690047775	0	Admin	2023-10-24	\N	\N	131
2525	1	8010690050072	0	Admin	2023-10-24	\N	\N	54
2526	1	8010690050089	0	Admin	2023-10-24	\N	\N	55
2527	1	8010690050096	0	Admin	2023-10-24	\N	\N	991
2528	1	8010690053677	0	Admin	2023-10-24	\N	\N	1015
2529	1	8010690053691	0	Admin	2023-10-24	\N	\N	1535
2530	1	8010690053714	0	Admin	2023-10-24	\N	\N	1016
2531	1	8010690053738	0	Admin	2023-10-24	\N	\N	997
2532	1	8010690053752	0	Admin	2023-10-24	\N	\N	1530
2533	1	8010690053776	0	Admin	2023-10-24	\N	\N	1531
2534	1	8010690055381	0	Admin	2023-10-24	\N	\N	107
2535	1	8010690055398	0	Admin	2023-10-24	\N	\N	108
2536	1	8010690055404	0	Admin	2023-10-24	\N	\N	109
2537	1	8010690055411	0	Admin	2023-10-24	\N	\N	110
2538	1	8010690055428	0	Admin	2023-10-24	\N	\N	111
2539	1	8010690055435	0	Admin	2023-10-24	\N	\N	112
2540	1	8010690055442	0	Admin	2023-10-24	\N	\N	113
2541	1	8010690055459	0	Admin	2023-10-24	\N	\N	114
2542	1	8010690055466	0	Admin	2023-10-24	\N	\N	115
2543	1	8010690056135	0	Admin	2023-10-24	\N	\N	116
2544	1	8010690056142	0	Admin	2023-10-24	\N	\N	117
2545	1	8010690056159	0	Admin	2023-10-24	\N	\N	118
2546	1	8010690056548	0	Admin	2023-10-24	\N	\N	129
2547	1	8010690056555	0	Admin	2023-10-24	\N	\N	130
2548	1	8010690056562	0	Admin	2023-10-24	\N	\N	134
2549	1	8010690056579	0	Admin	2023-10-24	\N	\N	135
2550	1	8010690056586	0	Admin	2023-10-24	\N	\N	981
2551	1	8010690056616	1	Admin	2023-10-24	\N	\N	1533
2552	1	8010690056630	0	Admin	2023-10-24	\N	\N	1141
2553	1	8010690056647	0	Admin	2023-10-24	\N	\N	137
2554	1	8010690056654	0	Admin	2023-10-24	\N	\N	1142
2555	1	8010690056661	1	Admin	2023-10-24	\N	\N	138
2556	1	8010690057552	0	Admin	2023-10-24	\N	\N	28
2557	1	8010690057569	0	Admin	2023-10-24	\N	\N	29
2558	1	8010690058160	0	Admin	2023-10-24	\N	\N	985
2559	1	8010690059082	0	Admin	2023-10-24	\N	\N	1155
2560	1	8010690061696	0	Admin	2023-10-24	\N	\N	389
2561	1	8010690061702	0	Admin	2023-10-24	\N	\N	25
2562	1	8010690062853	0	Admin	2023-10-24	\N	\N	24
2563	1	8010690067339	0	Admin	2023-10-24	\N	\N	1138
2564	1	8010690068121	0	Admin	2023-10-24	\N	\N	1160
2565	1	8010690068138	0	Admin	2023-10-24	\N	\N	1161
2566	1	8010690080017	0	Admin	2023-10-24	\N	\N	90
2567	1	8010690080024	0	Admin	2023-10-24	\N	\N	91
2568	1	8010690080031	0	Admin	2023-10-24	\N	\N	92
2569	1	8010690088365	0	Admin	2023-10-24	\N	\N	132
2570	1	8010690088457	0	Admin	2023-10-24	\N	\N	1159
2571	1	8010690088563	0	Admin	2023-10-24	\N	\N	1529
2572	1	8010690091471	0	Admin	2023-10-24	\N	\N	982
2573	1	8010690092898	1	Admin	2023-10-24	\N	\N	1539
2574	1	8010690093604	0	Admin	2023-10-24	\N	\N	133
2575	1	8010690099552	1	Admin	2023-10-24	\N	\N	1546
2576	1	8010690101491	0	Admin	2023-10-24	\N	\N	127
2577	1	8010690101507	0	Admin	2023-10-24	\N	\N	128
2578	1	8010690105796	0	Admin	2023-10-24	\N	\N	89
2579	1	8010690105802	0	Admin	2023-10-24	\N	\N	93
2580	1	8010690105819	0	Admin	2023-10-24	\N	\N	97
2581	1	8010690105826	0	Admin	2023-10-24	\N	\N	100
2582	1	8010690105833	0	Admin	2023-10-24	\N	\N	66
2583	1	8010690105840	0	Admin	2023-10-24	\N	\N	69
2584	1	8010690105857	0	Admin	2023-10-24	\N	\N	71
2585	1	8010690105864	0	Admin	2023-10-24	\N	\N	41
2586	1	8010690105871	0	Admin	2023-10-24	\N	\N	45
2587	1	8010690105888	0	Admin	2023-10-24	\N	\N	49
2588	1	8010690106571	0	Admin	2023-10-24	\N	\N	1534
2589	1	8010690107028	0	Admin	2023-10-24	\N	\N	31
2590	1	8010690107134	0	Admin	2023-10-24	\N	\N	32
2591	1	8010690115924	0	Admin	2023-10-24	\N	\N	22
2592	1	8010690122946	0	Admin	2023-10-24	\N	\N	139
2593	1	8010690122953	0	Admin	2023-10-24	\N	\N	140
2594	1	8010690122977	0	Admin	2023-10-24	\N	\N	141
2595	1	8010690122991	0	Admin	2023-10-24	\N	\N	142
2596	1	8010690123004	0	Admin	2023-10-24	\N	\N	143
2597	1	8010690123011	0	Admin	2023-10-24	\N	\N	144
2598	1	8010690123035	0	Admin	2023-10-24	\N	\N	145
2599	1	8010690123059	0	Admin	2023-10-24	\N	\N	146
2600	1	8010690123066	0	Admin	2023-10-24	\N	\N	147
2601	1	8010690123073	0	Admin	2023-10-24	\N	\N	148
2602	1	8010690123097	0	Admin	2023-10-24	\N	\N	164
2603	1	8010690123110	0	Admin	2023-10-24	\N	\N	149
2604	1	8010690123141	0	Admin	2023-10-24	\N	\N	150
2605	1	8010690123158	1	Admin	2023-10-24	\N	\N	151
2606	1	8010690123172	0	Admin	2023-10-24	\N	\N	152
2607	1	8010690123196	0	Admin	2023-10-24	\N	\N	153
2608	1	8010690123202	0	Admin	2023-10-24	\N	\N	154
2609	1	8010690123219	1	Admin	2023-10-24	\N	\N	155
2610	1	8010690123233	0	Admin	2023-10-24	\N	\N	156
2611	1	8010690123257	0	Admin	2023-10-24	\N	\N	157
2612	1	8010690133362	0	Admin	2023-10-24	\N	\N	21
2613	1	8010690140346	0	Admin	2023-10-24	\N	\N	1010
2614	1	8010690140360	0	Admin	2023-10-24	\N	\N	1011
2615	1	8010690140377	0	Admin	2023-10-24	\N	\N	1012
2616	1	8010690140384	0	Admin	2023-10-24	\N	\N	1013
2617	1	8010690148977	0	Admin	2023-10-24	\N	\N	1146
2618	1	8010690149004	0	Admin	2023-10-24	\N	\N	1147
2619	1	8010690149011	0	Admin	2023-10-24	\N	\N	1148
2620	1	8010690149028	0	Admin	2023-10-24	\N	\N	1151
2621	1	8010690149059	0	Admin	2023-10-24	\N	\N	1149
2622	1	8010690149066	0	Admin	2023-10-24	\N	\N	1150
2623	1	8010690149073	0	Admin	2023-10-24	\N	\N	1153
2624	1	8010690149097	0	Admin	2023-10-24	\N	\N	1154
2625	1	8010690149103	0	Admin	2023-10-24	\N	\N	1152
2626	1	8010690153100	0	Admin	2023-10-24	\N	\N	1158
2627	1	8010690153124	1	Admin	2023-10-24	\N	\N	1157
2628	1	8010690153568	0	Admin	2023-10-24	\N	\N	26
2629	1	8010690153582	0	Admin	2023-10-24	\N	\N	27
2630	1	8010690156156	0	Admin	2023-10-24	\N	\N	1179
2631	1	8010690156163	0	Admin	2023-10-24	\N	\N	1180
2632	1	8010690159270	0	Admin	2023-10-24	\N	\N	23
2633	1	8010690159782	0	Admin	2023-10-24	\N	\N	56
2634	1	8010690159867	0	Admin	2023-10-24	\N	\N	64
2635	1	8010690160443	0	Admin	2023-10-24	\N	\N	1144
2636	1	8010690160474	0	Admin	2023-10-24	\N	\N	1143
2637	1	8010690160481	0	Admin	2023-10-24	\N	\N	1145
2638	1	8010690160498	0	Admin	2023-10-24	\N	\N	984
2639	1	8010690160511	0	Admin	2023-10-24	\N	\N	1400
2640	1	8010690164670	1	Admin	2023-10-24	\N	\N	1545
2641	1	8010690166308	0	Admin	2023-10-24	\N	\N	76
2642	1	8010690166315	0	Admin	2023-10-24	\N	\N	77
2643	1	8010690166322	0	Admin	2023-10-24	\N	\N	78
2644	1	8010690166339	0	Admin	2023-10-24	\N	\N	79
2645	1	8010690166346	0	Admin	2023-10-24	\N	\N	80
2646	1	8010690166353	0	Admin	2023-10-24	\N	\N	81
2647	1	8010690166360	0	Admin	2023-10-24	\N	\N	82
2648	1	8010690166377	0	Admin	2023-10-24	\N	\N	83
2649	1	8010690168821	0	Admin	2023-10-24	\N	\N	980
2650	1	8010690172033	0	Admin	2023-10-24	\N	\N	1014
2651	1	8010690175331	0	Admin	2023-10-24	\N	\N	1552
2652	1	8010690175355	0	Admin	2023-10-24	\N	\N	33
2653	1	8010690175362	0	Admin	2023-10-24	\N	\N	34
2654	1	8010690175379	0	Admin	2023-10-24	\N	\N	35
2655	1	8010690175386	0	Admin	2023-10-24	\N	\N	36
2656	1	8010690175409	0	Admin	2023-10-24	\N	\N	37
2657	1	8010690175416	0	Admin	2023-10-24	\N	\N	38
2658	1	8010690175423	0	Admin	2023-10-24	\N	\N	986
2659	1	8010690175454	0	Admin	2023-10-24	\N	\N	988
2660	1	8010690175478	0	Admin	2023-10-24	\N	\N	989
2661	1	8010690175485	0	Admin	2023-10-24	\N	\N	39
2662	1	8010690175492	0	Admin	2023-10-24	\N	\N	990
2663	1	8010690175508	0	Admin	2023-10-24	\N	\N	40
2664	1	8010690175515	0	Admin	2023-10-24	\N	\N	84
2665	1	8010690175522	0	Admin	2023-10-24	\N	\N	85
2666	1	8010690175546	0	Admin	2023-10-24	\N	\N	1537
2667	1	8010690175553	0	Admin	2023-10-24	\N	\N	86
2668	1	8010690175577	0	Admin	2023-10-24	\N	\N	87
2669	1	8010690175584	0	Admin	2023-10-24	\N	\N	88
2670	1	8010690176161	0	Admin	2023-10-24	\N	\N	119
2671	1	8010690176178	0	Admin	2023-10-24	\N	\N	120
2672	1	8010690176208	0	Admin	2023-10-24	\N	\N	121
2673	1	8010690176215	0	Admin	2023-10-24	\N	\N	122
2674	1	8010690176222	0	Admin	2023-10-24	\N	\N	123
2675	1	8010690176260	0	Admin	2023-10-24	\N	\N	124
2676	1	8010690176277	0	Admin	2023-10-24	\N	\N	125
2677	1	8010690176307	0	Admin	2023-10-24	\N	\N	126
2678	1	8010690179445	0	Admin	2023-10-24	\N	\N	1536
2679	1	8010690180076	0	Admin	2023-10-24	\N	\N	998
2680	1	8010690180106	0	Admin	2023-10-24	\N	\N	999
2681	1	8010690180137	0	Admin	2023-10-24	\N	\N	1000
2682	1	8010690180168	0	Admin	2023-10-24	\N	\N	1001
2683	1	8010690180182	0	Admin	2023-10-24	\N	\N	1002
2684	1	8010690180755	0	Admin	2023-10-24	\N	\N	30
2685	1	8010690191065	0	Admin	2023-10-24	\N	\N	1527
2686	1	8010690191089	0	Admin	2023-10-24	\N	\N	1528
2687	1	81	0	Admin	2023-10-24	\N	\N	829
2688	1	811794010850	0	Admin	2023-10-24	\N	\N	1087
2689	1	811794010898	0	Admin	2023-10-24	\N	\N	1432
2690	1	82	7	Admin	2023-10-24	\N	\N	830
2691	1	83	3	Admin	2023-10-24	\N	\N	831
2692	1	84	0	Admin	2023-10-24	\N	\N	832
2693	1	8410650150130	0	Admin	2023-10-24	\N	\N	1480
2694	1	8410650150147	0	Admin	2023-10-24	\N	\N	690
2695	1	8410650150185	0	Admin	2023-10-24	\N	\N	1592
2696	1	8410650150192	0	Admin	2023-10-24	\N	\N	691
2697	1	8410650150253	3	Admin	2023-10-24	\N	\N	1205
2698	1	8410650151892	2	Admin	2023-10-24	\N	\N	1206
2699	1	8410650151946	0	Admin	2023-10-24	\N	\N	1207
2700	1	8410650152264	2	Admin	2023-10-24	\N	\N	693
2701	1	8410650152288	0	Admin	2023-10-24	\N	\N	1200
2702	1	8410650152301	2	Admin	2023-10-24	\N	\N	1204
2703	1	8410650152325	4	Admin	2023-10-24	\N	\N	695
2704	1	8410650152363	0	Admin	2023-10-24	\N	\N	1203
2705	1	8410650152400	4	Admin	2023-10-24	\N	\N	699
2706	1	8410650152448	1	Admin	2023-10-24	\N	\N	698
2707	1	8410650160474	0	Admin	2023-10-24	\N	\N	1557
2708	1	8410650167817	0	Admin	2023-10-24	\N	\N	694
2709	1	8410650168104	0	Admin	2023-10-24	\N	\N	1199
2710	1	8410650168128	0	Admin	2023-10-24	\N	\N	1201
2711	1	8410650170695	7	Admin	2023-10-24	\N	\N	692
2712	1	8410650170718	1	Admin	2023-10-24	\N	\N	1202
2713	1	8410650218649	5	Admin	2023-10-24	\N	\N	696
2714	1	8410650239132	3	Admin	2023-10-24	\N	\N	697
2715	1	842704100095	1	Admin	2023-10-24	\N	\N	834
2716	1	842704100743	0	Admin	2023-10-24	\N	\N	833
2717	1	8433042001582	0	Admin	2023-10-24	\N	\N	1450
2718	1	8436001971605	0	Admin	2023-10-24	\N	\N	793
2719	1	8436001971612	1	Admin	2023-10-24	\N	\N	1635
2720	1	8436001971643	0	Admin	2023-10-24	\N	\N	791
2721	1	8436001971650	1	Admin	2023-10-24	\N	\N	794
2722	1	8436001971681	1	Admin	2023-10-24	\N	\N	792
2723	1	8436001971704	1	Admin	2023-10-24	\N	\N	796
2724	1	8436001971728	1	Admin	2023-10-24	\N	\N	795
2725	1	8436532730030	2	Admin	2023-10-24	\N	\N	853
2726	1	8436532730047	0	Admin	2023-10-24	\N	\N	854
2727	1	8436532730122	1	Admin	2023-10-24	\N	\N	1279
2728	1	8436532730139	3	Admin	2023-10-24	\N	\N	1455
2729	1	8436532730146	1	Admin	2023-10-24	\N	\N	1280
2730	1	8436532730252	2	Admin	2023-10-24	\N	\N	1281
2731	1	8436532730412	0	Admin	2023-10-24	\N	\N	1456
2732	1	8436532730665	3	Admin	2023-10-24	\N	\N	855
2733	1	8470000397516	1	Admin	2023-10-24	\N	\N	1627
2734	1	8470000491269	1	Admin	2023-10-24	\N	\N	1619
2735	1	8470000493195	1	Admin	2023-10-24	\N	\N	1620
2736	1	8470000647512	0	Admin	2023-10-24	\N	\N	1500
2737	1	8470000957512	1	Admin	2023-10-24	\N	\N	1626
2738	1	847922021016	0	Admin	2023-10-24	\N	\N	1003
2739	1	847922021115	1	Admin	2023-10-24	\N	\N	1630
2740	1	847922021191	0	Admin	2023-10-24	\N	\N	1139
2741	1	847922021559	0	Admin	2023-10-24	\N	\N	1004
2742	1	847922021580	0	Admin	2023-10-24	\N	\N	1005
2743	1	847922021610	0	Admin	2023-10-24	\N	\N	1006
2744	1	847922024031	2	Admin	2023-10-24	\N	\N	976
2745	1	847922024048	1	Admin	2023-10-24	\N	\N	977
2746	1	847922027438	0	Admin	2023-10-24	\N	\N	978
2747	1	847922028084	0	Admin	2023-10-24	\N	\N	979
2748	1	847922075613	1	Admin	2023-10-24	\N	\N	161
2749	1	8699245857306	0	Admin	2023-10-24	\N	\N	1379
2750	1	8699245857313	0	Admin	2023-10-24	\N	\N	908
2751	1	8699245857337	0	Admin	2023-10-24	\N	\N	907
2752	1	8699245857351	1	Admin	2023-10-24	\N	\N	1380
2753	1	8699245857399	1	Admin	2023-10-24	\N	\N	1378
2754	1	8699245857405	2	Admin	2023-10-24	\N	\N	909
2755	1	8699245857429	1	Admin	2023-10-24	\N	\N	910
2756	1	8699245857443	2	Admin	2023-10-24	\N	\N	1381
2757	1	8713184080653	12	Admin	2023-10-24	\N	\N	1445
2758	1	8713184134349	1	Admin	2023-10-24	\N	\N	665
2759	1	8713184135278	10	Admin	2023-10-24	\N	\N	666
2760	1	8713184135285	11	Admin	2023-10-24	\N	\N	667
2761	1	8713184135292	15	Admin	2023-10-24	\N	\N	668
2762	1	8713184141408	1	Admin	2023-10-24	\N	\N	669
2763	1	8886467510229	0	Admin	2023-10-24	\N	\N	165
2764	1	8886467510236	0	Admin	2023-10-24	\N	\N	166
2765	1	8886467510250	0	Admin	2023-10-24	\N	\N	167
2766	1	8886467510267	0	Admin	2023-10-24	\N	\N	168
2767	1	8886467510281	0	Admin	2023-10-24	\N	\N	169
2768	1	8886467510311	0	Admin	2023-10-24	\N	\N	170
2769	1	8886467510328	0	Admin	2023-10-24	\N	\N	171
2770	1	8886467510335	0	Admin	2023-10-24	\N	\N	172
2771	1	8886467510410	1	Admin	2023-10-24	\N	\N	173
2772	1	8886467510427	0	Admin	2023-10-24	\N	\N	174
2773	1	8886467510434	0	Admin	2023-10-24	\N	\N	175
2774	1	8886467510441	0	Admin	2023-10-24	\N	\N	176
2775	1	8886467510458	0	Admin	2023-10-24	\N	\N	177
2776	1	8886467510465	0	Admin	2023-10-24	\N	\N	178
2777	1	8886467510588	0	Admin	2023-10-24	\N	\N	179
2778	1	8886467510724	0	Admin	2023-10-24	\N	\N	180
2779	1	8886467510755	0	Admin	2023-10-24	\N	\N	19
2780	1	8886467510830	0	Admin	2023-10-24	\N	\N	181
2781	1	8886467514210	0	Admin	2023-10-24	\N	\N	182
2782	1	8886467514401	0	Admin	2023-10-24	\N	\N	183
2783	1	8886467514418	0	Admin	2023-10-24	\N	\N	184
2784	1	8886467514425	0	Admin	2023-10-24	\N	\N	185
2785	1	8886467514463	0	Admin	2023-10-24	\N	\N	197
2786	1	8886467514470	0	Admin	2023-10-24	\N	\N	186
2787	1	8886467514487	0	Admin	2023-10-24	\N	\N	187
2788	1	8886467514494	0	Admin	2023-10-24	\N	\N	188
2789	1	8886467514579	0	Admin	2023-10-24	\N	\N	189
2790	1	8886467514616	0	Admin	2023-10-24	\N	\N	190
2791	1	8886467514623	0	Admin	2023-10-24	\N	\N	191
2792	1	8886467514630	0	Admin	2023-10-24	\N	\N	192
2793	1	8886467514647	0	Admin	2023-10-24	\N	\N	193
2794	1	8886467514654	0	Admin	2023-10-24	\N	\N	194
2795	1	8886467514661	0	Admin	2023-10-24	\N	\N	195
2796	1	8886467514678	0	Admin	2023-10-24	\N	\N	196
2797	1	8886467514685	0	Admin	2023-10-24	\N	\N	198
2798	1	8886467514692	0	Admin	2023-10-24	\N	\N	199
2799	1	8886467514715	0	Admin	2023-10-24	\N	\N	200
2800	1	8886467514722	0	Admin	2023-10-24	\N	\N	905
2801	1	8886467514739	0	Admin	2023-10-24	\N	\N	201
2802	1	8886467514746	0	Admin	2023-10-24	\N	\N	202
2803	1	8886467514760	0	Admin	2023-10-24	\N	\N	203
2804	1	8886467514814	0	Admin	2023-10-24	\N	\N	204
2805	1	8886467514821	0	Admin	2023-10-24	\N	\N	205
2806	1	8886467514906	0	Admin	2023-10-24	\N	\N	206
2807	1	8886467514920	0	Admin	2023-10-24	\N	\N	207
2808	1	8886467515521	0	Admin	2023-10-24	\N	\N	1385
2809	1	8886467515644	1	Admin	2023-10-24	\N	\N	208
2810	1	8886467515811	0	Admin	2023-10-24	\N	\N	209
2811	1	8886467515866	0	Admin	2023-10-24	\N	\N	210
2812	1	8886467515897	0	Admin	2023-10-24	\N	\N	211
2813	1	8886467515927	0	Admin	2023-10-24	\N	\N	212
2814	1	8886467515934	0	Admin	2023-10-24	\N	\N	213
2815	1	8886467515965	1	Admin	2023-10-24	\N	\N	214
2816	1	8886467520112	0	Admin	2023-10-24	\N	\N	215
2817	1	8886467520129	0	Admin	2023-10-24	\N	\N	216
2818	1	8886467520136	0	Admin	2023-10-24	\N	\N	217
2819	1	88864675201368886467520136	0	Admin	2023-10-24	\N	\N	1614
2820	1	8886467520143	0	Admin	2023-10-24	\N	\N	218
2821	1	8886467520150	0	Admin	2023-10-24	\N	\N	219
2822	1	8886467523212	0	Admin	2023-10-24	\N	\N	220
2823	1	8886467523229	0	Admin	2023-10-24	\N	\N	221
2824	1	8886467523236	0	Admin	2023-10-24	\N	\N	222
2825	1	8886467523243	0	Admin	2023-10-24	\N	\N	223
2826	1	8886467523250	0	Admin	2023-10-24	\N	\N	224
2827	1	8886467523267	0	Admin	2023-10-24	\N	\N	225
2828	1	8886467523274	0	Admin	2023-10-24	\N	\N	226
2829	1	8886467523298	0	Admin	2023-10-24	\N	\N	228
2830	1	8886467523311	0	Admin	2023-10-24	\N	\N	227
2831	1	8886467523328	0	Admin	2023-10-24	\N	\N	229
2832	1	8886467523335	0	Admin	2023-10-24	\N	\N	230
2833	1	8886467523342	0	Admin	2023-10-24	\N	\N	231
2834	1	8886467523356	0	Admin	2023-10-24	\N	\N	1075
2835	1	8886467523359	0	Admin	2023-10-24	\N	\N	232
2836	1	8886467523366	0	Admin	2023-10-24	\N	\N	233
2837	1	8886467523373	0	Admin	2023-10-24	\N	\N	234
2838	1	8886467523380	0	Admin	2023-10-24	\N	\N	235
2839	1	8886467523397	0	Admin	2023-10-24	\N	\N	236
2840	1	8886467523410	0	Admin	2023-10-24	\N	\N	237
2841	1	8886467523427	0	Admin	2023-10-24	\N	\N	238
2842	1	8886467523434	0	Admin	2023-10-24	\N	\N	239
2843	1	8886467523441	0	Admin	2023-10-24	\N	\N	240
2844	1	8886467523458	0	Admin	2023-10-24	\N	\N	241
2845	1	8886467523465	0	Admin	2023-10-24	\N	\N	242
2846	1	8886467523472	0	Admin	2023-10-24	\N	\N	243
2847	1	8886467523489	0	Admin	2023-10-24	\N	\N	244
2848	1	8886467523496	0	Admin	2023-10-24	\N	\N	245
2849	1	8886467523625	0	Admin	2023-10-24	\N	\N	246
2850	1	8886467523632	0	Admin	2023-10-24	\N	\N	247
2851	1	8886467523649	0	Admin	2023-10-24	\N	\N	248
2852	1	8886467523823	0	Admin	2023-10-24	\N	\N	992
2853	1	8886467523830	0	Admin	2023-10-24	\N	\N	993
2854	1	8886467523847	0	Admin	2023-10-24	\N	\N	994
2855	1	8886467525018	0	Admin	2023-10-24	\N	\N	249
2856	1	8886467525049	0	Admin	2023-10-24	\N	\N	250
2857	1	8886467525117	0	Admin	2023-10-24	\N	\N	251
2858	1	8886467525124	0	Admin	2023-10-24	\N	\N	252
2859	1	8886467525322	0	Admin	2023-10-24	\N	\N	253
2860	1	8886467525339	0	Admin	2023-10-24	\N	\N	254
2861	1	8886467525346	0	Admin	2023-10-24	\N	\N	255
2862	1	8886467525353	0	Admin	2023-10-24	\N	\N	256
2863	1	8886467525711	0	Admin	2023-10-24	\N	\N	257
2864	1	8886467525735	0	Admin	2023-10-24	\N	\N	258
2865	1	8886467525742	0	Admin	2023-10-24	\N	\N	259
2866	1	8886467525759	0	Admin	2023-10-24	\N	\N	260
2867	1	8886467529719	0	Admin	2023-10-24	\N	\N	261
2868	1	8886467529726	0	Admin	2023-10-24	\N	\N	262
2869	1	8886467529733	0	Admin	2023-10-24	\N	\N	263
2870	1	8886467529740	0	Admin	2023-10-24	\N	\N	264
2871	1	8886467530067	0	Admin	2023-10-24	\N	\N	265
2872	1	8886467530128	0	Admin	2023-10-24	\N	\N	266
2873	1	8886467530135	0	Admin	2023-10-24	\N	\N	267
2874	1	8886467530142	0	Admin	2023-10-24	\N	\N	268
2875	1	8886467530159	0	Admin	2023-10-24	\N	\N	269
2876	1	8886467530302	0	Admin	2023-10-24	\N	\N	270
2877	1	8886467530319	0	Admin	2023-10-24	\N	\N	271
2878	1	8886467530326	0	Admin	2023-10-24	\N	\N	272
2879	1	8886467530333	0	Admin	2023-10-24	\N	\N	273
2880	1	8886467530340	0	Admin	2023-10-24	\N	\N	274
2881	1	8886467530364	0	Admin	2023-10-24	\N	\N	275
2882	1	8886467530371	0	Admin	2023-10-24	\N	\N	276
2883	1	8886467530388	0	Admin	2023-10-24	\N	\N	277
2884	1	8886467530500	0	Admin	2023-10-24	\N	\N	278
2885	1	8886467531019	0	Admin	2023-10-24	\N	\N	279
2886	1	8886467531026	0	Admin	2023-10-24	\N	\N	280
2887	1	8886467531033	0	Admin	2023-10-24	\N	\N	281
2888	1	8886467531040	0	Admin	2023-10-24	\N	\N	282
2889	1	8886467532115	0	Admin	2023-10-24	\N	\N	283
2890	1	8886467532122	0	Admin	2023-10-24	\N	\N	906
2891	1	8886467532139	0	Admin	2023-10-24	\N	\N	284
2892	1	8886467532160	0	Admin	2023-10-24	\N	\N	285
2893	1	8886467532177	0	Admin	2023-10-24	\N	\N	286
2894	1	8886467532214	0	Admin	2023-10-24	\N	\N	287
2895	1	8886467532221	0	Admin	2023-10-24	\N	\N	288
2896	1	8886467532238	1	Admin	2023-10-24	\N	\N	289
2897	1	8886467532269	0	Admin	2023-10-24	\N	\N	290
2898	1	8886467532276	0	Admin	2023-10-24	\N	\N	291
2899	1	8886467532313	0	Admin	2023-10-24	\N	\N	292
2900	1	8886467532320	0	Admin	2023-10-24	\N	\N	293
2901	1	8886467532337	0	Admin	2023-10-24	\N	\N	294
2902	1	8886467532368	0	Admin	2023-10-24	\N	\N	295
2903	1	8886467532375	0	Admin	2023-10-24	\N	\N	296
2904	1	8886467532412	0	Admin	2023-10-24	\N	\N	297
2905	1	8886467532429	0	Admin	2023-10-24	\N	\N	298
2906	1	8886467532436	0	Admin	2023-10-24	\N	\N	299
2907	1	8886467532450	0	Admin	2023-10-24	\N	\N	300
2908	1	8886467532467	0	Admin	2023-10-24	\N	\N	301
2909	1	8886467532474	0	Admin	2023-10-24	\N	\N	302
2910	1	8886467532511	0	Admin	2023-10-24	\N	\N	303
2911	1	8886467532528	0	Admin	2023-10-24	\N	\N	304
2912	1	8886467532535	0	Admin	2023-10-24	\N	\N	305
2913	1	8886467532559	0	Admin	2023-10-24	\N	\N	306
2914	1	8886467532566	0	Admin	2023-10-24	\N	\N	307
2915	1	8886467532573	0	Admin	2023-10-24	\N	\N	308
2916	1	8886467532634	0	Admin	2023-10-24	\N	\N	309
2917	1	8886467535222	0	Admin	2023-10-24	\N	\N	310
2918	1	8886467535239	0	Admin	2023-10-24	\N	\N	311
2919	1	8886467535246	0	Admin	2023-10-24	\N	\N	312
2920	1	8886467535321	0	Admin	2023-10-24	\N	\N	313
2921	1	8886467535413	0	Admin	2023-10-24	\N	\N	314
2922	1	8886467535420	0	Admin	2023-10-24	\N	\N	315
2923	1	8886467535437	0	Admin	2023-10-24	\N	\N	316
2924	1	8886467535536	0	Admin	2023-10-24	\N	\N	317
2925	1	8886467535543	0	Admin	2023-10-24	\N	\N	318
2926	1	8886467535611	0	Admin	2023-10-24	\N	\N	319
2927	1	8886467535628	0	Admin	2023-10-24	\N	\N	320
2928	1	8886467535635	0	Admin	2023-10-24	\N	\N	321
2929	1	8886467535642	0	Admin	2023-10-24	\N	\N	322
2930	1	8886467541018	0	Admin	2023-10-24	\N	\N	323
2931	1	8886467541025	0	Admin	2023-10-24	\N	\N	324
2932	1	8886467541032	0	Admin	2023-10-24	\N	\N	325
2933	1	8886467541117	0	Admin	2023-10-24	\N	\N	935
2934	1	8886467541124	0	Admin	2023-10-24	\N	\N	326
2935	1	8886467541131	0	Admin	2023-10-24	\N	\N	1156
2936	1	8886467541148	0	Admin	2023-10-24	\N	\N	327
2937	1	8886467544712	0	Admin	2023-10-24	\N	\N	328
2938	1	8886467545030	0	Admin	2023-10-24	\N	\N	329
2939	1	8886467545047	0	Admin	2023-10-24	\N	\N	330
2940	1	8886467545054	0	Admin	2023-10-24	\N	\N	331
2941	1	8886467545061	0	Admin	2023-10-24	\N	\N	332
2942	1	8886467545078	0	Admin	2023-10-24	\N	\N	333
2943	1	8886467545085	0	Admin	2023-10-24	\N	\N	334
2944	1	8886467545399	1	Admin	2023-10-24	\N	\N	335
2945	1	8886467545412	0	Admin	2023-10-24	\N	\N	1140
2946	1	8886467545467	0	Admin	2023-10-24	\N	\N	336
2947	1	8886467545542	0	Admin	2023-10-24	\N	\N	995
2948	1	8886467545702	0	Admin	2023-10-24	\N	\N	337
2949	1	8886467545719	0	Admin	2023-10-24	\N	\N	338
2950	1	8886467545726	0	Admin	2023-10-24	\N	\N	339
2951	1	8886467546013	0	Admin	2023-10-24	\N	\N	340
2952	1	8886467546037	0	Admin	2023-10-24	\N	\N	341
2953	1	8886467546044	0	Admin	2023-10-24	\N	\N	342
2954	1	8886467546198	0	Admin	2023-10-24	\N	\N	343
2955	1	8886467546211	0	Admin	2023-10-24	\N	\N	344
2956	1	8886467546327	0	Admin	2023-10-24	\N	\N	162
2957	1	8886467546334	0	Admin	2023-10-24	\N	\N	345
2958	1	8886467546341	0	Admin	2023-10-24	\N	\N	163
2959	1	8886467546617	1	Admin	2023-10-24	\N	\N	346
2960	1	8886467546648	0	Admin	2023-10-24	\N	\N	996
2961	1	8886467546655	0	Admin	2023-10-24	\N	\N	974
2962	1	8886467546662	0	Admin	2023-10-24	\N	\N	973
2963	1	8886467546969	0	Admin	2023-10-24	\N	\N	975
2964	1	8886467547546	0	Admin	2023-10-24	\N	\N	347
2965	1	8886467548512	0	Admin	2023-10-24	\N	\N	348
2966	1	8886467548536	0	Admin	2023-10-24	\N	\N	349
2967	1	8886467548710	0	Admin	2023-10-24	\N	\N	350
2968	1	8886467548772	0	Admin	2023-10-24	\N	\N	351
2969	1	8886467548789	0	Admin	2023-10-24	\N	\N	352
2970	1	8886467548796	0	Admin	2023-10-24	\N	\N	353
2971	1	8886467548826	0	Admin	2023-10-24	\N	\N	354
2972	1	8886467548840	0	Admin	2023-10-24	\N	\N	355
2973	1	8886467548864	0	Admin	2023-10-24	\N	\N	356
2974	1	8886467548888	0	Admin	2023-10-24	\N	\N	357
2975	1	8886467548925	0	Admin	2023-10-24	\N	\N	358
2976	1	8886467548932	0	Admin	2023-10-24	\N	\N	359
2977	1	8886467548949	0	Admin	2023-10-24	\N	\N	360
2978	1	8886467580000	0	Admin	2023-10-24	\N	\N	361
2979	1	8886467580017	1	Admin	2023-10-24	\N	\N	362
2980	1	8886467580024	0	Admin	2023-10-24	\N	\N	363
2981	1	8886467580062	0	Admin	2023-10-24	\N	\N	364
2982	1	8886467580079	0	Admin	2023-10-24	\N	\N	365
2983	1	8886467580086	0	Admin	2023-10-24	\N	\N	366
2984	1	8886467580093	0	Admin	2023-10-24	\N	\N	367
2985	1	8886467580109	0	Admin	2023-10-24	\N	\N	368
2986	1	8886467580116	0	Admin	2023-10-24	\N	\N	369
2987	1	8886467580147	0	Admin	2023-10-24	\N	\N	370
2988	1	8886467580161	0	Admin	2023-10-24	\N	\N	371
2989	1	8886467580178	0	Admin	2023-10-24	\N	\N	372
2990	1	8886467580185	1	Admin	2023-10-24	\N	\N	373
2991	1	8886467580208	1	Admin	2023-10-24	\N	\N	374
2992	1	8886467580215	0	Admin	2023-10-24	\N	\N	375
2993	1	8886467580222	0	Admin	2023-10-24	\N	\N	376
2994	1	8886467580413	0	Admin	2023-10-24	\N	\N	377
2995	1	8886467581465	1	Admin	2023-10-24	\N	\N	972
2996	1	8886467582059	0	Admin	2023-10-24	\N	\N	378
2997	1	8886467584954	0	Admin	2023-10-24	\N	\N	379
2998	1	8886467584961	0	Admin	2023-10-24	\N	\N	380
2999	1	8886467585814	0	Admin	2023-10-24	\N	\N	381
3000	1	8886467585913	0	Admin	2023-10-24	\N	\N	382
3001	1	8886467586347	0	Admin	2023-10-24	\N	\N	383
3002	1	8886467589010	0	Admin	2023-10-24	\N	\N	384
3003	1	8886467589317	0	Admin	2023-10-24	\N	\N	385
3004	1	8886467589478	0	Admin	2023-10-24	\N	\N	386
3005	1	8886467589485	0	Admin	2023-10-24	\N	\N	387
3006	1	8900950297173	0	Admin	2023-10-24	\N	\N	1304
3007	1	8900950297180	0	Admin	2023-10-24	\N	\N	1303
3008	1	8901138501242	2	Admin	2023-10-24	\N	\N	723
3009	1	8901138501297	6	Admin	2023-10-24	\N	\N	724
3010	1	8901138511333	2	Admin	2023-10-24	\N	\N	721
3011	1	8901138511340	0	Admin	2023-10-24	\N	\N	722
3012	1	90	12	Admin	2023-10-24	\N	\N	945
3013	1	9003579000519	0	Admin	2023-10-24	\N	\N	392
3014	1	9003579000748	0	Admin	2023-10-24	\N	\N	419
3015	1	9003579001172	0	Admin	2023-10-24	\N	\N	1083
3016	1	9003579013557	1	Admin	2023-10-24	\N	\N	1099
3017	1	9003579018514	1	Admin	2023-10-24	\N	\N	1097
3018	1	9003579018866	1	Admin	2023-10-24	\N	\N	1177
3019	1	9003579018941	1	Admin	2023-10-24	\N	\N	1176
3020	1	9003579307717	1	Admin	2023-10-24	\N	\N	423
3021	1	9003579308936	0	Admin	2023-10-24	\N	\N	1090
3022	1	9003579308943	10	Admin	2023-10-24	\N	\N	424
3023	1	9003579309445	10	Admin	2023-10-24	\N	\N	429
3024	1	9003579309469	3	Admin	2023-10-24	\N	\N	400
3025	1	9003579310632	8	Admin	2023-10-24	\N	\N	404
3026	1	9003579311004	2	Admin	2023-10-24	\N	\N	444
3027	1	9003579311462	1	Admin	2023-10-24	\N	\N	422
3028	1	9003579311851	0	Admin	2023-10-24	\N	\N	435
3029	1	91009	1	Admin	2023-10-24	\N	\N	1488
3030	1	91012	0	Admin	2023-10-24	\N	\N	1490
3031	1	91013	0	Admin	2023-10-24	\N	\N	1491
3032	1	91015	1	Admin	2023-10-24	\N	\N	1489
3033	1	911emergencia	0	Admin	2023-10-24	\N	\N	1343
3034	1	9333527021861	0	Admin	2023-10-24	\N	\N	1481
3035	1	9333527230447	0	Admin	2023-10-24	\N	\N	1093
3036	1	9333527329240	0	Admin	2023-10-24	\N	\N	1085
3037	1	9333527329257	0	Admin	2023-10-24	\N	\N	1094
3038	1	9333527341037	1	Admin	2023-10-24	\N	\N	1107
3039	1	9333527377852	0	Admin	2023-10-24	\N	\N	1084
3040	1	9333527426642	0	Admin	2023-10-24	\N	\N	1092
3041	1	9333527443670	0	Admin	2023-10-24	\N	\N	1089
3042	1	9333527586469	0	Admin	2023-10-24	\N	\N	1095
3043	1	9505903	1	Admin	2023-10-24	\N	\N	1268
3044	1	9505904	1	Admin	2023-10-24	\N	\N	1266
3045	1	9505905	0	Admin	2023-10-24	\N	\N	1265
3046	1	99-26191	1	Admin	2023-10-24	\N	\N	1244
3047	1	A1014	0	Admin	2023-10-24	\N	\N	625
3048	1	AB01S	0	Admin	2023-10-24	\N	\N	1296
3049	1	AB02M	0	Admin	2023-10-24	\N	\N	1297
3050	1	AB03L	0	Admin	2023-10-24	\N	\N	1298
3051	1	AC01	0	Admin	2023-10-24	\N	\N	1192
3052	1	AC01S	0	Admin	2023-10-24	\N	\N	1320
3053	1	AC02M	0	Admin	2023-10-24	\N	\N	1230
3054	1	AF001S	0	Admin	2023-10-24	\N	\N	1603
3055	1	ALP001	0	Admin	2023-10-24	\N	\N	741
3056	1	AMOXITABS250	0	Admin	2023-10-24	\N	\N	1513
3057	1	ANXIVET	1	Admin	2023-10-24	\N	\N	1170
3058	1	ARTROVET	0	Admin	2023-10-24	\N	\N	1168
3059	1	Atropina01	0	Admin	2023-10-24	\N	\N	516
3060	1	AUMENTA	0	Admin	2023-10-24	\N	\N	1558
3061	1	BAEP00	0	Admin	2023-10-24	\N	\N	558
3062	1	BAN0	0	Admin	2023-10-24	\N	\N	559
3063	1	BC1050032021	0	Admin	2023-10-24	\N	\N	628
3064	1	BCTH2101C	0	Admin	2023-10-24	\N	\N	1606
3065	1	BHL001	1	Admin	2023-10-24	\N	\N	1421
3066	1	BHM001	0	Admin	2023-10-24	\N	\N	1422
3067	1	BHS001	2	Admin	2023-10-24	\N	\N	1423
3068	1	BHXS001	0	Admin	2023-10-24	\N	\N	1424
3069	1	BL01-S	0	Admin	2023-10-24	\N	\N	1346
3070	1	BL-02	0	Admin	2023-10-24	\N	\N	1182
3071	1	BL02-M	0	Admin	2023-10-24	\N	\N	1347
3072	1	BL03-L	0	Admin	2023-10-24	\N	\N	1348
3073	1	BL04-XL	0	Admin	2023-10-24	\N	\N	1349
3074	1	BOSAL#0	0	Admin	2023-10-24	\N	\N	1232
3075	1	BROADLINE	1	Admin	2023-10-24	\N	\N	777
3076	1	BVL001	1	Admin	2023-10-24	\N	\N	1425
3077	1	BVM001	2	Admin	2023-10-24	\N	\N	1426
3078	1	BVS001	0	Admin	2023-10-24	\N	\N	1427
3079	1	C20-M	0	Admin	2023-10-24	\N	\N	602
3080	1	C20-S	0	Admin	2023-10-24	\N	\N	601
3081	1	C20-XL	0	Admin	2023-10-24	\N	\N	603
3082	1	C21-L	0	Admin	2023-10-24	\N	\N	606
3083	1	C21-M	0	Admin	2023-10-24	\N	\N	605
3084	1	C21-S	0	Admin	2023-10-24	\N	\N	604
3085	1	C21-XL	0	Admin	2023-10-24	\N	\N	607
3086	1	C22-1	0	Admin	2023-10-24	\N	\N	1248
3087	1	C22-2	0	Admin	2023-10-24	\N	\N	1249
3088	1	C22-3	0	Admin	2023-10-24	\N	\N	1250
3089	1	CAM2030	0	Admin	2023-10-24	\N	\N	568
3090	1	CAM2435	1	Admin	2023-10-24	\N	\N	570
3091	1	CAM2840	0	Admin	2023-10-24	\N	\N	572
3092	1	cardiovet	0	Admin	2023-10-24	\N	\N	1171
3093	1	CARPRODYL100	20	Admin	2023-10-24	\N	\N	1515
3094	1	CARPRODYL25	0	Admin	2023-10-24	\N	\N	1506
3095	1	CD02M	0	Admin	2023-10-24	\N	\N	1308
3096	1	CD03L	0	Admin	2023-10-24	\N	\N	1309
3097	1	CefaCure	3	Admin	2023-10-24	\N	\N	659
3098	1	CIPROTABS250	0	Admin	2023-10-24	\N	\N	1507
3099	1	CORTA3807	1	Admin	2023-10-24	\N	\N	1227
3100	1	DE013-M	1	Admin	2023-10-24	\N	\N	595
3101	1	doramectina	1	Admin	2023-10-24	\N	\N	1174
3102	1	Dufamox15	3	Admin	2023-10-24	\N	\N	524
3103	1	FARM044	0	Admin	2023-10-24	\N	\N	1079
3104	1	FARM046	0	Admin	2023-10-24	\N	\N	1080
3105	1	FARM141	0	Admin	2023-10-24	\N	\N	1081
3106	1	FC088	0	Admin	2023-10-24	\N	\N	1197
3107	1	FG01-S	0	Admin	2023-10-24	\N	\N	1350
3108	1	FG02-M	0	Admin	2023-10-24	\N	\N	1351
3109	1	FG03-L	0	Admin	2023-10-24	\N	\N	1352
3110	1	FG04XL	0	Admin	2023-10-24	\N	\N	1353
3111	1	FGEZ1002	0	Admin	2023-10-24	\N	\N	1608
3112	1	G003	0	Admin	2023-10-24	\N	\N	1605
3113	1	G0M3101S	0	Admin	2023-10-24	\N	\N	1600
3114	1	G0M3102M	0	Admin	2023-10-24	\N	\N	1609
3115	1	gentamicina	0	Admin	2023-10-24	\N	\N	1175
3116	1	H2-S	0	Admin	2023-10-24	\N	\N	608
3117	1	H3-L	0	Admin	2023-10-24	\N	\N	611
3118	1	H3-M	0	Admin	2023-10-24	\N	\N	610
3119	1	H3-S	0	Admin	2023-10-24	\N	\N	609
3120	1	H3-XL	0	Admin	2023-10-24	\N	\N	612
3121	1	H4-L	0	Admin	2023-10-24	\N	\N	614
3122	1	H4-M	1	Admin	2023-10-24	\N	\N	613
3123	1	H4-XL	0	Admin	2023-10-24	\N	\N	615
3124	1	HEARTGARDL	1	Admin	2023-10-24	\N	\N	788
3125	1	HEARTGARDM	0	Admin	2023-10-24	\N	\N	787
3126	1	HEARTGARDS	1	Admin	2023-10-24	\N	\N	786
3127	1	HEMOVITB12	0	Admin	2023-10-24	\N	\N	729
3128	1	HEPATOVET	1	Admin	2023-10-24	\N	\N	1172
3129	1	HI01S	0	Admin	2023-10-24	\N	\N	1324
3130	1	HI02M	0	Admin	2023-10-24	\N	\N	1325
3131	1	HI03L	0	Admin	2023-10-24	\N	\N	1326
3132	1	HTB031-2	0	Admin	2023-10-24	\N	\N	586
3133	1	HTGC019	0	Admin	2023-10-24	\N	\N	557
3134	1	ij-02	0	Admin	2023-10-24	\N	\N	1181
3135	1	IJ03	0	Admin	2023-10-24	\N	\N	1241
3136	1	IP001ML	4	Admin	2023-10-24	\N	\N	546
3137	1	JD01	0	Admin	2023-10-24	\N	\N	1604
3138	1	JD02	0	Admin	2023-10-24	\N	\N	1597
3139	1	JHP951	0	Admin	2023-10-24	\N	\N	1277
3140	1	JK901L	0	Admin	2023-10-24	\N	\N	1369
3141	1	JK901M	0	Admin	2023-10-24	\N	\N	1370
3142	1	JK901S	0	Admin	2023-10-24	\N	\N	1371
3143	1	K002	0	Admin	2023-10-24	\N	\N	1235
3144	1	K9-L	0	Admin	2023-10-24	\N	\N	1240
3145	1	KD01	0	Admin	2023-10-24	\N	\N	1190
3146	1	KETOVET	12	Admin	2023-10-24	\N	\N	847
3147	1	KL01XS	0	Admin	2023-10-24	\N	\N	1310
3148	1	KL02S	0	Admin	2023-10-24	\N	\N	1311
3149	1	KL03M	0	Admin	2023-10-24	\N	\N	1312
3150	1	KL04L	0	Admin	2023-10-24	\N	\N	1313
3151	1	KL05XL	0	Admin	2023-10-24	\N	\N	1314
3152	1	KM0110MM	0	Admin	2023-10-24	\N	\N	1302
3153	1	KM0212MM	0	Admin	2023-10-24	\N	\N	1299
3154	1	KN0110MM	0	Admin	2023-10-24	\N	\N	1342
3155	1	KN0212MM	0	Admin	2023-10-24	\N	\N	1340
3156	1	KN0315MM	0	Admin	2023-10-24	\N	\N	1341
3157	1	KP01S	0	Admin	2023-10-24	\N	\N	1191
3158	1	KR01	0	Admin	2023-10-24	\N	\N	1195
3159	1	kS15MM	0	Admin	2023-10-24	\N	\N	1239
3160	1	KT01XXS	0	Admin	2023-10-24	\N	\N	1362
3161	1	KT02XS	0	Admin	2023-10-24	\N	\N	1363
3162	1	KT03S	0	Admin	2023-10-24	\N	\N	1323
3163	1	KU01XXS	0	Admin	2023-10-24	\N	\N	1338
3164	1	KU02XS	0	Admin	2023-10-24	\N	\N	1337
3165	1	KV01XXS	0	Admin	2023-10-24	\N	\N	1231
3166	1	KV03S	0	Admin	2023-10-24	\N	\N	1339
3167	1	KW01XXS	0	Admin	2023-10-24	\N	\N	1336
3168	1	KW02XS	0	Admin	2023-10-24	\N	\N	1333
3169	1	KW03S	0	Admin	2023-10-24	\N	\N	1334
3170	1	KW04M	0	Admin	2023-10-24	\N	\N	1335
3171	1	L1003	0	Admin	2023-10-24	\N	\N	598
3172	1	LM-01	0	Admin	2023-10-24	\N	\N	1185
3173	1	LM-02	0	Admin	2023-10-24	\N	\N	1186
3174	1	LM-03	0	Admin	2023-10-24	\N	\N	1187
3175	1	LM-902-L	0	Admin	2023-10-24	\N	\N	1366
3176	1	LM902M	0	Admin	2023-10-24	\N	\N	1367
3177	1	LM902S	0	Admin	2023-10-24	\N	\N	1368
3178	1	M610	0	Admin	2023-10-24	\N	\N	597
3179	1	M9D228135	1	Admin	2023-10-24	\N	\N	1114
3180	1	M9D22826	0	Admin	2023-10-24	\N	\N	1113
3181	1	M9D22838-L	0	Admin	2023-10-24	\N	\N	1110
3182	1	M9D22838-M	1	Admin	2023-10-24	\N	\N	1109
3183	1	M9D22838-S	0	Admin	2023-10-24	\N	\N	1108
3184	1	M9D22838-XL	0	Admin	2023-10-24	\N	\N	1111
3185	1	M9D22868	2	Admin	2023-10-24	\N	\N	1112
3186	1	Metronidazole	0	Admin	2023-10-24	\N	\N	861
3187	1	MN03	0	Admin	2023-10-24	\N	\N	1193
3188	1	MN05-XL	0	Admin	2023-10-24	\N	\N	1225
3189	1	MP1831	0	Admin	2023-10-24	\N	\N	1486
3190	1	MP1855	0	Admin	2023-10-24	\N	\N	1487
3191	1	MU01	0	Admin	2023-10-24	\N	\N	1229
3192	1	MU01S	0	Admin	2023-10-24	\N	\N	1364
3193	1	MU02	0	Admin	2023-10-24	\N	\N	1228
3194	1	MU02M	0	Admin	2023-10-24	\N	\N	1365
3195	1	N026I21	1	Admin	2023-10-24	\N	\N	1433
3196	1	NO02-S	0	Admin	2023-10-24	\N	\N	1359
3197	1	NO03-M	0	Admin	2023-10-24	\N	\N	1360
3198	1	NO04-L	0	Admin	2023-10-24	\N	\N	1361
3199	1	no05xl	0	Admin	2023-10-24	\N	\N	1287
3200	1	OMPASTA-01	0	Admin	2023-10-24	\N	\N	504
3201	1	OP01S	0	Admin	2023-10-24	\N	\N	1331
3202	1	OP02M	0	Admin	2023-10-24	\N	\N	1332
3203	1	OPTIVET	0	Admin	2023-10-24	\N	\N	1169
3204	1	OV115	0	Admin	2023-10-24	\N	\N	542
3205	1	P002L	1	Admin	2023-10-24	\N	\N	1636
3206	1	P1089	0	Admin	2023-10-24	\N	\N	1373
3207	1	P1118-PP-B7	0	Admin	2023-10-24	\N	\N	1196
3208	1	P518	1	Admin	2023-10-24	\N	\N	575
3209	1	P518-1	1	Admin	2023-10-24	\N	\N	574
3210	1	P519	1	Admin	2023-10-24	\N	\N	576
3211	1	P520	0	Admin	2023-10-24	\N	\N	577
3212	1	P521	0	Admin	2023-10-24	\N	\N	578
3213	1	P522	1	Admin	2023-10-24	\N	\N	579
3214	1	P523	0	Admin	2023-10-24	\N	\N	580
3215	1	P924	1	Admin	2023-10-24	\N	\N	554
3216	1	P935	0	Admin	2023-10-24	\N	\N	551
3217	1	PALETAS	1	Admin	2023-10-24	\N	\N	1640
3218	1	PEC001	0	Admin	2023-10-24	\N	\N	742
3219	1	PECH273	0	Admin	2023-10-24	\N	\N	1595
3220	1	PH2088	1	Admin	2023-10-24	\N	\N	1431
3221	1	PL01	0	Admin	2023-10-24	\N	\N	1601
3222	1	QR01	0	Admin	2023-10-24	\N	\N	1194
3223	1	QR01XS	0	Admin	2023-10-24	\N	\N	1321
3224	1	QR02	0	Admin	2023-10-24	\N	\N	1238
3225	1	QR02S	0	Admin	2023-10-24	\N	\N	1322
3226	1	quino-01	0	Admin	2023-10-24	\N	\N	456
3227	1	RANITIDINVET	16	Admin	2023-10-24	\N	\N	849
3228	1	RAR2002	0	Admin	2023-10-24	\N	\N	1607
3229	1	RS02	0	Admin	2023-10-24	\N	\N	1243
3230	1	RS02S	0	Admin	2023-10-24	\N	\N	1329
3231	1	RS03L	0	Admin	2023-10-24	\N	\N	1330
3232	1	RS03-L	0	Admin	2023-10-24	\N	\N	1226
3233	1	ST0101	48	Admin	2023-10-24	\N	\N	862
3234	1	ST01XS	0	Admin	2023-10-24	\N	\N	1315
3235	1	ST02S	0	Admin	2023-10-24	\N	\N	1316
3236	1	ST03M	0	Admin	2023-10-24	\N	\N	1317
3237	1	ST04L	0	Admin	2023-10-24	\N	\N	1318
3238	1	ST05XL	0	Admin	2023-10-24	\N	\N	1319
3239	1	stickerzone01	0	Admin	2023-10-24	\N	\N	860
3240	1	STOMORGYL10	6	Admin	2023-10-24	\N	\N	789
3241	1	SU01	0	Admin	2023-10-24	\N	\N	1233
3242	1	SU02	0	Admin	2023-10-24	\N	\N	1189
3243	1	sy-b024	0	Admin	2023-10-24	\N	\N	1384
3244	1	TORT001	0	Admin	2023-10-24	\N	\N	743
3245	1	TU01	0	Admin	2023-10-24	\N	\N	1188
3246	1	TU02	0	Admin	2023-10-24	\N	\N	1236
3247	1	TU03	0	Admin	2023-10-24	\N	\N	1237
3248	1	TU04	0	Admin	2023-10-24	\N	\N	1234
3249	1	UNGÜENTO	0	Admin	2023-10-24	\N	\N	1548
3250	1	URIVET	0	Admin	2023-10-24	\N	\N	1167
3251	1	UT01XS	0	Admin	2023-10-24	\N	\N	1328
3252	1	UT02S	0	Admin	2023-10-24	\N	\N	1327
3253	1	UT03M	0	Admin	2023-10-24	\N	\N	1289
3254	1	UT04L	0	Admin	2023-10-24	\N	\N	1290
3255	1	UT05XL	0	Admin	2023-10-24	\N	\N	1291
3256	1	UV01S	0	Admin	2023-10-24	\N	\N	1305
3257	1	UV02M	0	Admin	2023-10-24	\N	\N	1306
3258	1	UV03L	0	Admin	2023-10-24	\N	\N	1307
3259	1	UY0110MM	0	Admin	2023-10-24	\N	\N	1300
3260	1	UY0212MM	0	Admin	2023-10-24	\N	\N	1301
3261	1	VDECA0008	0	Admin	2023-10-24	\N	\N	900
3262	1	VDECA0009	0	Admin	2023-10-24	\N	\N	901
3263	1	VDECA007	0	Admin	2023-10-24	\N	\N	899
3264	1	VDEFE0001	5	Admin	2023-10-24	\N	\N	898
3265	1	VE2022115917	1	Admin	2023-10-24	\N	\N	1625
3266	1	VHL001	0	Admin	2023-10-24	\N	\N	1416
3267	1	VHM001	0	Admin	2023-10-24	\N	\N	1415
3268	1	VHS001	0	Admin	2023-10-24	\N	\N	1417
3269	1	VHTL001	1	Admin	2023-10-24	\N	\N	1418
3270	1	VHTM001	1	Admin	2023-10-24	\N	\N	1420
3271	1	VHTS001	1	Admin	2023-10-24	\N	\N	1419
3272	1	VT-01	0	Admin	2023-10-24	\N	\N	1184
3273	1	VT-02	0	Admin	2023-10-24	\N	\N	1183
3274	1	VVL001	0	Admin	2023-10-24	\N	\N	1412
3275	1	VVM001	1	Admin	2023-10-24	\N	\N	1413
3276	1	VVS001	0	Admin	2023-10-24	\N	\N	1414
3277	1	W4UNID	0	Admin	2023-10-24	\N	\N	627
3278	1	WV04L	0	Admin	2023-10-24	\N	\N	1288
3279	1	X001	0	Admin	2023-10-24	\N	\N	731
3280	1	X002	0	Admin	2023-10-24	\N	\N	730
3281	1	XW01S	0	Admin	2023-10-24	\N	\N	1292
3282	1	XW02M	0	Admin	2023-10-24	\N	\N	1293
3283	1	XW03L	0	Admin	2023-10-24	\N	\N	1294
3284	1	XW04XL	0	Admin	2023-10-24	\N	\N	1295
3285	1	ZY01S	1	Admin	2023-10-24	\N	\N	1355
3286	1	ZY02M	0	Admin	2023-10-24	\N	\N	1356
3287	1	ZY02-M	0	Admin	2023-10-24	\N	\N	1242
3288	1	ZY03L	0	Admin	2023-10-24	\N	\N	1357
3289	1	ZY04XL	0	Admin	2023-10-24	\N	\N	1358
3291	3	01	0	Admin	2023-10-24	\N	\N	552
3292	3	017800142731	0	Admin	2023-10-24	\N	\N	1575
3293	3	017800156424	0	Admin	2023-10-24	\N	\N	1577
3294	3	017800156448	0	Admin	2023-10-24	\N	\N	1576
3295	3	017800165426	0	Admin	2023-10-24	\N	\N	1386
3296	3	017800174152	0	Admin	2023-10-24	\N	\N	496
3297	3	017800174220	0	Admin	2023-10-24	\N	\N	495
3298	3	017800176262	0	Admin	2023-10-24	\N	\N	494
3299	3	018065055583	0	Admin	2023-10-24	\N	\N	746
3300	3	018065057655	0	Admin	2023-10-24	\N	\N	744
3301	3	018065057686	0	Admin	2023-10-24	\N	\N	745
3302	3	018065057792	0	Admin	2023-10-24	\N	\N	747
3303	3	018214812784	0	Admin	2023-10-24	\N	\N	718
3304	3	018214812791	0	Admin	2023-10-24	\N	\N	720
3305	3	018214816218	0	Admin	2023-10-24	\N	\N	904
3306	3	018214846307	0	Admin	2023-10-24	\N	\N	719
3307	3	020279991335	0	Admin	2023-10-24	\N	\N	1578
3308	3	020279992998	0	Admin	2023-10-24	\N	\N	882
3309	3	020279995173	0	Admin	2023-10-24	\N	\N	1078
3310	3	020279995227	0	Admin	2023-10-24	\N	\N	1077
3311	3	020531	0	Admin	2023-10-24	\N	\N	1451
3312	3	030172013829	0	Admin	2023-10-24	\N	\N	1518
3313	3	030172013850	0	Admin	2023-10-24	\N	\N	1130
3314	3	034846730012	0	Admin	2023-10-24	\N	\N	680
3315	3	034846730029	0	Admin	2023-10-24	\N	\N	679
3316	3	034846730104	0	Admin	2023-10-24	\N	\N	683
3317	3	034846730111	0	Admin	2023-10-24	\N	\N	684
3318	3	034846730227	0	Admin	2023-10-24	\N	\N	685
3319	3	034846730319	0	Admin	2023-10-24	\N	\N	682
3320	3	034846730326	0	Admin	2023-10-24	\N	\N	681
3321	3	034846730401	0	Admin	2023-10-24	\N	\N	677
3322	3	034846730418	0	Admin	2023-10-24	\N	\N	1449
3323	3	034846730500	0	Admin	2023-10-24	\N	\N	674
3324	3	034846730517	0	Admin	2023-10-24	\N	\N	675
3325	3	034846730609	0	Admin	2023-10-24	\N	\N	676
3326	3	034846730708	0	Admin	2023-10-24	\N	\N	688
3327	3	034846730715	0	Admin	2023-10-24	\N	\N	689
3328	3	034846730814	0	Admin	2023-10-24	\N	\N	687
3329	3	034846730821	0	Admin	2023-10-24	\N	\N	686
3330	3	034846730937	0	Admin	2023-10-24	\N	\N	678
3331	3	035585034003	0	Admin	2023-10-24	\N	\N	859
3332	3	035585111117	0	Admin	2023-10-24	\N	\N	858
3333	3	035585111216	0	Admin	2023-10-24	\N	\N	857
3334	3	035585111315	0	Admin	2023-10-24	\N	\N	856
3335	3	038100001306	0	Admin	2023-10-24	\N	\N	1388
3336	3	038100171207	0	Admin	2023-10-24	\N	\N	1387
3337	3	045663970062	0	Admin	2023-10-24	\N	\N	748
3338	3	045663970079	0	Admin	2023-10-24	\N	\N	714
3339	3	045663970086	0	Admin	2023-10-24	\N	\N	713
3340	3	045663970093	0	Admin	2023-10-24	\N	\N	749
3341	3	045663970109	0	Admin	2023-10-24	\N	\N	712
3342	3	045663976170	0	Admin	2023-10-24	\N	\N	1642
3343	3	045663976194	0	Admin	2023-10-24	\N	\N	1641
3344	3	052742001135	0	Admin	2023-10-24	\N	\N	881
3345	3	052742001197	0	Admin	2023-10-24	\N	\N	1470
3346	3	052742001746	0	Admin	2023-10-24	\N	\N	12
3347	3	052742005188	0	Admin	2023-10-24	\N	\N	1198
3348	3	052742005355	0	Admin	2023-10-24	\N	\N	964
3349	3	052742009971	0	Admin	2023-10-24	\N	\N	961
3350	3	052742012032	0	Admin	2023-10-24	\N	\N	1408
3351	3	052742014296	0	Admin	2023-10-24	\N	\N	878
3352	3	052742014531	0	Admin	2023-10-24	\N	\N	962
3353	3	052742014555	0	Admin	2023-10-24	\N	\N	960
3354	3	052742020419	0	Admin	2023-10-24	\N	\N	1468
3355	3	052742020488	0	Admin	2023-10-24	\N	\N	1503
3356	3	052742024530	0	Admin	2023-10-24	\N	\N	879
3357	3	052742040141	0	Admin	2023-10-24	\N	\N	1407
3358	3	052742187501	0	Admin	2023-10-24	\N	\N	959
3359	3	052742187907	0	Admin	2023-10-24	\N	\N	6
3360	3	052742195704	0	Admin	2023-10-24	\N	\N	5
3361	3	052742297200	0	Admin	2023-10-24	\N	\N	1411
3362	3	052742335902	0	Admin	2023-10-24	\N	\N	963
3363	3	052742339009	0	Admin	2023-10-24	\N	\N	874
3364	3	052742453606	0	Admin	2023-10-24	\N	\N	1522
3365	3	052742462806	0	Admin	2023-10-24	\N	\N	875
3366	3	052742567006	0	Admin	2023-10-24	\N	\N	873
3367	3	052742623801	0	Admin	2023-10-24	\N	\N	876
3368	3	052742624709	0	Admin	2023-10-24	\N	\N	880
3369	3	052742648606	0	Admin	2023-10-24	\N	\N	1402
3370	3	052742679709	0	Admin	2023-10-24	\N	\N	9
3371	3	052742700106	0	Admin	2023-10-24	\N	\N	1469
3372	3	052742700809	0	Admin	2023-10-24	\N	\N	18
3373	3	052742701004	0	Admin	2023-10-24	\N	\N	1
3374	3	052742701103	0	Admin	2023-10-24	\N	\N	2
3375	3	052742701608	0	Admin	2023-10-24	\N	\N	877
3376	3	052742701806	0	Admin	2023-10-24	\N	\N	4
3377	3	052742703602	0	Admin	2023-10-24	\N	\N	15
3378	3	052742703701	0	Admin	2023-10-24	\N	\N	16
3379	3	052742705507	0	Admin	2023-10-24	\N	\N	17
3380	3	052742710402	0	Admin	2023-10-24	\N	\N	10
3381	3	052742712307	0	Admin	2023-10-24	\N	\N	957
3382	3	052742713304	0	Admin	2023-10-24	\N	\N	1405
3383	3	052742713908	0	Admin	2023-10-24	\N	\N	7
3384	3	052742715605	0	Admin	2023-10-24	\N	\N	958
3385	3	052742790107	0	Admin	2023-10-24	\N	\N	14
3386	3	052742818306	0	Admin	2023-10-24	\N	\N	8
3387	3	052742855509	0	Admin	2023-10-24	\N	\N	1401
3388	3	052742861807	0	Admin	2023-10-24	\N	\N	11
3389	3	052742862101	0	Admin	2023-10-24	\N	\N	1471
3390	3	052742862309	0	Admin	2023-10-24	\N	\N	1613
3391	3	052742862408	0	Admin	2023-10-24	\N	\N	13
3392	3	052742867106	0	Admin	2023-10-24	\N	\N	3
3393	3	052742867601	0	Admin	2023-10-24	\N	\N	1596
3394	3	052742909400	0	Admin	2023-10-24	\N	\N	1404
3395	3	052742909608	0	Admin	2023-10-24	\N	\N	1406
3396	3	052742909806	0	Admin	2023-10-24	\N	\N	1409
3397	3	052742910000	0	Admin	2023-10-24	\N	\N	1410
3398	3	052742930107	0	Admin	2023-10-24	\N	\N	1403
3399	3	052742936802	0	Admin	2023-10-24	\N	\N	1591
3400	3	070230107107	0	Admin	2023-10-24	\N	\N	1494
3401	3	070230117168	0	Admin	2023-10-24	\N	\N	1495
3402	3	073893212546	0	Admin	2023-10-24	\N	\N	842
3403	3	073893212553	0	Admin	2023-10-24	\N	\N	1476
3404	3	073893223009	0	Admin	2023-10-24	\N	\N	835
3405	3	073893260035	0	Admin	2023-10-24	\N	\N	841
3406	3	073893260042	0	Admin	2023-10-24	\N	\N	1383
3407	3	073893260066	0	Admin	2023-10-24	\N	\N	840
3408	3	073893263036	0	Admin	2023-10-24	\N	\N	838
3409	3	073893264026	0	Admin	2023-10-24	\N	\N	837
3410	3	073893265030	0	Admin	2023-10-24	\N	\N	839
3411	3	073893280002	0	Admin	2023-10-24	\N	\N	836
3412	3	074198612239	0	Admin	2023-10-24	\N	\N	1463
3413	3	074198612277	0	Admin	2023-10-24	\N	\N	1070
3414	3	074198612314	0	Admin	2023-10-24	\N	\N	1464
3415	3	074198612345	0	Admin	2023-10-24	\N	\N	1073
3416	3	074198612383	0	Admin	2023-10-24	\N	\N	1462
3417	3	074198612413	0	Admin	2023-10-24	\N	\N	1071
3418	3	074198612451	0	Admin	2023-10-24	\N	\N	1465
3419	3	074198612499	0	Admin	2023-10-24	\N	\N	1074
3420	3	074198613311	0	Admin	2023-10-24	\N	\N	1072
3421	3	074198613359	0	Admin	2023-10-24	\N	\N	1436
3422	3	074198614233	0	Admin	2023-10-24	\N	\N	1467
3423	3	074198614240	0	Admin	2023-10-24	\N	\N	1435
3424	3	074198614257	0	Admin	2023-10-24	\N	\N	1466
3425	3	074198614264	0	Admin	2023-10-24	\N	\N	1434
3426	3	074198615117	0	Admin	2023-10-24	\N	\N	1581
3427	3	074198615131	0	Admin	2023-10-24	\N	\N	1580
3428	3	074198615179	0	Admin	2023-10-24	\N	\N	1624
3429	3	074198615261	0	Admin	2023-10-24	\N	\N	1586
3430	3	074198615308	0	Admin	2023-10-24	\N	\N	1587
3431	3	074198615391	0	Admin	2023-10-24	\N	\N	1637
3432	3	074198615476	0	Admin	2023-10-24	\N	\N	1582
3433	3	074198615513	0	Admin	2023-10-24	\N	\N	1583
3434	3	07419861561	0	Admin	2023-10-24	\N	\N	1585
3435	3	074198615612	0	Admin	2023-10-24	\N	\N	1588
3436	3	074198615636	0	Admin	2023-10-24	\N	\N	1584
3437	3	077627101182	0	Admin	2023-10-24	\N	\N	700
3438	3	077627101229	0	Admin	2023-10-24	\N	\N	701
3439	3	077627101274	0	Admin	2023-10-24	\N	\N	702
3440	3	077627101342	0	Admin	2023-10-24	\N	\N	703
3441	3	077627200991	0	Admin	2023-10-24	\N	\N	707
3442	3	077627201028	0	Admin	2023-10-24	\N	\N	704
3443	3	077627201066	0	Admin	2023-10-24	\N	\N	705
3444	3	077627201349	0	Admin	2023-10-24	\N	\N	706
3445	3	077627201356	0	Admin	2023-10-24	\N	\N	708
3446	3	077627302015	0	Admin	2023-10-24	\N	\N	709
3447	3	08003330160	0	Admin	2023-10-24	\N	\N	1579
3448	3	087219111529	0	Admin	2023-10-24	\N	\N	463
3449	3	087219113776	0	Admin	2023-10-24	\N	\N	507
3450	3	087219116012	0	Admin	2023-10-24	\N	\N	509
3451	3	087219117439	0	Admin	2023-10-24	\N	\N	508
3452	3	087219120873	0	Admin	2023-10-24	\N	\N	510
3453	3	1	0	Admin	2023-10-24	\N	\N	436
3454	3	10	0	Admin	2023-10-24	\N	\N	803
3455	3	100	0	Admin	2023-10-24	\N	\N	802
3456	3	101	0	Admin	2023-10-24	\N	\N	843
3457	3	102	0	Admin	2023-10-24	\N	\N	844
3458	3	103	0	Admin	2023-10-24	\N	\N	845
3459	3	104	0	Admin	2023-10-24	\N	\N	848
3460	3	105	0	Admin	2023-10-24	\N	\N	934
3461	3	106	0	Admin	2023-10-24	\N	\N	954
3462	3	107	0	Admin	2023-10-24	\N	\N	955
3463	3	108	0	Admin	2023-10-24	\N	\N	956
3464	3	109	0	Admin	2023-10-24	\N	\N	1017
3465	3	11	0	Admin	2023-10-24	\N	\N	1251
3466	3	110	0	Admin	2023-10-24	\N	\N	1018
3467	3	111	0	Admin	2023-10-24	\N	\N	1019
3468	3	112	0	Admin	2023-10-24	\N	\N	1020
3469	3	113	0	Admin	2023-10-24	\N	\N	1021
3470	3	114	0	Admin	2023-10-24	\N	\N	1022
3471	3	115	0	Admin	2023-10-24	\N	\N	1023
3472	3	116	0	Admin	2023-10-24	\N	\N	1024
3473	3	117	0	Admin	2023-10-24	\N	\N	1025
3474	3	118	0	Admin	2023-10-24	\N	\N	1026
3475	3	119	0	Admin	2023-10-24	\N	\N	1027
3476	3	120	0	Admin	2023-10-24	\N	\N	1028
3477	3	121	0	Admin	2023-10-24	\N	\N	1029
3478	3	122	0	Admin	2023-10-24	\N	\N	1030
3479	3	123	0	Admin	2023-10-24	\N	\N	1031
3480	3	1234567890128	0	Admin	2023-10-24	\N	\N	1096
3481	3	124	0	Admin	2023-10-24	\N	\N	1032
3482	3	125	0	Admin	2023-10-24	\N	\N	1033
3483	3	126	0	Admin	2023-10-24	\N	\N	1034
3484	3	127	0	Admin	2023-10-24	\N	\N	1035
3485	3	128	0	Admin	2023-10-24	\N	\N	1036
3486	3	129	0	Admin	2023-10-24	\N	\N	1037
3487	3	130	0	Admin	2023-10-24	\N	\N	1038
3488	3	131	0	Admin	2023-10-24	\N	\N	1039
3489	3	132	0	Admin	2023-10-24	\N	\N	1040
3490	3	133	0	Admin	2023-10-24	\N	\N	1041
3491	3	134	0	Admin	2023-10-24	\N	\N	1042
3492	3	135	0	Admin	2023-10-24	\N	\N	1043
3493	3	136	0	Admin	2023-10-24	\N	\N	1044
3494	3	137	0	Admin	2023-10-24	\N	\N	1045
3495	3	138	0	Admin	2023-10-24	\N	\N	1046
3496	3	139	0	Admin	2023-10-24	\N	\N	1047
3497	3	140	0	Admin	2023-10-24	\N	\N	1048
3498	3	141	0	Admin	2023-10-24	\N	\N	1049
3499	3	142	0	Admin	2023-10-24	\N	\N	1050
3500	3	1421	0	Admin	2023-10-24	\N	\N	1276
3501	3	143	0	Admin	2023-10-24	\N	\N	1051
3502	3	144	0	Admin	2023-10-24	\N	\N	1052
3503	3	145	0	Admin	2023-10-24	\N	\N	1053
3504	3	146	0	Admin	2023-10-24	\N	\N	1054
3505	3	147	0	Admin	2023-10-24	\N	\N	1055
3506	3	148	0	Admin	2023-10-24	\N	\N	1056
3507	3	149	0	Admin	2023-10-24	\N	\N	1057
3508	3	150	0	Admin	2023-10-24	\N	\N	1058
3509	3	151	0	Admin	2023-10-24	\N	\N	1059
3510	3	152	0	Admin	2023-10-24	\N	\N	1060
3511	3	153	0	Admin	2023-10-24	\N	\N	1061
3512	3	154	0	Admin	2023-10-24	\N	\N	1062
3513	3	155	0	Admin	2023-10-24	\N	\N	1063
3514	3	156	0	Admin	2023-10-24	\N	\N	1064
3515	3	157	0	Admin	2023-10-24	\N	\N	1065
3516	3	158	0	Admin	2023-10-24	\N	\N	1066
3517	3	159	0	Admin	2023-10-24	\N	\N	1067
3518	3	160	0	Admin	2023-10-24	\N	\N	1068
3519	3	161	0	Admin	2023-10-24	\N	\N	1069
3520	3	16182	0	Admin	2023-10-24	\N	\N	1430
3521	3	162	0	Admin	2023-10-24	\N	\N	1246
3522	3	163	0	Admin	2023-10-24	\N	\N	1270
3523	3	164	0	Admin	2023-10-24	\N	\N	1271
3524	3	166	0	Admin	2023-10-24	\N	\N	1443
3525	3	167	0	Admin	2023-10-24	\N	\N	1485
3526	3	170	0	Admin	2023-10-24	\N	\N	1437
3527	3	178988989	0	Admin	2023-10-24	\N	\N	1259
3528	3	181	0	Admin	2023-10-24	\N	\N	1559
3529	3	182	0	Admin	2023-10-24	\N	\N	1560
3530	3	18214816218	0	Admin	2023-10-24	\N	\N	160
3531	3	183	0	Admin	2023-10-24	\N	\N	1561
3532	3	184	0	Admin	2023-10-24	\N	\N	1562
3533	3	185	0	Admin	2023-10-24	\N	\N	1563
3534	3	186	0	Admin	2023-10-24	\N	\N	1564
3535	3	187	0	Admin	2023-10-24	\N	\N	1565
3536	3	188	0	Admin	2023-10-24	\N	\N	1566
3537	3	189	0	Admin	2023-10-24	\N	\N	1567
3538	3	190	0	Admin	2023-10-24	\N	\N	1568
3539	3	191	0	Admin	2023-10-24	\N	\N	1569
3540	3	192	0	Admin	2023-10-24	\N	\N	1570
3541	3	194	0	Admin	2023-10-24	\N	\N	1571
3542	3	195	0	Admin	2023-10-24	\N	\N	1572
3543	3	196	0	Admin	2023-10-24	\N	\N	1573
3544	3	20	0	Admin	2023-10-24	\N	\N	804
3545	3	200	0	Admin	2023-10-24	\N	\N	936
3546	3	2009073936	0	Admin	2023-10-24	\N	\N	1263
3547	3	208400	0	Admin	2023-10-24	\N	\N	416
3548	3	21	0	Admin	2023-10-24	\N	\N	805
3549	3	22	0	Admin	2023-10-24	\N	\N	806
3550	3	22095	0	Admin	2023-10-24	\N	\N	1551
3551	3	22108	0	Admin	2023-10-24	\N	\N	1550
3552	3	22109	0	Admin	2023-10-24	\N	\N	1549
3553	3	23	0	Admin	2023-10-24	\N	\N	807
3554	3	25026	0	Admin	2023-10-24	\N	\N	470
3555	3	25027	0	Admin	2023-10-24	\N	\N	471
3556	3	27003	0	Admin	2023-10-24	\N	\N	472
3557	3	30	0	Admin	2023-10-24	\N	\N	808
3558	3	300	0	Admin	2023-10-24	\N	\N	1100
3559	3	301	0	Admin	2023-10-24	\N	\N	1101
3560	3	302	0	Admin	2023-10-24	\N	\N	1102
3561	3	303	0	Admin	2023-10-24	\N	\N	1272
3562	3	304	0	Admin	2023-10-24	\N	\N	1273
3563	3	305	0	Admin	2023-10-24	\N	\N	1344
3564	3	306	0	Admin	2023-10-24	\N	\N	1345
3565	3	307	0	Admin	2023-10-24	\N	\N	1376
3566	3	308	0	Admin	2023-10-24	\N	\N	1377
3567	3	309	0	Admin	2023-10-24	\N	\N	1399
3568	3	31	0	Admin	2023-10-24	\N	\N	809
3569	3	310	0	Admin	2023-10-24	\N	\N	1429
3570	3	311	0	Admin	2023-10-24	\N	\N	1447
3571	3	312	0	Admin	2023-10-24	\N	\N	1448
3572	3	313	0	Admin	2023-10-24	\N	\N	1454
3573	3	314	0	Admin	2023-10-24	\N	\N	1457
3574	3	315	0	Admin	2023-10-24	\N	\N	1459
3575	3	316	0	Admin	2023-10-24	\N	\N	1482
3576	3	317	0	Admin	2023-10-24	\N	\N	1483
3577	3	318	0	Admin	2023-10-24	\N	\N	1484
3578	3	3182550402132	0	Admin	2023-10-24	\N	\N	410
3579	3	3182550402149	0	Admin	2023-10-24	\N	\N	401
3580	3	3182550402170	0	Admin	2023-10-24	\N	\N	445
3581	3	3182550402224	0	Admin	2023-10-24	\N	\N	413
3582	3	3182550402439	0	Admin	2023-10-24	\N	\N	408
3583	3	3182550702201	0	Admin	2023-10-24	\N	\N	420
3584	3	3182550702225	0	Admin	2023-10-24	\N	\N	421
3585	3	3182550702423	0	Admin	2023-10-24	\N	\N	425
3586	3	3182550702447	0	Admin	2023-10-24	\N	\N	426
3587	3	3182550702614	0	Admin	2023-10-24	\N	\N	1088
3588	3	3182550708180	0	Admin	2023-10-24	\N	\N	409
3589	3	3182550708197	0	Admin	2023-10-24	\N	\N	411
3590	3	3182550708203	0	Admin	2023-10-24	\N	\N	412
3591	3	3182550710923	0	Admin	2023-10-24	\N	\N	394
3592	3	3182550710992	0	Admin	2023-10-24	\N	\N	417
3593	3	3182550711036	0	Admin	2023-10-24	\N	\N	414
3594	3	3182550711050	0	Admin	2023-10-24	\N	\N	433
3595	3	3182550711142	0	Admin	2023-10-24	\N	\N	393
3596	3	3182550711159	0	Admin	2023-10-24	\N	\N	434
3597	3	3182550711333	0	Admin	2023-10-24	\N	\N	395
3598	3	3182550711395	0	Admin	2023-10-24	\N	\N	418
3599	3	3182550716857	0	Admin	2023-10-24	\N	\N	449
3600	3	3182550716888	0	Admin	2023-10-24	\N	\N	448
3601	3	3182550716925	0	Admin	2023-10-24	\N	\N	451
3602	3	3182550717687	0	Admin	2023-10-24	\N	\N	415
3603	3	3182550718813	0	Admin	2023-10-24	\N	\N	1598
3604	3	3182550727822	0	Admin	2023-10-24	\N	\N	447
3605	3	3182550728102	0	Admin	2023-10-24	\N	\N	1639
3606	3	3182550730587	0	Admin	2023-10-24	\N	\N	432
3607	3	3182550731355	0	Admin	2023-10-24	\N	\N	390
3608	3	3182550732055	0	Admin	2023-10-24	\N	\N	402
3609	3	3182550732154	0	Admin	2023-10-24	\N	\N	1615
3610	3	3182550743433	0	Admin	2023-10-24	\N	\N	431
3611	3	3182550743440	0	Admin	2023-10-24	\N	\N	1632
3612	3	3182550768474	0	Admin	2023-10-24	\N	\N	1091
3613	3	3182550771054	0	Admin	2023-10-24	\N	\N	396
3614	3	3182550771061	0	Admin	2023-10-24	\N	\N	397
3615	3	3182550771719	0	Admin	2023-10-24	\N	\N	398
3616	3	3182550771733	0	Admin	2023-10-24	\N	\N	399
3617	3	3182550775267	0	Admin	2023-10-24	\N	\N	446
3618	3	3182550778657	0	Admin	2023-10-24	\N	\N	430
3619	3	3182550778671	0	Admin	2023-10-24	\N	\N	403
3620	3	3182550793001	0	Admin	2023-10-24	\N	\N	405
3621	3	3182550793032	0	Admin	2023-10-24	\N	\N	406
3622	3	3182550793049	0	Admin	2023-10-24	\N	\N	407
3623	3	3182550798945	0	Admin	2023-10-24	\N	\N	452
5115	4	114	0	Admin	2023-10-24	\N	\N	1022
3624	3	3182550799768	0	Admin	2023-10-24	\N	\N	450
3625	3	3182550831086	0	Admin	2023-10-24	\N	\N	391
3626	3	3182550831383	0	Admin	2023-10-24	\N	\N	428
3627	3	3182550831390	0	Admin	2023-10-24	\N	\N	427
3628	3	319	0	Admin	2023-10-24	\N	\N	1497
3629	3	32	0	Admin	2023-10-24	\N	\N	810
3630	3	320	0	Admin	2023-10-24	\N	\N	1498
3631	3	321	0	Admin	2023-10-24	\N	\N	1499
3632	3	322	0	Admin	2023-10-24	\N	\N	1501
3633	3	323	0	Admin	2023-10-24	\N	\N	1502
3634	3	33	0	Admin	2023-10-24	\N	\N	811
3635	3	33015	0	Admin	2023-10-24	\N	\N	473
3636	3	33016	0	Admin	2023-10-24	\N	\N	461
3637	3	33059	0	Admin	2023-10-24	\N	\N	462
3638	3	3411112261956	0	Admin	2023-10-24	\N	\N	797
3639	3	350	0	Admin	2023-10-24	\N	\N	1452
3640	3	3552793078300	0	Admin	2023-10-24	\N	\N	548
3641	3	3552793078324	0	Admin	2023-10-24	\N	\N	547
3642	3	40	0	Admin	2023-10-24	\N	\N	812
3643	3	400	0	Admin	2023-10-24	\N	\N	1165
3644	3	4007221039112	0	Admin	2023-10-24	\N	\N	670
3645	3	4007221039129	0	Admin	2023-10-24	\N	\N	671
3646	3	4007221043218	0	Admin	2023-10-24	\N	\N	522
3647	3	4007221052180	0	Admin	2023-10-24	\N	\N	1555
3648	3	4007221054221	0	Admin	2023-10-24	\N	\N	1556
3649	3	401	0	Admin	2023-10-24	\N	\N	1166
3650	3	402	0	Admin	2023-10-24	\N	\N	1267
3651	3	403	0	Admin	2023-10-24	\N	\N	1375
3652	3	404	0	Admin	2023-10-24	\N	\N	1398
3653	3	41	0	Admin	2023-10-24	\N	\N	813
3654	3	41006	0	Admin	2023-10-24	\N	\N	505
3655	3	41013	0	Admin	2023-10-24	\N	\N	511
3656	3	41019	0	Admin	2023-10-24	\N	\N	512
3657	3	412	0	Admin	2023-10-24	\N	\N	1517
3658	3	415	0	Admin	2023-10-24	\N	\N	1520
3659	3	416	0	Admin	2023-10-24	\N	\N	1521
3660	3	42	0	Admin	2023-10-24	\N	\N	814
3661	3	4260448120210	0	Admin	2023-10-24	\N	\N	1439
3662	3	43	0	Admin	2023-10-24	\N	\N	815
3663	3	45	0	Admin	2023-10-24	\N	\N	944
3664	3	4894158096291	0	Admin	2023-10-24	\N	\N	1106
3665	3	50	0	Admin	2023-10-24	\N	\N	816
3666	3	51	0	Admin	2023-10-24	\N	\N	817
3667	3	52	0	Admin	2023-10-24	\N	\N	818
3668	3	53	0	Admin	2023-10-24	\N	\N	819
3669	3	5414736039282	0	Admin	2023-10-24	\N	\N	1163
3670	3	5414736047911	0	Admin	2023-10-24	\N	\N	466
3671	3	5414736047928	0	Admin	2023-10-24	\N	\N	467
3672	3	5414736047935	0	Admin	2023-10-24	\N	\N	468
3673	3	5414736047942	0	Admin	2023-10-24	\N	\N	469
3674	3	5414736048253	0	Admin	2023-10-24	\N	\N	1644
3675	3	5415341001961	0	Admin	2023-10-24	\N	\N	596
3676	3	5420043705338	0	Admin	2023-10-24	\N	\N	464
3677	3	5420043705345	0	Admin	2023-10-24	\N	\N	465
3678	3	6	0	Admin	2023-10-24	\N	\N	987
3679	3	60	0	Admin	2023-10-24	\N	\N	820
3680	3	61	0	Admin	2023-10-24	\N	\N	821
3681	3	62	0	Admin	2023-10-24	\N	\N	822
3682	3	63	0	Admin	2023-10-24	\N	\N	823
3683	3	645095002166	0	Admin	2023-10-24	\N	\N	983
3684	3	659525114701	0	Admin	2023-10-24	\N	\N	1622
3685	3	662858207224	0	Admin	2023-10-24	\N	\N	1178
3686	3	662858226003	0	Admin	2023-10-24	\N	\N	1164
3687	3	682500939518	0	Admin	2023-10-24	\N	\N	942
3688	3	682500939679	0	Admin	2023-10-24	\N	\N	943
3689	3	6828949660383	0	Admin	2023-10-24	\N	\N	1602
3690	3	6920190048764	0	Admin	2023-10-24	\N	\N	1086
3691	3	6953182709244	0	Admin	2023-10-24	\N	\N	587
3692	3	6953182710585	0	Admin	2023-10-24	\N	\N	550
3693	3	6953182710820	0	Admin	2023-10-24	\N	\N	1128
3694	3	6953182714576	0	Admin	2023-10-24	\N	\N	1372
3695	3	6953182714972	0	Admin	2023-10-24	\N	\N	1116
3696	3	6953182718062	0	Admin	2023-10-24	\N	\N	1119
3697	3	6953182719458	0	Admin	2023-10-24	\N	\N	441
3698	3	6953182719571	0	Admin	2023-10-24	\N	\N	1117
3699	3	6953182720072	0	Admin	2023-10-24	\N	\N	1118
3700	3	6953182721161	0	Admin	2023-10-24	\N	\N	585
3701	3	6953182731450	0	Admin	2023-10-24	\N	\N	555
3702	3	6953182731481	0	Admin	2023-10-24	\N	\N	556
3703	3	6953182732365	0	Admin	2023-10-24	\N	\N	437
3704	3	6953182732372	0	Admin	2023-10-24	\N	\N	438
3705	3	6953182732389	0	Admin	2023-10-24	\N	\N	439
3706	3	6953182732440	0	Admin	2023-10-24	\N	\N	440
3707	3	6953182735083	0	Admin	2023-10-24	\N	\N	1278
3708	3	6972170629975	0	Admin	2023-10-24	\N	\N	1610
3709	3	6995654545424	0	Admin	2023-10-24	\N	\N	1599
3710	3	70	0	Admin	2023-10-24	\N	\N	824
3711	3	71	0	Admin	2023-10-24	\N	\N	825
3712	3	711604200290	0	Admin	2023-10-24	\N	\N	1284
3713	3	711604203734	0	Admin	2023-10-24	\N	\N	1285
3714	3	714193509102	0	Admin	2023-10-24	\N	\N	1216
3715	3	714193600724	0	Admin	2023-10-24	\N	\N	1217
3716	3	714193600823	0	Admin	2023-10-24	\N	\N	727
3717	3	714193600861	0	Admin	2023-10-24	\N	\N	726
3718	3	714193600984	0	Admin	2023-10-24	\N	\N	728
3719	3	714193610934	0	Admin	2023-10-24	\N	\N	1623
3720	3	714193699728	0	Admin	2023-10-24	\N	\N	725
3721	3	7191600000507	0	Admin	2023-10-24	\N	\N	1254
3722	3	72	0	Admin	2023-10-24	\N	\N	826
3723	3	73	0	Admin	2023-10-24	\N	\N	827
3724	3	73000101	0	Admin	2023-10-24	\N	\N	158
3725	3	73008199IO	0	Admin	2023-10-24	\N	\N	388
3726	3	73033333	0	Admin	2023-10-24	\N	\N	159
3727	3	736990012050	0	Admin	2023-10-24	\N	\N	887
3728	3	736990012104	0	Admin	2023-10-24	\N	\N	886
3729	3	736990012159	0	Admin	2023-10-24	\N	\N	888
3730	3	736990012203	0	Admin	2023-10-24	\N	\N	889
3731	3	736990012258	0	Admin	2023-10-24	\N	\N	890
3732	3	736990013002	0	Admin	2023-10-24	\N	\N	884
3733	3	736990013309	0	Admin	2023-10-24	\N	\N	885
3734	3	736990040114	0	Admin	2023-10-24	\N	\N	883
3735	3	74 6203100578	0	Admin	2023-10-24	\N	\N	1132
3736	3	7404000315615	0	Admin	2023-10-24	\N	\N	638
3737	3	7404000315622	0	Admin	2023-10-24	\N	\N	639
3738	3	7404000315639	0	Admin	2023-10-24	\N	\N	640
3739	3	7404000315646	0	Admin	2023-10-24	\N	\N	641
3740	3	7406160004224	0	Admin	2023-10-24	\N	\N	599
3741	3	7410000115322	0	Admin	2023-10-24	\N	\N	1262
3742	3	7410032780024	0	Admin	2023-10-24	\N	\N	710
3743	3	7410032780031	0	Admin	2023-10-24	\N	\N	711
3744	3	7414400200596	0	Admin	2023-10-24	\N	\N	1210
3745	3	7414400201012	0	Admin	2023-10-24	\N	\N	732
3746	3	7414400201050	0	Admin	2023-10-24	\N	\N	739
3747	3	7414400201067	0	Admin	2023-10-24	\N	\N	740
3748	3	7414400201074	0	Admin	2023-10-24	\N	\N	737
3749	3	7414400201081	0	Admin	2023-10-24	\N	\N	738
3750	3	7414400201111	0	Admin	2023-10-24	\N	\N	735
3751	3	7414400201128	0	Admin	2023-10-24	\N	\N	736
3752	3	7414400201210	0	Admin	2023-10-24	\N	\N	1479
3753	3	7414400201227	0	Admin	2023-10-24	\N	\N	1478
3754	3	7414400201234	0	Admin	2023-10-24	\N	\N	1477
3755	3	7414400201296	0	Admin	2023-10-24	\N	\N	734
3756	3	7414400201302	0	Admin	2023-10-24	\N	\N	733
3757	3	7414400201364	0	Admin	2023-10-24	\N	\N	1458
3758	3	7414400201432	0	Admin	2023-10-24	\N	\N	1215
3759	3	7414400201449	0	Admin	2023-10-24	\N	\N	1213
3760	3	7414400201456	0	Admin	2023-10-24	\N	\N	1212
3761	3	7414400201470	0	Admin	2023-10-24	\N	\N	715
3762	3	7414400201487	0	Admin	2023-10-24	\N	\N	717
3763	3	7414400201494	0	Admin	2023-10-24	\N	\N	716
3764	3	7414400201609	0	Admin	2023-10-24	\N	\N	851
3765	3	7414400201616	0	Admin	2023-10-24	\N	\N	850
3766	3	7414400201623	0	Admin	2023-10-24	\N	\N	852
3767	3	7414400202088	0	Admin	2023-10-24	\N	\N	1214
3768	3	7414400202095	0	Admin	2023-10-24	\N	\N	1209
3769	3	7414400202101	0	Admin	2023-10-24	\N	\N	1211
3770	3	7414400202149	0	Admin	2023-10-24	\N	\N	1208
3771	3	7416203100264	0	Admin	2023-10-24	\N	\N	560
3772	3	7416203100271	0	Admin	2023-10-24	\N	\N	561
3773	3	7416203100288	0	Admin	2023-10-24	\N	\N	562
3774	3	7416203100295	0	Admin	2023-10-24	\N	\N	563
3775	3	7416203100301	0	Admin	2023-10-24	\N	\N	564
3776	3	7416203100318	0	Admin	2023-10-24	\N	\N	565
3777	3	7416203100578	0	Admin	2023-10-24	\N	\N	1162
3778	3	7416203100585	0	Admin	2023-10-24	\N	\N	1136
3779	3	7416203100592	0	Admin	2023-10-24	\N	\N	1135
3780	3	7416203100608	0	Admin	2023-10-24	\N	\N	1134
3781	3	7416203100615	0	Admin	2023-10-24	\N	\N	1131
3782	3	7416203100622	0	Admin	2023-10-24	\N	\N	1137
3783	3	7416203100639	0	Admin	2023-10-24	\N	\N	1126
3784	3	7416203100646	0	Admin	2023-10-24	\N	\N	1125
3785	3	7416203100653	0	Admin	2023-10-24	\N	\N	1124
3786	3	7416203100660	0	Admin	2023-10-24	\N	\N	1123
3787	3	7416203100677	0	Admin	2023-10-24	\N	\N	1122
3788	3	7416203100684	0	Admin	2023-10-24	\N	\N	1121
3789	3	7416203100844	0	Admin	2023-10-24	\N	\N	553
3790	3	7416203101179	0	Admin	2023-10-24	\N	\N	1129
3791	3	7416203101209	0	Admin	2023-10-24	\N	\N	584
3792	3	7416203101247	0	Admin	2023-10-24	\N	\N	566
3793	3	7416203101254	0	Admin	2023-10-24	\N	\N	567
3794	3	7416203101261	0	Admin	2023-10-24	\N	\N	569
3795	3	7416203101278	0	Admin	2023-10-24	\N	\N	571
3796	3	7416203101438	0	Admin	2023-10-24	\N	\N	619
3797	3	7416203101445	0	Admin	2023-10-24	\N	\N	484
3798	3	7416203101469	0	Admin	2023-10-24	\N	\N	573
3799	3	7416203101520	0	Admin	2023-10-24	\N	\N	442
3800	3	7416203101544	0	Admin	2023-10-24	\N	\N	617
3801	3	7416203101551	0	Admin	2023-10-24	\N	\N	616
3802	3	7416203101667	0	Admin	2023-10-24	\N	\N	443
3803	3	7416203101797	0	Admin	2023-10-24	\N	\N	600
3804	3	7416203101827	0	Admin	2023-10-24	\N	\N	626
3805	3	7416203101834	0	Admin	2023-10-24	\N	\N	590
3806	3	7416203101902	0	Admin	2023-10-24	\N	\N	549
3807	3	7416203101926	0	Admin	2023-10-24	\N	\N	1115
3808	3	7416203101964	0	Admin	2023-10-24	\N	\N	483
3809	3	7416203102183	0	Admin	2023-10-24	\N	\N	1120
3810	3	7416203102213	0	Admin	2023-10-24	\N	\N	621
3811	3	7416203102220	0	Admin	2023-10-24	\N	\N	620
3812	3	7416203102237	0	Admin	2023-10-24	\N	\N	622
3813	3	7416203102244	0	Admin	2023-10-24	\N	\N	618
3814	3	7416203102916	0	Admin	2023-10-24	\N	\N	581
3815	3	7416203102923	0	Admin	2023-10-24	\N	\N	582
3816	3	7416203102930	0	Admin	2023-10-24	\N	\N	583
3817	3	7416203103326	0	Admin	2023-10-24	\N	\N	479
3818	3	7416203103333	0	Admin	2023-10-24	\N	\N	480
3819	3	7416203103340	0	Admin	2023-10-24	\N	\N	481
3820	3	7416203103357	0	Admin	2023-10-24	\N	\N	1127
3821	3	7416203103364	0	Admin	2023-10-24	\N	\N	1133
3822	3	7416203103371	0	Admin	2023-10-24	\N	\N	474
3823	3	7416203103388	0	Admin	2023-10-24	\N	\N	475
3824	3	7416203103395	0	Admin	2023-10-24	\N	\N	476
3825	3	7416203103401	0	Admin	2023-10-24	\N	\N	477
3826	3	7416203103418	0	Admin	2023-10-24	\N	\N	478
3827	3	7416203103425	0	Admin	2023-10-24	\N	\N	482
3828	3	7416203103685	0	Admin	2023-10-24	\N	\N	1374
3829	3	7416203103692	0	Admin	2023-10-24	\N	\N	591
3830	3	7416203103708	0	Admin	2023-10-24	\N	\N	592
3831	3	7416203103722	0	Admin	2023-10-24	\N	\N	624
3832	3	7416203103739	0	Admin	2023-10-24	\N	\N	623
3833	3	7416203103753	0	Admin	2023-10-24	\N	\N	593
3834	3	7416203103760	0	Admin	2023-10-24	\N	\N	594
3835	3	7420615480007-7.5	0	Admin	2023-10-24	\N	\N	1594
3836	3	742061548007-10	0	Admin	2023-10-24	\N	\N	892
3837	3	742061548007-12.5	0	Admin	2023-10-24	\N	\N	893
3838	3	742061548007-15	0	Admin	2023-10-24	\N	\N	894
3839	3	742061548007-20	0	Admin	2023-10-24	\N	\N	895
3840	3	742061548007-25	0	Admin	2023-10-24	\N	\N	896
3841	3	742061548007-30	0	Admin	2023-10-24	\N	\N	897
3842	3	742061548007-7.5	0	Admin	2023-10-24	\N	\N	891
3843	3	7441003121935	0	Admin	2023-10-24	\N	\N	662
3844	3	7441003121942	0	Admin	2023-10-24	\N	\N	661
3845	3	7441007802434	0	Admin	2023-10-24	\N	\N	1574
3846	3	7441031336950	0	Admin	2023-10-24	\N	\N	1286
3847	3	7453105056978	0	Admin	2023-10-24	\N	\N	1098
3848	3	7501	0	Admin	2023-10-24	\N	\N	1611
3849	3	7501051100020	0	Admin	2023-10-24	\N	\N	1245
3850	3	7501051100037	0	Admin	2023-10-24	\N	\N	660
3851	3	7501051186963	0	Admin	2023-10-24	\N	\N	1247
3852	3	7501072204462	0	Admin	2023-10-24	\N	\N	1492
3853	3	7501072204479	0	Admin	2023-10-24	\N	\N	1493
3854	3	7501072204561	0	Admin	2023-10-24	\N	\N	488
3855	3	7501072204578	0	Admin	2023-10-24	\N	\N	1223
3856	3	7501072204592	0	Admin	2023-10-24	\N	\N	1391
3857	3	7501072204615	0	Admin	2023-10-24	\N	\N	1218
3858	3	7501072206299	0	Admin	2023-10-24	\N	\N	491
3859	3	7501072206305	0	Admin	2023-10-24	\N	\N	1219
3860	3	7501072207234	0	Admin	2023-10-24	\N	\N	485
3861	3	7501072207258	0	Admin	2023-10-24	\N	\N	493
3862	3	7501072207265	0	Admin	2023-10-24	\N	\N	492
3863	3	7501072208231	0	Admin	2023-10-24	\N	\N	499
3864	3	7501072208248	0	Admin	2023-10-24	\N	\N	486
3865	3	7501072208262	0	Admin	2023-10-24	\N	\N	1496
3866	3	7501072208279	0	Admin	2023-10-24	\N	\N	500
3867	3	7501072208293	0	Admin	2023-10-24	\N	\N	489
3868	3	7501072208743	0	Admin	2023-10-24	\N	\N	1389
3869	3	7501072208767	0	Admin	2023-10-24	\N	\N	1224
3870	3	7501072208781	0	Admin	2023-10-24	\N	\N	498
3871	3	7501072208798	0	Admin	2023-10-24	\N	\N	1221
3872	3	7501072208927	0	Admin	2023-10-24	\N	\N	1461
3873	3	7501072208958	0	Admin	2023-10-24	\N	\N	490
3874	3	7501072208972	0	Admin	2023-10-24	\N	\N	1631
3875	3	7501072210609	0	Admin	2023-10-24	\N	\N	1390
3876	3	7501072210616	0	Admin	2023-10-24	\N	\N	1220
3877	3	7501072210623	0	Admin	2023-10-24	\N	\N	497
3878	3	7501072210630	0	Admin	2023-10-24	\N	\N	1460
3879	3	7501072210661	0	Admin	2023-10-24	\N	\N	1392
3880	3	7501072210678	0	Admin	2023-10-24	\N	\N	1282
3881	3	7501072210685	0	Admin	2023-10-24	\N	\N	1076
3882	3	7501072210692	0	Admin	2023-10-24	\N	\N	487
3883	3	7501072210715	0	Admin	2023-10-24	\N	\N	1222
3884	3	7501072210722	0	Admin	2023-10-24	\N	\N	1354
3885	3	7501072210739	0	Admin	2023-10-24	\N	\N	1634
3886	3	7501072214485	0	Admin	2023-10-24	\N	\N	924
3887	3	7501072214492	0	Admin	2023-10-24	\N	\N	927
3888	3	7501072214508	0	Admin	2023-10-24	\N	\N	919
3889	3	7501072214515	0	Admin	2023-10-24	\N	\N	926
3890	3	7501072214522	0	Admin	2023-10-24	\N	\N	923
3891	3	7501072214539	0	Admin	2023-10-24	\N	\N	921
3892	3	7501072214546	0	Admin	2023-10-24	\N	\N	922
3893	3	7501072214560	0	Admin	2023-10-24	\N	\N	920
3894	3	7502010420043	0	Admin	2023-10-24	\N	\N	1283
3895	3	7502010421118	0	Admin	2023-10-24	\N	\N	503
3896	3	7502010421125	0	Admin	2023-10-24	\N	\N	502
3897	3	7502010421132	0	Admin	2023-10-24	\N	\N	501
3898	3	7502010421187	0	Admin	2023-10-24	\N	\N	513
3899	3	7502010421194	0	Admin	2023-10-24	\N	\N	1444
3900	3	7502010423969	0	Admin	2023-10-24	\N	\N	530
3901	3	7502010429701	0	Admin	2023-10-24	\N	\N	537
3902	3	7502262630023	0	Admin	2023-10-24	\N	\N	763
3903	3	7502262630740	0	Admin	2023-10-24	\N	\N	518
3904	3	7502262630795	0	Admin	2023-10-24	\N	\N	1275
3905	3	7503008553002	0	Admin	2023-10-24	\N	\N	753
3906	3	7503008553040	0	Admin	2023-10-24	\N	\N	752
3907	3	7503008553057	0	Admin	2023-10-24	\N	\N	1593
3908	3	7503008553071	0	Admin	2023-10-24	\N	\N	1589
3909	3	7503008553200	0	Admin	2023-10-24	\N	\N	750
3910	3	7503008553231	0	Admin	2023-10-24	\N	\N	1396
3911	3	7503008553248	0	Admin	2023-10-24	\N	\N	751
3912	3	7503008553255	0	Admin	2023-10-24	\N	\N	1395
3913	3	7503008553279	0	Admin	2023-10-24	\N	\N	1428
3914	3	7503008553965	0	Admin	2023-10-24	\N	\N	799
3915	3	7503008553972	0	Admin	2023-10-24	\N	\N	1394
3916	3	7503019166604	0	Admin	2023-10-24	\N	\N	520
3917	3	7503020053085	0	Admin	2023-10-24	\N	\N	1393
3918	3	7503020053290	0	Admin	2023-10-24	\N	\N	754
3919	3	7503020053306	0	Admin	2023-10-24	\N	\N	757
3920	3	7503020053313	0	Admin	2023-10-24	\N	\N	758
3921	3	7503020053320	0	Admin	2023-10-24	\N	\N	1397
3922	3	7503020053382	0	Admin	2023-10-24	\N	\N	1590
3923	3	7503020053849	0	Admin	2023-10-24	\N	\N	798
3924	3	7503026084113	0	Admin	2023-10-24	\N	\N	756
3925	3	7503026084144	0	Admin	2023-10-24	\N	\N	755
3926	3	7503026470107	0	Admin	2023-10-24	\N	\N	846
3927	3	7503027959472	0	Admin	2023-10-24	\N	\N	527
3928	3	7506267903489	0	Admin	2023-10-24	\N	\N	1438
3929	3	7506267907340	0	Admin	2023-10-24	\N	\N	1442
3930	3	7506267907357	0	Admin	2023-10-24	\N	\N	1441
3931	3	7506267907371	0	Admin	2023-10-24	\N	\N	1440
3932	3	7506343800015	0	Admin	2023-10-24	\N	\N	644
3933	3	7506343800022	0	Admin	2023-10-24	\N	\N	645
3934	3	7506343800039	0	Admin	2023-10-24	\N	\N	646
3935	3	7506343800176	0	Admin	2023-10-24	\N	\N	642
3936	3	7506343800190	0	Admin	2023-10-24	\N	\N	643
3937	3	7506343800794	0	Admin	2023-10-24	\N	\N	631
3938	3	7506343801784	0	Admin	2023-10-24	\N	\N	647
3939	3	7506343802668	0	Admin	2023-10-24	\N	\N	630
3940	3	7506343802675	0	Admin	2023-10-24	\N	\N	649
3941	3	7506343802798	0	Admin	2023-10-24	\N	\N	648
3942	3	7506396700645	0	Admin	2023-10-24	\N	\N	532
3943	3	7506407400328	0	Admin	2023-10-24	\N	\N	519
3944	3	7506407400618	0	Admin	2023-10-24	\N	\N	969
3945	3	7506407400625	0	Admin	2023-10-24	\N	\N	970
3946	3	7506407400977	0	Admin	2023-10-24	\N	\N	968
3947	3	7506407401691	0	Admin	2023-10-24	\N	\N	967
3948	3	7506407402094	0	Admin	2023-10-24	\N	\N	965
3949	3	7506407402124	0	Admin	2023-10-24	\N	\N	538
3950	3	7506407402193	0	Admin	2023-10-24	\N	\N	971
3951	3	7506407402216	0	Admin	2023-10-24	\N	\N	523
3952	3	7506407402247	0	Admin	2023-10-24	\N	\N	528
3953	3	7506407402469	0	Admin	2023-10-24	\N	\N	966
3954	3	7593990010041	0	Admin	2023-10-24	\N	\N	1082
3955	3	7593990010058	0	Admin	2023-10-24	\N	\N	1105
3956	3	7593990012953	0	Admin	2023-10-24	\N	\N	1104
3957	3	7593990050511	0	Admin	2023-10-24	\N	\N	1103
3958	3	769229001167	0	Admin	2023-10-24	\N	\N	651
3959	3	769229002430	0	Admin	2023-10-24	\N	\N	663
3960	3	769229002683	0	Admin	2023-10-24	\N	\N	672
3961	3	769229003611	0	Admin	2023-10-24	\N	\N	658
3962	3	769229003710	0	Admin	2023-10-24	\N	\N	673
3963	3	769229003734	0	Admin	2023-10-24	\N	\N	664
3964	3	769229003741	0	Admin	2023-10-24	\N	\N	656
3965	3	769229003758	0	Admin	2023-10-24	\N	\N	657
3966	3	769229049510	0	Admin	2023-10-24	\N	\N	655
3967	3	769229124217	0	Admin	2023-10-24	\N	\N	650
3968	3	769229131413	0	Admin	2023-10-24	\N	\N	653
3969	3	769229131512	0	Admin	2023-10-24	\N	\N	652
3970	3	769229131918	0	Admin	2023-10-24	\N	\N	654
3971	3	7707007404604	0	Admin	2023-10-24	\N	\N	1256
3972	3	7707007405663	0	Admin	2023-10-24	\N	\N	1258
3973	3	7707115301161	0	Admin	2023-10-24	\N	\N	458
3974	3	7707115301222	0	Admin	2023-10-24	\N	\N	455
3975	3	7707115301468	0	Admin	2023-10-24	\N	\N	457
3976	3	7707115301611	0	Admin	2023-10-24	\N	\N	536
3977	3	7707214570659	0	Admin	2023-10-24	\N	\N	940
3978	3	7707214570833	0	Admin	2023-10-24	\N	\N	941
3979	3	7707214570918	0	Admin	2023-10-24	\N	\N	937
3980	3	7707214570949	0	Admin	2023-10-24	\N	\N	938
3981	3	7707214573001	0	Admin	2023-10-24	\N	\N	939
3982	3	7707274710316	0	Admin	2023-10-24	\N	\N	515
3983	3	7707274714215	0	Admin	2023-10-24	\N	\N	460
3984	3	7707274715014	0	Admin	2023-10-24	\N	\N	454
3985	3	7707274717001	0	Admin	2023-10-24	\N	\N	459
3986	3	7707274718060	0	Admin	2023-10-24	\N	\N	453
3987	3	7730952032677	0	Admin	2023-10-24	\N	\N	526
3988	3	7730952032899	0	Admin	2023-10-24	\N	\N	1525
3989	3	7730997410614	0	Admin	2023-10-24	\N	\N	760
3990	3	7730997410621	0	Admin	2023-10-24	\N	\N	759
3991	3	7730997410638	0	Admin	2023-10-24	\N	\N	761
3992	3	7730997410645	0	Admin	2023-10-24	\N	\N	762
3993	3	7756654000363	0	Admin	2023-10-24	\N	\N	1509
3994	3	7756654000370	0	Admin	2023-10-24	\N	\N	1508
3995	3	7756654000387	0	Admin	2023-10-24	\N	\N	1512
3996	3	7756654000400	0	Admin	2023-10-24	\N	\N	1516
3997	3	7756654000424	0	Admin	2023-10-24	\N	\N	1505
3998	3	7756654000448	0	Admin	2023-10-24	\N	\N	1510
3999	3	7756654015220	0	Admin	2023-10-24	\N	\N	1504
4000	3	7756654020156	0	Admin	2023-10-24	\N	\N	1514
4001	3	7756654020293	0	Admin	2023-10-24	\N	\N	1511
4002	3	7756654027926	0	Admin	2023-10-24	\N	\N	1618
4003	3	7756654027933	0	Admin	2023-10-24	\N	\N	1617
4004	3	7756654027940	0	Admin	2023-10-24	\N	\N	1616
4005	3	7759433000059	0	Admin	2023-10-24	\N	\N	1475
4006	3	7759433000882	0	Admin	2023-10-24	\N	\N	1274
4007	3	7759433000998	0	Admin	2023-10-24	\N	\N	1264
4008	3	7759433001193	0	Admin	2023-10-24	\N	\N	1633
4009	3	7759433001933	0	Admin	2023-10-24	\N	\N	1628
4010	3	7759433001940	0	Admin	2023-10-24	\N	\N	1629
4011	3	7792716421868	0	Admin	2023-10-24	\N	\N	1523
4012	3	7797600000174	0	Admin	2023-10-24	\N	\N	1260
4013	3	7797600000501	0	Admin	2023-10-24	\N	\N	1269
4014	3	7797600000518	0	Admin	2023-10-24	\N	\N	1253
4015	3	7797600000761	0	Admin	2023-10-24	\N	\N	1257
4016	3	7797600000785	0	Admin	2023-10-24	\N	\N	1261
4017	3	7797600001805	0	Admin	2023-10-24	\N	\N	1252
4018	3	7797600001812	0	Admin	2023-10-24	\N	\N	1255
4019	3	7797600002895	0	Admin	2023-10-24	\N	\N	1547
4020	3	7797600002901	0	Admin	2023-10-24	\N	\N	1519
4021	3	7798042360055	0	Admin	2023-10-24	\N	\N	767
4022	3	7798042360093	0	Admin	2023-10-24	\N	\N	769
4023	3	7798042360109	0	Admin	2023-10-24	\N	\N	768
4024	3	7798042360178	0	Admin	2023-10-24	\N	\N	766
4025	3	7798042360185	0	Admin	2023-10-24	\N	\N	535
4026	3	7798042360260	0	Admin	2023-10-24	\N	\N	770
4027	3	7798042360468	0	Admin	2023-10-24	\N	\N	764
4028	3	7798042360581	0	Admin	2023-10-24	\N	\N	771
4029	3	7798042361311	0	Admin	2023-10-24	\N	\N	785
4030	3	7798042361335	0	Admin	2023-10-24	\N	\N	540
4031	3	7798042361359	0	Admin	2023-10-24	\N	\N	773
4032	3	7798042361380	0	Admin	2023-10-24	\N	\N	774
4033	3	7798042361533	0	Admin	2023-10-24	\N	\N	780
4034	3	7798042364800	0	Admin	2023-10-24	\N	\N	514
4035	3	7798042364961	0	Admin	2023-10-24	\N	\N	772
4036	3	7798042365685	0	Admin	2023-10-24	\N	\N	781
4037	3	7798042365692	0	Admin	2023-10-24	\N	\N	782
4038	3	7798042365708	0	Admin	2023-10-24	\N	\N	928
4039	3	7798042365715	0	Admin	2023-10-24	\N	\N	903
4040	3	7798042365722	0	Admin	2023-10-24	\N	\N	902
4041	3	7798042365739	0	Admin	2023-10-24	\N	\N	925
4042	3	7798042365975	0	Admin	2023-10-24	\N	\N	765
4043	3	7798042366170	0	Admin	2023-10-24	\N	\N	783
4044	3	7798042366187	0	Admin	2023-10-24	\N	\N	784
4045	3	7798042366200	0	Admin	2023-10-24	\N	\N	778
4046	3	7798042366217	0	Admin	2023-10-24	\N	\N	779
4047	3	7798042366224	0	Admin	2023-10-24	\N	\N	790
4048	3	7798042366231	0	Admin	2023-10-24	\N	\N	531
4049	3	7798042366255	0	Admin	2023-10-24	\N	\N	775
4050	3	7798042366262	0	Admin	2023-10-24	\N	\N	776
4051	3	7798144990860	0	Admin	2023-10-24	\N	\N	1453
4052	3	7798144993663	0	Admin	2023-10-24	\N	\N	1173
4053	3	7798156460054	0	Admin	2023-10-24	\N	\N	521
4054	3	7798156460061	0	Admin	2023-10-24	\N	\N	1524
4055	3	7798156460290	0	Admin	2023-10-24	\N	\N	529
4056	3	7798156460429	0	Admin	2023-10-24	\N	\N	544
4057	3	7798156460498	0	Admin	2023-10-24	\N	\N	533
4058	3	7798156460740	0	Admin	2023-10-24	\N	\N	1526
4059	3	7798156461051	0	Admin	2023-10-24	\N	\N	539
4060	3	7798156461808	0	Admin	2023-10-24	\N	\N	800
4061	3	7798156461815	0	Admin	2023-10-24	\N	\N	801
4062	3	7798156461853	0	Admin	2023-10-24	\N	\N	545
4063	3	7798156461884	0	Admin	2023-10-24	\N	\N	534
4064	3	7798156462928	0	Admin	2023-10-24	\N	\N	541
4065	3	7798156463185	0	Admin	2023-10-24	\N	\N	543
4066	3	7798166871895	0	Admin	2023-10-24	\N	\N	629
4067	3	7798166871901	0	Admin	2023-10-24	\N	\N	632
4068	3	7798166873134	0	Admin	2023-10-24	\N	\N	634
4069	3	7798166873141	0	Admin	2023-10-24	\N	\N	635
4070	3	7798166873158	0	Admin	2023-10-24	\N	\N	636
4071	3	7798166873165	0	Admin	2023-10-24	\N	\N	633
4072	3	7798166873172	0	Admin	2023-10-24	\N	\N	637
4073	3	7798176420403	0	Admin	2023-10-24	\N	\N	1621
4074	3	7798176420410	0	Admin	2023-10-24	\N	\N	952
4075	3	7798176420434	0	Admin	2023-10-24	\N	\N	953
4076	3	7798176420458	0	Admin	2023-10-24	\N	\N	950
4077	3	7798176420465	0	Admin	2023-10-24	\N	\N	946
4078	3	7798176421073	0	Admin	2023-10-24	\N	\N	863
4079	3	7798176421080	0	Admin	2023-10-24	\N	\N	864
4080	3	7798176421097	0	Admin	2023-10-24	\N	\N	865
4081	3	7798176421103	0	Admin	2023-10-24	\N	\N	866
4082	3	7798176421110	0	Admin	2023-10-24	\N	\N	867
4083	3	7798176421196	0	Admin	2023-10-24	\N	\N	949
4084	3	7798176421202	0	Admin	2023-10-24	\N	\N	951
4085	3	7798176421219	0	Admin	2023-10-24	\N	\N	1638
4086	3	7798176421264	0	Admin	2023-10-24	\N	\N	948
4087	3	7798176421745	0	Admin	2023-10-24	\N	\N	1472
4088	3	7798176421752	0	Admin	2023-10-24	\N	\N	1473
4089	3	7798176421769	0	Admin	2023-10-24	\N	\N	1612
4090	3	7798176421776	0	Admin	2023-10-24	\N	\N	1474
4091	3	7798176421868	0	Admin	2023-10-24	\N	\N	868
4092	3	7798176421875	0	Admin	2023-10-24	\N	\N	869
4093	3	7798176421882	0	Admin	2023-10-24	\N	\N	870
4094	3	7798176421899	0	Admin	2023-10-24	\N	\N	871
4095	3	7798176421905	0	Admin	2023-10-24	\N	\N	872
4096	3	7798176422926	0	Admin	2023-10-24	\N	\N	947
4097	3	7798359710017	0	Admin	2023-10-24	\N	\N	1382
4098	3	7800006000232	0	Admin	2023-10-24	\N	\N	913
4099	3	7800006002038	0	Admin	2023-10-24	\N	\N	912
4100	3	7800006002700	0	Admin	2023-10-24	\N	\N	918
4101	3	7800006002724	0	Admin	2023-10-24	\N	\N	911
4102	3	7800006003370	0	Admin	2023-10-24	\N	\N	915
4103	3	7800006003561	0	Admin	2023-10-24	\N	\N	914
4104	3	7800006003646	0	Admin	2023-10-24	\N	\N	917
4105	3	7800006005169	0	Admin	2023-10-24	\N	\N	916
4106	3	7800019000014	0	Admin	2023-10-24	\N	\N	1446
4107	3	784369477115	0	Admin	2023-10-24	\N	\N	588
4108	3	784369477122	0	Admin	2023-10-24	\N	\N	589
4109	3	7898049715480	0	Admin	2023-10-24	\N	\N	506
4110	3	7898049719273	0	Admin	2023-10-24	\N	\N	1643
4111	3	7898416700040	0	Admin	2023-10-24	\N	\N	517
4112	3	7898416700521	0	Admin	2023-10-24	\N	\N	932
4113	3	7898416700743	0	Admin	2023-10-24	\N	\N	933
4114	3	7898416701344	0	Admin	2023-10-24	\N	\N	929
4115	3	7898416701955	0	Admin	2023-10-24	\N	\N	930
4116	3	7898416701979	0	Admin	2023-10-24	\N	\N	931
4117	3	7898597991329	0	Admin	2023-10-24	\N	\N	525
4118	3	80	0	Admin	2023-10-24	\N	\N	828
4119	3	8010690010908	0	Admin	2023-10-24	\N	\N	43
4120	3	8010690010915	0	Admin	2023-10-24	\N	\N	42
4121	3	8010690010946	0	Admin	2023-10-24	\N	\N	44
4122	3	8010690010991	0	Admin	2023-10-24	\N	\N	46
4123	3	8010690011080	0	Admin	2023-10-24	\N	\N	47
4124	3	8010690011295	0	Admin	2023-10-24	\N	\N	48
4125	3	8010690011301	0	Admin	2023-10-24	\N	\N	50
4126	3	8010690011349	0	Admin	2023-10-24	\N	\N	1554
4127	3	8010690011394	0	Admin	2023-10-24	\N	\N	51
4128	3	8010690011547	0	Admin	2023-10-24	\N	\N	52
4129	3	8010690011745	0	Admin	2023-10-24	\N	\N	53
4130	3	8010690011769	0	Admin	2023-10-24	\N	\N	1553
4131	3	8010690011790	0	Admin	2023-10-24	\N	\N	67
4132	3	8010690011936	0	Admin	2023-10-24	\N	\N	68
4133	3	8010690011967	0	Admin	2023-10-24	\N	\N	70
4134	3	8010690012186	0	Admin	2023-10-24	\N	\N	1538
4135	3	8010690012209	0	Admin	2023-10-24	\N	\N	72
4136	3	8010690012308	0	Admin	2023-10-24	\N	\N	1008
4137	3	8010690012360	0	Admin	2023-10-24	\N	\N	73
4138	3	8010690012476	0	Admin	2023-10-24	\N	\N	74
4139	3	8010690012674	0	Admin	2023-10-24	\N	\N	1009
4140	3	8010690012698	0	Admin	2023-10-24	\N	\N	75
4141	3	8010690014043	0	Admin	2023-10-24	\N	\N	1540
4142	3	8010690025919	0	Admin	2023-10-24	\N	\N	94
4143	3	8010690025926	0	Admin	2023-10-24	\N	\N	95
4144	3	8010690025940	0	Admin	2023-10-24	\N	\N	96
4145	3	8010690025988	0	Admin	2023-10-24	\N	\N	98
4146	3	8010690026015	0	Admin	2023-10-24	\N	\N	99
4147	3	8010690026053	0	Admin	2023-10-24	\N	\N	101
4148	3	8010690026060	0	Admin	2023-10-24	\N	\N	102
4149	3	8010690026084	0	Admin	2023-10-24	\N	\N	103
4150	3	8010690026121	0	Admin	2023-10-24	\N	\N	104
4151	3	8010690026138	0	Admin	2023-10-24	\N	\N	105
4152	3	8010690026152	0	Admin	2023-10-24	\N	\N	106
4153	3	8010690029214	0	Admin	2023-10-24	\N	\N	136
4154	3	8010690029566	0	Admin	2023-10-24	\N	\N	1532
4155	3	8010690029986	0	Admin	2023-10-24	\N	\N	1541
4156	3	8010690029993	0	Admin	2023-10-24	\N	\N	1542
4157	3	8010690030005	0	Admin	2023-10-24	\N	\N	1543
4158	3	8010690030029	0	Admin	2023-10-24	\N	\N	1544
4159	3	8010690037363	0	Admin	2023-10-24	\N	\N	20
4160	3	8010690041926	0	Admin	2023-10-24	\N	\N	58
4161	3	8010690041933	0	Admin	2023-10-24	\N	\N	60
4162	3	8010690041940	0	Admin	2023-10-24	\N	\N	63
4163	3	8010690042084	0	Admin	2023-10-24	\N	\N	1007
4164	3	8010690042091	0	Admin	2023-10-24	\N	\N	57
4165	3	8010690042114	0	Admin	2023-10-24	\N	\N	61
4166	3	8010690042121	0	Admin	2023-10-24	\N	\N	59
4167	3	8010690042145	0	Admin	2023-10-24	\N	\N	65
4168	3	8010690042152	0	Admin	2023-10-24	\N	\N	62
4169	3	8010690047775	0	Admin	2023-10-24	\N	\N	131
4170	3	8010690050072	0	Admin	2023-10-24	\N	\N	54
4171	3	8010690050089	0	Admin	2023-10-24	\N	\N	55
4172	3	8010690050096	0	Admin	2023-10-24	\N	\N	991
4173	3	8010690053677	0	Admin	2023-10-24	\N	\N	1015
4174	3	8010690053691	0	Admin	2023-10-24	\N	\N	1535
4175	3	8010690053714	0	Admin	2023-10-24	\N	\N	1016
4176	3	8010690053738	0	Admin	2023-10-24	\N	\N	997
4177	3	8010690053752	0	Admin	2023-10-24	\N	\N	1530
4178	3	8010690053776	0	Admin	2023-10-24	\N	\N	1531
4179	3	8010690055381	0	Admin	2023-10-24	\N	\N	107
4180	3	8010690055398	0	Admin	2023-10-24	\N	\N	108
4181	3	8010690055404	0	Admin	2023-10-24	\N	\N	109
4182	3	8010690055411	0	Admin	2023-10-24	\N	\N	110
4183	3	8010690055428	0	Admin	2023-10-24	\N	\N	111
4184	3	8010690055435	0	Admin	2023-10-24	\N	\N	112
4185	3	8010690055442	0	Admin	2023-10-24	\N	\N	113
4186	3	8010690055459	0	Admin	2023-10-24	\N	\N	114
4187	3	8010690055466	0	Admin	2023-10-24	\N	\N	115
4188	3	8010690056135	0	Admin	2023-10-24	\N	\N	116
4189	3	8010690056142	0	Admin	2023-10-24	\N	\N	117
4190	3	8010690056159	0	Admin	2023-10-24	\N	\N	118
4191	3	8010690056548	0	Admin	2023-10-24	\N	\N	129
4192	3	8010690056555	0	Admin	2023-10-24	\N	\N	130
4193	3	8010690056562	0	Admin	2023-10-24	\N	\N	134
4194	3	8010690056579	0	Admin	2023-10-24	\N	\N	135
4195	3	8010690056586	0	Admin	2023-10-24	\N	\N	981
4196	3	8010690056616	0	Admin	2023-10-24	\N	\N	1533
4197	3	8010690056630	0	Admin	2023-10-24	\N	\N	1141
4198	3	8010690056647	0	Admin	2023-10-24	\N	\N	137
4199	3	8010690056654	0	Admin	2023-10-24	\N	\N	1142
4200	3	8010690056661	0	Admin	2023-10-24	\N	\N	138
4201	3	8010690057552	0	Admin	2023-10-24	\N	\N	28
4202	3	8010690057569	0	Admin	2023-10-24	\N	\N	29
4203	3	8010690058160	0	Admin	2023-10-24	\N	\N	985
4204	3	8010690059082	0	Admin	2023-10-24	\N	\N	1155
4205	3	8010690061696	0	Admin	2023-10-24	\N	\N	389
4206	3	8010690061702	0	Admin	2023-10-24	\N	\N	25
4207	3	8010690062853	0	Admin	2023-10-24	\N	\N	24
4208	3	8010690067339	0	Admin	2023-10-24	\N	\N	1138
4209	3	8010690068121	0	Admin	2023-10-24	\N	\N	1160
4210	3	8010690068138	0	Admin	2023-10-24	\N	\N	1161
4211	3	8010690080017	0	Admin	2023-10-24	\N	\N	90
4212	3	8010690080024	0	Admin	2023-10-24	\N	\N	91
4213	3	8010690080031	0	Admin	2023-10-24	\N	\N	92
4214	3	8010690088365	0	Admin	2023-10-24	\N	\N	132
4215	3	8010690088457	0	Admin	2023-10-24	\N	\N	1159
4216	3	8010690088563	0	Admin	2023-10-24	\N	\N	1529
4217	3	8010690091471	0	Admin	2023-10-24	\N	\N	982
4218	3	8010690092898	0	Admin	2023-10-24	\N	\N	1539
4219	3	8010690093604	0	Admin	2023-10-24	\N	\N	133
4220	3	8010690099552	0	Admin	2023-10-24	\N	\N	1546
4221	3	8010690101491	0	Admin	2023-10-24	\N	\N	127
4222	3	8010690101507	0	Admin	2023-10-24	\N	\N	128
4223	3	8010690105796	0	Admin	2023-10-24	\N	\N	89
4224	3	8010690105802	0	Admin	2023-10-24	\N	\N	93
4225	3	8010690105819	0	Admin	2023-10-24	\N	\N	97
4226	3	8010690105826	0	Admin	2023-10-24	\N	\N	100
4227	3	8010690105833	0	Admin	2023-10-24	\N	\N	66
4228	3	8010690105840	0	Admin	2023-10-24	\N	\N	69
4229	3	8010690105857	0	Admin	2023-10-24	\N	\N	71
4230	3	8010690105864	0	Admin	2023-10-24	\N	\N	41
4231	3	8010690105871	0	Admin	2023-10-24	\N	\N	45
4232	3	8010690105888	0	Admin	2023-10-24	\N	\N	49
4233	3	8010690106571	0	Admin	2023-10-24	\N	\N	1534
4234	3	8010690107028	0	Admin	2023-10-24	\N	\N	31
4235	3	8010690107134	0	Admin	2023-10-24	\N	\N	32
4236	3	8010690115924	0	Admin	2023-10-24	\N	\N	22
4237	3	8010690122946	0	Admin	2023-10-24	\N	\N	139
4238	3	8010690122953	0	Admin	2023-10-24	\N	\N	140
4239	3	8010690122977	0	Admin	2023-10-24	\N	\N	141
4240	3	8010690122991	0	Admin	2023-10-24	\N	\N	142
4241	3	8010690123004	0	Admin	2023-10-24	\N	\N	143
4242	3	8010690123011	0	Admin	2023-10-24	\N	\N	144
4243	3	8010690123035	0	Admin	2023-10-24	\N	\N	145
4244	3	8010690123059	0	Admin	2023-10-24	\N	\N	146
4245	3	8010690123066	0	Admin	2023-10-24	\N	\N	147
4246	3	8010690123073	0	Admin	2023-10-24	\N	\N	148
4247	3	8010690123097	0	Admin	2023-10-24	\N	\N	164
4248	3	8010690123110	0	Admin	2023-10-24	\N	\N	149
4249	3	8010690123141	0	Admin	2023-10-24	\N	\N	150
4250	3	8010690123158	0	Admin	2023-10-24	\N	\N	151
4251	3	8010690123172	0	Admin	2023-10-24	\N	\N	152
4252	3	8010690123196	0	Admin	2023-10-24	\N	\N	153
4253	3	8010690123202	0	Admin	2023-10-24	\N	\N	154
4254	3	8010690123219	0	Admin	2023-10-24	\N	\N	155
4255	3	8010690123233	0	Admin	2023-10-24	\N	\N	156
4256	3	8010690123257	0	Admin	2023-10-24	\N	\N	157
4257	3	8010690133362	0	Admin	2023-10-24	\N	\N	21
4258	3	8010690140346	0	Admin	2023-10-24	\N	\N	1010
4259	3	8010690140360	0	Admin	2023-10-24	\N	\N	1011
4260	3	8010690140377	0	Admin	2023-10-24	\N	\N	1012
4261	3	8010690140384	0	Admin	2023-10-24	\N	\N	1013
4262	3	8010690148977	0	Admin	2023-10-24	\N	\N	1146
4263	3	8010690149004	0	Admin	2023-10-24	\N	\N	1147
4264	3	8010690149011	0	Admin	2023-10-24	\N	\N	1148
4265	3	8010690149028	0	Admin	2023-10-24	\N	\N	1151
4266	3	8010690149059	0	Admin	2023-10-24	\N	\N	1149
4267	3	8010690149066	0	Admin	2023-10-24	\N	\N	1150
4268	3	8010690149073	0	Admin	2023-10-24	\N	\N	1153
4269	3	8010690149097	0	Admin	2023-10-24	\N	\N	1154
4270	3	8010690149103	0	Admin	2023-10-24	\N	\N	1152
4271	3	8010690153100	0	Admin	2023-10-24	\N	\N	1158
4272	3	8010690153124	0	Admin	2023-10-24	\N	\N	1157
4273	3	8010690153568	0	Admin	2023-10-24	\N	\N	26
4274	3	8010690153582	0	Admin	2023-10-24	\N	\N	27
4275	3	8010690156156	0	Admin	2023-10-24	\N	\N	1179
4276	3	8010690156163	0	Admin	2023-10-24	\N	\N	1180
4277	3	8010690159270	0	Admin	2023-10-24	\N	\N	23
4278	3	8010690159782	0	Admin	2023-10-24	\N	\N	56
4279	3	8010690159867	0	Admin	2023-10-24	\N	\N	64
4280	3	8010690160443	0	Admin	2023-10-24	\N	\N	1144
4281	3	8010690160474	0	Admin	2023-10-24	\N	\N	1143
4282	3	8010690160481	0	Admin	2023-10-24	\N	\N	1145
4283	3	8010690160498	0	Admin	2023-10-24	\N	\N	984
4284	3	8010690160511	0	Admin	2023-10-24	\N	\N	1400
4285	3	8010690164670	0	Admin	2023-10-24	\N	\N	1545
4286	3	8010690166308	0	Admin	2023-10-24	\N	\N	76
4287	3	8010690166315	0	Admin	2023-10-24	\N	\N	77
4288	3	8010690166322	0	Admin	2023-10-24	\N	\N	78
4289	3	8010690166339	0	Admin	2023-10-24	\N	\N	79
4290	3	8010690166346	0	Admin	2023-10-24	\N	\N	80
4291	3	8010690166353	0	Admin	2023-10-24	\N	\N	81
4292	3	8010690166360	0	Admin	2023-10-24	\N	\N	82
4293	3	8010690166377	0	Admin	2023-10-24	\N	\N	83
4294	3	8010690168821	0	Admin	2023-10-24	\N	\N	980
4295	3	8010690172033	0	Admin	2023-10-24	\N	\N	1014
4296	3	8010690175331	0	Admin	2023-10-24	\N	\N	1552
4297	3	8010690175355	0	Admin	2023-10-24	\N	\N	33
4298	3	8010690175362	0	Admin	2023-10-24	\N	\N	34
4299	3	8010690175379	0	Admin	2023-10-24	\N	\N	35
4300	3	8010690175386	0	Admin	2023-10-24	\N	\N	36
4301	3	8010690175409	0	Admin	2023-10-24	\N	\N	37
4302	3	8010690175416	0	Admin	2023-10-24	\N	\N	38
4303	3	8010690175423	0	Admin	2023-10-24	\N	\N	986
4304	3	8010690175454	0	Admin	2023-10-24	\N	\N	988
4305	3	8010690175478	0	Admin	2023-10-24	\N	\N	989
4306	3	8010690175485	0	Admin	2023-10-24	\N	\N	39
4307	3	8010690175492	0	Admin	2023-10-24	\N	\N	990
4308	3	8010690175508	0	Admin	2023-10-24	\N	\N	40
4309	3	8010690175515	0	Admin	2023-10-24	\N	\N	84
4310	3	8010690175522	0	Admin	2023-10-24	\N	\N	85
4311	3	8010690175546	0	Admin	2023-10-24	\N	\N	1537
4312	3	8010690175553	0	Admin	2023-10-24	\N	\N	86
4313	3	8010690175577	0	Admin	2023-10-24	\N	\N	87
4314	3	8010690175584	0	Admin	2023-10-24	\N	\N	88
4315	3	8010690176161	0	Admin	2023-10-24	\N	\N	119
4316	3	8010690176178	0	Admin	2023-10-24	\N	\N	120
4317	3	8010690176208	0	Admin	2023-10-24	\N	\N	121
4318	3	8010690176215	0	Admin	2023-10-24	\N	\N	122
4319	3	8010690176222	0	Admin	2023-10-24	\N	\N	123
4320	3	8010690176260	0	Admin	2023-10-24	\N	\N	124
4321	3	8010690176277	0	Admin	2023-10-24	\N	\N	125
4322	3	8010690176307	0	Admin	2023-10-24	\N	\N	126
4323	3	8010690179445	0	Admin	2023-10-24	\N	\N	1536
4324	3	8010690180076	0	Admin	2023-10-24	\N	\N	998
4325	3	8010690180106	0	Admin	2023-10-24	\N	\N	999
4326	3	8010690180137	0	Admin	2023-10-24	\N	\N	1000
4327	3	8010690180168	0	Admin	2023-10-24	\N	\N	1001
4328	3	8010690180182	0	Admin	2023-10-24	\N	\N	1002
4329	3	8010690180755	0	Admin	2023-10-24	\N	\N	30
4330	3	8010690191065	0	Admin	2023-10-24	\N	\N	1527
4331	3	8010690191089	0	Admin	2023-10-24	\N	\N	1528
4332	3	81	0	Admin	2023-10-24	\N	\N	829
4333	3	811794010850	0	Admin	2023-10-24	\N	\N	1087
4334	3	811794010898	0	Admin	2023-10-24	\N	\N	1432
4335	3	82	0	Admin	2023-10-24	\N	\N	830
4336	3	83	0	Admin	2023-10-24	\N	\N	831
4337	3	84	0	Admin	2023-10-24	\N	\N	832
4338	3	8410650150130	0	Admin	2023-10-24	\N	\N	1480
4339	3	8410650150147	0	Admin	2023-10-24	\N	\N	690
4340	3	8410650150185	0	Admin	2023-10-24	\N	\N	1592
4341	3	8410650150192	0	Admin	2023-10-24	\N	\N	691
4342	3	8410650150253	0	Admin	2023-10-24	\N	\N	1205
4343	3	8410650151892	0	Admin	2023-10-24	\N	\N	1206
4344	3	8410650151946	0	Admin	2023-10-24	\N	\N	1207
4345	3	8410650152264	0	Admin	2023-10-24	\N	\N	693
4346	3	8410650152288	0	Admin	2023-10-24	\N	\N	1200
4347	3	8410650152301	0	Admin	2023-10-24	\N	\N	1204
4348	3	8410650152325	0	Admin	2023-10-24	\N	\N	695
4349	3	8410650152363	0	Admin	2023-10-24	\N	\N	1203
4350	3	8410650152400	0	Admin	2023-10-24	\N	\N	699
4351	3	8410650152448	0	Admin	2023-10-24	\N	\N	698
4352	3	8410650160474	0	Admin	2023-10-24	\N	\N	1557
4353	3	8410650167817	0	Admin	2023-10-24	\N	\N	694
4354	3	8410650168104	0	Admin	2023-10-24	\N	\N	1199
4355	3	8410650168128	0	Admin	2023-10-24	\N	\N	1201
4356	3	8410650170695	0	Admin	2023-10-24	\N	\N	692
4357	3	8410650170718	0	Admin	2023-10-24	\N	\N	1202
4358	3	8410650218649	0	Admin	2023-10-24	\N	\N	696
4359	3	8410650239132	0	Admin	2023-10-24	\N	\N	697
4360	3	842704100095	0	Admin	2023-10-24	\N	\N	834
4361	3	842704100743	0	Admin	2023-10-24	\N	\N	833
4362	3	8433042001582	0	Admin	2023-10-24	\N	\N	1450
4363	3	8436001971605	0	Admin	2023-10-24	\N	\N	793
4364	3	8436001971612	0	Admin	2023-10-24	\N	\N	1635
4365	3	8436001971643	0	Admin	2023-10-24	\N	\N	791
4366	3	8436001971650	0	Admin	2023-10-24	\N	\N	794
4367	3	8436001971681	0	Admin	2023-10-24	\N	\N	792
4368	3	8436001971704	0	Admin	2023-10-24	\N	\N	796
4369	3	8436001971728	0	Admin	2023-10-24	\N	\N	795
4370	3	8436532730030	0	Admin	2023-10-24	\N	\N	853
4371	3	8436532730047	0	Admin	2023-10-24	\N	\N	854
4372	3	8436532730122	0	Admin	2023-10-24	\N	\N	1279
4373	3	8436532730139	0	Admin	2023-10-24	\N	\N	1455
4374	3	8436532730146	0	Admin	2023-10-24	\N	\N	1280
4375	3	8436532730252	0	Admin	2023-10-24	\N	\N	1281
4376	3	8436532730412	0	Admin	2023-10-24	\N	\N	1456
4377	3	8436532730665	0	Admin	2023-10-24	\N	\N	855
4378	3	8470000397516	0	Admin	2023-10-24	\N	\N	1627
4379	3	8470000491269	0	Admin	2023-10-24	\N	\N	1619
4380	3	8470000493195	0	Admin	2023-10-24	\N	\N	1620
4381	3	8470000647512	0	Admin	2023-10-24	\N	\N	1500
4382	3	8470000957512	0	Admin	2023-10-24	\N	\N	1626
4383	3	847922021016	0	Admin	2023-10-24	\N	\N	1003
4384	3	847922021115	0	Admin	2023-10-24	\N	\N	1630
4385	3	847922021191	0	Admin	2023-10-24	\N	\N	1139
4386	3	847922021559	0	Admin	2023-10-24	\N	\N	1004
4387	3	847922021580	0	Admin	2023-10-24	\N	\N	1005
4388	3	847922021610	0	Admin	2023-10-24	\N	\N	1006
4389	3	847922024031	0	Admin	2023-10-24	\N	\N	976
4390	3	847922024048	0	Admin	2023-10-24	\N	\N	977
4391	3	847922027438	0	Admin	2023-10-24	\N	\N	978
4392	3	847922028084	0	Admin	2023-10-24	\N	\N	979
4393	3	847922075613	0	Admin	2023-10-24	\N	\N	161
4394	3	8699245857306	0	Admin	2023-10-24	\N	\N	1379
4395	3	8699245857313	0	Admin	2023-10-24	\N	\N	908
4396	3	8699245857337	0	Admin	2023-10-24	\N	\N	907
4397	3	8699245857351	0	Admin	2023-10-24	\N	\N	1380
4398	3	8699245857399	0	Admin	2023-10-24	\N	\N	1378
4399	3	8699245857405	0	Admin	2023-10-24	\N	\N	909
4400	3	8699245857429	0	Admin	2023-10-24	\N	\N	910
4401	3	8699245857443	0	Admin	2023-10-24	\N	\N	1381
4402	3	8713184080653	0	Admin	2023-10-24	\N	\N	1445
4403	3	8713184134349	0	Admin	2023-10-24	\N	\N	665
4404	3	8713184135278	0	Admin	2023-10-24	\N	\N	666
4405	3	8713184135285	0	Admin	2023-10-24	\N	\N	667
4406	3	8713184135292	0	Admin	2023-10-24	\N	\N	668
4407	3	8713184141408	0	Admin	2023-10-24	\N	\N	669
4408	3	8886467510229	0	Admin	2023-10-24	\N	\N	165
4409	3	8886467510236	0	Admin	2023-10-24	\N	\N	166
4410	3	8886467510250	0	Admin	2023-10-24	\N	\N	167
4411	3	8886467510267	0	Admin	2023-10-24	\N	\N	168
4412	3	8886467510281	0	Admin	2023-10-24	\N	\N	169
4413	3	8886467510311	0	Admin	2023-10-24	\N	\N	170
4414	3	8886467510328	0	Admin	2023-10-24	\N	\N	171
4415	3	8886467510335	0	Admin	2023-10-24	\N	\N	172
4416	3	8886467510410	0	Admin	2023-10-24	\N	\N	173
4417	3	8886467510427	0	Admin	2023-10-24	\N	\N	174
4418	3	8886467510434	0	Admin	2023-10-24	\N	\N	175
4419	3	8886467510441	0	Admin	2023-10-24	\N	\N	176
4420	3	8886467510458	0	Admin	2023-10-24	\N	\N	177
4421	3	8886467510465	0	Admin	2023-10-24	\N	\N	178
4422	3	8886467510588	0	Admin	2023-10-24	\N	\N	179
4423	3	8886467510724	0	Admin	2023-10-24	\N	\N	180
4424	3	8886467510755	0	Admin	2023-10-24	\N	\N	19
4425	3	8886467510830	0	Admin	2023-10-24	\N	\N	181
4426	3	8886467514210	0	Admin	2023-10-24	\N	\N	182
4427	3	8886467514401	0	Admin	2023-10-24	\N	\N	183
4428	3	8886467514418	0	Admin	2023-10-24	\N	\N	184
4429	3	8886467514425	0	Admin	2023-10-24	\N	\N	185
4430	3	8886467514463	0	Admin	2023-10-24	\N	\N	197
4431	3	8886467514470	0	Admin	2023-10-24	\N	\N	186
4432	3	8886467514487	0	Admin	2023-10-24	\N	\N	187
4433	3	8886467514494	0	Admin	2023-10-24	\N	\N	188
4434	3	8886467514579	0	Admin	2023-10-24	\N	\N	189
4435	3	8886467514616	0	Admin	2023-10-24	\N	\N	190
4436	3	8886467514623	0	Admin	2023-10-24	\N	\N	191
4437	3	8886467514630	0	Admin	2023-10-24	\N	\N	192
4438	3	8886467514647	0	Admin	2023-10-24	\N	\N	193
4439	3	8886467514654	0	Admin	2023-10-24	\N	\N	194
4440	3	8886467514661	0	Admin	2023-10-24	\N	\N	195
4441	3	8886467514678	0	Admin	2023-10-24	\N	\N	196
4442	3	8886467514685	0	Admin	2023-10-24	\N	\N	198
4443	3	8886467514692	0	Admin	2023-10-24	\N	\N	199
4444	3	8886467514715	0	Admin	2023-10-24	\N	\N	200
4445	3	8886467514722	0	Admin	2023-10-24	\N	\N	905
4446	3	8886467514739	0	Admin	2023-10-24	\N	\N	201
4447	3	8886467514746	0	Admin	2023-10-24	\N	\N	202
4448	3	8886467514760	0	Admin	2023-10-24	\N	\N	203
4449	3	8886467514814	0	Admin	2023-10-24	\N	\N	204
4450	3	8886467514821	0	Admin	2023-10-24	\N	\N	205
4451	3	8886467514906	0	Admin	2023-10-24	\N	\N	206
4452	3	8886467514920	0	Admin	2023-10-24	\N	\N	207
4453	3	8886467515521	0	Admin	2023-10-24	\N	\N	1385
4454	3	8886467515644	0	Admin	2023-10-24	\N	\N	208
4455	3	8886467515811	0	Admin	2023-10-24	\N	\N	209
4456	3	8886467515866	0	Admin	2023-10-24	\N	\N	210
4457	3	8886467515897	0	Admin	2023-10-24	\N	\N	211
4458	3	8886467515927	0	Admin	2023-10-24	\N	\N	212
4459	3	8886467515934	0	Admin	2023-10-24	\N	\N	213
4460	3	8886467515965	0	Admin	2023-10-24	\N	\N	214
4461	3	8886467520112	0	Admin	2023-10-24	\N	\N	215
4462	3	8886467520129	0	Admin	2023-10-24	\N	\N	216
4463	3	8886467520136	0	Admin	2023-10-24	\N	\N	217
4464	3	88864675201368886467520136	0	Admin	2023-10-24	\N	\N	1614
4465	3	8886467520143	0	Admin	2023-10-24	\N	\N	218
4466	3	8886467520150	0	Admin	2023-10-24	\N	\N	219
4467	3	8886467523212	0	Admin	2023-10-24	\N	\N	220
4468	3	8886467523229	0	Admin	2023-10-24	\N	\N	221
4469	3	8886467523236	0	Admin	2023-10-24	\N	\N	222
4470	3	8886467523243	0	Admin	2023-10-24	\N	\N	223
4471	3	8886467523250	0	Admin	2023-10-24	\N	\N	224
4472	3	8886467523267	0	Admin	2023-10-24	\N	\N	225
4473	3	8886467523274	0	Admin	2023-10-24	\N	\N	226
4474	3	8886467523298	0	Admin	2023-10-24	\N	\N	228
4475	3	8886467523311	0	Admin	2023-10-24	\N	\N	227
4476	3	8886467523328	0	Admin	2023-10-24	\N	\N	229
4477	3	8886467523335	0	Admin	2023-10-24	\N	\N	230
4478	3	8886467523342	0	Admin	2023-10-24	\N	\N	231
4479	3	8886467523356	0	Admin	2023-10-24	\N	\N	1075
4480	3	8886467523359	0	Admin	2023-10-24	\N	\N	232
4481	3	8886467523366	0	Admin	2023-10-24	\N	\N	233
4482	3	8886467523373	0	Admin	2023-10-24	\N	\N	234
4483	3	8886467523380	0	Admin	2023-10-24	\N	\N	235
4484	3	8886467523397	0	Admin	2023-10-24	\N	\N	236
4485	3	8886467523410	0	Admin	2023-10-24	\N	\N	237
4486	3	8886467523427	0	Admin	2023-10-24	\N	\N	238
4487	3	8886467523434	0	Admin	2023-10-24	\N	\N	239
4488	3	8886467523441	0	Admin	2023-10-24	\N	\N	240
4489	3	8886467523458	0	Admin	2023-10-24	\N	\N	241
4490	3	8886467523465	0	Admin	2023-10-24	\N	\N	242
4491	3	8886467523472	0	Admin	2023-10-24	\N	\N	243
4492	3	8886467523489	0	Admin	2023-10-24	\N	\N	244
4493	3	8886467523496	0	Admin	2023-10-24	\N	\N	245
4494	3	8886467523625	0	Admin	2023-10-24	\N	\N	246
4495	3	8886467523632	0	Admin	2023-10-24	\N	\N	247
4496	3	8886467523649	0	Admin	2023-10-24	\N	\N	248
4497	3	8886467523823	0	Admin	2023-10-24	\N	\N	992
4498	3	8886467523830	0	Admin	2023-10-24	\N	\N	993
4499	3	8886467523847	0	Admin	2023-10-24	\N	\N	994
4500	3	8886467525018	0	Admin	2023-10-24	\N	\N	249
4501	3	8886467525049	0	Admin	2023-10-24	\N	\N	250
4502	3	8886467525117	0	Admin	2023-10-24	\N	\N	251
4503	3	8886467525124	0	Admin	2023-10-24	\N	\N	252
4504	3	8886467525322	0	Admin	2023-10-24	\N	\N	253
4505	3	8886467525339	0	Admin	2023-10-24	\N	\N	254
4506	3	8886467525346	0	Admin	2023-10-24	\N	\N	255
4507	3	8886467525353	0	Admin	2023-10-24	\N	\N	256
4508	3	8886467525711	0	Admin	2023-10-24	\N	\N	257
4509	3	8886467525735	0	Admin	2023-10-24	\N	\N	258
4510	3	8886467525742	0	Admin	2023-10-24	\N	\N	259
4511	3	8886467525759	0	Admin	2023-10-24	\N	\N	260
4512	3	8886467529719	0	Admin	2023-10-24	\N	\N	261
4513	3	8886467529726	0	Admin	2023-10-24	\N	\N	262
4514	3	8886467529733	0	Admin	2023-10-24	\N	\N	263
4515	3	8886467529740	0	Admin	2023-10-24	\N	\N	264
4516	3	8886467530067	0	Admin	2023-10-24	\N	\N	265
4517	3	8886467530128	0	Admin	2023-10-24	\N	\N	266
4518	3	8886467530135	0	Admin	2023-10-24	\N	\N	267
4519	3	8886467530142	0	Admin	2023-10-24	\N	\N	268
4520	3	8886467530159	0	Admin	2023-10-24	\N	\N	269
4521	3	8886467530302	0	Admin	2023-10-24	\N	\N	270
4522	3	8886467530319	0	Admin	2023-10-24	\N	\N	271
4523	3	8886467530326	0	Admin	2023-10-24	\N	\N	272
4524	3	8886467530333	0	Admin	2023-10-24	\N	\N	273
4525	3	8886467530340	0	Admin	2023-10-24	\N	\N	274
4526	3	8886467530364	0	Admin	2023-10-24	\N	\N	275
4527	3	8886467530371	0	Admin	2023-10-24	\N	\N	276
4528	3	8886467530388	0	Admin	2023-10-24	\N	\N	277
4529	3	8886467530500	0	Admin	2023-10-24	\N	\N	278
4530	3	8886467531019	0	Admin	2023-10-24	\N	\N	279
4531	3	8886467531026	0	Admin	2023-10-24	\N	\N	280
4532	3	8886467531033	0	Admin	2023-10-24	\N	\N	281
4533	3	8886467531040	0	Admin	2023-10-24	\N	\N	282
4534	3	8886467532115	0	Admin	2023-10-24	\N	\N	283
4535	3	8886467532122	0	Admin	2023-10-24	\N	\N	906
4536	3	8886467532139	0	Admin	2023-10-24	\N	\N	284
4537	3	8886467532160	0	Admin	2023-10-24	\N	\N	285
4538	3	8886467532177	0	Admin	2023-10-24	\N	\N	286
4539	3	8886467532214	0	Admin	2023-10-24	\N	\N	287
4540	3	8886467532221	0	Admin	2023-10-24	\N	\N	288
4541	3	8886467532238	0	Admin	2023-10-24	\N	\N	289
4542	3	8886467532269	0	Admin	2023-10-24	\N	\N	290
4543	3	8886467532276	0	Admin	2023-10-24	\N	\N	291
4544	3	8886467532313	0	Admin	2023-10-24	\N	\N	292
4545	3	8886467532320	0	Admin	2023-10-24	\N	\N	293
4546	3	8886467532337	0	Admin	2023-10-24	\N	\N	294
4547	3	8886467532368	0	Admin	2023-10-24	\N	\N	295
4548	3	8886467532375	0	Admin	2023-10-24	\N	\N	296
4549	3	8886467532412	0	Admin	2023-10-24	\N	\N	297
4550	3	8886467532429	0	Admin	2023-10-24	\N	\N	298
4551	3	8886467532436	0	Admin	2023-10-24	\N	\N	299
4552	3	8886467532450	0	Admin	2023-10-24	\N	\N	300
4553	3	8886467532467	0	Admin	2023-10-24	\N	\N	301
4554	3	8886467532474	0	Admin	2023-10-24	\N	\N	302
4555	3	8886467532511	0	Admin	2023-10-24	\N	\N	303
4556	3	8886467532528	0	Admin	2023-10-24	\N	\N	304
4557	3	8886467532535	0	Admin	2023-10-24	\N	\N	305
4558	3	8886467532559	0	Admin	2023-10-24	\N	\N	306
4559	3	8886467532566	0	Admin	2023-10-24	\N	\N	307
4560	3	8886467532573	0	Admin	2023-10-24	\N	\N	308
4561	3	8886467532634	0	Admin	2023-10-24	\N	\N	309
4562	3	8886467535222	0	Admin	2023-10-24	\N	\N	310
4563	3	8886467535239	0	Admin	2023-10-24	\N	\N	311
4564	3	8886467535246	0	Admin	2023-10-24	\N	\N	312
4565	3	8886467535321	0	Admin	2023-10-24	\N	\N	313
4566	3	8886467535413	0	Admin	2023-10-24	\N	\N	314
4567	3	8886467535420	0	Admin	2023-10-24	\N	\N	315
4568	3	8886467535437	0	Admin	2023-10-24	\N	\N	316
4569	3	8886467535536	0	Admin	2023-10-24	\N	\N	317
4570	3	8886467535543	0	Admin	2023-10-24	\N	\N	318
4571	3	8886467535611	0	Admin	2023-10-24	\N	\N	319
4572	3	8886467535628	0	Admin	2023-10-24	\N	\N	320
4573	3	8886467535635	0	Admin	2023-10-24	\N	\N	321
4574	3	8886467535642	0	Admin	2023-10-24	\N	\N	322
4575	3	8886467541018	0	Admin	2023-10-24	\N	\N	323
4576	3	8886467541025	0	Admin	2023-10-24	\N	\N	324
4577	3	8886467541032	0	Admin	2023-10-24	\N	\N	325
4578	3	8886467541117	0	Admin	2023-10-24	\N	\N	935
4579	3	8886467541124	0	Admin	2023-10-24	\N	\N	326
4580	3	8886467541131	0	Admin	2023-10-24	\N	\N	1156
4581	3	8886467541148	0	Admin	2023-10-24	\N	\N	327
4582	3	8886467544712	0	Admin	2023-10-24	\N	\N	328
4583	3	8886467545030	0	Admin	2023-10-24	\N	\N	329
4584	3	8886467545047	0	Admin	2023-10-24	\N	\N	330
4585	3	8886467545054	0	Admin	2023-10-24	\N	\N	331
4586	3	8886467545061	0	Admin	2023-10-24	\N	\N	332
4587	3	8886467545078	0	Admin	2023-10-24	\N	\N	333
4588	3	8886467545085	0	Admin	2023-10-24	\N	\N	334
4589	3	8886467545399	0	Admin	2023-10-24	\N	\N	335
4590	3	8886467545412	0	Admin	2023-10-24	\N	\N	1140
4591	3	8886467545467	0	Admin	2023-10-24	\N	\N	336
4592	3	8886467545542	0	Admin	2023-10-24	\N	\N	995
4593	3	8886467545702	0	Admin	2023-10-24	\N	\N	337
4594	3	8886467545719	0	Admin	2023-10-24	\N	\N	338
4595	3	8886467545726	0	Admin	2023-10-24	\N	\N	339
4596	3	8886467546013	0	Admin	2023-10-24	\N	\N	340
4597	3	8886467546037	0	Admin	2023-10-24	\N	\N	341
4598	3	8886467546044	0	Admin	2023-10-24	\N	\N	342
4599	3	8886467546198	0	Admin	2023-10-24	\N	\N	343
4600	3	8886467546211	0	Admin	2023-10-24	\N	\N	344
4601	3	8886467546327	0	Admin	2023-10-24	\N	\N	162
4602	3	8886467546334	0	Admin	2023-10-24	\N	\N	345
4603	3	8886467546341	0	Admin	2023-10-24	\N	\N	163
4604	3	8886467546617	0	Admin	2023-10-24	\N	\N	346
4605	3	8886467546648	0	Admin	2023-10-24	\N	\N	996
4606	3	8886467546655	0	Admin	2023-10-24	\N	\N	974
4607	3	8886467546662	0	Admin	2023-10-24	\N	\N	973
4608	3	8886467546969	0	Admin	2023-10-24	\N	\N	975
4609	3	8886467547546	0	Admin	2023-10-24	\N	\N	347
4610	3	8886467548512	0	Admin	2023-10-24	\N	\N	348
4611	3	8886467548536	0	Admin	2023-10-24	\N	\N	349
4612	3	8886467548710	0	Admin	2023-10-24	\N	\N	350
4613	3	8886467548772	0	Admin	2023-10-24	\N	\N	351
4614	3	8886467548789	0	Admin	2023-10-24	\N	\N	352
4615	3	8886467548796	0	Admin	2023-10-24	\N	\N	353
4616	3	8886467548826	0	Admin	2023-10-24	\N	\N	354
4617	3	8886467548840	0	Admin	2023-10-24	\N	\N	355
4618	3	8886467548864	0	Admin	2023-10-24	\N	\N	356
4619	3	8886467548888	0	Admin	2023-10-24	\N	\N	357
4620	3	8886467548925	0	Admin	2023-10-24	\N	\N	358
4621	3	8886467548932	0	Admin	2023-10-24	\N	\N	359
4622	3	8886467548949	0	Admin	2023-10-24	\N	\N	360
4623	3	8886467580000	0	Admin	2023-10-24	\N	\N	361
4624	3	8886467580017	0	Admin	2023-10-24	\N	\N	362
4625	3	8886467580024	0	Admin	2023-10-24	\N	\N	363
4626	3	8886467580062	0	Admin	2023-10-24	\N	\N	364
4627	3	8886467580079	0	Admin	2023-10-24	\N	\N	365
4628	3	8886467580086	0	Admin	2023-10-24	\N	\N	366
4629	3	8886467580093	0	Admin	2023-10-24	\N	\N	367
4630	3	8886467580109	0	Admin	2023-10-24	\N	\N	368
4631	3	8886467580116	0	Admin	2023-10-24	\N	\N	369
4632	3	8886467580147	0	Admin	2023-10-24	\N	\N	370
4633	3	8886467580161	0	Admin	2023-10-24	\N	\N	371
4634	3	8886467580178	0	Admin	2023-10-24	\N	\N	372
4635	3	8886467580185	0	Admin	2023-10-24	\N	\N	373
4636	3	8886467580208	0	Admin	2023-10-24	\N	\N	374
4637	3	8886467580215	0	Admin	2023-10-24	\N	\N	375
4638	3	8886467580222	0	Admin	2023-10-24	\N	\N	376
4639	3	8886467580413	0	Admin	2023-10-24	\N	\N	377
4640	3	8886467581465	0	Admin	2023-10-24	\N	\N	972
4641	3	8886467582059	0	Admin	2023-10-24	\N	\N	378
4642	3	8886467584954	0	Admin	2023-10-24	\N	\N	379
4643	3	8886467584961	0	Admin	2023-10-24	\N	\N	380
4644	3	8886467585814	0	Admin	2023-10-24	\N	\N	381
4645	3	8886467585913	0	Admin	2023-10-24	\N	\N	382
4646	3	8886467586347	0	Admin	2023-10-24	\N	\N	383
4647	3	8886467589010	0	Admin	2023-10-24	\N	\N	384
4648	3	8886467589317	0	Admin	2023-10-24	\N	\N	385
4649	3	8886467589478	0	Admin	2023-10-24	\N	\N	386
4650	3	8886467589485	0	Admin	2023-10-24	\N	\N	387
4651	3	8900950297173	0	Admin	2023-10-24	\N	\N	1304
4652	3	8900950297180	0	Admin	2023-10-24	\N	\N	1303
4653	3	8901138501242	0	Admin	2023-10-24	\N	\N	723
4654	3	8901138501297	0	Admin	2023-10-24	\N	\N	724
4655	3	8901138511333	0	Admin	2023-10-24	\N	\N	721
4656	3	8901138511340	0	Admin	2023-10-24	\N	\N	722
4657	3	90	0	Admin	2023-10-24	\N	\N	945
4658	3	9003579000519	0	Admin	2023-10-24	\N	\N	392
4659	3	9003579000748	0	Admin	2023-10-24	\N	\N	419
4660	3	9003579001172	0	Admin	2023-10-24	\N	\N	1083
4661	3	9003579013557	0	Admin	2023-10-24	\N	\N	1099
4662	3	9003579018514	0	Admin	2023-10-24	\N	\N	1097
4663	3	9003579018866	0	Admin	2023-10-24	\N	\N	1177
4664	3	9003579018941	0	Admin	2023-10-24	\N	\N	1176
4665	3	9003579307717	0	Admin	2023-10-24	\N	\N	423
4666	3	9003579308936	0	Admin	2023-10-24	\N	\N	1090
4667	3	9003579308943	0	Admin	2023-10-24	\N	\N	424
4668	3	9003579309445	0	Admin	2023-10-24	\N	\N	429
4669	3	9003579309469	0	Admin	2023-10-24	\N	\N	400
4670	3	9003579310632	0	Admin	2023-10-24	\N	\N	404
4671	3	9003579311004	0	Admin	2023-10-24	\N	\N	444
4672	3	9003579311462	0	Admin	2023-10-24	\N	\N	422
4673	3	9003579311851	0	Admin	2023-10-24	\N	\N	435
4674	3	91009	0	Admin	2023-10-24	\N	\N	1488
4675	3	91012	0	Admin	2023-10-24	\N	\N	1490
4676	3	91013	0	Admin	2023-10-24	\N	\N	1491
4677	3	91015	0	Admin	2023-10-24	\N	\N	1489
4678	3	911emergencia	0	Admin	2023-10-24	\N	\N	1343
4679	3	9333527021861	0	Admin	2023-10-24	\N	\N	1481
4680	3	9333527230447	0	Admin	2023-10-24	\N	\N	1093
4681	3	9333527329240	0	Admin	2023-10-24	\N	\N	1085
4682	3	9333527329257	0	Admin	2023-10-24	\N	\N	1094
4683	3	9333527341037	0	Admin	2023-10-24	\N	\N	1107
4684	3	9333527377852	0	Admin	2023-10-24	\N	\N	1084
4685	3	9333527426642	0	Admin	2023-10-24	\N	\N	1092
4686	3	9333527443670	0	Admin	2023-10-24	\N	\N	1089
4687	3	9333527586469	0	Admin	2023-10-24	\N	\N	1095
4688	3	9505903	0	Admin	2023-10-24	\N	\N	1268
4689	3	9505904	0	Admin	2023-10-24	\N	\N	1266
4690	3	9505905	0	Admin	2023-10-24	\N	\N	1265
4691	3	99-26191	0	Admin	2023-10-24	\N	\N	1244
4692	3	A1014	0	Admin	2023-10-24	\N	\N	625
4693	3	AB01S	0	Admin	2023-10-24	\N	\N	1296
4694	3	AB02M	0	Admin	2023-10-24	\N	\N	1297
4695	3	AB03L	0	Admin	2023-10-24	\N	\N	1298
4696	3	AC01	0	Admin	2023-10-24	\N	\N	1192
4697	3	AC01S	0	Admin	2023-10-24	\N	\N	1320
4698	3	AC02M	0	Admin	2023-10-24	\N	\N	1230
4699	3	AF001S	0	Admin	2023-10-24	\N	\N	1603
4700	3	ALP001	0	Admin	2023-10-24	\N	\N	741
4701	3	AMOXITABS250	0	Admin	2023-10-24	\N	\N	1513
4702	3	ANXIVET	0	Admin	2023-10-24	\N	\N	1170
4703	3	ARTROVET	0	Admin	2023-10-24	\N	\N	1168
4704	3	Atropina01	0	Admin	2023-10-24	\N	\N	516
4705	3	AUMENTA	0	Admin	2023-10-24	\N	\N	1558
4706	3	BAEP00	0	Admin	2023-10-24	\N	\N	558
4707	3	BAN0	0	Admin	2023-10-24	\N	\N	559
4708	3	BC1050032021	0	Admin	2023-10-24	\N	\N	628
4709	3	BCTH2101C	0	Admin	2023-10-24	\N	\N	1606
4710	3	BHL001	0	Admin	2023-10-24	\N	\N	1421
4711	3	BHM001	0	Admin	2023-10-24	\N	\N	1422
4712	3	BHS001	0	Admin	2023-10-24	\N	\N	1423
4713	3	BHXS001	0	Admin	2023-10-24	\N	\N	1424
4714	3	BL01-S	0	Admin	2023-10-24	\N	\N	1346
4715	3	BL-02	0	Admin	2023-10-24	\N	\N	1182
4716	3	BL02-M	0	Admin	2023-10-24	\N	\N	1347
4717	3	BL03-L	0	Admin	2023-10-24	\N	\N	1348
4718	3	BL04-XL	0	Admin	2023-10-24	\N	\N	1349
4719	3	BOSAL#0	0	Admin	2023-10-24	\N	\N	1232
4720	3	BROADLINE	0	Admin	2023-10-24	\N	\N	777
4721	3	BVL001	0	Admin	2023-10-24	\N	\N	1425
4722	3	BVM001	0	Admin	2023-10-24	\N	\N	1426
4723	3	BVS001	0	Admin	2023-10-24	\N	\N	1427
4724	3	C20-M	0	Admin	2023-10-24	\N	\N	602
4725	3	C20-S	0	Admin	2023-10-24	\N	\N	601
4726	3	C20-XL	0	Admin	2023-10-24	\N	\N	603
4727	3	C21-L	0	Admin	2023-10-24	\N	\N	606
4728	3	C21-M	0	Admin	2023-10-24	\N	\N	605
4729	3	C21-S	0	Admin	2023-10-24	\N	\N	604
4730	3	C21-XL	0	Admin	2023-10-24	\N	\N	607
4731	3	C22-1	0	Admin	2023-10-24	\N	\N	1248
4732	3	C22-2	0	Admin	2023-10-24	\N	\N	1249
4733	3	C22-3	0	Admin	2023-10-24	\N	\N	1250
4734	3	CAM2030	0	Admin	2023-10-24	\N	\N	568
4735	3	CAM2435	0	Admin	2023-10-24	\N	\N	570
4736	3	CAM2840	0	Admin	2023-10-24	\N	\N	572
4737	3	cardiovet	0	Admin	2023-10-24	\N	\N	1171
4738	3	CARPRODYL100	0	Admin	2023-10-24	\N	\N	1515
4739	3	CARPRODYL25	0	Admin	2023-10-24	\N	\N	1506
4740	3	CD02M	0	Admin	2023-10-24	\N	\N	1308
4741	3	CD03L	0	Admin	2023-10-24	\N	\N	1309
4742	3	CefaCure	0	Admin	2023-10-24	\N	\N	659
4743	3	CIPROTABS250	0	Admin	2023-10-24	\N	\N	1507
4744	3	CORTA3807	0	Admin	2023-10-24	\N	\N	1227
4745	3	DE013-M	0	Admin	2023-10-24	\N	\N	595
4746	3	doramectina	0	Admin	2023-10-24	\N	\N	1174
4747	3	Dufamox15	0	Admin	2023-10-24	\N	\N	524
4748	3	FARM044	0	Admin	2023-10-24	\N	\N	1079
4749	3	FARM046	0	Admin	2023-10-24	\N	\N	1080
4750	3	FARM141	0	Admin	2023-10-24	\N	\N	1081
4751	3	FC088	0	Admin	2023-10-24	\N	\N	1197
4752	3	FG01-S	0	Admin	2023-10-24	\N	\N	1350
4753	3	FG02-M	0	Admin	2023-10-24	\N	\N	1351
4754	3	FG03-L	0	Admin	2023-10-24	\N	\N	1352
4755	3	FG04XL	0	Admin	2023-10-24	\N	\N	1353
4756	3	FGEZ1002	0	Admin	2023-10-24	\N	\N	1608
4757	3	G003	0	Admin	2023-10-24	\N	\N	1605
4758	3	G0M3101S	0	Admin	2023-10-24	\N	\N	1600
4759	3	G0M3102M	0	Admin	2023-10-24	\N	\N	1609
4760	3	gentamicina	0	Admin	2023-10-24	\N	\N	1175
4761	3	H2-S	0	Admin	2023-10-24	\N	\N	608
4762	3	H3-L	0	Admin	2023-10-24	\N	\N	611
4763	3	H3-M	0	Admin	2023-10-24	\N	\N	610
4764	3	H3-S	0	Admin	2023-10-24	\N	\N	609
4765	3	H3-XL	0	Admin	2023-10-24	\N	\N	612
4766	3	H4-L	0	Admin	2023-10-24	\N	\N	614
4767	3	H4-M	0	Admin	2023-10-24	\N	\N	613
4768	3	H4-XL	0	Admin	2023-10-24	\N	\N	615
4769	3	HEARTGARDL	0	Admin	2023-10-24	\N	\N	788
4770	3	HEARTGARDM	0	Admin	2023-10-24	\N	\N	787
4771	3	HEARTGARDS	0	Admin	2023-10-24	\N	\N	786
4772	3	HEMOVITB12	0	Admin	2023-10-24	\N	\N	729
4773	3	HEPATOVET	0	Admin	2023-10-24	\N	\N	1172
4774	3	HI01S	0	Admin	2023-10-24	\N	\N	1324
4775	3	HI02M	0	Admin	2023-10-24	\N	\N	1325
4776	3	HI03L	0	Admin	2023-10-24	\N	\N	1326
4777	3	HTB031-2	0	Admin	2023-10-24	\N	\N	586
4778	3	HTGC019	0	Admin	2023-10-24	\N	\N	557
4779	3	ij-02	0	Admin	2023-10-24	\N	\N	1181
4780	3	IJ03	0	Admin	2023-10-24	\N	\N	1241
4781	3	IP001ML	0	Admin	2023-10-24	\N	\N	546
4782	3	JD01	0	Admin	2023-10-24	\N	\N	1604
4783	3	JD02	0	Admin	2023-10-24	\N	\N	1597
4784	3	JHP951	0	Admin	2023-10-24	\N	\N	1277
4785	3	JK901L	0	Admin	2023-10-24	\N	\N	1369
4786	3	JK901M	0	Admin	2023-10-24	\N	\N	1370
4787	3	JK901S	0	Admin	2023-10-24	\N	\N	1371
4788	3	K002	0	Admin	2023-10-24	\N	\N	1235
4789	3	K9-L	0	Admin	2023-10-24	\N	\N	1240
4790	3	KD01	0	Admin	2023-10-24	\N	\N	1190
4791	3	KETOVET	0	Admin	2023-10-24	\N	\N	847
4792	3	KL01XS	0	Admin	2023-10-24	\N	\N	1310
4793	3	KL02S	0	Admin	2023-10-24	\N	\N	1311
4794	3	KL03M	0	Admin	2023-10-24	\N	\N	1312
4795	3	KL04L	0	Admin	2023-10-24	\N	\N	1313
4796	3	KL05XL	0	Admin	2023-10-24	\N	\N	1314
4797	3	KM0110MM	0	Admin	2023-10-24	\N	\N	1302
4798	3	KM0212MM	0	Admin	2023-10-24	\N	\N	1299
4799	3	KN0110MM	0	Admin	2023-10-24	\N	\N	1342
4800	3	KN0212MM	0	Admin	2023-10-24	\N	\N	1340
4801	3	KN0315MM	0	Admin	2023-10-24	\N	\N	1341
4802	3	KP01S	0	Admin	2023-10-24	\N	\N	1191
4803	3	KR01	0	Admin	2023-10-24	\N	\N	1195
4804	3	kS15MM	0	Admin	2023-10-24	\N	\N	1239
4805	3	KT01XXS	0	Admin	2023-10-24	\N	\N	1362
4806	3	KT02XS	0	Admin	2023-10-24	\N	\N	1363
4807	3	KT03S	0	Admin	2023-10-24	\N	\N	1323
4808	3	KU01XXS	0	Admin	2023-10-24	\N	\N	1338
4809	3	KU02XS	0	Admin	2023-10-24	\N	\N	1337
4810	3	KV01XXS	0	Admin	2023-10-24	\N	\N	1231
4811	3	KV03S	0	Admin	2023-10-24	\N	\N	1339
4812	3	KW01XXS	0	Admin	2023-10-24	\N	\N	1336
4813	3	KW02XS	0	Admin	2023-10-24	\N	\N	1333
4814	3	KW03S	0	Admin	2023-10-24	\N	\N	1334
4815	3	KW04M	0	Admin	2023-10-24	\N	\N	1335
4816	3	L1003	0	Admin	2023-10-24	\N	\N	598
4817	3	LM-01	0	Admin	2023-10-24	\N	\N	1185
4818	3	LM-02	0	Admin	2023-10-24	\N	\N	1186
4819	3	LM-03	0	Admin	2023-10-24	\N	\N	1187
4820	3	LM-902-L	0	Admin	2023-10-24	\N	\N	1366
4821	3	LM902M	0	Admin	2023-10-24	\N	\N	1367
4822	3	LM902S	0	Admin	2023-10-24	\N	\N	1368
4823	3	M610	0	Admin	2023-10-24	\N	\N	597
4824	3	M9D228135	0	Admin	2023-10-24	\N	\N	1114
4825	3	M9D22826	0	Admin	2023-10-24	\N	\N	1113
4826	3	M9D22838-L	0	Admin	2023-10-24	\N	\N	1110
4827	3	M9D22838-M	0	Admin	2023-10-24	\N	\N	1109
4828	3	M9D22838-S	0	Admin	2023-10-24	\N	\N	1108
4829	3	M9D22838-XL	0	Admin	2023-10-24	\N	\N	1111
4830	3	M9D22868	0	Admin	2023-10-24	\N	\N	1112
4831	3	Metronidazole	0	Admin	2023-10-24	\N	\N	861
4832	3	MN03	0	Admin	2023-10-24	\N	\N	1193
4833	3	MN05-XL	0	Admin	2023-10-24	\N	\N	1225
4834	3	MP1831	0	Admin	2023-10-24	\N	\N	1486
4835	3	MP1855	0	Admin	2023-10-24	\N	\N	1487
4836	3	MU01	0	Admin	2023-10-24	\N	\N	1229
4837	3	MU01S	0	Admin	2023-10-24	\N	\N	1364
4838	3	MU02	0	Admin	2023-10-24	\N	\N	1228
4839	3	MU02M	0	Admin	2023-10-24	\N	\N	1365
4840	3	N026I21	0	Admin	2023-10-24	\N	\N	1433
4841	3	NO02-S	0	Admin	2023-10-24	\N	\N	1359
4842	3	NO03-M	0	Admin	2023-10-24	\N	\N	1360
4843	3	NO04-L	0	Admin	2023-10-24	\N	\N	1361
4844	3	no05xl	0	Admin	2023-10-24	\N	\N	1287
4845	3	OMPASTA-01	0	Admin	2023-10-24	\N	\N	504
4846	3	OP01S	0	Admin	2023-10-24	\N	\N	1331
4847	3	OP02M	0	Admin	2023-10-24	\N	\N	1332
4848	3	OPTIVET	0	Admin	2023-10-24	\N	\N	1169
4849	3	OV115	0	Admin	2023-10-24	\N	\N	542
4850	3	P002L	0	Admin	2023-10-24	\N	\N	1636
4851	3	P1089	0	Admin	2023-10-24	\N	\N	1373
4852	3	P1118-PP-B7	0	Admin	2023-10-24	\N	\N	1196
4853	3	P518	0	Admin	2023-10-24	\N	\N	575
4854	3	P518-1	0	Admin	2023-10-24	\N	\N	574
4855	3	P519	0	Admin	2023-10-24	\N	\N	576
4856	3	P520	0	Admin	2023-10-24	\N	\N	577
4857	3	P521	0	Admin	2023-10-24	\N	\N	578
4858	3	P522	0	Admin	2023-10-24	\N	\N	579
4859	3	P523	0	Admin	2023-10-24	\N	\N	580
4860	3	P924	0	Admin	2023-10-24	\N	\N	554
4861	3	P935	0	Admin	2023-10-24	\N	\N	551
4862	3	PALETAS	0	Admin	2023-10-24	\N	\N	1640
4863	3	PEC001	0	Admin	2023-10-24	\N	\N	742
4864	3	PECH273	0	Admin	2023-10-24	\N	\N	1595
4865	3	PH2088	0	Admin	2023-10-24	\N	\N	1431
4866	3	PL01	0	Admin	2023-10-24	\N	\N	1601
4867	3	QR01	0	Admin	2023-10-24	\N	\N	1194
4868	3	QR01XS	0	Admin	2023-10-24	\N	\N	1321
4869	3	QR02	0	Admin	2023-10-24	\N	\N	1238
4870	3	QR02S	0	Admin	2023-10-24	\N	\N	1322
4871	3	quino-01	0	Admin	2023-10-24	\N	\N	456
4872	3	RANITIDINVET	0	Admin	2023-10-24	\N	\N	849
4873	3	RAR2002	0	Admin	2023-10-24	\N	\N	1607
4874	3	RS02	0	Admin	2023-10-24	\N	\N	1243
4875	3	RS02S	0	Admin	2023-10-24	\N	\N	1329
4876	3	RS03L	0	Admin	2023-10-24	\N	\N	1330
4877	3	RS03-L	0	Admin	2023-10-24	\N	\N	1226
4878	3	ST0101	0	Admin	2023-10-24	\N	\N	862
4879	3	ST01XS	0	Admin	2023-10-24	\N	\N	1315
4880	3	ST02S	0	Admin	2023-10-24	\N	\N	1316
4881	3	ST03M	0	Admin	2023-10-24	\N	\N	1317
4882	3	ST04L	0	Admin	2023-10-24	\N	\N	1318
4883	3	ST05XL	0	Admin	2023-10-24	\N	\N	1319
4884	3	stickerzone01	0	Admin	2023-10-24	\N	\N	860
4885	3	STOMORGYL10	0	Admin	2023-10-24	\N	\N	789
4886	3	SU01	0	Admin	2023-10-24	\N	\N	1233
4887	3	SU02	0	Admin	2023-10-24	\N	\N	1189
4888	3	sy-b024	0	Admin	2023-10-24	\N	\N	1384
4889	3	TORT001	0	Admin	2023-10-24	\N	\N	743
4890	3	TU01	0	Admin	2023-10-24	\N	\N	1188
4891	3	TU02	0	Admin	2023-10-24	\N	\N	1236
4892	3	TU03	0	Admin	2023-10-24	\N	\N	1237
4893	3	TU04	0	Admin	2023-10-24	\N	\N	1234
4894	3	UNGÜENTO	0	Admin	2023-10-24	\N	\N	1548
4895	3	URIVET	0	Admin	2023-10-24	\N	\N	1167
4896	3	UT01XS	0	Admin	2023-10-24	\N	\N	1328
4897	3	UT02S	0	Admin	2023-10-24	\N	\N	1327
4898	3	UT03M	0	Admin	2023-10-24	\N	\N	1289
4899	3	UT04L	0	Admin	2023-10-24	\N	\N	1290
4900	3	UT05XL	0	Admin	2023-10-24	\N	\N	1291
4901	3	UV01S	0	Admin	2023-10-24	\N	\N	1305
4902	3	UV02M	0	Admin	2023-10-24	\N	\N	1306
4903	3	UV03L	0	Admin	2023-10-24	\N	\N	1307
4904	3	UY0110MM	0	Admin	2023-10-24	\N	\N	1300
4905	3	UY0212MM	0	Admin	2023-10-24	\N	\N	1301
4906	3	VDECA0008	0	Admin	2023-10-24	\N	\N	900
4907	3	VDECA0009	0	Admin	2023-10-24	\N	\N	901
4908	3	VDECA007	0	Admin	2023-10-24	\N	\N	899
4909	3	VDEFE0001	0	Admin	2023-10-24	\N	\N	898
4910	3	VE2022115917	0	Admin	2023-10-24	\N	\N	1625
4911	3	VHL001	0	Admin	2023-10-24	\N	\N	1416
4912	3	VHM001	0	Admin	2023-10-24	\N	\N	1415
4913	3	VHS001	0	Admin	2023-10-24	\N	\N	1417
4914	3	VHTL001	0	Admin	2023-10-24	\N	\N	1418
4915	3	VHTM001	0	Admin	2023-10-24	\N	\N	1420
4916	3	VHTS001	0	Admin	2023-10-24	\N	\N	1419
4917	3	VT-01	0	Admin	2023-10-24	\N	\N	1184
4918	3	VT-02	0	Admin	2023-10-24	\N	\N	1183
4919	3	VVL001	0	Admin	2023-10-24	\N	\N	1412
4920	3	VVM001	0	Admin	2023-10-24	\N	\N	1413
4921	3	VVS001	0	Admin	2023-10-24	\N	\N	1414
4922	3	W4UNID	0	Admin	2023-10-24	\N	\N	627
4923	3	WV04L	0	Admin	2023-10-24	\N	\N	1288
4924	3	X001	0	Admin	2023-10-24	\N	\N	731
4925	3	X002	0	Admin	2023-10-24	\N	\N	730
4926	3	XW01S	0	Admin	2023-10-24	\N	\N	1292
4927	3	XW02M	0	Admin	2023-10-24	\N	\N	1293
4928	3	XW03L	0	Admin	2023-10-24	\N	\N	1294
4929	3	XW04XL	0	Admin	2023-10-24	\N	\N	1295
4930	3	ZY01S	0	Admin	2023-10-24	\N	\N	1355
4931	3	ZY02M	0	Admin	2023-10-24	\N	\N	1356
4932	3	ZY02-M	0	Admin	2023-10-24	\N	\N	1242
4933	3	ZY03L	0	Admin	2023-10-24	\N	\N	1357
4934	3	ZY04XL	0	Admin	2023-10-24	\N	\N	1358
4936	4	01	0	Admin	2023-10-24	\N	\N	552
4937	4	017800142731	0	Admin	2023-10-24	\N	\N	1575
4938	4	017800156424	0	Admin	2023-10-24	\N	\N	1577
4939	4	017800156448	0	Admin	2023-10-24	\N	\N	1576
4940	4	017800165426	0	Admin	2023-10-24	\N	\N	1386
4941	4	017800174152	0	Admin	2023-10-24	\N	\N	496
4942	4	017800174220	0	Admin	2023-10-24	\N	\N	495
4943	4	017800176262	0	Admin	2023-10-24	\N	\N	494
4944	4	018065055583	0	Admin	2023-10-24	\N	\N	746
4945	4	018065057655	0	Admin	2023-10-24	\N	\N	744
4946	4	018065057686	0	Admin	2023-10-24	\N	\N	745
4947	4	018065057792	0	Admin	2023-10-24	\N	\N	747
4948	4	018214812784	0	Admin	2023-10-24	\N	\N	718
4949	4	018214812791	0	Admin	2023-10-24	\N	\N	720
4950	4	018214816218	0	Admin	2023-10-24	\N	\N	904
4951	4	018214846307	0	Admin	2023-10-24	\N	\N	719
4952	4	020279991335	0	Admin	2023-10-24	\N	\N	1578
4953	4	020279992998	0	Admin	2023-10-24	\N	\N	882
4954	4	020279995173	0	Admin	2023-10-24	\N	\N	1078
4955	4	020279995227	0	Admin	2023-10-24	\N	\N	1077
4956	4	020531	0	Admin	2023-10-24	\N	\N	1451
4957	4	030172013829	0	Admin	2023-10-24	\N	\N	1518
4958	4	030172013850	0	Admin	2023-10-24	\N	\N	1130
4959	4	034846730012	0	Admin	2023-10-24	\N	\N	680
4960	4	034846730029	0	Admin	2023-10-24	\N	\N	679
4961	4	034846730104	0	Admin	2023-10-24	\N	\N	683
4962	4	034846730111	0	Admin	2023-10-24	\N	\N	684
4963	4	034846730227	0	Admin	2023-10-24	\N	\N	685
4964	4	034846730319	0	Admin	2023-10-24	\N	\N	682
4965	4	034846730326	0	Admin	2023-10-24	\N	\N	681
4966	4	034846730401	0	Admin	2023-10-24	\N	\N	677
4967	4	034846730418	0	Admin	2023-10-24	\N	\N	1449
4968	4	034846730500	0	Admin	2023-10-24	\N	\N	674
4969	4	034846730517	0	Admin	2023-10-24	\N	\N	675
4970	4	034846730609	0	Admin	2023-10-24	\N	\N	676
4971	4	034846730708	0	Admin	2023-10-24	\N	\N	688
4972	4	034846730715	0	Admin	2023-10-24	\N	\N	689
4973	4	034846730814	0	Admin	2023-10-24	\N	\N	687
4974	4	034846730821	0	Admin	2023-10-24	\N	\N	686
4975	4	034846730937	0	Admin	2023-10-24	\N	\N	678
4976	4	035585034003	0	Admin	2023-10-24	\N	\N	859
4977	4	035585111117	0	Admin	2023-10-24	\N	\N	858
4978	4	035585111216	0	Admin	2023-10-24	\N	\N	857
4979	4	035585111315	0	Admin	2023-10-24	\N	\N	856
4980	4	038100001306	0	Admin	2023-10-24	\N	\N	1388
4981	4	038100171207	0	Admin	2023-10-24	\N	\N	1387
4982	4	045663970062	0	Admin	2023-10-24	\N	\N	748
4983	4	045663970079	0	Admin	2023-10-24	\N	\N	714
4984	4	045663970086	0	Admin	2023-10-24	\N	\N	713
4985	4	045663970093	0	Admin	2023-10-24	\N	\N	749
4986	4	045663970109	0	Admin	2023-10-24	\N	\N	712
4987	4	045663976170	0	Admin	2023-10-24	\N	\N	1642
4988	4	045663976194	0	Admin	2023-10-24	\N	\N	1641
4989	4	052742001135	0	Admin	2023-10-24	\N	\N	881
4990	4	052742001197	0	Admin	2023-10-24	\N	\N	1470
4991	4	052742001746	0	Admin	2023-10-24	\N	\N	12
4992	4	052742005188	0	Admin	2023-10-24	\N	\N	1198
4993	4	052742005355	0	Admin	2023-10-24	\N	\N	964
4994	4	052742009971	0	Admin	2023-10-24	\N	\N	961
4995	4	052742012032	0	Admin	2023-10-24	\N	\N	1408
4996	4	052742014296	0	Admin	2023-10-24	\N	\N	878
4997	4	052742014531	0	Admin	2023-10-24	\N	\N	962
4998	4	052742014555	0	Admin	2023-10-24	\N	\N	960
4999	4	052742020419	0	Admin	2023-10-24	\N	\N	1468
5000	4	052742020488	0	Admin	2023-10-24	\N	\N	1503
5001	4	052742024530	0	Admin	2023-10-24	\N	\N	879
5002	4	052742040141	0	Admin	2023-10-24	\N	\N	1407
5003	4	052742187501	0	Admin	2023-10-24	\N	\N	959
5004	4	052742187907	0	Admin	2023-10-24	\N	\N	6
5005	4	052742195704	0	Admin	2023-10-24	\N	\N	5
5006	4	052742297200	0	Admin	2023-10-24	\N	\N	1411
5007	4	052742335902	0	Admin	2023-10-24	\N	\N	963
5008	4	052742339009	0	Admin	2023-10-24	\N	\N	874
5009	4	052742453606	0	Admin	2023-10-24	\N	\N	1522
5010	4	052742462806	0	Admin	2023-10-24	\N	\N	875
5011	4	052742567006	0	Admin	2023-10-24	\N	\N	873
5012	4	052742623801	0	Admin	2023-10-24	\N	\N	876
5013	4	052742624709	0	Admin	2023-10-24	\N	\N	880
5014	4	052742648606	0	Admin	2023-10-24	\N	\N	1402
5015	4	052742679709	0	Admin	2023-10-24	\N	\N	9
5016	4	052742700106	0	Admin	2023-10-24	\N	\N	1469
5017	4	052742700809	0	Admin	2023-10-24	\N	\N	18
5018	4	052742701004	0	Admin	2023-10-24	\N	\N	1
5019	4	052742701103	0	Admin	2023-10-24	\N	\N	2
5020	4	052742701608	0	Admin	2023-10-24	\N	\N	877
5021	4	052742701806	0	Admin	2023-10-24	\N	\N	4
5022	4	052742703602	0	Admin	2023-10-24	\N	\N	15
5023	4	052742703701	0	Admin	2023-10-24	\N	\N	16
5024	4	052742705507	0	Admin	2023-10-24	\N	\N	17
5025	4	052742710402	0	Admin	2023-10-24	\N	\N	10
5026	4	052742712307	0	Admin	2023-10-24	\N	\N	957
5027	4	052742713304	0	Admin	2023-10-24	\N	\N	1405
5028	4	052742713908	0	Admin	2023-10-24	\N	\N	7
5029	4	052742715605	0	Admin	2023-10-24	\N	\N	958
5030	4	052742790107	0	Admin	2023-10-24	\N	\N	14
5031	4	052742818306	0	Admin	2023-10-24	\N	\N	8
5032	4	052742855509	0	Admin	2023-10-24	\N	\N	1401
5033	4	052742861807	0	Admin	2023-10-24	\N	\N	11
5034	4	052742862101	0	Admin	2023-10-24	\N	\N	1471
5035	4	052742862309	0	Admin	2023-10-24	\N	\N	1613
5036	4	052742862408	0	Admin	2023-10-24	\N	\N	13
5037	4	052742867106	0	Admin	2023-10-24	\N	\N	3
5038	4	052742867601	0	Admin	2023-10-24	\N	\N	1596
5039	4	052742909400	0	Admin	2023-10-24	\N	\N	1404
5040	4	052742909608	0	Admin	2023-10-24	\N	\N	1406
5041	4	052742909806	0	Admin	2023-10-24	\N	\N	1409
5042	4	052742910000	0	Admin	2023-10-24	\N	\N	1410
5043	4	052742930107	0	Admin	2023-10-24	\N	\N	1403
5044	4	052742936802	0	Admin	2023-10-24	\N	\N	1591
5045	4	070230107107	0	Admin	2023-10-24	\N	\N	1494
5046	4	070230117168	0	Admin	2023-10-24	\N	\N	1495
5047	4	073893212546	0	Admin	2023-10-24	\N	\N	842
5048	4	073893212553	0	Admin	2023-10-24	\N	\N	1476
5049	4	073893223009	0	Admin	2023-10-24	\N	\N	835
5050	4	073893260035	0	Admin	2023-10-24	\N	\N	841
5051	4	073893260042	0	Admin	2023-10-24	\N	\N	1383
5052	4	073893260066	0	Admin	2023-10-24	\N	\N	840
5053	4	073893263036	0	Admin	2023-10-24	\N	\N	838
5054	4	073893264026	0	Admin	2023-10-24	\N	\N	837
5055	4	073893265030	0	Admin	2023-10-24	\N	\N	839
5056	4	073893280002	0	Admin	2023-10-24	\N	\N	836
5057	4	074198612239	0	Admin	2023-10-24	\N	\N	1463
5058	4	074198612277	0	Admin	2023-10-24	\N	\N	1070
5059	4	074198612314	0	Admin	2023-10-24	\N	\N	1464
5060	4	074198612345	0	Admin	2023-10-24	\N	\N	1073
5061	4	074198612383	0	Admin	2023-10-24	\N	\N	1462
5062	4	074198612413	0	Admin	2023-10-24	\N	\N	1071
5063	4	074198612451	0	Admin	2023-10-24	\N	\N	1465
5064	4	074198612499	0	Admin	2023-10-24	\N	\N	1074
5065	4	074198613311	0	Admin	2023-10-24	\N	\N	1072
5066	4	074198613359	0	Admin	2023-10-24	\N	\N	1436
5067	4	074198614233	0	Admin	2023-10-24	\N	\N	1467
5068	4	074198614240	0	Admin	2023-10-24	\N	\N	1435
5069	4	074198614257	0	Admin	2023-10-24	\N	\N	1466
5070	4	074198614264	0	Admin	2023-10-24	\N	\N	1434
5071	4	074198615117	0	Admin	2023-10-24	\N	\N	1581
5072	4	074198615131	0	Admin	2023-10-24	\N	\N	1580
5073	4	074198615179	0	Admin	2023-10-24	\N	\N	1624
5074	4	074198615261	0	Admin	2023-10-24	\N	\N	1586
5075	4	074198615308	0	Admin	2023-10-24	\N	\N	1587
5076	4	074198615391	0	Admin	2023-10-24	\N	\N	1637
5077	4	074198615476	0	Admin	2023-10-24	\N	\N	1582
5078	4	074198615513	0	Admin	2023-10-24	\N	\N	1583
5079	4	07419861561	0	Admin	2023-10-24	\N	\N	1585
5080	4	074198615612	0	Admin	2023-10-24	\N	\N	1588
5081	4	074198615636	0	Admin	2023-10-24	\N	\N	1584
5082	4	077627101182	0	Admin	2023-10-24	\N	\N	700
5083	4	077627101229	0	Admin	2023-10-24	\N	\N	701
5084	4	077627101274	0	Admin	2023-10-24	\N	\N	702
5085	4	077627101342	0	Admin	2023-10-24	\N	\N	703
5086	4	077627200991	0	Admin	2023-10-24	\N	\N	707
5087	4	077627201028	0	Admin	2023-10-24	\N	\N	704
5088	4	077627201066	0	Admin	2023-10-24	\N	\N	705
5089	4	077627201349	0	Admin	2023-10-24	\N	\N	706
5090	4	077627201356	0	Admin	2023-10-24	\N	\N	708
5091	4	077627302015	0	Admin	2023-10-24	\N	\N	709
5092	4	08003330160	0	Admin	2023-10-24	\N	\N	1579
5093	4	087219111529	0	Admin	2023-10-24	\N	\N	463
5094	4	087219113776	0	Admin	2023-10-24	\N	\N	507
5095	4	087219116012	0	Admin	2023-10-24	\N	\N	509
5096	4	087219117439	0	Admin	2023-10-24	\N	\N	508
5097	4	087219120873	0	Admin	2023-10-24	\N	\N	510
5098	4	1	0	Admin	2023-10-24	\N	\N	436
5099	4	10	0	Admin	2023-10-24	\N	\N	803
5100	4	100	0	Admin	2023-10-24	\N	\N	802
5101	4	101	0	Admin	2023-10-24	\N	\N	843
5102	4	102	0	Admin	2023-10-24	\N	\N	844
5103	4	103	0	Admin	2023-10-24	\N	\N	845
5104	4	104	0	Admin	2023-10-24	\N	\N	848
5105	4	105	0	Admin	2023-10-24	\N	\N	934
5106	4	106	0	Admin	2023-10-24	\N	\N	954
5107	4	107	0	Admin	2023-10-24	\N	\N	955
5108	4	108	0	Admin	2023-10-24	\N	\N	956
5109	4	109	0	Admin	2023-10-24	\N	\N	1017
5110	4	11	0	Admin	2023-10-24	\N	\N	1251
5111	4	110	0	Admin	2023-10-24	\N	\N	1018
5112	4	111	0	Admin	2023-10-24	\N	\N	1019
5113	4	112	0	Admin	2023-10-24	\N	\N	1020
5114	4	113	0	Admin	2023-10-24	\N	\N	1021
5116	4	115	0	Admin	2023-10-24	\N	\N	1023
5117	4	116	0	Admin	2023-10-24	\N	\N	1024
5118	4	117	0	Admin	2023-10-24	\N	\N	1025
5119	4	118	0	Admin	2023-10-24	\N	\N	1026
5120	4	119	0	Admin	2023-10-24	\N	\N	1027
5121	4	120	0	Admin	2023-10-24	\N	\N	1028
5122	4	121	0	Admin	2023-10-24	\N	\N	1029
5123	4	122	0	Admin	2023-10-24	\N	\N	1030
5124	4	123	0	Admin	2023-10-24	\N	\N	1031
5125	4	1234567890128	0	Admin	2023-10-24	\N	\N	1096
5126	4	124	0	Admin	2023-10-24	\N	\N	1032
5127	4	125	0	Admin	2023-10-24	\N	\N	1033
5128	4	126	0	Admin	2023-10-24	\N	\N	1034
5129	4	127	0	Admin	2023-10-24	\N	\N	1035
5130	4	128	0	Admin	2023-10-24	\N	\N	1036
5131	4	129	0	Admin	2023-10-24	\N	\N	1037
5132	4	130	0	Admin	2023-10-24	\N	\N	1038
5133	4	131	0	Admin	2023-10-24	\N	\N	1039
5134	4	132	0	Admin	2023-10-24	\N	\N	1040
5135	4	133	0	Admin	2023-10-24	\N	\N	1041
5136	4	134	0	Admin	2023-10-24	\N	\N	1042
5137	4	135	0	Admin	2023-10-24	\N	\N	1043
5138	4	136	0	Admin	2023-10-24	\N	\N	1044
5139	4	137	0	Admin	2023-10-24	\N	\N	1045
5140	4	138	0	Admin	2023-10-24	\N	\N	1046
5141	4	139	0	Admin	2023-10-24	\N	\N	1047
5142	4	140	0	Admin	2023-10-24	\N	\N	1048
5143	4	141	0	Admin	2023-10-24	\N	\N	1049
5144	4	142	0	Admin	2023-10-24	\N	\N	1050
5145	4	1421	0	Admin	2023-10-24	\N	\N	1276
5146	4	143	0	Admin	2023-10-24	\N	\N	1051
5147	4	144	0	Admin	2023-10-24	\N	\N	1052
5148	4	145	0	Admin	2023-10-24	\N	\N	1053
5149	4	146	0	Admin	2023-10-24	\N	\N	1054
5150	4	147	0	Admin	2023-10-24	\N	\N	1055
5151	4	148	0	Admin	2023-10-24	\N	\N	1056
5152	4	149	0	Admin	2023-10-24	\N	\N	1057
5153	4	150	0	Admin	2023-10-24	\N	\N	1058
5154	4	151	0	Admin	2023-10-24	\N	\N	1059
5155	4	152	0	Admin	2023-10-24	\N	\N	1060
5156	4	153	0	Admin	2023-10-24	\N	\N	1061
5157	4	154	0	Admin	2023-10-24	\N	\N	1062
5158	4	155	0	Admin	2023-10-24	\N	\N	1063
5159	4	156	0	Admin	2023-10-24	\N	\N	1064
5160	4	157	0	Admin	2023-10-24	\N	\N	1065
5161	4	158	0	Admin	2023-10-24	\N	\N	1066
5162	4	159	0	Admin	2023-10-24	\N	\N	1067
5163	4	160	0	Admin	2023-10-24	\N	\N	1068
5164	4	161	0	Admin	2023-10-24	\N	\N	1069
5165	4	16182	0	Admin	2023-10-24	\N	\N	1430
5166	4	162	0	Admin	2023-10-24	\N	\N	1246
5167	4	163	0	Admin	2023-10-24	\N	\N	1270
5168	4	164	0	Admin	2023-10-24	\N	\N	1271
5169	4	166	0	Admin	2023-10-24	\N	\N	1443
5170	4	167	0	Admin	2023-10-24	\N	\N	1485
5171	4	170	0	Admin	2023-10-24	\N	\N	1437
5172	4	178988989	0	Admin	2023-10-24	\N	\N	1259
5173	4	181	0	Admin	2023-10-24	\N	\N	1559
5174	4	182	0	Admin	2023-10-24	\N	\N	1560
5175	4	18214816218	0	Admin	2023-10-24	\N	\N	160
5176	4	183	0	Admin	2023-10-24	\N	\N	1561
5177	4	184	0	Admin	2023-10-24	\N	\N	1562
5178	4	185	0	Admin	2023-10-24	\N	\N	1563
5179	4	186	0	Admin	2023-10-24	\N	\N	1564
5180	4	187	0	Admin	2023-10-24	\N	\N	1565
5181	4	188	0	Admin	2023-10-24	\N	\N	1566
5182	4	189	0	Admin	2023-10-24	\N	\N	1567
5183	4	190	0	Admin	2023-10-24	\N	\N	1568
5184	4	191	0	Admin	2023-10-24	\N	\N	1569
5185	4	192	0	Admin	2023-10-24	\N	\N	1570
5186	4	194	0	Admin	2023-10-24	\N	\N	1571
5187	4	195	0	Admin	2023-10-24	\N	\N	1572
5188	4	196	0	Admin	2023-10-24	\N	\N	1573
5189	4	20	0	Admin	2023-10-24	\N	\N	804
5190	4	200	0	Admin	2023-10-24	\N	\N	936
5191	4	2009073936	0	Admin	2023-10-24	\N	\N	1263
5192	4	208400	0	Admin	2023-10-24	\N	\N	416
5193	4	21	0	Admin	2023-10-24	\N	\N	805
5194	4	22	0	Admin	2023-10-24	\N	\N	806
5195	4	22095	0	Admin	2023-10-24	\N	\N	1551
5196	4	22108	0	Admin	2023-10-24	\N	\N	1550
5197	4	22109	0	Admin	2023-10-24	\N	\N	1549
5198	4	23	0	Admin	2023-10-24	\N	\N	807
5199	4	25026	0	Admin	2023-10-24	\N	\N	470
5200	4	25027	0	Admin	2023-10-24	\N	\N	471
5201	4	27003	0	Admin	2023-10-24	\N	\N	472
5202	4	30	0	Admin	2023-10-24	\N	\N	808
5203	4	300	0	Admin	2023-10-24	\N	\N	1100
5204	4	301	0	Admin	2023-10-24	\N	\N	1101
5205	4	302	0	Admin	2023-10-24	\N	\N	1102
5206	4	303	0	Admin	2023-10-24	\N	\N	1272
5207	4	304	0	Admin	2023-10-24	\N	\N	1273
5208	4	305	0	Admin	2023-10-24	\N	\N	1344
5209	4	306	0	Admin	2023-10-24	\N	\N	1345
5210	4	307	0	Admin	2023-10-24	\N	\N	1376
5211	4	308	0	Admin	2023-10-24	\N	\N	1377
5212	4	309	0	Admin	2023-10-24	\N	\N	1399
5213	4	31	0	Admin	2023-10-24	\N	\N	809
5214	4	310	0	Admin	2023-10-24	\N	\N	1429
5215	4	311	0	Admin	2023-10-24	\N	\N	1447
5216	4	312	0	Admin	2023-10-24	\N	\N	1448
5217	4	313	0	Admin	2023-10-24	\N	\N	1454
5218	4	314	0	Admin	2023-10-24	\N	\N	1457
5219	4	315	0	Admin	2023-10-24	\N	\N	1459
5220	4	316	0	Admin	2023-10-24	\N	\N	1482
5221	4	317	0	Admin	2023-10-24	\N	\N	1483
5222	4	318	0	Admin	2023-10-24	\N	\N	1484
5223	4	3182550402132	0	Admin	2023-10-24	\N	\N	410
5224	4	3182550402149	0	Admin	2023-10-24	\N	\N	401
5225	4	3182550402170	0	Admin	2023-10-24	\N	\N	445
5226	4	3182550402224	0	Admin	2023-10-24	\N	\N	413
5227	4	3182550402439	0	Admin	2023-10-24	\N	\N	408
5228	4	3182550702201	0	Admin	2023-10-24	\N	\N	420
5229	4	3182550702225	0	Admin	2023-10-24	\N	\N	421
5230	4	3182550702423	0	Admin	2023-10-24	\N	\N	425
5231	4	3182550702447	0	Admin	2023-10-24	\N	\N	426
5232	4	3182550702614	0	Admin	2023-10-24	\N	\N	1088
5233	4	3182550708180	0	Admin	2023-10-24	\N	\N	409
5234	4	3182550708197	0	Admin	2023-10-24	\N	\N	411
5235	4	3182550708203	0	Admin	2023-10-24	\N	\N	412
5236	4	3182550710923	0	Admin	2023-10-24	\N	\N	394
5237	4	3182550710992	0	Admin	2023-10-24	\N	\N	417
5238	4	3182550711036	0	Admin	2023-10-24	\N	\N	414
5239	4	3182550711050	0	Admin	2023-10-24	\N	\N	433
5240	4	3182550711142	0	Admin	2023-10-24	\N	\N	393
5241	4	3182550711159	0	Admin	2023-10-24	\N	\N	434
5242	4	3182550711333	0	Admin	2023-10-24	\N	\N	395
5243	4	3182550711395	0	Admin	2023-10-24	\N	\N	418
5244	4	3182550716857	0	Admin	2023-10-24	\N	\N	449
5245	4	3182550716888	0	Admin	2023-10-24	\N	\N	448
5246	4	3182550716925	0	Admin	2023-10-24	\N	\N	451
5247	4	3182550717687	0	Admin	2023-10-24	\N	\N	415
5248	4	3182550718813	0	Admin	2023-10-24	\N	\N	1598
5249	4	3182550727822	0	Admin	2023-10-24	\N	\N	447
5250	4	3182550728102	0	Admin	2023-10-24	\N	\N	1639
5251	4	3182550730587	0	Admin	2023-10-24	\N	\N	432
5252	4	3182550731355	0	Admin	2023-10-24	\N	\N	390
5253	4	3182550732055	0	Admin	2023-10-24	\N	\N	402
5254	4	3182550732154	0	Admin	2023-10-24	\N	\N	1615
5255	4	3182550743433	0	Admin	2023-10-24	\N	\N	431
5256	4	3182550743440	0	Admin	2023-10-24	\N	\N	1632
5257	4	3182550768474	0	Admin	2023-10-24	\N	\N	1091
5258	4	3182550771054	0	Admin	2023-10-24	\N	\N	396
5259	4	3182550771061	0	Admin	2023-10-24	\N	\N	397
5260	4	3182550771719	0	Admin	2023-10-24	\N	\N	398
5261	4	3182550771733	0	Admin	2023-10-24	\N	\N	399
5262	4	3182550775267	0	Admin	2023-10-24	\N	\N	446
5263	4	3182550778657	0	Admin	2023-10-24	\N	\N	430
5264	4	3182550778671	0	Admin	2023-10-24	\N	\N	403
5265	4	3182550793001	0	Admin	2023-10-24	\N	\N	405
5266	4	3182550793032	0	Admin	2023-10-24	\N	\N	406
5267	4	3182550793049	0	Admin	2023-10-24	\N	\N	407
5268	4	3182550798945	0	Admin	2023-10-24	\N	\N	452
5269	4	3182550799768	0	Admin	2023-10-24	\N	\N	450
5270	4	3182550831086	0	Admin	2023-10-24	\N	\N	391
5271	4	3182550831383	0	Admin	2023-10-24	\N	\N	428
5272	4	3182550831390	0	Admin	2023-10-24	\N	\N	427
5273	4	319	0	Admin	2023-10-24	\N	\N	1497
5274	4	32	0	Admin	2023-10-24	\N	\N	810
5275	4	320	0	Admin	2023-10-24	\N	\N	1498
5276	4	321	0	Admin	2023-10-24	\N	\N	1499
5277	4	322	0	Admin	2023-10-24	\N	\N	1501
5278	4	323	0	Admin	2023-10-24	\N	\N	1502
5279	4	33	0	Admin	2023-10-24	\N	\N	811
5280	4	33015	0	Admin	2023-10-24	\N	\N	473
5281	4	33016	0	Admin	2023-10-24	\N	\N	461
5282	4	33059	0	Admin	2023-10-24	\N	\N	462
5283	4	3411112261956	0	Admin	2023-10-24	\N	\N	797
5284	4	350	0	Admin	2023-10-24	\N	\N	1452
5285	4	3552793078300	0	Admin	2023-10-24	\N	\N	548
5286	4	3552793078324	0	Admin	2023-10-24	\N	\N	547
5287	4	40	0	Admin	2023-10-24	\N	\N	812
5288	4	400	0	Admin	2023-10-24	\N	\N	1165
5289	4	4007221039112	0	Admin	2023-10-24	\N	\N	670
5290	4	4007221039129	0	Admin	2023-10-24	\N	\N	671
5291	4	4007221043218	0	Admin	2023-10-24	\N	\N	522
5292	4	4007221052180	0	Admin	2023-10-24	\N	\N	1555
5293	4	4007221054221	0	Admin	2023-10-24	\N	\N	1556
5294	4	401	0	Admin	2023-10-24	\N	\N	1166
5295	4	402	0	Admin	2023-10-24	\N	\N	1267
5296	4	403	0	Admin	2023-10-24	\N	\N	1375
5297	4	404	0	Admin	2023-10-24	\N	\N	1398
5298	4	41	0	Admin	2023-10-24	\N	\N	813
5299	4	41006	0	Admin	2023-10-24	\N	\N	505
5300	4	41013	0	Admin	2023-10-24	\N	\N	511
5301	4	41019	0	Admin	2023-10-24	\N	\N	512
5302	4	412	0	Admin	2023-10-24	\N	\N	1517
5303	4	415	0	Admin	2023-10-24	\N	\N	1520
5304	4	416	0	Admin	2023-10-24	\N	\N	1521
5305	4	42	0	Admin	2023-10-24	\N	\N	814
5306	4	4260448120210	0	Admin	2023-10-24	\N	\N	1439
5307	4	43	0	Admin	2023-10-24	\N	\N	815
5308	4	45	0	Admin	2023-10-24	\N	\N	944
5309	4	4894158096291	0	Admin	2023-10-24	\N	\N	1106
5310	4	50	0	Admin	2023-10-24	\N	\N	816
5311	4	51	0	Admin	2023-10-24	\N	\N	817
5312	4	52	0	Admin	2023-10-24	\N	\N	818
5313	4	53	0	Admin	2023-10-24	\N	\N	819
5314	4	5414736039282	0	Admin	2023-10-24	\N	\N	1163
5315	4	5414736047911	0	Admin	2023-10-24	\N	\N	466
5316	4	5414736047928	0	Admin	2023-10-24	\N	\N	467
5317	4	5414736047935	0	Admin	2023-10-24	\N	\N	468
5318	4	5414736047942	0	Admin	2023-10-24	\N	\N	469
5319	4	5414736048253	0	Admin	2023-10-24	\N	\N	1644
5320	4	5415341001961	0	Admin	2023-10-24	\N	\N	596
5321	4	5420043705338	0	Admin	2023-10-24	\N	\N	464
5322	4	5420043705345	0	Admin	2023-10-24	\N	\N	465
5323	4	6	0	Admin	2023-10-24	\N	\N	987
5324	4	60	0	Admin	2023-10-24	\N	\N	820
5325	4	61	0	Admin	2023-10-24	\N	\N	821
5326	4	62	0	Admin	2023-10-24	\N	\N	822
5327	4	63	0	Admin	2023-10-24	\N	\N	823
5328	4	645095002166	0	Admin	2023-10-24	\N	\N	983
5329	4	659525114701	0	Admin	2023-10-24	\N	\N	1622
5330	4	662858207224	0	Admin	2023-10-24	\N	\N	1178
5331	4	662858226003	0	Admin	2023-10-24	\N	\N	1164
5332	4	682500939518	0	Admin	2023-10-24	\N	\N	942
5333	4	682500939679	0	Admin	2023-10-24	\N	\N	943
5334	4	6828949660383	0	Admin	2023-10-24	\N	\N	1602
5335	4	6920190048764	0	Admin	2023-10-24	\N	\N	1086
5336	4	6953182709244	0	Admin	2023-10-24	\N	\N	587
5337	4	6953182710585	0	Admin	2023-10-24	\N	\N	550
5338	4	6953182710820	0	Admin	2023-10-24	\N	\N	1128
5339	4	6953182714576	0	Admin	2023-10-24	\N	\N	1372
5340	4	6953182714972	0	Admin	2023-10-24	\N	\N	1116
5341	4	6953182718062	0	Admin	2023-10-24	\N	\N	1119
5342	4	6953182719458	0	Admin	2023-10-24	\N	\N	441
5343	4	6953182719571	0	Admin	2023-10-24	\N	\N	1117
5344	4	6953182720072	0	Admin	2023-10-24	\N	\N	1118
5345	4	6953182721161	0	Admin	2023-10-24	\N	\N	585
5346	4	6953182731450	0	Admin	2023-10-24	\N	\N	555
5347	4	6953182731481	0	Admin	2023-10-24	\N	\N	556
5348	4	6953182732365	0	Admin	2023-10-24	\N	\N	437
5349	4	6953182732372	0	Admin	2023-10-24	\N	\N	438
5350	4	6953182732389	0	Admin	2023-10-24	\N	\N	439
5351	4	6953182732440	0	Admin	2023-10-24	\N	\N	440
5352	4	6953182735083	0	Admin	2023-10-24	\N	\N	1278
5353	4	6972170629975	0	Admin	2023-10-24	\N	\N	1610
5354	4	6995654545424	0	Admin	2023-10-24	\N	\N	1599
5355	4	70	0	Admin	2023-10-24	\N	\N	824
5356	4	71	0	Admin	2023-10-24	\N	\N	825
5357	4	711604200290	0	Admin	2023-10-24	\N	\N	1284
5358	4	711604203734	0	Admin	2023-10-24	\N	\N	1285
5359	4	714193509102	0	Admin	2023-10-24	\N	\N	1216
5360	4	714193600724	0	Admin	2023-10-24	\N	\N	1217
5361	4	714193600823	0	Admin	2023-10-24	\N	\N	727
5362	4	714193600861	0	Admin	2023-10-24	\N	\N	726
5363	4	714193600984	0	Admin	2023-10-24	\N	\N	728
5364	4	714193610934	0	Admin	2023-10-24	\N	\N	1623
5365	4	714193699728	0	Admin	2023-10-24	\N	\N	725
5366	4	7191600000507	0	Admin	2023-10-24	\N	\N	1254
5367	4	72	0	Admin	2023-10-24	\N	\N	826
5368	4	73	0	Admin	2023-10-24	\N	\N	827
5369	4	73000101	0	Admin	2023-10-24	\N	\N	158
5370	4	73008199IO	0	Admin	2023-10-24	\N	\N	388
5371	4	73033333	0	Admin	2023-10-24	\N	\N	159
5372	4	736990012050	0	Admin	2023-10-24	\N	\N	887
5373	4	736990012104	0	Admin	2023-10-24	\N	\N	886
5374	4	736990012159	0	Admin	2023-10-24	\N	\N	888
5375	4	736990012203	0	Admin	2023-10-24	\N	\N	889
5376	4	736990012258	0	Admin	2023-10-24	\N	\N	890
5377	4	736990013002	0	Admin	2023-10-24	\N	\N	884
5378	4	736990013309	0	Admin	2023-10-24	\N	\N	885
5379	4	736990040114	0	Admin	2023-10-24	\N	\N	883
5380	4	74 6203100578	0	Admin	2023-10-24	\N	\N	1132
5381	4	7404000315615	0	Admin	2023-10-24	\N	\N	638
5382	4	7404000315622	0	Admin	2023-10-24	\N	\N	639
5383	4	7404000315639	0	Admin	2023-10-24	\N	\N	640
5384	4	7404000315646	0	Admin	2023-10-24	\N	\N	641
5385	4	7406160004224	0	Admin	2023-10-24	\N	\N	599
5386	4	7410000115322	0	Admin	2023-10-24	\N	\N	1262
5387	4	7410032780024	0	Admin	2023-10-24	\N	\N	710
5388	4	7410032780031	0	Admin	2023-10-24	\N	\N	711
5389	4	7414400200596	0	Admin	2023-10-24	\N	\N	1210
5390	4	7414400201012	0	Admin	2023-10-24	\N	\N	732
5391	4	7414400201050	0	Admin	2023-10-24	\N	\N	739
5392	4	7414400201067	0	Admin	2023-10-24	\N	\N	740
5393	4	7414400201074	0	Admin	2023-10-24	\N	\N	737
5394	4	7414400201081	0	Admin	2023-10-24	\N	\N	738
5395	4	7414400201111	0	Admin	2023-10-24	\N	\N	735
5396	4	7414400201128	0	Admin	2023-10-24	\N	\N	736
5397	4	7414400201210	0	Admin	2023-10-24	\N	\N	1479
5398	4	7414400201227	0	Admin	2023-10-24	\N	\N	1478
5399	4	7414400201234	0	Admin	2023-10-24	\N	\N	1477
5400	4	7414400201296	0	Admin	2023-10-24	\N	\N	734
5401	4	7414400201302	0	Admin	2023-10-24	\N	\N	733
5402	4	7414400201364	0	Admin	2023-10-24	\N	\N	1458
5403	4	7414400201432	0	Admin	2023-10-24	\N	\N	1215
5404	4	7414400201449	0	Admin	2023-10-24	\N	\N	1213
5405	4	7414400201456	0	Admin	2023-10-24	\N	\N	1212
5406	4	7414400201470	0	Admin	2023-10-24	\N	\N	715
5407	4	7414400201487	0	Admin	2023-10-24	\N	\N	717
5408	4	7414400201494	0	Admin	2023-10-24	\N	\N	716
5409	4	7414400201609	0	Admin	2023-10-24	\N	\N	851
5410	4	7414400201616	0	Admin	2023-10-24	\N	\N	850
5411	4	7414400201623	0	Admin	2023-10-24	\N	\N	852
5412	4	7414400202088	0	Admin	2023-10-24	\N	\N	1214
5413	4	7414400202095	0	Admin	2023-10-24	\N	\N	1209
5414	4	7414400202101	0	Admin	2023-10-24	\N	\N	1211
5415	4	7414400202149	0	Admin	2023-10-24	\N	\N	1208
5416	4	7416203100264	0	Admin	2023-10-24	\N	\N	560
5417	4	7416203100271	0	Admin	2023-10-24	\N	\N	561
5418	4	7416203100288	0	Admin	2023-10-24	\N	\N	562
5419	4	7416203100295	0	Admin	2023-10-24	\N	\N	563
5420	4	7416203100301	0	Admin	2023-10-24	\N	\N	564
5421	4	7416203100318	0	Admin	2023-10-24	\N	\N	565
5422	4	7416203100578	0	Admin	2023-10-24	\N	\N	1162
5423	4	7416203100585	0	Admin	2023-10-24	\N	\N	1136
5424	4	7416203100592	0	Admin	2023-10-24	\N	\N	1135
5425	4	7416203100608	0	Admin	2023-10-24	\N	\N	1134
5426	4	7416203100615	0	Admin	2023-10-24	\N	\N	1131
5427	4	7416203100622	0	Admin	2023-10-24	\N	\N	1137
5428	4	7416203100639	0	Admin	2023-10-24	\N	\N	1126
5429	4	7416203100646	0	Admin	2023-10-24	\N	\N	1125
5430	4	7416203100653	0	Admin	2023-10-24	\N	\N	1124
5431	4	7416203100660	0	Admin	2023-10-24	\N	\N	1123
5432	4	7416203100677	0	Admin	2023-10-24	\N	\N	1122
5433	4	7416203100684	0	Admin	2023-10-24	\N	\N	1121
5434	4	7416203100844	0	Admin	2023-10-24	\N	\N	553
5435	4	7416203101179	0	Admin	2023-10-24	\N	\N	1129
5436	4	7416203101209	0	Admin	2023-10-24	\N	\N	584
5437	4	7416203101247	0	Admin	2023-10-24	\N	\N	566
5438	4	7416203101254	0	Admin	2023-10-24	\N	\N	567
5439	4	7416203101261	0	Admin	2023-10-24	\N	\N	569
5440	4	7416203101278	0	Admin	2023-10-24	\N	\N	571
5441	4	7416203101438	0	Admin	2023-10-24	\N	\N	619
5442	4	7416203101445	0	Admin	2023-10-24	\N	\N	484
5443	4	7416203101469	0	Admin	2023-10-24	\N	\N	573
5444	4	7416203101520	0	Admin	2023-10-24	\N	\N	442
5445	4	7416203101544	0	Admin	2023-10-24	\N	\N	617
5446	4	7416203101551	0	Admin	2023-10-24	\N	\N	616
5447	4	7416203101667	0	Admin	2023-10-24	\N	\N	443
5448	4	7416203101797	0	Admin	2023-10-24	\N	\N	600
5449	4	7416203101827	0	Admin	2023-10-24	\N	\N	626
5450	4	7416203101834	0	Admin	2023-10-24	\N	\N	590
5451	4	7416203101902	0	Admin	2023-10-24	\N	\N	549
5452	4	7416203101926	0	Admin	2023-10-24	\N	\N	1115
5453	4	7416203101964	0	Admin	2023-10-24	\N	\N	483
5454	4	7416203102183	0	Admin	2023-10-24	\N	\N	1120
5455	4	7416203102213	0	Admin	2023-10-24	\N	\N	621
5456	4	7416203102220	0	Admin	2023-10-24	\N	\N	620
5457	4	7416203102237	0	Admin	2023-10-24	\N	\N	622
5458	4	7416203102244	0	Admin	2023-10-24	\N	\N	618
5459	4	7416203102916	0	Admin	2023-10-24	\N	\N	581
5460	4	7416203102923	0	Admin	2023-10-24	\N	\N	582
5461	4	7416203102930	0	Admin	2023-10-24	\N	\N	583
5462	4	7416203103326	0	Admin	2023-10-24	\N	\N	479
5463	4	7416203103333	0	Admin	2023-10-24	\N	\N	480
5464	4	7416203103340	0	Admin	2023-10-24	\N	\N	481
5465	4	7416203103357	0	Admin	2023-10-24	\N	\N	1127
5466	4	7416203103364	0	Admin	2023-10-24	\N	\N	1133
5467	4	7416203103371	0	Admin	2023-10-24	\N	\N	474
5468	4	7416203103388	0	Admin	2023-10-24	\N	\N	475
5469	4	7416203103395	0	Admin	2023-10-24	\N	\N	476
5470	4	7416203103401	0	Admin	2023-10-24	\N	\N	477
5471	4	7416203103418	0	Admin	2023-10-24	\N	\N	478
5472	4	7416203103425	0	Admin	2023-10-24	\N	\N	482
5473	4	7416203103685	0	Admin	2023-10-24	\N	\N	1374
5474	4	7416203103692	0	Admin	2023-10-24	\N	\N	591
5475	4	7416203103708	0	Admin	2023-10-24	\N	\N	592
5476	4	7416203103722	0	Admin	2023-10-24	\N	\N	624
5477	4	7416203103739	0	Admin	2023-10-24	\N	\N	623
5478	4	7416203103753	0	Admin	2023-10-24	\N	\N	593
5479	4	7416203103760	0	Admin	2023-10-24	\N	\N	594
5480	4	7420615480007-7.5	0	Admin	2023-10-24	\N	\N	1594
5481	4	742061548007-10	0	Admin	2023-10-24	\N	\N	892
5482	4	742061548007-12.5	0	Admin	2023-10-24	\N	\N	893
5483	4	742061548007-15	0	Admin	2023-10-24	\N	\N	894
5484	4	742061548007-20	0	Admin	2023-10-24	\N	\N	895
5485	4	742061548007-25	0	Admin	2023-10-24	\N	\N	896
5486	4	742061548007-30	0	Admin	2023-10-24	\N	\N	897
5487	4	742061548007-7.5	0	Admin	2023-10-24	\N	\N	891
5488	4	7441003121935	0	Admin	2023-10-24	\N	\N	662
5489	4	7441003121942	0	Admin	2023-10-24	\N	\N	661
5490	4	7441007802434	0	Admin	2023-10-24	\N	\N	1574
5491	4	7441031336950	0	Admin	2023-10-24	\N	\N	1286
5492	4	7453105056978	0	Admin	2023-10-24	\N	\N	1098
5493	4	7501	0	Admin	2023-10-24	\N	\N	1611
5494	4	7501051100020	0	Admin	2023-10-24	\N	\N	1245
5495	4	7501051100037	0	Admin	2023-10-24	\N	\N	660
5496	4	7501051186963	0	Admin	2023-10-24	\N	\N	1247
5497	4	7501072204462	0	Admin	2023-10-24	\N	\N	1492
5498	4	7501072204479	0	Admin	2023-10-24	\N	\N	1493
5499	4	7501072204561	0	Admin	2023-10-24	\N	\N	488
5500	4	7501072204578	0	Admin	2023-10-24	\N	\N	1223
5501	4	7501072204592	0	Admin	2023-10-24	\N	\N	1391
5502	4	7501072204615	0	Admin	2023-10-24	\N	\N	1218
5503	4	7501072206299	0	Admin	2023-10-24	\N	\N	491
5504	4	7501072206305	0	Admin	2023-10-24	\N	\N	1219
5505	4	7501072207234	0	Admin	2023-10-24	\N	\N	485
5506	4	7501072207258	0	Admin	2023-10-24	\N	\N	493
5507	4	7501072207265	0	Admin	2023-10-24	\N	\N	492
5508	4	7501072208231	0	Admin	2023-10-24	\N	\N	499
5509	4	7501072208248	0	Admin	2023-10-24	\N	\N	486
5510	4	7501072208262	0	Admin	2023-10-24	\N	\N	1496
5511	4	7501072208279	0	Admin	2023-10-24	\N	\N	500
5512	4	7501072208293	0	Admin	2023-10-24	\N	\N	489
5513	4	7501072208743	0	Admin	2023-10-24	\N	\N	1389
5514	4	7501072208767	0	Admin	2023-10-24	\N	\N	1224
5515	4	7501072208781	0	Admin	2023-10-24	\N	\N	498
5516	4	7501072208798	0	Admin	2023-10-24	\N	\N	1221
5517	4	7501072208927	0	Admin	2023-10-24	\N	\N	1461
5518	4	7501072208958	0	Admin	2023-10-24	\N	\N	490
5519	4	7501072208972	0	Admin	2023-10-24	\N	\N	1631
5520	4	7501072210609	0	Admin	2023-10-24	\N	\N	1390
5521	4	7501072210616	0	Admin	2023-10-24	\N	\N	1220
5522	4	7501072210623	0	Admin	2023-10-24	\N	\N	497
5523	4	7501072210630	0	Admin	2023-10-24	\N	\N	1460
5524	4	7501072210661	0	Admin	2023-10-24	\N	\N	1392
5525	4	7501072210678	0	Admin	2023-10-24	\N	\N	1282
5526	4	7501072210685	0	Admin	2023-10-24	\N	\N	1076
5527	4	7501072210692	0	Admin	2023-10-24	\N	\N	487
5528	4	7501072210715	0	Admin	2023-10-24	\N	\N	1222
5529	4	7501072210722	0	Admin	2023-10-24	\N	\N	1354
5530	4	7501072210739	0	Admin	2023-10-24	\N	\N	1634
5531	4	7501072214485	0	Admin	2023-10-24	\N	\N	924
5532	4	7501072214492	0	Admin	2023-10-24	\N	\N	927
5533	4	7501072214508	0	Admin	2023-10-24	\N	\N	919
5534	4	7501072214515	0	Admin	2023-10-24	\N	\N	926
5535	4	7501072214522	0	Admin	2023-10-24	\N	\N	923
5536	4	7501072214539	0	Admin	2023-10-24	\N	\N	921
5537	4	7501072214546	0	Admin	2023-10-24	\N	\N	922
5538	4	7501072214560	0	Admin	2023-10-24	\N	\N	920
5539	4	7502010420043	0	Admin	2023-10-24	\N	\N	1283
5540	4	7502010421118	0	Admin	2023-10-24	\N	\N	503
5541	4	7502010421125	0	Admin	2023-10-24	\N	\N	502
5542	4	7502010421132	0	Admin	2023-10-24	\N	\N	501
5543	4	7502010421187	0	Admin	2023-10-24	\N	\N	513
5544	4	7502010421194	0	Admin	2023-10-24	\N	\N	1444
5545	4	7502010423969	0	Admin	2023-10-24	\N	\N	530
5546	4	7502010429701	0	Admin	2023-10-24	\N	\N	537
5547	4	7502262630023	0	Admin	2023-10-24	\N	\N	763
5548	4	7502262630740	0	Admin	2023-10-24	\N	\N	518
5549	4	7502262630795	0	Admin	2023-10-24	\N	\N	1275
5550	4	7503008553002	0	Admin	2023-10-24	\N	\N	753
5551	4	7503008553040	0	Admin	2023-10-24	\N	\N	752
5552	4	7503008553057	0	Admin	2023-10-24	\N	\N	1593
5553	4	7503008553071	0	Admin	2023-10-24	\N	\N	1589
5554	4	7503008553200	0	Admin	2023-10-24	\N	\N	750
5555	4	7503008553231	0	Admin	2023-10-24	\N	\N	1396
5556	4	7503008553248	0	Admin	2023-10-24	\N	\N	751
5557	4	7503008553255	0	Admin	2023-10-24	\N	\N	1395
5558	4	7503008553279	0	Admin	2023-10-24	\N	\N	1428
5559	4	7503008553965	0	Admin	2023-10-24	\N	\N	799
5560	4	7503008553972	0	Admin	2023-10-24	\N	\N	1394
5561	4	7503019166604	0	Admin	2023-10-24	\N	\N	520
5562	4	7503020053085	0	Admin	2023-10-24	\N	\N	1393
5563	4	7503020053290	0	Admin	2023-10-24	\N	\N	754
5564	4	7503020053306	0	Admin	2023-10-24	\N	\N	757
5565	4	7503020053313	0	Admin	2023-10-24	\N	\N	758
5566	4	7503020053320	0	Admin	2023-10-24	\N	\N	1397
5567	4	7503020053382	0	Admin	2023-10-24	\N	\N	1590
5568	4	7503020053849	0	Admin	2023-10-24	\N	\N	798
5569	4	7503026084113	0	Admin	2023-10-24	\N	\N	756
5570	4	7503026084144	0	Admin	2023-10-24	\N	\N	755
5571	4	7503026470107	0	Admin	2023-10-24	\N	\N	846
5572	4	7503027959472	0	Admin	2023-10-24	\N	\N	527
5573	4	7506267903489	0	Admin	2023-10-24	\N	\N	1438
5574	4	7506267907340	0	Admin	2023-10-24	\N	\N	1442
5575	4	7506267907357	0	Admin	2023-10-24	\N	\N	1441
5576	4	7506267907371	0	Admin	2023-10-24	\N	\N	1440
5577	4	7506343800015	0	Admin	2023-10-24	\N	\N	644
5578	4	7506343800022	0	Admin	2023-10-24	\N	\N	645
5579	4	7506343800039	0	Admin	2023-10-24	\N	\N	646
5580	4	7506343800176	0	Admin	2023-10-24	\N	\N	642
5581	4	7506343800190	0	Admin	2023-10-24	\N	\N	643
5582	4	7506343800794	0	Admin	2023-10-24	\N	\N	631
5583	4	7506343801784	0	Admin	2023-10-24	\N	\N	647
5584	4	7506343802668	0	Admin	2023-10-24	\N	\N	630
5585	4	7506343802675	0	Admin	2023-10-24	\N	\N	649
5586	4	7506343802798	0	Admin	2023-10-24	\N	\N	648
5587	4	7506396700645	0	Admin	2023-10-24	\N	\N	532
5588	4	7506407400328	0	Admin	2023-10-24	\N	\N	519
5589	4	7506407400618	0	Admin	2023-10-24	\N	\N	969
5590	4	7506407400625	0	Admin	2023-10-24	\N	\N	970
5591	4	7506407400977	0	Admin	2023-10-24	\N	\N	968
5592	4	7506407401691	0	Admin	2023-10-24	\N	\N	967
5593	4	7506407402094	0	Admin	2023-10-24	\N	\N	965
5594	4	7506407402124	0	Admin	2023-10-24	\N	\N	538
5595	4	7506407402193	0	Admin	2023-10-24	\N	\N	971
5596	4	7506407402216	0	Admin	2023-10-24	\N	\N	523
5597	4	7506407402247	0	Admin	2023-10-24	\N	\N	528
5598	4	7506407402469	0	Admin	2023-10-24	\N	\N	966
5599	4	7593990010041	0	Admin	2023-10-24	\N	\N	1082
5600	4	7593990010058	0	Admin	2023-10-24	\N	\N	1105
5601	4	7593990012953	0	Admin	2023-10-24	\N	\N	1104
5602	4	7593990050511	0	Admin	2023-10-24	\N	\N	1103
5603	4	769229001167	0	Admin	2023-10-24	\N	\N	651
5604	4	769229002430	0	Admin	2023-10-24	\N	\N	663
5605	4	769229002683	0	Admin	2023-10-24	\N	\N	672
5606	4	769229003611	0	Admin	2023-10-24	\N	\N	658
5607	4	769229003710	0	Admin	2023-10-24	\N	\N	673
5608	4	769229003734	0	Admin	2023-10-24	\N	\N	664
5609	4	769229003741	0	Admin	2023-10-24	\N	\N	656
5610	4	769229003758	0	Admin	2023-10-24	\N	\N	657
5611	4	769229049510	0	Admin	2023-10-24	\N	\N	655
5612	4	769229124217	0	Admin	2023-10-24	\N	\N	650
5613	4	769229131413	0	Admin	2023-10-24	\N	\N	653
5614	4	769229131512	0	Admin	2023-10-24	\N	\N	652
5615	4	769229131918	0	Admin	2023-10-24	\N	\N	654
5616	4	7707007404604	0	Admin	2023-10-24	\N	\N	1256
5617	4	7707007405663	0	Admin	2023-10-24	\N	\N	1258
5618	4	7707115301161	0	Admin	2023-10-24	\N	\N	458
5619	4	7707115301222	0	Admin	2023-10-24	\N	\N	455
5620	4	7707115301468	0	Admin	2023-10-24	\N	\N	457
5621	4	7707115301611	0	Admin	2023-10-24	\N	\N	536
5622	4	7707214570659	0	Admin	2023-10-24	\N	\N	940
5623	4	7707214570833	0	Admin	2023-10-24	\N	\N	941
5624	4	7707214570918	0	Admin	2023-10-24	\N	\N	937
5625	4	7707214570949	0	Admin	2023-10-24	\N	\N	938
5626	4	7707214573001	0	Admin	2023-10-24	\N	\N	939
5627	4	7707274710316	0	Admin	2023-10-24	\N	\N	515
5628	4	7707274714215	0	Admin	2023-10-24	\N	\N	460
5629	4	7707274715014	0	Admin	2023-10-24	\N	\N	454
5630	4	7707274717001	0	Admin	2023-10-24	\N	\N	459
5631	4	7707274718060	0	Admin	2023-10-24	\N	\N	453
5632	4	7730952032677	0	Admin	2023-10-24	\N	\N	526
5633	4	7730952032899	0	Admin	2023-10-24	\N	\N	1525
5634	4	7730997410614	0	Admin	2023-10-24	\N	\N	760
5635	4	7730997410621	0	Admin	2023-10-24	\N	\N	759
5636	4	7730997410638	0	Admin	2023-10-24	\N	\N	761
5637	4	7730997410645	0	Admin	2023-10-24	\N	\N	762
5638	4	7756654000363	0	Admin	2023-10-24	\N	\N	1509
5639	4	7756654000370	0	Admin	2023-10-24	\N	\N	1508
5640	4	7756654000387	0	Admin	2023-10-24	\N	\N	1512
5641	4	7756654000400	0	Admin	2023-10-24	\N	\N	1516
5642	4	7756654000424	0	Admin	2023-10-24	\N	\N	1505
5643	4	7756654000448	0	Admin	2023-10-24	\N	\N	1510
5644	4	7756654015220	0	Admin	2023-10-24	\N	\N	1504
5645	4	7756654020156	0	Admin	2023-10-24	\N	\N	1514
5646	4	7756654020293	0	Admin	2023-10-24	\N	\N	1511
5647	4	7756654027926	0	Admin	2023-10-24	\N	\N	1618
5648	4	7756654027933	0	Admin	2023-10-24	\N	\N	1617
5649	4	7756654027940	0	Admin	2023-10-24	\N	\N	1616
5650	4	7759433000059	0	Admin	2023-10-24	\N	\N	1475
5651	4	7759433000882	0	Admin	2023-10-24	\N	\N	1274
5652	4	7759433000998	0	Admin	2023-10-24	\N	\N	1264
5653	4	7759433001193	0	Admin	2023-10-24	\N	\N	1633
5654	4	7759433001933	0	Admin	2023-10-24	\N	\N	1628
5655	4	7759433001940	0	Admin	2023-10-24	\N	\N	1629
5656	4	7792716421868	0	Admin	2023-10-24	\N	\N	1523
5657	4	7797600000174	0	Admin	2023-10-24	\N	\N	1260
5658	4	7797600000501	0	Admin	2023-10-24	\N	\N	1269
5659	4	7797600000518	0	Admin	2023-10-24	\N	\N	1253
5660	4	7797600000761	0	Admin	2023-10-24	\N	\N	1257
5661	4	7797600000785	0	Admin	2023-10-24	\N	\N	1261
5662	4	7797600001805	0	Admin	2023-10-24	\N	\N	1252
5663	4	7797600001812	0	Admin	2023-10-24	\N	\N	1255
5664	4	7797600002895	0	Admin	2023-10-24	\N	\N	1547
5665	4	7797600002901	0	Admin	2023-10-24	\N	\N	1519
5666	4	7798042360055	0	Admin	2023-10-24	\N	\N	767
5667	4	7798042360093	0	Admin	2023-10-24	\N	\N	769
5668	4	7798042360109	0	Admin	2023-10-24	\N	\N	768
5669	4	7798042360178	0	Admin	2023-10-24	\N	\N	766
5670	4	7798042360185	0	Admin	2023-10-24	\N	\N	535
5671	4	7798042360260	0	Admin	2023-10-24	\N	\N	770
5672	4	7798042360468	0	Admin	2023-10-24	\N	\N	764
5673	4	7798042360581	0	Admin	2023-10-24	\N	\N	771
5674	4	7798042361311	0	Admin	2023-10-24	\N	\N	785
5675	4	7798042361335	0	Admin	2023-10-24	\N	\N	540
5676	4	7798042361359	0	Admin	2023-10-24	\N	\N	773
5677	4	7798042361380	0	Admin	2023-10-24	\N	\N	774
5678	4	7798042361533	0	Admin	2023-10-24	\N	\N	780
5679	4	7798042364800	0	Admin	2023-10-24	\N	\N	514
5680	4	7798042364961	0	Admin	2023-10-24	\N	\N	772
5681	4	7798042365685	0	Admin	2023-10-24	\N	\N	781
5682	4	7798042365692	0	Admin	2023-10-24	\N	\N	782
5683	4	7798042365708	0	Admin	2023-10-24	\N	\N	928
5684	4	7798042365715	0	Admin	2023-10-24	\N	\N	903
5685	4	7798042365722	0	Admin	2023-10-24	\N	\N	902
5686	4	7798042365739	0	Admin	2023-10-24	\N	\N	925
5687	4	7798042365975	0	Admin	2023-10-24	\N	\N	765
5688	4	7798042366170	0	Admin	2023-10-24	\N	\N	783
5689	4	7798042366187	0	Admin	2023-10-24	\N	\N	784
5690	4	7798042366200	0	Admin	2023-10-24	\N	\N	778
5691	4	7798042366217	0	Admin	2023-10-24	\N	\N	779
5692	4	7798042366224	0	Admin	2023-10-24	\N	\N	790
5693	4	7798042366231	0	Admin	2023-10-24	\N	\N	531
5694	4	7798042366255	0	Admin	2023-10-24	\N	\N	775
5695	4	7798042366262	0	Admin	2023-10-24	\N	\N	776
5696	4	7798144990860	0	Admin	2023-10-24	\N	\N	1453
5697	4	7798144993663	0	Admin	2023-10-24	\N	\N	1173
5698	4	7798156460054	0	Admin	2023-10-24	\N	\N	521
5699	4	7798156460061	0	Admin	2023-10-24	\N	\N	1524
5700	4	7798156460290	0	Admin	2023-10-24	\N	\N	529
5701	4	7798156460429	0	Admin	2023-10-24	\N	\N	544
5702	4	7798156460498	0	Admin	2023-10-24	\N	\N	533
5703	4	7798156460740	0	Admin	2023-10-24	\N	\N	1526
5704	4	7798156461051	0	Admin	2023-10-24	\N	\N	539
5705	4	7798156461808	0	Admin	2023-10-24	\N	\N	800
5706	4	7798156461815	0	Admin	2023-10-24	\N	\N	801
5707	4	7798156461853	0	Admin	2023-10-24	\N	\N	545
5708	4	7798156461884	0	Admin	2023-10-24	\N	\N	534
5709	4	7798156462928	0	Admin	2023-10-24	\N	\N	541
5710	4	7798156463185	0	Admin	2023-10-24	\N	\N	543
5711	4	7798166871895	0	Admin	2023-10-24	\N	\N	629
5712	4	7798166871901	0	Admin	2023-10-24	\N	\N	632
5713	4	7798166873134	0	Admin	2023-10-24	\N	\N	634
5714	4	7798166873141	0	Admin	2023-10-24	\N	\N	635
5715	4	7798166873158	0	Admin	2023-10-24	\N	\N	636
5716	4	7798166873165	0	Admin	2023-10-24	\N	\N	633
5717	4	7798166873172	0	Admin	2023-10-24	\N	\N	637
5718	4	7798176420403	0	Admin	2023-10-24	\N	\N	1621
5719	4	7798176420410	0	Admin	2023-10-24	\N	\N	952
5720	4	7798176420434	0	Admin	2023-10-24	\N	\N	953
5721	4	7798176420458	0	Admin	2023-10-24	\N	\N	950
5722	4	7798176420465	0	Admin	2023-10-24	\N	\N	946
5723	4	7798176421073	0	Admin	2023-10-24	\N	\N	863
5724	4	7798176421080	0	Admin	2023-10-24	\N	\N	864
5725	4	7798176421097	0	Admin	2023-10-24	\N	\N	865
5726	4	7798176421103	0	Admin	2023-10-24	\N	\N	866
5727	4	7798176421110	0	Admin	2023-10-24	\N	\N	867
5728	4	7798176421196	0	Admin	2023-10-24	\N	\N	949
5729	4	7798176421202	0	Admin	2023-10-24	\N	\N	951
5730	4	7798176421219	0	Admin	2023-10-24	\N	\N	1638
5731	4	7798176421264	0	Admin	2023-10-24	\N	\N	948
5732	4	7798176421745	0	Admin	2023-10-24	\N	\N	1472
5733	4	7798176421752	0	Admin	2023-10-24	\N	\N	1473
5734	4	7798176421769	0	Admin	2023-10-24	\N	\N	1612
5735	4	7798176421776	0	Admin	2023-10-24	\N	\N	1474
5736	4	7798176421868	0	Admin	2023-10-24	\N	\N	868
5737	4	7798176421875	0	Admin	2023-10-24	\N	\N	869
5738	4	7798176421882	0	Admin	2023-10-24	\N	\N	870
5739	4	7798176421899	0	Admin	2023-10-24	\N	\N	871
5740	4	7798176421905	0	Admin	2023-10-24	\N	\N	872
5741	4	7798176422926	0	Admin	2023-10-24	\N	\N	947
5742	4	7798359710017	0	Admin	2023-10-24	\N	\N	1382
5743	4	7800006000232	0	Admin	2023-10-24	\N	\N	913
5744	4	7800006002038	0	Admin	2023-10-24	\N	\N	912
5745	4	7800006002700	0	Admin	2023-10-24	\N	\N	918
5746	4	7800006002724	0	Admin	2023-10-24	\N	\N	911
5747	4	7800006003370	0	Admin	2023-10-24	\N	\N	915
5748	4	7800006003561	0	Admin	2023-10-24	\N	\N	914
5749	4	7800006003646	0	Admin	2023-10-24	\N	\N	917
5750	4	7800006005169	0	Admin	2023-10-24	\N	\N	916
5751	4	7800019000014	0	Admin	2023-10-24	\N	\N	1446
5752	4	784369477115	0	Admin	2023-10-24	\N	\N	588
5753	4	784369477122	0	Admin	2023-10-24	\N	\N	589
5754	4	7898049715480	0	Admin	2023-10-24	\N	\N	506
5755	4	7898049719273	0	Admin	2023-10-24	\N	\N	1643
5756	4	7898416700040	0	Admin	2023-10-24	\N	\N	517
5757	4	7898416700521	0	Admin	2023-10-24	\N	\N	932
5758	4	7898416700743	0	Admin	2023-10-24	\N	\N	933
5759	4	7898416701344	0	Admin	2023-10-24	\N	\N	929
5760	4	7898416701955	0	Admin	2023-10-24	\N	\N	930
5761	4	7898416701979	0	Admin	2023-10-24	\N	\N	931
5762	4	7898597991329	0	Admin	2023-10-24	\N	\N	525
5763	4	80	0	Admin	2023-10-24	\N	\N	828
5764	4	8010690010908	0	Admin	2023-10-24	\N	\N	43
5765	4	8010690010915	0	Admin	2023-10-24	\N	\N	42
5766	4	8010690010946	0	Admin	2023-10-24	\N	\N	44
5767	4	8010690010991	0	Admin	2023-10-24	\N	\N	46
5768	4	8010690011080	0	Admin	2023-10-24	\N	\N	47
5769	4	8010690011295	0	Admin	2023-10-24	\N	\N	48
5770	4	8010690011301	0	Admin	2023-10-24	\N	\N	50
5771	4	8010690011349	0	Admin	2023-10-24	\N	\N	1554
5772	4	8010690011394	0	Admin	2023-10-24	\N	\N	51
5773	4	8010690011547	0	Admin	2023-10-24	\N	\N	52
5774	4	8010690011745	0	Admin	2023-10-24	\N	\N	53
5775	4	8010690011769	0	Admin	2023-10-24	\N	\N	1553
5776	4	8010690011790	0	Admin	2023-10-24	\N	\N	67
5777	4	8010690011936	0	Admin	2023-10-24	\N	\N	68
5778	4	8010690011967	0	Admin	2023-10-24	\N	\N	70
5779	4	8010690012186	0	Admin	2023-10-24	\N	\N	1538
5780	4	8010690012209	0	Admin	2023-10-24	\N	\N	72
5781	4	8010690012308	0	Admin	2023-10-24	\N	\N	1008
5782	4	8010690012360	0	Admin	2023-10-24	\N	\N	73
5783	4	8010690012476	0	Admin	2023-10-24	\N	\N	74
5784	4	8010690012674	0	Admin	2023-10-24	\N	\N	1009
5785	4	8010690012698	0	Admin	2023-10-24	\N	\N	75
5786	4	8010690014043	0	Admin	2023-10-24	\N	\N	1540
5787	4	8010690025919	0	Admin	2023-10-24	\N	\N	94
5788	4	8010690025926	0	Admin	2023-10-24	\N	\N	95
5789	4	8010690025940	0	Admin	2023-10-24	\N	\N	96
5790	4	8010690025988	0	Admin	2023-10-24	\N	\N	98
5791	4	8010690026015	0	Admin	2023-10-24	\N	\N	99
5792	4	8010690026053	0	Admin	2023-10-24	\N	\N	101
5793	4	8010690026060	0	Admin	2023-10-24	\N	\N	102
5794	4	8010690026084	0	Admin	2023-10-24	\N	\N	103
5795	4	8010690026121	0	Admin	2023-10-24	\N	\N	104
5796	4	8010690026138	0	Admin	2023-10-24	\N	\N	105
5797	4	8010690026152	0	Admin	2023-10-24	\N	\N	106
5798	4	8010690029214	0	Admin	2023-10-24	\N	\N	136
5799	4	8010690029566	0	Admin	2023-10-24	\N	\N	1532
5800	4	8010690029986	0	Admin	2023-10-24	\N	\N	1541
5801	4	8010690029993	0	Admin	2023-10-24	\N	\N	1542
5802	4	8010690030005	0	Admin	2023-10-24	\N	\N	1543
5803	4	8010690030029	0	Admin	2023-10-24	\N	\N	1544
5804	4	8010690037363	0	Admin	2023-10-24	\N	\N	20
5805	4	8010690041926	0	Admin	2023-10-24	\N	\N	58
5806	4	8010690041933	0	Admin	2023-10-24	\N	\N	60
5807	4	8010690041940	0	Admin	2023-10-24	\N	\N	63
5808	4	8010690042084	0	Admin	2023-10-24	\N	\N	1007
5809	4	8010690042091	0	Admin	2023-10-24	\N	\N	57
5810	4	8010690042114	0	Admin	2023-10-24	\N	\N	61
5811	4	8010690042121	0	Admin	2023-10-24	\N	\N	59
5812	4	8010690042145	0	Admin	2023-10-24	\N	\N	65
5813	4	8010690042152	0	Admin	2023-10-24	\N	\N	62
5814	4	8010690047775	0	Admin	2023-10-24	\N	\N	131
5815	4	8010690050072	0	Admin	2023-10-24	\N	\N	54
5816	4	8010690050089	0	Admin	2023-10-24	\N	\N	55
5817	4	8010690050096	0	Admin	2023-10-24	\N	\N	991
5818	4	8010690053677	0	Admin	2023-10-24	\N	\N	1015
5819	4	8010690053691	0	Admin	2023-10-24	\N	\N	1535
5820	4	8010690053714	0	Admin	2023-10-24	\N	\N	1016
5821	4	8010690053738	0	Admin	2023-10-24	\N	\N	997
5822	4	8010690053752	0	Admin	2023-10-24	\N	\N	1530
5823	4	8010690053776	0	Admin	2023-10-24	\N	\N	1531
5824	4	8010690055381	0	Admin	2023-10-24	\N	\N	107
5825	4	8010690055398	0	Admin	2023-10-24	\N	\N	108
5826	4	8010690055404	0	Admin	2023-10-24	\N	\N	109
5827	4	8010690055411	0	Admin	2023-10-24	\N	\N	110
5828	4	8010690055428	0	Admin	2023-10-24	\N	\N	111
5829	4	8010690055435	0	Admin	2023-10-24	\N	\N	112
5830	4	8010690055442	0	Admin	2023-10-24	\N	\N	113
5831	4	8010690055459	0	Admin	2023-10-24	\N	\N	114
5832	4	8010690055466	0	Admin	2023-10-24	\N	\N	115
5833	4	8010690056135	0	Admin	2023-10-24	\N	\N	116
5834	4	8010690056142	0	Admin	2023-10-24	\N	\N	117
5835	4	8010690056159	0	Admin	2023-10-24	\N	\N	118
5836	4	8010690056548	0	Admin	2023-10-24	\N	\N	129
5837	4	8010690056555	0	Admin	2023-10-24	\N	\N	130
5838	4	8010690056562	0	Admin	2023-10-24	\N	\N	134
5839	4	8010690056579	0	Admin	2023-10-24	\N	\N	135
5840	4	8010690056586	0	Admin	2023-10-24	\N	\N	981
5841	4	8010690056616	0	Admin	2023-10-24	\N	\N	1533
5842	4	8010690056630	0	Admin	2023-10-24	\N	\N	1141
5843	4	8010690056647	0	Admin	2023-10-24	\N	\N	137
5844	4	8010690056654	0	Admin	2023-10-24	\N	\N	1142
5845	4	8010690056661	0	Admin	2023-10-24	\N	\N	138
5846	4	8010690057552	0	Admin	2023-10-24	\N	\N	28
5847	4	8010690057569	0	Admin	2023-10-24	\N	\N	29
5848	4	8010690058160	0	Admin	2023-10-24	\N	\N	985
5849	4	8010690059082	0	Admin	2023-10-24	\N	\N	1155
5850	4	8010690061696	0	Admin	2023-10-24	\N	\N	389
5851	4	8010690061702	0	Admin	2023-10-24	\N	\N	25
5852	4	8010690062853	0	Admin	2023-10-24	\N	\N	24
5853	4	8010690067339	0	Admin	2023-10-24	\N	\N	1138
5854	4	8010690068121	0	Admin	2023-10-24	\N	\N	1160
5855	4	8010690068138	0	Admin	2023-10-24	\N	\N	1161
5856	4	8010690080017	0	Admin	2023-10-24	\N	\N	90
5857	4	8010690080024	0	Admin	2023-10-24	\N	\N	91
5858	4	8010690080031	0	Admin	2023-10-24	\N	\N	92
5859	4	8010690088365	0	Admin	2023-10-24	\N	\N	132
5860	4	8010690088457	0	Admin	2023-10-24	\N	\N	1159
5861	4	8010690088563	0	Admin	2023-10-24	\N	\N	1529
5862	4	8010690091471	0	Admin	2023-10-24	\N	\N	982
5863	4	8010690092898	0	Admin	2023-10-24	\N	\N	1539
5864	4	8010690093604	0	Admin	2023-10-24	\N	\N	133
5865	4	8010690099552	0	Admin	2023-10-24	\N	\N	1546
5866	4	8010690101491	0	Admin	2023-10-24	\N	\N	127
5867	4	8010690101507	0	Admin	2023-10-24	\N	\N	128
5868	4	8010690105796	0	Admin	2023-10-24	\N	\N	89
5869	4	8010690105802	0	Admin	2023-10-24	\N	\N	93
5870	4	8010690105819	0	Admin	2023-10-24	\N	\N	97
5871	4	8010690105826	0	Admin	2023-10-24	\N	\N	100
5872	4	8010690105833	0	Admin	2023-10-24	\N	\N	66
5873	4	8010690105840	0	Admin	2023-10-24	\N	\N	69
5874	4	8010690105857	0	Admin	2023-10-24	\N	\N	71
5875	4	8010690105864	0	Admin	2023-10-24	\N	\N	41
5876	4	8010690105871	0	Admin	2023-10-24	\N	\N	45
5877	4	8010690105888	0	Admin	2023-10-24	\N	\N	49
5878	4	8010690106571	0	Admin	2023-10-24	\N	\N	1534
5879	4	8010690107028	0	Admin	2023-10-24	\N	\N	31
5880	4	8010690107134	0	Admin	2023-10-24	\N	\N	32
5881	4	8010690115924	0	Admin	2023-10-24	\N	\N	22
5882	4	8010690122946	0	Admin	2023-10-24	\N	\N	139
5883	4	8010690122953	0	Admin	2023-10-24	\N	\N	140
5884	4	8010690122977	0	Admin	2023-10-24	\N	\N	141
5885	4	8010690122991	0	Admin	2023-10-24	\N	\N	142
5886	4	8010690123004	0	Admin	2023-10-24	\N	\N	143
5887	4	8010690123011	0	Admin	2023-10-24	\N	\N	144
5888	4	8010690123035	0	Admin	2023-10-24	\N	\N	145
5889	4	8010690123059	0	Admin	2023-10-24	\N	\N	146
5890	4	8010690123066	0	Admin	2023-10-24	\N	\N	147
5891	4	8010690123073	0	Admin	2023-10-24	\N	\N	148
5892	4	8010690123097	0	Admin	2023-10-24	\N	\N	164
5893	4	8010690123110	0	Admin	2023-10-24	\N	\N	149
5894	4	8010690123141	0	Admin	2023-10-24	\N	\N	150
5895	4	8010690123158	0	Admin	2023-10-24	\N	\N	151
5896	4	8010690123172	0	Admin	2023-10-24	\N	\N	152
5897	4	8010690123196	0	Admin	2023-10-24	\N	\N	153
5898	4	8010690123202	0	Admin	2023-10-24	\N	\N	154
5899	4	8010690123219	0	Admin	2023-10-24	\N	\N	155
5900	4	8010690123233	0	Admin	2023-10-24	\N	\N	156
5901	4	8010690123257	0	Admin	2023-10-24	\N	\N	157
5902	4	8010690133362	0	Admin	2023-10-24	\N	\N	21
5903	4	8010690140346	0	Admin	2023-10-24	\N	\N	1010
5904	4	8010690140360	0	Admin	2023-10-24	\N	\N	1011
5905	4	8010690140377	0	Admin	2023-10-24	\N	\N	1012
5906	4	8010690140384	0	Admin	2023-10-24	\N	\N	1013
5907	4	8010690148977	0	Admin	2023-10-24	\N	\N	1146
5908	4	8010690149004	0	Admin	2023-10-24	\N	\N	1147
5909	4	8010690149011	0	Admin	2023-10-24	\N	\N	1148
5910	4	8010690149028	0	Admin	2023-10-24	\N	\N	1151
5911	4	8010690149059	0	Admin	2023-10-24	\N	\N	1149
5912	4	8010690149066	0	Admin	2023-10-24	\N	\N	1150
5913	4	8010690149073	0	Admin	2023-10-24	\N	\N	1153
5914	4	8010690149097	0	Admin	2023-10-24	\N	\N	1154
5915	4	8010690149103	0	Admin	2023-10-24	\N	\N	1152
5916	4	8010690153100	0	Admin	2023-10-24	\N	\N	1158
5917	4	8010690153124	0	Admin	2023-10-24	\N	\N	1157
5918	4	8010690153568	0	Admin	2023-10-24	\N	\N	26
5919	4	8010690153582	0	Admin	2023-10-24	\N	\N	27
5920	4	8010690156156	0	Admin	2023-10-24	\N	\N	1179
5921	4	8010690156163	0	Admin	2023-10-24	\N	\N	1180
5922	4	8010690159270	0	Admin	2023-10-24	\N	\N	23
5923	4	8010690159782	0	Admin	2023-10-24	\N	\N	56
5924	4	8010690159867	0	Admin	2023-10-24	\N	\N	64
5925	4	8010690160443	0	Admin	2023-10-24	\N	\N	1144
5926	4	8010690160474	0	Admin	2023-10-24	\N	\N	1143
5927	4	8010690160481	0	Admin	2023-10-24	\N	\N	1145
5928	4	8010690160498	0	Admin	2023-10-24	\N	\N	984
5929	4	8010690160511	0	Admin	2023-10-24	\N	\N	1400
5930	4	8010690164670	0	Admin	2023-10-24	\N	\N	1545
5931	4	8010690166308	0	Admin	2023-10-24	\N	\N	76
5932	4	8010690166315	0	Admin	2023-10-24	\N	\N	77
5933	4	8010690166322	0	Admin	2023-10-24	\N	\N	78
5934	4	8010690166339	0	Admin	2023-10-24	\N	\N	79
5935	4	8010690166346	0	Admin	2023-10-24	\N	\N	80
5936	4	8010690166353	0	Admin	2023-10-24	\N	\N	81
5937	4	8010690166360	0	Admin	2023-10-24	\N	\N	82
5938	4	8010690166377	0	Admin	2023-10-24	\N	\N	83
5939	4	8010690168821	0	Admin	2023-10-24	\N	\N	980
5940	4	8010690172033	0	Admin	2023-10-24	\N	\N	1014
5941	4	8010690175331	0	Admin	2023-10-24	\N	\N	1552
5942	4	8010690175355	0	Admin	2023-10-24	\N	\N	33
5943	4	8010690175362	0	Admin	2023-10-24	\N	\N	34
5944	4	8010690175379	0	Admin	2023-10-24	\N	\N	35
5945	4	8010690175386	0	Admin	2023-10-24	\N	\N	36
5946	4	8010690175409	0	Admin	2023-10-24	\N	\N	37
5947	4	8010690175416	0	Admin	2023-10-24	\N	\N	38
5948	4	8010690175423	0	Admin	2023-10-24	\N	\N	986
5949	4	8010690175454	0	Admin	2023-10-24	\N	\N	988
5950	4	8010690175478	0	Admin	2023-10-24	\N	\N	989
5951	4	8010690175485	0	Admin	2023-10-24	\N	\N	39
5952	4	8010690175492	0	Admin	2023-10-24	\N	\N	990
5953	4	8010690175508	0	Admin	2023-10-24	\N	\N	40
5954	4	8010690175515	0	Admin	2023-10-24	\N	\N	84
5955	4	8010690175522	0	Admin	2023-10-24	\N	\N	85
5956	4	8010690175546	0	Admin	2023-10-24	\N	\N	1537
5957	4	8010690175553	0	Admin	2023-10-24	\N	\N	86
5958	4	8010690175577	0	Admin	2023-10-24	\N	\N	87
5959	4	8010690175584	0	Admin	2023-10-24	\N	\N	88
5960	4	8010690176161	0	Admin	2023-10-24	\N	\N	119
5961	4	8010690176178	0	Admin	2023-10-24	\N	\N	120
5962	4	8010690176208	0	Admin	2023-10-24	\N	\N	121
5963	4	8010690176215	0	Admin	2023-10-24	\N	\N	122
5964	4	8010690176222	0	Admin	2023-10-24	\N	\N	123
5965	4	8010690176260	0	Admin	2023-10-24	\N	\N	124
5966	4	8010690176277	0	Admin	2023-10-24	\N	\N	125
5967	4	8010690176307	0	Admin	2023-10-24	\N	\N	126
5968	4	8010690179445	0	Admin	2023-10-24	\N	\N	1536
5969	4	8010690180076	0	Admin	2023-10-24	\N	\N	998
5970	4	8010690180106	0	Admin	2023-10-24	\N	\N	999
5971	4	8010690180137	0	Admin	2023-10-24	\N	\N	1000
5972	4	8010690180168	0	Admin	2023-10-24	\N	\N	1001
5973	4	8010690180182	0	Admin	2023-10-24	\N	\N	1002
5974	4	8010690180755	0	Admin	2023-10-24	\N	\N	30
5975	4	8010690191065	0	Admin	2023-10-24	\N	\N	1527
5976	4	8010690191089	0	Admin	2023-10-24	\N	\N	1528
5977	4	81	0	Admin	2023-10-24	\N	\N	829
5978	4	811794010850	0	Admin	2023-10-24	\N	\N	1087
5979	4	811794010898	0	Admin	2023-10-24	\N	\N	1432
5980	4	82	0	Admin	2023-10-24	\N	\N	830
5981	4	83	0	Admin	2023-10-24	\N	\N	831
5982	4	84	0	Admin	2023-10-24	\N	\N	832
5983	4	8410650150130	0	Admin	2023-10-24	\N	\N	1480
5984	4	8410650150147	0	Admin	2023-10-24	\N	\N	690
5985	4	8410650150185	0	Admin	2023-10-24	\N	\N	1592
5986	4	8410650150192	0	Admin	2023-10-24	\N	\N	691
5987	4	8410650150253	0	Admin	2023-10-24	\N	\N	1205
5988	4	8410650151892	0	Admin	2023-10-24	\N	\N	1206
5989	4	8410650151946	0	Admin	2023-10-24	\N	\N	1207
5990	4	8410650152264	0	Admin	2023-10-24	\N	\N	693
5991	4	8410650152288	0	Admin	2023-10-24	\N	\N	1200
5992	4	8410650152301	0	Admin	2023-10-24	\N	\N	1204
5993	4	8410650152325	0	Admin	2023-10-24	\N	\N	695
5994	4	8410650152363	0	Admin	2023-10-24	\N	\N	1203
5995	4	8410650152400	0	Admin	2023-10-24	\N	\N	699
5996	4	8410650152448	0	Admin	2023-10-24	\N	\N	698
5997	4	8410650160474	0	Admin	2023-10-24	\N	\N	1557
5998	4	8410650167817	0	Admin	2023-10-24	\N	\N	694
5999	4	8410650168104	0	Admin	2023-10-24	\N	\N	1199
6000	4	8410650168128	0	Admin	2023-10-24	\N	\N	1201
6001	4	8410650170695	0	Admin	2023-10-24	\N	\N	692
6002	4	8410650170718	0	Admin	2023-10-24	\N	\N	1202
6003	4	8410650218649	0	Admin	2023-10-24	\N	\N	696
6004	4	8410650239132	0	Admin	2023-10-24	\N	\N	697
6005	4	842704100095	0	Admin	2023-10-24	\N	\N	834
6006	4	842704100743	0	Admin	2023-10-24	\N	\N	833
6007	4	8433042001582	0	Admin	2023-10-24	\N	\N	1450
6008	4	8436001971605	0	Admin	2023-10-24	\N	\N	793
6009	4	8436001971612	0	Admin	2023-10-24	\N	\N	1635
6010	4	8436001971643	0	Admin	2023-10-24	\N	\N	791
6011	4	8436001971650	0	Admin	2023-10-24	\N	\N	794
6012	4	8436001971681	0	Admin	2023-10-24	\N	\N	792
6013	4	8436001971704	0	Admin	2023-10-24	\N	\N	796
6014	4	8436001971728	0	Admin	2023-10-24	\N	\N	795
6015	4	8436532730030	0	Admin	2023-10-24	\N	\N	853
6016	4	8436532730047	0	Admin	2023-10-24	\N	\N	854
6017	4	8436532730122	0	Admin	2023-10-24	\N	\N	1279
6018	4	8436532730139	0	Admin	2023-10-24	\N	\N	1455
6019	4	8436532730146	0	Admin	2023-10-24	\N	\N	1280
6020	4	8436532730252	0	Admin	2023-10-24	\N	\N	1281
6021	4	8436532730412	0	Admin	2023-10-24	\N	\N	1456
6022	4	8436532730665	0	Admin	2023-10-24	\N	\N	855
6023	4	8470000397516	0	Admin	2023-10-24	\N	\N	1627
6024	4	8470000491269	0	Admin	2023-10-24	\N	\N	1619
6025	4	8470000493195	0	Admin	2023-10-24	\N	\N	1620
6026	4	8470000647512	0	Admin	2023-10-24	\N	\N	1500
6027	4	8470000957512	0	Admin	2023-10-24	\N	\N	1626
6028	4	847922021016	0	Admin	2023-10-24	\N	\N	1003
6029	4	847922021115	0	Admin	2023-10-24	\N	\N	1630
6030	4	847922021191	0	Admin	2023-10-24	\N	\N	1139
6031	4	847922021559	0	Admin	2023-10-24	\N	\N	1004
6032	4	847922021580	0	Admin	2023-10-24	\N	\N	1005
6033	4	847922021610	0	Admin	2023-10-24	\N	\N	1006
6034	4	847922024031	0	Admin	2023-10-24	\N	\N	976
6035	4	847922024048	0	Admin	2023-10-24	\N	\N	977
6036	4	847922027438	0	Admin	2023-10-24	\N	\N	978
6037	4	847922028084	0	Admin	2023-10-24	\N	\N	979
6038	4	847922075613	0	Admin	2023-10-24	\N	\N	161
6039	4	8699245857306	0	Admin	2023-10-24	\N	\N	1379
6040	4	8699245857313	0	Admin	2023-10-24	\N	\N	908
6041	4	8699245857337	0	Admin	2023-10-24	\N	\N	907
6042	4	8699245857351	0	Admin	2023-10-24	\N	\N	1380
6043	4	8699245857399	0	Admin	2023-10-24	\N	\N	1378
6044	4	8699245857405	0	Admin	2023-10-24	\N	\N	909
6045	4	8699245857429	0	Admin	2023-10-24	\N	\N	910
6046	4	8699245857443	0	Admin	2023-10-24	\N	\N	1381
6047	4	8713184080653	0	Admin	2023-10-24	\N	\N	1445
6048	4	8713184134349	0	Admin	2023-10-24	\N	\N	665
6049	4	8713184135278	0	Admin	2023-10-24	\N	\N	666
6050	4	8713184135285	0	Admin	2023-10-24	\N	\N	667
6051	4	8713184135292	0	Admin	2023-10-24	\N	\N	668
6052	4	8713184141408	0	Admin	2023-10-24	\N	\N	669
6053	4	8886467510229	0	Admin	2023-10-24	\N	\N	165
6054	4	8886467510236	0	Admin	2023-10-24	\N	\N	166
6055	4	8886467510250	0	Admin	2023-10-24	\N	\N	167
6056	4	8886467510267	0	Admin	2023-10-24	\N	\N	168
6057	4	8886467510281	0	Admin	2023-10-24	\N	\N	169
6058	4	8886467510311	0	Admin	2023-10-24	\N	\N	170
6059	4	8886467510328	0	Admin	2023-10-24	\N	\N	171
6060	4	8886467510335	0	Admin	2023-10-24	\N	\N	172
6061	4	8886467510410	0	Admin	2023-10-24	\N	\N	173
6062	4	8886467510427	0	Admin	2023-10-24	\N	\N	174
6063	4	8886467510434	0	Admin	2023-10-24	\N	\N	175
6064	4	8886467510441	0	Admin	2023-10-24	\N	\N	176
6065	4	8886467510458	0	Admin	2023-10-24	\N	\N	177
6066	4	8886467510465	0	Admin	2023-10-24	\N	\N	178
6067	4	8886467510588	0	Admin	2023-10-24	\N	\N	179
6068	4	8886467510724	0	Admin	2023-10-24	\N	\N	180
6069	4	8886467510755	0	Admin	2023-10-24	\N	\N	19
6070	4	8886467510830	0	Admin	2023-10-24	\N	\N	181
6071	4	8886467514210	0	Admin	2023-10-24	\N	\N	182
6072	4	8886467514401	0	Admin	2023-10-24	\N	\N	183
6073	4	8886467514418	0	Admin	2023-10-24	\N	\N	184
6074	4	8886467514425	0	Admin	2023-10-24	\N	\N	185
6075	4	8886467514463	0	Admin	2023-10-24	\N	\N	197
6076	4	8886467514470	0	Admin	2023-10-24	\N	\N	186
6077	4	8886467514487	0	Admin	2023-10-24	\N	\N	187
6078	4	8886467514494	0	Admin	2023-10-24	\N	\N	188
6079	4	8886467514579	0	Admin	2023-10-24	\N	\N	189
6080	4	8886467514616	0	Admin	2023-10-24	\N	\N	190
6081	4	8886467514623	0	Admin	2023-10-24	\N	\N	191
6082	4	8886467514630	0	Admin	2023-10-24	\N	\N	192
6083	4	8886467514647	0	Admin	2023-10-24	\N	\N	193
6084	4	8886467514654	0	Admin	2023-10-24	\N	\N	194
6085	4	8886467514661	0	Admin	2023-10-24	\N	\N	195
6086	4	8886467514678	0	Admin	2023-10-24	\N	\N	196
6087	4	8886467514685	0	Admin	2023-10-24	\N	\N	198
6088	4	8886467514692	0	Admin	2023-10-24	\N	\N	199
6089	4	8886467514715	0	Admin	2023-10-24	\N	\N	200
6090	4	8886467514722	0	Admin	2023-10-24	\N	\N	905
6091	4	8886467514739	0	Admin	2023-10-24	\N	\N	201
6092	4	8886467514746	0	Admin	2023-10-24	\N	\N	202
6093	4	8886467514760	0	Admin	2023-10-24	\N	\N	203
6094	4	8886467514814	0	Admin	2023-10-24	\N	\N	204
6095	4	8886467514821	0	Admin	2023-10-24	\N	\N	205
6096	4	8886467514906	0	Admin	2023-10-24	\N	\N	206
6097	4	8886467514920	0	Admin	2023-10-24	\N	\N	207
6098	4	8886467515521	0	Admin	2023-10-24	\N	\N	1385
6099	4	8886467515644	0	Admin	2023-10-24	\N	\N	208
6100	4	8886467515811	0	Admin	2023-10-24	\N	\N	209
6101	4	8886467515866	0	Admin	2023-10-24	\N	\N	210
6102	4	8886467515897	0	Admin	2023-10-24	\N	\N	211
6103	4	8886467515927	0	Admin	2023-10-24	\N	\N	212
6104	4	8886467515934	0	Admin	2023-10-24	\N	\N	213
6105	4	8886467515965	0	Admin	2023-10-24	\N	\N	214
6106	4	8886467520112	0	Admin	2023-10-24	\N	\N	215
6107	4	8886467520129	0	Admin	2023-10-24	\N	\N	216
6108	4	8886467520136	0	Admin	2023-10-24	\N	\N	217
6109	4	88864675201368886467520136	0	Admin	2023-10-24	\N	\N	1614
6110	4	8886467520143	0	Admin	2023-10-24	\N	\N	218
6111	4	8886467520150	0	Admin	2023-10-24	\N	\N	219
6112	4	8886467523212	0	Admin	2023-10-24	\N	\N	220
6113	4	8886467523229	0	Admin	2023-10-24	\N	\N	221
6114	4	8886467523236	0	Admin	2023-10-24	\N	\N	222
6115	4	8886467523243	0	Admin	2023-10-24	\N	\N	223
6116	4	8886467523250	0	Admin	2023-10-24	\N	\N	224
6117	4	8886467523267	0	Admin	2023-10-24	\N	\N	225
6118	4	8886467523274	0	Admin	2023-10-24	\N	\N	226
6119	4	8886467523298	0	Admin	2023-10-24	\N	\N	228
6120	4	8886467523311	0	Admin	2023-10-24	\N	\N	227
6121	4	8886467523328	0	Admin	2023-10-24	\N	\N	229
6122	4	8886467523335	0	Admin	2023-10-24	\N	\N	230
6123	4	8886467523342	0	Admin	2023-10-24	\N	\N	231
6124	4	8886467523356	0	Admin	2023-10-24	\N	\N	1075
6125	4	8886467523359	0	Admin	2023-10-24	\N	\N	232
6126	4	8886467523366	0	Admin	2023-10-24	\N	\N	233
6127	4	8886467523373	0	Admin	2023-10-24	\N	\N	234
6128	4	8886467523380	0	Admin	2023-10-24	\N	\N	235
6129	4	8886467523397	0	Admin	2023-10-24	\N	\N	236
6130	4	8886467523410	0	Admin	2023-10-24	\N	\N	237
6131	4	8886467523427	0	Admin	2023-10-24	\N	\N	238
6132	4	8886467523434	0	Admin	2023-10-24	\N	\N	239
6133	4	8886467523441	0	Admin	2023-10-24	\N	\N	240
6134	4	8886467523458	0	Admin	2023-10-24	\N	\N	241
6135	4	8886467523465	0	Admin	2023-10-24	\N	\N	242
6136	4	8886467523472	0	Admin	2023-10-24	\N	\N	243
6137	4	8886467523489	0	Admin	2023-10-24	\N	\N	244
6138	4	8886467523496	0	Admin	2023-10-24	\N	\N	245
6139	4	8886467523625	0	Admin	2023-10-24	\N	\N	246
6140	4	8886467523632	0	Admin	2023-10-24	\N	\N	247
6141	4	8886467523649	0	Admin	2023-10-24	\N	\N	248
6142	4	8886467523823	0	Admin	2023-10-24	\N	\N	992
6143	4	8886467523830	0	Admin	2023-10-24	\N	\N	993
6144	4	8886467523847	0	Admin	2023-10-24	\N	\N	994
6145	4	8886467525018	0	Admin	2023-10-24	\N	\N	249
6146	4	8886467525049	0	Admin	2023-10-24	\N	\N	250
6147	4	8886467525117	0	Admin	2023-10-24	\N	\N	251
6148	4	8886467525124	0	Admin	2023-10-24	\N	\N	252
6149	4	8886467525322	0	Admin	2023-10-24	\N	\N	253
6150	4	8886467525339	0	Admin	2023-10-24	\N	\N	254
6151	4	8886467525346	0	Admin	2023-10-24	\N	\N	255
6152	4	8886467525353	0	Admin	2023-10-24	\N	\N	256
6153	4	8886467525711	0	Admin	2023-10-24	\N	\N	257
6154	4	8886467525735	0	Admin	2023-10-24	\N	\N	258
6155	4	8886467525742	0	Admin	2023-10-24	\N	\N	259
6156	4	8886467525759	0	Admin	2023-10-24	\N	\N	260
6157	4	8886467529719	0	Admin	2023-10-24	\N	\N	261
6158	4	8886467529726	0	Admin	2023-10-24	\N	\N	262
6159	4	8886467529733	0	Admin	2023-10-24	\N	\N	263
6160	4	8886467529740	0	Admin	2023-10-24	\N	\N	264
6161	4	8886467530067	0	Admin	2023-10-24	\N	\N	265
6162	4	8886467530128	0	Admin	2023-10-24	\N	\N	266
6163	4	8886467530135	0	Admin	2023-10-24	\N	\N	267
6164	4	8886467530142	0	Admin	2023-10-24	\N	\N	268
6165	4	8886467530159	0	Admin	2023-10-24	\N	\N	269
6166	4	8886467530302	0	Admin	2023-10-24	\N	\N	270
6167	4	8886467530319	0	Admin	2023-10-24	\N	\N	271
6168	4	8886467530326	0	Admin	2023-10-24	\N	\N	272
6169	4	8886467530333	0	Admin	2023-10-24	\N	\N	273
6170	4	8886467530340	0	Admin	2023-10-24	\N	\N	274
6171	4	8886467530364	0	Admin	2023-10-24	\N	\N	275
6172	4	8886467530371	0	Admin	2023-10-24	\N	\N	276
6173	4	8886467530388	0	Admin	2023-10-24	\N	\N	277
6174	4	8886467530500	0	Admin	2023-10-24	\N	\N	278
6175	4	8886467531019	0	Admin	2023-10-24	\N	\N	279
6176	4	8886467531026	0	Admin	2023-10-24	\N	\N	280
6177	4	8886467531033	0	Admin	2023-10-24	\N	\N	281
6178	4	8886467531040	0	Admin	2023-10-24	\N	\N	282
6179	4	8886467532115	0	Admin	2023-10-24	\N	\N	283
6180	4	8886467532122	0	Admin	2023-10-24	\N	\N	906
6181	4	8886467532139	0	Admin	2023-10-24	\N	\N	284
6182	4	8886467532160	0	Admin	2023-10-24	\N	\N	285
6183	4	8886467532177	0	Admin	2023-10-24	\N	\N	286
6184	4	8886467532214	0	Admin	2023-10-24	\N	\N	287
6185	4	8886467532221	0	Admin	2023-10-24	\N	\N	288
6186	4	8886467532238	0	Admin	2023-10-24	\N	\N	289
6187	4	8886467532269	0	Admin	2023-10-24	\N	\N	290
6188	4	8886467532276	0	Admin	2023-10-24	\N	\N	291
6189	4	8886467532313	0	Admin	2023-10-24	\N	\N	292
6190	4	8886467532320	0	Admin	2023-10-24	\N	\N	293
6191	4	8886467532337	0	Admin	2023-10-24	\N	\N	294
6192	4	8886467532368	0	Admin	2023-10-24	\N	\N	295
6193	4	8886467532375	0	Admin	2023-10-24	\N	\N	296
6194	4	8886467532412	0	Admin	2023-10-24	\N	\N	297
6195	4	8886467532429	0	Admin	2023-10-24	\N	\N	298
6196	4	8886467532436	0	Admin	2023-10-24	\N	\N	299
6197	4	8886467532450	0	Admin	2023-10-24	\N	\N	300
6198	4	8886467532467	0	Admin	2023-10-24	\N	\N	301
6199	4	8886467532474	0	Admin	2023-10-24	\N	\N	302
6200	4	8886467532511	0	Admin	2023-10-24	\N	\N	303
6201	4	8886467532528	0	Admin	2023-10-24	\N	\N	304
6202	4	8886467532535	0	Admin	2023-10-24	\N	\N	305
6203	4	8886467532559	0	Admin	2023-10-24	\N	\N	306
6204	4	8886467532566	0	Admin	2023-10-24	\N	\N	307
6205	4	8886467532573	0	Admin	2023-10-24	\N	\N	308
6206	4	8886467532634	0	Admin	2023-10-24	\N	\N	309
6207	4	8886467535222	0	Admin	2023-10-24	\N	\N	310
6208	4	8886467535239	0	Admin	2023-10-24	\N	\N	311
6209	4	8886467535246	0	Admin	2023-10-24	\N	\N	312
6210	4	8886467535321	0	Admin	2023-10-24	\N	\N	313
6211	4	8886467535413	0	Admin	2023-10-24	\N	\N	314
6212	4	8886467535420	0	Admin	2023-10-24	\N	\N	315
6213	4	8886467535437	0	Admin	2023-10-24	\N	\N	316
6214	4	8886467535536	0	Admin	2023-10-24	\N	\N	317
6215	4	8886467535543	0	Admin	2023-10-24	\N	\N	318
6216	4	8886467535611	0	Admin	2023-10-24	\N	\N	319
6217	4	8886467535628	0	Admin	2023-10-24	\N	\N	320
6218	4	8886467535635	0	Admin	2023-10-24	\N	\N	321
6219	4	8886467535642	0	Admin	2023-10-24	\N	\N	322
6220	4	8886467541018	0	Admin	2023-10-24	\N	\N	323
6221	4	8886467541025	0	Admin	2023-10-24	\N	\N	324
6222	4	8886467541032	0	Admin	2023-10-24	\N	\N	325
6223	4	8886467541117	0	Admin	2023-10-24	\N	\N	935
6224	4	8886467541124	0	Admin	2023-10-24	\N	\N	326
6225	4	8886467541131	0	Admin	2023-10-24	\N	\N	1156
6226	4	8886467541148	0	Admin	2023-10-24	\N	\N	327
6227	4	8886467544712	0	Admin	2023-10-24	\N	\N	328
6228	4	8886467545030	0	Admin	2023-10-24	\N	\N	329
6229	4	8886467545047	0	Admin	2023-10-24	\N	\N	330
6230	4	8886467545054	0	Admin	2023-10-24	\N	\N	331
6231	4	8886467545061	0	Admin	2023-10-24	\N	\N	332
6232	4	8886467545078	0	Admin	2023-10-24	\N	\N	333
6233	4	8886467545085	0	Admin	2023-10-24	\N	\N	334
6234	4	8886467545399	0	Admin	2023-10-24	\N	\N	335
6235	4	8886467545412	0	Admin	2023-10-24	\N	\N	1140
6236	4	8886467545467	0	Admin	2023-10-24	\N	\N	336
6237	4	8886467545542	0	Admin	2023-10-24	\N	\N	995
6238	4	8886467545702	0	Admin	2023-10-24	\N	\N	337
6239	4	8886467545719	0	Admin	2023-10-24	\N	\N	338
6240	4	8886467545726	0	Admin	2023-10-24	\N	\N	339
6241	4	8886467546013	0	Admin	2023-10-24	\N	\N	340
6242	4	8886467546037	0	Admin	2023-10-24	\N	\N	341
6243	4	8886467546044	0	Admin	2023-10-24	\N	\N	342
6244	4	8886467546198	0	Admin	2023-10-24	\N	\N	343
6245	4	8886467546211	0	Admin	2023-10-24	\N	\N	344
6246	4	8886467546327	0	Admin	2023-10-24	\N	\N	162
6247	4	8886467546334	0	Admin	2023-10-24	\N	\N	345
6248	4	8886467546341	0	Admin	2023-10-24	\N	\N	163
6249	4	8886467546617	0	Admin	2023-10-24	\N	\N	346
6250	4	8886467546648	0	Admin	2023-10-24	\N	\N	996
6251	4	8886467546655	0	Admin	2023-10-24	\N	\N	974
6252	4	8886467546662	0	Admin	2023-10-24	\N	\N	973
6253	4	8886467546969	0	Admin	2023-10-24	\N	\N	975
6254	4	8886467547546	0	Admin	2023-10-24	\N	\N	347
6255	4	8886467548512	0	Admin	2023-10-24	\N	\N	348
6256	4	8886467548536	0	Admin	2023-10-24	\N	\N	349
6257	4	8886467548710	0	Admin	2023-10-24	\N	\N	350
6258	4	8886467548772	0	Admin	2023-10-24	\N	\N	351
6259	4	8886467548789	0	Admin	2023-10-24	\N	\N	352
6260	4	8886467548796	0	Admin	2023-10-24	\N	\N	353
6261	4	8886467548826	0	Admin	2023-10-24	\N	\N	354
6262	4	8886467548840	0	Admin	2023-10-24	\N	\N	355
6263	4	8886467548864	0	Admin	2023-10-24	\N	\N	356
6264	4	8886467548888	0	Admin	2023-10-24	\N	\N	357
6265	4	8886467548925	0	Admin	2023-10-24	\N	\N	358
6266	4	8886467548932	0	Admin	2023-10-24	\N	\N	359
6267	4	8886467548949	0	Admin	2023-10-24	\N	\N	360
6268	4	8886467580000	0	Admin	2023-10-24	\N	\N	361
6269	4	8886467580017	0	Admin	2023-10-24	\N	\N	362
6270	4	8886467580024	0	Admin	2023-10-24	\N	\N	363
6271	4	8886467580062	0	Admin	2023-10-24	\N	\N	364
6272	4	8886467580079	0	Admin	2023-10-24	\N	\N	365
6273	4	8886467580086	0	Admin	2023-10-24	\N	\N	366
6274	4	8886467580093	0	Admin	2023-10-24	\N	\N	367
6275	4	8886467580109	0	Admin	2023-10-24	\N	\N	368
6276	4	8886467580116	0	Admin	2023-10-24	\N	\N	369
6277	4	8886467580147	0	Admin	2023-10-24	\N	\N	370
6278	4	8886467580161	0	Admin	2023-10-24	\N	\N	371
6279	4	8886467580178	0	Admin	2023-10-24	\N	\N	372
6280	4	8886467580185	0	Admin	2023-10-24	\N	\N	373
6281	4	8886467580208	0	Admin	2023-10-24	\N	\N	374
6282	4	8886467580215	0	Admin	2023-10-24	\N	\N	375
6283	4	8886467580222	0	Admin	2023-10-24	\N	\N	376
6284	4	8886467580413	0	Admin	2023-10-24	\N	\N	377
6285	4	8886467581465	0	Admin	2023-10-24	\N	\N	972
6286	4	8886467582059	0	Admin	2023-10-24	\N	\N	378
6287	4	8886467584954	0	Admin	2023-10-24	\N	\N	379
6288	4	8886467584961	0	Admin	2023-10-24	\N	\N	380
6289	4	8886467585814	0	Admin	2023-10-24	\N	\N	381
6290	4	8886467585913	0	Admin	2023-10-24	\N	\N	382
6291	4	8886467586347	0	Admin	2023-10-24	\N	\N	383
6292	4	8886467589010	0	Admin	2023-10-24	\N	\N	384
6293	4	8886467589317	0	Admin	2023-10-24	\N	\N	385
6294	4	8886467589478	0	Admin	2023-10-24	\N	\N	386
6295	4	8886467589485	0	Admin	2023-10-24	\N	\N	387
6296	4	8900950297173	0	Admin	2023-10-24	\N	\N	1304
6297	4	8900950297180	0	Admin	2023-10-24	\N	\N	1303
6298	4	8901138501242	0	Admin	2023-10-24	\N	\N	723
6299	4	8901138501297	0	Admin	2023-10-24	\N	\N	724
6300	4	8901138511333	0	Admin	2023-10-24	\N	\N	721
6301	4	8901138511340	0	Admin	2023-10-24	\N	\N	722
6302	4	90	0	Admin	2023-10-24	\N	\N	945
6303	4	9003579000519	0	Admin	2023-10-24	\N	\N	392
6304	4	9003579000748	0	Admin	2023-10-24	\N	\N	419
6305	4	9003579001172	0	Admin	2023-10-24	\N	\N	1083
6306	4	9003579013557	0	Admin	2023-10-24	\N	\N	1099
6307	4	9003579018514	0	Admin	2023-10-24	\N	\N	1097
6308	4	9003579018866	0	Admin	2023-10-24	\N	\N	1177
6309	4	9003579018941	0	Admin	2023-10-24	\N	\N	1176
6310	4	9003579307717	0	Admin	2023-10-24	\N	\N	423
6311	4	9003579308936	0	Admin	2023-10-24	\N	\N	1090
6312	4	9003579308943	0	Admin	2023-10-24	\N	\N	424
6313	4	9003579309445	0	Admin	2023-10-24	\N	\N	429
6314	4	9003579309469	0	Admin	2023-10-24	\N	\N	400
6315	4	9003579310632	0	Admin	2023-10-24	\N	\N	404
6316	4	9003579311004	0	Admin	2023-10-24	\N	\N	444
6317	4	9003579311462	0	Admin	2023-10-24	\N	\N	422
6318	4	9003579311851	0	Admin	2023-10-24	\N	\N	435
6319	4	91009	0	Admin	2023-10-24	\N	\N	1488
6320	4	91012	0	Admin	2023-10-24	\N	\N	1490
6321	4	91013	0	Admin	2023-10-24	\N	\N	1491
6322	4	91015	0	Admin	2023-10-24	\N	\N	1489
6323	4	911emergencia	0	Admin	2023-10-24	\N	\N	1343
6324	4	9333527021861	0	Admin	2023-10-24	\N	\N	1481
6325	4	9333527230447	0	Admin	2023-10-24	\N	\N	1093
6326	4	9333527329240	0	Admin	2023-10-24	\N	\N	1085
6327	4	9333527329257	0	Admin	2023-10-24	\N	\N	1094
6328	4	9333527341037	0	Admin	2023-10-24	\N	\N	1107
6329	4	9333527377852	0	Admin	2023-10-24	\N	\N	1084
6330	4	9333527426642	0	Admin	2023-10-24	\N	\N	1092
6331	4	9333527443670	0	Admin	2023-10-24	\N	\N	1089
6332	4	9333527586469	0	Admin	2023-10-24	\N	\N	1095
6333	4	9505903	0	Admin	2023-10-24	\N	\N	1268
6334	4	9505904	0	Admin	2023-10-24	\N	\N	1266
6335	4	9505905	0	Admin	2023-10-24	\N	\N	1265
6336	4	99-26191	0	Admin	2023-10-24	\N	\N	1244
6337	4	A1014	0	Admin	2023-10-24	\N	\N	625
6338	4	AB01S	0	Admin	2023-10-24	\N	\N	1296
6339	4	AB02M	0	Admin	2023-10-24	\N	\N	1297
6340	4	AB03L	0	Admin	2023-10-24	\N	\N	1298
6341	4	AC01	0	Admin	2023-10-24	\N	\N	1192
6342	4	AC01S	0	Admin	2023-10-24	\N	\N	1320
6343	4	AC02M	0	Admin	2023-10-24	\N	\N	1230
6344	4	AF001S	0	Admin	2023-10-24	\N	\N	1603
6345	4	ALP001	0	Admin	2023-10-24	\N	\N	741
6346	4	AMOXITABS250	0	Admin	2023-10-24	\N	\N	1513
6347	4	ANXIVET	0	Admin	2023-10-24	\N	\N	1170
6348	4	ARTROVET	0	Admin	2023-10-24	\N	\N	1168
6349	4	Atropina01	0	Admin	2023-10-24	\N	\N	516
6350	4	AUMENTA	0	Admin	2023-10-24	\N	\N	1558
6351	4	BAEP00	0	Admin	2023-10-24	\N	\N	558
6352	4	BAN0	0	Admin	2023-10-24	\N	\N	559
6353	4	BC1050032021	0	Admin	2023-10-24	\N	\N	628
6354	4	BCTH2101C	0	Admin	2023-10-24	\N	\N	1606
6355	4	BHL001	0	Admin	2023-10-24	\N	\N	1421
6356	4	BHM001	0	Admin	2023-10-24	\N	\N	1422
6357	4	BHS001	0	Admin	2023-10-24	\N	\N	1423
6358	4	BHXS001	0	Admin	2023-10-24	\N	\N	1424
6359	4	BL01-S	0	Admin	2023-10-24	\N	\N	1346
6360	4	BL-02	0	Admin	2023-10-24	\N	\N	1182
6361	4	BL02-M	0	Admin	2023-10-24	\N	\N	1347
6362	4	BL03-L	0	Admin	2023-10-24	\N	\N	1348
6363	4	BL04-XL	0	Admin	2023-10-24	\N	\N	1349
6364	4	BOSAL#0	0	Admin	2023-10-24	\N	\N	1232
6365	4	BROADLINE	0	Admin	2023-10-24	\N	\N	777
6366	4	BVL001	0	Admin	2023-10-24	\N	\N	1425
6367	4	BVM001	0	Admin	2023-10-24	\N	\N	1426
6368	4	BVS001	0	Admin	2023-10-24	\N	\N	1427
6369	4	C20-M	0	Admin	2023-10-24	\N	\N	602
6370	4	C20-S	0	Admin	2023-10-24	\N	\N	601
6371	4	C20-XL	0	Admin	2023-10-24	\N	\N	603
6372	4	C21-L	0	Admin	2023-10-24	\N	\N	606
6373	4	C21-M	0	Admin	2023-10-24	\N	\N	605
6374	4	C21-S	0	Admin	2023-10-24	\N	\N	604
6375	4	C21-XL	0	Admin	2023-10-24	\N	\N	607
6376	4	C22-1	0	Admin	2023-10-24	\N	\N	1248
6377	4	C22-2	0	Admin	2023-10-24	\N	\N	1249
6378	4	C22-3	0	Admin	2023-10-24	\N	\N	1250
6379	4	CAM2030	0	Admin	2023-10-24	\N	\N	568
6380	4	CAM2435	0	Admin	2023-10-24	\N	\N	570
6381	4	CAM2840	0	Admin	2023-10-24	\N	\N	572
6382	4	cardiovet	0	Admin	2023-10-24	\N	\N	1171
6383	4	CARPRODYL100	0	Admin	2023-10-24	\N	\N	1515
6384	4	CARPRODYL25	0	Admin	2023-10-24	\N	\N	1506
6385	4	CD02M	0	Admin	2023-10-24	\N	\N	1308
6386	4	CD03L	0	Admin	2023-10-24	\N	\N	1309
6387	4	CefaCure	0	Admin	2023-10-24	\N	\N	659
6388	4	CIPROTABS250	0	Admin	2023-10-24	\N	\N	1507
6389	4	CORTA3807	0	Admin	2023-10-24	\N	\N	1227
6390	4	DE013-M	0	Admin	2023-10-24	\N	\N	595
6391	4	doramectina	0	Admin	2023-10-24	\N	\N	1174
6392	4	Dufamox15	0	Admin	2023-10-24	\N	\N	524
6393	4	FARM044	0	Admin	2023-10-24	\N	\N	1079
6394	4	FARM046	0	Admin	2023-10-24	\N	\N	1080
6395	4	FARM141	0	Admin	2023-10-24	\N	\N	1081
6396	4	FC088	0	Admin	2023-10-24	\N	\N	1197
6397	4	FG01-S	0	Admin	2023-10-24	\N	\N	1350
6398	4	FG02-M	0	Admin	2023-10-24	\N	\N	1351
6399	4	FG03-L	0	Admin	2023-10-24	\N	\N	1352
6400	4	FG04XL	0	Admin	2023-10-24	\N	\N	1353
6401	4	FGEZ1002	0	Admin	2023-10-24	\N	\N	1608
6402	4	G003	0	Admin	2023-10-24	\N	\N	1605
6403	4	G0M3101S	0	Admin	2023-10-24	\N	\N	1600
6404	4	G0M3102M	0	Admin	2023-10-24	\N	\N	1609
6405	4	gentamicina	0	Admin	2023-10-24	\N	\N	1175
6406	4	H2-S	0	Admin	2023-10-24	\N	\N	608
6407	4	H3-L	0	Admin	2023-10-24	\N	\N	611
6408	4	H3-M	0	Admin	2023-10-24	\N	\N	610
6409	4	H3-S	0	Admin	2023-10-24	\N	\N	609
6410	4	H3-XL	0	Admin	2023-10-24	\N	\N	612
6411	4	H4-L	0	Admin	2023-10-24	\N	\N	614
6412	4	H4-M	0	Admin	2023-10-24	\N	\N	613
6413	4	H4-XL	0	Admin	2023-10-24	\N	\N	615
6414	4	HEARTGARDL	0	Admin	2023-10-24	\N	\N	788
6415	4	HEARTGARDM	0	Admin	2023-10-24	\N	\N	787
6416	4	HEARTGARDS	0	Admin	2023-10-24	\N	\N	786
6417	4	HEMOVITB12	0	Admin	2023-10-24	\N	\N	729
6418	4	HEPATOVET	0	Admin	2023-10-24	\N	\N	1172
6419	4	HI01S	0	Admin	2023-10-24	\N	\N	1324
6420	4	HI02M	0	Admin	2023-10-24	\N	\N	1325
6421	4	HI03L	0	Admin	2023-10-24	\N	\N	1326
6422	4	HTB031-2	0	Admin	2023-10-24	\N	\N	586
6423	4	HTGC019	0	Admin	2023-10-24	\N	\N	557
6424	4	ij-02	0	Admin	2023-10-24	\N	\N	1181
6425	4	IJ03	0	Admin	2023-10-24	\N	\N	1241
6426	4	IP001ML	0	Admin	2023-10-24	\N	\N	546
6427	4	JD01	0	Admin	2023-10-24	\N	\N	1604
6428	4	JD02	0	Admin	2023-10-24	\N	\N	1597
6429	4	JHP951	0	Admin	2023-10-24	\N	\N	1277
6430	4	JK901L	0	Admin	2023-10-24	\N	\N	1369
6431	4	JK901M	0	Admin	2023-10-24	\N	\N	1370
6432	4	JK901S	0	Admin	2023-10-24	\N	\N	1371
6433	4	K002	0	Admin	2023-10-24	\N	\N	1235
6434	4	K9-L	0	Admin	2023-10-24	\N	\N	1240
6435	4	KD01	0	Admin	2023-10-24	\N	\N	1190
6436	4	KETOVET	0	Admin	2023-10-24	\N	\N	847
6437	4	KL01XS	0	Admin	2023-10-24	\N	\N	1310
6438	4	KL02S	0	Admin	2023-10-24	\N	\N	1311
6439	4	KL03M	0	Admin	2023-10-24	\N	\N	1312
6440	4	KL04L	0	Admin	2023-10-24	\N	\N	1313
6441	4	KL05XL	0	Admin	2023-10-24	\N	\N	1314
6442	4	KM0110MM	0	Admin	2023-10-24	\N	\N	1302
6443	4	KM0212MM	0	Admin	2023-10-24	\N	\N	1299
6444	4	KN0110MM	0	Admin	2023-10-24	\N	\N	1342
6445	4	KN0212MM	0	Admin	2023-10-24	\N	\N	1340
6446	4	KN0315MM	0	Admin	2023-10-24	\N	\N	1341
6447	4	KP01S	0	Admin	2023-10-24	\N	\N	1191
6448	4	KR01	0	Admin	2023-10-24	\N	\N	1195
6449	4	kS15MM	0	Admin	2023-10-24	\N	\N	1239
6450	4	KT01XXS	0	Admin	2023-10-24	\N	\N	1362
6451	4	KT02XS	0	Admin	2023-10-24	\N	\N	1363
6452	4	KT03S	0	Admin	2023-10-24	\N	\N	1323
6453	4	KU01XXS	0	Admin	2023-10-24	\N	\N	1338
6454	4	KU02XS	0	Admin	2023-10-24	\N	\N	1337
6455	4	KV01XXS	0	Admin	2023-10-24	\N	\N	1231
6456	4	KV03S	0	Admin	2023-10-24	\N	\N	1339
6457	4	KW01XXS	0	Admin	2023-10-24	\N	\N	1336
6458	4	KW02XS	0	Admin	2023-10-24	\N	\N	1333
6459	4	KW03S	0	Admin	2023-10-24	\N	\N	1334
6460	4	KW04M	0	Admin	2023-10-24	\N	\N	1335
6461	4	L1003	0	Admin	2023-10-24	\N	\N	598
6462	4	LM-01	0	Admin	2023-10-24	\N	\N	1185
6463	4	LM-02	0	Admin	2023-10-24	\N	\N	1186
6464	4	LM-03	0	Admin	2023-10-24	\N	\N	1187
6465	4	LM-902-L	0	Admin	2023-10-24	\N	\N	1366
6466	4	LM902M	0	Admin	2023-10-24	\N	\N	1367
6467	4	LM902S	0	Admin	2023-10-24	\N	\N	1368
6468	4	M610	0	Admin	2023-10-24	\N	\N	597
6469	4	M9D228135	0	Admin	2023-10-24	\N	\N	1114
6470	4	M9D22826	0	Admin	2023-10-24	\N	\N	1113
6471	4	M9D22838-L	0	Admin	2023-10-24	\N	\N	1110
6472	4	M9D22838-M	0	Admin	2023-10-24	\N	\N	1109
6473	4	M9D22838-S	0	Admin	2023-10-24	\N	\N	1108
6474	4	M9D22838-XL	0	Admin	2023-10-24	\N	\N	1111
6475	4	M9D22868	0	Admin	2023-10-24	\N	\N	1112
6476	4	Metronidazole	0	Admin	2023-10-24	\N	\N	861
6477	4	MN03	0	Admin	2023-10-24	\N	\N	1193
6478	4	MN05-XL	0	Admin	2023-10-24	\N	\N	1225
6479	4	MP1831	0	Admin	2023-10-24	\N	\N	1486
6480	4	MP1855	0	Admin	2023-10-24	\N	\N	1487
6481	4	MU01	0	Admin	2023-10-24	\N	\N	1229
6482	4	MU01S	0	Admin	2023-10-24	\N	\N	1364
6483	4	MU02	0	Admin	2023-10-24	\N	\N	1228
6484	4	MU02M	0	Admin	2023-10-24	\N	\N	1365
6485	4	N026I21	0	Admin	2023-10-24	\N	\N	1433
6486	4	NO02-S	0	Admin	2023-10-24	\N	\N	1359
6487	4	NO03-M	0	Admin	2023-10-24	\N	\N	1360
6488	4	NO04-L	0	Admin	2023-10-24	\N	\N	1361
6489	4	no05xl	0	Admin	2023-10-24	\N	\N	1287
6490	4	OMPASTA-01	0	Admin	2023-10-24	\N	\N	504
6491	4	OP01S	0	Admin	2023-10-24	\N	\N	1331
6492	4	OP02M	0	Admin	2023-10-24	\N	\N	1332
6493	4	OPTIVET	0	Admin	2023-10-24	\N	\N	1169
6494	4	OV115	0	Admin	2023-10-24	\N	\N	542
6495	4	P002L	0	Admin	2023-10-24	\N	\N	1636
6496	4	P1089	0	Admin	2023-10-24	\N	\N	1373
6497	4	P1118-PP-B7	0	Admin	2023-10-24	\N	\N	1196
6498	4	P518	0	Admin	2023-10-24	\N	\N	575
6499	4	P518-1	0	Admin	2023-10-24	\N	\N	574
6500	4	P519	0	Admin	2023-10-24	\N	\N	576
6501	4	P520	0	Admin	2023-10-24	\N	\N	577
6502	4	P521	0	Admin	2023-10-24	\N	\N	578
6503	4	P522	0	Admin	2023-10-24	\N	\N	579
6504	4	P523	0	Admin	2023-10-24	\N	\N	580
6505	4	P924	0	Admin	2023-10-24	\N	\N	554
6506	4	P935	0	Admin	2023-10-24	\N	\N	551
6507	4	PALETAS	0	Admin	2023-10-24	\N	\N	1640
6508	4	PEC001	0	Admin	2023-10-24	\N	\N	742
6509	4	PECH273	0	Admin	2023-10-24	\N	\N	1595
6510	4	PH2088	0	Admin	2023-10-24	\N	\N	1431
6511	4	PL01	0	Admin	2023-10-24	\N	\N	1601
6512	4	QR01	0	Admin	2023-10-24	\N	\N	1194
6513	4	QR01XS	0	Admin	2023-10-24	\N	\N	1321
6514	4	QR02	0	Admin	2023-10-24	\N	\N	1238
6515	4	QR02S	0	Admin	2023-10-24	\N	\N	1322
6516	4	quino-01	0	Admin	2023-10-24	\N	\N	456
6517	4	RANITIDINVET	0	Admin	2023-10-24	\N	\N	849
6518	4	RAR2002	0	Admin	2023-10-24	\N	\N	1607
6519	4	RS02	0	Admin	2023-10-24	\N	\N	1243
6520	4	RS02S	0	Admin	2023-10-24	\N	\N	1329
6521	4	RS03L	0	Admin	2023-10-24	\N	\N	1330
6522	4	RS03-L	0	Admin	2023-10-24	\N	\N	1226
6523	4	ST0101	0	Admin	2023-10-24	\N	\N	862
6524	4	ST01XS	0	Admin	2023-10-24	\N	\N	1315
6525	4	ST02S	0	Admin	2023-10-24	\N	\N	1316
6526	4	ST03M	0	Admin	2023-10-24	\N	\N	1317
6527	4	ST04L	0	Admin	2023-10-24	\N	\N	1318
6528	4	ST05XL	0	Admin	2023-10-24	\N	\N	1319
6529	4	stickerzone01	0	Admin	2023-10-24	\N	\N	860
6530	4	STOMORGYL10	0	Admin	2023-10-24	\N	\N	789
6531	4	SU01	0	Admin	2023-10-24	\N	\N	1233
6532	4	SU02	0	Admin	2023-10-24	\N	\N	1189
6533	4	sy-b024	0	Admin	2023-10-24	\N	\N	1384
6534	4	TORT001	0	Admin	2023-10-24	\N	\N	743
6535	4	TU01	0	Admin	2023-10-24	\N	\N	1188
6536	4	TU02	0	Admin	2023-10-24	\N	\N	1236
6537	4	TU03	0	Admin	2023-10-24	\N	\N	1237
6538	4	TU04	0	Admin	2023-10-24	\N	\N	1234
6539	4	UNGÜENTO	0	Admin	2023-10-24	\N	\N	1548
6540	4	URIVET	0	Admin	2023-10-24	\N	\N	1167
6541	4	UT01XS	0	Admin	2023-10-24	\N	\N	1328
6542	4	UT02S	0	Admin	2023-10-24	\N	\N	1327
6543	4	UT03M	0	Admin	2023-10-24	\N	\N	1289
6544	4	UT04L	0	Admin	2023-10-24	\N	\N	1290
6545	4	UT05XL	0	Admin	2023-10-24	\N	\N	1291
6546	4	UV01S	0	Admin	2023-10-24	\N	\N	1305
6547	4	UV02M	0	Admin	2023-10-24	\N	\N	1306
6548	4	UV03L	0	Admin	2023-10-24	\N	\N	1307
6549	4	UY0110MM	0	Admin	2023-10-24	\N	\N	1300
6550	4	UY0212MM	0	Admin	2023-10-24	\N	\N	1301
6551	4	VDECA0008	0	Admin	2023-10-24	\N	\N	900
6552	4	VDECA0009	0	Admin	2023-10-24	\N	\N	901
6553	4	VDECA007	0	Admin	2023-10-24	\N	\N	899
6554	4	VDEFE0001	0	Admin	2023-10-24	\N	\N	898
6555	4	VE2022115917	0	Admin	2023-10-24	\N	\N	1625
6556	4	VHL001	0	Admin	2023-10-24	\N	\N	1416
6557	4	VHM001	0	Admin	2023-10-24	\N	\N	1415
6558	4	VHS001	0	Admin	2023-10-24	\N	\N	1417
6559	4	VHTL001	0	Admin	2023-10-24	\N	\N	1418
6560	4	VHTM001	0	Admin	2023-10-24	\N	\N	1420
6561	4	VHTS001	0	Admin	2023-10-24	\N	\N	1419
6562	4	VT-01	0	Admin	2023-10-24	\N	\N	1184
6563	4	VT-02	0	Admin	2023-10-24	\N	\N	1183
6564	4	VVL001	0	Admin	2023-10-24	\N	\N	1412
6565	4	VVM001	0	Admin	2023-10-24	\N	\N	1413
6566	4	VVS001	0	Admin	2023-10-24	\N	\N	1414
6567	4	W4UNID	0	Admin	2023-10-24	\N	\N	627
6568	4	WV04L	0	Admin	2023-10-24	\N	\N	1288
6569	4	X001	0	Admin	2023-10-24	\N	\N	731
6570	4	X002	0	Admin	2023-10-24	\N	\N	730
6571	4	XW01S	0	Admin	2023-10-24	\N	\N	1292
6572	4	XW02M	0	Admin	2023-10-24	\N	\N	1293
6573	4	XW03L	0	Admin	2023-10-24	\N	\N	1294
6574	4	XW04XL	0	Admin	2023-10-24	\N	\N	1295
6575	4	ZY01S	0	Admin	2023-10-24	\N	\N	1355
6576	4	ZY02M	0	Admin	2023-10-24	\N	\N	1356
6577	4	ZY02-M	0	Admin	2023-10-24	\N	\N	1242
6578	4	ZY03L	0	Admin	2023-10-24	\N	\N	1357
6579	4	ZY04XL	0	Admin	2023-10-24	\N	\N	1358
\.


--
-- Data for Name: razas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.razas (id, nombre_raza, nombre_especie, usuario_crea, fecha_creacion, sucursal_crea) FROM stdin;
\.


--
-- Data for Name: recetas; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.recetas (id, historial_id, medicamento, dosis) FROM stdin;
\.


--
-- Data for Name: solicitudcontrasenia; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.solicitudcontrasenia (id, nombreusuario, correousuario, rolusuario, ipsolicitud, fecha_solicitud, iniciales, procesadosn, passwd, confpasswd) FROM stdin;
\.


--
-- Data for Name: subcategorias; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.subcategorias (sub_id, sub_nombre, categoria_id, creada_por, fecha_creacion, activosn) FROM stdin;
\.


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: adolfo
--

COPY public.sucursales (id, sucursal_nombre, sucursal_direccion, sucursal_tel, sucursal_cel, creada_por, fecha_creacion, fecha_modificacion, modificado_por) FROM stdin;
1	TUVET MERLIOT	Calle Chiltiupan y Av. El Balsamar, Polígono R. Frente a Wendys Chiltiupan. Ciudad Merliot	2536-4049	7618-9088	Admin	2023-10-25	\N	\N
2	TUVET SANTA ELENA	Urbanización Cumbres de Madreselva III, Calle Cortez Blanco #26, Santa Elena	2536-4052	6998-1432	Admin	2023-10-25	\N	\N
3	TUVET VENECIA	CENTRO COMERCIAL PASEO VENECIA, KM 21 DE LA CARRETERA DE ORO, LOCAL #70 MODULO E	2536-4061	7475 7260	Admin	2023-10-25	\N	\N
4	TUVET MEDICA	21 calle Poniente #1325 Colonia Médica primer nivel local 1 módulo C, plaza arco	25364062	00000000	Admin	2023-10-25	\N	\N
\.


--
-- Name: administradores_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.administradores_admin_id_seq', 1, true);


--
-- Name: analisis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.analisis_id_seq', 1, false);


--
-- Name: analisis_mascota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.analisis_mascota_id_seq', 1, false);


--
-- Name: atencioncliente_atn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.atencioncliente_atn_id_seq', 1, false);


--
-- Name: categorias_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.categorias_cat_id_seq', 1, false);


--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.clientes_cliente_id_seq', 1, true);


--
-- Name: componentes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.componentes_id_seq', 1, false);


--
-- Name: comprasdetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.comprasdetalle_id_seq', 1, false);


--
-- Name: comprasproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.comprasproductos_id_seq', 1, false);


--
-- Name: contador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.contador_id_seq', 1, false);


--
-- Name: dfacturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.dfacturas_id_seq', 4, true);


--
-- Name: dtraslados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.dtraslados_id_seq', 1, false);


--
-- Name: errores_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.errores_error_id_seq', 1, false);


--
-- Name: existencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.existencias_id_seq', 1, false);


--
-- Name: extractosclientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.extractosclientes_id_seq', 1, false);


--
-- Name: extractosproveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.extractosproveedores_id_seq', 1, false);


--
-- Name: gerentes_gerente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.gerentes_gerente_id_seq', 1, false);


--
-- Name: hfacturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.hfacturas_id_seq', 2, true);


--
-- Name: historial_mascotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.historial_mascotas_id_seq', 1, false);


--
-- Name: htraslado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.htraslado_id_seq', 1, false);


--
-- Name: impuestos_imp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.impuestos_imp_id_seq', 1, true);


--
-- Name: ippermitidas_ip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.ippermitidas_ip_id_seq', 1, true);


--
-- Name: kardex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.kardex_id_seq', 1, false);


--
-- Name: marcas_marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.marcas_marca_id_seq', 1, false);


--
-- Name: mascotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.mascotas_id_seq', 1, false);


--
-- Name: mvz_mvz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.mvz_mvz_id_seq', 1, false);


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.paises_id_seq', 1, false);


--
-- Name: productos_prod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.productos_prod_id_seq', 1, false);


--
-- Name: proveedores_prov_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.proveedores_prov_id_seq', 1, false);


--
-- Name: puntosdereorden_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.puntosdereorden_id_seq', 1, false);


--
-- Name: razas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.razas_id_seq', 1, false);


--
-- Name: recetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.recetas_id_seq', 1, false);


--
-- Name: solicitudcontrasenia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.solicitudcontrasenia_id_seq', 1, false);


--
-- Name: subcategorias_sub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.subcategorias_sub_id_seq', 1, false);


--
-- Name: sucursales_sucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adolfo
--

SELECT pg_catalog.setval('public.sucursales_sucursal_id_seq', 4, true);


--
-- Name: administradores administradores_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (admin_id);


--
-- Name: analisis_mascota analisis_mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.analisis_mascota
    ADD CONSTRAINT analisis_mascota_pkey PRIMARY KEY (id);


--
-- Name: analisis analisis_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.analisis
    ADD CONSTRAINT analisis_pkey PRIMARY KEY (id);


--
-- Name: atencioncliente atencioncliente_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.atencioncliente
    ADD CONSTRAINT atencioncliente_pkey PRIMARY KEY (atn_id);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: componentes componentes_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.componentes
    ADD CONSTRAINT componentes_pkey PRIMARY KEY (id);


--
-- Name: comprasdetalle comprasdetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasdetalle
    ADD CONSTRAINT comprasdetalle_pkey PRIMARY KEY (id);


--
-- Name: comprasproductos comprasproductos_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasproductos
    ADD CONSTRAINT comprasproductos_pkey PRIMARY KEY (id);


--
-- Name: contador contador_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.contador
    ADD CONSTRAINT contador_pkey PRIMARY KEY (id);


--
-- Name: dfacturas dfacturas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dfacturas
    ADD CONSTRAINT dfacturas_pkey PRIMARY KEY (id);


--
-- Name: dtraslados dtraslados_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dtraslados
    ADD CONSTRAINT dtraslados_pkey PRIMARY KEY (id);


--
-- Name: errores errores_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.errores
    ADD CONSTRAINT errores_pkey PRIMARY KEY (error_id);


--
-- Name: existencias existencias_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT existencias_pkey PRIMARY KEY (id);


--
-- Name: extractosclientes extractosclientes_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.extractosclientes
    ADD CONSTRAINT extractosclientes_pkey PRIMARY KEY (id);


--
-- Name: extractosproveedores extractosproveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.extractosproveedores
    ADD CONSTRAINT extractosproveedores_pkey PRIMARY KEY (id);


--
-- Name: gerentes gerentes_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.gerentes
    ADD CONSTRAINT gerentes_pkey PRIMARY KEY (gerente_id);


--
-- Name: hfacturas hfacturas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.hfacturas
    ADD CONSTRAINT hfacturas_pkey PRIMARY KEY (id);


--
-- Name: historial_mascotas historial_mascotas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.historial_mascotas
    ADD CONSTRAINT historial_mascotas_pkey PRIMARY KEY (id);


--
-- Name: htraslado htraslado_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.htraslado
    ADD CONSTRAINT htraslado_pkey PRIMARY KEY (id);


--
-- Name: impuestos impuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.impuestos
    ADD CONSTRAINT impuestos_pkey PRIMARY KEY (imp_id);


--
-- Name: ippermitidas ippermitidas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.ippermitidas
    ADD CONSTRAINT ippermitidas_pkey PRIMARY KEY (ip_id);


--
-- Name: kardex kardex_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT kardex_pkey PRIMARY KEY (id);


--
-- Name: marcas marca_repetida; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marca_repetida UNIQUE (marca_nombre);


--
-- Name: marcas marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- Name: mascotas mascotas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT mascotas_pkey PRIMARY KEY (id);


--
-- Name: mvz mvz_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mvz
    ADD CONSTRAINT mvz_pkey PRIMARY KEY (mvz_id);


--
-- Name: proveedores nit_repetido; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT nit_repetido UNIQUE (prov_nit);


--
-- Name: proveedores nombre_repetido; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT nombre_repetido UNIQUE (prov_nombre);


--
-- Name: proveedores nrc_repetido; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT nrc_repetido UNIQUE (prov_nrc);


--
-- Name: hfacturas numero_impreso; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.hfacturas
    ADD CONSTRAINT numero_impreso UNIQUE (numero_impreso);


--
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: puntosdereorden puntosdereorden_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.puntosdereorden
    ADD CONSTRAINT puntosdereorden_pkey PRIMARY KEY (id);


--
-- Name: razas razas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.razas
    ADD CONSTRAINT razas_pkey PRIMARY KEY (id);


--
-- Name: recetas recetas_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT recetas_pkey PRIMARY KEY (id);


--
-- Name: solicitudcontrasenia solicitudcontrasenia_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.solicitudcontrasenia
    ADD CONSTRAINT solicitudcontrasenia_pkey PRIMARY KEY (id);


--
-- Name: subcategorias subcategorias_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pkey PRIMARY KEY (sub_id);


--
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- Name: dfacturas uk_id_hfactura_cod_barra; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dfacturas
    ADD CONSTRAINT uk_id_hfactura_cod_barra UNIQUE (id_hfactura, cod_barra);


--
-- Name: categorias unico_cat_nombre; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT unico_cat_nombre UNIQUE (cat_nombre);


--
-- Name: productos unico_codigo_barra; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT unico_codigo_barra UNIQUE (prod_codbarra);


--
-- Name: clientes unique_nombre; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT unique_nombre UNIQUE (cliente_nombre);


--
-- Name: clientes uniquectm_const; Type: CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT uniquectm_const UNIQUE (cliente_nodoc);


--
-- Name: analisis_mascota fk_analisis; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.analisis_mascota
    ADD CONSTRAINT fk_analisis FOREIGN KEY (analisis_id) REFERENCES public.analisis(id);


--
-- Name: subcategorias fk_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- Name: hfacturas fk_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.hfacturas
    ADD CONSTRAINT fk_cliente_id FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- Name: extractosclientes fk_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.extractosclientes
    ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- Name: mascotas fk_clientes; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT fk_clientes FOREIGN KEY (propietario_id) REFERENCES public.clientes(id);


--
-- Name: kardex fk_cod_barra; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT fk_cod_barra FOREIGN KEY (codbarra) REFERENCES public.productos(prod_codbarra);


--
-- Name: puntosdereorden fk_codbarra_productos; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.puntosdereorden
    ADD CONSTRAINT fk_codbarra_productos FOREIGN KEY (codbarra) REFERENCES public.productos(prod_codbarra);


--
-- Name: dfacturas fk_codigo_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dfacturas
    ADD CONSTRAINT fk_codigo_id FOREIGN KEY (cod_barra) REFERENCES public.productos(prod_codbarra);


--
-- Name: comprasdetalle fk_compras_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasdetalle
    ADD CONSTRAINT fk_compras_id FOREIGN KEY (compra_id) REFERENCES public.comprasproductos(id);


--
-- Name: dfacturas fk_factura_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dfacturas
    ADD CONSTRAINT fk_factura_id FOREIGN KEY (id_hfactura) REFERENCES public.hfacturas(id);


--
-- Name: recetas fk_historial; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT fk_historial FOREIGN KEY (historial_id) REFERENCES public.historial_mascotas(id);


--
-- Name: analisis_mascota fk_historial; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.analisis_mascota
    ADD CONSTRAINT fk_historial FOREIGN KEY (historial_id) REFERENCES public.historial_mascotas(id);


--
-- Name: productos fk_id_categorias; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_id_categorias FOREIGN KEY (id_categorias) REFERENCES public.categorias(id);


--
-- Name: productos fk_id_marca; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_id_marca FOREIGN KEY (id_marca) REFERENCES public.marcas(id);


--
-- Name: marcas fk_id_proveedor2; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT fk_id_proveedor2 FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- Name: productos fk_id_subcategoria; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_id_subcategoria FOREIGN KEY (id_subcategoria) REFERENCES public.subcategorias(sub_id);


--
-- Name: historial_mascotas fk_mascota; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.historial_mascotas
    ADD CONSTRAINT fk_mascota FOREIGN KEY (mascota_id) REFERENCES public.mascotas(id);


--
-- Name: comprasdetalle fk_prod_codbarra; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasdetalle
    ADD CONSTRAINT fk_prod_codbarra FOREIGN KEY (producto_codbarra) REFERENCES public.productos(prod_codbarra);


--
-- Name: comprasproductos fk_proveedor_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.comprasproductos
    ADD CONSTRAINT fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- Name: extractosproveedores fk_proveedor_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.extractosproveedores
    ADD CONSTRAINT fk_proveedor_id FOREIGN KEY (prov_id) REFERENCES public.proveedores(id);


--
-- Name: mascotas fk_razas; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mascotas
    ADD CONSTRAINT fk_razas FOREIGN KEY (raza_id) REFERENCES public.razas(id);


--
-- Name: gerentes fk_sucursal_asignada; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.gerentes
    ADD CONSTRAINT fk_sucursal_asignada FOREIGN KEY (gtesucursal_asignada) REFERENCES public.sucursales(id);


--
-- Name: mvz fk_sucursal_asignada; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.mvz
    ADD CONSTRAINT fk_sucursal_asignada FOREIGN KEY (mvzsucursal_asignada) REFERENCES public.sucursales(id);


--
-- Name: atencioncliente fk_sucursal_asignada; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.atencioncliente
    ADD CONSTRAINT fk_sucursal_asignada FOREIGN KEY (atnsucursal_asignada) REFERENCES public.sucursales(id);


--
-- Name: ippermitidas fk_sucursal_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.ippermitidas
    ADD CONSTRAINT fk_sucursal_id FOREIGN KEY (id_sucursal) REFERENCES public.sucursales(id);


--
-- Name: kardex fk_sucursal_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.kardex
    ADD CONSTRAINT fk_sucursal_id FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- Name: hfacturas fk_sucursal_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.hfacturas
    ADD CONSTRAINT fk_sucursal_id FOREIGN KEY (id_sucursal) REFERENCES public.sucursales(id);


--
-- Name: dtraslados fk_traslado_id; Type: FK CONSTRAINT; Schema: public; Owner: adolfo
--

ALTER TABLE ONLY public.dtraslados
    ADD CONSTRAINT fk_traslado_id FOREIGN KEY (id_traslado) REFERENCES public.dtraslados(id);


--
-- PostgreSQL database dump complete
--

