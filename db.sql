DROP SCHEMA IF EXISTS cc_inventory_psql CASCADE;
CREATE SCHEMA cc_inventory_psql;
SET search_path = cc_inventory_psql;

CREATE TABLE cc_inventory_psql.parts (
    id integer,
    description character varying,
    code character varying,
    manufacturer_id  integer
);

CREATE TABLE cc_inventory_psql.locations (
    id integer,
    part_id integer,
    location varchar(3),
    qty integer
);

create table cc_inventory_psql.manufacturers (
    id integer PRIMARY KEY,
    name varchar
);

create table cc_inventory_psql.reorder_options (
  id integer PRIMARY KEY,
  part_id integer,
  price_usd numeric(8,2),
  quantity integer
);

\copy cc_inventory_psql.parts FROM 'parts.csv' delimiter ',' NULL AS ' ' csv header
\copy cc_inventory_psql.locations FROM 'locations.csv' delimiter ',' NULL AS ' ' csv header
\copy cc_inventory_psql.manufacturers FROM 'manufacturers.csv' delimiter ',' NULL AS ' ' csv header
\copy cc_inventory_psql.reorder_options FROM 'reorder_options.csv' delimiter ',' NULL AS ' ' csv header