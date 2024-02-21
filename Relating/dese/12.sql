select
    d.name,
    e.per_pupil_expenditure,
    s.exemplary
from
    districts as d
inner join
    expenditures as e
    on d.id = e.district_id
inner join
    staff_evaluations as s
    on d.id = s.district_id
where
    d.type = 'Public School District' and
    e.per_pupil_expenditure > (
        select avg(per_pupil_expenditure)
        from expenditures
    ) and
    s.exemplary > (
        select avg(exemplary)
        from staff_evaluations
    )
order by
    s.exemplary desc,
    e.per_pupil_expenditure desc;
