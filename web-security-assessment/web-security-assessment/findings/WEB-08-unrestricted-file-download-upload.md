#  Unrestricted File Download/Upload

## Description
This vulnerability occurs when a web application does not properly validate uploaded files and allows users to upload executable files such as PHP scripts.
If the uploaded file is accessible through the web server, an attacker may execute arbitrary code or retrieve sensitive server-side data.

## Impact
- Execute arbitrary server-side code
- Read sensitive files and confidential data
- Access application configuration files
- Gain unauthorized access to internal resources
- Potentially achieve Remote Code Execution (RCE)
- Fully compromise the affected server depending on permissions 

## Proof of Concept
- Navigated to the profile avatar upload functionality.
- Created a PHP file containing the following code:   <?php echo file_get_contents('/home/targetdir/targetdata'); ?>
- Uploaded the PHP file instead of a legitimate image file.
- Intercepted the GET request used to access the uploaded avatar/image.
- Sent the request to repeater.
- The server executed the uploaded PHP script and returned the contents of:   /home/targetdir/targetdata
- Confidential data was successfully disclosed in the HTTP response.

This confirms that:
- File type validation was insufficient
- Executable files could be uploaded
- Uploaded files were executed by the server

## Evidence
- Screenshots:
 <img width="1701" height="576" alt="image" src="https://github.com/user-attachments/assets/61fb38b5-2e8c-4ba6-826e-4237bf1838f8" />  
 <img width="955" height="271" alt="image" src="https://github.com/user-attachments/assets/c1164231-90aa-48d5-8301-6b412cbbf1ae" />  
 <img width="1620" height="917" alt="image" src="https://github.com/user-attachments/assets/b55288e0-63e1-4e44-adc2-99673b50cc80" />  
 <img width="1378" height="655" alt="image" src="https://github.com/user-attachments/assets/6599f34d-2f5d-4358-b90e-e348c1130378" />  

## Recommendation
- Strictly validate uploaded file types using an allowlist.
- Verify file content/signature instead of relying only on extensions.
- Block dangerous extensions such as:   .php .phtml .php3 .php5
- Store uploaded files outside the web root whenever possible.
- Disable script execution in upload directories.
- Rename uploaded files to randomized server-generated names.
- Enforce proper Content-Type validation.
- Apply least-privilege permissions to upload directories.
- Implement antivirus/malware scanning for uploaded files.
- Restrict direct access to uploaded content when not required.
