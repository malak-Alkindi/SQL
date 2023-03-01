------------------------------------------------ table-------------------------------------------------
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

---------------------------------------------- alters ---------------------------------------------------
ALTER TABLE registration 
add constraint gsm_unique
UNIQUE (GSM);
ALTER TABLE registration 
add constraint Openbal_check
CHECK (OpenBal >= 50);
ALTER TABLE registration 
add constraint gender_check
Check (Gender IN('M','m','F','f'));

---------------------------------------------- create procedure ---------------------------------------------------
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

---------------------------------------------- delete procedure ---------------------------------------------------
drop procedure addToregistration

---------------------------------------------- update procedure ---------------------------------------------------
CREATE PROCEDURE UPDATEregistration

      @AcNo NUMERIC ,
@OpenBal NUMERIC
AS
BEGIN
UPDATE REGISTRATION

     SET 

 OpenBal =@OpenBal
   
   WHERE AcNo =@AcNo


END 

--------------------------------------------------- excute/ fire procedure------------------------------------------------------------
EXEC addToregistration 1,'malak','alkindi','2012-10-05','2012-10-05',123,'m',88654345,90
EXEC addToregistration 2,'fahima','alhapsi','2012-12-06','2014-11-05',123,'m',477747,70
EXEC addToregistration 3,'aisa','almamriu','2012-08-06','2016-11-05',1213,'f',144454,77

EXEC UPDATEregistration 1,41

-------------------------------------------------- get the table -----------------------------------------------
select * FROM REGISTRATION

---============================================================================================================---
       ----------------------------------------------------------------------------------------------------
                         ---------------------------triggers------------------------------
       ----------------------------------------------------------------------------------------------------
---============================================================================================================---
--1. Create a trigger (Trigger_Deposit_Bal_Update) on Deposits table to update OpenBal in Registration table,
--   whenever a person deposits money in the account. 
create trigger Trigger_Deposit_Bal_Update
on Registration for update
as
if update(OpenBal)
begin 

print 'open bal updated '
rollback transaction  
end 

 ---============================================================================================================---
--2.Create a trigger (Trigger_Withdrawls_Bal_Update) on Withdrawls table to update OpenBal in Registration table, whenever a person 
--  withdraws money from the account. 
--  Make sure to perform OpenBal check before he withdraws 
--  money. WAmount should be less than OpenBal 
 create trigger Trigger_Withdrawls_Bal_Update
 on Registration 
 for update
as
if ( select OpenBal from deleted ) = 90
begin 
print 'malak is important dont update'
rollback transaction  
end 
else 
print 'record deleted '
end

create trigger deleteTrigger 
 on Registration 
 for delete
as
begin 
declare @x numeric
set @x=(select OpenBal from deleted)
if @x =90
begin 
print 'malak is important dont update  '
rollback transaction 
end 
else 

print 'malak is important dont update  '
end 