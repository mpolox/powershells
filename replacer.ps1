Param (
    [String]$List = "ReplacementList.csv",
    [String]$Files = "InputFile*.txt",
    [String]$myCSV =  "var1,polo
    var2,polox
    var3,marcopolo"
)
#Clear-Host
$myCSV = $myCSV;
$lista = ConvertFrom-Csv $myCSV -Header VARIABLE, VALUE ;

Write-Output $lista



foreach ($varItem in $lista) {
    Write-Host "--->" $varItem.VARIABLE  "replaced with: "  $varItem.VALUE
    # $FileContent = $FileContent.Replace($varItem.VARIABLE, $varItem.VALUE)
}
