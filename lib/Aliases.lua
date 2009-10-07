-- 
-- Aliases wrapper class for TF
--

Aliases = {}
Aliases_mt = {}

function Aliases:new()
   class = {}
   setmetatable(class, Aliases_mt)
   Aliases_mt.__index = Aliases
   return (class)
end

-- Add an alias
function Aliases:add(name, action)
   CAMS.notify:debug("Aliases:add(name,action): {{" .. name .. "}} => {{" .. action .. "}}")
   CAMS:tf('/def cams_alias_' .. name .. ' = /calllua ' .. action .. ' %{*}')
end

-- Remove an alias
function Aliases:remove(name)
   CAMS.notify:debug("Aliases:remove(name): {{" .. name .. "}}")
   CAMS:tf('/purge cams_alias_' .. name)
end