local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function args(a)
	local gs = {
		[1] = "hit",
		[2] = {
			[1] = a,
			[2] = math.huge
		}
	}
	return gs
end

local function isaenemy(a)
	for _,v in pairs(a:GetDescendants()) do
		if v:IsA("Script") and v.Name == "EnemyMain" then
			return true
		end
	end
end

local function kill(a)
	local humanoid = a:FindFirstChild("Humanoid")
	if isaenemy(a) and humanoid and humanoid.Health ~= 0 then
		local swad = character:FindFirstChild("Sword") or player.Backpack:FindFirstChild("Sword")
		task.wait(1.5)
		swad.RemoteFunction:InvokeServer(unpack(args(humanoid)))
	end
end

while task.wait() do
	for _,v in pairs(workspace:GetChildren()) do
		coroutine.wrap(function()
			kill(v)
		end)()
	end
end
