ROOT = "/Users/christopherhumphries/Achaea/Lua/CAMS/"
Main = {}
Main_mt = {}
PLUGINS = {}

function Main:new()
	 class = {}
	 class.plugins = {}
	 setmetatable(class, Main_mt)
	 Main_mt.__index = Main
	 return(class)
end

function Main:init() 
	 -- Sanity check
	 self:sanity_check()

	 -- Load plugins
	 self:load_plugins()
end

-- Ensure all directories are correct and permissions are kosher, etc
function Main:sanity_check() 
end

function Main:load_plugins()
	 plugin_root = ROOT .. "plugins/"
	 for i in io.popen("ls " .. plugin_root):lines() do
	     if string.find(i,"Security.lua$") then 
	     	plugin_file = plugin_root .. i
		plugin_name = i
		plugin_name = string.gsub(plugin_name, '.lua', '')
		plugin = loadfile(plugin_file)
		plugin()
		plugin_loader = loadstring('PLUGINS["' .. plugin_name .. '"]  = ' .. plugin_name .. ':new()')
		plugin_loader()
		if PLUGINS[plugin_name]:load() == 1 then
		   self.plugins[plugin_name] = PLUGINS[plugin_name]
		   print ("Plugin: " .. i .. ": Loaded")
		end		
	     end
	 end
end

m = Main:new()
m:init()