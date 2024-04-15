
# **mc-tungsten**
**This library allows for easy and highly efficient checking for the swapping of equipment**

## **Register an Item**
Simply apply the modifier `tungsten:apply/<slot>` to the item for each slot tungsten should react to.
This can be done using the `item` command or in a loot table as a `minecraft:reference` function:

```mcfunction
item modify entity @s <...> tungsten:apply/<slot>
```

If you want to give a tungsten-ready item as a **crafting reward** or somewhere, where you can't use item modifiers, you can add the following component:

```json
"minecraft:attribute_modifiers": {
    "modifiers": [{
            "attribute": "minecraft:generic.luck",
            "name": "tungsten.<slot>",
            "amount": -9.094947017729282e-13,
            "operation": "add_value",
            "id": "<uuid>",
            "slot": "<slot>"
        }],
    "show_in_tooltip": false
}
```

Make sure to replace `<slot>` with the slot tungsten should work for and the `<uuid>` in hex using the following table:

|Slot|UUID in Hex|UUID in 4 Values|
|---|---|---|
|mainhand   |`c-0-a455-0-a`|`[I;12,42069,0,10]`|
|offhand    |`c-0-a455-0-b`|`[I;12,42069,0,11]`|
|head       |`c-0-a455-0-c`|`[I;12,42069,0,12]`|
|chest      |`c-0-a455-0-d`|`[I;12,42069,0,13]`|
|legs       |`c-0-a455-0-e`|`[I;12,42069,0,14]`|
|feet       |`c-0-a455-0-f`|`[I;12,42069,0,15]`|

## **Register a Function to run when Swapping**
The following function tags are executed once for each player, when (and only when) items of this library get equiped, unequiped or swapped.

|Function tag|Executed|
|---|---|
|`#tungsten:swap/mainhand`|when changing a **mainhand** item|
|`#tungsten:swap/offhand`|when changing an **offhand** item|
|`#tungsten:swap/head`|when changing a **head** item|
|`#tungsten:swap/chest`|when changing a **chest** item|
|`#tungsten:swap/legs`|when changing a **legs** item|
|`#tungsten:swap/feet`|when changing a **feet** item|

Add a function from your pack to the function tags, that handles the swapping of that type of equipment.

A function tag could look something like this:

> `/data/tungsten/tags/functions/swap/mainhand.json`
```json
{ "values":[ "your_pack:swap/mainhand" ]}
```

The functions in the tag are executed `as` and `at` the player, so the player can be selected using the `@s` selector.

> [!Note]
> Previously you could access and modify nbt of the swapped in item through a provided storage, this is no longer possible.
> Use a predicate to detect if the item is of your pack and then read the nbt you need to access.
> If this is something you rely on, please let me know of your usecase by opening an [issue](https://github.com/PuckiSilver/mc-tungsten/issues).

## **Embedding the Library**

To quickly set up this pack, copy the `load` and `tungsten` namespace into your pack and add merge the file located at `/data/minecraft/tags/functions/load.json`.

The merged file should look something like this:
```json
{ "values": [ "load:load", "your_pack:load" ]}
```

_This library uses [Lantern Load](https://github.com/LanternMC/load)._

## **How it works**
This library uses the `/attribute [...] get` command to read the players equipment instead of other checks.
Running two `attribute` commands each tick is a lot more efficient compared to other methods, where you read nbt or check components for multiple items each tick.

Equipment is identified using the luck attribute in very low amounts since the luck attribute is only used in the fishing loot table and only influences the loot table at integer values (`1`, `2`, `3`, ...).
Attributes in minecraft are stored as doubles and when reading them for use in the loot table, everything after the decimal point just gets cut (`4.69` becomes `4`), so values little over `0` are effectively read as `0`.

This library uses specific `uuid`s of the `generic.luck` attribute modifier to identify the different tungsten slots.
When creating an item, the `amount` of the attribute modifier gets set to `-9.094947017729282e-13` (-2<sup>-40</sup>) to initialize the library and give each item a unique id.
These `uid`s get stored back into the attribute amount as to not repeat the setup.

---
[![PuckiSilver on GitHub](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/GitHub.png)](https://github.com/PuckiSilver)[![PuckiSilver on modrinth](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/modrinth.png)](https://modrinth.com/user/PuckiSilver)[![PuckiSilver on PlanetMinecraft](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/PlanetMinecraft.png)](https://planetminecraft.com/m/PuckiSilver)[![PuckiSilver on PayPal](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/PayPal.png)](https://paypal.me/puckisilver)
