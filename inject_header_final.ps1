
$index = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html"
$snippet = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\header_snippet.html"

$content = Get-Content -Path $index -Raw -Encoding UTF8
$headerContent = Get-Content -Path $snippet -Raw -Encoding UTF8

# Regex to find the existing header actions block
$regex = '(?s)<div class="header-actions">.*?</div>'

if ($content -match $regex) {
    $content = $content -replace $regex, $headerContent
    Set-Content -Path $index -Value $content -Encoding UTF8
    Write-Host "Header injected successfully."
}
else {
    Write-Host "Header block not found."
}
