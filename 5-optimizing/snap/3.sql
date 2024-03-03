WITH "x" AS (
    SELECT "to_user_id", COUNT("picture") AS "s"
    FROM "messages"
    WHERE "from_user_id" = (
        SELECT "id"
        FROM "users"
        WHERE "username" = 'creativewisdom377'
    )
    GROUP BY "to_user_id"
    ORDER BY "s" DESC
    LIMIT 3
)
SELECT "to_user_id"
FROM "x";
