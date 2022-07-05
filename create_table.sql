DROP TABLE Airports CASCADE CONSTRAINTS;
DROP TABLE Departure CASCADE CONSTRAINTS;
DROP TABLE Arrive CASCADE CONSTRAINTS;
DROP TABLE Fleet CASCADE CONSTRAINTS;
DROP TABLE Flights CASCADE CONSTRAINTS;
DROP TABLE Flight_Times CASCADE CONSTRAINTS;
DROP TABLE Seat CASCADE CONSTRAINTS;
DROP TABLE Passenger_Required_Info CASCADE CONSTRAINTS;
DROP TABLE Passenger_Optional_Info CASCADE CONSTRAINTS;
DROP TABLE Mileage CASCADE CONSTRAINTS;
DROP TABLE Reservation CASCADE CONSTRAINTS;
DROP TABLE Baggage_Info CASCADE CONSTRAINTS;
DROP TABLE Check_In CASCADE CONSTRAINTS;
DROP TABLE NO_SHOW CASCADE CONSTRAINTS;




--Airport Information



Create Table Airports(
    airport_id NUMBER(6)NOT NULL,
    airport_code CHAR(3) NOT NULL,
    airport_name VARCHAR(40),
    airport_city VARCHAR(40),
    airport_country VARCHAR2(40),
    CONSTRAINT airport_code_pk PRIMARY KEY(airport_code)
);

-- Flight Information

Create Table Departure(
    departure_code CHAR(3) NOT NULL,
    departure_name VARCHAR(40),
    CONSTRAINT departure_code_pk PRIMARY KEY(departure_code),
    CONSTRAINT departure_code_fk FOREIGN KEY (departure_code) REFERENCES Airports(airport_code)ON DELETE CASCADE
);

Create Table Arrive(
    arrive_code CHAR(3) NOT NULL,
    arrive_name VARCHAR(40),
    CONSTRAINT arrive_code_pk PRIMARY KEY(arrive_code),
    CONSTRAINT arrive_code_fk FOREIGN KEY (arrive_code) REFERENCES Airports(airport_code) ON DELETE CASCADE

);

--Airplane

CREATE TABLE Fleet (
    fleet_number NUMBER(5),
    fleet_id VARCHAR(10),
    fleet_model VARCHAR(50),
    fleet_company VARCHAR(50),
    cruise_speed NUMBER(5),
    cruise_altitude NUMBER(5),
    number_of_aircraft NUMBER(20),
    CONSTRAINT fleet_iD_pk PRIMARY KEY(fleet_iD)
);

Create Table Flights(
    flight_number VARCHAR(10) NOT NULL,
    flight_departure_code CHAR(3)NOT NULL,
    flight_arrive_code CHAR(3) NOT NULL,
    flight_fleet_id VARCHAR(10),
    CONSTRAINT flight_number_pk PRIMARY KEY(flight_number),
    CONSTRAINT flight_departure_code_fk FOREIGN KEY (flight_departure_code) REFERENCES Departure(departure_code) ON DELETE CASCADE,
    CONSTRAINT flight_arrive_code_fk FOREIGN KEY (flight_arrive_code) REFERENCES Arrive(arrive_code)ON DELETE CASCADE,
    CONSTRAINT flight_fleet_id_fk FOREIGN KEY (flight_fleet_id) REFERENCES Fleet(fleet_id)ON DELETE CASCADE,
    CONSTRAINT flighet_from_de_to_ar_ck CHECK (flight_departure_code != flight_arrive_code)
);


--flight time
Create Table Flight_Times(
    t_flight_number VARCHAR(10) NOT NULL,
    flight_date DATE NOT NULL,
    flight_departure_time TIMESTAMP(8) NOT NULL,
    flight_arrive_time TIMESTAMP(8) NOT NULL,
    travel_time_hour NUMBER(4) NOT NULL,
    travel_time_minute NUMBER(4) NOT NULL,
    CONSTRAINT Flight_Times_group_pk PRIMARY KEY(flight_date,flight_departure_time,flight_arrive_time),
    CONSTRAINT t_flight_number_fk FOREIGN KEY (t_flight_number) REFERENCES Flights(flight_number) ON DELETE CASCADE
);



-- Seat


CREATE TABLE Seat(
    seat_type VARCHAR(30) NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    CONSTRAINT seat_number_pk PRIMARY KEY(seat_number)
);





-- Passenger Information

CREATE TABLE Passenger_Required_Info (
    passenger_id VARCHAR(10) NOT NULL,
    passenger_first_name VARCHAR(30) NOT NULL,
    passenger_middle_name VARCHAR(30) DEFAULT ' ',
    passenger_last_name VARCHAR(30) NOT NULL,
    passenger_dob DATE NOT NULL,
    passenger_age NUMBER(5) NOT NULL,
    passenger_gender VARCHAR(30) NOT NULL,
    passenger_phone_number CHAR(13) NOT NULL,
    passenger_email VARCHAR(50) NOT NULL,
    passenger_country VARCHAR(30) NOT NULL,
    CONSTRAINT passenger_id_pk PRIMARY KEY(passenger_id),
    CONSTRAINT passenger_gender_ck CHECK (passenger_gender IN('Female', 'Male','Others')) 
);




CREATE TABLE Passenger_Optional_Info (
    passenger_id VARCHAR(10) NOT NULL,
    passenger_address VARCHAR(30),
    passenger_city VARCHAR(30),
    passenger_state VARCHAR(30),
    passenger_address_country VARCHAR(80),
    passenger_zip_code VARCHAR(30),
    passenger_other_phone_number VARCHAR(30),
    passenger_comapny_name VARCHAR(30),
    passenger_department VARCHAR(30),
    passenger_position VARCHAR(30),
    primary_language VARCHAR(30),
    CONSTRAINT passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES Passenger_Required_Info(passenger_id) ON DELETE CASCADE
);


CREATE TABLE Mileage(
mileage_id VARCHAR(30) NOT NULL,
m_passenger_id VARCHAR(10) NOT NULL,
available_mileage NUMBER(20),
CONSTRAINT mileage_id_pk PRIMARY KEY(mileage_id),
CONSTRAINT m_passenger_id_fk FOREIGN KEY (m_passenger_id) REFERENCES Passenger_Required_Info(passenger_id) ON DELETE CASCADE

);
-- Resrvation

Create TABLE Reservation (
    reservation_id VARCHAR(10) NOT NULL,
    r_passenger_id VARCHAR(10) NOT NULL,
    r_flight_number VARCHAR(10) NOT NULL,
    book_as VARCHAR(10) NOT NULL,
    mileage CHAR(3) NOT NULL,
    r_mileage_id VARCHAR(30), 
    r_seat_number VARCHAR(10) NOT NULL, 
    preferred_booking_reference NUMBER(10) DEFAULT NULL,
    companion CHAR(3),
    pet CHAR(20),
    num_of_pet NUMBER(5),
    cost_to_fly_pet NUMBER(10),
    payment_method VARCHAR(20) NOT NULL,
    total_amount NUMBER(10,2) NOT NULL,
    CONSTRAINT reservation_id_pk PRIMARY KEY(reservation_id),
    CONSTRAINT r_passenger_id_fk FOREIGN KEY (r_passenger_id) REFERENCES Passenger_Required_Info(passenger_id) ON DELETE CASCADE,
    CONSTRAINT r_flight_number_fk FOREIGN KEY (r_flight_number) REFERENCES Flights(flight_number) ON DELETE CASCADE,
    CONSTRAINT r_seat_number_fk FOREIGN KEY (r_seat_number) REFERENCES Seat(seat_number) ON DELETE CASCADE,
    CONSTRAINT r_mileage_id_fk FOREIGN KEY (r_mileage_id) REFERENCES Mileage(mileage_id) ON DELETE CASCADE,
    CONSTRAINT mileage_ck CHECK (mileage IN('Yes', 'No')) ,
    CONSTRAINT payment_method_ck CHECK (payment_method IN('Credit Card','Debit Card', 'PayPal'))  
);




--BaggageInfo


CREATE TABLE Baggage_Info(
    baggage_id VARCHAR(10) NOT NULL,
    b_passenger_id VARCHAR(10) NOT NULL,
    b_flight_number VARCHAR(10) NOT NULL,
    baggage_amount NUMBER(5),
    baggage_total_weight NUMBER(5,2),
    extra_charge NUMBER(5,2),
    CONSTRAINT baggage_id_pk PRIMARY KEY(baggage_id),
    CONSTRAINT b_passenger_id_fk FOREIGN KEY (b_passenger_id) REFERENCES Passenger_Required_Info(passenger_id) ON DELETE CASCADE,
    CONSTRAINT b_flight_number_fk FOREIGN KEY (b_flight_number) REFERENCES Flights(flight_number) ON DELETE CASCADE
);





--Check_In

Create Table Check_In(
    check_in_id NUMBER(10) Not Null,
    c_passenger_id VARCHAR(10),
    c_flight_number VARCHAR(10) NOT NULL,
    c_departure_code CHAR(3) NOT NULL,
    c_arrive_code CHAR(3) NOT NULL,
    c_flight_date DATE NOT NULL,
    c_flight_departure_time TIMESTAMP(8) NOT NULL,
    c_flight_arrive_time TIMESTAMP(8) NOT NULL,
    c_seat_number VARCHAR(10) NOT NULL,
    terminal NUMBER(10) NOT NULL,
    bording_time TIMESTAMP(8) NOT NULL,
    bording_gate NUMBER(10) NOT NULL,
    c_fleet_id VARCHAR(10) NOT NULL,
    
    CONSTRAINT check_in_id_pk PRIMARY KEY(check_in_id),
    CONSTRAINT c_passenger_id_fk FOREIGN KEY (c_passenger_id) REFERENCES Passenger_Required_Info(passenger_id) ON DELETE CASCADE,
    CONSTRAINT c_flight_number_fk FOREIGN KEY (c_flight_number) REFERENCES Flights(flight_number) ON DELETE CASCADE,
    CONSTRAINT c_departure_code_fk FOREIGN KEY (c_departure_code) REFERENCES Departure(departure_code) ON DELETE CASCADE,
    CONSTRAINT c_arrive_code_fk FOREIGN KEY (c_arrive_code) REFERENCES Arrive(arrive_code) ON DELETE CASCADE,
    CONSTRAINT c_seat_number_fk FOREIGN KEY (c_seat_number) REFERENCES Seat(seat_number) ON DELETE CASCADE,
    CONSTRAINT c_flight_time_group_fk FOREIGN KEY (c_flight_date,c_flight_departure_time,c_flight_arrive_time) REFERENCES Flight_Times(flight_date,flight_departure_time,flight_arrive_time) ON DELETE CASCADE,
    CONSTRAINT terminal_ck CHECK (terminal between 1 and 6),
    CONSTRAINT bording_time_ck CHECK (bording_time < c_flight_departure_time),
    CONSTRAINT bording_gate_ck CHECK (bording_gate between 1 and 150)
    );
    
    
    
   CREATE TABLE NO_SHOW(
    no_check_in_id NUMBER(10) Not Null,
    no_passenger_id VARCHAR(10),
    no_flight_number VARCHAR(10) NOT NULL,
    no_seat_number VARCHAR(10) NOT NULL
    );




