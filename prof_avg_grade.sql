USE bottega_schema;

SELECT p.professor_id AS PROFESSOR, c.course_id AS COURSE, AVG(ASCII(grade)) AS PRE_CONVERT_AVERAGE, CONVERT(CHAR(FLOOR(AVG(ASCII(grade)))) USING utf8) AS AVERAGE_GRADE
FROM (SELECT professor_id FROM professors GROUP BY professor_id) p
JOIN (SELECT course_id, course_professor_id FROM courses GROUP BY course_id) c
ON p.professor_id = c.course_professor_id
JOIN grades g
ON c.course_id = g.grade_course_id
GROUP BY COURSE ORDER BY PROFESSOR, PRE_CONVERT_AVERAGE DESC;