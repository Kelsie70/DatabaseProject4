
-- Query 1
SELECT name FROM Student WHERE id = 5101;

-- Query 2
SELECT name FROM Student WHERE id < 15000 AND id > 10000;

-- Query 3
SELECT name FROM Student s, Transcript t WHERE s.id = t.studId AND t.crsCode = 'crsCode394193';

-- Query 4
SELECT s.name FROM Student s, Transcript t, Teaching h, Professor p WHERE 
s.id = t.studId
AND t.semester = h.semester
AND t.crsCode = h.crsCode
AND h.profId = p.id
AND p.name = 'name296707';

-- Query 5
SELECT S.name
FROM Student S, Transcript T, Courses C
WHERE S.id = T.studId
AND T.crsCode = C.crsCode
AND C.deptID = 'deptId859888'
AND NOT EXISTS (
SELECT S.name
FROM Student S, Transcript T, Courses C
WHERE S.id = T.studID
AND T.crsCode = C.crsCode
AND C.deptID = 'deptId254977');

--Query 6
SELECT S.name
FROM Student S, Transcript T 
WHERE S.id = T.studID
	T.crsCode IN
	(SELECT T.crsCode FROM Course C WHERE C.deptID = 'deptId859888')
GROUP BY T.studID
HAVING COUNT(*) = (SELECT COUNT(*) FROM Course C WHERE C.deptID = 'deptId859888');
