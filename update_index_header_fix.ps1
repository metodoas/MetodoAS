
$filePath = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

# Aggressive Header Button Replacement
# Match the entire div class="header-actions" block
$headerRegex = '(?s)<div class="header-actions">.*?</div>'
$headerReplacement = '<div class="header-actions">
                <a href="#gift-section" class="gift-btn">
                    <span style="font-size: 1.25em;">🧠</span> TEST GRATUITO
                </a>
                <a href="#offer-box" class="header-btn">
                    <span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">💲</span> QUIERO
                    COMPRAR
                </a>
            </div>'

if ($content -match $headerRegex) {
    $content = $content -replace $headerRegex, $headerReplacement
    Write-Host "Header actions block updated."
}
else {
    Write-Host "Header actions block pattern not found."
}

Set-Content -Path $filePath -Value $content -Encoding UTF8
Write-Host "Done."
