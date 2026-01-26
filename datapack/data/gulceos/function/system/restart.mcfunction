tellraw @a[tag=gulce_debug] "[GulceOS] Restarting..."

scoreboard objectives add gulceos.const dummy
function custom_admin:load
function custom_admin:handler/load/1
function glc_menu:handler/load
function cooldown:init
scoreboard players set #loaded gulceos.const 1
data modify storage custom:storage Temp.Trigger set value []
data modify storage custom:storage Temp.Trigger append value {"command":"say ✅","number":1,"score":"ap_test","tag":"op"}
data modify storage custom:storage Temp.Trigger append value {"command":"say ❌","number":2,"score":"ap_test","tag":"op"}

