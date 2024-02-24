SELECT "city", COUNT(*) AS "counter"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "counter" <= 3
ORDER BY "counter" DESC, "city";
