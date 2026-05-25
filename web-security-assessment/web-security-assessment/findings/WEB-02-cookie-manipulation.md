# Cookie Manipulation

## Description
Cookie manipulation occurs when an application relies on client-side cookie values for authentication or authorization. If these values are not properly validated on the server side, they can be modified to gain unauthorized access.  

## Impact
- Unauthorized access to other user accounts
- Privilege escalation
- Exposure of sensitive user data
- Session impersonation  

## Proof of Concept
Using browser Developer Tools, the `user_id` value stored in the application cookies was modified. By changing this value to another valid user identifier, the application granted access to a different user's profile. This demonstrates that the application trusts client-side cookie data for authorization decisions.

## Evidence
- Screenshot:
<img width="501" height="314" alt="image" src="https://github.com/user-attachments/assets/6b2f778f-d108-46e7-b94d-87881d10a49d" />
<img width="501" height="312" alt="image" src="https://github.com/user-attachments/assets/e07eeec3-86c5-41d5-aa9b-f72c5f6f18ad" />


## Recommendation
- Never trust client-side cookie values for authentication or authorization
- Perform all access control checks on the server side
- Use secure, random, and signed session identifiers
- Implement HttpOnly and Secure cookie flags
- Validate session ownership on every request
