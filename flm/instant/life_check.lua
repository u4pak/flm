-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

task.spawn(function()
    while true do
        sendStatus("/alive", {})
        task.wait(1)
    end
end)