DROP Database IF EXISTS MedicalSystem;
DROP TABLE IF EXISTS MedicalTestResult;
DROP TABLE IF EXISTS MedicalTest;
DROP TABLE IF EXISTS AppointmentMedicalCenter;
DROP TABLE IF EXISTS AppointmentDoctor;
DROP TABLE IF EXISTS MedicalCenter;
DROP TABLE IF EXISTS buyPrescription;
DROP TABLE IF EXISTS Drugstore;
DROP TABLE IF EXISTS Prescription;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;
create Database MedicalSystem;

create table Doctor(D_name varchar(10) not null,
					D_surname varchar(10) not null,
					D_id int not null ,
                    D_field varchar (20) not null ,
					D_city varchar (15),
					D_tel int,
                      primary key(D_id));
create table Patient(P_name varchar(10) not null ,
                    P_surname varchar(10) not null ,
					P_id int not null ,
					P_tel int,
					P_birth date,
					P_address varchar(40),
                    primary key (P_id));
create table Prescription(Pr_id int not null,
						 Pr_date date,
						 P_id int, D_id int,
						 Note nvarchar(max),
						 Pr_status bit,
						 foreign key (P_id) references Patient(P_id),
						 foreign key (D_id)references Doctor(D_id),
						 primary key (Pr_id));
create table Drugstore(Dr_id int  not null,
					   Dr_name varchar(30) not null,
					   Dr_Dname varchar(10)not null,
					   Dr_Dsurname varchar(10)not null,
					   Dr_Did char (10) not null,
					   Dr_tel int,
					   Dr_city varchar(15)
					   Primary key (Dr_id));
create table buyPrescription(Bpr_date date not null,
							 Pr_id int not null,
							 Dr_id int not null,
							 foreign key (Dr_id) references Drugstore(Dr_id),
							 foreign key (Pr_id) references Prescription(Pr_id));
create table MedicalCenter(Md_id int not null,
						   Md_name varchar (30)not null,
						   Md_field varchar (20)not null,
						   Md_city varchar (15),
						   Md_tel int,
						   primary key (Md_id));
create table AppointmentDoctor(Ad_id int not null,
							   Ad_date date not null,
							   Ad_time time not null,
							   Ad_status bit,
							   D_id int,P_id int not null,
						 	   foreign key (P_id) references Patient(P_id),
							   foreign key (D_id)references Doctor(D_id),
							   primary key (Ad_id));
create table AppointmentMedicalCenter(Amd_id int not null,
									  Amd_date date not null,
						 			  Amd_time time not null,
									  Amd_status bit,
						 			  P_id int not null,Md_id int not null,
									  foreign key (P_id) references Patient(P_id),
									  foreign key (Md_id)references MedicalCenter(Md_id),
									  primary key (Amd_id));
create table MedicalTest (T_id int not null,
						  T_date date,
						  T_status bit,
						  Note nvarchar(max),
						  D_id int,P_id int not null,Md_id int not null,
						  foreign key  (P_id) references Patient(P_id),
						  foreign key (D_id)references Doctor(D_id),
						  foreign key (Md_id)references MedicalCenter(Md_id),
						  primary key (T_id));
create table MedicalTestResult (Tr_id int not null,
						  Tr_date date,
						  Note nvarchar(max),
						  T_id int not null,Md_id int not null,
						  foreign key (T_id) references MedicalTest(T_id),
						  foreign key (Md_id)references MedicalCenter(Md_id),
						  primary key (Tr_id));
create table TestDone (Td_id int not null primary key,
						T_id int not null,
						foreign key (T_id) references MedicalTest(T_id),
						Td_date date,
						Md_id int not null,
						foreign key(Md_id) references MedicalCenter(Md_id));
						

-- Inserting data into Doctor table
-- Insert data into Doctor table
INSERT INTO Doctor (D_name, D_surname, D_id, D_field, D_city, D_tel)
VALUES
    ('John', 'Doe', 1, 'Cardiology', 'New York', 123467890),
    ('Alice', 'Smith', 2, 'Pediatrics', 'Los Angeles', 987543210),
    ('Michael', 'Johnson', 3, 'Dermatology', 'Chicago', 555555555),
    ('Emily', 'Brown', 4, 'Orthopedics', 'Houston', 111111111),
    ('David', 'Lee', 5, 'Neurology', 'San Francisco', 222222222),
    ('Sarah', 'Garcia', 6, 'Oncology', 'Boston', 333333333),
    ('James', 'Martinez', 7, 'Psychiatry', 'Philadelphia', 444444444),
    ('Jessica', 'Lopez', 8, 'Endocrinology', 'Seattle', 666666666),
    ('Daniel', 'Hernandez', 9, 'Urology', 'Miami', 777777777),
    ('Jennifer', 'Perez', 10, 'Gastroenterology', 'Dallas', 888888888);

-- Insert data into Patient table
INSERT INTO Patient (P_name, P_surname, P_id, P_tel, P_birth, P_address)
VALUES
    ('Emma', 'Johnson', 1, 111223333, '1990-05-15', '123 Main St, New York'),
    ('Noah', 'Williams', 2, 445556666, '1985-10-20', '456 Elm St, Los Angeles'),
    ('Olivia', 'Brown', 3, 777889999, '1978-03-25', '789 Oak St, Chicago'),
    ('Liam', 'Jones', 4, 999888777, '2000-12-10', '321 Pine St, Houston'),
    ('Ava', 'Davis', 5, 333222111, '1995-08-05', '654 Cedar St, San Francisco'),
    ('William', 'Miller', 6, 666778888, '1982-06-30', '987 Maple St, Boston'),
    ('Sophia', 'Wilson', 7, 555444333, '1973-09-17', '741 Birch St, Philadelphia'),
    ('James', 'Taylor', 8, 222333444, '1998-02-28', '852 Spruce St, Seattle'),
    ('Charlotte', 'Anderson', 9, 889990000, '1987-11-12', '369 Walnut St, Miami'),
    ('Benjamin', 'White', 10, 666554444, '1970-04-03', '159 Vine St, Dallas');

-- Insert data into Prescription table
INSERT INTO Prescription (Pr_id, Pr_date, P_id, D_id, Pr_status)
VALUES
    (1, '2024-06-01', 1, 1, 1),
    (2, '2024-06-02', 2, 2, 0),
    (3, '2024-06-03', 3, 3, 1),
    (4, '2024-06-04', 4, 4, 0),
    (5, '2024-06-05', 5, 5, 1),
    (6, '2024-06-06', 6, 6, 0),
    (7, '2024-06-07', 7, 7, 1),
    (8, '2024-06-08', 8, 8, 0),
    (9, '2024-06-09', 9, 9, 1),
    (10, '2024-06-10', 10, 10, 0);

-- Insert data into Drugstore table
INSERT INTO Drugstore (Dr_id, Dr_name, Dr_Dname, Dr_Dsurname, Dr_Did, Dr_tel, Dr_city)
VALUES
    (1, 'Pharma Plus', 'John', 'Doe', 'ABC123', 111223333, 'New York'),
    (2, 'Medi Mart', 'Alice', 'Smith', 'DEF456', 444555666, 'Los Angeles'),
    (3, 'Health Haven', 'Michael', 'Johnson', 'GHI789', 778889999, 'Chicago'),
    (4, 'Wellness World', 'Emily', 'Brown', 'JKL012', 999887777, 'Houston'),
    (5, 'Cure Corner', 'David', 'Lee', 'MNO345', 333222111, 'San Francisco'),
    (6, 'Pill Palace', 'Sarah', 'Garcia', 'PQR678', 666778888, 'Boston'),
    (7, 'Rx Zone', 'James', 'Martinez', 'STU901', 555444333, 'Philadelphia'),
    (8, 'Medicine Mart', 'Jessica', 'Lopez', 'VWX234', 223334444, 'Seattle'),
    (9, 'Healthy Living', 'Daniel', 'Hernandez', 'YZA567', 889990000, 'Miami'),
    (10, 'Quick Cure', 'Jennifer', 'Perez', 'BCD890', 666554444, 'Dallas');

-- Insert data into buyPrescription table
INSERT INTO buyPrescription (Bpr_date, Pr_id, Dr_id)
VALUES
    ('2024-06-01', 1, 1),
    ('2024-06-02', 2, 2),
    ('2024-06-03', 3, 3),
    ('2024-06-04', 4, 4),
    ('2024-06-05', 5, 5),
    ('2024-06-06', 6, 6),
    ('2024-06-07', 7, 7),
    ('2024-06-08', 8, 8),
    ('2024-06-09', 9, 9),
    ('2024-06-10', 10, 10);

-- Insert data into MedicalCenter table
INSERT INTO MedicalCenter (Md_id, Md_name, Md_field, Md_city, Md_tel)
VALUES
    (1, 'City Hospital', 'General Medicine', 'New York', 111223333),
    (2, 'Sunshine Clinic', 'Dermatology', 'Los Angeles', 444556666),
    (3, 'Riverfront Medical', 'Cardiology', 'Chicago', 777888999),
    (4, 'Peak Wellness Center', 'Orthopedics', 'Houston', 999888777),
    (5, 'Bay Area Medical', 'Neurology', 'San Francisco', 333221111),
    (6, 'Harbor Health', 'Oncology', 'Boston', 666778888),
    (7, 'Valley Psychiatry', 'Psychiatry', 'Philadelphia', 555443333),
    (8, 'Evergreen Endocrinology', 'Endocrinology', 'Seattle', 222334444),
    (9, 'Coastal Urology Center', 'Urology', 'Miami', 888990000),
    (10, 'Metro Gastroenterology', 'Gastroenterology', 'Dallas', 666555444);

-- Insert data into AppointmentDoctor table
INSERT INTO AppointmentDoctor (Ad_id, Ad_date, Ad_time, Ad_status, D_id, P_id)
VALUES
    (1, '2024-06-01', '10:00:00', 1, 1, 1),
    (2, '2024-06-02', '11:00:00', 0, 2, 2),
    (3, '2024-06-03', '12:00:00', 1, 3, 3),
    (4, '2024-06-04', '13:00:00', 0, 4, 4),
    (5, '2024-06-05', '14:00:00', 1, 5, 5),
    (6, '2024-06-06', '15:00:00', 0, 6, 6),
    (7, '2024-06-07', '16:00:00', 1, 7, 7),
    (8, '2024-06-08', '17:00:00', 0, 8, 8),
    (9, '2024-06-09', '18:00:00', 1, 9, 9),
    (10, '2024-06-10', '19:00:00', 0, 10, 10);

-- Insert data into AppointmentMedicalCenter table
INSERT INTO AppointmentMedicalCenter (Amd_id, Amd_date, Amd_time, Amd_status, P_id, Md_id)
VALUES
    (1, '2024-06-01', '10:00:00', 1, 1, 1),
    (2, '2024-06-02', '11:00:00', 0, 2, 2),
    (3, '2024-06-03', '12:00:00', 1, 3, 3),
    (4, '2024-06-04', '13:00:00', 0, 4, 4),
    (5, '2024-06-05', '14:00:00', 1, 5, 5),
    (6, '2024-06-06', '15:00:00', 0, 6, 6),
    (7, '2024-06-07', '16:00:00', 1, 7, 7),
    (8, '2024-06-08', '17:00:00', 0, 8, 8),
    (9, '2024-06-09', '18:00:00', 1, 9, 9),
    (10, '2024-06-10', '19:00:00', 0, 10, 10);

-- Insert data into MedicalTest table
INSERT INTO MedicalTest (T_id, T_date, T_status, D_id, P_id)
VALUES
    (1, '2024-06-01', 1, 1, 1),
    (2, '2024-06-02', 0, 2, 2),
    (3, '2024-06-03', 1, 3, 3),
    (4, '2024-06-04', 0, 4, 4),
    (5, '2024-06-05', 1, 5, 5),
    (6, '2024-06-06', 0, 6, 6),
    (7, '2024-06-07', 1, 7, 7),
    (8, '2024-06-08', 0, 8, 8),
    (9, '2024-06-09', 1, 9, 9),
    (10, '2024-06-10', 0, 10, 10);

-- Insert data into MedicalTestResult table
INSERT INTO MedicalTestResult (Tr_id, Tr_date, T_id, Md_id)
VALUES
    (1, '2024-06-01', 1, 1),
    (2, '2024-06-02', 2, 2),
    (3, '2024-06-03', 3, 3),
    (4, '2024-06-04', 4, 4),
    (5, '2024-06-05', 5, 5),
    (6, '2024-06-06', 6, 6),
    (7, '2024-06-07', 7, 7),
    (8, '2024-06-08', 8, 8),
    (9, '2024-06-09', 9, 9),
    (10, '2024-06-10', 10, 10);



