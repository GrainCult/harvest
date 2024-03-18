---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-f"] = function()
  print("[HARVEST] Using this option would update your local repositories!")
  return true
end
args["--fetch"] = args["-f"]
