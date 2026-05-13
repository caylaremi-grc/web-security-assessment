# Cookie Manipulation

## Description
Altering cookies to bypass authentication or change user roles.

## Impact
- Unauthorized access
- Privilege escalation

## Proof of Concept
Using the browser DevTools, the user_id value in the application cookies was modified to an easily guessable identifier, allowing access to another user’s profile and privilege escalation.

## Evidence
- Screenshot:
<img width="501" height="314" alt="image" src="https://github.com/user-attachments/assets/6b2f778f-d108-46e7-b94d-87881d10a49d" />
<img width="501" height="312" alt="image" src="https://github.com/user-attachments/assets/e07eeec3-86c5-41d5-aa9b-f72c5f6f18ad" />


## Recommendation
- Do not trust client-side data for authentication or authorization.
- Enforce all access control checks on the server side.
- Use secure, unpredictable session identifiers.
