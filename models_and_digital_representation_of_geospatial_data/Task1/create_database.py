import os
import psycopg2
from dotenv import load_dotenv
load_dotenv()
 
 
HOST_DB = os.getenv('HOST_DB')
PORT_DB = os.getenv('PORT_DB')
USER_DB = os.getenv('USER_DB')
NAME_DB = os.getenv('NAME_DB')
PASSWORD_DB = os.getenv('PASSWORD_DB')


def create_database(name):
    db_params = {
        "host": HOST_DB,
        "user": USER_DB,
        "password": PASSWORD_DB
    }
 
    create_database_query = f"CREATE DATABASE {name};"
    conn = psycopg2.connect(**db_params)
    conn.autocommit = True
    cursor = conn.cursor()
    cursor.execute(create_database_query)
    cursor.close()
    conn.close()
 
    db_params["database"] = name
 
    print(f"[INFO] База данных {name} успешно создана") 


create_database('digitalmodels')