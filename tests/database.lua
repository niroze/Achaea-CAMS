require "luasql.sqlite3"

ROOT_PATH = "/Users/christopherhumphries/Achaea/Lua/CAMS/"
DATABASE_FILENAME = ROOT_PATH .. "cams.db"


-- Connect to database
env = assert(luasql.sqlite3())
con = assert(env:connect(DATABASE_FILENAME))

-- reset our table
res = con:execute"DROP TABLE people"
res = assert (con:execute[[
		    CREATE TABLE people(
		       name  varchar(50),
		       email varchar(50)
		    )
	      ]])
-- add a few elements
list = {
   { name="Jose das Couves", email="jose@couves.com", },
   { name="Manoel Joaquim", email="manoel.joaquim@cafundo.com", },
   { name="Maria das Dores", email="maria@dores.com", },
}
for i, p in pairs (list) do
   res = assert (con:execute(string.format([[
						 INSERT INTO people
						 VALUES ('%s', '%s')]], p.name, p.email)
		       ))
end
-- retrieve a cursor
sql_statement = "select name, email from people"
cur = assert (con:execute(sql_statement))
-- print all rows
row = cur:fetch ({}, "a")       -- the rows will be indexed by field names
while row do
   print(string.format("Name: %s, E-mail: %s", row.name, row.email))
   row = cur:fetch (row, "a")    -- reusing the table of results
end
-- close everything
cur:close()
con:close()
env:close()