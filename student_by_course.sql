USE bottega_schema;

SELECT sc.sc_course_id AS "COURSE", s.student_name AS "STUDENT NAME"
FROM students_courses sc
INNER JOIN students s
ON s.student_id = sc_student_id
ORDER BY sc.sc_course_id;

SELECT sc.sc_course_id AS "COURSE", COUNT(s.student_id) AS "CLASS SIZE"
FROM students_courses sc
INNER JOIN students s
ON s.student_id = sc_student_id
GROUP BY sc.sc_course_id;