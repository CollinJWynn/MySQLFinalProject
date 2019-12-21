USE finalproject;
DROP TABLE IF EXISTS ShipVia;

CREATE TABLE ShipVia(
  ShipVia_ID int(11) NOT NULL auto_increment,
  ShipVia VARCHAR(25) NOT NULL,
  PRIMARY KEY  (ShipVia_ID)
) AS
	SELECT DISTINCT ShipVia
	FROM invoices
	WHERE ShipVia IS NOT NULL
	ORDER BY ShipVia;

ALTER TABLE invoices
	ADD COLUMN ShipVia_ID INT(11),
	ADD FOREIGN KEY (ShipVia_ID) REFERENCES ShipVia(ShipVia_ID);

UPDATE invoices
	INNER JOIN ShipVia
	ON ShipVia.ShipVia = invoices.ShipVia
	SET invoices.ShipVia_ID = ShipVia.ShipVia_ID
	WHERE ShipVia.ShipVia IS NOT NULL;

ALTER TABLE invoices
	DROP COLUMN ShipVia;