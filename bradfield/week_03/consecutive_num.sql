-- Write a SQL query to find all numbers that appear at least three times consecutively.

-- +----+-----+
-- | Id | Num |
-- +----+-----+
-- | 1  |  1  |
-- | 2  |  1  |
-- | 3  |  1  |
-- | 4  |  2  |
-- | 5  |  1  |
-- | 6  |  2  |
-- | 7  |  2  |
-- +----+-----+
-- For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

-- {"headers": {"Logs": ["Id"
-- "Num"]}
-- "rows": {"Logs": [[1
-- 1]
-- [2
-- 1]
-- [3
-- 1]]}}



drop database if exists test;
create database test;
use test;

create table Logs (Id int, Num int);

insert into Logs (id, num) values (1, 1);
insert into Logs (id, num) values (2, 1);
insert into Logs (id, num) values (3, 1);


# Write your MySQL query statement below
select distinct l1.num
from Logs as l1
inner join Logs as l2 on (l2.id = l1.id + 1 and l1.num = l2.num)
inner join Logs as l3 on (l2.id + 1 = l3.id and l3.num = l2.num)
;
