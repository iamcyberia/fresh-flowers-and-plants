-- Cyber and Sapling were here :3
global.pitchAngle = 0.0;
global.yawAngle = 0.0;
global.pitchAngleO = 0.0;
global.yawAngleO = 0.0;

local ywAngle = (mainHand and yawAngle) or yawAngleO
local ptAngle = (mainHand and pitchAngle) or pitchAngleO

local l = bl and 1 or -1

local function noBlocksPlease(blocks)
    for _, id in ipairs(blocks) do
        renderAsBlock:put(id, false)
    end
end

noBlocksPlease({

	-- Saplings
    "minecraft:oak_sapling",
    "minecraft:spruce_sapling",
    "minecraft:birch_sapling",
    "minecraft:jungle_sapling",
    "minecraft:acacia_sapling",
    "minecraft:dark_oak_sapling",
    "minecraft:mangrove_propagule",
    "minecraft:cherry_sapling",
    "minecraft:pale_oak_sapling",

	-- More Plants
	"minecraft:bamboo",
    "minecraft:kelp",
    "minecraft:sugar_cane",
    "minecraft:sea_pickle",
    "minecraft:seagrass",
    "minecraft:lily_pad",
    "minecraft:big_dripleaf",
    "minecraft:small_dripleaf",
	"minecraft:vine",
    "minecraft:glow_lichen",
    "minecraft:sculk_vein",
    "minecraft:spore_blossom",
    "minecraft:hanging_roots",
    "minecraft:pale_hanging_moss",
    "minecraft:azalea",
    "minecraft:flowering_azalea",

	-- Even More Plants
	"minecraft:short_grass",
    "minecraft:tall_grass",
    "minecraft:fern",
    "minecraft:large_fern",
    "minecraft:firefly_bush",
    "minecraft:bush",
    "minecraft:short_dry_grass",
    "minecraft:tall_dry_grass",
    "minecraft:dead_bush",
	
	-- Mushrooms
	"minecraft:red_mushroom",
    "minecraft:brown_mushroom",
    "minecraft:crimson_fungus",
    "minecraft:warped_fungus",

	-- Flowers
	"minecraft:dandelion",
    "minecraft:poppy",
    "minecraft:blue_orchid",
    "minecraft:allium",
    "minecraft:azure_bluet",
    "minecraft:red_tulip",
    "minecraft:orange_tulip",
    "minecraft:white_tulip",
    "minecraft:pink_tulip",
    "minecraft:oxeye_daisy",
    "minecraft:cornflower",
    "minecraft:lily_of_the_valley",
    "minecraft:torchflower",
    "minecraft:cactus_flower",
    "minecraft:closed_eyeblossom",
    "minecraft:open_eyeblossom",
    "minecraft:wither_rose",
    "minecraft:sunflower",
    "minecraft:lilac",
    "minecraft:rose_bush",
    "minecraft:peony",
    "minecraft:pitcher_plant",

	-- Corals
	"minecraft:tube_coral",
    "minecraft:brain_coral",
    "minecraft:bubble_coral",
    "minecraft:fire_coral",
    "minecraft:horn_coral",
    "minecraft:tube_coral_fan",
    "minecraft:brain_coral_fan",
    "minecraft:bubble_coral_fan",
    "minecraft:fire_coral_fan",
    "minecraft:horn_coral_fan",
    "minecraft:dead_tube_coral",
    "minecraft:dead_brain_coral",
    "minecraft:dead_bubble_coral",
    "minecraft:dead_fire_coral",
    "minecraft:dead_horn_coral",
    "minecraft:dead_tube_coral_fan",
    "minecraft:dead_brain_coral_fan",
    "minecraft:dead_bubble_coral_fan",
    "minecraft:dead_fire_coral_fan",
    "minecraft:dead_horn_coral_fan",

	-- Nether Plants
	"minecraft:warped_roots",
    "minecraft:nether_sprouts",
    "minecraft:twisting_vines",
    "minecraft:crimson_roots",
    "minecraft:weeping_vines",
})

-- Plants on a Block of Dirt
if (
	I:isOf(item, Items:get("minecraft:oak_sapling")) or
	I:isOf(item, Items:get("minecraft:spruce_sapling")) or
	I:isOf(item, Items:get("minecraft:birch_sapling")) or
	I:isOf(item, Items:get("minecraft:jungle_sapling")) or
	I:isOf(item, Items:get("minecraft:acacia_sapling")) or
	I:isOf(item, Items:get("minecraft:dark_oak_sapling")) or
	I:isOf(item, Items:get("minecraft:mangrove_propagule")) or
	I:isOf(item, Items:get("minecraft:cherry_sapling")) or
	I:isOf(item, Items:get("minecraft:pale_oak_sapling")) or
	I:isOf(item, Items:get("minecraft:azalea")) or
	I:isOf(item, Items:get("minecraft:flowering_azalea")) or
	I:isOf(item, Items:get("minecraft:short_grass")) or
	I:isOf(item, Items:get("minecraft:tall_grass")) or
	I:isOf(item, Items:get("minecraft:fern")) or
	I:isOf(item, Items:get("minecraft:large_fern")) or
	I:isOf(item, Items:get("minecraft:firefly_bush")) or
	I:isOf(item, Items:get("minecraft:bush")) or
	I:isOf(item, Items:get("minecraft:short_dry_grass")) or
	I:isOf(item, Items:get("minecraft:tall_dry_grass")) or
	I:isOf(item, Items:get("minecraft:dead_bush")) or
	I:isOf(item, Items:get("minecraft:dead_tube_coral")) or
	I:isOf(item, Items:get("minecraft:dead_brain_coral")) or
	I:isOf(item, Items:get("minecraft:dead_bubble_coral")) or
	I:isOf(item, Items:get("minecraft:dead_fire_coral")) or
	I:isOf(item, Items:get("minecraft:dead_horn_coral")) or
	I:isOf(item, Items:get("minecraft:dead_tube_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_brain_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_bubble_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_fire_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_horn_coral_fan")) or
	I:isOf(item, Items:get("minecraft:warped_roots")) or
	I:isOf(item, Items:get("minecraft:nether_sprouts")) or
	I:isOf(item, Items:get("minecraft:crimson_roots"))
) then
	M:moveY(matrices, 0.05)
	M:moveX(matrices, -0.1 * l)
	M:moveZ(matrices, 0.05)
	
	M:rotateX(matrices, -20)
	M:rotateY(matrices, 45)
	M:rotateZ(matrices, 5 * l)

	M:scale(matrices, 1.1, 1.1, 1.1)
end

-- Flowers
if (
	I:isOf(item, Items:get("minecraft:dandelion")) or
	I:isOf(item, Items:get("minecraft:poppy")) or
	I:isOf(item, Items:get("minecraft:blue_orchid")) or
	I:isOf(item, Items:get("minecraft:allium")) or
	I:isOf(item, Items:get("minecraft:azure_bluet")) or
	I:isOf(item, Items:get("minecraft:red_tulip")) or
	I:isOf(item, Items:get("minecraft:orange_tulip")) or
	I:isOf(item, Items:get("minecraft:white_tulip")) or
	I:isOf(item, Items:get("minecraft:pink_tulip")) or
	I:isOf(item, Items:get("minecraft:oxeye_daisy")) or
	I:isOf(item, Items:get("minecraft:cornflower")) or
	I:isOf(item, Items:get("minecraft:lily_of_the_valley")) or
	I:isOf(item, Items:get("minecraft:torchflower")) or
	I:isOf(item, Items:get("minecraft:cactus_flower")) or
	I:isOf(item, Items:get("minecraft:closed_eyeblossom")) or
	I:isOf(item, Items:get("minecraft:open_eyeblossom")) or
	I:isOf(item, Items:get("minecraft:wither_rose")) or
	I:isOf(item, Items:get("minecraft:sunflower")) or
	I:isOf(item, Items:get("minecraft:lilac")) or
	I:isOf(item, Items:get("minecraft:rose_bush")) or
	I:isOf(item, Items:get("minecraft:peony")) or
	I:isOf(item, Items:get("minecraft:pitcher_plant")) or
	I:isOf(item, Items:get("minecraft:big_dripleaf")) or
	I:isOf(item, Items:get("minecraft:small_dripleaf"))
	
) then
	M:moveX(matrices, 0 * l)
    M:moveY(matrices, 0)
	M:moveZ(matrices, 0.025)

    M:rotateX(matrices, 0)
	M:rotateY(matrices, 0)
	M:rotateZ(matrices, 0)

	M:scale(matrices, 1.1, 1.1, 1.1)
end

-- Corals
if (
	I:isOf(item, Items:get("minecraft:tube_coral")) or
	I:isOf(item, Items:get("minecraft:brain_coral")) or
	I:isOf(item, Items:get("minecraft:bubble_coral")) or
	I:isOf(item, Items:get("minecraft:fire_coral")) or
	I:isOf(item, Items:get("minecraft:horn_coral")) or
	I:isOf(item, Items:get("minecraft:tube_coral_fan")) or
	I:isOf(item, Items:get("minecraft:brain_coral_fan")) or
	I:isOf(item, Items:get("minecraft:bubble_coral_fan")) or
	I:isOf(item, Items:get("minecraft:fire_coral_fan")) or
	I:isOf(item, Items:get("minecraft:horn_coral_fan"))
) then
	M:moveX(matrices, -0.15 * l)
    M:moveY(matrices, 0.15)
	M:moveZ(matrices, 0.25)

    M:rotateX(matrices, -65)
	M:rotateY(matrices, 0)
	M:rotateZ(matrices, 0)
end

-- Seagrass
if (
	I:isOf(item, Items:get("minecraft:seagrass"))
) then
	M:moveX(matrices, -0.15 * l)
    M:moveY(matrices, 0.2)
	M:moveZ(matrices, 0.425)

    M:rotateX(matrices, -60)
	M:rotateY(matrices, 5 * l)
	M:rotateZ(matrices, 5 * l)

	M:scale(matrices, 0.9, 0.9, 0.9)
end

-- Kelp
if (
	I:isOf(item, Items:get("minecraft:kelp")) 
) then
	M:moveX(matrices, 0.05 * l)
    M:moveY(matrices, -0.05)
	M:moveZ(matrices, 0)

    M:rotateX(matrices, -20)
	M:rotateY(matrices, 8 * l)
	M:rotateZ(matrices, -10 * l)

	M:scale(matrices, 1.2, 1.2, 1.2)
end

-- Sugar Cane
if (
	I:isOf(item, Items:get("minecraft:sugar_cane")) 
) then
	M:moveX(matrices, 0.025 * l)
    M:moveY(matrices, 0)
	M:moveZ(matrices, -0.025)

    M:rotateX(matrices, 0)
	M:rotateY(matrices, 0 * l)
	M:rotateZ(matrices, 0 * l)

	M:scale(matrices, 0.9, 0.9, 0.9)
end

-- Lily Pad
if (
	I:isOf(item, Items:get("minecraft:lily_pad")) 
) then
	M:moveX(matrices, -0.15 * l)
    M:moveY(matrices, 0.1)
	M:moveZ(matrices, 0.15)

    M:rotateX(matrices, 0)
	M:rotateY(matrices, 0 * l)
	M:rotateZ(matrices, 90 * l)

	M:scale(matrices, 1.2, 1.2, 1.2)
end

-- Lily Pad
if (
	I:isOf(item, Items:get("minecraft:vine")) 
) then
	M:moveX(matrices, 0.05 * l)
    M:moveY(matrices, -0.025)
	M:moveZ(matrices, 0)

    M:rotateX(matrices, 10)
	M:rotateY(matrices, 10 * l)
	M:rotateZ(matrices, 0 * l)
end


-- Weeping Vines, Hanging Roots, Pale Hanging Moss
if (
	I:isOf(item, Items:get("minecraft:weeping_vines")) or
	I:isOf(item, Items:get("minecraft:hanging_roots")) or
	I:isOf(item, Items:get("minecraft:pale_hanging_moss"))

) then
	M:moveX(matrices, 0 * l)
    M:moveY(matrices, -0.25)
	M:moveZ(matrices, 0)

    M:rotateX(matrices, -90)
    M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle)
	M:rotateZ(matrices, ywAngle * 0.5, 0, -0.13, 0)
end

-- Spore Blossom
if (
	I:isOf(item, Items:get("minecraft:spore_blossom")) 

) then
    M:moveY(matrices, -0.2)
    M:moveX(matrices, 0 * l)
    M:rotateX(matrices, -70)
    M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle)
	M:rotateZ(matrices, ywAngle * 0.5, 0, -0.13, 0)
end