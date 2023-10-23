import os
import psycopg2
from dotenv import load_dotenv
load_dotenv()
 
 
HOST_DB = os.getenv('HOST_DB')
PORT_DB = os.getenv('PORT_DB')
USER_DB = os.getenv('USER_DB')
NAME_DB = os.getenv('NAME_DB')
PASSWORD_DB = os.getenv('PASSWORD_DB')

 
def connection():
    try:
        connection = psycopg2.connect(
            host=HOST_DB,
            port=PORT_DB,
            user=USER_DB,
            password=PASSWORD_DB,
            database=NAME_DB
        )
        print('[INFO] Успешное подключение к базе данных', e)
 
    except Exception as e:
        print('[INFO] Ошибка в процессе подключения к базе данных', e)
    return connection
 
 
def create_tables():
    conn = connection()
 
    queries = [
        """
        CREATE TABLE IF NOT EXISTS kalmykov_airports (
            kalmykov_airports_id SERIAL PRIMARY KEY,
            city_name VARCHAR(128),
            airport_name VARCHAR(128),
            airport_location VARCHAR(64)
        )
        """
    ]
 
    with conn.cursor() as cursor:
        for query in queries:
            cursor.execute(query)
            conn.commit()
 
    print("[INFO] Таблицы успешно созданы")
    conn.close()
 
 
def data_to_tables():
    conn = connection()
    
    kalmykov_airports_data = [
        (1, 'Москва', 'Домодедово'),
        (2, 'Санкт-Петербург',  'Пулково'),
        (3, 'Новосибирск', 'Толмачёво'),
        (4, 'Екатеринбург', 'Уктус'),
        (5, 'Нижний Новгород',  'Стригино'),
        (6, 'Красноярск', 'Черемшанка'),
        (7, 'Казань', 'Казань'),
        (8, 'Омск', 'Центральный'),
        (9, 'Самара', 'Курумоч'),
        (10, 'Челябинск' , 'Баландино'),
        (11, 'Ростов-на-Дону', 'Платов'),
        (12, 'Уфа' , 'Уфа'),
        (13, 'Воронеж' , 'Чертовицкое'),
        (14, 'Пермь' , 'Большое Савино'),
        (15, 'Волгоград' , 'Гумрак'),
        (16, 'Краснодар' , 'Краснодар'),
        (17, 'Саратов' , 'Гагарин'),
        (18, 'Тюмень' , 'Рощино'),
        (19, 'Тольятти' , 'Курумоч'),
        (20, 'Ижевск' , 'Ижевск')
    ]
    insert_kalmykov_airports_query = "INSERT INTO kalmykov_airports (kalmykov_airports_id, city_name, airport_name, airport_location) VALUES (%s, %s, %s, %s)"
 
    
    # Добавление данных
    with conn.cursor() as cursor:
        cursor.executemany(insert_kalmykov_airports_query, kalmykov_airports_data)
        conn.commit()
 
    print("[INFO] Данные в таблицы успешно добавлены")
    conn.close()
 

create_tables()
data_to_tables()