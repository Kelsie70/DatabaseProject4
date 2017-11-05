DROP INDEX prof_id
ON db_project_4.professors;

DROP INDEX stud_id
ON db_project_4.students;

DROP INDEX trans_stud_id
ON db_project_4.transcript;

DROP INDEX crs_code
ON db_project_4.transcript;

CREATE INDEX prof_id
ON db_project_4.professors (id);

CREATE INDEX stud_id
ON db_project_4.students (id);

CREATE INDEX trans_stud_id
ON db_project_4.transcript (id);

CREATE INDEX crs_code
ON db_project_4.transcript (crsCode);

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
ON db_project_4.transcript.id = db_project_4.students.id
WHERE db_project_4.transcript.crsCode = 'crsCode394193';



