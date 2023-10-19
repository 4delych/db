ALTER TABLE products
ALTER COLUMN name SET NOT NULL,
ADD CHECK(products.price > 0),
ALTER COLUMN production_date SET NOT NULL,
ADD CHECK(products.expiration_date > products.production_date);

ALTER TABLE supermarkets
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN address SET NOT NULL;

