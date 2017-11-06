

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
FROM db_project_4.professors
USE INDEX(prof_id)
WHERE id = 7522;

SELECT name
FROM db_project_4.professors
USE INDEX(prof_id)
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

SELECT students.name
FROM students, transcript, courses
WHERE students.id = transcript.id 
	AND transcript.crsCode = courses.crsCode
    AND courses.deptId = 123
	AND NOT EXISTS (
		SELECT students.name
		FROM students, transcript, course
		WHERE students.id = transcript.id
			AND transcript.crsCode = courses.crsCode
			AND courses.deptId = 456);
            

SELECT students.name
FROM students
JOIN transcript ON student.id = transcript.id
WHERE crsCode IN
	(SELECT crsCode 
     FROM courses 
	 WHERE deptId = 12345)
GROUP BY transcript.id
HAVING COUNT(*) = (SELECT COUNT(*) 
					FROM courses 
					WHERE courses.deptId = '12345');

