#modloaded immersiveengineering
#modloaded thermalfoundation

/*
    Unify conflicting and redundant processing recipes across mods.
*/

# metals list copied from UniDict.cfg,
#   + Signalum, Lumium, Enderium, and Mithril
#   + Thaumium and Void
val metals = [
    "Alumina",
    "Aluminium",
    "Aluminum",
    "Brass",
    "Bronze",
    "Chrome",
    "Chromium",
    "Constantan",
    "Copper",
    "Cupronickel",
    "Electrum",
    "Enderium",
    "Gold",
    "Invar",
    "Iridium",
    "Iron",
    "Lead",
    "Lumium",
    "Mithril",
    "Nickel",
    "Osmium",
    "Platinum",
    "Signalum",
    "Silver",
    "Steel",
    "Thaumium",
    "Tin",
    "Uranium",
    "Void",
    "Zinc"
] as string[];

# remove all hand-crafting of plates
mods.unidict.removalByKind.get("Crafting").remove("plate");

# add ingot + hammer recipes for each plate
for metal in metals {
    val ingots = oreDict["ingot" ~ metal];
    val plates = oreDict["plate" ~ metal];
    if (!ingots.empty & !plates.empty) {
        recipes.addShapeless(
            "hammered_plate" ~ metal,
            plates.firstItem,
            [ <immersiveengineering:tool>, ingots ]);
    }
}

# keep only one of these extremely similar gunpowder recipes
/*
recipes.addShapeless(
    "immersiveengineering:material/gunpowder1",
    <minecraft:gunpowder> * 4,
    [
        <ore:dustSaltpeter>,
        <ore:dustSaltpeter>,
        <ore:dustSaltpeter>,
        <ore:dustSaltpeter>,
        <ore:dustSulfur>,
        <ore:dustCharcoal>
    ]);
*/
recipes.removeByRecipeName("immersiveengineering:material/gunpowder0");
recipes.removeByRecipeName("natura:common/gunpowder");
recipes.removeByRecipeName("thermalfoundation:gunpowder");
recipes.removeByRecipeName("thermalfoundation:gunpowder_1");

# add ores missing from Laser Drill
mods.industrialforegoing.LaserDrill.add(1, <thaumcraft:ore_amber>, 3);
#mods.industrialforegoing.LaserDrill.add(14, thaumcraft:ore_cinnabar, 3); # included by default
mods.industrialforegoing.LaserDrill.add(0, <thaumcraft:ore_quartz>, 3);
mods.industrialforegoing.LaserDrill.add(4, <thaumcraft:crystal_aer>, 2);
mods.industrialforegoing.LaserDrill.add(14, <thaumcraft:crystal_ignis>, 2);
mods.industrialforegoing.LaserDrill.add(11, <thaumcraft:crystal_aqua>, 2);
mods.industrialforegoing.LaserDrill.add(13, <thaumcraft:crystal_terra>, 2);
mods.industrialforegoing.LaserDrill.add(0, <thaumcraft:crystal_ordo>, 2);
mods.industrialforegoing.LaserDrill.add(15, <thaumcraft:crystal_perditio>, 2);

# add ores missing from Orechid
mods.botania.Orechid.addOre(<ore:oreQuartz>, 3975);
