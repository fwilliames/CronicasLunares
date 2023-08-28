local Node = require("class.Node")
local Choice = require("class.choice")
local class = require("libs.middleclass")

local START_ID <const> = "nyffCongelou"

--Create the Start Node
local nyffCongelou = Node:new(START_ID) ---@type Node
    nyffCongelou.title = "Congelou"
    nyffCongelou.gameOver = true
    nyffCongelou.description = "%{cyan}O Frio estava instenso e voce morreu congelado"
    nyffCongelou.choices = {}
    --[[
    --Create the Choices
    table.insert(
        nyffCongelou.choices,
        Choice:new(
        "startKalandra",
        "Para Praia Ensolarada"
        )
    )

    table.insert(
        nyffCongelou.choices,
        Choice:new(
        "nyffCongelou",
        "O frio é psicologico"
        )
    )]]

return nyffCongelou