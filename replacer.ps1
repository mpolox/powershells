Param (
    [String]$List = "ReplacementList.csv",
    [String]$Files = "InputFile*.txt"
)
#Clear-Host
$ReplacementList = Import-Csv $List;
Write-Output $ReplacementList
Get-ChildItem $Files |
ForEach-Object {
    $Content = Get-Content -Path $_.FullName;
    foreach ($ReplacementItem in $ReplacementList)
    {
        $Content = $Content.Replace($ReplacementItem.VARIABLE, $ReplacementItem.VALUE)
    }
    $outputFile = $_.FullName + ".new"
    Set-Content -Path $outputFile -Value $Content
}
