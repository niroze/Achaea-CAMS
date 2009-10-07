--
-- Tattoos
--

Tattoos = {}
Tattoos_mt = {}

function Tattoos:new()
   class = {}
   class.whoami = "Tattoos"
   class.version = "0.1.0"
   setmetatable(class, Tattoos_mt)
   Tattoos_mt.__index = Tattoos
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Tattoos:load()
   return (1)
end

-- Returns a version string
function Tattoos:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Tattoos:init()
   -- Setup alias for /tattoos command
end

function Tattoos:get_whoami()
   return (self.whoami)
end

function process_command (str)
   CAMS.notify:debug(self.whoami .. ":process_command(str): str => {{" .. str .. "}}")   
end
