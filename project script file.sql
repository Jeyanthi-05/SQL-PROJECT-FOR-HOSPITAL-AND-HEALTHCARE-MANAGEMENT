
-- To Create a database --

create database project;

-- To Activate the database --

use project;

-- To Create table name patient --

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Disease VARCHAR(100),
    Doctor_ID INT,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID) on delete cascade
);

-- to create table name doctor --

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Specialization VARCHAR(100),
    Phone_Number VARCHAR(15)
);

-- To Create table name Room --

CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    Room_Type VARCHAR(50),
    Status VARCHAR(20)
);

-- To Create table name Bill--

CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    Lab_Charges DECIMAL(10, 2),
    Room_Charges DECIMAL(10, 2),
    No_Of_Days INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) on delete cascade
);

-- To create table name Laboratory--

CREATE TABLE Laboratory (
    Lab_ID INT PRIMARY KEY,
    Patient_ID INT,
    Lab_Amount DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) on delete cascade
);

-- To create table name outpatient--

CREATE TABLE Outpatient (
    Patient_ID INT PRIMARY KEY,
    Date DATE,
    Lab_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID), 
    FOREIGN KEY (Lab_ID) REFERENCES Laboratory(Lab_ID) on delete cascade
);

-- To create table name Inpatient--

CREATE TABLE Inpatient (
    Patient_ID INT PRIMARY KEY,                    
    Room_ID INT,                                  
    Lab_ID INT,                                   
    Date_of_admission DATE NOT NULL,              
    Date_of_discharge DATE,                      
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (Lab_ID) REFERENCES Laboratory(Lab_ID) on delete cascade
);

-- To insert the values for patient table--

INSERT INTO patient (
Patient_ID, name, Age, gender, address, disease, Doctor_ID)
 VALUES
(1, 'John Doe', 45, 'Male', 'New York', 'Diabetes', 101),
(2, 'Jane Smith', 34, 'Female', 'Los Angeles', 'Hypertension', 102),
(3, 'Robert Brown', 52, 'Male', 'Chicago', 'Arthritis', 103),
(4, 'Emily Davis', 29, 'Female', 'Houston', 'Asthma', 104),
(5, 'Michael Wilson', 60, 'Male', 'Phoenix', 'Heart Disease', 105),
(6, 'Sarah Johnson', 38, 'Female', 'Philadelphia', 'Migraine', 106),
(7, 'David White', 40, 'Male', 'San Antonio', 'High Cholesterol', 107),
(8, 'Laura Hall', 27, 'Female', 'San Diego', 'Anemia', 108),
(9, 'James King', 55, 'Male', 'Dallas', 'Diabetes', 109),
(10, 'Olivia Lewis', 33, 'Female', 'San Jose', 'Thyroid Disorder', 110),
(11, 'William Scott', 49, 'Male', 'Austin', 'Hypertension', 101),
(12, 'Sophia Harris', 30, 'Female', 'Jacksonville', 'PCOS', 102),
(13, 'Alexander Adams', 37, 'Male', 'San Francisco', 'Back Pain', 103),
(14, 'Charlotte Martin', 42, 'Female', 'Columbus', 'Depression', 104),
(15, 'Benjamin Lee', 50, 'Male', 'Indianapolis', 'Heart Disease', 105),
(16, 'Amelia Turner', 28, 'Female', 'Fort Worth', 'Allergy', 106),
(17, 'Daniel Perez', 46, 'Male', 'Charlotte', 'Stroke', 107),
(18, 'Emma Thompson', 32, 'Female', 'Seattle', 'Kidney Stones', 108),
(19, 'Matthew Parker', 41, 'Male', 'Denver', 'Anxiety', 109),
(20, 'Mia Clark', 35, 'Female', 'Washington', 'Hypertension', 110),
(21, 'Joseph Walker', 53, 'Male', 'Boston', 'Diabetes', 101),
(22, 'Ella Rodriguez', 31, 'Female', 'El Paso', 'Migraines', 102),
(23, 'Christopher Green', 44, 'Male', 'Nashville', 'Obesity', 103),
(24, 'Ava Baker', 26, 'Female', 'Detroit', 'Pneumonia', 104),
(25, 'Andrew Gonzalez', 47, 'Male', 'Memphis', 'Liver Disease', 105),
(26, 'Lily Allen', 39, 'Female', 'Louisville', 'Thyroid Disorder', 106),
(27, 'Ethan Carter', 54, 'Male', 'Baltimore', 'Arthritis', 107),
(28, 'Harper Sanchez', 36, 'Female', 'Milwaukee', 'Bronchitis', 108),
(29, 'Samuel Nelson', 48, 'Male', 'Albuquerque', 'Hypertension', 109),
(30, 'Grace Mitchell', 29, 'Female', 'Tucson', 'Sinusitis', 110),
(31, 'Logan Ramirez', 51, 'Male', 'Fresno', 'Heart Disease', 101),
(32, 'Chloe Roberts', 34, 'Female', 'Sacramento', 'Asthma', 102),
(33, 'Nathan Campbell', 43, 'Male', 'Kansas City', 'Kidney Disease', 103),
(34, 'Scarlett Stewart', 37, 'Female', 'Mesa', 'Diabetes', 104),
(35, 'Jack Edwards', 58, 'Male', 'Atlanta', 'Hypertension', 105);

-- show the all details from patient table--

select * from patient;

-- To insert the values for doctor table--

INSERT INTO doctor (
Doctor_ID, name, age, gender, address, Specialization, Phone_Number)
 VALUES
(101, 'Dr. John Williams', 50, 'Male', 'New York', 'Cardiologist', '9876543101'),
(102, 'Dr. Emily Brown', 45, 'Female', 'Los Angeles', 'Endocrinologist', '9876543102'),
(103, 'Dr. Robert Miller', 55, 'Male', 'Chicago', 'Orthopedic', '9876543103'),
(104, 'Dr. Olivia Davis', 42, 'Female', 'Houston', 'Pulmonologist', '9876543104'),
(105, 'Dr. Michael Wilson', 48, 'Male', 'Phoenix', 'Neurologist', '9876543105'),
(106, 'Dr. Sophia Johnson', 39, 'Female', 'Philadelphia', 'Gynecologist', '9876543106'),
(107, 'Dr. Daniel Martinez', 46, 'Male', 'San Antonio', 'Dermatologist', '9876543107'),
(108, 'Dr. Laura Garcia', 50, 'Female', 'San Diego', 'Nephrologist', '9876543108'),
(109, 'Dr. James Anderson', 52, 'Male', 'Dallas', 'Psychiatrist', '9876543109'),
(110, 'Dr. Sarah Thomas', 41, 'Female', 'San Jose', 'General Physician', '9876543110');
 
-- show the all details from doctor table--

select * from doctor;

-- To insert the values for room table--

INSERT INTO room (Room_ID, Room_Type, Status) VALUES
(1, 'Single', 'Occupied'),
(2, 'Single', 'Available'),
(3, 'Double', 'Occupied'),
(4, 'Double', 'Available'),
(5, 'ICU', 'Occupied'),
(6, 'ICU', 'Available'),
(7, 'VIP', 'Occupied'),
(8, 'VIP', 'Available'),
(9, 'General', 'Occupied'),
(10, 'General', 'Available'),
(11, 'Single', 'Occupied'),
(12, 'Double', 'Available'),
(13, 'ICU', 'Occupied'),
(14, 'VIP', 'Available'),
(15, 'General', 'Occupied'),
(16, 'Single', 'Available'),
(17, 'Double', 'Occupied'),
(18, 'ICU', 'Available'),
(19, 'VIP', 'Occupied'),
(20, 'General', 'Available'),
(21, 'Single', 'Occupied'),
(22, 'Double', 'Available'),
(23, 'ICU', 'Occupied'),
(24, 'VIP', 'Available'),
(25, 'General', 'Occupied'),
(26, 'Single', 'Available'),
(27, 'Double', 'Occupied'),
(28, 'ICU', 'Available'),
(29, 'VIP', 'Occupied'),
(30, 'General', 'Available'),
(31, 'Single', 'Occupied'),
(32, 'Double', 'Available'),
(33, 'ICU', 'Occupied'),
(34, 'VIP', 'Available'),
(35, 'General', 'Occupied');

-- show the all details from room table--

select * from room;

-- To insert the values for bill table--

INSERT INTO bill (Bill_ID, Patient_ID, Lab_Charges, Room_Charges, No_Of_Days) VALUES
(1, 1, 1500, 5000, 3),
(2, 2, 1200, 4000, 2),
(3, 3, 1800, 6000, 4),
(4, 4, 1000, 3000, 1),
(5, 5, 2000, 7000, 5),
(6, 6, 1300, 3500, 2),
(7, 7, 1400, 4500, 3),
(8, 8, 1600, 5500, 4),
(9, 9, 1700, 6500, 5),
(10, 10, 1250, 4200, 2),
(11, 11, 1350, 4600, 3),
(12, 12, 1100, 3100, 1),
(13, 13, 1750, 6200, 4),
(14, 14, 1450, 4700, 3),
(15, 15, 1550, 5300, 4),
(16, 16, 2000, 7000, 5),
(17, 17, 1250, 4000, 2),
(18, 18, 1800, 6000, 4),
(19, 19, 1300, 3500, 2),
(20, 20, 1400, 4500, 3),
(21, 21, 1900, 6700, 5),
(22, 22, 1050, 2900, 1),
(23, 23, 1750, 6200, 4),
(24, 24, 1500, 5000, 3),
(25, 25, 1600, 5500, 4),
(26, 26, 1200, 4000, 2),
(27, 27, 1550, 5300, 4),
(28, 28, 2000, 7000, 5),
(29, 29, 1250, 4200, 2),
(30, 30, 1450, 4700, 3),
(31, 31, 1350, 4600, 3),
(32, 32, 1900, 6700, 5),
(33, 33, 1000, 3000, 1),
(34, 34, 1750, 6200, 4),
(35, 35, 1100, 3100, 1);

-- show the all details from bill table--

select * from bill;

-- To insert the values for laboratory table--


INSERT INTO laboratory (Lab_ID, Patient_ID, Lab_Amount, Date) VALUES
(1, 1, 1500, '2025-03-25'),
(2, 2, 1200, '2025-03-24'),
(3, 3, 1800, '2025-03-23'),
(4, 4, 1000, '2025-03-22'),
(5, 5, 2000, '2025-03-21'),
(6, 6, 1300, '2025-03-20'),
(7, 7, 1400, '2025-03-19'),
(8, 8, 1600, '2025-03-18'),
(9, 9, 1700, '2025-03-17'),
(10, 10, 1250, '2025-03-16'),
(11, 11, 1350, '2025-03-15'),
(12, 12, 1100, '2025-03-14'),
(13, 13, 1750, '2025-03-13'),
(14, 14, 1450, '2025-03-12'),
(15, 15, 1550, '2025-03-11'),
(16, 16, 2000, '2025-03-10'),
(17, 17, 1250, '2025-03-09'),
(18, 18, 1800, '2025-03-08'),
(19, 19, 1300, '2025-03-07'),
(20, 20, 1400, '2025-03-06'),
(21, 21, 1900, '2025-03-05'),
(22, 22, 1050, '2025-03-04'),
(23, 23, 1750, '2025-03-03'),
(24, 24, 1500, '2025-03-02'),
(25, 25, 1600, '2025-03-01'),
(26, 26, 1200, '2025-02-27'),
(27, 27, 1550, '2025-02-28'),
(28, 28, 2000, '2025-02-27'),
(29, 29, 1250, '2025-02-26'),
(30, 30, 1450, '2025-02-25'),
(31, 31, 1350, '2025-02-24'),
(32, 32, 1900, '2025-02-23'),
(33, 33, 1000, '2025-02-22'),
(34, 34, 1750, '2025-02-21'),
(35, 35, 1100, '2025-02-20');

-- show the all details from laboratory table--

select * from laboratory;

-- To insert the values for outpatient table--

INSERT INTO outpatient (Patient_ID, Date, Lab_ID) VALUES
(1, '2025-03-25', 1),
(2, '2025-03-24', 2),
(3, '2025-03-23', 3),
(4, '2025-03-22', 4),
(5, '2025-03-21', 5),
(6, '2025-03-20', 6),
(7, '2025-03-19', 7),
(8, '2025-03-18', 8),
(9, '2025-03-17', 9),
(10, '2025-03-16', 10),
(11, '2025-03-15', 11),
(12, '2025-03-14', 12),
(13, '2025-03-13', 13),
(14, '2025-03-12', 14),
(15, '2025-03-11', 15),
(16, '2025-03-10', 16),
(17, '2025-03-09', 17),
(18, '2025-03-08', 18),
(19, '2025-03-07', 19),
(20, '2025-03-06', 20),
(21, '2025-03-05', 21),
(22, '2025-03-04', 22),
(23, '2025-03-03', 23),
(24, '2025-03-02', 24),
(25, '2025-03-01', 25),
(26, '2025-02-27', 26),
(27, '2025-02-28', 27),
(28, '2025-02-27', 28),
(29, '2025-02-26', 29),
(30, '2025-02-25', 30),
(31, '2025-02-24', 31),
(32, '2025-02-23', 32),
(33, '2025-02-22', 33),
(34, '2025-02-21', 34),
(35, '2025-02-20', 35);

-- show the all details from outpatient table--

select * from outpatient;

-- To insert the values for inpatient table--


INSERT INTO inpatient (Patient_ID, Room_ID, Lab_ID, Date_of_admission, Date_of_discharge) VALUES
(1, 1, 1, '2025-03-20', '2025-03-25'),
(2, 2, 2, '2025-03-18', '2025-03-24'),
(3, 3, 3, '2025-03-17', '2025-03-23'),
(4, 4, 4, '2025-03-16', '2025-03-22'),
(5, 5, 5, '2025-03-15', '2025-03-21'),
(6, 6, 6, '2025-03-14', '2025-03-20'),
(7, 7, 7, '2025-03-13', '2025-03-19'),
(8, 8, 8, '2025-03-12', '2025-03-18'),
(9, 9, 9, '2025-03-11', '2025-03-17'),
(10, 10, 10, '2025-03-10', '2025-03-16'),
(11, 11, 11, '2025-03-09', '2025-03-15'),
(12, 12, 12, '2025-03-08', '2025-03-14'),
(13, 13, 13, '2025-03-07', '2025-03-13'),
(14, 14, 14, '2025-03-06', '2025-03-12'),
(15, 15, 15, '2025-03-05', '2025-03-11'),
(16, 16, 16, '2025-03-04', '2025-03-10'),
(17, 17, 17, '2025-03-03', '2025-03-09'),
(18, 18, 18, '2025-03-02', '2025-03-08'),
(19, 19, 19, '2025-03-01', '2025-03-07'),
(20, 20, 20, '2025-02-28', '2025-03-06'),
(21, 21, 21, '2025-02-27', '2025-03-05'),
(22, 22, 22, '2025-02-26', '2025-03-04'),
(23, 23, 23, '2025-02-25', '2025-03-03'),
(24, 24, 24, '2025-02-24', '2025-03-02'),
(25, 25, 25, '2025-02-23', '2025-03-01'),
(26, 26, 26, '2025-02-22', '2025-02-27'),
(27, 27, 27, '2025-02-21', '2025-02-28'),
(28, 28, 28, '2025-02-20', '2025-02-27'),
(29, 29, 29, '2025-02-19', '2025-02-26'),
(30, 30, 30, '2025-02-18', '2025-02-25'),
(31, 31, 31, '2025-02-17', '2025-02-24'),
(32, 32, 32, '2025-02-16', '2025-02-23'),
(33, 33, 33, '2025-02-15', '2025-02-22'),
(34, 34, 34, '2025-02-14', '2025-02-21'),
(35, 35, 35, '2025-02-13', '2025-02-20');

-- show the all details from inpatient table--

select * from inpatient;

-- Find the name and contact details of all doctors working in the cardiology department --

DELIMITER //

CREATE PROCEDURE CardiologyDr()
BEGIN
    SELECT name, phone_Number
    FROM doctor 
    WHERE specialization = 'Cardiologist';
END //

DELIMITER ;

-- To call the procedure --

CALL CardiologyDr();





--  Get the average age of patients in the hospital--
DELIMITER //

CREATE PROCEDURE GetAveragePatientAge(OUT avg_age DECIMAL(5,2))
BEGIN
    -- Calculate the average age of all patients
    SELECT AVG(age) INTO avg_age FROM patient;
END //

DELIMITER ;

 -- To call the Procedure

SET @average_age = 0;
CALL GetAveragePatientAge(@average_age);
SELECT @average_age AS 'Average Age of Patients';

-- Retrieve the doctors who have attended more than 2 patients--

DELIMITER //

CREATE PROCEDURE GetDoctorsWithMoreThan2Patients()
BEGIN
    SELECT d.doctor_id, d.name, COUNT(p.patient_id) AS total_patients
    FROM doctor d
    JOIN patient p ON d.doctor_id = p.doctor_id
    GROUP BY d.doctor_id, d.name
    HAVING total_patients > 2;
END //

DELIMITER ;
-- To call the procedure--
CALL GetDoctorsWithMoreThan2Patients();

-- To retrieve all patient details based on their admission date.--

DELIMITER //
CREATE PROCEDURE GetPatientsByAdmissionDate(IN admission_date DATE)
BEGIN
    SELECT * FROM inpatient WHERE date_of_admission = admission_date;
END //
DELIMITER ;

-- To call the procedure--

CALL GetPatientsByAdmissionDate('2025-02-27');

-- To calculate the total room charges bill of a patient based on their treatments.--

DELIMITER //
CREATE PROCEDURE CalculatePatientBills(IN patient_id INT, OUT total_bill DECIMAL(10,2))
BEGIN
    SELECT SUM(room_charges) INTO total_bill
    FROM bill
    WHERE patient_id = patient_id;
END //
DELIMITER ;

-- Declare a variable to store the output
SET @total_bill = 0;

-- Call the procedure with a specific patient_id
CALL CalculatePatientBills(101, @total_bill);

-- Retrieve the result
SELECT @total_bill;


 -- How do you fetch patient details who were admitted in the last 1 month  --
DELIMITER //

CREATE PROCEDURE GetPatientsByDateRange(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT * FROM inpatient
    WHERE date_of_admission BETWEEN start_date AND end_date;
END //

DELIMITER ;

-- To call the procedure --
CALL GetPatientsByDateRange('2025-03-01', '2025-04-01');

-- To Create View for Patients Who Have Not Been Discharged --

CREATE VIEW Active_Patients AS
SELECT 
    p.patient_id, 
    p.name, 
    i.date_of_admission, 
    i.date_of_discharge
FROM patient p
JOIN inpatient i ON p.patient_id = i.patient_id
WHERE i.date_of_discharge IS NULL;

-- To call the view --

SELECT * FROM Active_Patients;



