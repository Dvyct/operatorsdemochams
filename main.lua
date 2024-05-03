getgenv().Config = { 
    ChamsColor = Color3.new(0, 217, 0),
    ChamsFill = true,
    ChamsFillTransparency = 0.5,
    ChamsOutline = false,
    ChamsOutlineTransparency = 1,
    ChamsOutlineColor = Color3.new(0,0,0),
    ChamsAlwaysOnTop = true,
} 
local RunService = game:GetService("RunService")
local Instances = game.Workspace.Level:GetChildren()
local function updateChamsConfig()
    -- Update chams configuration
    for _, instance in ipairs(Instances) do
        if instance.Name ~= "Cells" and instance.Name ~= "Motors" then
            local Bots = instance:FindFirstChild("BotModel"):GetChildren()

            for _, bot in ipairs(Bots) do
                local head = bot:FindFirstChild("Head")
                if head then
                    local existingChams = bot:FindFirstChild("Chams")
                    if existingChams then
                        -- Update the existing chams configuration
                        existingChams.FillTransparency = getgenv().Config.ChamsFillTransparency
                        existingChams.FillColor = getgenv().Config.ChamsColor
                        existingChams.DepthMode = getgenv().Config.ChamsAlwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Local
                        existingChams.Enabled = true
                        
                        -- Update outline if needed
                        if getgenv().Config.ChamsOutline then
                            existingChams.Outline = true
                            existingChams.OutlineColor = getgenv().Config.ChamsOutlineColor
                            existingChams.OutlineTransparency = getgenv().Config.ChamsOutlineTransparency
                        else
                            existingChams.OutlineTransparency = 1
                        end
                    else
                        -- Create new chams if it doesn't exist
                        local Highlight = Instance.new("Highlight")
                        Highlight.Parent = bot
                        Highlight.Name = "Chams"
                        Highlight.FillTransparency = getgenv().Config.ChamsFillTransparency
                        Highlight.FillColor = getgenv().Config.ChamsColor
                        Highlight.DepthMode = getgenv().Config.ChamsAlwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Local
                        Highlight.Enabled = true
                        
                        -- Add outline if needed
                        if getgenv().Config.ChamsOutline then
                            Highlight.Outline = true
                            Highlight.OutlineColor = getgenv().Config.ChamsOutlineColor
                            Highlight.OutlineTransparency = getgenv().Config.ChamsOutlineTransparency
                        end
                    end
                end
            end
        end
    end
end
RunService.RenderStepped:Connect(updateChamsConfig)
updateChamsConfig() 
