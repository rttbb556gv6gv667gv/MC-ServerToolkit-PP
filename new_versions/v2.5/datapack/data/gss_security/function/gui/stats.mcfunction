# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Statistics Display
# Sistem istatistiklerini göster
# ═══════════════════════════════════════════════════════════════

# X-Ray skorlarını topla
execute store result score #total_xray_score gss.stats run scoreboard players get @s gss.xray
execute store result score #suspicious_players gss.stats if entity @a[scores={gss.xray=75..}]

# Active admin vision count
execute store result score #active_vision gss.stats if entity @a[tag=gulceos_permissions_admin,scores={gss.vision=1..}]

tellraw @s ["",{"text":"\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"},{"text":"\n  📊 Guvenlik Istatistikleri","color":"gold","bold":true},{"text":"\n\n  🔍 Anti-Xray:","color":"yellow"},{"text":"\n    • Şüpheli Oyuncu: ","color":"gray"},{"score":{"name":"#suspicious_players","objective":"gss.stats"},"color":"red"},{"text":"\n    • Sizin Skorunuz: ","color":"gray"},{"score":{"name":"@s","objective":"gss.xray"},"color":"yellow"},{"text":"\n\n  👁️ Admin Vision:","color":"yellow"},{"text":"\n    • Aktif Admin: ","color":"gray"},{"score":{"name":"#active_vision","objective":"gss.stats"},"color":"aqua"},{"text":"\n\n  "},{"text":"[↩ Geri Don]","color":"aqua","click_event":{"action":"run_command","command":"/trigger gss.trigger"},"hover_event":{"action":"show_text","value":"Ana menuye don"}},{"text":"\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"}]

