/*Please add ; after each select statement*/
CREATE PROCEDURE validPhoneNumbers()
BEGIN
    SELECT
        dataFilter.name, 
        dataFilter.surname, 
        dataFilter.phone_number
    FROM (
        SELECT name, surname, phone_number 
        FROM phone_numbers
        WHERE phone_number LIKE '1-___-___-____' OR phone_number LIKE '(1)___-___-____'
    ) dataFilter
    WHERE REGEXP_LIKE(phone_number, '^((1-)|([/(]1[/)]))([0-9]{3}-){2}[0-9]{4}$')
    ORDER BY surname;
    -- WHERE REGEXP_LIKE(phone_number, '^((1-)|(\(1\)))([0-9]{3}-){2}[0-9]{4}$');
    -- WHERE REGEXP_LIKE(phone_number, '^((1-)|(\(1\)))([0-9]{3}-){2}[0-9]{4}$');
    -- WHERE REGEXP_LIKE(phone_number, '^(1\-([0-9]{3}\-){2}[0-9]{4})|(\(1\)([0-9]{3}\-){2}[0-9]{4})$');
END