USE EDU_FOUNDATION;

INSERT INTO DONOR (DonorID, FirstName, LastName, City, Street, Building, Career)
VALUES 
(1, 'Mohammed', 'Khalid', 'Amman', 'Queen Rania Street', 12, 'Engineer'),
(2, 'Layla', 'Ahmed', 'Zarqa', 'Al-Jaysh Street', 45, 'Doctor'),
(3, 'Ali', 'Hassan', 'Irbid', 'University Street', 23, 'Teacher'),
(4, 'Sara', 'Mahmoud', 'Amman', 'Al-Madinah Al-Munawarah Street', 67, 'Accountant'),
(5, 'Khaled', 'Ali', 'Aqaba', 'Sea Street', 89, 'Merchant');

INSERT INTO DONOR_PHONE (DonorID, Phone)
VALUES 
(1, '0791234567'),
(2, '0782345678'),
(3, '0773456789'),
(4, '0794567890'),
(5, '0785678901');

INSERT INTO DONOR_EMAIL (DonorID, Email)
VALUES 
(1, 'mohammed.khalid@example.com'),
(2, 'layla.ahmed@example.com'),
(3, 'ali.hassan@example.com'),
(4, 'sara.mahmoud@example.com'),
(5, 'khaled.ali@example.com');

INSERT INTO Department (DepartmentID, DepartmentName, Description, Email)
VALUES 
(1, 'Marketing', 'Marketing and Public Relations Department', 'marketing@edu-foundation.org'),
(2, 'Finance', 'Finance and Accounting Department', 'finance@edu-foundation.org'),
(3, 'Events', 'Event Organization Department', 'events@edu-foundation.org'),
(4, 'Technical Support', 'Technical Support and IT Department', 'support@edu-foundation.org');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Role, Email, DepartmentID)
VALUES 
(1, 'Ahmad', 'Yousef', 'Marketing Manager', 'ahmad.yousef@edu-foundation.org', 1),
(2, 'Rana', 'Tariq', 'Finance Officer', 'rana.tariq@edu-foundation.org', 2),
(3, 'Omar', 'Fadi', 'Event Coordinator', 'omar.fadi@edu-foundation.org', 3),
(4, 'Hala', 'Samir', 'IT Specialist', 'hala.samir@edu-foundation.org', 4);

INSERT INTO Event (EventID, EventName, EventDate, City, Street, Building, Description, EmployeeID)
VALUES 
(1, 'Charity Gala', '2023-12-15', 'Amman', 'Rainbow Street', 10, 'Annual charity gala to support education', 3),
(2, 'Fundraising Marathon', '2024-02-20', 'Aqaba', 'Corniche Street', 5, 'Marathon to raise funds for underprivileged students', 3),
(3, 'Workshop on Education', '2024-03-10', 'Irbid', 'University Street', 15, 'Workshop to discuss modern education techniques', 3);

INSERT INTO Sponsorship (SponsorshipID, SponsorName, Amount, SponsorshipDate, EventID)
VALUES 
(1, 'Zain Jordan', 5000.00, '2023-11-01', 1),
(2, 'Orange Jordan', 3000.00, '2024-01-15', 2),
(3, 'Umniah', 2000.00, '2024-02-01', 3);

INSERT INTO Donation (DonationID, DonationDate, Amount, Purpose, DonorID)
VALUES 
(1, '2023-10-01 10:00:00', 1000.00, 'Supporting education', 1),
(2, '2023-10-05 14:30:00', 500.00, 'Helping underprivileged students', 2),
(3, '2023-10-10 09:15:00', 750.00, 'Building schools', 3);

INSERT INTO EventParticipants (EventID, DonorID)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5);

INSERT INTO CommunicationTable (DonorID, EmployeeID, CommunicationDate)
VALUES 
(1, 1, '2023-10-02 11:00:00'),
(2, 2, '2023-10-06 15:00:00'),
(3, 3, '2023-10-11 10:00:00');
