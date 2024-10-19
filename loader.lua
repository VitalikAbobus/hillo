-- loader.lua (на GitHub)
local function createLoader(Name, url)
    -- Добавляем отладку перед созданием GUI
    print("Создание GUI с именем: " .. Name)

    local AdvancedLoader = Instance.new("ScreenGui")
    AdvancedLoader.Name = "AdvancedLoader"

    -- Проверяем, существует ли PlayerGui
    local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then
        print("PlayerGui не найден!")
        return
    end

    -- Добавляем отладку при добавлении в PlayerGui
    AdvancedLoader.Parent = playerGui
    print("GUI добавлено в PlayerGui")

    -- Создаем остальные элементы GUI
    local Window = Instance.new("Frame")
    Window.Name = "Window"
    Window.Parent = AdvancedLoader
    Window.BackgroundColor3 = Color3.fromRGB(99, 109, 255)
    Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window.BorderSizePixel = 2
    Window.Position = UDim2.new(0.372057706, 0, 0.242748097, 0)
    Window.Size = UDim2.new(0, 336, 0, 336)

    local LoaderTextLabel = Instance.new("TextLabel")
    LoaderTextLabel.Name = "LoaderTextLabel"
    LoaderTextLabel.Parent = Window
    LoaderTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoaderTextLabel.BackgroundTransparency = 1.000
    LoaderTextLabel.Position = UDim2.new(0, 0, 0.256410271, 0)
    LoaderTextLabel.Size = UDim2.new(0, 336, 0, 19)
    LoaderTextLabel.Font = Enum.Font.JosefinSans
    LoaderTextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    LoaderTextLabel.TextSize = 18.000
    LoaderTextLabel.Text = Name

    -- Отладка для завершения создания GUI
    print("GUI успешно создано с названием: " .. Name)
end

-- Возвращаем функцию для вызова в экзекуторе
return createLoader
