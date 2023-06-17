
### Load new feet id

# if not initialized yet, assign uid
data modify storage tungsten:player Inventory set from entity @s Inventory
execute if score .new tungsten.uid.feet matches -1 run function tungsten:init/feet

# reset
scoreboard players set .has.swapped tungsten 1
execute if score @s tungsten.uid.feet matches 0 if score .prev tungsten.uid.feet matches 0 run scoreboard players set .has.swapped tungsten 0
scoreboard players operation @s tungsten.uid.feet = .new tungsten.uid.feet
execute if score .has.swapped tungsten matches 1 run data remove storage tungsten:player Item
execute if score .has.swapped tungsten matches 1 run data modify storage tungsten:player Item set from storage tungsten:player Inventory[{Slot:100b}]
execute if score .has.swapped tungsten matches 1 run data remove storage tungsten:player Item.Slot
scoreboard players set .modified tungsten 0
execute if score .has.swapped tungsten matches 1 run function #tungsten:swap/feet
execute unless score .modified tungsten matches 0 run data remove block 420692 0 694202 Items
execute unless score .modified tungsten matches 0 run data modify block 420692 0 694202 Items append from storage tungsten:player Item
execute unless score .modified tungsten matches 0 run item replace entity @s armor.feet from block 420692 0 694202 container.0

