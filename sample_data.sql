USE bottega_schema;

-- COURSES TABLE --------------------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS course_data$$
CREATE PROCEDURE course_data()
BEGIN
	DECLARE i INT default 0;
    DECLARE p INT default 1;
    
    WHILE i < 20 DO
		INSERT INTO courses (course_name, course_professor_id)
		VALUES (
			CONCAT("Course", i),
            p
		);
        IF p > (SELECT COUNT(*) FROM professors) THEN
			SET p = 1;
		ELSE
			SET p = p + 1;
		END IF;
		SET i = i + 1;
	END WHILE;
    
END$$
DELIMITER ;
CALL course_data();
DROP PROCEDURE course_data;

-- STUDENTS TABLE --------------------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS students_data$$
CREATE PROCEDURE students_data()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= 100 DO
		INSERT INTO students (student_name)
        VALUES (CONCAT("Student", i));
        SET i = i + 1;
	END WHILE;
END$$;
DELIMITER ;
CALL students_data();
DROP PROCEDURE students_data;

-- STUDENTS_COURSES TABLE -----------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS students_courses_data$$
CREATE PROCEDURE students_courses_data()
BEGIN
	DECLARE i INT default 1;
    DECLARE s INT default 1;
    DECLARE c INT default 1;
    
    WHILE i <= 5 DO
		SET s = 1;
        SET c = i;
		WHILE s <= 100 DO
			INSERT INTO students_courses (sc_student_id, sc_course_id)
            VALUES (s, c);
            IF c >= 20 THEN SET c = 1;
            ELSE SET c = c + 1;
            END IF;
			SET s = s + 1;
        END WHILE;
        SET i = i + 1;
	END WHILE;
END$$;
DELIMITER ;
CALL students_courses_data();
DROP PROCEDURE students_courses_data;

-- PROFESSORS TABLE -----------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS professor_data$$
CREATE PROCEDURE professor_data()
BEGIN
	DECLARE i INT default 0;
    
    WHILE i < 5 DO
		INSERT INTO professors (professor_name)
		VALUE (CONCAT("Professor", i));
		SET i = i + 1;
	END WHILE;
    
END$$
DELIMITER ;
CALL professor_data();
DROP PROCEDURE professor_data;

-- GRADES TABLE -------------------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS grade$$
CREATE PROCEDURE grade(IN multiplier INT, OUT grade VARCHAR(1))
BEGIN
    DECLARE g VARCHAR(1) default NULL;
	SET max_sp_recursion_depth = 255;
    SET g = CHAR(FLOOR(65 + (RAND() * multiplier)));
    IF g = CHAR(69) THEN SET g = CHAR(67);
    END IF;
    SET grade = g;
END$$
DELIMITER ;
CALL grade(6, @grade);
SELECT @grade;
DROP PROCEDURE grade;

DELIMITER $$
DROP PROCEDURE IF EXISTS grades_data$$
CREATE PROCEDURE grades_data()
BEGIN
	DECLARE i INT default 1;
    DECLARE c INT default 1;
    DECLARE s INT default 1;
    DECLARE g VARCHAR(1) default NULL;
    WHILE i <= 5 DO
		SET s = 1;
        SET c = i;
		WHILE s <= 100 DO
			CALL grade(6, @g);
			SET g = @g;
			INSERT INTO grades (grade_course_id, grade_student_id, grade)
            VALUES (c, s, g);
            IF c >= 20 THEN SET c = 1;
            ELSE SET c = c + 1;
            END IF;
			SET s = s + 1;
        END WHILE;
        SET i = i + 1;
	END WHILE;
    SELECT * FROM grades;
END$$
DELIMITER ;
CALL grades_data();
DROP PROCEDURE grades_data;

DELIMITER $$
DROP PROCEDURE IF EXISTS update_grades$$
CREATE PROCEDURE update_grades()
BEGIN
	DECLARE i INT default 1;
    WHILE i <= (SELECT COUNT(*) FROM grades) DO
		CALL grade(6, @grade);
        UPDATE grades
        SET grade = @grade
        WHERE grade_id = i;
        SET i = i + 1;
	END WHILE;
END$$
DELIMITER ;
CALL update_grades();
SELECT * FROM grades;
DROP PROCEDURE update_grades;