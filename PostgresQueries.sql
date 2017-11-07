-- Query 1
SELECT name FROM project_4.students WHERE id = 5101;

-- Query 2
SELECT name FROM project_4.students WHERE id >= 10000 AND id <= 15000;

-- Query 3
SELECT name FROM project_4.students s, project_4.transcript t WHERE s.id = t.stud_id AND t.crs_code = 'crsCode257065';

-- Query 4
SELECT s.name FROM project_4.students s, project_4.transcript t, project_4.teaching h, project_4.professors p WHERE 
s.id = t.stud_id
AND t.semester = h.semester
AND t.crs_code = h.crs_code
AND h.prof_id = p.id
AND p.name = 'name730481';

--Query 5
SELECT s.name
FROM project_4.students s, project_4.transcript t, project_4.courses c
WHERE s.id = t.stud_id AND t.crs_code = c.crs_code AND c.dept_id = 'deptId105452'

EXCEPT

SELECT s.name
FROM project_4.students s, project_4.transcript t, project_4.courses c
WHERE s.id = t.stud_id AND t.crs_code = c.crs_code AND c.dept_id = 'deptId117778';

--Query 6
SELECT s.name
FROM project_4.students s, project_4.transcript t 
WHERE s.id = t.stud_id AND
	t.crs_code IN
	(SELECT t.crs_code FROM project_4.courses c WHERE t.crs_code = c.crs_code AND c.dept_id = 'deptId349221')
GROUP BY s.name
HAVING COUNT(*) = (SELECT COUNT(*) FROM project_4.courses c WHERE c.dept_id = 'deptId349221');

