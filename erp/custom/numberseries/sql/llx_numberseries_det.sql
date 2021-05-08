
CREATE TABLE llx_numberseries_det
(
	rowid 					integer AUTO_INCREMENT PRIMARY KEY,
	fk_serie 				integer NOT NULL,
	mask_1		 			varchar(30),
	mask_2 					varchar(30),
	mask_3 					varchar(30),
	mask_4 					varchar(30)
	
)ENGINE=innodb;