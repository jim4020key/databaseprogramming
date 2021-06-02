--<<ENROLL TABLE>>--

CREATE TABLE enroll(  --수강신청 성공시 정보 입력되는 테이블
					 --학번 / 과목번호 / 분반 / 신청년도 / 신청학기
	s_id VARCHAR2(10),   --FOREIGN KEY
	c_id VARCHAR2(10),   --FOREIGN KEY
	c_id_no NUMBER,     
	e_year NUMBER,
	e_semester NUMBER,
	t_time NUMBER,
	t_day NUMBER,
	
	CONSTRAINT e_pk PRIMARY KEY(s_id, c_id, c_id_no),
	CONSTRAINT e_c_id_fk FOREIGN KEY(c_id, c_id_no) REFERENCES course(c_id, c_id_no) ON DELETE CASCADE
	CONSTRAINT t_fk FOREIGN KEY(t_time, t_day) REFERENCES teach(t_time, t_day) ON DELETE CASCADE
);

    --1818181 로그인한 기준으로 오류 작성시 --
INSERT INTO enroll VALUES('1818181','C400',3,2021,2,1,1);  -- 이미 담은 수업
INSERT INTO enroll VALUES('1400000','C900',3,2021,2,2,2);  -- 수강신청인원초과


select * from enroll;
delete from enroll;