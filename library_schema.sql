-- library_schema.sql
-- A complete Library Management System schema in MySQL

-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- ======================
-- Table: Users
-- ======================
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    membership_date DATE NOT NULL
);

-- ======================
-- Table: Authors
-- ======================
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

-- ======================
-- Table: Categories
-- ======================
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- ======================
-- Table: Books
-- ======================
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    publish_year INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- ==============================
-- Table: BookAuthors (M:M)
-- ==============================
CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- ======================
-- Table: Loans
-- ======================
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- ======================
-- END OF SCHEMA
-- ======================
