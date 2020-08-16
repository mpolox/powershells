Param (
    [String]$List = "variables.csv",
    [String]$Files = "files.csv"
)
$NewFileSufix = ".NEW"
$VariablesList = Import-Csv $List;
$FilesList = Import-Csv $Files;

Clear-Host
#Create a copy of all input files
foreach ($file in $FilesList) {
    $FileContent = Get-Content -Path $file.FILE
    $outputFile = $file.FILE + $NewFileSufix
    Set-Content -Path $outputFile -Value $FileContent    
}

#On each copy of the files replace the variables with the values
foreach ($file in $FilesList) {   
    $fileName = ($file.FILE + $NewFileSufix)
    try {        
        $FileContent = Get-Content -Path $fileName
        foreach ($varItem in $VariablesList) {
            $FileContent = $FileContent.Replace($varItem.VARIABLE, $varItem.VALUE)
        }
        Set-Content -Path $fileName -Value $FileContent
        Write-Host "[OK]" $fileName  -ForegroundColor DarkGreen        
    }
    catch {
        Write-Host "[FAIL]" $fileName  -ForegroundColor Red 
    } 

}

