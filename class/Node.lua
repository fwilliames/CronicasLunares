local class = ("libs.middleclass")

local Node = class("Node") ---@class Node

function Node:initialize(newId)
    self.id = newId --- @type string
    self.title = nil --- @type string
    self.description = nil --- @type string
    self.header = nil --- @type string
    self.choices = {} ---@type Choice{}
    
end

--Get and Set methods
function Node:getId()
    return self.id
end

function Node:setId(newId)
    self.id = newId
end

function Node:getTitle()
    return self.title
end

function Node:setTitle(newTitle)
    self.title = newTitle
end

function Node:getDescription()
    return self.description
end

function Node:setDescription(newDescription)
    self.description = newDescription
end

function Node:getHeader()
    return self.header
end

function Node:setHeader(newHeader)
    self.header = newHeader
end

function Node:getChoices()
    return self.choices
end

function Node:setChoices(newChoices)
    self.choices = newChoices
end

return Node