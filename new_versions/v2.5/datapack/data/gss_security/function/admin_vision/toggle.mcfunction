# ═══════════════════════════════════════════════════
# 👁️ GSS ADMIN VISION - TOGGLE (FIXED)
# ═══════════════════════════════════════════════════

# Mantık Hatası Çözümü: Scoreboard tag veya geçici skor kullanarak toggle yapıyoruz
# Eğer 0 ise 'açılacaklar' listesine ekle, 1 ise 'kapanacaklar' listesine.
# Şimdi skorları güvenli bir şekilde değiştiriyoruz
# 1. Mevcut durumu geçici bir tag'e taşı (Skor değişiminden etkilenmemek için)
tag @s[scores={gss.vision=0}] add gss.vision_off
tag @s[scores={gss.vision=1..}] add gss.vision_on

# 2. İşlemi gerçekleştir (Etiketlere göre skor ata)
scoreboard players set @s[tag=gss.vision_off] gss.vision 1
scoreboard players set @s[tag=gss.vision_on] gss.vision 0

# 3. Görsel geri bildirimleri bu etiketler üzerinden yap
execute if entity @s[tag=gss.vision_off] run title @s actionbar {"text":"§a✔ Vision Aktif"}
execute if entity @s[tag=gss.vision_on] run title @s actionbar {"text":"§c✖ Vision Devre Dışı"}

# 4. Temizlik (Mutlaka yapılmalı, yoksa bir sonraki basışta bozulur)
tag @s remove gss.vision_on
tag @s remove gss.vision_on


# --- [ AKTİF MESAJI & LOG ] ---
execute if entity @s[tag=gss.vision.enabling] run function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:admin_vision/toggle", \
  tag: "admin_vision", \
  message: [{"text":"Admin Vision ","color":"aqua"},{"text":"AÇIK","color":"green","bold":true}] \
}
execute if entity @s[tag=gss.vision.enabling] run title @s actionbar [{"text":"👁️ ","color":"aqua"},{"text":"Admin Vision ","color":"aqua","bold":true},{"text":" §aAÇIK"}]

# --- [ KAPALI MESAJI & LOG ] ---
execute if entity @s[tag=gss.vision.disabling] run function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:admin_vision/toggle", \
  tag: "admin_vision", \
  message: [{"text":"Admin Vision ","color":"aqua"},{"text":"KAPALI","color":"red","bold":true}] \
}
execute if entity @s[tag=gss.vision.disabling] run title @s actionbar [{"text":"👁️ ","color":"aqua"},{"text":"Admin Vision ","color":"aqua","bold":true},{"text":" §cKAPALI"}]

# Temizlik ve Ses
tag @s remove gss.vision.enabling
tag @s remove gss.vision.disabling
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2