$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = "clang"
$version     = "3.8.1"
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
  checksum      = "43EEB7E39AE38A20F728C0BB9E700B42604523EB93FFA50A7BE0A14B402DED90"
  checksumType  = "sha256"
  checksum64    = "A8A41B1738CFAD9151E3CC77D89AE326D3CAD3283F0A2CBD7A679A8EF26F3D5D"
  checksumType64= "sha256"

  silentArgs   = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "User" # Machine will assert administrative rights
