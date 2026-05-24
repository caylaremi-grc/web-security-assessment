#  User Enumeration

## Description
User enumeration was identified during testing of the login functionality. The application reveals differences in responses based on whether a username exists and whether credentials are valid. This behavior was confirmed using Burp Suite Intruder by testing multiple username and password combinations.

By analyzing response length, HTTP status codes, and redirects, it was possible to distinguish valid usernames and eventually valid credentials.

## Impact
- Allows attackers to identify valid usernames in the system.
- Enables targeted brute-force and credential stuffing attacks.
- Facilitates account takeover attempts by narrowing down valid credentials.
- Provides attackers with a reliable method to enumerate users through automated tools.

## Proof of Concept
### Username Enumeration via Response Analysis
1. A login request was intercepted using Burp Suite.
2. An initial request was sent using an invalid username and password.
3. The request was forwarded to Burp Intruder with a list of usernames.
4. Payload positions were set on the username parameter.
5. Responses were analyzed based on response length differences.

**Observation:**
- Invalid usernames returned consistent response lengths.
- One username produced a noticeably different (higher) response length, indicating a valid account.

### Password Validation via Intruder Attack
1. After identifying a valid username, a second Intruder attack was performed.
2. A password list was used against the confirmed username.
3. Responses were analyzed based on HTTP status codes.

**Observation:**
- Incorrect passwords returned HTTP `200 OK`.
- A correct password triggered HTTP `302 Found`, indicating successful authentication and redirect.

## Evidence
- Screenshots:
<img width="575" height="350" alt="image" src="https://github.com/user-attachments/assets/7297a32e-2635-4839-8ea9-f029147fff76" />
<img width="627" height="507" alt="image" src="https://github.com/user-attachments/assets/f1abd53d-db8c-49fc-a451-fa5251d7fa64" />
<img width="627" height="494" alt="image" src="https://github.com/user-attachments/assets/fcd593b2-7843-4f0a-a31a-f140ab229f42" />
<img width="627" height="588" alt="image" src="https://github.com/user-attachments/assets/9f71f7e6-e986-43cf-8896-dcc175b9d003" />
<img width="627" height="147" alt="image" src="https://github.com/user-attachments/assets/ade1b339-3d0b-463f-822c-84a128de7d78" />
<img width="585" height="343" alt="image" src="https://github.com/user-attachments/assets/91095ad8-ac4d-4735-9136-aefe0b0a056f" />
<img width="627" height="522" alt="image" src="https://github.com/user-attachments/assets/bf56a7ef-f7ad-4133-aad8-c0fd4b244f14" />
<img width="627" height="197" alt="image" src="https://github.com/user-attachments/assets/68d96287-faa7-4344-ab93-24a911a296cd" />
<img width="627" height="637" alt="image" src="https://github.com/user-attachments/assets/a81bc5e4-d755-4a92-b4b6-878d3924117a" />
<img width="517" height="362" alt="image" src="https://github.com/user-attachments/assets/ac689480-db30-470d-b739-c7c436369ce4" />
<img width="627" height="264" alt="image" src="https://github.com/user-attachments/assets/aaf47a15-e9bd-492c-9884-ebcd998a2dd9" />

## Recommendation
- Ensure consistent responses for valid and invalid usernames (same status code and response message).
- Avoid disclosing whether a username exists during authentication attempts.
- Normalize response length and timing differences to prevent inference attacks.
- Implement rate limiting on login endpoints to prevent automated enumeration.
- Introduce account lockout or progressive delays after multiple failed attempts.
- Use generic authentication error messages such as "Invalid credentials" for all failures.
- Monitor and log repeated failed login attempts for detection and alerting.

