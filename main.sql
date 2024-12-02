CREATE TABLE IF NOT EXISTS salesman(
    salesman_id TEXT PRIMARY KEY,
    namee TEXT,
    city TEXT,
    commision REAL
);

INSERT INTO salesman (salesman_id, namee, city, commision) VALUES
  ('5001', 'James Hoog', 'New York', 0.15),
  ('5002', 'Nail Knite', 'Paris', 0.13),
  ('5005', 'Pit Alex', 'London', 0.11),
  ('5006', 'Mc Lyon', 'Paris', 0.14),
  ('5007', 'Paul Adam', 'Rome', 0.13),
  ('5003', 'Lauson Hen', 'San Jose', 0.12);

CREATE TABLE IF NOT EXISTS customer(
    customer_id TEXT PRIMARY KEY,
    customer_namee TEXT,
    city TEXT,
    grade INTEGER,
    salesman_id TEXT,
    FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id) 
);

INSERT INTO customer (customer_id, customer.namee, city, grade, salesman_id) VALUES
  ('3002', 'nick rimando', 'new york', 100, '5001'),
  ('3007', 'brad davis', 'new york', 200, '5001'),
  ('3005', 'graham zusi', 'california', 200, '5002'),
  ('3008', 'julian green', 'london', 300, '5002'),
  ('3004', 'fabian johnson', 'paris', 300, '5006'),
  ('3009', 'geoff cameron', 'berlin', 100, '5003'),
  ('3003', 'jozy altidor', 'moscow', 200, '5007'),
  ('3001', 'brad guzan', 'london', NULL, '5005');

CREATE TABLE IF NOT EXISTS orders(
   order_no TEXT PRIMARY KEY,
   purchase_amount REAL,
   order_date TEXT,
   customer_id TEXT,
   salesman_id TEXT,
   FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
   FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id)
  );

INSERT INTO orders (order_no, purchase_amount, order_date, customer_id, salesman_id) VALUES
  ('70001', 150.5, '2012-10-05', '3005', '5002'),
  ('70009', 270.65, '2012-09-10', '3001', '5001'),
  ('70002', 65.26, '2012-10-05', '3002', '5003'),
  ('70004', 110.5, '2012-08-17', '3009', '5007'),
  ('70007', 948.5, '2012-09-10', '3005', '5005'),
  ('70005', 2400.6, '2012-07-27', '3007', '5006');

SELECT customer.customer_namee, salesman.namee, salesman.city
FROM customer
JOIN salesman ON customer.city = salesman.city;

SELECT customer.customer_namee, salesman.namee,
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id;

SELECT orders.order_no, customer.customer_namee
FROM orders
JOIN customer ON orders.customer_id = customer.customer_id;

SELECT customer.customer_namee AS "customer", customer.grade AS "Grade"
FROM orders
JOIN salesman ON orders.salesman_id = salesma.salesman_id
JOIN customer ON orders.customer_id = customer.customer_id
WHERE customer.grade IS NOT NULL

SELECT customer.customer_namee AS "customer", customer.city AS "City", salesman.namee AS "Salesman", salesman.commision
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE salesman.comission BETWEEN 0.12 AND 0.14;

SELECT orders.order_no, customer.customer_namee, salesman.commision AS "Commission%",
orders.purch_amt * salesman.commision AS "Commission"
FROM orders
JOIN salesman ON orders.salesman_id = salesman.salesman_id
JOIN customer ON orders.customer_id = customer.customer_id
WHERE customer.grade >= 200;

SELECT *
FROM customer
JOIN orders ON customer.customer_id = orders.customer_id
WHERE orders.order_date = '2012-10-05';