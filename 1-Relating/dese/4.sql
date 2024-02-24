select
    city,
    count(*) as n_public_schools
from
    schools
where
    type = 'Public School'
group by
    city
order by
    n_public_schools desc,
    city
limit 10;
