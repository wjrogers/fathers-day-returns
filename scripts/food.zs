# remove the default recipe for bread; smelting wheat only!
recipes.remove(<minecraft:bread>);

# remove the default recipes for Natura flour
recipes.remove(<natura:materials:1>);
recipes.remove(<natura:materials:2>);

# remove the AE2 flour recipe; we disabled the item
mods.thermalexpansion.Pulverizer.removeRecipe(<minecraft:wheat>);

# add Natura grains to ore dictionary for compatibility
<ore:dustBarley>.add(<natura:materials:1>);
<ore:dustWheat>.add(<natura:materials:2>);

# grind flour
mods.thermalexpansion.Pulverizer.addRecipe(
    <natura:materials:1>,
    <natura:materials:0>,
    4000);
mods.thermalexpansion.Pulverizer.addRecipe(
    <natura:materials:2>,
    <minecraft:wheat>,
    4000);

# grind barley in the AE2 Grinder, too
mods.appliedenergistics2.Grinder.addRecipe(
    <natura:materials:1>,
    <natura:materials:0>,
    4);
