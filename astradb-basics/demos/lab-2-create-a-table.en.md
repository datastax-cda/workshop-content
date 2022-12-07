# Labs - Create a Table

**Estimated Time:** 10 minutes

1. Connect to the Astra Dashboard
1. Access your database
1. Open the CQL Console
1. Use the keyspace (class)
1. Create a table called *cars* with the following fields

    | Field | Type | Key |
    | ----------- | ----------- | ----------- |
    | id | int | primary key |
    | make | text |  |
    | model | text |  |
    | year | int |  |
1. Insert some data

    ```
    INSERT INTO cars(id, make, model, year)
    values(1001, 'Dodge', 'Challenger', 1971);
    INSERT INTO cars(id, make, model, year)
    values(1002, 'Ford', 'Mustang', 1968);
    INSERT INTO cars(id, make, model, year)
    values(1003, 'Chevy', 'Camaro', 1969);
    INSERT INTO cars(id, make, model, year)
    values(1004, 'Dodge', 'Daytona', 1969);
    INSERT INTO cars(id, make, model, year)
    values(1005, 'Dodge', 'Challenger', 1972);
    INSERT INTO cars(id, make, model, year)
    values(1006, 'Ford', 'Mustang', 1971);
    INSERT INTO cars(id, make, model, year)
    values(1007, 'Dodge', 'Charger', 1969);
    ```
1. Run a query and select all cars