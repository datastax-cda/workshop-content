# Labs 02 - Create a Table

**Estimated Time:** 10 minutes

1. Use the DROP TABLE command in CQL Shell to delete the cars table
1. Create a new cars table


    | Field | Type | Key |
    | ----------- | ----------- | ----------- |
    | make | text | partition key |
    | model | text | partition key |
    | miles | int |  1st clustering column |
    | year | int |  2nd clustering column |
    | color | text |  |
1. Insert the following data into the table

    ```
INSERT INTO cars(make, model, miles, year, color)
    values('Ford', 'Mustang', 34000, 1969, 'red');
INSERT INTO cars(make, model, miles, year, color)
    values('Ford', 'Mustang', 40000, 1969, 'green');
INSERT INTO cars(make, model, miles, year, color)
    values('Ford', 'Mustang', 45000, 1968, 'blue');
INSERT INTO cars(make, model, miles, year, color)
    values('Chevy', 'Camaro', 13000, 1969, 'red');
INSERT INTO cars(make, model, miles, year, color)
    values('Chevy', 'Camaro', 31000, 1969, 'yellow');
INSERT INTO cars(make, model, miles, year, color)
    values('Chevy', 'Camaro', 31000, 1971, 'red');
INSERT INTO cars(make, model, miles, year, color)
    values('Chevy', 'Camaro', 60000, 1970, 'blue');
    ```
1. Write a query to list all Ford Mustangs in order by miles (descending)
1. Write a query to list all Ford Mustangs in order by year (ascending)
1. Write a query to list all Ford Mustangs in order by miles (descending)
1. Write a query to list all Chevy Camaros with more than 15000 miles
1. Write a query to list all Chevy Camaros 
