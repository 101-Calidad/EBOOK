PGDMP     -    "                z         
   desarrollo    14.5    14.5     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24592 
   desarrollo    DATABASE     h   CREATE DATABASE desarrollo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE desarrollo;
                postgres    false            �            1255    40999    bytea_import(text)    FUNCTION     �   CREATE FUNCTION public.bytea_import(p_path text, OUT p_result bytea) RETURNS bytea
    LANGUAGE plpgsql
    AS $$
declare
  l_oid oid;
begin
  select lo_import(p_path) into l_oid;
  select lo_get(l_oid) INTO p_result;
  perform lo_unlink(l_oid);
end;$$;
 D   DROP FUNCTION public.bytea_import(p_path text, OUT p_result bytea);
       public          postgres    false            �            1259    24594 	   categoria    TABLE     i   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character varying(15)
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    24593    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public          postgres    false    210                       0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public          postgres    false    209            �            1259    41023    factura    TABLE     �   CREATE TABLE public.factura (
    idventa numeric(9,0) NOT NULL,
    usuario character varying(50),
    total numeric(9,3) NOT NULL
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    49221    libro    TABLE     '  CREATE TABLE public.libro (
    idlibro integer NOT NULL,
    titulo character varying(50),
    autor character varying(30),
    precio numeric(9,3) NOT NULL,
    idcategoria numeric NOT NULL,
    sintesis character varying(1000),
    imagen character varying(100),
    cantidad numeric(9,0)
);
    DROP TABLE public.libro;
       public         heap    postgres    false            �            1259    49220    libro_idlibro_seq    SEQUENCE     �   CREATE SEQUENCE public.libro_idlibro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.libro_idlibro_seq;
       public          postgres    false    215                       0    0    libro_idlibro_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.libro_idlibro_seq OWNED BY public.libro.idlibro;
          public          postgres    false    214            �            1259    41031    pedidos    TABLE     �   CREATE TABLE public.pedidos (
    idventa numeric(9,0) NOT NULL,
    usuario character varying(50),
    titulo character varying(50),
    cantidad numeric(9,0) NOT NULL,
    precio numeric(9,3) NOT NULL,
    fecha character varying(50)
);
    DROP TABLE public.pedidos;
       public         heap    postgres    false            �            1259    24618    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    cedula character varying(10) NOT NULL,
    nombres character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL,
    direccion character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    telefono numeric(10,0) NOT NULL,
    usuario character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    rol character varying(20)
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            n           2604    24597    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public          postgres    false    210    209    210            o           2604    49224    libro idlibro    DEFAULT     n   ALTER TABLE ONLY public.libro ALTER COLUMN idlibro SET DEFAULT nextval('public.libro_idlibro_seq'::regclass);
 <   ALTER TABLE public.libro ALTER COLUMN idlibro DROP DEFAULT;
       public          postgres    false    214    215    215                      0    24594 	   categoria 
   TABLE DATA           ;   COPY public.categoria (idcategoria, categoria) FROM stdin;
    public          postgres    false    210   �                 0    41023    factura 
   TABLE DATA           :   COPY public.factura (idventa, usuario, total) FROM stdin;
    public          postgres    false    212                    0    49221    libro 
   TABLE DATA           h   COPY public.libro (idlibro, titulo, autor, precio, idcategoria, sintesis, imagen, cantidad) FROM stdin;
    public          postgres    false    215                    0    41031    pedidos 
   TABLE DATA           T   COPY public.pedidos (idventa, usuario, titulo, cantidad, precio, fecha) FROM stdin;
    public          postgres    false    213   (%                 0    24618    usuarios 
   TABLE DATA           s   COPY public.usuarios (cedula, nombres, apellidos, direccion, correo, telefono, usuario, password, rol) FROM stdin;
    public          postgres    false    211   �&                  0    0    categoria_idcategoria_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 1, false);
          public          postgres    false    209                       0    0    libro_idlibro_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.libro_idlibro_seq', 6, true);
          public          postgres    false    214            q           2606    24599    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    210            s           2606    41027    factura factura_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (idventa);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    212            u           2606    49228    libro libro_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (idlibro);
 :   ALTER TABLE ONLY public.libro DROP CONSTRAINT libro_pkey;
       public            postgres    false    215               Q   x��K
�0�u�a�Е��܄��M!�����ZfKj�'�-P����p�40:�7Qo���D��b���7f��� s            x������ � �         �  x�uW�r�8}���w�8*Y��x_�G{VqR��JM�EB4 �HU���������Jq�Re["	ݧ�9�~^|�L;��-S�����j��V�kC19��͊���ֆ������z7�C6oy�%~��J�D��M�#��`��O]�=�؞�K��r�c��1^��l��X���{�lc|e��q��xc��M�uq@�F�;�p<�D���C�g1x>�vBa������Xasユ�]����:��}(.2@��jA��n�t{��v���ᖖ����w�E�#g�f  ��&��H�������H?�!zv%=�=�֤��u�w���;��<o}C�yq�K��^�C����;�����%99��i�O�xc$��\8NX���k�3j[�� �L=�1-�
/�;z�>�x5a��XkC��z�0�NMd��}�α`������;z�\?���O�}Z������͇�g�,|�[ N-�VDK����d^��A�7�_�_\\Og���/I\���t�J���6)Cō0�`r��� I��|��J8�h;Dh@$�3����N���%+Clm�g�|�d��%U�'�r �Ϊ������OG�X䑶\�h��S���*�~d��}�i�r��� Ui�i�	�`b
d!H빷� h<֦!\Q~�`� kLOpMJ$� C���Ɏ�������G��rV���TrZR�9��m4�I��\��S�Ԇ4: �zf����X��-�7͉��nQ�T,Q�7`b]������E�p�YOw���D��i��,(@��X$�d�A�pϼL�'ك�qzb�'�X�J�)�$4�C��9hji:�(�/�,4�H�;�`GSٍQ�!�V���`{��Ɗ]���H�w�$�-�}�?�G�y��:y� 1�p0b46�-���G���8��V�k�VnH����� ���;�5`��L����q%���*��nm�3�7"#@���p���顈�����D��~d�X
1@Go��s�X��3w�1E�BN���ۛ��,��,`�V�����&
y��NִҴ �K/P�"b����<�<C�	�a�z�`%�W�/�j~1����:�ɴ������@���e���7P��w��S�=�� ��$�8	������H���(�����3go�q�K����aA�Rnj@��%'��l�P�ơ��?d��9�Rhor���X^�&/��OB{�q��5��~���xK7&q,����P�vo�0�b�\��e��Pe#���ݰs���bz�+��\�Q���A�5������4��Ξ�z��"9�(#cO�S*�`+�]�4����M��d\����Fm�������^� �x����؈3H�B�C',*E�$#�w�o����tحkv<Y#�nE�X�mB��H7��ԇ�)�inlIZ�Vmؓ��)�sm�Z�A�?�L�pW�\��e���P>�]�N�{tPz0_���@v-��^�M ~�	�E>WH$�U��P/J�����VJ?XLq4�P��Ā9��2�L"���	�dA��A�|y���twb�������o,��;���h�:B�*;�.נp���žX�5�U���.P�F�mhdM��v�}��6mXG@�Ke�Ӟ%ۏC("�������9YF+�͙I�ժ �u����Ȅ#G�u;i1�#�Ӌ�����8���j�6Q/��1��̟_M�L'����/�K         Z  x���An�0E��)|"�YVU��B,*�+6�������Pq�ڡ\��d1���� B�{<����	(r�Y-3����"�#��~�_�:^@��;^��^h��0G���[?UG�����t/�f�U�>��J�D��P�I��e�D�"�"��c[X\p��{��8N�r^�4O���i�BZp��Ti�hB��Q��:�!��NЗV�Q��P7����������?l,X�� <x������ĭ�6H�h�s�%|�0�)/#of��3'z2��xDۈ��;�v�J�)����>b+������VO���5�w�Z��M��?'����Wy�eߪ��         �   x�}��J1�ϳO1OP�l���VT�*=	�����h�Y��Z���M��?�}��J�ݍJ��ǥi�%m9���=G�h��l�pJ�{;3@��xW��u,��}Ӫ�x�nb�c։V.� %��2�y�1>p<h�൝lO=-���WM'��R5gT1���:R!m��%x2k�J�"��[��d���/��+�_��י���B�s������K���do��i�V�}r     