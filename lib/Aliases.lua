-- 
-- Aliases wrapper class for TF
--

Alias = {}
Alias_mt = {}

function Alias:new()
	 class = {}
	 setmetatable(class, Alias_mt)
	 Alias_mt.__index = Alias
	 return (class)
end

-- Add an alias
function Alias:add(name, action)
end

-- Remove an alias
function Alias:remove(name)
end