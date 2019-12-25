USE finalproject;
DROP TABLE IF EXISTS City;

CREATE TABLE City(
  City_ID int(11) NOT NULL auto_increment,
  City VARCHAR(25) NOT NULL,
  PRIMARY KEY  (City_ID)
) AS
	SELECT DISTINCT City
	FROM Contact
	WHERE City IS NOT NULL
	ORDER BY City;

ALTER TABLE Contact
	ADD COLUMN City_ID INT(11),
	ADD FOREIGN KEY (City_ID) REFERENCES City(City_ID);

UPDATE Contact
	INNER JOIN City
	ON City.City = Contact.City
	SET Contact.City_ID = City.City_ID
	WHERE City.City IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN City;