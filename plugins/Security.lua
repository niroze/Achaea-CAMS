--
-- Security
--

Security = {}
Security_mt = {}

function Security:new()
   class = {}
   class.whoami = "Security"
   class.version = "0.1.0"
   setmetatable(class, Security_mt)
   Security_mt.__index = Security
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Security:load()
end

-- Returns a version string
function Security:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Security:init()
end

function Security:get_whoami()
   return (self.whoami)
end

