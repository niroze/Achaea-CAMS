
Plugin = {}
Plugin_mt = {}

function Plugin:new()
   class = {}
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
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Plugin:init()
end
