# How to install
## Rojo
Clone the "src" folder into your directory and rename it LinkedList.
## Roblox Toolbox
Download the script [here](https://www.roblox.com/library/5823200713/LinkedList)

### API
```lua
-- Constructs a new linked list given a table of data
LinkedList.new(dataTable)

-- Removes node with given data
LinkedList:removeNode(value)

-- Removes the head of the list, and moves every node down
LinkedList:pop()

-- Adds a new node after the given node
LinkedList:insertNodeAfter(previousNode, data)

-- Adds a new node at the end of the list
LinkedList:insertNodeAtEnd(data)

-- Adds a new node at the start of the list
LinkedList:insertNodeAtFront(data)

-- Returns the head (start) node of the list
LinkedList:getHead()

-- Returns the tail (end) node of the list
LinkedList:getTail()

-- Returns the length of the list
LinkedList:getLength()
```
