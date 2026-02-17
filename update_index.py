import re

file_path = r'c:\Users\Andres\Documents\Mis Sitios Web\metodoas\index.html'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Fix Header Button
# Match the broken header button block safely
header_pattern = re.compile(r'<a href="#offer-box" class="header-btn">\s*<span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">.*?</span>\s*QUIERO\s*COMPRAR\s*</a>', re.DOTALL)

header_replacement = '''<a href="#offer-box" class="header-btn">
                    <span style="font-size: 1.2em; margin-right: 0.3rem; vertical-align: middle;">⚡</span> QUIERO COMPRAR
                </a>'''

if header_pattern.search(content):
    content = header_pattern.sub(header_replacement, content)
    print("Header button updated.")
else:
    print("Header button pattern not found.")

# 2. Update Timeline 2025
# Find the specific 2025 section
timeline_2025_start = 'Junio 2025: El Guillain-Barré (Parálisis) 🛑</h3>'
if timeline_2025_start in content:
    # We need to replace the paragraph strictly following this h3
    # The paragraph starts with <p style="color: #ccc;">Para mi cumpleaños 41...
    # And ends with ...Método AS.</p>
    
    # We'll use a regex for this specific block to be safe about the content inside
    timeline_pattern = re.compile(r'(Junio 2025: El Guillain-Barré \(Parálisis\) 🛑</h3>\s*<p style="color: #ccc;">)(.*?)(</p>)', re.DOTALL)
    
    new_story_text = '''Para mi cumpleaños 41, la vida me frenó en seco. El síndrome de <strong>Guillain-Barré</strong> me dejó sin poder caminar.<br>
                        <strong>Un mes después (Agosto 2025), justo en el 8° aniversario, cerré todas las empresas y vendí la filial de Ayacucho.</strong><br>
                        En esa silla, entendí que <strong>si tu negocio depende de tu salud para sobrevivir, no tienes una empresa, tienes una condena.</strong><br>
                        Ahí nació el Método AS.'''
    
    # Check if we can find it
    match = timeline_pattern.search(content)
    if match:
        content = content.replace(match.group(2), new_story_text)
        print("Timeline 2025 updated.")
    else:
        print("Timeline 2025 pattern found but regex failed.")
else:
    print("Timeline 2025 start string not found.")

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)
