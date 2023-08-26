local class = require("libs.middleclass")
local nodeLoader = require("modules.nodeLoader")
local utils = require("libs.utils")
local choice= require("class.choice")

---@class Engine
local Engine = class("Engine")

    function Engine:initialize()
    end

    function Engine:runMainLoop()
        

        while not game.isOver do
            os.execute("cls")
            local node = game.activeNode
            self:printNode(node)

            local validChoices = self:getValidChoices(node)

            self:showChoices(validChoices)

            local choiceId = self:askForInput(#validChoices) 
            
            print(validChoices[choiceId].destination) --DEBUG

            local choice = validChoices[choiceId]

            local destinationId = choice.destination
            local destinationNode = nodeLoader.getNode(destinationId)
             game.activeNode = destinationNode

            --game.isOver = true -- para encerrar o game 
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

    function Engine:askForInput(amount)
        while true do
            io.write("> ")
            local answerStr = io.read()
            local answer = tonumber(answerStr)
            local answerIsValid = answer ~= nil and answer >= 1 and answer <= amount
    
            if answerIsValid then
                return answer
            end
            io.write("Resposta invalida, tente novamente \n")
        end
       
    end

return Engine