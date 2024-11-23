create table Sponsors(
SponsorID int primary key not null,
Name varchar(255) not null,
Contact varchar(255) not null,
Email varchar(255) unique
);

create table Beneficiaries(
BeneficiaryID int primary key,
Name varchar(255) not null,
Age int not null,
Grade_level varchar(255) not null
);

create table Progression(
ProgressionID int primary key,
Scores int not null,
Date date not null,
Grade_level varchar(255) not null,
BeneficiaryID int,
foreign key (BeneficiaryID) references Beneficiaries (BeneficiaryID)
);

create table Donation(
DonationID int primary key,
Amount int not null,
Date date not null,
SponsorID int,
BeneficiaryID int,
foreign key (SponsorID) references Sponsors (SponsorID),
foreign key (BeneficiaryID) references Beneficiaries (BeneficiaryID)
);

create table Staff(
StaffID int primary key,
Name varchar(255) not null,
Contact varchar(255) not null,
Email varchar(255) unique,
Grade_level varchar(255),
BeneficiaryID int,
foreign key (BeneficiaryID) references Beneficiaries(BeneficiaryID)
);


INSERT INTO Sponsors (SponsorID, Name, Contact, Email)
VALUES 
(1, 'Global Aid', '123-456-7890', 'contact@globalaid.org'),
(2, 'Helping Hands', '987-654-3210', 'info@helpinghands.com'),
(3, 'United Charity', '456-789-0123', 'support@unitedcharity.net'),
(4, 'Hope Foundation', '321-654-0987', 'info@hopefoundation.org'),
(5, 'Bright Future', '654-321-8765', 'contact@brightfuture.com');


INSERT INTO Beneficiaries (BeneficiaryID, Name, Age, Grade_level)
VALUES 
(1, 'John Doe', 14, 'Grade 9'),
(2, 'Jane Smith', 15, 'Grade 10'),
(3, 'Michael Johnson', 16, 'Grade 11'),
(4, 'Emily Davis', 13, 'Grade 8'),
(5, 'David Brown', 17, 'Grade 12');


INSERT INTO Donation (DonationID, Amount, Date, SponsorID, BeneficiaryID)
VALUES 
(1, 1000, '2024-11-01', 1, 1),
(2, 1500, '2024-11-02', 2, 2),
(3, 2000, '2024-11-03', 3, 3),
(4, 2500, '2024-11-04', 4, 4),
(5, 3000, '2024-11-05', 5, 5);


INSERT INTO Progression (ProgressionID, Scores, Date, Grade_level, BeneficiaryID)
VALUES 
(1, 85, '2024-11-01', 'Grade 9', 1),
(2, 90, '2024-11-02', 'Grade 10', 2),
(3, 75, '2024-11-03', 'Grade 11', 3),
(4, 88, '2024-11-04', 'Grade 8', 4),
(5, 95, '2024-11-05', 'Grade 12', 5);


INSERT INTO Staff (StaffID, Name, Contact, Email, Grade_level, BeneficiaryID)
VALUES 
(1, 'Alice Green', '555-1234', 'alice.green@organization.com', 'Grade 9', 1),
(2, 'Bob White', '555-5678', 'bob.white@organization.com', 'Grade 10', 2),
(3, 'Charlie Black', '555-9101', 'charlie.black@organization.com', NULL, NULL),
(4, 'Diane Blue', '555-1213', 'diane.blue@organization.com', 'Grade 8', 4),
(5, 'Eve Yellow', '555-1415', 'eve.yellow@organization.com', NULL, NULL);


