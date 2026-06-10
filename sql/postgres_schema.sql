CREATE SCHEMA IF NOT EXISTS corebank;

CREATE TABLE corebank.branch (
    branch_id BIGSERIAL PRIMARY KEY,
    branch_code VARCHAR(30) UNIQUE NOT NULL,
    branch_name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.customer (
    customer_id BIGSERIAL PRIMARY KEY,
    customer_code VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    gender VARCHAR(20),
    dob DATE,
    status VARCHAR(30),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.customer_address (
    address_id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES corebank.customer(customer_id),
    address_type VARCHAR(30),
    address_line VARCHAR(500),
    city VARCHAR(100),
    province VARCHAR(100),
    is_primary BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.customer_contact (
    contact_id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES corebank.customer(customer_id),
    contact_type VARCHAR(30),
    contact_value VARCHAR(255),
    is_primary BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.account (
    account_id BIGSERIAL PRIMARY KEY,
    account_no VARCHAR(50) UNIQUE NOT NULL,
    customer_id BIGINT REFERENCES corebank.customer(customer_id),
    branch_id BIGINT REFERENCES corebank.branch(branch_id),
    account_type VARCHAR(30),
    currency VARCHAR(10),
    balance NUMERIC(18,2),
    status VARCHAR(30),
    opened_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.transaction (
    transaction_id BIGSERIAL PRIMARY KEY,
    account_id BIGINT REFERENCES corebank.account(account_id),
    transaction_type VARCHAR(30),
    amount NUMERIC(18,2),
    currency VARCHAR(10),
    transaction_time TIMESTAMP DEFAULT now(),
    description TEXT,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.loan_account (
    loan_id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES corebank.customer(customer_id),
    account_id BIGINT REFERENCES corebank.account(account_id),
    principal_amount NUMERIC(18,2),
    outstanding_amount NUMERIC(18,2),
    interest_rate NUMERIC(5,2),
    start_date DATE,
    maturity_date DATE,
    status VARCHAR(30),
    updated_at TIMESTAMP DEFAULT now()
);

CREATE TABLE corebank.deposit_account (
    deposit_id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES corebank.customer(customer_id),
    account_id BIGINT REFERENCES corebank.account(account_id),
    deposit_amount NUMERIC(18,2),
    interest_rate NUMERIC(5,2),
    start_date DATE,
    maturity_date DATE,
    status VARCHAR(30),
    updated_at TIMESTAMP DEFAULT now()
);