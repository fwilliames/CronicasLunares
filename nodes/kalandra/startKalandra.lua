local Node = require("Classs.Node")
local Choice = require("Classs.choice")
local class = ("libs.middleclass")

local START_ID <const> = "startKalandra"

--Create the Start Node
local startKalandra = Node:new(startID) ---@type Node
    startKalandra.title = "Praias de Kalandra"   
    startKalandra.description = "As ondas dancam e as brisas voam enquanto o sol te acolhe com um calor agradavel. Eh um lugar belo como dizem as lendas. Porem algo esta errado... nao tem ninguem aqui"
    startKalandra.header =[[
██████╗ ██████╗  █████╗ ██╗ █████╗ ███████╗    ██████╗ ███████╗    ██╗  ██╗ █████╗ ██╗      █████╗ ███╗   ██╗██████╗ ██████╗  █████╗ 
██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝    ██║ ██╔╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔══██╗
██████╔╝██████╔╝███████║██║███████║███████╗    ██║  ██║█████╗      █████╔╝ ███████║██║     ███████║██╔██╗ ██║██║  ██║██████╔╝███████║
██╔═══╝ ██╔══██╗██╔══██║██║██╔══██║╚════██║    ██║  ██║██╔══╝      ██╔═██╗ ██╔══██║██║     ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██╔══██║
██║     ██║  ██║██║  ██║██║██║  ██║███████║    ██████╔╝███████╗    ██║  ██╗██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝██║  ██║██║  ██║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝    ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

                                            _\/_                 |                _\/_
                                            /o\\             \       /            //o\
                                             |                 .---.                |
                                            _|_______     --  /     \  --     ______|__
                                                    `~^~^~^~^~^~^~^~^~^~^~^~`
                                                        jgs
    ]]
    startKalandra.choices = {}
    --[[
    --Create the Choices
    table.insert(
        startKalandra.choices,
        Choice:new(
        "startKalandra",
        "Para Praia Ensolarada"
        )
    )

    table.insert(
        startKalandra.choices,
        Choice:new(
        "startKalandra",
        "Para a Montanha Gelada"
        )
    )]]

return startKalandra