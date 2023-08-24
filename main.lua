local GameData = require("class.GameData")
local nodeLoader = require("modules.nodeLoader")

-- Create GameData
---@diagnostic disable-next-line: undefined-field
local myGameData = GameData:new() ---@type GameData
_G.game = myGameData --definindo game como singleton

--Load Nodes

nodeLoader.loadNodes()

for id, node in pairs(nodeLoader.getNodes()) do
    print(id,node.title)
end
