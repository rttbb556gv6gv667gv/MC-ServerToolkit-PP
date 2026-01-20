# İzin Seviyesi Ayarlama
$scoreboard players set @s permission_level $(level)

# Bilgi Mesajı
$schedule function gulce_adminpower_addons:loaded $(load_second)t

# Kuralları Göster
$function custom_admin:dialogs/menu/rules/show {"Player":"$(DisplayRules)"}

# Diğer...
$recipe $(diamond_to_emerald_recipe) @a gulce_adminpower_addons:diamond_to_emerald
$function gulce_adminpower_addons:config/cl {"cl_second":"$(cl_second)s"}
