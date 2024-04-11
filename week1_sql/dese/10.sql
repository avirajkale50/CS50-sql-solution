SELECT
    "name","per_pupil_expenditure"
FROM
    "districts"
JOIN
    "expenditures"
ON
    "districts"."id"="expenditures"."district_id"
WHERE
    "type" LIKE 'public school%'
ORDER BY
    "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;
