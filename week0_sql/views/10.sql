SELECT
    "english_title","entropy"
AS
    "Top 5 Entropy of Hokusai Arts"
FROM
     "views"
WHERE
    "artist" = 'Hokusai'
ORDER BY
    "entropy";
