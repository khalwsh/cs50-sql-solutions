SELECT "name" FROM "districts" JOIN "expenditures" ON
"districts"."id" = "expenditures"."district_id" ORDER BY "pupils" LIMIT 1;
