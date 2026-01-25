# ═══════════════════════════════════════════════════
# Loading Dialog - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

dialog show @s {type:"minecraft:notice",title:"",body:{type:"minecraft:plain_message",contents:{text:"Hazırlanıyor...",bold:1b,italic:0b}},can_close_with_escape:0b,pause:0b,after_action:"none",action:{label:"Kapat",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}

# Gösterim bekleyen tag
tag @s add glc.show_pending

# Tag ekle
tag @s add closed.glc

# Yetki Kontrol
schedule function glc_menu:handler/dialog/not_permission 26t

# Dialog'u Göster
# Disabled: $execute as @p[tag=gulce_admin,limit=1,sort=arbitrary] at @s positioned ~ ~ ~ rotated as @s run schedule function glc_menu:handler/dialog/open $(tick)t
