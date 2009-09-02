--
-- Logging
--

Logging = {}
Logging_mt = {}

function Logging:new()
   class = {}
   class.whoami = "Logging"
   class.version = "0.1.0"
   setmetatable(class, Logging_mt)
   Logging_mt.__index = Logging
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Logging:load()
end

-- Returns a version string
function Logging:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Logging:init()
end

function Logging:get_whoami()
   return (self.whoami)
end

