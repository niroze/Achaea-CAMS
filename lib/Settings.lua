-- 
-- Generic targeting
--

Settings = {}
Settings_mt = {}

function Settings:new()
   class = {}
   setmetatable(class, Settings_mt)
   Settings_mt.__index = Settings
   return (class)
end

function Settings:load()
end

function Settings:clear()
end

function Settings:reload()
   self:clear()
   self:load()
end

function Settings:set(key, value)
end

function Settings:get(key)
end