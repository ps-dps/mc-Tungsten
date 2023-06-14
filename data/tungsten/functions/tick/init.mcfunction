
# check if the luck attribute changed at all and offhand (F does not alter luck)
execute store result score .new tungsten.uid run attribute @s generic.luck get 1000000000000.5
execute store result score .new tungsten.uid.offhand run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-b 1000000000000.5
scoreboard players operation .new tungsten.uid += .new tungsten.uid.offhand
# call new function if there is change in the luck attribute
execute unless score .new tungsten.uid = @s tungsten.uid run function tungsten:tick/check
