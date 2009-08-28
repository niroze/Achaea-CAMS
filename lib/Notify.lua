-- 
-- Notify class, send /echo notices to TF
--

Notify = {}
Notify_mt = {}

function Notify:new()
   class = {}
   setmetatable(class, Notify_mt)
   Notify_mt.__index = Notify
   return (class)
end

function Notify:send(what)
	--tf_eval("/echo " .. what)
	print("Notify:send(): " .. what)
end

function Notify:debug(what)
	message = "DEBUG: " .. what
	self:send(message)
end

function Notify:alert(what)
	message = "ALERT: " .. what
	self:send(message)
end

function Notify:warning(what)
	message = "WARNING: " .. what
	self:send(message)
end

function Notify:normal(what)
	message = what
	self:send(message)
end

function Notify:critical(what)
	message = "CRITICAL: " .. what
	self:send(message)
end