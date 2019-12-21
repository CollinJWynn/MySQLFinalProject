USE finalproject;
DROP TABLE IF EXISTS CreatedBy;

CREATE TABLE CreatedBy (
  CreatedBy_ID int(11) NOT NULL auto_increment,
  CreatedBy VARCHAR(50) NOT NULL,
  PRIMARY KEY  (CreatedBy_ID)
) AS
	SELECT DISTINCT CreatedBy
	FROM invoices
	WHERE CreatedBy IS NOT NULL
	ORDER BY CreatedBy;

ALTER TABLE invoices
	ADD COLUMN CreatedBy_ID INT(11);

UPDATE invoices
	INNER JOIN CreatedBy
	ON CreatedBy.CreatedBy = +invoices.CreatedBy
	SET invoices.CreatedBy_ID = CreatedBy.CreatedBy_ID
	WHERE CreatedBy.CreatedBy IS NOT NULL;

SELECT inv.CreatedBy, inv.CreatedBy_ID, cb.CreatedBy
	FROM CreatedBy AS cb
		INNER JOIN
		invoices AS inv
	ON cb.CreatedBy_ID = inv.CreatedBy_ID;
