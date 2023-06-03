# Finding User Purchases
# Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
# Output a list of user_ids of these returning active users.


with days_elapsed_table as (
    select 
        user_id, 
        created_at - LAG(created_at) OVER (PARTITION BY user_id ORDER BY created_at) as days_elapsed 
    from amazon_transactions
)

select distinct(user_id) 
from days_elapsed_table as det
where det.days_elapsed<=7
