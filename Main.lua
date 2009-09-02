------------------------------------------------------------------------
-- ** ** CHANGE ME ** ** CHANGE ME ** ** CHANGE ME ** ** CHANGE ME ** **
------------------------------------------------------------------------
ROOT_PATH = "/Users/christopherhumphries/Achaea/Lua/CAMS/"
------------------------------------------------------------------------
-- ** ** CHANGE ME ** ** CHANGE ME ** ** CHANGE ME ** ** CHANGE ME ** **
------------------------------------------------------------------------



-- Setup the package.path to include all our files for require
package.path = package.path .. ';' 
   .. ROOT_PATH .. 'lib/?.lua' .. ';'            -- CAMS libraries
   .. ROOT_PATH .. 'lib_external/?.lua' .. ';'   -- 3rd party libraries
   .. ROOT_PATH .. 'config/?.lua' .. ';'         -- Configs (baseline variables defined)
   .. ROOT_PATH .. 'plugins/?.lua'               -- Plugins

	    
-- Non-local requirements
require "luasql.sqlite3"  -- Database connectivity (store state, basically)

-- Local requirements
require "Triggers"        -- TF trigger wrapper
require "Aliases"         -- TF "alias" wrapper
require "Settings"        -- CAMS settings (global and plugin use)
require "Notify"          -- TF echo wrappers, colored notices (alert, debug, etc)


-- Globals
DATABASE_ROOT_PATH = ROOT_PATH .. "database/"
DATABASE_FILENAME = DATABASE_ROOT_PATH .. "CAMS.db"
PLUGINS = {}


-- Main
Main = {}
Main_mt = {}

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
   
   -- Notify stored on this class to use globally
   self.notify = Notify:new()

   -- Connect and initialize database
   self:load_database()
   
   -- Load plugins
   self:load_plugins()

   -- Initialize plugins
   self:init_plugins()
   
end

-- Ensure all directories are correct and permissions are kosher, etc
function Main:sanity_check() 
end

-- Connect to the SQLite3 Database and store the connection on this class
function Main:load_database()
   env = luasql.sqlite3()
   con = env:connect(DATABASE_FILENAME)
   self.database = con
end

-- Return database connection
function Main:get_database()
   return (self.database)
end



-- Load all loadable plugins
function Main:load_plugins()
   plugin_root = ROOT_PATH .. "plugins/"
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

function Main:init_plugins()
   -- loop through plugins, calling their init() function
end

function Main:get_database()
end

function Main:tf(command)
   -- tf_eval(command)
   print "Main:tf() => " .. command
end


CAMS = Main:new()
CAMS:init()