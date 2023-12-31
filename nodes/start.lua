local Node = require("class.Node")
local Choice = require("class.choice")
local class = require("libs.middleclass")

local START_ID <const> = "start"

--Create the Start Node
---@diagnostic disable-next-line: undefined-field
local startNode = Node:new(START_ID) ---@type Node
    startNode.description = "Em uma bela manha ensolarada vc acorda para embarcar em uma nova aventura. Uma importante decisao deve ser tomada. Para onde vc vai?"
    startNode.header =[[%{blue}
         ██████╗██████╗  ██████╗ ███╗   ██╗██╗ ██████╗ █████╗ ███████╗    ██╗     ██╗   ██╗███╗   ██╗ █████╗ ██████╗ ███████╗███████╗
        ██╔════╝██╔══██╗██╔═══██╗████╗  ██║██║██╔════╝██╔══██╗██╔════╝    ██║     ██║   ██║████╗  ██║██╔══██╗██╔══██╗██╔════╝██╔════╝
        ██║     ██████╔╝██║   ██║██╔██╗ ██║██║██║     ███████║███████╗    ██║     ██║   ██║██╔██╗ ██║███████║██████╔╝█████╗  ███████╗
        ██║     ██╔══██╗██║   ██║██║╚██╗██║██║██║     ██╔══██║╚════██║    ██║     ██║   ██║██║╚██╗██║██╔══██║██╔══██╗██╔══╝  ╚════██║
        ╚██████╗██║  ██║╚██████╔╝██║ ╚████║██║╚██████╗██║  ██║███████║    ███████╗╚██████╔╝██║ ╚████║██║  ██║██║  ██║███████╗███████║
         ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝
    ]]

    startNode.title = "Uma nova Aventura"
    startNode.choices = {}

    --Create the Choices
    table.insert(
        startNode.choices,
        Choice:new( 
        "kalandra.startKalandra",
        "Para Praia Ensolarada"
        )
    )

    table.insert(
        startNode.choices,
        Choice:new(
        "nyff.startNyff",
        "Para a Montanha Gelada"
        )
    )
    

return startNode