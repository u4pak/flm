-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

local function getError( msg )
    local t = {}
    string.gsub( msg, '\n%(Error Code: %d%d%d%)', function (s)
        table.insert( t, s:sub(-4,-2) )
    end)

    for _, v in next, Enum.ConnectionError:GetEnumItems() do
        if v.Value == tonumber( t[#t] ) then
            return v;
        end
    end
end

local function processPrompt( inst )
    task.spawn(function()
    error()
    end)
    if inst.Name == 'ErrorPrompt' then
        local errorMessage = inst.MessageArea.ErrorFrame.ErrorMessage

        repeat task.wait() until errorMessage.Text ~= ''

        if table.find( FLAGS.Crashed, getError(errorMessage.Text) ) then
            sendStatus("/crashed", {})
        else
            sendStatus("/interruption", {
                embeds = {{
                    color = 0xff9900,
                    title = 'Crash Interrupted.',
                    fields = {{
                        name = 'Reason:',
                        value = [[```]]..errorMessage.Text..[[```]]
                    }},
                    timestamp = DateTime.now().UnixTimestampMillis
                }}
            })
        end

        game:shutdown()
    end
end

local corePromptOverlay = Services.CoreGui:WaitForChild('RobloxPromptGui').promptOverlay

if corePromptOverlay:FindFirstChild('ErrorPrompt') then
    processPrompt( corePromptOverlay:FindFirstChild('ErrorPrompt') )
end

corePromptOverlay.ChildAdded:Connect(function( child )
    if child.Name == 'ErrorPrompt' then
        processPrompt( child )
    end
end)