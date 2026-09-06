-- Alajmi Hub v11.0 | Mega HD Admin Edition
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AlajmiHubV11_MegaAdmin"

-- ==================== 1. أنيميشن الدخول ====================
local IntroFrame = Instance.new("Frame")
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

local IntroSub = Instance.new("TextLabel")
IntroSub.Parent = IntroFrame
IntroSub.AnchorPoint = Vector2.new(0.5, 0.5)
IntroSub.Position = UDim2.new(0.5, 0, 0.53, 0)
IntroSub.Size = UDim2.new(0, 300, 0, 30)
IntroSub.BackgroundTransparency = 1
IntroSub.Text = "Mega HD Admin Edition • 50+ Commands"
IntroSub.TextColor3 = Color3.fromRGB(180, 180, 200)
IntroSub.TextSize = 16
IntroSub.Font = Enum.Font.Gotham
IntroSub.TextTransparency = 1

-- ==================== 2. الواجهة الرئيسية الفاخرة ====================
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

-- شريط العنوان (Top Bar) مع أيقونة "أي"
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
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "أي ALAJMI HUB (50+ Commands)"
TitleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
TitleLabel.TextSize = 18
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

-- القائمة الجانبية (Sidebar)
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

-- منطقة المحتوى
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

-- الزر العائم مع الكلمة "أي"
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
ToggleBtn.Text = "أي"
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

-- دمج أدوات إنشاء العناصر
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

    Box.FocusLost:Connect(function() pcall(function() callback(Box.Text) end) end)
end

-- ==================== 3. أقسام الأوامر الـ 50+ ====================
local AdminPage = CreateTab("أدوات الأدمن", "🛡️")
local MovePage = CreateTab("الحركة والطيران", "⚡")
local VisualPage = CreateTab("الكشف والرؤية", "👁️")
local FunPage = CreateTab("تعديل الشخصية", "🎭")
local WorldPage = CreateTab("العالم والطقس", "🌐")
local ServerPage = CreateTab("أدوات السيرفر", "💻")

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

-- === 1. أدوات الأدمن (Admin Commands) ===
AddInput(AdminPage, "اكتب اسم اللاعب المستهدف...", function(txt) targetPlayer = txt end)
AddButton(AdminPage, "1. 🚀 الانتقال إلى اللاعب (Goto)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)
AddButton(AdminPage, "2. 💀 إعادة ظهور (Reset)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.Health = 0 end end)
local Frozen = false
AddButton(AdminPage, "3. ❄️ تجميد / إلغاء تجميد (Freeze)", function()
    Frozen = not Frozen
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then LocalPlayer.Character.HumanoidRootPart.Anchored = Frozen end
end)
AddButton(AdminPage, "4. 👻 الاختفاء (Invisibility)", function()
    if LocalPlayer.Character then for _, v in pairs(LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end end
end)
AddButton(AdminPage, "5. ✨ الإظهار (Visible)", function()
    if LocalPlayer.Character then for _, v in pairs(LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 0 end end end
end)
AddButton(AdminPage, "6. 🛡️ درع الحماية (God Mode)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.MaxHealth = math.huge
        LocalPlayer.Character.Humanoid.Health = math.huge
    end
end)
AddButton(AdminPage, "7. 🧲 مراقبة اللاعب (Spectate)", function()
    local target = GetPlayer(targetPlayer)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
    end
end)
AddButton(AdminPage, "8. ❌ إلغاء المراقبة (Unspectate)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
    end
end)
AddButton(AdminPage, "9. 🔄 تنظيف الأنيميشن (Clear Anims)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        for _, track in pairs(LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do track:Stop() end
    end
end)
AddButton(AdminPage, "10. 🧹 إزالة الأدوات من الحقيبة (Clear Backpack)", function() LocalPlayer.Backpack:ClearAllChildren() end)

-- === 2. الحركة والطيران (Movement Commands) ===
local Flying = false
local FlySpeed = 50
local FlyConnection = nil
AddButton(MovePage, "11. 🕊️ تشغيل / إيقاف الطيران (Fly)", function()
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
                if LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = false end
            end
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.PlatformStand = false end
    end
end)
AddInput(MovePage, "12. سرعة الطيران (الافتراضي: 50)...", function(txt) local n = tonumber(txt) if n then FlySpeed = n end end)
AddInput(MovePage, "13. سرعة المشي (WalkSpeed)...", function(txt) local n = tonumber(txt) if n then LocalPlayer.Character.Humanoid.WalkSpeed = n end end)
AddInput(MovePage, "14. قوة القفز (JumpPower)...", function(txt) local n = tonumber(txt) if n then LocalPlayer.Character.Humanoid.UseJumpPower = true LocalPlayer.Character.Humanoid.JumpPower = n end end)
AddInput(MovePage, "15. قوة الجاذبية (Gravity)...", function(txt) local n = tonumber(txt) if n then workspace.Gravity = n end end)
local InfJump = false
AddButton(MovePage, "16. 🔄 القفز اللانهائي (Infinite Jump)", function() InfJump = not InfJump end)
UserInputService.JumpRequest:Connect(function() if InfJump then pcall(function() LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end end)
AddButton(MovePage, "17. ⚡ السرعة الخارقة (Speed 100)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = 100 end end)
AddButton(MovePage, "18. 🚀 القفز العالي (Jump 150)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.UseJumpPower = true LocalPlayer.Character.Humanoid.JumpPower = 150 end end)
AddButton(MovePage, "19. 🛑 إعادة الحركة للافتراضي (Reset Speed/Jump)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = 16 LocalPlayer.Character.Humanoid.JumpPower = 50 workspace.Gravity = 196.2 end end)
AddButton(MovePage, "20. 🪜 التسلق اللانهائي (Infinite Climb)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.ClimbSpeed = 100 end end)

-- === 3. الكشف والرؤية (Visual Commands) ===
local Noclip = false
AddButton(VisualPage, "21. 👻 اختراق الجدران (Noclip)", function() Noclip = not Noclip end)
RunService.Stepped:Connect(function() if Noclip and LocalPlayer.Character then for _, part in pairs(LocalPlayer.Character:GetChildren()) do if part:IsA("BasePart") then part.CanCollide = false end end end end)
AddButton(VisualPage, "22. 🎯 كشف أماكن اللاعبين (ESP Highlight)", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight") Highlight.Parent = player.Character Highlight.FillColor = Color3.fromRGB(255, 215, 0)
        end
    end
end)
AddButton(VisualPage, "23. 🗑️ إزالة الكشف (Remove ESP)", function()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Highlight") then player.Character.Highlight:Destroy() end
    end
end)
AddButton(VisualPage, "24. 💡 إضاءة الماب (Fullbright)", function() Lighting.Brightness = 2 Lighting.ClockTime = 14 Lighting.FogEnd = 100000 Lighting.GlobalShadows = false end)
AddButton(VisualPage, "25. 🔍 رؤية الأشياء الشفافة (X-Ray Vision)", function() for _, obj in pairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) then obj.LocalTransparencyModifier = 0.5 end end end)
AddButton(VisualPage, "26. ❌ إيقاف X-Ray Vision", function() for _, obj in pairs(workspace:GetDescendants()) do if obj:IsA("BasePart") then obj.LocalTransparencyModifier = 0 end end end)
AddButton(VisualPage, "27. 📸 توسيع مدى الكاميرا (Max Zoom Out)", function() LocalPlayer.CameraMaxZoomDistance = 10000 end)
AddButton(VisualPage, "28. 🎯 إعادة الكاميرا للافتراضي (Reset Zoom)", function() LocalPlayer.CameraMaxZoomDistance = 128 end)
AddButton(VisualPage, "29. 🌫️ إزالة الضباب (Remove Fog)", function() Lighting.FogEnd = 9e9 end)
AddButton(VisualPage, "30. ☀️ رؤية نهائية (Max Lightness)", function() Lighting.Ambient = Color3.fromRGB(255, 255, 255) end)

-- === 4. تعديل الشخصية (Character Mods) ===
AddInput(FunPage, "31. حجم الشخصية (Scale 1-5)...", function(txt)
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
AddInput(FunPage, "32. نسخ سكن أي لاعب باسمه...", function(txt)
    pcall(function()
        local userId = Players:GetUserIdFromNameAsync(txt)
        if userId then LocalPlayer.Character.Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(userId)) end
    end)
end)
AddButton(FunPage, "33. 🛠️ الحصول على Btools", function() for i = 1, 4 do local t = Instance.new("HopperBin") t.BinType = i t.Parent = LocalPlayer.Backpack end end)
AddButton(FunPage, "34. 👑 إزالة الملابس (Remove Clothes)", function() if LocalPlayer.Character then for _, v in pairs(LocalPlayer.Character:GetChildren()) do if v:IsA("Clothing") or v:IsA("ShirtGraphic") then v:Destroy() end end end end)
AddButton(FunPage, "35. 🧢 إزالة الاكسسوارات (Remove Accessories)", function() if LocalPlayer.Character then for _, v in pairs(LocalPlayer.Character:GetChildren()) do if v:IsA("Accessory") then v:Destroy() end end end end)
AddButton(FunPage, "36. 🗿 إزالة الوجه (Remove Face)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") and LocalPlayer.Character.Head:FindFirstChild("face") then LocalPlayer.Character.Head.face:Destroy() end end)
AddButton(FunPage, "37. 🏃 أنيميشن طيران R15 (Fly Anim)", function() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming) end end)
AddButton(FunPage, "38. 💃 الرقص تلقائياً (Emote Dance)", function() game:GetService("Players"):Chat("/e dance") end)
AddButton(FunPage, "39. 🕺 الرقص الثاني (Emote Dance 2)", function() game:GetService("Players"):Chat("/e dance2") end)
AddButton(FunPage, "40. 🤸 الحركة البهلوانية (Emote Cheer)", function() game:GetService("Players"):Chat("/e cheer") end)

-- === 5. العالم والطقس (World & Lighting) ===
AddButton(WorldPage, "41. ☀️ جعل الوقت نهار (Day)", function() Lighting.ClockTime = 14 end)
AddButton(WorldPage, "42. 🌙 جعل الوقت ليل (Night)", function() Lighting.ClockTime = 0 end)
AddButton(WorldPage, "43. 🌅 جعل الوقت غروب (Sunset)", function() Lighting.ClockTime = 18 end)
AddButton(WorldPage, "44. 🌌 إضافة السماء الساحرة (Purple Sky)", function()
    local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", Lighting)
    sky.SkyboxBk = "rbxassetid://271042516" sky.SkyboxDn = "rbxassetid://271041817" sky.SkyboxFt = "rbxassetid://271042310" sky.SkyboxLf = "rbxassetid://271042310" sky.SkyboxRt = "rbxassetid://271042310" sky.SkyboxUp = "rbxassetid://271041817"
end)
AddButton(WorldPage, "45. ❄️ جو ثلجي وخفيف (Snow Lighting)", function() Lighting.ColorShift_Top = Color3.fromRGB(200, 220, 255) end)
AddButton(WorldPage, "46. 🌧️ إزالة الظلال (No Shadows)", function() Lighting.GlobalShadows = false end)
AddButton(WorldPage, "47. ⚡ زيادة السطوع (Max Brightness)", function() Lighting.Brightness = 10 end)
AddButton(WorldPage, "48. 🔮 تفعيل جودة الألوان (Bloom Vision)", function() local b = Instance.new("BloomEffect", Lighting) b.Intensity = 1 b.Size = 24 end)

-- === 6. أدوات السيرفر والمعلومات (Server Tools) ===
AddButton(ServerPage, "49. 📊 عرض سرعة الاتصال (Ping)", function()
    local p = Instance.new("Hint", workspace) p.Text = "Ping: " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. " ms" task.wait(3) p:Destroy()
end)
AddButton(ServerPage, "50. 👥 عرض عدد اللاعبين بالسيرفر", function()
    local h = Instance.new("Hint", workspace) h.Text = "عدد اللاعبين الحالي: " .. #Players:GetPlayers() task.wait(3) h:Destroy()
end)
AddButton(ServerPage, "51. 🔄 إعادة الاتصال بالسيرفر (Rejoin)", function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
AddButton(ServerPage, "52. 🚪 مغادرة السيرفر (Server Hop)", function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end)

-- ==================== 4. تشغيل انيميشن البداية ====================
task.spawn(function()
    TweenService:Create(IntroTitle, TweenInfo.new(1.2), {TextTransparency = 0}):Play()
    TweenService:Create(IntroSub, TweenInfo.new(1.2), {TextTransparency = 0}):Play()
    task.wait(2.2)

    TweenService:Create(IntroTitle, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    TweenService:Create(IntroSub, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    TweenService:Create(IntroFrame, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
    task.wait(0.8)

    IntroFrame:Destroy()
    MainFrame.Visible = true
    ToggleBtn.Visible = true
end)
