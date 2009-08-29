-- 
-- Trigger wrapper class for TF
--

Trigger = {}
Trigger_mt = {}

function Trigger:new()
   class = {}
   setmetatable(class, Trigger_mt)
   Trigger_mt.__index = Trigger
   return (class)
end

-----------------------------------------------------------------------
-- Add trigger
-- 	name:                   name of the trigger (required)
--	group:                  group name 
--	is_enabled:             1/0 (defaulted to 1)
--	glob:                   matching string glob (required)
--	action:			what lua method to call (required)
--	times:			how many times to keep alive (defaults to permanent)
--	priority:		positive integer, 1 to 1000, default 100
-----------------------------------------------------------------------
function Trigger:add(name, group, is_enabled, glob, action, times, priority, from)
end

-- Remove trigger by name
function Trigger:remove(name)
end

-- Remove triggers by group
function Trigger:remove_group(group)
end

-- Disable trigger by name
function Trigger:disable(name)
end

-- Disable triggers by group
function Trigger:disable_group(group)
end

-- Enable trigger by name
function Trigger:enable(name)
end

-- Enable triggers by group
function Trigger:enable_group(group)
end

-- Change trigger action, by name
function Trigger:change_action(name, action)
end