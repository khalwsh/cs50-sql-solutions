
create table if not exists ingredients (
    id integer,
    name text not null,
    price_per_unit real not null,
    unit text not null,
    primary key(id)
);

create table if not exists donuts (
    id integer,
    name text not null,
    gluten_free text not null,
    price real not null,
    primary key(id)
);

create table if not exists donut_ingredients (
    donut_id integer not null,
    ingredient_id integer not null,
    primary key(donut_id, ingredient_id),
    foreign key(donut_id) references donuts(id),
    foreign key(ingredient_id) references ingredients(id)
);

create table if not exists customers (
    id integer,
    first_name text not null,
    last_name text not null,
    primary key(id)
);

create table if not exists orders (
    id integer,
    customer_id integer not null,
    order_time numeric not null,
    primary key(id),
    foreign key(customer_id) references customers(id)
);

create table if not exists order_items (
    order_id integer not null,
    donut_id integer not null,
    quantity integer not null,
    primary key(order_id, donut_id),
    foreign key(order_id) references orders(id),
    foreign key(donut_id) references donuts(id)
)
