--
-- Shrine
--

Shrine = {}
Shrine_mt = {}

function Shrine:new()
   class = {}
   class.whoami = "Shrine"
   class.version = "0.1.0"
   setmetatable(class, Shrine_mt)
   Shrine_mt.__index = Shrine
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Shrine:load()
end

-- Returns a version string
function Shrine:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Shrine:init()
end

function Shrine:get_whoami()
   return (self.whoami)
end

