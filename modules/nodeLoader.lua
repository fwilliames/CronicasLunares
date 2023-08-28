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
    local nodeDictionary = {} ---@type table<string,Node>

    local hasError = false

    --[[ 
        Loads the game nodes and adds them to the node dictionary.

        This function loads the initial node and additional nodes specified in the code, adding them to the node
        dictionary for later use. It also checks the validity of the choices' destinations and logs warnings for
        any inconsistencies.

        Usage:
        nodeLoader.loadNodes()
    ]]
    local function loadNode(path)
        local success , nodeOrErr = pcall(function ()
            return require(path)
        end)

        if not success then
            warn("Falha ao carregar o node " .. path .. ". O arquivo nao foi encontrado")
            hasError = true
            return nil
        end

        local node = nodeOrErr ---@type Node
        if nodeDictionary[node.id] ~= nil then
            warn("Falha ao carregar o node " .. path .. "O ID" .. node.id .. "Ja esta registrado")
            hasError = true
            return nil
        end
        nodeDictionary[node.id] = node
        return node
    end

    
    
    local function loadNodesFromChoices(parentNode)
        for _, choice in pairs(parentNode.choices) do
            local destinationId = choice:getDestination()
            if not nodeDictionary[destinationId] then 
                local childNode  = loadNode("nodes." .. destinationId)
                if childNode then
                    loadNodesFromChoices(childNode)
                end
            end
        end
    end
    --[[
        Loads the game nodes and adds them to the node dictionary.

        Usage:
        nodeLoader.loadNodes()
    ]]
    function nodeLoader.loadNodes()
        nodeDictionary = {}

        --- Load initialNode
        initialNode = require("nodes.start")
        nodeDictionary[initialNode.id] = initialNode

        --Load others Nodes
        --loadNode("nodes.nyff.startNyff")
        --loadNode("nodes.kalandra.startKalandra")
        --loadNode("nodes.nyff.nyffCongelou")
        loadNodesFromChoices(initialNode)
        


        for id, node in pairs(nodeDictionary) do
            for _, choice in pairs(node.choices) do
                local destinationId = choice:getDestination()
                local destinationNode = nodeDictionary[destinationId]
                if destinationNode == nil then
                    warn(
                        string.format("Uma das escolhas do node %s tem um destino inexistente: %s",node.id, destinationId)
                    )
                    hasError = true
                end
            end
        end     
    end

    --[[
        Gets the dictionary of loaded nodes.

        Returns:
        - A dictionary containing the loaded nodes.

        Usage:
        local nodes = nodeLoader.getNodes()
    ]]
    function nodeLoader.getNodes()
        return nodeDictionary 
        
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
        return nodeDictionary[nodeID]
        
    end

    --[[
        Gets the loaded initial node.

        Returns:
        - The initial node.

        Usage:
        local initialNode = nodeLoader.getInitialNode()
    ]]
    function nodeLoader.getInitialNode()
        return initialNode
    end

    --[[ 
        Checks if there is an error condition during node loading.
        
        This function returns a boolean value indicating whether an error condition occurred during the process
        of loading nodes.

        Returns:
        - hasError: A boolean value indicating if an error occurred during node loading.
    ]]
    function nodeLoader.hasError()
        return hasError 
    end

return nodeLoader    
