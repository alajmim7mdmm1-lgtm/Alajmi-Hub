-- Alajmi Hub v4.0 | المطور العجمي (Custom Mobile UI)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local OpenBtn = Instance.new("TextButton")

-- إعداد الشاشة الرئيسية
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "AlajmiHubGui"

-- زر فتح وإغلاق السكربت (للموبايل والآيباد)
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
OpenBtn.Position = UDim2.new(0, 10, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 80, 0, 35)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Text = "Alajmi Hub"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 14
OpenBtn.Active = true
OpenBtn.Draggable = true

-- الإطار الرئيسي للسكربت
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 320, 0, 350)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Title.Text = "⚡ Alajmi Hub v4.0 | المطور العجمي"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 5, 0, 45)
Scroll.Size = UDim2.new(1, -10, 1, -50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
Scroll.ScrollBarThickness = 6

UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- دالة إنشاء الأزرار بسهولة
local function CreateButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Scroll
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = color or Color3.fromRGB(30, 30, 45)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
    return btn
end

-- دالة إنشاء إدخال النص (لنسخ السكن والاسم)
local function CreateTextBox(placeholder, callback)
    local box = Instance.new("TextBox")
    box.Parent = Scroll
    box.Size = UDim2.new(1, -10, 0, 40)
    box.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Font = Enum.Font.SourceSans
    box.TextSize = 14
    box.FocusLost:Connect(function()
        pcall(function() callback(box.Text) end)
    end)
    return box
end

-- ==================== الأوامر ====================

-- 1. زيادة السرعة
CreateButton("تفعيل سرعة عالية (Speed 100)", Color3.fromRGB(40, 40, 60), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- 2. إرجاع السرعة للطبيعي
CreateButton("إرجاع السرعة الطبيعية", Color3.fromRGB(40, 40, 60), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

-- 3. قفز عالٍ
CreateButton("تفعيل قفز عالٍ (Jump 120)", Color3.fromRGB(40, 40, 60), function()
    game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
end)

-- 4. اختراق الجدران
local Noclip = false
CreateButton("تشغيل / إيقاف اختراق الجدران (Noclip)", Color3.fromRGB(60, 40, 80), function()
    Noclip = not Noclip
end)
game:GetService("RunService").Stepped:Connect(function()
    if Noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- 5. كشف أماكن اللاعبين
CreateButton("كشف أماكن اللاعبين (ESP)", Color3.fromRGB(60, 40, 80), function()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(138, 43, 226)
        end
    end
end)

-- 6. نسخ السكن
local targetUser = ""
CreateTextBox("اكتب اسم حساب اللاعب لنسخ سكنه...", function(txt)
    targetUser = txt
end)

CreateButton("نسخ سكن اللاعب (Copy Skin)", Color3.fromRGB(30, 70, 50), function()
    local userId = game.Players:GetUserIdFromNameAsync(targetUser)
    if userId then
        local desc = game.Players:GetHumanoidDescriptionFromUserId(userId)
        game.Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
    end
end)

-- 7. تغيير الاسم الوهمي
CreateTextBox("اكتب اسمك الجديد هنا...", function(txt)
    game.Players.LocalPlayer.Character.Humanoid.DisplayName = txt
end)

-- 8. الوقت والإضاءة
CreateButton("تحويل الوقت إلى نهار ☀️", Color3.fromRGB(50, 50, 70), function()
    game.Lighting.ClockTime = 12
end)

CreateButton("إزالة الضباب رؤية واضحة (Fullbright)", Color3.fromRGB(50, 50, 70), function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end)

-- 9. إعادة الظهور
CreateButton("إعادة الظهور (Reset)", Color3.fromRGB(100, 30, 30), function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
