param ($project_file)
$project_dir = Split-Path -Parent $project_file
$file = Get-Content -Path $project_file -raw
$out = $file -match "config/features=PackedStringArray\(([^)]*)\)"
$features = $Matches[1] -Split ", "
$version = $null

foreach ($feature in $features)
{
    $feature = $feature.Trim("`"")
    if ($feature.StartsWith("4.") -or $feature.StartsWith("3.")) {
        $version = $feature
        break
    }
}

if ($version -ne $null) {
    Write-Output "Found Godot version $version!"
    $editor = "$PSScriptRoot\$version.lnk"
    Write-Output "Launching Godot at $editor"
    $sh = New-Object -ComObject WScript.Shell
    $target = $sh.CreateShortcut($editor).TargetPath
    Start-Process -FilePath $target -ArgumentList "--editor", "--path", $project_dir
} else {
    Write-Output "Could not find a shortcut for Godot version $version!"
}

Exit