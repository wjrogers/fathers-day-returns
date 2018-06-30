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

# Natura tool names
val tools = [
    "sword",
    "pickaxe",
    "shovel",
    "axe",
    "kama"
] as string[];

# remove Natura sticks from ore dictionary
<ore:stickWood>.remove(<natura:sticks:*>);

# fix ghostwood fletching recipe
val ghostwood_fletching = <natura:materials:5>;
recipes.remove(ghostwood_fletching);
recipes.addShaped(
    "fixed_natura_ghostwood_fletching",
    ghostwood_fletching,
    [[ null, <ore:stickWood>, null ],
     [ <natura:nether_leaves>, <ore:stickWood>, <natura:nether_leaves> ],
     [ <natura:nether_leaves>, <ore:stickWood>, <natura:nether_leaves> ]]);

# fix quartz tool recipes
logger.logInfo("Fixing netherquartz tool recipes");
for tool in tools {
    fixNaturaToolRecipe("netherquartz", tool);
}

# fix other recipes that use Natura sticks
for i, name in names {
    val is_nether = i >= NETHER;
    val sticks = sticksDefinition.makeStack(i);
    val planks = is_nether
        ? planksDefinitionNether.makeStack(i - NETHER)
        : planksDefinitionOverworld.makeStack(i);

    # remove stick recipe; we don't need special sticks
    mods.jei.JEI.removeAndHide(sticks);

    # get fence items by name
    val fence = getItemByName("natura:" ~ name ~ "_fence:0");
    val fence_gate = getItemByName("natura:" ~ name ~ "_fence_gate:0");

    # remove broken recipes
    recipes.remove(fence);
    recipes.remove(fence_gate);

    # replace with updated vanilla-style fence recipes
    recipes.addShaped(
        "fixed_natura_fence_" ~ name,
        fence * 3,
        [[ planks, <ore:stickWood>, planks ],
         [ planks, <ore:stickWood>, planks ]]);
    recipes.addShaped(
        "fixed_natura_fence_gate_" ~ name,
        fence_gate,
        [[ <ore:stickWood>, planks, <ore:stickWood> ],
         [ <ore:stickWood>, planks, <ore:stickWood> ]]);

    if (is_nether) {
        val bow = getItemByName("natura:" ~ name ~ "_bow:0");
        val flamestring = <natura:materials:7>;

        # remove the bow recipe
        recipes.remove(bow);

        # replace it with one modeled after the Thermal reinforced bows
        recipes.addShapedMirrored(
            "fixed_natura_" ~ name ~ "_bow",
            bow,
            [[ null, planks, flamestring ],
             [ <ore:stickWood>, null, flamestring ],
             [ null, planks, flamestring ]]);

        # fix tool recipes
        logger.logInfo("Fixing " ~ name ~ " tool recipes");
        for tool in tools {
            fixNaturaToolRecipe(name, tool);
        }
    }
}

# replaces Natura sticks with vanilla sticks in Natura tool crafting recipes
function fixNaturaToolRecipe(name as string, tool as string) {
    for recipe in recipes.getRecipesFor(getItemByName("natura:" ~ name ~ "_" ~ tool ~ ":0")) {
        logger.logCommand(recipe.commandString);

        # remove this recipe
        recipes.removeByRecipeName(recipe.fullResourceDomain);

        # get recipe ingredients
        val ingredients = recipe.ingredients2D;

        # replace Natura sticks with vanilla sticks in the ingredients array
        for i in 0 to ingredients.length {
            for j in 0 to ingredients[i].length {
                if (!isNull(ingredients[i][j])) {
                    if (<natura:sticks:*> has ingredients[i][j])
                        ingredients[i][j] = <ore:stickWood>;
                }
            }
        }

        # restore the recipe
        recipes.addShapedMirrored("fixed_natura_" ~ name ~ "_" ~ tool, recipe.output, ingredients);
    }
}

# gets a single itemstack by registry name, with error handling
function getItemByName(name as string) as IItemStack {
    val array = itemUtils.getItemsByRegexRegistryName(name) as IItemStack[];

    if (isNull(array) | array.length < 1) {
        logger.logError("Item named <" ~ name ~ "> not found!");
        return null;
    }

    if (array.length > 1) {
        logger.logWarning(array.length ~ " matches found for <" ~ name ~ ">; expected 1!");
    }

    return array[0];
}
