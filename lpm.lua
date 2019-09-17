
local Jreader = require("src.reader")
local Parser = require("src.parser")

local result = Jreader.read("package.json")
assert(result, "Could not parse package.json")

print("installing deps for "..result.name.." ...")


local install_cmds = Parser.parse(result.dependencies)
assert(#install_cmds > 0, "Failed to read dependencies")

for _, cmd in ipairs(install_cmds) do
  print(cmd)
  os.execute(cmd)
end
