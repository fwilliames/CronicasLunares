local class = require("libs.middleclass")
local nodeLoader = require("modules.nodeLoader")
local utils = require("libs.utils")
local choice= require("class.choice")

---@class Engine
local Engine = class("Engine")

    function Engine:initialize()
    end

    --[[ 
        Runs the main game loop that handles player interaction and navigation between nodes.
        
        This function continuously displays the content of the current node, shows the available choices
        to the player, and handles their input to navigate to the next node.

        The loop continues until the game is over.

        Parameters:
        None

        Returns:
        None
    ]]
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

    --[[ 
        Displays the content of a given node, including its header if available.
        
        This function prints the header (if provided), title, description, and card limit around the content.

        Parameters:
        - node: The node to display.

        Returns:
        None
    ]]
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
    
    --[[ 
        Retrieves the valid choices available for a given node.
        
        This function iterates through the choices of the provided node, checks if each choice has a condition,
        and if it does, evaluates the condition. If a choice has no condition or its condition evaluates to true,
        the choice is considered valid and added to the result.

        Parameters:
        - node: The node for which to retrieve valid choices.

        Returns:
        - result: A table containing the valid choices.
    ]]
    function Engine:getValidChoices(node)
        local result = {}
        for _, choice in pairs(node.choices) do
            if (not choice.hasCondition) or (choice.hasCondition and choice.runCondition()) then 
                    table.insert(result, choice)
                end
            end
        return result     
    end

    --[[ 
        Displays the list of available choices to the player.
        
        This function iterates through the provided list of choices and prints each choice's description along
        with its corresponding index.

        Parameters:
        - listChoices: The list of choices to display.

        Returns:
        None
    ]]
    function Engine:showChoices(listChoices)
        for i, choice in pairs(listChoices) do
            print(
                string.format("%d) %s", i, choice.description) 
            )
        end

    end

    --[[ 
        Asks the player for input and validates the response.
        
        This function prompts the player for input and validates whether the entered value is a valid number within
        the specified range. The function continues to prompt the player until a valid input is received.

        Parameters:
        - amount: The upper limit of the valid input range.

        Returns:
        - answer: The valid input received from the player.
    ]]
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