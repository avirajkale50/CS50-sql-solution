CREATE TABLE "ingredients" (
    "id" INTEGER ,
    "name" TEXT ,
    "price" REAL,
    PRIMARY KEY("id")
);


CREATE TABLE "donuts" (
    "id" INTEGER ,
    "name" TEXT ,
    "type" TEXT ,
    "price" REAL,
    PRIMARY KEY("id")
);

CREATE TABLE "ingredients_for_donut" (
   "donut_id" INTEGER,
   "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id","ingredient_id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER ,
    "first_name" TEXT ,
    "last_name" TEXT ,
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "order_no" INTEGER,
    "donut_id" INTEGER,
    "donut_no" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("order_no"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);
