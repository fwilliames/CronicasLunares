local class = ("libs.middleclass")

local GameData = class("GameData") --- @class GameData

function GameData:initialize()
    self.activeNode = nil ---@type Node
    self.isOver = false ---@type boolean
end

return GameData