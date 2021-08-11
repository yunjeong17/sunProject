-- 순대학교 DDL문

--DROP 테이블문 

--DROP TABLE DEPARTMENT; -- 1
--DROP TABLE CLASS_TIME; -- 6
--DROP TABLE FLUCTUATION; -- 7
--DROP TABLE CLASS_TYPE; -- 8
--DROP TABLE CONSULTING; -- 9
--DROP TABLE CLASS_HISTORY; -- 10
--DROP TABLE PROFESSORS; -- 11
--DROP TABLE CERTIFICATE; -- 12
--DROP TABLE STUDENT; -- 3
--DROP TABLE TIME; -- 5
--DROP TABLE CLASS; -- 4
--DROP TABLE CATEGORY; -- 2



-- 1
-- 학부
CREATE TABLE DEPARTMENT (
   DEPT_NO   VARCHAR2(20) NOT NULL,
   DEPT_NAME VARCHAR2(50) NOT NULL
);

-- 학부 코멘트
COMMENT ON TABLE DEPARTMENT IS '학부';
COMMENT ON COLUMN DEPARTMENT.DEPT_NO IS '학부번호';
COMMENT ON COLUMN DEPARTMENT.DEPT_NAME IS '학부명';


-- 2
--학과
CREATE TABLE CATEGORY (
   C_NO VARCHAR2(20) NOT NULL,
   C_NAME VARCHAR2(50),
   DEPT_NO   VARCHAR2(20) NOT NULL
);
-- 학과 코멘트
COMMENT ON TABLE CATEGORY IS '학과';
COMMENT ON COLUMN CATEGORY.C_NO IS '학과번호';
COMMENT ON COLUMN CATEGORY.C_NAME IS '학과이름';
COMMENT ON COLUMN CATEGORY.DEPT_NO IS '학부번호';


-- 3
-- 학생 테이블
CREATE TABLE STUDENT (
	S_ID	VARCHAR2(20)	NOT NULL,
	P_ID	VARCHAR2(20)	NOT NULL,
    C_NO	VARCHAR2(20)	NOT NULL,
	S_PWD	VARCHAR2(100)	NOT NULL,
	S_NAME	VARCHAR2(30)	NOT NULL,
	S_EDATE	DATE DEFAULT SYSDATE NOT NULL ,
	S_PHONE     VARCHAR2(50),
	S_EMAIL     VARCHAR2(100),
	S_IMG   VARCHAR2(1000),
	FL_CHANGE VARCHAR2(20) DEFAULT '입학'
);

--학생 테이블 코멘트
COMMENT ON TABLE STUDENT IS '학생';
COMMENT ON COLUMN STUDENT.P_ID IS '교원번호';
COMMENT ON COLUMN STUDENT.S_NO IS '학번';
COMMENT ON COLUMN STUDENT.C_NO IS '학과번호';
COMMENT ON COLUMN STUDENT.S_PWD IS '비밀번호';
COMMENT ON COLUMN STUDENT.S_NAME IS '학생이름';
COMMENT ON COLUMN STUDENT.S_EDATE IS '입학일';
COMMENT ON COLUMN STUDENT.S_PHONE IS '휴대전화';
COMMENT ON COLUMN STUDENT.S_EMAIL IS '이메일';
COMMENT ON COLUMN STUDENT.S_IMG IS '사진 경로';
COMMENT ON COLUMN STUDENT.FL_CHANGE IS '학적상태';



-- 4
--강의 테이블
CREATE TABLE CLASS (
	class_no VARCHAR2(20) NOT NULL,
	class_name	VARCHAR2(50) NOT NULL,
	class_place	VARCHAR2(50),
	class_year NUMBER NOT NULL,
	class_semester NUMBER NOT NULL,
	CLASS_TYPE_NO NUMBER NOT NULL,
	P_ID VARCHAR2(20)
);

--강의 테이블 코멘트
COMMENT ON TABLE CLASS IS '강의';
COMMENT ON COLUMN CLASS.class_no IS '강의번호';
COMMENT ON COLUMN CLASS.class_name IS '강의명';
COMMENT ON COLUMN CLASS.class_place IS '강의실이름';
COMMENT ON COLUMN CLASS.class_year IS '연도';
COMMENT ON COLUMN CLASS.class_semester IS '학기';
COMMENT ON COLUMN CLASS.CLASS_TYPE_NO IS '강의구분 타입번호';
COMMENT ON COLUMN CLASS.P_ID IS '교수번호';


-- 5
-- 강의 시간대
CREATE TABLE TIME (
	T_ID 	VARCHAR2(20) NOT NULL,
	T_DAY	CHAR(3)	NOT NULL,
	T_START_TIME VARCHAR2(20) NOT NULL,
	T_END_TIME VARCHAR2(20)	NOT NULL
);

--강의시간대 코멘트
COMMENT ON TABLE TIME IS '강의 시간대';
COMMENT ON COLUMN  TIME.T_ID IS '시간 번호';
COMMENT ON COLUMN  TIME.T_DAY IS '요일';
COMMENT ON COLUMN  TIME.T_START_TIME IS '수업시작시간';
COMMENT ON COLUMN  TIME.T_END_TIME IS '수업끝나는시간';



-- 6
-- 해당 강의의 강의 시간대
CREATE TABLE CLASS_TIME (
	CLASS_NO	NUMBER	NOT NULL,
	T_ID 	VARCHAR2(20)	NOT NULL
);

--해당 강의의 강의 시간대 코멘트
COMMENT ON TABLE CLASS_TIME IS '해당 강좌가 강의되는 시간';
COMMENT ON COLUMN CLASS_TIME.CLASS_NO IS '강의번호';
COMMENT ON COLUMN CLASS_TIME.T_ID IS '시간번호';


-- 7
-- 강의 타입
CREATE TABLE CLASS_TYPE (
   CLASS_TYPE_NO NUMBER NOT NULL,
   CLASS_TYPE_NAME   VARCHAR(20)
);

-- 강의 타입 코멘트
COMMENT ON TABLE CLASS_TYPE IS '강의 타입';
COMMENT ON COLUMN CLASS_TYPE.CLASS_TYPE_NO IS '타입번호';
COMMENT ON COLUMN CLASS_TYPE.CLASS_TYPE_NAME IS '타입이름';


-- 8 
-- 학적 변동사항
CREATE TABLE FLUCTUATION (
   FL_NO NUMBER NOT NULL,
   S_ID VARCHAR2(20) NOT NULL,
   FL_CHANGE VARCHAR2(20),
   FL_REASON VARCHAR2(100),
   FL_YEAR   NUMBER   NULL,
   FL_SEMESTER   NUMBER   NULL,
   FL_DATE   DATE DEFAULT SYSDATE
);

-- 학적 변동사항 코멘트
COMMENT ON TABLE FLUCTUATION IS '학적변동';
COMMENT ON COLUMN FLUCTUATION.FL_NO IS '식별번호';
COMMENT ON COLUMN FLUCTUATION.S_ID IS '학번';
COMMENT ON COLUMN FLUCTUATION.FL_CHANGE IS '변동사항';
COMMENT ON COLUMN FLUCTUATION.FL_REASON IS '변동사유';
COMMENT ON COLUMN FLUCTUATION.FL_YEAR IS '연도';
COMMENT ON COLUMN FLUCTUATION.FL_SEMESTER IS '학기';
COMMENT ON COLUMN FLUCTUATION.FL_DATE IS '변동일자';

-- 9 
--상담
CREATE TABLE CONSULTING (
   CS_NO VARCHAR2(20) NOT NULL,
   S_ID VARCHAR2(20) NOT NULL,
   CS_CONTENTS   VARCHAR2(1000),
   CS_DATE   DATE DEFAULT SYSDATE NOT NULL,
   CS_TIME   VARCHAR2(20) NOT NULL,
   CS_WAY VARCHAR2(20)   NOT NULL,
   CS_TYPE   VARCHAR2(20) NOT NULL
);

-- 상담 코멘트
COMMENT ON TABLE CONSULTING IS '상담';
COMMENT ON COLUMN CONSULTING.CS_NO IS '식별번호';
COMMENT ON COLUMN CONSULTING.S_ID IS '학번';
COMMENT ON COLUMN CONSULTING.CS_CONTENTS IS '상담내용';
COMMENT ON COLUMN CONSULTING.CS_DATE IS '상담날짜';
COMMENT ON COLUMN CONSULTING.CS_TIME IS '상담시간';
COMMENT ON COLUMN CONSULTING.CS_WAY IS '상담방식';
COMMENT ON COLUMN CONSULTING.CS_TYPE IS '상담구분';




-- 10
-- 수강내역
CREATE TABLE CLASS_HISTORY (
   S_ID   VARCHAR2(20)   NOT NULL,
   class_no   NUMBER NOT NULL,
   CG_YEAR   NUMBER   NULL,
   CG_SEMESTER   NUMBER   NULL,
   CG_POINT   NUMBER   NOT NULL
);

-- 수강내역 코멘트
COMMENT ON TABLE CLASS_HISTORY IS '수강내역';
COMMENT ON COLUMN CLASS_HISTORY.S_ID IS '학번';
COMMENT ON COLUMN CLASS_HISTORY.class_no IS '강의번호';
COMMENT ON COLUMN CLASS_HISTORY.CG_YEAR IS '연도';
COMMENT ON COLUMN CLASS_HISTORY.CG_SEMESTER IS '학기';
COMMENT ON COLUMN CLASS_HISTORY.CG_POINT IS '성적';



-- 11
-- 교수 
CREATE TABLE PROFESSORS (
	P_ID	 VARCHAR2(20)	NOT NULL,	
	P_PWD	 VARCHAR2(100)	NOT NULL,	
	P_NAME	VARCHAR2(30)	NOT NULL,	
	C_NO	VARCHAR2(20)	NOT NULL,	
	P_PHONE 	VARCHAR2(50),		
	P_EMAIL	VARCHAR2(100)
);

-- 교수 코멘트
COMMENT ON TABLE PROFESSORS IS '교수';
COMMENT ON COLUMN PROFESSORS.P_ID IS '교원번호';
COMMENT ON COLUMN PROFESSORS.P_PWD IS '비밀번호';
COMMENT ON COLUMN PROFESSORS.P_NAME IS '이름';
COMMENT ON COLUMN PROFESSORS.C_NO IS '학과';
COMMENT ON COLUMN PROFESSORS.P_PHONE IS '휴대전화';
COMMENT ON COLUMN PROFESSORS.P_EMAIL IS '이메일';




-- 12
-- 자격증
CREATE TABLE CERTIFICATE (
	CF_NO	NUMBER	NOT NULL,	
	S_ID	VARCHAR2(20) NOT NULL,	
	CF_NAME	VARCHAR2(50) NOT NULL,	
	CF_ISSUE	VARCHAR2(50) NOT NULL,	
	CF_DATE	DATE	NOT NULL,	
	CF_ATTCHMENT	 VARCHAR2(1000),	
	CF_ID	VARCHAR2(50) NOT NULL
);

-- 자격증 코멘트
COMMENT ON TABLE CERTIFICATE IS '자격증';
COMMENT ON COLUMN CERTIFICATE.CF_NO IS '식별번호';
COMMENT ON COLUMN CERTIFICATE.S_ID IS '학번';
COMMENT ON COLUMN CERTIFICATE.CF_NAME IS '자격명';
COMMENT ON COLUMN CERTIFICATE.CF_ISSUE IS '발행처';
COMMENT ON COLUMN CERTIFICATE.CF_DATE IS '취득날짜';
COMMENT ON COLUMN CERTIFICATE.CF_ATTCHMENT IS '증빙자료';
COMMENT ON COLUMN CERTIFICATE.CF_ID IS '자격번호';



--관리자 
CREATE TABLE ADMIN (
	A_ID VARCHAR2(20),
    A_PWD VARCHAR2(100),
    A_NAME VARCHAR2(30)
);

-- 관리자 코멘트
COMMENT ON TABLE ADMIN IS '관리자';
COMMENT ON COLUMN ADMIN.A_ID IS '관리자 ID';
COMMENT ON COLUMN ADMIN.A_PWD IS '비밀번호';
COMMENT ON COLUMN ADMIN.A_NAME IS '이름';



--기본키
ALTER TABLE STUDENT ADD CONSTRAINT PK_STUDENT PRIMARY KEY (S_ID);
ALTER TABLE ADMIN ADD CONSTRAINT PK_ADMIN PRIMARY KEY (A_ID);
ALTER TABLE CLASS ADD CONSTRAINT PK_CLASS PRIMARY KEY (class_no);
ALTER TABLE CLASS_TYPE ADD CONSTRAINT PK_CLASS_TYPE PRIMARY KEY (CLASS_TYPE_NO);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DEPT_NO);
ALTER TABLE FLUCTUATION ADD CONSTRAINT PK_FLUCTUATION PRIMARY KEY (FL_NO,S_ID);
ALTER TABLE CATEGORY ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (C_NO);
ALTER TABLE CONSULTING ADD CONSTRAINT PK_CONSULTING PRIMARY KEY (CS_NO,S_ID);
ALTER TABLE CLASS_HISTORY ADD CONSTRAINT PK_CLASS_HISTORY PRIMARY KEY (S_ID,class_no);
ALTER TABLE PROFESSORS ADD CONSTRAINT PK_PROFESSORS PRIMARY KEY (P_ID);
ALTER TABLE CERTIFICATE ADD CONSTRAINT PK_CERTIFICATE PRIMARY KEY (CF_NO,S_ID);
ALTER TABLE TIME ADD CONSTRAINT PK_TIME PRIMARY KEY (T_ID);
ALTER TABLE CLASS_TIME ADD CONSTRAINT PK_CLASS_TIME PRIMARY KEY (class_no,T_ID);

--외래키
ALTER TABLE FLUCTUATION ADD CONSTRAINT FK_STUDENTS_TO_FLUCTUATION_1 FOREIGN KEY (S_ID)REFERENCES STUDENT (S_ID);
ALTER TABLE CONSULTING ADD CONSTRAINT FK_STUDENTS_TO_CONSULTING_1 FOREIGN KEY (S_ID)REFERENCES STUDENT (S_ID);

ALTER TABLE CLASS_HISTORY ADD CONSTRAINT FK_STUDENTS_TO_CLASS_HISTORY_1 FOREIGN KEY (S_ID)REFERENCES STUDENT (S_ID);
ALTER TABLE CLASS_HISTORY ADD CONSTRAINT FK_CLASS_TO_CLASS_HISTORY_1 FOREIGN KEY (class_no)REFERENCES CLASS (class_no);

ALTER TABLE CERTIFICATE ADD CONSTRAINT FK_STUDENTS_TO_CERTIFICATE_1 FOREIGN KEY (S_ID)REFERENCES STUDENT (S_ID);

ALTER TABLE CLASS_TIME ADD CONSTRAINT FK_CLASS_TO_CLASS_TIME_1 FOREIGN KEY (class_no)REFERENCES CLASS (class_no);
ALTER TABLE CLASS_TIME ADD CONSTRAINT FK_TIME_TO_CLASS_TIME_1 FOREIGN KEY (T_ID)REFERENCES TIME (T_ID);

ALTER TABLE STUDENT ADD CONSTRAINT FK_STUDENT_TO_CATEGORY_1 FOREIGN KEY (C_NO) REFERENCES CATEGORY(C_NO);
ALTER TABLE PROFESSORS ADD CONSTRAINT FK_PROFESSORS_TO_CATEGORY_1 FOREIGN KEY (C_NO) REFERENCES CATEGORY(C_NO);


COMMIT;
