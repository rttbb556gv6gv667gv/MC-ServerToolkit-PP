# ═══════════════════════════════════════════════════
# Loading Dialog - DÜZELTİLDİ
# ═══════════════════════════════════════════════════

dialog show @s {type:"minecraft:notice",title:"",body:{type:"minecraft:plain_message",contents:{text:"Yükleniyor...",bold:1b,italic:0b}},can_close_with_escape:0b,pause:0b,after_action:"none",action:{label:"Kapat",action:{type:"minecraft:run_command",command:"/function glc_menu:handler/close"}}}

# Gösterim bekleyen tag
execute as @p[limit=1,sort=arbitrary,tag=!glc.show_pending] at @s positioned ~ ~ ~ rotated as @s run tag @s add glc.show_pending

# Tag ekle
execute as @p[limit=1,sort=arbitrary,tag=!closed.glc] at @s positioned ~ ~ ~ rotated as @s run tag @s add closed.glc

# Yetki Kontrol
schedule function glc_menu:handler/dialog/not_permission 26t
