ALTER TABLE parts
ADD UNIQUE(code);

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

UPDATE parts
SET description='N/A'
WHERE description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

ALTER TABLE parts
ADD PRIMARY KEY(id);

-- reorder_options table
ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

ALTER TABLE reorder_options
ADD CHECK ((price_usd/quantity) > 0.02
          AND (price_usd/quantity) < 25.00);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts(id);

ALTER TABLE reorder_options
ALTER COLUMN part_id SET NOT NULL;

-- locations table
ALTER TABLE locations
ADD CHECK (qty > 0);