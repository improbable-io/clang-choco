param(
  [string] $version = "3.8.0"
)

$tvVersion = $version

rm -force -ErrorAction SilentlyContinue ./*.nupkg
rm -force -ErrorAction SilentlyContinue ./*.nuspec
rm -force -ErrorAction SilentlyContinue ./tools/params.*
rm -force -ErrorAction SilentlyContinue ./tools/*.orig

$nuspecTemplate = get-content "clang.nuspec.template" | out-string
$nuspecExpanded = $ExecutionContext.InvokeCommand.ExpandString($nuspecTemplate)
add-content -value $nuspecExpanded -path "clang.nuspec" -encoding utf8

choco pack ./clang.nuspec
