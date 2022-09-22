
### Assign uid to legs

# make the uid unique and valid
scoreboard players add .global tungsten.uid.legs 1
execute if score .global tungsten.uid.legs matches -1..0 run scoreboard players set .global tungsten.uid.legs 1

# add uid into attribute
data modify storage ps:tungsten this set from storage ps:tungsten this.Inventory[{Slot:101b}]
data remove storage ps:tungsten this.Slot
execute store result storage ps:tungsten this.tag.AttributeModifiers[{AttributeName:"generic.luck",UUID:[I;12,42069,0,14]}].Amount double 0.000000000001 run scoreboard players get .global tungsten.uid.legs
data remove block 420692 0 694202 Items
data modify block 420692 0 694202 Items append from storage ps:tungsten this
item replace entity @s armor.legs from block 420692 0 694202 container.0

# reset
scoreboard players operation .new tungsten.uid.legs = .global tungsten.uid.legs
