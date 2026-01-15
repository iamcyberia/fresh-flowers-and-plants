---Hold My Items API Library
---Provides item rendering and manipulation functions for custom addon support

---Item checking and manipulation API
---@class I
I = {}

---Check if an item matches a given item type
---@param item any Item object to check
---@param itemType any Item type to match against (from Items:get())
---@return boolean matches True if the item matches the type
function I:isOf(item, itemType) end

---Items registry API
---@class Items
Items = {}

---Get an item type by its identifier
---@param identifier string Item identifier in format "namespace:name" (e.g., "minecraft:oak_sapling")
---@return any itemType The item type object
function Items:get(identifier) end

---Matrix transformation API for positioning and rotating items
---@class M
M = {}

---Move the transformation matrix along the X axis
---@param matrices any The matrices object from context
---@param distance number Distance to move (positive = right, negative = left)
function M:moveX(matrices, distance) end

---Move the transformation matrix along the Y axis
---@param matrices any The matrices object from context
---@param distance number Distance to move (positive = up, negative = down)
function M:moveY(matrices, distance) end

---Move the transformation matrix along the Z axis
---@param matrices any The matrices object from context
---@param distance number Distance to move (positive = forward, negative = backward)
function M:moveZ(matrices, distance) end

---Move the transformation matrix along all axis
---@param matrices any The matrices object from context
---@param distanceX number
---@param distanceY number
---@param distanceZ number
function M:translate(matrices, distanceX, distanceY, distanceZ) end

---Rotate the transformation matrix around the X axis
---@param matrices any The matrices object from context
---@param degrees number Rotation in degrees
function M:rotateX(matrices, degrees) end

---Rotate the transformation matrix around the Y axis
---@param matrices any The matrices object from context
---@param degrees number Rotation in degrees
function M:rotateY(matrices, degrees) end

---Rotate the transformation matrix around the Z axis
---@param matrices any The matrices object from context
---@param degrees number Rotation in degrees
function M:rotateZ(matrices, degrees) end

---Rotate around an arbitrary axis
---@param matrices any The matrices object from context
---@param degrees number Rotation in degrees
---@param axisX number X component of rotation axis
---@param axisY number Y component of rotation axis
---@param axisZ number Z component of rotation axis
function M:rotateAxisAngle(matrices, degrees, axisX, axisY, axisZ) end

---Scale the transformation matrix
---@param matrices any The matrices object from context
---@param scaleX number X scale factor
---@param scaleY number Y scale factor
---@param scaleZ number Z scale factor
function M:scale(matrices, scaleX, scaleY, scaleZ) end

---Clamp a value between min and max
---@param value number Value to clamp
---@param min number Minimum value
---@param max number Maximum value
---@return number clamped The clamped value
function M:clamp(value, min, max) end

---Player information API
---@class P
P = {}

---Get the player's current age/ticks
---@param player any Player object from context
---@return number age Age in ticks
function P:getAge(player) end

---Get the player's pitch (looking up/down)
---@param player any Player object from context
---@return number pitch Pitch in degrees (-90 to 90)
function P:getPitch(player) end

---Get the player's yaw (looking left/right)
---@param player any Player object from context
---@return number yaw Yaw in degrees (0 to 360)
function P:getYaw(player) end

---Get the player's old pitch from previous frame
---@param player any Player object from context
---@return number pitchO Previous pitch in degrees
function P:getPitchO(player) end

---Get the player's old yaw from previous frame
---@param player any Player object from context
---@return number yawO Previous yaw in degrees
function P:getYawO(player) end

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
---@param self particleManager The particleManager object
---@param particles any Particles container from context
---@param hasPhysics boolean Whether the particle is affected by physics
---@param posX number Initial X position
---@param posY number Initial Y position
---@param posZ number Initial Z position
---@param deltaX number Initial X velocity
---@param deltaY number Initial Y velocity
---@param deltaZ number Initial Z velocity
---@param rotX number Initial X rotation
---@param rotY number Initial Y rotation
---@param rotZ number Initial Z rotation
---@param deltaRotX number Initial X rotation velocity
---@param deltaRotY number Initial Y rotation velocity
---@param deltaRotZ number Initial Z rotation velocity
---@param size number Particle size
---@param texture any Texture object from Texture:of()
---@param renderSpace any Context type (e.g., "ITEM")
---@param currentHand any Hand context
---@param lifetimeType string Lifetime type
---@param renderType string Render layer
---@param lifetime integer Total lifetime in ticks
---@param opacity integer Opacity (0-255)
---@param tickerFunction function|nil Optional callback function for particle updates
---@return any particle The created particle object
function particleManager:addParticle(particles, hasPhysics, posX, posY, posZ, deltaPosX, deltaPosY, deltaPosZ, rotX, rotY, rotZ, deltaRotX, deltaRotY, deltaRotZ, size, texture, renderSpace, currentHand, lifetimeType, renderType, lifetime, opacity, tickerFunction) end

---Block rendering control API
---@class renderAsBlock
renderAsBlock = {}

---Enable or disable block rendering for specific blocks
---@param blockId string Block identifier (e.g., "minecraft:oak_sapling")
---@param shouldRender boolean True to render as block, false to skip
function renderAsBlock:put(blockId, shouldRender) end

---Context object passed to addon functions
---@class Context
---@field hand any The hand context
---@field item any The current item being rendered
---@field matrices any Transformation matrices
---@field player any The player object
---@field mainHand boolean True if rendering the main hand
---@field particles any Particle system
---@field deltaTime number Time since last frame
---@field bl boolean Which hand the item is in (left / right, boolean)

---Global state object for storing persistent data
---Supports any dynamic properties (global.anyVariableName = value)
---@type table<string, any>
global = {}

---Local context variable passed to addon scripts
---@type Context
context = {}