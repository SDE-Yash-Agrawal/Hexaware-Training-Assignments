Create Database TechShop;

use TechShop;

CREATE TABLE Customers(
CustomerID INT Identity(1,1) PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(100)NOT NULL,
Phone VARCHAR(10),
Address VARCHAR(255) NOT NULL
);


CREATE TABLE Products(
ProductID INT PRIMARY KEY Identity(101, 1),
ProductName Varchar(100) NOT NULL,
Description Varchar(MAX), --(MAX) value is used to provide maximum limit!
Price DECIMAL(10, 2) NOT NULL);

CREATE TABLE Orders(
OrderID int identity(301, 1) Primary key,
CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID),
OrderDate date NOT NULL,
TotalAmount Decimal(15, 2) Not null
);

CREATE TABLE OrderDetails(
OrderDetailID int identity(501, 1) Primary key,
OrderID int Foreign Key References Orders(OrderID),
ProductID int Foreign Key References Products(ProductId),
Quantity int Not Null
);

CREATE TABLE Inventory(
InventoryID int identity(1001, 1) Primary Key,
ProductID int Foreign Key References Products(ProductID),
QuantityInStock int Not null,
LastStockUpdate date not null
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Yash', 'Agrawal', 'sde.yash.agrawal@gmail.com', '6263605498', '106, Gupta Colony, Mhow, Madhya Pradesh'),
('Khushi', 'Joshi', 'khushijoshi0129@gmail.com', '8765432109', '456, Collectorate, Indore, Madhya Pradesh'),
('Suresh', 'Patel', 'sureshpatel@gmail.com', '7654321098', '789, Old City, Jaipur, Rajasthan'),
('Dinesh', 'Verma', 'dineshverma@gmail.com', '6543210987', '1011, New Colony, Delhi, Delhi'),
('Rajesh', 'Singh', 'rajeshsingh@gmail.com', '5432109876', '1234, Model Town, Mumbai, Maharashtra'),
('Ganesh', 'Kumar', 'ganeshkumar@ gmail.com', '4321098765', '5678, Banjara Hills, Hyderabad, Telangana'),
('Mahesh', 'Tiwari', 'maheshtiwari@ gmail.com', '3210987654', '9012, Indiranagar, Bengaluru, Karnataka'),
('Narendra', 'Mishra', 'narendramishra@ gmail.com', '2109876543', '1314, Salt Lake City, Kolkata, West Bengal'),
('Pradeep', 'Chauhan', 'pradeepchauhan@ gmail.com', '1098765432', '1516, Beach Road, Chennai, Tamil Nadu'),
('Sanjeev', 'Bhatt', 'sanjeevbhatt@ gmail.com', '9876543210', '1718, MG Road, Kochi, Kerala');

INSERT INTO Products (ProductName, Description, Price) VALUES
('iPhone 16 Pro', '6.1-inch Super Retina XDR display, A16 Bionic chip, 12MP dual camera system', 139999.00),
('Samsung Galaxy S24 Ultra', '6.8-inch Dynamic AMOLED 2X display, Snapdragon 8 Gen 2, 200MP camera', 89999.00),
('OnePlus 11', '6.7-inch Fluid AMOLED display, Snapdragon 8 Gen 2, 50MP camera', 59999.00),
('Xiaomi 13 Pro', '6.7-inch AMOLED display, Snapdragon 8 Gen 2, 50MP camera', 49999.00),
('Google Pixel 7 Pro', '6.7-inch LTPO OLED display, Google Tensor G2, 50MP camera', 84999.00),
('MacBook Pro M2', '13.3-inch Liquid Retina XDR display, M2 chip, 8GB RAM, 256GB SSD', 149999.00),
('Dell XPS 13', '13.4-inch InfinityEdge display, Intel Core i7-13700H, 16GB RAM, 512GB SSD', 119999.00),
('Lenovo ThinkPad X1 Carbon', '14-inch OLED display, Intel Core i7-13600H, 16GB RAM, 512GB SSD', 109999.00),
('HP Spectre x360', '13.3-inch AMOLED display, Intel Core i7-13600H, 16GB RAM, 512GB SSD', 129999.00),
('Acer Predator Helios 16', '16-inch IPS display, Intel Core i9-13900HX, 32GB RAM, 2TB SSD', 179999.00);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-11-25', 139999.00),
(2, '2023-12-01', 89999.00),
(3, '2023-12-10', 59999.00),
(4, '2023-12-15', 49999.00),
(5, '2023-12-20', 149999.00),
(6, '2023-12-25', 84999.00),
(7, '2024-01-01', 119999.00),
(8, '2024-01-05', 109999.00),
(9, '2024-01-10', 179999.00),
(10, '2024-01-15', 129999.00),
(2, '2024-01-25', 84999.00),
(9, '2024-02-01', 129999.00),
(3, '2024-02-05', 139999.00),
(7, '2024-02-10', 179999.00),
(10, '2024-02-15', 59999.00);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(301, 101, 1),
(302, 102, 1),
(303, 103, 1),
(304, 104, 1),
(305, 106, 1),
(306, 105, 1),
(307, 107, 1),
(308, 108, 1),
(309, 110, 1),
(310, 109, 1),
(311, 105, 1),
(312, 109, 1),
(313, 101, 1),
(314, 110, 1),
(315, 103, 1);

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(101, 10, '2023-12-31'),
(102, 15, '2023-12-31'),
(103, 20, '2023-12-31'),
(104, 5, '2023-12-31'),
(105, 8, '2023-12-31'),
(106, 12, '2023-12-31'),
(107, 7, '2023-12-31'),
(108, 11, '2023-12-31'),
(109, 6, '2023-12-31'),
(110, 9, '2023-12-31');

-- Task - 2

Select FirstName, LastName, Email from Customers;


Select OrderDate, FirstName, LastName from Orders, Customers Where Orders.CustomerID = Customers.CustomerID;


Insert Into Customers Values ('Rajarshi', 'Pathak', 'rajarshipathak@gmail.com', '9926900646', 'Photi Koti, Indore, Madhya Pradesh');


Update Products SET Price = Price * 1.10;


Declare @OID int = 304;
Delete From OrderDetails Where OrderID = @OID;
Delete From Orders Where OrderID = @OID;


Insert Into Orders Values('4', '2024-02-20', 139999.00);
Insert Into OrderDetails Values(316, 101, 1);


Declare @Cid int = 6, @Email varchar(100) = 'ganeshkumar10@gmail.com';
Update Customers SET Email = @Email Where CustomerID = @Cid;


Update Orders Set TotalAmount = (Select (od.Quantity * p.Price) 
From OrderDetails od join Products p on p.ProductID = od.ProductID 
Where Orders.OrderID = od.OrderID);


Declare @CustID int = 9;
Delete from OrderDetails where OrderID IN (Select OrderID from Orders where CustomerID = @CustID)
Delete from Orders where CustomerID = @CustID;


Insert into Products Values ('Apple Watch Series 9', 
'Apple Watch Series 9 is a cutting-edge smartwatch designed 
to seamlessly integrate with the Apple ecosystem. It features 
a sleek and durable design with an always-on Retina display 
that offers vivid colors and exceptional brightness.', 25000.00);


Alter Table Orders ADD Status varchar(50);
Update Orders Set Status = 'Pending' where OrderId = 301;
Update Orders Set Status = 'Shipped' where OrderId = 302;
Update Orders Set Status = 'Pending' where OrderId = 303;
Update Orders Set Status = 'Delivered' where OrderId = 305;
Update Orders Set Status = 'Shipped' where OrderId = 306;
Update Orders Set Status = 'Shipped' where OrderId = 307;
Update Orders Set Status = 'Delivered' where OrderId = 308;
Update Orders Set Status = 'Pending' where OrderId = 310;
Update Orders Set Status = 'Cancelled' where OrderId = 311;
Update Orders Set Status = 'Shipped' where OrderId = 313;
Update Orders Set Status = 'Pending' where OrderId = 314;
Update Orders Set Status = 'Shipped' where OrderId = 315;
Update Orders Set Status = 'Cancelled' where OrderId = 316;
Declare @Orderid int = 303;
Update Orders Set Status = 'Shipped' where OrderID = Orderid;


Alter Table Customers ADD OrderCount INT Default 0;
Update Customers Set OrderCount = (
Select Count(*) from Orders where Orders.CustomerID = Customers.CustomerID);

-- Task 3

Select C.CustomerID, concat(C.FirstName,' ',C.LastName) as Name, 
C.Phone, O.OrderID, O.OrderDate, O.TotalAmount, O.Status from 
Customers C, Orders O Where C.CustomerID = O.CustomerID order by C.CustomerID;


Select Products.ProductName, Sum(OrderDetails.Quantity * Products.Price) 
As TotalRevenue From Products, OrderDetails Where 
Products.ProductID = OrderDetails.ProductID Group by Products.ProductName;


Select concat(C.FirstName,' ',C.LastName) as Name, 
C.Phone, C.Email from Customers C, Orders O Where C.CustomerID = 
O.CustomerID Group by C.FirstName, C.LastName, C.Phone, C.Email;


Select TOP 1 Products.ProductName, Count(*) As HighestQuantity from Products,  
OrderDetails Where OrderDetails.ProductID = Products.ProductID Group by 
Products.ProductName Order By HighestQuantity Desc;


Alter Table Products ADD Category Varchar(100);
Update Products Set Category = 'Smartphones' Where ProductID IN (101, 102,104, 105, 103);
Update Products Set Category = 'Laptops' Where ProductID IN (106, 107, 108, 109, 110);
Update Products Set Category = 'Smartwatches' Where ProductID = 111;


Select Concat(Customers.FirstName, ' ', Customers.LastName) As Name, 
AVG(Orders.TotalAmount) As AverageOfTotalAmount From Orders, Customers 
Where Customers.CustomerID = Orders.CustomerID 
Group By Customers.FirstName, Customers.LastName;


Select TOP 1 C.CustomerID, C.FirstName, C.LastName, C.Phone, C.Address, O.TotalAmount As 
TotalRevenue from Customers C, Orders O Where C.CustomerID = O.CustomerID order by TotalRevenue desc;


Select Products.ProductName, Count(OrderDetails.ProductID) As ProductCount 
From Products Left Join OrderDetails on OrderDetails.ProductID = Products.ProductID 
Group By Products.ProductName Order by ProductCount desc;


declare @pname varchar(100) = 'OnePlus 11';
Select C.CustomerID, Concat(C.FirstName, ' ', C.LastName) AS Name, C.Email, 
C.Phone, P.ProductName from Customers C Join Orders O on C.CustomerID = O.CustomerID
Join OrderDetails Od on O.OrderID = Od.OrderID Join Products P on P.ProductID = Od.ProductID where P.ProductName = @pname;


declare @Start_Date Date = '2024-01-01', @End_Date Date = '2024-01-26';
Select Sum(TotalAmount) as TotalRevenue from Orders Where OrderDate Between @Start_Date and @End_Date;

-- Task 4

Select CustomerId, Concat(FirstName, ' ', LastName) As Name, Email, Phone, Address from Customers Where OrderCount = 0;


Select Sum(QuantityInStock) As TotalProductForSale from Inventory;


Select Sum(TotalAmount) AS TotalRevenue from Orders Where Status IN ('Delivered');


Declare @Cat Varchar(50) = 'Smartphones';
Select P.Category, AVG(Od.Quantity) AS AverageQuantity from 
OrderDetails Od Join Products P ON Od.ProductID = 
P.ProductID Where P.Category = @Cat Group By P.Category;


Declare @CustomID int = 3;
Select Customers.CustomerID, Concat(Customers.FirstName, ' ', Customers.LastName), 
Customers.OrderCount, Sum(Orders.TotalAmount) As TotalRevenue 
From Customers Join Orders on Customers.CustomerID = 
Orders.CustomerID Where Customers.CustomerID = @CustomID 
Group By Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.OrderCount;


Select Concat(FirstName, ' ', LastName) As Name, 
OrderCount As Number_of_Orders_Placed from Customers 
Where OrderCount = (Select Max(OrderCount) From Customers);


select TOP 1 Products.Category, Sum(OrderDetails.Quantity)
As TotalQuantity From Products, OrderDetails Where 
Products.ProductID = OrderDetails.ProductID Group by 
Products.Category Order by TotalQuantity Desc;


Select TOP 1 Concat(Customers.FirstName, ' ', Customers.LastName)
AS Name, Sum(Orders.TotalAmount) AS Total_Revenue From Customers, 
Orders Where Customers.CustomerID = Orders.CustomerID Group By 
Customers.FirstName, Customers.LastName Order By Total_Revenue Desc;


Select Concat(Customers.FirstName, ' ', Customers.LastName)
AS Name, AVG(Orders.TotalAmount) AS Average_Revenue 
From Customers, Orders Where Customers.CustomerID = 
Orders.CustomerID Group By Customers.FirstName, 
Customers.LastName Order By Average_Revenue Desc;


Select Concat(FirstName, ' ', LastName) AS Name, 
OrderCount From Customers Order By OrderCount Desc;

select * from Customers;

select * from Orders;
select * from OrderDetails;
select * from Products;
select * from Inventory;
select * from Customers;
