
-- Query 1
SELECT name FROM dbms4.students WHERE id = 5101;

-- Query 2
SELECT name FROM dbms4.students WHERE id < 15000 AND id > 10000;

-- Query 3
SELECT name FROM students s, transcript t WHERE s.id = t.studId AND t.crsCode = 'crsCode394193';

-- Query 4
SELECT s.name FROM students s, transcript t, teaching h, professors p WHERE 
s.id = t.studId
AND t.semester = h.semester
AND t.crsCode = h.crsCode
AND h.profId = p.id
AND p.name = 'name296707';

-- Query 5
SELECT S.name
FROM Student S, Transcript T, Course C
WHERE S.id = T.studId
	T.crsCode = C.crsCode
	C.deptID = v6

MINUS

SELECT S.name
FROM Student S, Transcript T, Course C
WHERE S.id = T.studID
	T.crsCode = C.crsCode
	C.deptID = v7

--Query 6
SELECT S.name
FROM Student S, Transcript T 
WHERE S.id = T.studID
	T.crsCode IN
	(SELECT T.crsCode FROM Course C WHERE C.deptID = v8)
GROUP BY T.studID
HAVING COUNT(*) = (SELECT COUNT(*) FROM Course C WHERE C.deptID = v8)
