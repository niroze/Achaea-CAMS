--
-- AlertCombat
--

AlertCombat = {}
AlertCombat_mt = {}

function AlertCombat:new()
   class = {}
   class.whoami = "AlertCombat"
   class.version = "0.1.0"
   setmetatable(class, AlertCombat_mt)
   AlertCombat_mt.__index = AlertCombat
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function AlertCombat:load()
end

-- Returns a version string
function AlertCombat:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function AlertCombat:init()
end

function AlertCombat:get_whoami()
   return (self.whoami)
end

