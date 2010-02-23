-- 
-- Triggers wrapper class for TF
--

Triggers = {}
Triggers_mt = {}

function Triggers:new()
   class = {}
   class.dbconn = CAMS:get_database()
   setmetatable(class, Triggers_mt)
   Triggers_mt.__index = Triggers
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
--	priority:		positive integer, 1 to 1000, default 500
-----------------------------------------------------------------------
function Triggers:add(name, group, is_enabled, glob, action, times, priority, from)

   if is_enabled ~= 1 then is_enabled = 0 end
   if priority > 1000 then priority = 1000 end
   if priority < 1 then priority = 1 end
   if priority == '' then priority = 500 end
   if times == '' then times = 0 end
   if group == '' then group = 'default' end

   -- TF command
   local tf_command = '/def -t"' .. glob .. '" -n' .. times .. ' -p' .. priority  ..' cams_trig_' .. group .. '_' .. name .. ' = /calllua ' .. action .. ' %{*}'
   CAMS:tf(tf_command)

   -- Insert into databse
   local trig_insert_sql = string.format([[
					      insert into triggers (
						 trig_name,trig_group, trig_is_enabled, trig_glob, 
						 trig_action, trig_times, trig_priority, trig_from
					      ) values (
						 '%s', '%s', '%i','%s',
						 '%s', '%i', '%i', '%s'
					      )
					]],
					name, group, is_enabled, glob,
					action, times, priority, from
				     )
   self.dbconn:execute(sql_trig_insert)
end


-- Remove trigger by name
function Triggers:remove(name)
   -- Find record in triggers table
   local trig_select_sql = string.format("select * from triggers where name = '%s'", name)
   local trig_select_cur = self.dbconn:execute(sql_trig_select)
   local trig_select_row = cur:fetch ({}, "a")
   trig_select_cur:close()    

   -- Generate macro name
   local def_name = "cams_trig_" .. trig_select_row.trig_group .. '_' .. trig_select_row.trig_name


   -- Execute /purge
   local tf_command = "/purge " .. def_name
   CAMS:tf(tf_command)
end

-- Remove triggers by group
function Triggers:remove_group(group)
   -- Find names of triggers
   -- call self:remove on each name
end

-- Disable trigger by name
function Triggers:disable(name)
end

-- Disable triggers by group
function Triggers:disable_group(group)
end

-- Enable trigger by name
function Triggers:enable(name)
end

-- Enable triggers by group
function Triggers:enable_group(group)
end

-- Change trigger action, by name
function Triggers:change_action(name, action)
end