show databases;
CREATE DATABASE Personal_Finance_Health;
use Personal_Finance_Health;
show tables;

CREATE TABLE USERS(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   user_name VARCHAR(100) NOT NULL, 
   role ENUM(‘admin’ , ’user’) NOT NULL,    
   password VARCHAR(50) NOT NULL, UNIQUE(user_name));          

CREATE TABLE INCOME(
   income_id INT AUTO_INCREMENT, 
   user_id INT, 
   source VARCHAR(100), 
   amount DECIMAL(10,2) NOT NULL,
   date DATE, PRIMARY KEY(income_id), 
   FOREIGN KEY(user_id) REFERENCES USERS(user_id));

CREATE TABLE EXPENSE(
   expense_id INT AUTO_INCREMENT, 
   user_id INT, 
   category VARCHAR(100), 
   amount DECIMAL(10,2) NOT NULL,
   date DATE, PRIMARY KEY(expense_id), 
   FOREIGN KEY(user_id) REFERENCES USERS(user_id));

CREATE TABLE SAVINGS(
   saving_id INT AUTO_INCREMENT, 
   user_id INT, 
   account_type VARCHAR(100), 
   amount DECIMAL(10,2) NOT NULL,
   date DATE, PRIMARY KEY(saving_id), 
   FOREIGN KEY(user_id) REFERENCES USERS(user_id));

CREATE TABLE INVESTMENT(
   investment_id INT AUTO_INCREMENT, 
   user_id INT,
   investment_type VARCHAR(100), 
   amount DECIMAL(10,2) NOT NULL,
   return_rate DECIMAL(5,2) NOT NULL,
   date DATE, PRIMARY KEY(investment_id), 
   FOREIGN KEY(user_id) REFERENCES USERS(user_id));

CREATE TABLE DEBTS(
   debt_id INT AUTO_INCREMENT, 
   user_id INT, 
   debt_type VARCHAR(100), 
   amount DECIMAL(10,2) NOT NULL,
   interest_rate DECIMAL(5,2) NOT NULL,
   due DATE, PRIMARY KEY(debt_id), 
   FOREIGN KEY(user_id) REFERENCES USERS(user_id));

CREATE TABLE FINANCIAL_HEALTH(
   health_id INT AUTO_INCREMENT, 
   user_id INT, 
   score DECIMAL(10,2) NOT NULL,
   date DATE, PRIMARY KEY(health_id), 
   FOREIGN KEY(user_id) REFERENCES USERS(user_id));

INSERT INTO Users (user_name, role, password) VALUES
    ('john_doe', 'user', 'hashed_password_123'),
    ('jane_smith', 'user', 'hashed_password_456'),
    ('alice_wang', 'user', 'hashed_password_789'),
    ('bob_johnson', 'user', 'hashed_password_101'),
    ('emily_davis', 'user', 'hashed_password_112'),
    ('michael_brown', 'user', 'hashed_password_131'),
    ('sarah_miller', 'user', 'hashed_password_415'),
    ('david_wilson', 'user', 'hashed_password_161'),
    ('linda_moore', 'user', 'hashed_password_718'),
    ('admin_user', 'admin', 'hashed_password_919');

INSERT INTO Income (user_id, source, amount, date) VALUES
     (1, 'Salary', 3000.00, '2023-10-01'),
     (1, 'Freelance', 500.00, '2023-10-15'),
     (1, 'Bonus', 1000.00, '2023-10-30'),
     (2, 'Salary', 4000.00, '2023-10-01'),
     (2, 'Dividends', 200.00, '2023-10-10'),
     (2, 'Bonus', 800.00, '2023-10-25'),
     (3, 'Salary', 3500.00, '2023-10-01'),
     (3, 'Freelance', 600.00, '2023-10-20'),
     (3, 'Bonus', 700.00, '2023-10-31'),
     (4, 'Salary', 4500.00, '2023-10-01'),
     (4, 'Dividends', 300.00, '2023-10-15'),
     (4, 'Bonus', 900.00, '2023-10-30'),
     (5, 'Salary', 3200.00, '2023-10-01'),
     (5, 'Freelance', 400.00, '2023-10-10'),
     (5, 'Bonus', 600.00, '2023-10-25'),
     (6, 'Salary', 5000.00, '2023-10-01'),
     (6, 'Dividends', 250.00, '2023-10-15'),
     (6, 'Bonus', 1200.00, '2023-10-31'),
     (7, 'Salary', 3800.00, '2023-10-01'),
     (7, 'Freelance', 700.00, '2023-10-20'),
     (7, 'Bonus', 800.00, '2023-10-30'),
     (8, 'Salary', 4200.00, '2023-10-01'),
     (8, 'Dividends', 150.00, '2023-10-10'),
     (8, 'Bonus', 1000.00, '2023-10-25'),
     (9, 'Salary', 3600.00, '2023-10-01'),
     (9, 'Freelance', 550.00, '2023-10-15'),
     (9, 'Bonus', 750.00, '2023-10-31');

INSERT INTO Expense(user_id, category, amount, date) VALUES
     -- John Doe
     (1, 'Rent', 1200.00, '2023-10-01'),
     (1, 'Groceries', 300.00, '2023-10-05'),
     (1, 'Utilities', 150.00, '2023-10-07'),
     (1, 'Entertainment', 200.00, '2023-10-10'),
     (1, 'Transportation', 100.00, '2023-10-15'),
     -- Jane Smith
     (2, 'Rent', 1500.00, '2023-10-01'),
     (2, 'Groceries', 400.00, '2023-10-05'),
     (2, 'Utilities', 200.00, '2023-10-07'),
     (2, 'Entertainment', 250.00, '2023-10-10'),
     (2, 'Transportation', 150.00, '2023-10-15'),
     -- Alice Wang
     (3, 'Rent', 1300.00, '2023-10-01'),
     (3, 'Groceries', 350.00, '2023-10-05'),
     (3, 'Utilities', 180.00, '2023-10-07'),
     (3, 'Entertainment', 220.00, '2023-10-10'),
     (3, 'Transportation', 120.00, '2023-10-15'),
     -- Bob Johnson
     (4, 'Rent', 1400.00, '2023-10-01'),
     (4, 'Groceries', 320.00, '2023-10-05'),
     (4, 'Utilities', 160.00, '2023-10-07'),
     (4, 'Entertainment', 210.00, '2023-10-10'),
     (4, 'Transportation', 110.00, '2023-10-15'),
     -- Emily Davis
     (5, 'Rent', 1100.00, '2023-10-01'),
     (5, 'Groceries', 280.00, '2023-10-05'),
     (5, 'Utilities', 140.00, '2023-10-07'),
     (5, 'Entertainment', 190.00, '2023-10-10'),
     (5, 'Transportation', 90.00, '2023-10-15'),
     -- Michael Brown
     (6, 'Rent', 1600.00, '2023-10-01'),
     (6, 'Groceries', 450.00, '2023-10-05'),
     (6, 'Utilities', 220.00, '2023-10-07'),
     (6, 'Entertainment', 300.00, '2023-10-10'),
     (6, 'Transportation', 200.00, '2023-10-15'),
     -- Sarah Miller
     (7, 'Rent', 1350.00, '2023-10-01'),
     (7, 'Groceries', 330.00, '2023-10-05'),
     (7, 'Utilities', 170.00, '2023-10-07'),
     (7, 'Entertainment', 230.00, '2023-10-10'),
     (7, 'Transportation', 130.00, '2023-10-15'),
     -- David Wilson
     (8, 'Rent', 1450.00, '2023-10-01'),
     (8, 'Groceries', 340.00, '2023-10-05'),
     (8, 'Utilities', 190.00, '2023-10-07'),
     (8, 'Entertainment', 240.00, '2023-10-10'),
     (8, 'Transportation', 140.00, '2023-10-15'),    
     -- Linda Moore
     (9, 'Rent', 1250.00, '2023-10-01'),
     (9, 'Groceries', 310.00, '2023-10-05'),
     (9, 'Utilities', 160.00, '2023-10-07'),
     (9, 'Entertainment', 210.00, '2023-10-10'),
     (9, 'Transportation', 110.00, '2023-10-15');


INSERT INTO Savings (user_id, account_type, amount, date) VALUES
    -- John Doe
    (1, 'Emergency Fund', 5000.00, '2023-10-01'),
    (1, 'Retirement', 2000.00, '2023-10-01'),
    -- Jane Smith
    (2, 'Emergency Fund', 7000.00, '2023-10-01'),
    (2, 'Retirement', 3000.00, '2023-10-01'),
    -- Alice Wang
    (3, 'Emergency Fund', 6000.00, '2023-10-01'),
    (3, 'Retirement', 2500.00, '2023-10-01'),
    -- Bob Johnson
    (4, 'Emergency Fund', 5500.00, '2023-10-01'),
    (4, 'Retirement', 2200.00, '2023-10-01'),
    -- Emily Davis
    (5, 'Emergency Fund', 4800.00, '2023-10-01'),
    (5, 'Retirement', 1800.00, '2023-10-01'),
    -- Michael Brown
    (6, 'Emergency Fund', 8000.00, '2023-10-01'),
    (6, 'Retirement', 4000.00, '2023-10-01'),
    -- Sarah Miller
    (7, 'Emergency Fund', 6500.00, '2023-10-01'),
    (7, 'Retirement', 2700.00, '2023-10-01'),
    -- David Wilson
    (8, 'Emergency Fund', 5800.00, '2023-10-01'),
    (8, 'Retirement', 2300.00, '2023-10-01'),    
    -- Linda Moore
    (9, 'Emergency Fund', 5200.00, '2023-10-01'),
    (9, 'Retirement', 2100.00, '2023-10-01');

INSERT INTO Investment(user_id, investment_type, amount, return_rate, date) VALUES
     -- John Doe
     (1, 'Stocks', 10000.00, 8.50, '2023-10-01'),
     (1, 'Bonds', 5000.00, 3.00, '2023-10-01'),
     -- Jane Smith
     (2, 'Mutual Funds', 15000.00, 6.00, '2023-10-01'),
     (2, 'Real Estate', 20000.00, 5.00, '2023-10-01'),
     -- Alice Wang
     (3, 'Stocks', 12000.00, 8.00, '2023-10-01'),
     (3, 'Bonds', 6000.00, 3.50, '2023-10-01'),
     -- Bob Johnson
     (4, 'Mutual Funds', 18000.00, 6.50, '2023-10-01'),
     (4, 'Real Estate', 25000.00, 5.50, '2023-10-01'),
     -- Emily Davis
     (5, 'Stocks', 11000.00, 8.20, '2023-10-01'),
     (5, 'Bonds', 5500.00, 3.20, '2023-10-01'),
     -- Michael Brown
     (6, 'Mutual Funds', 20000.00, 7.00, '2023-10-01'),
     (6, 'Real Estate', 30000.00, 6.00, '2023-10-01'),
     -- Sarah Miller
     (7, 'Stocks', 13000.00, 8.30, '2023-10-01'),
     (7, 'Bonds', 7000.00, 3.30, '2023-10-01'),
     -- David Wilson
     (8, 'Mutual Funds', 17000.00, 6.70, '2023-10-01'),
     (8, 'Real Estate', 22000.00, 5.70, '2023-10-01'),
     -- Linda Moore
     (9, 'Stocks', 10500.00, 8.10, '2023-10-01'),
     (9, 'Bonds', 5200.00, 3.10, '2023-10-01');

INSERT INTO Debt(user_id, debt_type, amount, interest_rate, due_date) VALUES
     -- John Doe
     (1, 'Credit Card', 2000.00, 18.00, '2024-01-01'),
     (1, 'Student Loan', 10000.00, 5.00, '2025-01-01'),
     -- Jane Smith
     (2, 'Car Loan', 15000.00, 6.00, '2024-06-01'),
     (2, 'Personal Loan', 5000.00, 10.00, '2023-12-01'),
     -- Alice Wang
     (3, 'Credit Card', 2500.00, 18.50, '2024-02-01'),
     (3, 'Student Loan', 12000.00, 5.50, '2025-02-01'),
     -- Bob Johnson
     (4, 'Car Loan', 18000.00, 6.50, '2024-07-01'),
     (4, 'Personal Loan', 6000.00, 10.50, '2023-12-15'),
     -- Emily Davis
     (5, 'Credit Card', 2200.00, 18.20, '2024-01-15'),
     (5, 'Student Loan', 11000.00, 5.20, '2025-01-15'),
     -- Michael Brown
     (6, 'Car Loan', 20000.00, 7.00, '2024-08-01'),
     (6, 'Personal Loan', 7000.00, 11.00, '2023-12-20'),
     -- Sarah Miller
     (7, 'Credit Card', 2300.00, 18.30, '2024-02-15'),
     (7, 'Student Loan', 13000.00, 5.30, '2025-02-15'),
     -- David Wilson
     (8, 'Car Loan', 17000.00, 6.70, '2024-07-15'),
     (8, 'Personal Loan', 5500.00, 10.70, '2023-12-10'),
     -- Linda Moore
     (9, 'Credit Card', 2100.00, 18.10, '2024-01-10'),
     (9, 'Student Loan', 10500.00, 5.10, '2025-01-10');

--Calculating monthly net income for each user

select users.user_name, sum(income.amount), sum(expense.amount) from users 
left join income on users.user_id = income.user_id 
left join expense on users.user_id = expense.user_id 
where income.date between '2023-10-01' and '2023-10-31' group by users.user_id;

select users.user_name, sum(income.amount) - sum(expense.amount) as net_monthly_income from users 
left join income on users.user_id = income.user_id
left join expense on users.user_id = expense.user_id 
where income.date between '2023-10-01' and '2023-10-31' group by users.user_id;

--Identify high interest debts.

select users.user_name, debt_type, amount, interest_rate from debt 
inner join users on debt.user_id = users.user_id 
where interest_rate > 10 
order by interest_rate desc;

--Generate the financial health score using the data generating financial health score.

select users.user_id,(sum(income.amount) - sum(expense.amount) - sum(debt.amount))/sum(income.amount)*100
as score , now()
from users
left join income on  users.user_id = income.user_id 
left join expense on  users.user_id = expense.user_id 
left join debt on  users.user_id = debt.user_id
group by users.user_id;

--average spending based on each expense.

SELECT users.user_name, expense.category, avg(expense.amount) 
as avg_spending 
from expense inner join users on expense.user_id = users.user_id 
group by users.user_id, expense.category 
having avg_spending>(select avg(amount) from expense where category = 'Entertainment');

--Calculating savings growth rate.
SELECT users.user_name, savings.account_type, (savings.amount/(select sum(amount) from savings where user_id=savings.user_id))*100 
as savings_growth_rate 
from savings 
inner join users on savings.user_id = users.user_id;

--User Permissions.

--FOR ADMIN- 
create user 'admin'@'localhost' identified by 'admin123';
show grants for 'admin'@'localhost';
grant all privileges on Personal_Finance_Health.* to 'admin'@'localhost' with grant option;       
show grants for 'admin'@'localhost'
select user, host from mysql.user;

--FOR USERS-
create user 'users'@'localhost' identified by 'users123';
show grants for 'users'@'localhost';
grant select on Personal_Finance_Health.* to 'users'@'localhost';
show grants for 'users'@'localhost';
select user, host from mysql.user;

--Record income and update savings
 start transaction;
select * from savings;
select * from income;
savepoint s1;
Insert into income(user_id,source,amount,date) values(1,'side hustle', 9000.00,'2023-10-11');
savepoint s2;
update savings set amount = amount+9000.00 where user_id = 1 AND account_type = "Emergency Fund";
commit;

--Debt payoff and update savings
start transaction;
select * from savings;
select * from debt;
savepoint s3;
update savings set amount = amount-1000.00 where user_id = 1 AND account_type = "Emergency Fund";
savepoint s4;
update debt set amount = amount-1000.00 where debt_id = 1;
commit;

--Transfer funds between savings account
start transaction;
select * from savings;
savepoint s5;
update savings set amount = amount - 500.00 where user_id = 1 and account_type = "Emergency fund";
savepoint s6;
update savings set amount = amount+500.00 where user_id = 1 and account_type = "Retirement";
commit;

--Record investments and update savings
start transaction;
select * from savings;
select * from investment;
savepoint s7;
update savings set amount = amount-2000.00 where user_id=1 and account_type = "Emergency fund";
savepoint s8;
insert into investment(user_id, investment_type, amount, return_rate, date) values(1,'mutual Funds', 2000.00, 6.00, '2023-10-03');
commit;



















