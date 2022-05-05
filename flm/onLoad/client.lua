-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

Client = Services.Players.LocalPlayer;

task.spawn(function()
    while task.wait() do
        if #Services.Players:GetPlayers() == 1 then
            -- sendStatus("/interruption", {
            --     embeds = {{
            --         color = 0xff9900,
            --         title = 'Crash Interrupted.',
            --         fields = {{
            --             name = 'Reason:',
            --             value = [[```Client alone in server.```]]
            --         }},
            --         timestamp = DateTime.now().UnixTimestampMillis
            --     }}
            -- })
            -- game:shutdown()
        end
        
        Character = Client.Character or Client.CharacterAdded:Wait()
        Character.Parent = nil;
    end
end)