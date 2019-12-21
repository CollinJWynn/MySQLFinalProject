USE finalproject;
DROP TABLE IF EXISTS Contact;

CREATE TABLE Contact(
  Contact_ID int(11) NOT NULL auto_increment,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Street VARCHAR(255) NOT NULL,
  Street2 VARCHAR(255),
  Email VARCHAR(255),
  Phone VARCHAR(255),
  Fax VARCHAR(255),
  City VARCHAR(255),
  State VARCHAR(255),
  PostalCode VARCHAR(255),
  Title VARCHAR(255),
  Company VARCHAR(255),
  PRIMARY KEY  (Contact_ID)
) AS
	SELECT DISTINCT FirstName, LastName, Street, Email,
	                Phone, Fax, City, State, PostalCode,
	                Title, Company

	FROM invoices
	ORDER BY LastName;

ALTER TABLE invoices
	ADD COLUMN Contact_ID INT(11),
	ADD FOREIGN KEY (Contact_ID) REFERENCES Contact(Contact_ID);

UPDATE invoices
	INNER JOIN Contact
	ON Contact.FirstName = invoices.FirstName
	       AND Contact.LastName = invoices.LastName
	       AND Contact.Street = invoices.Street

	SET invoices.Contact_ID = Contact.Contact_ID
	WHERE Contact.FirstName IS NOT NULL;




ALTER TABLE invoices
	DROP COLUMN FirstName,
    DROP COLUMN LastName,
    DROP COLUMN Street,
    DROP COLUMN Email,
    DROP COLUMN Phone,
    DROP COLUMN Fax,
    DROP COLUMN City,
    DROP COLUMN State,
    DROP COLUMN PostalCode,
    DROP COLUMN Title,
    DROP COLUMN Company
;