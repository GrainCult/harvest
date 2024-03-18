---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

c = c or {}
_version = _version or "na"

args = {}
dofile("/usr/lib/grain/harvest/arguments/remove.lua")
dofile("/usr/lib/grain/harvest/arguments/update.lua")
dofile("/usr/lib/grain/harvest/arguments/list.lua")
dofile("/usr/lib/grain/harvest/arguments/fetch.lua")
dofile("/usr/lib/grain/harvest/arguments/clean.lua")
dofile("/usr/lib/grain/harvest/arguments/info.lua")
dofile("/usr/lib/grain/harvest/arguments/help.lua")

table.remove(arg,1)
while true do
  if #arg > 0 then

    local dobreak = false
    for i = 1, #arg do
      if args[arg[i]] then
        dobreak = args[arg[i]](i)
      end
    end
    if dobreak then break end

    -- here arg is the install targets
    io.write("[HARVEST] Using no options assumes you want to install: \n\t"..table.concat(arg, ",\n\t")..",\n")
  else
    print("[HARVEST] you stupid or something")
  end
  break
end
