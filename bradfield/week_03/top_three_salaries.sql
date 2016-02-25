-- The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

-- +----+-------+--------+--------------+
-- | Id | Name  | Salary | DepartmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Henry | 80000  | 2            |
-- | 3  | Sam   | 60000  | 2            |
-- | 4  | Max   | 90000  | 1            |
-- | 5  | Janet | 69000  | 1            |
-- | 6  | Randy | 85000  | 1            |
-- +----+-------+--------+--------------+
-- The Department table holds all departments of the company.

-- +----+----------+
-- | Id | Name     |
-- +----+----------+
-- | 1  | IT       |
-- | 2  | Sales    |
-- +----+----------+
-- Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows.

-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Max      | 90000  |
-- | IT         | Randy    | 85000  |
-- | IT         | Joe      | 70000  |
-- | Sales      | Henry    | 80000  |
-- | Sales      | Sam      | 60000  |
-- +------------+----------+--------+

-- +------------+----------+--------+-------+
-- | Department | Employee | Salary | Rank  |
-- +------------+----------+--------+-------+
-- | IT         | Max      | 90000  |   1   |
-- | IT         | Randy    | 85000  |   2   |
-- | IT         | Joe      | 70000  |   3   |
-- | Sales      | Henry    | 80000  |   1   |
-- | Sales      | Sam      | 60000  |   2   |
-- | IT         | Janet    | 69000  |   4   |
-- +------------+----------+--------+-------+

-- +------------+----------+--------+-------+
-- | Department | Employee | Salary | Rank  |
-- +------------+----------+--------+-------+
-- | IT         | Max      | 90000  |   1   |
-- | IT         | Randy    | 85000  |   2   |
-- | IT         | Joe      | 70000  |   3   |
-- | Sales      | Henry    | 80000  |   1   |
-- | Sales      | Sam      | 60000  |   2   |
-- +------------+----------+--------+-------+

drop database if exists test;
create database test;
use test;

create table Employee (Id int, Name text, Salary int, DepartmentId int);

insert into Employee values (1, "Joe", 70000, 1);
insert into Employee values (2, "Henry", 80000, 2);
insert into Employee values (3, "Sam", 60000, 2);
insert into Employee values (4, "Max", 90000, 1);
insert into Employee values (5, "Janet", 69000, 1);
insert into Employee values (6, "Randy", 85000, 1);

create table Department (Id int, Name text);

insert into Department values (1, "IT");
insert into Department values (2, "Sales");

# returns top 3 salaries in each department (will return multiple people with the same salary as long as they are top 3)
select d.name as Name, e1.name as Employee, e1.salary as Salary
 from Employee as e1
 inner join Department as d on (e1.departmentid = d.id)
 where (
   # returns the number of unique salaries larger than the current row's employee's salary grouped by department
   select count(distinct e2.Salary)
   from Employee as e2
   where e2.Salary > e1.Salary
   and e1.departmentid = e2.departmentid
 ) <  3 # the number above needs to be less than 3
 order by e1.departmentid, e1.salary DESC
 ;









