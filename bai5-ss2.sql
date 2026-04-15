DROP TABLE transactions;
DROP TABLE wallets;
DROP TABLE customers;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,                
    fullname VARCHAR(100) NOT NULL            
);

CREATE TABLE wallets(
    wallet_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL UNIQUE,            
    balance DECIMAL(18,2) DEFAULT 0 CHECK(balance >= 0), 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    wallet_id INT NOT NULL,
    transaction_type VARCHAR(20) NOT NULL,  
    amount DECIMAL(18,2) NOT NULL CHECK(amount > 0),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP, 
    transaction_status VARCHAR(20) DEFAULT 'Thành công',
    FOREIGN KEY (wallet_id) REFERENCES wallets(wallet_id) 
);