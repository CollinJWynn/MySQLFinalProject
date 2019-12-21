USE finalproject;
DROP TABLE IF EXISTS Title;

CREATE TABLE Title(
  Title_ID int(15) NOT NULL auto_increment,
  Title VARCHAR(25) NOT NULL,
  PRIMARY KEY  (Title_ID)
) AS
	SELECT DISTINCT Title
	FROM Contact
	WHERE Title IS NOT NULL
	ORDER BY Title;

ALTER TABLE Contact
	ADD COLUMN Title_ID INT(11),
	ADD FOREIGN KEY (Title_ID) REFERENCES Title(Title_ID);

UPDATE Contact
	INNER JOIN Title
	ON Title.Title = Contact.Title
	SET Contact.Title_ID = Title.Title_ID
	WHERE Title.Title IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN Title;