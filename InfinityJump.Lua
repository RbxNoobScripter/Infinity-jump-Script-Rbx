local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local button = Instance.new("TextButton")
local uiCorner = Instance.new("UICorner")
local uiGradient = Instance.new("UIGradient")

gui.Name = "InfiniteJumpGui"
gui.Parent = player:WaitForChild("PlayerGui")

button.Name = "InfiniteJumpButton"
button.Text = "Infinite Jump"
button.Size = UDim2.new(0.2, 0, 0.065, 0)
button.Position = UDim2.new(0.01, 0, 0.9, -50)
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.FredokaOne 
button.TextScaled = true 
button.Parent = gui

uiCorner.CornerRadius = UDim.new(0.8, 0)
uiCorner.Parent = button

-- Добавляем UIGradient для кнопки
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
}
uiGradient.Parent = button

-- Переключение бесконечного прыжка
local infiniteJumpEnabled = false

button.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    if infiniteJumpEnabled then
        button.Text = "Disable Infinite Jump"
    else
        button.Text = "Enable Infinite Jump"
    end
end)

-- Логика бесконечного прыжка
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
