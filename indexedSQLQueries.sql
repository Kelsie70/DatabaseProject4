
DROP INDEX prof_id
ON db_project_4.professors;

DROP INDEX stud_id
ON db_project_4.students;

DROP INDEX trans_stud_id
ON db_project_4.transcript;

DROP INDEX crs_code
ON db_project_4.transcript;

DROP INDEX teaching_crs_code
on db_project_4.teaching;

DROP INDEX courses_crs_code
on db_project_4.courses;

DROP INDEX courses_dept_id
on db_project_4.courses;

CREATE INDEX prof_id
ON db_project_4.professors (id);

CREATE INDEX stud_id
ON db_project_4.students (id);

CREATE INDEX trans_stud_id
ON db_project_4.transcript (id);

CREATE INDEX crs_code
ON db_project_4.transcript (crsCode);

CREATE INDEX teaching_crs_code
ON db_project_4.teaching (crsCode);

CREATE INDEX courses_crs_code
ON db_project_4.courses (crsCode);

CREATE INDEX courses_dept_id
ON db_project_4.courses (deptId);

SELECT name
FROM db_project_4.students
USE INDEX(stud_id)
<<<<<<< HEAD
WHERE id = 12345;
=======
WHERE id = 62053;
>>>>>>> 57681ff3597fada49e7b79b78acdd524de6b7549

SELECT name
FROM db_project_4.students
USE INDEX(stud_id)
WHERE id > 10000 AND id < 15000; 

SELECT name
FROM db_project_4.students
USE INDEX(stud_id)
	JOIN db_project_4.transcript 
	USE INDEX(trans_stud_id, crs_code)
		ON db_project_4.transcript.id = db_project_4.students.id
WHERE db_project_4.transcript.crsCode = 'crsCode394193';

SELECT db_project_4.students.name
FROM db_project_4.students
USE INDEX(stud_id)
	JOIN db_project_4.transcript
	USE INDEX(trans_stud_id)
		ON db_project_4.transcript.id = db_project_4.students.id
	JOIN db_project_4.teaching
    USE INDEX(teaching_crs_code)
		ON db_project_4.teaching.crsCode = db_project_4.transcript.crsCode 
			AND db_project_4.teaching.semester = db_project_4.transcript.semester
	JOIN db_project_4.professors
    USE INDEX(prof_id)
		ON db_project_4.professors.id = db_project_4.teaching.id
WHERE db_project_4.professors.name = 'name296707';

SELECT db_project_4.students.name
FROM db_project_4.students USE INDEX (stud_id), 
	db_project_4.transcript USE INDEX(trans_stud_id, crs_code), 
    db_project_4.courses USE INDEX(courses_crs_code)
WHERE db_project_4.students.id = db_project_4.transcript.id 
	AND db_project_4.transcript.crsCode = db_project_4.courses.crsCode
    AND db_project_4.courses.deptId = 123
	AND NOT EXISTS (
		SELECT db_project_4.students.name
		FROM db_project_4.students USE INDEX (stud_id), 
			db_project_4.transcript USE INDEX(trans_stud_id, crs_code), 
            db_project_4.courses USE INDEX(courses_crs_code)
		WHERE db_project_4.students.id = db_project_4.transcript.id
			AND db_project_4.transcript.crsCode = db_project_4.courses.crsCode
			AND db_project_4.courses.deptId = 456);
            

SELECT db_project_4.students.name
FROM db_project_4.students USE INDEX (stud_id)
JOIN db_project_4.transcript USE INDEX (trans_stud_id)
	ON db_project_4.students.id = db_project_4.transcript.id
WHERE crsCode IN
	(SELECT crsCode 
     FROM db_project_4.courses USE INDEX (courses_crs_code, courses_dept_id)
	 WHERE deptId = 12345)
GROUP BY db_project_4.transcript.id
HAVING COUNT(*) = (SELECT COUNT(*) 
					FROM db_project_4.courses USE INDEX (courses_dept_id)
					WHERE db_project_4.courses.deptId = '12345');



