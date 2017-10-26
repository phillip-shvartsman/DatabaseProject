drop table if exists BOOK_WAREHOUSE;
drop table if exists tableORDER;
drop table if exists DISTRIBUTER;
drop table if exists BOOK;
drop table if exists AUTHOR;
drop table if exists EMPLOYEE;
drop table if exists REVIEW;
drop table if exists BOOK_AUTHOR;
drop table if exists BOOK_DISTRIBUTER;
drop table if exists BOOK_ORDER;
drop table if exists PUBLISHER;
drop table if exists WAREHOUSE;
drop table if exists CUSTOMER;


create table CUSTOMER(
	CustomerID integer primary key,
	LastN Text not null,
	FirstN Text not null,
	Billing_Addr Text,
	Billing_City Text,
	Billing_State Text
);
create table PUBLISHER(
	Name Text primary key,
	Pub_Addr Text,
	Pub_City Text,
	Pub_state Text
);
create table BOOK(
	Title TEXT NOT NULL,
	ISBN Text PRIMARY KEY,
	Language TEXT,
	Price DECIMAL(3,2),
	Category Text,
	Blurb Text,
	Year integer,
	PubName Text not null,
	FOREIGN KEY(PubName) references PUBLISHER(Name)
);
create table AUTHOR(
	FirstN Text NOT null,
	MiddleN Text,
	LastN Text not null,
	Biography Text,
	AuthID PRIMARY KEY
);
create table tableORDER(
	CustomerID integer not null,
	Status Text not null,
	OrderID Integer Primary Key autoincrement,
	Price Decimal(3,2),
	Timestamp Text,
	Dest_City Text,
	Dest_State Text,
	Dest_Addr Text,
	Number_Of_Items Integer not null,
	FOREIGN KEY(CustomerID) references Customer(CustomerID)
);
create table DISTRIBUTER(
	Name Text primary key,
	Distro_Addr Text,
	Distro_City Text,
	Distro_State Text
);
create table WAREHOUSE(
	WarehouseID primary key,
	W_Addr Text,
	W_City Text,
	W_State Text
);
create table EMPLOYEE(
	SSN integer primary key,
	Title Text,
	LastN Text not null,
	FirstN Text not null,
	Salary Integer,
	WarehouseID Integer,
	FOREIGN KEY(WarehouseID) references WAREHOUSE(WarehouseID)
);
create table REVIEW(
	Rating integer,
	Comments Text,
	ReviewID integer primary key,
	CustomerID integer not null,
	BookID integer not null,
	FOREIGN KEY(CustomerID) references CUSTOMER(CustomerID),
	FOREIGN KEY(BookID) references BOOK(ISBN)
);
create table BOOK_AUTHOR(
	AuthID integer,
	ISBN Text,
	PRIMARY KEY(AuthID,ISBN)
);
create table BOOK_WAREHOUSE(
	WarehouseID integer,
	ISBN Text,
	PRIMARY KEY(WarehouseID,ISBN)
);
create table BOOK_DISTRIBUTER(
	Name Text,
	ISBN Text,
	PRIMARY KEY(Name,ISBN)
);
create table BOOK_ORDER(
	OrderID integer,
	ISBN Text
);
