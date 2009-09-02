--
-- Plugin
--

Plugin = {}
Plugin_mt = {}

function Plugin:new()
   class = {}
   class.whoami = "Plugin"
   class.version = "0.1.0"
   setmetatable(class, Plugin_mt)
   Plugin_mt.__index = Plugin
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Plugin:load()
end

-- Returns a version string
function Plugin:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Plugin:init()
end

function Plugin:get_whoami()
   return (self.whoami)
end

