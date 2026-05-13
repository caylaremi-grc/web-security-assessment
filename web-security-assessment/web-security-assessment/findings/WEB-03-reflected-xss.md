# Reflected XSS

## Description
Malicious script is reflected in response and executed in browser.

## Impact
- Session cookie theft
- Account hijacking
- Redirecting users to malicious websites
- Stealing sensitive information
- Performing actions on behalf of the victim
- Displaying fake login forms or phishing content
- Executing malicious JavaScript in the victim’s browser

## Proof of Concept
After inserting malicious code into an input field in a web application (such as a search bar, URL parameters, etc), the application immediately reflects the unsanitized input back in the browser’s response. As a result, the malicious script executes in the victim’s browser when they visit the crafted URL or interact with the vulnerable page, leading to a Reflected Cross-Site Scripting (XSS) vulnerability.

## Evidence
- Screenshots:
<img width="488" height="271" alt="image" src="https://github.com/user-attachments/assets/5e129ec3-212d-4bed-a876-5210db76abbc" />
<img width="520" height="297" alt="image" src="https://github.com/user-attachments/assets/9d409cfa-992e-46c2-86bd-65a63295c006" />


## Recommendation
- Escape output
- Use Content Security Policy (CSP)
