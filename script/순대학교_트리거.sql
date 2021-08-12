-- 학적변동에 INSERT가 있으면 학생의 학적상태가 학적변동의 변동사유로 바뀜
DROP TRIGGER TRG_STUDENT;

CREATE OR REPLACE TRIGGER TRG_STUDENT
AFTER
INSERT ON FLUCTUATION
FOR EACH ROW
BEGIN
    UPDATE STUDENT SET FL_CHANGE =:NEW.FL_CHANGE WHERE S_ID=:NEW.S_ID;
END;
/

COMMIT;
