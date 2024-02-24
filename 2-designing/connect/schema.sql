CREATE TABLE "user"(
    "id" INTEGER,
    "First_name" TEXT,
    "last_name" TEXT,
    "password" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE "school"(
    "id" INTEGER,
    "name" TEXT,
    "Type" TEXT,
    "Location" TEXT,
    "year" NUMERIC,
    PRIMARY KEY ("id")
);

CREATE TABLE "Companies"(
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE "user_connections"(
    "id" INTEGER,
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user1_id") REFERENCES "user"("id"),
    FOREIGN KEY ("user2_id") REFERENCES "user"("id"),
    CHECK ("user1_id"!="user2_id"),
    UNIQUE ("user1_id","user2_id")
);

CREATE TABLE "school_connections"(
    "id" INTEGER,
    "start date" NUMERIC,
    "end_date" NUMERIC,
    "type_of_degree" TEXT,
    "user_id" INTEGER,
    "school_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "user"("id"),
    FOREIGN KEY ("school_id") REFERENCES "school"("id")
);

CREATE TABLE "companies_connections"(
    "id" INTEGER,
    "start date" NUMERIC,
    "end_date" NUMERIC,
    "user_id" INTEGER,
    "title" TEXT,
    "company_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "user"("id"),
    FOREIGN KEY ("company_id") REFERENCES "Companies"("id")
);




