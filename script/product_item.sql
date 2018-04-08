CREATE TABLE product_item (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  price FLOAT,
  filename VARCHAR(255),
  content MEDIUMBLOB,
  username VARCHAR(255),
  status VARCHAR(255),
  PRIMARY KEY (id)
);
