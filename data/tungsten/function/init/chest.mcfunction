execute if score .global tungsten.uid.chest matches -2..-1 run scoreboard players set .global tungsten.uid.chest 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s equipment.chest.components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.chest store result storage tungsten:temp c.attribute_modifiers[{type:"minecraft:luck",id:"tungsten:chest"}].amount double 0.0000000000009094947017729282 run scoreboard players add .global tungsten.uid.chest 1
function tungsten:replace_attributes/chest with storage tungsten:temp c
