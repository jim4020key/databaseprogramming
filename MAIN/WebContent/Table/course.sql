--<<COURSE TABLE>>--

CREATE TABLE course(   --과목테이블
						--과목번호 / 분반 / 과목명 / 학점 / 강의종류(필수/선택) 

	c_id VARCHAR2(10),
	c_id_no NUMBER,
	c_name VARCHAR2(100),
	c_unit NUMBER,
	c_class VARCHAR2(50),
	CONSTRAINT c_pk PRIMARY KEY(c_id, c_id_no)
	
);



INSERT INTO course VALUES('C400',3,'데이터베이스',3,'전공선택'); 
INSERT INTO course VALUES('C900',3,'객체지향 윈도우즈 프로그래밍',3,'전공선택');  
INSERT INTO course VALUES('M100',3,'멀티미디어 개론',3,'전공선택'); 
INSERT INTO course VALUES('C800',3,'자료구조',3,'전공필수');  
INSERT INTO course VALUES('M700',3,'게임프로그래밍',3,'전공필수'); 

INSERT INTO course VALUES('C300',3,'통계프로그래밍',1,'전공필수');
INSERT INTO course VALUES('C100',3,'회귀분석입문',1,'전공필수');
INSERT INTO course VALUES('M800',3,'기초통계학',3,'전공필수');
INSERT INTO course VALUES('M600',3,'진로탐색',1,'교양선택');
INSERT INTO course VALUES('A300',3,'글로벌미디어영어',1,'교양선택');
INSERT INTO course VALUES('A400',3,'경제학개론',2,'전공필수');
INSERT INTO course VALUES('B100',3,'미디어 현대사',2,'전공선택');
INSERT INTO course VALUES('B200',1,'일본대중문화기행',2,'교양선택');
INSERT INTO course VALUES('D500',1,'비즈니스와 문화',2,'교양선택');
INSERT INTO course VALUES('D600',1,'신화의 이해',2,'교양선택');
INSERT INTO course VALUES('E300',1,'회계원리',2,'전공필수');
INSERT INTO course VALUES('E500',2,'작곡가집중연구',3,'전공필수'); 
INSERT INTO course VALUES('F800',2,'서양음악사',3,'전공선택');
INSERT INTO course VALUES('F100',2,'나노물리',3,'전공선택');
INSERT INTO course VALUES('K200',2,'분자세포생물리학',3,'전공선택');
INSERT INTO course VALUES('K400',2,'응용물리 진로탐색',3,'전공선택');
INSERT INTO course VALUES('N800',2,'법학개론',3,'교양선택');
INSERT INTO course VALUES('N700',2,'법학전공자 진로탐색',3,'교양필수');