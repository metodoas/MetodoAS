
$filePath = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

# 1. Header Button Fix
# Match the header button block from <a... to </a>
$headerRegex = '(?s)<a href="#offer-box" class="header-btn">.*?</a>'
$headerReplacement = '<a href="#offer-box" class="header-btn">
                    <span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">⚡</span> QUIERO COMPRAR
                </a>'

if ($content -match $headerRegex) {
    $content = $content -replace $headerRegex, $headerReplacement
    Write-Host "Header button updated."
}
else {
    Write-Host "Header button pattern not found."
}

# 2. Timeline 2025 Update
# Match from "Junio 2025..." down to "...Método AS.</p>"
$timelineRegex = '(?s)Junio 2025: El Guillain-Barré \(Parálisis\) 🛑</h3>.*?Ahí nació el Método AS\.</p>'
$timelineReplacement = 'Junio 2025: El Guillain-Barré (Parálisis) 🛑</h3>
                    <p style="color: #ccc;">Para mi cumpleaños 41, la vida me frenó en seco. El síndrome de
                        <strong>Guillain-Barré</strong> me dejó sin poder caminar.<br>
                        <strong>Un mes después (Agosto 2025), justo en el 8° aniversario, cerré todas las empresas y vendí la filial de Ayacucho.</strong><br>
                        En esa silla, entendí que <strong>si tu negocio depende de tu salud para sobrevivir, no tienes
                            una empresa, tienes una condena.</strong><br>
                        Ahí nació el Método AS.</p>'

if ($content -match $timelineRegex) {
    $content = $content -replace $timelineRegex, $timelineReplacement
    Write-Host "Timeline 2025 updated."
}
else {
    Write-Host "Timeline 2025 pattern not found."
}

Set-Content -Path $filePath -Value $content -Encoding UTF8
