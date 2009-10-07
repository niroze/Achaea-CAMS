-- 
-- Generic targeting
--

Targeting = {}
Targeting_mt = {}

function Targeting:new()
   class = {}
   class.target = ''
   setmetatable(class, Targeting_mt)
   Targeting_mt.__index = Targeting
   return (class)
end

function Targeting:set(who)
   CAMS.notify:debug('Targetting:set(who): who => {{' .. who .. '}}')
   self.target = who
end

function Targeting:get()
   CAMS.notify:debug('Targetting:get(): returning {{' .. self.target .. '}}')
   return (self.target)
end

function Targeting:clear()
   self.target = ''
end
