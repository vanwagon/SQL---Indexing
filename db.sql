DROP SCHEMA IF EXISTS cc_user CASCADE;
CREATE SCHEMA cc_user;
SET SEARCH_PATH = cc_user;

CREATE TABLE customers
	(
	customer_id		INTEGER			GENERATED ALWAYS AS IDENTITY	PRIMARY KEY,
	first_name		VARCHAR(100)	NOT NULL,
	last_name		VARCHAR(100)	NOT NULL,
	email_address	VARCHAR(300)	NULL,
	home_phone		VARCHAR(100)	NULL,
	city				VARCHAR(50)		NULL,
	state_name		VARCHAR(50)		NULL,
	years_old		INTEGER			NULL
	);

\COPY customers FROM 'customers.txt' DELIMITER ',' CSV HEADER;