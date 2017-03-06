$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = "clang"
$version     = "3.9.0"
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
  checksum      = "B4EAA1FA9872E2C76268F32FC597148CFA14C57B7D13E1EDD9B9B6496CDF7DE8"
  checksumType  = "sha256"
  checksum64    = "3E5B53A79266D3F7F1D5CB4D94283FE2BC61F9689E55F39E3939364F4076B0C9"
  checksumType64= "sha256"

  silentArgs   = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "User" # Machine will assert administrative rights
