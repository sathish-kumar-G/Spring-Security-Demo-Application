-- Crete Table User
CREATE SCHEMA IF NOT EXISTS demo_svc;

CREATE SEQUENCE demo_svc.user_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

DROP TABLE IF EXISTS demo_svc.user;
CREATE TABLE demo_svc.user (
	id int8 NOT NULL default NEXTVAL('demo_svc.user_seq'),
	name varchar(50),
	email varchar(255),
	password varchar(400),
	CONSTRAINT user_pkey PRIMARY KEY (id)
);

-- UPDATE the sequence numbers after all the sample data inserts.
select setval('demo_svc.user_seq', (select max(id)+1 from demo_svc.user), false);

-- Create Table Role
CREATE SEQUENCE demo_svc.role_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

DROP TABLE IF EXISTS demo_svc.role;
CREATE TABLE demo_svc.role (
	id int8 NOT NULL default NEXTVAL('demo_svc.role_seq'),
	role varchar(50),
	role_desc varchar(255),
	CONSTRAINT role_pkey PRIMARY KEY (id)
);

-- UPDATE the sequence numbers after all the sample data inserts.
select setval('demo_svc.role_seq', (select max(id)+1 from demo_svc.role), false);


--Create Table User Role Map
CREATE SEQUENCE demo_svc.user_role_map_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

DROP TABLE IF EXISTS demo_svc.user_role_map;
CREATE TABLE demo_svc.user_role_map (
	id int8 NOT NULL default NEXTVAL('demo_svc.user_role_map_seq'),
	user_id int8,
	role_id int8,
    CONSTRAINT user_role_map_user_fkey FOREIGN KEY (user_id)
      REFERENCES demo_svc."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT user_role_map_role_fkey FOREIGN KEY (role_id)
      REFERENCES demo_svc.role (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT user_role_map_pkey PRIMARY KEY (id)
);

-- UPDATE the sequence numbers after all the sample data inserts.
select setval('demo_svc.user_role_map_seq', (select max(id)+1 from demo_svc.user_role_map), false);
