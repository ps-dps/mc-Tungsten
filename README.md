
# **mc-tungsten**
### This library allows for easy and efficient checking for the swapping of equipment and provides the items data in a storage for easy and efficient reading and modifying.

---

## **How it works**
This Library uses the `/attribute [...] get` command to read the players equipment instead of nbt.<br>
The `attribute` command is way more efficient compared to the `data` command (especially for players).

Equipment is identified using the luck attribute in very low amounts since the luck attribute is only used in the fishing loot table and only influences the loot table at integer values (`1`, `2`, `3`...).
Attributes in minecraft are stored as doubles and when reading them for use in the loot table, everything after the point just gets cut (`4.69` becomes `4`), so values little over `0` are effectively read as `0`.

---

## **"Register" an Item**
This library uses specific UUIDs of the `generic.luck` attribute modifier to identify the different types of equipment.<br>
When creating an item, set the `Amount` of the attribute modifier to `-0.000000000001` (-1*10<sup>-12</sup>).

|Slot|UUID in Hex|UUID in 4 Values|
|---|---|---|
|mainhand   |`c-0-a455-0-a`|`[I;12,42069,0,10]`|
|offhand    |`c-0-a455-0-b`|`[I;12,42069,0,11]`|
|head       |`c-0-a455-0-c`|`[I;12,42069,0,12]`|
|chest      |`c-0-a455-0-d`|`[I;12,42069,0,13]`|
|legs       |`c-0-a455-0-e`|`[I;12,42069,0,14]`|
|feet       |`c-0-a455-0-f`|`[I;12,42069,0,15]`|

A give command could look like the following:
```hs
give @s ender_eye{AttributeModifiers:[{AttributeName:"generic.luck",Name:"tungsten.mainhand",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,10],Slot:"mainhand"},{AttributeName:"generic.luck",Name:"tungsten.offhand",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,11],Slot:"offhand"}]}
```
This command gives the player an ender eye, that can be detected in the mainhand and offhand.

---

## **Access from your pack**

### **Embedding the Library**

This library uses [Lantern Load](https://github.com/LanternMC/load) to ensure that all packs load in a controllable order. For more information on Lantern Load, check out the README in their repository.

To quickly set up this pack, copy the `minecraft`, `load` and `tungsten` namespace into your pack and add your `load.mcfunction` file to `.../data/load/tags/functions/load.json`.

### **"Register" your Pack**
The following function tags are executed once for each player, when (and only when) items of this library get equiped, unequiped or swapped.

|Function tag|Executed|
|---|---|
|`#tungsten:swap/mainhand`|when changing a mainhand item|
|`#tungsten:swap/offhand`|when changing an offhand item|
|`#tungsten:swap/head`|when changing a head item|
|`#tungsten:swap/chest`|when changing a chest item|
|`#tungsten:swap/legs`|when changing a legs item|
|`#tungsten:swap/feet`|when changing a feet item|

Add a function from your pack to the function tags, that handles the swapping of that type of equipment.

A function tag should look something like this:

> `.../data/tungsten/tags/functions/swap/<type>.json`
```json
{
    "values":[
        "<namespace>:<swap_handle_function>"
    ]
}
```
### **Context**
The context of the function tags are `as` and `at` the player, so the player can be selected using the `@s` selector.

### **Item Data**
In the storage `tungsten:player` at `Item`, you can access the information of the item that has just been equipped.

### **Modify an Item**
If you modify the items data inside of the storage and set the `.modified` score of the `tungsten` objective to anything **other then** `0`, the item in the players inventory will get modified accordingly.

### **Read the Players Inventory**
The whole inventory of the player can also be read in the storage `tungsten:player` at `Inventory`, this will never modify the players actual inventory and is meant to be read only.
