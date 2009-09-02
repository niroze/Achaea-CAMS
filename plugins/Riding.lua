--
-- Riding
--

Riding = {}
Riding_mt = {}

function Riding:new()
   class = {}
   class.whoami = "Riding"
   class.version = "0.1.0"
   setmetatable(class, Riding_mt)
   Riding_mt.__index = Riding
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Riding:load()
end

-- Returns a version string
function Riding:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Riding:init()
end

function Riding:get_whoami()
   return (self.whoami)
end

