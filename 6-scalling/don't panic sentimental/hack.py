from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")

new_password = input("Enter a new password for the administrator: ")

db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    new_password
)

print("Administrator's password has been updated!")