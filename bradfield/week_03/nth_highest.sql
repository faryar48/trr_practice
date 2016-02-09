-- Write a SQL query to get the nth highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.


drop database if exists test;
create database test;
use test;

create table Employee (Id int, Salary int);

insert into Employee (id, salary) values (1, 100);
insert into Employee (id, salary) values (2, 200);
insert into Employee (id, salary) values (3, 300);
insert into Employee (id, salary) values (4, 400);


-- delimiter //
-- CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
-- BEGIN
--   RETURN (
--       # Write your MySQL query statement below.
--       select salary
--       from Employee
--       group by salary
--       union all (select null as salary) # forces the final value to be nil
--       order by salary desc
--       limit 1
--       offset 1
--   );
-- END
-- //
-- delimiter ;

select salary
from Employee
group by salary
union all (select null as salary) # forces the final value to be nil
order by salary desc
limit 1
offset 3;













