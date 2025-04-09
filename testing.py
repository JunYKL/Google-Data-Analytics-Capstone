from traceback import format_stack
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from PgAdmin_to_Python import get_connection  
from matplotlib.ticker import MaxNLocator
from matplotlib.ticker import FuncFormatter

# Database connection
conn = get_connection()

# Check if connection is valid before proceeding
if conn:
    try:
        df = pd.read_sql('SELECT * FROM q1_q4_2017', conn)
        df_total_rides = pd.read_sql('SELECT usertype, COUNT(*) AS total_rides FROM q1_q4_2017 GROUP BY usertype', conn)
        df_trip_duration = pd.read_sql('SELECT SUM(tripduration) AS sum_tripduration, usertype FROM q1_q4_2017 GROUP BY usertype', conn)
        df_trip_times = pd.read_sql(
    '''
    SELECT 
        usertype,
        CASE  
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 5 AND 11 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 18 AND 23 THEN 'Evening'
            ELSE 'Night'
        END AS time_of_day,
        COUNT(*) AS total_rides
    FROM q1_q4_2017
    GROUP BY usertype, time_of_day
    ORDER BY time_of_day, total_rides DESC;
    ''',
    conn
)

    except Exception as error:
        print("Error executing query:", error)

    finally:
        conn.close()  

    # Formatting Y-axis numbers with commas    
    def format_ticks(x, pos):
        return f"{int(x):,}"  # Using F string

    # Total rides visualization for customer, dependent, and subscriber
    def visualize_data_total_rides(df_total_rides):
        plt.figure(figsize=(10, 6))
        sns.barplot(x='usertype', y='total_rides', data=df_total_rides, palette='Blues')

        # Get max value for y-axis
        max_y = df_total_rides['total_rides'].max()
        step = 250000  # Step size for y-axis ticks

        # Set y-axis ticks dynamically
        plt.yticks(range(0, int(max_y) + step, step))  

        # Applying format_ticks to get rid of scientific notation
        plt.gca().yaxis.set_major_formatter(FuncFormatter(format_ticks))

        # Labels and title
        plt.xlabel("User Type")
        plt.ylabel("Total Number of Rides")
        plt.title("Total Rides by User Type")
        plt.show()

   
    visualize_data_total_rides(df_total_rides)

    # Trip Duration for different usertypes 
    def visualize_data_Trip_duration(df_trip_duration):
        # Changing sec --> hours
        df_trip_duration['sum_tripduration'] = df_trip_duration['sum_tripduration'] / 3600

        plt.figure(figsize=(8, 6))
        sns.barplot(x='usertype', y='sum_tripduration', data=df_trip_duration, palette='Blues')

        # Getting Y max value 
        max_y_trip_duration = df_trip_duration['sum_tripduration'].max()
        step_duration_trip = 50000  # Corrected step value

        # Set y-axis ticks dynamically
        plt.yticks(range(0, int(max_y_trip_duration) + step_duration_trip, step_duration_trip))

        # Applying format_ticks to get rid of scientific notation
        plt.gca().yaxis.set_major_formatter(FuncFormatter(format_ticks))

        # Labels and title
        plt.xlabel("User Types")
        plt.ylabel("Trip Durations (Hours)")
        plt.title("Trip Duration by User Types")
        plt.show()

    visualize_data_Trip_duration(df_trip_duration)
 # Doing a stacked bar graph to show difference in rides between morning, evening and night
    def visualize_data_trip_times(df_trip_times):
        def visualize_data_trip_times(df_trip_times):
            plt.figure(figsize=(10, 6))
    
    # Create grouped bar chart using seaborn
    sns.barplot(
        x='time_of_day',
        y='total_rides',
        hue='usertype',
        data=df_trip_times,
        palette='Blues'
    )

    # Labels and title
    plt.xlabel("Time of Day")
    plt.ylabel("Total Number of Rides")
    plt.title("Total Rides by Time of Day and User Type")
    plt.legend(title="User Type")
    plt.tight_layout()
    plt.show()
        

else:
    print("Failed to connect to database.")



