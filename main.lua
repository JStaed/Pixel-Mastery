main = {}
--imports
    require('cursor')
    require('screen')
    require('color')
    require('paint')
    require('ui')
--^

function love.load()
    screen.load()
    color.load()
    paint.load()
    cursor.load()
    ui.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
end

function love.update(dt)
    color.update()
    cursor.mouseMove()
    paint.brush()
end

function love.keypressed(key)
    if key == 'p' then
        screen.saveImage()
    end
end

function love.mousepressed(x, y, button)
    ui.buttonDetection(x, y, button)
end

function love.draw()
    love.graphics.draw(screen.canvas)
    love.graphics.draw(screen.cursorCanvas)
    love.graphics.setCanvas(screen.cursorCanvas)
    love.graphics.origin()
    love.graphics.scale(love.graphics.getWidth()/16, (love.graphics.getHeight() - 25)/16)
    love.graphics.clear()
    cursor.draw()
    love.graphics.setCanvas(screen.canvas)
    love.graphics.clear()
    love.graphics.origin()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(love.graphics.newImage('transparent.png'), 0, 0, 0, 720/32, 720/32)
    main.canvas()
    main.ui()
    love.graphics.setCanvas()
    love.graphics.setColor(1,1,1,1)
    love.graphics.print(tostring(paint.selectedTile), 0, 0)
    love.graphics.setColor(color.backgroundColor)
end

function main.ui()
    love.graphics.push()
    love.graphics.origin()
    ui.menuBar()
    ui.colorModule()
    love.graphics.pop()
end

function main.canvas()
    love.graphics.push()
    love.graphics.origin()
    love.graphics.scale(love.graphics.getWidth()/16, (love.graphics.getHeight() - 25)/16)
    paint.draw()
    love.graphics.pop()
end