CREATE OR REPLACE VIEW `banking-kpi-demo.banking_kpi.v_clients` AS
SELECT
  c.`Client ID` AS client_id,
  c.`Joined Bank` AS joined_date,
  CAST(EXTRACT(YEAR FROM c.`Joined Bank`) AS STRING) AS year_of_joining,
  g.Gender AS gender,
  r.`Banking Relationship` AS banking_relationship,
  a.`Investment Advisor` AS investment_advisor,
  c.`Bank Loans` AS bank_loans,
  c.`Business Lending` AS business_lending,
  c.`Credit Card Balance` AS credit_card_balance,
  c.`Bank Deposits` AS bank_deposits,
  c.`Checking Accounts` AS checking_accounts,
  c.`Saving Accounts` AS saving_accounts,
  c.`Foreign Currency Account` AS foreign_currency_account,
  c.`Bank Loans` + c.`Business Lending` + c.`Credit Card Balance` AS total_loan,
  c.`Bank Deposits` + c.`Checking Accounts` + c.`Saving Accounts` + c.`Foreign Currency Account` AS total_deposit
FROM `banking-kpi-demo.banking_kpi.clients` c
JOIN `banking-kpi-demo.banking_kpi.gender` g ON c.GenderId = g.GenderId
JOIN `banking-kpi-demo.banking_kpi.banking_relationships` r ON c.BRId = r.BRId
JOIN `banking-kpi-demo.banking_kpi.investment_advisors` a ON c.IAId = a.IAId;
