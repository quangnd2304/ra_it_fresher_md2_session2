-- 1. Tạo CSDL Student_Management
create database student_management;
-- 2. Sử dụng CSDL Student_Management
use student_management;
-- 3. Xóa CSDL Student_Management
drop database student_management;
-- 4. Tạo bảng lớp sinh viên gồm các thông tin: mã lớp, tên lớp, trạng thái
create table class(
	class_id int primary key auto_increment,
    class_name varchar(20) not null unique,
    class_status bit default(1)
);
-- 5. Tạo bảng Student gồm các cột mã sinh viên, tên sinh viên, tuổi, địa chỉ, giới tính, email, phone...
create table student(
	student_id char(5) primary key,
    student_name varchar(50) not null,
    age int check(age>=18),
    address text,
    sex bit default(1),
    student_status bit default(1)
);
-- 6. tạo bảng class_student
create table class_student(
	class_id int,
    student_id char(5),
    -- rằng buộc khóa ngoại
    foreign key (class_id) references class(class_id),
    foreign key (student_id) references student(student_id),
    -- khóa chính
    primary key(class_id,student_id)
);
-- 7. Thêm một cột email vào bảng student
alter table student
	add column email varchar(50);

-- 8. Sử kiểu dữ liệu cột email thành text
alter table student
	modify column email text;
-- 9. Xóa cột email trong student
alter table student
	drop column email;
-- 10. thêm constraint cho 1 cột: thêm unique cho cột studentName
alter table student
	add constraint unique_student_name unique(student_name);
-- 11. Xóa constraint unique trên student_namestudent_namestudent_name
alter table student
	drop constraint unique_student_name;
-- 12. Xóa bảng student
drop table student;









