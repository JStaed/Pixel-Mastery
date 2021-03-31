color = {}

function color.load()
    color.paintRGBA = {
    r = 0,
    g = 0,
    b = 0,
    a = 1,
    }
    color.cursorColor = {0, 0.6, 0.3, 0.4}
    color.backgroundColor = {1, 1, 1, 1}
    color.paintColor = {color.paintRGBA.r, color.paintRGBA.g, color.paintRGBA.b, color.paintRGBA.a}
    color.uiBorder = {0, 0.2, 0.3, 1}
    color.clear = {0, 0, 0, 0}
    color.pressed = {0.1, 0.1, 0.1, 0.1}
    color.textColor = {0.05, 0.05, 0.05, 1}
end

function color.update()
    color.paintColor = {color.paintRGBA.r, color.paintRGBA.g, color.paintRGBA.b, color.paintRGBA.a}
end
