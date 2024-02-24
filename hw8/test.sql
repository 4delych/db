\set random random(2015,2016)
\set price random(100000, 200000)

select * from flights where flight_id in
                            (select flight_id from ticket_flights where amount > :price);


select * from flights
         where date_part('year', scheduled_departure) > :random;

select * from tickets
where passenger_name ilike (select passenger_name from tickets order by RANDOM() limit 1)
or passenger_name = (select passenger_name from tickets order by RANDOM() limit 1);

select * from ticket_flights
left join tickets  on ticket_flights.ticket_no = tickets.ticket_no
where fare_conditions = (select fare_conditions from ticket_flights order by RANDOM() limit 1);

select flights.flight_no as flightNo, count(*) as cnt from flights
group by flightNo;

UPDATE ticket_flights
SET amount = 0
WHERE ticket_no = (select ticket_no from ticket_flights order by RANDOM() limit 1);

UPDATE tickets
SET contact_data = jsonb_set(contact_data, '{phone}', '"+000"')
WHERE ticket_no = (select ticket_no from ticket_flights order by RANDOM() limit 1);

insert into ticket_flights (ticket_no, flight_id, fare_conditions, amount) VALUES ((select ticket_no from tickets order by  RANDOM() limit 1),
                                                                                   (select flight_id from ticket_flights order by RANDOM() limit 1),
                                                                                   (select fare_conditions from ticket_flights order by RANDOM() limit 1),
                                                                                   (select amount from ticket_flights order by RANDOM() limit 1));

delete from boarding_passes
where ticket_no = (select ticket_no from tickets order by  RANDOM() limit 1);

