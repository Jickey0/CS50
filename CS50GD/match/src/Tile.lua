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

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    if math.random(10) == 10 then
        self.shiny = true
    else
        self.shiny = false
    end
end

function Tile:render(x, y)
    
    -- draw shadow
    if self.shiny == false then
        love.graphics.setColor(34, 32, 52, 255)
        love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
            self.x + x + 2, self.y + y + 2)
    else
        love.graphics.setColor(255, 255, 255, 100)
        love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
            self.x + x + 2, self.y + y + 2)
    end

    -- draw tile itself
    if self.shiny == false then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
            self.x + x, self.y + y)
    else
        love.graphics.setColor(255, 255, 255, 100)
        love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
            self.x + x, self.y + y)
        love.graphics.rectangle("fill", self.x + x + 5, self.y + y + 7, 5, 5, 2)
        love.graphics.rectangle("fill", self.x + x + 12, self.y + y + 4, 4, 4, 2)
        love.graphics.rectangle("fill", self.x + x + 20, self.y + y + 20, 4, 4, 2)
    end
end