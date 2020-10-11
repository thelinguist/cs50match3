--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety, isMega)
    -- board positions
    self.gridX = x
    self.gridY = y
    self.isMega = isMega

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.megaHighlight = 0
    Timer.every(5, function()
        Timer.tween(2.5, {
            [self] = {megaHighlight = 0.6}
        }):finish(function()
            Timer.tween(2.5, {
                [self] = {megaHighlight = 0}
            })
        end)
    end)
end

function Tile:update(dt)

end

--[[
    Function to swap this tile with another tile, tweening the two's positions.
]]
function Tile:swap(tile)

end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(.133, .125, .204, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

    if self.isMega then
        -- draw highlight
        love.graphics.setColor(1,1,1, self.megaHighlight)
        love.graphics.setLineWidth(4)
        love.graphics.rectangle('fill', self.x + x, self.y + y, 32, 32, 4)
    end
end
