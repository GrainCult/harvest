---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

c = c or {}
_version = _version or "na"

-- @soupyfx dont really know a good placement for this function
-- but it needs to be a function because it is used many times
local function grabCrops(from)
  local crops = {}
  for x = from, #arg do 
    if string.sub(arg[x], 1, 1) == "-" then break end
    table.insert(crops, arg[x])
  end
  return crops
end

table.remove(arg,1)
while true do
  if #arg > 0 then
    local dobreak = false
    args =
    {
      ["-r"] = function(i)
        if arg[i+1] then
          local toRemove = grabCrops(i+1)

          local text = ""
          for i = 1, #toRemove do text = text..(i == 1 and "" or ", ")..toRemove[i] end
          print("[HARVEST] Using this option would remove "..text..(#toRemove == 1 and " crop!" or " crops!"))
        else
          print("[HARVEST] Using this option would do nothing because no  was provided to delete!")
        end
        dobreak = true
      end,

      ["-u"] = function(i)
        if arg[i+1] then
          local toUpdate = grabCrops(i+1)

          local text = ""
          for i = 1, #toUpdate do text = text..(i == 1 and "" or ", ")..toUpdate[i] end
          print("[HARVEST] Using this option would update the "..(#toUpdate == 1 and "crop " or "crops ")..text.."!")
        else
           print("[HARVEST] Using this option would update all crops!")
        end
        dobreak = true
      end,

      ["-l"] = function()
        print("[HARVEST] Using this option would list installed crops!")
        dobreak = true
      end,

      ["-f"] = function()
        print("[HARVEST] Using this option would update your local repositories!")
        dobreak = true
      end,

      ["-c"] = function()
        print("[HARVEST] Using this options would clean out any any unused dependencies!")
        dobreak = true
      end,

      ["-i"] = function()
        infomation = 
        {
          "",
          "Harvest infomation",
          "Version " .. _version,
          "Total installed " .. 0, -- @soupyfx TODO replaced placeholder with installed packages 
          "",
        }
        for x = 1, #infomation do print(infomation[x]) end
        dobreak = true
      end,

      ["-h"] = function()
        help =
        {
          "",
          "Usage: harvest [OPTION]...",
          "Possible options:",
          "├── -r --remove  │ Remove a crop instead of installing one",
          "│   └── [STRING] │ The crop to remove",
          "├── -u --update  │ Update installed crops to latest in local repository",
          "├── -f --fetch   │ Update local repository",
          "├── -l --list    │ List installed crops",
          "├── -v --version │ Show information about Harvest",
          "└── -h --help    │ Shows this screen!!",
          "",
          "Examples:",
          "    harvest discord │ Installs the 'discord' crop",
          "",
        }
        for x = 1, #help do print(help[x]) end
        dobreak = true
      end,
    }
    args["--remove"] = args["-r"]
    args["--update"] = args["-u"]
    args["--fetch"] = args["-f"]
    args["--help"] = args["-h"]
    args["--infomation"] = args["-i"]
    args["--clear"] = args["-c"]
    for i = 1, #arg do
      if args[arg[i]] then
        args[arg[i]](i)
      end
    end
    if dobreak then break end
    
    local toInstall = grabCrops(1)

    local text = ""
    for i = 1, #toInstall do text = text..(i == 1 and "" or ", ")..toInstall[i] end
    print("[HARVEST] Using no options assumes you want to install "..text.."!")
  else
    print("[HARVEST] you stupid or something")
  end
  break
end
