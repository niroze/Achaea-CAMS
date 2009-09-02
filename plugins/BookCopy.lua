--
-- Copy pages from one journal/manuscript to another
--

BookCopy = {}
BookCopy_mt = {}

function BookCopy:new()
   class = {}
   class.whoami = "BookCopy"
   class.version = "0.1.0"
   setmetatable(class, BookCopy_mt)
   BookCopy_mt.__index = BookCopy
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function BookCopy:load()
   return (true)
end

-- Returns the class name as a string
function BookCopy:get_whoami()
   return (self.whoami)
end

-- Returns a version string
function BookCopy:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function BookCopy:init()
end

