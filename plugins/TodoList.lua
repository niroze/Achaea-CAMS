--
-- TodoList
--

TodoList = {}
TodoList_mt = {}

function TodoList:new()
   class = {}
   class.whoami = "TodoList"
   class.version = "0.1.0"
   setmetatable(class, TodoList_mt)
   TodoList_mt.__index = TodoList
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function TodoList:load()
end

-- Returns a version string
function TodoList:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function TodoList:init()
end

function TodoList:get_whoami()
   return (self.whoami)
end

