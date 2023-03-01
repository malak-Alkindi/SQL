
-------------------------------------------------------------------------------------Exercise------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------Exercise-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------Exercise-------------------------------------------------------------------------------
--• Write a procedure which displays all even numbers below 100.
DROP procedure even 
create procedure even 
AS
BEGIN
DECLARE @evn NUMERIC
SET @evn =2
WHILE (@evn<100)
BEGIN
PRINT @evn
SET @evn=@evn+2
END
END
EXEC even 

--• Write a procedure which displays all odd numbers below 100.
create procedure oddno
AS
BEGIN
DECLARE @ODD NUMERIC
SET @ODD =1
WHILE (@ODD<100)
BEGIN
PRINT @ODD
SET @ODD=@ODD+2
END
END
EXEC oddno

--• Write a procedure which display whether a number is prime or not.


DROP procedure primen

create procedure primen @no integer
AS
BEGIN
DECLARE @outpt varchar(900)

DECLARE @pri integer
SET @pri =2
WHILE (@pri<@no)
BEGIN


IF (@no%@pri=0)    
 BEGIN
    set @outpt ='not prime'  
  END
ELSE
  BEGIN
     set @outpt ='prime' 
  END

SET @pri =@pri+1
END
print @outpt
END
EXEC primen 4
--• Write a procedure which display the sum of 10 numbers.

drop  procedure sumten 
create procedure sumten 
AS
BEGIN
DECLARE @flag NUMERIC
SET @flag =1

DECLARE @output NUMERIC
SET @output =0

SET @flag =1
WHILE (@flag<10)
BEGIN
set @output = @output +@flag
SET @flag=@flag+1


END


print @output 
END 
EXEC sumten

--• Write a procedure which display 20 multiples for all the numbers between 2 given numbers.
drop procedure multiples 

create procedure multiples @flag1 NUMERIC ,@flag2 NUMERIC
AS
BEGIN
DECLARE @flag NUMERIC
SET @flag =1

WHILE(@flag1>@flag2)
BEGIN
print  CONVERT(varchar(10),@flag1) +
      ' * ' +  CONVERT(varchar(10),@flag2) +' = '+CONVERT(varchar(10),(@flag1 *@flag2))

set @flag2=@flag2+1
END

END 

exec multiples 10, 3

--• Write a procedure which display 20 multiples for all the numbers 
drop procedure TWINTI 

create procedure TWINTI @NO NUMERIC 
AS
BEGIN
DECLARE @END NUMERIC
SET @END =@NO +20

DECLARE @START NUMERIC
SET @START =@NO 

WHILE(@START<@END)
BEGIN
print  CONVERT(varchar(10),@NO) +
      ' * ' +  CONVERT(varchar(10),@START) +' = '+CONVERT(varchar(10),(@START *@NO))

	 SET @START=@START+1
END

END 

exec TWINTI 10
--• Write a procedure to display the reverse of a given number.

drop  procedure reverses
create procedure reverses @n NUMERIC 
AS
BEGIN


WHILE (@n>0)
BEGIN

print @n
set @n=@n-1
END
END
EXEC reverses 10

--• Write a procedure to display the sum of individual digits of given = number.
drop  procedure sum
create procedure sum @n NUMERIC 
AS
BEGIN


print  CONVERT(varchar(10),@n) +
      ' + ' +  CONVERT(varchar(10),@n) +' = '+CONVERT(varchar(10),(@n +@n))

END
EXEC sum 10
-------------------------------------------------------------------------------------Exercise-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------Exercise-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------Exercise-------------------------------------------------------------------------------

