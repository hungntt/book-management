USE keepbook;

DROP TABLE IF EXISTS AUTHOR_WRITE;
DROP TABLE IF EXISTS STORE_SELL;
DROP TABLE IF EXISTS BOOK_CATEGORIES;
DROP TABLE IF EXISTS LIBRARY;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS STATUS;
DROP TABLE IF EXISTS BOOK;
DROP TABLE IF EXISTS PUBLISHER;
DROP TABLE IF EXISTS AUTHOR;
DROP TABLE IF EXISTS STORE;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS ACCOUNT;



CREATE TABLE PUBLISHER
(
    id   INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE BOOK
(
    isbn         VARCHAR(13) UNIQUE NOT NULL,
    title        VARCHAR(100)       NOT NULL,
    publisher_id INT                NOT NULL,
    publish_date DATE,
    price        INT,
    PRIMARY KEY (isbn),
    FOREIGN KEY (publisher_id) REFERENCES PUBLISHER (id) ON DELETE CASCADE
);

CREATE TABLE AUTHOR
(
    id      INT AUTO_INCREMENT,
    fname   VARCHAR(30) NOT NULL,
    lname   VARCHAR(30),
    country VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE AUTHOR_WRITE
(
    author_id INT         NOT NULL,
    book_isbn VARCHAR(13) NOT NULL,
    PRIMARY KEY (author_id, book_isbn),
    FOREIGN KEY (author_id) REFERENCES AUTHOR (id),
    FOREIGN KEY (book_isbn) REFERENCES BOOK (isbn)
);



CREATE TABLE STORE
(
    id      INT AUTO_INCREMENT,
    name    VARCHAR(20),
    website VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE STORE_SELL
(
    store_id  INT NOT NULL,
    book_isbn VARCHAR(13),
    PRIMARY KEY (store_id, book_isbn),
    FOREIGN KEY (store_id) REFERENCES STORE (id),
    FOREIGN KEY (book_isbn) REFERENCES BOOK (isbn)
);

CREATE TABLE CATEGORIES
(
    id   INT AUTO_INCREMENT,
    name VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE BOOK_CATEGORIES
(
    categories_id INT,
    book_isbn     VARCHAR(13),
    FOREIGN KEY (categories_id) REFERENCES CATEGORIES (id),
    FOREIGN KEY (book_isbn) REFERENCES BOOK (isbn)
);

CREATE TABLE ACCOUNT
(
    id          INT AUTO_INCREMENT,
    ACCOUNTname VARCHAR(20) UNIQUE NOT NULL,
    password    VARCHAR(128)       NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE LIBRARY
(
    id         INT AUTO_INCREMENT,
    name       VARCHAR(30),
    account_id INT,
    book_isbn  VARCHAR(13),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES ACCOUNT (id),
    FOREIGN KEY (book_isbn) REFERENCES BOOK (isbn),
    UNIQUE (id, account_id)
);

CREATE TABLE REVIEW
(
    review     VARCHAR(2000),
    rating     INT(1),
    account_id INT,
    book_isbn  VARCHAR(13),
    timestamp  TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES ACCOUNT (id) ON DELETE CASCADE,
    FOREIGN KEY (book_isbn) REFERENCES BOOK (isbn) ON DELETE CASCADE,
    PRIMARY KEY (account_id, book_isbn)
);

CREATE TABLE STATUS
(
    status     VARCHAR(20),
    account_id INT,
    book_isbn  VARCHAR(13),
    FOREIGN KEY (account_id) REFERENCES ACCOUNT (id) ON DELETE CASCADE,
    FOREIGN KEY (book_isbn) REFERENCES BOOK (isbn) ON DELETE CASCADE,
    PRIMARY KEY (account_id, book_isbn)
);
INSERT INTO PUBLISHER(name)
VALUES ('Nha Nam');

INSERT INTO BOOK(ISBN, TITLE, PUBLISHER_ID, PUBLISH_DATE, PRICE)
VALUES ('1234567890123', 'Laplace', '1', '2018-01-01', '32000');

/*CREATE TABLE TEACH
(
    module   INT,
    lecturer INT,
    FOREIGN KEY (module) REFERENCES MODULE (id) ON DELETE CASCADE,
    FOREIGN KEY (lecturer) REFERENCES LECTURER (account) ON DELETE CASCADE,
    PRIMARY KEY (module, lecturer)
);

CREATE TABLE ENROLL
(
    student INT,
    module  INT,
    FOREIGN KEY (student) REFERENCES STUDENT (account) ON DELETE CASCADE,
    FOREIGN KEY (module) REFERENCES MODULE (id) ON DELETE CASCADE,
    PRIMARY KEY (student, module)
);
*/