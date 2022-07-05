INSERT INTO Airports VALUES (101,'YYZ','Toronto Pearson International Airport','Toronto','Canada');
INSERT INTO Airports VALUES (102,'ICN','Incheon International Airport','Incheon','South Korea');
INSERT INTO Airports VALUES (222,'SIN','Singapore Changi Airport','Changi','Singapore');
INSERT INTO Airports VALUES (333,'JFK','John F. Kennedy International Airport','New York','US');
INSERT INTO Airports VALUES (221,'HAN','Noi Bai International Airport','Hanoi','Vietnam');
INSERT INTO Airports VALUES (123,'HND','Haneda Airport ','Tokyo','Japan');
INSERT INTO Airports VALUES (343,'TPE','Taiwan Taoyuan International Airport','Taipei','Taiwan');
INSERT INTO Airports VALUES (777,'YVR','Vancouver International Airport','Vancouver','Canada');
INSERT INTO Airports VALUES (898,'SFO','San Francisco International Airport','San Francisco','US');
INSERT INTO Airports VALUES (656,'CDG','Paris Charles de Gaulle Airport','Paris','France');
INSERT INTO Airports VALUES (123,'LHR','Heathrow Airport','London',' United Kingdom');
INSERT INTO Airports VALUES (232,'FRA','Frankfurt Airport','Frankfurt',' Germany');

INSERT INTO Departure VALUES ('YYZ','Toronto');
INSERT INTO Departure VALUES ('ICN','Incheon');
INSERT INTO Departure VALUES ('SIN','Changi');
INSERT INTO Departure VALUES ('JFK','New York');
INSERT INTO Departure VALUES ('HAN','Hanoi');
INSERT INTO Departure VALUES ('HND','Tokyo');
INSERT INTO Departure VALUES ('TPE','Taipei');
INSERT INTO Departure VALUES ('YVR','Vancouver');
INSERT INTO Departure VALUES ('SFO','San Francisco');
INSERT INTO Departure VALUES ('CDG','Paris');
INSERT INTO Departure VALUES ('LHR','London');
INSERT INTO Departure VALUES ('FRA','Germany');



INSERT INTO Arrive VALUES ('YYZ','Toronto');
INSERT INTO Arrive VALUES ('ICN','Incheon');
INSERT INTO Arrive VALUES ('SIN','Changi');
INSERT INTO Arrive VALUES ('JFK','New York');
INSERT INTO Arrive VALUES ('HAN','Hanoi');
INSERT INTO Arrive VALUES ('HND','Tokyo');
INSERT INTO Arrive VALUES ('TPE','Taipei');
INSERT INTO Arrive VALUES ('YVR','Vancouver');
INSERT INTO Arrive VALUES ('SFO','San Francisco');
INSERT INTO Arrive VALUES ('CDG','Paris');
INSERT INTO Arrive VALUES ('LHR','London');
INSERT INTO Arrive VALUES ('FRA','Germany');

INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'77W','777-300ER','Boeing',896,10668,18);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'77L','777-200LR','Boeing',896,10668,6);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'333','A330-300','Airbus',869,11277,16);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'321','A321-200','Airbus',837,10668,15);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'E75','E175','Embraer',811,10668,25);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'CRJ','CRJ200','Mitsubishi',789,10668,15);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'320','A320-200','Airbus',837,10668,17);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'789','787-9','Boeing',913,11887,29);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'788','787-8','Boeing',913,10700,8);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'319','A319-100','Airbus',837,10668,20);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'7M8','737 MAX 8','Boeing',839,10668,33);
INSERT INTO Fleet VALUES (fleet_number_SEQUENCE.NEXTVAL,'CR9','CRJ900','Mitsubishi',882,10668,35);

INSERT INTO Flights VALUES ('SI123','SFO','ICN','77W');
INSERT INTO Flights VALUES ('IH235','ICN','HAN','333');
INSERT INTO Flights VALUES ('ST555','SIN','TPE','E75');
INSERT INTO Flights VALUES ('HS897','HND','SIN','321');
INSERT INTO Flights VALUES ('TS939','TPE','SFO','789');
INSERT INTO Flights VALUES ('JL657','JFK','LHR','77L');
INSERT INTO Flights VALUES ('HF190','HAN','FRA','77W');
INSERT INTO Flights VALUES ('FC232','FRA','CDG','320');
INSERT INTO Flights VALUES ('YY411','YYZ','YVR','E75');
INSERT INTO Flights VALUES ('CY677','CDG','YYZ','321');
INSERT INTO Flights VALUES ('YJ369','YYZ','JFK','CRJ');


INSERT INTO Flight_Times VALUES ('SI123','01-July-2022','01-July-2022 10:35:00','02-July-2022 14:55:00',12,20);
INSERT INTO Flight_Times VALUES ('IH235','02-March-2022','02-March-2022 10:05:00','02-March-2022 12:40:00',4,35);
INSERT INTO Flight_Times VALUES ('ST555','03-February-2022','03-February-2022 01:00:00','03-February-2022 05:45:00',4,45);
INSERT INTO Flight_Times VALUES ('HS897','04-May-2021','04-May-2021 11:30:00','04-May-2021 17:40:00',7,10);
INSERT INTO Flight_Times VALUES ('TS939','05-June-2021','05-June-2021 09:50:00','05-June-2021 06:30:00',11,40);
INSERT INTO Flight_Times VALUES ('JL657','06-May-2021','06-May-2021 18:45:00','07-May-2021 06:45:00',7,0);
INSERT INTO Flight_Times VALUES ('HF190','07-September-2021','07-September-2021 12:10:00','07-September-2021 05:20:00',12,10);
INSERT INTO Flight_Times VALUES ('FC232','07-July-2021','07-July-2021 19:55:00','08-July-2021 21:20:00',1,25);
INSERT INTO Flight_Times VALUES ('YY411','10-November-2021','10-November-2021 18:20:00','10-November-2021 20:37:00',5,17);
INSERT INTO Flight_Times VALUES ('CY677','11-December-2021','11-December-2021 13:00:00','11-December-2021 15:05:00',8,5);
INSERT INTO Flight_Times VALUES ('YJ369','01-April-2022','01-April-2022 07:55:00','01-April-2022 10:00:00',2,5);






INSERT INTO Seat VALUES ('Signature','A01');
INSERT INTO Seat VALUES ('Signature','D05');
INSERT INTO Seat VALUES ('Signature','G07');
INSERT INTO Seat VALUES ('Premium Economy','A12');
INSERT INTO Seat VALUES ('Premium Economy','C13');
INSERT INTO Seat VALUES ('Premium Economy','E14');
INSERT INTO Seat VALUES ('Premium Economy','F12');
INSERT INTO Seat VALUES ('Premium Economy','K13');
INSERT INTO Seat VALUES ('Economy','B18');
INSERT INTO Seat VALUES ('Economy','D19');
INSERT INTO Seat VALUES ('Economy','H20');
INSERT INTO Seat VALUES ('Economy','J22');
INSERT INTO Seat VALUES ('Economy','K50');
INSERT INTO Seat VALUES ('Economy','A51');
INSERT INTO Seat VALUES ('Economy','E63');
INSERT INTO Seat VALUES ('Economy','F45');
INSERT INTO Seat VALUES ('Economy','C33');




INSERT INTO Passenger_Required_Info VALUES ('YS0711','YooSun',null,'Song','11-July-1996','25','Female','647-123-456','ysong86@my.centennialcollege.ca','South Korea');
INSERT INTO Passenger_Required_Info VALUES ('CS0711','Chacha',null,'Song','11-July-1995','26','Female','647-111-1111','chacha0711@gmail.com','Canada');
INSERT INTO Passenger_Required_Info VALUES ('MI0423','Matt',null,'Ishida','23-April-1988','33','Male','111-222-3333','mtt11@digimon.ad','Japan');
INSERT INTO Passenger_Required_Info VALUES ('VE0326','Violet',null,'Evergarden','26-March-2002','20','Female','777-666-1511','veever1004@garden.com','Canada');
INSERT INTO Passenger_Required_Info VALUES ('HP0730','Howl','Jenkins','Pendragon','30-July-1994','27','Male','647-253-7908',' howl8282@moving.cs','United Kingdom');
INSERT INTO Passenger_Required_Info VALUES ('SG1207','Satoru',null,'Gojo','07-December-1989','32','Male','375-888-9999','sg01207@gjujut.su','Japan');
INSERT INTO Passenger_Required_Info VALUES ('MC0404','Marinette','Dupain','Cheng','04-April-2007','14','Female','454-676-8080','ladybug@my.lady.fr','France');



INSERT INTO Passenger_Optional_Info VALUES ('YS0711','701, Hello World Ave' ,'Palo Alto','California','United States','CA 94306',null,'Tesla','Machine Learning','Machine Learning Engineer','Korean');
INSERT INTO Passenger_Optional_Info VALUES ('CS0711','1111, 11 Python Ave' ,'Toronto','Ontario','Canada','P1A 7A2','123-123-1234','Google','Cloud Data','Cloud Data Developer','English');
INSERT INTO Passenger_Optional_Info VALUES ('MI0423','101 Chome-1-50 Shirokanedai' ,'Tokyo',null,'Japan','108-8640',null,'The University of Tokyo','Department of biology',' Biologist','Japanese');
INSERT INTO Passenger_Optional_Info VALUES ('VE0326','3301, Leiden Ave' ,'Vancouver','British Columbia','Canada','B1O 9E1',null,'Claudia','Department of Japan','Translator','English');
INSERT INTO Passenger_Optional_Info VALUES ('HP0730','Howl moving castle' ,'London',null,'United Kingdom','SE1 7PB',null,'Howl Company','CEO','CEO','English');
INSERT INTO Passenger_Optional_Info VALUES ('SG1207','4 Chome-2-8 Shibakoen' ,'Tokyo ',null,'Japan ','105-0011',null,'TokyoModelAgency',null,'Model','Japanese');
INSERT INTO Passenger_Optional_Info VALUES ('MC0404','Champ de Mars 5 Av' ,'Paris',null,'France ','75007','232-23333-5555',null,null,null,'French');


INSERT INTO Mileage VALUES ('MILYS0711Z098','YS0711',7000);
INSERT INTO Mileage VALUES ('MILCS0711Y095','CS0711',11000);
INSERT INTO Mileage VALUES ('MILMI0423H123','MI0423',5000);
INSERT INTO Mileage VALUES ('MILHP0730U656','HP0730',120000);
INSERT INTO Mileage VALUES ('MILSG1207V707','SG1207',9000);
INSERT INTO Mileage VALUES ('MILMC0404G789','MC0404',2000);





INSERT INTO Reservation VALUES ('YSSIA01','YS0711','SI123','Member','Yes','MILYS0711Z098','A01',null,null,'Cat',1,400,'Credit Card',9500.20);
INSERT INTO Reservation VALUES ('CSYYA12','CS0711','YY411','Member','Yes','MILCS0711Y095','A12',23456,null,null,null,null,'Debit Card',2456.70);
INSERT INTO Reservation VALUES ('MIHSA51','MI0423','HS897','Member','Yes','MILMI0423H123','A51',56565,null,'Dog',2,600,'PayPal',1367.00 );
INSERT INTO Reservation VALUES ('VETSC33','VE0326','TS939','Guest','No',null,'C33',32321,null,null,null,null,'Credit Card',878.10);
INSERT INTO Reservation VALUES ('HPJLG07','HP0730','JL657','Member','Yes','MILHP0730U656','G07',11111,'Yes',null,null,null,'Credit Card',15145.25);
INSERT INTO Reservation VALUES ('SGHFE14','SG1207','HF190','Member','Yes','MILSG1207V707','E14',null,null,'Fox',1,400,'PayPal',3684.56);
INSERT INTO Reservation VALUES ('MCCYC13','MC0404','CY677','Member','Yes','MILMC0404G789','C13',65656,'Yes',null,null,null,'Credit Card',5613.38);
INSERT INTO Reservation VALUES ('YSYJA12','YS0711','YJ369','Member','Yes','MILYS0711Z098','A12',null,null,null,null,null,'Credit Card',650.50);


INSERT INTO Baggage_Info VALUES ('BGYSSI12','YS0711','SI123',2,60,null);
INSERT INTO Baggage_Info VALUES ('NoBG1','CS0711','YY411',null,null,null);
INSERT INTO Baggage_Info VALUES ('BGMIHS09','MI0423','HS897',2,55.3,175);
INSERT INTO Baggage_Info VALUES ('NoBG12','VE0326','TS939',null,null,null);
INSERT INTO Baggage_Info VALUES ('BGHPJL01','HP0730','JL657',4,128,200);
INSERT INTO Baggage_Info VALUES ('BGSGHF22','SG1207','HF190',2,48,null);
INSERT INTO Baggage_Info VALUES ('BGMCCY33','MC0404','CY677',3,96,200);
INSERT INTO Baggage_Info VALUES ('BGYSYJ15','YS0711','YJ369',1,20,null);   



INSERT INTO Check_In VALUES (07012211,'YS0711','SI123','SFO','ICN',
'01-July-2022','01-July-2022 10:35:00','02-July-2022 14:55:00',
'A01',1,'01-July-2022 09:45:00',12,'77W'
);


INSERT INTO Check_In VALUES (11102112,'CS0711','YY411','YYZ','YVR',
'10-November-2021','10-November-2021 18:20:00','10-November-2021 20:37:00',
'A12',2,'10-November-2021 17:40:00',1,'E75'
);


INSERT INTO Check_In VALUES (05042121,'MI0423','HS897','HND','SIN',
'04-May-2021','04-May-2021 11:30:00','04-May-2021 17:40:00',
'A51',1,'04-May-2021 10:50:00',112,'321'
);


INSERT INTO Check_In VALUES (06052133,'VE0326','TS939','TPE','SFO',
'05-June-2021','05-June-2021 09:50:00','05-June-2021 06:30:00',
'C33',3,'05-June-2021 09:00:00',50,'789'
);


INSERT INTO Check_In VALUES (05062102,'HP0730','JL657','JFK','LHR',
'06-May-2021','06-May-2021 18:45:00','07-May-2021 06:45:00',
'G07',1,'06-May-2021 18:00:00',150,'77L'
);


INSERT INTO Check_In VALUES (09072111,'SG1207','HF190','HAN','FRA',
'07-September-2021','07-September-2021 12:10:00','07-September-2021 05:20:00',
'E14',6,'07-September-2021 11:30:00',20,'77W'
);


INSERT INTO Check_In VALUES (12112165,'MC0404','CY677','CDG','YYZ',
'11-December-2021','11-December-2021 13:00:00','11-December-2021 15:05:00',
'C13',4,'11-December-2021 12:20:00',7,'321'
);


INSERT INTO Check_In VALUES (04012201,'YS0711','YJ369','YYZ','JFK',
'01-April-2022','01-April-2022 07:55:00','01-April-2022 10:00:00',
'A12',2,'01-April-2022 07:15:00',12,'CRJ'
);








