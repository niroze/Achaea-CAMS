--
-- GaggingCombat
--

GaggingCombat = {}
GaggingCombat_mt = {}

function GaggingCombat:new()
   class = {}
   class.whoami = "GaggingCombat"
   class.version = "0.1.0"
   setmetatable(class, GaggingCombat_mt)
   GaggingCombat_mt.__index = GaggingCombat
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function GaggingCombat:load()
end

-- Returns a version string
function GaggingCombat:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function GaggingCombat:init()
end

function GaggingCombat:get_whoami()
   return (self.whoami)
end

