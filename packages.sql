 --FUNCTION
CREATE OR REPLACE FUNCTION ticket_price (
    new_reservation_id Reservation.reservation_id%TYPE) 
RETURN VARCHAR 
IS
    new_ticket_price Reservation.total_amount%TYPE;
BEGIN
    SELECT
        (total_amount - cost_to_fly_pet)
    
    into new_ticket_price
    FROM
        Reservation
    WHERE
        reservation_id = new_reservation_id;

    RETURN new_ticket_price;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('There is exception');
        RETURN '';
END; 

-- ticket_price Test

SET serveroutput ON

declare
ticekt number := ticket_price('YSSIA01');

begin
dbms_output.put_line( 'Only Ticket Price: $'||ticekt );
end;

declare
ticekt number := ticket_price('SGHFE14');
begin

dbms_output.put_line( 'Only Ticket Price: $'||ticekt );
end;



-- function

CREATE OR REPLACE function insert_new_bagg(
p_id in Baggage_Info.baggage_id%type,
p_pass_id in Baggage_Info.b_passenger_id%type,
p_fl_num in Baggage_Info.b_flight_number%type,
p_amn in Baggage_Info.baggage_amount%type,
p_t_w in Baggage_Info.baggage_total_weight%type,
p_ex in Baggage_Info.extra_charge%type
) 
RETURN varchar2 
AS
        
BEGIN

    insert into Baggage_Info(baggage_id, b_passenger_id,b_flight_number, baggage_amount, baggage_total_weight, extra_charge)
    values(p_id,p_pass_id,p_fl_num,p_amn,p_t_w,p_ex);
        COMMIT;

    return 'Insert New Baggage Information';
    
END;

--insert_new_bagg test
SET serveroutput ON

declare
 my_baggage VARCHAR2(100);
begin
 my_baggage := insert_new_bagg('BGSLIH33','SL0221','IH235',1,20,null);
 dbms_output.put_line(my_baggage);
end;


-- function
Create or replace function ck_mileage
(new_id Mileage.mileage_id%TYPE)
Return VARCHAR
IS  new_mil  Mileage.available_mileage%TYPE; pass Mileage.m_passenger_id%TYPE;
Begin
Select available_mileage,m_passenger_id into new_mil,pass from Mileage where mileage_id= new_id;

If (new_mil > 6000)
then 
dbms_output.put_line('Passenger ID'|| pass);
dbms_output.put_line('You can use your mileages');
Else
dbms_output.put_line('Passenger ID'|| pass);
dbms_output.put_line('Your mileages are not enough to use');
END IF;
RETURN new_mil;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Does not exist');
        RETURN '';
END;

--ck_mileage test
declare
mil number := ck_mileage('MILMC0404G789');

begin
dbms_output.put_line( 'Your Mileage: '||mil );
end;

declare
mil number := ck_mileage('MILHP0730U656');

begin
dbms_output.put_line( 'Your Mileage: '||mil );
end;

--PROCEDURE

 CREATE OR REPLACE PROCEDURE Passenger_Optional_Info_UPDATE
(new_passenger_id IN Passenger_Optional_Info.passenger_id%TYPE, 
new_passenger_address in Passenger_Optional_Info.passenger_address%TYPE,
new_passenger_city in  Passenger_Optional_Info.passenger_city%TYPE,
new_passenger_state in Passenger_Optional_Info.passenger_state%TYPE,
new_passenger_address_country in Passenger_Optional_Info.passenger_address_country%TYPE,
new_passenger_zip_code in Passenger_Optional_Info.passenger_zip_code%TYPE,
new_passenger_other_number in Passenger_Optional_Info.passenger_other_phone_number%TYPE,
new_passenger_comapny_name in Passenger_Optional_Info.passenger_comapny_name%TYPE,
new_passenger_department in Passenger_Optional_Info.passenger_department%TYPE,
new_passenger_position in Passenger_Optional_Info.passenger_position%TYPE,
new_primary_language in Passenger_Optional_Info.primary_language%TYPE)
IS
BEGIN

INSERT INTO Passenger_Optional_Info(passenger_id,passenger_address,passenger_city,passenger_state,passenger_address_country,passenger_zip_code,passenger_other_phone_number,passenger_comapny_name,passenger_department,passenger_position,primary_language)
VALUES(new_passenger_id,new_passenger_address,new_passenger_city,new_passenger_state,new_passenger_address_country,new_passenger_zip_code,new_passenger_other_number,new_passenger_comapny_name,new_passenger_department,new_passenger_position,new_primary_language);

 dbms_output.put_line('Added New Passenger Optional Information');
COMMIT;
END;


--Passenger_Optional_Info_UPDATE test
set serverout on
declare

begin

  Passenger_Optional_Info_UPDATE('SL0221','111, SG wannabe ave','Toronto','Ontario','Canada','S3G 3W1',null,'Korean Singer','SG Wanna Be+','Singer','Korean');
end;


--PROCEDURE
Create or Replace Procedure Pet_Data

IS

CURSOR cur_data is (SELECT * from Reservation);
new_row Reservation%ROWTYPE;

BEGIN

OPEN cur_data;

LOOP

FETCH cur_data INTO new_row;
EXIT WHEN cur_data%NOTFOUND;
dbms_output.put_line('Reservation ID: '||new_row.reservation_id);
dbms_output.put_line('Pet Type: '||new_row.pet);
dbms_output.put_line('Number OF Pet: '||new_row.num_of_pet);
dbms_output.put_line('Cost For Pet: '||new_row.cost_to_fly_pet);
dbms_output.put_line(' ');
END LOOP;

CLOSE cur_data;

END;

--Pet_Data check
exec Pet_Data;



--PROCEDURE

CREATE OR REPLACE PROCEDURE ck_gender
IS
CURSOR cur_gen IS (SELECT * FROM Passenger_Required_Info);
gender CHAR(1);
BEGIN
FOR n_gen IN cur_gen 
LOOP
IF(n_gen.passenger_gender = 'Male') THEN
    gender := 'M';
ELSE
  gender := 'F';
END IF;
DBMS_OUTPUT.PUT_LINE(n_gen.passenger_first_name||' '||n_gen.passenger_last_name|| ' > '||  gender);
DBMS_OUTPUT.PUT_LINE('  ');
END LOOP;
END;

--ck_gender check
exec ck_gender;

--PROCEDURE

CREATE OR REPLACE PROCEDURE p_flight_time
IS
CURSOR cur_time IS (SELECT * FROM Flight_Times);
new_time Flight_Times%ROWTYPE;
BEGIN
OPEN cur_time ;

LOOP
FETCH cur_time INTO new_time;
EXIT WHEN cur_time%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Flight Number: '|| new_time.t_flight_number);
DBMS_OUTPUT.PUT_LINE('Travel Time: '|| new_time.travel_time_hour||' : '||new_time.travel_time_minute);
DBMS_OUTPUT.PUT_LINE('  ');
END LOOP;

CLOSE cur_time;
END;

--p_flight_time check
exec p_flight_time;




