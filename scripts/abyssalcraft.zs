var plate = <abyssalcraft:ironp>;
var washcloth = <abyssalcraft:cloth>;

# remove dumb recipes
recipes.remove(washcloth);
recipes.removeShaped(
    <abyssalcraft:ironp>,
    [[ <ore:ingotIron> ],
     [ <ore:ingotIron> ]]);

# press plates in the compactor
mods.thermalexpansion.Compactor.addPressRecipe(
    plate * 3,
    <minecraft:bucket>,
    4000);

# hemp-wool blend!
recipes.addShapedMirrored(
    washcloth,
    [[ <ore:blockWool>, <ore:fabricHemp> ],
     [ <ore:fabricHemp>, <ore:blockWool> ]]);

# cook off food!
furnace.addRecipe(plate, <abyssalcraft:dirtyplate>);
