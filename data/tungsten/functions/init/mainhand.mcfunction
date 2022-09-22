
### Assign uid to mainhand

# make the uid unique and valid
scoreboard players add .global tungsten.uid.mainhand 1
execute if score .global tungsten.uid.mainhand matches -1..0 run scoreboard players set .global tungsten.uid.mainhand 1

# add uid into attribute
execute store result storage ps:tungsten this.SelectedItem.tag.AttributeModifiers[{AttributeName:"generic.luck",UUID:[I;12,42069,0,10]}].Amount double 0.000000000001 run scoreboard players get .global tungsten.uid.mainhand
data remove block 420692 0 694202 Items
data modify block 420692 0 694202 Items append from storage ps:tungsten this.SelectedItem
item replace entity @s weapon.mainhand from block 420692 0 694202 container.0

# reset
scoreboard players operation .new tungsten.uid.mainhand = .global tungsten.uid.mainhand
