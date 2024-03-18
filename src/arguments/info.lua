---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-i"] = function()
  infomation =
  {
    "",
    "Harvest infomation",
    "Version " .. _version,
    "Total installed " .. 0, -- @soupyfx TODO replaced placeholder with installed packages 
    "",
  }
  for x = 1, #infomation do print(infomation[x]) end
  return true
end
args["--info"] = args["-i"]
