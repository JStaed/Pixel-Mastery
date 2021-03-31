paint = {}

require('color')
require('cursor')

--Sets up canvas

function paint.load()
    paint.canPaint = false
    paint.tile = {}
    paint.selectedTile = 1
    for i=1, 256 do
        tx = i - math.floor(i/16) * 16
        ty = math.floor(i/16)

        paint.tile[i] = {
        {
        active = false,
        },
        {
        color = {color.backgroundColor},
        },
        {
        x = tx,
        },
        {
        y = ty,
        },
        }
    end
end

function paint.brush(mb)
    if love.mouse.isDown(1) and paint.canPaint then
        paint.tile[paint.selectedTile].active = true
        paint.tile[paint.selectedTile].color = color.paintColor
        paint.tile[paint.selectedTile].x = cursorPos.x
        paint.tile[paint.selectedTile].y = cursorPos.y
    elseif love.mouse.isDown(2) and paint.canPaint then
        paint.tile[paint.selectedTile].active = false
        paint.tile[paint.selectedTile].color = color.backgroundColor
        paint.tile[paint.selectedTile].x = cursorPos.x
        paint.tile[paint.selectedTile].y = cursorPos.y
    end
end

function paint.draw()
    for i=1, 256 do
        local tile = paint.tile[i]
        if tile.active then
            love.graphics.setColor(tile.color)
            love.graphics.rectangle('fill', tile.x, tile.y, 1, 1)
        end
        if tile.erased == true then
            love.graphics.setColor(color.backgroundColor)
            paint.tile[paint.selectedTile].erased = false
            paint.tile[paint.selectedTile].color = tile.color
            love.graphics.rectangle('fill', tile.x, tile.y, 1, 1)
        end
    end
end