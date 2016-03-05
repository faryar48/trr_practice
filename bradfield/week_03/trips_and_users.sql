-- The Trips table holds all taxi trips. Each trip has a unique Id, while Client_Id and Driver_Id are both foreign keys to the Users_Id at the Users table. Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).

-- +----+-----------+-----------+---------+--------------------+----------+
-- | Id | Client_Id | Driver_Id | City_Id |        Status      |Request_at|
-- +----+-----------+-----------+---------+--------------------+----------+
-- | 1  |     1     |    10     |    1    |     completed      |2013-10-01|
-- | 2  |     2     |    11     |    1    | cancelled_by_driver|2013-10-01|
-- | 3  |     3     |    12     |    6    |     completed      |2013-10-01|
-- | 4  |     4     |    13     |    6    | cancelled_by_client|2013-10-01|
-- | 5  |     1     |    10     |    1    |     completed      |2013-10-02|
-- | 6  |     2     |    11     |    6    |     completed      |2013-10-02|
-- | 7  |     3     |    12     |    6    |     completed      |2013-10-02|
-- | 8  |     2     |    12     |    12   |     completed      |2013-10-03|
-- | 9  |     3     |    10     |    12   |     completed      |2013-10-03|
-- | 10 |     4     |    13     |    12   | cancelled_by_driver|2013-10-03|
-- +----+-----------+-----------+---------+--------------------+----------+
-- The Users table holds all users. Each user has an unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).

-- +----------+--------+--------+
-- | Users_Id | Banned |  Role  |
-- +----------+--------+--------+
-- |    1     |   No   | client |
-- |    2     |   Yes  | client |
-- |    3     |   No   | client |
-- |    4     |   No   | client |
-- |    10    |   No   | driver |
-- |    11    |   No   | driver |
-- |    12    |   No   | driver |
-- |    13    |   No   | driver |
-- +----------+--------+--------+
-- Write a SQL query to find the cancellation rate of requests made by unbanned clients between Oct 1, 2013 and Oct 3, 2013. For the above tables, your SQL query should return the following rows with the cancellation rate being rounded to two decimal places.

-- +------------+-------------------+
-- |     Day    | Cancellation Rate |
-- +------------+-------------------+
-- | 2013-10-01 |       0.33        |
-- | 2013-10-02 |       0.00        |
-- | 2013-10-03 |       0.50        |
-- +------------+-------------------+

drop database if exists test;
create database test;
use test;

create table Trips (Id int, Client_Id int, Driver_Id int, City_Id int, Status text, Request_at date);

insert into Trips values (1, 1, 10, 1, "completed",             "2013-10-01");
insert into Trips values (2, 2, 11, 1, "cancelled_by_driver",   "2013-10-01");
insert into Trips values (3, 3, 12, 6, "completed",             "2013-10-01");
insert into Trips values (4, 4, 13, 6, "cancelled_by_client",   "2013-10-01");
insert into Trips values (5, 1, 10, 1, "completed",             "2013-10-02");
insert into Trips values (6, 2, 11, 6, "completed",             "2013-10-02");
insert into Trips values (7, 3, 12, 6, "completed",             "2013-10-02");
insert into Trips values (8, 2, 12, 12, "completed",            "2013-10-03");
insert into Trips values (9, 3, 10, 12, "completed",            "2013-10-03");
insert into Trips values (10, 4, 13, 12, "cancelled_by_driver", "2013-10-03");
insert into Trips values (10, 4, 13, 12, "cancelled_by_driver", "2013-10-04");

create table Users (Users_Id int, Banned text, Role text);

insert into Users values (1, "No", "client");
insert into Users values (2, "Yes", "client");
insert into Users values (3, "No", "client");
insert into Users values (4, "No", "client");
insert into Users values (10, "No", "driver");
insert into Users values (11, "No", "driver");
insert into Users values (12, "No", "driver");
insert into Users values (13, "No", "driver");

-- select t.request_at as Day, count(t.status) as Completed
-- from Trips as t
-- inner join Users as u on (u.Users_Id = t.Client_Id)
-- where t.status = "completed"
-- and u.banned = "No"
-- and u.role = "client"
-- and t.request_at >= "2013-10-01"
-- and t.request_at <= "2013-10-03"
-- group by t.request_at
-- ;

-- select t.request_at as Day, count(t.status) as Total
-- from Trips as t
-- inner join Users as u on (u.Users_Id = t.Client_Id)
-- and u.banned = "No"
-- and u.role = "client"
-- and t.request_at >= "2013-10-01"
-- and t.request_at <= "2013-10-03"
-- group by t.request_at
-- ;

select t.request_at as Day, round(((count(nullif(t.status, "completed"))) / (count(t.status))), 2) as "Cancellation Rate"
from Trips as t
inner join Users as u on (u.Users_Id = t.Client_Id)
and u.banned = "No"
and u.role = "client"
and t.request_at >= "2013-10-01"
and t.request_at <= "2013-10-03"
group by t.request_at
;


















