# Extensions list file
$fileName = 'extensions-list.txt'

Write-Host "Saving the list of VSCode Extensions in the $fileName file..." -ForegroundColor Yellow

# list the VSCode extensions in a text file ready to install
code --list-extensions | % { "code --install-extension $_" } > $fileName

Write-Host "Done!" -ForegroundColor Green