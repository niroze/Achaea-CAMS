-- 
-- Prompt detection and notification 
-- 1) detect prompt
-- 2) notify plugins that request prompt information via registering with this class
--


Prompt = {}
Prompt_mt = {}

function Prompt:new()
   class = {}
   class.registered = {}
   class.prompt_glob = ""
   class.whoami = "Prompt"
   class.version = "0.1.0"
   setmetatable(class, Prompt_mt)
   Prompt_mt.__index = Prompt
   return (class)
end

function Prompt:set(prompt_glob)
   self.prompt_glob = prompt_glob
end

function Prompt:get()
   return (self.prompt_glob)
end

-- Called after prompt_glob is set
function Prompt:init()
   -- Initialize trigger
   Trigger:add("Prompt_detect", "Prompt", 1, self.prompt_glob, 'Prompt:received %{*}', 0, 100, 'Prompt')
end

-- 
function Prompt:set_and_init(prompt_glob)
   self:set(prompt_glob)
   self:init()
end


-- Called when prompt trigger gets a successful match
function Prompt:received(prompt_string)
   for i, plugin in ipairs (self.registered) do
      plugin:received_prompt(prompt_string)
   end
end

--
-- Called by plugins to register to receive the prompt
-- plugin: 'self' from the plugin, so can just call the function directly from here (saves from having to execute loadstring
--
function Prompt:register(plugin)
   local i = self.registered.last
   if i == self.registered.first then i = 0 end
   i = i + 1
   self.registered[i] = plugin
   CAMS:notify:debug(self:get_whoami() .. ' v' ..  self:get_version() .. ': Plugin registered: ' .. plugin:get_whoami())
end

function Prompt:get_whoami()
   return (self.whoami)
end

function Prompt:get_version()
   return (self.version)
end
