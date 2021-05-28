CREATE OR REPLACE PROCEDURE Welcome(
sStudentId IN VARCHAR2,
sStudentPw IN VARCHAR2,
c2 OUT SYS_REFCURSOR
)
IS

BEGIN

	OPEN c2 FOR
	SELECT * from student where s_id = sStudentId and s_pwd = sStudentPw;
END;
/