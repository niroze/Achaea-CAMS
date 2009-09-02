--
-- City
--

City = {}
City_mt = {}

function City:new()
   class = {}
   class.whoami = "City"
   class.version = "0.1.0"
   setmetatable(class, City_mt)
   City_mt.__index = City
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function City:load()
end

-- Returns a version string
function City:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function City:init()
end

function City:get_whoami()
   return (self.whoami)
end

