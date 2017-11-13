# DatabaseProject4

Queries:

1. List the name of the student with id equal to v1 (id).
2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
3. List the names of students who have taken course v4 (crsCode).
4. List the names of students who have taken a course taught by professor v5 (name).
5. List the names of students who have taken a course from department v6 (deptId), but not v7.
6. List the names of students who have taken all courses offered by department v8 (deptId).

These queries were completed for MySQL and PostgreSQL, for both non-indexed and indexed queries.

________________________________________________________________________________________

Manager Report:

In our queries, we used tables that contained 10,000 tuples each. With this amount of tuples,
we were pleased that our times never exceeded over a half of second when processing each
query that we wrote. Out of the two languages, our PostgreSQL queries seemed to be the slowest.
Between the indexed and non-indexed queries for MySQL, we saw that the indexed times were
generally slower than the non-indexed times, which is contrary to the idea of indexing, which
is supposed to speed up this process. Between the indexed and non-indexed queries for PostgreSQL,
however, our indexed queries acted as planned and were faster than the non-indexed queries.

________________________________________________________________________________________

Group Member Contributions and Evaluations:

Kelsie Belan (Project Manager) Implemented indexed MySQL queries, created Github repo

Devin Gray (manager evaluation: +2) Implemented PostgreSQL queries, created graph of data

Kyle Millar (manager evaluation: +2) Implemented non indexed MySQL queries

Anish Shivkumar (manager evaluation: +2) Implemented non indexed MySQL queries

________________________________________________________________________________________

Schedule of Meetings

11/1/17 (full attendance)

11/5/17 (full attendance)

