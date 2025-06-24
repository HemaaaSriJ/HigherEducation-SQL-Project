
-- Query 1: Top 5 districts with most professional colleges
SELECT District, COUNT(DISTINCT CollegeName) AS CollegeCount
FROM CollegeCourses
WHERE IsProfessional = 'Professional Course'
GROUP BY District
ORDER BY CollegeCount DESC
LIMIT 5;

-- Query 2: Average course duration by course type
SELECT CourseType, AVG(DurationMonths) AS AvgDuration
FROM CollegeCourses
GROUP BY CourseType
ORDER BY AvgDuration DESC;

-- Query 3: Unique college count per course category
SELECT CourseCategory, COUNT(DISTINCT CollegeName) AS CollegeCount
FROM CollegeCourses
GROUP BY CourseCategory;

-- Query 4: Colleges offering both UG and PG
SELECT DISTINCT a.CollegeName
FROM CollegeCourses a
JOIN CollegeCourses b ON a.CollegeName = b.CollegeName
WHERE a.CourseType = 'Under Graduate' AND b.CourseType = 'Post Graduate';

-- Query 5: Universities with more than 10 unaided, non-professional courses
SELECT University, COUNT(*) AS CourseCount
FROM CollegeCourses
WHERE IsAided = 'Unaided' AND IsProfessional = 'Non-Professional Course'
GROUP BY University
HAVING COUNT(*) > 10;

-- Add the rest of the 15 queries similarly...
