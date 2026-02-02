# ═══════════════════════════════════════════════════
# 🛡️ GSS - PROTECTED ZONES (PREVIEW UI)
# ═══════════════════════════════════════════════════

# Dialog Kontrolü
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 73

# Bilgi Paneli Yapılandırması
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"🛡️ PROTECTED ZONES","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"\n§e⚡ Yakında Gelecek!\n\n§7Bu özellik henüz geliştirilme aşamasındadır.\n§7Planlanan modüller:\n\n§8• §7Zone oluşturma (Seçim aracıyla)\n§8• §7Sınır kontrolü & Alarm\n§8• §7Detaylı yetki yönetimi\n "},can_close_with_escape:true,pause:false,columns:1,actions:[]}

# --- [ EYLEMLER ] ---

# Geliştirici Notu (Tıklanamaz Bilgi Butonu gibi görünecek)
data modify storage mc:dialog ui.actions append value {label:"§8🚧 Geliştirme Sürümü: v0.4.2",action:{type:"minecraft:run_command",command:"/tellraw @s {\"text\":\"🛠 Bu modül Bookshelf v3.5 ile tam uyumlu olacak.\",\"color\":\"gray\"}"}}

# Geri Dönüş Butonu (Senin tetikleyicinle uyumlu)
data modify storage mc:dialog ui.actions append value {label:"§b◀ Ana Menüye Dön",action:{type:"minecraft:run_command",command:"/trigger gss.trigger"}}

# Ses Efekti
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 0.5 1.2