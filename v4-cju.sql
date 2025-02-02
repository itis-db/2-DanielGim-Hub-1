/**
  @author
 */
-- Используем CTE для предварительного отбора данных
WITH consultant_points AS (
    SELECT * 
    FROM consultant_pick_up_point 
    WHERE pointid < 5 
      AND consultantid < 100
)
SELECT c.firstname, c.lastname, c.jobtitle, p.name
FROM consultant_points cp
JOIN consultant c ON cp.consultantid = c.consultantid
JOIN pick_up_point p ON cp.pointid = p.pointid;

-- Объединяем результаты двух запросов с использованием UNION
SELECT consultantid, pointid 
FROM consultant_pick_up_point 
WHERE consultantid > 30
UNION
SELECT consultantid, pointid 
FROM consultant_pick_up_point 
WHERE pointid < 20;

-- Создаём CTE для объединения consultantid и pointid
WITH combined_ids AS (
    SELECT consultantid AS id FROM consultant_pick_up_point
    UNION
    SELECT pointid FROM consultant_pick_up_point
)
SELECT c.consultantid, c.firstname, c.lastname 
FROM consultant c
JOIN combined_ids ci ON c.consultantid > ci.id
UNION
SELECT cust.customersid, cust.firstname, cust.lastname 
FROM customers cust;
