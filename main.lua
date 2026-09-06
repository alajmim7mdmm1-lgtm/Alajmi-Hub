-- Alajmi Hub v9.1 | Ultimate HD Admin Edition (Bug Fixes)
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
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230, 50, 50)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- القائمة الجانبية (Sidebar)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Padding = UDim.new(0, 6)

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)
SidePadding.Parent = Sidebar

-- منطقة المحتوى
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -140, 1, -45)
ContentFrame.Position = UDim2.new(0, 140, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local Pages = {}

local function CreateTab(name, icon)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 36)
    TabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    TabBtn.Text = icon .. " " .. name
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 12
    TabBtn.Parent = Sidebar

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabBtn

    local PageScroll = Instance.new("ScrollingFrame")
    PageScroll.Size = UDim2.new(1, -16, 1, -16)
    PageScroll.Position = UDim2.new(0, 8, 0, 8)
    PageScroll.BackgroundTransparency = 1
    PageScroll.Visible = false
    PageScroll.CanvasSize = UDim2.new(0, 0, 6, 0)
    PageScroll.ScrollBarThickness = 4
    PageScroll.Parent = ContentFrame

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = PageScroll
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 8)

    Pages[name] = {Btn = TabBtn, Page = PageScroll}

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Pages) do
            tab.Page.Visible = false
            tab.Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            tab.Btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
        PageScroll.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        TabBtn.TextColor3 = Color3.fromRGB(15, 15, 20)
    end)

    return PageScroll
end

-- زر فتح/إغلاق الواجهة العائم
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 34)
ToggleBtn.Text = "👑"
ToggleBtn.TextSize = 24
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Visible = false
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 2
ToggleStroke.Color = Color3.fromRGB(255, 215, 0)
ToggleStroke.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- أدوات إضافة العناصر
local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(240, 240, 250)
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 13
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

local function AddInput(parent, placeholder, callback)
    local Box = Instance.new("TextBox")
    Box.Size = UDim2.new(1, 0, 0, 38)
    Box.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    Box.PlaceholderText = placeholder
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 12
    Box.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Box

    Box.FocusLost:Connect(function()
        pcall(function() callback(Box.Text) end)
    end)
end

-- ==================== 3. الأقسام والأوامر (HD Admin Commands) ====================
local AdminPage = CreateTab("أوامر الأدمن", "🛡️")
local MovePage = CreateTab("الحركة والطيران", "⚡")
local VisualPage = CreateTab("الكشف والحماية", "👁️")
local FunPage = CreateTab("أوامر المرح والتعديل", "🎭")

Pages["أوامر الأدمن"].Page.Visible = true
Pages["أوامر الأدمن"].Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Pages["أوامر الأدمن"].Btn.TextColor3 = Color3.fromRGB(15, 15, 20)

-- === 1. أوامر الأدمن الرئيسية ===
local targetPlayer = ""
AddInput(AdminPage, "اكتب اسم اللاعب المستهدف...", function(txt) targetPlayer = txt end)

local function GetPlayer(name)
    for _, v in pairs(Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #name) == string.lower(name) or string.sub(string.lower(v.DisplayName), 1, #name) == string.lower(name) then
            return v
        end
    end
    return nil
end

AddButton(AdminPage, "🚀 الانتقال إلى اللاعب (Goto)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)

AddButton(AdminPage, "💀 إعادة الترسيب / القتل المحالي (Reset/Kill)", function()
    if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        Players.LocalPlayer.Character.Humanoid.Health = 0
    end
end)

local Frozen = false
AddButton(AdminPage, "❄️ تجميد/إلغاء تجميد النفس (Freeze)", function()
    Frozen = not Frozen
    if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Players.LocalPlayer.Character.HumanoidRootPart.Anchored = Frozen
    end
end)

AddButton(AdminPage, "👻 الاختفاء الكامل (Invisibility)", function()
    local char = Players.LocalPlayer.Character
    if char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                v.Transparency = 1
            end
        end
    end
end)

AddButton(AdminPage, "✨ الإظهار بعد الاختفاء (Visible)", function()
    local char = Players.LocalPlayer.Character
    if char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 0
            elseif v:IsA("Decal") then
                v.Transparency = 0
            end
        end
    end
end)

-- === 2. الحركة والطيران ===
local Flying = false
local FlySpeed = 50
local FlyConnection = nil

AddButton(MovePage, "🕊️ تفعيل / إيقاف الطيران (Fly)", function()
    Flying = not Flying
    local LP = Players.LocalPlayer
    local Mouse = LP:GetMouse()
    
    if Flying then
        local T = LP.Character:FindFirstChild("HumanoidRootPart")
        if not T then return end
        
        local BG = Instance.new("BodyGyro", T)
        local BV = Instance.new("BodyVelocity", T)
        BG.P = 9e4
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0.1, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        LP.Character.Humanoid.PlatformStand = true
        
        FlyConnection = RunService.RenderStepped:Connect(function()
            if Flying and T and LP.Character:FindFirstChild("Humanoid") then
                BV.velocity = Mouse.Hit.lookVector * FlySpeed
                BG.cframe = CFrame.new(T.Position, Mouse.Hit.p)
            else
                if FlyConnection then FlyConnection:Disconnect() end
                BG:Destroy()
                BV:Destroy()
                if LP.Character:FindFirstChild("Humanoid") then
                    LP.Character.Humanoid.PlatformStand = false
                end
            end
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.PlatformStand = false
        end
    end
end)

AddInput(MovePage, "تغيير سرعة الطيران (الافتراضي: 50)...", function(txt)
    local num = tonumber(txt)
    if num then FlySpeed = num end
end)

AddInput(MovePage, "تغيير سرعة المشي (WalkSpeed)...", function(txt)
    local num = tonumber(txt)
    if num then Players.LocalPlayer.Character.Humanoid.WalkSpeed = num end
end)

AddInput(MovePage, "تغيير قوة القفز (JumpPower)...", function(txt)
    local num = tonumber(txt)
    if num then
        local hum = Players.LocalPlayer.Character.Humanoid
        hum.UseJumpPower = true
        hum.JumpPower = num
    end
end)

local InfJump = false
AddButton(MovePage, "🔄 القفز اللانهائي (Infinite Jump)", function() InfJump = not InfJump end)
UserInputService.JumpRequest:Connect(function()
    if InfJump then pcall(function() Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end
end)

-- === 3. الكشف والحماية ===
local Noclip = false
AddButton(VisualPage, "👻 اختراق الجدران (Noclip)", function() Noclip = not Noclip end)
RunService.Stepped:Connect(function()
    if Noclip and Players.LocalPlayer.Character then
        for _, part in pairs(Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

AddButton(VisualPage, "🎯 كشف أماكن جميع اللاعبين (ESP)", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(255, 215, 0)
        end
    end
end)

AddButton(VisualPage, "🛡️ درع الخلود (God Mode)", function()
    local char = Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.MaxHealth = math.huge
        char.Humanoid.Health = math.huge
    end
end)

-- === 4. أوامر المرح والتعديل ===
AddInput(FunPage, "تكبير / تصغير الشخصية (Scale 1-5)...", function(txt)
    local scale = tonumber(txt)
    if scale and Players.LocalPlayer.Character then
        local hum = Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            pcall(function()
                if hum:FindFirstChild("BodyHeightScale") then hum.BodyHeightScale.Value = scale end
                if hum:FindFirstChild("BodyWidthScale") then hum.BodyWidthScale.Value = scale end
                if hum:FindFirstChild("BodyDepthScale") then hum.BodyDepthScale.Value = scale end
            end)
        end
    end
end)

AddInput(FunPage, "نسخ سكن أي لاعب بالأوفلاين...", function(txt)
    pcall(function()
        local userId = Players:GetUserIdFromNameAsync(txt)
        if userId then
            local desc = Players:GetHumanoidDescriptionFromUserId(userId)
            Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
        end
    end)
end)

AddButton(FunPage, "🛠️ إعطاء أدوات Btools", function()
    local LP = Players.LocalPlayer
    for i = 1, 4 do
        local tool = Instance.new("HopperBin")
        tool.BinType = i
        tool.Parent = LP.Backpack
    end
end)

AddButton(FunPage, "💡 إزالة الضباب والرؤية الفائقة (Fullbright)", function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end)

-- ==================== 4. تشغيل انيميشن البداية (5 ثوانٍ) ====================
task.spawn(function()
    TweenService:Create(IntroTitle, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
    TweenService:Create(IntroSub, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
    task.wait(2.5)

    TweenService:Create(IntroTitle, TweenInfo.new(1), {TextTransparency = 1}):Play()
    TweenService:Create(IntroSub, TweenInfo.new(1), {TextTransparency = 1}):Play()
    TweenService:Create(IntroFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.wait(1)

    IntroFrame:Destroy()
    MainFrame.Visible = true
    ToggleBtn.Visible = true
end)
