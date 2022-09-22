
### Assign uid to legs

# make the uid unique and valid
scoreboard players add .global tungsten.uid.legs 1
execute if score .global tungsten.uid.legs matches -1..0 run scoreboard players set .global tungsten.uid.legs 1

# add uid into attribute
item replace block 420692 0 694202 container.0 from entity @s armor.legs
execute store result block 420692 0 694202 Items[0].tag.AttributeModifiers[{AttributeName:"generic.luck",UUID:[I;12,42069,0,14]}].Amount double 0.000000000001 run scoreboard players get .global tungsten.uid.legs
item replace entity @s armor.legs from block 420692 0 694202 container.0

# reset
scoreboard players operation .new tungsten.uid.legs = .global tungsten.uid.legs
