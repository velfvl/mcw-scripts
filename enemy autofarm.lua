local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function args(a)
	local gs = {
		[1] = "hit",
		[2] = {
			[1] = a,
			[2] = a.Health/2
		}
	}
	return gs
end

while task.wait() do
    coroutine.wrap(function()
        for _,v in pairs(workspace:GetChildren()) do
        	local humanoid = v:FindFirstChild("Humanoid")
            if not game:GetService("Players"):GetPlayerFromCharacter(v) and humanoid and humanoid.Health ~= 0 then
                local swad = character:FindFirstChild("Sword") or player.Backpack:FindFirstChild("Sword")
                swad.RemoteFunction:InvokeServer(unpack(args(humanoid)))
            end
        end
    end)()
end
