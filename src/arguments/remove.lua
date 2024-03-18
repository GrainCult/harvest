---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-r"] = function(i)
  if arg[i+1] then
    local args = arg
    table.remove(args, 1)
    if #args > 0 then
      -- updatetargets is a table of all packages to be removed based on the arguments, can be appended to for dependencies and other things
      -- TODO: read from imaginary cache to know what to remove
      local updatetargets = args
      io.write("[HARVEST] Using this option would remove the crops: \n\t"..table.concat(updatetargets, ",\n\t")..",\n") -- looks complicated but just to put it in text
    end
  else
     print("[HARVEST] Using this option would remove nothing!")
  end
  return true
end
args["--remove"] = args["-r"]
