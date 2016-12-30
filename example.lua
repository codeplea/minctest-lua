
require "minctest"

lrun("test1", function()
    lok('a' == 'a');          --assert true
end)

lrun("test2", function()
    lequal(5, 6);             --compare integers
    lfequal(5.5, 5.6);        --compare floats
end)

return lresults();            --show results
