SELECT
    "city",COUNT(*) AS "Public School Count"
FROM
    "schools"
WHERE
    "type" = 'Public School'
GROUP BY
    "city"
ORDER BY
    "Public School Count" DESC,"city"
LIMIT 10;
