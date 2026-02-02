# ═══════════════════════════════════════════════════
# 🛡 GSS x GULCE SECURITY PANEL - FIXED UI
# ═══════════════════════════════════════════════════

# Dialog Kontrolü (Gülce Standartlarına Sabitlendi)
tag @s add glc.show_pending
scoreboard players set @s glc_load_type 1
function glc_menu:handler/dialog/loading
scoreboard players set @s gulce_load.dialog 72

# Ana Panel - Değişkenler Gülce (mc:dialog) üzerinden yönetiliyor
data modify storage mc:dialog ui set value {type:"minecraft:multi_action",title:{"text":"🛡 GSS SECURITY","color":"gold","bold":true},body:{type:"minecraft:plain_message",contents:"\n§8Gülce Engine v3.2 Altyapısıyla\n§7Güvenlik sistemini yönetmek için bir modül seçin:\n "},can_close_with_escape:true,pause:false,columns:2,actions:[]}

# --- [ SATIR 1: İSTATİSTİK & VİZYON ] ---
data modify storage mc:dialog ui.actions append value {label:"§a📊 İstatistikler",action:{type:"minecraft:run_command",command:"/function gss_security:gui/stats"}}

data modify storage mc:dialog ui.actions append value {label:"§e👁 Admin Vision",action:{type:"minecraft:run_command",command:"/function gss_security:admin_vision/toggle"}}

# --- [ SATIR 2: BÖLGELER & LOGLAR ] ---
data modify storage mc:dialog ui.actions append value {label:"§b🌐 Bölgeler",action:{type:"minecraft:run_command",command:"/function gss_security:gui/zones"}}

data modify storage mc:dialog ui.actions append value {label:"§6📜 Log Kayıtları",action:{type:"minecraft:run_command",command:"/function #bs.log:history {with:{}}"}}


data modify storage mc:dialog ui.actions append value {label:"§d🔍 Debug Modu",action:{type:"minecraft:run_command",command:"/tag @s add gss_security.log._.debug"}}

# --- [ SATIR 3: KRİTİK EYLEM & GERİ DÖN ] ---
data modify storage mc:dialog ui.actions append value {label:"§c🚨 ACİL DURDUR",action:{type:"minecraft:run_command",command:"/function gss_security:core/emergency_stop"}}

data modify storage mc:dialog ui.actions append value {label:"§7◀ Panele Dön",action:{type:"minecraft:run_command",command:"/trigger gulce_menu set 1"}}

# Tetikleyici
playsound minecraft:ui.button.click master @s ~ ~ ~ 0.5 1.5