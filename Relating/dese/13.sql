select
    d.name,
    e.pupils,
    e.per_pupil_expenditure,
    (e.pupils * e.per_pupil_expenditure) / 1e6 as budget_millions
from
    districts as d
inner join
    expenditures as e
    on d.id = e.district_id
order by
    budget_millions desc;
