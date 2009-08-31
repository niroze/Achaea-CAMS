-- 
-- Generic targeting
--

Target = {}
Target_mt = {}

function Target:new()
   class = {}
   class.target = ""
   setmetatable(class, Target_mt)
   Target_mt.__index = Target
   return (class)
end

function Target:set(who)
   self.target = who
end

function Target:get()
   return (self.target)
end

function Target:clear()
   self.target = ""
end
