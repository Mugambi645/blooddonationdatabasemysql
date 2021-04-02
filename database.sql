/*!!!SQL is not case sensitive*/
--create database
CREATE DATABASE blooddonation;
--use database
use blooddonation;
--create table for users ie login and sign up
create table accounts (
    id int(10) NOT NULL PRIMARY KEY,
    username varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    email varchar(100) NOT NULL

);
--seeker table
create table seeker (
     seeker_id int(10) NOT NULL PRIMARY KEY,
     name varchar(100) NOT NULL,
     age int(10) NOT NULL,
     city varchar(100) DEFAULT NULL,
     bloodgroup varchar(100) NOT NULL,
     phone_no int(10) NOT NULL,
     cnic varchar(100),
     gender varchar(100) NOT NULL,
     registration_date int(10) DEFAULT NULL,
     foreign key(seeker_id) references accounts(id)
 );

--hospital
create table hospital (
     hospital_id int(10) NOT NULL PRIMARY KEY,
     name varchar(100) NOT NULL,
     address varchar(100) NOT NULL,
     phone_no int(10) NOT NULL,
     website varchar(100) DEFAULT NULL,
     email varchar(100) NOT NULL,
     location varchar(100) NOT NULL,
     city varchar(100) NOT NULL,
     foreign key(hospital_id) references seeker(seeker_id)
    );

--blood bank table
create table blood_bank (
    bloodbank_id int(10) NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    address varchar(100) NOT NULL,
    bloodbank_phone int(10) NOT NULL,
    location varchar(100) NOT NULL,
    website varchar(100) DEFAULT NULL,
    email varchar(100) NOT NULL,
    foreign key(bloodbank_id) references hospital(hospital_id)
     );

--blood stock
create table blood_stock (
    stock_id int(10) NOT NULL PRIMARY KEY,
    blood_groups varchar(100) NOT NULL,
    status varchar(100) DEFAULT NULL,
    quantity int(10) DEFAULT NULL,
    best_before int(10) DEFAULT NULL,
    foreign key(stock_id) references blood_bank(bloodbank_id)
    );

--request
create table request (
    request_id int(10) NOT NULL PRIMARY KEY,
    request_date int(10) NOT NULL,
    member_type varchar(100) NOT NULL,
    member_name varchar(100) NOT NULL,
    required_blood varchar(100) NOT NULL,
    quantity int(10) NOT NULL,
    contact int(10) NOT NULL,
    location varchar(100) DEFAULT NULL,
    foreign key(request_id) references blood_stock(stock_id)
     );

--donor
create table donor (
    donor_id int(10) NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    blood_group varchar(100) NOT NULL,
    last_donation_date int(10) DEFAULT NULL,
    contact_no int(10) NOT NULL,
    cnic varchar(100) DEFAULT NULL,
    location varchar(100) NOT NULL,
    donor_city varchar(100) DEFAULT NULL,
    foreign key(donor_id) references request(request_id)
     );

--display the tables now
SHOW tables;

 --insert command
 --test on accounts table
 INSERT INTO accounts VALUES(1,"john43","joshmunesh","josh@gmail.com");

 ---demonstration of select command
 SELECT * FROM accounts;

 --demonstration of update command
 UPDATE accounts
 SET username = "brenda", password="bree", email="bree@gmail.com"
 WHERE id = 1;

 --demonstration of alter command
 ALTER table accounts
 ADD country varchar(100);

 --demonstration of aggregate functions
/*examples are min,max,count and sum*/
SELECT count(id), username
FROM accounts
GROUP BY username;


