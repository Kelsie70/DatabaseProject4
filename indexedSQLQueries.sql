CREATE INDEX prof_id
ON db_project_4.Professor (id);

SELECT * 
FROM db_project_4.Professor
USE INDEX(prof_id)
WHERE id = 7522;

SELECT *
FROM db_project_4.Professor
USE INDEX(prof_id)
WHERE id > 10000 AND id < 15000; 

DROP INDEX prof_id
ON db_project_4.Professor;