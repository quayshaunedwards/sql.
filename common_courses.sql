SELECT p.professor_name AS PROFESSOR, s.student_name AS STUDENT, COUNT(s.student_name) AS "CLASSES IN COMMON"
FROM (SELECT professor_id, professor_name FROM professors ORDER BY professor_name) p
JOIN courses c
ON p.professor_id = c.course_professor_id
JOIN students_courses sc
ON c.course_id = sc.sc_course_id
JOIN (SELECT student_id, student_name FROM students) s
ON sc.sc_student_id = s.student_id
GROUP BY PROFESSOR, STUDENT ORDER BY "CLASSES IN COMMON";