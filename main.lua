-- Alajmi Hub v9.0 | Ultimate HD Admin Edition
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui") or Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AlajmiHubV9_HDAdmin"

-- ==================== 1. انيميشن الدخول (5 ثوانٍ) ====================
local IntroFrame = Instance.new("Frame")
IntroFrame.Name = "IntroFrame"
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
IntroFrame.ZIndex = 500
IntroFrame.Parent = ScreenGui

local IntroTitle = Instance.new("TextLabel")
IntroTitle.Parent = IntroFrame
IntroTitle.AnchorPoint = Vector2.new(0.5, 0.5)
IntroTitle.Position = UDim2.new(0.5, 0, 0.45, 0)
IntroTitle.Size = UDim2.new(0, 400, 0, 70)
IntroTitle.BackgroundTransparency = 1
IntroTitle.Text = "ALAJMI HUB"
IntroTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
IntroTitle.TextSize = 48
IntroTitle.Font = Enum.Font.GothamBold
IntroTitle.TextTransparency = 1
IntroTitle.ZIndex = 501

local IntroSub = Instance.new("TextLabel")
IntroSub.Parent = IntroFrame
IntroSub.AnchorPoint = Vector2.new(0.5, 0.5)
IntroSub.Position = UDim2.new(0.5, 0, 0.53, 0)
IntroSub.Size = UDim2.new(0, 300, 0, 30)
IntroSub.BackgroundTransparency = 1
IntroSub.Text = "HD Admin Edition • By Alajmi"
IntroSub.TextColor3 = Color3.fromRGB(180, 180, 200)
IntroSub.TextSize = 16
IntroSub.Font = Enum.Font.Gotham
IntroSub.TextTransparency = 1
IntroSub.ZIndex = 501

-- ==================== 2. الواجهة الرئيسية (Main Window) ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 560, 0, 380)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Transparency = 0.5
MainStroke.Parent = MainFrame

-- شريط العنوان (Top Bar)
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 250, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "👑 ALAJMI HUB (HD Admin)"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleLabel.TextSize = 17
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.Size = UDim2.new(0, 25
