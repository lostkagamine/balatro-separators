require'switches'
function love.conf(f)
    f.window.width = (138*SCALE)+(PRINT_BLEED_VALUE_HOR*2)
    f.window.height = (186*SCALE)+(PRINT_BLEED_VALUE_VER*2)
    f.window.title = "Balatro spritesheet separator"
end