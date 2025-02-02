/**
  @author
 */
ALTER TABLE Customers
    ADD COLUMN datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE Customers
    ADD CONSTRAINT unique_email UNIQUE (email);
ALTER TABLE Customers
    ALTER COLUMN age TYPE NUMERIC(10, 1) USING age::NUMERIC(10, 1);
ALTER TABLE Customers
    ALTER COLUMN firstName TYPE INTEGER USING
        CASE
            WHEN firstName = 'Alice' THEN 1
            WHEN firstName = 'Bob' THEN 2
            WHEN firstName = 'Charlie' THEN 3
            WHEN firstName = 'David' THEN 4
            WHEN firstName = 'Eve' THEN 5
            WHEN firstName = 'Frank' THEN 6
            WHEN firstName = 'Grace' THEN 7
            WHEN firstName = 'Hannah' THEN 8
            WHEN firstName = 'Ian' THEN 9
            WHEN firstName = 'Julia' THEN 10
            WHEN firstName = 'Kevin' THEN 11
            WHEN firstName = 'Linda' THEN 12
            WHEN firstName = 'Michael' THEN 13
            WHEN firstName = 'Nancy' THEN 14
            WHEN firstName = 'Oliver' THEN 15
            WHEN firstName = 'Pamela' THEN 16
            WHEN firstName = 'Quentin' THEN 17
            WHEN firstName = 'Rachel' THEN 18
            WHEN firstName = 'Samuel' THEN 19
            WHEN firstName = 'Tina' THEN 20
            WHEN firstName = 'Ulysses' THEN 21
            WHEN firstName = 'Victoria' THEN 22
            WHEN firstName = 'Walter' THEN 23
            WHEN firstName = 'Xavier' THEN 24
            WHEN firstName = 'Yvonne' THEN 25
            WHEN firstName = 'Zachary' THEN 26
            WHEN firstName = 'Sophia' THEN 27
            WHEN firstName = 'Liam' THEN 28
            WHEN firstName = 'Emma' THEN 29
            WHEN firstName = 'Noah' THEN 30
            WHEN firstName = 'Ava' THEN 31
            WHEN firstName = 'Isabella' THEN 32
            WHEN firstName = 'Mia' THEN 33
            WHEN firstName = 'Olivia' THEN 34
            WHEN firstName = 'Ethan' THEN 35
            WHEN firstName = 'William' THEN 36
            WHEN firstName = 'James' THEN 37
            WHEN firstName = 'Benjamin' THEN 38
            WHEN firstName = 'Henry' THEN 39
            WHEN firstName = 'Alexander' THEN 40
            WHEN firstName = 'Amelia' THEN 41
            WHEN firstName = 'Charlotte' THEN 42
            WHEN firstName = 'Evelyn' THEN 43
            WHEN firstName = 'Harper' THEN 44
            WHEN firstName = 'Ella' THEN 45
            WHEN firstName = 'Emily' THEN 46
            WHEN firstName = 'Abigail' THEN 47
            WHEN firstName = 'Elizabeth' THEN 48
            WHEN firstName = 'Sofia' THEN 49
            WHEN firstName = 'Avery' THEN 50
            END;

-- rollback
ALTER TABLE Customers
    DROP COLUMN datetime;
ALTER TABLE Customers
    DROP CONSTRAINT unique_email;
ALTER TABLE Customers
    ALTER COLUMN age TYPE INTEGER USING age::INTEGER;
ALTER TABLE Customers
    ALTER COLUMN firstName TYPE VARCHAR(20) USING
        CASE
            WHEN firstName = 1 THEN 'Alice'
            WHEN firstName = 2 THEN 'Bob'
            WHEN firstName = 3 THEN 'Charlie'
            WHEN firstName = 4 THEN 'David'
            WHEN firstName = 5 THEN 'Eve'
            WHEN firstName = 6 THEN 'Frank'
            WHEN firstName = 7 THEN 'Grace'
            WHEN firstName = 8 THEN 'Hannah'
            WHEN firstName = 9 THEN 'Ian'
            WHEN firstName = 10 THEN 'Julia'
            WHEN firstName = 11 THEN 'Kevin'
            WHEN firstName = 12 THEN 'Linda'
            WHEN firstName = 13 THEN 'Michael'
            WHEN firstName = 14 THEN 'Nancy'
            WHEN firstName = 15 THEN 'Oliver'
            WHEN firstName = 16 THEN 'Pamela'
            WHEN firstName = 17 THEN 'Quentin'
            WHEN firstName = 18 THEN 'Rachel'
            WHEN firstName = 19 THEN 'Samuel'
            WHEN firstName = 20 THEN 'Tina'
            WHEN firstName = 21 THEN 'Ulysses'
            WHEN firstName = 22 THEN 'Victoria'
            WHEN firstName = 23 THEN 'Walter'
            WHEN firstName = 24 THEN 'Xavier'
            WHEN firstName = 25 THEN 'Yvonne'
            WHEN firstName = 26 THEN 'Zachary'
            WHEN firstName = 27 THEN 'Sophia'
            WHEN firstName = 28 THEN 'Liam'
            WHEN firstName = 29 THEN 'Emma'
            WHEN firstName = 30 THEN 'Noah'
            WHEN firstName = 31 THEN 'Ava'
            WHEN firstName = 32 THEN 'Isabella'
            WHEN firstName = 33 THEN 'Mia'
            WHEN firstName = 34 THEN 'Olivia'
            WHEN firstName = 35 THEN 'Ethan'
            WHEN firstName = 36 THEN 'William'
            WHEN firstName = 37 THEN 'James'
            WHEN firstName = 38 THEN 'Benjamin'
            WHEN firstName = 39 THEN 'Henry'
            WHEN firstName = 40 THEN 'Alexander'
            WHEN firstName = 41 THEN 'Amelia'
            WHEN firstName = 42 THEN 'Charlotte'
            WHEN firstName = 43 THEN 'Evelyn'
            WHEN firstName = 44 THEN 'Harper'
            WHEN firstName = 45 THEN 'Ella'
            WHEN firstName = 46 THEN 'Emily'
            WHEN firstName = 47 THEN 'Abigail'
            WHEN firstName = 48 THEN 'Elizabeth'
            WHEN firstName = 49 THEN 'Sofia'
            WHEN firstName = 50 THEN 'Avery'
            END;
