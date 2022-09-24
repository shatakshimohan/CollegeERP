DROP TABLE IF EXISTS Student, Class,Course, Dept,Teacher, StudentCourse,Assign,Assign_time,Marks,Attendance;

CREATE TABLE Dept (
	dept_id VARCHAR(100) NOT NULL,
	name VARCHAR(200) NOT NULL,
	PRIMARY KEY (dept_id)
);

CREATE TABLE Course (
	name VARCHAR ( 50 ) NOT NULL,
	id VARCHAR (50) NOT NULL PRIMARY KEY,
    shortname VARCHAR ( 50 ) NOT NULL ,
	deptid VARCHAR (100) NOT NULL,
	FOREIGN KEY (deptid) REFERENCES Dept(dept_id) DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE Class (
	class_id VARCHAR(100) NOT NULL PRIMARY KEY,
	section VARCHAR(100) NOT NULL, 
	sem int NOT NULL,
	deptid VARCHAR(100), 
	FOREIGN KEY (deptid) REFERENCES Dept(dept_id) 
);

CREATE TABLE Student(
	USN VARCHAR ( 100 ) PRIMARY KEY NOT NULL,
	name VARCHAR ( 200 ) NOT NULL,
	sex VARCHAR (50) NOT NULL,
    classid VARCHAR ( 100 ) NOT NULL,
	DOB DATE NOT NULL,
	FOREIGN KEY (classid) REFERENCES Class(class_id)
);

CREATE TABLE Teacher (
	teacher_id VARCHAR(100) NOT NULL PRIMARY KEY, 
	name VARCHAR(100) NOT NULL, 
	sex VARCHAR(50) NOT NULL, 
	DOB DATE NOT NULL,
	deptid VARCHAR(100), 
	FOREIGN KEY (deptid) REFERENCES Dept(dept_id) 
	
);

CREATE TABLE Assign (
	id int NOT NULL PRIMARY KEY,
	classid VARCHAR (100) NOT NULL,
	course VARCHAR (50) NOT NULL,
	teacher VARCHAR (100) NOT NULL,
	FOREIGN KEY (classid) REFERENCES Class(class_id),
	FOREIGN KEY (course) REFERENCES Course(id),
	FOREIGN KEY (teacher) REFERENCES Teacher(teacher_id)
);

CREATE TABLE Assign_Time ( 
    id int NOT NULL PRIMARY KEY ,
	period VARCHAR(50) NOT NULL,
	day VARCHAR(15) NOT NULL,
	assign_id int NOT NULL, 
	FOREIGN KEY (assign_id) REFERENCES Assign(id)
);

CREATE TABLE Attendance (
	id int NOT NULL PRIMARY KEY, 
	date DATE NOT NULL, 
	status BOOL NOT NULL, 
	course_id VARCHAR(50),
	FOREIGN KEY (course_id) REFERENCES Course(id), 
	student_id VARCHAR(100),
	FOREIGN KEY (student_id) REFERENCES Student(USN)
	
);

CREATE TABLE StudentCourse(
	student VARCHAR(200) NOT NULL,
	course VARCHAR (50) NOT NULL,
	FOREIGN KEY (student) REFERENCES Student(USN),
	FOREIGN KEY (course) REFERENCES Course(id),
	PRIMARY KEY (student,course)
);

CREATE TABLE Marks( 
	id int NOT NULL PRIMARY KEY,
	Total_Marks int NOT NULL,
	Marks_Scored int NOT NULL,
	date DATE NOT NULL,
	grade VARCHAR(20) NOT NULL,
	student_id VARCHAR(100) NOT NULL, 
	course_id VARCHAR (50) NOT NULL,
	FOREIGN KEY (student_id) REFERENCES Student(USN),
	FOREIGN KEY (course_id) REFERENCES Course(id)
);

INSERT INTO Dept Values ('A001', 'Computer Science');
INSERT INTO Dept Values ('B001', 'Electronics');
INSERT INTO Dept Values ('M001', 'Mechanical');
INSERT INTO Dept Values ('C001', 'Civil');
INSERT INTO Dept Values ('E001', 'Electrical');

INSERT INTO Course Values ('Data Structures And Algorithms', 'CS201', 'DSA', 'A001');
INSERT INTO Course Values ('Mathematics', 'CS202', 'MATHS', 'A001');
INSERT INTO Course Values ('Operating Systems', 'CS203', 'OS', 'A001');
INSERT INTO Course Values ('Compiler Design', 'CS301', 'CD', 'A001');
INSERT INTO Course Values ('Software Engineering', 'CS302', 'SE', 'A001');
INSERT INTO Course Values ('Database Management Systems', 'CS303', 'DBMS','A001');
INSERT INTO Course Values ('Embedded System Design', 'EC201', 'ESD', 'B001');
INSERT INTO Course Values ('Internet of Things', 'EC202', 'IOT', 'B001');
INSERT INTO Course Values ('Digital Image Processing', 'EC301', 'DIP', 'B001');
INSERT INTO Course Values ('VLSI Technology', 'EC302', 'VLSI', 'B001');
INSERT INTO Course Values ('Solid Mechanics', 'ME201', 'SLDM', 'M001');
INSERT INTO Course Values ('Thermodynamics', 'ME202', 'THRM', 'M001');
INSERT INTO Course Values ('Machine Designs', 'ME301', 'MCHD', 'M001');
INSERT INTO Course Values ('Fluid Dynamics', 'ME302', 'FLD', 'M001');
INSERT INTO Course Values ('Structural Mechanics', 'CV201', 'STM', 'C001');
INSERT INTO Course Values ('Applied Statistics', 'CV202', 'STATS', 'C001');
INSERT INTO Course Values ('Hydraulic Design', 'CV301', 'HYD', 'C001');
INSERT INTO Course Values ('Fluid Mechanics', 'CV302', 'FLDM', 'C001');
INSERT INTO Course Values ('Basic Electric Circuits', 'EE201', 'BEC', 'E001');
INSERT INTO Course Values ('Signals and Systems', 'EE202', 'SAS', 'E001');
INSERT INTO Course Values ('Microelectronics', 'EE301', 'MCRS', 'E001');
INSERT INTO Course Values ('Analog Circuits', 'EE302', 'ANC', 'E001');

INSERT INTO Class Values ('001','A', '5', 'A001');
INSERT INTO Class Values ('002', 'B', '5', 'A001');
INSERT INTO Class Values ('003','C', '5', 'B001');
INSERT INTO Class Values ('004', 'D', '5', 'B001');
INSERT INTO Class Values ('005','E', '5', 'C001');
INSERT INTO Class Values ('006', 'F', '5', 'C001');
INSERT INTO Class Values ('007','G', '5', 'M001');
INSERT INTO Class Values ('008', 'H', '5', 'M001');
INSERT INTO Class Values ('009','I', '5', 'E001');
INSERT INTO Class Values ('010', 'J', '5', 'E001');

INSERT INTO Student Values ('19EC379', 'Shatakshi', 'F', '003', '2000-09-07');
INSERT INTO Student Values ('19CS389', 'Siddhi', 'F', '002', '2001-09-07');
INSERT INTO Student Values ('19CS399', 'Sonit', 'M', '002', '2000-10-07');
INSERT INTO Student Values ('19CS319', 'Susan', 'F', '001', '2000-07-07');
INSERT INTO Student Values ('19EC369', 'Abdul', 'M', '003', '2000-04-07');
INSERT INTO Student Values ('19ME359', 'Muhammed', 'M', '007', '2001-09-07');
INSERT INTO Student Values ('19ME349', 'Aziza', 'F', '007','2000-05-07');
INSERT INTO Student Values ('19CV339', 'Wasim', 'M', '005', '2000-02-07');
INSERT INTO Student Values ('19CV329', 'Rahim', 'M', '006', '2000-12-07');
INSERT INTO Student Values ('19EE319', 'Zahia', 'F', '009', '2001-07-07');
INSERT INTO Student Values ('19EE309', 'Melissa', 'F', '010', '2002-04-07');

INSERT INTO Teacher Values  ('379', 'Sara', 'F', '1996-11-02','A001');
INSERT INTO Teacher Values ('389', 'Lisa', 'F', '1996-10-12','A001');
INSERT INTO Teacher Values ('399', 'Donald', 'M','1986-05-13','B001');
INSERT INTO Teacher Values ('369', 'Abdul', 'M','1988-12-22','B001');
INSERT INTO Teacher Values ('319', 'Melissa', 'F','1977-12-01','M001');
INSERT INTO Teacher Values ('329', 'William', 'M','1983-12-02','M001');
INSERT INTO Teacher Values ('359', 'Benjamin', 'M','1981-12-02','C001');
INSERT INTO Teacher Values ('349', 'Evelyn', 'F', '1967-08-14', 'C001');
INSERT INTO Teacher Values ('339', 'Justin', 'M', '1975-03-13', 'E001');



INSERT INTO Assign Values ('101','001', 'CS201', '379');
INSERT INTO Assign Values ('102','002', 'CS301', '389');
INSERT INTO Assign Values ('103','003', 'EC201', '399');
INSERT INTO Assign Values ('104','004', 'EC302', '369');
INSERT INTO Assign Values ('105','005', 'ME301', '319');
INSERT INTO Assign Values ('106','006', 'ME302', '329');
INSERT INTO Assign Values ('107','007', 'EE302', '339');
INSERT INTO Assign Values ('108','008', 'CV301', '349');
INSERT INTO Assign Values ('109','009', 'CV302', '359');

INSERT INTO Assign_Time Values ('111','6', 'Monday', '101' );
INSERT INTO Assign_Time Values ('112','5', 'Tuesday', '103' );
INSERT INTO Assign_Time Values ('113','6', 'Wednesday', '105' );
INSERT INTO Assign_Time Values ('114','5', 'Thursday', '107' );
INSERT INTO Assign_Time Values ('115','6', 'Friday', '104' );
INSERT INTO Assign_Time Values ('116','5', 'Monday', '102' );

INSERT INTO StudentCourse Values ('19CS399', 'CS201');
INSERT INTO StudentCourse Values ('19CS389', 'CS302');
INSERT INTO StudentCourse Values ('19EC379', 'EC302');
INSERT INTO StudentCourse Values ('19EC369', 'EC202');
INSERT INTO StudentCourse Values ('19ME359', 'ME301');
INSERT INTO StudentCourse Values ('19ME349', 'ME201');
INSERT INTO StudentCourse Values ('19CV339', 'CV201');
INSERT INTO StudentCourse Values ('19CV329', 'CV202');
INSERT INTO StudentCourse Values ('19EE319', 'EE302');
INSERT INTO StudentCourse Values ('19CS319', 'CS201');
INSERT INTO StudentCourse Values ('19CS319', 'CS302');
INSERT INTO StudentCourse Values ('19CS389', 'CS201');


INSERT INTO Attendance Values ('001', '2021-10-11', 'TRUE', 'CS201', '19CS399');
INSERT INTO Attendance Values ('002', '2021-10-11', 'FALSE', 'CS201', '19CS389');
INSERT INTO Attendance Values ('003', '2021-10-11', 'FALSE', 'CS201', '19CS319');
INSERT INTO Attendance Values ('004', '2021-10-11', 'TRUE', 'CS301', '19CS399');
INSERT INTO Attendance Values ('005', '2021-10-11', 'FALSE', 'EC201', '19EC379');
INSERT INTO Attendance Values ('006', '2021-10-11', 'FALSE', 'EC301', '19EC369');
INSERT INTO Attendance Values ('007', '2021-10-11', 'TRUE', 'ME302', '19ME359');
INSERT INTO Attendance Values ('008', '2021-10-11', 'TRUE', 'ME301', '19ME349');
INSERT INTO Attendance Values ('009', '2021-10-11', 'TRUE', 'CV302', '19CV339');
INSERT INTO Attendance Values ('010', '2021-10-11', 'FALSE', 'EE202', '19EE319');
INSERT INTO Attendance Values ('011', '2021-10-12', 'TRUE', 'CS201', '19CS399');
INSERT INTO Attendance Values ('012', '2021-10-12', 'TRUE', 'CS301', '19CS389');
INSERT INTO Attendance Values ('013', '2021-10-12', 'FALSE', 'EC201', '19EC379');
INSERT INTO Attendance Values ('014', '2021-10-12', 'FALSE', 'EC301', '19EC369');
INSERT INTO Attendance Values ('015', '2021-10-12', 'TRUE', 'ME302', '19ME359');
INSERT INTO Attendance Values ('016', '2021-10-12', 'TRUE', 'ME301', '19ME349');
INSERT INTO Attendance Values ('017', '2021-10-12', 'TRUE', 'CV302', '19CV339');
INSERT INTO Attendance Values ('018', '2021-10-12', 'FALSE', 'EE202', '19EE319');




INSERT INTO Marks Values ('1', '40', '20','11-10-2021','D','19CS399','CS303');
INSERT INTO Marks Values ('2', '40', '34','11-10-2021','A','19CS389','CS201');
INSERT INTO Marks Values ('3', '40', '37','11-10-2021','S','19EC379','EC301');
INSERT INTO Marks Values ('4', '40', '28','11-10-2021','B','19EC369','EC302');
INSERT INTO Marks Values ('5', '40', '18','11-10-2021','C','19EE319','EE301');
INSERT INTO Marks Values ('6', '40', '29','11-10-2021','B','19ME349','ME201');
INSERT INTO Marks Values ('7', '40', '36','11-10-2021','S','19EE309','EE202');
INSERT INTO Marks Values ('8', '40', '30','11-10-2021','B','19CV329','CV301');
INSERT INTO Marks Values ('9', '40', '32','11-10-2021','A','19CS399','CS201');
INSERT INTO Marks Values ('10', '40', '9','11-10-2021','F','19EE309','EE201');
INSERT INTO Marks Values ('11', '40', '5','11-10-2021','F','19EE309','EE301');

CREATE USER _student WITH PASSWORD 'student789';
CREATE USER _collegeadmin WITH PASSWORD 'admin456';
CREATE USER _collegeadmin WITH PASSWORD 'admin456';

GRANT SELECT ON Course,Dept,Marks,Attendance TO _student;
GRANT SELECT ON Dept,Course,Class,Student,Attendance,StudentCourse,Marks TO _teacher;
GRANT INSERT,UPDATE ON Attendance,Marks TO _teacher;
GRANT ALL ON ALL TABLES IN SCHEMA PUBLIC TO _collegeadmin;
