<#
  .SYNOPSIS
    �T�[�o�[�̎����m�F���s��
  .DESCRIPTION
    Servers�Ɏw�肵��Server�܂���inputpath�Ŏw�肵���e�L�X�g�t�@�C������Server��
  �΂���Ping�𑗐M�����̎������m�F����B
  ���ʂ͎w�肳�ꂽ�p�X��HTML�`���ŏo�͂���B
  .NOTES
    inputpath�Aservers�Ƃ��Ɏw�肵�Ȃ��ƃG���[�ƂȂ�B
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
$head = (Get-Date).ToString() + " �T�[�o�[�����m�F"
$html =  $result | ConvertFrom-Csv -Header "PC��","IsAlive" | 
  ConvertTo-Html -Head $head -Title "Servers" 
$html | Out-File $outputpath
