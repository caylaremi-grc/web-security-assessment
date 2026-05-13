#!/bin/bash

mkdir -p web-security-assessment/{report,findings,screenshots/{sqli,cookie-manipulation,reflected-xss,idor,stored-xss,union-sqli,enumeration,unrestricted-download},payloads,tools,references}

touch web-security-assessment/README.md
touch web-security-assessment/LICENSE

touch web-security-assessment/report/{executive-summary.md,methodology.md,scope.md,recommendations.md,conclusion.md}

touch web-security-assessment/findings/{WEB-01-sql-injection.md,WEB-02-cookie-manipulation.md,WEB-03-reflected-xss.md,WEB-04-idor.md,WEB-05-stored-xss.md,WEB-06-union-sqli.md,WEB-07-user-enumeration.md,WEB-08-unrestricted-file-download.md}

touch web-security-assessment/payloads/{sqli-payloads.txt,xss-payloads.txt,idor-test-cases.txt,enumeration-checks.txt}

touch web-security-assessment/tools/{burp-config.md,sqlmap-commands.md,nmap-results.md}

touch web-security-assessment/references/{owasp-top10.md,cwe-mapping.md,cvss-notes.md}
