-- Alajmi Hub v7.1 | المطور العجمي (Clean Intro - 5 Seconds)
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
ScreenGui.Name = "AlajmiHubV7_CleanIntro"

-- ==================== 1. شاشة البداية (الشاشة السوداء والنصوص فقط) ====================
BlackIntro.Name = "BlackIntro"
BlackIntro.Parent = ScreenGui
BlackIntro.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackIntro.Size = UDim2.new(1, 0, 1, 0)
BlackIntro.ZIndex = 10

IntroText.Parent = BlackIntro
IntroText.AnchorPoint = Vector2.new(0.5, 0.5)
IntroText.Position = UDim2.new(0.5, 0, 0.45, 0)
IntroText.Size = UDim2.new(0, 300, 0, 60)
IntroText.BackgroundTransparency = 1
IntroText.Text = "ALAJMI"
IntroText.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroText.TextSize = 42
IntroText.Font = Enum.Font.SourceSansBold
IntroText.TextTransparency = 1

IntroSubText.Parent = BlackIntro
IntroSubText.AnchorPoint = Vector2.new(0.5, 0.5)
IntroSubText.Position = UDim2.new(0.5, 0, 0.53, 0)
IntroSubText.Size = UDim2.new(0, 200, 0, 30)
IntroSubText.BackgroundTransparency = 1
IntroSubText.Text = "by Alajmi"
IntroSubText.TextColor3 = Color3.fromRGB(180, 180, 180)
IntroSubText.TextSize = 18
IntroSubText.Font = Enum.Font.SourceSansItalic
IntroSubText.TextTransparency = 1

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
YesBtn.Size = UDim2.new(0, 120, 0, 35)
YesBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 70)
YesBtn.Text = "نعم، فتح"
YesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YesBtn.Font = Enum.Font.SourceSansBold
YesBtn.TextSize = 14

local YesCorner = Instance.new("UICorner")
YesCorner.CornerRadius = UDim.new(0, 8)
YesCorner.Parent = YesBtn

local NoBtn = Instance.new("TextButton")
NoBtn.Parent = PromptFrame
NoBtn.Position = UDim2.new(1, -140, 0, 95)
NoBtn.Size = UDim2.new(0, 120, 0, 35)
NoBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
NoBtn.Text = "إلغاء"
NoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
NoBtn.Font = Enum.Font.SourceSansBold
NoBtn.TextSize = 14

local NoCorner = Instance.new("UICorner")
NoCorner.CornerRadius = UDim.new(0, 8)
NoCorner.Parent = NoBtn

-- ==================== 3. الواجهة الرئيسية والزر ====================
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
OpenBtn.Position = UDim2.new(0, 15, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 100, 0, 42)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Text = "⚡ Alajmi Hub"
OpenBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
OpenBtn.TextSize = 15
OpenBtn.Active = true
OpenBtn.Draggable = true
OpenBtn.Visible = false

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 10)
OpenCorner.Parent = OpenBtn

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 330, 0, 420)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(26, 26, 38)
Title.Text = "👑 Alajmi Hub | المطور العجمي"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

YesBtn.MouseButton1Click:Connect(function()
    PromptFrame.Visible = false
    MainFrame.Visible = true
    OpenBtn.Visible = true
end)

NoBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 8, 0, 50)
Scroll.Size = UDim2.new(1, -16, 1, -55)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 4.5, 0)
Scroll.ScrollBarThickness = 4

UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local function CreateHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = Scroll
    header.Size = UDim2.new(1, -10, 0, 25)
    header.BackgroundTransparency = 1
    header.Text = "✨ " .. text .. " ✨"
    header.TextColor3 = Color3.fromRGB(255, 215, 0)
    header.Font = Enum.Font.SourceSansBold
    header.TextSize = 14
end

local function CreateButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Scroll
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = color or Color3.fromRGB(28, 28, 40)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
    return btn
end

local function CreateTextBox(placeholder, callback)
    local box = Instance.new("TextBox")
    box.Parent = Scroll
    box.Size = UDim2.new(1, -10, 0, 38)
    box.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Font = Enum.Font.SourceSans
    box.TextSize = 13

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = box

    box.FocusLost:Connect(function()
        pcall(function() callback(box.Text) end)
    end)
    return box
end

-- ==================== 4. الوظائف والأوامر ====================
CreateHeader("نظام الانتقال السريع (TP)")

local SavedCFrame = nil
CreateButton("📍 حفظ المكان الحالي", Color3.fromRGB(35, 75, 50), function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        SavedCFrame = char.HumanoidRootPart.CFrame
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Alajmi Hub",
            Text = "تم حفظ الموقع بنجاح!",
            Duration = 3
        })
    end
end)

CreateButton("🚀 الانتقال للمكان المحفوظ", Color3.fromRGB(35, 75, 95), function()
    local char = game.Players.LocalPlayer.Character
    if SavedCFrame and char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = SavedCFrame
    end
end)

CreateHeader("التحكم المخصص بالحركة")

CreateTextBox("اكتب رقم السرعة المطلوب (مثال: 50)...", function(txt)
    local num = tonumber(txt)
    if num then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num end
end)

CreateTextBox("اكتب رقم قوة القفز المطلوب (مثال: 100)...", function(txt)
    local num = tonumber(txt)
    if num then
        local hum = game.Players.LocalPlayer.Character.Humanoid
        hum.UseJumpPower = true
        hum.JumpPower = num
    end
end)

CreateButton("🔄 إرجاع السرعة والقفز للطبيعي", Color3.fromRGB(38, 38, 55), function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.WalkSpeed = 16
    hum.JumpPower = 50
end)

CreateButton("🌌 جاذبية منخفضة (طفو)", Color3.fromRGB(38, 38, 55), function() game.Workspace.Gravity = 50 end)
CreateButton("🌍 إعادة الجاذبية الطبيعية", Color3.fromRGB(38, 38, 55), function() game.Workspace.Gravity = 196.2 end)

local InfJump = false
CreateButton("🔄 تفعيل/إلغاء القفز اللانهائي", Color3.fromRGB(50, 40, 70), function() InfJump = not InfJump end)
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then pcall(function() game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end
end)

CreateHeader("الكشف والشفافية")

local Noclip = false
CreateButton("👻 اختراق الجدران (Noclip)", Color3.fromRGB(60, 35, 75), function() Noclip = not Noclip end)
game:GetService("RunService").Stepped:Connect(function()
    if Noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

CreateButton("🎯 كشف أماكن اللاعبين (ESP)", Color3.fromRGB(60, 35, 75), function()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(255, 215, 0)
        end
    end
end)

CreateHeader("تعديل السكن والاسم")

local targetUser = ""
CreateTextBox("اكتب اسم اللاعب لنسخ سكنه...", function(txt) targetUser = txt end)

CreateButton("✨ نسخ السكن", Color3.fromRGB(30, 65, 50), function()
    local userId = game.Players:GetUserIdFromNameAsync(targetUser)
    if userId then
        local desc = game.Players:GetHumanoidDescriptionFromUserId(userId)
        game.Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
    end
end)

CreateTextBox("اكتب الاسم الوهمي الجديد...", function(txt)
    game.Players.LocalPlayer.Character.Humanoid.DisplayName = txt
end)

CreateButton("❌ إزالة الاكسسوارات", Color3.fromRGB(75, 35, 35), function()
    for _, item in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if item:IsA("Accessory") then item:Destroy() end
    end
end)

CreateHeader("البيئة والوقت")

CreateButton("☀️ تحويل الوقت إلى نهار", Color3.fromRGB(45, 50, 70), function() game.Lighting.ClockTime = 12 end)
CreateButton("🌙 تحويل الوقت إلى ليل", Color3.fromRGB(45, 50, 70), function() game.Lighting.ClockTime = 0 end)
CreateButton("💡 إزالة الضباب وضبط الرؤية", Color3.fromRGB(45, 50, 70), function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end)

CreateButton("📷 زاوية رؤية واسعة (Max FOV)", Color3.fromRGB(45, 50, 70), function() game.Workspace.CurrentCamera.FieldOfView = 120 end)
CreateButton("📷 زاوية رؤية طبيعية (Normal FOV)", Color3.fromRGB(45, 50, 70), function() game.Workspace.CurrentCamera.FieldOfView = 70 end)

CreateHeader("خيارات عامة")

CreateButton("🔄 إعادة الظهور (Reset)", Color3.fromRGB(100, 30, 30), function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- ==================== 5. انيميشن التلاشي 5 ثوانٍ ====================
task.spawn(function()
    local TweenService = game:GetService("TweenService")
    
    -- ظهور النص التدريجي
    TweenService:Create(IntroText, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
    TweenService:Create(IntroSubText, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
    task.wait(2.5)

    -- اختفاء الشاشة السوداء والنصوص تدريجياً
    TweenService:Create(IntroText, TweenInfo.new(1), {TextTransparency = 1}):Play()
    TweenService:Create(IntroSubText, TweenInfo.new(1), {TextTransparency = 1}):Play()
    TweenService:Create(BlackIntro, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.wait(1)

    BlackIntro.Visible = false
    PromptFrame.Visible = true
end)
