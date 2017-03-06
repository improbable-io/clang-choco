param(
  [switch] $prerelease,
  [string] $sources = "."
)

choco uninstall clang --force -y
if ($prerelease) {
  choco install clang --verbose --debug --prerelease --force -y -s $sources
} else {
  choco install clang --verbose --debug --force -y -s $sources
}

if ($LASTEXITCODE -ne 0)
{
  write-error @"
`$LASTEXITCODE was not zero.
Inspect the output from choco install above.
It should not have had errors.
"@
  exit 1
}

& clang-format --version
if ($LASTEXITCODE -ne 0)
{
  write-error @"
`$LASTEXITCODE was not zero.
Inspect the output from ``clang-format --version`` above.
It should have shown you clang's version number.
"@
  exit 1
}

write-host @"
This test just:
* uninstalled clang (if it was installed)
* installed clang from the package you built
* asserted that the installation did not return an error exit code
* ran ``clang-format --version`` and asserted non-error exit code

"@
