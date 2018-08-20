Bash scripts for querying Palo Alto Wildfire API

### Setup
1. Add API key to api.conf:

### Recommended Usage
```
./submit-file.sh api.conf $sample_file
./get-verdict.sh api.conf $hash
./get-verdicts.sh api.conf $hash_file
./get-report.sh api.conf $hash > report.pdf
```
### Notes
- Hashes must be MD5 or SHA256   
- Files containing multiple hashes must be 500 lines or less  
- submit-file.sh performs NO checks to ensure Wildfire accepts that particular filetype, you can find a list of supported types in the [Palo Alto Wildfire Docs](https://www.paloaltonetworks.com/documentation/80/wildfire/wf_admin/wildfire-overview/wildfire-concepts/file-analysis)

### Status Codes
- 0 : benign
- 1 : malware
- 2 : grayware
- -100 : pending, the sample exists, but there is currently no verdict
- -101 : error
- -102 : unknown, cannot find sample record in the database
- -103 : invalid hash value  
NOTE: When sending an invalid hash value, an HTTP 421 status is returned.
