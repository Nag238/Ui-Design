CREATE DATABASE Staff
GO

use Staff
GO

CREATE TABLE Staff(staffNo int identity(100,1) primary key ,Name varchar(200),position varchar(100),Salary money)

GO

CREATE TABLE StaffDetails(staffNo int FOREIGN KEY REFERENCES Staff(staffNo),Gender varchar(200),Address varchar(100))
GO


CREATE PROCEDURE sp_InsertStaffData(@Name varchar(200),@position varchar(200),@Salary money,@gender varchar(10),@address varchar(200))
AS
BEGIN 
Declare @No int
INSERT INTO Staff VALUES (@Name,@position,@Salary)
select @No=SCOPE_IDENTITY()
INSERT INTO StaffDetails VALUES (@No,@gender,@address)
select @No as 'AutoID'
END

GO

alter PROCEDURE sp_UpdateStaffData(@staffNo int,@Name varchar(200),@position varchar(200),@Salary money,@address varchar(100))
AS
BEGIN
UPDATE staff set Name=@Name,position=@position,Salary=@Salary where staffNo=@staffNo
update StaffDetails set Address=@address where staffNo=@staffNo
end

go

CREATE PROCEDURE sp_DeleteStaffData(@staffNo int)
as 
begin
delete Staff where staffNo=@staffNo
end





