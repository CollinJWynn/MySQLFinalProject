USE finalproject;
DROP TABLE IF EXISTS ShipmentStatus;

CREATE TABLE ShipmentStatus(
  ShipmentStatus_ID int(11) NOT NULL auto_increment,
  ShipmentStatus VARCHAR(25) NOT NULL,
  PRIMARY KEY  (ShipmentStatus_ID)
) AS
	SELECT DISTINCT ShipmentStatus
	FROM invoices
	WHERE ShipmentStatus IS NOT NULL
	ORDER BY ShipmentStatus;

ALTER TABLE invoices
	ADD COLUMN ShipmentStatus_ID INT(11),
	ADD FOREIGN KEY (ShipmentStatus_ID) REFERENCES ShipmentStatus(ShipmentStatus_ID);

UPDATE invoices
	INNER JOIN ShipmentStatus
	ON ShipmentStatus.ShipmentStatus = invoices.ShipmentStatus
	SET invoices.ShipmentStatus_ID = ShipmentStatus.ShipmentStatus_ID
	WHERE ShipmentStatus.ShipmentStatus IS NOT NULL;

ALTER TABLE invoices
	DROP COLUMN ShipmentStatus;