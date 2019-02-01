param(

       # Getting the control percentage as an argument

       [int] $desiredCodeCoveragePercent=0

)

Write-Host “Desired Code Coverage Percent is “-nonewline; Write-Host $desiredCodeCoveragePercent

 

# Setting a few values

[int]$coveredBlocks=0

[int]$skippedBlocks=0

[int]$totalBlocks=0

[int]$codeCoveragePercent=0

 

# Getting a few environment variables we need

[String]$buildID=“$env:BUILD_BUILDID“

[String]$project=“$env:SYSTEM_TEAMPROJECT“


#[String]$buildID=“18“

#[String]$project=“BankingApplication“
 

# Setting up basic authentication 

$username="infy.devops.poc2@outlook.com"

$password="vyg76y3zdxz4tx6pqe6qhreub4yc75ijzl77mvcduy3qw3fifbpa"

 

$basicAuth= (“{0}:{1}”-f $username,$password)

$basicAuth=[System.Text.Encoding]::UTF8.GetBytes($basicAuth)

$basicAuth=[System.Convert]::ToBase64String($basicAuth)

$headers= @{Authorization=(“Basic {0}”-f$basicAuth)}

 

$url=“https://infosysdevops.visualstudio.com/defaultCollection/“+$project+“/_apis/test/codeCoverage?buildId=”+$buildID+“&flags=1&api-version=2.0-preview”

Write-Host $url

 Write-Host $headers

$responseBuild= (Invoke-RestMethod -Uri $url -headers $headers -Method Get).value | select modules

 

foreach($module in $responseBuild.modules)

{

       $coveredBlocks+=  $module.statistics[0].blocksCovered

       $skippedBlocks+=  $module.statistics[0].blocksNotCovered

}

 

$totalBlocks=$coveredBlocks+$skippedBlocks;


if ($totalBlocks -eq 0)

{

       $codeCoveragePercent=0

       Write-Host $codeCoveragePercent -nonewline; Write-Host ” is the Code Coverage. Failing the build”

      # exit -1;

}
else
{
	$codeCoveragePercent=$coveredBlocks*100.0/$totalBlocks
}


 



Write-Host “Code Coverage percentage is “-nonewline; Write-Host $codeCoveragePercent

 

if ($codeCoveragePercent -lt $desiredCodeCoveragePercent)

{

       Write-Host “Failing the build as CodeCoverage limit not met”

       exit -1;

}

         Write-Host “CodeCoverage limit met”
