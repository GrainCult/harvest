---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-l"] = function()
  print("[HARVEST] Using this option would list installed crops!")
  return true
end
args["--list"] = args["-l"]
