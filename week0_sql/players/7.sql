SELECT
   count(*)
FROM
    "players"
WHERE
    ("bats" = 'L' AND "throws" = 'R')
OR
    ("bats" = 'R' AND "throws" = 'L');
