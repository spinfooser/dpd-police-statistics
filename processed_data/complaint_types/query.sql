select trim(split_part(allegation, '-', '2')) as allegation,
       count(*) as count
from complaints
where not starts_with(allegation, 'z')
  and trim(split_part(allegation, '-', '2')) <> ''
group by allegation
order by count(*) desc;
