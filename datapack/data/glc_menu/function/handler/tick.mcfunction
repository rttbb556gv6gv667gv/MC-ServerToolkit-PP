# ═══════════════════════════════════════════════════
# GLC Menu - Tick Handler - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

# Trigger kontrolü
execute as @a[scores={gulce_menu=1..}] run function glc_menu:handler/trigger

# Loading skorları azalt
scoreboard players remove @a[scores={gulce_load.dialog=1..}] gulce_load.dialog 1

# Sadece 0'a düştüğünde BİR KEZ göster
execute if data storage mc:config {Config:{dialog:{Auto:0b}}} run execute as @p[tag=gulce_admin,limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s run execute as @a[scores={gulce_load.dialog=0},tag=!glc.show_pending] run tag @s add glc.show_pending
execute if data storage mc:config {Config:{dialog:{Auto:0b}}} run execute as @p[tag=gulce_admin,limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s run execute as @a[scores={gulce_load.dialog=0},tag=glc.show_pending] run function glc_menu:handler/dialog/open

# Tag temizliği
tag @a[tag=closed.glc] remove closed.glc
tag @a[tag=glc.close_dialog] remove closed.glc
tag @a[tag=glc.close_dialog] remove glc.close_dialog