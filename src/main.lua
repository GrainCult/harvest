---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

c = c or {}
_version = _version or "na"

config = {}
if c.exists(os.getenv("HOME").."/.config/harvest/harvest.lua") then
  dofile(os.getenv("HOME").."/.config/harvest/harvest.lua")
else
  dofile("/usr/lib/grain/harvest/config.lua")
end

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
  if #arg == 0 then
    print("[HARVEST] you stupid or something (no arguments have been provided)")
    break
  end

  local hasRunDisallowed = false
  local function check(this)
    if this == "-r" or this == "--remove" or this == "-u" or this == "--update" then
      if hasRunDisallowed then
        return false
      end
      hasRunDisallowed = true
    end
    return true
  end

  local doBreak = false
  for i = 1, #arg do
    if args[arg[i]] then
      if check(arg[i]) then
        doBreak = args[arg[i]](i)
      else
        io.write("[HARVEST] Cannot run --remove and --update in the same command "..arg[i].." has been skipped\n")
      end
    end
  end
  if doBreak then break end

  -- here arg is the install targets
  io.write("[HARVEST] Using no options assumes you want to install: \n\t"..table.concat(arg, ", ").."\n")
  break
end
