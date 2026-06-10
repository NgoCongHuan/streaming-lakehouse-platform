INSERT INTO corebank.branch(branch_code, branch_name, city)
SELECT 
    'BR' || lpad(i::text, 4, '0'),
    'Branch ' || i,
    CASE WHEN i % 3 = 0 THEN 'HCM'
         WHEN i % 3 = 1 THEN 'Ha Noi'
         ELSE 'Da Nang' END
FROM generate_series(1, 100) i;

INSERT INTO corebank.customer(customer_code, full_name, gender, dob, status)
SELECT
    'CUS' || lpad(i::text, 8, '0'),
    'Customer ' || i,
    CASE WHEN i % 2 = 0 THEN 'MALE' ELSE 'FEMALE' END,
    date '1970-01-01' + ((random() * 15000)::int),
    'ACTIVE'
FROM generate_series(1, 100000) i;

INSERT INTO corebank.account(account_no, customer_id, branch_id, account_type, currency, balance, status, opened_at)
SELECT
    'AC' || lpad(i::text, 10, '0'),
    i,
    ((random() * 99)::int + 1),
    CASE WHEN i % 3 = 0 THEN 'CASA'
         WHEN i % 3 = 1 THEN 'LOAN'
         ELSE 'DEPOSIT' END,
    'VND',
    round((random() * 100000000)::numeric, 2),
    'ACTIVE',
    now() - ((random() * 1000)::int || ' days')::interval
FROM generate_series(1, 100000) i;

INSERT INTO corebank.transaction(account_id, transaction_type, amount, currency, transaction_time, description)
SELECT
    ((random() * 99999)::int + 1),
    CASE WHEN i % 2 = 0 THEN 'CREDIT' ELSE 'DEBIT' END,
    round((random() * 10000000)::numeric, 2),
    'VND',
    now() - ((random() * 30)::int || ' days')::interval,
    'Sample transaction ' || i
FROM generate_series(1, 300000) i;