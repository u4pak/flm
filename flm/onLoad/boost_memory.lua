-- This software, and it's associated files/documents, are protected by the General Public License v3, see LICENSE.txt for more information
-- Copyright (C) 2022 Latte Softworks, all rights reserved.

set_props(workspace:FindFirstChildOfClass('Terrain'), {
    WaterWaveSize = 0,
    WaterWaveSpeed = 0,
    WaterReflectance = 0,
    WaterTransparency = 0
})

set_props(Services.Lighting, {
    Brightness = 0,
    GlobalShadows = false,
    FogEnd = 9e9
})

set_props(settings().Rendering, {
    QualityLevel = 1,
    MeshCacheSize = 0,
    ShowBoundingBoxes = true
})

local function restrict( inst )
    task.spawn(function()
        local Classes = { 'Light', 'Sound', 'ForceField', 'Sparkles', 'Smoke', 'Fire', 'Explosion', 'ParticleEmitter', 'Trail', 'PostEffect' }
        if table.find( Classes, inst.ClassName ) then
            inst:Destroy()
        end
        if inst:IsA("BasePart") then
            set_props(inst, {
                CastShadow = false,
                Material = Enum.Material.Plastic,
                Reflectance = 0
            })
        elseif inst:IsA("GuiObject") then
            inst.Visible = false;
        end
        Services.Lighting:ClearAllChildren()
    end)
end

for _, inst in next, game:GetDescendants() do
    restrict( inst )
end

game.DescendantAdded:Connect(restrict)