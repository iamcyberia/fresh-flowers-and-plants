global.pickleWater = 0.0;

local deltaTime = data.deltaTime
local mat = data.matrices
local item = data.item
local player = data.player

-- Sea Pickle
if (
    I:isOf(item, Items:get("minecraft:sea_pickle")) and not P:isSubmergedInWater(player)
) then
pickleWater = pickleWater - 0.08 * deltaTime * 30

animator:scale(0, 3, 1, M:clamp(Easings:easeInQuad(pickleWater), 0, 1), 1)
animator:scale(4, 11, 0, 0, 0)
elseif I:isOf(item, Items:get("minecraft:sea_pickle")) and P:isSubmergedInWater(player) then
    pickleWater = pickleWater + 0.08 * deltaTime * 30

    animator:scale(0, 3, 1, M:clamp(Easings:easeInQuad(pickleWater), 0, 1), 1)
end

pickleWater = M:clamp(pickleWater, 0, 1)