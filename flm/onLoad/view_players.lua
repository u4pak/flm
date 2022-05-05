-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

local function randomPlr()
    local plrs = Services.Players:GetPlayers()
    table.remove(plrs, table.find( plrs, Client ) )
    return plrs[ math.random(1, #plrs) ]
end

local function view( plr )
    workspace.CurrentCamera = Instance.new('Camera')
    task.wait()
    set_props(workspace.CurrentCamera, {
        CameraSubject = plr.Character.Head,
        CameraType = FLAGS.View.CameraType
    })
end

task.spawn(function()
    while true do
        pcall(view, randomPlr())
        task.wait( FLAGS.View.Delay )
    end
end)