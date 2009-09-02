--
-- Domination
--

Domination = {}
Domination_mt = {}

function Domination:new()
   class = {}
   class.whoami = "Domination"
   class.version = "0.1.0"
   setmetatable(class, Domination_mt)
   Domination_mt.__index = Domination
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Domination:load()
end

-- Returns a version string
function Domination:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Domination:init()
end

function Domination:get_whoami()
   return (self.whoami)
end

