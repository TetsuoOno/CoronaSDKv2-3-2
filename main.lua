----------------------------------------------------------------------------
--CoronaSDK ver.1202までと、ver.2076からで表示時のオブジェクトの原点座標が異なります。
----------------------------------------------------------------------------

local rect = display.newRect(50, 50,  100, 100 )

--[[
local function moveRect( event ) 
	if( event.phase == "ended" ) then
		transition.to(rect, {time = 1000, y = 400, })--x = 250, rotation = 720
	end
end

rect:addEventListener( "touch", moveRect )
--]]

local function changeColor()
	--rect:setFillColor(math.random(0,255), math.random(0,255), math.random(0,255), 255)
	rect:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1), 1)
end

local function complete()
	local compText = display.newText("Complete", 0, 0, "HelveticaNeue-UltraLight", 60)
	compText.x = display.contentWidth /2
	compText.y = display.contentHeight /2
	transition.to(compText, {delay = 500, time = 1000, alpha = 0})
	changeColor()
end

local function jump()
	transition.to(rect, {time = 1000, x = 100, y = 100, rotation = rect.rotation -360, onComplete = complete })
end

local function step( )
	transition.to(rect, {time = 1000, x = 250, onComplete = jump})
end

local function hop( event )
	if( event.phase == "ended" ) then
		transition.to(rect, {time = 1000, y = 400, onComplete = step})
	end
end

rect:addEventListener( "touch", hop )
