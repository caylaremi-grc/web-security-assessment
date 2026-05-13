# IDOR (Insecure Direct Object Reference)

## Description
Accessing unauthorized data by changing object IDs.

## Impact
- Data exposure
- Unauthorized access

## Proof of Concept
After intercepting an HTTP download request in Burp Suite’s HTTP history, I sent it to Repeater and manually modified the object ID to access unauthorized data. In this case, I changed:
- GET /download-transcript/3.txt HTTP/2
to:
- GET /download-transcript/1.txt HTTP/2
which allowed access to another user’s private conversation.

## Evidence
- Screenshots
<img width="401" height="223" alt="image" src="https://github.com/user-attachments/assets/42a3f320-6c9b-4019-962b-a2241d536a62" />
<img width="336" height="280" alt="image" src="https://github.com/user-attachments/assets/56b87dd7-c2f6-44c3-bffd-6e4594ecfb37" />
<img width="284" height="282" alt="image" src="https://github.com/user-attachments/assets/089585ac-ddc4-4225-88ee-de8a028f4553" />

## Recommendations
- Enforce server-side authorization checks on every request
- Verify the authenticated user owns or is permitted to access the requested object/resource
- Avoid exposing predictable object IDs directly (use indirect references/UUIDs if possible)
- Implement proper access control and least-privilege principles
