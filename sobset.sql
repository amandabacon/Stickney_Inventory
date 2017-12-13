-- -----------------------------------------------------
-- Schema stickney_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table stickney_db.sobset
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS SObSet (
  id SERIAL NOT NULL,
  item_name VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  serial_num VARCHAR(25) NOT NULL,
  date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
  logger_name VARCHAR(20) NULL,
  description TEXT NULL,
  PRIMARY KEY (id));


