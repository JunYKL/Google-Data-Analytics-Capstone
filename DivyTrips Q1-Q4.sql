/*Create Table Q1Q2 (
ID int,
"name" varchar (350),
city varchar (100),
latitude Float,
longitude Float,
dpcapacity	Integer,
online_date Timestamp
)*/

/*Create Table Q3Q4 (
ID int,
"name" varchar (350),
city varchar (100),
latitude Float,
longitude Float,
dpcapacity	Integer,
online_date Timestamp,
extra_column TEXT 
) */


/*
Create Table Q1 (
trip_id int,
start_time Timestamp,
end_time Timestamp,
bikeid int,
tripduration int,
from_station_id int,
from_station_name varchar (350),
to_station_Id int,
to_station_name varchar (350),
usertype varchar (50),
gender varchar (30),
birthyear varchar(4)
)
*/

--Select birthyear from q1
/*
Update Q1
Set birthyear = 0
Where Birthyear ='';
*/
/*
Select birthyear
from Q1
Where birthyear = '0';
*/
/*
Alter Table q1
	Alter Column birthyear TYPE INTEGER USING birthyear:: INTEGER;
*/

--Select birthyear FROM q1
/*
Create Table q2 (
trip_id int,
start_time Timestamp,
end_time Timestamp,
bikeid int,
tripduration int,
from_station_id int,
from_station_name varchar (350),
to_station_Id int,
to_station_name varchar (350),
usertype varchar (50),
gender varchar (30),
birthyear varchar(4)
)
*/
/*
Update q2 
Set birthyear = 0
Where birthyear = '';
*/
/*
ALTER table q2
	Alter Column birthyear TYPE integer USING birthyear :: Integer
*/

/*
Select birthyear 
from q2
Where birthyear = '0'
*/

/*
Create Table q3 (
trip_id int,
start_time Timestamp,
end_time Timestamp,
bikeid int,
tripduration int,
from_station_id int,
from_station_name varchar (350),
to_station_Id int,
to_station_name varchar (350),
usertype varchar (50),
gender varchar (30),
birthyear varchar(4)
)
*/

/*
Update q3 
Set birthyear = 0
Where birthyear = ''
*/

/*

Alter Table q3
	Alter Column birthyear TYPE INTEGER USING birthyear :: INTEGER;
*/

/*
Select birthyear
from q3 
Where birthyear = 0
*/
/*
Create Table q4 (
trip_id int,
start_time Timestamp,
end_time Timestamp,
bikeid int,
tripduration int,
from_station_id int,
from_station_name varchar (350),
to_station_Id int,
to_station_name varchar (350),
usertype varchar (50),
gender varchar (30),
birthyear varchar(4)
)
*/
/*
Update q4
Set birthyear = 0
Where birthyear = ''
*/

Alter table q4
	Alter Column birthyear TYPE Integer using birthyear:: INTEGER;

