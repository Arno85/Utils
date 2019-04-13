# Extensions list file
$fileName = 'extensions-list.txt'

Write-Host "Start Install VSCode extensions..." -ForegroundColor Yellow

# Get the content of the text file
$commands = Get-Content -Path $fileName 

foreach($command in $commands) 
{
        $extension_name = $command -creplace '^[^\.]*\.', ''

        Write-Host "Installing $extension_name" -ForegroundColor Cyan

        # Invoke each command from the text file
        Invoke-Expression $command
}

Write-Host "Extensions Installed!" -ForegroundColor Green