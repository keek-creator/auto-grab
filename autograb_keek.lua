local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local GRAB_RADIUS = 7 
local COOLDOWN_TIME = 0.8 
local LastGrabTime = 0

-- Remove old GUI
if CoreGui:FindFirstChild("AutoGrabGui") then 
    CoreGui.AutoGrabGui:Destroy() 
end

local sg = Instance.new("ScreenGui")
sg.Name = "AutoGrabGui"
sg.ResetOnSpawn = false
sg.Parent = CoreGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 180) -- smaller UI
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
mainFrame.BackgroundTransparency = 0.06
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = sg

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Auto Grab - Keek"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Font = Enum.Font.GothamBlack
title.Parent = mainFrame

-- Buttons
local grabButton = Instance.new("TextButton")
grabButton.Size = UDim2.new(0.85, 0, 0, 35)
grabButton.Position = UDim2.new(0.5, 0, 0, 70)
grabButton.AnchorPoint = Vector2.new(0.5, 0.5)
grabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
grabButton.Text = "INSTANT GRAB"
grabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
grabButton.TextSize = 13
grabButton.Font = Enum.Font.GothamBold
grabButton.Parent = mainFrame
Instance.new("UICorner", grabButton).CornerRadius = UDim.new(0, 8)

local autoButton = Instance.new("TextButton")
autoButton.Size = UDim2.new(0.85, 0, 0, 35)
autoButton.Position = UDim2.new(0.5, 0, 0, 115)
autoButton.AnchorPoint = Vector2.new(0.5, 0.5)
autoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoButton.Text = "AUTO GRAB: OFF"
autoButton.TextColor3 = Color3.fromRGB(0, 0, 0)
autoButton.TextSize = 13
autoButton.Font = Enum.Font.GothamBold
autoButton.Parent = mainFrame
Instance.new("UICorner", autoButton).CornerRadius = UDim.new(0, 8)

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 150)
status.BackgroundTransparency = 1
status.Text = "Ready"
status.TextColor3 = Color3.fromRGB(180, 180, 180)
status.TextSize = 12
status.Font = Enum.Font.GothamMedium
status.Parent = mainFrame

-- RED OUTLINE
local uiStroke = Instance.new("UIStroke", mainFrame)
uiStroke.Thickness = 2.5
uiStroke.Color = Color3.fromRGB(255, 0, 0)

-- باقي logic unchanged

print("AutoGrab Keek Loaded")
