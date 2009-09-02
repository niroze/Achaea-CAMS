--
-- Occultism
--

Occultism = {}
Occultism_mt = {}

function Occultism:new()
   class = {}
   class.whoami = "Occultism"
   class.version = "0.1.0"
   setmetatable(class, Occultism_mt)
   Occultism_mt.__index = Occultism
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Occultism:load()
end

-- Returns a version string
function Occultism:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Occultism:init()
end

function Occultism:get_whoami()
   return (self.whoami)
end

