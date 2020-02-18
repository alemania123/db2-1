CREATE FUNCTION HR.get_countryid_countryname(IN val integer DEFAULT 5)
	RETURNS TABLE (
		country_id character,
		country_name varchar
	)
AS
$BODY$
	BEGIN
		RETURN QUERY
			select country_id, country_name
			from hr.countries
			limit val;
	END;
$BODY$

LANGUAGE 'plpgsql';