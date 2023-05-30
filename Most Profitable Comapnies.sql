/*
Most Profitable Companies - Medium Difficulty (easy imo)

Find the 3 most profitable companies in the entire world.

Output the result along with the corresponding company name.

Sort the result based on profits in descending order.
*/

select
    company,
    profits
from forbes_global_2010_2014
order by profits desc
limit 3
