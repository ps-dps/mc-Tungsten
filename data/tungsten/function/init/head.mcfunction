execute if score .global tungsten.uid.head matches -2..-1 run scoreboard players set .global tungsten.uid.head 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s equipment.head.components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.head store result storage tungsten:temp c.attribute_modifiers[{type:"minecraft:luck",id:"tungsten:head"}].amount double 0.0000000000009094947017729282 run scoreboard players add .global tungsten.uid.head 1
function tungsten:replace_attributes/head with storage tungsten:temp c
