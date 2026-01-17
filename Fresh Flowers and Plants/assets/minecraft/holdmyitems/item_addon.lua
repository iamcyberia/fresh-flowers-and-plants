-- Cyber and Sapling were here :3		toss maing into the pile to

local hand = context.hand
local item = context.item
local matrices = context.matrices
local player = context.player
local mainHand = context.mainHand
local particles = context.particles
local deltaTime = context.deltaTime

global.pitchAngle = 0.0;
global.yawAngle = 0.0;
global.pitchAngleO = 0.0;
global.yawAngleO = 0.0;

global.maingDisableFireflies = true;
global.fireflyDebounce = 0;
global.fireflyID = 0;
global.fireflyState = {};

local ywAngle = (mainHand and yawAngle) or yawAngleO
local ptAngle = (mainHand and pitchAngle) or pitchAngleO

local time = P:getAge(player)

local handMirror = context.bl and 1 or -1



local function noBlocksPlease(blocks)
    for _, id in ipairs(blocks) do
        renderAsBlock:put(id, false)
    end
end

local function particleTickerFirefly(particle, id)
    local state = fireflyState[id]

    local jitterAmp = 0.002
    local jitterSpeed = 0.1

    if not state then
        state = {
            radius = 0.0015 + math.random() * 0.0025,
            angle = math.random() * 6.283,
            speed = 0.02 + math.random() * 0.01,
            axialTwist = 1 + math.random(),
            axialAmplitude = 0.001 + math.random() * 0.005,
            jitterPhaseX = math.random() * 6.283,
            jitterPhaseY = math.random() * 6.283,
            jitterPhaseZ = math.random() * 6.283,
            expirationDate = time + 250,
        }

        particle.dx = math.cos(state.angle) * state.radius
        particle.dy = math.sin(state.angle * state.axialTwist) * state.axialAmplitude
        particle.dz = math.sin(state.angle) * state.radius

        fireflyState[id] = state
    end

    state.angle = state.angle + state.speed * deltaTime * 30

    local orbitX = math.cos(state.angle) * state.radius
    local orbitY = math.sin(state.angle * state.axialTwist) * state.axialAmplitude
    local orbitZ = math.sin(state.angle) * state.radius

    state.jitterPhaseX = state.jitterPhaseX + jitterSpeed * deltaTime * 30
    state.jitterPhaseY = state.jitterPhaseY + jitterSpeed * deltaTime * 30
    state.jitterPhaseZ = state.jitterPhaseZ + jitterSpeed * deltaTime * 30

    particle.dx = orbitX + math.sin(state.jitterPhaseX) * jitterAmp
    particle.dy = orbitY + math.sin(state.jitterPhaseY) * jitterAmp
    particle.dz = orbitZ + math.sin(state.jitterPhaseZ) * jitterAmp

    if not I:isOf(context.item, Items:get("minecraft:firefly_bush")) then
        state.expirationDate = 0
        particle.dead = true
    end
end

-- Whatever you do, do not under any circumstances break this for loop, it WILL cause memoryleaks
-- unless you remove the entire firefly ticker function
for id, state in pairs(fireflyState) do
    if time >= state.expirationDate then
        fireflyState[id] = nil
    end
end

noBlocksPlease({

	-- Saplings
    "minecraft:acacia_sapling",
    "minecraft:birch_sapling",
    "minecraft:cherry_sapling",
    "minecraft:dark_oak_sapling",
    "minecraft:jungle_sapling",
    "minecraft:mangrove_propagule",
    "minecraft:oak_sapling",
    "minecraft:pale_oak_sapling",
    "minecraft:spruce_sapling",

	-- More Plants
	"minecraft:bamboo",
	"minecraft:vine",
    "minecraft:azalea",
    "minecraft:big_dripleaf",
    "minecraft:flowering_azalea",
    "minecraft:glow_lichen",
    "minecraft:hanging_roots",
    "minecraft:kelp",
    "minecraft:lily_pad",
    "minecraft:pale_hanging_moss",
    "minecraft:sculk_vein",
    "minecraft:sea_pickle",
    "minecraft:seagrass",
    "minecraft:small_dripleaf",
    "minecraft:spore_blossom",
    "minecraft:sugar_cane",

	-- Even More Plants
	"minecraft:short_grass",
    "minecraft:bush",
    "minecraft:dead_bush",
    "minecraft:fern",
    "minecraft:firefly_bush",
    "minecraft:large_fern",
    "minecraft:short_dry_grass",
    "minecraft:tall_dry_grass",
    "minecraft:tall_grass",

	-- Mushrooms
	"minecraft:red_mushroom",
    "minecraft:brown_mushroom",
    "minecraft:crimson_fungus",
    "minecraft:warped_fungus",

	-- Flowers
	"minecraft:dandelion",
    "minecraft:allium",
    "minecraft:azure_bluet",
    "minecraft:blue_orchid",
    "minecraft:cactus_flower",
    "minecraft:closed_eyeblossom",
    "minecraft:cornflower",
    "minecraft:lilac",
    "minecraft:lily_of_the_valley",
    "minecraft:open_eyeblossom",
    "minecraft:orange_tulip",
    "minecraft:oxeye_daisy",
    "minecraft:peony",
    "minecraft:pink_tulip",
    "minecraft:pitcher_plant",
    "minecraft:poppy",
    "minecraft:red_tulip",
    "minecraft:rose_bush",
    "minecraft:sunflower",
    "minecraft:torchflower",
    "minecraft:white_tulip",
    "minecraft:wither_rose",

	-- Corals
	"minecraft:tube_coral",
    "minecraft:brain_coral",
    "minecraft:brain_coral_fan",
    "minecraft:bubble_coral",
    "minecraft:bubble_coral_fan",
    "minecraft:dead_brain_coral",
    "minecraft:dead_brain_coral_fan",
    "minecraft:dead_bubble_coral",
    "minecraft:dead_bubble_coral_fan",
    "minecraft:dead_fire_coral",
    "minecraft:dead_fire_coral_fan",
    "minecraft:dead_horn_coral",
    "minecraft:dead_horn_coral_fan",
    "minecraft:dead_tube_coral",
    "minecraft:dead_tube_coral_fan",
    "minecraft:fire_coral",
    "minecraft:fire_coral_fan",
    "minecraft:horn_coral",
    "minecraft:horn_coral_fan",
    "minecraft:tube_coral_fan",

	-- Nether Plants
	"minecraft:warped_roots",
    "minecraft:crimson_roots",
    "minecraft:nether_sprouts",
    "minecraft:twisting_vines",
    "minecraft:weeping_vines",
})

-- Plants on a Block of Dirt
if (
	I:isOf(item, Items:get("minecraft:acacia_sapling")) or
	I:isOf(item, Items:get("minecraft:azalea")) or
	I:isOf(item, Items:get("minecraft:birch_sapling")) or
	I:isOf(item, Items:get("minecraft:bush")) or
	I:isOf(item, Items:get("minecraft:cherry_sapling")) or
	I:isOf(item, Items:get("minecraft:crimson_roots")) or
	I:isOf(item, Items:get("minecraft:dark_oak_sapling")) or
	I:isOf(item, Items:get("minecraft:dead_brain_coral")) or
	I:isOf(item, Items:get("minecraft:dead_brain_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_bubble_coral")) or
	I:isOf(item, Items:get("minecraft:dead_bubble_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_bush")) or
	I:isOf(item, Items:get("minecraft:dead_fire_coral")) or
	I:isOf(item, Items:get("minecraft:dead_fire_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_horn_coral")) or
	I:isOf(item, Items:get("minecraft:dead_horn_coral_fan")) or
	I:isOf(item, Items:get("minecraft:dead_tube_coral")) or
	I:isOf(item, Items:get("minecraft:dead_tube_coral_fan")) or
	I:isOf(item, Items:get("minecraft:fern")) or
	I:isOf(item, Items:get("minecraft:firefly_bush")) or
	I:isOf(item, Items:get("minecraft:flowering_azalea")) or
	I:isOf(item, Items:get("minecraft:jungle_sapling")) or
	I:isOf(item, Items:get("minecraft:large_fern")) or
	I:isOf(item, Items:get("minecraft:mangrove_propagule")) or
	I:isOf(item, Items:get("minecraft:nether_sprouts")) or
	I:isOf(item, Items:get("minecraft:oak_sapling")) or
	I:isOf(item, Items:get("minecraft:pale_oak_sapling")) or
	I:isOf(item, Items:get("minecraft:short_dry_grass")) or
	I:isOf(item, Items:get("minecraft:short_grass")) or
	I:isOf(item, Items:get("minecraft:spruce_sapling")) or
	I:isOf(item, Items:get("minecraft:tall_dry_grass")) or
	I:isOf(item, Items:get("minecraft:tall_grass")) or
	I:isOf(item, Items:get("minecraft:warped_roots"))
) then
	M:moveY(matrices, 0.05)
	M:moveX(matrices, -0.1 * handMirror)
	M:moveZ(matrices, 0.05)

	M:rotateX(matrices, -20)
	M:rotateY(matrices, 45 * handMirror)
	M:rotateZ(matrices, 5 * handMirror)

	M:scale(matrices, 1.1, 1.1, 1.1)

	if I:isOf(item, Items:get("minecraft:firefly_bush")) then
		local aliveCount = 0
		for particle, state in pairs(fireflyState) do
			if state then aliveCount = aliveCount + 1 end
		end

		if time >= fireflyDebounce and aliveCount < 10 then
			fireflyDebounce = time + math.random(40, 60)
			fireflyID = fireflyID + 1

			particleManager:addParticle(particles,
				false,
				0, --posX
				0.3, --posY
				-0.04, --posZ
				0, --deltaPosX
				0, --deltaPosY
				0, --deltaPosZ
				0, --rotX
				0, --rotY
				0, --rotZ
				0, --deltaRotX
				0, --deltaRotY
				0, --deltaRotZ
				0.3 + math.random() * 0.1, --size
				Texture:of("minecraft", "textures/particle/glowing_firefly.png"), "ITEM", hand, "OPACITY", "ADDITIVE", 30, 255, function(particle) particleTickerFirefly(particle, fireflyID) end)
		end
	end
end

-- Flowers
if (
	I:isOf(item, Items:get("minecraft:allium")) or
	I:isOf(item, Items:get("minecraft:azure_bluet")) or
	I:isOf(item, Items:get("minecraft:big_dripleaf")) or
	I:isOf(item, Items:get("minecraft:blue_orchid")) or
	I:isOf(item, Items:get("minecraft:cactus_flower")) or
	I:isOf(item, Items:get("minecraft:closed_eyeblossom")) or
	I:isOf(item, Items:get("minecraft:cornflower")) or
	I:isOf(item, Items:get("minecraft:dandelion")) or
	I:isOf(item, Items:get("minecraft:lilac")) or
	I:isOf(item, Items:get("minecraft:lily_of_the_valley")) or
	I:isOf(item, Items:get("minecraft:open_eyeblossom")) or
	I:isOf(item, Items:get("minecraft:orange_tulip")) or
	I:isOf(item, Items:get("minecraft:oxeye_daisy")) or
	I:isOf(item, Items:get("minecraft:peony")) or
	I:isOf(item, Items:get("minecraft:pink_tulip")) or
	I:isOf(item, Items:get("minecraft:pitcher_plant")) or
	I:isOf(item, Items:get("minecraft:poppy")) or
	I:isOf(item, Items:get("minecraft:red_tulip")) or
	I:isOf(item, Items:get("minecraft:rose_bush")) or
	I:isOf(item, Items:get("minecraft:small_dripleaf")) or
	I:isOf(item, Items:get("minecraft:sunflower")) or
	I:isOf(item, Items:get("minecraft:torchflower")) or
	I:isOf(item, Items:get("minecraft:white_tulip")) or
	I:isOf(item, Items:get("minecraft:wither_rose"))
) then
	M:moveZ(matrices, 0.025)

	M:scale(matrices, 1.1, 1.1, 1.1)
end

-- Corals
if (
	I:isOf(item, Items:get("minecraft:brain_coral")) or
	I:isOf(item, Items:get("minecraft:brain_coral_fan")) or
	I:isOf(item, Items:get("minecraft:bubble_coral")) or
	I:isOf(item, Items:get("minecraft:bubble_coral_fan")) or
	I:isOf(item, Items:get("minecraft:fire_coral")) or
	I:isOf(item, Items:get("minecraft:fire_coral_fan")) or
	I:isOf(item, Items:get("minecraft:horn_coral")) or
	I:isOf(item, Items:get("minecraft:horn_coral_fan")) or
	I:isOf(item, Items:get("minecraft:tube_coral")) or
	I:isOf(item, Items:get("minecraft:tube_coral_fan"))
) then
	M:moveX(matrices, -0.15 * handMirror)
    M:moveY(matrices, 0.15)
	M:moveZ(matrices, 0.25)

    M:rotateX(matrices, -65)
end

-- Seagrass
if (I:isOf(item, Items:get("minecraft:seagrass"))) then
	M:moveX(matrices, -0.15 * handMirror)
    M:moveY(matrices, 0.2)
	M:moveZ(matrices, 0.425)

    M:rotateX(matrices, -60)
	M:rotateY(matrices, 5 * handMirror)
	M:rotateZ(matrices, 5 * handMirror)

	M:scale(matrices, 0.9, 0.9, 0.9)
end

-- Kelp
if (I:isOf(item, Items:get("minecraft:kelp")) ) then
	M:moveX(matrices, 0.05 * handMirror)
    M:moveY(matrices, -0.05)

    M:rotateX(matrices, -20)
	M:rotateY(matrices, 8 * handMirror)
	M:rotateZ(matrices, -10 * handMirror)

	M:scale(matrices, 1.2, 1.2, 1.2)
end

-- Sugar Cane
if (I:isOf(item, Items:get("minecraft:sugar_cane")) ) then
	M:moveX(matrices, 0.025 * handMirror)
	M:moveZ(matrices, -0.025)

	M:scale(matrices, 0.9, 0.9, 0.9)
end

-- Lily Pad
if (I:isOf(item, Items:get("minecraft:lily_pad")) ) then
	M:moveX(matrices, -0.15 * handMirror)
    M:moveY(matrices, 0.1)
	M:moveZ(matrices, 0.15)

	M:rotateZ(matrices, 90 * handMirror)

	M:scale(matrices, 1.2, 1.2, 1.2)
end

-- Lily Pad
if (I:isOf(item, Items:get("minecraft:vine")) ) then
	M:moveX(matrices, 0.05 * handMirror)
    M:moveY(matrices, -0.025)

    M:rotateX(matrices, 10)
	M:rotateY(matrices, 10 * handMirror)
end

-- Weeping Vines, Hanging Roots, Pale Hanging Moss
if (
	I:isOf(item, Items:get("minecraft:hanging_roots")) or
	I:isOf(item, Items:get("minecraft:pale_hanging_moss")) or
	I:isOf(item, Items:get("minecraft:weeping_vines"))
) then
    M:moveY(matrices, -0.25)

    M:rotateX(matrices, -90)
    M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle)
	M:rotateZ(matrices, ywAngle * 0.5, 0, -0.13, 0)
end

-- Spore Blossom
if (I:isOf(item, Items:get("minecraft:spore_blossom"))) then
    M:moveY(matrices, -0.2)
    M:rotateX(matrices, -70)
    M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle)
	M:rotateZ(matrices, ywAngle * 0.5, 0, -0.13, 0)
end