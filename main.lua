local GameData = require("class.GameData")
local nodeLoader = require("modules.nodeLoader")
local utils = require("libs.utils")
local Engine = require("class.Engine")

utils.enableUtf8()

-- Create GameData

local myGameData = GameData:new() ---@type GameData
_G.game = myGameData --definindo game como singleton

--Load Nodes

nodeLoader.loadNodes()
 game.activeNode = nodeLoader.getInitialNode()

--Check for erros in nodeLoader
if nodeLoader.hasError then
    print("Erros encontrados no nodeLoader")
    os.exit()
end

--Start Engine

local myEngine = Engine:new() ---@type Engine
myEngine:runMainLoop()


