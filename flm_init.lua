-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

FLAGS = {
    Crash = { Increment = 100000, Attempts = 1000 };
    Crashed = {
        Enum.ConnectionError.DisconnectConnectionLost,
        Enum.ConnectionError.DisconnectTimeout,
    };
    Statistics = {
        RefreshRate = 1;
    };
    View = {
        Delay = 10;
        CameraType = Enum.CameraType.Track;
    };
}

Services = {
    "CoreGui",
    "RobloxReplicatedStorage",
    "NetworkClient",
    "Lighting",
    "Players",
    "CoreGui",
    "Chat",
    "Stats"
}

for i, n in ipairs( Services ) do
    Services[n] = game:GetService(n);
end

local function loadModules( path, t )
    for _, module in ipairs( t ) do
        local success, res = pcall(function()
            loadfile( path..module )()
        end)
        if not success then
            sendStatus("/interruption", {
                embeds = {{
                    color = 0xff9900,
                    title = 'Crash Interrupted.',
                    fields = {{
                        name = 'Reason:',
                        value = string.format('```%s\n%s```', path..module, res)
                    }},
                    timestamp = DateTime.now().UnixTimestampMillis
                }}
            })
            game:shutdown()
        end
    end
end

local function init()
    loadModules('flm/instant/', {
        'request.lua',
        'life_check.lua',
        'get_kick.lua',
        'functions/set_props.lua'
    })
    
    if not game:IsLoaded() then
        game.Loaded:Wait()
        sendStatus("/loaded", {
            placeid = game.PlaceId,
            jobid = game.JobId
        })
    end

    task.wait(.1)
    
    loadModules('flm/onLoad/', {
        -- 'test-error.lua',
        'client.lua',
        'functions/get_name_color.lua',
        'request/server_stats.lua',
        'request/chat_logs.lua',
        'view_players.lua',
        'crash.lua',
        'boost_memory.lua',
    })
end

init();