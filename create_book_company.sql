drop table if exists BOOK_WAREHOUSE;
drop table if exists ORDERS;
drop table if exists DISTRIBUTER;
drop table if exists AUTHOR;
drop table if exists EMPLOYEE;
drop table if exists REVIEW;
drop table if exists BOOK_AUTHOR;
drop table if exists BOOK_DISTRIBUTER;
drop table if exists BOOK_ORDER;
drop table if exists BOOK;
drop table if exists PUBLISHER;
drop table if exists CUSTOMER;
drop table if exists EMPLOYEEJOBS;
drop table if exists WAREHOUSE;
drop table if exists ADDRESS;

create table EMPLOYEEJOBS(
	Title Text primary key,
	WarehouseID Integer,
	Salary Integer,
	foreign key(WarehouseID) references Warehouse(WarehouseID)
);
create table CUSTOMER(
	CustomerID integer primary key autoincrement,
	LastN Text not null,
	FirstN Text not null
);
create table ADDRESS(
	CustomerID integer primary key,
	Street string,
	City string,
	State string
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
create table ORDERS(
	CustomerID integer not null,
	Status Text not null,
	OrderID Integer Primary Key autoincrement,
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
	WarehouseID integer primary key autoincrement,
	W_Addr Text,
	W_City Text,
	W_State Text
);
create table EMPLOYEE(
	SSN integer primary key,
	Title Text,
	LastN Text not null,
	FirstN Text not null,
	WarehouseID integer,
	FOREIGN KEY(WarehouseID) references WAREHOUSE(WarehouseID),
	FOREIGN KEY(Title) references EMPLOYEEJOBS(Title)
);
create table REVIEW(
	Rating integer,
	Comments Text,
	ReviewID integer primary key autoincrement,
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
	Stock integer,
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

create index indexOrderNoI
on Orders(Number_of_Items);
create index indexOrderStatus
on Orders(Status);
create index indexOrderTimestamp
on Orders(Timestamp);

create index indexBookPrice
on Book(Price);
create index indexBookTitle
on Book(Title);
create index indexBookCategory
on Book(Category);

create index indexReviewBookID
on Review(BookID);
create index indexReviewCustomerID
on Review(CustomerID);

create index indexBookOrder
on BOOK_Order(OrderID,ISBN);
