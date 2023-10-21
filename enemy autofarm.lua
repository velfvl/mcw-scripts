local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function isaplayer(a)
	if game:GetService("Players"):GetPlayerFromCharacter(a) then
		return true
	end
end

while task.wait() do
    coroutine.wrap(function()
        for _,v in pairs(workspace:GetChildren()) do
            if not isaplayer(v) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid").Health ~= 0 then
                local args = {
					[1] = "hit",
					[2] = {
						[1] = v:WaitForChild("Humanoid"),
						[2] = math.huge
					}
				}
				local swad = character:FindFirstChild("Sword") or player.Backpack:FindFirstChild("Sword")
				if swad then
					swad.RemoteFunction:InvokeServer(unpack(args))
				else
					print("script swad errorrrrrrrrrrrrrrrrrrrrrrr")
				end
            end
        end
    end)()
end
