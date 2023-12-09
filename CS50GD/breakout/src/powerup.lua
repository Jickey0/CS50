Powerup = Class{}

--[[
    Our powerup will initialize at a random spot every time
]]
function Powerup:init()
    -- x is placed somewhere on any side 32 pixels away from the walls
    self.x = math.random(32, VIRTUAL_WIDTH - 32)

    -- y is between the first and second thirds of the screen
    self.y = math.random(VIRTUAL_HEIGHT / 3, VIRTUAL_HEIGHT * 2 / 3)

    -- start us off with a slow velocity
    self.dy = 15

    -- starting dimensions
    self.width = 16
    self.height = 16

    -- start without the powerup
    self.inPlay = false

    -- set the time for when you powerup will appear
    self.spawnTime = math.random(1, 25)
    self.timepassed = 0
end


function Powerup:appear(dt, sp, tp)
    self.timepassed = self.timepassed + dt
    if self.spawnTime < self.timepassed then 
        return true
    end
    return false
end


function Powerup:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function Powerup:update(dt)
    self.y = self.y + self.dy * dt
end

--[[
    renders powerup!
]]
function Powerup:render()
    if self.inPlay then
        if self.multi == true then
            love.graphics.draw(gTextures['main'], gFrames['powerup'], self.x, self.y)
        else
            love.graphics.draw(gTextures['main'], gFrames['key'], self.x, self.y)
        end
    end
end