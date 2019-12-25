USE finalproject;
DROP TABLE IF EXISTS PostalCode;

CREATE TABLE PostalCode(
  PostalCode_ID int(11) NOT NULL auto_increment,
  PostalCode VARCHAR(25) NOT NULL,
  PRIMARY KEY  (PostalCode_ID)
) AS
	SELECT DISTINCT PostalCode
	FROM Contact
	WHERE PostalCode IS NOT NULL
	ORDER BY PostalCode;

ALTER TABLE Contact
	ADD COLUMN PostalCode_ID INT(11),
	ADD FOREIGN KEY (PostalCode_ID) REFERENCES PostalCode(PostalCode_ID);

UPDATE Contact
	INNER JOIN PostalCode
	ON PostalCode.PostalCode = Contact.PostalCode
	SET Contact.PostalCode_ID = PostalCode.PostalCode_ID
	WHERE PostalCode.PostalCode IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN PostalCode;