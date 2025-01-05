## backup-script-powershell
Backup script using PowerShell. Copies files from the source to the destination.


## Description
Purpose of this project is to demonstrate the following skills: 
- File System Management
- Error Handling
- Logging
- Data Backup


## Features
- Checks for the existence of the source and backup directories before proceeding.
- Automatically creates the backup directory if it does not exist.
- Logs the start and completion of the backup process, along with any errors encountered.
- Uses timestamps to organize backups in a structured manner. 


## Installation
- Download BackupScript.ps1 and save it to your desired location.
- You can optionally add this script to the Windows Task Scheduler for automated backups.


## Usage
- Modify the $sourceDir and $backupDir variables to specify your source and backup directories.
- Run the script in a PowerShell environment.
     - The default execution policy for PowerShell on Windows is typically set to "Restricted".
     - Instead of updating the execution policy to "Unrestricted", you can bypass the current policy:
          - Open PowerShell and type powershell.exe -ExecutionPolicy Bypass -File "C:\PowerShellScripts\BackupScript.ps1"
- Review the backup_log.txt file in the backup directory for details on the backup process.


## Credits
- This project was created by David Fiske in January 2025. 
