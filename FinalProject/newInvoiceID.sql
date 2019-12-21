USE finalproject;

ALTER TABLE invoices
	ADD PRIMARY KEY (InvoiceID);

ALTER TABLE invoices
    DROP InvoiceTotal,
    DROP TaxAmount,
    DROP SubTotal;

ALTER TABLE invoices
	DROP COLUMN FullName;