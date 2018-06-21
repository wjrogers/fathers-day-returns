val comparator = <minecraft:comparator>;
val redstone = <ore:dustRedstone>;
val repeater = <minecraft:repeater>;
val resin = <thermalfoundation:material:832>;
val slimeball = <ore:slimeball>;
val tar = <thermalfoundation:material:833>;

# remove the default recipes
recipes.remove(<redstonepaste:redstonepaste>);
recipes.remove(<redstonepaste:stickycomparator>);
recipes.remove(<redstonepaste:stickyrepeater>);

# redstone paste
recipes.addShapeless("redstonepaste_redstonepaste_oredict", <redstonepaste:redstonepaste> * 4, [redstone, slimeball]);
recipes.addShapeless("redstonepaste_redstonepaste_resin", <redstonepaste:redstonepaste> * 4, [redstone, resin]);
recipes.addShapeless("redstonepaste_redstonepaste_tar", <redstonepaste:redstonepaste> * 4, [redstone, tar]);

# sticky comparator
recipes.addShapeless("redstonepaste_stickycomparator_oredict", <redstonepaste:stickycomparator>, [comparator, slimeball]);
recipes.addShapeless("redstonepaste_stickycomparator_resin", <redstonepaste:stickycomparator>, [comparator, resin]);
recipes.addShapeless("redstonepaste_stickycomparator_tar", <redstonepaste:stickycomparator>, [comparator, tar]);

# sticky repeater
recipes.addShapeless("redstonepaste_stickyrepeater_oredict", <redstonepaste:stickyrepeater>, [repeater, slimeball]);
recipes.addShapeless("redstonepaste_stickyrepeater_resin", <redstonepaste:stickyrepeater>, [repeater, resin]);
recipes.addShapeless("redstonepaste_stickyrepeater_tar", <redstonepaste:stickyrepeater>, [repeater, tar]);
