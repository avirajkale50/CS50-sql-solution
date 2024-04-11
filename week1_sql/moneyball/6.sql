SELECT "name",SUM("H") AS "total hits" FROM "teams" , "performances"
WHERE "performances"."team_id" = "teams"."id" AND "performances"."year" = 2001
GROUP BY "name"
ORDER BY "total hits" DESC
LIMIT 5;

