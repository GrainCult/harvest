---@diagnostic disable: lowercase-global
---@diagnostic disable: duplicate-set-field
-- vim:foldmethod=marker

args["-h"] = function()
  help =
  {
    "",
    "Usage: harvest [OPTION] ...",
    "",
    "Possible options:  * OPTIONAL",
    "├── [STRING]      │ Installs a crop/s",
    "├── -r --remove   │ Remove a crop/s instead of installing one",
    "│   └── [STRING]  │ The crop/s to remove",
    "├── -u --update   │ Update installed crops to latest in local repository",
    "│   └── [STRING]* │ Update only selected crop/s",
    "├── -f --fetch    │ Update local repository",
    "├── -l --list     │ List installed crops",
    "├── -i --info     │ Show information about harvest",
    "└── -h --help     │ Shows this screen!",
    ""
  }
  for x = 1, #help do print(help[x]) end
  return true
end
args["--help"] = args["-h"]
