cursor = {}

require('color')
require('screen')
require('try-catch')

function cursor.load()
    cursorPos = {
    x = 0,
    y = 0,
    }
    cursorPos.x = 0
    cursorPos.y = 0
end

function cursor.move(key)
    --horizontal movement
    --if key == 'd' or key == 'right' then
    --    if cursorPos.x ~= 15 then
    --        cursorPos.x = cursorPos.x + 1
    --        paint.selectedTile = paint.selectedTile + 1
    --    end
    --elseif key == 'a' or key == 'left' then
    --    if cursorPos.x ~= 0 then
    --        cursorPos.x = cursorPos.x - 1
    --        paint.selectedTile = paint.selectedTile - 1
    --    end
    --elseif key == 's' or key == 'down' then
    --    if cursorPos.y ~= 15 then
    --        cursorPos.y = cursorPos.y + 1
    --        paint.selectedTile = paint.selectedTile + 16
    --    end
    --elseif key == 'w' or 'up' then
    --    if cursorPos.y ~= 0 then
    --        cursorPos.y = cursorPos.y - 1
    --        paint.selectedTile = paint.selectedTile - 16
    --    end
    --end
end

function cursor.mouseMove()
    cursorPos.x, cursorPos.y = math.floor(love.mouse.getX()/(love.graphics.getWidth()/16)), math.floor(love.mouse.getY()/((love.graphics.getHeight() - 25 )/16))
    paint.selectedTile = (cursorPos.y * 16) + cursorPos.x + 1
    if paint.selectedTile > 256 then
        paint.canPaint = false
        color.cursorColor = {0, 0, 0, 0}
    elseif colorButton.pressed then
        paint.canPaint = false
    else
        paint.canPaint = true
        color.cursorColor = {0, 0.6, 0.3, 0.4}
    end
end

function cursor.draw()
    love.graphics.setColor(color.cursorColor)
    love.graphics.rectangle('fill', cursorPos.x, cursorPos.y, 1, 1)
end