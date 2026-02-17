$content = Get-Content index.html -Raw -Encoding UTF8
$content = $content -replace '<span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">.*?</span>\s*QUIERO', '<span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">⚡</span> QUIERO'
[IO.File]::WriteAllText('index.html', $content, [System.Text.Encoding]::UTF8)
