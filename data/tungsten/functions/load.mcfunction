
#load
scoreboard objectives add tungsten dummy

scoreboard objectives add tungsten.mainhand dummy
scoreboard objectives add tungsten.offhand dummy
scoreboard objectives add tungsten.head dummy
scoreboard objectives add tungsten.chest dummy
scoreboard objectives add tungsten.legs dummy
scoreboard objectives add tungsten.feet dummy

scoreboard objectives add tungsten.uid dummy
scoreboard objectives add tungsten.uid.mainhand dummy
scoreboard objectives add tungsten.uid.offhand dummy
scoreboard objectives add tungsten.uid.head dummy
scoreboard objectives add tungsten.uid.chest dummy
scoreboard objectives add tungsten.uid.legs dummy
scoreboard objectives add tungsten.uid.feet dummy

forceload add 420692 694202
setblock 420692 0 694202 yellow_shulker_box
setblock 420692 1 694202 bedrock

scoreboard players set silver.weapons.library load.status 1
