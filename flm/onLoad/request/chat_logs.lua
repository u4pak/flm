-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

local function logMessage( plr, msg )
    sendStatus("/chat-logs", {
        username = plr.Name,
        thumbnail = "https://www.roblox.com/headshot-thumbnail/image?userId="..plr.UserId.."&width=420&height=420&format=png",
        color = GetNameColor(plr.Name),
        message = msg
    })
end

task.spawn(function()
    for _, plr in next, Services.Players:GetPlayers() do
        plr.Chatted:Connect(function(msg)
            logMessage(plr, msg)
        end)
    end
    
    Services.Players.PlayerAdded:Connect(function(plr)
        plr.Chatted:Connect(function(msg)
            logMessage(plr, msg)
        end)
    end)
end)