
ALTER TABLE llx_numberseries_det ADD INDEX idx_numberseriesdet_fk_serie (fk_serie);
ALTER TABLE llx_numberseries_det ADD CONSTRAINT llx_numberseriesdet_fk_serie FOREIGN KEY (fk_serie) REFERENCES llx_numberseries (rowid);
