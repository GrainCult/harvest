---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

c = c or {}
_version = _version or "na"

table.remove(arg,1)
while true do
  if #arg > 0 then
    local dobreak = false
    args =
    {
      ["-r"] = function(i)
        print("[HARVEST] Using this option would remove "..arg[i+1].."!")
        dobreak = true
      end,

      ["-u"] = function()
        print("[HARVEST] Using this option would update the system!")
        dobreak = true
      end,

      ["-l"] = function()
        print("[HARVEST] Using this option would list installed packages!")
        dobreak = true
      end,

      ["-v"] = function()
        print("Harvest version ".._version)
        dobreak = true
      end,

      ["-f"] = function()
        print("[HARVEST] Using this option would update your local repositories!")
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
    for i = 1, #arg do
      if args[arg[i]] then
        args[arg[i]](i)
      end
    end
    if dobreak then break end
    print("[HARVEST] Using no options assumes you want to install "..arg[1].."!")
  else
    print("you stupid or something")
  end
  break
end
