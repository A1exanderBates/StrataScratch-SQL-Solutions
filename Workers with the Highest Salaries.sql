/*
Workers With The Highest Salaries - Medium Difficulty

You have been asked to find the job titles of the highest-paid employees.
Your output should include the highest-paid title or multiple titles with the same salary.
*/

with workers_ranked as (
  select
    worker_id,
    salary,
    rank() over (order by salary desc) as rank_col
  from worker
)

select
    t.worker_title,
    w.salary
from ranked_table as w
left join title as t on w.worker_id = t.worker_ref_id
where rank_col = 1;
