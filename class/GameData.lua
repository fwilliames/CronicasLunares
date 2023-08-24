local class = require("libs.middleclass")
local Node = require("class.Node")

local GameData = class("GameData") --- @class GameData

function GameData:initialize()
    self.activeNode = nil ---@type Node
    self.isOver = false ---@type boolean
end

return GameData