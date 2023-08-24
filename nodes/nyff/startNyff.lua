local Node = require("class.Node")
local Choice = require("class.choice")
local class = require("libs.middleclass")

local START_ID <const> = "startNyff"

--Create the Start Node
---@diagnostic disable-next-line: undefined-field
local startNyff = Node:new(START_ID) ---@type Node
    startNyff.title = "Montanha de Nyff"   
    startNyff.description = "Esta frio a neve esta por todo lugar e o silencio esta ensurdecedor, vc percebe que esqueceu sua mochila em casa, sua unica comida eh uma batata..."
    startNyff.header =[[
    ███╗   ███╗ ██████╗ ███╗   ██╗████████╗ █████╗ ███╗   ██╗██╗  ██╗ █████╗ ███████╗    ██████╗ ███████╗    ███╗   ██╗██╗   ██╗███████╗███████╗
    ████╗ ████║██╔═══██╗████╗  ██║╚══██╔══╝██╔══██╗████╗  ██║██║  ██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝    ████╗  ██║╚██╗ ██╔╝██╔════╝██╔════╝
    ██╔████╔██║██║   ██║██╔██╗ ██║   ██║   ███████║██╔██╗ ██║███████║███████║███████╗    ██║  ██║█████╗      ██╔██╗ ██║ ╚████╔╝ █████╗  █████╗  
    ██║╚██╔╝██║██║   ██║██║╚██╗██║   ██║   ██╔══██║██║╚██╗██║██╔══██║██╔══██║╚════██║    ██║  ██║██╔══╝      ██║╚██╗██║  ╚██╔╝  ██╔══╝  ██╔══╝  
    ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║   ██║   ██║  ██║██║ ╚████║██║  ██║██║  ██║███████║    ██████╔╝███████╗    ██║ ╚████║   ██║   ██║     ██║     
    ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═════╝ ╚══════╝    ╚═╝  ╚═══╝   ╚═╝   ╚═╝     ╚═╝   
                                                        _    .  ,   .           .
                                                    *  / \_ *  / \_      _  *        *   /\'__        *
                                                      /    \  /    \,   ((        .    _/  /  \  *'.
                                                 .   /\/\  /\/ :' __ \_  `          _^/  ^/    `--.
                                                    /    \/  \  _/  \-'\      *    /.' ^_   \_   .'\  *
                                                   /\  .-   `. \/     \ /==~=-=~=-=-;.  _/ \ -. `_/   \
                                                  /  `-.__ ^   / .-'.--\ =-=~_=-=~=^/  _ `--./ .-'  `-
                                                /jgs     `.  / /       `.~-^=-=~=^=.-'      '-._ `._
    ]]
    startNyff.choices = {}
    --[[
    --Create the Choices
    table.insert(
        startNyff.choices,
        Choice:new(
        "startKalandra",
        "Para Praia Ensolarada"
        )
    )

    table.insert(
        startNyff.choices,
        Choice:new(
        "startNyff",
        "Para a Montanha Gelada"
        )
    )]]

return startNyff