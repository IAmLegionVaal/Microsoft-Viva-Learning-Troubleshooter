#requires -Version 5.1
<# Created by Dewald Pretorius #>
param([string]$OutputPath)
if(-not $OutputPath){$OutputPath="$([Environment]::GetFolderPath('Desktop'))\Viva_Learning_Reports"};New-Item $OutputPath -ItemType Directory -Force|Out-Null
$targets='learning.viva.office.com','teams.microsoft.com','login.microsoftonline.com','graph.microsoft.com';$net=foreach($t in $targets){[pscustomobject]@{Target=$t;HTTPS443=(Test-NetConnection $t -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue)}}
@('MICROSOFT VIVA LEARNING TROUBLESHOOTER','Created by Dewald Pretorius',"Generated: $(Get-Date)",($net|Format-Table -AutoSize|Out-String -Width 220),'Guidance: verify licence, Teams app policy, content-provider configuration, permissions, recommendations, language, and service availability.')|Set-Content (Join-Path $OutputPath 'Report.txt') -Encoding UTF8