
$filePath = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

# 1. Fix the "Buy" Button (Dollar Icon)
# We use a wildcard '.*?' inside the span to separate the class/style from the content, effectively ignoring the bad char.
$buyRegex = '(?s)<a href="#offer-box" class="header-btn">\s*<span.*?>.*?</span>\s*QUIERO\s*COMPRAR\s*</a>'
$buyReplacement = '<a href="#offer-box" class="header-btn">
                    <span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">💲</span> QUIERO COMPRAR
                </a>'

if ($content -match $buyRegex) {
    $content = $content -replace $buyRegex, $buyReplacement
    Write-Host "Buy button updated."
}
else {
    Write-Host "Buy button pattern not found (Safe Regex)."
}

# 2. Fix the "Quiz" Button (Link and Text)
# Current state likely: href="#offer-box" ... 🧠 ... HACER QUIZ
$quizRegex = '(?s)<a href="#offer-box" class="gift-btn">\s*<span.*?>.*?</span>\s*HACER QUIZ\s*</a>'
$quizReplacement = '<a href="#gift-section" class="gift-btn">
                    <span style="font-size: 1.25em;">🧠</span> TEST GRATUITO
                </a>'

if ($content -match $quizRegex) {
    $content = $content -replace $quizRegex, $quizReplacement
    Write-Host "Quiz button updated."
}
else {
    Write-Host "Quiz button pattern not found."
}

Set-Content -Path $filePath -Value $content -Encoding UTF8
Write-Host "Header fix complete."
