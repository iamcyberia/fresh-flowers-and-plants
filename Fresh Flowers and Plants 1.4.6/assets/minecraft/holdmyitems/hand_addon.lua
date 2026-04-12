local item = context.item
local matrices = context.matrices

if (
	I:isOf(item, Items:get("minecraft:weeping_vines")) or
	I:isOf(item, Items:get("minecraft:hanging_roots")) or
	I:isOf(item, Items:get("minecraft:pale_hanging_moss")) or
	I:isOf(item, Items:get("minecraft:spore_blossom")) 
) then
    M:moveY(matrices, 0.25)
    M:moveZ(matrices, -0.05)
end