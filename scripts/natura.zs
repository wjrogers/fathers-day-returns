import crafttweaker.item.IItemStack;

#modloaded natura

/*
    Remove Natura sticks from the game; use vanilla sticks and the new
    varied recipes for fences and fence gates instead.
*/

# metadata of first nether sticks
val NETHER = 9;

# Natura planks and sticks definitions
val planksDefinitionNether = <natura:nether_planks>.definition;
val planksDefinitionOverworld = <natura:overworld_planks>.definition;
val sticksDefinition = <natura:sticks>.definition;

# Natura wood names
val names = [
    "maple",
    "silverbell",
    "amaranth",
    "tiger",
    "willow",
    "eucalyptus",
    "hopseed",
    "sakura",
    "redwood",
    "ghostwood",
    "bloodwood",
    "darkwood",
    "fusewood"
] as string[];

# fix other recipes that use Natura sticks
for i, name in names {
    val is_nether = i >= NETHER;
    val sticks = sticksDefinition.makeStack(i);
    val planks = is_nether
        ? planksDefinitionNether.makeStack(i - NETHER)
        : planksDefinitionOverworld.makeStack(i);
    
    # replace sticks with vanilla ones in all recipes
    recipes.replaceAllOccurences(sticks, <ore:stickWood>);

    # remove stick recipe; we don't need special sticks
    mods.jei.JEI.removeAndHide(sticks);
}
