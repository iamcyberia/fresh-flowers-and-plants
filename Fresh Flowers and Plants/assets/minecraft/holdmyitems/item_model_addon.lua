local bl = data.bl
local item = data.item
local player = data.player
local deltaTime = data.deltaTime

global.freshTime = {R = 0, L = 0};
global.freshPlantPickleY = 0;
global.freshPlantSaplingSwayX = 0;
global.freshPlantSaplingSwayZ = 0;
global.freshPlantSaplingTopSwayX = 0;
global.freshPlantSaplingTopSwayY = 0;

local clockSide = bl and "R" or "L"
freshTime[clockSide] = freshTime[clockSide] + deltaTime * 20
local time = freshTime[clockSide]



if I:isOf(item, Items:get("minecraft:sea_pickle")) then
    if P:isSubmergedInWater(player) then
        freshPlantPickleY = freshPlantPickleY + 0.1
    else
        freshPlantPickleY = freshPlantPickleY - 0.1
    end
    freshPlantPickleY = M:clamp(freshPlantPickleY, 0, 1)

    animator:moveY(0, 3, Easings:easeOutBounce(freshPlantPickleY) * 0.19)
end



if string.match(I:getName(item), "^minecraft:.*_sapling") or I:isOf(item, Items:get("minecraft:mangrove_propagule")) then
    local strength = 4
    local speed = 0.083

    if I:isOf(item, Items:get("minecraft:mangrove_propagule")) or I:isOf(item, Items:get("minecraft:dark_oak_sapling")) then
        strength = 2
    end

    freshPlantSaplingSwayX = math.sin(time * (speed * 0.7) + 1.7) * (strength * 0.5)
    freshPlantSaplingSwayZ = math.sin(time * speed) * strength

    freshPlantSaplingSwayTopX = math.sin(time * (speed * 1.9) + 2.3) * (strength * 0.25)
    freshPlantSaplingSwayTopZ = math.sin(time * (speed * 2.2) + 0.8) * (strength * 0.35)

    animator:rotateX(0, 7, freshPlantSaplingSwayX, 0.5, 0.37, 0.5)
    animator:rotateZ(0, 7, freshPlantSaplingSwayZ, 0.5, 0.37, 0.5)

    animator:rotateX(4, 7, freshPlantSaplingSwayTopX, 0.5, 0.73, 0.5)
    animator:rotateZ(4, 7, freshPlantSaplingSwayTopZ, 0.5, 0.73, 0.5)
end