
create table books(
    id bigserial unique primary key,
    name varchar(30) not null unique ,
    author varchar(40) not null,
    description text,
    date_of_publication date not null check ( date_of_publication < current_date ),
    genre varchar(20),
    price integer check ( price > 0 )
);

create table buyers(
    id bigserial unique primary key,
    name varchar(30) not null,
    lastname varchar(30) not null,
    birth_date date not null,
    address varchar(50),
    email varchar(50)
);

create table orders (
    id bigserial unique primary key,
    buyer_id bigserial,
    book_id bigserial,
    foreign key (buyer_id) references buyers(id),
    foreign key (book_id) references books(id)
);

insert into buyers(name, lastname, birth_date, address, email)
values ('Adel', 'Bagmanov', '2005-03-01', 'Cibgata Hakima str', 'adel@gmail.com'),
       ('Max', 'Bril', '2004-03-01', 'Chistoplskya str', 'max@gmail.com'),
       ('Ayaz', 'Minnigaleev', '2005-04-01', 'Derevnya Universiadi str', 'ayaz@gmail.com'),
       ('Eldar', 'Bilalov', '2005-03-02', 'Adoratskogo str', 'eldar@gmail.com'),
       ('Aidar', 'Bagmanov', '2010-03-01', 'Cibgata Hakima str', 'aidar@gmail.com');

insert into books(name, author, description, date_of_publication, genre, price)
values ('garry potter', 'rouling', 'book about magic', '2005-05-05', 'fantasy', 1999),
        ('berserk', 'ci hao chin', 'book about magic war', '1999-05-05', 'drama', 1000),
        ('naruto', 'cao lin hoi', 'book about magic ninjas', '2005-04-05', 'fantasy', 3000),
        ('green mile', 'stiven king', 'book about black guy', '2014-05-05', 'drama', 1500),
        ('1984', 'orwell', 'book about a cruel world', '2008-05-05', 'arama', 999);

insert into orders(buyer_id, book_id)
values (1,1),
       (1,2),
       (2,3),
       (4,4),
       (5,5);