USE bottega_schema;

SELECT c.course_id AS COURSE_ID, AVG(ASCII(grade)) AS PRE_CONVERT_AVERAGE, CONVERT(CHAR(FLOOR(AVG(ASCII(grade)))) USING utf8) AS AVERAGE_GRADE
FROM (SELECT grade, grade_course_id FROM grades) g
JOIN (SELECT course_id FROM courses GROUP BY course_id) c 
ON c.course_id = g.grade_course_id
GROUP BY COURSE_ID ORDER BY AVERAGE_GRADE DESC, NUMERICAL_AVERAGE DESC;
