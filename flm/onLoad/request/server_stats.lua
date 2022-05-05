-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

task.spawn(function()
    while true do
        sendStatus("/server-stats", {
            ping = Services.Stats.Network.ServerStatsItem["Data Ping"]:GetValueString();
            players = #Services.Players:GetPlayers(),
        })
        task.wait( FLAGS.Statistics.RefreshRate )
    end
end)