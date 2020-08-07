create database sqlcase1;

/*study from student.csv file*/ 

select * from sqlcase1.stdent;
/* LIST ALL 2A STUDENTS*/
select name,id,class
from sqlcase1.stdent
where class='2A';
/*LIST THE NAMES AND MATH TEST OF 1B */
select name,mtest,class
from sqlcase1.stdent
where class='1b';
/*NAME START WITH T AND DON'T CONTAIN Y*/ 
select name,id,class
from sqlcase1.stdent
where name like 't%'
and name not like '%y%';
/*WHOSE NAMES CONTAIN T AS A THIRD LETTER*/
select name,id,class
from sqlcase1.stdent
where name regexp"^..e";
/*LIST THE NAME OF THE 1A STUDENTS WHOSE MTEST SCORE IS NOT....*/
select name,id,class,mtest
from sqlcase1.stdent
where class='1a' and mtest not	in(51,61,71,81,91);
/*LIST THE STUDENTS WHO BORN BETWEEN THE DATE*/
select name,id,class
from sqlcase1.stdent
where dob Between '1986-03-22' and '1986-04-21';

/*FIND THE NUMBER OF THE F=GIRLS LIVING TST*/
select name,sex,dcode
from sqlcase1.stdent
where sex='f' and dcode='tst';
/*pass mtest>50*/
select name,class,mtest
from sqlcase1.stdent
where mtest>50;
/*list the number of girls grouped by each class*/
select count(class) as total,class,sex
from sqlcase1.stdent
where sex='f'
group by class;
/*list the number of girls grouped by each year*/
select count(dob) as total,dob
from sqlcase1.stdent
where sex='f'
group by dob;

/*find the average marks of mtest of each class*/

select Class, Round(avg(Mtest),0) as AverageMaths
FROM sqlcase1.stdent
Group By Class;
/*find the max marks of mtest of each class*/
select sex, Round(max(Mtest),0) as Maths
FROM sqlcase1.stdent
Group By sex;

/*AVERAGE MATTH NUMBER AMONG BOYS*/
select avg(mtest) as avgmath, class,count(*) as numberofstudents
from sqlcase1.stdent
where Sex='m'
group by class
having count(*)>=2;

/* study from phy/chem/bio*/

/* COMMOM MEMBERS OF PHYSICS AND CHEMISTRY*/
select FullName, ID
from sqlcase1.phy
where ID in(select ID from sqlcase1.chem);

/*STUDENT COMMON IN BIO AND CHEM CLASS BUT NOT IN PHYSICS CLASS*/
SELECT ID, FullName
FROM sqlcase1.chem
WHERE ID IN (SELECT ID FROM Bio) and 
      ID NOT IN (SELECT ID FROM Phy); 
 
/*STUDY OF CLIENT.CSV*/
select * from sqlcase1.client;

/* PRODUCE A LIST OF PATH IN ASCENDING ORDER OF QUANTITY*/
select Qty,Part_no,Supplier
from sqlcase1.client
order by Qty asc;

/* CONSIDER A LIST OF PARTS THAT CONSISTS "SHAFT" IN THE DESCRIPTION*/
select Qty,Part_no,Supplier,Descript
from sqlcase1.client
where Descript regexp"^shaft";

/*PRODUCE A LIST OF WHERE QTY>20 AND SUPPLIED BY 'CHINA METALS CO'*/
select Qty,Part_no,Supplier,Descript
from sqlcase1.client
where Qty>20 and Supplier='China Metals Co.';

/* list all the suppilers without duplication*/
select  distinct Supplier
from sqlcase1.client;

/* INCREASE THE QUANTITY 10 OF THOSE PARTS WHOSE QUANTITY LESS THAN 10*/
Update sqlcase1.client
Set Qty = Qty + 10
where Qty < 10; 

/*delete where part number are 879,654,231,234*/
DELETE  
FROM sqlcase1.client
WHERE Part_no IN (879, 654, 231, 234); 

/*ADD A FIELD DATE_PURCHASE ' TO RECORD THE DATE OF PURCHASE*/
alter table sqlcase1.client
add column date_purchase varchar(100);










 








