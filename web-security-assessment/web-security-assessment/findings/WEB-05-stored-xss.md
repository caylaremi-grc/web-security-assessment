# Stored XSS

## Description
Stored Cross-Site Scripting (XSS) occurs when malicious input is saved on the server (e.g., in a database) and later displayed to users without proper sanitization or encoding. When other users view the affected content, the script executes in their browser.

## Impact
- Affects all users who view the stored content
- Persistent attack (remains until removed)
- Session hijacking and account takeover
- Defacement or phishing attacks
- Execution of arbitrary JavaScript in victims’ browsers

## Proof of Concept
A malicious script was injected into the picture comment section and stored in the database. When the comment was later retrieved and displayed by the application, the script executed in the browser of users viewing the page, confirming a Stored XSS vulnerability.

**Example Payload:**  

- <script>alert(1)</script>  

## Evidence
- Screenshot:
<img width="582" height="347" alt="image" src="https://github.com/user-attachments/assets/7f9d7d34-73bd-4ec7-ac8b-921ad4a01d01" />
<img width="611" height="302" alt="image" src="https://github.com/user-attachments/assets/e2441610-2d26-4b02-972a-01735be7a2e7" />
<img width="605" height="237" alt="image" src="https://github.com/user-attachments/assets/5276bd01-9d87-4c8a-bcb2-6f04b915271e" />

## Recommendation
Sanitize and validate all user input before storing it
Escape output before rendering data in HTML
Use Content Security Policy (CSP) to reduce impact
Apply allow-lists for allowed HTML tags if rich text is required
Avoid directly rendering database content without encoding
