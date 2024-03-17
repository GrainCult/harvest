# harvest
A package manager for GrainOS written in C/Lua

## Standard

### Config

All config files are stored `~/.config/harvest/harvest.lua`

#### Example
```lua
-- harvest config file
-- Check graincult.com/docs/harvest/config for help

DoesElevation = false
```

### Commands
- Installing:
    - `harvest discord`
- Removing:
    - `harvest --remove discord` or `harvest -r discord`
- Updating:
    - Specific packages can be updated with `harvest --update discord` or `harvest -u discord`
    - All packages can be updated with `harvest --update` or `harvest -u`
- Fetching:
    - To upgrade the repo you can use --fetch
    - `harvest --fetch` or `harvest -f`
- Clean:
    - Clean unused depencices
    - `harvest --clean` or `harvest -c`
- Help:
    - `harvest --help` or `harvest -h`
- List:
    - `harvest --list` or `harvest -l`
- Infomation:
    - Get version and other infomation about harvest on the system
    - `harvest --infomation` or `harvest -i`

### Termanology
- Fields: Mirrors
- Silos: Repos
- Grains/Crops: Packages
