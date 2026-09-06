-- Alajmi Hub v5.0 | المطور العجمي (Advanced Mobile UI)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local OpenBtn = Instance.new("TextButton")
local UICornerMain = Instance.new("UICorner")
local UICornerOpen = Instance.new("UICorner")

-- إعدادات الشاشة
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AlajmiHubV5"

-- زر فتح وإغلاق السكربت (تصميم عصري متناسق)
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
OpenBtn.Position = UDim2.new(0, 15, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 95, 0, 40)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Text = "⚡ Alajmi Hub"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 15
OpenBtn.Active = true
OpenBtn.Draggable = true

UICornerOpen.CornerRadius = UDim.new(0, 8)
UICornerOpen.Parent = OpenBtn

-- الإطار الرئيسي للسكربت (تحسين الحواف والألوان)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 330, 0, 400)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

UICornerMain.CornerRadius = UDim.new(0, 10)
UICornerMain.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(35, 10, 15)
Title.Text = "👑 Alajmi Hub v5.0 | المطور العجمي"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 8, 0, 50)
Scroll.Size = UDim2.new(1, -16, 1, -55)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 4, 0)
Scroll.ScrollBarThickness = 5

UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- دالة إدخال العناوين الفرعية
local function CreateHeader(text)
    local header = Instance.new("TextLabel")
    header.Parent = Scroll
    header.Size = UDim2.new(1, -10, 0, 25)
    header.BackgroundTransparency = 1
    header.Text = "--- " .. text .. " ---"
    header.TextColor3 = Color3.fromRGB(200, 150, 150)
    header.Font = Enum.Font.SourceSansBold
    header.TextSize = 14
end

-- دالة إنشاء الأزرار الجمالية
local function CreateButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Scroll
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 40)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
    return btn
end

-- دالة إنشاء إدخال النص
local function CreateTextBox(placeholder, callback)
    local box = Instance.new("TextBox")
    box.Parent = Scroll
    box.Size = UDim2.new(1, -10, 0, 38)
    box.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Font = Enum.Font.SourceSans
    box.TextSize = 13

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = box

    box.FocusLost:Connect(function()
        pcall(function() callback(box.Text) end)
    end)
    return box
end

-- ==================== 1. نظام حفظ والانتقال للـ TP ====================
CreateHeader("📍 نظام الانتقال السريع (TP)")

local SavedCFrame = nil

CreateButton("📌 حفظ المكان الحالي", Color3.fromRGB(40, 80, 50), function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        SavedCFrame = char.HumanoidRootPart.CFrame
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Alajmi Hub",
            Text = "تم حفظ موقعك بنجاح! 📍",
            Duration = 3
        })
    end
end)

CreateButton("🚀 الانتقال للمكان المحفوظ", Color3.fromRGB(30, 90, 110), function()
    local char = game.Players.LocalPlayer.Character
    if SavedCFrame and char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = SavedCFrame
    end
end)

-- ==================== 2. التحكم بالحركة والسرعة ====================
CreateHeader("🏃‍♂️ أجهزة الحركة والفيزياء")

CreateButton("⚡ سرعة خارقة (Speed 120)", Color3.fromRGB(45, 45, 65), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
end)

CreateButton("🏃‍♂️ سرعة متوسطة (Speed 50)", Color3.fromRGB(45, 45, 65), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

CreateButton("🔄 السرعة الطبيعية (Speed 16)", Color3.fromRGB(45, 45, 65), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

CreateButton("🦘 قفز عالي (Jump 150)", Color3.fromRGB(45, 45, 65), function()
    game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

CreateButton("🌌 جاذبية منخفضة (طفو)", Color3.fromRGB(45, 45, 65), function()
    game.Workspace.Gravity = 50
end)

CreateButton("🌍 إرجاع الجاذبية الطبيعية", Color3.fromRGB(45, 45, 65), function()
    game.Workspace.Gravity = 196.2
end)

-- القفز اللانهائي
local InfJump = false
CreateButton("🔄 تفعيل/إلغاء القفز اللانهائي", Color3.fromRGB(60, 50, 80), function()
    InfJump = not InfJump
end)
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then pcall(function() game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end
end)

-- ==================== 3. الكشف والشفافية ====================
CreateHeader("👁️ الكشف والشفافية")

local Noclip = false
CreateButton("👻 تفعيل/إلغاء اختراق الجدران (Noclip)", Color3.fromRGB(70, 40, 80), function()
    Noclip = not Noclip
end)
game:GetService("RunService").Stepped:Connect(function()
    if Noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

CreateButton("🎯 كشف أماكن جميع اللاعبين (ESP)", Color3.fromRGB(70, 40, 80), function()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(200, 50, 50)
        end
    end
end)

-- ==================== 4. السكن والاسم ====================
CreateHeader("🎭 المظهر والاسم")

local targetUser = ""
CreateTextBox("اكتب اسم اللاعب لنسخ سكنه...", function(txt)
    targetUser = txt
end)

CreateButton("✨ نسخ السكن المباشر", Color3.fromRGB(35, 75, 55), function()
    local userId = game.Players:GetUserIdFromNameAsync(targetUser)
    if userId then
        local desc = game.Players:GetHumanoidDescriptionFromUserId(userId)
        game.Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
    end
end)

CreateTextBox("اكتب الاسم الوهمي الجديد...", function(txt)
    game.Players.LocalPlayer.Character.Humanoid.DisplayName = txt
end)

CreateButton("❌ إزالة جميع الاكسسوارات", Color3.fromRGB(80, 40, 40), function()
    for _, item in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if item:IsA("Accessory") then item:Destroy() end
    end
end)

-- ==================== 5. البيئة والتحكم بالرؤية ====================
CreateHeader("🌐 التحكم بالبيئة والشاشة")

CreateButton("☀️ تحويل الوقت إلى نهار", Color3.fromRGB(50, 60, 80), function() game.Lighting.ClockTime = 12 end)
CreateButton("🌙 تحويل الوقت إلى ليل", Color3.fromRGB(50, 60, 80), function() game.Lighting.ClockTime = 0 end)
CreateButton("💡 إزالة الضباب وضبط الرؤية (Fullbright)", Color3.fromRGB(50, 60, 80), function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end)

CreateButton("📷 زاوية رؤية واسعة (Max FOV)", Color3.fromRGB(50, 60, 80), function()
    game.Workspace.CurrentCamera.FieldOfView = 120
end)

CreateButton("📷 زاوية رؤية طبيعية (Normal FOV)", Color3.fromRGB(50, 60, 80), function()
    game.Workspace.CurrentCamera.FieldOfView = 70
end)

-- ==================== 6. الأوامر العامة ====================
CreateHeader("⚙️ خيارات إضافية")

CreateButton("🔄 إعادة الظهور (Reset)", Color3.fromRGB(110, 30, 30), function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
