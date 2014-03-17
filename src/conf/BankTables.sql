
Drop table CheckingAccounts; 
Drop table Transfers;
Drop table Accounts; 
Drop table Persons;
Drop table Postals;
Drop sequence TransferId_sequence restrict;
-----------------------

create sequence TransferId_sequence as int start with 10000 increment by 1;

Create table Postals(
    code VARCHAR(4),
    district VARCHAR(30),
    PRIMARY KEY(code)
    );


Create table Persons( 
    cpr VARCHAR(20),
    title VARCHAR(5),
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    street VARCHAR(40),
    phone VARCHAR(30),
    email VARCHAR(60),
    password VARCHAR(64),
    postalcode VARCHAR(4) references Postals(code),
    PRIMARY KEY(cpr)
    );


Create table Accounts(
    accountNumber VARCHAR(30),
    balance FLOAT(20),
    interest FLOAT(20),
    customerCpr VARCHAR(20) references Persons(cpr),
    dtype VARCHAR(40),
    PRIMARY KEY(accountNumber)
    );


Create table Transfers(
    id VARCHAR(40),
    amount FLOAT(20), 
    transferDate DATE,
    sourceNumber VARCHAR(30) references Accounts(accountNumber),
    targetNumber VARCHAR(30) references Accounts(accountNumber),
    PRIMARY KEY(id)
    );


Create table CheckingAccounts(
    accountNumber VARCHAR(30) references Accounts(accountNumber),
    PRIMARY KEY(accountNumber)
    );
