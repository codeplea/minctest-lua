--
-- MINCTEST - Minimal Lua Test Library - 0.1.1
-- This is based on minctest.h (https://codeplea.com/minctest)
--
-- Copyright (c) 2014, 2015, 2016 Lewis Van Winkle
--
-- http://CodePlea.com
--
-- This software is provided 'as-is', without any express or implied
-- warranty. In no event will the authors be held liable for any damages
-- arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose,
-- including commercial applications, and to alter it and redistribute it
-- freely, subject to the following restrictions:
--
-- 1. The origin of this software must not be misrepresented; you must not
--    claim that you wrote the original software. If you use this software
--    in a product, an acknowledgement in the product documentation would be
--    appreciated but is not required.
-- 2. Altered source versions must be plainly marked as such, and must not be
--    misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.


-- MINCTEST - Minimal testing library for C
--
--
-- Example:
--
--
-- require "minctest"
--
-- lrun("test1", function()
--    lok('a' == 'a');          --assert true
-- end)
--
-- lrun("test2", function()
--    lequal(5, 6);             --compare integers
--    lfequal(5.5, 5.6);        --compare floats
-- end)
--
-- return lresults();           --show results
--
--
-- Hints:
--      All functions/variables start with the letter 'l'.
--
--


local LTEST_FLOAT_TOLERANCE = 0.001


local ltests = 0
local lfails = 0


lresults = function()
    if (lfails == 0) then
        print("ALL TESTS PASSED (" .. ltests .. "/" .. ltests .. ")")
    else
        print("SOME TESTS FAILED (" .. ltests-lfails .. "/" .. ltests .. ")")
    end
    return lfails ~= 0
end


lrun = function(name, testfunc)
    local ts = ltests
    local fs = lfails
    local clock = os.clock()
    io.write(string.format("\t%-16s", name))
    testfunc()
    io.write(string.format("pass:%2d   fail:%2d   %4dms\n",
        (ltests-ts)-(lfails-fs), lfails-fs,
        math.floor((os.clock() - clock) * 1000)));
end

lok = function(test)
    ltests = ltests + 1
    if not test then
        lfails = lfails + 1
        io.write(string.format("%s:%d error \n",
            debug.getinfo(2, 'S').short_src,
            debug.getinfo(2, 'l').currentline))
    end
end

lequal = function(a, b)
    ltests = ltests + 1
    if a ~= b then
        lfails = lfails + 1
        io.write(string.format("%s:%d (%d != %d)\n",
            debug.getinfo(2, 'S').short_src,
            debug.getinfo(2, 'l').currentline,
            a, b))
    end
end

lfequal = function(a, b)
    ltests = ltests + 1
    if math.abs(a - b) > LTEST_FLOAT_TOLERANCE then
        lfails = lfails + 1
        io.write(string.format("%s:%d (%f != %f)\n",
            debug.getinfo(2, 'S').short_src,
            debug.getinfo(2, 'l').currentline,
            a, b))
    end
end

