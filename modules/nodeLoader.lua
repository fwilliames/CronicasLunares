local nodeLoader = {}
local initialNode = nil ---@type Node

local nodeDictionay = {} ---@type table<string,Node>

local function loadNode(path)
    local node = require(path)

    if node == nil then
        warn("Falha ao carregar, o node nao existe")
        return
    end

    if nodeDictionay[node.id] ~= nil then
        warn("Falha ao carregar, o node ja existe")
        return
    end

    nodeDictionay[node.id] = node
    
end
    ---Load all the nodes internally
    function nodeLoader.loadNodes()
        nodeDictionay = {}

        --- Load initialNode
        initialNode = require("nodes.start")
        nodeDictionay[initialNode.id] = initialNode

        --Load others Nodes
        loadNode("nodes.nyff.startNyff")
        loadNode("nodes.kalandra.startKalandra")

        
    end

    ---Return all nodes created by this script
    function nodeLoader.getNodes()
        return nodeDictionay 
        
    end

    ---Return the nodeID's associated node
    function nodeLoader.getNode(nodeID)
        return nodeDictionay(nodeID)
        
    end

    function nodeLoader.getInitialNoder()
        return initialNode
    end


return nodeLoader    
