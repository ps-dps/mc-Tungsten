
### Load new feet id

# if not initialized yet, assign uid
execute if score .new tungsten.uid.feet matches -1 run function tungsten:init/feet

# get tungsten.id
scoreboard players operation .prev tungsten.feet = @s tungsten.feet
execute store result score @s tungsten.feet run data get storage ps:tungsten this.Inventory[{Slot:100b}].tag."tungsten.id"

# reset
scoreboard players operation @s tungsten.uid.feet = .new tungsten.uid.feet
scoreboard players set .bool2 tungsten 1
execute if score @s tungsten.feet matches 0 if score .prev tungsten.feet matches 0 run scoreboard players set .bool2 tungsten 0
execute if score .bool2 tungsten matches 1 run data modify storage ps:tungsten this.item set from storage ps:tungsten this.Inventory[{Slot:100b}]
execute if score .bool2 tungsten matches 1 run data remove storage ps:tungsten this.item.Slot
scoreboard players set .modified tungsten 0
execute if score .bool2 tungsten matches 1 run function #tungsten:swap/feet
execute unless score .modified tungsten matches 0 run data remove block 420692 0 694202 Items
execute unless score .modified tungsten matches 0 run data modify block 420692 0 694202 Items append from storage ps:tungsten this.item
execute unless score .modified tungsten matches 0 run item replace entity @s armor.feet from block 420692 0 694202 container.0

