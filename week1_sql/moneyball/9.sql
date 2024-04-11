SELECT "name",ROUND(AVG("salary"),2) AS "average salary" FROM "teams" , "salaries"
WHERE "salaries"."team_id" = "teams"."id" AND "salaries"."year" = 2001
GROUP BY "name"
ORDER BY  "average salary"
LIMIT 5;

