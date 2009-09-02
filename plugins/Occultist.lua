--
-- Occultist
--

Occultist = {}
Occultist_mt = {}

function Occultist:new()
   class = {}
   class.whoami = "Occultist"
   class.version = "0.1.0"
   setmetatable(class, Occultist_mt)
   Occultist_mt.__index = Occultist
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Occultist:load()
end

-- Returns a version string
function Occultist:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Occultist:init()
end

function Occultist:get_whoami()
   return (self.whoami)
end

