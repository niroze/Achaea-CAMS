-- 
-- Help class, provide help system to all who register
--

Help = {}
Help_mt = {}

function Help:new()
   class = {}
   setmetatable(class, Help_mt)
   Help_mt.__index = Help
   return (class)
end

function Help:init()
   -- Populate sqlite db with help files
   -- Create alias
end

--
-- Process string coming from user
-- Command syntax:  /camshelp <searchstring>
-- * If nothing is found by name, then do a search (similar to IRE's functionality)
--
function Help:process(str)
end
