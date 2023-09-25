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


def viborka1():
    conn = connection()
    query = "SELECT * FROM kalmykov_city WHERE kalmykov_city_id >= 2;"
    # Копирование таблицы
    with conn.cursor() as cursor:
        cursor.execute(query)
        output = cursor.fetchall()
        for row in output:
            print("Id: ", row[0])
            print("Имя города: ", row[1])
            print("Популяция: ", row[2])
            print("Год основания: ", row[3])
            print("Площадь: ", row[4])
 
    print(f"[INFO] Данные по запросу {query} успешно выбраны")
    conn.close()


def viborka2():
    conn = connection()
    query = "SELECT DISTINCT city_name from kalmykov_city;"
    # Копирование таблицы
    with conn.cursor() as cursor:
        cursor.execute(query)
        output = cursor.fetchall()
        for row in output:
            print(f"Имя города: ", row[0])
 
    print(f"[INFO] Данные по запросу {query} успешно выбраны")
    conn.close()


def viborka3():
    conn = connection()
    query = "SELECT * FROM kalmykov_city WHERE kalmykov_city_id IN (2, 5, 7);"
    # Копирование таблицы
    with conn.cursor() as cursor:
        cursor.execute(query)
        output = cursor.fetchall()
        for row in output:
            print("Id: ", row[0])
            print("Имя города: ", row[1])
            print("Популяция: ", row[2])
            print("Год основания: ", row[3])
            print("Площадь: ", row[4])
 
    print(f"[INFO] Данные по запросу {query} успешно выбраны")
    conn.close()


def viborka4():
    conn = connection()
    query = "SELECT city_name FROM kalmykov_city WHERE city_name LIKE '%а%';"
    # Копирование таблицы
    with conn.cursor() as cursor:
        cursor.execute(query)
        output = cursor.fetchall()
        for row in output:
            print("Имя города: ", row[0])
 
    print(f"[INFO] Данные по запросу {query} успешно выбраны")
    conn.close()


def viborka5():
    conn = connection()
    query = "SELECT * FROM kalmykov_city WHERE (city_name LIKE 'A%') OR (kalmykov_city_id BETWEEN 3 AND 6);"
    # Копирование таблицы
    with conn.cursor() as cursor:
        cursor.execute(query)
        output = cursor.fetchall()
        for row in output:
            print("Id: ", row[0])
            print("Имя города: ", row[1])
            print("Популяция: ", row[2])
            print("Год основания: ", row[3])
            print("Площадь: ", row[4])
 
    print(f"[INFO] Данные по запросу {query} успешно выбраны")
    conn.close()

# viborka1()
# viborka2()
# viborka3()
# viborka4()
viborka5()