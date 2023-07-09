/*
Find the number of times each word appears in drafts.

Output the word along with the corresponding number of occurrences.

filename:varchar
contents:varchar

*/


with string_cte as (
    select
        trim(both ',.' from lower(unnest(string_to_array(contents, ' ')))) as single_word
    from google_file_store
    where filename like '%draft%'
)

select
    single_word,
    count(single_word) as word_count
from string_cte
group by 1
order by word_count desc;
