
--학생성적조회 뷰 ST_INFO
CREATE OR REPLACE VIEW VIEW_ST_GRADE AS
SELECT H.S_ID "S_ID", C.CLASS_TYPE_NO AS "TYPENO", SUM(C.CREDIT) "CREDIT"
FROM CLASS C
JOIN CLASS_HISTORY H ON C.CLASS_NO = H.CLASS_NO
GROUP BY C.CLASS_TYPE_NO, H.S_ID;

--DROP VIEW VIEW_ST_GRADE;
