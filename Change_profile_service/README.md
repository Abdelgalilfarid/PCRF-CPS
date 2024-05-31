## Profile Service Change Script

This script is used to change the profile service for users.

### Description

The script reads user data from a CSV file (`usersList.csv`) that contains the following information for each user:
- Username
- Existing service
- New service

For each user, the script generates and sends two SOAP requests to a server at `http://192.168.1.1:8080/ua/soap/`:
1. **Add Service Request**: Adds the new service to the user's profile.
2. **Delete Service Request**: Deletes the existing service from the user's profile.

The script logs its activities to the terminal, providing feedback on the operations performed for each user.

### Usage

1. **Make the script executable:**

```chmod +x Change_service.sh```

2. **Run the script ** 

```./Change_service.sh```
 