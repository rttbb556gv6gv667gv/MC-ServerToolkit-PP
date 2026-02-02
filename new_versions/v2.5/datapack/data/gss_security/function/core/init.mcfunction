# ═══════════════════════════════════════════════════════════════
# GSS Security Suite - Başlatma (Initialization)
# Powered by Bookshelf v3.2+
# ═══════════════════════════════════════════════════════════════
# Bu fonksiyon main:load tarafından çağrılır

# Scoreboards (Skor Tabloları)
scoreboard objectives add gss.xray dummy "X-Ray Tespit Skoru"
scoreboard objectives add gss.vision dummy "Admin Görüşü Geçişi"
scoreboard objectives add gss.stats dummy "Güvenlik İstatistikleri"
scoreboard objectives add gss.trigger trigger "GSS Menü"

# Depolama Başlatma (Storage initialization)
data modify storage gss:config settings set value { \
  anti_xray: { \
    enabled: 1b, \
    max_score: 100, \
    scan_radius: 50.0d, \
    suspicious_threshold: 75, \
    auto_freeze: 0b \
  }, \
  admin_vision: { \
    enabled: 1b, \
    max_distance: 100.0d, \
    show_entities: 1b, \
    particle_type: "end_rod" \
  }, \
  logging: { \
    enabled: 1b, \
    auto_save: 1b, \
    max_history: 100 \
  }, \
  zones: { \
    enabled: 1b, \
    default_protection: 1b \
  } \
}

# Bookshelf log formatı ayarla (Türkçe desteği)
data modify storage bs:const log.messages append value { \
  namespaces: ["gss_security"], \
  format: { \
    debug: ["",{"text":"[GSS-HATA-AYIKLAMA] ","color":"gray"},{"nbt":"log.time_hmst","storage":"bs:const","interpret":true,"color":"dark_gray"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}], \
    info: ["",{"text":"🛡 [GSS] ","color":"aqua","bold":true},{"nbt":"log.time_hms","storage":"bs:const","interpret":true,"color":"gray"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}], \
    warn: ["",{"text":"⚠ [GSS-UYARI] ","color":"yellow","bold":true},{"nbt":"log.time_hms","storage":"bs:const","interpret":true,"color":"gold"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}], \
    error: ["",{"text":"🚨 [GSS-HATA] ","color":"red","bold":true},{"nbt":"log.time_hms","storage":"bs:const","interpret":true,"color":"dark_red"}," ",{"nbt":"log.message","storage":"bs:in","interpret":true}] \
  } \
}

# İlk log
function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"GSS Security Suite yükleniyor..."' \
}

# Sistem kontrolü
execute store result score #bookshelf_version gss.stats run data get storage bs:ctx _.version
execute if score #bookshelf_version gss.stats matches 302.. run function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"Bookshelf v3.2+ tespit edildi ✅"' \
}

execute unless score #bookshelf_version gss.stats matches 302.. run function #bs.log:error { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"HATA: Bookshelf v3.2+ gerekli! Lütfen yükleyin: https://modrinth.com/datapack/bookshelf-dev"' \
}

# Admin'lere log görüntüleme yetkisi ver
tag @a[tag=gulceos_permissions_admin] add gss_security.log._.info
tag @a[tag=gulceos_permissions_owner] add gss_security.log._.debug

# Anti-Xray sistemi başlat
execute if data storage gss:config {settings:{anti_xray:{enabled:1b}}} run function gss_security:anti_xray/init

# Admin Vision sistemi başlat
execute if data storage gss:config {settings:{admin_vision:{enabled:1b}}} run function gss_security:admin_vision/init

# Zone protection başlat
execute if data storage gss:config {settings:{zones:{enabled:1b}}} run function gss_security:zones/init

# Başarı mesajı
function #bs.log:info { \
  namespace: "gss_security", \
  path: "gss_security:core/init", \
  tag: "init", \
  message: '"GSS Security Suite aktif! Kullanım: /trigger gss.trigger"' \
}

tellraw @a ["",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"},"\n",{"text":"  🛡 GSS Security Suite","color":"gold","bold":true},"\n",{"text":"  Gücünü ","color":"gray"},{"text":"Bookshelf v3.2+","color":"aqua"},{"text":"'dan alır.","color":"gray"},"\n",{"text":"  Kullanım: ","color":"gray"},{"text":"/trigger gss.trigger","color":"yellow","click_event":{"action":"run_command","command":"/trigger gss.trigger"},"hover_event":{"action":"show_text","value":"Tıkla ve kullan!"}},"\n",{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]

# Trigger'ı aktif et
scoreboard players enable @a gss.trigger