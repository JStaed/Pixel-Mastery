ui = {}

require('color')

function ui.load()
    rVal = 0
    gVal = 0
    bVal = 0
    myFont = love.graphics.newFont("MilkyNice-Clean.ttf")
    colorButton = {
        x = 0,
        y = love.graphics.getHeight() - 22,
        width = 150,
        height = 22,
        c = color.clear,
        pressed = false,
    }
    rUpButton = {
        x = love.graphics.getWidth()/2 - 273,
        y = love.graphics.getHeight() - 95/1.25 + 20,
        width = 20,
        height = 10,
    }
    rDownButton = {
        x = love.graphics.getWidth()/2 - 273,
        y = love.graphics.getHeight() - 95/1.25 + 31,
        width = 20,
        height = 10,
    }
    gUpButton = {
        x = love.graphics.getWidth()/2 - 222,
        y = love.graphics.getHeight() - 95/1.25 + 20,
        width = 20,
        height = 10,
    }
    gDownButton = {
        x = love.graphics.getWidth()/2 - 222,
        y = love.graphics.getHeight() - 95/1.25 + 31,
        width = 20,
        height = 10,
    }
    bUpButton = {
        x = love.graphics.getWidth()/2 - 173,
        y = love.graphics.getHeight() - 95/1.25 + 20,
        width = 20,
        height = 10,
    }
    bDownButton = {
        x = love.graphics.getWidth()/2 - 173,
        y = love.graphics.getHeight() - 95/1.25 + 31,
        width = 20,
        height = 10,
    }
    saveButton = {
        x = love.graphics.getWidth() - 170,
        y = love.graphics.getHeight() - 22,
        width = 150,
        height = 22,
    }
end

function ui.menuBar()
    love.graphics.setCanvas()
    love.graphics.setColor(color.uiBorder)
    love.graphics.rectangle('line', 0, love.graphics.getHeight() - 22, love.graphics.getWidth(), 22)
    ui.colorButton()
    ui.saveButton()
    love.graphics.setCanvas(screen.canvas)
end

function ui.buttonDetection(x, y, k)
	if k == 1 then
        -- Opens color GUI
		if x >= colorButton.x and y >= colorButton.y and x < colorButton.x+colorButton.width and y < colorButton.y+colorButton.height then -- Checks if the mouse is on the colorButton
			ui.colorButtonAction()
		end
        -- Red
        if x >= rUpButton.x and y >= rUpButton.y and x < rUpButton.x+rUpButton.width and y < rUpButton.y+rUpButton.height then
			if rVal < 10 then
                rVal = rVal + 1
                color.paintRGBA.r = rVal/10
            end
		end
        if x >= rDownButton.x and y >= rDownButton.y and x < rDownButton.x+rDownButton.width and y < rDownButton.y+rDownButton.height then
			if rVal > 0 then
                rVal = rVal - 1
                color.paintRGBA.r = rVal/10
            end
		end
        -- Green
        if x >= gUpButton.x and y >= gUpButton.y and x < gUpButton.x+gUpButton.width and y < gUpButton.y+gUpButton.height then
			if gVal < 10 then
                gVal = gVal + 1
                color.paintRGBA.g = gVal/10
            end
		end
        if x >= gDownButton.x and y >= gDownButton.y and x < gDownButton.x+gDownButton.width and y < gDownButton.y+gDownButton.height then
			if gVal > 0 then
                gVal = gVal - 1
                color.paintRGBA.g = gVal/10
            end
		end
        -- Blue
        if x >= bUpButton.x and y >= bUpButton.y and x < bUpButton.x+bUpButton.width and y < bUpButton.y+bUpButton.height then
			if bVal < 10 then
                bVal = bVal + 1
                color.paintRGBA.b = bVal/10
            end
		end
        if x >= bDownButton.x and y >= bDownButton.y and x < bDownButton.x+bDownButton.width and y < bDownButton.y+bDownButton.height then
			if bVal > 0 then
                bVal = bVal - 1
                color.paintRGBA.b = bVal/10
            end
		end
        if x >= saveButton.x and y >= saveButton.y and x < saveButton.x+saveButton.width and y < saveButton.y+saveButton.height then
			screen.saveImage()
		end
	end
end

function ui.saveButton()
    love.graphics.setColor(color.backgroundColor)
    love.graphics.rectangle('fill', saveButton.x, saveButton.y, saveButton.width, saveButton.height)
    love.graphics.setColor(color.uiBorder)
    love.graphics.rectangle('line', saveButton.x, saveButton.y, saveButton.width, saveButton.height)
    love.graphics.draw(love.graphics.newText(love.graphics.getFont(), "Save Image" ), saveButton.x + 40, saveButton.y + 2, 0, 1, 1)
end

function ui.colorButton()
    love.graphics.setColor(colorButton.c)
    love.graphics.rectangle('fill', colorButton.x, colorButton.y, colorButton.width, colorButton.height)
    love.graphics.setColor(color.uiBorder)
    love.graphics.rectangle('line', 0, love.graphics.getHeight() - 22, 150, 22)
    love.graphics.draw(love.graphics.newText(love.graphics.getFont(), "Change Color" ), 35, love.graphics.getHeight() - 20, 0, 1, 1)
end

function ui.colorButtonAction()
    if colorButton.pressed then
        colorButton.c = color.clear
        colorButton.pressed = false
    else
        colorButton.c = color.pressed
        colorButton.pressed = true
    end
end

function ui.colorModule()
    love.graphics.setCanvas()
    if colorButton.pressed == true then
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle('fill', 1, love.graphics.getHeight() - 99, love.graphics.getWidth() - 2, 76)
        love.graphics.setColor(color.paintColor)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 34, love.graphics.getHeight() - 95, 68, 68)
        love.graphics.setColor(color.uiBorder)
        love.graphics.rectangle('line', 0, love.graphics.getHeight() - 100, love.graphics.getWidth(), 78)
        love.graphics.setColor(color.uiBorder)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 35, love.graphics.getHeight() - 96, 70, 70)
        love.graphics.setColor(color.paintRGBA.r, 0, 0, 1)
        love.graphics.draw(love.graphics.newText(myFont, '     R'), love.graphics.getWidth()/2 - 300, love.graphics.getHeight() - 95/1.25 - 20, 0, 1.5, 1.5)
        love.graphics.setColor(0, color.paintRGBA.g, 0, 1)
        love.graphics.draw(love.graphics.newText(myFont, '     G'), love.graphics.getWidth()/2 - 250, love.graphics.getHeight() - 95/1.25 - 20, 0, 1.5, 1.5)
        love.graphics.setColor(0, 0, color.paintRGBA.b, 1)
        love.graphics.draw(love.graphics.newText(myFont, '     B'), love.graphics.getWidth()/2 - 200, love.graphics.getHeight() - 95/1.25 - 20, 0, 1.5, 1.5)

        love.graphics.setColor(color.textColor)
        if color.paintRGBA.r ~= 1 and color.paintRGBA.r ~= 0 then
            love.graphics.draw(love.graphics.newText(myFont, '       '..color.paintRGBA.r), love.graphics.getWidth()/2 - 300, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.g ~= 1 and color.paintRGBA.g ~= 0 then
            love.graphics.draw(love.graphics.newText(myFont, '       '..color.paintRGBA.g), love.graphics.getWidth()/2 - 250, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.b ~= 1 and color.paintRGBA.b ~= 0 then
            love.graphics.draw(love.graphics.newText(myFont, '       '..color.paintRGBA.b), love.graphics.getWidth()/2 - 200, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.r == 0 then
            love.graphics.draw(love.graphics.newText(myFont, '        '..color.paintRGBA.r), love.graphics.getWidth()/2 - 300, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.g == 0 then
            love.graphics.draw(love.graphics.newText(myFont, '        '..color.paintRGBA.g), love.graphics.getWidth()/2 - 250, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.b == 0 then
            love.graphics.draw(love.graphics.newText(myFont, '        '..color.paintRGBA.b), love.graphics.getWidth()/2 - 200, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.r == 1 then
            love.graphics.draw(love.graphics.newText(myFont, '        '..color.paintRGBA.r), love.graphics.getWidth()/2 - 298, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.g == 1 then
            love.graphics.draw(love.graphics.newText(myFont, '        '..color.paintRGBA.g), love.graphics.getWidth()/2 - 248, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end
        if color.paintRGBA.b == 1 then
            love.graphics.draw(love.graphics.newText(myFont, '        '..color.paintRGBA.b), love.graphics.getWidth()/2 - 198, love.graphics.getHeight() - 95/1.25 + 5, 0, 1, 1)
        end

        -- Red
        love.graphics.setColor(color.backgroundColor)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 273, love.graphics.getHeight() - 95/1.25 + 20, 20, 10)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 273, love.graphics.getHeight() - 95/1.25 + 31, 20, 10)
        love.graphics.setColor(color.uiBorder)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 273, love.graphics.getHeight() - 95/1.25 + 20, 20, 10)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 273, love.graphics.getHeight() - 95/1.25 + 31, 20, 10)
        -- Green
        love.graphics.setColor(color.backgroundColor)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 222, love.graphics.getHeight() - 95/1.25 + 20, 20, 10)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 222, love.graphics.getHeight() - 95/1.25 + 31, 20, 10)
        love.graphics.setColor(color.uiBorder)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 222, love.graphics.getHeight() - 95/1.25 + 20, 20, 10)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 222, love.graphics.getHeight() - 95/1.25 + 31, 20, 10)
        -- Blue
        love.graphics.setColor(color.backgroundColor)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 173, love.graphics.getHeight() - 95/1.25 + 20, 20, 10)
        love.graphics.rectangle('fill', love.graphics.getWidth()/2 - 173, love.graphics.getHeight() - 95/1.25 + 31, 20, 10)
        love.graphics.setColor(color.uiBorder)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 173, love.graphics.getHeight() - 95/1.25 + 20, 20, 10)
        love.graphics.rectangle('line', love.graphics.getWidth()/2 - 173, love.graphics.getHeight() - 95/1.25 + 31, 20, 10)
    end
    love.graphics.setColor(color.paintColor)
    love.graphics.rectangle('fill', love.graphics.getWidth() - 20, love.graphics.getHeight() - 21, 20, 20)
    love.graphics.setColor(color.uiBorder)
    love.graphics.rectangle('line', love.graphics.getWidth() - 20, love.graphics.getHeight() - 21, 20, 20)
    love.graphics.setCanvas(screen.canvas)
end