---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-h"] = function()
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
    "├── -v --info    │ Show information about Harvest",
    "└── -h --help    │ Shows this screen!!",
    "",
    "Examples:",
    "    harvest discord │ Installs the 'discord' crop",
    "",
  }
  for x = 1, #help do print(help[x]) end
  return true
end
args["--help"] = args["-h"]
