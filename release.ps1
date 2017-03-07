param(
  [string] $packageVersion = "3.9.0"
)

$ErrorActionPreference = 'Stop'; # stop on all errors

write-host @"
Releasing package. This requires:
* you to have the chocolatey API key set for the account.
"@

$package = ".\clang.$packageVersion.nupkg"
if (-not (test-path $package)) {
  write-error @"
$package does not exist, cannot publish.

You need to:
.\build.ps1
.\test.ps1

retry release.ps1
"@
}

& choco push $package

write-host "Done"
exit $LASTEXITCODE
