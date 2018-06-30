import crafttweaker.item.IIngredient;

#modloaded natura
#priority -1

/*
    Fix recipe conflicts with vanilla wood items with ore-dicted inputs
    by removing the default Forge recipes, then adding them back again.
    
    In 1.12, this is the only way to influence recipe priority.
    https://github.com/MinecraftForge/MinecraftForge/issues/4415#issuecomment-331559742
*/

val mirrored = [
    "wooden_axe",
    "wooden_hoe"
] as string[];

for item in [
    <minecraft:bookshelf>,
    <minecraft:bowl>,
    <minecraft:crafting_table>,
    <minecraft:stick>,
    <minecraft:trapdoor>,
    <minecraft:wooden_button>,
    <minecraft:wooden_axe>,
    <minecraft:wooden_hoe>,
    <minecraft:wooden_pressure_plate>,
    <minecraft:wooden_pickaxe>,
    <minecraft:wooden_shovel>,
    <minecraft:wooden_sword>
] as IIngredient[] {
    for recipe in recipes.getRecipesFor(item) {
        logger.logCommand(recipe.commandString);

        # ignore recipes that aren't in the vanilla domain
        if (recipe.resourceDomain == "minecraft") {
            recipes.removeByRecipeName(recipe.fullResourceDomain);

            # bump to the end of the list
            if (recipe.shaped & mirrored has recipe.name)
                recipes.addShapedMirrored("restored_vanilla_" ~ recipe.name, recipe.output, recipe.ingredients2D);
            else if (recipe.shaped)
                recipes.addShaped("restored_vanilla_" ~ recipe.name, recipe.output, recipe.ingredients2D);
            else
                recipes.addShapeless("restored_vanilla_" ~ recipe.name, recipe.output, recipe.ingredients1D);
        }
    }
}
