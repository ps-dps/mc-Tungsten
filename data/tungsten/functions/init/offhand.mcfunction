
### Assign uid to offhand

# make the uid unique and valid
scoreboard players add .global tungsten.uid.offhand 1
execute if score .global tungsten.uid.offhand matches -1..0 run scoreboard players set .global tungsten.uid.offhand 1

# add uid into attribute
item replace block 420692 0 694202 container.0 from entity @s weapon.offhand
execute store result block 420692 0 694202 Items[0].tag.AttributeModifiers[{AttributeName:"minecraft:generic.luck",UUID:[I;12,42069,0,11]}].Amount double 0.000000000001 run scoreboard players get .global tungsten.uid.offhand
item replace entity @s weapon.offhand from block 420692 0 694202 container.0

# reset
scoreboard players operation .new tungsten.uid.offhand = .global tungsten.uid.offhand
