-- Create the Branch table
CREATE TABLE Branch (
    BranchNo VARCHAR PRIMARY KEY,
    BranchName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);


INSERT INTO Branch (BranchNo, BranchName, Location)
VALUES 
('1', 'Downtown', 'Main Street'),
( '2','Uptown', 'High Street'),
('3','Midtown', 'Center Avenue'),
('4','Eastside', 'East Road'),
('5','Westside', 'West Road'),
('6', 'Northside', 'North Boulevard');

-- Create the Staff table
CREATE TABLE Staff (
StaffID INT PRIMARY KEY,
Name VARCHAR(25) NOT NULL,
Contact VARCHAR(25) NOT NULL
   
);

INSERT INTO Staff (StaffID, Name, Contact)
VALUES 
('1', 'Alice Johnson', '555-1234'),
('2', 'Bob Smith', '555-5678'),
('3', 'Charlie Brown', '555-9101'),
('4', 'Diana Prince', '555-1213'), 
('5', 'Evan Peters', '555-1415'), 
('6', 'James Clark', '555-1617'); 
--1
CREATE TABLE BranchServices (
ServiceID INT PRIMARY KEY,
BranchNo VARCHAR(10),
ServiceName VARCHAR(100),
Description TEXT,
FOREIGN KEY (BranchNo) REFERENCES Branch(BranchNo) ON DELETE CASCADE
);


INSERT INTO BranchServices (ServiceID, BranchNo, ServiceName, Description) VALUES
('1', 'B001', 'Property Appraisal', 'Professional appraisal of property value.'),
('2','B002', 'Mortgage Assistance', 'Guidance on mortgage processes.'),
('3','B001', 'Customer Support', 'Helpdesk for property inquiries.'),
('4','B003', 'Property Inspection', 'On-site property inspections.'),
('5','B002', 'Legal Assistance', 'Support with legal documentation.'),
('6','B004', 'Marketing Services', 'Property advertisement and promotions.');

--2
ALTER TABLE Staff
ADD Department VARCHAR(50) CHECK (Department IN ('Sales', 'PR', 'IT'));


DELETE FROM BranchServices
WHERE ServiceName = 'Mortgage Assistance';

--SECTION B


--5
SELECT Name, contact FROM Staff WHERE Department = 'Sales';

CREATE TABLE Property ( 
PropertyNo INT PRIMARY KEY,
Rent INT NOT NULL 
, PropertyName VARCHAR(255) NOT NULL );

INSERT INTO Property (PropertyNo, Rent, PropertyName) 
VALUES 
('1', '200', 'Green Villa'), 
('2', '250', 'Blue Apartment'), 
('3', '300', 'Red House'), 
('4', '450', 'Yellow Cottage'), 
('5', '600', 'Purple Bungalow'), 
('6','750', 'White Studio');

--6
SELECT PropertyNo, Rent
FROM Property
WHERE Rent > 360
ORDER BY Rent DESC;
--7
SELECT PropertyNo, Rent
FROM Property
WHERE Rent BETWEEN 400 AND 600;

--8
SELECT Name
FROM Staff
WHERE Name LIKE 'J%';

--9
SELECT PropertyNo, Rent, Rent * 12 AS "Annual Rent"
FROM Property;

-- Alter the Property table to add ManagerID column
ALTER TABLE Property
ADD ManagerID INT;

-- Update existing records to include sample ManagerID values
UPDATE Property SET ManagerID = '1' WHERE PropertyNo = '1';
UPDATE Property SET ManagerID = '2' WHERE PropertyNo = '2';
UPDATE Property SET ManagerID = '3' WHERE PropertyNo = '3';
UPDATE Property SET ManagerID = '4' WHERE PropertyNo = '4';
UPDATE Property SET ManagerID = '5' WHERE PropertyNo = '5';
UPDATE Property SET ManagerID = '6' WHERE PropertyNo = '6';

ALTER TABLE property
add PropertyDetails varchar(50);
UPDATE Property SET PropertyDetails = 'Villa' WHERE PropertyNo = '1';
UPDATE Property SET PropertyDetails = 'Apartment' WHERE PropertyNo = '2';
UPDATE Property SET PropertyDetails = 'House' WHERE PropertyNo = '3';
UPDATE Property SET PropertyDetails = 'Cottage' WHERE PropertyNo = '4';
UPDATE Property SET PropertyDetails = 'Bungalow' WHERE PropertyNo = '5';
UPDATE Property SET PropertyDetails = 'Studio' WHERE PropertyNo = '6';

-- Alter the Staff table to add Salary column
ALTER TABLE Staff
ADD Salary INT;


UPDATE Staff SET Salary = '50000' WHERE StaffID = '1';
UPDATE Staff SET Salary = '55000' WHERE StaffID = '2';
UPDATE Staff SET Salary = '60000' WHERE StaffID = '3';
UPDATE Staff SET Salary = '52000' WHERE StaffID = '4';
UPDATE Staff SET Salary = '58000' WHERE StaffID = '5';
UPDATE Staff SET Salary = '54000' WHERE StaffID = '6';

SELECT Property.PropertyNo, PropertyDetails
FROM Property
JOIN Staff ON Property.ManagerID = Staff.StaffID
WHERE Staff.Salary > (SELECT AVG(Salary) FROM Staff);


-- Alter the Staff table to add BranchNo column
ALTER TABLE Staff
ADD BranchNo varchar(50);

-- Alter the Staff table to add a foreign key constraint for BranchNo
ALTER TABLE Staff
ADD CONSTRAINT FK_BranchNo FOREIGN KEY (BranchNo) REFERENCES Branch(BranchNo);

SELECT BranchNo, COUNT(*) AS StaffCount
FROM Staff
GROUP BY BranchNo;
-- Alter the Property table to add BranchNo column
ALTER TABLE Property
ADD BranchNo VARCHAR(50);


ALTER TABLE Property
ADD CONSTRAINT FK_Property_Branch FOREIGN KEY (BranchNo) REFERENCES Branch(BranchNo);

--  update existing records to include sample BranchNo values
UPDATE Property SET BranchNo = '1' WHERE PropertyNo = '1';
UPDATE Property SET BranchNo = '2' WHERE PropertyNo = '2';
UPDATE Property SET BranchNo = '3' WHERE PropertyNo = '3';
UPDATE Property SET BranchNo = '4' WHERE PropertyNo = '4';
UPDATE Property SET BranchNo = '5' WHERE PropertyNo = '5';
UPDATE Property SET BranchNo = '6' WHERE PropertyNo = '6';

--12
SELECT BranchNo, COUNT(*) AS PropertyCount
FROM Property
GROUP BY BranchNo
HAVING COUNT(*) > 3;

--13
SELECT BranchNo, COUNT(*) AS PropertyCount
FROM Property
GROUP BY BranchNo
HAVING COUNT(*) > 2
ORDER BY PropertyCount DESC;

ALTER TABLE Property
ADD PropertyAddress varchar(50);
UPDATE Property SET PropertyAddress = 'Main St' WHERE PropertyNo = '1';
UPDATE Property SET PropertyAddress = 'High St' WHERE PropertyNo = '2';
UPDATE Property SET PropertyAddress = 'Center Ave' WHERE PropertyNo = '3';
UPDATE Property SET PropertyAddress = 'East Rd' WHERE PropertyNo = '4';
UPDATE Property SET PropertyAddress = 'West Rd' WHERE PropertyNo = '5';
UPDATE Property SET PropertyAddress = 'North Blvd' WHERE PropertyNo = '6';



--SECTION C
--14
SELECT Property.PropertyNo, PropertyAddress, Staff.Name
FROM Property
JOIN Staff ON Property.ManagerID = Staff.StaffID;
--15
SELECT Branch.BranchNo, Staff.Name
FROM Branch
LEFT JOIN Staff ON Branch.BranchNo = Staff.BranchNo
UNION
SELECT NULL, Staff.Name
FROM Staff
WHERE Staff.BranchNo IS NULL;
--16
SELECT Branch.BranchNo, BranchServices.ServiceName
FROM Branch
LEFT JOIN BranchServices ON Branch.BranchNo = BranchServices.BranchNo;

--17
SELECT *
FROM Branch, Staff;

--18
SELECT Staff.Name, Property.PropertyNo, Property.Rent
FROM Staff
JOIN Property ON Staff.StaffID = Property.ManagerID
WHERE Staff.Salary > Property.Rent;





-- Alter the Branch table to add Address column
ALTER TABLE Branch
ADD Address VARCHAR(255);

UPDATE Branch SET Address = 'Main St' WHERE BranchNo = '1';
UPDATE Branch SET Address = 'High St' WHERE BranchNo = '2';
UPDATE Branch SET Address = 'Center Ave' WHERE BranchNo = '3';
UPDATE Branch SET Address = 'East Rd' WHERE BranchNo = '4';
UPDATE Branch SET Address = 'West Rd' WHERE BranchNo = '5';
UPDATE Branch SET Address = 'North Blvd' WHERE BranchNo = '6';

--19
SELECT BranchNo, Address
FROM Branch;

--ii
SELECT *
FROM Property
WHERE Rent > 500;

-- Alter the Property table to add Staffid column
ALTER TABLE Property
ADD Staffid INT;

UPDATE Property SET Staffid = '1' WHERE PropertyNo = '1';
UPDATE Property SET Staffid = '2' WHERE PropertyNo = '2';
UPDATE Property SET Staffid = '3' WHERE PropertyNo = '3';
UPDATE Property SET Staffid = '4' WHERE PropertyNo = '4';
UPDATE Property SET Staffid = '5' WHERE PropertyNo = '5';
UPDATE Property SET Staffid = '6' WHERE PropertyNo = '6';

--iii
SELECT Property.*, Staff.*
FROM Property
JOIN Staff ON Property.Staffid = Staff.Staffid;

--iv
SELECT BranchNo
FROM Property
INTERSECT
SELECT BranchNo
FROM Staff;

--v
SELECT BranchNo
FROM Branch
EXCEPT
SELECT BranchNo
FROM Property;




















