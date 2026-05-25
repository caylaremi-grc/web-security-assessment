#  Union-sqli

## Description
This vulnerability allows an attacker to manipulate SQL queries using UNION-based SQL injection. By injecting crafted input, an attacker can combine results from the original query with results from other database queries.

## Impact
- Unauthorized access to database structure
- Exposure of sensitive data (e.g., usernames, passwords, emails)
- Ability to extract data from other tables
- Potential full database compromise depending on privileges

## Proof of Concept
**Determining the Number of Columns**
The vulnerability was tested using two common techniques to determine the number of columns returned by the SQL query:
- `ORDER BY`
- `UNION SELECT`
Example payloads:
' UNION SELECT NULL--  
' UNION SELECT NULL,NULL--  
' UNION SELECT NULL,NULL,NULL--  

## Evidence Step 1 - Determining the Number of Columns
**Method 1 — ORDER BY**
- Screenshots:
  <img width="810" height="788" alt="order by 1" src="https://github.com/user-attachments/assets/9aa36dc2-f65e-4658-a6ad-367d4b7aadb7" />
  <img width="397" height="86" alt="ORDER by 2 1" src="https://github.com/user-attachments/assets/a6534d80-2349-47e0-8a78-73d10bda22de" />
  <img width="852" height="780" alt="order by 2 2" src="https://github.com/user-attachments/assets/b81ae5c7-c486-4200-afd7-d2eece73bedd" />
  <img width="441" height="136" alt="order by 3" src="https://github.com/user-attachments/assets/4fd50ad2-9748-4c46-a93f-4265e5e04092" />
  <img width="897" height="785" alt="order by 3 1" src="https://github.com/user-attachments/assets/d5b21b7e-0773-4bc0-91a0-bf4d45c9392c" />
  <img width="360" height="150" alt="ORDER BY 4 " src="https://github.com/user-attachments/assets/8c2cdd9b-fe8f-4df1-9e79-824b7b2f1b61" />
  <img width="815" height="352" alt="ORDER BY 4 2" src="https://github.com/user-attachments/assets/1b29d01c-0766-4d5d-be45-0e4a8da8521b" />

**Method 2 — UNION SELECT NULL**
- Screenshots:  
  <img width="627" height="220" alt="image" src="https://github.com/user-attachments/assets/40a6d44d-4cd0-4d9f-98c1-6521b6f5d248" />
  <img width="627" height="496" alt="image" src="https://github.com/user-attachments/assets/dfd3bfa5-9b57-4070-8347-e3f30e69df5d" />
  <img width="627" height="391" alt="image" src="https://github.com/user-attachments/assets/fa104585-debe-4564-b0a6-c460b0c1fefe" />
  <img width="627" height="204" alt="image" src="https://github.com/user-attachments/assets/815dc268-3f00-4786-9f37-0a80ee6ba978" />

## Evidence Step 2 - Find a string-compatible column
- Screenshots:
  <img width="356" height="49" alt="image" src="https://github.com/user-attachments/assets/eaf429da-8ade-4ebb-be35-aafd409d0f01" />
  <img width="272" height="147" alt="image" src="https://github.com/user-attachments/assets/871366fc-aa94-4dcd-8519-527964eeb26c" />
  <img width="431" height="52" alt="image" src="https://github.com/user-attachments/assets/370e61fb-af9a-426d-9c23-d27ae165b6f3" />
  <img width="627" height="396" alt="image" src="https://github.com/user-attachments/assets/fa4e1ac9-6067-45ef-88b4-71905b1843e8" />

## Recommendation
- 
- 
