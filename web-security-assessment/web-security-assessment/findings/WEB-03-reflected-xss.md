# Reflected XSS

## Description
Reflected Cross-Site Scripting (XSS) occurs when user input is immediately returned in the HTTP response without proper sanitization or encoding, allowing injected JavaScript to execute in the victim’s browser.  

## Impact
- Session cookie theft
- Account hijacking
- Redirecting users to malicious websites
- Stealing sensitive information
- Performing actions on behalf of the victim
- Displaying fake login forms or phishing content
- Executing malicious JavaScript in the victim’s browser

## Proof of Concept
A malicious script was injected into an input field (e.g. search parameter / URL parameter). The application reflected the unsanitized input directly in the response without proper encoding. As a result, the injected JavaScript executed in the browser when the crafted URL was loaded, confirming a Reflected XSS vulnerability.  

**Example Payload:**  
<script>alert(1)</script>

**OR URL-based:**
https://target.com/search?q=<script>alert(1)</script>

## Evidence
- Screenshots:
<img width="488" height="271" alt="image" src="https://github.com/user-attachments/assets/5e129ec3-212d-4bed-a876-5210db76abbc" />
<img width="520" height="297" alt="image" src="https://github.com/user-attachments/assets/9d409cfa-992e-46c2-86bd-65a63295c006" />

##Recommendation
- Properly escape and encode all user-supplied input before rendering it in HTML
- Implement Content Security Policy (CSP) to restrict script execution
- Avoid directly inserting user input into the DOM
- Use safe templating engines that auto-escape output

