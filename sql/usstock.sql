create sequence seq_board;

create table tbl_board(
	bno number(10,0),
	title varchar2(200) not null,
	content varchar2(2000) not null,
	writer varchar2(50) not null,
	regdate date default sysdate,
	updatedate date default sysdate,
	ipaddress varchar2(20) not null
);

create sequence seq_reply;

alter table tbl_board add constraint pk_board
primary key(bno);

---------------------------------------------- 댓글 테이블 생성,인덱스 및 수정  -----------------------------------------------

create table tbl_reply(
	rno number(10,0),
	bno number(10,0) not null,
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updaeDate date default sysdate,
	ipAddress varchar2(20) not null
);

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board
foreign key(bno) references tbl_board(bno);

create index idx_reply on tbl_reply(bno desc, rno asc);

---------------------------------------------- 첨부파일 정보 테이블 생성  -----------------------------------------------
create table tbl_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(200) not null,
	fileName varchar2(100) not null,
	fileType char(1) default 'I',
	bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key(uuid);

alter table tbl_attach add constraint fk_board_attach foreign key(bno) references tbl_board(bno);

---------------------------------------------------- 댓글 총 갯수 ------------------------------------------------------

alter table tbl_board add(replycnt number default 0);

update tbl_board set replycnt = (select count(rno) from tbl_reply
where tbl_reply.bno = tbl_board.bno);
---------------------------------------------------- 삭제  ----------------------------------------------------------

drop table tbl_board;

drop sequence seq_board;


