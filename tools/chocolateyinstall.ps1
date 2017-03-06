$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = "clang"
$version     = "3.8.0"
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = "http://releases.llvm.org/$($version)/LLVM-$($version)-win32.exe"
$url64       = "http://releases.llvm.org/$($version)/LLVM-$($version)-win64.exe"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = "EXE"
  url           = $url
  url64bit      = $url64
  softwareName  = "LLVM"
  checksum      = "EBDB056EBC6EFD57C0643733A099920D1D5760A4D570580243E6C63F4B52920F"
  checksumType  = "sha256"
  checksum64    = "F9C3147157DB32BEAB025314DB9B82C600E182D82994880C1D844C70E29D76EF"
  checksumType64= "sha256"

  silentArgs   = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "User" # Machine will assert administrative rights
