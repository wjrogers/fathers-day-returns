val certus = <ore:crystalCertusQuartz>;
val certusDust = <ore:dustCertusQuartz>;
val diamond = <ore:gemDiamond>;
val gold = <ore:ingotGold>;
val nether = <ore:crystalNetherQuartz>;
val netherDust = <ore:dustNetherQuartz>;
val redstone = <ore:dustRedstone>;
val silicon = <ore:itemSilicon>;

# induction smelt fluix
mods.thermalexpansion.InductionSmelter.addRecipe(
    <appliedenergistics2:material:7> * 2,
    <appliedenergistics2:material:1>,
    <minecraft:quartz>,
    1000);

# induction smelt dust into pure crystals (must use itemstacks here, not oredict!)
# - 2 crystals per operation, just like crafting into seeds and growing
# - 25% chance of a silicon byproduct per operation
mods.thermalexpansion.InductionSmelter.addRecipe(
    <appliedenergistics2:material:10> * 2,
    <appliedenergistics2:material:2>,
    <minecraft:sand>,
    4000,
    <appliedenergistics2:material:5>,
    25);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <appliedenergistics2:material:11> * 2,
    <appliedenergistics2:material:3>,
    <minecraft:sand>,
    4000,
    <appliedenergistics2:material:5>,
    25);
mods.thermalexpansion.InductionSmelter.addRecipe(
    <appliedenergistics2:material:12> * 2,
    <appliedenergistics2:material:8>,
    <minecraft:sand>,
    4000,
    <appliedenergistics2:material:5>,
    25);

# processors
recipes.addShaped("ae2_simple_cpu_logi", <appliedenergistics2:material:22>,
    [ [gold], [redstone], [silicon] ]);
recipes.addShaped("ae2_simple_cpu_calc", <appliedenergistics2:material:23>,
    [ [certus], [redstone], [silicon] ]);
recipes.addShaped("ae2_simple_cpu_engi", <appliedenergistics2:material:24>,
    [ [diamond], [redstone], [silicon] ]);

# conjure certus quartz (copy of the default botania nether quartz recipe)
mods.botania.ManaInfusion.addConjuration(
    <appliedenergistics2:material:0> * 2,
    <appliedenergistics2:material:0>,
    2500);
