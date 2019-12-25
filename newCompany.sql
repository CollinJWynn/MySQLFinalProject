USE finalproject;
DROP TABLE IF EXISTS Company;

CREATE TABLE Company (
  Company_ID int(11) NOT NULL auto_increment,
  Company VARCHAR(50) NOT NULL,
  PRIMARY KEY  (Company_ID)
) AS
	SELECT DISTINCT Company
	FROM invoices
	WHERE Company IS NOT NULL
	ORDER BY Company;

ALTER TABLE invoices
	ADD COLUMN Company_ID INT(11);

UPDATE invoices
	INNER JOIN Company
	ON Company.Company = +invoices.Company
	SET invoices.Company_ID = Company.Company_ID
	WHERE Company.Company IS NOT NULL;

SELECT inv.Company, inv.Company_ID, co.Company
	FROM Company AS co
		INNER JOIN
		invoices AS inv
	ON co.Company_ID = inv.Company_ID;
