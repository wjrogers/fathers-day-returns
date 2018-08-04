#modloaded immersiveengineering
#modloaded thermalfoundation

/*
    Unify conflicting and redundant processing recipes across mods.
*/

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
