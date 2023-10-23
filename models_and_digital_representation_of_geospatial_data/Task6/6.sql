'Москва' - 'Домодедово' - 37.900763 55.414920
'Санкт-Петербург' - 'Пулково' - 30.273198 59.800005
'Новосибирск' - 'Толмачёво' - 82.667497 55.009428
'Екатеринбург' - 'Уктус' - 60.645684 56.774177
'Нижний Новгород' - 'Стригино' - 43.790307 56.219444
'Красноярск' - 'Черемшанка' - 83.051152 50.275681
'Казань' - 'Казань' - 49.298596 55.608092
'Омск' - 'Центральный' - 73.316663 54.957773
'Самара' - 'Курумоч' - 50.157673 53.512267
'Челябинск' - 'Баландино' - 61.509242 55.298084
'Ростов-на-Дону' - 'Платов' - 39.929338 47.488386
'Уфа' - 'Уфа' - 55.883654 54.566430
'Воронеж' - 'Чертовицкое' - 39.225338 51.812620
'Пермь' - 'Большое Савино' - 56.010045 57.916343
'Волгоград' - 'Гумрак' - 44.354731 48.791887
'Краснодар' - 'Краснодар' - 39.138979 45.034333
'Саратов' - 'Гагарин' - 46.169986 51.718023
'Тюмень' - 'Рощино' - 65.348632 57.181518
'Тольятти' - 'Курумоч' - 50.157673 53.512267
'Ижевск' - 'Ижевск' - 53.450577 56.830847


ALTER TABLE public.kalmykov_airports ADD COLUMN airport_location geometry;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(37.900763 55.414920)')
WHERE kalmykov_airports_id = 1;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(30.273198 59.800005)')
WHERE kalmykov_airports_id = 2;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(82.667497 55.009428)')
WHERE kalmykov_airports_id = 3;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(60.645684 56.774177)')
WHERE kalmykov_airports_id = 4;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(43.790307 56.219444)')
WHERE kalmykov_airports_id = 5;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(83.051152 50.275681)')
WHERE kalmykov_airports_id = 6;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(49.298596 55.608092)')
WHERE kalmykov_airports_id = 7;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(73.316663 54.957773)')
WHERE kalmykov_airports_id = 8;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(50.157673 53.512267)')
WHERE kalmykov_airports_id = 9;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(61.509242 55.298084)')
WHERE kalmykov_airports_id = 10;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(39.929338 47.488386)')
WHERE kalmykov_airports_id = 11;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(55.883654 54.566430)')
WHERE kalmykov_airports_id = 12;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(39.225338 51.812620)')
WHERE kalmykov_airports_id = 13;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(56.010045 57.916343)')
WHERE kalmykov_airports_id = 14;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(44.354731 48.791887)')
WHERE kalmykov_airports_id = 15;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(39.138979 45.034333)')
WHERE kalmykov_airports_id = 16;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(46.169986 51.718023)')
WHERE kalmykov_airports_id = 17;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(65.348632 57.181518)')
WHERE kalmykov_airports_id = 18;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(50.157673 53.512267)')
WHERE kalmykov_airports_id = 19;

UPDATE public.kalmykov_airports
SET airport_location = geometry('SRID=4326; POINT(53.450577 56.830847)')
WHERE kalmykov_airports_id = 20;

CREATE INDEX ON public.kalmykov_airports USING gist(airport_location);


ALTER TABLE public.kalmykov_city ADD COLUMN aero INTEGER;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=1)
WHERE kalmykov_city_id=1;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=2)
WHERE kalmykov_city_id=2;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=3)
WHERE kalmykov_city_id=3;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=4)
WHERE kalmykov_city_id=4;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=5)
WHERE kalmykov_city_id=5;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=6)
WHERE kalmykov_city_id=6;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=7)
WHERE kalmykov_city_id=7;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=8)
WHERE kalmykov_city_id=8;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=9)
WHERE kalmykov_city_id=9;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=10)
WHERE kalmykov_city_id=10;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=11)
WHERE kalmykov_city_id=11;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=12)
WHERE kalmykov_city_id=12;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=13)
WHERE kalmykov_city_id=13;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=14)
WHERE kalmykov_city_id=14;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=15)
WHERE kalmykov_city_id=15;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=16)
WHERE kalmykov_city_id=16;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=17)
WHERE kalmykov_city_id=17;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=18)
WHERE kalmykov_city_id=18;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=19)
WHERE kalmykov_city_id=19;

UPDATE public.kalmykov_city
SET aero = (SELECT count(*)
FROM public.kalmykov_airports as a
JOIN public.kalmykov_city as buf ON st_contains(buf.geom_buf, a.airport_location)
WHERE buf."kalmykov_city_id"=20)
WHERE kalmykov_city_id=20;