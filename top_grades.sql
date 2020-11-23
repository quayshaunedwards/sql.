USE bottega_schema;

SELECT s.student_name AS "STUDENT", c.course_name AS "COURSE", MIN(grade) AS "HIGHEST GRADE"
FROM grades g
JOIN students s
ON g.grade_student_id = s.student_id
JOIN courses c
ON g.grade_course_id = c.course_id
GROUP BY s.student_name;


SELECT s.student_name AS "STUDENT", c.course_name AS "COURSE", g.grade AS "GRADES"
FROM grades g
JOIN students s
ON g.grade_student_id = s.student_id
JOIN courses c
ON g.grade_course_id = c.course_id
ORDER BY s.student_id, g.grade;