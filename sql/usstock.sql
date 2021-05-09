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

drop table tbl_board;

drop sequence seq_board;

alter table tbl_board add constraint pk_board
primary key(bno);
