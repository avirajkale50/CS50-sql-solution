SELECT
    "first_name" AS "Name of player in 2021"
FROM
    "players"
WHERE
    "final_year" LIKE '2021%'
ORDER BY
    "first_name";
