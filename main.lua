-- Alajmi Hub v7.3 | المطور العجمي (ZIndex Fixed Intro)
local ScreenGui = Instance.new("ScreenGui")
local BlackIntro = Instance.new("Frame")
local IntroText = Instance.new("TextLabel")
local IntroSubText = Instance.new("TextLabel")
local PromptFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local OpenBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AlajmiHubV7_ZIndexFixed"

-- ==================== 1. شاشة البداية (الشاشة السوداء والنصوص) ====================
BlackIntro.Name = "BlackIntro"
BlackIntro.Parent = ScreenGui
BlackIntro.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackIntro.Size = UDim2.new(1, 0, 1, 0)
BlackIntro.ZIndex = 100 -- طبقة الشاشة السوداء

IntroText.Parent = BlackIntro
IntroText.AnchorPoint = Vector2.new(0.5, 0.5)
IntroText.Position = UDim2.new(0.5, 0, 0.45, 0)
IntroText.Size = UDim2.new(0, 300, 0, 60)
IntroText.BackgroundTransparency = 1
IntroText.Text = "ALAJMI"
IntroText.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroText.TextSize = 42
IntroText.Font = Enum.Font.SourceSansBold
IntroText.ZIndex = 101 -- رفع النص ليكون فوق الشاشة السوداء تماماً

IntroSubText.Parent = BlackIntro
IntroSubText.AnchorPoint = Vector2.new(0.5, 0.5)
IntroSubText.Position = UDim2.new(0.5, 0, 0.53, 0)
IntroSubText.Size = UDim2.new(0, 200, 0, 30)
IntroSubText.BackgroundTransparency = 1
IntroSubText.Text = "by Alajmi"
IntroSubText.TextColor3 = Color3.fromRGB(180, 180, 180)
IntroSubText.TextSize = 18
IntroSubText.Font = Enum.Font.SourceSansItalic
IntroSubText.ZIndex = 101 -- رفع النص الفرعي فوق الشاشة السوداء

-- ==================== 2. نافذة التأكيد الترحيبية ====================
PromptFrame.Name = "PromptFrame"
PromptFrame.Parent = ScreenGui
PromptFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
PromptFrame.Position = UDim2.new(0.5, -150, 0.4, -75)
PromptFrame.Size = UDim2.new(0, 300, 0, 150)
PromptFrame.Active = true
PromptFrame.Draggable = true
PromptFrame.Visible = false

local PromptCorner = Instance.new("UICorner")
PromptCorner.CornerRadius = UDim.new(0, 12)
PromptCorner.Parent = PromptFrame

local PromptTitle = Instance.new("TextLabel")
PromptTitle.Parent = PromptFrame
PromptTitle.Size = UDim2.new(1, 0, 0, 45)
PromptTitle.BackgroundTransparency = 1
PromptTitle.Text = "⚡ Alajmi Hub"
PromptTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
PromptTitle.TextSize = 18
PromptTitle.Font = Enum.Font.SourceSansBold

local PromptText = Instance.new("TextLabel")
PromptText.Parent = PromptFrame
PromptText.Position = UDim2.new(0, 10, 0, 45)
PromptText.Size = UDim2.new(1, -20, 0, 40)
PromptText.BackgroundTransparency = 1
PromptText.Text = "مرحباً بك! هل ترغب في فتح السكربت الآن؟"
PromptText.TextColor3 = Color3.fromRGB(220, 220, 230)
PromptText.TextSize = 14
PromptText.Font = Enum.Font.SourceSans

local YesBtn = Instance.new("TextButton")
YesBtn.Parent = PromptFrame
YesBtn.Position = UDim2.new(0, 20, 0, 95)
YesBtn.Size = UDim2.new(0, 12
