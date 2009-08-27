
Security = {}
Security_mt = {}

function Security:new()
	 class = {}

	 setmetatable(class, Security_mt)
	 Security_mt.__index = Security
   	 return (class)
end

function Security:load()
	 return (1)
end