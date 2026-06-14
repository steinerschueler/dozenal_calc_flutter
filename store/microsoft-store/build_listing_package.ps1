# Baut das importfertige Paket microsoft-store\listing\ :
#   - CSV mit gefuellten Descriptions (aus listingData-FILLED.csv)
#   - DesktopScreenshot1/2 als relative Pfade (calculator.png / converter.png)
#     in allen 15 Sprachspalten
#   - die zwei PNGs liegen im selben Ordner -> relativer Pfad = Dateiname
# Nur ASCII-Literale (PS 5.1 liest .ps1 als ANSI).
$ErrorActionPreference = 'Stop'
$dir     = $PSScriptRoot
$listing = Join-Path $dir 'listing'
$srcCsv  = Join-Path $dir 'listingData-FILLED.csv'
$csv     = Import-Csv $srcCsv

# Alle Sprachspalten (= Header ohne die 4 Metaspalten)
$meta  = @('Field','ID','Type (Type)','default')
$langs = $csv[0].PSObject.Properties.Name | Where-Object { $meta -notcontains $_ }

# Bild-Zuordnung: Feldname -> Bilddatei (relativer Pfad), in allen Sprachspalten.
# Screenshots (Pflicht je Sprache) + Store-Logos (optional, empfohlen).
$shots = @{
  'DesktopScreenshot1'  = 'calculator.png'
  'DesktopScreenshot2'  = 'converter.png'
  'StoreLogo720x1080'   = 'StoreLogo720x1080.png'    # 9:16 Poster art
  'StoreLogo1080x1080'  = 'StoreLogo1080x1080.png'   # 1:1 Box art
  'StoreLogo300x300'    = 'StoreLogo300x300.png'     # 1:1 App tile icon
}

foreach ($field in $shots.Keys) {
  $row = $csv | Where-Object { $_.Field -eq $field }
  if (-not $row) { throw "Zeile '$field' nicht gefunden" }
  foreach ($l in $langs) { $row.$l = $shots[$field] }
}

# CSV unter dem Original-Export-Namen ins listing-Verzeichnis schreiben
$outName = 'listingData-9N4M1XLPLP0N-1152921505701229509.csv'
$out     = Join-Path $listing $outName
$csv | Export-Csv -Path $out -NoTypeInformation -Encoding utf8
Write-Output "Geschrieben: $out"
Write-Output "Screenshots gesetzt fuer Sprachen: $($langs -join ', ')"
