$groups = Get-ADGroup -Filter {(Name -like "xxx_*_D") -or (Name -like "xxx_*_WR") -or (Name -like "xxx_*_RO")} -Server someDC | Select-Object name
$groups | ForEach-Object {
    "=" * $_.name.Length | Out-File .\users.txt -Append
    $_.name | Out-File .\users.txt -Append
    "=" * $_.name.Length | Out-File .\users.txt -Append
    Get-ADGroupMember -I $_.name -Server someDC | Select-Object name | Out-File .\users.txt -Append
    Write-Host `n | Out-File .\users.txt -Append
}
