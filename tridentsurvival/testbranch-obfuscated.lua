-- PulsarX UI - Раскодированная и оптимизированная версия
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Создание главного GUI
local PulsarXGUI = Instance.new("ScreenGui")
PulsarXGUI.Name = "PulsarX_GUI"
PulsarXGUI.Parent = CoreGui

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12) -- Космический черный
MainFrame.BackgroundTransparency = 0.92
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = PulsarXGUI

-- Заголовок
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(15, 10, 25) -- Темный фиолетовый фон
TitleLabel.BackgroundTransparency = 0.3
TitleLabel.Text = "PulsarX v2.0"
TitleLabel.TextColor3 = Color3.fromRGB(180, 140, 255) -- Фиолетовый текст
TitleLabel.TextSize = 22
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextScaled = false
TitleLabel.Parent = MainFrame

-- Кнопки меню (фиолетовые)
local buttons = {
    {Text = "⚡ Execute", Position = 50},
    {Text = "🛡️ Anti-Ban", Position = 100},
    {Text = "🎯 Aimbot", Position = 150},
    {Text = "👁️ ESP", Position = 200},
    {Text = "⚙️ Settings", Position = 250}
}

for _, btnData in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.8, 0, 0, 30)
    btn.Position = UDim2.new(0.1, 0, 0, btnData.Position)
    btn.BackgroundColor3 = Color3.fromRGB(60, 30, 120) -- Фиолетовый
    btn.BackgroundTransparency = 0.4
    btn.TextColor3 = Color3.fromRGB(200, 170, 255) -- Светло-фиолетовый текст
    btn.Text = btnData.Text
    btn.TextSize = 16
    btn.Font = Enum.Font.Gotham
    btn.BorderSizePixel = 0
    btn.Parent = MainFrame
    
    -- Эффект наведения (более яркий фиолетовый)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
        btn.BackgroundTransparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(60, 30, 120)
        btn.BackgroundTransparency = 0.4
    end)
    
    -- Обработчик нажатия (пример)
    btn.MouseButton1Click:Connect(function()
        print("[PulsarX] Нажата кнопка: " .. btnData.Text)
        -- Здесь будет логика функций
    end)
end

-- Статус бар (фиолетовая полоска)
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(1, 0, 0, 3)
StatusBar.Position = UDim2.new(0, 0, 0, 40)
StatusBar.BackgroundColor3 = Color3.fromRGB(120, 70, 255) -- Яркий фиолетовый
StatusBar.BackgroundTransparency = 0.1
StatusBar.Parent = MainFrame

-- Статус текст
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0, 45)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "✅ PulsarX | Статус: Активен"
StatusLabel.TextColor3 = Color3.fromRGB(150, 120, 255) -- Фиолетовый
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 30, 120)
CloseBtn.BackgroundTransparency = 0.6
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    PulsarXGUI.Enabled = false
    print("[PulsarX] GUI закрыт")
end)

-- Функция переключения GUI
local function ToggleGUI()
    PulsarXGUI.Enabled = not PulsarXGUI.Enabled
    return PulsarXGUI.Enabled
end

-- Горячая клавиша (Insert)
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        ToggleGUI()
    end
end)

print("[PulsarX] UI успешно загружен!")
return PulsarXGUI
