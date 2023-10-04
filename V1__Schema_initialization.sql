create table products(
    id bigserial unique primary key ,
    name varchar(20),
    price integer,
    production_date date,
    expiration_date date
);

create table supermarkets(
    id bigserial unique primary key,
    name varchar(20),
    address varchar(100)
);

create table products_in_market(
    market_id bigserial,
    product_id bigserial,
    foreign key (market_id) references supermarkets(id),
    foreign key (product_id) references products(id)
);

create table clients(
    id bigserial unique primary key,
    name varchar(20),
    lastname varchar(20),
    birth_date date,
    address varchar(20)
);

create table purchases(
    id bigserial unique primary key,
    client_id bigserial,
    product_id bigserial,
    foreign key (client_id) references clients(id),
    foreign key (product_id) references products(id)
);

create table delivery(
    id bigserial unique primary key,
    purchase_id bigserial,
    client_id bigserial,
    foreign key (purchase_id) references purchases(id),
    foreign key (client_id) references clients(id)
);