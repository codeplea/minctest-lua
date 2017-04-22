# Minctest

This is a Lua port of [Minctest](https://codeplea.com/minctest), a very
minimal unit-testing "framework" originally written in ANSI C. It's handy when
you want some real simple unit tests for a small project.

Basically, it implements assertion and equal functions. It'll track and time
how many tests pass and fail. Failed tests will also display which line the
failing test code was on.

## Features

- Contained in a single file.
- Reports file and line number for failed assertions.
- Reports run time for each test.
- Tests continue even after an assertion fails.
- Has assertion for checking float equality.
- Released under the zlib license - free for nearly any use.

## Installation

You can either copy `minctest.lua` into your project, or if you use luarocks
run `luarocks install minctest`.

## Example

```lua
require "minctest"

lrun("test1", function()
    lok('a' == 'a');          --assert true
end)

lrun("test2", function()
    lequal(5, 5);             --compare integers
    lfequal(5.5, 5.5);        --compare floats
end)

return lresults();            --show results
```

That produces the following output:

            test1         pass: 1   fail: 0      0ms
            test2         pass: 2   fail: 0      1ms
    ALL TESTS PASSED (3/3)



## Hints
     All functions start with the letter 'l'.


## Users

If you're using Minctest in your project, let me know. I could add a link back.
