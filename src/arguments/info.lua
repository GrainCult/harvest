---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-i"] = function()
  infomation =
  {
    "",
    "##  ##",
    "##  ##  harvest v".._version,
    "######  installed crops "..0, -- @soupyfx TODO replaced placeholder with installed packages 
    "##  ##  mirror ".."selectedmirror",
    "##  ##",
    ""
  }
  for x = 1, #infomation do print(infomation[x]) end
  return true
end
args["--info"] = args["-i"]
