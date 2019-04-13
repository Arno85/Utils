# Start applications method
function startApplication
{
    for ($i = 0;  $i -lt $siblingFolders.Length; $i++) { 
        # If the choice is equal to the index + 1  
        if($choice -eq $($i + 1)) 
        {
            $appName = $($siblingFolders[$i])
            $appFolder = $appName -replace "-", ""
            $appFullPath = "$projectsPath/$appName/$appFolder"
    
            Write-Host "Starting $appFullPath" -ForegroundColor Yellow

            # Build commands
            $FrontEndCmd = "/c cd $appFullPath-SPA && ng serve"
            $BackEndCmd = "/c cd $appFullPath.API && dotnet watch run"
    
            # Start Angular application
            Write-Host "$appName-SPA started!" -ForegroundColor Green
            Start-Process cmd -Argument $FrontEndCmd -WindowStyle Minimized

            # Start DotNet application
            Write-Host "$appName.API started!" -ForegroundColor Green
            Start-Process cmd -Argument $BackEndCmd -WindowStyle Minimized
        }
    }
}

# Validation of the choice method
function validateChoice($choice)
{
    # If the choice is equal 0 or is greater than the length of the array of choices, Prompt an error message and the choice selection
    if( $choice -eq 0 -or $choice -gt $siblingFolders.Length )
    {
        Write-Host "'$choice' is not an option" -ForegroundColor Red
        $choice = Read-Host -Prompt "Please select"
        validateChoice($choice)
    }
    else 
    {
        startApplication
    } 
}

$projectsPath = "c:/dev"

# Get all directories in tne projects Folder except Utils
$siblingFolders = Get-ChildItem $projectsPath | Where-Object{ $_.PsIsContainer -and $_.FullName -notmatch 'utils'}

# Build options
for ($i = 0;  $i -lt $siblingFolders.Length; $i++) {
    Write-Host "Press $($i + 1) for $($siblingFolders[$i])" 
}

# Prompt the choice selection
$choice = Read-Host -Prompt "Please select an option"
# Validate the choice
validateChoice($choice)




