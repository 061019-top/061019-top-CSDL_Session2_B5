DROP TABLE transactionn;
DROP TABLE wallet;
DROP TABLE customer;

CREATE TABLE customer(
    customer_id INT PRIMARY KEY,                
    fullname VARCHAR(100) NOT NULL            
);

CREATE TABLE wallet(
    wallet_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL UNIQUE,            
    balance DECIMAL(10,2) DEFAULT 0 CHECK(balance >= 0), 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactionn(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    wallet_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,  
    amount DECIMAL(10,2) NOT NULL CHECK(amount > 0),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP, 
    transaction_status VARCHAR(20) DEFAULT 'Thành công',
    FOREIGN KEY (wallet_id) REFERENCES wallets(wallet_id) 
);