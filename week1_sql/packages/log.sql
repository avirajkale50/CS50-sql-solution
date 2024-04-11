
-- *** The Lost Letter ***
--TO find the packages sent by from address
SELECT * FROM "packages" WHERE "from_address_id" =(
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue');
--As we know it is Congratulatory letter so we use it to find address where package went
SELECT * FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages" WHERE "from_address_id" =(
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
        AND "contents" = 'Congratulatory letter'
);
-- *** The Devious Delivery ***
--As it mention in the question the packages have no from address so we find it
SELECT * FROM "packages" WHERE "from_address_id" IS NULL;
--To find where the packages goes
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
) AND "action" = 'Drop';
--Find the type of Drop Address
SELECT * FROM "addresses" WHERE "id"=(
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL
) AND "action" = 'Drop'
);
-- *** The Forgotten Gift ***
--We know the address of the sender and reciver so we use it to find Package id
SELECT "id" FROM "packages"
WHERE "to_address_id" =(
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place')
AND "from_address_id" =(
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street');
--Now we use the scans table to track it
SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
WHERE "to_address_id" =(
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place')
AND "from_address_id" =(
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')
);
--The package is Pick , Drop And Again Pick So it is with a driver
SELECT "driver_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
WHERE "to_address_id" =(
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place')
AND "from_address_id" =(
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')
)
ORDER BY "timestamp" DESC
LIMIT 1;
--From the Driver id we going to find the name of the driver
SELECT * FROM "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
    WHERE "to_address_id" =(
        SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place')
    AND "from_address_id" =(
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
);













