# create the enchantment in the Arcane Ensorcellator
mods.thermalexpansion.Enchanter.addRecipe(
    <minecraft:enchanted_book>.withTag({
        StoredEnchantments: [
            {lvl: 1 as short, id: 11 as short}
        ]
    }),
    <minecraft:book>,
    <tconstruct:ingots:2>,  # manyullyn
    12000,                  # rf
    1500,                   # mb of experience
    false);                 # "empowered", not implemented?
