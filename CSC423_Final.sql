CREATE TABLE Outlets(
	outletNo INT NOT NULL PRIMARY KEY,
	address VARCHAR(60) NOT NULL,
	phoneNo INT NOT NULL,
	faxNo INT NOT NULL
);

INSERT INTO Outlets VALUES (1, '310 E Grand Ave #103, El Segundo, CA 90245', 3106407400, 13106407400);

INSERT INTO Outlets VALUES (2, '15312 Hawthorne Blvd, Lawndale, CA 90260', 3106797368, 13106797368);

INSERT INTO Outlets VALUES (3, '3900 NW 25th St, Miami, FL 33142', 8334791096, 18334791096);

INSERT INTO Outlets VALUES (4, '3011 NW 36th St, Miami, FL 33142', 3056362776, 13056362776);

INSERT INTO Outlets VALUES (5, '1000 5th St Ste 100, Miami Beach, FL 33139', 3055384883, 13055384883);



CREATE TABLE Staff(
	staffNo INT NOT NULL PRIMARY KEY,
    outletNo INT,
    FOREIGN KEY (outletNo) REFERENCES Outlets(outletNo),
	firstName VARCHAR(15) NOT NULL,
	lastName VARCHAR(15) NOT NULL,
	address VARCHAR(60) NOT NULL,
	phoneNo INT NOT NULL,
	dob DATE,
	sex VARCHAR(1) CHECK (sex IN ('M', 'F')),
	startDate DATE NOT NULL,
    jobTitle VARCHAR(50)
);

INSERT INTO Staff(staffNo, firstName, lastName, address, phoneNo, DOB, sex, startDate, jobTitle, outletNo)
VALUES(1, 'Allegra', 'Papera', '3301 Highland Ave, Manhattan Beach, CA, 90266', 3104088989, date '2000-05-02', 'F', date '2021-01-04', 'Sales',1);

INSERT INTO Staff(staffNo, firstName, lastName, address, phoneNo, DOB, sex, startDate, jobTitle, outletNo)
VALUES(2, 'Sarah', 'Tinsley', '501 NW 40th St, Miami, FL, 33145', 7865048129, date '1999-12-12', 'F', date '2021-01-04', 'Sales', 3);

INSERT INTO Staff(staffNo, firstName, lastName, address, phoneNo, DOB, sex, startDate, jobTitle, outletNo)
VALUES(3, 'David', 'Mason', '200 9th St, Miami Beach, FL, 33139', 7865035738, date '2000-01-04', 'M', date '2021-01-04', 'Sales', 5);

INSERT INTO Staff(staffNo, firstName, lastName, address, phoneNo, DOB, sex, startDate, jobTitle, outletNo)
VALUES(4, 'Aaron', 'Bissoondial', '4400 NW 24th St, Miami, FL, 33132', 8628075672, date '2000-06-17', 'M', date '2021-01-04', 'Sales', 4);

INSERT INTO Staff(staffNo, firstName, lastName, address, phoneNo, DOB, sex, startDate, jobTitle, outletNo)
VALUES(5, 'Lucy', 'McDonald', '500 26th St, Manhattan Beach, CA, 90266', 3104156800, date '2000-05-04', 'F', date '2021-01-04', 'Sales', 2);


CREATE TABLE Vehicles(
	registrationNo INT NOT NULL PRIMARY KEY,
    outletNo INT,
    FOREIGN KEY (outletNo) REFERENCES Outlets(outletNo),
	model VARCHAR(15) NOT NULL,
	make VARCHAR(15) NOT NULL,
	carSize VARCHAR(15) CHECK (carSize IN ('Compact', 'Mid-size', 'Full-size')),
	engineSize INT NOT NULL,
	capacity INT NOT NULL,
	currentMileage INT NOT NULL,
	dailyHireRate INT NOT NULL
);


INSERT INTO Vehicles(registrationNo, model, make, carSize, engineSize, capacity, currentMileage, dailyHireRate, outletNo)
VALUES(010101, 'Volkswagen', 'Tiguan', 'Mid-size', 2, 5, 20000, 100, 1);

INSERT INTO Vehicles(registrationNo, model, make, carSize, engineSize, capacity, currentMileage, dailyHireRate, outletNo)
VALUES(020202, 'Toyota', 'Corolla', 'Mid-size', 2, 5, 14000, 100, 2);

INSERT INTO Vehicles(registrationNo, model, make, carSize, engineSize, capacity, currentMileage, dailyHireRate, outletNo)
VALUES(030303, 'Dodge', 'Charger', 'Full-size', 2.5, 5, 30000, 200, 3);

INSERT INTO Vehicles(registrationNo, model, make, carSize, engineSize, capacity, currentMileage, dailyHireRate, outletNo)
VALUES(040404, 'Ford', 'Fusion', 'Mid-size', 1.8, 5, 16000, 175, 4);

INSERT INTO Vehicles(registrationNo, model, make, carSize, engineSize, capacity, currentMileage, dailyHireRate, outletNo)
VALUES(050505, 'Nissan', 'Maxima', 'Full-size', 3.5, 5, 28000, 175, 5);


CREATE TABLE Clients(
    clientNo INT NOT NULL PRIMARY KEY,
    firstName VARCHAR(15) NOT NULL,
	lastName VARCHAR(15) NOT NULL,
	address VARCHAR(60) NOT NULL,
	phoneNo INT NOT NULL,
	dob DATE,
    licenseNo INT NOT NULL
);

INSERT INTO Clients(clientNo, firstName, lastName, address, phoneNo, DOB, licenseNo)
VALUES(1, 'Leslie', 'Gerard', '3305 Highland Ave, Manhattan Beach, CA, 90266', 3108971955, date '1964-08-07', 99999999);

INSERT INTO Clients(clientNo, firstName, lastName, address, phoneNo, DOB, licenseNo)
VALUES(2, 'Gene', 'Wilder', '590 Haynes Ave, Beverly Hills, CA, 90210', 3108941955, date '1933-06-11', 11111111);

INSERT INTO Clients(clientNo, firstName, lastName, address, phoneNo, DOB, licenseNo)
VALUES(3, 'Nicki', 'Minaj', '56 Star Island Dr, Miami Beach, FL, 33139', 3052127866, date '1982-12-08', 22222222);

INSERT INTO Clients(clientNo, firstName, lastName, address, phoneNo, DOB, licenseNo)
VALUES(4, 'Jennifer', 'Lopez', '5538 San Vicente St, Coral Gables, FL, 33146', 3052127866, date '1982-12-08', 33333333);

INSERT INTO Clients(clientNo, firstName, lastName, address, phoneNo, DOB, licenseNo)
VALUES(5, 'Paris', 'Hilton', '500 Beverly Park Circle, Beverly Hills, CA, 90210', 3108087856, date '1981-02-17', 55555);


CREATE TABLE HireAgreements(
    clientNo INT,
    registrationNo INT,
	FOREIGN KEY (clientNo) REFERENCES Clients(clientNo),
	FOREIGN KEY (registrationNo) REFERENCES Vehicles(registrationNo),
	CONSTRAINT CompKey_hireNo PRIMARY KEY (clientNo, registrationNo),
	firstName varchar(15),
	lastName varchar(15),
    address varchar(60),
	phoneNo INT,
	startDate DATE,
	endDate DATE,
	model varchar(15),
	make varchar(15),
	startMileage INT,
	endMileage INT
);

DROP TABLE HireAgreements;

CREATE TABLE HireAgreements(
    hireNo INT NOT NULL PRIMARY KEY,
    clientNo INT,
    registrationNo INT,
	FOREIGN KEY (clientNo) REFERENCES Clients(clientNo),
	FOREIGN KEY (registrationNo) REFERENCES Vehicles(registrationNo),
	firstName varchar(15),
	lastName varchar(15),
    address varchar(60),
	phoneNo INT,
	startDate DATE,
	endDate DATE,
	model varchar(15),
	make varchar(15),
	startMileage INT,
	endMileage INT
);

INSERT INTO HireAgreements(hireNo, clientNo, registrationNo, startDate, endDate, startMileage, endMileage)
VALUES(1, 1, 050505, date '2020-11-01', date '2020-11-07', 27000, 28000);

UPDATE HireAgreements
    SET firstName = (SELECT firstName 
             FROM Clients
             WHERE clientNo = 1)
WHERE clientNo = 1;
             
UPDATE HireAgreements
    SET lastName = (SELECT lastName 
             FROM Clients
             WHERE clientNo = 1)
WHERE clientNo = 1;
             
UPDATE HireAgreements
    SET address = (SELECT address 
             FROM Clients
             WHERE clientNo = 1)
WHERE clientNo = 1;

UPDATE HireAgreements
    SET phoneNo = (SELECT phoneNo 
             FROM Clients
             WHERE clientNo = 1)
WHERE clientNo = 1;

UPDATE HireAgreements
    SET model = (SELECT model 
             FROM Vehicles
             WHERE registrationNo = 050505)
WHERE registrationNo = 050505;
             
UPDATE HireAgreements
    SET make = (SELECT make 
             FROM Vehicles
             WHERE registrationNo = 050505)
WHERE registrationNo = 050505;
             
INSERT INTO HireAgreements(hireNo, clientNo, registrationNo, startDate, endDate, startMileage, endMileage)
VALUES(2, 2, 020202, date '2020-10-01', date '2020-10-07', 13000, 13500);

UPDATE HireAgreements
    SET firstName = (SELECT firstName 
             FROM Clients
             WHERE clientNo = 2)
WHERE clientNo = 2;
             
UPDATE HireAgreements
    SET lastName = (SELECT lastName 
             FROM Clients
             WHERE clientNo = 2)
WHERE clientNo = 2;

UPDATE HireAgreements
    SET address = (SELECT address 
             FROM Clients
             WHERE clientNo = 2)
WHERE clientNo = 2;


UPDATE HireAgreements
    SET phoneNo = (SELECT phoneNo 
             FROM Clients
             WHERE clientNo = 2)
WHERE clientNo = 2;


UPDATE HireAgreements
    SET model = (SELECT model 
             FROM Vehicles
             WHERE registrationNo = 020202)
WHERE registrationNo = 020202;
             
UPDATE HireAgreements
    SET make = (SELECT make 
             FROM Vehicles
             WHERE registrationNo = 020202)
WHERE registrationNo = 020202;

INSERT INTO HireAgreements(hireNo, clientNo, registrationNo, startDate, endDate, startMileage, endMileage)
VALUES(3, 3, 040404, date '2020-10-05', date '2020-10-10', 14000, 15000);

UPDATE HireAgreements
    SET firstName = (SELECT firstName 
             FROM Clients
             WHERE clientNo = 3)
WHERE clientNo = 3;
             
UPDATE HireAgreements
    SET lastName = (SELECT lastName 
             FROM Clients
             WHERE clientNo = 3)
WHERE clientNo = 3;

UPDATE HireAgreements
    SET address = (SELECT address 
             FROM Clients
             WHERE clientNo = 3)
WHERE clientNo = 3;


UPDATE HireAgreements
    SET phoneNo = (SELECT phoneNo 
             FROM Clients
             WHERE clientNo = 3)
WHERE clientNo = 3;


UPDATE HireAgreements
    SET model = (SELECT model 
             FROM Vehicles
             WHERE registrationNo = 040404)
WHERE registrationNo = 040404;
             
UPDATE HireAgreements
    SET make = (SELECT make 
             FROM Vehicles
             WHERE registrationNo = 040404)
WHERE registrationNo = 040404;


INSERT INTO HireAgreements(hireNo, clientNo, registrationNo, startDate, endDate, startMileage, endMileage)
VALUES(4, 4, 010101, date '2020-05-05', date '2020-05-10', 9000, 9500);

UPDATE HireAgreements
    SET firstName = (SELECT firstName 
             FROM Clients
             WHERE clientNo = 4)
WHERE clientNo = 4;
             
UPDATE HireAgreements
    SET lastName = (SELECT lastName 
             FROM Clients
             WHERE clientNo = 4)
WHERE clientNo = 4;

UPDATE HireAgreements
    SET address = (SELECT address 
             FROM Clients
             WHERE clientNo = 4)
WHERE clientNo = 4;


UPDATE HireAgreements
    SET phoneNo = (SELECT phoneNo 
             FROM Clients
             WHERE clientNo = 4)
WHERE clientNo = 4;


UPDATE HireAgreements
    SET model = (SELECT model 
             FROM Vehicles
             WHERE registrationNo = 010101)
WHERE registrationNo = 010101;
             
UPDATE HireAgreements
    SET make = (SELECT make 
             FROM Vehicles
             WHERE registrationNo = 010101)
WHERE registrationNo = 010101;


INSERT INTO HireAgreements(hireNo, clientNo, registrationNo, startDate, endDate, startMileage, endMileage)
VALUES(5, 5, 030303, date '2020-09-20', date '2020-09-28', 14000, 15000);

UPDATE HireAgreements
    SET firstName = (SELECT firstName 
             FROM Clients
             WHERE clientNo = 5)
WHERE clientNo = 5;
             
UPDATE HireAgreements
    SET lastName = (SELECT lastName 
             FROM Clients
             WHERE clientNo = 5)
WHERE clientNo = 5;

UPDATE HireAgreements
    SET address = (SELECT address 
             FROM Clients
             WHERE clientNo = 5)
WHERE clientNo = 5;


UPDATE HireAgreements
    SET phoneNo = (SELECT phoneNo 
             FROM Clients
             WHERE clientNo = 5)
WHERE clientNo = 5;


UPDATE HireAgreements
    SET model = (SELECT model 
             FROM Vehicles
             WHERE registrationNo = 030303)
WHERE registrationNo = 030303;
             
UPDATE HireAgreements
    SET make = (SELECT make 
             FROM Vehicles
             WHERE registrationNo = 030303)
WHERE registrationNo = 030303;

