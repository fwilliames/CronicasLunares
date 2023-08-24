local nodeLoader = {}

    --[[
        Variable that represents the initial node for navigation in the game.

        Type:
        - initialNode: An object of type Node.
    ]]
    local initialNode = nil ---@type Node

    --[[
        Variable that represents a dictionary of nodes with string keys.

        Type:
        - nodeDictionary: A table that associates strings with objects of type Node.
    ]]
    local nodeDictionay = {} ---@type table<string,Node>

    --[[
        Loads a node from a path and adds it to the node dictionary.

        Parameters:
        - path: The path to the node file.

        Usage:
        loadNode(path)
    ]]
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
    --[[
        Loads the game nodes and adds them to the node dictionary.

        Usage:
        nodeLoader.loadNodes()
    ]]
    function nodeLoader.loadNodes()
        nodeDictionay = {}

        --- Load initialNode
        initialNode = require("nodes.start")
        nodeDictionay[initialNode.id] = initialNode

        --Load others Nodes
        loadNode("nodes.nyff.startNyff")
        loadNode("nodes.kalandra.startKalandra")

        
    end

    --[[
        Gets the dictionary of loaded nodes.

        Returns:
        - A dictionary containing the loaded nodes.

        Usage:
        local nodes = nodeLoader.getNodes()
    ]]
    function nodeLoader.getNodes()
        return nodeDictionay 
        
    end

    --[[
        Gets a specific node based on its ID.

        Parameters:
        - nodeID: The ID of the node to retrieve.

        Returns:
        - The node corresponding to the ID.

        Usage:
        local node = nodeLoader.getNode(nodeID)
    ]]
    function nodeLoader.getNode(nodeID)
        return nodeDictionay[nodeID]
        
    end

    --[[
        Gets the loaded initial node.

        Returns:
        - The initial node.

        Usage:
        local initialNode = nodeLoader.getInitialNode()
    ]]
    function nodeLoader.getInitialNoder()
        return initialNode
    end

return nodeLoader    
