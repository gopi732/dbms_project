-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-13 00:17:45.527

-- tables
-- Table: customers
CREATE TABLE customers (
    first_name varchar(64)  NOT NULL,
    last_name varchar(64)  NOT NULL,
    phone_1 varchar(15)  NOT NULL,
    phone_2 varchar(15)  NULL DEFAULT null,
    email_1 varchar(50)  NOT NULL,
    email_2 varchar(50)  NULL DEFAULT null,
    city varchar(50)  NULL DEFAULT null,
    state varchar(50)  NULL DEFAULT null,
    zip_code varchar(10)  NULL DEFAULT null,
    address varchar(1000)  NULL DEFAULT null,
    password varchar(500)  NOT NULL,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY (id)
) AUTO_INCREMENT 14 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON customers (created_by);

CREATE INDEX updated_by ON customers (updated_by);

-- Table: dose
CREATE TABLE dose (
    id int  NOT NULL AUTO_INCREMENT,
    dose_stg varchar(100)  NOT NULL,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT dose_pk PRIMARY KEY (id)
) AUTO_INCREMENT 3 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON dose (created_by);

CREATE INDEX updated_by ON dose (updated_by);

-- Table: managers
CREATE TABLE managers (
    name varchar(64)  NOT NULL,
    mobile varchar(15)  NOT NULL,
    email varchar(50)  NOT NULL,
    address varchar(200)  NOT NULL,
    password varchar(500)  NOT NULL,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT managers_pk PRIMARY KEY (id)
) AUTO_INCREMENT 2 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON managers (created_by);

CREATE INDEX updated_by ON managers (updated_by);

-- Table: manufacture
CREATE TABLE manufacture (
    name varchar(100)  NULL DEFAULT null,
    manufacture_code_id int  NOT NULL,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT manufacture_pk PRIMARY KEY (id)
) AUTO_INCREMENT 2 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX manufacture_code_id ON manufacture (manufacture_code_id);

CREATE INDEX created_by ON manufacture (created_by);

CREATE INDEX updated_by ON manufacture (updated_by);

-- Table: manufacture_code
CREATE TABLE manufacture_code (
    manufacture_1 varchar(100)  NULL DEFAULT null,
    manufacture_2 varchar(100)  NULL DEFAULT null,
    manufacture_3 varchar(100)  NULL DEFAULT null,
    manufacture_4 varchar(100)  NULL DEFAULT null,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT manufacture_code_pk PRIMARY KEY (id)
) AUTO_INCREMENT 5 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON manufacture_code (created_by);

CREATE INDEX updated_by ON manufacture_code (updated_by);

-- Table: medicine
CREATE TABLE medicine (
    name varchar(100)  NOT NULL,
    description varchar(2000)  NOT NULL,
    price varchar(20)  NOT NULL,
    discount varchar(20)  NOT NULL,
    medicine_category_id int  NOT NULL,
    medicine_inventory_id int  NOT NULL,
    manufacture_id int  NOT NULL,
    dose_id int  NOT NULL,
    prescription_status varchar(200)  NULL DEFAULT null,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT medicine_pk PRIMARY KEY (id)
) AUTO_INCREMENT 18 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX medicine_category_id ON medicine (medicine_category_id);

CREATE INDEX medicine_inventory_id ON medicine (medicine_inventory_id);

CREATE INDEX manufacture_id ON medicine (manufacture_id);

CREATE INDEX dose_id ON medicine (dose_id);

CREATE INDEX created_by ON medicine (created_by);

CREATE INDEX updated_by ON medicine (updated_by);

-- Table: medicine_categories
CREATE TABLE medicine_categories (
    name varchar(100)  NOT NULL,
    description varchar(2000)  NOT NULL,
    image_url varchar(200)  NOT NULL,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT medicine_categories_pk PRIMARY KEY (id)
) AUTO_INCREMENT 13 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON medicine_categories (created_by);

CREATE INDEX updated_by ON medicine_categories (updated_by);

-- Table: medicine_inventory
CREATE TABLE medicine_inventory (
    medicine_short_name varchar(20)  NOT NULL,
    current_quantity varchar(10)  NOT NULL,
    id int  NOT NULL AUTO_INCREMENT,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT medicine_inventory_pk PRIMARY KEY (id)
) AUTO_INCREMENT 4 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON medicine_inventory (created_by);

CREATE INDEX updated_by ON medicine_inventory (updated_by);

-- Table: order_items
CREATE TABLE order_items (
    id int  NOT NULL AUTO_INCREMENT,
    order_id int  NOT NULL,
    medicine_id int  NOT NULL,
    amount float  NOT NULL,
    quantity int  NOT NULL,
    CONSTRAINT order_items_pk PRIMARY KEY (id)
) AUTO_INCREMENT 29 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX order_id ON order_items (order_id);

CREATE INDEX medicine_id ON order_items (medicine_id);

-- Table: order_payment
CREATE TABLE order_payment (
    id int  NOT NULL AUTO_INCREMENT,
    payment_method_id int  NOT NULL,
    payment_id varchar(50)  NULL DEFAULT null,
    CONSTRAINT order_payment_pk PRIMARY KEY (id)
) AUTO_INCREMENT 33 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX payment_method_id ON order_payment (payment_method_id);

-- Table: orders
CREATE TABLE orders (
    id int  NOT NULL AUTO_INCREMENT,
    date_created datetime  NOT NULL,
    date_completed datetime  NULL DEFAULT null,
    status varchar(20)  NOT NULL,
    order_payment_id int  NOT NULL,
    amount varchar(20)  NOT NULL,
    delivery_address varchar(1000)  NOT NULL,
    customer_id int  NOT NULL,
    last_updated_date datetime  NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY (id)
) AUTO_INCREMENT 24 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX order_payment_id ON orders (order_payment_id);

CREATE INDEX customer_id ON orders (customer_id);

-- Table: payment_method
CREATE TABLE payment_method (
    id int  NOT NULL AUTO_INCREMENT,
    type varchar(20)  NOT NULL,
    created_by int  NULL DEFAULT null,
    updated_by int  NULL DEFAULT null,
    last_updated_date datetime  NOT NULL,
    date_created datetime  NOT NULL,
    CONSTRAINT payment_method_pk PRIMARY KEY (id)
) AUTO_INCREMENT 3 ENGINE InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE INDEX created_by ON payment_method (created_by);

CREATE INDEX updated_by ON payment_method (updated_by);

-- foreign keys
-- Reference: customers_ibfk_1 (table: customers)
ALTER TABLE customers ADD CONSTRAINT customers_ibfk_1 FOREIGN KEY customers_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: customers_ibfk_2 (table: customers)
ALTER TABLE customers ADD CONSTRAINT customers_ibfk_2 FOREIGN KEY customers_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- Reference: dose_ibfk_1 (table: dose)
ALTER TABLE dose ADD CONSTRAINT dose_ibfk_1 FOREIGN KEY dose_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: dose_ibfk_2 (table: dose)
ALTER TABLE dose ADD CONSTRAINT dose_ibfk_2 FOREIGN KEY dose_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- Reference: managers_ibfk_1 (table: managers)
ALTER TABLE managers ADD CONSTRAINT managers_ibfk_1 FOREIGN KEY managers_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: managers_ibfk_2 (table: managers)
ALTER TABLE managers ADD CONSTRAINT managers_ibfk_2 FOREIGN KEY managers_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- Reference: manufacture_code_ibfk_1 (table: manufacture_code)
ALTER TABLE manufacture_code ADD CONSTRAINT manufacture_code_ibfk_1 FOREIGN KEY manufacture_code_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: manufacture_code_ibfk_2 (table: manufacture_code)
ALTER TABLE manufacture_code ADD CONSTRAINT manufacture_code_ibfk_2 FOREIGN KEY manufacture_code_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- Reference: manufacture_ibfk_1 (table: manufacture)
ALTER TABLE manufacture ADD CONSTRAINT manufacture_ibfk_1 FOREIGN KEY manufacture_ibfk_1 (manufacture_code_id)
    REFERENCES manufacture_code (id);

-- Reference: manufacture_ibfk_2 (table: manufacture)
ALTER TABLE manufacture ADD CONSTRAINT manufacture_ibfk_2 FOREIGN KEY manufacture_ibfk_2 (created_by)
    REFERENCES managers (id);

-- Reference: manufacture_ibfk_3 (table: manufacture)
ALTER TABLE manufacture ADD CONSTRAINT manufacture_ibfk_3 FOREIGN KEY manufacture_ibfk_3 (updated_by)
    REFERENCES managers (id);

-- Reference: medicine_categories_ibfk_1 (table: medicine_categories)
ALTER TABLE medicine_categories ADD CONSTRAINT medicine_categories_ibfk_1 FOREIGN KEY medicine_categories_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: medicine_categories_ibfk_2 (table: medicine_categories)
ALTER TABLE medicine_categories ADD CONSTRAINT medicine_categories_ibfk_2 FOREIGN KEY medicine_categories_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- Reference: medicine_ibfk_1 (table: medicine)
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_1 FOREIGN KEY medicine_ibfk_1 (medicine_category_id)
    REFERENCES medicine_categories (id);

-- Reference: medicine_ibfk_2 (table: medicine)
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_2 FOREIGN KEY medicine_ibfk_2 (medicine_inventory_id)
    REFERENCES medicine_inventory (id);

-- Reference: medicine_ibfk_3 (table: medicine)
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_3 FOREIGN KEY medicine_ibfk_3 (manufacture_id)
    REFERENCES manufacture (id);

-- Reference: medicine_ibfk_4 (table: medicine)
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_4 FOREIGN KEY medicine_ibfk_4 (dose_id)
    REFERENCES dose (id);

-- Reference: medicine_ibfk_5 (table: medicine)
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_5 FOREIGN KEY medicine_ibfk_5 (created_by)
    REFERENCES managers (id);

-- Reference: medicine_ibfk_6 (table: medicine)
ALTER TABLE medicine ADD CONSTRAINT medicine_ibfk_6 FOREIGN KEY medicine_ibfk_6 (updated_by)
    REFERENCES managers (id);

-- Reference: medicine_inventory_ibfk_1 (table: medicine_inventory)
ALTER TABLE medicine_inventory ADD CONSTRAINT medicine_inventory_ibfk_1 FOREIGN KEY medicine_inventory_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: medicine_inventory_ibfk_2 (table: medicine_inventory)
ALTER TABLE medicine_inventory ADD CONSTRAINT medicine_inventory_ibfk_2 FOREIGN KEY medicine_inventory_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- Reference: order_items_ibfk_1 (table: order_items)
ALTER TABLE order_items ADD CONSTRAINT order_items_ibfk_1 FOREIGN KEY order_items_ibfk_1 (order_id)
    REFERENCES orders (id);

-- Reference: order_items_ibfk_2 (table: order_items)
ALTER TABLE order_items ADD CONSTRAINT order_items_ibfk_2 FOREIGN KEY order_items_ibfk_2 (medicine_id)
    REFERENCES medicine (id);

-- Reference: order_payment_ibfk_2 (table: order_payment)
ALTER TABLE order_payment ADD CONSTRAINT order_payment_ibfk_2 FOREIGN KEY order_payment_ibfk_2 (payment_method_id)
    REFERENCES payment_method (id);

-- Reference: orders_ibfk_2 (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_ibfk_2 FOREIGN KEY orders_ibfk_2 (order_payment_id)
    REFERENCES order_payment (id);

-- Reference: orders_ibfk_3 (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_ibfk_3 FOREIGN KEY orders_ibfk_3 (customer_id)
    REFERENCES customers (id);

-- Reference: payment_method_ibfk_1 (table: payment_method)
ALTER TABLE payment_method ADD CONSTRAINT payment_method_ibfk_1 FOREIGN KEY payment_method_ibfk_1 (created_by)
    REFERENCES managers (id);

-- Reference: payment_method_ibfk_2 (table: payment_method)
ALTER TABLE payment_method ADD CONSTRAINT payment_method_ibfk_2 FOREIGN KEY payment_method_ibfk_2 (updated_by)
    REFERENCES managers (id);

-- End of file.

