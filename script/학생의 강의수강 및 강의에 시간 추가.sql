--INSERT INTO STUDENT (S_ID,P_ID,C_NO,S_PWD,S_NAME,S_EDATE,S_PHONE,FL_CHANGE)
--VALUES('2021101002','P10101','C101','2021101002','고고냥',DEFAULT,'010-6892-0033',DEFAULT);
-- 국어국문학과
--INSERT INTO CLASS VALUES('L1101','한국문학과한국사회','인문학관 201호 ',2021,1,1,'P10101');

--김연경 학생이 들을 수업 시간
INSERT INTO CLASS_TIME VALUES('L1201','A12');
INSERT INTO CLASS_TIME VALUES('L8000','B07');
INSERT INTO CLASS_TIME VALUES('L8001','C02');
INSERT INTO CLASS_TIME VALUES('L8001','E04');
INSERT INTO CLASS_TIME VALUES('L8002','D08');
INSERT INTO CLASS_TIME VALUES('L8003','E01');
INSERT INTO CLASS_TIME VALUES('L8004','C05');
INSERT INTO CLASS_TIME VALUES('L8005','C08');

--김연경학생 수강내역
INSERT INTO CLASS_HISTORY VALUES('2021803002','L1201',2021,2,NULL);
INSERT INTO CLASS_HISTORY VALUES('2021803002','L8000',2021,2,NULL);
INSERT INTO CLASS_HISTORY VALUES('2021803002','L8001',2021,2,NULL);
INSERT INTO CLASS_HISTORY VALUES('2021803002','L8002',2021,2,NULL);
INSERT INTO CLASS_HISTORY VALUES('2021803002','L8003',2021,2,NULL);
INSERT INTO CLASS_HISTORY VALUES('2021803002','L8004',2021,2,NULL);
INSERT INTO CLASS_HISTORY VALUES('2021803002','L8005',2021,2,NULL);




-- 고고냥이 들을 강의 시간 설정
INSERT INTO CLASS_TIME VALUES('L1101','A01');
INSERT INTO CLASS_TIME VALUES('L1101','A02');
INSERT INTO CLASS_TIME VALUES('L1101','C04');
INSERT INTO CLASS_TIME VALUES('L1105','B05');
INSERT INTO CLASS_TIME VALUES('L1105','B06');
INSERT INTO CLASS_TIME VALUES('L9007','C05');
INSERT INTO CLASS_TIME VALUES('L9007','C06');
INSERT INTO CLASS_TIME VALUES('L1203','D02');
INSERT INTO CLASS_TIME VALUES('L1203','D03');



-- 고고냥 수강 내역
INSERT INTO CLASS_HISTORY VALUES('2021101002','L1101',2020,2,NULL); 
INSERT INTO CLASS_HISTORY VALUES('2021101002','L1105',2020,2,NULL); 
INSERT INTO CLASS_HISTORY VALUES('2021101002','L9007',2020,2,NULL); 
INSERT INTO CLASS_HISTORY VALUES('2021101002','L1203',2020,2,NULL); 
INSERT INTO CLASS_HISTORY VALUES('2021101002','L1201',2021,2,NULL);

SELECT * FROM CLASS WHERE CLASS_TYPE_NO=3 ;




-- 도리아몽 학생이 들을 수업 시간
INSERT INTO CLASS_TIME VALUES('L6201','A01');
INSERT INTO CLASS_TIME VALUES('L6202','A02');
INSERT INTO CLASS_TIME VALUES('L6203','A03');
INSERT INTO CLASS_TIME VALUES('L6201','D01');
INSERT INTO CLASS_TIME VALUES('L6202','D02');
INSERT INTO CLASS_TIME VALUES('L6203','D03');
INSERT INTO CLASS_TIME VALUES('L6301','E01');
INSERT INTO CLASS_TIME VALUES('L6302','B01');
INSERT INTO CLASS_TIME VALUES('L6303','B02');
INSERT INTO CLASS_TIME VALUES('L6401','B03');
INSERT INTO CLASS_TIME VALUES('L6402','B04');
INSERT INTO CLASS_TIME VALUES('L6403','B05');
INSERT INTO CLASS_TIME VALUES('L6501','C01');
INSERT INTO CLASS_TIME VALUES('L6502','E02');
INSERT INTO CLASS_TIME VALUES('L6503','C02');
INSERT INTO CLASS_TIME VALUES('L6601','C03');

--도리아몽 수강내역
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6201',2021,1,4);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6202',2021,1,2);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6203',2021,1,3);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6301',2021,1,4.5);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6302',2021,1,1);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6303',2021,1,2);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6401',2021,1,3);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6402',2021,1,3);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6403',2021,1,1.5);
INSERT INTO CLASS_HISTORY VALUES('2021602001','L6501',2021,1,4.5);



--허숙희  강의시간
INSERT INTO CLASS_TIME VALUES('L5028','A01');
INSERT INTO CLASS_TIME VALUES('L5028','A02');
INSERT INTO CLASS_TIME VALUES('L5028','A03');

INSERT INTO CLASS_TIME VALUES('L5029','C01');
INSERT INTO CLASS_TIME VALUES('L5029','C02');
INSERT INTO CLASS_TIME VALUES('L5029','C03');

INSERT INTO CLASS_TIME VALUES('L5030','E01');
INSERT INTO CLASS_TIME VALUES('L5030','E02');
INSERT INTO CLASS_TIME VALUES('L5030','E03');

--허숙희 수강내역
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5028',2017,1,1);
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5028',2017,1,1);
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5028',2017,1,3);

INSERT INTO CLASS_HISTORY VALUES('2014509001','L5029',2017,1,2);
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5029',2017,1,1);
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5029',2017,1,5);

INSERT INTO CLASS_HISTORY VALUES('2014509001','L5030',2017,1,2);
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5030',2017,1,3);
INSERT INTO CLASS_HISTORY VALUES('2014509001','L5030',2017,1,1);