###########################################################################################
# Filename:    BackupScript.ps1
# Purpose:     Backup files from the source to the destination.
#
# @author:     David Fiske
# Date:        Jan 04, 2025
# Version:     1.0
###########################################################################################

# Define source and backup directories for file transfer
$sourceDir = "C:\Source\Directory"
$backupDir = "H:\Backup\Directory"

# Function to get the current timestamp
function Get-Timestamp {
    return (Get-Date -Format "yyyy-MM-dd_HHmmss")
}

# Terminate script if the source directory does not exist
if (-Not (Test-Path -Path $sourceDir)) {
    throw "Error: The source directory $sourceDir does not exist."
}

# Terminate script if the backup drive does not exist
$backupDrive = Split-Path -Path $backupDir -Qualifier
if (-Not (Test-Path $backupDrive)) {
    throw "Error: The backup drive $backupDrive does not exist."
}

# Define the log file path
$logFile = Join-Path -Path $backupDir -ChildPath "backup_log.txt"

# Create the backup directory if it does not exist
if (-Not (Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
    Write-Output "[$(Get-Timestamp)] New $backupDir folder successfully created." | Tee-Object -FilePath $logFile -Append
}

# Define the destination subdirectory within the backup directory based on the current timestamp
$destination = Join-Path -Path $backupDir -ChildPath $(Get-Timestamp)

# Full backup from source to destination
try {
    Write-Output "[$(Get-Timestamp)] Backup process started from $sourceDir." | Tee-Object -FilePath $logFile -Append
    Copy-Item -Path "$sourceDir" -Destination $destination -Recurse -Force
    Write-Output "[$(Get-Timestamp)] Backup completed successfully to $destination." | Tee-Object -FilePath $logFile -Append
} catch {
    Write-Output "[$(Get-Timestamp)] Backup failed with error: $($_ | Out-String)" | Tee-Object -FilePath $logFile -Append
}
