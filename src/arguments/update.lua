---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-u"] = function(i)
  if arg[i+1] then
    local args = arg
    table.remove(args, 1)
    if #args > 0 then
      -- updatetargets is a table of all packages to be updated based on the arguments, can be appended to for dependencies and other things
      -- TODO: read from imaginary cache to know what to update
      local updatetargets = args
      io.write("[HARVEST] Using this option would update the crops: \n\t"..table.concat(updatetargets, ",\n\t")..",\n")
    end
  else
     print("[HARVEST] Using this option would update all crops!") -- looks complicated but just to put it in text
  end
  return true
end
args["--update"] = args["-u"]
