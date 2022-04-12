
-- looking up an indexes associated with table, pg_Indexes is a built-in view in PostgreSQL--
SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

--Indexing is basically searching like binary tree--
-- creating an index -- 

CREATE INDEX customers_city_idx 
ON customers(city);

--confirm if index was successfully built--
SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';



-- How we can see an index actually decreasing search time --

--prior query, long execution and planning time --
EXPLAIN ANALYZE SELECT *
FROM customers
WHERE last_name = 'Jones'
  AND first_name = 'David';


--create new index, analyzed with lot shorter time--
CREATE INDEX customers_last_name_first_name_idx ON customers(last_name, first_name);

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE last_name = 'Jones'
  AND first_name = 'David';