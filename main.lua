-- Alajmi Hub v4.0 | المطور العجمي
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/Kavo-UI-Library/main/AvailbleCodes-Kavo-UI"))()
local Window = Library.CreateLib("⚡ Alajmi Hub v4.0 | المطور العجمي", "Midnight")

-- ==================== التبويبات ====================
local TabPlayer = Window:NewTab("اللاعب والحركة 🏃‍♂️")
local SecPlayer = TabPlayer:NewSection("التحكم بالشخصية")

local TabSkin = Window:NewTab("تغيير السكن والاسم 🎭")
local SecSkin = TabSkin:NewSection("نسخ وتعديل المظهر")

local TabESP = Window:NewTab("الكشف والرادار 👁️")
local SecESP = TabESP:NewSection("أوامر الكشف")

local TabWorld = Window:NewTab("العالم والبيئة 🌐")
local SecWorld = TabWorld:NewSection("الإضاءة والوقت")

local TabFun = Window:NewTab("أوامر مميزة 🎯")
local SecFun = TabFun:NewSection("إضافات وتحكم")

-- ==================== 1. أوامر الحركة ====================
SecPlayer:NewSlider("سرعة المشي (Speed)", "تعديل السرعة", 300, 16, function(s)
    pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)
end)

SecPlayer:NewSlider("قوة القفز (Jump)", "تعديل الارتفاع", 300, 50, function(s)
    pcall(function() 
        game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s 
    end)
end)

SecPlayer:NewSlider("الجاذبية (Gravity)", "التحكم بالطفو", 196, 0, function(s)
    game.Workspace.Gravity = s
end)

local InfJump = false
SecPlayer:NewToggle("القفز اللانهائي في الهواء", "قفز بدون توقف", function(state)
    InfJump = state
end)
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then pcall(function() game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end) end
end)

-- ==================== 2. السكن والاسم ====================
local TargetPlayerName = ""

SecSkin:NewTextBox("اسم الحساب (Username)", "اكتب اسم حساب اللاعب المُراد نسخ سكنه", function(txt)
    TargetPlayerName = txt
end)

SecSkin:NewButton("نسخ سكن اللاعب (Copy Skin)", "نسخ المظهر مباشر", function()
    pcall(function()
        local userId = game.Players:GetUserIdFromNameAsync(TargetPlayerName)
        if userId then
            local desc = game.Players:GetHumanoidDescriptionFromUserId(userId)
            game.Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
        end
    end)
end)

SecSkin:NewTextBox("تغيير الاسم الوهمي", "اكتب اسمك الجديد فوق رأسك", function(txt)
    pcall(function() game.Players.LocalPlayer.Character.Humanoid.DisplayName = txt end)
end)

SecSkin:NewButton("إعادة السكن الأصلي", "إرجاع سكنك الأساسي", function()
    pcall(function()
        local desc = game.Players:GetHumanoidDescriptionFromUserId(game.Players.LocalPlayer.UserId)
        game.Players.LocalPlayer.Character.Humanoid:ApplyDescription(desc)
    end)
end)

-- ==================== 3. الكشف والشفافية ====================
local Noclip = false
SecESP:NewToggle("اختراق الجدران (Noclip)", "المرور من الجدران", function(state)
    Noclip = state
end)
game:GetService("RunService").Stepped:Connect(function()
    if Noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

SecESP:NewButton("كشف أماكن اللاعبين (ESP)", "إظهار ظلال جميع اللاعبين", function()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = Color3.fromRGB(138, 43, 226)
        end
    end
end)

-- ==================== 4. البيئة والوقت ====================
SecWorld:NewButton("تحويل الوقت إلى نهار ☀️", "تغيير إضاءة اللعبة", function() game.Lighting.ClockTime = 12 end)
SecWorld:NewButton("تحويل الوقت إلى ليل 🌙", "تغيير إضاءة اللعبة", function() game.Lighting.ClockTime = 0 end)
SecWorld:NewButton("إزالة الضباب والإضاءة القوية (Fullbright)", "رؤية واضحة جداً", function()
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end)

-- ==================== 5. أوامر إضافية ====================
SecFun:NewButton("إعادة الظهور (Reset)", "تجديد الشخصية والعودة لنقطة البداية", function() game.Players.LocalPlayer.Character.Humanoid.Health = 0 end)
SecFun:NewButton("تكبير زاوية الرؤية (Max FOV)", "رؤية أوسع للماب", function() game.Workspace.CurrentCamera.FieldOfView = 120 end)
SecFun:NewButton("إعادة زاوية الرؤية (Normal FOV)", "الزاوية الطبيعية", function() game.Workspace.CurrentCamera.FieldOfView = 70 end)
SecFun:NewButton("إزالة الاكسسوارات", "حذف القبعات والأدوات من سكنك", function()
    pcall(function()
        for _, item in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if item:IsA("Accessory") then item:Destroy() end
        end
    end)
end)
