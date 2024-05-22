param (
    [Parameter(Mandatory=$true)]
    [string]$moduleName
)

# Get the directory where the script is located
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Create new folder with module name
New-Item -ItemType Directory -Path "$scriptDirectory\$moduleName"

# Copy and rename Template.cs and Template.csproj into new folder
Copy-Item -Path "$scriptDirectory\Template.cs" -Destination "$scriptDirectory\$moduleName\$moduleName.cs"
Copy-Item -Path "$scriptDirectory\Template.csproj" -Destination "$scriptDirectory\$moduleName\$moduleName.csproj"

# Replace placeholder tags with module name in copied files
(Get-Content "$scriptDirectory\$moduleName\$moduleName.cs") | ForEach-Object { $_ -replace '\[TEMPLATE\]', $moduleName } | Set-Content "$scriptDirectory\$moduleName\$moduleName.cs"
(Get-Content "$scriptDirectory\$moduleName\$moduleName.csproj") | ForEach-Object { $_ -replace '\[TEMPLATE\]', $moduleName } | Set-Content "$scriptDirectory\$moduleName\$moduleName.csproj"

Write-Host "Module '$moduleName' created successfully!"