---Convenient helpers for inspecting and manipulating ItemStacks and rendering-related flags used by the mod
---@class itemUtilities
I = {}

---Check if an item matches a given item type
---@param stack any Item stack to check
---@param itemType any Item type to match against (from Items:get())
---@return boolean matches True if the item matches the type
function I:isOf(stack, itemType) end

---Check if an item is in a given tag
---@param stack any Item stack to check
---@param tag string Tag to check if item is in (from Tags:getVanillaTag() or Tags:getFabricTag())
---@return boolean matches True if the item is in the tag
function I:isIn(stack, tag) end

---Check if your holding nothing
---@param stack any Item stack to check
---@return boolean state True if your holding nothing
function I:isEmpty(stack) end

---idk i never used it
---@param stack any Item stack to check
---@return any noIdea I never used this, i genuinely have no idea what the fuck this returns
function I:getUseAction(stack) end

---The identifier of the item your holding (e.g., "minecraft:sea_pickle")
---@param stack any Item stack to check
---@return string name
function I:getName(stack) end

---The actual name of the item your holding (e.g., "Sea Pickle" or if renamed in an anvil "A Pickle or something")
---@param stack any Item stack to check
---@return string name
function I:getActualName(stack) end

---idk i never used it
---@param stack any Item stack to check
---@return any noIdea I never used this, could be anything, probably a number tho if you use your head
function I:getAttackDamage(stack) end

---If the item is a charged crossbow or something?? 😭
---@param stack any Item stack to check
---@return boolean probably I never used this, but again, if you use your head you should come to the same conclution as me
function I:isChargedCrossbow(stack) end

---If its throwable ig
---@param stack any Item stack to check
---@return boolean useHead Im just guessing at this point and if i ever find up im NOT remembering to update this shit
function I:isThrowable(stack) end



---Items registry API
---@class itemRegistry
Items = {}

---Get an item by identifier
---@param identifier string Item by identifier (e.g., "minecraft:oak_sapling")
---@return any item Item by identifier
function Items:get(identifier) end



---Obtain TagKey<Item> entries for vanilla or Fabric tags
---@class itemTags
Tags = {}

---@param id string Tag name (e.g., "swords")
---@return any key Vanilla item-tag key
function Tags:getVanillaTag(id) end

---@param id string Tag name (e.g., "swords")
---@return any key Fabric item-tag key
function Tags:getFabricTag(id) end



---Matrix transforms for the current MatrixStack and common math helpers
---@class matrixMathUtils
M = {}

---Scale the transformation MatrixStack
---@param matrices any
---@param scaleX number X scale factor
---@param scaleY number Y scale factor
---@param scaleZ number Z scale factor
function M:scale(matrices, scaleX, scaleY, scaleZ) end

---Move the transformation MatrixStack along the X axis
---@param matrices any
---@param amount number Distance to move (positive = right, negative = left)
function M:moveX(matrices, amount) end

---Move the transformation MatrixStack along the Y axis
---@param matrices any
---@param amount number Distance to move (positive = up, negative = down)
function M:moveY(matrices, amount) end

---Move the transformation MatrixStack along the Z axis
---@param matrices any
---@param amount number Distance to move (positive = forward, negative = backward)
function M:moveZ(matrices, amount) end

---Move the transformation MatrixStack along all axis
---@param matrices any
---@param amountX number
---@param amountY number
---@param amountZ number
function M:translate(matrices, amountX, amountY, amountZ) end

---Rotate item around the X axis
---@param matrices any
---@param degrees number Rotation in degrees
---@param originX number|nil Optional pivot point X position
---@param originY number|nil Optional pivot point Y position
---@param originZ number|nil Optional pivot point Z position
function M:rotateX(matrices, degrees, originX, originY, originZ) end

---Rotate item around the Y axis
---@param matrices any
---@param degrees number Rotation in degrees
---@param originX number|nil Optional pivot point X position
---@param originY number|nil Optional pivot point Y position
---@param originZ number|nil Optional pivot point Z position
function M:rotateY(matrices, degrees, originX, originY, originZ) end

---Rotate item around the Z axis
---@param matrices any
---@param degrees number Rotation in degrees
---@param originX number|nil Optional pivot point X position
---@param originY number|nil Optional pivot point Y position
---@param originZ number|nil Optional pivot point Z position
function M:rotateZ(matrices, degrees, originX, originY, originZ) end

---Shear the transformation MatrixStack
---@param matrices any
---@param amountX number
---@param amountY number
---@param amountZ number
function M:shear(matrices, amountX, amountY, amountZ) end

---Clamp a value between min and max
---@param value number Value to clamp
---@param min number Minimum value
---@param max number Maximum value
---@return number clamped The clamped value
function M:clamp(value, min, max) end



---Read the client player's state, motion, and equipment for driving animations
---@class playerInfo
P = {}

---@param player any Player object from context or data
---@return boolean state
function P:isSneaking(player) end

---@param player any Player object from context or data
---@return boolean state
function P:isOnGround(player) end

---@param player any Player object from context or data
---@return boolean state
function P:isSwimming(player) end

---@param player any Player object from context or data
---@return boolean state
function P:isClimbing(player) end

---@param player any Player object from context or data
---@return boolean state
function P:isCrawling(player) end

---@param player any Player object from context or data
---@return boolean state
function P:isSubmergedInWater(player) end

---@param player any Player object from context or data
---@return boolean state
function P:isUsingItem(player) end



---Get the player's X coordinate
---@param player any Player object from context or data
---@return number pos
function P:getX(player) end

---Get the player's Y coordinate
---@param player any Player object from context or data
---@return number pos
function P:getY(player) end

---Get the player's Z coordinate
---@param player any Player object from context or data
---@return number pos
function P:getZ(player) end

---Get the player's speed on the X axis
---@param player any Player object from context or data
---@return number speed
function P:getXSpeed(player) end

---Get the player's speed on the Y axis
---@param player any Player object from context or data
---@return number speed
function P:getYSpeed(player) end

---Get the player's speed on the Z axis
---@param player any Player object from context or data
---@return number speed
function P:getZSpeed(player) end

---Get the player's total speed
---@param player any Player object from context or data
---@return number speed
function P:getSpeed(player) end



---Get the player's yaw (looking left/right)
---@param player any Player object from context or data
---@return number yaw Yaw in degrees (-inf to inf)
function P:getYaw(player) end

---Get the player's pitch (looking up/down)
---@param player any Player object from context or data
---@return number pitch Pitch in degrees
function P:getPitch(player) end



---Get the current item in the player's mainhand
---@param player any Player object from context or data
---@return string item
function P:getMainItem(player) end

---Get the current item in the player's offhand
---@param player any Player object from context or data
---@return string item
function P:getOffhandItem(player) end


---@param player any Player object from context or data
function P:getActiveHand(player) end



---Get the player's current age/ticks
---@param player any Player object from context
---@return number age Age in ticks
function P:getAge(player) end

---Check if item is currently cooling down
---@param item any The item you want to check
---@param player any Player object from context
---@return boolean state
function P:isItemCoolingDown(item, player) end

---The amount of times the player has swung something
---@param player any Player object from context
---@return number amount
function P:getSwingCount(player) end



---Play client-side sounds by vanilla sound id
---@class sounds
S = {}

---Play a sound
---@param sound string The sound id to play (e.g., "entity.player.levelup")
---@param volume number The volume to play the sound at
function S:playSound(sound, volume) end



---Texture loading API
---@class Texture
Texture = {}

---Load a texture for rendering
---@param namespace string Texture namespace (e.g., "minecraft")
---@param path string Texture path (e.g., "textures/particle/glowing_firefly.png")
---@return any texture Texture object for use in particle rendering
function Texture:of(namespace, path) end

---Particle manager API for creating and managing particles
---@class particleManager
particleManager = {}

---Add a new particle to the scene
---@param particles any particles variable from context or data
---@param hasPhysics boolean Whether the particle is affected by physics (gravity)
---@param posX number Initial X position
---@param posY number Initial Y position
---@param posZ number Initial Z position
---@param deltaPosX number X position particle will move toward over its lifetime
---@param deltaPosY number Y position particle will move toward over its lifetime
---@param deltaPosZ number Z position particle will move toward over its lifetime
---@param rotX number Initial X rotation
---@param rotY number Initial Y rotation
---@param rotZ number Initial Z rotation
---@param deltaRotX number X rotation particle will move toward over its lifetime
---@param deltaRotY number Y rotation particle will move toward over its lifetime
---@param deltaRotZ number Z rotation particle will move toward over its lifetime
---@param size number Particle size
---@param texture any Texture object from Texture:of()
---@param renderSpace any Render space ("ITEM", "SCREEN")
---@param currentHand any Hand context
---@param lifetimeType string Lifetime type
---@param renderType string Render type
---@param lifetime integer Total lifetime in ticks
---@param opacity integer Opacity (0-255)
---@param tickerFunction function|nil Optional callback function for particle updates
function particleManager:addParticle(particles, hasPhysics, posX, posY, posZ, deltaPosX, deltaPosY, deltaPosZ, rotX, rotY, rotZ, deltaRotX, deltaRotY, deltaRotZ, size, texture, renderSpace, currentHand, lifetimeType, renderType, lifetime, opacity, tickerFunction) end

---Block rendering control API
---@class renderAsBlock
renderAsBlock = {}

---Enable or disable block rendering for specific blocks
---@param blockId string Block identifier (e.g., "minecraft:oak_sapling")
---@param shouldRender boolean True to render as block, false to skip
function renderAsBlock:put(blockId, shouldRender) end

---Container for all HMI variables
---@class context
---@field hand any The hand context
---@field item any The current item being rendered
---@field matrices any Transformation matrices
---@field player any The player object
---@field mainHand boolean True if rendering the main hand
---@field particles any Particle system
---@field deltaTime number Time since last frame
---@field bl boolean Which hand the item is in (left / right, boolean)

---Container for all HMI variables (model part animations)
---@class data
---@field hand any The hand context
---@field item any The current item being rendered
---@field matrices any Transformation matrices
---@field player any The player object
---@field mainHand boolean True if rendering the main hand
---@field particles any Particle system
---@field deltaTime number Time since last frame
---@field bl boolean Which hand the item is in (left / right, boolean)

---Global state object for storing data
---@class global
global = {}

---Container for all HMI variables
---@type context
context = {}

---Container for all HMI variables (model part animations)
---@type data
data = {}