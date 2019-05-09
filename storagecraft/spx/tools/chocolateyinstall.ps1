$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.storagecraft.com/SP_Files/ShadowProtect_SPX-6.8.2-2_x86.msi'
$url64      = 'https://downloads.storagecraft.com/SP_Files/ShadowProtect_SPX-6.8.2-2_x64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'spx*'

  checksum      = '4E847BD62CE8550A586F7F633EEE70D18A389DF3F0E4CAE5941DD7F298AA403D'
  checksumType  = 'sha256'
  checksum64    = 'D871B74F63C6472C65F8A0A1A9304DBCE1003AF2E1E4332B230570B4559FA753'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /lvoicewarmupx `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" IACCEPT=STORAGECRAFT.EULA"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs