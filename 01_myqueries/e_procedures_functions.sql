CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    balance DECIMAL(10,2) DEFAULT 0.00
);

INSERT INTO accounts (customer_name, balance) VALUES
('John Doe', 500.00),
('Jane Smith', 1000.00);

CREATE OR REPLACE PROCEDURE MakeTransaction(
    acc_id INT,       -- Account ID
    txn_type VARCHAR(10),  -- 'deposit' or 'withdraw'
    txn_amount DECIMAL(10,2)  -- Amount to add/subtract
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF txn_type = 'deposit' THEN
        -- Add money to the account
        UPDATE accounts 
        SET balance = balance + txn_amount 
        WHERE account_id = acc_id;
    
    ELSIF txn_type = 'withdraw' THEN
        -- Ensure enough balance before withdrawal
        IF (SELECT balance FROM accounts WHERE account_id = acc_id) >= txn_amount THEN
            UPDATE accounts 
            SET balance = balance - txn_amount 
            WHERE account_id = acc_id;
        ELSE
            RAISE EXCEPTION 'Insufficient balance!';
        END IF;
    ELSE
        RAISE EXCEPTION 'Invalid transaction type!';
    END IF;
END;
$$;


CREATE OR REPLACE FUNCTION GetBalance(acc_id INT) 
RETURNS DECIMAL(10,2)
LANGUAGE plpgsql
AS $$
DECLARE
    current_balance DECIMAL(10,2);
BEGIN
    SELECT balance INTO current_balance FROM accounts WHERE account_id = acc_id;
    RETURN current_balance;
END;
$$;

SELECT * FROM accounts;

 account_id | customer_name | balance 
------------+---------------+---------
          1 | John Doe      |  500.00
          2 | Jane Smith    | 1000.00

CALL MakeTransaction(1, 'deposit', 200.00);
CALL MakeTransaction(2, 'withdraw', 400.00);

SELECT * FROM accounts;

 account_id | customer_name | balance 
------------+---------------+---------
          1 | John Doe      |  700.00
          2 | Jane Smith    |  600.00


SELECT GetBalance(1);
 getbalance 
------------
     700.00