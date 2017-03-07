$ErrorActionPreference = "Stop"; # stop on all errors

$packageName = "clang"
$version     = "3.7.0"
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
  checksum      = "75933480C8F8E3AE3CF9281494BF0057E9E4CFAE4315F59C468A4E850A86F544"
  checksumType  = "sha256"
  checksum64    = "04A393CF73BC7416C9903AA08F47F15C77CF475B22A607AC4B7493A658A11A3F"
  checksumType64= "sha256"

  silentArgs   = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyPath "$($env:SystemDrive)\Program Files\LLVM\bin" "Machine" # Machine will assert administrative rights
