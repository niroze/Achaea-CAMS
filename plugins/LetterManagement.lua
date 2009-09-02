--
-- LetterManagement
--

LetterManagement = {}
LetterManagement_mt = {}

function LetterManagement:new()
   class = {}
   class.whoami = "LetterManagement"
   class.version = "0.1.0"
   setmetatable(class, LetterManagement_mt)
   LetterManagement_mt.__index = LetterManagement
   return (class)
end


--
-- If this plugin should load
-- Returns: 1 for true, 0 for false
--
function LetterManagement:load()
end

-- Returns a version string
function LetterManagement:get_version()
   return (self.version)
end

-- Called when the plugin is initialized by CAMS (NOT when it is loaded)
function LetterManagement:init()
end

function LetterManagement:get_whoami()
   return (self.whoami)
end

