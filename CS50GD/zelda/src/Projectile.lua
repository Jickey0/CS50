--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(playerX, playerY)
    self.type = 'projectile'

    self.texture = 'tiles'
    self.frame = 34

    -- whether it acts as an obstacle or not
    self.solid = false

    self.defaultState = 'holding'
    self.state = self.defaultState
    self.states = {'holding', 'thrown'}

    self.width = 16
    self.height = 16
    
    self.x = playerX
    self.y = playerY

    self.onCollide = function() end

    self.adjacentOffsetX = 0
    self.adjacentOffsetY = -10
end

function Projectile:update(dt, playerX, playerY, changeX, changeY)
    self.x = playerX
    self.y = playerY
end

function Projectile:throw(changeX, changeY)
    self.state = 'thrown'
    self.changeX = changeX
    self.changeY = changeY
end

function Projectile:render()
    --if self.state == 'holding' then
        love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame],
        self.x + self.adjacentOffsetX, self.y + self.adjacentOffsetY)
    --end
end