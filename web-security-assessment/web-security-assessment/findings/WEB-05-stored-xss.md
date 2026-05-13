# Stored XSS

## Description
Stored XSS occurs when a malicious script is injected into comments, messages, or other input fields and stored in the database. The script is then served to and executed in the browsers of users who view the affected page or content.

## Impact
- Affects all users
- Persistent attack

## Proof of Concept
A malicious script has been entered and saved in a picture comment section.

## Evidence
- Screenshot:
<img width="582" height="347" alt="image" src="https://github.com/user-attachments/assets/7f9d7d34-73bd-4ec7-ac8b-921ad4a01d01" />
<img width="611" height="302" alt="image" src="https://github.com/user-attachments/assets/e2441610-2d26-4b02-972a-01735be7a2e7" />
<img width="605" height="237" alt="image" src="https://github.com/user-attachments/assets/5276bd01-9d87-4c8a-bcb2-6f04b915271e" />


## Recommendation
- Validate and sanitize all user input on the server side.
- Encode/escape output based on context (HTML, attributes, JavaScript, URLs).
- Avoid rendering raw user input (e.g., no innerHTML).
- Use secure frameworks that auto-escape output by default.
- Implement a Content Security Policy (CSP) to limit script execution.
- Store data as plain text and only format it safely at display time.
- Regularly test for XSS vulnerabilities during security reviews.
