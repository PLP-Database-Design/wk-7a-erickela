-- Question 1: Achieving 1NF (First Normal Form)
-- Solution: Separate each product into a new row.

-- Step 1: Create a new table following 1NF principles
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Step 2: Insert the data properly, with one product per row
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');

-- Now each record represents a single product per order (1NF achieved).



-- Question 2: Achieving 2NF (Second Normal Form)
-- Problem: CustomerName depends only on OrderID, not OrderID+Product.

-- Solution: Split into two tables:
-- 1. Orders table: holds OrderID and CustomerName
-- 2. OrderDetails table: holds OrderID, Product, Quantity

-- Step 1: Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Step 2: Insert the data into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES (101, 'John Doe');
INSERT INTO Orders (OrderID, CustomerName) VALUES (102, 'Jane Smith');
INSERT INTO Orders (OrderID, CustomerName) VALUES (103, 'Emily Clark');

-- Step 3: Create the OrderDetails table
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert the data into OrderDetails_2NF
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);

-- Now, CustomerName depends only on OrderID and Product depends fully on OrderID + Product.
-- Thus, 2NF is achieved!

