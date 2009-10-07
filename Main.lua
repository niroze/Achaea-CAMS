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
require "Targeting"       -- Single target targetting


-- Globals
DATABASE_ROOT_PATH = ROOT_PATH .. "database/"
DATABASE_FILENAME = DATABASE_ROOT_PATH .. "CAMS.db"
PLUGINS = {}
DEBUG = 1

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
   
   -- Notify stored on this class to use globally
   self.notify = Notify:new()

   -- Aliases stored on this class to use globally
   self.aliases = Aliases:new()

   -- Triggers stored on this class to use globally
   self.triggers = Triggers:new()

   -- Targetting stored on this class to use globally
   self.targeting = Targeting:new()

   -- Settings stored on this class to use globally
   self.settings = Settings:new()

   -- Sanity check
   self:sanity_check()

   -- Connect and initialize database
   self:load_database()
   
   -- Load plugins
   self.notify:normal('Loading Plugins.')
   self:load_plugins()

   -- Initialize plugins
   self.notify:normal('Initializing Plugins.')
   self:init_plugins()
   
   self.notify:normal('Loading complete')

end

-- Ensure all directories are correct and permissions are kosher, etc
function Main:sanity_check() 
end

-- Connect to the SQLite3 Database and store the connection on this class
function Main:load_database()
   --self.notify:debug("Main:load_database(): Connecting to database")
   env = luasql.sqlite3()
   con = env:connect(DATABASE_FILENAME)
   self.database = con
   --self.notify:debug("Main:load_database(): Connected to database")
end

-- Return database connection
function Main:get_database()
   return (self.database)
end



-- Load all loadable plugins
function Main:load_plugins()
   plugin_root = ROOT_PATH .. 'plugins/'
   for plugin_file in io.popen('ls ' .. plugin_root):lines() do
      if string.find(plugin_file,'.lua$') then 
	 --self.notify:debug("Lua Plugin file: " .. plugin_file)
	 plugin_file_path = plugin_root .. plugin_file
	 plugin_name = string.gsub(plugin_file, '.lua', '')
	 plugin_file_code = loadfile(plugin_file_path)
	 plugin_file_code() -- load it into global namespace
	 plugin_loader_code = loadstring('PLUGINS["' .. plugin_name .. '"]  = ' .. plugin_name .. ':new()')
	 plugin_loader_code() -- create a new instance of the plugin
	 if PLUGINS[plugin_name]:load() == 1 then
	    self.plugins[plugin_name] = PLUGINS[plugin_name]
	    self.notify:normal('Plugin Loaded: ' .. plugin_name .. ' v' .. self.plugins[plugin_name]:get_version())
	 end -- if
      end -- if
   end -- for
end

function Main:init_plugins()
   -- loop through plugins, calling their init() function
   for plugin_name, plugin_code in pairs(self.plugins) do
      plugin_code:init()
      self.notify:normal('Plugin initiated: ' .. plugin_name .. ' v' .. plugin_code:get_version())
   end
end

function Main:get_database()
end

function Main:tf(command)
   self.notify:debug('Main:tf() => ' .. command)
   tf_eval(command)
end


CAMS = Main:new()
CAMS:init()