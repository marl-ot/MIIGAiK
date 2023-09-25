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


def copy_table():
    conn = connection()
    query = "SELECT * INTO kalmykov_city_new FROM kalmykov_city;"

    with conn.cursor() as cursor:
        cursor.execute(query)
        conn.commit()
 
    print("[INFO] Таблица успешно скопированы")
    conn.close()


def rename_table():
    conn = connection()
    query = "ALTER TABLE kalmykov_city_new RENAME TO copy_kalmykov_city;"

    with conn.cursor() as cursor:
        cursor.execute(query)
        conn.commit()
 
    print("[INFO] Имя таблицы успешно изменено")
    conn.close()


def delete_table():
    conn = connection()
    query = "DROP TABLE copy_kalmykov_city;"

    with conn.cursor() as cursor:
        cursor.execute(query)
        conn.commit()
 
    print("[INFO] Таблица успешно удалена")
    conn.close()

# copy_table()
# rename_table()
# delete_table()