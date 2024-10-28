require'switches'
state = 0

Vector = require 'vector'

spritesheet = love.graphics.newImage('Jokers.png')
spritesheetdims = Vector(spritesheet:getWidth(), spritesheet:getHeight())
cardidx = 0
carddimensions = Vector(10, 16)
totalcards = carddimensions.x * carddimensions.y

startgap = 2
pixpos = Vector(0, 0)
cardsize = Vector(138, 186)
gap = 4

canvas = love.graphics.newCanvas(cardsize.x, cardsize.y)

function love.load()
    love.filesystem.setIdentity('balatro_jokers')
    canvas:setFilter('nearest')
    state = 1
end

function nextCard()
    pixpos.x = pixpos.x + (cardsize.x + gap)
    if pixpos.x >= spritesheetdims.x then
        pixpos.x = 0
        pixpos.y = pixpos.y + (cardsize.y + gap)
    end
    cardidx = cardidx + 1
    if cardidx >= totalcards then
        love.system.openURL('file://'..love.filesystem.getSaveDirectory())
        love.event.quit()
    end
end

function love.draw()
    local status = ''
    if state == 1 then
        love.graphics.push()
        love.graphics.setCanvas(canvas)
        love.graphics.clear(255,255,255,255)
        love.graphics.setScissor(SCISSOR, SCISSOR, cardsize.x-(SCISSOR*2), cardsize.y-(SCISSOR*2))
        love.graphics.draw(spritesheet, -pixpos.x, -pixpos.y, 0, 1, 1, startgap, startgap)
        love.graphics.setScissor()
        love.graphics.setCanvas()
        love.graphics.pop()
        local filename = 'j'..cardidx..'.png'
        nextCard()
        love.graphics.clear(255,255,255,255)
        love.graphics.draw(canvas, PRINT_BLEED_VALUE_HOR, PRINT_BLEED_VALUE_VER, 0, SCALE, SCALE)
        love.graphics.captureScreenshot(filename)
        love.window.setTitle(cardidx..'/'..totalcards)
    end
end

-- from the docs just slightly modified
function love.run()
    if love.load then love.load(love.arg.parseGameArguments(arg), arg) end
	if love.timer then love.timer.step() end

	local dt = 0

	return function()
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
				if name == "quit" then
					if not love.quit or not love.quit() then
						return a or 0
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end

		if love.timer then dt = love.timer.step() end

		if love.update then love.update(dt) end

		if love.graphics and love.graphics.isActive() then
			love.graphics.origin()
			love.graphics.clear(love.graphics.getBackgroundColor())
			if love.draw then love.draw() end
			love.graphics.present()
		end

		if love.timer then love.timer.sleep(0.016) end
	end
end