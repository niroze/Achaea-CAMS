--
-- Everything
--

Everything = {}
Everything_mt = {}

function Everything:new()
   class = {}
   class.whoami = "Everything"
   class.version = "0.1.0"
   setmetatable(class, Everything_mt)
   Everything_mt.__index = Everything
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Everything:load()
end

-- Returns a version string
function Everything:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Everything:init()
end

function Everything:get_whoami()
   return (self.whoami)
end

