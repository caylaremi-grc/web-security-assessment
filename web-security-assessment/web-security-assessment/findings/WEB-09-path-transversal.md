#  Path Transversal

## Description
Path Traversal is a vulnerability that occurs when an application does not properly validate or sanitize user-supplied file paths. An attacker can use sequences such as `../` to navigate outside the intended directory and access sensitive files on the server.

## Impact
- Read sensitive system files
- Access application source code
- Retrieve configuration files
- Leak credentials, API keys, or tokens
- Access user data
- Potentially chain the issue into Remote Code Execution (RCE)

## Proof of Concept
- An image/file request was intercepted using a proxy tool (Repeater).  
- The original request contained a valid file reference: filename=52.png
- The parameter was modified to: filename=../../../etc/passwd
- The modified request was sent to the server.
- The application returned the contents of /etc/passwd, confirming a Path Traversal vulnerability and unauthorized file access.

**Payload Example:**  

../../../etc/passwd 
  
## Evidence
- Screenshots:
  <img width="1201" height="502" alt="image" src="https://github.com/user-attachments/assets/b332e344-07e4-4bcb-9ee0-afe0ee157820" />
  <img width="1240" height="782" alt="image" src="https://github.com/user-attachments/assets/ea6fe751-c92b-44bb-97c8-9ed5df6dd947" />
  <img width="1242" height="792" alt="image" src="https://github.com/user-attachments/assets/399538af-1e9f-45e7-bac5-4f868d52246a" />

## Recommendation
- Validate and sanitize all file path inputs
- Use allowlists for permitted files instead of raw user input paths
- Normalize file paths before processing and block traversal sequences (../)
- Restrict file access to specific directories using strict server-side controls
- Run the application with least-privilege permissions to limit file access impact

