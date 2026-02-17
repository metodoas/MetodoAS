
$filePath = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

# 1. Header Button Fix (using vague matching for the span content)
$headerPattern = '(?s)<a href="#offer-box" class="header-btn">\s*<span[^>]*>.*?</span>\s*QUIERO\s*COMPRAR\s*</a>'
$headerReplacement = '<a href="#offer-box" class="header-btn">
                    <span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">⚡</span> QUIERO COMPRAR
                </a>'

if ($content -match $headerPattern) {
    $content = $content -replace $headerPattern, $headerReplacement
    Write-Host "Header button updated."
}
else {
    Write-Host "Header button pattern not found."
}

# 2. Timeline 2025 Update
# Match the specific H3 and the paragraph following it
$timelineStartPattern = 'Junio 2025: El Guillain-Barré \(Parálisis\) 🛑</h3>'

if ($content -match $timelineStartPattern) {
    # We replace the paragraph content. We match H3 + spacing + <p>... content ...</p>
    $fullTimelinePattern = '(?s)(Junio 2025: El Guillain-Barré \(Parálisis\) 🛑</h3>\s*<p style="color: #ccc;">)(.*?)(</p>)'
    
    $newStoryText = "Para mi cumpleaños 41, la vida me frenó en seco. El síndrome de <strong>Guillain-Barré</strong> me dejó sin poder caminar.<br>
                        <strong>Un mes después (Agosto 2025), justo en el 8° aniversario, cerré todas las empresas y vendí la filial de Ayacucho.</strong><br>
                        En esa silla, entendí que <strong>si tu negocio depende de tu salud para sobrevivir, no tienes una empresa, tienes una condena.</strong><br>
                        Ahí nació el Método AS."
    
    # Construct replacement: Group 1 (Header+P start) + New Text + Group 3 (P end)
    # in PowerShell -replace: '$1' + $newStoryText + '$3'
    # But strictly speaking we just need to replace the match.
    
    # Let's verify the match first.
    if ($content -match $fullTimelinePattern) {
        $content = $content -replace $fullTimelinePattern, ('$1' + $newStoryText + '$3')
        Write-Host "Timeline 2025 updated."
    }
    else {
        Write-Host "Timeline 2025 regex failed."
    }
}
else {
    Write-Host "Timeline 2025 Start pattern not found."
}

Set-Content -Path $filePath -Value $content -Encoding UTF8
