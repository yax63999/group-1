  /*
		CUSTOMER TABLE
*/
CREATE TABLE Customer (
    Customer_id TEXT PRIMARY KEY,
    Customer_name TEXT,
    Customer_email TEXT,
    Customer_contact INTEGER
);


CREATE TABLE Staff (
    Staff_id TEXT PRIMARY KEY,
    Staff_role TEXT,
    Staff_name TEXT,
    Staff_date TEXT
);

CREATE TABLE Room (
    Room_id INTEGER PRIMARY KEY,
    Room_type TEXT,
    Room_status TEXT,
    Room_price REAL
);

CREATE TABLE Booking (
    Booking_id TEXT PRIMARY KEY,
    Customer_id TEXT,
    Staff_id TEXT,
    Booking_date TEXT,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

CREATE TABLE Payment (
    Payment_id TEXT PRIMARY KEY,
    Staff_id TEXT,
    Amount REAL,
    Price REAL,
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
);

CREATE TABLE Schedule (
    Schedule_id INTEGER PRIMARY KEY,
    Room_id INTEGER,
    CheckIn_time TEXT,
    CheckOut_time TEXT,
    CheckIn_date TEXT,
    CheckOut_date TEXT,
    Booking_id TEXT,
    FOREIGN KEY (Room_id) REFERENCES Room(Room_id),
    FOREIGN KEY (Booking_id) REFERENCES Booking(bBoking_id)
);

INSERT INTO Customer (Customer_id, Customer_name, Customer_email, Customer_contact) VALUES
('C001', 'Yax', 'yax@gmail.com', 221345678),
('C002', 'Mankirat', 'mankirat@gmail.com', 229876543),
('C003', 'Juan Pablo', 'juanpablo@gmail.com', 225551234),
('C004', 'Warunin maam', 'waruninmaam@gmail.com', 225531234),
('C005', 'Harsana', 'harsana@gmail.com', 228551234);

INSERT INTO Staff (Staff_id, Staff_role, Staff_name, Staff_date) VALUES
('S001', 'Manager', 'Harshana', '2022-01-15'),
('S002', 'Front Desk', 'Lei sun', '2023-03-10'),
('S003', 'Manager', 'Jack jobs', '2021-07-22');

INSERT INTO Room (Room_id, Room_type, Room_status, Room_price) VALUES
(101, 'Single', 'Available', 80.00),
(102, 'Double', 'Occupied', 120.00),
(103, 'Suite', 'Available', 250.00);

INSERT INTO Booking (Booking_id, Customer_id, Staff_id, Booking_date) VALUES
('B001', 'C001', 'S002', '2025-09-01'),
('B002', 'C002', 'S002', '2025-09-03'),
('B003', 'C003', 'S001', '2025-09-05');

INSERT INTO Payment (Payment_id, Staff_id, Amount, Price) VALUES
('P001', 'S002', 1, 120.00),
('P002', 'S002', 2, 240.00),
('P003', 'S001', 1, 250.00);

INSERT INTO Schedule (Schedule_id, Room_id, CheckIn_time, CheckOut_time, CheckIn_date, CheckOut_date, booking_id) VALUES
(1, 102, '14:00', '11:00', '2025-09-01', '2025-09-02', 'B001'),
(2, 101, '15:00', '10:30', '2025-09-03', '2025-09-05', 'B002'),
(3, 103, '13:00', '12:00', '2025-09-05', '2025-09-07', 'B003');

.headers on
.mode columns

select * from Customer;
select * from Staff;
select * from Room;
select * from Booking;
select * from Payment;
select * from Schedule;


/* use case 
1.	Login / Register
2.	Check-in Guest
3.	Check-out Guest
4.	Make Reservation
5.	Cancel Reservation
6.	Search Room Availability
7.	Update Guest Information
8.	Make Payment
9. Extend Guest Stay
10. View Booking Details
11. Change Room
12. Report on payment
*/


-- 1.	Login / Register 

-- Register
INSERT INTO Customer (Customer_id, Customer_name, Customer_email, Customer_contact)
VALUES ('C006', 'Guest', 'guest@gmail.com', 987123456);

-- Login
SELECT *
FROM Customer
WHERE Customer_email = 'guest@gmail.com'
  AND Customer_contact = 987123456;

--. 10. View Booking Details 

SELECT * 
FROM Booking
WHERE Booking_id = 'B001';

-- 7.	Update Guest Information 

UPDATE Customer
SET Customer_contact = 987654321, Customer_email = 'yaxsecond@gmail.com'
WHERE Customer_id = 'C001';

SELECT * FROM Customer WHERE Customer_id = 'C001';

-- 4.	Make Reservation

INSERT INTO Booking (Booking_id, Customer_id, Staff_id, Booking_date)
VALUES ('B004', 'C004', 'S003', '2025-09-15');
SELECT * FROM Booking;

-- 5.  Cancel Reservation

DELETE FROM Booking
WHERE Booking_id = 'B004';

UPDATE Room
SET Room_Status = 'Available'
WHERE Room_id = 102;

-- 6.	Search Room Availability
SELECT * 
FROM Room
WHERE Room_status = 'Available'
AND Room_type = 'Suite';

--2.	Check-in Guest

INSERT INTO Booking (Booking_id, Customer_id, Staff_id, Booking_date)
VALUES ('B009', 'C009', 'S009', '2025-09-10');


INSERT INTO Schedule (Schedule_id, Room_id, Checkin_time, Checkin_date, Booking_id)
VALUES (4, 109, '14:00', '2025-09-10', 'B009');

UPDATE Room
SET Room_Status = 'Occupied'
WHERE Room_id = 101;

        -- check in guest queery
SELECT * 
FROM Schedule
WHERE Booking_id = 'B009';

-- 3.	Check-out Guest

UPDATE Schedule
SET CheckOut_time = '11:00', CheckOut_date = '2025-09-12'
WHERE Booking_id = 'B001';

UPDATE Room
SET Room_Status = 'Available'
WHERE Room_id = 101;

-- 9. Extend Guest Stay

UPDATE Schedule
SET CheckOut_date = '2025-09-15', CheckOut_time = '12:00'
WHERE Booking_id = 'B001';

UPDATE Room
SET Room_Status = 'Occupied'
WHERE Room_id = 101;


--8. Make Payment

INSERT INTO Payment (Payment_id, Staff_id, Amount, Price)
VALUES ('P004', 'S002', 2, 240.00);

SELECT * 
FROM Payment
WHERE Payment_id = 'P004';

--11.Change Room

UPDATE Schedule
SET Room_id = 103
WHERE Booking_id = 'B002';

UPDATE Room
SET Room_status = 'Occupied'
WHERE Room_id = 103;

UPDATE Room
SET Room_status = 'Available'
WHERE Room_id = 102;

--12. Report on payment


SELECT Payment_id, Staff_id, Amount, Price
FROM Payment;




