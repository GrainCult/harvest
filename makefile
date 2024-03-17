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
	mkdir -p /usr/local/bin/
	$(compiler) $(options) -o /usr/local/bin/$(output) $(sources) $(linker)

###################################################
