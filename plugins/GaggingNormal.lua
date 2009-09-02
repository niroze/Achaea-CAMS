--
-- GaggingNormal
--

GaggingNormal = {}
GaggingNormal_mt = {}

function GaggingNormal:new()
   class = {}
   class.whoami = "GaggingNormal"
   class.version = "0.1.0"
   setmetatable(class, GaggingNormal_mt)
   GaggingNormal_mt.__index = GaggingNormal
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function GaggingNormal:load()
end

-- Returns a version string
function GaggingNormal:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function GaggingNormal:init()
end

function GaggingNormal:get_whoami()
   return (self.whoami)
end

