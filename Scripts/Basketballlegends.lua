local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Splix"))()

local window = library:new({
    textsize = 13.5,
    font = Enum.Font.RobotoMono,
    name = "Claude",
    color = Color3.fromRGB(225, 58, 81)
})

local tab = window:page({name = "Main"})
local section1 = tab:section({name = "Features", side = "left", size = 250})

section1:toggle({
    name = "Auto Green",
    def = false,
    callback = function(value)
        getgenv().config = {Time = 0.045, Size = 0.9}
        local UIS = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local Player = game:GetService("Players").LocalPlayer
        local Bar = Player.PlayerGui.Visual.Shooting.Bar
        
        UIS.InputBegan:Connect(function(input, gpe)
            if gpe then return end
            if input.KeyCode == Enum.KeyCode.E then
                if Player.Character:FindFirstChild("Basketball") then
                    while UIS:IsKeyDown(Enum.KeyCode.E) do
                        Bar:GetPropertyChangedSignal("Size"):Connect(function()
                            if Bar.Size.Y.Scale > getgenv().config.Size then
                                Bar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, getgenv().config.Time, true)
                                task.wait()
                                Bar.Size = UDim2.new(1, 0, 1, 0)
                            end
                        end)
                        task.wait()
                    end
                end
            end
        end)
    end
})

window.key = Enum.KeyCode.F1
