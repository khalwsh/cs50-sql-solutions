CREATE TABLE "Passengers" (
    "FirstName" Text,
    "lastName" Text,
    "Age" INTEGER,
    "id" INTEGER,
    primary key ("id")
);
CREATE TABLE "Air_Lines"(
    "id" INTEGER,
    "name" TEXT,
    concourse text not null check(concourse in ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    primary key(id)
);
CREATE TABLE "Flights"(
    "id" INTEGER,
    "NUMBER" INTEGER,
    "Air_Lines_id" INTEGER,
    "from_airport" text not null,
    "to_airport" text not null,
    "departure_time" numeric not null,
    "arrival_time" numeric not null,
    primary key("id"),
    foreign key("Air_Lines_id") references "Air_Lines"("id")
);
CREATE TABLE "check_in"(
    "Time_date" NUMERIC ,
    "Passenger_id" INTEGER,
    "flight_id" INTEGER,
    "id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") references "Passengers"("id"),
    FOREIGN KEY ("flight_id") references "Flights"("id")
);
