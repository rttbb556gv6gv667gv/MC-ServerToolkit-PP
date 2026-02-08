# Oyuncuya iki farklı kitap menüsü veren komutlar

# Kitap 1: Hoş Geldin Rehberi
give @p written_book{title:"Hoş Geldin Rehberi",author:"Sunucu",pages:['{"text":"Sunucumuza Hoş Geldin!\\n\\nBu rehber sana temel bilgileri verecek.","color":"dark_blue","bold":true}','{"text":"Kurallar:\\n\\n1. Saygılı ol\\n2. Hile yapma\\n3. Eğlen!","color":"black"}','{"text":"Komutlar:\\n\\n/spawn - Ana bölgeye ışınlan\\n/help - Yardım menüsü","color":"dark_green"}']}

# Kitap 2: Admin Menüsü (tıklanabilir /op komutu)
give @p written_book{title:"Admin Paneli",author:"Yönetim",pages:['{"text":"Admin Komutları\\n\\n","color":"dark_red","bold":true}','{"text":"OP Yetkisi Al\\n\\n","color":"gold","bold":true,"extra":[{"text":"[TIKLA: OP OL]","color":"red","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/op @s"}}]}','{"text":"Diğer Komutlar:\\n\\n","color":"dark_purple","bold":true,"extra":[{"text":"[Gamemode Creative]\\n","color":"blue","clickEvent":{"action":"run_command","value":"/gamemode creative"}},{"text":"[Zaman Gündüz Yap]\\n","color":"yellow","clickEvent":{"action":"run_command","value":"/time set day"}},{"text":"[Hava Durumu Temizle]","color":"aqua","clickEvent":{"action":"run_command","value":"/weather clear"}}]}']}

# Tüm oyunculara bildiri
title @a title {"text":"Kitap Menüsü Verildi","color":"green"}
title @a subtitle {"text":"Envanterinizi kontrol edin","color":"yellow"}
