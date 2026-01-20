advancement revoke @a from global:items/clickable/admin_tool
execute as @e[type=item] if items entity @s contents *[minecraft:custom_data~{ConfigUI:1b}] at @s on origin run data merge entity @n[type=item,distance=..0.1] {PickupDelay:0s}
execute unless predicate actions:can_use_panel run clear @a[tag=!op] *[minecraft:custom_data={ConfigUI:1b}]
