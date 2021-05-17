--<<TEACH TABLE>>--

CREATE TABLE teach(		--과목의 부가정보 (테이블인 것 같아요 아마..)
						--최대인원 / 시간(몇교시인지) / 장소 / 수강신청 년도 / 수강신청 학기 / 과목번호 / 분반 
	t_max NUMBER,
	t_time NUMBER,
	t_classroom VARCHAR2(50),
	t_day NUMBER,     --1(월), 2(화), 3(수),4(목), 5(금)
	t_year NUMBER,    --2021 / 2022 둘 중 하나
	t_semester NUMBER,
	c_id VARCHAR2(10),     -- FOREIGN KEY 
	c_id_no NUMBER,
	
	CONSTRAINT t_pk PRIMARY KEY (t_year,t_semester,c_id, c_id_no, t_time, t_day),
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no) ON DELETE CASCADE
);



INSERT INTO teach VALUES(10,1,'명신관',1,2021,2,'C400',3); -- 동일 과목 신청 오류
INSERT INTO teach VALUES(1,2,'과학관',1,2021,2,'C900',3);  -- 수강신청 인원 초과 여부
INSERT INTO teach VALUES(10,3,'진리관',1,2021,2,'M100',3);  -- 시간 중복 여부
INSERT INTO teach VALUES(10,4,'프라임관',1,2021,2,'C800',3);  -- 성공
INSERT INTO teach VALUES(10,5,'명신관',1,2021,2,'M700',3);  -- 최대학점 초과

INSERT INTO teach VALUES(10,1,'명신관',2,2021,2,'C300',3);
INSERT INTO teach VALUES(5,2,'과학관',2,2021,2,'C100',3);
INSERT INTO teach VALUES(5,3,'진리관',1,2021,2,'M800',3);
INSERT INTO teach VALUES(5,3,'프라임관',2,2021,2,'M600',3);
INSERT INTO teach VALUES(5,4,'명신관',2,2021,2,'A300',3);

INSERT INTO teach VALUES(5,1,'명신관',3,2021,2,'A400',3);
INSERT INTO teach VALUES(5,2,'과학관',3,2021,2,'B100',3);
INSERT INTO teach VALUES(8,3,'진리관',3,2021,2,'B200',1);
INSERT INTO teach VALUES(8,4,'프라임관',3,2021,2,'D500',1);

INSERT INTO teach VALUES(8,1,'명신관',4,2021,2,'D600',1);
INSERT INTO teach VALUES(8,2,'과학관',4,2021,2,'E300',1);
INSERT INTO teach VALUES(8,3,'진리관',4,2021,2,'E500',2);
INSERT INTO teach VALUES(15,4,'프라임관',4,2022,1,'F800',2);

INSERT INTO teach VALUES(15,1,'명신관',1,2022,2,'F100',2);
INSERT INTO teach VALUES(15,2,'과학관',2,2022,2,'K200',2);
INSERT INTO teach VALUES(15,3,'진리관',3,2022,2,'K400',2);
INSERT INTO teach VALUES(15,4,'프라임관',4,2022,2,'N800',2);
INSERT INTO teach VALUES(15,5,'명신관',5,2022,2,'N700',2);