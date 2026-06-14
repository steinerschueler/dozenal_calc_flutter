# Fuellt die Description-Zeile (ID 2) der exportierten Partner-Center-Vorlage
# mit den Texten aus den listing.<locale>.md-Dateien und schreibt eine neue,
# importfertige CSV. Nur ASCII-Literale im Skript (PS 5.1 liest .ps1 als ANSI);
# die Texte kommen als UTF-8 aus den .md-Dateien.
$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot
$tpl = Join-Path $dir 'listingData-9N4M1XLPLP0N-1152921505701229509.csv'
$csv = Import-Csv $tpl

# Sprachspalte (in der Vorlage) -> locale der .md-Quelldatei
$map = [ordered]@{
  'en-us'   = 'en'
  'en'      = 'en'
  'de'      = 'de'
  'fr-fr'   = 'fr'
  'es-es'   = 'es'
  'it'      = 'it'
  'ru'      = 'ru'
  'ja'      = 'ja'
  'hi'      = 'hi'
  'fa'      = 'fa'
  'ar'      = 'ar'
  'zh-hans' = 'zh'
  'zh-hant' = 'zh-Hant'
  'cy'      = 'cy'
  'ga'      = 'ga'
}

# Descriptions vorladen (Description-Block = Text zwischen den ```-Zaeunen)
$desc = @{}
foreach ($loc in ($map.Values | Select-Object -Unique)) {
  $raw   = Get-Content (Join-Path $dir "listing.$loc.md") -Raw -Encoding utf8
  $parts = $raw -split '```'
  if ($parts.Count -lt 3) { throw "Kein Description-Block in listing.$loc.md" }
  $desc[$loc] = $parts[1].Trim()
}

# Description-Zeile finden (Field = Description, ID = 2)
$row = $csv | Where-Object { $_.Field -eq 'Description' }
if (-not $row) { throw 'Description-Zeile nicht gefunden' }

foreach ($col in $map.Keys) {
  $row.$col = $desc[$map[$col]]
}

$out = Join-Path $dir 'listingData-FILLED.csv'
$csv | Export-Csv -Path $out -NoTypeInformation -Encoding utf8
Write-Output "Geschrieben: $out"
Write-Output "Zeilen gesamt: $($csv.Count)  |  Description gefuellt fuer: $($map.Keys -join ', ')"
