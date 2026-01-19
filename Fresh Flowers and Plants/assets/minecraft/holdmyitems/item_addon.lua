-- Cyber and Sapling were here :3		toss maing into the pile to

local bl = context.bl
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
local handMirror = bl and 1 or -1

local time = P:getAge(player)



local function noBlocksPlease(blocks)
	for _, id in ipairs(blocks) do
		renderAsBlock:put(id, false)
	end
end

local function checkList(list)
	for _, entry in ipairs(list) do
		if I:isOf(item, Items:get(entry)) then
			return true
		end
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



-- // Great wall of common translations \\ --
local plantsOnDirt = {
	"minecraft:acacia_sapling",
	"minecraft:azalea",
	"minecraft:birch_sapling",
	"minecraft:bush",
	"minecraft:cherry_sapling",
	"minecraft:crimson_roots",
	"minecraft:dark_oak_sapling",
	"minecraft:dead_brain_coral",
	"minecraft:dead_brain_coral_fan",
	"minecraft:dead_bubble_coral",
	"minecraft:dead_bubble_coral_fan",
	"minecraft:dead_bush",
	"minecraft:dead_fire_coral",
	"minecraft:dead_fire_coral_fan",
	"minecraft:dead_horn_coral",
	"minecraft:dead_horn_coral_fan",
	"minecraft:dead_tube_coral",
	"minecraft:dead_tube_coral_fan",
	"minecraft:fern",
	"minecraft:firefly_bush",
	"minecraft:flowering_azalea",
	"minecraft:jungle_sapling",
	"minecraft:large_fern",
	"minecraft:mangrove_propagule",
	"minecraft:nether_sprouts",
	"minecraft:oak_sapling",
	"minecraft:pale_oak_sapling",
	"minecraft:short_dry_grass",
	"minecraft:short_grass",
	"minecraft:spruce_sapling",
	"minecraft:tall_dry_grass",
	"minecraft:tall_grass",
	"minecraft:warped_roots",
}

local flowers = {
	"minecraft:allium",
	"minecraft:azure_bluet",
	"minecraft:big_dripleaf",
	"minecraft:blue_orchid",
	"minecraft:cactus_flower",
	"minecraft:closed_eyeblossom",
	"minecraft:cornflower",
	"minecraft:dandelion",
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
	"minecraft:small_dripleaf",
	"minecraft:sunflower",
	"minecraft:torchflower",
	"minecraft:white_tulip",
	"minecraft:wither_rose",
}

local corals = {
	"minecraft:brain_coral",
	"minecraft:brain_coral_fan",
	"minecraft:bubble_coral",
	"minecraft:bubble_coral_fan",
	"minecraft:fire_coral",
	"minecraft:fire_coral_fan",
	"minecraft:horn_coral",
	"minecraft:horn_coral_fan",
	"minecraft:tube_coral",
	"minecraft:tube_coral_fan",
}

local vineStuff = {
	"minecraft:hanging_roots",
	"minecraft:pale_hanging_moss",
	"minecraft:weeping_vines",
}

-- // No common translations or just none at all \\ --
local otherStuff = {
	"minecraft:seagrass",
	"minecraft:kelp",
	"minecraft:sugar_cane",
	"minecraft:lily_pad",
	"minecraft:vine",
	"minecraft:spore_blossom",
	"minecraft:sea_pickle",
	"minecraft:bamboo",
	"minecraft:glow_lichen",
	"minecraft:sculk_vein",
	"minecraft:red_mushroom",
	"minecraft:brown_mushroom",
	"minecraft:crimson_fungus",
	"minecraft:warped_fungus",
	"minecraft:twisting_vines",
}

noBlocksPlease(plantsOnDirt)
noBlocksPlease(flowers)
noBlocksPlease(corals)
noBlocksPlease(vineStuff)
noBlocksPlease(otherStuff)



-- // Enourmous if statement of optimisation \\ --
if I:isEmpty(item) then
	return
elseif (checkList(plantsOnDirt)) then
	-- // Plants on a block of dirt \\ --

	M:moveY(matrices, 0.05)
	M:moveX(matrices, -0.1 * handMirror)
	M:moveZ(matrices, 0.05)

	M:rotateX(matrices, -20)
	M:rotateY(matrices, 45 * handMirror)
	M:rotateZ(matrices, 5 * handMirror)

	M:scale(matrices, 1.1, 1.1, 1.1)

	if I:isOf(item, Items:get("minecraft:firefly_bush")) then
		local aliveCount = 0
		for _, state in pairs(fireflyState) do
			if state then aliveCount = aliveCount + 1 end
		end

		if time >= fireflyDebounce and aliveCount < 10 then
			fireflyDebounce = time + math.random(40, 60)
			fireflyID = fireflyID + 1

			particleManager:addParticle(particles,
				false,
				0, 0.3, -0.04,
				0, 0, 0,
				0, 0, 0,
				0, 0, 0,
				0.3 + math.random() * 0.1,
				Texture:of("minecraft", "textures/particle/glowing_firefly.png"), "ITEM", hand, "OPACITY", "ADDITIVE", 30, 255, function(particle) particleTickerFirefly(particle, fireflyID) end)
		end
	end
elseif checkList(flowers) then
	-- // Flowers \\ --

	M:moveZ(matrices, 0.025)

	M:scale(matrices, 1.1, 1.1, 1.1)
elseif checkList(corals) then
	-- // Corals \\ --

	M:moveX(matrices, -0.15 * handMirror)
	M:moveY(matrices, 0.15)
	M:moveZ(matrices, 0.25)

	M:rotateX(matrices, -65)
elseif checkList(vineStuff) then
	-- // Weeping Vines, Hanging Roots, Pale Hanging Moss \\ --

	M:moveY(matrices, -0.25)

	M:rotateX(matrices, -90)
	M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle)
	M:rotateZ(matrices, ywAngle * 0.5, 0, -0.13, 0)
elseif I:isOf(item, Items:get("minecraft:seagrass")) then
	-- // Seagrass \\ --

	M:moveX(matrices, -0.15 * handMirror)
	M:moveY(matrices, 0.2)
	M:moveZ(matrices, 0.425)

	M:rotateX(matrices, -60)
	M:rotateY(matrices, 5 * handMirror)
	M:rotateZ(matrices, 5 * handMirror)

	M:scale(matrices, 0.9, 0.9, 0.9)
elseif I:isOf(item, Items:get("minecraft:kelp")) then
	-- // Kelp \\ --

	M:moveX(matrices, 0.05 * handMirror)
	M:moveY(matrices, -0.05)

	M:rotateX(matrices, -20)
	M:rotateY(matrices, 8 * handMirror)
	M:rotateZ(matrices, -10 * handMirror)

	M:scale(matrices, 1.2, 1.2, 1.2)
elseif I:isOf(item, Items:get("minecraft:sugar_cane")) then
	-- // Sugar Cane \\ --

	M:moveX(matrices, 0.025 * handMirror)
	M:moveZ(matrices, -0.025)

	M:scale(matrices, 0.9, 0.9, 0.9)
elseif I:isOf(item, Items:get("minecraft:lily_pad")) then
	-- // Lily Pad \\ --

	M:moveX(matrices, -0.15 * handMirror)
	M:moveY(matrices, 0.1)
	M:moveZ(matrices, 0.15)

	M:rotateZ(matrices, 90 * handMirror)

	M:scale(matrices, 1.2, 1.2, 1.2)
elseif I:isOf(item, Items:get("minecraft:vine")) then
	-- // Normal Vine \\ --

	M:moveX(matrices, 0.05 * handMirror)
	M:moveY(matrices, -0.025)

	M:rotateX(matrices, 10)
	M:rotateY(matrices, 10 * handMirror)
elseif I:isOf(item, Items:get("minecraft:spore_blossom")) then
	-- // Spore Blossom \\ --

	M:moveY(matrices, -0.2)
	M:rotateX(matrices, -70)
	M:rotateX(matrices, M:clamp(P:getPitch(player) / 2.5, -20, 90) + ptAngle)
	M:rotateZ(matrices, ywAngle * 0.5, 0, -0.13, 0)
elseif I:isOf(item, Items:get("minecraft:sea_pickle")) then
	M:scale(matrices, 1.2, 1.3, 1.2)
end