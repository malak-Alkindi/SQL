CREATE TABLE REGISTRATION
(AcNo NUMERIC PRIMARY KEY,
FName   varchar(15) not null,
LName   varchar(15) not null,
DOB Date,
RegDate Date   ,
CivilID NUMERIC Not null,
Gender  Char(1),
GSM     NUMERIC(8),
OpenBal NUMERIC)

ALTER TABLE registration 
add constraint gsm_unique
UNIQUE (GSM);
ALTER TABLE registration 
add constraint Openbal_check
CHECK (OpenBal >= 50);
ALTER TABLE registration 
add constraint gender_check
Check (Gender IN('M','m','F','f'));
-------------------------------
Create table deposits
(DNO  NUMERIC Primary key,
 AcNO NUMERIC,
 ddate date , 
 DAmt  NUMERIC not null,
 Dlocation varchar(10) not null,
constraint dept_reg_FK Foreign Key
(AcNO) References REGISTRATION(Acno));

create procedure addToregistration
      @AcNo NUMERIC ,
@FName   varchar(15),
@LName   varchar(15),
@DOB Date,
@RegDate Date   ,
@CivilID NUMERIC ,
@Gender  Char(1),
@GSM     NUMERIC(8),
@OpenBal NUMERIC
AS 
BEGIN 
     SET NOCOUNT ON 

     INSERT INTO REGISTRATION
          (                    
                 AcNo,
FName   ,
LName  ,
DOB ,
RegDate   ,
CivilID ,
Gender  ,
GSM   ,
OpenBal
          ) 
     VALUES 
          ( 
@AcNo,
@FName   ,
@LName  ,
@DOB ,
@RegDate   ,
@CivilID ,
@Gender  ,
@GSM   ,
@OpenBal
          ) 

END 

EXEC addToregistration 1,'malak','alkindi','2012-10-05','2012-10-05',123,'m',88654345,90
EXEC addToregistration 2,'fahima','alhapsi','2012-12-06','2014-11-05',123,'m',477747,70
EXEC addToregistration 3,'aisa','almamriu','2012-08-06','2016-11-05',1213,'f',144454,77

drop  procedure addToregistration
CREATE PROCEDURE UPDATEregistration

      @AcNo NUMERIC ,
@FName   varchar(15),
@LName   varchar(15),
@DOB Date,
@RegDate Date   ,
@CivilID NUMERIC ,
@Gender  Char(1),
@GSM     NUMERIC(8),
@OpenBal NUMERIC
AS
BEGIN
UPDATE REGISTRATION

     SET 
 FName = @FName,
 LName   = @LName,
 DOB = @DOB,
 RegDate =  @RegDate ,
 CivilID = @CivilID,
 Gender  =@Gender,
 GSM     =@GSM,
 OpenBal =@OpenBal
   
   WHERE AcNo =@AcNo


END 
drop PROCEDURE UPDATEregistration
EXEC UPDATEregistration  2,'malak','almamriu','2012-08-06','2016-11-05',12113,'f',144444,77



CREATE PROCEDURE deletreregistration

      @AcNo NUMERIC 
	  as
	  begin
DELETE FROM REGISTRATION
   WHERE AcNo =@AcNo


END 
drop PROCEDURE deletreregistration

EXEC deletreregistration 3


CREATE PROCEDURE deletreregistrationCOL


	  as
	  begin

ALTER TABLE REGISTRATION
DROP COLUMN DOB



END 
drop PROCEDURE deletreregistrationCOL

EXEC deletreregistrationCOL 

SELECT * FROM REGISTRATION
drop table REGISTRATION 

drop PROCEDURE addToDeposits
CREATE PROCEDURE addToDeposits
 @DNO  NUMERIC,
 @AcNO NUMERIC,
 @ddate date,
 @DAmt  NUMERIC,
 @Dlocation varchar(10),
 @dept_reg_FK NUMERIC 
AS 
BEGIN 
     SET NOCOUNT ON 

     INSERT INTO deposits
          (  
		   DNO   ,
 AcNO ,
 ddate  ,
 DAmt    ,
 Dlocation   ,
 dept_reg_FK 
          ) 
     VALUES 
          ( 
 @DNO   ,
 @AcNO ,
 @ddate  ,
 @DAmt    ,
 @Dlocation   ,
 @dept_reg_FK 
          ) 
END 

exec addToDeposits 11,1,'2012-08-06',10,'sur',1
-----------------------------
Create table withdrawls
(WNo NUMERIC Primary key,
Acno NUMERIC,
WDate   Date  ,
WAmount NUMERIC not null,
WLocation varchar(10) not null,
constraint dept_Withd_FK Foreign Key
(AcNO) References Registration(Acno));
---------------------------------
SELECT * FROM deposits
SELECT * FROM Registration 
---------------------------------
