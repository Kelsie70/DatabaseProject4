
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

SELECT name
FROM db_project_4.students
USE INDEX(stud_id)
WHERE id = 62053;

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
	db_project_4.transcript USE INDEX(trans_stud_id, crs_code), db_project_4.courses
WHERE db_project_4.students.id = db_project_4.transcript.id 
	AND db_project_4.transcript.crsCode = db_project_4.courses.crsCode
    AND db_project_4.courses.deptId = 123
	AND NOT EXISTS (
		SELECT db_project_4.students.name
		FROM db_project_4.students, db_project_4.transcript, db_project_4.courses
		WHERE db_project_4.students.id = db_project_4.transcript.id
			AND db_project_4.transcript.crsCode = db_project_4.courses.crsCode
			AND db_project_4.courses.deptId = 456);
            

SELECT db_project_4.students.name
FROM db_project_4.students
JOIN db_project_4.transcript ON db_project_4.students.id = db_project_4.transcript.id
WHERE crsCode IN
	(SELECT crsCode 
     FROM db_project_4.courses 
	 WHERE deptId = 12345)
GROUP BY db_project_4.transcript.id
HAVING COUNT(*) = (SELECT COUNT(*) 
					FROM db_project_4.courses 
					WHERE db_project_4.courses.deptId = '12345');

