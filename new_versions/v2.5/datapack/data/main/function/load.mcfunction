# ---------------------------------------------------------
# [GulceOS] Başlatıcı
# ---------------------------------------------------------

# 1. VARSAYILAN DEĞER KONTROLÜ
# Config yolu yoksa güvenli bir şekilde oluşturur
execute unless data storage mc:config Config run data merge storage mc:config {Config:{Enabled:0b}}

# 2. DURUM KONTROLÜ & ERKEN ÇIKIŞ
# Eğer sistem zaten 1b (aktif) ise işlemi keser.
execute if data storage mc:config {Config:{Enabled:1b}} run return run dialog show @s {"type":"minecraft:notice","title":"❌","body":{"type":"minecraft:plain_message","contents":["[GulceOS] SİSTEM ZATEN ETKİN!"]},"can_close_with_escape":true,"pause":false,"after_action":"close","action": {"label": "Tamam","action":{"type":"minecraft:run_command","command":"/say İşlem İptal Edildi."}}}

# 3. AKTİVASYON
# Kontrolü geçtiyse sistem kapalıdır, şimdi açıyoruz.
data modify storage mc:config Config.Enabled set value 1b

# Hazırlanıyor mesajı (Dialog)
dialog show @a {"type":"minecraft:notice","title":"🔄","body":{"type":"minecraft:plain_message","contents":["[GulceOS] Sistem Hazırlanıyor..."]},"can_close_with_escape":false,"pause":false,"after_action":"close","action": {"label": "İptal","action":{"type":"minecraft:run_command","command":"/function vc_experimental:disable_all"}}}

# 4. ŞARTLI FONKSİYON TETİKLEME
execute if data storage mc:config {Config:{Enabled:1b}} run function main:load/init
execute if data storage mc:config {Config:{Enabled:1b}} run data merge storage mc:trg {ui:1}
execute if data storage mc:config {Config:{Enabled:1b}} run function #multicommand:init
execute if data storage mc:config {Config:{Enabled:1b}} run function custom_admin:add/add_cooldown {playerName:"@a",cooldown:9999}
execute if data storage mc:config {Config:{Enabled:1b}} run scoreboard objectives add global dummy
execute if data storage mc:config {Config:{Enabled:1b}} run function main:init_globals

# ═══════════════════════════════════════════════════
# 5. SCHEDULE SİSTEMİ BAŞLATMA
# ═══════════════════════════════════════════════════

# Global tick başlat (3 tick aralığı)
execute if data storage mc:config {Config:{Enabled:1b}} if score #global_tick global matches 1 run schedule function global:tick 3t replace

# Admin loop başlat (2 tick aralığı)
execute if data storage mc:config {Config:{Enabled:1b}} if score #admin_loop global matches 1 run schedule function custom_admin:handler/loop/all/1 2t replace

# Addons loop başlat (5 tick aralığı)
execute if data storage mc:config {Config:{Enabled:1b}} if score #main global matches 1 run schedule function gulce_adminpower_addons:loop 5t replace

# ═══════════════════════════════════════════════════
# 6. GSS SECURITY SUITE
# ═══════════════════════════════════════════════════

# Bookshelf tabanlı güvenlik sistemi
execute if data storage mc:config {Config:{Enabled:1b}} run function gss_security:core/init

# ═══════════════════════════════════════════════════
# 7. BİTİŞ VE GERİ BİLDİRİM
# ═══════════════════════════════════════════════════

# Başarı mesajı (Dialog formatında tüm oyunculara)
execute if data storage mc:config {Config:{Enabled:1b}} run playsound minecraft:block.stone_button.click_off master @a ~ ~ ~ 1 1 1

execute if data storage mc:config {Config:{Enabled:1b}} run dialog show @a {"type":"minecraft:notice","title":"✅","body":{"type":"minecraft:plain_message","contents":["[GulceOS] Sistem hazır! \n[Schedule] Ticks aktif (TPS korumalı)"]},"can_close_with_escape":true,"pause":false,"after_action":"close","action": {"label": "Kapat","action":{"type":"minecraft:run_command","command":"/say GulceOS Hazır!"}}}