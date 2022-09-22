
### Assign uid to offhand

# make the uid unique and valid
scoreboard players add .global tungsten.uid.offhand 1
execute if score .global tungsten.uid.offhand matches -1..0 run scoreboard players set .global tungsten.uid.offhand 1

# add uid into attribute
data modify storage ps:tungsten this set from storage ps:tungsten this.Inventory[{Slot:-106b}]
data remove storage ps:tungsten this.Slot
execute store result storage ps:tungsten this.tag.AttributeModifiers[{AttributeName:"generic.luck",UUID:[I;12,42069,0,11]}].Amount double 0.000000000001 run scoreboard players get .global tungsten.uid.offhand
data remove block 420692 0 694202 Items
data modify block 420692 0 694202 Items append from storage ps:tungsten this
item replace entity @s weapon.offhand from block 420692 0 694202 container.0

# reset
scoreboard players operation .new tungsten.uid.offhand = .global tungsten.uid.offhand
