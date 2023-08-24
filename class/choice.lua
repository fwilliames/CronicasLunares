local class = ("libs.middleclass")

local Choice = class("Choice") ---@class Choice

    function Choice:initialize()
        self.description = nil ---@type string
        self.destination = nil ---@type string
        self.condition = nil 
        
    end
    
    --Get and Set methods

    function Choice:getDescription()
        return self.description
    end

    function Choice:setDescription(newDescription)
        self.description = newDescription
    end

    function Choice:getDestination()
        return self.destination
    end

    function Choice:setdestination(newDestination)
        self.destination = newDestination
    end

    function Choice:getCondition()
        return self.condition
    end

    function Choice:setCondition(newCondition)
        self.condition = newCondition
    end

    ---Choices's class Methods

    --[[
        Checks if the choice has an associated condition.

        Returns:
        - true if the choice has a condition, otherwise, false.

        Usage:
        if choice:hasCondition() then
            -- Do something if the choice has a condition
        end
    ]]
    function Choice:hasCondition()
    return self:getCondition() ~= nil  
    end

    --[[
        Executes the condition associated with the choice.

        Returns:
        - true if the condition is met, otherwise, false.

        Usage:
        if choice:runCondition() then
            -- Do something if the condition is met
        end
    ]]
    function Choice:runCondition()
        
        return true
    end


return Choice