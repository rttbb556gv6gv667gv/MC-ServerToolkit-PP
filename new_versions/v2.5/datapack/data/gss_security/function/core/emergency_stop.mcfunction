# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Emergency Stop
# Tüm güvenlik sistemlerini durdurur
# ═══════════════════════════════════════════════════════════════

# Tüm sistemleri kapat
data modify storage gss:config settings.anti_xray.enabled set value 0b
data modify storage gss:config settings.admin_vision.enabled set value 0b
data modify storage gss:config settings.zones.enabled set value 0b

# Admin vision'ı kapat
scoreboard players set @a gss.vision 0

# X-Ray skorlarını sıfırla
scoreboard players set @a gss.xray 0

# Schedules'ları temizle
schedule clear gss_security:anti_xray/reset_scores

function #bs.log:error { \
  namespace: "gss_security", \
  path: "gss_security:core/emergency_stop", \
  tag: "emergency", \
  message: '"ACIL DURDURMA! Tüm güvenlik sistemleri kapatıldı."' \
}

tellraw @a ["",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red"},"\n",{"text":"🚨 ","color":"red","bold":true},{"text":"ACIL DURDURMA","color":"red","bold":true},"\n",{"text":"GSS Security Suite devre dışı bırakıldı","color":"yellow"},"\n",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red"}]

playsound minecraft:block.anvil.land master @a ~ ~ ~ 1 0.5
