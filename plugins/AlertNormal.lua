--
-- AlertNormal
--

AlertNormal = {}
AlertNormal_mt = {}

function AlertNormal:new()
   class = {}
   class.whoami = "AlertNormal"
   class.version = "0.1.0"
   setmetatable(class, AlertNormal_mt)
   AlertNormal_mt.__index = AlertNormal
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function AlertNormal:load()
end

-- Returns a version string
function AlertNormal:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function AlertNormal:init()
end

function AlertNormal:get_whoami()
   return (self.whoami)
end

