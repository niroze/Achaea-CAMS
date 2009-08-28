
Security = {}
Security_mt = {}

function Security:new()
	 class = {}
	 class.version = "0.Vaporware"
	 setmetatable(class, Security_mt)
	 Security_mt.__index = Security
   	 return (class)
end

function Security:load()
	 return (1)
end

function Security:get_version()
	return (self.version)
end

function Security:init()
end