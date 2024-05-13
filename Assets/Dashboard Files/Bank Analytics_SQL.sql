


--Q1.Year wise loan amount Stats
SELECT
    CONCAT('20', SUBSTRING(issue_d, -2)) AS loan_year,
    loan_amnt
FROM  banks.finance_1;
---Q2.Grade and sub grade wise revol_bal
SELECT 
    f1.grade,
    f1.sub_grade,
    SUM(f2.revol_bal) AS total_revol_bal
FROM banks.finance_1 AS f1
JOIN banks.finance_2 AS f2 ON f1.id = f2.id
GROUP BY f1.grade, f1.sub_grade
ORDER BY f1.grade, f1.sub_grade;

--Q3.Total Payment for Verified Status Vs Total Payment for Non Verified Status

SELECT 
    f1.verification_status,
    SUM(f2.total_rec_prncp + f2.total_rec_int) AS total_payment
FROM banks.finance_1 AS f1
JOIN banks.finance_2 AS f2 ON f1.id = f2.id
GROUP BY f1.verification_status;
--Q.4State wise and month wise loan status

SELECT 
    issue_d, 
    addr_state AS state,
    loan_status,
    COUNT(*) AS total_loans
FROM  banks.finance_1 
GROUP BY issue_d, addr_state, loan_status
ORDER BY issue_d, addr_state, loan_status;

SELECT 
    SUBSTRING_INDEX(issue_d, '-', 1) AS year,
    SUBSTRING_INDEX(issue_d, '-', -1) AS month,
    addr_state AS state,
    loan_status,
    COUNT(*) AS total_loans
FROM banks.finance_1 
GROUP BY year, month, addr_state, loan_status
ORDER BY year, month, addr_state, loan_status;
--Q5.Home ownership Vs last payment date stats

SELECT 
    f1.home_ownership,
    f2.last_pymnt_d,
    COUNT(*) AS total_records
FROM banks.finance_1 AS f1
JOIN banks.finance_2 AS f2 ON f1.id = f2.id
GROUP BY f1.home_ownership, f2.last_pymnt_d
ORDER BY f1.home_ownership, f2.last_pymnt_d;

SELECT 
    f1.home_ownership,
    f2.last_pymnt_d
FROM banks.finance_1 AS f1
JOIN banks.finance_2 AS f2 ON f1.id = f2.id



