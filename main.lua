-- Alajmi Hub v12.1 | Clean Name Edition
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlajmiHubV12_Clean"

-- حماية حشو السكربت في الواجهة
local success, _ = pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)
if not success then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ==================== 1. شاشة التحميل ====================
local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
IntroFrame.ZIndex = 500
IntroFrame.Parent = ScreenGui

local IntroTitle = Instance.new("TextLabel")
IntroTitle.Parent = IntroFrame
IntroTitle.AnchorPoint = Vector2.new(0.5, 0.5)
IntroTitle.Position = UDim2.new(0.5, 0, 0.43, 0)
IntroTitle.Size = UDim2.new(0, 500, 0, 70)
IntroTitle.BackgroundTransparency = 1
IntroTitle.Text = "ALAJMI HUB"
IntroTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
IntroTitle.TextSize = 46
IntroTitle.Font = Enum.Font.GothamBold
IntroTitle.TextTransparency = 1

local IntroUser = Instance.new("TextLabel")
IntroUser.Parent = IntroFrame
IntroUser.AnchorPoint = Vector2.new(0.5, 0.5)
IntroUser.Position = UDim2.new(0.5, 0, 0.52, 0)
IntroUser.Size = UDim2.new(0, 500, 0, 30)
IntroUser.BackgroundTransparency = 1
IntroUser.Text = "مرحباً بك: " .. LocalPlayer.Name
IntroUser.TextColor3 = Color3.fromRGB(220, 220, 240)
IntroUser.TextSize = 20
IntroUser.Font = Enum.Font.GothamMedium
IntroUser.TextTransparency = 1

-- ==================== 2. الواجهة الرئيسية ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 620, 0, 420)
MainFrame.Position = UDim2.new(0.5, -310, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- شريط العنوان العلوي
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 350, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "👑 ALAJMI HUB | " .. LocalPlayer.Name
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleLabel.TextSize = 16
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
CloseBtn.TextSize = 13

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- القائمة الجانبية
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.Padding = UDim.new(0, 5)

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 8)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)
SidePadding.Parent = Sidebar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -160, 1, -45)
ContentFrame.Position = UDim2.new(0, 160, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local Pages = {}

local function CreateTab(name, icon)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 36)
    TabBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
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
    PageScroll.ScrollBarThickness = 5
    PageScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    PageScroll.Parent = ContentFrame

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = PageScroll
    PageLayout.Padding = UDim.new(0, 6)
    
    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PageScroll.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
    end)

    Pages[name] = {Btn = TabBtn, Page = PageScroll}

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Pages) do
            tab.Page.Visible = false
            tab.Btn.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
            tab.Btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
        PageScroll.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        TabBtn.TextColor3 = Color3.fromRGB(15, 15, 20)
    end)

    return PageScroll
end

-- الزر العائم
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
ToggleBtn.Text = "👑"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 22
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

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- أزرار ومربعات الإدخال
local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 34)
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(240, 240, 250)
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 12
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function() pcall(callback) end)
end

local function AddInput(parent, placeholder, callback)
    local Box = Instance.new("TextBox")
    Box.Size = UDim2.new(1, 0, 0, 34)
    Box.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    Box.PlaceholderText = placeholder
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 12
    Box.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Box

    Box.FocusLost:Connect(function()
        if Box.Text ~= "" then
            pcall(function() callback(Box.Text) end)
        end
    end)
end

-- ==================== 3. الأقسام والأوامر ====================
local AdminPage = CreateTab("أدوات الأدمن", "🛡️")
local MovePage = CreateTab("الحركة والطيران", "⚡")
local VisualPage = CreateTab("الكشف والرؤية", "👁️")
local FunPage = CreateTab("تعديل الشخصية", "🎭")

Pages["أدوات الأدمن"].Page.Visible = true
Pages["أدوات الأدمن"].Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Pages["أدوات الأدمن"].Btn.TextColor3 = Color3.fromRGB(15, 15, 20)

local targetPlayer = ""
local function GetPlayer(name)
    for _, v in pairs(Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #name) == string.lower(name) or string.sub(string.lower(v.DisplayName), 1, #name) == string.lower(name) then
            return v
        end
    end
    return nil
end

-- === 1. أدوات الأدمن ===
AddInput(AdminPage, "اكتب اسم اللاعب المستهدف...", function(txt) targetPlayer = txt end)
AddButton(AdminPage, "🚀 الانتقال إلى اللاعب (Goto)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)
AddButton(AdminPage, "💀 إعادة ظهور (Reset)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

-- === 2. التحكم بالسرعة المباشر والقفز ===
AddInput(MovePage, "⚡ حدد السرعة (اكتب أي رقم مثل 500)...", function(txt)
    local speed = tonumber(txt)
    if speed then
        task.spawn(function()
            while task.wait(0.1) do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.WalkSpeed = speed
                end
            end
        end)
    end
end)

AddInput(MovePage, "🚀 حدد قوة القفز (مثل 200)...", function(txt)
    local jump = tonumber(txt)
    if jump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = jump
    end
end)

local Flying = false
local FlySpeed = 50
local FlyConnection = nil

AddInput(MovePage, "🕊️ سرعة الطيران (مثل 300)...", function(txt)
    local s = tonumber(txt)
    if s then FlySpeed = s end
end)

AddButton(MovePage, "🕊️ تشغيل / إيقاف الطيران (Fly)", function()
    Flying = not Flying
    local Mouse = LocalPlayer:GetMouse()
    if Flying then
        local T = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not T then return end
        local BG = Instance.new("BodyGyro", T)
        local BV = Instance.new("BodyVelocity", T)
        BG.P = 9e4
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0.1, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        LocalPlayer.Character.Humanoid.PlatformStand = true
        
        FlyConnection = RunService.RenderStepped:Connect(function()
            if Flying and T and LocalPlayer.Character:FindFirstChild("Humanoid") then
                BV.velocity = Mouse.Hit.lookVector * FlySpeed
                BG.cframe = CFrame.new(T.Position, Mouse.Hit.p)
            else
                if FlyConnection then FlyConnection:Disconnect() end
                BG:Destroy() BV:Destroy()
                if LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end
end)

local InfJump = false
AddButton(MovePage, "🔄 القفز اللانهائي (Infinite Jump)", function() InfJump = not InfJump end)
UserInputService.JumpRequest:Connect(function()
    if InfJump then pcall(function() LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end
end)

AddButton(MovePage, "🛑 إعادة السرعة والقفز للافتراضي", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

-- === 3. الكشف والرؤية ===
local Noclip = false
AddButton(VisualPage, "👻 اختراق الجدران (Noclip)", function() Noclip = not Noclip end)
RunService.Stepped:Connect(function()
    if Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

AddButton(VisualPage, "🎯 كشف أماكن اللاعبين (ESP Highlight)", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(255, 215, 0)
        end
    end
end)

AddButton(VisualPage, "💡 إضاءة الماب (Fullbright)", function()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end)

-- === 4. تعديل الشخصية ===
AddInput(FunPage, "🛠️ حجم الشخصية (1-5)...", function(txt)
    local scale = tonumber(txt)
    if scale and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        pcall(function()
            if hum:FindFirstChild("BodyHeightScale") then hum.BodyHeightScale.Value = scale end
            if hum:FindFirstChild("BodyWidthScale") then hum.BodyWidthScale.Value = scale end
            if hum:FindFirstChild("BodyDepthScale") then hum.BodyDepthScale.Value = scale end
        end)
    end
end)

AddButton(FunPage, "🛠️ الحصول على أدوات البناء (Btools)", function()
    for i = 1, 4 do
        local t = Instance.new("HopperBin")
        t.BinType = i
        t.Parent = LocalPlayer.Backpack
    end
end)

-- ==================== 4. تشغيل التحميل بوضوح ====================
task.spawn(function()
    TweenService:Create(IntroTitle, TweenInfo.new(1), {TextTransparency = 0}):Play()
    TweenService:Create(IntroUser, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2.2)

    TweenService:Create(IntroTitle, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(IntroUser, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(IntroFrame, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    task.wait(0.6)

    IntroFrame:Destroy()
    MainFrame.Visible = true
    ToggleBtn.Visible = true
end)
