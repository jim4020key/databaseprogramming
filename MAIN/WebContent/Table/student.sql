--<<STUDENT TABLE>>--

CREATE TABLE student(	--학생테이블
						--학번 / 비밀번호(4자리이상) / 주소 / 전공 

	s_id VARCHAR2(10) primary key,
	s_pwd VARCHAR2(30),
	s_addr VARCHAR2(30),
	s_major VARCHAR2(30)  --전공필드 제가 넣었어요!!
	
);


INSERT INTO student VALUES('1818181', 'abcdefg','서울','컴퓨터과학과');
INSERT INTO student VALUES ('1400000', 'abcde','대전', '법학과');
INSERT INTO student VALUES ('1500004', 'gkx1sne', '부산','경제학과');
INSERT INTO student VALUES ('1700014', 'sdfaew', '대구','통계학과');
INSERT INTO student VALUES ('1500029', 'aeewa', '서울','일본어학과');
INSERT INTO student VALUES ('1000030', '123gdasf','제주도', '작곡과');
INSERT INTO student VALUES ('1700017', 'kkkk','경주', '물리학과');