
### Load new chest id

# if not initialized yet, assign uid
execute if score .new tungsten.uid.chest matches -1 run function tungsten:init/chest

# get tungsten.id
scoreboard players operation .prev tungsten.chest = @s tungsten.chest
execute store result score @s tungsten.chest run data get storage ps:tungsten this.Inventory[{Slot:102b}].tag."tungsten.id"

# reset
scoreboard players operation @s tungsten.uid.chest = .new tungsten.uid.chest
scoreboard players set .bool2 tungsten 1
execute if score @s tungsten.chest matches 0 if score .prev tungsten.chest matches 0 run scoreboard players set .bool2 tungsten 0
execute if score .bool2 tungsten matches 1 run data modify storage ps:tungsten this.item set from storage ps:tungsten this.Inventory[{Slot:102b}]
execute if score .bool2 tungsten matches 1 run data remove storage ps:tungsten this.item.Slot
scoreboard players set .modified tungsten 0
execute if score .bool2 tungsten matches 1 run function #tungsten:swap/chest
execute unless score .modified tungsten matches 0 run data remove block 420692 0 694202 Items
execute unless score .modified tungsten matches 0 run data modify block 420692 0 694202 Items append from storage ps:tungsten this.item
execute unless score .modified tungsten matches 0 run item replace entity @s armor.chest from block 420692 0 694202 container.0

