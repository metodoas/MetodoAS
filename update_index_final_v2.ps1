
$filePath = "c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html"
$content = Get-Content -Path $filePath -Raw -Encoding UTF8

# 1. Timeline Update: "Código AS" -> "Método AS"
$content = $content -replace "2026: El Código AS", "2026: El Método AS"

# 2. Header Buttons Update
# Buy Button (Add Dollar) - Flexible match
$buyBtnRegex = '(?s)<a href="#offer-box" class="header-btn">.*?</a>'
$buyBtnReplacement = '<a href="#offer-box" class="header-btn">
                    <span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">💲</span> QUIERO COMPRAR
                </a>'
if ($content -match $buyBtnRegex) {
    $content = $content -replace $buyBtnRegex, $buyBtnReplacement
}

# Gift Button (Renaming to Diagnóstico)
$giftBtnRegex = '(?s)<a href="#offer-box" class="gift-btn">.*?</a>'
$giftBtnReplacement = '<a href="#gift-section" class="gift-btn">
                    <span style="font-size: 1.25em;">🧠</span> TEST GRATUITO
                </a>'
# Note: Changed href to #gift-section so it links to the bottom tool
if ($content -match $giftBtnRegex) {
    $content = $content -replace $giftBtnRegex, $giftBtnReplacement
}

# 3. Gift Section Professionalization (The "Regalo" Box)
# Matching the inner content of div class="gift-section" or the specific H3/Content block
# We'll match from the Icon SVG start down to the form end.
# Look for <div class="gift-icon-wrapper"> down to <div id="gift-success"...>

$giftSectionStart = '(?s)<div class="gift-icon-wrapper">.*?<div id="gift-success".*?</div>'

$newGiftContent = '<div class="gift-icon-wrapper">
                    <svg class="gift-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
                        <path d="M9 11l3 3L22 4" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </div>

                <h3 class="gift-title">¿No estás seguro de tu nivel de Burnout?</h3>

                <div class="gift-content">
                    <p>Antes de invertir, diagnostícate. He creado un <strong>Test de Fatiga Decisional</strong> para que midas exactamente qué tan "quemada" está tu corteza prefrontal.</p>
                    <p>No es un PDF genérico. Es una evaluación rápida.</p>
                    <p class="gift-spam-text" style="color: #ccc; font-weight: normal; margin-top: 1rem;">
                        Ingresa tu correo abajo y recibe tu <strong>Resultado + Plan de Acción Básico</strong> en 2 minutos.
                    </p>
                </div>

                <style>
                    /* Simplified style override */
                    .gift-spam-text { color: #ccc !important; animation: none !important; }
                    .gift-emoji { display: none; }
                </style>

                <!-- Email Form -->
                <form id="gift-form" class="gift-form" onsubmit="handleGiftSubmit(event)">
                    <input type="email" placeholder="Tu mejor correo..." required class="gift-input">
                    <button type="submit" class="btn-gift">🧠 Recibir Diagnóstico</button>
                </form>
                <div id="gift-success" style="display: none; color: #4ade80; margin-top: 1rem; font-weight: bold;">
                    ¡Enviado! 🚀 Revisa tu bandeja de entrada en unos minutos.
                </div>'

if ($content -match $giftSectionStart) {
    $content = $content -replace $giftSectionStart, $newGiftContent
    Write-Host "Gift section professionalized."
}
else {
    Write-Host "Gift section pattern not found."
}

Set-Content -Path $filePath -Value $content -Encoding UTF8
Write-Host "Updates applied."
