# IDOR (Insecure Direct Object Reference)

## Description
IDOR occurs when an application exposes direct references to internal objects (such as IDs, files, or database keys) and fails to properly verify whether the authenticated user is authorized to access them.

## Impact
- Unauthorized access to sensitive data
- Data exposure between users
- Potential privilege escalation
- Violation of data confidentiality

## Proof of Concept
After intercepting an HTTP download request in Burp Suite’s HTTP history, the request was sent to Repeater. The object identifier in the URL was manually modified to access resources belonging to another user.

This demonstrates that the application does not properly enforce authorization checks on object-level requests.

**Original Request:**  
- GET /download-transcript/3.txt HTTP/2  
**Modified Request:**  
- GET /download-transcript/1.txt HTTP/2  
which allowed access to another user’s private conversation.  
**Result**
 - The modified request successfully returned another user’s private conversation, confirming the IDOR vulnerability. 

## Evidence
- Screenshots
<img width="401" height="223" alt="image" src="https://github.com/user-attachments/assets/42a3f320-6c9b-4019-962b-a2241d536a62" />
<img width="336" height="280" alt="image" src="https://github.com/user-attachments/assets/56b87dd7-c2f6-44c3-bffd-6e4594ecfb37" />
<img width="284" height="282" alt="image" src="https://github.com/user-attachments/assets/089585ac-ddc4-4225-88ee-de8a028f4553" />

## Recommendations
- Enforce server-side authorization checks on every request
- Verify that the authenticated user owns or is permitted to access the requested resource
- Avoid exposing predictable object identifiers (use UUIDs or indirect references where possible)
- Implement strict access control and least-privilege principles
