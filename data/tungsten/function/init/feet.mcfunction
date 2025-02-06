execute if score .global tungsten.uid.feet matches -2..-1 run scoreboard players set .global tungsten.uid.feet 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s equipment.feet.components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.feet store result storage tungsten:temp c.attribute_modifiers[{type:"minecraft:luck",id:"tungsten:feet"}].amount double 0.0000000000009094947017729282 run scoreboard players add .global tungsten.uid.feet 1
function tungsten:replace_attributes/feet with storage tungsten:temp c
