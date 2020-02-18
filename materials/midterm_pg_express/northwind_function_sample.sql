CREATE OR REPLACE FUNCTION northwind.get_productname_qtyperunit(IN val integer DEFAULT 5)
    RETURNS TABLE (
		product_name VARCHAR,
		qty_per_unit VARCHAR
	)
AS 
$BODY$
	BEGIN
		RETURN QUERY 
			SELECT products.product_name, products.quantity_per_unit
			FROM northwind.products
			LIMIT val;
	END; 
$BODY$

LANGUAGE 'plpgsql';