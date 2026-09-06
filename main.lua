-- ==================== ALAJMI HUB v14.0 | ULTIMATE EDITION ====================
local INTRO_IMAGE_ID = "125663430836995" 
local TOGGLE_ICON_ID = "136680882538074" 

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
ScreenGui.Name = "AlajmiHubV14"

local success, _ = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not success then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- ==================== 1. شاشة التحميل ====================
local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
IntroFrame.ZIndex = 500
IntroFrame.Parent = ScreenGui

local IntroImage = Instance.new("ImageLabel")
IntroImage.Parent = IntroFrame
IntroImage.Size = UDim2.new(1, 0, 1, 0)
IntroImage.BackgroundTransparency = 1
IntroImage.Image = "rbxassetid://" .. tostring(INTRO_IMAGE_ID)
IntroImage.ScaleType = Enum.ScaleType.Fit
IntroImage.ZIndex = 501

local IntroUser = Instance.new("TextLabel")
IntroUser.Parent = IntroFrame
IntroUser.AnchorPoint = Vector2.new(0.5, 0.5)
IntroUser.Position = UDim2.new(0.5, 0, 0.88, 0)
IntroUser.Size = UDim2.new(0, 500, 0, 30)
IntroUser.BackgroundTransparency = 1
IntroUser.Text = "أهلاً بك: " .. LocalPlayer.Name
IntroUser.TextColor3 = Color3.fromRGB(255, 215, 0)
IntroUser.TextSize = 22
IntroUser.Font = Enum.Font.GothamBold
IntroUser.TextTransparency = 1
IntroUser.ZIndex = 502

-- ==================== 2. الواجهة الرئيسية ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 720, 0, 480)
MainFrame.Position = UDim2.new(0.5, -360, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 36)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2.5
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Transparency = 0.2
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 35, 58)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 16)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.Position = UDim2.new(0, 18, 0, 0)
TitleLabel.Size = UDim2.new(0, 400, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "👑 ALAJMI HUB | ULTIMATE 50+ COMMANDS"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Position = UDim2.new(1, -40, 0, 12)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.BackgroundColor3 = Color3.fromRGB(240, 60, 80)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 13

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 180, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 18, 30)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.Padding = UDim.new(0, 6)

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.PaddingLeft = UDim.new(0, 10)
SidePadding.PaddingRight = UDim.new(0, 10)
SidePadding.Parent = Sidebar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -180, 1, -50)
ContentFrame.Position = UDim2.new(0, 180, 0, 50)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local Pages = {}

local function CreateTab(name, icon)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 36)
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 32, 52)
    TabBtn.Text = icon .. " " .. name
    TabBtn.TextColor3 = Color3.fromRGB(180, 200, 230)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 11
    TabBtn.Parent = Sidebar

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabBtn

    local PageScroll = Instance.new("ScrollingFrame")
    PageScroll.Size = UDim2.new(1, -20, 1, -20)
    PageScroll.Position = UDim2.new(0, 10, 0, 10)
    PageScroll.BackgroundTransparency = 1
    PageScroll.Visible = false
    PageScroll.ScrollBarThickness = 5
    PageScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    PageScroll.Parent = ContentFrame

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = PageScroll
    PageLayout.Padding = UDim.new(0, 6)
    
    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PageScroll.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 25)
    end)

    Pages[name] = {Btn = TabBtn, Page = PageScroll}

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Pages) do
            tab.Page.Visible = false
            tab.Btn.BackgroundColor3 = Color3.fromRGB(25, 32, 52)
            tab.Btn.TextColor3 = Color3.fromRGB(180, 200, 230)
        end
        PageScroll.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        TabBtn.TextColor3 = Color3.fromRGB(10, 15, 25)
    end)

    return PageScroll
end

-- زر الإخفاء والإظهار الجانبي
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -27)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(28, 35, 58)
ToggleBtn.Image = "rbxassetid://" .. tostring(TOGGLE_ICON_ID)
ToggleBtn.ScaleType = Enum.ScaleType.Fit
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Visible = false
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 2.5
ToggleStroke.Color = Color3.fromRGB(255, 215, 0)
ToggleStroke.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 34)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 38, 62)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(230, 240, 255)
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 11
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function() pcall(callback) end)
    return Btn
end

local function AddInput(parent, placeholder, callback)
    local Box = Instance.new("TextBox")
    Box.Size = UDim2.new(1, 0, 0, 34)
    Box.BackgroundColor3 = Color3.fromRGB(20, 26, 42)
    Box.PlaceholderText = placeholder
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 11
    Box.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Box

    Box.FocusLost:Connect(function()
        if Box.Text ~= "" then pcall(function() callback(Box.Text) end) end
    end)
    return Box
end

-- ==================== 3. الأقسام ====================
local MovePage = CreateTab("الحركة والطيران", "⚡")
local AdminPage = CreateTab("أدوات الأدمن", "🛡️")
local VisualPage = CreateTab("الكشف والرؤية", "👁️")
local FarmPage = CreateTab("تجميع وتنقل", "🎒")
local FunPage = CreateTab("تعديل وحركات", "🎭")
local ServerPage = CreateTab("السيرفر والنظام", "🌐")

Pages["الحركة والطيران"].Page.Visible = true
Pages["الحركة والطيران"].Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Pages["الحركة والطيران"].Btn.TextColor3 = Color3.fromRGB(10, 15, 25)

-- ==================== 1. قسم الحركة والطيران المعدل ====================
local SpeedValue = 16
local SpeedEnabled = false
local JumpValue = 50
local JumpEnabled = false

AddInput(MovePage, "1. ⚡ حدد السرعة...", function(txt) SpeedValue = tonumber(txt) or 16 end)
local SpeedToggleBtn
SpeedToggleBtn = AddButton(MovePage, "2. 🔴 تشغيل السرعة الفائقة", function()
    SpeedEnabled = not SpeedEnabled
    SpeedToggleBtn.Text = SpeedEnabled and "🟢 إيقاف السرعة" or "2. 🔴 تشغيل السرعة الفائقة"
    SpeedToggleBtn.BackgroundColor3 = SpeedEnabled and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(30, 38, 62)
end)

AddInput(MovePage, "3. 🚀 حدد قوة القفز...", function(txt) JumpValue = tonumber(txt) or 50 end)
local JumpToggleBtn
JumpToggleBtn = AddButton(MovePage, "4. 🔴 تشغيل القفز العالي", function()
    JumpEnabled = not JumpEnabled
    JumpToggleBtn.Text = JumpEnabled and "🟢 إيقاف القفز العالي" or "4. 🔴 تشغيل القفز العالي"
    JumpToggleBtn.BackgroundColor3 = JumpEnabled and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(30, 38, 62)
end)

-- إصلاح طيران الـ CFrame المطور
local Flying = false
local FlySpeed = 50
local FlyConnection

AddInput(MovePage, "5. 🕊️ حدد سرعة الطيران...", function(txt) FlySpeed = tonumber(txt) or 50 end)

local FlyToggleBtn
FlyToggleBtn = AddButton(MovePage, "6. 🔴 تشغيل الطيران المطور (CFrame Fly)", function()
    Flying = not Flying
    FlyToggleBtn.Text = Flying and "🟢 إيقاف الطيران" or "6. 🔴 تشغيل الطيران المطور (CFrame Fly)"
    FlyToggleBtn.BackgroundColor3 = Flying and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(30, 38, 62)

    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")

    if Flying then
        if hum then hum.PlatformStand = true end
        FlyConnection = RunService.RenderStepped:Connect(function(delta)
            if not Flying or not root then return end
            local moveVector = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.E) or UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVector = moveVector + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Q) or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveVector = moveVector - Vector3.new(0, 1, 0) end

            root.CFrame = root.CFrame + (moveVector * FlySpeed * delta)
            root.Velocity = Vector3.zero
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if hum then hum.PlatformStand = false end
    end
end)

local InfJump = false
AddButton(MovePage, "7. 🔄 القفز اللانهائي (Infinite Jump)", function() InfJump = not InfJump end)
UserInputService.JumpRequest:Connect(function()
    if InfJump then pcall(function() LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end
end)

AddButton(MovePage, "8. ⚓ تثبيت الشخصية مكانها (Anchor)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Anchored = not LocalPlayer.Character.HumanoidRootPart.Anchored
    end
end)

AddButton(MovePage, "9. 🌊 عدم الانزلاق على الأسطح", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0, 0, 0)
    end
end)

AddButton(MovePage, "10. 🚶 الحركة السريعة بالأرض (Low Gravity)", function()
    Workspace.Gravity = Workspace.Gravity == 196.2 and 50 or 196.2
end)

-- Loop تحديث الحركة والسرعة
RunService.RenderStepped:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if SpeedEnabled then hum.WalkSpeed = SpeedValue end
            if JumpEnabled then hum.UseJumpPower = true; hum.JumpPower = JumpValue end
        end
    end)
end)

-- ==================== 2. قسم أدوات الأدمن ====================
local targetPlayer = ""
local function GetPlayer(name)
    for _, v in pairs(Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #name) == string.lower(name) or string.sub(string.lower(v.DisplayName), 1, #name) == string.lower(name) then
            return v
        end
    end
    return nil
end

AddInput(AdminPage, "11. 👤 اسم اللاعب المستهدف...", function(txt) targetPlayer = txt end)
AddButton(AdminPage, "12. 🚀 الانتقال المباشر للاعب (Goto)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)
AddButton(AdminPage, "13. 👀 مراقبة كاميرا اللاعب (Spectate)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        Camera.CameraSubject = target.Character.Humanoid
    end
end)
AddButton(AdminPage, "14. ❌ إيقاف المراقبة (Unspectate)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Camera.CameraSubject = LocalPlayer.Character.Humanoid
    end
end)
AddButton(AdminPage, "15. 💀 إنهاء وتجديد الشخصية (Reset)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)
AddButton(AdminPage, "16. 💥 إسقاط الأدوات من الحقيبة (Drop Tools)", function()
    if LocalPlayer.Character then
        for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then tool.Parent = LocalPlayer.Character; tool.Parent = Workspace end
        end
    end
end)
AddButton(AdminPage, "17. 🛡️ إزالة ملحقات الشخصية (Remove Accessories)", function()
    if LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("Accessory") then v:Destroy() end
        end
    end
end)
AddButton(AdminPage, "18. 📏 تكبير حجم الشخصية", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        if hum:FindFirstChild("BodyScaleManager") then hum.BodyScaleManager:Destroy() end
    end
end)
AddButton(AdminPage, "19. 🏃 جعل الشخصية تتبع لاعب (Bring/Follow)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character then
        RunService:BindToRenderStep("FollowPlayer", 1, function()
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            end
        end)
    end
end)
AddButton(AdminPage, "20. 🛑 إيقاف تتبع اللاعب", function()
    RunService:UnbindFromRenderStep("FollowPlayer")
end)

-- ==================== 3. قسم الكشف والرؤية ====================
local Noclip = false
local NoclipBtn
NoclipBtn = AddButton(VisualPage, "21. 🔴 اختراق الجدران (Noclip)", function()
    Noclip = not Noclip
    NoclipBtn.Text = Noclip and "🟢 إيقاف اختراق الجدران" or "21. 🔴 اختراق الجدران (Noclip)"
    NoclipBtn.BackgroundColor3 = Noclip and Color3.fromRGB(0, 180, 120) or Color3.fromRGB(30, 38, 62)
end)

RunService.Stepped:Connect(function()
    if Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

AddButton(VisualPage, "22. 🎯 كشف أماكن اللاعبين (ESP Highlight)", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(255, 215, 0)
        end
    end
end)

AddButton(VisualPage, "23. 📛 رؤية أسماء ومسافات اللاعبين (ESP Names)", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local bb = Instance.new("BillboardGui")
            bb.Size = UDim2.new(0, 100, 0, 30)
            bb.AlwaysOnTop = true
            bb.Adornee = player.Character.Head
            bb.Parent = player.Character.Head
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(1, 0, 1, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = player.Name
            lbl.TextColor3 = Color3.fromRGB(0, 255, 150)
            lbl.TextSize = 12
            lbl.Font = Enum.Font.GothamBold
            lbl.Parent = bb
        end
    end
end)

AddButton(VisualPage, "24. 💡 إضاءة الماب الفائقة (Fullbright)", function()
    Lighting.Brightness = 3
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end)

AddButton(VisualPage, "25. 🌫️ إزالة الضباب بالكامل (No Fog)", function()
    Lighting.FogEnd = 9e9
end)

AddButton(VisualPage, "26. 🔴 رؤية من خلال الجدران (X-Ray)", function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part:IsDescendantOf(LocalPlayer.Character) then
            part.LocalTransparencyModifier = 0.5
        end
    end
end)

AddButton(VisualPage, "27. 🟢 إلغاء الـ X-Ray (إعادة المباني)", function()
    for _, part in pairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.LocalTransparencyModifier = 0
        end
    end
end)

local ClickTP = false
AddButton(VisualPage, "28. 🖱️ التلفيل بالنقر (Click Teleport)", function()
    ClickTP = not ClickTP
    local mouse = LocalPlayer:GetMouse()
    mouse.Button1Down:Connect(function()
        if ClickTP and mouse.Target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)
end)

-- ==================== 4. قسم التجميع والتنقل ====================
AddButton(FarmPage, "29. 🎒 سحب جميع الأدوات الملقاة (Auto Pick Tools)", function()
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            obj.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)

AddButton(FarmPage, "30. 🧲 التجميع التلقائي للقطع القريبة (Auto Collect Parts)", function()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("TouchTransmitter") and obj.Parent then
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 0)
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 1)
        end
    end
end)

AddButton(FarmPage, "31. 📍 حفظ موقعك الحالي (Save Checkpoint)", function()
    _G.SavedCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
end)

AddButton(FarmPage, "32. 🌀 الانتقال للموقع المحفوظ (Load Checkpoint)", function()
    if _G.SavedCFrame then
        LocalPlayer.Character.HumanoidRootPart.CFrame = _G.SavedCFrame
    end
end)

AddButton(FarmPage, "33. 🔒 تثبيت الكاميرا خلف الشخصية", function()
    LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
end)

AddButton(FarmPage, "34. 🔓 فك قفل الكاميرا", function()
    LocalPlayer.CameraMode = Enum.CameraMode.Classic
end)

AddButton(FarmPage, "35. ⚡ زيادة مسافة التقاط الأشياء", function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            v.MaxActivationDistance = 100
            v.RequiresLineOfSight = false
        end
    end
end)

AddButton(FarmPage, "36. ⏩ إلغاء وقت الانتظار للأزرار (Instant Prompt)", function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            v.HoldDuration = 0
        end
    end
end)

-- ==================== 5. قسم التعديل والحركات ====================
local Spinning = false
AddButton(FunPage, "37. 🌀 الدوران التلقائي (SpinBot)", function()
    Spinning = not Spinning
    task.spawn(function()
        while Spinning do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(25), 0)
            end
            task.wait(0.02)
        end
    end)
end)

AddButton(FunPage, "38. 🛠️ إضافة أدوات البناء الأساسية (Btools)", function()
    for i = 1, 4 do
        local t = Instance.new("HopperBin")
        t.BinType = i
        t.Parent = LocalPlayer.Backpack
    end
end)

AddInput(FunPage, "39. 🔍 تحديد مسافة زوم الكاميرا...", function(txt)
    local z = tonumber(txt)
    if z then LocalPlayer.CameraMaxZoomDistance = z end
end)

AddButton(FunPage, "40. 🤸 رقصة الحركة غير المنتهية (FE Dance)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://182435998"
        local track = LocalPlayer.Character.Humanoid:LoadAnimation(anim)
        track:Play()
    end
end)

AddButton(FunPage, "41. 👻 وضع الاختفاء الصوري (Ghost Body)", function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.Transparency = 0.5 end
        end
    end
end)

AddButton(FunPage, "42. 👤 إعادة إظهار الشخصية (Unhide Body)", function()
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.Transparency = 0 end
        end
    end
end)

AddButton(FunPage, "43. 🙃 قلب الشاشة 180 درجة", function()
    Camera.CFrame = Camera.CFrame * CFrame.Angles(0, 0, math.rad(180))
end)

AddButton(FunPage, "44. 💥 إزالة رأس الشخصية (Headless Visual)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        LocalPlayer.Character.Head.Transparency = 1
    end
end)

-- ==================== 6. قسم السيرفر والنظام ====================
AddButton(ServerPage, "45. 🔄 إعادة الدخول لنفس السيرفر (Rejoin)", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

AddButton(ServerPage, "46. 🔀 الانتقال لسيرفر آخر تلقائياً (Server Hop)", function()
    local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    for _, s in pairs(Servers.data) do
        if s.playing ~= s.maxPlayers and s.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer)
            break
        end
    end
end)

AddButton(ServerPage, "47. 📋 نسخ رابط السيرفر الحالي (Copy Server JobID)", function()
    setclipboard(tostring(game.JobId))
end)

AddButton(ServerPage, "48. 🗑️ تنظيف اللاغ وتسريع اللعبة (FPS Booster)", function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
    end
end)

AddButton(ServerPage, "49. ⚡ رفع معدل الفريمات (Unlock FPS)", function()
    if setfpscap then setfpscap(240) end
end)

AddButton(ServerPage, "50. ❌ إغلاق وتدمير السكربت بالكامل", function()
    ScreenGui:Destroy()
end)

-- ==================== 4. تشغيل حركات شاشة التحميل ====================
task.spawn(function()
    TweenService:Create(IntroUser, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2.5)

    TweenService:Create(IntroUser, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(IntroImage, TweenInfo.new(0.6), {ImageTransparency = 1}):Play()
    TweenService:Create(IntroFrame, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    task.wait(0.6)

    IntroFrame:Destroy()
    MainFrame.Visible = true
    ToggleBtn.Visible = true
end)
