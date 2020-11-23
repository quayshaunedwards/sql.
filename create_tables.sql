USE bottega_schema;

CREATE TABLE IF NOT EXISTS courses (
	course_id INT(11) UNIQUE AUTO_INCREMENT,
    course_name VARCHAR(45),
    course_professor_id INT(11),
    PRIMARY KEY (course_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS grades (
	grade_id INT(11) UNIQUE AUTO_INCREMENT,
    grade_course_id INT(11),
    grade_student_id INT(11),
    grade VARCHAR(1),
    PRIMARY KEY (grade_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS professors (
	professor_id INT(11) UNIQUE AUTO_INCREMENT,
    professor_name VARCHAR(45),
    PRIMARY KEY (professor_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS students (
	student_id INT(11) UNIQUE AUTO_INCREMENT,
    student_name VARCHAR(45),
    PRIMARY KEY (student_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS students_courses (
	students_courses_id INT(11) UNIQUE AUTO_INCREMENT,
    sc_student_id INT(11),
    sc_course_id INT(11),
    PRIMARY KEY (students_courses_id)
) ENGINE=INNODB;