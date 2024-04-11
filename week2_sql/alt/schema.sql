CREATE TABLE "passengers"(
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "AGE" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins"(
    "datetime" NUMERIC,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("flight_number")
);


CREATE TABLE "airlines" (
    "name" TEXT,
    "concourse" TEXT CHECK ("type" IN ('A','B','C','D','E','F','T'))
);


CREATE TABLE "flights" (
    "flight_number" TEXT,
    "dep_code" TEXT,
    "head_code" TEXT,
    "dept_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_date" NUMERIC NOT NULL
);
