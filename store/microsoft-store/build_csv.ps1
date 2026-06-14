# Erzeugt listings-import.csv aus den listing.<locale>.md-Dateien.
# Extrahiert den Description-Block (zwischen den ```-Zaeunen) je Sprache und
# mappt auf den Microsoft-Store-Sprachcode. CSV-Escaping uebernimmt Export-Csv.
# WICHTIG: Dieses Skript enthaelt bewusst nur ASCII-Literale, weil Windows
# PowerShell 5.1 .ps1-Quelltext als ANSI liest. Die nicht-lateinischen Texte
# kommen aus den .md-Dateien, die zur Laufzeit als UTF-8 gelesen werden.
$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot

# locale (Dateiname) -> MS-Store-Sprachcode
$map = [ordered]@{
  'en'      = 'en-us'
  'de'      = 'de-de'
  'fr'      = 'fr-fr'
  'es'      = 'es-es'
  'it'      = 'it-it'
  'ru'      = 'ru-ru'
  'ja'      = 'ja-jp'
  'hi'      = 'hi-in'
  'fa'      = 'fa-ir'
  'ar'      = 'ar-sa'
  'zh'      = 'zh-hans'
  'zh-Hant' = 'zh-hant'
  'cy'      = 'cy-gb'
  'ga'      = 'ga-ie'
}

$rows = foreach ($loc in $map.Keys) {
  $path = Join-Path $dir "listing.$loc.md"
  $raw  = Get-Content $path -Raw -Encoding utf8
  $parts = $raw -split '```'
  if ($parts.Count -lt 3) { throw "Kein Description-Block in $path" }
  $desc = $parts[1].Trim()
  [pscustomobject]@{
    'Language'    = $map[$loc]
    'Description' = $desc
  }
}

$out = Join-Path $dir 'listings-import.csv'
$rows | Export-Csv -Path $out -NoTypeInformation -Encoding utf8
Write-Output "Geschrieben: $out  ($($rows.Count) Sprachen)"
