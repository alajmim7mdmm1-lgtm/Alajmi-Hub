local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "⚡ Alajmi Hub v1.0",
    SubTitle = "by Alajmi",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "اللاعب 🏃‍♂️", Icon = "" }),
    Visuals = Window:AddTab({ Title = "كشف وكشوفات 👁️", Icon = "" }),
    Settings = Window:AddTab({ Title = "حقوق السكربت ⚙️", Icon = "" })
}

-- إشعار الترحيب
Fluent:Notify({
    Title = "Alajmi Hub",
    Content = "هلا والله، تم تشغيل السكربت بنجاح!",
    Duration = 3
})

-- التحكم بالسرعة
Tabs.Main:AddSlider("Speed", {
    Title = "السرعة",
    Description = "حدد السرعة اللي تبيها",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 0,
    Callback = function(Value)
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = Value
            end
        end)
    end
})

-- التحكم بالقفز
Tabs.Main:AddSlider("Jump", {
    Title = "قوة القفز",
    Description = "ارتفاع القفزة",
    Default = 50,
    Min = 50,
    Max = 400,
    Rounding = 0,
    Callback = function(Value)
        pcall(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.UseJumpPower = true
                char.Humanoid.JumpPower = Value
            end
        end)
    end
})

-- كشف أماكن اللاعبين
Tabs.Visuals:AddButton({
    Title = "تفعيل كشف اللاعبين (ESP)",
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

-- تبويب الحقوق والتواصل
Tabs.Settings:AddParagraph({
    Title = "المطور",
    Content = "تم برمجة وتطوير هذا السكربت بواسطة العجمي.\nلا تحرمنا من دعمك ونشر السكربت!"
})
