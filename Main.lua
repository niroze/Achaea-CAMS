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

	-- Connect and initialize database
	self:load_database()

	-- Load plugins
	self:load_plugins()
end

-- Ensure all directories are correct and permissions are kosher, etc
function Main:sanity_check() 
end

-- Connect to the SQLite3 Database and store the connection on this class
function Main:load_database()
end

-- Load all loadable plugins
function Main:load_plugins()
	plugin_root = ROOT .. "plugins/"
	for plugin_file in io.popen("ls " .. plugin_root):lines() do
		if string.find(plugin_file,"Security.lua$") then 
			plugin_file_path = plugin_root .. plugin_file
			plugin_name = string.gsub(plugin_file, '.lua', '')
			plugin_file_code = loadfile(plugin_file_path)
			plugin_file_code() -- load it into global namespace
			plugin_loader_code = loadstring('PLUGINS["' .. plugin_name .. '"]  = ' .. plugin_name .. ':new()')
			plugin_loader_code() -- create a new instance of the plugin
			if PLUGINS[plugin_name]:load() == 1 then
		  	self.plugins[plugin_name] = PLUGINS[plugin_name]
		  	print ("Plugin Loaded: " .. plugin_name .. " v" .. self.plugins[plugin_name]:get_version())
			end -- if
	  end -- if
	end -- for
end

m = Main:new()
m:init()