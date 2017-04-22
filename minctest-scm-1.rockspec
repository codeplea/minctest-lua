package = "minctest"
version = "scm-1"
source = {
   url = "git+https://github.com/codeplea/minctest-lua.git"
}
description = {
   summary = "very minimal unit-testing \"framework\" for Lua",
   detailed = [[
This is a Lua port of [Minctest](https://codeplea.com/minctest), a very
minimal unit-testing "framework" originally written in ANSI C. It's handy when
you want some real simple unit tests for a small project.]],
   homepage = "https://github.com/codeplea/minctest-lua",
   license = "zlib"
}
dependencies = {
   "lua >= 5.1, < 5.4"
}
build = {
   type = "builtin",
   modules = {
      minctest = "minctest.lua"
   }
}
