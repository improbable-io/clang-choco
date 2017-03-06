$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = "clang"
$version     = "3.9.1"
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
  checksum      = "F5CDF134E27A215A18515E2DCD100902DCF539F487C2028A817FFE7D3091F32A"
  checksumType  = "sha256"
  checksum64    = "7EA2B7BC0DE6B96A6CE11E6CFECE7B84A31FB0C86C977F42EE178CBA41517606"
  checksumType64= "sha256"

  silentArgs   = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
