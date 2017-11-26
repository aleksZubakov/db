CREATE TABLE Distributor (
    id            integer PRIMARY KEY,
    address       varchar(255),
    bank_account  varchar(255),
    first_name    varchar(30),
    second_name   varchar(30),
    phone         varchar(20)
);

CREATE TABLE Supply (
    id            integer PRIMARY KEY,
    distributor   integer REFERENCES Distributor(id),
    store_number  integer REFERENCES Store_house(Number),
    arrival_date  date,
    arrival_time  time,
    storekeeper   varchar(30) REFERENCES Storekeeper(Second_name)
);

CREATE TABLE Store_house (
    number        integer PRIMARY KEY,
    address       varchar(255)
);

CREATE TABLE Storekeeper (
    second_name   varchar(30) PRIMARY KEY
);

CREATE TABLE Transport_pack (
    supply_id           integer REFERENCES Supply(id),
    sedicine            varchar(255),
    sumber_trans_pack   integer,
    seight_trans_pack   real,
    sumber_sale_pack    integer,
    srice_sale_pack     real,
    sype_sale_pack      varchar(255) REFERENCES Type_of_sale_pack(titile)
);

CREATE TABLE Type_of_sale_pack (
    title           varchar(255) PRIMARY KEY
);

CREATE TABLE Medicine (
    name  varchar(20) PRIMARY KEY,
    international_name  varchar(20) UNIQUE,
    manufacturer  varchar(20),
    active_substance  varchar(20),
    certificate varchar(20) UNIQUE
);

CREATE TABLE Certificate (
    numb  varchar(10) REFERENCES Medicine(certificate) UNIQUE,
    lab varchar(10)
);

CREATE TABLE Laboratory (
    name  varchar(20) PRIMARY KEY,
    leader  varchar(20)
);

CREATE TABLE Substance (
    name  varchar(20) PRIMARY KEY,
    formula varchar(80) UNIQUE
);


CREATE TABLE IF NOT EXISTS Pharmacy (
    address varchar(255),
    number integer PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Range (
    pills varchar(255) REFERENCES Medicine(name),
    price real,
    num_of_end_pack integer,
    pharm_number integer REFERENCES Pharmacy(number)
);

CREATE TABLE IF NOT EXISTS Tasks (
    task_time date,
    stock_number integer,
    pills varchar(255) REFERENCES Medicine(name),
    num_of_first_pack integer,
    pharmacy_num integer
    car_number varchar(255) REFERENCES Car(car_number)
);

CREATE TABLE IF NOT EXISTS Car (
    car_maintenance date,
    car_number varchar(10) UNIQUE
);
