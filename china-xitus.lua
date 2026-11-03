
--[[
    CHINA XITUS
    DARK EDITION
    Interface v1.0
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- CONFIGURAÇÕES
local Config = {
    Background = Color3.fromRGB(13, 13, 16),
    Sidebar = Color3.fromRGB(19, 19, 23),
    Panel = Color3.fromRGB(25, 25, 30),
    Red = Color3.fromRGB(220, 35, 45),
    White = Color3.fromRGB(245, 245, 245),
    Gray = Color3.fromRGB(145, 145, 155)
}

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CHINAXITUS"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- JANELA PRINCIPAL
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(680, 440)
Main.Position = UDim2.new(0.5, -340, 0.5, -220)
Main.BackgroundColor3 = Config.Background
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Config.Red
MainStroke.Thickness = 1.5
MainStroke.Parent = Main

-- CABEÇALHO
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 55)
Header.BackgroundColor3 = Config.Sidebar
Header.BorderSizePixel = 0
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.fromOffset(18, 0)
Title.BackgroundTransparency = 1
Title.Text = "CHINA XITUS"
Title.TextColor3 = Config.Red
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 23
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Version = Instance.new("TextLabel")
Version.Size = UDim2.fromOffset(90, 20)
Version.Position = UDim2.new(1, -105, 0, 18)
Version.BackgroundTransparency = 1
Version.Text = "V1.0"
Version.TextColor3 = Config.Gray
Version.Font = Enum.Font.GothamBold
Version.TextSize = 12
Version.Parent = Header

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 165, 1, -65)
Sidebar.Position = UDim2.fromOffset(0, 60)
Sidebar.BackgroundColor3 = Config.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0, 7)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0, 12)
SidePadding.PaddingLeft = UDim.new(0, 10)
SidePadding.PaddingRight = UDim.new(0, 10)
SidePadding.Parent = Sidebar

-- CONTEÚDO
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -180, 1, -75)
Content.Position = UDim2.fromOffset(175, 65)
Content.BackgroundTransparency = 1
Content.Parent = Main

local PageTitle = Instance.new("TextLabel")
PageTitle.Size = UDim2.new(1, -20, 0, 35)
PageTitle.BackgroundTransparency = 1
PageTitle.Text = "HOME"
PageTitle.TextColor3 = Config.White
PageTitle.Font = Enum.Font.GothamBold
PageTitle.TextSize = 19
PageTitle.TextXAlignment = Enum.TextXAlignment.Left
PageTitle.Parent = Content

local Description = Instance.new("TextLabel")
Description.Size = UDim2.new(1, -20, 0, 30)
Description.Position = UDim2.fromOffset(0, 35)
Description.BackgroundTransparency = 1
Description.Text = "Bem-vindo ao CHINA XITUS."
Description.TextColor3 = Config.Gray
Description.Font = Enum.Font.Gotham
Description.TextSize = 13
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.Parent = Content

-- PÁGINAS
local Pages = {
    "HOME",
    "MOVEMENT",
    "COMBAT",
    "VISUALS",
    "CROSSHAIR",
    "VEHICLES",
    "TELEPORT",
    "TOOLS",
    "UTILITIES",
    "INFO",
    "SETTINGS"
}

local function CreatePage(name)
    local Page = Instance.new("ScrollingFrame")
    Page.Name = name
    Page.Size = UDim2.new(1, -10, 1, -85)
    Page.Position = UDim2.fromOffset(0, 80)
    Page.BackgroundColor3 = Config.Panel
    Page.BorderSizePixel = 0
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = Config.Red
    Page.Visible = false
    Page.Parent = Content

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Page

    local Padding = Instance.new("UIPadding")
    Padding.PaddingTop = UDim.new(0, 12)
    Padding.PaddingLeft = UDim.new(0, 12)
    Padding.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = Page

    return Page
end

local PageObjects = {}

for _, name in ipairs(Pages) do
    PageObjects[name] = CreatePage(name)
end

local function AddButton(page, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -15, 0, 38)
    Button.BackgroundColor3 = Config.Sidebar
    Button.Text = text
    Button.TextColor3 = Config.White
    Button.Font = Enum.Font.GothamMedium
    Button.TextSize = 13
    Button.AutoButtonColor = true
    Button.Parent = page

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)

    return Button
end

local CurrentPage

local function OpenPage(name)
    for pageName, page in pairs(PageObjects) do
        page.Visible = pageName == name
    end

    PageTitle.Text = name
    CurrentPage = name
end

for _, name in ipairs(Pages) do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 34)
    Button.BackgroundColor3 = Config.Panel
    Button.Text = "   " .. name
    Button.TextColor3 = Config.White
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 12
    Button.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        OpenPage(name)
    end)
end

-- EXEMPLOS DE CONTROLES
AddButton(PageObjects.HOME, "CHINA XITUS - ONLINE")
AddButton(PageObjects.MOVEMENT, "Fly - Configuração disponível na próxima etapa")
AddButton(PageObjects.MOVEMENT, "Speed - Configuração disponível na próxima etapa")
AddButton(PageObjects.VISUALS, "Fullbright - Configuração disponível na próxima etapa")
AddButton(PageObjects.SETTINGS, "Descarregar interface", function()
    ScreenGui:Destroy()
end)

-- ARRASTAR JANELA
local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPosition = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if Dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local Delta = input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = false
    end
end)

-- INICIALIZAÇÃO
OpenPage("HOME")

print("CHINA XITUS carregado!")
