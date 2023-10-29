﻿CREATE
DATABASE CSDL
GO

USE CSDL
GO

------------------------------

-- CREATE TABLE

CREATE TABLE USERS
(
    ID            CHAR(100) PRIMARY KEY,
    AVARTAR       IMAGE,
    USERNAME      NVARCHAR(100),
    EMAIL         NVARCHAR(100),
    PHONE         CHAR(10),
    USER_PASSWORD NVARCHAR(100),
    ACCESS        NVARCHAR(50),
    CHECK (PHONE LIKE '[0-9]*10'),
    CHECK (USERNAME NOT LIKE '%[! ”%#$&”()*+,-./:;<=>?@]%')
)

CREATE TABLE ACCESS_LEVELS
(
    ID         INT PRIMARY KEY,
    LEVEL_NAME NVARCHAR(100)
)

CREATE TABLE VERTIFI_EMAIL
(
    ID           CHAR(100),
    CODE         CHAR(10),
    EXPIRED_TIME TIME
)

CREATE TABLE PRODUCTS
(
    ID         CHAR(100) PRIMARY KEY,
    NAME_PD    NVARCHAR(200),
    METERIAL   NVARCHAR(200),
    DIMENSION  NVARCHAR(200),
    IMAGE_MAIN IMAGE,
    KIND       NVARCHAR(200),
    TRADEMARK  NVARCHAR(200),
    DECRIPTION NVARCHAR(500),
    AMOUNT     INT,
    COLOR      NVARCHAR(200),
    CHECK (AMOUNT >= 0)
)

CREATE TABLE BRAND
(
    ID         CHAR(100) PRIMARY KEY,
    NAME_BRAND VARCHAR(200),
    ORIGIN     VARCHAR(200)
)

CREATE TABLE ORDERS
(
    ID           CHAR(100) PRIMARY KEY,
    ID_USER      CHAR(100),
    DATE_ORDER   DATE,
    DATE_RECEIPT DATE,
    STATUS_ORDER VARCHAR(200),
    CHECK (STATUS_ORDER IN ('Đang giao', 'Bị hủy', 'Hoàn thành'))
)

CREATE TABLE DETAIL_ORDERS
(
    ID         CHAR(100),
    ID_PRODUCT CHAR(100),
    AMOUNT     INT,
    PRICE      FLOAT,
    PRIMARY KEY (ID, ID_PRODUCT),
    CHECK (AMOUNT >= 0),
    CHECK (PRICE >= 0)
)

CREATE TABLE WISH_LIST
(
    ID_USER    CHAR(100),
    ID_PRODUCT CHAR(100),
    PRIMARY KEY (ID_USER, ID_PRODUCT)
)

CREATE TABLE VOUCHERS
(
    ID_VOUCHER       CHAR(100) PRIMARY KEY,
    PERCENT_DECREASE FLOAT
)

CREATE TABLE APPLY_VOUCHER
(
    ID_VOUCHER CHAR(100),
    ID_PRODUCT CHAR(100),
    CONDITION  CHAR(100),
    PRIMARY KEY (ID_VOUCHER, ID_PRODUCT)
)

CREATE TABLE CONDITION
(
    ID     CHAR(100),
    DETAIL VARCHAR(100)
)

CREATE TABLE MANAGEMENT_VOUCHER
(
    ID_USER    CHAR(100),
    ID_VOUCHER CHAR(100),
    STATUS     VARCHAR(100),
    PRIMARY KEY (ID_USER, ID_VOUCHER)
)
    GO

-- Thiết lập khóa ngoại
-- Thiết lập khóa tới User
ALTER TABLE ACCESS_LEVEL
    ADD FOREIGN KEY (ID) REFERENCES USERS (ID)
ALTER TABLE VERTIFI_EMAIL
    ADD FOREIGN KEY (ID) REFERENCES USERS (ID)
ALTER TABLE CART
    ADD FOREIGN KEY (ID) REFERENCES USERS (ID)
ALTER TABLE ORDERS
    ADD FOREIGN KEY (ID_USER) REFERENCES USERS (ID)
ALTER TABLE MANAGEMENT_VOUCHER
    ADD FOREIGN KEY (ID_USER) REFERENCES USERS (ID)
ALTER TABLE WISH_LIST
    ADD FOREIGN KEY (ID_USER) REFERENCES USERS (ID)

-- Thiết lập khóa ngoại tới Product
ALTER TABLE WISH_LIST
    ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID)
ALTER TABLE CART
    ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID)
ALTER TABLE OWN
    ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID)
ALTER TABLE APPLY_VOUCHER
    ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID)
ALTER TABLE DETAIL_ORDER
    ADD FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID)

-- Thiết lập khóa ngoại tới Brand
ALTER TABLE OWN
    ADD FOREIGN KEY (ID_BRAND) REFERENCES BRAND (ID)

-- Thiết lập khóa ngoại tới Order
ALTER TABLE DETAIL_ORDER
    ADD FOREIGN KEY (ID) REFERENCES ORDERS (ID)

-- Thiết lập khóa ngoại tới Voucher
ALTER TABLE MANAGEMENT_VOUCHER
    ADD FOREIGN KEY (ID_VOUCHER) REFERENCES VOUCHERS (ID)
ALTER TABLE APPLY_VOUCHER
    ADD FOREIGN KEY (ID_VOUCHER) REFERENCES VOUCHERS (ID)

-- Thiết lập khóa ngoại tới Apply Voucher
ALTER TABLE MANAGEMENT_VOUCHER
    ADD FOREIGN KEY (ID_VOUCHER) REFERENCES VOUCHERS (ID)

-- Thiết lập khóa ngoại tới Condition
ALTER TABLE APPLY_VOUCHER
    ADD FOREIGN KEY (CONDITION) REFERENCES CONDITION (ID)

-----------------------------