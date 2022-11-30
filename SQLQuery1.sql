create database wipro;

create table student
(rollno int, 
name varchar(25), 
mobile bigint);

insert into student values(1,'Abhi',8793633272);
insert into student values(2,'Tharun',8798462534);
insert into student values(3,'Ranveer',1523862534,28);
insert into student values(4,'Anup',8792862534,24);


select * from student;

alter table student add age int;
delete from student where rollno=4;

update student set age=24 where rollno=1;
update student set age=23 where rollno=2;

alter table student add batchid int;

alter table student 
add constraint fkbid foreign key (batchid) references batch(batchid);

update student set batchid=101 where rollno=1;
update student set batchid=102 where rollno=2;
update student set batchid=103 where rollno=3;

update student set rollno=4 where name='Anup';




