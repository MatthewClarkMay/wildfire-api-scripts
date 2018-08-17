Bash scripts for querying Palo Alto Wildfire API

### Setup
1. Add API key to api.conf:

### Recommended Usage
```
./get-report.sh api.conf <hash>
./get-verdict.sh api.conf <hash>
./get-verdicts.sh api.conf <hashlist-file>
./submit-file.sh api.conf <sample-file>
```
### Notes
- Hashes must be MD5 or SHA256   
- Files containing multiple hashes must be 500 lines or less  
- submit-file.sh performs NO checks to ensure Wildfire accepts that particular filetype, you can find a list of supported types in the [Palo Alto Wildfire Docs](https://www.paloaltonetworks.com/documentation/80/wildfire/wf_admin/wildfire-overview/wildfire-concepts/file-analysis)