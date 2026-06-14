# Erzeugt die drei Store-Logos in exakten Massen in microsoft-store\listing\ :
#   StoreLogo300x300.png   (1:1 App tile icon)
#   StoreLogo1080x1080.png (1:1 Box art)
#   StoreLogo720x1080.png  (9:16 Poster art, komponiert: Icon + App-Name)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$dir      = $PSScriptRoot
$listing  = Join-Path $dir 'listing'
$iconPath = 'C:\Users\ericn\dozenal_calc_flutter\assets\icon.png'
$fontPath = 'C:\Users\ericn\dozenal_calc_flutter\assets\fonts\JetBrainsMono-Bold.ttf'
$bg = [System.Drawing.Color]::FromArgb(255,31,31,31)   # #1F1F1F

function New-SquareLogo([int]$size, [string]$outPath) {
  $bmp = New-Object System.Drawing.Bitmap($size, $size)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.PixelOffsetMode   = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $g.Clear($bg)
  $icon = [System.Drawing.Image]::FromFile($iconPath)
  $g.DrawImage($icon, 0, 0, $size, $size)
  $icon.Dispose(); $g.Dispose()
  $bmp.Save($outPath, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
}

New-SquareLogo 300  (Join-Path $listing 'StoreLogo300x300.png')
New-SquareLogo 1080 (Join-Path $listing 'StoreLogo1080x1080.png')

# --- 9:16 Poster (720 x 1080) ---
$w = 720; $h = 1080
$bmp = New-Object System.Drawing.Bitmap($w, $h)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.PixelOffsetMode   = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$g.Clear($bg)

$icon = [System.Drawing.Image]::FromFile($iconPath)
$iSize = 460; $ix = [int](($w - $iSize) / 2); $iy = 250
$g.DrawImage($icon, $ix, $iy, $iSize, $iSize)
$icon.Dispose()

# App-Name in JetBrains Mono Bold (Fallback Segoe UI)
$family = $null
$pfc = New-Object System.Drawing.Text.PrivateFontCollection
try { $pfc.AddFontFile($fontPath); $family = $pfc.Families[0] }
catch { $family = New-Object System.Drawing.FontFamily('Segoe UI') }
$font = New-Object System.Drawing.Font($family, 56, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$sf = New-Object System.Drawing.StringFormat
$sf.Alignment = [System.Drawing.StringAlignment]::Center
$sf.LineAlignment = [System.Drawing.StringAlignment]::Center
$rect = New-Object System.Drawing.RectangleF(0, ($iy + $iSize + 50), $w, 120)
$g.DrawString('Dozenal Calc', $font, [System.Drawing.Brushes]::White, $rect, $sf)
$font.Dispose(); $g.Dispose()
$bmp.Save((Join-Path $listing 'StoreLogo720x1080.png'), [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()

Add-Type -AssemblyName System.Drawing
Get-ChildItem $listing -Filter 'StoreLogo*.png' | ForEach-Object {
  $i = [System.Drawing.Image]::FromFile($_.FullName)
  "{0,-26} {1}x{2}" -f $_.Name, $i.Width, $i.Height
  $i.Dispose()
}
