CREATE TABLE IF NOT EXISTS users (
  username varchar(45) NOT NULL,
  password varchar(60) NOT NULL,
  enabled tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (username)
);

INSERT INTO users (username, password, enabled) VALUES
  ('admin', '$2a$10$RuKzcsKGofKMk5ivGXq03ueXPJdFWMWukyU2s809rzbvqwxL7uqKW', 1);

CREATE TABLE IF NOT EXISTS user_info (
  username varchar(45) NOT NULL,
  email varchar(60) NOT NULL,
  name varchar(60) NOT NULL,
  city_id varchar(60) DEFAULT NULL,
  type VARCHAR(60),
  PRIMARY KEY (username)
);

INSERT INTO user_info (username, email, name, city_id, type) VALUES
  ('admin', 'admin@email.com', 'Admin', '1', null);

CREATE TABLE IF NOT EXISTS user_roles (
  user_role_id BIGINT AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id)
);

INSERT INTO user_roles (user_role_id, username, role) VALUES
  (1, 'admin', 'ROLE_ADMIN');

ALTER TABLE user_info
  ADD CONSTRAINT fk_username_info FOREIGN KEY (username) REFERENCES users (username);

ALTER TABLE user_roles
  ADD CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username);


CREATE TABLE locations (
  loc_id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  credit_payable CHAR(1),
  parent_loc BIGINT,
  PRIMARY KEY (loc_id)
);

ALTER TABLE locations
  ADD CONSTRAINT fk_loc_id_parent_loc FOREIGN KEY (parent_loc) REFERENCES locations (loc_id);

INSERT INTO locations (loc_id, name, parent_loc) VALUES
  (1, 'Manila City', 1),
  (2, 'Quezon City', 2),
  (3, 'Makati City', 3),
  (4, 'Taguig City', 4),
  (5, 'Sampaloc', 1);


CREATE TABLE store (
  store_id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  credit_payable CHAR(1),
  loc_id BIGINT,
  PRIMARY KEY (store_id)
);

ALTER TABLE store
  ADD CONSTRAINT fk_store_loc FOREIGN KEY (loc_id) REFERENCES locations (loc_id);

CREATE TABLE product_ref (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL UNIQUE,
  description VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE product_item (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  price FLOAT,
  filename VARCHAR(255),
  content MEDIUMBLOB,
  username VARCHAR(255),
  status VARCHAR(255),
  type VARCHAR(255),
  product_ref_id BIGINT,
  store_id BIGINT,
  PRIMARY KEY (id)
);

ALTER TABLE product_item
  ADD CONSTRAINT fk_product_store_id FOREIGN KEY (store_id) REFERENCES store (store_id);

ALTER TABLE product_item
  ADD CONSTRAINT fk_product_ref_id FOREIGN KEY (product_ref_id) REFERENCES product_ref (id);

CREATE TABLE IF NOT EXISTS checkout (
  checkout_id BIGINT NOT NULL AUTO_INCREMENT,
  name varchar(60) NOT NULL,
  address varchar(60) NOT NULL,
  city BIGINT NOT NULL,
  number varchar(60) NOT NULL,
  delivery tinyint(4) NOT NULL DEFAULT '1',
  orderDate varchar(60) NOT NULL,
  creditpayment tinyint(4) NOT NULL DEFAULT '1',
  cardNumber varchar(20) DEFAULT NULL,
  cardExpiry varchar(5) DEFAULT NULL,
  cardCVC varchar(3) DEFAULT NULL,
  orders_id varchar(20) NOT NULL,
  PRIMARY KEY (checkout_id)
);

ALTER TABLE checkout
  ADD CONSTRAINT fk_citycheck_id FOREIGN KEY (city) REFERENCES locations (loc_id);

CREATE TABLE IF NOT EXISTS orders (
  order_id varchar(20) NOT NULL,
  product_id BIGINT NOT NULL,
  qty int(11) NOT NULL,
  price decimal(5,2) NOT NULL,
  PRIMARY KEY (order_id)
);

ALTER TABLE orders
  ADD CONSTRAINT fk_prodorder_id FOREIGN KEY (product_id) REFERENCES product_item (id);


