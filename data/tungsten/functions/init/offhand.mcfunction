execute if score .global tungsten.uid.offhand matches -2..-1 run scoreboard players set .global tungsten.uid.offhand 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s Inventory[{Slot:-106b}].components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.offhand store result storage tungsten:temp c.attribute_modifiers.modifiers[{type:"minecraft:generic.luck",uuid:[I;12,42069,0,11]}].amount double 0.00000000000090949470177292282 run scoreboard players add .global tungsten.uid.offhand 1
function tungsten:replace_attributes/offhand with storage tungsten:temp c
