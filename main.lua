local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "⚡ Alajmi Hub v3.0 Ultimate",
    SubTitle = "by Alajmi",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 380),
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "اللاعب والحركة 🏃‍♂️", Icon = "" }),
    Skin = Window:AddTab({ Title = "تغيير السكن والاسم 🎭", Icon = "" }),
    Visuals = Window:AddTab({ Title = "الكشف والرادار 👁️", Icon = "" }),
    World = Window:AddTab({ Title = "العالم والبيئة 🌐", Icon = "" }),
    Fun = Window:AddTab({ Title = "أوامر إضافية 🎯", Icon = "" })
}

-- ==================== 1. تبويب اللاعب والحركة ====================
Tabs.Main:AddSlider("Speed", {
    Title = "سرعة المشي",
    Default = 16, Min = 16, Max = 500, Rounding = 0,
    Callback = function(Value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end)
    end
})

Tabs.Main:AddSlider("Jump", {
    Title = "قوة القفز",
    Default = 50, Min = 50, Max = 500, Rounding = 0,
    Callback = function(Value)
        pcall(function() 
            game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value 
        end)
    end
})

Tabs.Main:AddSlider("Gravity", {
    Title = "الجاذبية (الطفو)",
    Default = 196, Min = 0, Max = 196, Rounding = 0,
    Callback = function(Value) game.Workspace.Gravity = Value end
})

local InfJump = false
Tabs.Main:AddToggle("InfJump", {
    Title = "القفز اللانهائي في الهواء",
    Default = false,
    Callback = function(Value) InfJump = Value end
})
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end
end)

-- ==================== 2. تبويب تغيير السكن والاسم ====================
local TargetPlayerName = ""

Tabs.Skin:AddInput("TargetPlayer", {
    Title = "اسم اللاعب المراد نسخ سكنه",
    Default = "",
    Placeholder = "اكتب اسم الحساب هنا...",
    Callback = function(Text) TargetPlayerName = Text end
})

Tabs.Skin:AddButton({
    Title = "نسخ سكن اللاعب (Copy Skin)",
    Callback = function()
        pcall(function()
            local targetPlayer = game.Players:FindFirstChild(TargetPlayerName)
            if targetPlayer and targetPlayer.Character then
                local localChar = game.Players.LocalPlayer.Character
                local description = game.Players:GetHumanoidDescriptionFromUserId(targetPlayer.UserId)
                localChar.Humanoid:ApplyDescription(description)
                Fluent:Notify({ Title = "Alajmi Hub", Content = "تم نسخ سكن اللاعب بنجاح!", Duration = 3 })
            else
                Fluent:Notify({ Title = "خطأ", Content = "لم يتم العثور على اللاعب!", Duration = 3 })
            end
        end)
    end
})

Tabs.Skin:AddInput("NewName", {
    Title = "تغيير اسمك الوهمي (Fake Name)",
    Default = "",
    Placeholder = "اكتب الاسم الجديد...",
    Callback = function(Text)
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.DisplayName = Text
                Fluent:Notify({ Title = "Alajmi Hub", Content = "تم تغيير الاسم بنجاح!", Duration = 3 })
            end
        end)
    end
})

Tabs.Skin:AddButton({
    Title = "تحويل السكن إلى شفاف (Invis Body)",
    Callback = function()
        pcall(function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = 0.5
                end
            end
        end)
    end
})

Tabs.Skin:AddButton({
    Title = "إعادة السكن والأبعاد للأصل",
    Callback = function()
        pcall(function()
            local localPlayer = game.Players.LocalPlayer
            local description = game.Players:GetHumanoidDescriptionFromUserId(localPlayer.UserId)
            localPlayer.Character.Humanoid:ApplyDescription(description)
        end)
    end
})

-- ==================== 3. الكشف والشفافية ====================
local Noclip = false
Tabs.Visuals:AddToggle("Noclip", {
    Title = "اختراق الجدران (Noclip)",
    Default = false,
    Callback = function(Value) Noclip = Value end
})
game:GetService("RunService").Stepped:Connect(function()
    if Noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

Tabs.Visuals:AddButton({
    Title = "كشف أماكن اللاعبين (ESP)",
    Callback = function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = player.Character
                Highlight.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
})

-- ==================== 4. العالم والوقت ====================
Tabs.World:AddButton({ Title = "تغيير الوقت إلى نهار ☀️", Callback = function() game.Lighting.ClockTime = 12 end })
Tabs.World:AddButton({ Title = "تغيير الوقت إلى ليل 🌙", Callback = function() game.Lighting.ClockTime = 0 end })
Tabs.World:AddButton({ Title = "إزالة الضباب والإضاءة القوية (Fullbright)", Callback = function() 
    game.Lighting.Brightness = 2
    game.Lighting.ClockTime = 14
    game.Lighting.FogEnd = 100000
    game.Lighting.GlobalShadows = false
end })

-- ==================== 5. أوامر إضافية ====================
Tabs.Fun:AddButton({ Title = "إعادة ترسبن الشخصية (Reset)", Callback = function() game.Players.LocalPlayer.Character.Humanoid.Health = 0 end })
Tabs.Fun:AddButton({ Title = "تكبير زاوية الرؤية (Max FOV)", Callback = function() game.Workspace.CurrentCamera.FieldOfView = 120 end })
Tabs.Fun:AddButton({ Title = "إعادة زاوية الرؤية للأصل (Normal FOV)", Callback = function() game.Workspace.CurrentCamera.FieldOfView = 70 end })

Fluent:Notify({ Title = "Alajmi Hub v3.0", Content = "تم تحميل السكربت المطور بالأوامر الجديدة!", Duration = 4 })
