execute if score .global tungsten.uid.legs matches -2..-1 run scoreboard players set .global tungsten.uid.legs 0
data modify storage tungsten:temp c.attribute_modifiers set from entity @s Inventory[{Slot:101b}].components.minecraft:attribute_modifiers
execute store result score .new tungsten.uid.legs store result storage tungsten:temp c.attribute_modifiers.modifiers[{type:"minecraft:generic.luck",uuid:[I;12,42069,0,14]}].amount double 0.00000000000090949470177292282 run scoreboard players add .global tungsten.uid.legs 1
function tungsten:replace_attributes/legs with storage tungsten:temp c
