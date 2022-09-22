
# **Silver Weapons Library**
This library allows for easy and efficient checking for equipment.
Equiping and swapping armor, mainhand- and offhand items, checking the currently equiped equipment through scores.

This Library is meant to be used to implement custom equipment in a very performant way.

## **How it works**
This Library uses the `/attribute ... get` command to read the players equipment instead of nbt since this command is way lighter then the nbt commands (especially for players).
The equipment uses the luck attribute in very low amounts since it is only used in the fishing loot table and only changes anything at integer values (1, 2, 3...) but is stored as a double.

---

### **"Adding" your own item**
This Library uses specific UUIDs of the `generic.luck` attribute modifier to identify the different types of equipment.<br>
When giving the item, set the `Amount` of the attribute modifer to `-0.000000000001` (-1*10<sup>-12</sup>).

|Slot|UUID in Hex|UUID in 4 Values|
|---|---|---|
|mainhand   |`c-0-a455-0-a`|`[I;12,42069,0,10]`|
|offhand    |`c-0-a455-0-b`|`[I;12,42069,0,11]`|
|head       |`c-0-a455-0-c`|`[I;12,42069,0,12]`|
|chest      |`c-0-a455-0-d`|`[I;12,42069,0,13]`|
|legs       |`c-0-a455-0-e`|`[I;12,42069,0,14]`|
|feet       |`c-0-a455-0-f`|`[I;12,42069,0,15]`|

Additionally to that luck modifier you need to add the nbt `swl.id:YOUR_ID` to your item. This is the ID of this item that you can check for using the `@s swl.*` scores of each player. Replace the `YOUR_ID` part with a unique integer of your choosing (kind of like custom model data). This ID is only unique for that slot type, so a whole armor set with a weapon can have the same ID.<br>
_(`*` can be one of `mainhand/offhand/head/chest/legs/feet`)_

**A give command could look like the following:**
```js
give @s ender_eye{swl.id:16,AttributeModifiers:[{AttributeName:"generic.luck",Name:"swl.mainhand",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,10],Slot:"mainhand"},{AttributeName:"generic.luck",Name:"swl.offhand",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,11],Slot:"offhand"}]}
```
This command gives the player an ender eye with an ID of 16, that can be detected in the mainhand and offhand.

---

## **In- and output**
(`*` here is one of `mainhand/offhand/head/chest/legs/feet`)

|Function tag|Description|
|---|---|
|`#swl:swap/mainhand`|Called when swapping to and from a mainhand item from this library|
|`#swl:swap/offhand`|Called when swapping to and from a offhand item from this library|
|`#swl:swap/head`|Called when swapping to and from a head item from this library|
|`#swl:swap/chest`|Called when swapping to and from a chest item from this library|
|`#swl:swap/legs`|Called when swapping to and from a legs item from this library|
|`#swl:swap/feet`|Called when swapping to and from a feet item from this library|

Use these function tags to add/remove effects or attributes of your custom equipment or load arbitrary stats using the variables given below.

|Value|Type|Description|Availability|
|---|---|---|---|
|`@s swl.*`         |score  |The `swl.id` of the item in that Slot|At any time, use this in your own pack|
|`.prev swl.*`      |score  |The `swl.id` of the item previously in that Slot|Only in `#swl:swap/*`|
|`ps:swl this`      |storage|All the nbt of the player|Only in `#swl:swap/*`|
|`ps:swl this.item` |storage|The nbt of the used item|Only in `#swl:swap/*`|
|`.modified swl`    |score  |If != 0, the item (`ps:swl this.item`) gets given back to the player|Only in `#swl:swap/*`|

If you want to check the equipment each tick in your own data pack you can do that by just checking the `@s swl.*` score.

## **Technical Stuff**
1. Why is the ID not converted into the luck attribute value? Reading that is more performant.
    - That way I can check the swap between items with the same ID, since 2 different new chestplates could have different armor values / enchantments /...<br>
Plus this nbt value is only read when actually swapping that specific item so it does not have a big performance impact

2. The `#swl:swap/*` function tags are updated and called in this order `mainhand/offhand/head/chest/legs/feet`.
