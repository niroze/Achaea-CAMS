--
-- Clans
--

Clans = {}
Clans_mt = {}

function Clans:new()
   class = {}
   class.whoami = "Clans"
   class.version = "0.1.0"
   setmetatable(class, Clans_mt)
   Clans_mt.__index = Clans
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Clans:load()
end

-- Returns a version string
function Clans:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Clans:init()
end

function Clans:get_whoami()
   return (self.whoami)
end

