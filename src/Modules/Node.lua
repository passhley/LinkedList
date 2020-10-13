-- Creates a node for a linked list
-- @auth pashleyy
-- @classmod

local Node = {}
Node.ClassName = "Node"
Node.__index = Node

-- Constructs a new node with it's data
-- @param data: any
-- @returns node: Node
function Node.new(data)
	return setmetatable({
		value = data
	}, Node)
end

-- Sets the node's next to the given node
-- @param next: Node
function Node:setNext(next)
	self.next = next
end

-- Returns the next node in the list
-- @returns next: Node
function Node:getNext()
	return self.next
end

-- Sets the nodes value to new value
-- @param value: any
function Node:setValue(value)
	self.value = value
end

-- Returns the nodes value
-- @returns data: any
function Node:getValue()
	return self.value
end


return Node