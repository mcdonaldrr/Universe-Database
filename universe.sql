--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255),
    orbit_years integer,
    first_seen_year integer NOT NULL,
    last_seen_year integer,
    had_collission boolean,
    star_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50),
    description text,
    width_in_light_year integer,
    group_membership character varying(255) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_planet_100k_km numeric(6,1),
    diameter_km numeric(6,1),
    has_atmosphere boolean,
    planet_id integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_star integer,
    description text,
    moons integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(30),
    known_planets integer,
    description text,
    is_binary boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Shoemaker-Levy 9', 2, 1993, 1995, true, 1);
INSERT INTO public.comet VALUES (2, 'Halley', 75, -240, 1986, false, 1);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 133, 1862, 1862, false, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 'Home galaxy of Earth. Barred spiral galaxy', 180000, 'Local Group');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Irr', 'Satellite of Milky Way. Status of galaxy disputed', 1, 'Local Group');
INSERT INTO public.galaxy VALUES (3, 'Ursa Major II Dwarf', 'dSph', 'Satellite of Milky Way. accretion by Milky Way', 1800, 'Local Group');
INSERT INTO public.galaxy VALUES (4, 'Pictor II', 'unknown', 'Satellite of Milky Way and possibly associated with Large Magellanic Cloud', 300, 'Local Group');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'SBsm', 'Satellite of MW', 14000, 'Local Group');
INSERT INTO public.galaxy VALUES (6, 'NGC 300', 'Sasd', 'Closest Spiral galaxy to Local group and pairs with NGC 55', 94000, 'between LG and Sculptor Group');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 384.0, 3476.0, false, 1, 'very big for its planet');
INSERT INTO public.moon VALUES (2, 'Deimos', 23.0, 8.0, false, 4, 'Doom video game has moon as setting');
INSERT INTO public.moon VALUES (3, 'Phobos', 9.0, 20.0, false, 4, 'Doom video game has moon as setting.');
INSERT INTO public.moon VALUES (4, 'Adrastea', 128.0, 26.0, false, 5, 'discovered 1979');
INSERT INTO public.moon VALUES (5, 'Callisto', 1.8, 4800.0, false, 5, 'discovered 1610 by Galileo');
INSERT INTO public.moon VALUES (6, 'Europa', 670.0, 3126.0, false, 5, 'discovered in 1610 by Galileo');
INSERT INTO public.moon VALUES (7, 'Ganymede', 1070.0, 5276.0, false, 5, 'largest moon on Jupiter');
INSERT INTO public.moon VALUES (8, 'Io', 421.0, 3629.0, false, 5, 'discovered in 1610');
INSERT INTO public.moon VALUES (9, 'Amalthea', 181.0, 262.0, false, 5, 'discovered in 1892 by Barnard');
INSERT INTO public.moon VALUES (10, 'Elara', 11737.0, 80.0, false, 5, 'discovered in 1905 by Perrine');
INSERT INTO public.moon VALUES (11, 'Dione', 377.0, 1120.0, false, 6, 'discovered in 1684 by Cassini');
INSERT INTO public.moon VALUES (12, 'Enceladus', 238.0, 498.0, false, 6, 'discovered in 1789 by Herschel');
INSERT INTO public.moon VALUES (13, 'Mimas', 185.0, 398.0, false, 6, 'Mimas discovered in 1789 by Herschel');
INSERT INTO public.moon VALUES (14, 'Rhea', 527.0, 1528.0, false, 6, 'discovered in 1672 by Cassini');
INSERT INTO public.moon VALUES (15, 'Tethys', 294.0, 1060.0, false, 6, '1684: Cassini');
INSERT INTO public.moon VALUES (16, 'Titan', 1221.0, 5150.0, false, 6, 'largest moon of Saturn. 1655 by Huygens');
INSERT INTO public.moon VALUES (17, 'Miranda', 129.0, 472.0, false, 7, '1948 by Kuiper');
INSERT INTO public.moon VALUES (18, 'Oberon', 582.0, 1526.0, false, 7, '1787 by Herschel');
INSERT INTO public.moon VALUES (19, 'Titania', 436.0, 1578.0, false, 7, '1787 by W. Herschel');
INSERT INTO public.moon VALUES (20, 'Nereid', 5513.0, 340.0, false, 8, '1949 by Kuiper');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 150, '3rd planet from the sun and intelligent life', 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 58, 'closest planet to the sun', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 108, '2nd closest planet to the sun', 0, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 228, '4th closest planet to the sun', 2, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 779, '5th closest planet to the sun', 80, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1434, '6th closest planet to the sun', 83, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2873, 'Yur Butthole', 27, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4495, 'Furthest Planet from the Sun', 14, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 8, 'Closest exoplanet to Earth', 0, false, 2);
INSERT INTO public.planet VALUES (10, 'Wolf 359 b', 800, 'Largest Exoplanet in Wolf 359 System', 0, false, 3);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 b', 10, 'Closest Planet to Lalande 21185 in its system', 0, false, 4);
INSERT INTO public.planet VALUES (12, 'Epsilon Eridani b', 510, '1.5 times the size of Jupiter', 1, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'G2V', 8, 'only star known to have intelligent life in its system', false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M5.5Ve', 3, 'Closest star to Earth with known exoplanets', false, 1);
INSERT INTO public.star VALUES (3, 'Wolf 359', 'M6V', 2, 'Red Dwarf in constellation Leo', false, 1);
INSERT INTO public.star VALUES (4, 'Lalande 21185', 'M2V', 2, 'Red Dwaft in the south of Ursa Major', false, 1);
INSERT INTO public.star VALUES (5, 'Epsilon Eridani', 'K2V', 1, 'Formally named Ran, southern constellation of Eridanus', false, 1);
INSERT INTO public.star VALUES (6, 'Lacaille 9352', 'M0.5V', 2, 'Red Dwarf in southern constellation of Piscis Austrinus', false, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq UNIQUE (description);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: comet fk_star_comet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star_comet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

