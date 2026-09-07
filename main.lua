-- ==================== M7M HUB v30.0 | FULL COMMANDS INCLUDED ====================
local TOGGLE_ICON_ID = "6031097225" 
local DISCORD_INVITE = "https://discord.gg/ZWWuxWkvq"

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "M7MHubV30"

local success, _ = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not success then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local CurrentLang = "AR"

-- ==================== 1. شاشة اختيار اللغة (بدون خلفية سوداء) ====================
local LangFrame = Instance.new("Frame", ScreenGui)
LangFrame.Size = UDim2.new(1, 0, 1, 0)
LangFrame.BackgroundTransparency = 1
LangFrame.ZIndex = 600

local LangBox = Instance.new("Frame", LangFrame)
LangBox.Size = UDim2.new(0, 360, 0, 220)
LangBox.Position = UDim2.new(0.5, -180, 0.5, -110)
LangBox.BackgroundColor3 = Color3.fromRGB(15, 18, 28)
LangBox.BorderSizePixel = 0
Instance.new("UICorner", LangBox).CornerRadius = UDim.new(0, 12)
local LangStroke = Instance.new("UIStroke", LangBox)
LangStroke.Thickness = 1.5
LangStroke.Color = Color3.fromRGB(255, 215, 0)

local LangTitle = Instance.new("TextLabel", LangBox)
LangTitle.Size = UDim2.new(1, 0, 0, 50)
LangTitle.Position = UDim2.new(0, 0, 0, 15)
LangTitle.BackgroundTransparency = 1
LangTitle.Text = "SELECT LANGUAGE / اختر اللغة"
LangTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
LangTitle.Font = Enum.Font.GothamBold
LangTitle.TextSize = 15

local ArabicBtn = Instance.new("TextButton", LangBox)
ArabicBtn.Size = UDim2.new(0, 140, 0, 45)
ArabicBtn.Position = UDim2.new(0.08, 0, 0.5, 0)
ArabicBtn.BackgroundColor3 = Color3.fromRGB(25, 32, 50)
ArabicBtn.Text = "العربية 🇸🇦"
ArabicBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ArabicBtn.Font = Enum.Font.GothamBold
ArabicBtn.TextSize = 14
Instance.new("UICorner", ArabicBtn).CornerRadius = UDim.new(0, 8)

local EnglishBtn = Instance.new("TextButton", LangBox)
EnglishBtn.Size = UDim2.new(0, 140, 0, 45)
EnglishBtn.Position = UDim2.new(0.53, 0, 0.5, 0)
EnglishBtn.BackgroundColor3 = Color3.fromRGB(25, 32, 50)
EnglishBtn.Text = "English 🇺🇸"
EnglishBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishBtn.Font = Enum.Font.GothamBold
EnglishBtn.TextSize = 14
Instance.new("UICorner", EnglishBtn).CornerRadius = UDim.new(0, 8)

-- ==================== نظام الإشعارات ====================
local NotifyContainer = Instance.new("Frame")
NotifyContainer.Size = UDim2.new(0, 250, 1, 0)
NotifyContainer.Position = UDim2.new(1, -260, 0, 20)
NotifyContainer.BackgroundTransparency = 1
NotifyContainer.Parent = ScreenGui

local NotifyLayout = Instance.new("UIListLayout")
NotifyLayout.Parent = NotifyContainer
NotifyLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifyLayout.Padding = UDim.new(0, 8)

local function Notify(title, text, duration)
    duration = duration or 3
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, 0, 0, 50)
    Card.BackgroundColor3 = Color3.fromRGB(20, 25, 38)
    Card.Position = UDim2.new(1, 300, 0, 0)
    Card.Parent = NotifyContainer

    Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", Card)
    Stroke.Color = Color3.fromRGB(255, 215, 0)
    Stroke.Thickness = 1

    local TitleLbl = Instance.new("TextLabel", Card)
    TitleLbl.Size = UDim2.new(1, -10, 0, 20)
    TitleLbl.Position = UDim2.new(0, 10, 0, 4)
    TitleLbl.Text = title
    TitleLbl.TextColor3 = Color3.fromRGB(255, 215, 0)
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.TextSize = 12
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
    TitleLbl.BackgroundTransparency = 1

    local TextLbl = Instance.new("TextLabel", Card)
    TextLbl.Size = UDim2.new(1, -10, 0, 20)
    TextLbl.Position = UDim2.new(0, 10, 0, 24)
    TextLbl.Text = text
    TextLbl.TextColor3 = Color3.fromRGB(200, 210, 225)
    TextLbl.Font = Enum.Font.Gotham
    TextLbl.TextSize = 10
    TextLbl.TextXAlignment = Enum.TextXAlignment.Left
    TextLbl.BackgroundTransparency = 1

    TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()

    task.delay(duration, function()
        local tweenOut = TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 0, 0)})
        tweenOut:Play()
        tweenOut.Completed:Connect(function() Card:Destroy() end)
    end)
end

-- ==================== 2. الواجهة الرئيسية ====================
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 780, 0, 520)
MainFrame.Position = UDim2.new(0.5, -390, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 14, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(255, 215, 0)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
TopBar.BorderSizePixel = 0
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "👑 M7M HUB V30"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeBtn = Instance.new("TextButton", TopBar)
MinimizeBtn.Position = UDim2.new(1, -70, 0, 12)
MinimizeBtn.Size = UDim2.new(0, 26, 0, 26)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 16
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(1, 0)

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Position = UDim2.new(1, -35, 0, 12)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.BackgroundColor3 = Color3.fromRGB(235, 60, 80)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 180, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
Sidebar.BorderSizePixel = 0

local SideLayout = Instance.new("UIListLayout", Sidebar)
SideLayout.Padding = UDim.new(0, 4)
local SidePadding = Instance.new("UIPadding", Sidebar)
SidePadding.PaddingTop = UDim.new(0, 8)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, -180, 1, -50)
ContentFrame.Position = UDim2.new(0, 180, 0, 50)
ContentFrame.BackgroundTransparency = 1

local Pages = {}
local AllButtons = {}

local function CreateTab(nameAr, nameEn, icon)
    local TabBtn = Instance.new("TextButton", Sidebar)
    TabBtn.Size = UDim2.new(1, 0, 0, 34)
    TabBtn.BackgroundColor3 = Color3.fromRGB(16, 20, 30)
    TabBtn.Text = icon .. "  " .. nameAr
    TabBtn.TextColor3 = Color3.fromRGB(160, 175, 200)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 11
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local PageScroll = Instance.new("ScrollingFrame", ContentFrame)
    PageScroll.Size = UDim2.new(1, -16, 1, -16)
    PageScroll.Position = UDim2.new(0, 8, 0, 8)
    PageScroll.BackgroundTransparency = 1
    PageScroll.Visible = false
    PageScroll.ScrollBarThickness = 3
    PageScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)

    local PageLayout = Instance.new("UIListLayout", PageScroll)
    PageLayout.Padding = UDim.new(0, 6)
    
    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PageScroll.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
    end)

    Pages[nameAr] = {Btn = TabBtn, Page = PageScroll, NameAr = nameAr, NameEn = nameEn, Icon = icon}

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Pages) do
            tab.Page.Visible = false
            tab.Btn.BackgroundColor3 = Color3.fromRGB(16, 20, 30)
            tab.Btn.TextColor3 = Color3.fromRGB(160, 175, 200)
        end
        PageScroll.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        TabBtn.TextColor3 = Color3.fromRGB(10, 12, 18)
    end)

    return PageScroll
end

local ToggleBtn = Instance.new("ImageButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 48, 0, 48)
ToggleBtn.Position = UDim2.new(0, 15, 0.5, -24)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
ToggleBtn.Image = "rbxassetid://" .. tostring(TOGGLE_ICON_ID)
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Visible = false
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
ToggleStroke.Thickness = 1.5
ToggleStroke.Color = Color3.fromRGB(255, 215, 0)

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local function AddButton(parent, textAr, textEn, callback)
    local Btn = Instance.new("TextButton", parent)
    Btn.Size = UDim2.new(1, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(22, 28, 42)
    Btn.Text = textAr
    Btn.TextColor3 = Color3.fromRGB(220, 235, 255)
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 11
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    table.insert(AllButtons, {Obj = Btn, TextAr = textAr, TextEn = textEn})

    Btn.MouseButton1Click:Connect(function()
        pcall(callback)
        local msg = CurrentLang == "AR" and ("تم تنفيذ: " .. textAr) or ("Executed: " .. textEn)
        Notify("M7M HUB", msg, 2)
    end)
    return Btn
end

local function AddInput(parent, placeholderAr, placeholderEn, callback)
    local Box = Instance.new("TextBox", parent)
    Box.Size = UDim2.new(1, 0, 0, 32)
    Box.BackgroundColor3 = Color3.fromRGB(16, 20, 30)
    Box.PlaceholderText = placeholderAr
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 11
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

    Box.FocusLost:Connect(function()
        if Box.Text ~= "" then pcall(function() callback(Box.Text) end) end
    end)
    return Box
end

-- ==================== إنشـاء الأقسـام ====================
local MovePage = CreateTab("الحركة والفيزياء", "Movement & Physics", "⚡")
local VisualPage = CreateTab("الرؤية والـ ESP", "Visuals & ESP", "👁️")
local PlayerPage = CreateTab("خيارات اللاعب", "Player Settings", "👤")
local ServerPage = CreateTab("السيرفر والنظام", "Server & System", "🌐")

-- ==================== 1. أومـار الحركة والفيزياء ====================
local FlySpeed = 50
local Flying = false
local FlyBodyVel, FlyBodyGyro

AddButton(MovePage, "🕊️ تفعيل/إلغاء الطيران (Fly)", "🕊️ Toggle Fly", function()
    Flying = not Flying
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if Flying and hrp then
        FlyBodyVel = Instance.new("BodyVelocity", hrp)
        FlyBodyVel.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        FlyBodyGyro = Instance.new("BodyGyro", hrp)
        FlyBodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        
        task.spawn(function()
            while Flying and hrp and hrp.Parent do
                FlyBodyVel.Velocity = Camera.CFrame.LookVector * FlySpeed
                FlyBodyGyro.CFrame = Camera.CFrame
                RunService.RenderStepped:Wait()
            end
            if FlyBodyVel then FlyBodyVel:Destroy() end
            if FlyBodyGyro then FlyBodyGyro:Destroy() end
        end)
    end
end)

AddInput(MovePage, "سرعة الطيران (مثال: 100)", "Fly Speed (e.g. 100)", function(val)
    FlySpeed = tonumber(val) or 50
end)

AddButton(MovePage, "🏃‍♂️ السرعة الفائقة (Speed 100)", "🏃‍♂️ Speed 100", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end
end)

AddButton(MovePage, "🔄 إعادة السرعة الأصلية (Speed 16)", "🔄 Reset Speed (16)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

AddButton(MovePage, "🦘 القفز العالي (Jump Power 120)", "🦘 Jump Power 120", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = 120
    end
end)

AddButton(MovePage, "👻 اختراق الجدران (Noclip)", "👻 Noclip Mode", function()
    RunService.Stepped:Connect(function()
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)
end)

AddButton(MovePage, "🚀 قفز لانهائي (Infinite Jump)", "🚀 Infinite Jump", function()
    UserInputService.JumpRequest:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)

-- ==================== 2. أومـار الرؤية والـ ESP ====================
local ESP_Active = false
AddButton(VisualPage, "👁️ تفعيل كاشف اللاعبين (ESP Box)", "👁️ Toggle Player ESP", function()
    ESP_Active = not ESP_Active
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            if ESP_Active then
                local Highlight = Instance.new("Highlight")
                Highlight.Name = "M7M_ESP"
                Highlight.FillColor = Color3.fromRGB(255, 215, 0)
                Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                Highlight.Parent = p.Character
            else
                if p.Character:FindFirstChild("M7M_ESP") then
                    p.Character.M7M_ESP:Destroy()
                end
            end
        end
    end
end)

AddButton(VisualPage, "☀️ إزالة الضباب ورؤية واضحة (Fullbright)", "☀️ Fullbright Mode", function()
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
    Lighting.ColorShift_Top = Color3.new(1, 1, 1)
end)

-- ==================== 3. أومـار اللاعب والنظام ====================
AddButton(PlayerPage, "❤️ إعادة تعيين الشخصية (Reset)", "❤️ Reset Character", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)

AddButton(PlayerPage, "📷 تغيير زاوية الرؤية (FOV 120)", "📷 Set FOV 120", function()
    Camera.FieldOfView = 120
end)

-- ==================== 4. قسم السيرفر والروابط ====================
AddButton(ServerPage, "🔗 نسخ رابط سيرفر M7M (Discord)", "🔗 Copy M7M Discord Link", function()
    if setclipboard then
        setclipboard(DISCORD_INVITE)
        local msg = (CurrentLang == "AR") and "تم نسخ رابط الديسكورد بنجاح!" or "Discord link copied successfully!"
        Notify("M7M HUB", msg, 3)
    else
        local msg = (CurrentLang == "AR") and "مُنفذ السكربت لا يدعم النسخ التلقائي" or "Executor does not support setclipboard"
        Notify("M7M HUB", msg, 3)
    end
end)

AddButton(ServerPage, "🔄 إعادة الاتصال بالسيرفر (Rejoin)", "🔄 Rejoin Server", function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

-- ==================== بدء التشغيل ====================
local function StartScript(lang)
    CurrentLang = lang
    LangFrame:Destroy()

    for _, item in pairs(AllButtons) do
        item.Obj.Text = (CurrentLang == "AR") and item.TextAr or item.TextEn
    end

    for _, tab in pairs(Pages) do
        tab.Btn.Text = tab.Icon .. "  " .. ((CurrentLang == "AR") and tab.NameAr or tab.NameEn)
    end

    MainFrame.Visible = true
    ToggleBtn.Visible = true

    Pages["الحركة والفيزياء"].Page.Visible = true
    Pages["الحركة والفيزياء"].Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Pages["الحركة والفيزياء"].Btn.TextColor3 = Color3.fromRGB(10, 12, 18)

    local welcomeMsg = (CurrentLang == "AR") and "تم تحميل الأوامر بنجاح!" or "Commands loaded successfully!"
    Notify("M7M HUB", welcomeMsg, 3)
end

ArabicBtn.MouseButton1Click:Connect(function() StartScript("AR") end)
EnglishBtn.MouseButton1Click:Connect(function() StartScript("EN") end)
