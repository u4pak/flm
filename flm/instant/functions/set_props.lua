-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

function set_props( inst, props )
    for n, v in next, props do
        pcall(function()
            inst[n] = v;
        end)
    end
    return props;
end