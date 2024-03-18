// vim:foldmethod=marker

// {{{ include

#include "include/lualib.h"
#include "include/lauxlib.h"

#include <stdio.h>
#include <unistd.h>

// }}}
// {{{ define

char* version = "0.0.0";
char* lua_main = "/usr/lib/grain/harvest/main.lua";
char* lua_main_local = "/.local/share/grain/main.lua";
char* lua_main_file = "/main.lua";

// }}}

// {{{ lua error

void error(lua_State* lua, int type)
{
  if (!type)
  {
    fprintf(stderr, "[FATAL ERROR]: %s\n", lua_tostring(lua, -1));
    lua_pop(lua, -1);
    fprintf(stderr, "\nSomething has probably gone horribly wrong, and the program is no longer able to proceed\n");
    fprintf(stderr, "If this seems like a bug, and not user error, please first ensure you are using the latest version (using %s)\n", version);
    fprintf(stderr, "Then please submit a bug report with the error shown just above\n");
    fprintf(stderr, "\nBetter luck next time <3\n");
  }
  else
  {
    fprintf(stderr, "[FATAL ERROR]: %s is not installed...\n", "harvest");
  }
  lua_close(lua);
}

// }}}
// {{{ lua functions

int lua_exists(lua_State* lua)
{
  const char* f = luaL_checkstring(lua, -1);
  if (access(f, F_OK)) {
    lua_pushinteger(lua, 1);
  } else {
    lua_pushinteger(lua, 0);
  }
  return 1;
}

// }}}

// {{{ main

int main(int argc, char* argv[])
{

  // {{{ lua

  lua_State* lua = lua_open();
  luaL_openlibs(lua);
  
  // {{{ expose lua functions

  static const struct luaL_Reg lua_functions[] =
  {
    {
      "exists",
      lua_exists,
    },
    {
      NULL,
      NULL,
    }
  };
  luaL_register(lua, "c", lua_functions);

  // }}} 
  // {{{ expose lua variables & args
  
  if (argc > 0)
  {
    lua_newtable(lua);
      for (int i = 0; i < argc; i++)
      {
        lua_pushstring(lua, argv[i]);
        lua_rawseti(lua, -2, i + 1);
      }
    lua_setglobal(lua, "arg");
    lua_pushstring(lua, version);
    lua_setglobal(lua, "_version");
  }

  // }}}
  // {{{ start lua

  /* isnt installed to system? */
  if (!access(lua_main, F_OK))
  {
    if (luaL_dofile(lua, lua_main))
    {
      error(lua, 0);
      return 1;
    }
  }
  /* isnt installed locally?? */
  else if (!access(lua_main_local, F_OK))
  {
    if (luaL_dofile(lua, lua_main_local))
    {
      error(lua, 0);
      return 1;
    }
  }
  /* isnt installed at all??? */
  else
  {
    error(lua, 1);
    return 1;
  }

  // }}}

  lua_close(lua);

  // }}}

  return 0;
}

// }}}
