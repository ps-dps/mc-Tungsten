
advancement revoke @s only tungsten:tick
# check if the luck attribute changed at all
execute store result score .new tungsten.uid run attribute @s generic.luck get 1000000000000
# check offhand specifically since the player can press F to not change the luck attribute but their equipment
execute store result score .new tungsten.uid.offhand run attribute @s minecraft:generic.luck modifier value get c-0-a455-0-b 1000000000000
scoreboard players operation .new tungsten.uid += .new tungsten.uid.offhand
# call new function if there is change in the luck attribute
execute unless score .new tungsten.uid = @s tungsten.uid run function tungsten:tick/check
