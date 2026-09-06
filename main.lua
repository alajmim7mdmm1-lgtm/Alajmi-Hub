-- تحميل مكتبة الواجهات (Rayfield)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- إنشاء النافذة الرئيسية للسكربت
local Window = Rayfield:CreateWindow({
   Name = "⚡ Alajmi Hub | عجمي هب",
   LoadingTitle = "جاري تحميل اللوحة العربية...",
   LoadingSubtitle = "بواسطة المطور العجمي",
   ConfigurationSaving = { Enabled = false },
   Discord = { Enabled = false },
   KeySystem = false
})

-- 1. تبويب الحركة واللاعب
local PlayerTab = Window:CreateTab("اللاعب والحركة 🏃‍♂️", 4483362458)

-- التحكم بالسرعة
PlayerTab:CreateSlider({
   Name = "سرعة المشي (WalkSpeed)",
   Range = {16, 300},
   Increment = 1,
   Suffix = "سرعة",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- التحكم بقوة القفز
PlayerTab:CreateSlider({
   Name = "قوة القفز (JumpPower)",
   Range = {50, 400},
   Increment = 5,
   Suffix = "قوة",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- القفز اللانهائي (Inf Jump)
local InfJumpEnabled = false
PlayerTab:CreateToggle({
   Name = "القفز اللانهائي في الهواء",
   CurrentValue = false,
   Flag = "InfJumpToggle",
   Callback = function(Value)
       InfJumpEnabled = Value
   end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
   if InfJumpEnabled then
       game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
   end
end)

-- 2. تبويب القدرات الخارقة
local WorldTab = Window:CreateTab("القدرات الخارقة 👻", 4483362458)

-- تفعيل اختفاء الجدران (Noclip)
local NoclipEnabled = false
WorldTab:CreateToggle({
   Name = "اختراق الجدران (Noclip)",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
       NoclipEnabled = Value
   end,
})

game:GetService("RunService").Stepped:Connect(function()
   if NoclipEnabled and game.Players.LocalPlayer.Character then
       for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
           if part:IsA("BasePart") then
               part.CanCollide = false
           end
       end
   end
end)

-- كشف أماكن اللاعبين (ESP)
WorldTab:CreateButton({
   Name = "كشف أماكن جميع اللاعبين (ESP)",
   Callback = function()
       for _, player in pairs(game.Players:GetPlayers()) do
           if player ~= game.Players.LocalPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
               local Highlight = Instance.new("Highlight")
               Highlight.Parent = player.Character
               Highlight.FillColor = Color3.fromRGB(255, 0, 0)
               Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
           end
       end
       Rayfield:Notify({Title = "تم التفعيل", Content = "تم كشف جميع اللاعبين بظلال حمراء!", Duration = 3})
   end,
})

-- 3. تبويب التحكم بالعالم والوقت
local EnvTab = Window:CreateTab("البيئة والوقت ☀️", 4483362458)

EnvTab:CreateButton({
   Name = "تحويل الوقت إلى نهار ☀️",
   Callback = function()
       game.Lighting.ClockTime = 12
   end,
})

EnvTab:CreateButton({
   Name = "تحويل الوقت إلى ليل 🌙",
   Callback = function()
       game.Lighting.ClockTime = 0
   end,
})

EnvTab:CreateButton({
   Name = "إزالة الضباب والإضاءة القوية (Fullbright)",
   Callback = function()
       game.Lighting.Brightness = 2
       game.Lighting.ClockTime = 14
       game.Lighting.FogEnd = 100000
       game.Lighting.GlobalShadows = false
   end,
})

Rayfield:Notify({
   Title = "تم تشغيل Alajmi Hub بنجاح!",
   Content = "أهلاً بك في لوحة المطور العجمي العربية.",
   Duration = 5
})
