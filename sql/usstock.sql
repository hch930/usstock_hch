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

create table tbl_reply(
	rno number(10,0),
	bno number(10,0) not null,
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updaeDate date default sysdate,
	ipAddress varchar2(20) not null
);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board
foreign key(bno) references tbl_board(bno);

create index idx_reply on tbl_reply(bno desc, rno asc);


drop table tbl_board;

drop sequence seq_board;

alter table tbl_board add constraint pk_board
primary key(bno);
