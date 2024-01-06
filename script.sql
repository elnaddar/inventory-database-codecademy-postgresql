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
