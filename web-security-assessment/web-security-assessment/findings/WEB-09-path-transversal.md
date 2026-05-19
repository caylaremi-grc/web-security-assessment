#  (WEB-09-path-transversal)

## Description
Path Traversal is a vulnerability where an application does not properly validate user-supplied file paths.
An attacker can use sequences like ../ to move outside the intended directory and access sensitive files on the server.

Example:

../../../etc/passwd

This tells the server to go back multiple directories and read the system file /etc/passwd.

## Impact
- Read sensitive system files
- Access application source code
- Retrieve configuration files
- Leak credentials, API keys, or tokens
- Access user data
- Potentially chain the issue into Remote Code Execution (RCE)

## Proof of Concept
- Intercepted an image upload/request using a repeater tool.
- Original request contained:   filename=52.png
- Modified the filename parameter to:   filename=../../../etc/passwd
- Sent the modified request to the server.
- The application returned the contents of /etc/passwd in the response, confirming that arbitrary file read via Path Traversal was possible.
  
## Evidence
- Screenshots:
  <img width="1201" height="502" alt="image" src="https://github.com/user-attachments/assets/b332e344-07e4-4bcb-9ee0-afe0ee157820" />
  <img width="1240" height="782" alt="image" src="https://github.com/user-attachments/assets/ea6fe751-c92b-44bb-97c8-9ed5df6dd947" />
  <img width="1242" height="792" alt="image" src="https://github.com/user-attachments/assets/399538af-1e9f-45e7-bac5-4f868d52246a" />

## Recommendation
- Validate and sanitize all user-supplied file paths.
- Reject path traversal sequences such as:   ../
- Use an allowlist of permitted filenames or directories instead of directly using user input.
- Normalize file paths before processing them.
- Restrict file access to a dedicated safe directory (sandbox/jail).
- Avoid exposing internal filesystem paths in responses.
- Run the application with least-privileged permissions.
- Implement proper logging and monitoring for suspicious file access attempts.

