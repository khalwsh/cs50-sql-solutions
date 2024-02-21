
select
    "name"
from
    schools
where
    district_id = (
        select id
        from districts
        where name = 'Cambridge'
    );
