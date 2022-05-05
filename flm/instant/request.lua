-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

function sendStatus( url, data )
    task.spawn(function()
        return syn.request(
            {
                Url = 'http://localhost:3000'..url,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game:GetService("HttpService"):JSONEncode( data )
            }
        )
    end)
end