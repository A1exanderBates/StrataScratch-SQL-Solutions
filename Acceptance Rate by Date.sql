/*
Meta/Facebook - Difficulty Medium

What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. 
If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

fb_friend_requests
user_id_sender:varchar
user_id_receiver:varchar
date:datetime
action:varchar

*/

with sent as (
    select *
    from fb_friend_requests
    where action = 'sent'
)

, accepted as (
    select *
    from fb_friend_requests
    where action = 'accepted'
)

select
    t1.date
    ,(count(t2.action)/CAST(COUNT(t1.action) as float)) as percentage_acceptance
from sent t1 left join accepted t2 on 
    t1.user_id_sender = t2.user_id_sender
    and t1.user_id_receiver = t2.user_id_receiver
group by t1.date
order by date asc;

