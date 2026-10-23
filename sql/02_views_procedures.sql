USE EDU_FOUNDATION;

CREATE VIEW DonorDonationSummary AS
SELECT 
    d.DonorID, 
    CONCAT(d.FirstName, ' ', d.LastName) AS DonorName, 
    SUM(dn.Amount) AS TotalDonation
FROM 
    DONOR d
JOIN 
    Donation dn ON d.DonorID = dn.DonorID
GROUP BY 
    d.DonorID, d.FirstName, d.LastName;
    
CREATE VIEW EventCoordinatorDetails AS
SELECT 
    e.EventID, 
    e.EventName, 
    e.EventDate, 
    CONCAT(emp.FirstName, ' ', emp.LastName) AS CoordinatorName
FROM 
    Event e
JOIN 
    Employee emp ON e.EmployeeID = emp.EmployeeID;

CREATE VIEW SponsorshipDetails AS
SELECT 
    s.SponsorshipID, 
    s.SponsorName, 
    s.Amount, 
    s.SponsorshipDate, 
    e.EventName
FROM 
    Sponsorship s
JOIN 
    Event e ON s.EventID = e.EventID;

CREATE VIEW UpcomingEvents AS
SELECT 
    EventID, 
    EventName, 
    EventDate, 
    CONCAT(City, ', ', Street, ', ', Building) AS Location
FROM 
    Event
WHERE 
    EventDate > CURDATE();
    
DELIMITER //
CREATE PROCEDURE AddDonor(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_City VARCHAR(50),
    IN p_Street VARCHAR(50),
    IN p_Building INT,
    IN p_Career VARCHAR(50)
)
BEGIN
    INSERT INTO DONOR (FirstName, LastName, City, Street, Building, Career)
    VALUES (p_FirstName, p_LastName, p_City, p_Street, p_Building, p_Career);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateDonorContact(
    IN p_DonorID INT,
    IN p_Phone VARCHAR(15),
    IN p_Email VARCHAR(100)
)
BEGIN
    IF p_Phone IS NOT NULL THEN
        INSERT INTO DONOR_PHONE (DonorID, Phone)
        VALUES (p_DonorID, p_Phone)
        ON DUPLICATE KEY UPDATE Phone = p_Phone;
    END IF;

    IF p_Email IS NOT NULL THEN
        INSERT INTO DONOR_EMAIL (DonorID, Email)
        VALUES (p_DonorID, p_Email)
        ON DUPLICATE KEY UPDATE Email = p_Email;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddEvent(
	IN p_EventID INT,
    IN p_EventName VARCHAR(100),
    IN p_EventDate DATE,
    IN p_City VARCHAR(50),
    IN p_Street VARCHAR(50),
    IN p_Building INT,
    IN p_Description VARCHAR(255),
    IN p_EmployeeID INT
)
BEGIN
    INSERT INTO Event (EventID, EventName, EventDate, City, Street, Building, Description, EmployeeID)
    VALUES (p_EventID,p_EventName, p_EventDate, p_City, p_Street, p_Building, p_Description, p_EmployeeID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RecordDonation(
	IN p_DonationID INT,
    IN p_DonationDate DATETIME,
    IN p_Amount DOUBLE,
    IN p_Purpose VARCHAR(255),
    IN p_DonorID INT
)
BEGIN
    INSERT INTO Donation (DonationID, DonationDate, Amount, Purpose, DonorID)
    VALUES (p_DonationID, p_DonationDate, p_Amount, p_Purpose, p_DonorID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RegisterForEvent(
    IN p_EventID INT,
    IN p_DonorID INT
)
BEGIN
    INSERT INTO EventParticipants (EventID, DonorID)
    VALUES (p_EventID, p_DonorID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SendMessageToEmployee(
    IN p_DonorID INT,
    IN p_EmployeeID INT
)
BEGIN
    INSERT INTO CommunicationTable (DonorID, EmployeeID)
    VALUES (p_DonorID, p_EmployeeID);
END //
DELIMITER ;
