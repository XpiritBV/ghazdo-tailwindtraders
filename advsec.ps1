param (
    [Parameter(Mandatory=$true)]
    [String]$PAT
)

# Retrieve the organization, repository, and team project from pipeline variables
$organization = "xpirit"
$repository = $env:BUILD_REPOSITORY_NAME
$teamProject = $env:SYSTEM_TEAMPROJECT
        $userpass = ":$($PAT)"
        $encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($userpass))
        $accesstoken = "Basic $encodedCreds"

Write-Host "Organization: $organization"
Write-Host "Team Project: $teamProject"
Write-Host "Repository: $repository"
Write-Host $env:System_TeamFoundationCollectionUri


    $ProjectExistURL = "https://dev.azure.com/$organization/_apis/projects/$($teamproject)?api-version=2.0-preview"
    $response = Invoke-RestMethod -Uri $ProjectExistURL -Headers @{Authorization = $accesstoken}   -ContentType "application/json" -Method Get

# Call the adv security dependecies
# check the json for high vulnerabilties
# if > 1 the exit 1
#"@

#$records = ConvertFrom-Json $json | Select-Object -ExpandProperty value | ForEach-Object {
#    $_.tools.rules | Where-Object { $_.Severity -eq "high" }
#}

#$records

    Write-Host $response
