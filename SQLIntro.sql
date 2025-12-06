-- Create Table
CREATE TABLE customerpizzaorder (
PizzaOrderID BIGSERIAL NOT NULL PRIMARY KEY,
CustomerID INT,
PizzaOrderTimestamp TIMESTAMP DEFAULT NOW(),
SpecialNotes VARCHAR(500),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));

-- Display Table and Table Structure
\d Customer;
\d Pizza;

-- Create Table with no Key
CREATE TABLE diet_plan (
food_name VARCHAR(20), 
calories INT, 
food_group INT);

--Create Table with PK and required field, and multi-line text
CREATE TABLE Cipher_keys (
id BIGSERIAL primary key, 
name varchar(32) not null, 
cipher_key text);

--Create a table using a default value and text field.
CREATE TABLE uc_donutcustomers(
CustomerID BIGSERIAL NOT NULL PRIMARY KEY,
CustomerAddress TEXT NOT NULL,
CustomerPhone VARCHAR(30) DEFAULT '555-555-5555');

--Display the table structure of 3 tables in one go.
\d Customer;
\d Donut;
\d CustomerDonutOrder;

--Create a table using NUMERIC and INT from options of 1 = this, 2 = that
CREATE TABLE diamond_sales (
buyer_name VARCHAR(100),
sales_price NUMERIC(8,2),
cut_quality INT,
purchase_date DATE
);

--Create a table using text file and timestamp
CREATE TABLE log_ins (
id BIGSERIAL PRIMARY KEY,
ip_address TEXT NOT NULL,
log_time TIMESTAMP);

--SELECT Statement looking for a specific make type
SELECT * FROM garage WHERE make = 'Ferrari';

--Display just two columns from a table.
SELECT company, monthly_fee FROM Services;

--Display three columns from the table
SELECT Name, Weight, Gender FROM Animals;

--SELECT statement where it also shows how to put it on two lines
SELECT * FROM Artists
WHERE Rating = 2;

-- Create Table with no Key
CREATE TABLE diet_plan (
food_name VARCHAR(20), 
calories INT, 
food_group INT);

--Create Table with PK and required field, and multi-line text
CREATE TABLE Cipher_keys (
id BIGSERIAL primary key, 
name varchar(32) not null, 
cipher_key text);

--Select a specific column to display things on using a specific value
SELECT Name FROM Animals 
WHERE Species = 2;

--Using the UPDATE statement
UPDATE uc_pizzaorder
SET OrderQty = 10
WHERE PizzaOrderID = 1;

--Set every value for the column price to equal 50,000
UPDATE for_sale 
SET price = 50000;

--Update a specific column value to a certain value instead of all
UPDATE for_sale 
SET price = 40000 
WHERE model = 'Camaro';

--Insert values into a table when the columns already exist.
INSERT INTO widgets VALUES (3, 'Mary Wills', 33.33);

--Update using a operand other than "=".
UPDATE MenuItems
SET TakeOut = 'Y'
WHERE Cost > 9.95;

--Insert values into table by calling out which columns to change as well as Escaping a character.
INSERT INTO Restaurants
(Name, Description, RestaurantType) 
VALUES (E''Sarah\'s Salad Shack', 'Fresh salads made to order', 3);

--Another update Option
UPDATE MenuItems
SET DateAdded = '2019-08-10';

--Combination update with multiple WHERE conditions
UPDATE Animals
SET Notes = 'large animal', LastWeighDate = '2019-08-10'
WHERE Weight > 100 AND Gender = 'M';

--Just another insert thing
INSERT INTO Albums (Artist, Name, Cost, Purchased) 
VALUES (3, 'Reality All Stars', 17.50, '2019-08-10');

--More inserts just basic
INSERT INTO garage VALUES ('Chevrolet', 'Camaro', 1971);

--Copying data from one table to another with INSERT and SELECT
INSERT INTO for_sale(make, model, year) 
(SELECT * FROM garage WHERE (make = 'Alfa Romeo'));

--Copying data from one table to another with INSERT, SELECT and WHERE
INSERT INTO Pizza(PizzaID, PizzaName, PizzaDescription, PizzaPrice, PizzaPhotoID)
(SELECT * FROM uc_pizza WHERE (PizzaID = 1));

--Using SELECT to pull information just from two specific COLUMNS
SELECT building_name, monthly_rent FROM Buildings;

--Adding COLUMNS to a table
ALTER TABLE exercise_routine 
ADD day_of_the_week char;

--Run DDL commands to drop and readd columns to chage their data type
ALTER TABLE exercise_routine DROP exercise_name;
ALTER TABLE exercise_routine ADD exercise_name VARCHAR(45);

--Add a comment to a table.
COMMENT ON TABLE exercise_routine IS 'Exercise routine for January 1 to January 20';

--Using DISTINCT (different values) to copy information over to another table
INSERT INTO ColorLookup (color) SELECT DISTINCT color FROM Things;

--Add new column as just integer.
ALTER TABLE Things ADD color_int INT;

--Alter a columns data type and set to not null
ALTER TABLE Pass_keys 
ALTER COLUMN pass_key TYPE BYTEA USING (pass_key::bytea),
ALTER COLUMN pass_key SET NOT NULL;

--ALTER column with Timestamp 
ALTER TABLE Pass_keys 
ADD created timestamp default current_timestamp;

--ALTER table and COLUMN to new type then add a comment
ALTER TABLE Pass_keys ALTER COLUMN pass_key TYPE BYTEA USING pass_key::bytea;
COMMENT on column Pass_keys.pass_key is 'id of employees';

--ALTER table to use dollar and cents
ALTER TABLE project 
ADD P_budget NUMERIC(8,2);

--ALTER table to delete a column and add one with a column that is required.
ALTER TABLE UC_project DROP P_budget;
ALTER TABLE UC_project ADD P_cost INT NOT NULL DEFAULT 0;
   
--ADD a comment to a table.
COMMENT ON TABLE Rating IS 'Ratings of all movies released in 2019';

--Copy values of m to z from one table to another.
INSERT INTO test2 (name,id) SELECT name,id FROM test1 WHERE name > 'm';

--ALTER table to add a column that's multi-line text and required.
ALTER TABLE CHEESE ADD description TEXT NOT NULL;

--ALTER Table, Modify COLUMN by changing the data type.
ALTER TABLE Restaurants 
ALTER COLUMN Description TYPE CHARACTER VARYING(50), 
ALTER COLUMN Description SET NOT NULL;

--Add a column to a table that automatically gets filled with the date it was created.
ALTER TABLE Places ADD date_added timestamp default current_timestamp;

--Add a comment on a column in existing Table
COMMENT ON COLUMN MenuItems.popularity IS 'Popularity based on 2019 sales';

--DELETE records from a table using the OR operand using an integer.
DELETE FROM test1
WHERE id = 23 OR id = 35;

--DELETE specific record from the table using a string.
DELETE FROM garage WHERE make = 'Ferrari';

--DELETE specific records from the table using AND operand using string and integer along with less than.
DELETE FROM MenuItems
WHERE Popularity < 3 AND TakeOut = 'Y';

--DELETE from a table using the less than and an integer.
DELETE FROM garage
WHERE year < 1960;

--DELETE a table
DROP TABLE daily_diet_plan;

--Delete all contents from a table but leave the table intact
TRUNCATE TABLE exercise_routine;

--Delete a column from a table.
ALTER TABLE Things DROP color;

--Delete a table
DROP TABLE MEATS;

--Delete all contents from a table but leave the table intact.
TRUNCATE TABLE funds;

--Delete a column from a table;
ALTER TABLE UC_CHEESES DROP description;

--Joining tables
SELECT o.PizzaOrderID,
c.LastName,
p.PizzaName,
o.OrderQty,
p.PizzaPrice
FROM uc_pizzaorder As o
INNER JOIN uc_pizza AS p ON p.PizzaID = o.PizzaID
INNER JOIN uc_customer AS c ON c.CustomerID = o.CustomerID;


DROP FUNCTION update_stock;
CREATE FUNCTION update_stock() RETURNS TRIGGER AS $stock_trigger$
DECLARE
    stock_qty integer;
BEGIN
    stock_qty := get_stock(NEW.product_code) - NEW.qty;
    UPDATE products SET stock = stock_qty WHERE product_code=NEW.product_code; 
    RETURN NEW;
END; $stock_trigger$
LANGUAGE PLPGSQL;

CREATE TRIGGER update_trigger
AFTER INSERT ON order_info
FOR EACH ROW
    EXECUTE PROCEDURE update_stock();

    DROP FUNCTION get_stock;
CREATE FUNCTION get_stock(TEXT) RETURNS integer AS $stock_val$
DECLARE stock_val integer;
BEGIN
    SELECT stock INTO stock_val FROM products WHERE product_code=$1;
RETURN stock_val;
END; $stock_val$
LANGUAGE PLPGSQL;

DROP FUNCTION update_stock;
CREATE FUNCTION update_stock() RETURNS integer AS $stock_qty$
DECLARE
    stock_qty integer;
    _order_id integer;
    _prod_code TEXT;
BEGIN
    SELECT max(order_id) INTO _order_id FROM order_info; 
    SELECT qty INTO stock_qty FROM order_info WHERE order_id= _order_id;
    SELECT product_code INTO _prod_code FROM order_info WHERE order_id=_order_id;
    stock_qty := get_stock(_prod_code) - stock_qty;
    UPDATE products SET stock = stock_qty WHERE product_code=_prod_code; 
RETURN stock_qty;
END; $stock_qty$
LANGUAGE PLPGSQL;

DROP FUNCTION insert_order;
CREATE FUNCTION insert_order(integer, TEXT, integer) RETURNS integer AS $new_order_id$
DECLARE
   new_order_id integer;
BEGIN
    SELECT MAX(order_id) INTO new_order_id FROM order_info;
    new_order_id := new_order_id + 1;
    INSERT INTO order_info (order_id, customer_id, product_code, qty) VALUES
        (new_order_id, $1, $2, $3);
RETURN new_order_id;
END; $new_order_id$
LANGUAGE PLPGSQL;