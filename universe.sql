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
-- Name: earth_distance; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth_distance (
    earth_distance_id integer NOT NULL,
    moon_id integer NOT NULL,
    distance numeric(10,4),
    name character varying(30)
);


ALTER TABLE public.earth_distance OWNER TO freecodecamp;

--
-- Name: earth_distance_earth_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_distance_earth_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_distance_earth_distance_id_seq OWNER TO freecodecamp;

--
-- Name: earth_distance_earth_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_distance_earth_distance_id_seq OWNED BY public.earth_distance.earth_distance_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    distance_from_earth_in_lightyears numeric(4,1),
    year_discovered integer,
    first_discovered_by text NOT NULL,
    expected_to_collide boolean,
    spiral_galaxy boolean NOT NULL,
    unique_name text
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
    name character varying(30),
    year_discovered integer,
    only_one boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(20),
    year_discovered integer,
    has_satellites boolean,
    distance_from_earth numeric(10,4),
    star_id integer NOT NULL
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
    name character varying(30),
    year_discovered integer,
    distance_from_earth numeric(5,3),
    constellation text,
    galaxy_id integer NOT NULL
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
-- Name: earth_distance earth_distance_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_distance ALTER COLUMN earth_distance_id SET DEFAULT nextval('public.earth_distance_earth_distance_id_seq'::regclass);


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
-- Data for Name: earth_distance; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth_distance VALUES (1, 1, 390.4000, NULL);
INSERT INTO public.earth_distance VALUES (2, 2, 628.3000, NULL);
INSERT INTO public.earth_distance VALUES (3, 3, 628.4000, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Nearest to the Milky Way', 2.5, 905, 'Abd Al Rahman Al Sufi', true, true, 'M31');
INSERT INTO public.galaxy VALUES (2, 'Fireworks', 'Has small, bright nucleus', 25.2, 1789, 'William Herschel', false, true, 'NGC 6946');
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'Isolated, spiral galaxy', 17.0, 1779, 'Edward Pigott', false, true, 'M64');
INSERT INTO public.galaxy VALUES (4, 'Comet', 'Galaxy showing tail like comet', 3.2, 2007, 'Hubbel Space Telescope', true, true, 'Comet Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Includes our Solar system', 0.0, 1610, 'Galileo Galilei', true, true, 'Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Condor', 'Largest known galaxy', 212.0, 1835, 'John Herschel', true, true, 'NGC 6872');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 1610, false, 1);
INSERT INTO public.moon VALUES (2, 'Io', 1610, false, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', 1610, false, 1);
INSERT INTO public.moon VALUES (4, 'Callisto', 1610, false, 1);
INSERT INTO public.moon VALUES (5, 'Thebe', 1979, false, 1);
INSERT INTO public.moon VALUES (6, 'Himalia', 1904, false, 1);
INSERT INTO public.moon VALUES (7, 'Valetudo', 2016, false, 1);
INSERT INTO public.moon VALUES (8, 'Carme', 1938, false, 1);
INSERT INTO public.moon VALUES (9, 'Elara', 1904, false, 1);
INSERT INTO public.moon VALUES (10, 'Autonoe', 2001, false, 1);
INSERT INTO public.moon VALUES (11, 'Moon', 1609, true, 4);
INSERT INTO public.moon VALUES (12, 'Titan', 1655, false, 5);
INSERT INTO public.moon VALUES (13, 'Mimas', 1789, false, 5);
INSERT INTO public.moon VALUES (14, 'Dione', 1684, false, 5);
INSERT INTO public.moon VALUES (15, 'Tethys', 1684, false, 5);
INSERT INTO public.moon VALUES (16, 'Triton', 1846, false, 6);
INSERT INTO public.moon VALUES (17, 'Galatea', 1989, false, 6);
INSERT INTO public.moon VALUES (18, 'Fobos', 1877, false, 7);
INSERT INTO public.moon VALUES (19, 'Charon', 1978, false, 8);
INSERT INTO public.moon VALUES (20, 'Miranda', 1948, false, 9);
INSERT INTO public.moon VALUES (21, 'Oberon', 1787, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 1610, true, 603.6900, 4);
INSERT INTO public.planet VALUES (2, 'Mercury', 1631, false, 183.6500, 4);
INSERT INTO public.planet VALUES (3, 'Venus', 1610, false, 256.8800, 4);
INSERT INTO public.planet VALUES (4, 'Earth', NULL, true, 0.0000, 4);
INSERT INTO public.planet VALUES (5, 'Saturn', 1610, true, 1.4000, 4);
INSERT INTO public.planet VALUES (6, 'Neptune', 1846, true, 4.3480, 4);
INSERT INTO public.planet VALUES (7, 'Mars', 1610, true, 102.9900, 4);
INSERT INTO public.planet VALUES (8, 'Pluto', 1930, true, 5.1770, 4);
INSERT INTO public.planet VALUES (9, 'Uranus', 1781, true, 2.8100, 4);
INSERT INTO public.planet VALUES (10, 'Eris', 2005, true, 1400.0000, 4);
INSERT INTO public.planet VALUES (11, 'Makemake', 2005, true, 5.6100, 4);
INSERT INTO public.planet VALUES (12, 'Haumean', 2004, true, 7600.0000, 4);
INSERT INTO public.planet VALUES (13, 'Ceres', 1801, false, 465.0000, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1862, 8.611, 'Canis Major', 5);
INSERT INTO public.star VALUES (2, 'Vega', 1850, 25.050, 'Lyra', 5);
INSERT INTO public.star VALUES (3, 'Capella A', 1899, 42.920, 'Auriga', 5);
INSERT INTO public.star VALUES (4, 'Sun', -450, 1.580, 'Cassiopeia', 5);
INSERT INTO public.star VALUES (5, 'Procyon', 1895, 11.450, 'Canis Minor', 5);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1915, 4.367, 'Centaurus', 5);


--
-- Name: earth_distance_earth_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_distance_earth_distance_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: earth_distance earth_distance_earth_distance_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_distance
    ADD CONSTRAINT earth_distance_earth_distance_id_key UNIQUE (earth_distance_id);


--
-- Name: earth_distance earth_distance_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_distance
    ADD CONSTRAINT earth_distance_pkey PRIMARY KEY (earth_distance_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name_key UNIQUE (unique_name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: earth_distance moon_name_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_distance
    ADD CONSTRAINT moon_name_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

