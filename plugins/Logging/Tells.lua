--
-- Tells
--

Tells = {}
Tells_mt = {}

function Tells:new()
   class = {}
   class.whoami = "Tells"
   class.version = "0.1.0"
   setmetatable(class, Tells_mt)
   Tells_mt.__index = Tells
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Tells:load()
end

-- Returns a version string
function Tells:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Tells:init()
end

function Tells:get_whoami()
   return (self.whoami)
end

