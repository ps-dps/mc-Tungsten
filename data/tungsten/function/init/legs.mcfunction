execute if score .global tungsten.uid.legs matches -2..-1 run scoreboard players set .global tungsten.uid.legs 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s Inventory[{Slot:101b}].components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.legs store result storage tungsten:temp c.attribute_modifiers[{type:"minecraft:luck",id:"tungsten:legs"}].amount double 0.0000000000009094947017729282 run scoreboard players add .global tungsten.uid.legs 1
function tungsten:replace_attributes/legs with storage tungsten:temp c
