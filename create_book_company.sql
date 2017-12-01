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
<<<<<<< HEAD
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
=======
drop table if exists BOOK_CATEGORY;
drop table if exists CATEGORY;
drop table if exists ADDRESS;

create table ADDRESS (
    CustomerID Integer,
    Street Text,
    City Text,
    State Text,
    foreign key(CustomerID) references CUSTOMER(CustomerID)
);

create table CUSTOMER (
	CustomerID Integer,
	LastN Text not null,
	FirstN Text not null,
	Email Text,
    primary key(CustomerID)
>>>>>>> e6784cce4de44e19b8035ed976f1db113c399eff
);

create table PUBLISHER (
	Name Text primary key,
	Pub_Addr Text,
	Pub_City Text,
	Pub_state Text
);

create table BOOK (
	ISBN Text primary key,
	Title Text not null,
	Category Text,
	Language Text,
	Price Decimal(3,2),
	Blurb Text,
	Year Integer,
	PubName Text not null,
	foreign key(PubName) references PUBLISHER(Name)
);

create table AUTHOR (
	FirstN Text not null,
	MiddleN Text,
	LastN Text not null,
	Biography Text,
	AuthID primary key
);

create table ORDERS (
	CustomerID Integer not null,
	Status Text not null,
	OrderID Integer primary key autoincrement,
	Timestamp Text,
	Dest_City Text,
	Dest_State Text,
	Dest_Addr Text,
	Number_Of_Items Integer not null,
	foreign key(CustomerID) references CUSTOMER(CustomerID)
);

create table DISTRIBUTER (
	Name Text primary key,
	Distro_Addr Text,
	Distro_City Text,
	Distro_State Text
);

create table WAREHOUSE (
	WarehouseID Integer primary key autoincrement,
	W_Addr Text,
	W_City Text,
	W_State Text
);

create table EMPLOYEE(
	SSN Integer primary key,
	Title Text,
	LastN Text not null,
	FirstN Text not null,
<<<<<<< HEAD
	WarehouseID integer,
	FOREIGN KEY(WarehouseID) references WAREHOUSE(WarehouseID),
	FOREIGN KEY(Title) references EMPLOYEEJOBS(Title)
=======
	Salary Integer,
	WarehouseID Integer,
	foreign key(WarehouseID) references WAREHOUSE(WarehouseID)
>>>>>>> e6784cce4de44e19b8035ed976f1db113c399eff
);

create table REVIEW(
	Rating Integer,
	Comments Text,
	ReviewID Integer primary key autoincrement,
	CustomerID Integer not null,
	BookID Integer not null,
	foreign key(CustomerID) references CUSTOMER(CustomerID),
	foreign key(BookID) references BOOK(ISBN)
);

create table Category (
    Name Text primary key
);

create table BOOK_AUTHOR (
	AuthID Integer,
	ISBN Text,
	primary key(AuthID, ISBN)
);

create table BOOK_WAREHOUSE (
	WarehouseID Integer,
	ISBN Text,
	Stock Integer,
	primary key(WarehouseID,ISBN)
);

create table BOOK_DISTRIBUTER (
	Name Text,
	ISBN Text,
	primary key(Name, ISBN)
);

create table BOOK_ORDER (
	OrderID Integer,
	ISBN Text,
    NumberOfItems Integer,
    primary key(OrderID, ISBN),
    foreign key(OrderID) references Orders(OrderID),
    foreign key(ISBN) references BOOK(ISBN)
);

create table BOOK_CATEGORY (
	ISBN Integer not null,
	CategoryName Text not null,
	primary key(ISBN, CategoryName),
	foreign key(ISBN) references BOOK(ISBN),
	foreign key(CategoryName) references CATEGORY(Name)
);
