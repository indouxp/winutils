<#
  .SYNOPSIS
    サーバーの死活確認を行う
  .DESCRIPTION
    Serversに指定したServerまたはinputpathで指定したテキストファイル中のServerに
  対してPingを送信しその死活を確認する。
  結果は指定されたパスにHTML形式で出力する。
  .NOTES
    inputpath、serversともに指定しないとエラーとなる。
  .LINK
    http://www.powershell.com
  .EXAMPLE
    Ping.ps1 -inputpath w:\pcname.txt
  .EXAMPLE
    Ping.ps1 -servers vista3,goemon
#>
param(
  [string]$inputpath,
  [string[]]$Servers,
  [string]$outputpath=".\servers.htm"
)
if($inputpath){
  $pcname = Get-Content $inputpath
}elseif($Servers){
  $pcname = $servers
}else{
  Write-Warning "Please Specify Params"
  exit 1
}

Write-Host $pcname

$isalive = @(Test-Connection -ComputerName $pcname -Quiet)
$result = 0..($pcname.Count - 1) | %{$pcname[$_] + "," + $isalive[$_]}
$head = (Get-Date).ToString() + " サーバー死活確認"
$html =  $result | ConvertFrom-Csv -Header "PC名","IsAlive" | 
  ConvertTo-Html -Head $head -Title "Servers" 
$html | Out-File $outputpath
