local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("WestBound Haxs ~ By Twisted", "Sentinel")

local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Information")

local Section1 = Tab1:NewSection("Gun-Stats")
local Section2 = Tab1:NewSection("Player Options")
local Section3 = Tab1:NewSection("AutoFarm")
local Section4 = Tab2:NewSection("Made By Twisted_Secret :)")



-- Section 1 
Section1:NewButton("Gun-Stats Sir", "0", function()
local stats = require(game:GetService("ReplicatedStorage").GunScripts.GunStats)

local gunName = "Colt Navy"
stats[gunName].GunType = "Pistol"
stats[gunName].MaxShots = 150
stats[gunName].ReloadSpeed = 0
stats[gunName].Damage = 100
stats[gunName].equipTime = 0
stats[gunName].prepTime = 0
stats[gunName].HipFireAccuracy = 100
stats[gunName].BulletSpeed = 90

local gunName = "Winchester Rifle"
stats[gunName].GunType = "Rifle"
stats[gunName].MaxShots = 150
stats[gunName].ReloadSpeed = 0
stats[gunName].Damage = 100
stats[gunName].equipTime = 0
stats[gunName].prepTime = 0
stats[gunName].HipFireAccuracy = 100
stats[gunName].BulletSpeed = 60

local gunName = "Pump-action Shotgun"
stats[gunName].GunType = "Shotgun"
stats[gunName].MaxShots = 150
stats[gunName].ReloadSpeed = 0
stats[gunName].Damage = 100
stats[gunName].equipTime = 0
stats[gunName].prepTime = 0
stats[gunName].HipFireAccuracy = 100
stats[gunName].BulletSpeed = 50


end)
-- End Section 1 


-- Section 2 Function Start
Section2:NewButton("Player ESP Sir", "0", function()

    local esp_settings = { ---- table for esp settings 
    textsize = 20,
}

local gui = Instance.new("BillboardGui")
local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel



gui.Name = "ESP"; ---- properties of the esp
gui.ResetOnSpawn = false
gui.AlwaysOnTop = true;
gui.LightInfluence = 0;
gui.Size = UDim2.new(1.75, 0, 1.75, 0);
esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
esp.Text = ""
esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
esp.BorderSizePixel = 4;
esp.BorderColor3 = Color3.new(255,255,255)
esp.BorderSizePixel = 0
esp.Font = "FredokaOne"
esp.TextSize = esp_settings.textsize
esp.TextColor3 = Color3.fromRGB(255, 0, 254) -- text colour

game:GetService("RunService").RenderStepped:Connect(function() ---- loops faster than a while loop :)
    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("ESP")==nil  then -- craeting checks for team check, local player etc
            esp.Text = "{"..v.Name.."}"
            gui:Clone().Parent = v.Character.Head
    end
 end
end)
end)
-- End of Section 2.

-- Section 2 Phrase 2 Function Start
Section2:NewButton("Player Chams Sir", "0", function()
    local players = game:GetService('Players')
    local player = players.LocalPlayer
    local char = player.Character
    local switch = true
    
    local chams = function()
        switch = true
        local p = players:GetPlayers()
        for _, v in next, player.PlayerGui:GetChildren() do
            if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
                v:Destroy()
            end
        end
        for _, v in next, p do
            if v.Character ~= nil and v.Character:FindFirstChild('Head') ~= nil and v.TeamColor ~= player.TeamColor then
                if v ~= player then
                    local folder = Instance.new('Folder',player.PlayerGui)
                    folder.Name = v.Name
                    for _, part in pairs(v.Character:GetChildren()) do
                        if part:IsA('BasePart') then
                            local adorn = Instance.new('BoxHandleAdornment',folder)
                            adorn.Name = v.Name
                            if part.Name ~= 'Head' then
                                adorn.Size = part.Size
                            else
                                adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
                            end
                             adorn.Adornee = part
                            adorn.AlwaysOnTop = true
                            adorn.ZIndex = 5
                            adorn.Transparency = 0.2
                            adorn.Color = v.TeamColor
                            local adorn2 = Instance.new('BoxHandleAdornment',folder)
                            adorn2.Name = v.Name Color3.new(1,1,1)
                            if part.Name ~= 'Head' then
                                adorn2.Size = part.Size*8
                            else
                                adorn2.Size = (part.Size*8)-Vector3.new(part.Size.X/2,0,0)
                            end
                        end
                    end
                end
            end
        end
    end
    
    local turn_on = chams
    local turn_off = function()
        switch = false
        for _, v in next, player.PlayerGui:GetChildren() do
            if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
                v:Destroy()
            end
        end
    end
    
    
    
    turn_on()
        if switch then
            chams()
    end
end)
-- Section 2 Phrase 2 Function End

-- Section 3 
Section3:NewButton("Auto-Farm Sir", "0", function()
-- // Services
local Workspace = game:GetService('Workspace')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local RunService = game:GetService('RunService')

-- // Player
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local States = LocalPlayer:FindFirstChild('States')
local Stats = LocalPlayer:FindFirstChild('Stats')

-- // Remotes
local GeneralEvents = ReplicatedStorage:FindFirstChild('GeneralEvents')
local RobRemote = GeneralEvents:FindFirstChild('Rob')
local ChangeCharacter = Character:FindFirstChild('ChangeCharacter')
local LassoEvent = GeneralEvents:FindFirstChild('LassoEvents')

-- // Paths
local ChestFolder = Workspace:FindFirstChild('ChestFolder')
local Lassod = States:FindFirstChild('Lassod')
local Hogtied = States:FindFirstChild('Hogtied')
local BagLevel = Stats:FindFirstChild('BagSizeLevel'):FindFirstChild('CurrentAmount')
local BagAmount = States:FindFirstChild('Bag')

-- // Locations
local Camp = CFrame.new(1636.62537, 104.349976, -1736.184)

-- // Status
local CashRegisterFinished = false
local BankFinished = false

-- // Functions
local function TeleportToCamp()
    HumanoidRootPart.CFrame = Camp
end

local function Godmode()
    ChangeCharacter:FireServer('Damage', 0/0)
end

local function AntiAFK()
    for _, Connection in next, getconnections(LocalPlayer.Idled) do
        Connection:Disable()
    end
end

local function HideName()
    Character:FindFirstChild('Head'):FindFirstChild('NameTag'):Destroy()
end

local function CashRegisterFarm()
    for _, Item in next, Workspace:GetChildren() do
        if BagAmount.Value == BagLevel.Value then 
            TeleportToCamp()
            CashRegisterFinished = true
            break
        elseif Item:IsA('Model') and Item.Name == 'CashRegister' then
            HumanoidRootPart.CFrame = Item:FindFirstChild('Open').CFrame
            RobRemote:FireServer('Register', {['Part'] = Item:FindFirstChild('Union'), ['OpenPart'] = Item:FindFirstChild('Open'), ['ActiveValue'] = Item:FindFirstChild('Active'), ['Active'] = true})
        end
    end    
    CashRegisterFinished = true
end

local function BankFarm()
    for _, Item in next, Workspace:GetChildren() do
        if BagAmount.Value == BagLevel.Value then 
            TeleportToCamp()
            BankFinished = true
            break
        elseif Item:IsA('Model') and Item.Name == 'Safe' and Item:FindFirstChild('Amount').Value > 0 then
            if Item:FindFirstChild('Open').Value == true then
                HumanoidRootPart.CFrame = Item:FindFirstChild('Safe').CFrame
                RobRemote:FireServer('Safe', Item)
            elseif Item:FindFirstChild('Open').Value == false then
                HumanoidRootPart.CFrame = Item:FindFirstChild('Safe').CFrame
                Item:FindFirstChild('OpenSafe'):FireServer('Completed')
                RobRemote:FireServer('Safe', Item)
            end
        end
    end
    BankFinished = true
end

-- // Main
Godmode()
HideName()
AntiAFK()
RunService.RenderStepped:Connect(function()
    coroutine.wrap(BankFarm)()
    coroutine.wrap(CashRegisterFarm)()
    repeat task.wait() until CashRegisterFinished == true and BankFarmFinished == true
end)
    end)
-- End Section 3

-- Information Toggle UI
Section4:NewKeybind("Press F To Toggle The UI", "KeybindInfo", Enum.KeyCode.F, function()
    Library:ToggleUI()  
end)
-- End Information Toggle UI

-- Section 2 Function Start
Section2:NewButton("Player Godmode", "0", function()
    local ChangeCharacter = Character:FindFirstChild('ChangeCharacter')
    local function Godmode()
        ChangeCharacter:FireServer('Damage', 0/0)
        Godmode()
    end
end)
-- End of Section 2.

