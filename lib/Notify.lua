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

function Notify:send(msg)
   tf_eval("/echo [CAMS] " .. msg)
   --print("[CAMS] Notify:send(): " .. msg)
end

function Notify:debug(msg)
   message = "DEBUG: " .. msg
   self:send(message)
end

function Notify:alert(msg)
   message = "ALERT: " .. msg
   self:send(message)
end

function Notify:warning(msg)
   message = "WARNING: " .. msg
   self:send(message)
end

function Notify:normal(msg)
   message = msg
   self:send(message)
end

function Notify:critical(msg)
   message = "CRITICAL: " .. msg
   self:send(message)
end

