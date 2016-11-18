CREATE TABLE REGISTRATION(NAME VARCHAR2(30),UNAME VARCHAR2(30) primary key,PWD VARCHAR2(30),EMAIL VARCHAR2(40),GENDER VARCHAR2(20),DOB DATE,QUESTION VARCHAR2(100),ANSWER VARCHAR2(200),PNO VARCHAR2(20),CITY VARCHAR2(20));


CREATE TABLE userregistration(NAME VARCHAR2(30),UNAME VARCHAR2(30) primary key,PWD VARCHAR2(30),EMAIL VARCHAR2(40),GENDER VARCHAR2(20),DOB DATE,QUESTION VARCHAR2(100),ANSWER VARCHAR2(200),PNO VARCHAR2(20),CITY VARCHAR2(20));

CREATE TABLE  CONTACT(UNAME VARCHAR2(30),EMAIL VARCHAR2(35),PNO VARCHAR2(20),MESSAGE VARCHAR2(4000));

create table clouddetails(ip varchar2(30), username varchar2(30) primary key,password varchar2(20),status varchar2(20),rdate date);

CREATE TABLE transaction(username varchar2(45),filename varchar2(45),status varchar2(45),cloud varchar2(45),tdate date,report varchar2(45),FILEOWNERNAME varchar2(45));

CREATE TABLE request(username varchar2(45),filename varchar2(45),cloud varchar2(45),tdate date,status varchar2(45));

CREATE TABLE usertransaction(username varchar2(45),filename varchar2(45),status varchar2(45),cloud varchar2(45),tdate date);