local function Loader:Create(Name: string, url: string)
    local AdvancedLoader = Instance.new("ScreenGui")
    local Window = Instance.new("Frame")
    local LOADERNAME = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local LoaderTextLabel = Instance.new("TextLabel")
    local CheckKeyButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local UICorner_3 = Instance.new("UICorner")
    local KeyTextBox = Instance.new("TextBox")
    local UICorner_4 = Instance.new("UICorner")

    AdvancedLoader.Name = "AdvancedLoader"
    AdvancedLoader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    AdvancedLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Window.Name = "Window"
    Window.Parent = AdvancedLoader
    Window.BackgroundColor3 = Color3.fromRGB(99, 109, 255)
    Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window.BorderSizePixel = 2
    Window.Position = UDim2.new(0.372057706, 0, 0.242748097, 0)
    Window.Size = UDim2.new(0, 336, 0, 336)

    LOADERNAME.Name = "LOADERNAME"
    LOADERNAME.Parent = Window
    LOADERNAME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LOADERNAME.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LOADERNAME.BorderSizePixel = 2
    LOADERNAME.Position = UDim2.new(0, 0, -0.0565476194, 0)
    LOADERNAME.Size = UDim2.new(0, 336, 0, 39)

    UICorner.Parent = LOADERNAME

    LoaderTextLabel.Name = "LoaderTextLabel"
    LoaderTextLabel.Parent = LOADERNAME
    LoaderTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoaderTextLabel.BackgroundTransparency = 1.000
    LoaderTextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LoaderTextLabel.BorderSizePixel = 0
    LoaderTextLabel.Position = UDim2.new(0, 0, 0.256410271, 0)
    LoaderTextLabel.Size = UDim2.new(0, 336, 0, 19)
    LoaderTextLabel.Font = Enum.Font.JosefinSans
    LoaderTextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    LoaderTextLabel.TextSize = 18.000
    LoaderTextLabel.Text = Name  -- Название из аргумента Name

    CheckKeyButton.Name = "CheckKeyButton"
    CheckKeyButton.Parent = Window
    CheckKeyButton.BackgroundColor3 = Color3.fromRGB(171, 193, 255)
    CheckKeyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CheckKeyButton.BorderSizePixel = 0
    CheckKeyButton.Position = UDim2.new(0.202380955, 0, 0.633928597, 0)
    CheckKeyButton.Size = UDim2.new(0, 200, 0, 50)
    CheckKeyButton.Font = Enum.Font.JosefinSans
    CheckKeyButton.Text = "Check Key"
    CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckKeyButton.TextSize = 14.000

    UICorner_2.Parent = CheckKeyButton

    UICorner_3.Parent = Window

    KeyTextBox.Name = "KeyTextBox"
    KeyTextBox.Parent = Window
    KeyTextBox.BackgroundColor3 = Color3.fromRGB(229, 235, 255)
    KeyTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    KeyTextBox.BorderSizePixel = 0
    KeyTextBox.Position = UDim2.new(0.202380955, 0, 0.15773809, 0)
    KeyTextBox.Size = UDim2.new(0, 200, 0, 133)
    KeyTextBox.Font = Enum.Font.SourceSans
    KeyTextBox.PlaceholderText = "Paste your key here"
    KeyTextBox.Text = ""
    KeyTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    KeyTextBox.TextSize = 14.000
    KeyTextBox.TextWrapped = true

    UICorner_4.Parent = KeyTextBox

    -- Добавляем отладку
    print("Loader UI создано")

    -- Обрабатываем событие нажатия на кнопку
    CheckKeyButton.MouseButton1Click:Connect(function()
        print("Кнопка нажата")
        local enteredKey = KeyTextBox.Text
        print("Введенный ключ:", enteredKey)
        
        -- Загружаем таблицу ключей через loadstring
        local loadKeys = loadstring(game:HttpGet(url))  -- Загружаем скрипт с ключами
        local allowedKeys = loadKeys()
        print("Загруженные ключи:", allowedKeys)

        -- Проверяем ключ
        local isKeyValid = false
        for _, key in ipairs(allowedKeys) do
            if enteredKey == key then
                isKeyValid = true
                break
            end
        end

        if isKeyValid then
            print("Ключ действителен!")
        else
            print("Ключ недействителен!")
        end
    end)
end

_G.LoaderInitiate = Loader:Create(Name: string, url: string)
