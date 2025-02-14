local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Splix"))()

local window = library:new({
    textsize = 13.5,
    font = Enum.Font.RobotoMono,
    name = "Claude",
    color = Color3.fromRGB(225,58,81)
})

local mainTab = window:page({name = "Main"})

local playerSection = mainTab:section({
    name = "Player",
    side = "left",
    size = 250
})

local cframeEnabled = false
local cframeSpeed = 1

playerSection:toggle({
    name = "CFrame Walk",
    def = false,
    callback = function(value)
        cframeEnabled = value
        
        if cframeEnabled then
            spawn(function()
                while cframeEnabled do
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local humanoidRootPart = character.HumanoidRootPart
                        local moveDirection = character.Humanoid.MoveDirection
                        if moveDirection.Magnitude > 0 then
                            humanoidRootPart.CFrame = humanoidRootPart.CFrame + (moveDirection * cframeSpeed)
                        end
                    end
                    wait()
                end
            end)
        end
    end
})

playerSection:slider({
    name = "CFrame Speed",
    def = 1,
    max = 10,
    min = 0.1,
    rounding = true,
    ticking = false,
    measuring = "",
    callback = function(value)
        cframeSpeed = value
    end
})

local itemSection = mainTab:section({
    name = "Item Spawner",
    side = "right",
    size = 250
})

local itemToGet = "Apple"

itemSection:textbox({
    name = "Item Name",
    def = "Apple",
    placeholder = "Enter item name",
    callback = function(value)
        itemToGet = value
    end
})

itemSection:button({
    name = "Get Item",
    callback = function()
        local args = {
            [1] = itemToGet
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GiveTool"):FireServer(unpack(args))
    end
})

itemSection:button({
    name = "Print Tool Names",
    callback = function()
        for _, instance in pairs(game:GetDescendants()) do
            if instance:IsA("Tool") then
                print(instance.Name)
            end
        end
    end
})

window.key = Enum.KeyCode.F1
