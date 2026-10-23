USE EDU_FOUNDATION;
-- Ad-hoc queries and privilege tests (modifies data; run on a scratch copy).
SELECT * FROM Donation WHERE DonorID = 1;

INSERT INTO Employee (EmployeeID, FirstName, LastName, Role, Email, DepartmentID)
VALUES 
(5, 'Zaid', 'Shawarma', 'Manager', 'Zaid.Shawarma@edu-foundation.org', 3);

UPDATE DONOR SET Career = 'Doctor' WHERE DonorID = 1;

DELETE FROM Donation WHERE DonationID = 3;

SELECT DonorID, SUM(Amount) AS TotalDonation
FROM Donation
GROUP By DonorID;

SELECT * FROM DonorDonationSummary;

CALL AddEvent(
	4,
    'HTU Charity',          
    '2025-12-15',            
    'Amman',                 
    'Business Park St',        
    10,                      
    'Annual charity gala to support education',  
    3                        
);

-- This is for testing privilges of Donor_manager -- 
SELECT * FROM DONOR;

INSERT INTO DONOR (DonorID, FirstName, LastName, City, Street, Building, Career)
VALUES (6, 'Omar', 'Hazza', 'Amman', 'Mecca St', 10, 'Student');

SELECT * FROM Donation;

INSERT INTO CommunicationTable (DonorID, EmployeeID)
VALUES (1, 2);

DELETE FROM Donation WHERE DonationID = 1;

UPDATE Donation SET Amount = 2000 WHERE DonationID = 1;

INSERT INTO Donation (DonationID, DonationDate, Amount, Purpose, DonorID)
VALUES (4, '2024-01-01', 200.00, 'Supporting education', 1);

CALL RecordDonation(3,'2024-01-01 10:00:00', 100.00, 'Supporting education', 1);
-- This is for testing privilges of Donor_manager --
