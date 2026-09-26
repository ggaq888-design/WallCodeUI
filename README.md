--========================================================
-- 🔐 WALL CODE UI
-- © حقوق السكربت: مهند الحربي
--========================================================
--========================================================
-- 🔐 WALL CODE UI
-- واجهة طويلة + زر إغلاق + أصوات
--========================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local remote = ReplicatedStorage:WaitForChild("WallCodeEvent")

--========================================================
-- ScreenGui
--========================================================

local gui = Instance.new("ScreenGui")
gui.Name = "WallCodeUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 100
gui.Parent = playerGui

--========================================================
-- الإطار الرئيسي
--========================================================

local main = Instance.new("Frame")
main.Name = "WallPanel"

-- طويل
main.Size = UDim2.new(0, 360, 0, 430)

-- خارج الشاشة بالبداية
main.Position = UDim2.new(1, 30, 0.5, -215)

main.BackgroundColor3 = Color3.fromRGB(10, 10, 13)
main.BackgroundTransparency = 0.08
main.BorderSizePixel = 0
main.Visible = false
main.Parent = gui

-- الزوايا
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = main

-- إطار بنفسجي
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(145, 75, 255)
stroke.Thickness = 1.5
stroke.Transparency = 0.15
stroke.Parent = main

--========================================================
-- الشريط العلوي الأسود
--========================================================

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 70)
topBar.BackgroundColor3 = Color3.fromRGB(4, 4, 6)
topBar.BorderSizePixel = 0
topBar.Parent = main

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 15)
topCorner.Parent = topBar

-- تغطية الجزء السفلي
local topCover = Instance.new("Frame")
topCover.Size = UDim2.new(1, 0, 0, 18)
topCover.Position = UDim2.new(0, 0, 1, -18)
topCover.BackgroundColor3 = Color3.fromRGB(4, 4, 6)
topCover.BorderSizePixel = 0
topCover.Parent = topBar

--========================================================
-- عنوان
--========================================================

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 35)
title.Position = UDim2.new(0, 20, 0, 10)
title.BackgroundTransparency = 1
title.Text = "🧱  نظام الجدار"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Right
title.Parent = topBar

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -80, 0, 22)
subtitle.Position = UDim2.new(0, 20, 0, 40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "ACCESS CONTROL"
subtitle.TextColor3 = Color3.fromRGB(145, 75, 255)
subtitle.TextSize = 10
subtitle.Font = Enum.Font.GothamBold
subtitle.TextXAlignment = Enum.TextXAlignment.Right
subtitle.Parent = topBar

--========================================================
-- زر الإغلاق X
--========================================================

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 42, 0, 42)
closeButton.Position = UDim2.new(0, 14, 0, 14)
closeButton.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
closeButton.BackgroundTransparency = 0.15
closeButton.BorderSizePixel = 0
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 28
closeButton.Font = Enum.Font.GothamBold
closeButton.AutoButtonColor = false
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeButton

--========================================================
-- وصف
--========================================================

local description = Instance.new("TextLabel")
description.Size = UDim2.new(1, -40, 0, 50)
description.Position = UDim2.new(0, 20, 0, 95)
description.BackgroundTransparency = 1
description.Text = "هذا الجدار محمي بنظام أمان.\nأدخل رمز الدخول لفتح الممر."
description.TextColor3 = Color3.fromRGB(180, 180, 185)
description.TextSize = 15
description.Font = Enum.Font.Gotham
description.TextWrapped = true
description.TextXAlignment = Enum.TextXAlignment.Right
description.Parent = main

--========================================================
-- عنوان الرمز
--========================================================

local codeTitle = Instance.new("TextLabel")
codeTitle.Size = UDim2.new(1, -40, 0, 25)
codeTitle.Position = UDim2.new(0, 20, 0, 165)
codeTitle.BackgroundTransparency = 1
codeTitle.Text = "رمز الدخول"
codeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
codeTitle.TextSize = 14
codeTitle.Font = Enum.Font.GothamBold
codeTitle.TextXAlignment = Enum.TextXAlignment.Right
codeTitle.Parent = main

--========================================================
-- خانة الرمز
--========================================================

local codeBox = Instance.new("TextBox")
codeBox.Name = "CodeBox"
codeBox.Size = UDim2.new(1, -40, 0, 55)
codeBox.Position = UDim2.new(0, 20, 0, 195)
codeBox.BackgroundColor3 = Color3.fromRGB(24, 24, 29)
codeBox.BorderSizePixel = 0
codeBox.PlaceholderText = "••••"
codeBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 95)
codeBox.Text = ""
codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
codeBox.TextSize = 22
codeBox.Font = Enum.Font.GothamBold
codeBox.ClearTextOnFocus = false
codeBox.TextXAlignment = Enum.TextXAlignment.Center
codeBox.Parent = main

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 10)
boxCorner.Parent = codeBox

local boxStroke = Instance.new("UIStroke")
boxStroke.Color = Color3.fromRGB(50, 50, 58)
boxStroke.Thickness = 1
boxStroke.Parent = codeBox

-- أرقام فقط
codeBox:GetPropertyChangedSignal("Text"):Connect(function()

	local clean = codeBox.Text:gsub("%D", "")

	if #clean > 8 then
		clean = clean:sub(1, 8)
	end

	if codeBox.Text ~= clean then
		codeBox.Text = clean
	end
end)

--========================================================
-- زر التحقق
--========================================================

local checkButton = Instance.new("TextButton")
checkButton.Name = "CheckButton"
checkButton.Size = UDim2.new(1, -40, 0, 55)
checkButton.Position = UDim2.new(0, 20, 0, 270)
checkButton.BackgroundColor3 = Color3.fromRGB(145, 75, 255)
checkButton.BorderSizePixel = 0
checkButton.Text = "🔐   تحقق من الرمز"
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.TextSize = 16
checkButton.Font = Enum.Font.GothamBold
checkButton.AutoButtonColor = false
checkButton.Parent = main

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 10)
checkCorner.Parent = checkButton

--========================================================
-- رسالة النتيجة
--========================================================

local message = Instance.new("TextLabel")
message.Name = "Message"
message.Size = UDim2.new(1, -40, 0, 40)
message.Position = UDim2.new(0, 20, 0, 335)
message.BackgroundTransparency = 1
message.Text = ""
message.TextColor3 = Color3.fromRGB(255, 70, 70)
message.TextSize = 14
message.Font = Enum.Font.GothamBold
message.TextWrapped = true
message.TextXAlignment = Enum.TextXAlignment.Center
message.Parent = main

--========================================================
-- خط سفلي
--========================================================

local bottomLine = Instance.new("Frame")
bottomLine.Size = UDim2.new(1, -40, 0, 1)
bottomLine.Position = UDim2.new(0, 20, 1, -35)
bottomLine.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
bottomLine.BorderSizePixel = 0
bottomLine.Parent = main

--========================================================
-- الأصوات
--========================================================

local wrongSound = Instance.new("Sound")
wrongSound.Name = "WrongCodeSound"

-- صوت خطأ قصير
wrongSound.SoundId = "rbxassetid://9118828562"
wrongSound.Volume = 0.7
wrongSound.Parent = gui

local correctSound = Instance.new("Sound")
correctSound.Name = "CorrectCodeSound"

-- صوت نجاح
correctSound.SoundId = "rbxassetid://6026984224"
correctSound.Volume = 0.7
correctSound.Parent = gui

--========================================================
-- فتح الواجهة
--========================================================

local function showUI()

	main.Visible = true

	main.Position = UDim2.new(
		1,
		30,
		0.5,
		-215
	)

	message.Text = ""
	message.TextColor3 = Color3.fromRGB(255, 70, 70)
	codeBox.Text = ""

	local tween = TweenService:Create(
		main,
		TweenInfo.new(
			0.4,
			Enum.EasingStyle.Quart,
			Enum.EasingDirection.Out
		),
		{
			Position = UDim2.new(
				1,
				-380,
				0.5,
				-215
			)
		}
	)

	tween:Play()

	task.wait(0.2)

	codeBox:CaptureFocus()
end

--========================================================
-- إغلاق الواجهة
--========================================================

local function hideUI()

	local tween = TweenService:Create(
		main,
		TweenInfo.new(
			0.3,
			Enum.EasingStyle.Quart,
			Enum.EasingDirection.In
		),
		{
			Position = UDim2.new(
				1,
				30,
				0.5,
				-215
			)
		}
	)

	tween:Play()

	tween.Completed:Wait()

	main.Visible = false
end

-- زر X
closeButton.MouseButton1Click:Connect(function()

	hideUI()

end)

--========================================================
-- زر التحقق
--========================================================

checkButton.MouseButton1Click:Connect(function()

	if codeBox.Text == "" then

		message.Text = "⚠ أدخل رمز الجدار أولاً!"

		return
	end

	message.Text = ""

	remote:FireServer(
		"CheckCode",
		codeBox.Text
	)
end)

--========================================================
-- زر Enter
--========================================================

codeBox.FocusLost:Connect(function(enterPressed)

	if enterPressed and codeBox.Text ~= "" then

		remote:FireServer(
			"CheckCode",
			codeBox.Text
		)

	end
end)

--========================================================
-- نتائج السيرفر
--========================================================

remote.OnClientEvent:Connect(function(action)

	-- فتح الواجهة
	if action == "ShowUI" then

		showUI()

	-- الرمز خطأ
	elseif action == "WrongCode" then

		wrongSound:Play()

		message.Text = "❌ رمز الجدار غلط، حاول مرة أخرى!"
		message.TextColor3 = Color3.fromRGB(255, 70, 70)

		codeBox.Text = ""

		-- اهتزاز
		local original = main.Position

		for i = 1, 3 do

			main.Position =
				original + UDim2.new(0, 7, 0, 0)

			task.wait(0.04)

			main.Position =
				original - UDim2.new(0, 7, 0, 0)

			task.wait(0.04)

		end

		main.Position = original

	-- الرمز صحيح
	elseif action == "CorrectCode" then

		correctSound:Play()

		message.Text = "✓ تم التحقق بنجاح!"
		message.TextColor3 = Color3.fromRGB(80, 255, 130)

		task.wait(0.5)

		hideUI()
	end
end)
