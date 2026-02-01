# 🚀 Hızlı Başlangıç Rehberi

## ⚡ 3 Dakikada Kurulum

### Adım 1: Datapack'i Yükle
```bash
1. v2.3.zip dosyasını indir
2. Minecraft dünya klasörüne git: .minecraft/saves/DUNYA_ADI/datapacks/
3. v2.3.zip/datapack klasörünü buraya kopyala
4. Minecraft'a gir ve /reload yaz
```

### Adım 2: İlk Owner'ı Belirle
```mcfunction
/function custom:permissions/owner/init {Player:"SenınAdın"}
```

### Adım 3: Test Et!
```mcfunction
/scoreboard players set @s ap_god_mode 1
```

---

## 🎯 En Popüler Komutlar

### Owner (Sahip) için
```mcfunction
# Tanrı modu
/scoreboard players set @s ap_god_mode 1

# Herkese creative
/scoreboard players set @s ap_creative_all 1

# Spawn ayarla
/scoreboard players set @s ap_set_spawn 1

# 10000 level ver
/scoreboard players set @s ap_max_xp 1
```

### Admin için
```mcfunction
# Gece görüşü
/scoreboard players set @s ap_night_vision 1

# 64 elmas
/scoreboard players set @s ap_give_diamond 1

# Havayı temizle
/scoreboard players set @s ap_clear_weather 1

# Gündüz yap
/scoreboard players set @s ap_toggle_day 1
```

---

## 📊 Yeni Özellikler Karşılaştırması

| Özellik | Eski Sistem | Yeni Sistem |
|---------|-------------|-------------|
| **Owner Trigger'ları** | 15 | 24 ✨ |
| **Admin Trigger'ları** | 28 | 45 ✨ |
| **Kategorizasyon** | ❌ | ✅ |
| **Geri Bildirim** | Basit | Detaylı ✅ |
| **Tag Kontrolü** | Kısmi | Tam ✅ |
| **Yeni Efektler** | - | +15 ✨ |
| **Dünya Yönetimi** | Sınırlı | Gelişmiş ✅ |

---

## 🎨 Yeni Eklenen Özellikler

### Owner için YENİ
- ✨ `ap_max_xp` - 10000 level birden
- ✨ `ap_kill_items` - Itemleri temizle
- ✨ `ap_super_jump` - Süper zıplama
- ✨ `ap_nuke` - Çoklu TNT
- ✨ `ap_survival_all` - Herkesi survival yap
- ✨ `ap_set_spawn` - Spawn ayarla
- ✨ `ap_clear_chunks` - Chunk temizle
- ✨ `ap_debug` - Debug bilgileri

### Admin için YENİ
- ✨ `ap_thunder` - Fırtına
- ✨ `ap_noon` - Öğle
- ✨ `ap_midnight` - Gece yarısı
- ✨ `ap_give_emerald` - Zümrüt ver
- ✨ `ap_give_netherite` - Netherite ver
- ✨ `ap_water_breathing` - Su altı nefesi
- ✨ `ap_fire_resistance` - Ateş direnci
- ✨ `ap_unfreezeAll` - Donmayı çöz

---

## 🔥 Favori Kombinasyonlar

### "Tanrı Modu Paketi" (Owner)
```mcfunction
/scoreboard players set @s ap_god_mode 1
/scoreboard players set @s ap_super_speed 1
/scoreboard players set @s ap_super_jump 1
/scoreboard players set @s ap_night_vision 1
```

### "Builder Paketi" (Admin)
```mcfunction
/scoreboard players set @s ap_creative 1
/scoreboard players set @s ap_night_vision 1
/scoreboard players set @s ap_toggle_day 1
/scoreboard players set @s ap_clear_weather 1
```

### "Survival Hazırlık" (Admin)
```mcfunction
/scoreboard players set @s ap_starter_pack 1
/scoreboard players set @s ap_give_diamond 1
/scoreboard players set @s ap_give_tools 1
```

---

## ⚙️ Gelişmiş Ayarlar

### Trigger'ları Herkese Aç (Owner için)
```mcfunction
# Herkese creative verme izni
/scoreboard players enable @a ap_creative_all

# Herkese heal izni
/scoreboard players enable @a ap_heal_all
```

### Trigger'ları Kapat
```mcfunction
# Belirli bir trigger'ı kapat
/scoreboard players reset @s ap_nuke
```

### Tüm İzinleri Kaldır
```mcfunction
/tag @s remove Owner
/tag @s remove Admin
/tag @s remove op
```

---

## 🐛 Hızlı Sorun Çözümleri

### "Komut çalışmıyor!"
```mcfunction
# 1. Reload yap
/reload

# 2. Tag kontrolü
/tag @s

# 3. Trigger'ı yeniden aktifleştir
/scoreboard players enable @s [trigger_adı]
```

### "İzinler kayboldu!"
```mcfunction
# İzinleri yeniden ver
/function custom:permissions/owner/init {Player:"Adın"}
```

### "Performans sorunu var!"
```mcfunction
# Fazla trigger kullanmayın, bekleyin
# Her trigger'dan sonra 1-2 saniye ara verin
```

---

## 📱 Komut Kısayolları

Sık kullanılan komutlar için function dosyaları oluşturun:

### quick_god.mcfunction
```mcfunction
scoreboard players set @s ap_god_mode 1
scoreboard players set @s ap_super_speed 1
scoreboard players set @s ap_night_vision 1
```

### quick_build.mcfunction
```mcfunction
scoreboard players set @s ap_creative 1
scoreboard players set @s ap_toggle_day 1
scoreboard players set @s ap_clear_weather 1
```

---

## 🎓 İpuçları

1. **Tag Sistemi**: Owner > Admin > Mod > Player hiyerarşisi
2. **Güvenlik**: Sadece güvenilir kişilere yetki verin
3. **Performans**: Aynı anda çok fazla trigger kullanmayın
4. **Yedekleme**: Her önemli işlemden önce dünyayı yedekleyin
5. **Test**: Yeni özellikleri test dünyasında deneyin

---

## 📞 Destek

Daha fazla bilgi için:
- `PERMISSIONS_GUIDE.md` - Tam dokümantasyon
- `/scoreboard players set @s ap_help 1` - Oyun içi yardım
- `/scoreboard players set @s ap_debug 1` - Debug bilgileri

---

**Keyifli Oyunlar! 🎮**
