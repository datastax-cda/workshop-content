# Labs 10 - Collections

**Estimated Time:** 10 minutes

1. Create table of service offerings (you choose the collection type)


    | Field | Type | Key |
    | ----------- | ----------- | ----------- |
    | name | text | primary key |
    | price | int |  |
    | services | collection |  |
1. Create INSERT statements and insert the following data

    | name | price | services |
    | ----------- | ----------- | ----------- |
    | tne up | 150 | change oil, adjust spark plugs, check tires, change filters |
    | rotate tires | 50 | rotate tires, check tires |
    | winterize | 100 | check fluids, check battery, mount snow tires, change oil |
1. List all the rows of the table
1. Create a table of cars and their service histories (you choose the collection type)

    | Field | Type | Key |
    | ----------- | ----------- | ----------- |
    | license | text | primary key |
    | service_history | collection | include month and name of service |
    | services | collection |  |
1. Create INSERT statements and insert the following data

    | license | service_history |
    | ----------- | ----------- | 
    | 2FLY | JAN – winterize, MAY – tuneup |
    | CYL8R | FEB – rotate tires, FEB – winterize, MAY – tuneup |
    | HOTROD | May – rotate tires |
1. Update the service history for HOTROD to add a tuneup in February
1. List all the rows of the table
1. Explain why you chose the collection types you did
