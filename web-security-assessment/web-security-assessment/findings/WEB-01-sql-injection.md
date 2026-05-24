# SQL Injection 

## Description
SQL Injection occurs when user input is directly used in SQL queries without proper sanitization.

## Impact
- Data leakage (users, passwords)
- Authentication bypass
- Database compromise

## Proof of Concept
After entering a payload in the login page’s name input, it returned a true value from the database and commented out the rest of the query, allowing any password value to bypass the authentication process.

## Evidence
- Screenshots:
  
<img width="292" height="257" alt="image" src="https://github.com/user-attachments/assets/5c26fdd2-7797-474c-a738-87d9cd8514c7" />  

<img width="399" height="338" alt="image" src="https://github.com/user-attachments/assets/4e202055-f4d6-4a95-833d-2062b9011c94" />  

<img width="196" height="214" alt="image" src="https://github.com/user-attachments/assets/5e01f44a-c0b3-4cbe-850d-db40483906dd" />  

## Recommendation
- Use parameterized queries (prepared statements)
- Validate and sanitize input
