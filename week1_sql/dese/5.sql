SELECT
    "city",COUNT(*) AS "Public School Count"
FROM
    "schools"
WHERE
    "type" = 'Public School'
GROUP BY
    "city"
HAVING
    "Public School Count" <= 3
ORDER BY
    "Public School Count" DESC,"city";
