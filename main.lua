-- ==================== ALAJMI HUB v20.0 | 120 ULTIMATE COMMANDS ====================
local INTRO_IMAGE_ID = "10042431086" 
local TOGGLE_ICON_ID = "6031097225" 

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
ScreenGui.Name = "AlajmiHubV20"

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
IntroImage.Size = UDim2.new(0, 180, 0, 180)
IntroImage.Position = UDim2.new(0.5, -90, 0.4, -90)
IntroImage.BackgroundTransparency = 1
IntroImage.Image = "rbxassetid://" .. tostring(INTRO_IMAGE_ID)
IntroImage.ScaleType = Enum.ScaleType.Fit
IntroImage.ZIndex = 501

local IntroUser = Instance.new("TextLabel")
IntroUser.Parent = IntroFrame
IntroUser.AnchorPoint = Vector2.new(0.5, 0.5)
IntroUser.Position = UDim2.new(0.5, 0, 0.78, 0)
IntroUser.Size = UDim2.new(0, 500, 0, 30)
IntroUser.BackgroundTransparency = 1
IntroUser.Text = "أهلاً بك: " .. LocalPlayer.Name .. " | 120 COMMANDS LOADED"
IntroUser.TextColor3 = Color3.fromRGB(255, 215, 0)
IntroUser.TextSize = 20
IntroUser.Font = Enum.Font.GothamBold
IntroUser.TextTransparency = 1
IntroUser.ZIndex = 502

-- ==================== 2. الواجهة الرئيسية ====================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 750, 0, 500)
MainFrame.Position = UDim2.new(0.5, -375, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 28)
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
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(24, 28, 45)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 450, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "👑 ALAJMI HUB | 120 FULL WORKING COMMANDS"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TopBar
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.BackgroundColor3 = Color3.fromRGB(230, 50, 70)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 170, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(12, 14, 22)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideLayout = Instance.new("UIListLayout")
SideLayout.Parent = Sidebar
SideLayout.Padding = UDim.new(0, 4)

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 8)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)
SidePadding.Parent = Sidebar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -170, 1, -45)
ContentFrame.Position = UDim2.new(0, 170, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local Pages = {}

local function CreateTab(name, icon)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 32)
    TabBtn.BackgroundColor3 = Color3.fromRGB(20, 24, 38)
    TabBtn.Text = icon .. " " .. name
    TabBtn.TextColor3 = Color3.fromRGB(170, 190, 220)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 10
    TabBtn.Parent = Sidebar

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabBtn

    local PageScroll = Instance.new("ScrollingFrame")
    PageScroll.Size = UDim2.new(1, -16, 1, -16)
    PageScroll.Position = UDim2.new(0, 8, 0, 8)
    PageScroll.BackgroundTransparency = 1
    PageScroll.Visible = false
    PageScroll.ScrollBarThickness = 4
    PageScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    PageScroll.Parent = ContentFrame

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = PageScroll
    PageLayout.Padding = UDim.new(0, 5)
    
    PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PageScroll.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
    end)

    Pages[name] = {Btn = TabBtn, Page = PageScroll}

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Pages) do
            tab.Page.Visible = false
            tab.Btn.BackgroundColor3 = Color3.fromRGB(20, 24, 38)
            tab.Btn.TextColor3 = Color3.fromRGB(170, 190, 220)
        end
        PageScroll.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        TabBtn.TextColor3 = Color3.fromRGB(10, 12, 20)
    end)

    return PageScroll
end

-- زر الإخفاء والإظهار
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 15, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(24, 28, 45)
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
ToggleStroke.Thickness = 2
ToggleStroke.Color = Color3.fromRGB(255, 215, 0)
ToggleStroke.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 30)
    Btn.BackgroundColor3 = Color3.fromRGB(25, 32, 50)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(220, 235, 255)
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 10
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function() pcall(callback) end)
    return Btn
end

local function AddInput(parent, placeholder, callback)
    local Box = Instance.new("TextBox")
    Box.Size = UDim2.new(1, 0, 0, 30)
    Box.BackgroundColor3 = Color3.fromRGB(18, 22, 34)
    Box.PlaceholderText = placeholder
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 10
    Box.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Box

    Box.FocusLost:Connect(function()
        if Box.Text ~= "" then pcall(function() callback(Box.Text) end) end
    end)
    return Box
end

-- ==================== 3. إنشاء الأقسام الـ 8 ====================
local MovePage = CreateTab("الحركة والطيران", "⚡")
local MassPage = CreateTab("أوامر الكل", "👥")
local VisualPage = CreateTab("الكشف والرؤية", "👁️")
local AdminPage = CreateTab("أدوات الأدمن", "🛡️")
local FarmPage = CreateTab("التجميع والتنقل", "🎒")
local FunPage = CreateTab("الحركات والرقص", "🎭")
local CharPage = CreateTab("تعديل الشخصية", "👤")
local ServerPage = CreateTab("السيرفر والنظام", "🌐")

Pages["الحركة والطيران"].Page.Visible = true
Pages["الحركة والطيران"].Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Pages["الحركة والطيران"].Btn.TextColor3 = Color3.fromRGB(10, 12, 20)

-- ==================== القسم 1: الحركة والطيران (1 - 15) ====================
local SpeedVal, SpeedOn = 16, false
local JumpVal, JumpOn = 50, false
local FlyOn, FlySpeed = false, 50
local FlyConnection, InfJump = nil, false

AddInput(MovePage, "1. ⚡ تحديد درجة السرعة...", function(txt) SpeedVal = tonumber(txt) or 16 end)
AddButton(MovePage, "2. 🔴 تشغيل / إيقاف السرعة الفائقة", function() SpeedOn = not SpeedOn end)
AddInput(MovePage, "3. 🚀 تحديد قوة القفز...", function(txt) JumpVal = tonumber(txt) or 50 end)
AddButton(MovePage, "4. 🔴 تشغيل / إيقاف القفز العالي", function() JumpOn = not JumpOn end)
AddInput(MovePage, "5. 🕊️ تحديد سرعة الطيران...", function(txt) FlySpeed = tonumber(txt) or 50 end)
AddButton(MovePage, "6. 🔴 تشغيل / إيقاف طيران CFrame", function()
    FlyOn = not FlyOn
    local char = LocalPlayer.Character
    if FlyOn and char then
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = true end
        FlyConnection = RunService.RenderStepped:Connect(function(delta)
            if not FlyOn or not root then return end
            local vec = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then vec = vec + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then vec = vec - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then vec = vec - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then vec = vec + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vec = vec + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vec = vec - Vector3.new(0, 1, 0) end
            root.CFrame = root.CFrame + (vec * FlySpeed * delta)
            root.Velocity = Vector3.zero
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if char and char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid").PlatformStand = false end
    end
end)
AddButton(MovePage, "7. 🔄 القفز اللانهائي (Infinite Jump)", function() InfJump = not InfJump end)
UserInputService.JumpRequest:Connect(function()
    if InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
AddButton(MovePage, "8. ⚓ تثبيت الشخصية (Anchor)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Anchored = not LocalPlayer.Character.HumanoidRootPart.Anchored
    end
end)
AddButton(MovePage, "9. 🌊 جاذبية منخفضة (Low Gravity)", function() Workspace.Gravity = 50 end)
AddButton(MovePage, "10. 🌍 جاذبية عالية (High Gravity)", function() Workspace.Gravity = 400 end)
AddButton(MovePage, "11. ⚖️ إعادة الجاذبية الطبيعية", function() Workspace.Gravity = 196.2 end)
AddButton(MovePage, "12. 🚶 المشي على الهواء (Air Walk)", function()
    local p = Instance.new("Part", Workspace)
    p.Size = Vector3.new(10, 1, 10)
    p.Anchored = true
    p.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.5, 0)
end)
AddButton(MovePage, "13. 🏊 وضع السباحة بالأرض (Swim)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Swimming)
    end
end)
AddButton(MovePage, "14. 🛑 إلغاء وضع السباحة", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end)
AddButton(MovePage, "15. 💨 اندفاع سريع للأمام (Dash Forward)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -15)
    end
end)

RunService.RenderStepped:Connect(function()
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if SpeedOn then hum.WalkSpeed = SpeedVal end
            if JumpOn then hum.UseJumpPower = true; hum.JumpPower = JumpVal end
        end
    end)
end)

-- ==================== القسم 2: أوامر الكل (16 - 30) ====================
AddButton(MassPage, "16. 🧲 سحب جميع الأدوات للجميع", function()
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            obj.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)
AddButton(MassPage, "17. 🎯 كشف وتحديد جميع اللاعبين (ESP All)", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("Highlight") then
            local h = Instance.new("Highlight", p.Character)
            h.FillColor = Color3.fromRGB(255, 0, 0)
        end
    end
end)
AddButton(MassPage, "18. 📛 إظهار أسماء جميع اللاعبين (Names All)", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and not p.Character.Head:FindFirstChild("Tag") then
            local bb = Instance.new("BillboardGui", p.Character.Head)
            bb.Name = "Tag"
            bb.Size = UDim2.new(0, 100, 0, 30)
            bb.AlwaysOnTop = true
            local lbl = Instance.new("TextLabel", bb)
            lbl.Size = UDim2.new(1, 0, 1, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = p.Name
            lbl.TextColor3 = Color3.fromRGB(255, 215, 0)
            lbl.Font = Enum.Font.GothamBold
        end
    end
end)
local LoopTP = false
AddButton(MassPage, "19. 🌀 الانتقال التلقائي بين جميع اللاعبين", function()
    LoopTP = not LoopTP
    task.spawn(function()
        while LoopTP do
            for _, p in pairs(Players:GetPlayers()) do
                if not LoopTP then break end
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    task.wait(1)
                end
            end
            task.wait(0.5)
        end
    end)
end)
local SpectateAll = false
AddButton(MassPage, "20. 👀 التناقل بمشاهدة الكاميرا بين الجميع", function()
    SpectateAll = not SpectateAll
    task.spawn(function()
        while SpectateAll do
            for _, p in pairs(Players:GetPlayers()) do
                if not SpectateAll then break end
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                    Camera.CameraSubject = p.Character.Humanoid
                    task.wait(2)
                end
            end
            task.wait(0.5)
        end
        if LocalPlayer.Character then Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") end
    end)
end)
AddButton(MassPage, "21. 💥 رمي وإسقاط كل الحقيبة (Drop All Tools)", function()
    if LocalPlayer.Character then
        for _, t in pairs(LocalPlayer.Backpack:GetChildren()) do
            if t:IsA("Tool") then t.Parent = LocalPlayer.Character; t.Parent = Workspace end
        end
    end
end)
AddButton(MassPage, "22. ⚡ تفعيل جميع أزرار التفاعل (Trigger All)", function()
    for _, p in pairs(Workspace:GetDescendants()) do
        if p:IsA("ProximityPrompt") then fireproximityprompt(p) end
    end
end)
AddButton(MassPage, "23. 🧊 تجميد نفسك محلياً (Freeze Self)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
end)
AddButton(MassPage, "24. 🔓 فك تجميد نفسك (Unfreeze Self)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
end)
AddButton(MassPage, "25. 📏 تكبير حجم ملحقات الجميع (Visual Big)", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            for _, acc in pairs(p.Character:GetChildren()) do
                if acc:IsA("Accessory") and acc:FindFirstChild("Handle") then
                    acc.Handle.Size = acc.Handle.Size * 1.5
                end
            end
        end
    end
end)
AddButton(MassPage, "26. 🔊 تشغيل شات صوتي محلي (Mute/Unmute All)", function()
    pcall(function() VoiceChatService:ToggleSelfMute() end)
end)
AddButton(MassPage, "27. 📍 جلب جميع الأجسام الملقاة (Get Unanchored)", function()
    for _, p in pairs(Workspace:GetChildren()) do
        if p:IsA("BasePart") and not p.Anchored then
            p.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
end)
AddButton(MassPage, "28. 🚨 إرسال تنبيه للجميع بالشات (Admin Chat)", function()
    pcall(function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:SendAsync("[ALAJMI HUB ACTIVE]", "All")
    end)
end)
AddButton(MassPage, "29. 🛑 إلغاء كشف جميع اللاعبين (Clear ESP)", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            if p.Character:FindFirstChild("Highlight") then p.Character.Highlight:Destroy() end
            if p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("Tag") then p.Character.Head.Tag:Destroy() end
        end
    end
end)
AddButton(MassPage, "30. 🛡️ حماية ضد سحب الأدوات (Anti-Tool Steal)", function()
    if LocalPlayer.Character then
        LocalPlayer.Character.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then child.CanBeDropped = false end
        end)
    end
end)

-- ==================== القسم 3: الكشف والرؤية (31 - 45) ====================
local Noclip = false
AddButton(VisualPage, "31. 🔴 اختراق الجدران (Noclip)", function() Noclip = not Noclip end)
RunService.Stepped:Connect(function()
    if Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)
AddButton(VisualPage, "32. 💡 إضاءة الماب الفائقة (Fullbright)", function()
    Lighting.Brightness = 3
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
end)
AddButton(VisualPage, "33. 🌫️ إزالة الضباب بالكامل (No Fog)", function() Lighting.FogEnd = 9e9 end)
AddButton(VisualPage, "34. 👁️ رؤية من خلال الجدران (X-Ray)", function()
    for _, p in pairs(Workspace:GetDescendants()) do
        if p:IsA("BasePart") and not p:IsDescendantOf(LocalPlayer.Character) then p.LocalTransparencyModifier = 0.5 end
    end
end)
AddButton(VisualPage, "35. 🟢 إلغاء الـ X-Ray", function()
    for _, p in pairs(Workspace:GetDescendants()) do
        if p:IsA("BasePart") then p.LocalTransparencyModifier = 0 end
    end
end)
AddButton(VisualPage, "36. 🌙 وضع الرؤية الليلية (Night Vision)", function()
    Lighting.Ambient = Color3.fromRGB(0, 255, 0)
end)
AddButton(VisualPage, "37. ☀️ إعادة الإضاءة الليلية للعادية", function()
    Lighting.Ambient = Color3.fromRGB(128, 128, 128)
end)
AddButton(VisualPage, "38. 📦 مربع كشف اللاعبين (Box ESP)", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local b = Instance.new("SelectionBox", p.Character)
            b.Adornee = p.Character
            b.Color3 = Color3.fromRGB(0, 255, 255)
        end
    end
end)
AddButton(VisualPage, "39. 📏 كشف المسافة بينك وبين اللاعبين", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            local dist = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude)
            print(p.Name .. " Distance: " .. dist)
        end
    end
end)
local ClickTP = false
AddButton(VisualPage, "40. 🖱️ التلفيل بالنقر (Click Teleport)", function()
    ClickTP = not ClickTP
    local m = LocalPlayer:GetMouse()
    m.Button1Down:Connect(function()
        if ClickTP and m.Target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(m.Hit.Position + Vector3.new(0, 3, 0))
        end
    end)
end)
AddButton(VisualPage, "41. 🔍 زوم كاميرا غير محدود", function() LocalPlayer.CameraMaxZoomDistance = 100000 end)
AddButton(VisualPage, "42. 🔒 قفل الزوم على الوضع الطبيعي", function() LocalPlayer.CameraMaxZoomDistance = 128 end)
AddButton(VisualPage, "43. 📷 منظور الشخص الأول الزباري (First Person)", function() LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson end)
AddButton(VisualPage, "44. 📷 إعادة منظور الكاميرا العادي", function() LocalPlayer.CameraMode = Enum.CameraMode.Classic end)
AddButton(VisualPage, "45. 🌈 تغيير لون الظلال للشمس", function() Lighting.OutdoorAmbient = Color3.fromRGB(255, 215, 0) end)

-- ==================== القسم 4: أدوات الأدمن (46 - 60) ====================
local targetP = ""
local function GetP(n)
    for _, v in pairs(Players:GetPlayers()) do
        if string.sub(string.lower(v.Name), 1, #n) == string.lower(n) or string.sub(string.lower(v.DisplayName), 1, #n) == string.lower(n) then return v end
    end
    return nil
end

AddInput(AdminPage, "46. 👤 تحديد اسم اللاعب...", function(txt) targetP = txt end)
AddButton(AdminPage, "47. 🚀 الانتقال للاعب (Goto)", function()
    local t = GetP(targetP)
    if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame
    end
end)
AddButton(AdminPage, "48. 👀 مراقبة اللاعب (Spectate)", function()
    local t = GetP(targetP)
    if t and t.Character and t.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = t.Character.Humanoid end
end)
AddButton(AdminPage, "49. ❌ إيقاف المراقبة (Unspectate)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = LocalPlayer.Character.Humanoid end
end)
AddButton(AdminPage, "50. 💀 تجديد وشعوذة الشخصية (Reset)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.Health = 0 end
end)
AddButton(AdminPage, "51. 🏃 ملاحقة وتتبع لاعب (Follow)", function()
    local t = GetP(targetP)
    if t then
        RunService:BindToRenderStep("FollowP", 1, function()
            if t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            end
        end)
    end
end)
AddButton(AdminPage, "52. 🛑 إيقاف ملاحقة اللاعب", function() RunService:UnbindFromRenderStep("FollowP") end)
AddButton(AdminPage, "53. 🗑️ مسح الملحقات والقبعات (Remove Hats)", function()
    if LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetChildren()) do if v:IsA("Accessory") then v:Destroy() end end
    end
end)
AddButton(AdminPage, "54. 🎒 إظهار حقائب الأغراض المخفية", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then
            for _, t in pairs(p.Backpack:GetChildren()) do print(p.Name .. " Has Tool: " .. t.Name) end
        end
    end
end)
AddButton(AdminPage, "55. 🛑 إيقاف حركات الشخصية (Freeze Anims)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        for _, tr in pairs(LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do tr:Stop() end
    end
end)
AddButton(AdminPage, "56. 📌 الانتقال لأعلى نقطة بالماب", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 500, 0)
    end
end)
AddButton(AdminPage, "57. 🕳️ الانتقال لأسفل الماب", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0, 50, 0)
    end
end)
AddButton(AdminPage, "58. 🛡️ تفعيل حماية ضد الإسقاط (Anti-Void)", function()
    local p = Instance.new("Part", Workspace)
    p.Size = Vector3.new(2000, 1, 2000)
    p.Position = Vector3.new(0, -100, 0)
    p.Anchored = true
end)
AddButton(AdminPage, "59. 🔄 تجديد الأجزاء المتضررة باللعبة", function()
    if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
end)
AddButton(AdminPage, "60. 📜 طباعة قائمة اللاعبين بالسيرفر بالـ Output", function()
    for _, p in pairs(Players:GetPlayers()) do print("Player: " .. p.Name .. " | ID: " .. p.UserId) end
end)

-- ==================== القسم 5: التجميع والتنقل (61 - 75) ====================
AddButton(FarmPage, "61. 📍 حفظ موقعك الحالي (Save Checkpoint)", function() _G.SavedCF = LocalPlayer.Character.HumanoidRootPart.CFrame end)
AddButton(FarmPage, "62. 🌀 الانتقال للموقع المحفوظ (Load Checkpoint)", function() if _G.SavedCF then LocalPlayer.Character.HumanoidRootPart.CFrame = _G.SavedCF end end)
AddButton(FarmPage, "63. ⏩ إلغاء وقت الانتظار للأزرار (Instant Prompt)", function()
    for _, v in pairs(Workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then v.HoldDuration = 0 end end
end)
AddButton(FarmPage, "64. ⚡ زيادة مسافة التقاط الأزرار (Max Prompt Distance)", function()
    for _, v in pairs(Workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then v.MaxActivationDistance = 100 end end
end)
AddButton(FarmPage, "65. 🧲 التجميع التلقائي للقطع المسكوبة (Auto Touch Parts)", function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent then
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end)
AddButton(FarmPage, "66. 🏰 الانتقال لمنتصف الخريطة (Center Map)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) end
end)
AddButton(FarmPage, "67. 🏃 سرعة تجميع الأغراض تلقائياً", function()
    for _, obj in pairs(Workspace:GetChildren()) do if obj:IsA("Tool") then firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Handle, 0) end end
end)
AddButton(FarmPage, "68. 🔄 التلفيل حول مركز الماب (Orbit Center)", function()
    local t = 0
    RunService:BindToRenderStep("Orbit", 1, function()
        t = t + 0.05
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.sin(t)*50, 20, math.cos(t)*50)
        end
    end)
end)
AddButton(FarmPage, "69. 🛑 إيقاف التلفيل حول المركز", function() RunService:UnbindFromRenderStep("Orbit") end)
AddButton(FarmPage, "70. 🎯 التمسك بأقرب لاعب (Attach To Nearest)", function()
    local near, minDist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (LocalPlayer.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if d < minDist then minDist = d; near = p end
        end
    end
    if near then LocalPlayer.Character.HumanoidRootPart.CFrame = near.Character.HumanoidRootPart.CFrame end
end)
AddButton(FarmPage, "71. 🛒 فتح قائمة المشتريات بكل الألعاب (Purchase Prompt)", function()
    game:GetService("MarketplaceService"):PromptPurchase(LocalPlayer, 0)
end)
AddButton(FarmPage, "72. 🎒 حماية حقيبة الأدوات من الضياع", function() LocalPlayer.ResetPlayerGuiOnSpawn = false end)
AddButton(FarmPage, "73. 📍 حفظ موقع الموت التلقائي", function()
    LocalPlayer.Character.Humanoid.Died:Connect(function() _G.DeathCF = LocalPlayer.Character.HumanoidRootPart.CFrame end)
end)
AddButton(FarmPage, "74. 🌀 الانتقال لموقع آخر موت", function() if _G.DeathCF then LocalPlayer.Character.HumanoidRootPart.CFrame = _G.DeathCF end end)
AddButton(FarmPage, "75. 🏃 العودة للبداية (Spawnpoint)", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) end)

-- ==================== القسم 6: الحركات والرقص (76 - 90) ====================
local Spin = false
AddButton(FunPage, "76. 🌀 الدوران التلقائي (SpinBot)", function()
    Spin = not Spin
    task.spawn(function()
        while Spin do
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(30), 0)
            end
            task.wait(0.02)
        end
    end)
end)
AddButton(FunPage, "77. 🛠️ أدوات البناء الأساسية (Btools)", function()
    for i = 1, 4 do local t = Instance.new("HopperBin", LocalPlayer.Backpack); t.BinType = i end
end)
AddButton(FunPage, "78. 🤸 رقصة الحركة 1 (FE Dance 1)", function()
    local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://182435998"
    LocalPlayer.Character.Humanoid:LoadAnimation(a):Play()
end)
AddButton(FunPage, "79. 🤸 رقصة الحركة 2 (FE Dance 2)", function()
    local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://182436842"
    LocalPlayer.Character.Humanoid:LoadAnimation(a):Play()
end)
AddButton(FunPage, "80. 🤸 رقصة الحركة 3 (FE Dance 3)", function()
    local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://182436935"
    LocalPlayer.Character.Humanoid:LoadAnimation(a):Play()
end)
AddButton(FunPage, "81. 🙃 قلب الشاشة 180 درجة", function() Camera.CFrame = Camera.CFrame * CFrame.Angles(0, 0, math.rad(180)) end)
AddButton(FunPage, "82. 👻 وضع الاختفاء الصوري (Ghost Body)", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Transparency = 0.5 end end
end)
AddButton(FunPage, "83. 👤 إعادة إظهار الشخصية (Unhide)", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 0 end end
end)
AddButton(FunPage, "84. 💥 إزالة الرأس صوريًا (Headless Visual)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then LocalPlayer.Character.Head.Transparency = 1 end
end)
AddButton(FunPage, "85. 🧟 حركة الزومبي (Zombie Walk)", function()
    local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://616154705"
    LocalPlayer.Character.Humanoid:LoadAnimation(a):Play()
end)
AddButton(FunPage, "86. 🤖 حركة الإنسان الآلي (Robot Walk)", function()
    local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://616088211"
    LocalPlayer.Character.Humanoid:LoadAnimation(a):Play()
end)
AddButton(FunPage, "87. 🤡 حركة المهرج (Clown Walk)", function()
    local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://616111295"
    LocalPlayer.Character.Humanoid:LoadAnimation(a):Play()
end)
AddButton(FunPage, "88. 🛑 إيقاف جميع الرقصات بالحركة", function()
    for _, t in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do t:Stop() end
end)
AddButton(FunPage, "89. ⚡ القفز والسباحة بالهواء (Air Swim)", function()
    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end)
AddButton(FunPage, "90. 🎭 الانزلاق على الأرض (Slide)", function()
    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
end)

-- ==================== القسم 7: تعديل الشخصية (91 - 105) ====================
AddButton(CharPage, "91. 🎨 تغيير لون الشخصية للأصفر الذهبي", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromRGB(255, 215, 0) end end
end)
AddButton(CharPage, "92. 🔴 تغيير لون الشخصية للأحمر", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromRGB(255, 0, 0) end end
end)
AddButton(CharPage, "93. 🔵 تغيير لون الشخصية للأزرق", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromRGB(0, 150, 255) end end
end)
AddButton(CharPage, "94. 🟢 تغيير لون الشخصية للأخضر", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromRGB(0, 255, 100) end end
end)
AddButton(CharPage, "95. ⬛ جعل الشخصية سوداء بالكامل", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromRGB(0, 0, 0) end end
end)
AddButton(CharPage, "96. 🌟 جعل الشخصية تضيء (Neon Effect)", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Material = Enum.Material.Neon end end
end)
AddButton(CharPage, "97. 🧱 إعادة ماتيريال الشخصية الطبيعي", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Material = Enum.Material.Plastic end end
end)
AddButton(CharPage, "98. 💎 جعل الشخصية زجاجية شفافة", function()
    for _, p in pairs(LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Material = Enum.Material.Glass; p.Transparency = 0.3 end end
end)
AddButton(CharPage, "99. 📏 تكبير حجم الشخصية محلياً", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.BodyHeightScale.Value = 2
    end
end)
AddButton(CharPage, "100. 🤏 تصغير حجم الشخصية محلياً", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.BodyHeightScale.Value = 0.5
    end
end)
AddButton(CharPage, "101. ⚖️ إعادة حجم الشخصية للطبيعي", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.BodyHeightScale.Value = 1
    end
end)
AddButton(CharPage, "102. 🦿 إزالة الساق اليسرى (Visual Fake)", function()
    if LocalPlayer.Character:FindFirstChild("LeftLeg") then LocalPlayer.Character.LeftLeg.Transparency = 1 end
end)
AddButton(CharPage, "103. 🦾 إزالة اليد اليمنى (Visual Fake)", function()
    if LocalPlayer.Character:FindFirstChild("RightArm") then LocalPlayer.Character.RightArm.Transparency = 1 end
end)
AddButton(CharPage, "104. 👕 إزالة قميص الشخصية (Remove Shirt)", function()
    if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy() end
end)
AddButton(CharPage, "105. 👖 إزالة بنطال الشخصية (Remove Pants)", function()
    if LocalPlayer.Character:FindFirstChildOfClass("Pants") then LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy() end
end)

-- ==================== القسم 8: السيرفر والنظام (106 - 120) ====================
AddButton(ServerPage, "106. 🔄 إعادة الدخول لنفس السيرفر (Rejoin)", function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)
AddButton(ServerPage, "107. 🔀 الانتقال لسيرفر آخر تلقائياً (Server Hop)", function()
    local s = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    for _, v in pairs(s.data) do
        if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, LocalPlayer)
            break
        end
    end
end)
AddButton(ServerPage, "108. 📋 نسخ رابط JobID للسيرفر الحالي", function() setclipboard(tostring(game.JobId)) end)
AddButton(ServerPage, "109. 🗑️ تنظيف اللاغ وتسريع اللعبة (FPS Booster)", function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Texture") or v:IsA("Decal") then v:Destroy() end
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
    end
end)
AddButton(ServerPage, "110. ⚡ فتح معدل الفريمات لـ 240 FPS", function() if setfpscap then setfpscap(240) end end)
AddButton(ServerPage, "111. 🔒 حماية ضد الطرد بسبب الخمول (Anti-AFK)", function()
    local bb = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function() bb:CaptureController(); bb:ClickButton2(Vector2.new()) end)
end)
AddButton(ServerPage, "112. 🔇 كتم جميع أصوات الماب", function()
    for _, v in pairs(Workspace:GetDescendants()) do if v:IsA("Sound") then v.Volume = 0 end end
end)
AddButton(ServerPage, "113. 🔊 تشغيل الأصوات وإعادة الصوت للطبيعي", function()
    for _, v in pairs(Workspace:GetDescendants()) do if v:IsA("Sound") then v.Volume = 0.5 end end
end)
AddButton(ServerPage, "114. 📉 تخفيض الجرافيك لأقل درجة (Low Graphics)", function()
    settings().Rendering.QualityLevel = 1
end)
AddButton(ServerPage, "115. 📈 رفع الجرافيك لأعلى درجة (Ultra Graphics)", function()
    settings().Rendering.QualityLevel = 21
end)
AddButton(ServerPage, "116. 📋 نسخ رابط الخريطة (Place ID)", function() setclipboard(tostring(game.PlaceId)) end)
AddButton(ServerPage, "117. 🚨 إظهار الإحصائيات الفنية بالـ Output (Ping/FPS)", function()
    print("FPS: " .. math.floor(Workspace:GetRealPhysicsFPS()) .. " | Ping: " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))
end)
AddButton(ServerPage, "118. 🧹 مسح جميع الرسومات والمؤثرات الجوية", function()
    for _, v in pairs(Lighting:GetChildren()) do v:Destroy() end
end)
AddButton(ServerPage, "119. 🔄 إعادة تحميل واجهة السكربت", function()
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/alajmim7mdmm1-lgtm/Alajmi-Hub/refs/heads/main/main.lua"))()
end)
AddButton(ServerPage, "120. ❌ إغلاق وتدمير السكربت بالكامل", function() ScreenGui:Destroy() end)

-- ==================== 4. تشغيل حركات شاشة التحميل ====================
task.spawn(function()
    TweenService:Create(IntroUser, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2.2)

    TweenService:Create(IntroUser, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(IntroImage, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
    TweenService:Create(IntroFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    task.wait(0.5)

    IntroFrame:Destroy()
    MainFrame.Visible = true
    ToggleBtn.Visible = true
end)
