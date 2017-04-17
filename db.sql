CREATE DATABASE db;
USE db;

-- Brand
-- Table Creation
CREATE TABLE brand (
  brand_id INT NOT NULL,
  name VARCHAR(20),
  factory_location VARCHAR(50),
  PRIMARY KEY(brand_id)
);

-- Data Insertion
INSERT INTO brand VALUES (1, 'Samsung', 'Taiwan');
INSERT INTO brand VALUES (2, 'Nokia', 'Sweden');
INSERT INTO brand VALUES (3, 'Apple', 'California');
INSERT INTO brand VALUES (4, 'Sony', 'Japan');


-- Carrier
-- Table Creation
CREATE TABLE carrier (
  carrier_id INT NOT NULL,
  name VARCHAR(50),
  PRIMARY KEY(carrier_id)
);

-- Data Insertion
INSERT INTO carrier VALUES (1, 'Vodafone');
INSERT INTO carrier VALUES (2, 'EE');
INSERT INTO carrier VALUES (3, 'O2');
INSERT INTO carrier VALUES (4, 'Three');


-- Device
-- Table Creation
CREATE TABLE device (
  device_id INT NOT NULL,
  name VARCHAR(50),
  brand_id INT NOT NULL,
  PRIMARY KEY(device_id),
  KEY(brand_id),
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- Data Insertion
INSERT INTO device VALUES (1, 'iPhone 6 Plus', 3);
INSERT INTO device VALUES (2, 'Galaxy S5', 1);
INSERT INTO device VALUES (3, 'Lumia 930', 2);
INSERT INTO device VALUES (4, 'Xperia Z3', 4);


-- Contract
-- Table Creation
CREATE TABLE contract (
  contract_id INT NOT NULL,
  carrier_id INT NOT NULL,
  handset_price VARCHAR(10),
  device_id INT NOT NULL,
  minutes VARCHAR(15),
  texts VARCHAR(15),
  data VARCHAR(15),
  monthly_price VARCHAR(10),
  length INT NOT NULL,
  PRIMARY KEY(contract_id),
  KEY(carrier_id),
  KEY(device_id),
  FOREIGN KEY (carrier_id) REFERENCES carrier(carrier_id),
  FOREIGN KEY (device_id) REFERENCES device(device_id)
);

-- Data Insertion
INSERT INTO contract VALUES (1, 1, 'Free', 4, 'Unlimited', 'Unlimited', '7GB', '48.50', 24);
INSERT INTO contract VALUES (2, 2, '9.99', 4, 'Unlimited', 'Unlimited', '5GB', '45.99', 24);
INSERT INTO contract VALUES (4, 3, 'Free', 4, 'Unlimited', 'Unlimited', '5GB', '43.00', 24);
INSERT INTO contract VALUES (6, 4, '9.00', 4, 'Unlimited', 'Unlimited', '2GB', '35.00', 24);
INSERT INTO contract VALUES (7, 1, '249.00', 4, 'Unlimited', 'Unlimited', '4GB', '53.50', 12);
INSERT INTO contract VALUES (8, 2, '9.00', 4, 'Unlimited', 'Unlimited', '5GB', '55.99', 12);
INSERT INTO contract VALUES (9, 3, 'Free', 4, 'Unlimited', 'Unlimited', '5GB', '53.99', 12);
INSERT INTO contract VALUES (10, 4, '9.00', 4, 'Unlimited', 'Unlimited', '2GB', '45.00', 12);
INSERT INTO contract VALUES (11, 1, 'Free', 3, 'Unlimited', 'Unlimited', '7GB', '44.50', 24);
INSERT INTO contract VALUES (12, 2, '9.99', 3, '1000', 'Unlimited', '1GB', '35.99', 24);
INSERT INTO contract VALUES (13, 3, 'Free', 3, 'Unlimited', 'Unlimited', '2GB', '22.00', 24);
INSERT INTO contract VALUES (14, 4, 'Free', 3, 'Unlimited', 'Unlimited', '2GB', '29.99', 24);
INSERT INTO contract VALUES (15, 1, '129.99', 3, 'Unlimited', 'Unlimited', '7GB', '58.50', 12);
INSERT INTO contract VALUES (16, 2, '9.99', 3, '1000', 'Unlimited', '1GB', '45.99', 12);
INSERT INTO contract VALUES (17, 3, 'Free', 3, 'Unlimited', 'Unlimited', '2GB', '32.00', 12);
INSERT INTO contract VALUES (18, 4, 'Free', 3, 'Unlimited', 'Unlimited', '2GB', '39.99', 12);
INSERT INTO contract VALUES (21, 1, 'Free', 2, 'Unlimited', 'Unlimited', '7GB', '44.50', 24);
INSERT INTO contract VALUES (22, 2, '9.99', 2, 'Unlimited', 'Unlimited', '2GB', '40.99', 24);
INSERT INTO contract VALUES (23, 3, 'Free', 2, 'Unlimited', 'Unlimited', '5GB', '43.00', 24);
INSERT INTO contract VALUES (24, 4, 'Free', 2, 'Unlimited', 'Unlimited', 'Unlimited', '40.00', 24);
INSERT INTO contract VALUES (26, 1, '199.00', 2, 'Unlimited', 'Unlimited', '7GB', '58.50', 12);
INSERT INTO contract VALUES (27, 3, 'Free', 2, 'Unlimited', 'Unlimited', '5GB', '53.00', 12);
INSERT INTO contract VALUES (30, 2, '329.99', 1, 'Unlimited', 'Unlimited', '5GB', '55.99', 24);
INSERT INTO contract VALUES (31, 3, '29.99', 1, 'Unlimited', 'Unlimited', 'Unlimited', '58.00', 24);
INSERT INTO contract VALUES (32, 4, '119.00', 1, 'Unlimited', 'Unlimited', 'Unlimited', '60.00', 24);
INSERT INTO contract VALUES (33, 1, '279.99', 1, 'Unlimited', 'Unlimited', '7GB', '58.50', 12);
INSERT INTO contract VALUES (34, 2, '329.00', 1, 'Unlimited', 'Unlimited', '5GB', '65.99', 12);
INSERT INTO contract VALUES (35, 3, '28.99', 1, 'Unlimited', 'Unlimited', 'Unlimited', '68.00', 12);
INSERT INTO contract VALUES (36, 4, '119.00', 1, 'Unlimited', 'Unlimited', 'Unlimited', '70.00', 12);
INSERT INTO contract VALUES (37, 1, '209.00', 1, 'Unlimited', 'Unlimited', '7GB', '53.50', 24);
INSERT INTO contract VALUES (38, 2, '9.99', 3, 'Unlimited', 'Unlimited', '2GB', '50.99', 12);
INSERT INTO contract VALUES (39, 4, 'Free', 3, 'Unlimited', 'Unlimited', 'Unlimited', '50.00', 12);