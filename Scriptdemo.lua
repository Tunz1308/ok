loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

       local Window = MakeWindow({
         Hub = {
         Title = "Tunz",
         Animation = "Tunz Roblox"
         },
        Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Running the Script...",
       Incorrectkey = "The key is incorrect",
       CopyKeyLink = "Copied to Clipboard"
      }
    }
  })

       MinimizeButton({
       Image = "http://www.roblox.com/asset/?id=29119045",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Farm"})
     
------- BUTTON
    
    AddButton(Tab1o, {
     Name = "farm zombie",
    Callback = function()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HumanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local VirtualInputManager = game:GetService("VirtualInputManager")

local function pressKey(key)
    VirtualInputManager:SendKeyEvent(true, key, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end

local function getClosestZombie()
    local closest, dist = nil, math.huge
    for _, mob in pairs(workspace:GetChildren()) do
        if mob:FindFirstChild("Humanoid") and mob.Name:lower():find("zombie") then
            local hrp = mob:FindFirstChild("HumanoidRootPart")
            if hrp then
                local mag = (HumanoidRootPart.Position - hrp.Position).magnitude
                if mag < dist then
                    closest = hrp
                    dist = mag
                end
            end
        end
    end
    return closest
end

task.spawn(function()
    while task.wait(0.5) do
        local target = getClosestZombie()
        if target and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame + Vector3.new(0, 5, 0)

            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
        end
    end
end)

task.spawn(function()
    while task.wait(3) do
        pressKey(Enum.KeyCode.Z)
        task.wait(2)
        pressKey(Enum.KeyCode.X)
        task.wait(2)
        pressKey(Enum.KeyCode.C)
        task.wait(5)
        pressKey(Enum.KeyCode.G)
    end
end)
(Settings)
  end
  })
  
   AddButton(Tab1o, {
     Name = "auto",
    Callback = function()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HumanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local function autoUsePerks()
    for _, perk in pairs(LocalPlayer.Backpack:GetChildren()) do
        if perk:IsA("Tool") and perk.Name:lower():find("perk") then
            perk.Parent = LocalPlayer.Character
            task.wait(0.2)
            perk:Activate()
        end
    end
end

local function getClosestRadio()
    local closest, dist = nil, math.huge
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj:IsA("ClickDetector") or obj:IsA("ProximityPrompt")) and obj.Parent and obj.Parent.Name:lower():find("radio") then
            local part = obj.Parent:IsA("BasePart") and obj.Parent or obj.Parent:FindFirstChildWhichIsA("BasePart")
            if part then
                local mag = (HumanoidRootPart.Position - part.Position).Magnitude
                if mag < dist then
                    closest = obj
                    dist = mag
                end
            end
        end
    end
    return closest
end

local function activateRadio(radio)
    if not radio then return end

    if radio:IsA("ProximityPrompt") then
        fireproximityprompt(radio, math.huge)
    elseif radio:IsA("ClickDetector") then
        for i = 1, 30 do
            fireclickdetector(radio)
            task.wait(0.1)
        end
    end
end

while task.wait(3) do
    autoUsePerks()

    local radio = getClosestRadio()
    if radio then
        local part = radio.Parent:IsA("BasePart") and radio.Parent or radio.Parent:FindFirstChildWhichIsA("BasePart")
        if part then
            LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)
            task.wait(1)
            activateRadio(radio)
        end
    end
end
(Settings)
  end
  })
  
   AddButton(Tab1o, {
     Name = "replay game",
    Callback = function()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function clickReplay()
    for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
        if gui:IsA("TextButton") or gui:IsA("ImageButton") then
            if gui.Name:lower():find("replay") or gui.Name:lower():find("playagain") then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,true,gui,0)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0,false,gui,0)
                print("Đã bấm nút Replay:", gui.Name)
            end
        end
    end
end

while task.wait(5) do
    clickReplay()
end
(Settings)
  end
  })