import psycopg2

# database connection
def get_connection():
    try:
        conn = psycopg2.connect(
            host='localhost',
            dbname='Divy_Station_2017_Q1Q2',
            user='postgres',
            password='12330122',
            port=5432
        )
        return conn  
    except Exception as error:
        print("Error connecting to database:", error)
        return None 
