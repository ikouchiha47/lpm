local Parser = {}

Parser.parse = function(dependencies)
  local packages = {}
  setmetatable(packages, { __shl = function (t,v) t[#t+1]=v end })

  for package_name, details in pairs(dependencies) do
    local prefix = "luarocks install"

    if type(details) == "string" then
      local version = details
      _ = packages << prefix..' '..package_name..' '..version
    elseif type(details) == "table" then
      _ = packages << prefix..' '..package_name..' '..Parser.parse_details(details)
    end
  end

  return packages
end

Parser.parse_details = function(details)
  local rocks = {}

  for key, value in pairs(details) do
    if key == "url" then
      table.insert(rocks, "--server="..value)
    elseif key == "version" then
      table.insert(rocks, value)
    end
  end 

  return table.concat(rocks, " ")
end

return Parser