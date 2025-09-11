-- use this for whatever you like I dont really care :D! (please give me some credit tho)

local AdminUILib = {}

function AdminUILib:Init()
    local Script = Instance.new("ScreenGui")
    Script.Name = "Script"
    Script.Parent = game:GetService("CoreGui")
    Script.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Executor = Instance.new("Frame")
    Executor.Name = "Executor"
    Executor.Parent = Script
    Executor.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Executor.BorderSizePixel = 0
    Executor.Position = UDim2.new(0.3, 0, 0.3, 0)
    Executor.Size = UDim2.new(0, 712, 0, 344)

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Executor

    local Title = Instance.new("TextLabel")
    Title.Parent = Executor
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.2, 0, 0.05, 0)
    Title.Size = UDim2.new(0, 400, 0, 50)
    Title.Font = Enum.Font.Arcade
    Title.Text = "Murder Mystery 2 Admin CMD Panel"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 28

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Parent = Executor
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0.35, 0, 0.18, 0)
    SubTitle.Size = UDim2.new(0, 200, 0, 22)
    SubTitle.Font = Enum.Font.Arcade
    SubTitle.Text = "Commands:"
    SubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubTitle.TextSize = 22

    local CMDS = Instance.new("ScrollingFrame")
    CMDS.Name = "CMDS"
    CMDS.Parent = Executor
    CMDS.Active = true
    CMDS.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    CMDS.BorderSizePixel = 0
    CMDS.Position = UDim2.new(0.02, 0, 0.3, 0)
    CMDS.Size = UDim2.new(0, 693, 0, 230)
    CMDS.ScrollBarThickness = 4

    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 9)
    UICorner2.Parent = CMDS

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = CMDS
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    -- Toggle button
    local ToggleGUI = Instance.new("TextButton")
    ToggleGUI.Name = "ToggleGUI"
    ToggleGUI.Parent = Script
    ToggleGUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ToggleGUI.BorderSizePixel = 0
    ToggleGUI.Position = UDim2.new(0.004, 0, 0, 0)
    ToggleGUI.Size = UDim2.new(0, 40, 0, 40)
    ToggleGUI.Font = Enum.Font.SourceSansBold
    ToggleGUI.Text = "NA"
    ToggleGUI.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleGUI.TextSize = 20

    local UICorner3 = Instance.new("UICorner")
    UICorner3.CornerRadius = UDim.new(0, 100)
    UICorner3.Parent = ToggleGUI

    self.Container = CMDS

    ToggleGUI.Active = true
    ToggleGUI.Draggable = true

    ToggleGUI.MouseButton1Click:Connect(function()
        Executor.Visible = not Executor.Visible
    end)

    Executor.Active = true
    Executor.Draggable = true
end

function AdminUILib:CreateButton(data)
    local Button = Instance.new("TextButton")
    Button.Name = data.Name or "Button"
    Button.Parent = self.Container
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(0, 680, 0, 50)
    Button.Font = Enum.Font.SourceSans
    Button.Text = "   " .. (data.Text or "Unnamed")
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 24
    Button.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel")
    Desc.Parent = Button
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0.02, 0, 0.55, 0)
    Desc.Size = UDim2.new(0, 400, 0, 20)
    Desc.Font = Enum.Font.SourceSans
    Desc.Text = "Description: " .. (data.Description or "No description")
    Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
    Desc.TextSize = 18
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    -- Tooltip
    if data.HasToolTip then
        local ToolTip = Instance.new("Frame")
        ToolTip.Name = "ToolTip"
        ToolTip.Parent = self.Container
        ToolTip.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ToolTip.BorderSizePixel = 0
        ToolTip.Size = UDim2.new(0, 200, 0, 60)
        ToolTip.Visible = false
        ToolTip.ZIndex = 10

        local TipText = Instance.new("TextLabel")
        TipText.Parent = ToolTip
        TipText.BackgroundTransparency = 1
        TipText.Size = UDim2.new(1, -10, 1, -10)
        TipText.Position = UDim2.new(0, 5, 0, 5)
        TipText.Font = Enum.Font.SourceSans
        TipText.Text = data.Description or "Tooltip"
        TipText.TextColor3 = Color3.fromRGB(255, 255, 255)
        TipText.TextSize = 18
        TipText.TextWrapped = true
        TipText.TextXAlignment = Enum.TextXAlignment.Left
        TipText.TextYAlignment = Enum.TextYAlignment.Top
        TipText.ZIndex = 11

        local mouse = game:GetService("Players").LocalPlayer:GetMouse()

        Button.MouseEnter:Connect(function()
            ToolTip.Visible = true
            TipText.Text = data.Description or "Tooltip"
        end)

        Button.MouseLeave:Connect(function()
            ToolTip.Visible = false
        end)

        game:GetService("RunService").RenderStepped:Connect(function()
            if ToolTip.Visible then
                ToolTip.Position = UDim2.new(0, mouse.X + 15, 0, mouse.Y + 15)
            end
        end)
    end

    Button.MouseButton1Click:Connect(function()
        if data.Callback then
            data.Callback()
        end
    end)

    return Button
end

return AdminUILib
