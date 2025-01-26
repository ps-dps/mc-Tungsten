execute if score .global tungsten.uid.mainhand matches -2..-1 run scoreboard players set .global tungsten.uid.mainhand 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s SelectedItem.components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.mainhand store result storage tungsten:temp c.attribute_modifiers[{type:"minecraft:luck",id:"tungsten:mainhand"}].amount double 0.0000000000009094947017729282 run scoreboard players add .global tungsten.uid.mainhand 1
function tungsten:replace_attributes/mainhand with storage tungsten:temp c
