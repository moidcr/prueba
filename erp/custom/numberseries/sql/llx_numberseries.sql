CREATE TABLE llx_numberseries
(
	rowid			integer AUTO_INCREMENT PRIMARY KEY,
	entity			integer DEFAULT 1 NOT NULL,
	ref 			varchar(30),
	label 			varchar(255),
	typedoc 		smallint DEFAULT 0 NOT NULL,
	defaultserie 	smallint DEFAULT 0 NOT NULL

)ENGINE=innodb;