-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

function GetNameColor(speaker)
    NAME_COLORS ={
        tonumber(0xC4281C),
        tonumber(0x0D69AC),
        tonumber(0x27462D),
        tonumber(0x6B327C),
        tonumber(0xDA8541),
        tonumber(0xF5CD30),
        tonumber(0xE8BAC8),
        tonumber(0xD7C59A)
    }

    local function GetNameValue(pName)
        local value = 0
        for index = 1, #pName do
            local cValue = string.byte(string.sub(pName, index, index))
            local reverseIndex = #pName - index + 1
            if #pName%2 == 1 then
                reverseIndex = reverseIndex - 1
            end
            if reverseIndex%4 >= 2 then
                cValue = -cValue
            end
            value = value + cValue
        end
        return value
    end

    local color_offset = 0
    local function ComputeNameColor(pName)
        return NAME_COLORS[((GetNameValue(pName) + color_offset) % #NAME_COLORS) + 1]
    end
    
    return ComputeNameColor(speaker)
end