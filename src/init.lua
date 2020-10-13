-- Constructs a SinglyLinkedList
-- @auth pashleyy
-- @classmod

local Node = require(script.Modules.Node)

local SinglyLinkedList = {}
SinglyLinkedList.ClassName = "SinglyLinkedList"
SinglyLinkedList.__index = SinglyLinkedList

-- Constructs a new SinglyLinkedList with given data
-- @param dataTable: table
-- @returns linkedList: SinglyLinkedList
function SinglyLinkedList.new(dataTable)
	local self = setmetatable({}, SinglyLinkedList)

	self.head = nil
	self.tail = nil
	
	self:generateNodes(dataTable)

	return self
end

-- Generates the Nodes from the DataTable stored
-- @param dataTable: table
function SinglyLinkedList:generateNodes(dataTable)
	local previousNode = nil

	for i = #dataTable, 1, -1 do
		local data = dataTable[i]
		local node = Node.new(data)

		if previousNode then
			node:setNext(previousNode)

			if i == 1 then
				-- It is the head
				self.head = node
			end
		else
			-- It is the tail
			self.tail = node
			node:setNext("Empty")
		end

		previousNode = node
	end
end

-- Sets the head of the linked list to the given node
-- @param head: Node
function SinglyLinkedList:setHead(head)
	self.head = head
end

-- Returns the start of the linked list
-- @return head: Node
function SinglyLinkedList:getHead()
	return self.head
end

-- Returns the end of the linked list
-- @return tail: Node
function SinglyLinkedList:getTail()
	return self.tail
end

-- Returns the node with the given value
-- @param value: any
-- @returns node: Node
function SinglyLinkedList:getNode(value)
	local function recurseNode(node)
		local thisValue = node:getValue()

		if thisValue == value then
			return node
		else
			if node:getNext() ~= "Empty" then
				recurseNode(node:getNext())
			else
				return nil
			end
		end
	end

	return recurseNode(self:getHead())	
end

-- Removes the node with the given value
-- @param value: any
function SinglyLinkedList:removeNode(value)
	local node = self:getNode(value)

	if node then
		local tempNext = node:getNext()
		node:setValue(node:getNext():getValue())
		node.next = tempNext:getNext()
	end
end

-- Adds a new node after the given previous node
-- @param prevNode: Node
-- @param data: any
function SinglyLinkedList:insertNodeAfter(prevNode, data)
	local node = Node.new(data)
	node:setNext(prevNode:getNext())
	prevNode:setNext(node)
end

-- Adds a new node at the end of the linkedlist
-- @param data: any
function SinglyLinkedList:insertNodeAtEnd(data)
	local tail = self:getTail()
	local node = Node.new(data)
	node:setNext("Empty")
	tail:setNext(node)
end

-- Adds a new node at the front of the linked list
-- @param data: any
function SinglyLinkedList:insertNodeAtFront(data)
	local head = self:getHead()
	local node = Node.new(data)

	node:setNext(head)
	self:setHead(node)
end

-- Removes the head of the list and decouples it
-- @returns head: Node
function SinglyLinkedList:pop()
	self.head = self.head:getNext()
end

-- Returns the length of the linked list
-- @returns length: int
function SinglyLinkedList:getLength()
	local len = 0
	
	local function recurseNode(node)
		if node:getNext() ~= "Empty" then
			len += 1
			recurseNode(node:getNext())
		end
	end

	recurseNode(self:getHead())

	return len
end


return SinglyLinkedList