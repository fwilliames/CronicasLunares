local GameData = require("class.GameData")
local nodeLoader = require("modules.nodeLoader")

-- Create GameData
local myGameData = GameData:new() ---@type GameData
_G.game = myGameData --definindo game como singleton

--Load Nodes

nodeLoader.loadNodes()

for id, node in pairs(nodeLoader.getNode()) do
    print(id,node.description)
end
