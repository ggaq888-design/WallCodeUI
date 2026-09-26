--========================================================
-- 🔐 WALL CODE UI
-- © حقوق السكربت: مهند الحربي
--========================================================
--========================================================
-- 🧱 WALL CODE SYSTEM
-- الرمز الصحيح: 1234
-- © 2026 مهند الحربي
-- جميع الحقوق محفوظة
--========================================================

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local wall = script.Parent

-- إنشاء RemoteEvent
local remote = ReplicatedStorage:FindFirstChild("WallCodeEvent")

if not remote then
	remote = Instance.new("RemoteEvent")
	remote.Name = "WallCodeEvent"
	remote.Parent = ReplicatedStorage
end

-- إنشاء ProximityPrompt
local prompt = wall:FindFirstChildOfClass("ProximityPrompt")

if not prompt then
	prompt = Instance.new("ProximityPrompt")
	prompt.Parent = wall
end

prompt.ActionText = "تحقق من الرمز"
prompt.ObjectText = "الجدار"
prompt.HoldDuration = 0
prompt.MaxActivationDistance = 10

local opened = false
local CORRECT_CODE = "1234"

--========================================================
-- اللاعب يضغط على الجدار
--========================================================

prompt.Triggered:Connect(function(player)

	if opened then
		return
	end

	remote:FireClient(player, "ShowUI")
end)

--========================================================
-- استقبال الرمز
--========================================================

remote.OnServerEvent:Connect(function(player, action, code)

	if action ~= "CheckCode" then
		return
	end

	if opened then
		return
	end

	-- الرمز غلط
	if tostring(code) ~= CORRECT_CODE then

		remote:FireClient(player, "WrongCode")

		return
	end

	-- الرمز صحيح
	opened = true
	prompt.Enabled = false

	remote:FireClient(player, "CorrectCode")

	task.wait(0.5)

	-- مكان الجدار بعد الفتح
	local openPosition = wall.Position + Vector3.new(0, 8, 0)

	local info = TweenInfo.new(
		2,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)

	-- فتح الجدار
	local openTween = TweenService:Create(
		wall,
		info,
		{
			Position = openPosition
		}
	)

	openTween:Play()
	openTween.Completed:Wait()

	-- يبقى مفتوح
	task.wait(5)

	-- إغلاق الجدار
	local closePosition = openPosition - Vector3.new(0, 8, 0)

	local closeTween = TweenService:Create(
		wall,
		info,
		{
			Position = closePosition
		}
	)

	closeTween:Play()
	closeTween.Completed:Wait()

	opened = false
	prompt.Enabled = true
end)
