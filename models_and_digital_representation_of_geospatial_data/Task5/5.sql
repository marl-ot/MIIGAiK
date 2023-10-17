-- 1. 
ALTER TABLE public.kalmykov_city ADD COLUMN geom geometry(POINT, 4326);

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(37.6156 55.7522)')
WHERE kalmykov_city_id = 1;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(30.3141 59.9386)')
WHERE kalmykov_city_id = 2;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(82.9346 55.0415)')
WHERE kalmykov_city_id = 3;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(60.6122 56.8519)')
WHERE kalmykov_city_id = 4;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(44.002 56.3287)')
WHERE kalmykov_city_id = 5;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(92.8672 56.0184)')
WHERE kalmykov_city_id = 6;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(49.1221 55.7887)')
WHERE kalmykov_city_id = 7;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(73.3686 54.9924)')
WHERE kalmykov_city_id = 8;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(50.15 53.2001)')
WHERE kalmykov_city_id = 9;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(61.4291 55.154)')
WHERE kalmykov_city_id = 10;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(39.7233 47.2313)')
WHERE kalmykov_city_id = 11;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(55.9678 54.7431)')
WHERE kalmykov_city_id = 12;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(39.1843 51.672)')
WHERE kalmykov_city_id = 13;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(56.2502 58.0105)')
WHERE kalmykov_city_id = 14;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(44.5018 48.7194)')
WHERE kalmykov_city_id = 15;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(38.976 45.0448)')
WHERE kalmykov_city_id = 16;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(46.0086 51.5406)')
WHERE kalmykov_city_id = 17;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(65.5272 57.1522)')
WHERE kalmykov_city_id = 18;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(49.3461 53.5303)')
WHERE kalmykov_city_id = 19;

UPDATE public.kalmykov_city
SET geom = ST_GeomFromEWKT('SRID=4326; POINT(53.2045 56.8498)')
WHERE kalmykov_city_id = 20;

SELECT * FROM public.kalmykov_city;

-- 2. 

ALTER TABLE public.kalmykov_city ADD COLUMN geom_buf geometry(POLYGON, 4326);
UPDATE public.kalmykov_city SET geom_buf = ST_Buffer(geom, 23);
SELECT * FROM public.kalmykov_city;

-- 3. 

ALTER TABLE public.kalmykov_city ADD COLUMN sq float;
UPDATE public.kalmykov_city SET sq = ST_Area(geom_buf);
SELECT * FROM public.kalmykov_city;

-- 4.

ALTER TABLE public.kalmykov_city ADD COLUMN geom_int geometry(POLYGON, 4326);
UPDATE kalmykov_city SET geom_int = (SELECT ST_Intersection(a.geom_buf, b.geom_buf) 
                                     FROM kalmykov_city a, kalmykov_city b 
                                     WHERE a.city_name = b.city_name
									 LIMIT 1);
SELECT * FROM public.kalmykov_city;