# Set correct output encoding for special characters
$OutputEncoding = [System.Text.Encoding]::UTF8

# Set window title
$host.UI.RawUI.WindowTitle = "Bitte-ein-Git! - VS Code"

# --- Header and Global Variables ---

# Define the header as a multi-line string
$header = @"

  +++ GitHub: Bitte-ein-Git/run +++
!====================================!
 _____                _         _     
|  ___|___   _ __  __| | _   _ ( )___ 
| |_  / _ \ | '__|/ _` || | | ||// __|
|  _|| (_) || |  | (_| || |_| |  \__ \
|_|   \___/ |_|   \__,_| \__, |  |___/
                         |___/        
      VS Code Installer
!====================================!

"@

# --- Function Definitions ---

# Clears the screen and displays the header
function Show-Header {
    Clear-Host
    Write-Host $header -ForegroundColor DarkYellow
}

# Checks for winget and installs it if missing
function Ensure-Winget {
    $winget_exists = Get-Command winget -ErrorAction SilentlyContinue
    if ($null -eq $winget_exists) {
        Show-Header
        Write-Host "[INFO] winget not found. Attempting installation..." -ForegroundColor DarkYellow
        $wingetUrl = "https://aka.ms/getwinget"
        $tempFile = "$env:TEMP\winget.msixbundle"
        
        try {
            Invoke-WebRequest -Uri $wingetUrl -OutFile $tempFile -UseBasicParsing
            Add-AppxPackage -Path $tempFile
            Remove-Item $tempFile -Force
        }
        catch {
            Show-Header
            Write-Host "[ERROR] Failed to install winget. Please install it manually from the Microsoft Store ('App-Installer')." -ForegroundColor Red
            pause
            exit 1
        }
        
        # Refresh PATH
        $env:PATH = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
        
        $winget_exists = Get-Command winget -ErrorAction SilentlyContinue
        if ($null -eq $winget_exists) {
            Show-Header
            Write-Host "[ERROR] winget installation succeeded, but the command is still not available. Please restart PowerShell and try again." -ForegroundColor Red
            pause
            exit 1
        }
        Show-Header
        Write-Host "[SUCCESS] winget has been installed." -ForegroundColor DarkYellow
    }
}

# Installs Visual Studio Code
function Install-VSCode {
    Show-Header
    Write-Host "[ACTION] Installing Visual Studio Code..." -ForegroundColor Yellow
    winget install -e --id Microsoft.VisualStudioCode --accept-source-agreements
    Show-Header
    Write-Host "[SUCCESS] Visual Studio Code installation complete." -ForegroundColor DarkYellow
}

# Reinstalls/Repairs Visual Studio Code
function Repair-VSCode {
    Show-Header
    Write-Host "[ACTION] Reinstalling / Repairing Visual Studio Code..." -ForegroundColor Yellow
    winget install -e --id Microsoft.VisualStudioCode --force --accept-source-agreements
    Show-Header
    Write-Host "[SUCCESS] Visual Studio Code repair complete." -ForegroundColor DarkYellow
}

# Uninstalls Visual Studio Code
function Uninstall-VSCode {
    Show-Header
    Write-Host "[ACTION] Uninstalling Visual Studio Code..." -ForegroundColor Yellow
    winget uninstall -e --id Microsoft.VisualStudioCode --accept-source-agreements
    Show-Header
    Write-Host "[SUCCESS] Visual Studio Code has been uninstalled." -ForegroundColor DarkYellow
}

# --- Main Script ---

# Initial check for administrative privileges
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not admin, show a prompt to relaunch
    $host.UI.RawUI.WindowTitle = "Bitte-ein-Git! - WARNING"
    Clear-Host
    Show-Header
    Write-Host "[WARNING] Administrative privileges are required to continue." -ForegroundColor Yellow
    $title = "Administrator Privileges Required"
    $message = "Re-run installer script as Administrator?"
    
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Relaunches the script with administrator privileges."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Exits the script."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    
    $result = $host.ui.PromptForChoice($title, $message, $options, 0)

    if ($result -eq 0) {
        # If "Yes", start a new elevated PowerShell process running the current script
        Start-Process powershell.exe -Verb RunAs -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`""
    }
    
    # Exit the current, non-elevated script
    exit
}

# Display the header for the first time
Show-Header

# Check if Visual Studio Code is already installed
$vscode_installed = $false
try {
    $regKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"
    $installed_programs = Get-ItemProperty -Path $regKey -ErrorAction SilentlyContinue
    if ($installed_programs | Where-Object { $_.DisplayName -like "*Visual Studio Code*" }) {
        $vscode_installed = $true
    }
}
catch {}

if ($vscode_installed) {
    # If installed, prompt user for action
    Write-Host "[INFO] Visual Studio Code is already installed." -ForegroundColor DarkYellow
    Write-Host "What would you like to do?" -ForegroundColor White
    Write-Host "  [1] Reinstall / Repair"
    Write-Host "  [2] Uninstall"
    Write-Host "  [Q] Quit"
    
    $choice = Read-Host -Prompt "Enter your choice"
    
    switch ($choice) {
        "1" {
            Ensure-Winget
            Repair-VSCode
        }
        "2" {
            Ensure-Winget
            Uninstall-VSCode
        }
        default {
            Show-Header
            Write-Host "[INFO] No action taken. Exiting." -ForegroundColor DarkYellow
        }
    }
}
else {
    # If not installed, proceed with installation
    Write-Host "[INFO] Visual Studio Code is not installed." -ForegroundColor DarkYellow
    Ensure-Winget
    Install-VSCode
}

Write-Host ""
Write-Host "Script finished."
pause