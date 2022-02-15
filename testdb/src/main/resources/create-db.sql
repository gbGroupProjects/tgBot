DROP TABLE IF EXISTS expense;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS user;

CREATE TABLE category
(
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(20) UNIQUE,
  CONSTRAINT category_pk PRIMARY KEY (category_id)
);

CREATE TABLE user
(
  user_id INT NOT NULL AUTO_INCREMENT,
  telegram_id INT NOT NULL,
  user_name VARCHAR(20) UNIQUE,
  CONSTRAINT user_pk PRIMARY KEY (user_id)
);

CREATE TABLE expense
(
  expense_id INT NOT NULL AUTO_INCREMENT,
  date DATE NOT NULL,
  category_id INT NOT NULL,
  price DECIMAL NOT NULL,
    CONSTRAINT expense_pk PRIMARY KEY (expense_id),
    CONSTRAINT expense_category_fk FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE TABLE event
(
  event_id INT NOT NULL AUTO_INCREMENT,
  category_id INT NOT NULL,
  date DATE NOT NULL,
  comment VARCHAR(20) NOT NULL,

    CONSTRAINT event_pk PRIMARY KEY (event_id),
    CONSTRAINT event_category_fk FOREIGN KEY (category_id) REFERENCES category (category_id)
);