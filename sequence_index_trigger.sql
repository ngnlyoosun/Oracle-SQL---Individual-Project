--sequence
--sequence1


Create Sequence airport_id_SEQUENCE START WITH 100 increment by 10 nocache;

--update airports table with airport_id_SEQUENCE
update airports
set airport_id = airport_id_SEQUENCE.nextval
where airport_code in(airport_code);

--Current value of airport_id_SEQUENCE

select airport_id_SEQUENCE.CURRVAL from DUAL;

--insert new data in Airports using sequence
declare
    type data_record is record
    (
    new_airport_id number(6) := airport_id_SEQUENCE.nextval,
    new_airport_code CHAR(3) := 'CRK',
    new_airport_name VARCHAR(40):= 'Clark International Airport',
    new_airport_city VARCHAR(40):='Mabalacat',
    new_country VARCHAR(40):='Philippines');
    new_airports data_record;
begin
    insert into Airports
    VALUES new_airports;
end; 



--sequence2
Create Sequence fleet_number_SEQUENCE START WITH 1 increment by 1 nocache;

--Current value of fleet_number_SEQUENCE

select fleet_number_SEQUENCE.CURRVAL from DUAL;

--insert new data in Fleet using sequence

declare
    type data_rec is record
    (
    new_fleet_number  Fleet.fleet_number%TYPE :=fleet_number_SEQUENCE.nextval,
    new_fleet_id Fleet.fleet_id%TYPE :='223',
    new_fleet_model  Fleet.fleet_model%TYPE := 'A220-300',
    new_fleet_company Fleet.fleet_company%TYPE := 'Airbus',
    new_cruise_speed  Fleet.cruise_speed%TYPE := 829,
    new_cruise_altitude Fleet.cruise_altitude%TYPE :=10668,
    new_number_of_aircraft Fleet.cruise_altitude%TYPE := 27);
    new_fleet data_rec;
begin
    insert into Fleet
    VALUES new_fleet;
end; 


--INDEX

 CREATE INDEX idx_pname
ON Passenger_Required_Info (passenger_id, passenger_first_name,passenger_last_name);


 CREATE INDEX idx_check_in
ON Check_In (check_in_id, c_passenger_id,c_flight_number,c_seat_number,c_flight_departure_time);


--trigger 

Create or Replace  Trigger insert_new_airport
AFTER
INSERT ON Airports
FOR EACH ROW

BEGIN

INSERT INTO Departure
VALUES(:NEW.airport_code, :NEW.airport_city);

INSERT INTO Arrive
VALUES(:NEW.airport_code, :NEW.airport_city);

END;


declare
    type data_record is record
    (
    new_airport_id number(6) := airport_id_SEQUENCE.nextval,
    new_airport_code CHAR(3) := 'DXB',
    new_airport_name VARCHAR(40):= 'Dubai International Airport',
    new_airport_city VARCHAR(40):='Dubai',
    new_country VARCHAR(40):='United Arab Emirates');
    new_airports data_record;
begin
    insert into Airports
    VALUES new_airports;
end; 



CREATE TRIGGER welocome_trigger
  AFTER INSERT ON Passenger_Required_Info
  FOR EACH ROW
BEGIN dbms_output.put_line('Welocome NEW Passenger!');
END;


-- welocome_trigger Test
SET serveroutput ON;

INSERT INTO Passenger_Required_Info VALUES ('SL0221','Seok Hoon',null,'LEE','21-February-1984','38','Male','240-400-2008','sg_seok0424@sg.wanna.be','South Korea');



create or replace trigger no_show_trigger
 after delete on Check_In 
 for each row
 begin
 insert into No_Show
 values(:old.check_in_id,:old.c_passenger_id,:old.c_flight_number,:old.c_seat_number);
 end;

-- no_show_trigger Test
delete from Check_In where check_in_id = 05042121;


CREATE TRIGGER new_res_trig
  AFTER INSERT ON Reservation
  FOR EACH ROW
BEGIN dbms_output.put_line('Success new reservation');
END;

-- new_res_trigr Test
INSERT INTO Reservation VALUES ('SLIHG07','SL0221','IH235','Guest','No',null,'G07',33333,'YES','Cat',1,400,'Credit Card',2400.20);

