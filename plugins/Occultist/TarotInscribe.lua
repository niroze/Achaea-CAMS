--
-- TarotInscribe
--

TarotInscribe = {}
TarotInscribe_mt = {}

function TarotInscribe:new()
   class = {}
   class.whoami = "TarotInscribe"
   class.version = "0.1.0"
   setmetatable(class, TarotInscribe_mt)
   TarotInscribe_mt.__index = TarotInscribe
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function TarotInscribe:load()
end

-- Returns a version string
function TarotInscribe:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function TarotInscribe:init()
end

function TarotInscribe:get_whoami()
   return (self.whoami)
end

