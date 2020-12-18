(select o.id, count(officer_id) as complaint_count
 from officers o
          join complaints c on o.id = c.officer_id
 where active = true
 group by o.id
 order by count(o.id) desc)
union
(select o.id, 0 as complaint_count
 from officers o
          left join complaints c on o.id = c.officer_id
 where active = true
   and c.officer_id is null)
order by complaint_count desc;
