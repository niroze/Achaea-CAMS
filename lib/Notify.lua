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

function Notify:debug(msg)
   if DEBUG == 1 then
      message = "DEBUG: " .. msg
      tf_eval("/echo -p @{Cyellow,Cbgblue}[CAMS]@{Cblack,Cbgblack} @{Cblack,Cbggreen}" .. msg)
   end
end

function Notify:alert(msg)
   message = "ALERT: " .. msg
   tf_eval("/echo -p @{Cyellow,Cbgblue}[CAMS]@{Cblack,Cbgblack} @{Cred,Cbgblack}" .. msg)
end

function Notify:warning(msg)
   message = "WARNING: " .. msg
   tf_eval("/echo -p @{Cyellow,Cbgblue}[CAMS]@{Cblack,Cbgblack} @{Cyellow,Cbgblack}" .. msg)
end

function Notify:normal(msg)
   message = msg
   tf_eval("/echo -p @{Cyellow,Cbgblue}[CAMS]@{Cblack,Cbgblack} @{Cgreen,Cbgblack}" .. msg)
end

function Notify:critical(msg)
   message = "CRITICAL: " .. msg
   tf_eval("/echo -p @{Cyellow,Cbgblue}[CAMS]@{Cblack,Cbgblack} @{Cwhite,Cbgred}" .. msg)
end

