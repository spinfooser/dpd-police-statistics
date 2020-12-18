select officer_id, count(officer_id) as complaint_count from officers
join complaints c on officers.id = c.officer_id
where active = true
group by officer_id
order by count(officer_id) desc
