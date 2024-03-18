###################################################   

compiler = clang
options  = 
linker   = -lluajit-5.1
output   = harvest
sources  = ./src/main.c

$(output): $(sources)
	$(compiler) -o ./src/$(output) $(sources) $(options) $(linker)

###################################################   

clean:
	rm -f $(output) *.o

###################################################

install:
	mkdir -p /usr/lib/grain/$(output)/
	luajit -b ./src/main.lua /usr/lib/grain/$(output)/main.lua
	luajit -b ./src/config.lua /usr/lib/grain/$(output)/config.lua
	luajit -b ./src/remove.lua /usr/lib/grain/$(output)/remove.lua
	luajit -b ./src/update.lua /usr/lib/grain/$(output)/update.lua
	luajit -b ./src/list.lua /usr/lib/grain/$(output)/list.lua
	luajit -b ./src/fetch.lua /usr/lib/grain/$(output)/fetch.lua
	luajit -b ./src/clean.lua /usr/lib/grain/$(output)/clean.lua
	luajit -b ./src/info.lua /usr/lib/grain/$(output)/info.lua
	luajit -b ./src/help.lua /usr/lib/grain/$(output)/help.lua
	mkdir -p /usr/local/bin/
	cp ./src/$(output) /usr/local/bin/

###################################################

local:
	mkdir -p ~/.local/bin/
	cp ./src/$(output) ~/.local/bin/
	mkdir -p ~/.local/share/grain/$(output)/
	luajit -b ./src/main.lua ~/.local/share/grain/$(output)/main.lua

###################################################

test:
	mkdir -p /usr/lib/grain/$(output)/
		luajit -b ./src/main.lua /usr/lib/grain/$(output)/main.lua
		luajit -b ./src/config.lua /usr/lib/grain/$(output)/config.lua
	mkdir -p /usr/lib/grain/$(output)/arguments/
		luajit -b ./src/arguments/remove.lua /usr/lib/grain/$(output)/arguments/remove.lua
		luajit -b ./src/arguments/update.lua /usr/lib/grain/$(output)/arguments/update.lua
		luajit -b ./src/arguments/list.lua /usr/lib/grain/$(output)/arguments/list.lua
		luajit -b ./src/arguments/fetch.lua /usr/lib/grain/$(output)/arguments/fetch.lua
		luajit -b ./src/arguments/clean.lua /usr/lib/grain/$(output)/arguments/clean.lua
		luajit -b ./src/arguments/info.lua /usr/lib/grain/$(output)/arguments/info.lua
		luajit -b ./src/arguments/help.lua /usr/lib/grain/$(output)/arguments/help.lua
	mkdir -p /usr/local/bin/
		$(compiler) $(options) -o /usr/local/bin/$(output) $(sources) $(linker)

###################################################
