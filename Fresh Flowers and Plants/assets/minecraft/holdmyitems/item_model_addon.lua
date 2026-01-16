local item = data.item
local player = data.player



if I:isOf(item, Items:get("minecraft:sea_pickle")) and P:isSubmergedInWater(player) then
    animator:moveY(0, 3, 0.19)
end