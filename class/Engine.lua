local class = require("libs.middleclass")
local nodeLoader = require("modules.nodeLoader")
local utils = require("libs.utils")
local choice= require("class.choice")

---@class Engine
local Engine = class("Engine")

    function Engine:initialize()
    end

    function Engine:runMainLoop()
        local node = game.activeNode

        while not game.isOver do
            self:printNode(node)

            local validChoices = self:getValidChoices(node)

            self:showChoices(validChoices)
            
            game.isOver = true -- para encerrar o game 
        end

       
    end

    function Engine:printNode(node)
        if node.header then
            utils.cardLimite()
            print()
            print(node.header)
        end
        
        print(node.title)
        print(node.description)
        utils.cardLimite()
        
    end
    
    function Engine:getValidChoices(node)
        local result = {}
        for _, choice in pairs(node.choices) do
            if (not choice.hasCondition) or (choice.hasCondition and choice.runCondition()) then 
                    table.insert(result, choice)
                end
            end
        return result     
    end

    function Engine:showChoices(listChoices)
        for i, choice in pairs(listChoices) do
            print(
                string.format("%d) %s", i, choice.description) 
            )
        end

    end

return Engine