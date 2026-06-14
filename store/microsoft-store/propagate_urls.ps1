# Verteilt die Bild-URLs (Screenshots + Store-Logos) aus der englischen Spalte
# auf ALLE 15 Sprachspalten. Eingabe: die NEU exportierte Listings-CSV, nachdem
# die 5 Bilder einmal im englischen Listing hochgeladen wurden.
#
# Aufruf:  & .\propagate_urls.ps1 "listingData-<neuer-export>.csv"
# Ausgabe: listingData-URLS.csv (reine CSV, keine geb�ndelten Dateien -> sauberer Import)
param([Parameter(Mandatory=$true)][string]$InputCsv)
$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot
$in  = if ([System.IO.Path]::IsPathRooted($InputCsv)) { $InputCsv } else { Join-Path $dir $InputCsv }
$csv = Import-Csv $in

$meta  = @('Field','ID','Type (Type)','default')
$langs = $csv[0].PSObject.Properties.Name | Where-Object { $meta -notcontains $_ }

$imgFields = @(
  'DesktopScreenshot1','DesktopScreenshot2',
  'StoreLogo720x1080','StoreLogo1080x1080','StoreLogo300x300'
)

Write-Output "Sprachspalten: $($langs -join ', ')"
foreach ($f in $imgFields) {
  $row = $csv | Where-Object { $_.Field -eq $f }
  if (-not $row) { Write-Output "  [skip] Feld $f nicht vorhanden"; continue }
  # Quell-URL: bevorzugt en-us, sonst en
  $srcUrl = $row.'en-us'
  if ([string]::IsNullOrWhiteSpace($srcUrl)) { $srcUrl = $row.'en' }
  if ([string]::IsNullOrWhiteSpace($srcUrl)) { Write-Output "  [WARN] $f : keine URL in en-us/en gefunden!"; continue }
  foreach ($l in $langs) { $row.$l = $srcUrl }
  Write-Output "  $f -> in alle Sprachen kopiert"
}

$out = Join-Path $dir 'listingData-URLS.csv'
$csv | Export-Csv -Path $out -NoTypeInformation -Encoding utf8
Write-Output "Geschrieben: $out  ($($csv.Count) Zeilen)"
