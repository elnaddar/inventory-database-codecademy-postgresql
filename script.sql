ALTER TABLE parts
ADD UNIQUE(code);

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

UPDATE parts
SET description='N/A'
WHERE description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;