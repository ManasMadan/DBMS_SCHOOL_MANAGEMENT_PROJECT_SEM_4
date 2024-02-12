CREATE TABLE student (
	admission_num INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	date_of_join DATE,
	date_of_birth DATE,
	fee_status ENUM('Paid' , 'Unpaid'),
	email VARCHAR(100),
	house_no VARCHAR(20),
	city VARCHAR(50),
	state VARCHAR(50),
	pincode VARCHAR(10),
	gender ENUM('Male' , 'Female' ,'Other')
);

CREATE TABLE student_ph (
  admission_num INT,
  phone_no VARCHAR(15),
  PRIMARY KEY (admission_num, phone_no),
  FOREIGN KEY (admission_num) REFERENCES student(admission_num)
);

CREATE TABLE parent (
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  admission_num INT,
  parent_id INT,
  occupation VARCHAR(100),
  mobile_no VARCHAR(15),
  email VARCHAR(100),
  PRIMARY KEY (admission_num, parent_id),
  FOREIGN KEY (admission_num) REFERENCES student(admission_num),
  CHECK (parent_id IN (0, 1, 2))
);

CREATE TABLE attendance (
  date DATE,
  admission_num INT,
  status ENUM('Present','Absent'),
  PRIMARY KEY (date, admission_num),
  FOREIGN KEY (admission_num) REFERENCES student(admission_num)
);

CREATE TABLE teacher (
  teacher_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  status ENUM('Temporary' , 'Permanent'),
  gender ENUM('Male' , 'Female' ,
  'Other'),
  mobile_no VARCHAR(15),
  email VARCHAR(100)
);

CREATE TABLE grade (
  grade_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE classroom (
  classroom_id INT PRIMARY KEY,
  grade_id INT,
  teacher_id INT,
  section VARCHAR(5),
  FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
  FOREIGN KEY (grade_id) REFERENCES grade(grade_id)
);

CREATE TABLE classroom_st (
  classroom_id INT,
  admission_num INT,
  PRIMARY KEY (classroom_id, admission_num),
  FOREIGN KEY (classroom_id) REFERENCES classroom(classroom_id),
  FOREIGN KEY (admission_num) REFERENCES student(admission_num)
);

CREATE TABLE course ( course_id INT PRIMARY KEY, course_name VARCHAR(100), grade_id INT, FOREIGN KEY (grade_id) REFERENCES grade(grade_id)
);

CREATE TABLE exam ( exam_name VARCHAR(50) PRIMARY KEY, total_marks INT
);

CREATE TABLE result (exam_name VARCHAR(50), course_id INT, admission_num INT, marks INT, PRIMARY KEY (exam_name, course_id, admission_num), FOREIGN KEY (exam_name) REFERENCES exam(exam_name), FOREIGN KEY (course_id) REFERENCES course(course_id), FOREIGN KEY (admission_num) REFERENCES student(admission_num)
);