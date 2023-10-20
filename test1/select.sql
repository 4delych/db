select * from books
where price > 1000
limit 2;

select buyer_id, count(book_id) from orders
where book_id = 2
group by buyer_id;

select * from books
order by genre;