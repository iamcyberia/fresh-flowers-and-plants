local mainHand = data.mainHand
local bl = data.bl
local deltaTime = data.deltaTime
local hand = data.hand
local item = data.item
local particles = context.particles
local player = data.player

global.freshPlantPickleY = 0;
global.freshPlantSaplingSwayX = 0;
global.freshPlantSaplingSwayZ = 0;
global.freshPlantSaplingTopSwayX = 0;
global.freshPlantSaplingTopSwayY = 0;
global.freshTime = {R = 0, L = 0};
global.pitchAngle = 0;
global.pitchAngleO = 0;
global.yawAngle = 0;
global.yawAngleO = 0;

local clockSide = bl and "R" or "L"
freshTime[clockSide] = freshTime[clockSide] + deltaTime * 20
local time = freshTime[clockSide]

local ptAngle = mainHand and pitchAngle or pitchAngleO
local ywAngle = mainHand and yawAngle or yawAngleO



if I:isOf(item, Items:get("minecraft:sea_pickle")) then
    if P:isSubmergedInWater(player) then
        freshPlantPickleY = freshPlantPickleY + 0.2

        particleManager:addParticle(particles, false,
            0, 0.14, 0.06,
            0, 0, 0,
            0, 0, 0,
            0, 0, 0,
            1, Texture:of("minecraft", "textures/particle/pickle_glow.png"),
            "ITEM", hand, "SPAWN", "ADDITIVE",
            0, 133 + (15 * math.sin(time) * 0.2))
    else
        freshPlantPickleY = freshPlantPickleY - 0.1
    end
    freshPlantPickleY = M:clamp(freshPlantPickleY, 0, 1)

    animator:moveY(0, 3, Easings:easeOutBack(freshPlantPickleY) * 0.19)
elseif string.match(I:getName(item), "^minecraft:.*_sapling") or I:isOf(item, Items:get("minecraft:mangrove_propagule")) then
    local strength = 4
    local speed = 0.083
    local stiffness = 0.5

    if I:isOf(item, Items:get("minecraft:mangrove_propagule")) or I:isOf(item, Items:get("minecraft:dark_oak_sapling")) then
        strength = 2
        stiffness = 0.25
    end

    freshPlantSaplingSwayX = math.sin(time * (speed * 0.7) + 1.7) * (strength * 0.5)
    freshPlantSaplingSwayZ = math.sin(time * speed) * strength

    freshPlantSaplingSwayTopX = math.sin(time * (speed * 1.9) + 2.3) * (strength * 0.25)
    freshPlantSaplingSwayTopZ = math.sin(time * (speed * 2.2) + 0.8) * (strength * 0.35)

    animator:rotateX(0, 7, freshPlantSaplingSwayX + ((ywAngle * -1) * stiffness), 0.5, 0.37, 0.5)
    animator:rotateZ(0, 7, freshPlantSaplingSwayZ + (ptAngle * stiffness), 0.5, 0.37, 0.5)

    animator:rotateX(4, 7, freshPlantSaplingSwayTopX + ((ywAngle * -1) * stiffness), 0.5, 0.73, 0.5)
    animator:rotateZ(4, 7, freshPlantSaplingSwayTopZ + (ptAngle * stiffness), 0.5, 0.73, 0.5)
end