CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "loaction" TEXT,
    "found_date" NUMERIC,
    PRIMARY KEY("id")
);


CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "loaction" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connect_people" (
    "person1" INTEGER,
    "person2" INTEGER,
     FOREIGN KEY("person1") REFERENCES "users"("id"),
     FOREIGN KEY("person2") REFERENCES "users"("id")
);


CREATE TABLE "connect_school" (
    "school_id" INTEGER,
    "person_id" INTEGER,
     "satrt_date" NUMERIC,
     "end_date" NUMERIC,
     "degree _type" TEXT,
     FOREIGN KEY("school_id") REFERENCES "schools"("id"),
     FOREIGN KEY("person_id") REFERENCES "users"("id")
);

CREATE TABLE "connect_company" (
    "company_id" INTEGER,
    "person_id" INTEGER,
     "satrt_date" NUMERIC,
     "end_date" NUMERIC,
     "title" TEXT,
     FOREIGN KEY("company_id") REFERENCES "companies"("id"),
     FOREIGN KEY("person_id") REFERENCES "users"("id")
);
