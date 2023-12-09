-- added new pole class

Pole = Class{__includes = GameObject}

function Pole:init(def)
    Entity.init(self, def)
end

function Pole:render()
    love.graphics.draw(gTextures['flag-pole'], gFrames['flag-pole'][1],
        math.floor(self.x), math.floor(self.y))
    --love.graphics.draw(gTextures['flag-pole'], gFrames['flag-pole'][],
        --math.floor(self.x), math.floor(self.y))
end