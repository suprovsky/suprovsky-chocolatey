$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.storagecraft.com/SP_Files/ShadowProtect_SPX-6.8.4-5_x86.msi'
$url64      = 'https://downloads.storagecraft.com/SP_Files/ShadowProtect_SPX-6.8.4-5_x64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'spx*'

  checksum      = '7611178ACE269DDDB1645139A71DD384C6D44B3B838EDDA36380C9601AE990BB'
  checksumType  = 'sha256'
  checksum64    = '13ABE95378D2C4B43946F2B028FA32A2A22FDA38A803620A1E2B387CDBAE4648'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /lvoicewarmupx `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" IACCEPT=STORAGECRAFT.EULA"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs