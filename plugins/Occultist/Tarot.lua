--
-- Tarot
--

Tarot = {}
Tarot_mt = {}

function Tarot:new()
   class = {}
   class.whoami = "Tarot"
   class.version = "0.1.0"
   setmetatable(class, Tarot_mt)
   Tarot_mt.__index = Tarot
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function Tarot:load()
end

-- Returns a version string
function Tarot:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function Tarot:init()
end

function Tarot:get_whoami()
   return (self.whoami)
end

