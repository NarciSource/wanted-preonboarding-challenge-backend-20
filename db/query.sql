-- 삭제 초기화
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Users;

-- 외래 키 지원 활성
PRAGMA foreign_keys = ON;

-- 유저 테이블
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password INTEGER NOT NULL
);

-- 유저 삽입
INSERT INTO Users (Username, Password) VALUES ('user', 'pswd');
INSERT INTO Users (Username, Password) VALUES ('tester', 'pswd');

-- 제품 테이블
CREATE TABLE Products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    seller_id TEXT NOT NULL,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    amount INT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('Available', 'Reserved', 'SoldOut')),
    FOREIGN KEY (seller_id) REFERENCES Users(id)
);

-- 주문 테이블
CREATE TABLE Orders (
    customer_id INT,
    product_id INT,
    status TEXT NOT NULL CHECK (status IN ('Reserved', 'Approval', 'Confirm')),
    PRIMARY KEY (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES Users(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);