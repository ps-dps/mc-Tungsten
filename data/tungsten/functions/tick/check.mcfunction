
### Check for each equipment and look for changes

# reset
scoreboard players operation @s tungsten.uid = .new tungsten.uid

# get all data so the following reads are less intense (at this point i know there is a change)
data modify storage tungsten:player Inventory set from entity @s Inventory

# check mainhand
execute store result score .new tungsten.uid.mainhand run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-a 1000000000000.5
execute unless score .new tungsten.uid.mainhand = @s tungsten.uid.mainhand run function tungsten:swap/mainhand
# check offhand (the uid was gotten in tick/init)
#execute store result score .new tungsten.uid.offhand run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-b 1000000000000.5
execute unless score .new tungsten.uid.offhand = @s tungsten.uid.offhand run function tungsten:swap/offhand
# check head
execute store result score .new tungsten.uid.head run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-c 1000000000000.5
execute unless score .new tungsten.uid.head = @s tungsten.uid.head run function tungsten:swap/head
# check chest
execute store result score .new tungsten.uid.chest run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-d 1000000000000.5
execute unless score .new tungsten.uid.chest = @s tungsten.uid.chest run function tungsten:swap/chest
# check legs
execute store result score .new tungsten.uid.legs run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-e 1000000000000.5
execute unless score .new tungsten.uid.legs = @s tungsten.uid.legs run function tungsten:swap/legs
# check feet
execute store result score .new tungsten.uid.feet run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-f 1000000000000.5
execute unless score .new tungsten.uid.feet = @s tungsten.uid.feet run function tungsten:swap/feet
