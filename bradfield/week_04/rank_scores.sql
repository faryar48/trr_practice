
-- Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

-- +----+-------+
-- | Id | Score |
-- +----+-------+
-- | 1  | 3.50  |
-- | 2  | 3.65  |
-- | 3  | 4.00  |
-- | 4  | 3.85  |
-- | 5  | 4.00  |
-- | 6  | 3.65  |
-- +----+-------+
-- For example, given the above Scores table, your query should generate the following report (order by highest score):

-- +-------+------+
-- | Score | Rank |
-- +-------+------+
-- | 4.00  | 1    |
-- | 4.00  | 1    |
-- | 3.85  | 2    |
-- | 3.65  | 3    |
-- | 3.65  | 3    |
-- | 3.50  | 4    |
-- +-------+------+

-- TEMP
-- +-------+
-- | Score |
-- +-------+
-- | 4.00  |
-- | 3.85  |
-- | 3.65  |
-- | 3.50  |
-- +-------+

drop database if exists test;
create database test;
use test;

create table Scores (Id int, Score decimal(5,2));

insert into Scores values (1, 3.50);
insert into Scores values (2, 3.65);
insert into Scores values (3, 4.00);
insert into Scores values (4, 3.85);
insert into Scores values (5, 4.00);
insert into Scores values (6, 3.65);

# too slow
select s1.score as Score, (
  select count(distinct s2.score)+1 as Rank
  from Scores as s2
  where s2.score > s1.score
) as Rank
from Scores as s1, Scores as s2
group by s1.id
order by s1.score desc
;

SELECT T2.Score Score,
(SELECT COUNT(*) + 1
  FROM (
    SELECT T1.Score
    FROM Scores as T1
    GROUP BY Score
    ORDER BY Score DESC) as TEMP
  WHERE T2.Score < TEMP.Score) Rank
FROM Scores T2
ORDER BY Score DESC;







