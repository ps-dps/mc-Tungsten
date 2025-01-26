execute if score .global tungsten.uid.offhand matches -2..-1 run scoreboard players set .global tungsten.uid.offhand 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s Inventory[{Slot:-106b}].components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.offhand store result storage tungsten:temp c.attribute_modifiers.modifiers[{type:"minecraft:luck",id:"tungsten:offhand"}].amount double 0.0000000000009094947017729282 run scoreboard players add .global tungsten.uid.offhand 1
function tungsten:replace_attributes/offhand with storage tungsten:temp c
