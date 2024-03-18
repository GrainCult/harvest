---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-c"] = function()
  print("[HARVEST] Using this options would clean out any any unused dependencies!")
  return true
end
args["--clean"] = args["-c"]
