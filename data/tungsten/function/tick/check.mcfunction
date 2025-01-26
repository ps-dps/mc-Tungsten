
scoreboard players operation @s tungsten.uid = .new tungsten.uid
execute store result score .new tungsten.uid.mainhand run attribute @s luck modifier value get tungsten:mainhand 1099511627776.5
execute unless score .new tungsten.uid.mainhand = @s tungsten.uid.mainhand at @s run function tungsten:swap/mainhand
execute store result score .new tungsten.uid.offhand run attribute @s luck modifier value get tungsten:offhand 1099511627776.5
execute unless score .new tungsten.uid.offhand = @s tungsten.uid.offhand at @s run function tungsten:swap/offhand
execute store result score .new tungsten.uid.head run attribute @s luck modifier value get tungsten:head 1099511627776.5
execute unless score .new tungsten.uid.head = @s tungsten.uid.head at @s run function tungsten:swap/head
execute store result score .new tungsten.uid.chest run attribute @s luck modifier value get tungsten:chest 1099511627776.5
execute unless score .new tungsten.uid.chest = @s tungsten.uid.chest at @s run function tungsten:swap/chest
execute store result score .new tungsten.uid.legs run attribute @s luck modifier value get tungsten:legs 1099511627776.5
execute unless score .new tungsten.uid.legs = @s tungsten.uid.legs at @s run function tungsten:swap/legs
execute store result score .new tungsten.uid.feet run attribute @s luck modifier value get tungsten:feet 1099511627776.5
execute unless score .new tungsten.uid.feet = @s tungsten.uid.feet at @s run function tungsten:swap/feet
scoreboard players reset @s tungsten.dirty
