-- task_2.sql
-- Create database and select it
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Drop tables to prevent foreign key conflicts
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;

-- ----------------------------------------------------
-- Table: Authors
-- ----------------------------------------------------
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    birth_date DATE
);

-- Sample data for Authors
INSERT INTO Authors (author_name, birth_date) VALUES
('J.K. Rowling', '1965-07-31'),
('George R.R. Martin', '1948-09-20'),
('Agatha Christie', '1890-09-15');

-- ----------------------------------------------------
-- Table: Books
-- ----------------------------------------------------
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    price DECIMAL(8,2) NOT NULL,
    published_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Sample data for Books
INSERT INTO Books (title, author_id, genre, price, published_date) VALUES
('Harry Potter and the Philosopher\'s Stone', 1, 'Fantasy', 20.00, '1997-06-26'),
('A Game of Thrones', 2, 'Fantasy', 25.00, '1996-08-06'),
('Murder on the Orient Express', 3, 'Mystery', 15.00, '1934-01-01');

-- ----------------------------------------------------
-- Table: Customers
-- ----------------------------------------------------
-- Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);


-- Sample data for Customers
INSERT INTO Customers (customer_name, email, phone, address) VALUES
('John Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
('Jane Smith', 'jane.smith@example.com', '0987654321', '456 Elm St');

-- ----------------------------------------------------
-- Table: Orders
-- ----------------------------------------------------
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Sample data for Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-08-01', 35.00),
(2, '2025-08-05', 25.00);

-- ----------------------------------------------------
-- Table: Order_Details
-- ----------------------------------------------------
CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Sample data for Order_Details
INSERT INTO Order_Details (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 20.00),
(1, 3, 1, 15.00),
(2, 2, 1, 25.00);
