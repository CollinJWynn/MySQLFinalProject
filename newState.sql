USE finalproject;
DROP TABLE IF EXISTS State;

CREATE TABLE State(
  State_ID int(11) NOT NULL auto_increment,
  State VARCHAR(25) NOT NULL,
  PRIMARY KEY  (State_ID)
) AS
	SELECT DISTINCT State
	FROM Contact
	WHERE State IS NOT NULL
	ORDER BY State;

ALTER TABLE Contact
	ADD COLUMN State_ID INT(11),
	ADD FOREIGN KEY (State_ID) REFERENCES State(State_ID);

UPDATE Contact
	INNER JOIN State
	ON State.State = Contact.State
	SET Contact.State_ID = State.State_ID
	WHERE State.State IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN State;