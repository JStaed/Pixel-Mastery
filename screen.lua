screen = {}

require('color')

function screen.load()
    love.window.setMode(720, 745)
    love.graphics.setBackgroundColor(1, 1, 1)
    screen.canvas = love.graphics.newCanvas(720, 745)
    screen.cursorCanvas = love.graphics.newCanvas(720, 745)
    screen.scale, screen.dimX, screen.dimY = 1, 16, 16
end

function screen.saveImage()
    local c = love.graphics.newCanvas(720, 720)
    love.graphics.origin()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setCanvas(c)
    love.graphics.draw(screen.canvas, 0, 0, 0, 1/45, 1/45)
    love.graphics.setCanvas()
    local imageData = c:newImageData(0, 1, 0, 0, 16, 16)
    imageData:encode('png', os.time()..'.png')
    love.window.setMode(love.window.getMode())
end